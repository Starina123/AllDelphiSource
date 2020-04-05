{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2017-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

const

{ Length of the entries in `struct utsname' is 65.  }
  _UTSNAME_LENGTH = 65;
  {$EXTERNALSYM _UTSNAME_LENGTH}

{  Linux provides as additional information in the `struct utsname'
   the name of the current domain.  Define _UTSNAME_DOMAIN_LENGTH
   to a value != 0 to activate this entry.  }
  _UTSNAME_DOMAIN_LENGTH = _UTSNAME_LENGTH;
  {$EXTERNALSYM _UTSNAME_DOMAIN_LENGTH}

  _UTSNAME_SYSNAME_LENGTH = _UTSNAME_LENGTH;
  {$EXTERNALSYM _UTSNAME_SYSNAME_LENGTH}
  _UTSNAME_NODENAME_LENGTH = _UTSNAME_LENGTH;
  {$EXTERNALSYM _UTSNAME_NODENAME_LENGTH}
  _UTSNAME_RELEASE_LENGTH = _UTSNAME_LENGTH;
  {$EXTERNALSYM _UTSNAME_RELEASE_LENGTH}
  _UTSNAME_VERSION_LENGTH = _UTSNAME_LENGTH;
  {$EXTERNALSYM _UTSNAME_VERSION_LENGTH}
  _UTSNAME_MACHINE_LENGTH = _UTSNAME_LENGTH;
  {$EXTERNALSYM _UTSNAME_MACHINE_LENGTH}

{  Structure describing the system and machine.  }
type
  utsname = record
    { Name of the implementation of the operating system.  }
    sysname: array [0.._UTSNAME_SYSNAME_LENGTH-1] of UTF8Char;

    { Name of this node on the network.  }
    nodename: array [0.._UTSNAME_NODENAME_LENGTH-1] of UTF8Char;

    { Current release level of this implementation.  }
    release: array [0.._UTSNAME_RELEASE_LENGTH-1] of UTF8Char;
    { Current version level of this release.  }
    version: array [0.._UTSNAME_VERSION_LENGTH-1] of UTF8Char;

    { Name of the hardware type the system is running on.  }
    machine: array [0.._UTSNAME_MACHINE_LENGTH-1] of UTF8Char;

    { Name of the domain of this node on the network.  }
    domainname: array [0.._UTSNAME_DOMAIN_LENGTH-1] of UTF8Char;
  end;
  {$EXTERNALSYM utsname}
  TUTSName = utsname;
  {$EXTERNALSYM TUTSName}
  PUTSName = ^TUTSName;
  {$EXTERNALSYM PUTSName}
