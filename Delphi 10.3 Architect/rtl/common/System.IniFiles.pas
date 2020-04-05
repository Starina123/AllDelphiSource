{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit System.IniFiles;

{$R-,T-,H+,X+}

interface
{$HPPEMIT LEGACYHPP}

uses
  System.SysUtils, System.Classes, System.Generics.Collections;

type
  EIniFileException = class(Exception);

  TCustomIniFile = class(TObject)
  private
    FFileName: string;
  protected
    const SectionNameSeparator: string = '\';
    procedure InternalReadSections(const Section: string; Strings: TStrings;
      SubSectionNamesOnly, Recurse: Boolean); virtual;
  public
    constructor Create(const FileName: string);
    function SectionExists(const Section: string): Boolean; virtual;
    function ReadString(const Section, Ident, Default: string): string; virtual; abstract;
    procedure WriteString(const Section, Ident, Value: String); virtual; abstract;
    function ReadInteger(const Section, Ident: string; Default: Integer): Integer; virtual;
    procedure WriteInteger(const Section, Ident: string; Value: Integer); virtual;
    function ReadBool(const Section, Ident: string; Default: Boolean): Boolean; virtual;
    procedure WriteBool(const Section, Ident: string; Value: Boolean); virtual;
    function ReadBinaryStream(const Section, Name: string; Value: TStream): Integer; virtual;
    function ReadDate(const Section, Name: string; Default: TDateTime): TDateTime; virtual;
    function ReadDateTime(const Section, Name: string; Default: TDateTime): TDateTime; virtual;
    function ReadFloat(const Section, Name: string; Default: Double): Double; virtual;
    function ReadTime(const Section, Name: string; Default: TDateTime): TDateTime; virtual;
    procedure WriteBinaryStream(const Section, Name: string; Value: TStream); virtual;
    procedure WriteDate(const Section, Name: string; Value: TDateTime); virtual;
    procedure WriteDateTime(const Section, Name: string; Value: TDateTime); virtual;
    procedure WriteFloat(const Section, Name: string; Value: Double); virtual;
    procedure WriteTime(const Section, Name: string; Value: TDateTime); virtual;
    procedure ReadSection(const Section: string; Strings: TStrings); virtual; abstract;
    procedure ReadSections(Strings: TStrings); overload; virtual; abstract;
    procedure ReadSections(const Section: string; Strings: TStrings); overload; virtual;
    procedure ReadSubSections(const Section: string; Strings: TStrings; Recurse: Boolean = False); virtual;
    procedure ReadSectionValues(const Section: string; Strings: TStrings); virtual; abstract;
    procedure EraseSection(const Section: string); virtual; abstract;
    procedure DeleteKey(const Section, Ident: String); virtual; abstract;
    procedure UpdateFile; virtual; abstract;
    function ValueExists(const Section, Ident: string): Boolean; virtual;
    property FileName: string read FFileName;
  end;

  { TStringHash - used internally by TMemIniFile to optimize searches. }

  TStringHash = class
  private type
    THashItem = record
      Key: string;
      Value: Integer;
    end;
  private
    Buckets: array of TList<THashItem>;
  protected
    function Find(const Key: string; var AItem:THashItem): Integer;
    function HashOf(const Key: string): Cardinal; virtual;
  public
    constructor Create(Size: Cardinal = 256);
    destructor Destroy; override;
    procedure Add(const Key: string; Value: Integer);
    procedure Clear;
    procedure Remove(const Key: string);
    function Modify(const Key: string; Value: Integer): Boolean;
    function ValueOf(const Key: string): Integer;
  end;

  { THashedStringList - A TStringList that uses TStringHash to improve the speed of Find }
  THashedStringList = class(TStringList)
  private
    FValueHash: TStringHash;
    FNameHash: TStringHash;
    FValueHashValid: Boolean;
    FNameHashValid: Boolean;
    procedure UpdateValueHash;
    procedure UpdateNameHash;
    function PrepareString(const S: string): string;
  protected
    procedure Changed; override;
  public
    destructor Destroy; override;
    function IndexOf(const S: string): Integer; override;
    function IndexOfName(const Name: string): Integer; override;
  end;

  { TMemIniFile - loads an entire INI file into memory and allows all operations to be performed on the memory image.
    The image can then be written out to the disk file }

  TMemIniFile = class(TCustomIniFile)
  private type
    TDictionaryList = class (TObject)
    private
      FItems: TStringList;
      FItemsDict: TDictionary<string, Integer>;
      function GetCount: Integer; inline;
      function GetCaseSensitive: Boolean; inline;
      procedure SetCaseSensitive(const Value: Boolean);
      function GetUseLocale: Boolean; inline;
      procedure SetUseLocale(const Value: Boolean);
      procedure SettingsChanged(const CaseSensitive, UseLocale: Boolean);
    protected
      function PrepareString(const Value: string): string;
      procedure AllocDictionary;
    public
      constructor Create(CaseSensitive, UseLocale: Boolean);
      destructor Destroy; override;
      procedure Clear;
      function Remove(const Key: string): Boolean;
      property Count: Integer read GetCount;
      property CaseSensitive: Boolean read GetCaseSensitive write SetCaseSensitive;
      property UseLocale: Boolean read GetUseLocale write SetUseLocale;
    end;

    TSection = class (TDictionaryList)
    private
      function GetPairs(Index: Integer): string; inline;
      function GetNames(Index: Integer): string; inline;
      function GetValues(Index: Integer): string; inline;
      procedure SetValues(Index: Integer; const Value: string);
      function GetIsNulls(Index: Integer): Boolean; inline;
    public
      function Find(const Key: string): Integer;
      procedure Add(const Key, Value: string);
      procedure AddNoValue(const Key: string);
      function Remove(const Key: string): Boolean;
      property Pairs[Index: Integer]: string read GetPairs;
      property Names[Index: Integer]: string read GetNames;
      property IsNulls[Index: Integer]: Boolean read GetIsNulls;
      property Values[Index: Integer]: string read GetValues write SetValues;
    end;

    TSections = class (TDictionaryList)
    private
      function GetNames(Index: Integer): string; inline;
      function GetSections(Index: Integer): TSection; inline;
    public
      constructor Create(CaseSensitive, UseLocale: Boolean);
      function Find(const Section: string): TSection;
      function Add(const Section: string): TSection;
      property Names[Index: Integer]: string read GetNames;
      property Sections[Index: Integer]: TSection read GetSections;
    end;
  private
    FStream: TStream;
    FSections: TSections;
    FEncoding: TEncoding;
    FModified: Boolean;
    FAutoSave: Boolean;
    function GetCaseSensitive: Boolean;
    procedure LoadValues;
    procedure SetCaseSensitive(Value: Boolean);
    function GetUseLocale: Boolean;
    procedure SetUseLocale(const Value: Boolean);
  public
    constructor Create(const FileName: string); overload;
    constructor Create(const FileName: string; const Encoding: TEncoding); overload;
    /// <summary> Creates new TMemIniFile instance with initially specified
    ///  FileName, Encoding and CaseSensitive property values. Which will be
    ///  used to load the file content. </summary>
    constructor Create(const FileName: string; const Encoding: TEncoding;
      CaseSensitive: Boolean); overload;
    constructor Create(const FileName: string; const Encoding: TEncoding;
      CaseSensitive, UseLocale: Boolean); overload; virtual;
    constructor Create(Stream: TStream; const Encoding: TEncoding = nil;
      CaseSensitive: Boolean = False; UseLocale: Boolean = True); overload; virtual;
    destructor Destroy; override;
    procedure Clear;
    procedure DeleteKey(const Section, Ident: String); override;
    procedure EraseSection(const Section: string); override;
    procedure GetStrings(const List: TStrings);
    procedure ReadSection(const Section: string; Strings: TStrings); override;
    procedure ReadSections(Strings: TStrings); override;
    procedure ReadSectionValues(const Section: string; Strings: TStrings); override;
    function ReadString(const Section, Ident, Default: string): string; override;
    procedure Rename(const FileName: string; Reload: Boolean);
    procedure SetStrings(const List: TStrings);
    procedure UpdateFile; override;
    procedure WriteString(const Section, Ident, Value: String); override;
    function ValueExists(const Section, Ident: string): Boolean; override;
    function SectionExists(const Section: string): Boolean; override;
    property CaseSensitive: Boolean read GetCaseSensitive write SetCaseSensitive;
    property UseLocale: Boolean read GetUseLocale write SetUseLocale;
    property Encoding: TEncoding read FEncoding write FEncoding;
    /// <summary> Returns True if the content was modified after loading the file
    ///  or after last UpdateFile call. Property may be set manually to control
    ///  automatic file saving when AutoSave is True. </summary>
    property Modified: Boolean read FModified write FModified;
    /// <summary> When value is True, then content will be automatically
    ///  saved in specified file at destruction, if content was modified.
    ///  When value is False, then content will be not automatically saved.
    ///  To save the content use UpdateFile method. </summary>
    property AutoSave: Boolean read FAutoSave write FAutoSave;
    property Stream: TStream read FStream write FStream;
  end;

{$IFDEF MSWINDOWS}
  { TIniFile - Encapsulates the Windows INI file interface (Get/SetPrivateProfileXXX functions) }

  TIniFile = class(TCustomIniFile)
  public
    destructor Destroy; override;
    function ReadString(const Section, Ident, Default: string): string; override;
    procedure WriteString(const Section, Ident, Value: String); override;
    procedure ReadSection(const Section: string; Strings: TStrings); override;
    procedure ReadSections(Strings: TStrings); override;
    procedure ReadSectionValues(const Section: string; Strings: TStrings); override;
    procedure EraseSection(const Section: string); override;
    procedure DeleteKey(const Section, Ident: String); override;
    procedure UpdateFile; override;
  end;
{$ELSE}
  TIniFile = class(TMemIniFile)
  public
    constructor Create(const FileName: string; const Encoding: TEncoding;
      CaseSensitive, UseLocale: Boolean); overload; override;
  end;
{$ENDIF}


implementation

uses
{$IFDEF MSWINDOWS}
  Winapi.Windows,
{$ENDIF}
  System.IOUtils, System.RTLConsts;

{ TCustomIniFile }

constructor TCustomIniFile.Create(const FileName: string);
begin
  FFileName := FileName;
end;

function TCustomIniFile.SectionExists(const Section: string): Boolean;
var
  S: TStrings;
begin
  S := TStringList.Create;
  try
    ReadSection(Section, S);
    Result := S.Count > 0;
  finally
    S.Free;
  end;
end;

function TCustomIniFile.ReadInteger(const Section, Ident: string; Default: Integer): Integer;
var
  IntStr: string;
begin
  IntStr := ReadString(Section, Ident, '');
  if (IntStr.Length > 2) and (IntStr.StartsWith('0x',true)) then
    IntStr := '$' + IntStr.Substring( 2);
  Result := StrToIntDef(IntStr, Default);
end;

procedure TCustomIniFile.WriteInteger(const Section, Ident: string; Value: Integer);
begin
  WriteString(Section, Ident, IntToStr(Value));
end;

function TCustomIniFile.ReadBool(const Section, Ident: string;
  Default: Boolean): Boolean;
begin
  Result := ReadInteger(Section, Ident, Ord(Default)) <> 0;
end;

function TCustomIniFile.ReadDate(const Section, Name: string; Default: TDateTime): TDateTime;
var
  DateStr: string;
begin
  DateStr := ReadString(Section, Name, '');
  Result := Default;
  if DateStr <> '' then
  try
    Result := StrToDate(DateStr);
  except
    on EConvertError do
      // Ignore EConvertError exceptions
    else
      raise;
  end;
end;

function TCustomIniFile.ReadDateTime(const Section, Name: string; Default: TDateTime): TDateTime;
var
  DateStr: string;
begin
  DateStr := ReadString(Section, Name, '');
  Result := Default;
  if DateStr <> '' then
  try
    Result := StrToDateTime(DateStr);
  except
    on EConvertError do
      // Ignore EConvertError exceptions
    else
      raise;
  end;
end;

function TCustomIniFile.ReadFloat(const Section, Name: string; Default: Double): Double;
var
  FloatStr: string;
begin
  FloatStr := ReadString(Section, Name, '');
  Result := Default;
  if FloatStr <> '' then
  try
    Result := StrToFloat(FloatStr);
  except
    on EConvertError do
      // Ignore EConvertError exceptions
    else
      raise;
  end;
end;

function TCustomIniFile.ReadTime(const Section, Name: string; Default: TDateTime): TDateTime;
var
  TimeStr: string;
begin
  TimeStr := ReadString(Section, Name, '');
  Result := Default;
  if TimeStr <> '' then
  try
    Result := StrToTime(TimeStr);
  except
    on EConvertError do
      // Ignore EConvertError exceptions
    else
      raise;
  end;
end;

procedure TCustomIniFile.WriteDate(const Section, Name: string; Value: TDateTime);
begin
  WriteString(Section, Name, DateToStr(Value));
end;

procedure TCustomIniFile.WriteDateTime(const Section, Name: string; Value: TDateTime);
begin
  WriteString(Section, Name, DateTimeToStr(Value));
end;

procedure TCustomIniFile.WriteFloat(const Section, Name: string; Value: Double);
begin
  WriteString(Section, Name, FloatToStr(Value));
end;

procedure TCustomIniFile.WriteTime(const Section, Name: string; Value: TDateTime);
begin
  WriteString(Section, Name, TimeToStr(Value));
end;

procedure TCustomIniFile.WriteBool(const Section, Ident: string; Value: Boolean);
const
  Values: array[Boolean] of string = ('0', '1');
begin
  WriteString(Section, Ident, Values[Ord(Value) <> 0]);
end;

function TCustomIniFile.ValueExists(const Section, Ident: string): Boolean;
var
  S: TStrings;
begin
  S := TStringList.Create;
  try
    ReadSection(Section, S);
    Result := S.IndexOf(Ident) > -1;
  finally
    S.Free;
  end;
end;

function TCustomIniFile.ReadBinaryStream(const Section, Name: string; Value: TStream): Integer;
var
  Text: string;
  Stream: TMemoryStream;
  Pos: Integer;
  dataLen: Integer;
  DataBytes: TBytes;
begin
  Text := ReadString(Section, Name, '');
  if Text <> '' then
  begin
    if Value is TMemoryStream then
      Stream := TMemoryStream(Value)
    else
      Stream := TMemoryStream.Create;

    try
      dataLen := Length(Text) div 2;
      SetLength(DataBytes, dataLen);
      Pos := Stream.Position;
      HexToBin(BytesOf(Text), 0, DataBytes, 0, dataLen);
      Stream.Write(DataBytes[0], dataLen);
      Stream.Position := Pos;
      if Value <> Stream then
        Value.CopyFrom(Stream, dataLen);
      Result := Stream.Size - Pos;
    finally
      if Value <> Stream then
        Stream.Free;
    end;
  end
  else
    Result := 0;
end;

procedure TCustomIniFile.WriteBinaryStream(const Section, Name: string;
  Value: TStream);
var
  Text: string;
  Stream: TBytesStream;
  Buffer: TBytes;
begin
  SetLength(Text, (Value.Size - Value.Position) * 2);
  if Text.Length > 0 then
  begin
    if Value is TBytesStream then
      Stream := TBytesStream(Value)
    else
      Stream := TBytesStream.Create;

    try
      if Stream <> Value then
      begin
        Stream.CopyFrom(Value, Value.Size - Value.Position);
        Stream.Position := 0;
      end;
      SetLength(Buffer, Stream.Size * 2);
      BinToHex(Stream.Bytes, Stream.Position, Buffer, 0, Stream.Size - Stream.Position);
      Text := StringOf(Buffer);
    finally
      if Value <> Stream then
        Stream.Free;
    end;
  end;
  WriteString(Section, Name, Text);
end;

procedure TCustomIniFile.InternalReadSections(const Section: string; Strings: TStrings;
  SubSectionNamesOnly, Recurse: Boolean);
var
  SLen, SectionLen, SectionEndOfs, I: Integer;
  S, SubSectionName: string;
  AllSections: TStringList;
begin
  AllSections := TStringList.Create;
  try
    ReadSections(AllSections);
    SectionLen := Section.Length;
    // Adjust end offset of section name to account for separator when present.
    SectionEndOfs := (SectionLen) + Integer(SectionLen > 0);
    Strings.BeginUpdate;
    try
      for I := 0 to AllSections.Count - 1 do
      begin
        S := AllSections[I];
        SLen := S.Length;
        if (SectionLen = 0) or
          (SubSectionNamesOnly and (SLen > SectionLen) and SameText(Section, S.SubString( 0, SectionLen))) or
          (not SubSectionNamesOnly and (SLen >= SectionLen) and SameText(Section, S.Substring( 0, SectionLen))) then
        begin
          SubSectionName := S.Substring( SectionEndOfs, SLen + 1 - SectionEndOfs); // +1 to skip '=' ??
          if not Recurse and (SubSectionName.IndexOf(SectionNameSeparator) >= 0) then
            Continue;
          if SubSectionNamesOnly then
            S := SubSectionName;
          Strings.Add(S);
        end;
      end;
    finally
      Strings.EndUpdate;
    end;
  finally
    AllSections.Free;
  end;
end;

procedure TCustomIniFile.ReadSections(const Section: string; Strings: TStrings);
begin
  InternalReadSections(Section, Strings, False, True);
end;

procedure TCustomIniFile.ReadSubSections(const Section: string; Strings: TStrings; Recurse: Boolean = False);
begin
  InternalReadSections(Section, Strings, True, Recurse);
end;

{ TStringHash }

procedure TStringHash.Add(const Key: string; Value: Integer);
var
  Hash: Integer;
  item: THashItem;
begin
  Hash := HashOf(Key) mod Cardinal(Length(Buckets));
  item.Key := Key;
  item.Value := Value;
  Buckets[Hash].Add(item);
end;

procedure TStringHash.Clear;
var
  I: Integer;
begin
  for I := 0 to Length(Buckets) - 1 do
  begin
    Buckets[I].Clear;
  end;
end;

constructor TStringHash.Create(Size: Cardinal);
var
  i:integer;
begin
  inherited Create;
  SetLength(Buckets, Size);
  for i:= 0 to Size-1 do
  begin
    Buckets[i] := TList<THashItem>.Create;
  end;
end;

destructor TStringHash.Destroy;
var
  i:integer;
begin
  Clear;
  for I := 0 to Length(Buckets) - 1 do
  begin
    Buckets[I].Free;
    Buckets[I] := nil;
  end;
  inherited Destroy;
end;

function TStringHash.Find(const Key: string; var AItem: THashItem): Integer;
var
  Hash: Integer;
  pos:Integer;
begin
  Result := -1;
  Hash := HashOf(Key) mod Cardinal(Length(Buckets));
  if Buckets[Hash] <> nil then
  begin
    pos := 0;
    while pos < Buckets[Hash].Count do
    begin
      if Buckets[Hash][pos].Key = Key then
      begin
        Result := pos;
        AItem := Buckets[Hash][pos];
        break;
      end;
      Inc(pos, 1);
    end;
  end;
end;

function TStringHash.HashOf(const Key: string): Cardinal;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to Key.Length - 1 do
    Result := ((Result shl 2) or (Result shr (SizeOf(Result) * 8 - 2))) xor
      Ord(Key.Chars[I]);
end;

function TStringHash.Modify(const Key: string; Value: Integer): Boolean;
var
  Hash: Integer;
  Pos: Integer;
  Item: THashItem;
begin
  Pos := Find(Key, Item);
  if Pos >= 0 then
  begin
    Result := True;
    Hash := HashOf(Key) mod Cardinal(Length(Buckets));
    Item.Value := Value;
    Buckets[Hash].Items[pos] := Item;
  end
  else
    Result := False;
end;

procedure TStringHash.Remove(const Key: string);
var
  Hash: Integer;
  Item: THashItem;
  Pos:Integer;
begin
  Pos := Find(Key, Item);
  if Pos >= 0 then
  begin
    Hash := HashOf(Key) mod Cardinal(Length(Buckets));
    Buckets[Hash].Delete(Pos);
  end;
end;

function TStringHash.ValueOf(const Key: string): Integer;
var
  Item: THashItem;
  Pos:Integer;
begin
  Pos := Find(Key, Item);
  if Pos >= 0 then
    Result := Item.Value
  else
    Result := -1;
end;

{ THashedStringList }

procedure THashedStringList.Changed;
begin
  inherited Changed;
  FValueHashValid := False;
  FNameHashValid := False;
end;

destructor THashedStringList.Destroy;
begin
  FValueHash.Free;
  FNameHash.Free;
  inherited Destroy;
end;

function THashedStringList.PrepareString(const S: string): string;
begin
  if CaseSensitive then
    Result := S
  else
    Result := AnsiUpperCase(S);
end;

function THashedStringList.IndexOf(const S: string): Integer;
begin
  UpdateValueHash;
  Result := FValueHash.ValueOf(PrepareString(S));
end;

function THashedStringList.IndexOfName(const Name: string): Integer;
begin
  UpdateNameHash;
  Result := FNameHash.ValueOf(PrepareString(Name));
end;

procedure THashedStringList.UpdateNameHash;
var
  I: Integer;
  P: Integer;
  Key: string;
begin
  if FNameHashValid then Exit;

  if FNameHash = nil then
    FNameHash := TStringHash.Create
  else
    FNameHash.Clear;
  for I := 0 to Count - 1 do
  begin
    Key := Get(I);
    P := Key.IndexOf(NameValueSeparator);
    if P >= 0 then
    begin
      Key := PrepareString(Key.SubString(0, P));
      FNameHash.Add(Key, I);
    end;
  end;
  FNameHashValid := True;
end;

procedure THashedStringList.UpdateValueHash;
var
  I: Integer;
begin
  if FValueHashValid then Exit;

  if FValueHash = nil then
    FValueHash := TStringHash.Create
  else
    FValueHash.Clear;
  for I := 0 to Count - 1 do
    FValueHash.Add(PrepareString(Self[I]), I);
  FValueHashValid := True;
end;

{ TMemIniFile.TDictionaryList }

constructor TMemIniFile.TDictionaryList.Create(CaseSensitive, UseLocale: Boolean);
begin
  inherited Create;
  FItems := TStringList.Create;
  FItems.CaseSensitive := CaseSensitive;
  FItems.UseLocale := UseLocale;
end;

destructor TMemIniFile.TDictionaryList.Destroy;
begin
  FItemsDict.Free;
  FItems.Free;
  inherited Destroy;
end;

function TMemIniFile.TDictionaryList.PrepareString(const Value: string): string;
begin
  if FItems.CaseSensitive then
    Result := Value
  else if FItems.UseLocale then
    Result := AnsiUpperCase(Value)
  else
    Result := UpperCase(Value);
end;

function TMemIniFile.TDictionaryList.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TMemIniFile.TDictionaryList.GetCaseSensitive: Boolean;
begin
  Result := FItems.CaseSensitive;
end;

procedure TMemIniFile.TDictionaryList.SetCaseSensitive(const Value: Boolean);
begin
  SettingsChanged(Value, UseLocale);
end;

function TMemIniFile.TDictionaryList.GetUseLocale: Boolean;
begin
  Result := FItems.UseLocale;
end;

procedure TMemIniFile.TDictionaryList.SetUseLocale(const Value: Boolean);
begin
  SettingsChanged(CaseSensitive, Value);
end;

procedure TMemIniFile.TDictionaryList.SettingsChanged(const CaseSensitive, UseLocale: Boolean);
var
  I: Integer;
begin
  if (CaseSensitive <> FItems.CaseSensitive) or (UseLocale < FItems.UseLocale) then
  begin
    FItems.CaseSensitive := CaseSensitive;
    FItems.UseLocale := UseLocale;
    for I := 0 to FItems.Count - 1 do
      if (FItems.Objects[I] <> nil) and (FItems.Objects[I] is TDictionaryList) then
        TDictionaryList(FItems.Objects[I]).SettingsChanged(CaseSensitive, UseLocale);
    FreeAndNil(FItemsDict);
    AllocDictionary;
  end;
end;

procedure TMemIniFile.TDictionaryList.AllocDictionary;
var
  I: Integer;
begin
  FItemsDict := TDictionary<string, Integer>.Create(FItems.Count);
  for I := 0 to FItems.Count - 1 do
    FItemsDict.AddOrSetValue(PrepareString(FItems.KeyNames[I]), I);
end;

procedure TMemIniFile.TDictionaryList.Clear;
begin
  FItems.Clear;
  FItemsDict.Clear;
end;

function TMemIniFile.TDictionaryList.Remove(const Key: string): Boolean;
var
  I, J: Integer;
  PrepKey, CurKey: string;
begin
  PrepKey := PrepareString(Key);
  Result := FItemsDict.TryGetValue(PrepKey, I);
  if Result then
  begin
    FItems.Delete(I);
    FItemsDict.Remove(PrepKey);
    if I < FItems.Count then
      for CurKey in FItemsDict.Keys do
      begin
        FItemsDict.TryGetValue(CurKey, J);
        if J > I then
          FItemsDict.AddOrSetValue(CurKey, J - 1);
      end;
  end;
end;

{ TMemIniFile.TSection }
var
  NullObject: TObject = nil;

function TMemIniFile.TSection.GetPairs(Index: Integer): string;
begin
  Result := FItems[Index];
end;

function TMemIniFile.TSection.GetNames(Index: Integer): string;
begin
  Result := FItems.KeyNames[Index];
end;

function TMemIniFile.TSection.GetValues(Index: Integer): string;
begin
  Result := FItems.ValueFromIndex[Index];
end;

procedure TMemIniFile.TSection.SetValues(Index: Integer; const Value: string);
begin
  FItems[Index] := FItems.KeyNames[Index] + FItems.NameValueSeparator + Value;
  FItems.Objects[Index] := nil;
end;

function TMemIniFile.TSection.GetIsNulls(Index: Integer): Boolean;
begin
  Result := FItems.Objects[Index] <> nil;
end;

function TMemIniFile.TSection.Find(const Key: string): Integer;
begin
  if FItemsDict = nil then
    AllocDictionary;
  if not FItemsDict.TryGetValue(PrepareString(Key), Result) then
    Result := -1;
end;

procedure TMemIniFile.TSection.Add(const Key, Value: string);
var
  I: Integer;
begin
  I := FItems.Add(Key + FItems.NameValueSeparator + Value);
  if FItemsDict <> nil then
    FItemsDict.AddOrSetValue(PrepareString(Key), I);
end;

procedure TMemIniFile.TSection.AddNoValue(const Key: string);
var
  I: Integer;
begin
  I := FItems.AddObject(Key, NullObject);
  if FItemsDict <> nil then
    FItemsDict.AddOrSetValue(PrepareString(Key), I);
end;

function TMemIniFile.TSection.Remove(const Key: string): Boolean;
begin
  if FItemsDict = nil then
    AllocDictionary;
  Result := inherited Remove(Key);
end;

{ TMemIniFile.TSections }

constructor TMemIniFile.TSections.Create(CaseSensitive, UseLocale: Boolean);
begin
  inherited Create(CaseSensitive, UseLocale);
  FItems.OwnsObjects := True;
  FItemsDict := TDictionary<string, Integer>.Create;
end;

function TMemIniFile.TSections.GetNames(Index: Integer): string;
begin
  Result := FItems[Index];
end;

function TMemIniFile.TSections.GetSections(Index: Integer): TSection;
begin
  Result := TSection(FItems.Objects[Index]);
end;

function TMemIniFile.TSections.Find(const Section: string): TSection;
var
  I: Integer;
begin
  if FItemsDict.TryGetValue(PrepareString(Section), I) then
    Result := TSection(FItems.Objects[I])
  else
    Result := nil;
end;

function TMemIniFile.TSections.Add(const Section: string): TSection;
var
  I: Integer;
begin
  Result := TSection.Create(FItems.CaseSensitive, FItems.UseLocale);
  I := FItems.AddObject(Section, Result);
  FItemsDict.Add(PrepareString(Section), I);
end;

{ TMemIniFile }

constructor TMemIniFile.Create(const FileName: string);
begin
  Create(Filename, nil, False, True);
end;

constructor TMemIniFile.Create(const FileName: string; const Encoding: TEncoding);
begin
  Create(Filename, Encoding, False, True);
end;

constructor TMemIniFile.Create(const FileName: string;
  const Encoding: TEncoding; CaseSensitive: Boolean);
begin
  Create(Filename, Encoding, CaseSensitive, True);
end;

constructor TMemIniFile.Create(const FileName: string;
  const Encoding: TEncoding; CaseSensitive, UseLocale: Boolean);
begin
  inherited Create(FileName);
  FEncoding := Encoding;
  FSections := TSections.Create(CaseSensitive, UseLocale);
  LoadValues;
end;

constructor TMemIniFile.Create(Stream: TStream; const Encoding: TEncoding;
  CaseSensitive, UseLocale: Boolean);
begin
  inherited Create('');
  FStream := Stream;
  FEncoding := Encoding;
  FSections := TSections.Create(CaseSensitive, UseLocale);
  LoadValues;
end;

destructor TMemIniFile.Destroy;
begin
  if AutoSave and Modified then
    UpdateFile;
  FSections.Free;
  inherited Destroy;
end;

procedure TMemIniFile.Clear;
begin
  Modified := Modified or (FSections.Count > 0);
  FSections.Clear;
end;

procedure TMemIniFile.DeleteKey(const Section, Ident: String);
var
  Strings: TSection;
begin
  Strings := FSections.Find(Section);
  if (Strings <> nil) and Strings.Remove(Ident) then
    Modified := True;
end;

procedure TMemIniFile.EraseSection(const Section: string);
begin
  if FSections.Remove(Section) then
    Modified := True;
end;

function TMemIniFile.GetCaseSensitive: Boolean;
begin
  Result := FSections.CaseSensitive;
end;

procedure TMemIniFile.GetStrings(const List: TStrings);
var
  I, J: Integer;
  Strings: TSection;
begin
  List.BeginUpdate;
  try
    for I := 0 to FSections.Count - 1 do
    begin
      List.Add('[' + FSections.Names[I] + ']');
      Strings := FSections.Sections[I];
      for J := 0 to Strings.Count - 1 do
        List.Add(Strings.Pairs[J]);
      List.Add('');
    end;
  finally
    List.EndUpdate;
  end;
end;

function TMemIniFile.GetUseLocale: Boolean;
begin
  Result := FSections.UseLocale;
end;

procedure TMemIniFile.LoadValues;
var
  List: TStringList;
begin
  try
    if Stream <> nil then
    begin
      List := TStringList.Create;
      try
        Stream.Position := 0;
        List.LoadFromStream(Stream, FEncoding);
        if FEncoding = nil then
          FEncoding := List.Encoding;
        SetStrings(List);
      finally
        List.Free;
      end;
    end
    else if (FileName <> '') and FileExists(FileName) then
    begin
      List := TStringList.Create;
      try
        List.LoadFromFile(FileName, FEncoding);
        if FEncoding = nil then
          FEncoding := List.Encoding;
        SetStrings(List);
      finally
        List.Free;
      end;
    end
    else
      Clear;
  finally
    Modified := False;
  end;
end;

procedure TMemIniFile.ReadSection(const Section: string; Strings: TStrings);
var
  J: Integer;
  SectionStrings: TSection;
begin
  Strings.BeginUpdate;
  try
    Strings.Clear;
    SectionStrings := FSections.Find(Section);
    if SectionStrings <> nil then
      for J := 0 to SectionStrings.Count - 1 do
        Strings.Add(SectionStrings.Names[J]);
  finally
    Strings.EndUpdate;
  end;
end;

procedure TMemIniFile.ReadSections(Strings: TStrings);
var
  I: Integer;
begin
  Strings.BeginUpdate;
  try
    Strings.Clear;
    for I := 0 to FSections.Count - 1 do
      Strings.Add(FSections.Names[I]);
  finally
    Strings.EndUpdate;
  end;
end;

procedure TMemIniFile.ReadSectionValues(const Section: string; Strings: TStrings);
var
  J: Integer;
  SectionStrings: TSection;
begin
  Strings.BeginUpdate;
  try
    Strings.Clear;
    SectionStrings := FSections.Find(Section);
    if SectionStrings <> nil then
      for J := 0 to SectionStrings.Count - 1 do
        Strings.Add(SectionStrings.Pairs[J]);
  finally
    Strings.EndUpdate;
  end;
end;

function TMemIniFile.ReadString(const Section, Ident, Default: string): string;
var
  I: Integer;
  Strings: TSection;
begin
  Strings := FSections.Find(Section);
  if Strings <> nil then
  begin
    I := Strings.Find(Ident);
    if (I >= 0) and not Strings.IsNulls[I] then
      Exit(Strings.Values[I]);
  end;
  Result := Default;
end;

procedure TMemIniFile.Rename(const FileName: string; Reload: Boolean);
begin
  Modified := Modified or (FFileName <> FileName);
  FFileName := FileName;
  if Reload then
    LoadValues;
end;

procedure TMemIniFile.SetCaseSensitive(Value: Boolean);
begin
  FSections.CaseSensitive := Value;
end;

procedure TMemIniFile.SetStrings(const List: TStrings);
var
  I, J: Integer;
  S: string;
  Strings: TSection;
begin
  Clear;
  Strings := nil;
  for I := 0 to List.Count - 1 do
  begin
    S := List[I].Trim;
    if (S <> '') and (S.Chars[0] <> ';') then
      if (S.Chars[0] = '[') and (S.Chars[S.Length-1] = ']') then
      begin
        // Remove Brackets
        S := S.Substring(1, S.Length-2).Trim;
        Strings := FSections.Find(S);
        if Strings = nil then
          Strings := FSections.Add(S);
      end
      else
        if Strings <> nil then
        begin
          J := S.IndexOf('=');
          if J >= 0 then // remove spaces before and after '='
            Strings.Add(S.SubString(0, J).TrimRight, S.SubString(J+1).TrimLeft)
          else
            Strings.AddNoValue(S);
        end;
  end;
  Modified := True;
end;

procedure TMemIniFile.SetUseLocale(const Value: Boolean);
begin
  FSections.UseLocale := Value;
end;

procedure TMemIniFile.UpdateFile;
var
  List: TStringList;
begin
  List := TStringList.Create;
  try
    GetStrings(List);
    if Stream <> nil then
    begin
      Stream.Position := 0;
      List.SaveToStream(Stream, FEncoding);
      Stream.Size := Stream.Position;
    end
    else
      List.SaveToFile(FileName, FEncoding);
  finally
    List.Free;
  end;
  Modified := False;
end;

procedure TMemIniFile.WriteString(const Section, Ident, Value: String);
var
  I: Integer;
  Strings: TSection;
begin
  Strings := FSections.Find(Section);
  if Strings = nil then
    Strings := FSections.Add(Section);
  I := Strings.Find(Ident);
  if I < 0 then
    Strings.Add(Ident, Value)
  else
    Strings.Values[I] := Value;
  Modified := True;
end;

function TMemIniFile.ValueExists(const Section, Ident: string): Boolean;
var
  Strings: TSection;
begin
  Strings := FSections.Find(Section);
  Result := (Strings <> nil) and (Strings.Find(Ident) >= 0);
end;

function TMemIniFile.SectionExists(const Section: string): Boolean;
begin
  Result := FSections.Find(Section) <> nil;
end;

{$IFDEF MSWINDOWS}

{ TIniFile }

destructor TIniFile.Destroy;
begin
  UpdateFile;         // flush changes to disk
  inherited Destroy;
end;

function TIniFile.ReadString(const Section, Ident, Default: string): string;
var
  Buffer: array[0..2047] of Char;
begin
                                                                                                                   
  SetString(Result, Buffer, GetPrivateProfileString(MarshaledString(Section),
    MarshaledString(Ident), MarshaledString(Default), Buffer, Length(Buffer),
    MarshaledString(FFileName)));
end;

procedure TIniFile.WriteString(const Section, Ident, Value: string);
begin
  if not WritePrivateProfileString(MarshaledString(Section), MarshaledString(Ident),
                                   MarshaledString(Value), MarshaledString(FFileName)) then
    raise EIniFileException.CreateResFmt(@SIniFileWriteError, [FileName]);
end;

procedure TIniFile.ReadSections(Strings: TStrings);
const
  CStdBufSize = 16384; // chars
var
  LEncoding: TEncoding;
  LRawBuffer: TBytes;
  P, LBuffer: PChar;
  LCharCount: Integer;
  LLen: Integer;
begin
  LEncoding := nil;
  LBuffer := nil;
  try
    // try to read the file in a 16Kchars buffer
    GetMem(LBuffer, CStdBufSize * SizeOf(Char));
    Strings.BeginUpdate;
    try
      Strings.Clear;
      LCharCount := GetPrivateProfileString(nil, nil, nil, LBuffer, CStdBufSize,
        PChar(FFileName));

      // the buffer is too small; approximate the buffer size to fit the contents
      if LCharCount = CStdBufSize - 2 then
      begin
        LRawBuffer := TFile.ReadAllBytes(FFileName);
        TEncoding.GetBufferEncoding(LRawBuffer, LEncoding);
        LCharCount := LEncoding.GetCharCount(LRawBuffer);
        ReallocMem(LBuffer, LCharCount * LEncoding.GetMaxByteCount(1));

        LCharCount := GetPrivateProfileString(nil, nil, nil, LBuffer, LCharCount,
          MarshaledString(FFileName));
      end;

      // chars were read from the file; get the section names
      if LCharCount <> 0 then
      begin
        P := LBuffer;
        while LCharCount > 0 do
        begin
          Strings.Add(P);
          LLen := StrLen(P) + 1;
          Inc(P, LLen);
          Dec(LCharCount, LLen);
        end;
      end;
    finally
      Strings.EndUpdate;
    end;
  finally
    FreeMem(LBuffer);
  end;
end;

procedure TIniFile.ReadSection(const Section: string; Strings: TStrings);
var
  Buffer, P: PChar;
  CharCount: Integer;
  BufSize: Integer;

  procedure ReadStringData;
  begin
    Strings.BeginUpdate;
    try
      Strings.Clear;
      if CharCount <> 0 then
      begin
        P := Buffer;
        while P^ <> #0 do
        begin
          Strings.Add(P);
          Inc(P, StrLen(P) + 1);
        end;
      end;
    finally
      Strings.EndUpdate;
    end;
  end;

begin
  BufSize := 1024;

  while True do
  begin
    GetMem(Buffer, BufSize * SizeOf(Char));
    try
      CharCount := GetPrivateProfileString(MarshaledString(Section), nil, nil, Buffer, BufSize, MarshaledString(FFileName));
      if CharCount < BufSize - 2 then
      begin
        ReadStringData;
        Break;
      end;
    finally
      FreeMem(Buffer, BufSize);
    end;
    BufSize := BufSize * 4;
  end;
end;

procedure TIniFile.ReadSectionValues(const Section: string; Strings: TStrings);
var
  KeyList: TStringList;
  I: Integer;
begin
  KeyList := TStringList.Create;
  try
    ReadSection(Section, KeyList);
    Strings.BeginUpdate;
    try
      Strings.Clear;
      for I := 0 to KeyList.Count - 1 do
        Strings.Add(KeyList[I] + '=' + ReadString(Section, KeyList[I], ''))
    finally
      Strings.EndUpdate;
    end;
  finally
    KeyList.Free;
  end;
end;

procedure TIniFile.EraseSection(const Section: string);
begin
  if not WritePrivateProfileString(MarshaledString(Section), nil, nil, MarshaledString(FFileName)) then
    raise EIniFileException.CreateResFmt(@SIniFileWriteError, [FileName]);
end;

procedure TIniFile.DeleteKey(const Section, Ident: String);
begin
  WritePrivateProfileString(MarshaledString(Section), MarshaledString(Ident), nil, MarshaledString(FFileName));
end;

procedure TIniFile.UpdateFile;
begin
  WritePrivateProfileString(nil, nil, nil, MarshaledString(FFileName));
end;
{$ELSE MSWINDOWS}

constructor TIniFile.Create(const FileName: string; const Encoding: TEncoding;
  CaseSensitive, UseLocale: Boolean);
begin
  inherited Create(FileName, Encoding, CaseSensitive, UseLocale);
  AutoSave := True;
end;

{$ENDIF MSWINDOWS}

initialization
  NullObject := TObject.Create;

finalization
  NullObject.Free;

end.
