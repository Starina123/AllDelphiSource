{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{ bits/semaphore.h }

const
  {$IF defined(CPU64BITS)}
  __SIZEOF_SEM_T = 32;
  {$ELSEIF defined(CPU32BITS)}
  __SIZEOF_SEM_T = 16;
  {$ENDIF}
  {$EXTERNALSYM __SIZEOF_SEM_T}
  
  // Maximum value the semaphore can have
  SEM_VALUE_MAX = 2147483647;
  {$EXTERNALSYM SEM_VALUE_MAX}
  

type  

  sem_t = {packed} record
    case Integer of 
    1:
      (__align: LongInt);
    0:
      (__size: array[0..__SIZEOF_SEM_T-1] of Byte);
  end;
  {$EXTERNALSYM sem_t}
  Psem_t = ^sem_t;

const
  // Value returned if `sem_open' failed
  SEM_FAILED: Psem_t = Psem_t(0);
  {$EXTERNALSYM SEM_FAILED}
  
