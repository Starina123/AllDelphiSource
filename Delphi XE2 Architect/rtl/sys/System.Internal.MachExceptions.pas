{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit System.Internal.MachExceptions;

{
 <code>MachExceptions</code> contains the OS specific code for setting up Mach
 exception handlers.  These handlers catch hardware exceptions, such as
 floating point errors, memory access violations, and illegal instructions.<p>
 
 The Mach exception API is used for these exceptions instead of sigaction and
 friends because of GDB issues.  There is a long standing bug with GDB that
 prevents signal handlers for the above exceptions from being invoked when
 the child process is run under GDB.<p>
 
 Note that Ctrl-C handling doesn't come through this layer of support.  The
 Mach exception handling ports never see such user interrupt methods.  Instead
 we use the POSIX signal APIs to deal with those.  GDB is well behaved for those
 signals.<p>

 On initialization, the exception handling code allocates a Mach exception
 handling port, and spins up a pthread to watch that port.  Mach uses a message
 passing model to inform the watcher thread of exceptions on other threads.
 The watcher thread processes the exception, and then modifies the pending
 thread to cause it to transfer control to the RTL, where somewhat more
 platform independent code can take over to raise a standard language
 exception.<p>
}

interface

{
 Initializes the Mach exception handling system.  This will allocate a
 Mach exception port, and spin up a POSIX thread.  This API should only
 be called once per process.
}
procedure MachExceptionsInit;

{
 Shuts down the Mach exception handling system for the task.  This API
 should only be called once per process.
}
procedure MachExceptionsShutdown;

implementation

uses Macapi.Mach, System.SysUtils, Posix.SysTypes, Posix.Pthread, System.Internal.ExcUtils, System.SysConst;

const
  {
   We save off the old exception ports for the task.  We expect a maximum
   of 16 of these for any task.
  }
  MAX_EXCEPTION_PORTS = 16;

var
  { This is the Mach exception port that our POSIX thread will be watching. }
  ExceptionPort: mach_port_t;
  { The following hold the old port information when we install our exception
    port. }
  OldPortMasks: array [0..MAX_EXCEPTION_PORTS-1] of exception_mask_t;
  OldPorts: array [0..MAX_EXCEPTION_PORTS-1] of exception_handler_t;
  OldBehaviors: array [0..MAX_EXCEPTION_PORTS-1] of exception_behavior_t;
  OldFlavors: array [0..MAX_EXCEPTION_PORTS-1] of thread_state_flavor_t;
  OldPortCount: mach_msg_type_number_t;
  
type
  {
   The reply message structure for Mach messages.  The actual maximum
   payload size for messages is not defined in Mach.  The values below
   are drawn from the source code for Xnu, apparently.  These values
   were obtained from an example found on the web.
  }
  MachMsgReply = record
    header: mach_msg_header_t;
    data: array [0..255] of Byte;
  end;
  {
   The send message structure for Mach messages.  See the comment
   on <code>MachMsgReply</code> for information about the structure size.
  }
  MachMsgSend = record
    header: mach_msg_header_t;
    body: mach_msg_body_t;
    data: array [0..1023] of Byte;
  end;
  
{
 This is our POSIX thread function.  It watches for messages on the exception
 port, and dispatches them as needed.<p>

 Some Mach exception APIs are used here, and these can fail.  If they do, we
 have no really viable options for recovering, and we just abort the task.
 Presumably, the relevant APIs can only fail under some catastrophic
 circumstances, in which case, the definition of 'recovery' would be pretty
 subjective anyway.
}
function ExcThread(Parameter: Pointer): Pointer; cdecl;
var
  R: mach_msg_return_t;
  Reply: MachMsgReply;
  Msg: MachMsgSend;
begin
  while true do
  begin
    R := mach_msg(Msg.header, MACH_RCV_MSG or MACH_RCV_LARGE,
                  0, SizeOf(Msg), ExceptionPort,
                  MACH_MSG_TIMEOUT_NONE, MACH_PORT_NULL);
    if R <> MACH_MSG_SUCCESS then
      abort;
    {
     exc_server is not documented anywhere, really.  It isn't defined
     in any Mach header files.  It handles all the book-keeping on the
     Mach messages to dispatch messages to the appropriate catch_*
     APIs, which the client application may have defined.
    }
    if not exc_server(Msg.header, Reply.header) then
      abort;
    R := mach_msg(Reply.header, MACH_SEND_MSG, Reply.header.msgh_size,
                  0, MACH_PORT_NULL, MACH_MSG_TIMEOUT_NONE, MACH_PORT_NULL);
    if R <> MACH_MSG_SUCCESS then
      abort;
  end;
end;

procedure MachExceptionsInit;
var
  Task: mach_port_t;
  KRes: kern_return_t;
  Mask: exception_mask_t;
  Attr: pthread_attr_t;
  Thread: pthread_t;
begin
  Task := mach_task_self;
  KRes := mach_port_allocate(Task, MACH_PORT_RIGHT_RECEIVE, ExceptionPort);
  if KRes <> MACH_MSG_SUCCESS then
    raise Exception.CreateRes(@SOSExceptionHandlingFailed);
  KRes := mach_port_insert_right(Task, ExceptionPort, ExceptionPort, MACH_MSG_TYPE_MAKE_SEND);
  if KRes <> MACH_MSG_SUCCESS then
    raise Exception.CreateRes(@SOSExceptionHandlingFailed);
  Mask := EXC_MASK_BAD_ACCESS or EXC_MASK_ARITHMETIC or EXC_MASK_BAD_INSTRUCTION;
  KRes := task_get_exception_ports(Task, Mask, @OldPortMasks, OldPortCount, @OldPorts,
                                   @OldBehaviors, @OldFlavors);
  if KRes <> MACH_MSG_SUCCESS then
    raise Exception.CreateRes(@SOSExceptionHandlingFailed);
  KRes := task_set_exception_ports(Task, Mask, ExceptionPort, EXCEPTION_STATE_IDENTITY, MACHINE_THREAD_STATE);
  if KRes <> MACH_MSG_SUCCESS then
    raise Exception.CreateRes(@SOSExceptionHandlingFailed);
  
  if pthread_attr_init(Attr) <> 0 then
    raise Exception.CreateRes(@SOSExceptionHandlingFailed);
  if pthread_attr_setdetachstate(Attr, PTHREAD_CREATE_DETACHED) <> 0 then
    raise Exception.CreateRes(@SOSExceptionHandlingFailed);
  if pthread_create(Thread, Attr, @ExcThread, nil) <> 0 then
    raise Exception.CreateRes(@SOSExceptionHandlingFailed);
  pthread_attr_destroy(Attr);
end;

procedure MachExceptionsShutdown;
begin
  {
   We're keeping this as a placeholder in case we do decide to shut down the
   POSIX thread watching the exception ports, or free up the Mach resources
   for the exception ports.  Currently, we don't see the need for it, so we
   will allow the OS to dispose of those resources when it shuts down the
   task.
  }
end;

{
 Some floating point status word constants.  These same constants
 work for the MXCSR, too.
}
const
  PRECISION_MASK = 1 shl 5;
  UNDERFLOW_MASK = 1 shl 4;
  OVERFLOW_MASK = 1 shl 3;
  ZERODIVIDE_MASK = 1 shl 2;
  DENORMAL_MASK = 1 shl 1;
  INVALIDOP_MASK = 1 shl 0;

{
 Floating point exceptions for both the FPU and SSE are masked and have
 their status represented in the same bit order, but at different bit offsets
 in their respective status and control words.  The FPU has the floating point
 status word, and the floating point control word.  The control word holds the
 exception masks, and the status word holds the signalled exceptions.  In both
 words, the bits of interest are 0-5, which is convenient.

 The SSE unit has just the one control/status word, with mask and status bits
 in different bit positions, but in the same bit order as for the FPU control
 and status words.  So we can use a single function to test for the masking
 state and status state of a given floating point exception by just passing
 shifted bits of the various words to this little support function.

 @param StatusBits - holds the floating point exception status bits.
 These are bits 0-5 of the respective status registers.
 @param Mask - holds bits 0-5 of the floating point mask bits.  If a bit in the
 mask is 1, then it means that exception is masked.
}
function UnmaskedExceptions(StatusBits: UInt16; Mask: UInt16): UInt16;
begin
  Result := StatusBits and (not Mask);
end;

{
 This function will be dispatched to from <code>exc_server</code>.  This is
 where we decode the exception, and set up the dispatch to the RTL on the
 faulting thread.<p>

 We call Mach support methods to inquire into the thread state.  It's extremely
 unlikely that these could ever fail, but if they do, then we have no way to
 recover.  In that event, we return a code which will cause the Mach exception
 server to kill off the task.

 The name of this function, as it is exported is important.  See the comment
 at the export statement at the end of this unit for more detail.
}
function catch_exception_raise_state_identity(
  ExceptionPort: mach_port_name_t;
  Thread: mach_port_t;
  Task: mach_port_t;
  ExceptionType: exception_type_t;
  Code: exception_data_t;
  CodeCount: mach_msg_type_number_t;
  var Flavor: Integer;
  OldState: thread_state_t;
  OldStateCount: Integer;
  NewState: thread_state_t;
  var NewStateCount: Integer): kern_return_t; cdecl;
var
  ExceptionStateCount: mach_msg_type_number_t;
  //ThreadStateCount: mach_msg_type_number_t;
  FloatStateCount: mach_msg_type_number_t;
  ExceptionState: x86_exception_state_t;
  ThreadState: Px86_thread_state_t;
  FloatState: x86_float_state_t;
  KRes: kern_return_t;
  ExcCode: Integer;
  FPExceptions: UInt16;
begin
  KRes := thread_get_state(Thread, x86_EXCEPTION_STATE,
                           thread_state_t(@ExceptionState), ExceptionStateCount);
  if KRes <> KERN_SUCCESS then
  begin
    // Fatal
    Result := KERN_INVALID_ARGUMENT;
    Exit;
  end;
  KRes := thread_get_state(Thread, x86_FLOAT_STATE,
                           thread_state_t(@FloatState), FloatStateCount);
  if KRes <> KERN_SUCCESS then
  begin
    // Fatal
    Result := KERN_INVALID_ARGUMENT;
    Exit;
  end;
  ThreadState := Px86_thread_state_t(OldState);
//  writeln(Format('Exception @%p, trap #%d(0x%x), err = %d(0x%x), esp = %p, fault addr=%p',
//                 [Pointer(ThreadState^.ts32.eip), ExceptionState.es32.__trapno,
//                  ExceptionState.es32.__trapno,
//                  ExceptionState.es32.__err, ExceptionState.es32.__err,
//                  Pointer(ThreadState^.ts32.esp),
//                  Pointer(ExceptionState.es32.__faultvaddr)]));
  
  if (ExceptionState.es32.__trapno = $E) and
       ((ThreadState^.ts32.esp and $FFFFF000) = (ExceptionState.es32.__faultvaddr and $FFFFF000)) then
  begin
//    writeln('stack fault');
     {
      Stack fault.  We can't allow the exception to be propagated back to the faulting thread,
      or we'll loop (forever).  We have to take down the app at this point.
     }
     Result := KERN_FAILURE;
     Exit;
  end;
     
  Result := KERN_SUCCESS;
  if ExceptionType = EXC_BAD_ACCESS then
  begin
    {
     Memory access violation.  E.g. segv.  We don't care, really, what the
     actual fault was - they all get dispatched the same way to the user.
    }
    ExcCode := Integer(System.reAccessViolation);
  end
  else if ExceptionType = EXC_ARITHMETIC then
  begin
//     writeln(format('FSW = %x, MXCSR = %x', [FloatState.fs32.fpu_fsw, FloatState.fs32.fpu_mxcsr]));
    {
     All arithmetic exceptions come here.  This includes all floating point
     violations, and integer violations.  This depends, of course, on the
     settings of the floating point and MX control words.  We'll check to see if there
     are unmasked exceptions flagged in either of them, and report on the first unmasked
     exception we see, if any.
    }
    FPExceptions := UnmaskedExceptions(FloatState.fs32.fpu_fsw, FloatState.fs32.fpu_fcw);
    FPExceptions := FPExceptions or
      UnmaskedExceptions(FloatState.fs32.fpu_mxcsr, FloatState.fs32.fpu_mxcsr shr 7);
    if (FPExceptions and PRECISION_MASK <> 0) then
      ExcCode := Integer(System.reInvalidOp)
    else if (FPExceptions and UNDERFLOW_MASK <> 0) then
      ExcCode := Integer(System.reUnderflow)
    else if (FPExceptions and OVERFLOW_MASK <> 0) then
      ExcCode := Integer(System.reOverflow)
    else if (FPExceptions and ZERODIVIDE_MASK <> 0) then
      ExcCode := Integer(System.reZeroDivide)
    else if (FPExceptions and DENORMAL_MASK <> 0) then
      ExcCode := Integer(System.reInvalidOp)
    else if (FPExceptions and INVALIDOP_MASK <> 0) then
      ExcCode := Integer(System.reInvalidOp)
    {
      On OS X Lion, the OS will sometimes dispatch an integer
      divide by zero here with __trapno set to $10000 instead of
      0.  This happens randomly.  We currently believe this to be a
      bug in the OS, and we guard against it by masking off the high
      bits of the trap number before testing.
    }
    else if (ExceptionState.es32.__trapno and $FFFF) = 0 then
      ExcCode := Integer(System.reDivByZero)
    else
      ExcCode := Integer(System.reInvalidOp); // shouldn't happen
  end
  else if ExceptionType = EXC_BAD_INSTRUCTION then
  begin
    {
     Illegal instruction, or privileged instruction.  We don't discriminate.
    }
    ExcCode := Integer(System.rePrivInstruction);
  end
  else
  begin
    ExcCode := 0;
    { This can't happen. We do the equivalent of asserting here.  If we return
      this value, the kernel will take down the process.
    }
    Result := KERN_INVALID_ARGUMENT;
  end;

  {
   Now we set up the thread state for the faulting thread so that when we
   return, control will be passed to the exception dispatcher on that thread,
   and this POSIX thread will continue watching for Mach exception messages.
   See the documentation at <code>DispatchMachException()</code> for more
   detail on the parameters loaded in EAX, EDX, and ECX.
  }
  ThreadState^.ts32.eax := ThreadState^.ts32.eip;
  ThreadState^.ts32.edx := ExceptionState.es32.__faultvaddr;
  ThreadState^.ts32.ecx := ExcCode;
  ThreadState^.ts32.eip := UIntPtr(@SignalConverter);
  Px86_thread_state_t(NewState)^ := ThreadState^;
  NewStateCount := OldStateCount;
end;

{
 This export is required, as <code>exc_server</code> expects to be able to call
 this function by this particular name.
}
exports
  catch_exception_raise_state_identity name '_catch_exception_raise_state_identity';

end.
