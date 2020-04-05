{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2010-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Macapi.Mach;

{
 This unit represents a set of Mach specific APIs that are brought into scope when
 employing mach.h under OS X.
}

{$WEAKPACKAGEUNIT}

interface

uses Posix.Base;

type
   clock_res_t = Integer;
   {$EXTERNALSYM clock_res_t}
   natural_t = UInt32;
   {$EXTERNALSYM natural_t}
   uint16_t = UInt16;
   {$EXTERNALSYM uint16_t}
   uint32_t = UInt32;
   {$EXTERNALSYM uint32_t}
   uint64_t = UInt64;
   {$EXTERNALSYM uint64_t}
   mach_port_name_t = natural_t;
   {$EXTERNALSYM mach_port_name_t}
   mach_port_t = mach_port_name_t;
   {$EXTERNALSYM mach_port_t}
   ipc_space_t = mach_port_t;
   {$EXTERNALSYM ipc_space_t}
   mach_port_right_t = natural_t;
   {$EXTERNALSYM mach_port_right_t}
   mach_msg_timeout_t = natural_t;
   {$EXTERNALSYM mach_msg_timeout_t}
   mach_msg_type_number_t = natural_t;
   {$EXTERNALSYM mach_msg_type_number_t}
   exception_type_t = Integer;
   {$EXTERNALSYM exception_type_t}
   exception_mask_t = UInt32;
   {$EXTERNALSYM exception_mask_t}
   exception_handler_t = mach_port_t;
   {$EXTERNALSYM exception_handler_t}
   exception_behavior_t = Integer;
   {$EXTERNALSYM exception_behavior_t}
   exception_mask_array_t = ^exception_mask_t;
   {$EXTERNALSYM exception_mask_array_t}
   exception_handler_array_t = ^exception_handler_t;
   {$EXTERNALSYM exception_handler_array_t}
   exception_behavior_array_t = ^exception_behavior_t;
   {$EXTERNALSYM exception_behavior_array_t}
   exception_flavor_array_t = ^thread_state_flavor_t;
   {$EXTERNALSYM exception_flavor_array_t}
   task_t = mach_port_t;
   {$EXTERNALSYM task_t}
   semaphore_t = mach_port_t;
   {$EXTERNALSYM semaphore_t}

   thread_t = mach_port_t;
   {$EXTERNALSYM thread_t}
   thread_state_flavor_t = Integer;
   {$EXTERNALSYM thread_state_flavor_t}
   thread_act_t = mach_port_t;
   {$EXTERNALSYM thread_act_t}
   thread_state_t = ^natural_t;
   {$EXTERNALSYM thread_state_t}
   kern_return_t = Integer;
   {$EXTERNALSYM kern_return_t}
   mach_msg_return_t = kern_return_t;
   {$EXTERNALSYM mach_msg_return_t}
   mach_msg_option_t = Integer;
   {$EXTERNALSYM mach_msg_option_t}
   mach_msg_bits_t = UInt32;
   {$EXTERNALSYM mach_msg_bits_t}
   mach_msg_size_t = natural_t;
   {$EXTERNALSYM mach_msg_size_t}
   mach_msg_id_t = Integer;
   {$EXTERNALSYM mach_msg_id_t}
   mach_msg_type_name_t = Integer;
   {$EXTERNALSYM mach_msg_type_name_t}
   mach_msg_body_t = record
      msgh_descriptor_count: mach_msg_size_t;
   end;
   {$EXTERNALSYM mach_msg_body_t}
   mach_msg_header_t = record
      msgh_bits: mach_msg_bits_t;
      msgh_size: mach_msg_bits_t;
      msgh_remote_port: mach_port_t;
      msgh_local_port: mach_port_t;
      msgh_reserved: mach_msg_size_t;
      msgh_id: mach_msg_id_t
   end;
   {$EXTERNALSYM mach_msg_header_t}
   exception_data_type_t = Integer;
   {$EXTERNALSYM exception_data_type_t}
   exception_data_t = ^exception_data_type_t;
   {$EXTERNALSYM exception_data_t}
   
const
   MACH_PORT_RIGHT_RECEIVE : mach_port_right_t = 1;
   {$EXTERNALSYM MACH_PORT_RIGHT_RECEIVE}
   MACH_RCV_MSG = $00000002;
   {$EXTERNALSYM MACH_RCV_MSG}
   MACH_SEND_MSG = $00000001;
   {$EXTERNALSYM MACH_SEND_MSG}
   MACH_RCV_LARGE = $00000004;
   {$EXTERNALSYM MACH_RCV_LARGE}
   MACH_MSG_TIMEOUT_NONE : mach_msg_timeout_t = 0;
   {$EXTERNALSYM MACH_MSG_TIMEOUT_NONE}
   MACH_MSG_SUCCESS = 0;
   {$EXTERNALSYM MACH_MSG_SUCCESS}
   MACH_PORT_NULL = 0; // typing?
   {$EXTERNALSYM MACH_PORT_NULL}
   MACH_MSG_TYPE_MAKE_SEND: mach_msg_type_name_t = 20;
   {$EXTERNALSYM MACH_MSG_TYPE_MAKE_SEND}
  
   KERN_SUCCESS = 0;
   {$EXTERNALSYM KERN_SUCCESS}
   KERN_INVALID_ARGUMENT = 4;
   {$EXTERNALSYM KERN_INVALID_ARGUMENT}
   KERN_FAILURE = 5;
   {$EXTERNALSYM KERN_FAILURE}
   
   EXC_BAD_ACCESS = 1;
   {$EXTERNALSYM EXC_BAD_ACCESS}
   EXC_BAD_INSTRUCTION = 2;
   {$EXTERNALSYM EXC_BAD_INSTRUCTION}
   EXC_ARITHMETIC = 3;
   {$EXTERNALSYM EXC_ARITHMETIC}
   EXC_MASK_BAD_ACCESS = 1 shl EXC_BAD_ACCESS;
   {$EXTERNALSYM EXC_MASK_BAD_ACCESS}
   EXC_MASK_BAD_INSTRUCTION = 1 shl EXC_BAD_INSTRUCTION;
   {$EXTERNALSYM EXC_MASK_BAD_INSTRUCTION}
   EXC_MASK_ARITHMETIC = 1 shl EXC_ARITHMETIC;
   {$EXTERNALSYM EXC_MASK_ARITHMETIC}
      
   EXCEPTION_STATE_IDENTITY = 3; 
   {$EXTERNALSYM EXCEPTION_STATE_IDENTITY}
   EXCEPTION_DEFAULT = 1;
   {$EXTERNALSYM EXCEPTION_DEFAULT}
  
   x86_EXCEPTION_STATE32 = 3;
   {$EXTERNALSYM x86_EXCEPTION_STATE32}
   x86_EXCEPTION_STATE = 9;
   {$EXTERNALSYM x86_EXCEPTION_STATE}
   x86_FLOAT_STATE32 = 2;
   {$EXTERNALSYM x86_FLOAT_STATE32}
   x86_FLOAT_STATE = 8;
   {$EXTERNALSYM x86_FLOAT_STATE}
   x86_THREAD_STATE32 = 1;
   {$EXTERNALSYM x86_THREAD_STATE32}
   x86_THREAD_STATE = 7;
   {$EXTERNALSYM x86_THREAD_STATE}
   MACHINE_THREAD_STATE = x86_THREAD_STATE;
   {$EXTERNALSYM MACHINE_THREAD_STATE}

   KERN_INVALID_ADDRESS = 1;
   {$EXTERNALSYM KERN_INVALID_ADDRESS}

   THREAD_STATE_MAX = 144;
   {$EXTERNALSYM THREAD_STATE_MAX}

type
   thread_state_data_t = array [0..THREAD_STATE_MAX - 1] of natural_t;
   {$EXTERNALSYM thread_state_data_t}
   x86_state_hdr_t = record
      flavor: Integer;
      count: Integer;
   end;
   {$EXTERNALSYM x86_state_hdr_t}
   x86_exception_state32_t = record
      __trapno: UInt32;
      __err: UInt32;
      __faultvaddr: UInt32;
      __dummy: UInt32;
   end;
   {$EXTERNALSYM x86_exception_state32_t}
   x86_exception_state_t = record
      esh: x86_state_hdr_t;
      es32: x86_exception_state32_t;
   end;
   {$EXTERNALSYM x86_exception_state_t}
   xmm_reg = record
      xmm_reg: array[0..15] of Byte;
   end;
   {$EXTERNALSYM xmm_reg}
   mmst_reg = record
      mmst_reg: array[0..9] of Byte;
      mmst_rsrv: array[0..5] of Byte;
   end;
   {$EXTERNALSYM mmst_reg}
   x86_float_state32_t = record
      fpu_reserved: array [0..1] of Integer;
      fpu_fcw: UInt16;
      fpu_fsw: UInt16;
      fpu_ftw: UInt8;
      fpu_rsrv1: UInt8;
      fpu_fop: UInt16;
      fpu_ip: UInt32;
      fpu_cs: UInt16;
      fpu_rsrv2: UInt16;
      fpu_dp: UInt32;
      fpu_ds: UInt16;
      fpu_rsrv3: UInt16;
      fpu_mxcsr: UInt32;
      fpu_mxmask: UInt32;
      fpu_stmm0: mmst_reg;
      fpu_stmm1: mmst_reg;
      fpu_stmm2: mmst_reg;
      fpu_stmm3: mmst_reg;
      fpu_stmm4: mmst_reg;
      fpu_stmm5: mmst_reg;
      fpu_stmm6: mmst_reg;
      fpu_stmm7: mmst_reg;
      fpu_xmm0: xmm_reg;
      fpu_xmm1: xmm_reg;
      fpu_xmm2: xmm_reg;
      fpu_xmm3: xmm_reg;
      fpu_xmm4: xmm_reg;
      fpu_xmm5: xmm_reg;
      fpu_xmm6: xmm_reg;
      fpu_xmm7: xmm_reg;
      fpu_rsrv4: array [0..14*16 - 1] of Byte;
      fpu_reserved1: Integer;
   end;
   {$EXTERNALSYM x86_float_state32_t}
   x86_float_state_t = record
      fsh: x86_state_hdr_t;
      fs32: x86_float_state32_t;
   end;
   {$EXTERNALSYM x86_float_state_t}
   x86_thread_state32_t = record
      eax: UInt32;
      ebx: UInt32;
      ecx: UInt32;
      edx: UInt32;
      edi: UInt32;
      esi: UInt32;
      ebp: UInt32;
      esp: UInt32;
      ss: UInt32;
      eflags: UInt32;
      eip: UInt32;
      cs: UInt32;
      ds: UInt32;
      es: UInt32;
      fs: UInt32;
      gs: UInt32;
   end;
   {$EXTERNALSYM x86_thread_state32_t}
   x86_thread_state_t = record
      tsh: x86_state_hdr_t;
      ts32: x86_thread_state32_t;
   end;
   {$EXTERNALSYM x86_thread_state_t}
   Px86_thread_state_t = ^x86_thread_state_t;

   mach_timespec_t = UInt64;
   {$EXTERNALSYM mach_timespec_t}

   mach_timespec_rec_t = record
     tv_sec: Cardinal;
     tv_nsec: clock_res_t;
   end;
   {$EXTERNALSYM mach_timespec_rec_t}

function mach_task_self: mach_port_t; cdecl
  external libc name _PU + 'mach_task_self';
{$EXTERNALSYM mach_task_self}

function mach_port_allocate(task: ipc_space_t; right: mach_port_right_t;
                            var name: mach_port_t): mach_port_t; cdecl
  external libc name _PU + 'mach_port_allocate';
{$EXTERNALSYM mach_port_allocate}

function mach_msg(var msg: mach_msg_header_t;
                  option: mach_msg_option_t;
                  SendSize: mach_msg_size_t;
                  RecvSize: mach_msg_size_t;
                  rcv_name: mach_port_name_t;
                  timeout: mach_msg_timeout_t;
                  notify: mach_port_name_t): mach_msg_return_t; cdecl
  external libc name _PU + 'mach_msg';

function mach_port_insert_right(task: ipc_space_t;
                                name: mach_port_name_t;
                                right: mach_port_t;
                                right_type: mach_msg_type_name_t): kern_return_t; cdecl
  external libc name _PU + 'mach_port_insert_right';
{$EXTERNALSYM mach_msg}

function thread_get_state(target_act: thread_act_t;
                          flavor: thread_state_flavor_t;
                          old_state: thread_state_t;
                          var old_stateCnt: mach_msg_type_number_t): kern_return_t; cdecl
  external libc name _PU + 'thread_get_state';
{$EXTERNALSYM thread_get_state}

function thread_set_state(target_act: thread_act_t;
                          flavor: thread_state_flavor_t;
                          new_state: thread_state_t;
                          new_stateCnt: mach_msg_type_number_t): kern_return_t; cdecl
  external libc name _PU + 'thread_set_state';
{$EXTERNALSYM thread_set_state}

function thread_suspend(target_act: thread_act_t): kern_return_t; cdecl
  external libc name _PU + 'thread_suspend';
{$EXTERNALSYM thread_suspend}

function thread_resume(target_act: thread_act_t): kern_return_t; cdecl
  external libc name _PU + 'thread_resume';
{$EXTERNALSYM thread_resume}

function exc_server(var request_msg: mach_msg_header_t;
                    var reply_msg: mach_msg_header_t): Boolean; cdecl
  external libc name _PU + 'exc_server';
{$EXTERNALSYM exc_server}


function task_get_exception_ports(task: task_t;
                                  exception_types: exception_mask_t;
                                  masks: exception_mask_array_t;
                                  var masksCnt: mach_msg_type_number_t;
                                  old_handlers: exception_handler_array_t;
                                  old_behaviors: exception_behavior_array_t;
                                  old_flavors: exception_flavor_array_t
                                 ): kern_return_t; cdecl
  external libc name _PU + 'task_get_exception_ports';
{$EXTERNALSYM task_get_exception_ports}

function task_set_exception_ports(task: task_t;
                                  exception_types: exception_mask_t;
                                  new_port: mach_port_t;
                                  behavior: exception_behavior_t;
                                  new_flavor: thread_state_flavor_t
                                 ): kern_return_t; cdecl
  external libc name _PU + 'task_set_exception_ports';
{$EXTERNALSYM task_set_exception_ports}


{
   exception_raise()
   exception_raise_state()
   exception_raise_state_identity()
   
 _mm_setcsr _MM_MASK_MASK _MM_MASK_OVERFLOW _MM_MASK_INVALID _MM_MASK_DIV_ZERO
}

function semaphore_create(task: task_t; out semaphore: semaphore_t; policy: Integer; value: Integer): kern_return_t; cdecl
  external libc name _PU + 'semaphore_create';
{$EXTERNALSYM semaphore_create}

function semaphore_destroy(task: task_t; semaphore: semaphore_t): kern_return_t; cdecl
  external libc name _PU + 'semaphore_destroy';
{$EXTERNALSYM semaphore_destroy}

function semaphore_signal(semaphore: semaphore_t): kern_return_t; cdecl
  external libc name _PU + 'semaphore_signal';
{$EXTERNALSYM semaphore_signal}

function semaphore_signal_all(semaphore: semaphore_t): kern_return_t; cdecl
  external libc name _PU + 'semaphore_signal_all';
{$EXTERNALSYM semaphore_signal_all}

function semaphore_wait(semaphore: semaphore_t): kern_return_t; cdecl
  external libc name _PU + 'semaphore_wait';
{$EXTERNALSYM semaphore_wait}

function semaphore_timedwait(semaphore: semaphore_t; wait_time: mach_timespec_t): kern_return_t; cdecl
  external libc name _PU + 'semaphore_timedwait';
{$EXTERNALSYM semaphore_timedwait}

function semaphore_timedwait_signal(wait_semaphore, signal_semaphore: semaphore_t; wait_time: mach_timespec_t): kern_return_t; cdecl
  external libc name _PU + 'semaphore_timedwait_signal';
{$EXTERNALSYM semaphore_timedwait_signal}

function semaphore_wait_signal(wait_semaphore, signal_semaphore: semaphore_t): kern_return_t; cdecl
  external libc name _PU + 'semaphore_wait_signal';
{$EXTERNALSYM semaphore_wait_signal}

function semaphore_signal_thread(semaphore: semaphore_t; thread: thread_t): kern_return_t; cdecl
  external libc name _PU + 'semaphore_signal_thread';
{$EXTERNALSYM semaphore_signal_thread}

implementation

end.
