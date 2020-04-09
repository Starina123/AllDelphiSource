
{*******************************************************}
{                                                       }
{       Borland Delphi Runtime Library                  }
{                                                       }
{       Copyright (C) 1998 Inprise Corporation          }
{                                                       }
{*******************************************************}

unit CorbInit;

{$DENYPACKAGEUNIT}

interface

implementation

uses SysUtils, CorbaObj;

var
  SaveInitProc: Pointer = nil;

procedure InitCorba;
begin
  CorbaInitialize;
  if SaveInitProc <> nil then TProcedure(SaveInitProc);
end;

initialization
  if not IsLibrary then
  begin
    SaveInitProc := InitProc;
    InitProc := @InitCorba;
  end;

end.
