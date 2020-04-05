{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}


procedure endhostent; cdecl;
  external libc name _PU + 'endhostent';
{$EXTERNALSYM endhostent}
procedure endnetent; cdecl;
  external libc name _PU + 'endnetent';
{$EXTERNALSYM endnetent}
procedure endprotoent; cdecl;
  external libc name _PU + 'endprotoent';
{$EXTERNALSYM endprotoent}
procedure endservent; cdecl;
  external libc name _PU + 'endservent';
{$EXTERNALSYM endservent}
procedure freeaddrinfo(var ai: addrinfo); cdecl;
  external libc name _PU + 'freeaddrinfo';
{$EXTERNALSYM freeaddrinfo}
function gai_strerror(ecode: Integer): PAnsiChar; cdecl;
  external libc name _PU + 'gai_strerror';
{$EXTERNALSYM gai_strerror}
function getaddrinfo(hostname, servname: PAnsiChar;
  const hints: addrinfo; out res: Paddrinfo): Integer; cdecl;
  external libc name _PU + 'getaddrinfo';
{$EXTERNALSYM getaddrinfo}
function gethostent: PHostEnt; cdecl;
  external libc name _PU + 'gethostent';
{$EXTERNALSYM gethostent}
function getnameinfo(const sa: sockaddr; salen: socklen_t;
  host: PAnsiChar; hostlen: socklen_t; 
  serv: PAnsiChar; servlen: socklen_t;
  flags: Integer): Integer; cdecl;
  external libc name _PU + 'getnameinfo';
{$EXTERNALSYM getnameinfo}
function getnetbyaddr(net: UInt32; &type: Integer): PNetEnt; cdecl;
  external libc name _PU + 'getnetbyaddr';
{$EXTERNALSYM getnetbyaddr}
function getnetbyname(name: PAnsiChar): PNetEnt; cdecl;
  external libc name _PU + 'getnetbyname';
{$EXTERNALSYM getnetbyname}
function getnetent: PNetEnt; cdecl;
  external libc name _PU + 'getnetent';
{$EXTERNALSYM getnetent}
function getprotobyname(name: PAnsiChar): PProtoEnt; cdecl;
  external libc name _PU + 'getprotobyname';
{$EXTERNALSYM getprotobyname}
function getprotobynumber(proto: Integer): PProtoEnt; cdecl;
  external libc name _PU + 'getprotobynumber';
{$EXTERNALSYM getprotobynumber}
function getprotoent: PProtoEnt; cdecl;
  external libc name _PU + 'getprotoent';
{$EXTERNALSYM getprotoent}
function getservbyname(name, proto: PAnsiChar): PServEnt; cdecl;
  external libc name _PU + 'getservbyname';
{$EXTERNALSYM getservbyname}
function getservbyport(port: Integer; proto: PAnsiChar): PServEnt; cdecl;
  external libc name _PU + 'getservbyport';
{$EXTERNALSYM getservbyport}
function getservent: PServEnt; cdecl;
  external libc name _PU + 'getservent';
{$EXTERNALSYM getservent}
procedure sethostent(host: Integer); cdecl;
  external libc name _PU + 'sethostent';
{$EXTERNALSYM sethostent}
procedure setnetent(net: Integer); cdecl;
  external libc name _PU + 'setnetent';
{$EXTERNALSYM setnetent}
procedure setprotoent(proto: Integer); cdecl;
  external libc name _PU + 'setprotoent';
{$EXTERNALSYM setprotoent}
procedure setservent(serv: Integer); cdecl;
  external libc name _PU + 'setservent';
{$EXTERNALSYM setservent}
