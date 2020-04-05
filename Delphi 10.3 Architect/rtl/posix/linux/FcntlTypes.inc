{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

const
  F_DUPFD = $0;
  {$EXTERNALSYM F_DUPFD}
  F_GETFD = $1;
  {$EXTERNALSYM F_GETFD}
  F_SETFD = $2;
  {$EXTERNALSYM F_SETFD}
  F_GETFL = $3;
  {$EXTERNALSYM F_GETFL}
  F_SETFL = $4;
  {$EXTERNALSYM F_SETFL}
  F_GETLK = $5;
  {$EXTERNALSYM F_GETLK}
  F_SETLK = $6;
  {$EXTERNALSYM F_SETLK}
  F_SETLKW = $7;
  {$EXTERNALSYM F_SETLKW}
  F_GETOWN = $9;
  {$EXTERNALSYM F_GETOWN}
  F_SETOWN = $8;
  {$EXTERNALSYM F_SETOWN}
  FD_CLOEXEC = $1;
  {$EXTERNALSYM FD_CLOEXEC}
  F_RDLCK = $0;
  {$EXTERNALSYM F_RDLCK}
  F_UNLCK = $2;
  {$EXTERNALSYM F_UNLCK}
  F_WRLCK = $1;
  {$EXTERNALSYM F_WRLCK}
  O_CREAT = $40;
  {$EXTERNALSYM O_CREAT}
  O_EXCL = $80;
  {$EXTERNALSYM O_EXCL}
  O_NOCTTY = $100;
  {$EXTERNALSYM O_NOCTTY}
  O_TRUNC = $200;
  {$EXTERNALSYM O_TRUNC}
  O_APPEND = $400;
  {$EXTERNALSYM O_APPEND}
  O_NONBLOCK = $800;
  {$EXTERNALSYM O_NONBLOCK}
  O_SYNC = $1000;
  {$EXTERNALSYM O_SYNC}
  O_ACCMODE = $3;
  {$EXTERNALSYM O_ACCMODE}
  O_RDONLY = $0;
  {$EXTERNALSYM O_RDONLY}
  O_RDWR = $2;
  {$EXTERNALSYM O_RDWR}
  O_WRONLY = $1;
  {$EXTERNALSYM O_WRONLY}

type
  flock = {packed} record
    l_type: Smallint;   { Type of lock: F_RDLCK, F_WRLCK, or F_UNLCK.  }
    l_whence: Smallint; { Where `l_start' is relative to (like `lseek').  }
    l_start: off_t;   { Offset where the lock begins.  }
    l_len: off_t;     { Size of the locked area; zero means until EOF.  }
    l_pid: pid_t;     { Process holding the lock.  }
  end;
  {$EXTERNALSYM flock}
  Pflock = ^flock;
