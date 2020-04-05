{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBXPlatform;

interface

uses
  System.SysUtils,
  Data.FMTBcd,
  Data.SqlTimSt,
  System.Classes,
  System.Contnrs,
  System.SyncObjs
;

type
  TInt32                   = LongInt;
  TDBXWideChars            = array of WideChar;
  TDBXAnsiChars            = array of AnsiChar;
  TDBXInt32s                = array of Integer;
  TDBXDynamicCharArray      = array of Char;
  TDBXBooleans              = array of Boolean;
  TDBXStringArray           = array of UnicodeString;
  TDBXObjectArray           = array of TObject;
  TDBXStringList            = TStringList;
  TDBXByteArray            = PByte;
  TDBXWideString           = PWideChar;
  TDBXAnsiString           = PAnsiChar;
  TDBXString               = PChar;
  TDBXWideStringVar        = PWideChar;
  TDBXAnsiStringVar        = PAnsiChar;
  TDBXStringVar            = PChar;
  TDBXWideStringBuilder    = PWideChar;
  TDBXAnsiStringBuilder    = PAnsiChar;
  TDBXStringBuilder        = PChar;

  /// <summary> Used to keep pass metadata back from a server function execution, other than any
  ///  output or return parameters in the function's signature.
  /// </summary>
  /// <remarks> Useful, for example, if
  ///  you wish to specify a custom HTTP status code and/or message.
  /// </remarks>
  TDSInvocationMetadata = class
  private
    FResponseCode: Integer;
    FResponseMessage: UnicodeString;
    FResponseContent: UnicodeString;
    FResponseContentType: UnicodeString;
    FCloseSession: Boolean;
    FQueryParams: TStrings;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    property ResponseCode: Integer read FResponseCode write FResponseCode;
    property ResponseMessage: UnicodeString read FResponseMessage write FResponseMessage;
    property ResponseContent: UnicodeString read FResponseContent write FResponseContent;
    property ResponseContentType: UnicodeString read FResponseContentType write FResponseContentType;
    property CloseSession: Boolean read FCloseSession write FCloseSession;

    /// <summary>The query parameters from the URL of the request.</summary>
    property QueryParams: TStrings read FQueryParams;
  end;

  TDBXInt32Object = class
  public
    constructor Create(const Value: Integer);
    destructor Destroy; override;
    function IntValue: Integer;
  private
    FValue: Integer;
  end;

  TDBXTokenizer = class
  private
    FOriginal: UnicodeString;
    FDelimiters: UnicodeString;
    FNextPos: Integer;
  public
    constructor Create(const Original: UnicodeString; const Delimiters: UnicodeString);
    function HasMoreTokens: Boolean;
    function NextToken: UnicodeString;
  end;

type
  ///<summary>
  ///  Base Class for DataSnap Filter Collection
  ///</summary>
  TBaseTransportFilterCollection = class(TCollection)
  private
    FEvent: TNotifyEvent;
  protected
    procedure NotifyChange;
  public
    destructor Destroy; override;
    function GetItem(Index: Integer): TCollectionItem;
    property OnChange: TNotifyEvent read FEvent write FEvent;
  end;

  {$MethodInfo on}
  TFactoryObject = class
  public
    constructor Create; virtual;
  end;
  {$MethodInfo off}

  TObjectClass = class of TFactoryObject;

  TBaseTransportFactoryTools = class
  public
    class function InvokeStringFunction(objClass: TObjectClass; methodName: string): string;
  end;

  ///<summary>
  ///  Base Class for DataSnap Filter
  ///</summary>
  TBaseTransportFilter = TFactoryObject;

  TBaseTransportFilterItem = class(TCollectionItem)
  private
    FEvent: TNotifyEvent;
  protected
    procedure NotifyChange;
  public
    constructor Create(Collection: TCollection); override;
    procedure OnChangeNotify(filter: TBaseTransportFilterCollection);
    property OnChange: TNotifyEvent read FEvent write FEvent;
  end;

  TBaseFilterProperties = class(TStringList)
  public
    function GetName(Index: Integer): string;
    function GetValue(Index: Integer): string;
    procedure Add(const Name, Value: string); reintroduce;
  end;

  TTransportFilterClass = class of TBaseTransportFilter;

function Incr(var Arg: Integer): Integer; inline;
function Decr(var Arg: Integer): Integer; inline;
function IncrAfter(var Arg: Integer): Integer; inline;
function DecrAfter(var Arg: Integer): Integer; inline;
function C_Conditional(const Condition: Boolean; const TruePart, FalsePart: UnicodeString): UnicodeString;
function CompareTimeStamp(const ATimeStamp: TSQLTimeStamp; const BTimeStamp: TSQLTimeStamp): Integer;
function CompareTimeStampOffset(const ATimeStamp: TSQLTimeStampOffset; const BTimeStamp: TSQLTimeStampOffset): Integer;

const
  NullString = '';
  {$EXTERNALSYM NullString}

type
  TDBXFreeArray = TDBXObjectArray;

  TDBXStringBuffer = class
  private
    FBuffer: String;
    FCount: Integer;
  private
    function CharAt( const Idx: Integer): WideChar;
  public
    constructor Create; overload;
    constructor Create(InitialSize: Integer); overload;
    constructor Create(const Value: String); overload;
    procedure Append(const Value: String); overload;
    procedure Append(const Value: Integer); overload;
    procedure Append(const Value: TDBXStringBuffer); overload;
    property Length: Integer read FCount write FCount;
    procedure Replace(const Original, Replacement: String; const StartIndex: Integer; const Count: Integer);
    function ToString: String; override;
    function Substring(const Ordinal: Integer): String;
    
    property Chars[ const Index: Integer]: WideChar read CharAt;
  end;

  TDBXArrayList = class
  private
    FList:  TObjectList;
  private
    function GetValue(Index: Integer): TObject;
    procedure SetValue(Index: Integer; Value: TObject);
    function GetCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure Add(Element: TObject);
    procedure RemoveAt(Index: Integer);
    procedure Remove(Index: Integer); overload;
    procedure Remove(Element: TObject); overload;
  public
    property Count: Integer read GetCount;
    property Values[Index: Integer]: TObject read GetValue write SetValue; default;
  end;

  TDBXStringStore = class(TStringList)
  private
    function GetString(const Name: UnicodeString): UnicodeString;
    procedure SetString(const Name: UnicodeString; const Value: UnicodeString);
  public
    function Contains(const Name: UnicodeString): Boolean;
    property Strings[const Name: UnicodeString]: UnicodeString read GetString write SetString; default;
  end;

function ObjectEquals(const Obj1: TObject; const Obj2: TObject): Boolean;
procedure FreeObjectArray(var ArrayObject: TDBXFreeArray);
function StringIndexOf(const Str: UnicodeString; const Ch: WideChar): Integer; overload;
function StringIndexOf(const Str: UnicodeString; const Part: UnicodeString): Integer; overload;
function StringIndexOf(const Str: UnicodeString; const Part: UnicodeString; FromIndex: Integer): Integer; overload;
function StringLastIndexOf(const Str: UnicodeString; const Part: UnicodeString): Integer;
function StringStartsWith(const Str: UnicodeString; const Part: UnicodeString): Boolean; inline;
function StringEndsWith(const Str: UnicodeString; const Part: UnicodeString): Boolean; inline;
function StringIsNil(const Str: UnicodeString): Boolean; inline;
function IsIdentifierStart(const Ch: WideChar): Boolean;
function IsIdentifierPart(const Ch: WideChar): Boolean;
function SubString(Buffer: TDBXStringBuffer; Index: Integer): String; inline;
function FormatMessage(const FormatString: UnicodeString; const Parameters: TDBXStringArray): UnicodeString;

type
  TDBXKeyEnumerator = TStringsEnumerator;

  TDBXObjectStore = class(TStringList)
  private
    function GetObjectFromName(const Name: UnicodeString): TObject;
    procedure SetObjectByName(const Name: UnicodeString; const Value: TObject);
  public
    destructor Destroy; override;
    function ContainsKey(const Name: UnicodeString): Boolean;
    property Objects[const Name: UnicodeString]: TObject read GetObjectFromName write SetObjectByName; default;
    function Keys(): TDBXKeyEnumerator;
  end;

  TDBXPlatform = class
    class function AnsiStrToBytes(const Value: AnsiString): TBytes; static;
    class function WideStrToBytes(const Value: UnicodeString): TBytes; static; inline;
    class function BytesToWideStr(const Value: TBytes): UnicodeString; static;
    class function BytesToAnsiStr(const Value: TBytes): AnsiString; static; inline;

    class function GetStringBuilderLength(const Value: TDBXAnsiStringBuilder): TInt32; static;
    class function CreateStringBuilder(Length:  TInt32): TDBXAnsiStringBuilder; static;
    class function ToAnsiString(const Value: TDBXAnsiStringBuilder): AnsiString; static;
    class procedure CopyStringBuilder(const Value: TDBXAnsiStringBuilder; var Dest: AnsiString); static; inline;
    class procedure FreeAndNilStringBuilder(var Value: TDBXAnsiStringBuilder); static;
    class procedure ResizeStringBuilder(var Value: TDBXAnsiStringBuilder; Size: Integer); static;
    class procedure CopyStringToBuilder(const Source: AnsiString; AnsiStringBuilderSize: Integer; var Value: TDBXAnsiStringBuilder); static;

    class function GetWideStringBuilderLength(const Value: TDBXWideStringBuilder): TInt32; static; inline;
    class function CreateWideStringBuilder(Length:  TInt32): TDBXWideStringBuilder; static; inline;
    class function ToWideString(const Value: TDBXWideStringBuilder): UnicodeString; static; inline;
    class procedure CopyWideStringBuilder(const Value: TDBXWideStringBuilder; var Dest: UnicodeString); static; inline;
    class procedure ResizeWideStringBuilder(var Value: TDBXWideStringBuilder; Size: Integer); static; inline;
    class procedure FreeAndNilWideStringBuilder(var Value: TDBXWideStringBuilder); static;
    class procedure CopyWideStringToBuilder(const Source: UnicodeString; WideStringBuilderSize: Integer; var Value: TDBXWideStringBuilder); static;

    class procedure CopyInt32Array(const Source: TDBXInt32s; SourceOffset: Integer; const Dest: TDBXInt32s; DestOffset: Integer; Count: Integer); static; inline;
    class procedure CopyCharArray(const Source: TDBXWideChars; SourceOffset: Integer; const Dest: TDBXWideChars; DestOffset: Integer; Count: Integer); static; inline;
    class procedure CopyByteArray(const Source: TBytes; SourceOffset: Integer; const Dest: TBytes; DestOffset: Integer; Count: Integer); static; inline;
    class function  CreateWideString(const Source: TDBXWideChars; Count: Integer): UnicodeString; static; inline;
    class function  CreateAnsiString(const Source: TDBXAnsiChars; Count: Integer): AnsiString; static; inline;
    class procedure WriteAsciiBytes(const Message: String; ByteBuffer: TBytes; Offset: Integer; Count: Integer);
    class function  Int64BitsToDouble(const Value: Int64): Double;
    class function  DoubleToInt64Bits(const Value: Double): Int64;
    class function Int32BitsToSingle(const Value: TInt32): Single; static;
    class function SingleToInt32Bits(const Value: Single): TInt32; static;
    class procedure CopyBytesToAnsiChars(const Source: TBytes; SourceOffset: Integer; const Dest: TDBXAnsiChars; DestOffset: Integer; Count: Integer); static; inline;
    class procedure CopyBytesToWideChars(const Source: TBytes; SourceOffset: Integer; const Dest: TDBXWideChars; DestOffset: Integer; Count: Integer); static; inline;

    class procedure CopyInt32(const Value: Integer; const Dest: TBytes; const DestOffset: Integer); static; inline;
    class procedure CopyInt16(const Value: SmallInt; const Dest: TBytes; const DestOffset: Integer); static; inline;
    class procedure CopyUInt16(const Value: Word; const Dest: TBytes; const DestOffset: Integer); static; inline;
    class procedure CopyInt64(const Value: Int64; const Dest: TBytes; const DestOffset: Integer); static; inline;
    class procedure CopyInt8(const Value: ShortInt; const Dest: TBytes; const DestOffset: Integer); static; inline;
    class procedure CopyUInt8(const Value: Byte; const Dest: TBytes; const DestOffset: Integer); static; inline;
    class procedure CopySqlTimeStamp(const Value: TSQLTimeStamp; const Dest: TBytes; const DestOffset: Integer); static; inline;
    class procedure CopySqlTimeStampOffset(const Value: TSQLTimeStampOffset; const Dest: TBytes; const DestOffset: Integer); static; inline;
    class procedure CopyBcd(const Value: TBcd; const Dest: TBytes; const DestOffset: Integer); static; inline;
    class procedure Sleep(const Duration: Int64);
    class function GetClassName(ObjectValue: TObject): UnicodeString; static;
    class function GetNestedException(Ex: Exception): Exception; static;
    class function GetPublicKeyToken: string;

    ///  <summary>  Converts a double into a string using dot character
    ///  </summary>
    class function JsonFloat(Value: Double): string; static;
    class function JsonToFloat(DotValue: String): double; static;
    class function TryJsonToFloat(DotValue: String; var Value: Double): Boolean;
   ///  <summary>  Checks to see if the argument represents a valid boolean string representation
    ///  </summary>
    ///  <param name="Value">The string to check for if it is a boolean</param>
    ///  <result>true if the string value is a boolean, false otherwise</result>
    class function IsBoolean(const value: String): Boolean; static;

    class function StringOf(Data: TBytes; const Size: Integer): String;

  private
    class procedure UnexpectedStringOverflow(const Source: UnicodeString; WideStringBuilderSize: Integer); overload;static;
    class procedure UnexpectedStringOverflow(const Source: AnsiString; AnsiStringBuilderSize: Integer); overload;static;

  end;

                                                               
                                                  
  TDBXSemaphore = class(TSemaphore)
  private
    FCount:           Integer;
  public
    constructor Create(Count: Integer);
    function Acquire(Timeout: Int64): Boolean; reintroduce;
  end;

  ///  <summary>  Returns the stored Invocation Metadata for the current thread </summary>
  ///  <param name="CreateIfNil">True if a new instance of TDSInvocationMetadata should
  ///    be created and storedinstead of returning nil</param>
  ///  <result>the metadata stored for the current thread, or nil (if CreateIfNil is False)</result>
  function GetInvocationMetadata(CreateIfNil : Boolean = True): TDSInvocationMetadata;

  ///  <summary>  Stores a new instance of Invocation Metadata for the current thread </summary>
  ///  <param name="MetaData">The new metadata to store</param>
  procedure SetInvocationMetadata(MetaData: TDSInvocationMetadata);

  ///  <summary>  Frees and nils the invocation metadata stored for the current thread, if any </summary>
  procedure ClearInvocationMetadata();

implementation

uses
  Data.DBXCommonResStrs,
  System.Math,
  System.StrUtils,
  System.WideStrUtils,
  System.ObjAuto
{$IFNDEF POSIX}
  , Winapi.Windows
{$ENDIF}
;

ThreadVar
  InvokeMetadata: TDSInvocationMetadata;

function GetInvocationMetadata(CreateIfNil : Boolean = True): TDSInvocationMetadata;
begin
  if (InvokeMetadata = nil) and CreateIfNil then
  begin
    InvokeMetadata := TDSInvocationMetadata.Create;
  end;
  Result := InvokeMetadata;
end;

procedure SetInvocationMetadata(MetaData: TDSInvocationMetadata);
begin
  FreeAndNil(InvokeMetadata);
  InvokeMetadata := MetaData;
end;

procedure ClearInvocationMetadata();
begin
  FreeAndNil(InvokeMetadata);
end;


constructor TDBXInt32Object.Create(const Value: Integer);
begin
  inherited Create;
  FValue := Value;
end;

destructor TDBXInt32Object.Destroy;
begin
  inherited Destroy;
end;


function TDBXInt32Object.IntValue: Integer;
begin
  Result := FValue;
end;

constructor TDBXTokenizer.Create(const Original: UnicodeString; const Delimiters: UnicodeString);
begin
  Inherited Create;
  FOriginal := Original;
  FDelimiters := Delimiters;
  FNextPos := 1;
end;

function TDBXTokenizer.HasMoreTokens: Boolean;
var
  Ch: WideChar;
begin
  Result := False;
  while FNextPos <= Length(FOriginal) do
  begin
    Ch := FOriginal[FNextPos];
    if StringIndexOf(FDelimiters,Ch) < 0 then
    begin
      Result := True;
      Exit;
    end;
    Inc(FNextPos);
  end;
end;

function TDBXTokenizer.NextToken: UnicodeString;
var
  Ch: WideChar;
  StartPos: Integer;
begin
  if not HasMoreTokens then
    Result := ''
  else
  begin
    StartPos := FNextPos;
    while FNextPos <= Length(FOriginal) do
    begin
      Ch := FOriginal[FNextPos];
      if StringIndexOf(FDelimiters,Ch) < 0 then
        Inc(FNextPos)
      else
        Break;
    end;
    Result := Copy(FOriginal, StartPos, FNextPos - StartPos);
  end;
end;

function Incr(var Arg: Integer): Integer; inline;
begin
  Inc(Arg);
  Result := Arg;
end;

function Decr(var Arg: Integer): Integer; inline;
begin
  Dec(Arg);
  Result := Arg;
end;

function IncrAfter(var Arg: Integer): Integer; inline;
begin
  Result := Arg;
  Inc(Arg);
end;

function DecrAfter(var Arg: Integer): Integer; inline;
begin
  Result := Arg;
  Dec(Arg);
end;

function C_Conditional(const Condition: Boolean; const TruePart, FalsePart: UnicodeString): UnicodeString;
begin
  if Condition then
    Result := TruePart
  else
    Result := FalsePart;
end;

function CompareTimeStamp(const ATimeStamp: TSQLTimeStamp; const BTimeStamp: TSQLTimeStamp): Integer;
var
  Status: Integer;
begin
  Status := ATimeStamp.Year - BTimeStamp.Year;
  if Status = 0 then
    Status := ATimeStamp.Month - BTimeStamp.Month;
  if Status = 0 then
    Status := ATimeStamp.Day - BTimeStamp.Day;
  if Status = 0 then
    Status := ATimeStamp.Hour - BTimeStamp.Hour;
  if Status = 0 then
    Status := ATimeStamp.Hour - BTimeStamp.Hour;
  if Status = 0 then
    Status := ATimeStamp.Minute - BTimeStamp.Minute;
  if Status = 0 then
    Status := ATimeStamp.Second - BTimeStamp.Second;
  if Status = 0 then
    Status := ATimeStamp.Fractions - BTimeStamp.Fractions;
  Result := Status;
end;

function CompareTimeStampOffset(const ATimeStamp: TSQLTimeStampOffset; const BTimeStamp: TSQLTimeStampOffset): Integer;
var
  Status: Integer;
begin
  Status := ATimeStamp.Year - BTimeStamp.Year;
  if Status = 0 then
    Status := ATimeStamp.Month - BTimeStamp.Month;
  if Status = 0 then
    Status := ATimeStamp.Day - BTimeStamp.Day;
  if Status = 0 then
    Status := ATimeStamp.Hour - BTimeStamp.Hour;
  if Status = 0 then
    Status := ATimeStamp.Hour - BTimeStamp.Hour;
  if Status = 0 then
    Status := ATimeStamp.Minute - BTimeStamp.Minute;
  if Status = 0 then
    Status := ATimeStamp.Second - BTimeStamp.Second;
  if Status = 0 then
    Status := ATimeStamp.Fractions - BTimeStamp.Fractions;
  if Status = 0 then
    Status := ATimeStamp.TimeZoneHour - BTimeStamp.TimeZoneHour;
  if Status = 0 then
    Status := ATimeStamp.TimeZoneMinute - BTimeStamp.TimeZoneMinute;
  Result := Status;
end;

function ObjectEquals(const Obj1: TObject; const Obj2: TObject): Boolean;
begin
  Result := (Obj1 = Obj2);
end;

procedure FreeObjectArray(var ArrayObject: TDBXFreeArray);
var
  Index: Integer;
begin
  if ArrayObject <> nil then
  begin
    for Index := Low(ArrayObject) to High(ArrayObject) do
      ArrayObject[Index].Free;
    ArrayObject := nil;
  end;
end;

function StringIndexOf(const Str: UnicodeString; const Ch: WideChar): Integer;
var
  Ptr: PWideChar;
begin
  Ptr := WStrScan(PWideChar(Str),Ch);
  if Ptr = nil then
    Result := -1
  else
    Result := Ptr - PWideChar(Str);
end;

function StringIndexOf(const Str: UnicodeString; const Part: UnicodeString): Integer;
begin
  Result := Pos(Part,Str)-1;
end;

function StringIndexOf(const Str: UnicodeString; const Part: UnicodeString; FromIndex: Integer): Integer;
begin
  Result := PosEx(Part,Str,FromIndex+1)-1;
end;

function StringLastIndexOf(const Str: UnicodeString; const Part: UnicodeString): Integer;
var
  PosA, PosB: Integer;
  FirstChar: WideChar;
begin
  if Length(Part) = 0 then
    Result := Length(Str)-1
  else if Length(Part) > Length(Str) then
    Result := -1
  else
  begin
    Result := -1;
    FirstChar := Part[1];
    for PosA := Length(Str)-Length(Part)+1 downto 1 do
    begin
      if Str[PosA] = FirstChar then
      begin
        PosB := 2;
        while (PosB <= Length(Part)) and (Str[PosA+PosB-1] = Part[PosB]) do
          Inc(PosB);
        if PosB > Length(Part) then
        begin
          Result := PosA - 1;
          exit;
        end;
      end;
    end;
  end;
end;

function StringStartsWith(const Str: UnicodeString; const Part: UnicodeString): Boolean;
begin
  Result := Pos(Part, Str) = 1;
end;

function StringEndsWith(const Str: UnicodeString; const Part: UnicodeString): Boolean;
begin
  Result := AnsiEndsText(Part,Str);
end;

function StringIsNil(const Str: UnicodeString): Boolean;
begin
  Result := Str = NullString;
end;

function IsIdentifierStart(const Ch: WideChar): Boolean;
begin
  case Ch of
    'a'..'z',
    'A'..'Z',
    '_':
      Result := True;
    else
      Result := False;
  end;
end;

function IsIdentifierPart(const Ch: WideChar): Boolean;
begin
  case Ch of
    'a'..'z',
    'A'..'Z',
    '0'..'9',
    '_':
      Result := True;
    else
      Result := False;
  end;
end;

function SubString(Buffer: TDBXStringBuffer; Index: Integer): String;
begin
  Result := Buffer.SubString(Index);
end;

function FormatMessage(const FormatString: UnicodeString; const Parameters: TDBXStringArray): UnicodeString;
var
  Buffer: TDBXStringBuffer;
  Ch: WideChar;
  Index: Integer;
  Start: Integer;
  ParameterIndex: Integer;
  Quoted: Boolean;
begin
  Index := 1;
  Quoted := False;
  Buffer := TDBXStringBuffer.Create;
  while Index <= Length(FormatString) do
  begin
    Ch := FormatString[Index];
    case Ch of
      '{':
        begin
          Start := Index+1;
          while (Index < Length(FormatString)) and (Ch <> '}') do
          begin
            Inc(Index);
            Ch := FormatString[Index];
          end;
          if Ch <> '}' then
            raise Exception.Create(System.SysUtils.Format(SUnmatchedBrace,[FormatString]));
          ParameterIndex := StrToInt(Copy(FormatString,Start,Index-Start));
          if (ParameterIndex < 0) or (ParameterIndex > Length(Parameters)) then
            raise Exception.Create(System.SysUtils.Format(SParameterIndexOutOfRange,[ParameterIndex]));
          Buffer.Append(Parameters[ParameterIndex]);
          Inc(Index);
        end;

      '''':
        begin
          if (Index=Length(FormatString)) or (FormatString[Index+1] <> '''') then
            Quoted := not Quoted
          else
          begin
            Buffer.Append(Ch);
            Inc(Index);
          end;
        end;

      else
        Buffer.Append(Ch);
        Inc(Index);
    end;
  end;
  Result := Buffer.ToString;
  FreeAndNil(Buffer);
end;

constructor TDBXStringBuffer.Create;
begin
  inherited Create;
end;

constructor TDBXStringBuffer.Create(InitialSize: Integer);
begin
  inherited Create;
  SetLength(FBuffer,InitialSize);
end;

constructor TDBXStringBuffer.Create(const Value: String);
begin
  inherited Create;
  Append( Value );
end;

function TDBXStringBuffer.ToString: String;
begin
  if FCount > System.Length(FBuffer) then
    SetLength(FBuffer,FCount);
  Result := Copy(FBuffer,0,FCount);
end;

function TDBXStringBuffer.Substring(const Ordinal: Integer): String;
begin
  if Ordinal >= FCount then
    Result := ''
  else
    Result := Copy(FBuffer, Ordinal, FCount - Ordinal);
end;

procedure TDBXStringBuffer.Append(const Value: String);
var
  Pos: Integer;
begin
  if FCount+System.Length(Value) > System.Length(FBuffer) then
    SetLength(FBuffer,System.Math.Max(2*System.Length(FBuffer),System.Length(FBuffer)+System.Length(Value)));
  for Pos := 1 to System.Length(Value) do
    FBuffer[FCount+Pos] := Value[Pos];
  FCount := FCount + System.Length(Value);
end;

procedure TDBXStringBuffer.Append(const Value: Integer);
begin
  Append(IntToStr(Value));
end;

procedure TDBXStringBuffer.Append(const Value: TDBXStringBuffer);
begin
  Append(Value.ToString);
end;

procedure Zap(Buffer: TDBXStringBuffer);
var
  I: Integer;
begin
  for I := Buffer.FCount+1 to Length(Buffer.FBuffer) do
    Buffer.FBuffer[I] := ' ';
end;

procedure TDBXStringBuffer.Replace(const Original, Replacement: String; const StartIndex: Integer; const Count: Integer);
var
  Part: UnicodeString;
begin
  Part := Copy(FBuffer, StartIndex+1, Count);
  Part := WideReplaceStr(Part, Original, Replacement);
  Self.FCount := StartIndex;
  Zap(Self);
  Append(Part);
  Zap(Self);
end;

function TDBXStringBuffer.CharAt( const Idx: Integer ): WideChar;
begin
  Result := FBuffer[ Idx + 1 ];
end;

constructor TDBXArrayList.Create;
begin
  inherited;
  FList := TObjectList.Create;
  Flist.OwnsObjects := False;
//  SetLength(FList,30);
end;

destructor TDBXArrayList.Destroy;
begin
  FreeAndNil(FList);
//  SetLength(FList,0);
  inherited;
end;

function TDBXArrayList.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TDBXArrayList.GetValue(Index: Integer): TObject;
begin
  Result := FList[Index];
end;

procedure TDBXArrayList.SetValue(Index: Integer; Value: TObject);
begin
  FList[Index] := Value;
end;

procedure TDBXArrayList.Remove(Element: TObject);
begin
  FList.Remove(Element);
end;

procedure TDBXArrayList.Remove(Index: Integer);
begin
  FList.Remove(FList[Index]);
end;

procedure TDBXArrayList.RemoveAt(Index: Integer);
begin
  Remove(Index);
end;

procedure TDBXArrayList.Add(Element: TObject);
begin
  FList.Add(Element);
end;

procedure TDBXArrayList.Clear;
begin
  FList.Clear;
end;

function TDBXStringStore.GetString(const Name: UnicodeString): UnicodeString;
begin
  Result := Inherited Values[Name];
end;

procedure TDBXStringStore.SetString(const Name: UnicodeString; const Value: UnicodeString);
begin
  Inherited Values[Name] := Value;
end;

function TDBXStringStore.Contains(const Name: UnicodeString): Boolean;
begin
  Result := (IndexOf(Name) >= 0);
end;

destructor TDBXObjectStore.Destroy;
var
  Index: Integer;
begin
  for Index := 0 to Count - 1 do
  begin
    GetObject(Index).Free;
    PutObject(Index,nil);
  end;
  inherited Destroy;
end;

function TDBXObjectStore.ContainsKey(const Name: UnicodeString): Boolean;
begin
  Result := (IndexOf(Name) >= 0);
end;

function TDBXObjectStore.Keys(): TDBXKeyEnumerator;
begin
  Result := TDBXKeyEnumerator.Create( self );
end;

function TDBXObjectStore.GetObjectFromName(const Name: UnicodeString): TObject;
var
  Index: Integer;
begin
  Index := IndexOf(Name);
  if Index < 0 then
    Result := nil
  else
    Result := Inherited Objects[Index];
end;

procedure TDBXObjectStore.SetObjectByName(const Name: UnicodeString; const Value: TObject);
var
  Index: Integer;
begin
  Index := IndexOf(Name);
  if Index < 0 then
    AddObject(Name, Value)
  else
    Inherited Objects[Index] := Value;
end;

{ TDBXPlatform }
class procedure TDBXPlatform.CopyInt32(const Value: Integer; const Dest: TBytes; const DestOffset: Integer);
begin
    Dest[DestOffset]    := Byte(Value);
    Dest[DestOffset+1]  := Byte(Value shr 8);
    Dest[DestOffset+2]  := Byte(Value shr 16);
    Dest[DestOffset+3]  := Byte(Value shr 24);
end;

class procedure TDBXPlatform.CopyInt64(const Value: Int64; const Dest: TBytes; const DestOffset: Integer);
begin
    Dest[DestOffset]    := Byte(Value);
    Dest[DestOffset+1]  := Byte(Value shr 8);
    Dest[DestOffset+2]  := Byte(Value shr 16);
    Dest[DestOffset+3]  := Byte(Value shr 24);

    Dest[DestOffset+4] := Byte(Value shr 32);
    Dest[DestOffset+5] := Byte(Value shr 40);
    Dest[DestOffset+6] := Byte(Value shr 48);
    Dest[DestOffset+7] := Byte(Value shr 56);

end;

class procedure TDBXPlatform.CopyInt8(const Value: ShortInt; const Dest: TBytes;
  const DestOffset: Integer);
begin
    Dest[DestOffset]    := Byte(Value);
end;

class procedure TDBXPlatform.CopyUInt16(const Value: Word; const Dest: TBytes;
  const DestOffset: Integer);
begin
    Dest[DestOffset]    := Byte(Value);
    Dest[DestOffset+1]  := Byte(Value shr 8);
end;

class procedure TDBXPlatform.CopyUInt8(const Value: Byte; const Dest: TBytes;
  const DestOffset: Integer);
begin
  Dest[DestOffset] := Byte(Value);
end;

class procedure TDBXPlatform.CopyInt16(const Value: SmallInt;
  const Dest: TBytes; const DestOffset: Integer);
begin
    Dest[DestOffset]    := Byte(Value);
    Dest[DestOffset+1]  := Byte(Value shr 8);
end;

class procedure TDBXPlatform.CopySqlTimeStamp(const Value: TSQLTimeStamp;
  const Dest: TBytes; const DestOffset: Integer);
begin
    TDBXPlatform.CopyInt16(Value.Year, Dest, DestOffset);
    TDBXPlatform.CopyInt16(Value.Month, Dest, DestOffset+2);
    TDBXPlatform.CopyInt16(Value.Day, Dest, DestOffset+4);
    TDBXPlatform.CopyInt16(Value.Hour, Dest, DestOffset+6);
    TDBXPlatform.CopyInt16(Value.Minute, Dest, DestOffset+8);
    TDBXPlatform.CopyInt16(Value.Second, Dest, DestOffset+10);
    TDBXPlatform.CopyInt32(Value.Fractions, Dest, DestOffset+12);
end;

class procedure TDBXPlatform.CopySqlTimeStampOffset(const Value: TSQLTimeStampOffset;
  const Dest: TBytes; const DestOffset: Integer);
begin
    TDBXPlatform.CopyInt16(Value.Year, Dest, DestOffset);
    TDBXPlatform.CopyInt16(Value.Month, Dest, DestOffset+2);
    TDBXPlatform.CopyInt16(Value.Day, Dest, DestOffset+4);
    TDBXPlatform.CopyInt16(Value.Hour, Dest, DestOffset+6);
    TDBXPlatform.CopyInt16(Value.Minute, Dest, DestOffset+8);
    TDBXPlatform.CopyInt16(Value.Second, Dest, DestOffset+10);
    TDBXPlatform.CopyInt32(Value.Fractions, Dest, DestOffset+12);
    TDBXPlatform.CopyInt16(Value.TimeZoneHour, Dest, DestOffset+16);
    TDBXPlatform.CopyInt16(Value.TimeZoneMinute, Dest, DestOffset+18);
end;

class procedure TDBXPlatform.CopyBcd(const Value: TBcd; const Dest: TBytes;
  const DestOffset: Integer);
begin
  Dest[DestOffset] := Value.Precision;
  Dest[DestOffset+1] := Value.SignSpecialPlaces;
  Move(Value.Fraction[0], Dest[DestOffset+2], Length(Value.Fraction));
end;

class function TDBXPlatform.CreateStringBuilder(
  Length: TInt32): TDBXAnsiStringBuilder;
begin
  GetMem(Result, length);
end;

class function TDBXPlatform.ToAnsiString(const Value: TDBXAnsiStringBuilder): AnsiString;
begin
  Result := Value;
end;

class function TDBXPlatform.GetStringBuilderLength(
  const Value: TDBXAnsiStringBuilder): TInt32;
begin
  Result := Length(Value);
end;

class procedure TDBXPlatform.CopyStringBuilder(const Value: TDBXAnsiStringBuilder; var Dest: AnsiString);
begin
  Dest := Value; //Copy(Value, 0, StrLen(TDBXAnsiStringVar(Value)));
end;

class procedure TDBXPlatform.ResizeStringBuilder(var Value: TDBXAnsiStringBuilder;
  Size: Integer);
begin
  if Value <> nil then
    FreeAndNilStringBuilder(Value);
  GetMem(Value, Size);
end;

class procedure TDBXPlatform.FreeAndNilStringBuilder(
  var Value: TDBXAnsiStringBuilder);
begin
  if Value <> nil then
    FreeMem(Value);
  Value := nil;
end;

class function TDBXPlatform.CreateWideStringBuilder(
  Length: TInt32): TDBXWideStringBuilder;
begin
  GetMem(Result, Length*2);
end;

class function TDBXPlatform.ToWideString(const Value: TDBXWideStringBuilder): UnicodeString;
begin
  Result := Value;
end;

class function TDBXPlatform.GetWideStringBuilderLength(
  const Value: TDBXWideStringBuilder): TInt32;
begin
  Result := Length(Value);
end;

class procedure TDBXPlatform.CopyWideStringBuilder(const Value: TDBXWideStringBuilder; var Dest: UnicodeString);
begin
  Dest := UnicodeString(Value);//Copy(Value, 0, WStrLen(TDBXWideStringVar(Value)));
end;

class procedure TDBXPlatform.ResizeWideStringBuilder(
  var Value: TDBXWideStringBuilder; Size: Integer);
begin
  if Value <> nil then
    ReallocMem(Value, Size*2)
  else
    GetMem(Value, Size*2);
end;

class procedure TDBXPlatform.FreeAndNilWideStringBuilder(
  var Value: TDBXWideStringBuilder);
begin
  if Value <> nil then
    FreeMem(Value);
  Value := nil;
end;

class procedure TDBXPlatform.CopyWideStringToBuilder(const Source: UnicodeString;
  WideStringBuilderSize: Integer;
  var Value: TDBXWideStringBuilder);
begin
  // need room for null terminator.
  if Length(Source) >= WideStringBuilderSize then
  begin
    UnexpectedStringOverflow(Source, WideStringBuilderSize);
  end;
  move(TDBXWideStringBuilder(Source)^, Value^, (Length(Source)+1)*2);
end;

class procedure TDBXPlatform.CopyStringToBuilder(const Source: AnsiString;
  AnsiStringBuilderSize: Integer;
  var Value: TDBXAnsiStringBuilder);
begin
  // need room for null terminator.
  if Length(Source) >= AnsiStringBuilderSize then
  begin
    UnexpectedStringOverflow(Source, AnsiStringBuilderSize);
  end;
  move(TDBXAnsiStringBuilder(Source)^, Value^, (Length(Source)+1));
end;

class procedure TDBXPlatform.CopyInt32Array(const Source: TDBXInt32s;
  SourceOffset: Integer; const Dest: TDBXInt32s; DestOffset, Count: Integer);
begin
  Assert(Length(Dest) >= (Count+DestOffset));
  Move(Source[SourceOffset], Dest[DestOffset], Count*4);
end;

class procedure TDBXPlatform.CopyByteArray(const Source: TBytes;
  SourceOffset: Integer; const Dest: TBytes; DestOffset, Count: Integer);
begin
  Assert(Length(Dest) >= (Count+DestOffset));
  if Count > 0 then
    Move(Source[SourceOffset], Dest[DestOffset], Count);
end;

class procedure TDBXPlatform.CopyBytesToAnsiChars(const Source: TBytes;
  SourceOffset: Integer; const Dest: TDBXAnsiChars; DestOffset, Count: Integer);
begin
  Move(Source[SourceOffset], Dest[DestOffset], Count);
end;

class procedure TDBXPlatform.CopyBytesToWideChars(const Source: TBytes;
  SourceOffset: Integer; const Dest: TDBXWideChars; DestOffset, Count: Integer);
begin
  Assert(Length(Dest) >= (((Count+1) div SizeOf(Char))+DestOffset));
  Move(Source[SourceOffset], Dest[DestOffset], Count);
end;

class procedure TDBXPlatform.CopyCharArray(
  const Source: TDBXWideChars; SourceOffset: Integer; const Dest: TDBXWideChars; DestOffset: Integer; Count: Integer);
begin
  Assert(Length(Dest) >= (Count+DestOffset));
  Move(Source[SourceOffset], Dest[DestOffset], Count*SizeOf(Char));
end;

class function TDBXPlatform.CreateWideString(const Source: TDBXWideChars;
  Count: Integer): UnicodeString;
begin
//  Result := PWideChar(Source); Only works if string is null terminated.
  SetLength(Result, Count);
  if Count > 0 then
    Move(Source[0], Result[1], Count*SizeOf(Char));
end;
class function TDBXPlatform.CreateAnsiString(const Source: TDBXAnsiChars;
  Count: Integer): AnsiString;
begin
//  Result := PWideChar(Source); Only works if string is null terminated.
  SetLength(Result, Count);
  if Count > 0 then
    Move(Source[0], Result[1], Count);
end;

class procedure TDBXPlatform.UnexpectedStringOverflow(
  const Source: UnicodeString; WideStringBuilderSize: Integer);
begin
  raise Exception.Create(System.SysUtils.Format(SUnexpectedStringOverflow,[source, IntToStr(WideStringBuilderSize)]));
end;

class procedure TDBXPlatform.UnexpectedStringOverflow(
  const Source: AnsiString; AnsiStringBuilderSize: Integer);
begin
  raise Exception.Create(System.SysUtils.Format(SUnexpectedStringOverflow,[source, IntToStr(AnsiStringBuilderSize)]));
end;

{ TDBXSemaphore }

constructor TDBXSemaphore.Create(Count: Integer);
begin
  FCount := Count;
  inherited Create(nil, Count, Count, '');
end;

function TDBXSemaphore.Acquire(Timeout: Int64): Boolean;
{$IFNDEF POSIX}
var
  WaitResult: Integer;
{$ENDIF}
begin
{$IFNDEF POSIX}
  WaitResult := WaitForSingleObject(FHandle, TimeOut);
  if WaitResult <> WAIT_OBJECT_0 then
{$ELSE}
  if WaitFor(TimeOut) <> wrSignaled then
{$ENDIF}
    Result := false
  else
    Result := true;
end;

class function TDBXPlatform.Int64BitsToDouble(const Value: Int64): Double;
begin
  Move(Value, Result, 8);
end;

class function TDBXPlatform.DoubleToInt64Bits(const Value: Double): Int64;
begin
  Move(Value, Result, 8);
end;
class function TDBXPlatform.Int32BitsToSingle(const Value: TInt32): Single;
begin
  Move(Value, Result, 4);
end;

class function TDBXPlatform.SingleToInt32Bits(const Value: Single): TInt32;
begin
  Move(Value, Result, 4);
end;

class function TDBXPlatform.AnsiStrToBytes(const Value: AnsiString): TBytes;
var
  Count: Integer;
begin
  Count := Length(Value);
  SetLength(Result, Count);
  if Count > 0 then
    Move(Value[1], Result[0], Count);
end;

class function TDBXPlatform.WideStrToBytes(const Value: UnicodeString): TBytes;
var
  Count: Integer;
begin
  Count := Length(Value) * 2;
  SetLength(Result, Count);
  if Count > 0 then
    Move(Value[1], Result[0], Count);
end;

class function TDBXPlatform.BytesToWideStr(const Value: TBytes): UnicodeString;
var
  Count: Integer;
  Ch:     WideChar;
  ByteIndex: Integer;
  CharIndex: Integer;
begin
  Count := Length(Value);
  SetLength(Result, (Count+1) div SizeOf(Char));
  ByteIndex := 0;
  CharIndex := 1;
  while ByteIndex < Count - 1 do
  begin
    Ch := WideChar((Integer(Value[ByteIndex+1]) shl 8) + Integer(Value[ByteIndex]));
    Result[CharIndex] := Ch;
    if Integer(ch) = 0 then
    begin
      SetLength(Result, CharIndex-1);
      Exit;
    end;
    inc(CharIndex);
    inc(ByteIndex, 2);
  end;
  if ByteIndex < Count then
    Result[CharIndex] := WideChar(Integer(Value[ByteIndex]));
end;

class function TDBXPlatform.BytesToAnsiStr(const Value: TBytes): AnsiString;
begin
  SetString(Result, PAnsiChar(Value), Length(Value));
end;

class function TDBXPlatform.IsBoolean(const value: String): Boolean;
begin
  Result := (
              (AnsiIndexText(value,TrueBoolStrs) > -1) or
              (AnsiIndexText(value,FalseBoolStrs) > -1) or
              (AnsiCompareText(value,'true') = 0) or
              (AnsiCompareText(value,'false') = 0) );
end;

class function TDBXPlatform.JsonFloat(Value: Double): string;
var
  FormatSettings: TFormatSettings;
begin
  FormatSettings.DecimalSeparator := '.';
  Result := FloatToStr(Value, FormatSettings);
end;

class function TDBXPlatform.JsonToFloat(DotValue: String): double;
var
  FormatSettings: TFormatSettings;
begin
  FormatSettings.DecimalSeparator := '.';
  Result := StrToFloat(DotValue, FormatSettings);
end;

class function TDBXPlatform.TryJsonToFloat(DotValue: String; var Value: Double): Boolean;
var
  FormatSettings: TFormatSettings;
begin
  FormatSettings.DecimalSeparator := '.';
  Result := TryStrToFloat(DotValue, Value, FormatSettings);
end;

class procedure TDBXPlatform.WriteAsciiBytes(const Message: String;
  ByteBuffer: TBytes; Offset, Count: Integer);
var
  Index: Integer;
  curChar: char;
begin
  Write(Message+' offset: '+IntToStr(Offset)+' count: '+IntToStr(Count));
  for Index := offset to Count - 1 do
  begin
    curChar := char(ByteBuffer[Index]);
    if (curChar < ' ') or (curChar > '~') then
    begin
      Write('#');
      Write(IntToStr(Integer(curChar)));
    end else
    begin
      Write(curChar);
    end;
  end;
  Writeln;
end;

class procedure TDBXPlatform.Sleep(const Duration: Int64);
begin
  System.SysUtils.Sleep(LongWord(Duration));
end;

class function TDBXPlatform.StringOf(Data: TBytes;
  const Size: Integer): String;
begin
  SetLength(Data, Size);
  Result := System.SysUtils.StringOf(Data);
end;

class function TDBXPlatform.GetClassName(ObjectValue: TObject): UnicodeString;
begin
  Result := ObjectValue.ClassName;
end;
class function TDBXPlatform.GetNestedException(Ex: Exception): Exception;
begin
  Result := Ex.InnerException;
end;

class function TDBXPlatform.GetPublicKeyToken: string;
begin
{$IFDEF DEVELOPERS}
  Result := 'a91a7c5705831a4f';
{$ELSE}
  Result := '91d62ebb5b0d1b1b';
{$ENDIF}
end;

{ TBaseTransportFilterItem }

constructor TBaseTransportFilterItem.Create(Collection: TCollection);
begin
  inherited Create(Collection);
end;

procedure TBaseTransportFilterItem.NotifyChange;
begin
  if Assigned(FEvent) then
    FEvent(self);
end;

procedure TBaseTransportFilterItem.OnChangeNotify(filter: TBaseTransportFilterCollection);
begin
  OnChange := filter.OnChange;
end;

{TBaseTransportFactoryTools}

class function TBaseTransportFactoryTools.InvokeStringFunction(objClass: TObjectClass; methodName: string): string;
var
  retParam: Variant;
  instance: TObject;
  infoHeader: PMethodInfoHeader;
begin
  instance := objClass.Create;
  try
   infoHeader := GetMethodInfo(instance, ShortString(methodName));
   retParam := ObjectInvoke(instance, infoHeader, [], []);
   Result := String(retParam);
  finally
    instance.Free
  end;
end;

{ TFactoryObject }

constructor TFactoryObject.Create;
begin
  inherited Create;
end;

{ TBaseTransportFilterCollection }

destructor TBaseTransportFilterCollection.Destroy;
begin
  NotifyChange;
  inherited;
end;

function TBaseTransportFilterCollection.GetItem(
  Index: Integer): TCollectionItem;
begin
  Result := inherited GetItem(Index);
end;

procedure TBaseTransportFilterCollection.NotifyChange;
begin
  if Assigned(FEvent) then
    FEvent(self);
end;

{ TBaseFilterProperties }

procedure TBaseFilterProperties.Add(const Name, Value: string);
begin
  inherited Add(Name+NameValueSeparator+Value);
end;

function TBaseFilterProperties.GetName(Index: Integer): string;
begin
  Result := Names[Index];
end;

function TBaseFilterProperties.GetValue(Index: Integer): string;
begin
  Result := ValueFromIndex[Index];
end;

{ TDSInvocationMetadata }

constructor TDSInvocationMetadata.Create;
begin
  inherited;
  FQueryParams := TStringList.Create;
end;

destructor TDSInvocationMetadata.Destroy;
begin
  FreeAndNil(FQueryParams);
  inherited;
end;

end.
