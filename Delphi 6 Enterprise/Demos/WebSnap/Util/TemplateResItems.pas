unit TemplateResItems;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Contnrs, SyncObjs;

type

  TTemplateResources = class;

  TTemplateResourceItem = class
  private
    FName: string;
    FTemplate: PChar;
    FTemplateLength: Integer;
    FType: PChar;
    FOwner: TTemplateResources;
    function GetTemplate: PChar;
    function GetTemplateLength: Integer;
  public
    constructor Create(AOwner: TTemplateResources; const AName: string; AType: PChar);
    destructor Destroy; override;
    property Name: string read FName;
    property Template: PChar read GetTemplate;
    property TemplateLength: Integer read GetTemplateLength;
    property ResType: PChar read FType;
  end;

  TTemplateResources = class(TObject)
  private
    FCriticalSection: TCriticalSection;
    FItems: TObjectList;
    FResInstance: THandle;
    procedure Lock;
    procedure Unlock;
    function GetItemCount: Integer;
    function GetItem(I: Integer): TTemplateResourceItem;
  public
    constructor Create(AHInstance: LongWord);
    destructor Destroy; override;
    procedure Add(const AResName: string; AType: PChar);
    function IndexOfItem(const AResName: string): Integer;
    function FindItem(const AResName: string): TTemplateResourceItem;
    property ResInstance: THandle read FResInstance;
    property ItemCount: Integer read GetItemCount;
    property Items[I: Integer]: TTemplateResourceItem read GetItem;
  end;

  TTemplateResourceItemStream = class(TCustomMemoryStream)
  public
    constructor Create(AItem: TTemplateResourceItem);
    function Write(const Buffer; Count: Longint): Longint; override;
  end;

  function TemplateFileStreamFromResource(ATemplateResources: TTemplateResources; const AFileName: string; var AStream: TStream; var AOwned: Boolean): Boolean;
  function EnumResourceNamesCallback(hModule: HMODULE; lpType, lpName: PAnsiChar;
    lParam: Longint): BOOL; stdcall; export;

const
  RT_HTML = MakeIntResource(23);
  RT_XSL = MakeIntResource(24);

implementation

function TemplateFileStreamFromResource(ATemplateResources: TTemplateResources; const AFileName: string; var AStream: TStream; var AOwned: Boolean): Boolean;
var
  ResourceItem: TTemplateResourceItem;
begin
  ResourceItem := ATemplateResources.FindItem(ChangeFileExt(ExtractFileName(AFileName), ''));
  if ResourceItem <> nil then
  begin
    AStream := TTemplateResourceItemStream.Create(ResourceItem);
    AOwned := True;
    Result := True;
  end
  else
  begin
    raise Exception.CreateFmt('Resource not found for file: %s', [AFileName]);
    Result := False;
  end;
end;

function EnumResourceNamesCallback(hModule: HMODULE; lpType, lpName: PAnsiChar;
    lParam: Longint): BOOL;
var
  S: TStrings;
begin
  S := TStrings(lParam);
  S.Add(lpName);
  Result := True;
end;

{ TTemplateResources }

procedure TTemplateResources.Add(const AResName: string; AType: PChar);
begin
  FItems.Add(TTemplateResourceItem.Create(Self, AResName, AType));
end;

constructor TTemplateResources.Create(AHInstance: LongWord);
var
  S: TStrings;
  I: Integer;
begin
  inherited Create;
  FItems := TObjectList.Create(True {Owned} );
  FCriticalSection := TCriticalSection.Create;
  FResInstance := FindResourceHInstance(AHInstance);
  S := TStringList.Create;
  try
    EnumResourceNames(FResInstance, RT_HTML, @EnumResourceNamesCallback, Integer(Pointer(S)));
    for I := 0 to S.Count - 1 do
       Add(S[I], RT_HTML);
    S.Clear;
    EnumResourceNames(FResInstance, RT_XSL, @EnumResourceNamesCallback, Integer(Pointer(S)));
    for I := 0 to S.Count - 1 do
       Add(S[I], RT_XSL);
  finally
    S.Free;
  end;
end;

destructor TTemplateResources.Destroy;
begin
  FCriticalSection.Free;
  FItems.Free;
  inherited Destroy;
end;

function TTemplateResources.FindItem(
  const AResName: string): TTemplateResourceItem;
var
  I: Integer;
begin
  I := IndexOfItem(AResName);
  if I >= 0 then
    Result := Items[I]
  else
    Result := nil;
end;

function TTemplateResources.GetItem(I: Integer): TTemplateResourceItem;
begin
  Result := TTemplateResourceItem(FItems[I]);
end;

function TTemplateResources.GetItemCount: Integer;
begin
  Result := FItems.Count;
end;

function TTemplateResources.IndexOfItem(const AResName: string): Integer;
var
  I: Integer;
begin
  for I := 0 to ItemCount - 1 do
  begin
    if CompareText(Items[I].Name, AResName) = 0 then
    begin
      Result := I;
      Exit;
    end;
  end;
  Result := -1;
end;

procedure TTemplateResources.Lock;
begin
  FCriticalSection.Enter;
end;

procedure TTemplateResources.Unlock;
begin
  FCriticalSection.Leave;
end;

{ TTemplateResourceItem }

constructor TTemplateResourceItem.Create(AOwner: TTemplateResources; const AName: string;
  AType: PChar);
begin
  FOwner := AOwner;
  FName := AName;
  FType := AType;
end;

destructor TTemplateResourceItem.Destroy;
begin
  inherited;
  if FTemplate <> nil then
    StrDispose(FTemplate);
end;

function TTemplateResourceItem.GetTemplate: PChar;
var
  hResInfo: HRSRC;
  P: PChar;
begin
  if FTemplate = nil then
  begin
    FOwner.Lock;
    try
      hResInfo := FindResource(FOwner.ResInstance, PChar(FName), FType);
      if hResInfo <> 0 then
      begin
        FTemplateLength := SizeofResource(FOwner.ResInstance, hResInfo);
        P := PChar(LockResource(LoadResource(FOwner.ResInstance,
          hResInfo)));
        FTemplate := StrMove(StrAlloc(FTemplateLength+1), P, FTemplateLength);
        FTemplate[FTemplateLength] := Char(0);
      end;
    finally
      FOwner.Unlock;
    end;
  end;
  Result := FTemplate;
end;

function TTemplateResourceItem.GetTemplateLength: Integer;
begin
  GetTemplate;
  Result := FTemplateLength;
end;

{ TTemplateResourceItemStream }

constructor TTemplateResourceItemStream.Create(AItem: TTemplateResourceItem);
begin
  SetPointer(AItem.Template, AItem.TemplateLength);
  inherited Create;
end;

function TTemplateResourceItemStream.Write(const Buffer;
  Count: Integer): Longint;
begin
  // Write not supported
  Assert(False);
  Result := 0;
end;

end.
