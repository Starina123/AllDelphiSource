{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}


{ The passwd structure.  }
type
  passwd = {packed} record
    pw_name: MarshaledAString;             { Username.  }
    pw_passwd: MarshaledAString;           { Password.  }
    pw_uid: uid_t;                  { User ID.  }
    pw_gid: gid_t;                  { Group ID.  }
    pw_gecos: MarshaledAString;            { Real name.  }
    pw_dir: MarshaledAString;              { Home directory.  }
    pw_shell: MarshaledAString;            { Shell program.  }
  end;
  {$EXTERNALSYM passwd}
  Ppasswd = ^passwd;
