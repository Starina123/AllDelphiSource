{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

type
  group = record
    gr_name: MarshaledAString;      { Group name.	}
    gr_passwd: MarshaledAString;    { Password.	}
    gr_gid: gid_t;                  { Group ID.	}
    gr_mem: PMarshaledAString;      { Member list.	}
  end;
  {$EXTERNALSYM group}
  Pgroup = ^group;

