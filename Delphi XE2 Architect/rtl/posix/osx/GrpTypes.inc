{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

type
  group = record
    gr_name: PAnsiChar;             { Group name.	}
    gr_passwd: PAnsiChar;           { Password.	}
    gr_gid: gid_t;                  { Group ID.	}
    gr_mem: PPAnsiChar;             { Member list.	}
  end;
  {$EXTERNALSYM group}
  Pgroup = ^group;

