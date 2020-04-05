{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit System.DebugUtils;

interface

                          
                                                  
                          

//type
//  DebugCode = class(TCustomAttribute)
//  end;

//[DebugCode]
///
///  Conditionally outputs a formatted string to the debugging output.  The condition
///  is controlled by the environment variable <code>DEBUG_CLASS</code>.
procedure DebugPrint(Cond: string; Fmt: string; const Args: array of const); overload;
//[DebugCode]
procedure DebugPrint(Cond: string; Fmt: string); overload

implementation

uses System.Generics.Collections, System.SysUtils, System.StrUtils;

const
{$IFDEF MACOS}
  EnvSeparator: string = ':';
{$ENDIF MACOS}
{$IFDEF LINUX}
  EnvSeparator: string = ':';
{$ENDIF LINUX}
{$IFDEF MSWINDOWS}
  EnvSeparator: string = ';';
{$ENDIF MSWINDOWS}

var
  EnabledConditionMap: TDictionary<string, Boolean>;
  UnenabledConditionMap: TDictionary<string, Boolean>;
  DEBUG_CLASS: TArray<string>;

procedure ParseEnv(Env: string);
begin
  SetLength(DEBUG_CLASS, 2);
  DEBUG_CLASS := TArray<string>(SplitString(Env, EnvSeparator));
//  DEBUG_CLASS := TArray<string>.Create;
end;

///
///  Compares a category to a condition.  If the strings are identical, we
///  return True.  If the strings are not, we look for wildcards in the category.
///  If we find one, we match the strings up to that point.  If they match,
///  we're done, and we return True.  Otherwise we return False.<p>
///
///  Examples:
///  Cond = a.b.c Category = a.b.c.d -> False
///  Cond = a.b.c Category = a.b.c -> True
///  Cond = a.b.c Category = a.b.* -> True
///  Cond = a.b.c Category = a.* -> True
///  Cond = a.blueberry.c Category = a.blue* -> True
///  Cond = a.blueberry.c Category = a.blueberry -> False
function SubMatch(Cond: string; Category: string): Boolean;
var
  P: Integer;
  I: Integer;
begin
  Result := False;
  if Cond = Category then
    Exit(True);
  P := Pos('*', Category);
  // a.b.c vs x.y.nn*
  if P > 0 then
  begin
    if P > Length(Cond) - 1 then
      Exit(False);
    for I:= 1 to P - 1 do
      if Cond[I] <> Category[I] then
        Exit(False);
    Exit(True);
  end;
end;

function Match(Cond: string): Boolean;
var
  S: string;
begin
  Result := False;
  for S in DEBUG_CLASS do
    if SubMatch(Cond, S) then
      Exit(True);
end;

                                            
function CheckDebugClass(Cond: string): Boolean;
begin
  if (EnabledConditionMap.ContainsKey(Cond)) then
    Exit(True);
  if (UnenabledConditionMap.ContainsKey(Cond)) then
    Exit(False);
//  Exit(False);
  if Match(Cond) then
  begin
    Result := True;
    EnabledConditionMap.Add(Cond, True);
  end
  else
  begin
    Result := False;
    UnenabledConditionMap.Add(Cond, True);
  end;
end;

procedure DebugPrint(Cond: string; Fmt: string; const Args: array of const); overload;
begin
  if not CheckDebugClass(Cond) then Exit;
  Write(Cond + ': ');
  Writeln(Format(Fmt, Args));
end;

procedure DebugPrint(Cond: string; Fmt: string); overload
begin
  if not CheckDebugClass(Cond) then Exit;
  Writeln(Cond + ': ' + Fmt);
end;

initialization
  EnabledConditionMap := TDictionary<string, Boolean>.Create;
  UnenabledConditionMap := TDictionary<string, Boolean>.Create;
  ParseEnv(GetEnvironmentVariable('DEBUG_CLASS'));

finalization
  EnabledConditionMap.Free;
  UnenabledConditionMap.Free;

end.
