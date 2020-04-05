{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

type
  time_t = Longint;
  {$EXTERNALSYM time_t}
  Ptime_t = ^time_t;
  
  timer_t = Pointer;
  {$EXTERNALSYM timer_t}
  Ptimer_t = ^timer_t;

  clock_t = LongInt;
  {$EXTERNALSYM clock_t}
  Pclock_t = ^clock_t;

  blkcnt_t = LongInt;
  {$EXTERNALSYM blkcnt_t}
  Pblkcnt_t = ^blkcnt_t;

  blksize_t = LongInt;
  {$EXTERNALSYM blksize_t}
  Pblksize_t = ^blksize_t;

  fsblkcnt_t = LongWord;
  {$EXTERNALSYM fsblkcnt_t}
  Pfsblkcnt_t = ^fsblkcnt_t;

  fsfilcnt_t = LongWord;
  {$EXTERNALSYM fsfilcnt_t}
  Pfsfilcnt_t = ^fsfilcnt_t;

  fsblkcnt64_t = UInt64;
  {$EXTERNALSYM fsblkcnt64_t}
  Pfsblkcnt64_t = ^fsfilcnt64_t;

  fsfilcnt64_t = UInt64;
  {$EXTERNALSYM fsfilcnt64_t}
  Pfsfilcnt64_t = ^fsfilcnt64_t;

  dev_t = UInt64;
  {$EXTERNALSYM dev_t}
  Pdev_t = ^dev_t;

  gid_t = Cardinal;
  {$EXTERNALSYM gid_t}
  Pgid_t = ^gid_t;

  id_t = Cardinal;
  {$EXTERNALSYM id_t}
  _Pid_t = ^id_t;

  ino_t = LongWord;
  {$EXTERNALSYM ino_t}
  Pino_t = ^ino_t;

  mode_t = Cardinal;
  {$EXTERNALSYM mode_t}
  Pmode_t = ^mode_t;

  nlink_t = LongWord;
  {$EXTERNALSYM nlink_t}
  Pnlink_t = ^nlink_t;

  off_t = LongInt;
  {$EXTERNALSYM off_t}
  Poff_t = ^off_t;

  pid_t = Integer;
  {$EXTERNALSYM pid_t}
  Ppid_t = ^pid_t;

  ssize_t = LongInt;
  {$EXTERNALSYM ssize_t}
  Pssize_t = ^ssize_t;

  uid_t = UInt32;
  {$EXTERNALSYM uid_t}

  useconds_t = Cardinal;
  {$EXTERNALSYM useconds_t}
  Puseconds_t = ^useconds_t;

  suseconds_t = LongInt;
  {$EXTERNALSYM suseconds_t}
  Psuseconds_t = ^suseconds_t;

{ PThreads Support }

type
  pthread_t = LongWord;
  {$EXTERNALSYM pthread_t}

  pthread_once_t = Integer;
  {$EXTERNALSYM pthread_once_t}

{$IFDEF CPU64BITS}

  P__pthread_list_t = ^__pthread_list_t;
  __pthread_list_t = record
    __prev: P__pthread_list_t;
    __next: P__pthread_list_t;
  end;

  __pthread_mutex_s = record
    __lock: Integer;
    __count: Cardinal;
    __owner: Integer;
    __nusers: Cardinal;
    __kind: Integer;
    __spins: SmallInt;
    __elision: SmallInt;
    __list: __pthread_list_t;
  end;

  pthread_mutex_t = record
    case Integer of
      0: (__data: __pthread_mutex_s);
      1: (__size: array [0..40-1] of Byte);
      2: (__align: LongInt);
  end;
  {$EXTERNALSYM pthread_mutex_t}

  pthread_rwlock_t = record
  case Integer of
    0: (data: record
        __lock: Integer;
        __nr_readers: Integer;
        __writer_wakeup: Integer;
        __nr_readers_queued: Integer;
        __nr_writers_queued: Integer;
        __writer: Integer;
        __shared: Integer;
        __pad1: LongWord;
        __pad2: LongWord;
        __flags: Cardinal;
      end);
    1: (__size: array [0..56-1] of Byte);
  end;
  {$EXTERNALSYM pthread_rwlock_t}

{ POSIX barrier. }
  pthread_barrier_t = record
    _size: array [0..31] of Byte;
  end;
  {$EXTERNALSYM pthread_barrier_t}
  Ppthread_barrier_t = ^pthread_barrier_t;

{$ELSEIF defined(CPU32BITS)}

  P__pthread_slist_t = ^__pthread_slist_t;
  __pthread_slist_t = record
    __prev: P__pthread_slist_t;
    __next: P__pthread_slist_t;
  end;

  __pthread_mutex_s = record
    __lock: Integer;
    __count: Cardinal;
    __owner: Integer;

    __kind: Integer;
    __nusers: Cardinal;
    case Integer of 
      0: (d: record
            __spins: SmallInt;
            __elision: SmallInt;
          end);
      1: (__list: __pthread_slist_t);
  end;

  pthread_mutex_t = record
    case Integer of
      0: (__data: __pthread_mutex_s);
      1: (__size: array [0..24-1] of Byte);
      2: (__align: LongInt);
  end;
  {$EXTERNALSYM pthread_mutex_t}

  pthread_rwlock_t = record
  case Integer of
    0: (data: record
        __lock: Integer;
        __nr_readers: Integer;
        __writer_wakeup: Integer;
        __nr_readers_queued: Integer;
        __nr_writers_queued: Integer;
        __flags: Byte;
        __shared: Byte;
        __pad1: Byte;
        __pad2: Byte;
        __writer: Integer;
      end);
    1: (__size: array [0..32-1] of Byte);
  end;
  {$EXTERNALSYM pthread_rwlock_t}

{ POSIX barrier. }
  pthread_barrier_t = record
    _size: array [0..19] of Byte;
  end;
  {$EXTERNALSYM pthread_barrier_t}
  Ppthread_barrier_t = ^pthread_barrier_t;

{$ENDIF}

  pthread_mutexattr_t = record
    case Integer of
    0: ( __size: array [0..4-1] of Byte);
    1: ( __align: Integer);
  end;
  {$EXTERNALSYM pthread_mutexattr_t}
  Ppthread_mutexattr_t = ^pthread_mutexattr_t;

  pthread_cond_t = record
    case Integer of
      0: (__data: record
         __lock: Integer;
         __futex: Cardinal;
         __total_seq: UInt64;
         __wakeup_seq: UInt64;
         __woken_seq: UInt64;
         __mutex: Pointer;
         __nwaiters: Cardinal;
         __broadcast_seq: Cardinal;
         end);
      1: (__size: array [0..48-1] of Byte);
      2: (__align: Int64);
  end;
  {$EXTERNALSYM pthread_cond_t}

  pthread_condattr_t = record
    case Integer of
      0: (__size: array [0..4-1] of Byte);
      1: (__align: Integer);
  end;
  {$EXTERNALSYM pthread_condattr_t}
  Ppthread_condattr_t = ^pthread_condattr_t;

  pthread_key_t = Cardinal;
  {$EXTERNALSYM pthread_key_t}

  pthread_rwlockattr_t = record
    case Integer of
      0: (__size: array [0..8-1] of Byte);
      1: (__align: LongInt)
  end;
  {$EXTERNALSYM pthread_rwlockattr_t}
  Ppthread_rwlockattr_t = ^pthread_rwlockattr_t;

{ POSIX spinlock data type.  }
  pthread_spinlock_t = Integer;
  {$EXTERNALSYM pthread_spinlock_t}

{ Barrier attribute }
  pthread_barrierattr_t = record
    _size: array [0..4-1] of Byte;
  end;
  {$EXTERNALSYM pthread_barrierattr_t}
  Ppthread_barrierattr_t = ^pthread_barrierattr_t;

{$IFNDEF _PTHREAD_ATTR_T_DEFINED}
  pthread_attr_t = record
    {$IFDEF CPU64BITS}
    __size: array [0..56-1] of Byte;
    {$ELSE}
    __size: array [0..36-1] of Byte;
    {$ENDIF}
    __align: LongInt;
  end;
  {$EXTERNALSYM pthread_attr_t}
{$ENDIF _PTHREAD_ATTR_T_DEFINED}
  Ppthread_attr_t = ^pthread_attr_t;

  caddr_t = MarshaledAString;
  {$EXTERNALSYM caddr_t}
