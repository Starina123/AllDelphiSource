{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}


const
{ Bits in the third argument to `waitpid'.  }
  WNOHANG            = 1;               { Don't block waiting.  }
  {$EXTERNALSYM WNOHANG}
  WUNTRACED          = 2;               { Report status of stopped children.  }
  {$EXTERNALSYM WUNTRACED}

  WSTOPPED   = 2;
  {$EXTERNALSYM WSTOPPED}
  WEXITED    = 4;
  {$EXTERNALSYM WEXITED}
  WCONTINUED = 8;
  {$EXTERNALSYM WCONTINUED}
  WNOWAIT    = $01000000;
  {$EXTERNALSYM WNOWAIT}

type
  idtype_t = (
    P_ALL,
    P_PID,
    P_PGID );
  {$EXTERNALSYM idtype_t}

{ Special values for the PID argument to `waitpid' and `wait4'.  }
const
  WAIT_ANY    = Integer(-1) platform; { Any process.  }
  {$EXTERNALSYM WAIT_ANY}
  WAIT_MYPGRP = 0 platform ;          { Any process in my process group.  }
  {$EXTERNALSYM WAIT_MYPGRP}
