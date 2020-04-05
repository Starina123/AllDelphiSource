{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{ An integral type that can be modified atomically, without the
   possibility of a signal arriving in the middle of the operation.  }
type
  sig_atomic_t = Integer;
  {$EXTERNALSYM sig_atomic_t}
  Psig_atomic_t = ^sig_atomic_t;

const
  _SIGSET_NWORDS  = 1024 div (8 * SizeOf(LongWord)) platform;
  {$EXTERNALSYM _SIGSET_NWORDS}
type
  sigset_t = record
    __val: packed array[0.._SIGSET_NWORDS-1] of LongWord;
  end;
  {$EXTERNALSYM sigset_t}
  Psigset_t = ^sigset_t;

  sigval = record
    case Integer of
      0: (sival_int: Integer);
      1: (sival_ptr: Pointer);
  end;
  {$EXTERNALSYM sigval}
  sigval_t = sigval;
  {$EXTERNALSYM sigval_t}
  Psigval = ^sigval;
const
{ Structure to transport application-defined values with signals.  }
  __SIGEV_MAX_SIZE        = 64;
  {$EXTERNALSYM __SIGEV_MAX_SIZE}
  {$IF defined(CPU64BITS)}
  __SIGEV_PAD_SIZE        = (__SIGEV_MAX_SIZE div SizeOf(Integer)) - 4;
  {$ELSE}
  __SIGEV_PAD_SIZE        = (__SIGEV_MAX_SIZE div SizeOf(Integer)) - 3;
  {$ENDIF}
  {$EXTERNALSYM __SIGEV_PAD_SIZE}
type
  TSignalEventStartProc = procedure(param: sigval_t); cdecl;

  sigevent = record
    sigev_value: sigval_t;
    sigev_signo: Integer;
    sigev_notify: Integer;
    case Integer of
      0: (_pad: array[0..__SIGEV_PAD_SIZE-1] of Integer);
      1: (_tid: pid_t);
      2: (_sigev_thread: record
            _function: TSignalEventStartProc;
            _attribute: Pointer; // Really pthread_attr_t
          end;)
  end;
  {$EXTERNALSYM sigevent}
  Psigevent = ^sigevent;


{ Fake signal functions.  }
const
  SIG_ERR = (-1);             { Error return.  }
  {$EXTERNALSYM SIG_ERR}
  SIG_DFL = (0);              { Default action.  }
  {$EXTERNALSYM SIG_DFL}
  SIG_IGN = (1);              { Ignore signal.  }
  {$EXTERNALSYM SIG_IGN}
  SIG_HOLD = (2);             { Add signal to hold mask.  }
  {$EXTERNALSYM SIG_HOLD}

{ Signals.  }
  SIGHUP          = 1;      { Hangup (POSIX).  }
  {$EXTERNALSYM SIGHUP}
  SIGINT          = 2;      { Interrupt (ANSI).  }
  {$EXTERNALSYM SIGINT}
  SIGQUIT         = 3;      { Quit (POSIX).  }
  {$EXTERNALSYM SIGQUIT}
  SIGILL          = 4;      { Illegal instruction (ANSI).  }
  {$EXTERNALSYM SIGILL}
  SIGTRAP         = 5;      { Trace trap (POSIX).  }
  {$EXTERNALSYM SIGTRAP}
  SIGABRT         = 6;      { Abort (ANSI).  }
  {$EXTERNALSYM SIGABRT}
  SIGIOT          = 6 platform;      { IOT trap (4.2 BSD).  }
  {$EXTERNALSYM SIGIOT}
  SIGBUS          = 7;      { BUS error (4.2 BSD).  }
  {$EXTERNALSYM SIGBUS}
  SIGFPE          = 8;      { Floating-point exception (ANSI).  }
  {$EXTERNALSYM SIGFPE}
  SIGKILL         = 9;      { Kill, unblockable (POSIX).  }
  {$EXTERNALSYM SIGKILL}
  SIGUSR1         = 10;     { User-defined signal 1 (POSIX).  }
  {$EXTERNALSYM SIGUSR1}
  SIGSEGV         = 11;     { Segmentation violation (ANSI).  }
  {$EXTERNALSYM SIGSEGV}
  SIGUSR2         = 12;     { User-defined signal 2 (POSIX).  }
  {$EXTERNALSYM SIGUSR2}
  SIGPIPE         = 13;     { Broken pipe (POSIX).  }
  {$EXTERNALSYM SIGPIPE}
  SIGALRM         = 14;     { Alarm clock (POSIX).  }
  {$EXTERNALSYM SIGALRM}
  SIGTERM         = 15;     { Termination (ANSI).  }
  {$EXTERNALSYM SIGTERM}
  SIGSTKFLT       = 16 platform;     { Stack fault.  }
  {$EXTERNALSYM SIGSTKFLT}
  SIGCHLD         = 17;     { Child status has changed (POSIX).  }
  {$EXTERNALSYM SIGCHLD}
  SIGCLD          = SIGCHLD; { Same as SIGCHLD (System V).  }
  {$EXTERNALSYM SIGCLD}
  SIGCONT         = 18;     { Continue (POSIX).  }
  {$EXTERNALSYM SIGCONT}
  SIGSTOP         = 19;     { Stop, unblockable (POSIX).  }
  {$EXTERNALSYM SIGSTOP}
  SIGTSTP         = 20;     { Keyboard stop (POSIX).  }
  {$EXTERNALSYM SIGTSTP}
  SIGTTIN         = 21;     { Background read from tty (POSIX).  }
  {$EXTERNALSYM SIGTTIN}
  SIGTTOU         = 22;     { Background write to tty (POSIX).  }
  {$EXTERNALSYM SIGTTOU}
  SIGURG          = 23;     { Urgent condition on socket (4.2 BSD).  }
  {$EXTERNALSYM SIGURG}
  SIGXCPU         = 24;     { CPU limit exceeded (4.2 BSD).  }
  {$EXTERNALSYM SIGXCPU}
  SIGXFSZ         = 25;     { File size limit exceeded (4.2 BSD).  }
  {$EXTERNALSYM SIGXFSZ}
  SIGVTALRM       = 26;     { Virtual alarm clock (4.2 BSD).  }
  {$EXTERNALSYM SIGVTALRM}
  SIGPROF         = 27 platform;     { Profiling alarm clock (4.2 BSD).  }
  {$EXTERNALSYM SIGPROF}
  SIGWINCH        = 28 platform;     { Window size change (4.3 BSD, Sun).  }
  {$EXTERNALSYM SIGWINCH}
  SIGIO           = 29 platform;     { I/O now possible (4.2 BSD).  }
  {$EXTERNALSYM SIGIO}
  SIGPOLL         = SIGIO platform;  { Pollable event occurred (System V).  }
  {$EXTERNALSYM SIGPOLL}
  SIGPWR          = 30 platform;     { Power failure restart (System V).  }
  {$EXTERNALSYM SIGPWR}
  SIGUNUSED       = 31;
  {$EXTERNALSYM SIGUNUSED}


{ Bits in `sa_flags'.  }
const
  SA_NOCLDSTOP  = 1;         { Don't send SIGCHLD when children stop.  }
  {$EXTERNALSYM SA_NOCLDSTOP}
  SA_NOCLDWAIT  = 2;         { Don't create zombie on child death.  }
  {$EXTERNALSYM SA_NOCLDWAIT}
  SA_SIGINFO    = 4;         { Invoke signal-catching function with three arguments instead of one.  }
  {$EXTERNALSYM SA_SIGINFO}

  SA_ONSTACK    = $08000000; { Use signal stack by using `sa_restorer'. }
  {$EXTERNALSYM SA_ONSTACK}
  SA_RESTART    = $10000000; { Restart syscall on signal return.  }
  {$EXTERNALSYM SA_RESTART}
  SA_NODEFER    = $40000000; { Don't automatically block the signal when its handler is being executed.  }
  {$EXTERNALSYM SA_NODEFER}
  SA_RESETHAND  = $80000000; { Reset to SIG_DFL on entry to handler.  }
  {$EXTERNALSYM SA_RESETHAND}
  SA_INTERRUPT  = $20000000 platform; { Historical no-op.  }
  {$EXTERNALSYM SA_INTERRUPT}

{ Some aliases for the SA_ constants.  }
  SA_NOMASK     = SA_NODEFER platform;
  {$EXTERNALSYM SA_NOMASK}
  SA_ONESHOT    = SA_RESETHAND platform;
  {$EXTERNALSYM SA_ONESHOT}
  SA_STACK      = SA_ONSTACK platform;
  {$EXTERNALSYM SA_STACK}

{ Values for the HOW argument to `sigprocmask'.  }
  SIG_BLOCK     = 0;         { Block signals.  }
  {$EXTERNALSYM SIG_BLOCK}
  SIG_UNBLOCK   = 1;         { Unblock signals.  }
  {$EXTERNALSYM SIG_UNBLOCK}
  SIG_SETMASK   = 2;         { Set the set of blocked signals.  }
  {$EXTERNALSYM SIG_SETMASK}

const
  __SI_MAX_SIZE      = 128;
  {$EXTERNALSYM __SI_MAX_SIZE}
  __SI_PAD_SIZE      = (__SI_MAX_SIZE div sizeof (Integer)) - 3;
  {$EXTERNALSYM __SI_PAD_SIZE}

type
{ siginfo nested types (_si_* ). These are not found in the header file. }
  _si_pad = packed array[0..__SI_PAD_SIZE-1] of Integer;
  {$EXTERNALSYM _si_pad}
  P_si_pad = ^_si_pad;
  {$EXTERNALSYM P_si_pad}

  { kill().  }
  _si_kill = record
    si_pid: pid_t;            { Sending process ID.  }
    si_uid: uid_t;            { Real user ID of sending process.  }
  end;
  {$EXTERNALSYM _si_kill}
  P_si_kill = ^_si_kill;
  {$EXTERNALSYM P_si_kill}

  { POSIX.1b timers.  }
  _si_timer = record
    si_tid: Integer;
    si_overrun: Integer;
    si_sigval: sigval_t;
  end;
  {$EXTERNALSYM _si_timer}
  P_si_timer = ^_si_timer;
  {$EXTERNALSYM P_si_timer}

  { POSIX.1b signals.  }
  _si_rt = record
    si_pid: pid_t;            { Sending process ID.  }
    si_uid: uid_t;            { Real user ID of sending process.  }
    si_sigval: sigval;        { Signal value.  }
  end;
  {$EXTERNALSYM _si_rt}
  P_si_rt = ^_si_rt;
  {$EXTERNALSYM P_si_rt}

  { SIGCHLD.  }
  _si_sigchld = record
    si_pid: pid_t;            { Which child.  }
    si_uid: uid_t;            { Real user ID of sending process.  }
    si_status: Integer;         { Exit value or signal.  }
    si_utime: clock_t;
    si_stime: clock_t;
  end;
  {$EXTERNALSYM _si_sigchld}
  P_si_sigchld = ^_si_sigchld;
  {$EXTERNALSYM P_si_sigchld}

  { SIGILL, SIGFPE, SIGSEGV, SIGBUS.  }
  _si_addr_bnd = record
    si_lower, si_upper: Pointer;
  end;
  {$EXTERNALSYM _si_addr_bnd}
  _si_sigfault = record
    si_addr: Pointer;           { Faulting insn/memory ref.  }
    si_addr_lsb: SmallInt;
    si_addr_bnd: _si_addr_bnd;
  end;
  {$EXTERNALSYM _si_sigfault}
  P_si_sigfault = ^_si_sigfault;
  {$EXTERNALSYM P_si_sigfault}

  { SIGPOLL.  }
  _si_sigpoll = record
    si_band: Longint;           { Band event for SIGPOLL.  }
    si_fd: Integer;
  end;
  {$EXTERNALSYM _si_sigpoll}
  P_si_sigpoll = ^_si_sigpoll;
  {$EXTERNALSYM P_si_sigpoll}

  { SIGSYS.  }
  _si_sigsys = record
    _call_addr: Pointer;
    _syscall: Integer;
    _arch: Cardinal;
  end;
  {$EXTERNALSYM _si_sigsys}
  P_si_sigsys = ^_si_sigsys;
  {$EXTERNALSYM P_si_sigsys}

  siginfo_t = record
    si_signo: Integer;          { Signal number.  }
    si_errno: Integer;          { If non-zero, an errno value associated with
                                  this signal, as defined in <errno.h>.  }
    si_code: Integer;           { Signal code.  }
    _sifields: record
      case Integer of
        0: (_pad: _si_pad);
        1: (_kill: _si_kill);
        2: (_timer: _si_timer);
        3: (_rt: _si_rt);
        4: (_sigchld: _si_sigchld);
        5: (_sigfault: _si_sigfault);
        6: (_sigpoll: _si_sigpoll);
        7: (_sigsys: _si_sigsys);
    end;
  end;
  {$EXTERNALSYM siginfo_t}
  Psiginfo_t = ^siginfo_t;

// Translated from asm/sigcontext.h (from kernel)

{ Structure describing the action to be taken when a signal arrives.  }
type
  TSignalHandler = procedure(SigNum: Integer); cdecl;
  TRestoreHandler = procedure; cdecl; // Used anonymously in header file
  TSigActionHandler = procedure(SigNum: Integer; SigInfo: Psiginfo_t; Context: Pointer); cdecl;

  { Signal handler. }
  sigaction_t = record // Renamed symbol, not in header file.
    _u: record { Pointer to a signal-catching function }
      case Integer of
        0: (sa_handler: TSignalHandler);
        1: (sa_sigaction: TSigActionHandler);
    end;
    sa_mask: sigset_t;   { Additional set of signals to be blocked.  }
    sa_flags: Integer;   { Special flags.  }
    sa_restorer: TRestoreHandler; { Restore handler.  }
  end;
  {$EXTERNALSYM sigaction_t}
  Psigaction_t = ^sigaction_t;
  {$EXTERNALSYM Psigaction_t}

type
  _fpreg = record
    significand: packed array[0..4-1] of Word;
    exponent: Word;
  end;
  {$EXTERNALSYM _fpreg}
  P_fpreg = ^_fpreg;

  _fpxreg = record
    significand: packed array[0..4-1] of Word;
    exponent: Word;
    padding: packed array[0..3-1] of Word;
  end;
  {$EXTERNALSYM _fpxreg}
  P_fpxreg = ^_fpxreg;

  _xmmreg = record
    element: array[0..4-1] of UInt32;
  end;
  {$EXTERNALSYM _xmmreg}
  P_xmmreg = ^_xmmreg;

{$IF defined(CPUX64)}

  _fpstate = record
    cwd: UInt16;
    swd: UInt16;
    ftw: UInt16;
    fop: UInt16;
    rip: UInt64;
    rdp: UInt64;
    mxcsr: UInt32;
    mxcr_mask: UInt32;
    _st: array [0..8-1] of _fpxreg;
    _xmm: array [0..16-1] of _xmmreg;
    padding: array [0..24-1] of UInt32;
  end;
  {$EXTERNALSYM _fpstate}
  P_fpstate = ^_fpstate;

  sigcontext_t = record
    r8: UInt64;
    r9: UInt64;
    r10: UInt64;
    r11: UInt64;
    r12: UInt64;
    r13: UInt64;
    r14: UInt64;
    r15: UInt64;
    rdi: UInt64;
    rsi: UInt64;
    rbp: UInt64;
    rbx: UInt64;
    rdx: UInt64;
    rax: UInt64;
    rcx: UInt64;
    rsp: UInt64;
    rip: UInt64;
    eflags: UInt64;
    cs: Word;
    gs: Word;
    fs: Word;
    __pad0: Word;
    err: UInt64;
    trapno: UInt64;
    oldmask: UInt64;
    cr2: UInt64;
    fpstate: record
      case Integer of
        0: (_fpstate: P_fpstate;);
        1: (__fpstate_word: UInt64;);
    end;
    __reserved1: array[0..8-1] of UInt64;
  end;
  {$EXTERNALSYM sigcontext_t}
  Psigcontext_t = ^sigcontext_t;
  {$EXTERNALSYM Psigcontext_t}

{$ELSEIF defined(CPUX86)}

  _fpstate = record
    cw: UInt32;
    sw: UInt32;
    tag: UInt32;
    ipoff: UInt32;
    cssel: UInt32;
    dataoff: UInt32;
    datasel: UInt32;
    _st: packed array[0..8-1] of _fpreg;
    status: Word;
    magic: Word;
    _fxsr_env: array[0..6-1] of UInt32;
    mxcsr: UInt32;
    reserved: UInt32;
    _fxsr_st: array [0..8-1] of _fpxreg;
    _xmm: array [0..8-1] of _xmmreg;
    padding: array [0..56-1] of UInt32;
  end;
  {$EXTERNALSYM _fpstate}
  P_fpstate = ^_fpstate;

  sigcontext_t = record
    gs, __gsh: Word;
    fs, __fsh: Word;
    es, __esh: Word;
    ds, __dsh: Word;
    edi: LongWord;
    esi: LongWord;
    ebp: LongWord;
    esp: LongWord;
    ebx: LongWord;
    edx: LongWord;
    ecx: LongWord;
    eax: LongWord;
    trapno: LongWord;
    err: LongWord;
    eip: LongWord;
    cs, __csh: Word;
    eflags: LongWord;
    esp_at_signal: LongWord;
    ss, __ssh: Word;
    fpstate: P_fpstate;
    oldmask: LongWord;
    cr2: LongWord;
  end;
  {$EXTERNALSYM sigcontext_t}
  Psigcontext_t = ^sigcontext_t;

{$ELSEIF Defined(CPUARM32)}

  _fpstate = record
    fpregs: array[0..7] of Cardinal;
    fpsr: Cardinal;
    fpcr: Cardinal;
    ftype: array[0..7] of Byte;
    init_flag: Cardinal;
  end;
  {$EXTERNALSYM _fpstate}
  P_fpstate = ^_fpstate;

  sigcontext_t = record
    trapno: LongWord;
    error_code: LongWord;
    oldmask: LongWord;
    arm_r0: LongWord;
    arm_r1: LongWord;
    arm_r2: LongWord;
    arm_r3: LongWord;
    arm_r4: LongWord;
    arm_r5: LongWord;
    arm_r6: LongWord;
    arm_r7: LongWord;
    arm_r8: LongWord;
    arm_r9: LongWord;
    arm_r10: LongWord;
    arm_fp: LongWord;
    arm_ip: LongWord;
    arm_sp: LongWord;
    arm_lr: LongWord;
    arm_pc: LongWord;
    arm_cpsr: LongWord;
    fault_address: LongWord;
  end;
  {$EXTERNALSYM sigcontext_t}
  Psigcontext_t = ^sigcontext_t;

{$ELSEIF Defined(CPUARM64)}

  sigcontext = record
        fault_address: UInt64;
        regs: array[0..31] of UInt64;
        sp: UInt64;
        pc: UInt64;
        pstate: UInt64;
        __reserved: array[0..4095] of UInt8;
   end;
  {$EXTERNALSYM sigcontext}

{$ELSE}
{$MESSAGE ERROR 'Unknown Platform'}
{$ENDIF}


// Translated from sys/ucontext.h

{ Type for general register.  }
type
  greg_t = NativeInt;
  {$EXTERNALSYM greg_t}
  Pgreg_t = ^greg_t;

{ Number of general registers.  }
const
{$IF defined(CPUX64)}
  NGREG = 23;
{$ELSEIF defined(CPUX86)}
  NGREG = 19;
{$ELSEIF defined(CPUARM32)}
  NGREG = 16;
{$ELSEIF defined(CPUARM64)}
  NGREG = 16;
{$ENDIF}
  {$EXTERNALSYM NGREG}

{ Container for all general registers.  }
type
  gregset_t = packed array[0..NGREG-1] of greg_t;
  {$EXTERNALSYM gregset_t}
  Pgregset_t = ^gregset_t;

{$IF Defined(CPUX86)}
{ Number of each register is the `gregset_t' array.  }
const
  REG_GS = 0;
  {$EXTERNALSYM REG_GS}
  REG_FS = 1;
  {$EXTERNALSYM REG_FS}
  REG_ES = 2;
  {$EXTERNALSYM REG_ES}
  REG_DS = 3;
  {$EXTERNALSYM REG_DS}
  REG_EDI = 4;
  {$EXTERNALSYM REG_EDI}
  REG_ESI = 5;
  {$EXTERNALSYM REG_ESI}
  REG_EBP = 6;
  {$EXTERNALSYM REG_EBP}
  REG_ESP = 7;
  {$EXTERNALSYM REG_ESP}
  REG_EBX = 8;
  {$EXTERNALSYM REG_EBX}
  REG_EDX = 9;
  {$EXTERNALSYM REG_EDX}
  REG_ECX = 10;
  {$EXTERNALSYM REG_ECX}
  REG_EAX = 11;
  {$EXTERNALSYM REG_EAX}
  REG_TRAPNO = 12;
  {$EXTERNALSYM REG_TRAPNO}
  REG_ERR = 13;
  {$EXTERNALSYM REG_ERR}
  REG_EIP = 14;
  {$EXTERNALSYM REG_EIP}
  REG_CS = 15;
  {$EXTERNALSYM REG_CS}
  REG_EFL = 16;
  {$EXTERNALSYM REG_EFL}
  REG_UESP = 17;
  {$EXTERNALSYM REG_UESP}
  REG_SS = 18;
  {$EXTERNALSYM REG_SS}
{$ELSEIF Defined(CPUX64)}
const
  REG_R8 = 0;
  {$EXTERNALSYM REG_R8}
  REG_R9 = 1;
  {$EXTERNALSYM REG_R9}
  REG_R10 = 2;
  {$EXTERNALSYM REG_R10}
  REG_R11 = 3;
  {$EXTERNALSYM REG_R11}
  REG_R12 = 4;
  {$EXTERNALSYM REG_R12}
  REG_R13 = 5;
  {$EXTERNALSYM REG_R13}
  REG_R14 = 6;
  {$EXTERNALSYM REG_R14}
  REG_R15 = 7;
  {$EXTERNALSYM REG_R15}
  REG_RDI = 8;
  {$EXTERNALSYM REG_RDI}
  REG_RSI = 9;
  {$EXTERNALSYM REG_RSI}
  REG_RBP = 10;
  {$EXTERNALSYM REG_RBP}
  REG_RBX = 11;
  {$EXTERNALSYM REG_RBX}
  REG_RDX = 12;
  {$EXTERNALSYM REG_RDX}
  REG_RAX = 13;
  {$EXTERNALSYM REG_RAX}
  REG_RCX = 14;
  {$EXTERNALSYM REG_RCX}
  REG_RSP = 15;
  {$EXTERNALSYM REG_RSP}
  REG_RIP = 16;
  {$EXTERNALSYM REG_RIP}
  REG_EFL = 17;
  {$EXTERNALSYM REG_EFL}
  REG_CSGSFS = 18;
  {$EXTERNALSYM REG_CSGSFS}
  REG_ERR = 19;
  {$EXTERNALSYM REG_ERR}
  REG_TRAPNO = 20;
  {$EXTERNALSYM REG_TRAPNO}
  REG_OLDMASK = 21;
  {$EXTERNALSYM REG_OLDMASK}
  REG_CR2 = 22;
  {$EXTERNALSYM REG_CR2}
{$ELSEIF Defined(CPUARM32)}
const
  REG_R0 = 0;
  {$EXTERNALSYM REG_R0}
  REG_R1 = 1;
  {$EXTERNALSYM REG_R1}
  REG_R2 = 2;
  {$EXTERNALSYM REG_R2}
  REG_R3 = 3;
  {$EXTERNALSYM REG_R3}
  REG_R4 = 4;
  {$EXTERNALSYM REG_R4}
  REG_R5 = 5;
  {$EXTERNALSYM REG_R5}
  REG_R6 = 6;
  {$EXTERNALSYM REG_R6}
  REG_R7 = 7;
  {$EXTERNALSYM REG_R7}
  REG_R8 = 8;
  {$EXTERNALSYM REG_R8}
  REG_R9 = 9;
  {$EXTERNALSYM REG_R9}
  REG_R10 = 10;
  {$EXTERNALSYM REG_R10}
  REG_R11 = 11;
  {$EXTERNALSYM REG_R11}
  REG_R12 = 12;
  {$EXTERNALSYM REG_R12}
  REG_R13 = 13;
  {$EXTERNALSYM REG_R13}
  REG_R14 = 14;
  {$EXTERNALSYM REG_R14}
  REG_R15 = 15;
  {$EXTERNALSYM REG_R15}
{$ELSEIF Defined(CPUARM64)}
{$ENDIF}

{ Definitions taken from the kernel headers.  }
type
{$IF defined(CPUX64)}
  _libc_fpxreg = record
    significand: packed array[0..4-1] of Word;
    exponent: Word;
    padding: array[0..3-1] of Word;
  end;
  {$EXTERNALSYM _libc_fpxreg}
  P_libc_fpxreg = ^_libc_fpxreg;

  _libc_xmmreg = record
    element: array[0..4-1] of UInt32;
  end;
  {$EXTERNALSYM _libc_xmmreg}
  P_libc_xmmreg = ^_libc_xmmreg;

  _libc_fpstate = record
    cwd: UInt16;
    swd: UInt16;
    _ftw: UInt16;
    fop: UInt16;
    rip: UInt64;
    rdp: UInt64;
    mxcsr: UInt32;
    mxcr_mask: UInt32;
    _st: array[0..8-1] of _libc_fpxreg;
    _xmm: array[0..16-1] of _libc_xmmreg;
    padding: array[0..24-1] of UInt32;
  end;
  {$EXTERNALSYM _libc_fpstate}
  P_libc_fpstate = ^_libc_fpstate;

{ Structure to describe FPU registers.  }
  fpregset_t = ^_libc_fpstate;
  {$EXTERNALSYM fpregset_t}

{ Context to describe whole processor state.  }
  mcontext_t = record
    gregs: gregset_t;
    { Note that fpregs is a pointer.  }
    fpregs: fpregset_t;
    __reserved1: array[0..8-1] of UInt64;
  end;
  {$EXTERNALSYM mcontext_t}
  Pmcontext_t = ^mcontext_t;

{$ELSEIF defined(CPUX86)}

  _libc_fpreg = record
    significand: packed array[0..4-1] of Word;
    exponent: Word;
  end;
  {$EXTERNALSYM _libc_fpreg}
  P_libc_fpreg = ^_libc_fpreg;

  _libc_fpstate = record
    cw: LongWord;
    sw: LongWord;
    tag: LongWord;
    ipoff: LongWord;
    cssel: LongWord;
    dataoff: LongWord;
    datasel: LongWord;
    _st: packed array[0..8-1] of _libc_fpreg;
    status: LongWord;
  end;
  {$EXTERNALSYM _libc_fpstate}
  P_libc_fpstate = ^_libc_fpstate;

{ Structure to describe FPU registers.  }
  fpregset_t = ^_libc_fpstate;
  {$EXTERNALSYM fpregset_t}
  Pfpregset_t = ^fpregset_t;

{ Context to describe whole processor state.  }
  mcontext_t = record
    gregs: gregset_t;
    { Due to Linux's history we have to use a pointer here.  The SysV/i386
       ABI requires a struct with the values.  }
    fpregs: fpregset_t;
    oldmask: LongWord;
    cr2: LongWord;
  end;
  {$EXTERNALSYM mcontext_t}
  Pmcontext_t = ^mcontext_t;

{$ELSEIF Defined(CPUARM32)}
  _libc_fpreg = record
    significand: packed array[0..4-1] of Word;
    exponent: Word;
  end;
  {$EXTERNALSYM _libc_fpreg}
  P_libc_fpreg = ^_libc_fpreg;

{ Structure to describe FPU registers.  }
  fpregset_t = ^_libc_fpstate;
  {$EXTERNALSYM fpregset_t}
  Pfpregset_t = ^fpregset_t;

  _libc_fpstate = record
    fpregs: array[0..7] of Cardinal;
    fpsr: Cardinal;
    fpcr: Cardinal;
    ftype: array[0..7] of Byte;
    init_flag: Cardinal;
  end;
  {$EXTERNALSYM _fpstate}
  P_libc_fpstate = ^_libc_fpstate;

{ Context to describe whole processor state.  }
  mcontext_t = record
    gregs: gregset_t;
    { Due to Linux's history we have to use a pointer here.  The SysV/i386
       ABI requires a struct with the values.  }
    fpregs: fpregset_t;
    oldmask: LongWord;
    cr2: LongWord;
  end;
  {$EXTERNALSYM mcontext_t}
  Pmcontext_t = ^mcontext_t;

{$ELSEIF Defined(CPUARM64)}

  mcontext_t = sigcontext;
  {$EXTERNALSYM mcontext_t}
  Pmcontext_t = ^mcontext_t;

{$ELSE}
{$MESSAGE ERROR 'Unknown Platform'}
{$ENDIF}

  stack_t = record
    ss_sp: Pointer;
    ss_flags: Integer;
    ss_size: size_t;
  end;
  {$EXTERNALSYM stack_t}
  Pstack_t = ^stack_t;

{ Userlevel context.  }
  Pucontext_t = ^ucontext_t;
  ucontext_t = record
    uc_flags: LongWord;
    uc_link: Pucontext_t;
    uc_stack: stack_t;
    uc_mcontext: mcontext_t;
{$IF not Defined(CPUARM64)}
    uc_sigmask: sigset_t;
    __fpregs_mem: _libc_fpstate;
{$ENDIF !CPUARM64}
  end;
  {$EXTERNALSYM ucontext_t}
