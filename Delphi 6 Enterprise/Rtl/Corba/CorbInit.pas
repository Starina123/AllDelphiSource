{ *********************************************************************** }
{                                                                         }
{ Delphi Runtime Library                                                  }
{                                                                         }
{ Copyright (c) 1999-2001 Borland Software Corporation                    }
{                                                                         }
{ *********************************************************************** }

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
