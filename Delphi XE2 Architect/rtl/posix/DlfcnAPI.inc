{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

{ dladdr is _not_ a POSIX function, but it _is_ in both Linux and Mac OSX. }
function dladdr(Address: NativeUInt; var Info: dl_info): Integer; cdecl;
  external libdl name _PU + 'dladdr';
{$EXTERNALSYM dladdr}  

function dlopen(Filename: PAnsiChar; Flag: Integer): NativeUInt; cdecl;
  external libdl name _PU + 'dlopen';
{$EXTERNALSYM dlopen}  
function dlclose(Handle: NativeUInt): Integer; cdecl;
  external libdl name _PU + 'dlclose';
{$EXTERNALSYM dlclose }  
function dlsym(Handle: NativeUInt; Symbol: PAnsiChar): Pointer; cdecl;
  external libdl name _PU + 'dlsym';
{$EXTERNALSYM dlsym}  
function dlerror: PAnsiChar; cdecl;
  external libdl name _PU + 'dlerror';
{$EXTERNALSYM dlerror}  

{$IFDEF MACOS}
function _dyld_get_image_name(image_index: Cardinal): PAnsiChar; cdecl; 
  external libc name _PU + '_dyld_get_image_name';
{$EXTERNALSYM _dyld_get_image_name}  
{$ENDIF}
