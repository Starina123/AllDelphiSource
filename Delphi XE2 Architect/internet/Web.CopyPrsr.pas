{*******************************************************}
{                                                       }
{                Delphi Runtime Library                 }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

{ *************************************************************************** }
{                                                                             }
{ Licensees holding a valid Borland No-Nonsense License for this Software may }
{ use this file in accordance with such license, which appears in the file    }
{ license.txt that came with this Software.                                   }
{                                                                             }
{ *************************************************************************** }

unit Web.CopyPrsr;

interface

uses System.Classes;

const
  toEOL     = AnsiChar(5);
  toEOF     = AnsiChar(0);
  toSymbol  = AnsiChar(1);
  toString  = AnsiChar(2);
  toInteger = AnsiChar(3);
  toFloat   = AnsiChar(4);

type
{ TCopyParser }

  TCopyParser = class(TObject)
  private
    FStream: TStream;
    FOutStream: TStream;
    FOrigin: Int64;
    FBuffer: PAnsiChar;
    FBufPtr: PAnsiChar;
    FBufEnd: PAnsiChar;
    FSourcePtr: PAnsiChar;
    FSourceEnd: PAnsiChar;
    FTokenPtr: PAnsiChar;
    FStringPtr: PAnsiChar;
    FSourceLine: Integer;
    FSaveChar: AnsiChar;
    FToken: AnsiChar;
    procedure ReadBuffer;
    procedure SkipBlanks(DoCopy: Boolean);
    function SkipToNextToken(CopyBlanks, DoCopy: Boolean): AnsiChar;
    function CopySkipTo(Length: Integer; DoCopy: Boolean): AnsiString;
    function CopySkipToToken(AToken: AnsiChar; DoCopy: Boolean): AnsiString;
    function CopySkipToEOL(DoCopy: Boolean): AnsiString;
    function CopySkipToEOF(DoCopy: Boolean): AnsiString;
    procedure UpdateOutStream(StartPos: PAnsiChar);
  public
    constructor Create(Stream, OutStream: TStream);
    destructor Destroy; override;
    procedure CheckToken(T: AnsiChar);
    procedure CheckTokenSymbol(const S: AnsiString);
    function CopyTo(Length: Integer): AnsiString;
    function CopyToToken(AToken: AnsiChar): AnsiString;
    function CopyToEOL: AnsiString;
    function CopyToEOF: AnsiString;
    procedure CopyTokenToOutput;
    procedure Error(const Ident: string);
    procedure ErrorFmt(const Ident: string; const Args: array of const);
    procedure ErrorStr(const Message: string);
    function NextToken: AnsiChar;
    function SkipToken(CopyBlanks: Boolean): AnsiChar;
    procedure SkipEOL;
    function SkipTo(Length: Integer): AnsiString;
    function SkipToToken(AToken: AnsiChar): AnsiString;
    function SkipToEOL: AnsiString;
    function SkipToEOF: AnsiString;
    function SourcePos: Int64;
    function TokenComponentIdent: AnsiString;
    function TokenFloat: Extended;
    function TokenInt: Longint;
    function TokenString: AnsiString;
    function TokenSymbolIs(const S: AnsiString): Boolean;
    property SourceLine: Integer read FSourceLine;
    property Token: AnsiChar read FToken;
    property OutputStream: TStream read FOutStream write FOutStream;
  end;

implementation

uses System.SysUtils, System.RTLConsts;

{ TCopyParser }

const
  ParseBufSize = 4096;

constructor TCopyParser.Create(Stream, OutStream: TStream);
var
  I: Integer;
begin
  FStream := Stream;
  FOutStream := OutStream;
  GetMem(FBuffer, ParseBufSize * sizeof(AnsiChar));
  for I := ParseBufSize-1 downto 0 do  // testing
    FBuffer[I] := #0;
  FBuffer[0] := #0;
  FBufPtr := FBuffer;
  FBufEnd := FBuffer + ParseBufSize;
  FSourcePtr := FBuffer;
  FSourceEnd := FBuffer;
  FTokenPtr := FBuffer;
  FSourceLine := 1;
  SkipToken(True);
end;

destructor TCopyParser.Destroy;
begin
  if FBuffer <> nil then
  begin
    FStream.Seek(IntPtr(FTokenPtr) - IntPtr(FBufPtr), 1);
    FreeMem(FBuffer, ParseBufSize);
  end;
end;

procedure TCopyParser.CheckToken(T: AnsiChar);
begin
  if Token <> T then
    case T of
      toSymbol:
        Error(SIdentifierExpected);
      Web.CopyPrsr.toString:
        Error(SStringExpected);
      toInteger, toFloat:
        Error(SNumberExpected);
    else
      ErrorFmt(SCharExpected, [T]);
    end;
end;

procedure TCopyParser.CheckTokenSymbol(const S: AnsiString);
begin
  if not TokenSymbolIs(S) then ErrorFmt(SSymbolExpected, [S]);
