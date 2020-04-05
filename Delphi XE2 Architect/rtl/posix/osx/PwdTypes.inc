{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}


{ The passwd structure.  }
type
  passwd = record
    pw_name: PAnsiChar;             { Username.  }
    pw_passwd: PAnsiChar;           { Password.  }
    pw_uid: uid_t;                  { User ID.  }
    pw_gid: gid_t;                  { Group ID.  }
    pw_change: time_t;              { password change time }
    pw_class: PAnsiChar;            { user access class }
    pw_gecos: PAnsiChar;            { Honeywell login info  }
    pw_dir: PAnsiChar;              { Home directory.  }
    pw_shell: PAnsiChar;            { Shell program.  }
    pw_expire: time_t;              { account expiration }
  end;
  {$EXTERNALSYM passwd}
  Ppasswd = ^passwd;
