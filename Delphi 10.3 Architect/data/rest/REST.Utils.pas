{*******************************************************}
{                                                       }
{             Delphi REST Client Framework              }
{                                                       }
{ Copyright(c) 2013-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
{$HPPEMIT LINKUNIT}
unit REST.Utils;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Character;

type
  TRESTFindDefaultComponent = class
  public
    class function FindDefaultT<T: TComponent>(AComp: TComponent): T;
    class function FindDefaultIntfT<T: IInterface>(AComp: TComponent): T;
    class procedure FindAllT<T: TComponent>(AComp: TComponent; ACallback: TProc<T>); overload;
  end;


// This URIEncode variant implements an encoding as specified by OAuth mechanisms
function URIEncode(const S: string): string;

procedure ExtractURLSegmentNames(const AUrl: string; AParams: TStrings);
procedure ExtractGetParams(const AUrl: string; var AParams: TStrings);

function RESTComponentIsDesigning(AComp: TComponent): boolean;

implementation

uses
  System.TypInfo, System.NetEncoding;

function URIEncode(const S: string): string;
const
  RestUnsafeChars: TURLEncoding.TUnsafeChars = [Ord('"'), Ord(''''), Ord(':'), Ord(';'), Ord('<'), Ord('='), Ord('>'),
    Ord('@'), Ord('['), Ord(']'), Ord('^'), Ord('`'), Ord('{'), Ord('}'), Ord('|'), Ord('/'), Ord('\'), Ord('?'), Ord('#'),
    Ord('&'), Ord('!'), Ord('$'), Ord('('), Ord(')'), Ord(','), Ord('~'), Ord(' '), Ord('*'), Ord('+')];
begin
  Result := TNetEncoding.URL.Encode(S, RestUnsafeChars, [TURLEncoding.TEncodeOption.EncodePercent]);
end;

function RESTComponentIsDesigning(AComp: TComponent): boolean;
begin
  result := ([csDesigning, csLoading] * AComp.ComponentState = [csDesigning]) and
    ((AComp.Owner = nil) or ([csDesigning, csLoading] * AComp.Owner.ComponentState = [csDesigning]));
end;

procedure ExtractURLSegmentNames(const AUrl: string; AParams: TStrings);
var
  LIndex: integer;
  LResource: string;
  LName: string;
begin
  LResource := AUrl;
  LIndex := LResource.IndexOf('{');
  while (LIndex >= 0) do
  begin
    LResource := LResource.Substring(LIndex + 1);
    LIndex := LResource.IndexOf('}');
    if (LIndex >= 0) then
    begin
      LName := LResource.Substring(0, LIndex);
      if (LName <> '') and (AParams.IndexOf(LName) < 0) then
        AParams.Add(LName);
      LResource := LResource.Substring(LIndex + 1);
      LIndex := LResource.IndexOf('{');
    end;
  end;
end;

procedure ExtractGetParams(const AUrl: string; var AParams: TStrings);
var
  LTokenPos: integer;
  LParams: string;
begin
  LParams := AUrl;

  // absolute URI - remove the protocol
  LTokenPos := Pos('://', LParams); { Do not Localize }
  if LTokenPos > 0 then
    Delete(LParams, 1, LTokenPos + 2);

  // separate the path from the parameters
  LTokenPos := Pos('?', LParams); { Do not Localize }
  if LTokenPos > 0 then
    LParams := Copy(LParams, LTokenPos + 1, MaxInt);

  // separate the bookmark from the parameters
  LTokenPos := Pos('#', LParams); { Do not Localize }
  if LTokenPos > 0 then
    LParams := Copy(LParams, 1, LTokenPos - 1);

  AParams := TStringList.Create;
  AParams.NameValueSeparator := '=';
  AParams.Delimiter := '&';
  AParams.DelimitedText := LParams;
end;

class function TRESTFindDefaultComponent.FindDefaultT<T>(AComp: TComponent): T;
var
  I: Integer;
  LRoot: TComponent;
begin
  Result := nil;
  LRoot := AComp;
  if (LRoot <> nil) and (LRoot.Owner <> nil) then
    LRoot := LRoot.Owner;
  if LRoot <> nil then
    for I := 0 to LRoot.ComponentCount - 1 do
      if LRoot.Components[I] is T then
        if not Assigned(Result) then
          Result := T(LRoot.Components[I])
        else
          Exit(nil);
end;

class function TRESTFindDefaultComponent.FindDefaultIntfT<T>(AComp: TComponent): T;
var
  I: Integer;
  LRoot: TComponent;
  LGuid: TGuid;
  LIntf: T;
begin
  LGuid := GetTypeData(TypeInfo(T)).Guid;
  Result := nil;
  LRoot := AComp;
  if (LRoot <> nil) and (LRoot.Owner <> nil) then
    LRoot := LRoot.Owner;
  if LRoot <> nil then
    for I := 0 to LRoot.ComponentCount - 1 do
      if Supports(LRoot.Components[I], LGuid, LIntf) then
        if not Assigned(Result) then
          Result := LIntf
        else
          Exit(nil);
end;

class procedure TRESTFindDefaultComponent.FindAllT<T>(AComp: TComponent; ACallback: TProc<T>);
var
  I: Integer;
  LRoot: TComponent;
begin
  LRoot := AComp;
  if (LRoot <> nil) and (LRoot.Owner <> nil) then
    LRoot := LRoot.Owner;
  if LRoot <> nil then
    for I := 0 to LRoot.ComponentCount - 1 do
      if LRoot.Components[I] is T then
        ACallback(T(LRoot.Components[I]));
end;

end.