end;

function TCopyParser.CopySkipTo(Length: Integer; DoCopy: Boolean): AnsiString;
var
  P: PAnsiChar;
  Temp: AnsiString;
begin
  Result := '';
  repeat
    P := FTokenPtr;
    while (Length > 0) and (P^ <> #0) do
    begin
      Inc(P);
      Dec(Length);
    end;
    if DoCopy and (FOutStream <> nil) then
        FOutStream.WriteBuffer(FTokenPtr^, P - FTokenPtr);
    SetString(Temp, FTokenPtr, P - FTokenPtr);
    Result := Result + Temp;
    if Length > 0 then ReadBuffer;
  until (Length = 0) or (Token = toEOF);
  FSourcePtr := P;
end;

function TCopyParser.CopySkipToEOL(DoCopy: Boolean): AnsiString;
var
  P: PAnsiChar;
begin
  P := FTokenPtr;
  while not (P^ in [#13, #10, #0]) do Inc(P);
  SetString(Result, FTokenPtr, P - FTokenPtr);
  if P^ = #13 then Inc(P);
  FSourcePtr := P;
  if DoCopy then UpdateOutStream(FTokenPtr);
  NextToken;
end;

function TCopyParser.CopySkipToEOF(DoCopy: Boolean): AnsiString;
var
  P: PAnsiChar;
  Temp: AnsiString;
begin
  repeat
    P := FTokenPtr;
    while P^ <> #0 do Inc(P);
    FSourcePtr := P;
    SetString(Temp, FTokenPtr, P - FTokenPtr);
    Result := Result + Temp;
    if DoCopy then
    begin
      UpdateOutStream(FTokenPtr);
      NextToken;
    end else SkipToken(False);
    FTokenPtr := FSourcePtr;
  until Token = toEOF;
end;

function TCopyParser.CopySkipToToken(AToken: AnsiChar; DoCopy: Boolean): AnsiString;
var
  S: PAnsiChar;
  Temp: AnsiString;

  procedure InternalSkipBlanks;
  begin
    while True do
    begin
      case FSourcePtr^ of
        #0:
          begin
            SetString(Temp, S, FSourcePtr - S);
            Result := Result + Temp;
            if DoCopy then UpdateOutStream(S);
            ReadBuffer;
            if FSourcePtr^ = #0 then Exit;
            S := FSourcePtr;
            Continue;
          end;
        #10:
          Inc(FSourceLine);
        #33..#255:
          Break;
      end;
      Inc(FSourcePtr);
    end;
    if DoCopy then UpdateOutStream(S);
  end;

var
  InSingleQuote, InDoubleQuote: Boolean;
  Found: Boolean;
begin
  InSingleQuote := False;
  InDoubleQuote := False;
  Found := False;
  Result := '';
  while (not Found) and (Token <> toEOF) do
  begin
    S := FSourcePtr;
    InternalSkipBlanks;
    if S <> FSourcePtr then
    begin
      SetString(Temp, S, FSourcePtr - S);
      Result := Result + Temp;
    end;
    SkipToNextToken(DoCopy, DoCopy);
    if Token = '"' then
      InDoubleQuote := not InDoubleQuote and not InSingleQuote
    else if Token = '''' then
      InSingleQuote := not InSingleQuote and not InDoubleQuote;
    Found := (Token = AToken) and
         (((Token = '"') and (not InSingleQuote)) or
          ((Token = '''') and (not InDoubleQuote)) or
           not (InDoubleQuote or InSingleQuote));
    if not Found then
    begin
      SetString(Temp, FTokenPtr, FSourcePtr - FTokenPtr);
      Result := Result + Temp;
    end;
  end;
end;

function TCopyParser.CopyTo(Length: Integer): AnsiString;
begin
  Result := CopySkipTo(Length, True);
end;

function TCopyParser.CopyToToken(AToken: AnsiChar): AnsiString;
begin
  Result := CopySkipToToken(AToken, True);
end;

function TCopyParser.CopyToEOL: AnsiString;
begin
  Result := CopySkipToEOL(True);
end;

function TCopyParser.CopyToEOF: AnsiString;
begin
  Result := CopySkipToEOF(True);
end;

procedure TCopyParser.CopyTokenToOutput;
begin
  UpdateOutStream(FTokenPtr);
end;

procedure TCopyParser.Error(const Ident: string);
begin
  ErrorStr(Ident);
end;

procedure TCopyParser.ErrorFmt(const Ident: string; const Args: array of const);
begin
  ErrorStr(Format(Ident, Args));
end;

procedure TCopyParser.ErrorStr(const Message: string);
begin
  raise EParserError.CreateResFmt(@SParseError, [Message, FSourceLine]);
end;

function TCopyParser.NextToken: AnsiChar;
begin
  Result := SkipToNextToken(True, True);
end;

function TCopyParser.SkipTo(Length: Integer): AnsiString;
begin
  Result := CopySkipTo(Length, False);
end;

function TCopyParser.SkipToToken(AToken: AnsiChar): AnsiString;
begin
  Result := CopySkipToToken(AToken, False);
end;

function TCopyParser.SkipToEOL: AnsiString;
begin
  Result := CopySkipToEOL(False);
end;

function TCopyParser.SkipToEOF: AnsiString;
begin
  Result := CopySkipToEOF(False);
end;

function TCopyParser.SkipToNextToken(CopyBlanks, DoCopy: Boolean): AnsiChar;
var
  P, StartPos: PAnsiChar;
begin
  SkipBlanks(CopyBlanks);
  P := FSourcePtr;
  FTokenPtr := P;
  case P^ of
    'A'..'Z', 'a'..'z', '_':
      begin
        Inc(P);
        while P^ in ['A'..'Z', 'a'..'z', '0'..'9', '_'] do Inc(P);
        Result := toSymbol;
      end;
    #10:
      begin
        Inc(P);
        Inc(FSourceLine);
        Result := toEOL;
      end;
  else
    Result := P^;
    if Result <> toEOF then Inc(P);
  end;
  StartPos := FSourcePtr;
  FSourcePtr := P;
  if DoCopy then UpdateOutStream(StartPos);
  FToken := Result;
end;

function TCopyParser.SkipToken(CopyBlanks: Boolean): AnsiChar;
begin
  Result := SkipToNextToken(CopyBlanks, False);
end;

procedure TCopyParser.ReadBuffer;
var
  Count: Integer;
begin
  Inc(FOrigin, FSourcePtr - FBuffer);
  FSourceEnd[0] := FSaveChar;
  Count := FBufPtr - FSourcePtr;
  if Count <> 0 then Move(FSourcePtr[0], FBuffer[0], Count);
  FBufPtr := FBuffer + Count;
  Inc(FBufPtr, FStream.Read(FBufPtr[0], (FBufEnd - FBufPtr) * sizeof(AnsiChar)));
  FSourcePtr := FBuffer;
  FSourceEnd := FBufPtr;
  if FSourceEnd = FBufEnd then
  begin
    FSourceEnd := LineStart(FBuffer, FSourceEnd - 1);
    if FSourceEnd = FBuffer then Error(SLineTooLong);
  end;
  FSaveChar := FSourceEnd[0];
  FSourceEnd[0] := #0;
end;

procedure TCopyParser.SkipBlanks(DoCopy: Boolean);
var
  Start: PAnsiChar;
begin
  Start := FSourcePtr;
  while True do
  begin
    case FSourcePtr^ of
      #0:
        begin
          if DoCopy then UpdateOutStream(Start);
          ReadBuffer;
          if FSourcePtr^ = #0 then Exit;
          Start := FSourcePtr;
          Continue;
        end;
      #10:
        Inc(FSourceLine);
      #33..#255:
        Break;
    end;
    Inc(FSourcePtr);
  end;
  if DoCopy then UpdateOutStream(Start);
end;

function TCopyParser.SourcePos: Int64;
begin
  Result := FOrigin + (FTokenPtr - FBuffer);
end;

procedure TCopyParser.SkipEOL;
begin
  if Token = toEOL then
  begin
    while FTokenPtr^ in [#13, #10] do Inc(FTokenPtr);
    FSourcePtr := FTokenPtr;
    if FSourcePtr^ <> #0 then
      NextToken
    else FToken := #0;
  end;
end;

function TCopyParser.TokenFloat: Extended;
begin
  Result := StrToFloat(string(TokenString));
end;

function TCopyParser.TokenInt: Longint;
begin
  Result := StrToInt(string(TokenString));
end;

function TCopyParser.TokenString: AnsiString;
var
  L: Int64;
begin
  if FToken = Web.CopyPrsr.toString then
    L := FStringPtr - FTokenPtr else
    L := FSourcePtr - FTokenPtr;
  SetString(Result, FTokenPtr, L);
end;

function TCopyParser.TokenSymbolIs(const S: AnsiString): Boolean;
begin
  Result := (Token = toSymbol) and (AnsiStrComp(PAnsiChar(S), PAnsiChar(TokenString)) = 0);
end;

function TCopyParser.TokenComponentIdent: AnsiString;
var
  P: PAnsiChar;
begin
  CheckToken(toSymbol);
  P := FSourcePtr;
  while P^ = '.' do
  begin
    Inc(P);
    if not (P^ in ['A'..'Z', 'a'..'z', '_']) then
      Error(SIdentifierExpected);
    repeat
      Inc(P)
    until not (P^ in ['A'..'Z', 'a'..'z', '0'..'9', '_']);
  end;
  FSourcePtr := P;
  Result := TokenString;
end;

procedure TCopyParser.UpdateOutStream(StartPos: PAnsiChar);
begin
  if FOutStream <> nil then
    FOutStream.WriteBuffer(StartPos^, FSourcePtr - StartPos);
end;

end.
