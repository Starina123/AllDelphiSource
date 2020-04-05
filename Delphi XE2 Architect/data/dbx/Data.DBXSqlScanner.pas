{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBXSqlScanner;

interface

uses
  Data.DBXPlatform;

type
  TDBXSqlScanner = class
  public
    constructor Create(const QuoteChar: UnicodeString; const QuotePrefix: UnicodeString; const QuoteSuffix: UnicodeString);
    destructor Destroy; override;
    procedure RegisterId(const Id: UnicodeString; const Token: Integer);
    procedure Init(const Query: UnicodeString); overload;
    procedure Init(const Query: UnicodeString; const StartIndex: Integer); overload;
    function LookAtNextToken: Integer;
    function NextToken: Integer;
    function IsKeyword(const Keyword: UnicodeString): Boolean;
  protected
    function GetId: UnicodeString;
  private
    class function ToQuoteChar(const QuoteString: UnicodeString): WideChar; static;
    procedure ResetId;
    function ScanNumber: Integer;
    function QuotedToken: Integer;
    function PrefixQuotedToken: Integer;
    function UnquotedToken: Integer;
    function ScanSymbol: Integer;
    procedure SkipToEndOfLine;
  private
    FQuotePrefix: UnicodeString;
    FQuoteSuffix: UnicodeString;
    FQuote: UnicodeString;
    FQuotePrefixChar: WideChar;
    FQuoteSuffixChar: WideChar;
    FQuoteChar: WideChar;
    FKeywords: TDBXObjectStore;
    FQuery: UnicodeString;
    FQueryLength: Integer;
    FIndex: Integer;
    FStartOfId: Integer;
    FEndOfId: Integer;
    FId: UnicodeString;
    FWasId: Boolean;
    FWasQuoted: Boolean;
    FSymbol: WideChar;
  public
    property Id: UnicodeString read GetId;
    property Quoted: Boolean read FWasQuoted;
    property Symbol: WideChar read FSymbol;
    property SqlQuery: UnicodeString read FQuery;
    property NextIndex: Integer read FIndex;
  public
    const TokenEos = -1;
    const TokenId = -2;
    const TokenComma = -3;
    const TokenPeriod = -4;
    const TokenSemicolon = -5;
    const TokenOpenParen = -6;
    const TokenCloseParen = -7;
    const TokenNumber = -8;
    const TokenSymbol = -9;
    const TokenError = -10;
  end;

implementation

uses
  Data.DBXMetaDataUtil,
  System.SysUtils,
  Data.DBXCommonResStrs;

constructor TDBXSqlScanner.Create(const QuoteChar: UnicodeString; const QuotePrefix: UnicodeString; const QuoteSuffix: UnicodeString);
begin
  inherited Create;
  self.FQuotePrefix := QuotePrefix;
  self.FQuoteSuffix := QuoteSuffix;
  self.FQuote := QuoteChar;
  self.FQuotePrefixChar := ToQuoteChar(QuotePrefix);
  self.FQuoteSuffixChar := ToQuoteChar(QuoteSuffix);
  self.FQuoteChar := ToQuoteChar(QuoteChar);
end;

destructor TDBXSqlScanner.Destroy;
begin
  FreeAndNil(FKeywords);
  inherited Destroy;
end;

procedure TDBXSqlScanner.RegisterId(const Id: UnicodeString; const Token: Integer);
begin
  if FKeywords = nil then
    FKeywords := TDBXObjectStore.Create;
  FKeywords[WideLowerCase(Id)] := TDBXInt32Object.Create(Token);
end;

procedure TDBXSqlScanner.Init(const Query: UnicodeString);
begin
  Init(Query, 0);
end;

procedure TDBXSqlScanner.Init(const Query: UnicodeString; const StartIndex: Integer);
begin
  self.FQuery := Query;
  self.FQueryLength := Length(Query);
  self.FIndex := StartIndex;
  ResetId;
end;

class function TDBXSqlScanner.ToQuoteChar(const QuoteString: UnicodeString): WideChar;
begin
  if (StringIsNil(QuoteString)) or (Length(QuoteString) = 0) then
    Result := #$0
  else if Length(QuoteString) > 1 then
    raise Exception.Create(SIllegalArgument)
  else 
    Result := QuoteString[1+0];
end;

function TDBXSqlScanner.LookAtNextToken: Integer;
var
  Save: Integer;
  Token: Integer;
begin
  Save := FIndex;
  Token := NextToken;
  FIndex := Save;
  Result := Token;
end;

function TDBXSqlScanner.NextToken: Integer;
var
  Ch: WideChar;
begin
  ResetId;
  while FIndex < FQueryLength do
  begin
    Ch := FQuery[1+IncrAfter(FIndex)];
    case Ch of
      ' ',
      #$9,
      #$d,
      #$a:;
      '(':
        begin
          FSymbol := Ch;
          Exit(TokenOpenParen);
        end;
      ')':
        begin
          FSymbol := Ch;
          Exit(TokenCloseParen);
        end;
      ',':
        begin
          FSymbol := Ch;
          Exit(TokenComma);
        end;
      '.':
        begin
          FSymbol := Ch;
          Exit(TokenPeriod);
        end;
      ';':
        begin
          FSymbol := Ch;
          Exit(TokenSemicolon);
        end;
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9':
        Exit(ScanNumber);
      else
        if Ch = FQuoteChar then
          Exit(QuotedToken)
        else if Ch = FQuotePrefixChar then
          Exit(PrefixQuotedToken)
        else if IsIdentifierStart(Ch) then
          Exit(UnquotedToken)
        else if (Ch = '-') and (FIndex < FQueryLength) and (FQuery[1+FIndex] = '-') then
          SkipToEndOfLine
        else 
          Exit(ScanSymbol);
    end;
  end;
  Result := TokenEos;
end;

function TDBXSqlScanner.GetId: UnicodeString;
begin
  if StringIsNil(FId) then
  begin
    FId := Copy(FQuery,FStartOfId+1,FEndOfId-(FStartOfId));
    if FWasQuoted then
      FId := TDBXMetaDataUtil.UnquotedIdentifier(FId, FQuote, FQuotePrefix, FQuoteSuffix);
  end;
  Result := FId;
end;

function TDBXSqlScanner.IsKeyword(const Keyword: UnicodeString): Boolean;
begin
  Result := FWasId and (Keyword = Id);
end;

procedure TDBXSqlScanner.ResetId;
begin
  FId := NullString;
  FStartOfId := 0;
  FEndOfId := 0;
  FWasId := False;
  FWasQuoted := False;
  FSymbol := #$0;
end;

function TDBXSqlScanner.ScanNumber: Integer;
var
  Ch: WideChar;
begin
  FStartOfId := FIndex - 1;
  while FIndex < FQueryLength do
  begin
    Ch := FQuery[1+IncrAfter(FIndex)];
    case Ch of
      '.',
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9':;
      else
        begin
          Dec(FIndex);
          FEndOfId := FIndex;
          Exit(TokenNumber);
        end;
    end;
  end;
  FEndOfId := FIndex - 1;
  Result := TokenNumber;
end;

function TDBXSqlScanner.QuotedToken: Integer;
var
  Ch: WideChar;
begin
  FStartOfId := FIndex - 1;
  while FIndex < FQueryLength do
  begin
    Ch := FQuery[1+IncrAfter(FIndex)];
    if Ch = FQuoteChar then
    begin
      if (FIndex = FQueryLength) or (FQuery[1+FIndex] <> FQuoteChar) then
      begin
        FEndOfId := FIndex;
        FWasId := True;
        FWasQuoted := True;
        Exit(TokenId);
      end;
      IncrAfter(FIndex);
    end;
  end;
  Result := TokenError;
end;

function TDBXSqlScanner.PrefixQuotedToken: Integer;
var
  Ch: WideChar;
begin
  FStartOfId := FIndex - 1;
  while FIndex < FQueryLength do
  begin
    Ch := FQuery[1+IncrAfter(FIndex)];
    if Ch = FQuoteSuffixChar then
    begin
      FEndOfId := FIndex;
      FWasId := True;
      FWasQuoted := True;
      Exit(TokenId);
    end;
  end;
  Result := TokenError;
end;

function TDBXSqlScanner.UnquotedToken: Integer;
var
  Token: Integer;
  Ch: WideChar;
  Keyword: TDBXInt32Object;
begin
  Token := TokenId;
  FStartOfId := FIndex - 1;
  while FIndex < FQueryLength do
  begin
    Ch := FQuery[1+IncrAfter(FIndex)];
    if not IsIdentifierPart(Ch) then
    begin
      Dec(FIndex);
      break;
    end;
  end;
  FEndOfId := FIndex;
  FWasId := True;
  if FKeywords <> nil then
  begin
    Keyword := TDBXInt32Object(FKeywords[WideLowerCase(Id)]);
    if Keyword <> nil then
      Token := Keyword.IntValue;
  end;
  Result := Token;
end;

function TDBXSqlScanner.ScanSymbol: Integer;
begin
  FSymbol := FQuery[1+FIndex - 1];
  Result := TokenSymbol;
end;

procedure TDBXSqlScanner.SkipToEndOfLine;
var
  Ch: WideChar;
begin
  Ch := '-';
  while ((Ch <> #$d) and (Ch <> #$a)) and (FIndex < FQueryLength) do
    Ch := FQuery[1+IncrAfter(FIndex)];
end;

end.
