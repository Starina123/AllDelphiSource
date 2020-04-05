unit WinAPI.HSTRINGIterables;

interface

uses
  System.Win.WinRT, WinAPI.CommonTypes, System.Generics.Collections,
  WinAPI.WinRT;

type
  THSTRINGList = class(TList<HSTRING>)
  public
    procedure AddAsCopy(const AHSTRING: HSTRING);
  end;

  TIterableHSTRING = class(TInspectableObject, IIterable_1__HSTRING)
  private
    FList: THSTRINGList;
  public
    constructor Create;
    destructor Destroy; override;
    function First: IIterator_1__HSTRING; safecall;
    procedure Add(AValue: HSTRING);
  end;

  TIteratorHSTRING = class(TInspectableObject, IIterator_1__HSTRING)
  private
    FList: THSTRINGList;
    FIndex: Integer;
  public
    constructor Create(const AListOfHSTRING: THSTRINGList);
    destructor Destroy; override;
    function MoveNext: Boolean; safecall;
    function get_Current: HSTRING; safecall;
    function get_HasCurrent: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHSTRING): Cardinal; safecall;
  end;

function CreateHSTRING(const S: string): HSTRING;
function CreateHSTRINGRef(var S: string): HSTRING;
function HSTRINGToString(const hs: HSTRING): string;
function HSTRINGIsNullOrEmpty(const hs: HSTRING): Boolean;
procedure DeleteHSTRING(const hs: HSTRING);

implementation

uses
  System.SysUtils, WinAPI.Windows, System.Classes;

resourcestring
  StrCannotCreateHSTRING = 'Cannot create HSTRING';
  StrCannotCreateHSTRINGRef = 'Cannot create HSTRINGRef';
  StrCannotDeleteHSTRING = 'Cannot delete HSTRING';
  StrCannotCopyHSTRING = 'Cannot copy HSTRING';
  StrNotImplemented = 'Not Implemented';

function CreateHSTRING(const S: string): HSTRING;
begin
  if not Succeeded(WindowsCreateString(PChar(S), System.Length(S), Result)) then
    raise Exception.Create(StrCannotCreateHSTRING);
end;

function CreateHSTRINGRef(var S: string): HSTRING;
var
  P: HSTRING_HEADER;
begin
  if not Succeeded(WindowsCreateStringReference(PChar(S), System.Length(S), P, Result)) then
    raise Exception.Create(StrCannotCreateHSTRINGRef);
end;

function HSTRINGToString(const hs: HSTRING): string;
begin
  Result := WindowsGetStringRawBuffer(hs, nil);
end;

function HSTRINGIsNullOrEmpty(const hs: HSTRING): Boolean;
begin
  Result := WindowsIsStringEmpty(hs);
end;

procedure DeleteHSTRING(const hs: HSTRING);
begin
  if not Succeeded(WindowsDeleteString(hs)) then
    raise Exception.Create(StrCannotDeleteHSTRING);
end;

{ TIterableHSTRING }

procedure TIterableHSTRING.Add(AValue: HSTRING);
begin
  FList.Add(AValue);
end;

constructor TIterableHSTRING.Create;
begin
  inherited;
  FList := THSTRINGList.Create;
end;

destructor TIterableHSTRING.Destroy;
begin
  inherited;
end;

function TIterableHSTRING.First: IIterator_1__HSTRING;
begin
  Result := TIteratorHSTRING.Create(FList);
end;

{ TIteratorHSTRING }

constructor TIteratorHSTRING.Create(const AListOfHSTRING: THSTRINGList);
var
  lHSTRING, lOutHSTRING: HSTRING;
begin
  inherited Create;
  FList := THSTRINGList.Create;
  for lHSTRING in AListOfHSTRING do
  begin
    if not Succeeded(WindowsDuplicateString(lHSTRING, lOutHSTRING)) then
      raise Exception.Create(StrCannotCopyHSTRING);
    FList.Add(lOutHSTRING);
  end;
  FIndex := 0;
end;

destructor TIteratorHSTRING.Destroy;
begin
  FList.Free;
  inherited;
end;

function TIteratorHSTRING.GetMany(itemsSize: Cardinal; items: PHSTRING): Cardinal;
begin
  raise Exception.Create(StrNotImplemented);
end;

function TIteratorHSTRING.get_Current: HSTRING;
begin
  Result := FList[FIndex];
end;

function TIteratorHSTRING.get_HasCurrent: Boolean;
begin
  Result := FIndex < FList.Count;
end;

function TIteratorHSTRING.MoveNext: Boolean;
begin
  Result := FIndex < (FList.Count - 1);
  if Result then
    Inc(FIndex);
end;

{ THSTRINGList }

procedure THSTRINGList.AddAsCopy(const AHSTRING: HSTRING);
var
  lOutHSTRING: HSTRING;
begin
  if not Succeeded(WindowsDuplicateString(AHSTRING, lOutHSTRING)) then
    raise Exception.Create(StrCannotCopyHSTRING);
  Add(lOutHSTRING);
end;

end.
