{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

const
{$IFDEF OSX64}
{
 * [Internal] data structure signatures
}

  _PTHREAD_MUTEX_SIG_init              = $32AAABA7;
  {$EXTERNALSYM _PTHREAD_MUTEX_SIG_init}

  _PTHREAD_ERRORCHECK_MUTEX_SIG_init   = $32AAABA1;
  {$EXTERNALSYM _PTHREAD_ERRORCHECK_MUTEX_SIG_init}
  _PTHREAD_RECURSIVE_MUTEX_SIG_init    = $32AAABA2;
  {$EXTERNALSYM _PTHREAD_RECURSIVE_MUTEX_SIG_init}
  _PTHREAD_FIRSTFIT_MUTEX_SIG_init     = $32AAABA3;
  {$EXTERNALSYM _PTHREAD_FIRSTFIT_MUTEX_SIG_init}

  _PTHREAD_COND_SIG_init               = $3CB0B1BB;
  {$EXTERNALSYM _PTHREAD_COND_SIG_init}
  _PTHREAD_ONCE_SIG_init               = $30B1BCBA;
  {$EXTERNALSYM _PTHREAD_ONCE_SIG_init}
  _PTHREAD_RWLOCK_SIG_init             = $2DA8B3B4;
  {$EXTERNALSYM _PTHREAD_RWLOCK_SIG_init}
{$ENDIF OSX64}

{
 * POSIX scheduling policies
}
  SCHED_OTHER = 1;
  {$EXTERNALSYM SCHED_OTHER}
  SCHED_FIFO = 4;
  {$EXTERNALSYM SCHED_FIFO}
  SCHED_RR = 2;
  {$EXTERNALSYM SCHED_RR}

  __SCHED_PARAM_SIZE__ = 4;
  {$EXTERNALSYM __SCHED_PARAM_SIZE__}

type
  sched_param = record
    sched_priority: Integer;
    __opaque: packed array[0..__SCHED_PARAM_SIZE__-1] of Byte;
  end;
  {$EXTERNALSYM sched_param}
  Psched_param = ^sched_param;
