{*******************************************************}
{                                                       }
{ Borland Delphi Visual Component Library               }
{                SOAP Support                           }
{                                                       }
{ Copyright (c) 2001 Borland Software Corporation       }
{                                                       }
{*******************************************************}
unit XSBuiltIns;

interface

uses SysUtils, InvokeRegistry;

const
  SoapTimePrefix = 'T';
  XMLDateSeparator = '-';
  XMLHourOffsetMinusMarker = '-';
  XMLHourOffsetPlusMarker = '+';
  XMLTimeSeparator = ':';
  XMLMonthPos = 6;
  XMLDayPos = 9;
  XMLYearPos = 1;
  XMLMilSecPos = 10;
  XMLDefaultYearDigits = 4;
  XMLDurationStart = 'P';
  XMLDurationYear = 'Y';
  XMLDurationMonth = 'M';
  XMLDurationDay = 'D';
  XMLDurationHour = 'H';
  XMLDurationMinute = 'M';
  XMLDurationSecond = 'S';

resourcestring
  SInvalidHour = 'Invalid hour: %d';
  SInvalidMinute = 'Invalid minute: %d';
  SInvalidSecond = 'Invalid second: %d';
  SInvalidFractionSecond = 'Invalid second: %f';
  SInvalidMillisecond = 'Invalid millisecond: %d';
  SInvalidHourOffset = 'Invalid hour offset: %d';
  SInvalidDay = 'Invalid day: %d';
  SInvalidMonth = 'Invalid month: %d';
  SInvalidDuration = 'Invalid Duration String: %s';
type

{ forward declarations }

TXSDuration = class;
TXSTime = class;
TXSDate = class;
TXSDateTime = class;

{ TXSTime }

TXSTime = class(TRemotableXS)
  private
    FHour: Word;
    FMinute: Word;
    FSecond: Word;
    FMillisecond: Word;
    FHourOffset: SmallInt;
    FMinuteOffset: SmallInt;
    function BuildHourOffset: WideString;
  protected
    function GetAsTime: TDateTime;
    procedure SetAsTime(Value: TDateTime);
    procedure SetHour(const Value: Word);
    procedure SetMinute(const Value: Word);
    procedure SetSecond(const Value: Word);
    procedure SetMillisecond(const Value: Word);
    procedure SetHourOffset(const Value: SmallInt);
    procedure SetMinuteOffset(const Value: SmallInt);
  public
    function Clone: TXSTime;
    property Hour: Word read FHour write SetHour default 0;
    property Minute: Word read FMinute write SetMinute default 0;
    property Second: Word read FSecond write SetSecond default 0;
    property Millisecond: Word read FMillisecond write SetMillisecond default 0;
    property HourOffset: SmallInt read FHourOffset write SetHourOffset default 0;
    property MinuteOffset: SmallInt read FMinuteOffset write SetMinuteOffset;
    procedure XSToNative(Value: WideString); override;
    function NativeToXS: WideString; override;
    property AsTime: TDateTime read GetAsTime write SetAsTime;
end;

{ TXSDate }

TXSDate = class(TRemotableXS)
  private
    FAdditionalYearDigits: Word;
    FMonth: Word;
    FDay: Word;
    FYear: Word;
    FMaxDay: Word;
    FMaxMonth: Word;
    FMinDay: Word;
    FMinMonth: Word;
  protected
    function GetAsDate: TDateTime;
    procedure SetAsDate(Value: TDateTime);
    procedure SetMonth(const Value: Word);
    procedure SetDay(const Value: Word);
    procedure SetYear(const Value: Word);
    property MaxDay: Word read FMaxDay write FMaxDay;
    property MaxMonth: Word read FMaxMonth write FMaxMonth;
    property MinDay: Word read FMinDay write FMinDay;
    property MinMonth: Word read FMinMonth write FMinMonth;
  public
    constructor Create; override;
    property Month: Word read FMonth write SetMonth default 0;
    property Day: Word read FDay write SetDay default 0;
    property Year: Word read FYear write SetYear default 0;
    function Clone: TXSDate;
    procedure XSToNative(Value: WideString); override;
    function NativeToXS: WideString; override;
    property AsDate: TDateTime read GetAsDate write SetAsDate;
end;

{ TXSCustomDateTime }

TXSCustomDateTime = class(TRemotableXS)
  private
    FDateParam: TXSDate;
    FTimeParam: TXSTime;
  protected
    function GetAsDateTime: TDateTime;
    function GetHour: Word;
    function GetMinute: Word;
    function GetSecond: Word;
    function GetMonth: Word;
    function GetDay: Word;
    function GetYear: Word;
    function GetMillisecond: Word;
    function GetHourOffset: SmallInt;
    function GetMinuteOffset: SmallInt;
    procedure SetAsDateTime(Value: TDateTime);
    procedure SetHour(const Value: Word); virtual;
    procedure SetMinute(const Value: Word); virtual;
    procedure SetSecond(const Value: Word); virtual;
    procedure SetMillisecond(const Value: Word); virtual;
    procedure SetHourOffset(const Value: SmallInt); virtual;
    procedure SetMinuteOffset(const Value: SmallInt); virtual;
    procedure SetMonth(const Value: Word); virtual;
    procedure SetDay(const Value: Word); virtual;
    procedure SetYear(const Value: Word); virtual;
  public
    constructor Create;  override;
    destructor Destroy; override;
    property AsDateTime: TDateTime read GetAsDateTime write SetAsDateTime;
    property Hour: Word read GetHour write SetHour default 0;
    property Minute: Word read GetMinute write SetMinute default 0;
    property Second: Word read GetSecond write SetSecond default 0;
    property Month: Word read GetMonth write SetMonth default 0;
    property Day: Word read GetDay write SetDay default 0;
    property Year: Word read GetYear write SetYear default 0;
end;

{ TXSDateTime }

TXSDateTime = class(TXSCustomDateTime)
  private
    function ValidValue(Value, Subtract, Min, Max: Integer; var Remainder: Integer): Integer;
  public  
    function CompareDateTimeParam(const Value1, Value2: TXSDateTime): TXSDuration;
  public
    function Clone: TXSDateTime;
    property Millisecond: Word read GetMillisecond write SetMillisecond default 0;
    property HourOffset: SmallInt read GetHourOffset write SetHourOffset default 0;
    property MinuteOffset: SmallInt read GetMinuteOffset write SetMinuteOffset default 0;
    procedure XSToNative(Value: WideString); override;
    function NativeToXS: WideString; override;
end;

TXSDuration = class(TXSCustomDateTime)
  private
    FDecimalSecond: Double;
    function GetDecimalValue(const AParam: String; const AType: string): Double;
    function GetIntegerValue(const AParam: String; const AType: string): Integer;
    function GetNumericString(const AParam: string; const AType: String;
             const Decimals: Boolean = False): WideString;
  protected
    procedure SetDecimalSecond(const Value: Double);
  public
    constructor Create; override;
    procedure XSToNative(Value: WideString); override;
    function NativeToXS: WideString; override;
    property DecimalSecond: Double read FDecimalSecond write SetDecimalSecond;
end;

EXSDateTimeException = class(Exception);

{ Utility function }

function DateTimeToXSDateTime(Value: TDateTime; CalcLocalBias: Boolean = False): TXSDateTime;

implementation

uses SoapConst, Windows;

{ exception routines }

procedure SoapDateTimeError(const Message: string); local;
begin
  raise EXSDateTimeException.Create(Message);
end;

procedure SoapDateTimeErrorFmt(const Message: string; const Args: array of const); local;
begin
  SoapDateTimeError(Format(Message,Args));
end;

{ Utility functions }

procedure AddUTCBias(var DateTime: TXSDateTime);
var
  Info: TTimeZoneInformation;
  Status: DWORD;
begin
  Status := GetTimeZoneInformation(Info);
  if (Status = TIME_ZONE_ID_UNKNOWN) or (Status = TIME_ZONE_ID_INVALID) then
    SoapDateTimeError(SInvalidTimeZone);
  DateTime.HourOffset := Info.Bias div 60;
  DateTime.MinuteOffset := Info.Bias - (DateTime.HourOffset * 60);
end;

function DateTimeToXSDateTime(Value: TDateTime; CalcLocalBias: Boolean = False): TXSDateTime;
begin
  Result := TXSDateTime.Create;
  Result.AsDateTime := Value;
  if CalcLocalBias then
    AddUTCBias(Result);
end;

procedure ParseXMLDate(ADate: WideString; var Year, Month, Day: Word);
begin
  Year := StrToInt(Copy(ADate, XMLYearPos, 4));
  Month := StrToInt(Copy(ADate, XMLMonthPos, 2));
  Day := StrToInt(Copy(ADate, XMLDayPos, 2));
end;

function XMLDateToStr(ADate: WideString; AddDigits: Word = 0): WideString;
begin
  Result := Copy(ADate, XMLMonthPos + AddDigits, 2) + DateSeparator +
            Copy(ADate, XMLDayPos + AddDigits, 2 ) +
            DateSeparator + Copy(ADate, XMLYearPos, XMLDefaultYearDigits + AddDigits);
end;

// get Small Int Using Digits in value, positive or negative.
function IntFromValue(Value: WideString; Digits: Integer): SmallInt;
begin
  Result := 0;
  if Value[1] = '-' then
    Result := StrToInt(Value)
  else if Value <> '' then
    Result := StrToInt(Copy(Value, 1, Digits));
end;    

{ TXSTime }

function TXSTime.Clone: TXSTime;
begin
  Result := TXSTime.Create;
  Result.Hour := Hour;
  Result.Minute := Minute;
  Result.Second := Second;
  Result.MilliSecond := MilliSecond;
  Result.HourOffset := HourOffset;
  Result.MinuteOffset := MinuteOffset;
end;

procedure TXSTime.SetHour(const Value: Word);
begin
  if Value < HoursPerDay then
    FHour := Value
  else
    SoapDateTimeErrorFmt(SInvalidHour, [Value]);
end;

procedure TXSTime.SetMinute(const Value: Word);
begin
  if Value < 60 then
    FMinute := Value
  else
    SoapDateTimeErrorFmt(SInvalidMinute, [Value]);
end;

procedure TXSTime.SetSecond(const Value: Word);
begin
  if Value < 60 then
    FSecond := Value
  else
    SoapDateTimeErrorFmt(SInvalidSecond, [Value]);
end;

procedure TXSTime.SetMillisecond(const Value: Word);
begin
  if Value < 1000 then
    FMillisecond := Value
  else
    SoapDateTimeErrorFmt(SInvalidMillisecond, [Value]);
end;

procedure TXSTime.SetHourOffset(const Value: SmallInt);
begin
  if Abs(Value) <= (HoursPerDay div 2) then
    FHourOffset := Value
  else
    SoapDateTimeErrorFmt(SInvalidHourOffset, [Value]);
end;

procedure TXSTime.SetMinuteOffset(const Value: SmallInt);
begin
  if Abs(Value) < 60 then
    FMinuteOffset := Value
  else
    SoapDateTimeErrorFmt(SInvalidMinute, [Value]);
end;

procedure TXSTime.XSToNative(Value: WideString);
var
  TempValue: WideString;
  TempTime: TDateTime;
  HourOffsetPos: Integer;
begin
  TempValue := StringReplace(Copy(Value, 1, 8), XMLTimeSeparator, TimeSeparator, []);
  TempTime := StrToTime(TempValue);
  DecodeTime(TempTime, FHour, FMinute, FSecond, FMillisecond);
  TempValue := Copy(Value, XMLMilSecPos, 3);
  Millisecond := IntFromValue(TempValue, 3);
  HourOffsetPos := Pos(XMLHourOffsetMinusMarker, Value);
  if HourOffsetPos = 0 then
    HourOffsetPos := Pos(XMLHourOffsetPlusMarker, Value);
  if HourOffsetPos > 0 then
  begin
    TempValue := Copy(Value, HourOffsetPos + 1, 2);
    HourOffset := IntFromValue(TempValue, 2);
    TempValue := Copy(Value, HourOffsetPos + 4, 2);
    if TempValue <> '' then
      MinuteOffSet := IntFromValue(TempValue,2);
  end;  
end;

function TXSTime.BuildHourOffset: WideString;
var
  Marker: String;
begin
  if Abs(HourOffset) + MinuteOffset <> 0 then
  begin
    if HourOffset > 0 then
      Marker := XMLHourOffsetPlusMarker
    else
      Marker := XMLHourOffsetMinusMarker;
    Result := IntToStr(Abs(HourOffset));
    if Abs(HourOffset) < 10 then
      Result := '0' + Result;
    if Abs(MinuteOffSet) > 9 then
      Result := Result + XMLTimeSeparator + IntToStr(Abs(MinuteOffset))
    else if Abs(MinuteOffSet) > 0 then
      Result := Result + XMLTimeSeparator + '0' + IntToStr(Abs(MinuteOffset))
    else
      Result := Result + XMLTimeSeparator + '00';
    Result := Marker + Result;
  end;
end;

function TXSTime.NativeToXS: WideString;
var
  TempTime: TDateTime;
  FormatString: string;
begin
  if Hour + Minute + Second = 0 then exit;
  TempTime := EncodeTime(Hour, Minute, Second, Millisecond);   // exception thrown if invalid
  FormatString := Format('hh%snn%sss.zzz', [XMLTimeSeparator, XMLTimeSeparator]);
  Result := FormatDateTime(FormatString, TempTime) + BuildHourOffset;
end;

procedure TXSTime.SetAsTime(Value: TDateTime);
begin
  DecodeTime(Value, FHour, FMinute, FSecond, FMillisecond);
end;
function TXSTime.GetAsTime: TDateTime;
var
  TimeString: string;
  Colon: string;
begin
  Colon := TimeSeparator;
  TimeString := IntToStr(Hour) + Colon + IntToStr(Minute) + Colon +
                IntToStr(Second);
  Result := StrToTime(TimeString);
end;

{ TXSDate }


constructor TXSDate.Create;
begin
  inherited Create;
  FMaxMonth := 12;
  FMinMonth := 1;
  FMaxDay := 31;
  FMinDay := 1;
end;
  
function TXSDate.Clone: TXSDate;
begin
  Result := TXSDate.Create;
  Result.Day := Day;
  Result.Month := Month;
  Result.Year := Year;
end;

procedure TXSDate.SetMonth(const Value: Word);
begin
  if (Value <= FMaxMonth) and (Value >= FMinMonth) then
    FMonth := Value
  else
    SoapDateTimeErrorFmt(SInvalidMonth, [Value]);
end;

procedure TXSDate.SetDay(const Value: Word);
begin
  if (Value <= FMaxDay) and (Value >= FMinDay) then   // perform more complete check when all values set
    FDay := Value
  else
    SoapDateTimeErrorFmt(SInvalidDay, [Value]);
end;

procedure TXSDate.SetYear(const Value: Word);
begin
  FYear := Value
end;

procedure TXSDate.XSToNative(Value: WideString);
var
  TempDate: TDateTime;
begin
  FAdditionalYearDigits := Pos(XMLDateSeparator,Value) - (1 + XMLDefaultYearDigits);
  TempDate := StrToDate(XMLDateToStr(Value, FAdditionalYearDigits));
  DecodeDate(TempDate, FYear, FMonth, FDay);
end;

function TXSDate.NativeToXS: WideString; 
var
  TempDate: TDateTime;
  FormatString: string;
begin
  if Year + Month + Day = 0 then exit;
  TempDate := EncodeDate(Year, Month, Day);   // exception thrown if invalid
  FormatString := Format('yyyy%smm%sdd', [XMLDateSeparator, XMLDateSeparator]);
  Result := FormatDateTime(FormatString, TempDate);
end;

function TXSDate.GetAsDate: TDateTime;
var
  DateString: string;
  Slash: string;
begin
  Slash := DateSeparator;
  DateString := IntToStr(Month) + Slash + IntToStr(Day) + Slash + IntToStr(Year);
  Result := StrToDate(DateString);
end;

procedure TXSDate.SetAsDate(Value: TDateTime);
begin
  DecodeDate(Value, FYear, FMonth, FDay);
end;

{ TXSCustomDateTime }

constructor TXSCustomDateTime.Create;
begin
  Inherited Create;
  FDateParam := TXSDate.Create;
  FTimeParam := TXSTime.Create;
end;

destructor TXSCustomDateTime.Destroy;
begin
  FDateParam.Free;
  FTimeParam.Free;
  inherited Destroy;
end;

function TXSCustomDateTime.GetHour: Word;
begin
  Result := FTimeParam.Hour;
end;

function TXSCustomDateTime.GetMinute: Word;
begin
  Result := FTimeParam.Minute;
end;

function TXSCustomDateTime.GetSecond: Word;
begin
  Result := FTimeParam.Second;
end;

function TXSCustomDateTime.GetMilliSecond: Word;
begin
  Result := FTimeParam.MilliSecond;
end;

function TXSCustomDateTime.GetHourOffset: SmallInt;
begin
  Result := FTimeParam.HourOffset;
end;

function TXSCustomDateTime.GetMinuteOffset: SmallInt;
begin
  Result := FTimeParam.MinuteOffset;
end;

function TXSCustomDateTime.GetMonth: Word;
begin
  Result := FDateParam.Month;
end;

function TXSCustomDateTime.GetDay: Word;
begin
  Result := FDateParam.Day;
end;

function TXSCustomDateTime.GetYear: Word;
begin
  Result := FDateParam.Year;
end;

procedure TXSCustomDateTime.SetHour(const Value: Word);
begin
  FTimeParam.SetHour(Value);
end;

procedure TXSCustomDateTime.SetMinute(const Value: Word);
begin
  FTimeParam.SetMinute(Value);
end;

procedure TXSCustomDateTime.SetSecond(const Value: Word);
begin
  FTimeParam.SetSecond(Value);
end;

procedure TXSCustomDateTime.SetMillisecond(const Value: Word);
begin
  FTimeParam.SetMillisecond(Value);
end;

procedure TXSCustomDateTime.SetHourOffset(const Value: SmallInt);
begin
  FTimeParam.SetHourOffset(Value);
end;

procedure TXSCustomDateTime.SetMinuteOffset(const Value: SmallInt);
begin
  FTimeParam.SetMinuteOffset(Value);
end;

procedure TXSCustomDateTime.SetMonth(const Value: Word);
begin
  FDateParam.SetMonth(Value);
end;

procedure TXSCustomDateTime.SetDay(const Value: Word);
begin
  FDateParam.SetDay(Value);
end;

procedure TXSCustomDateTime.SetYear(const Value: Word);
begin
  FDateParam.SetYear(Value);
end;

procedure TXSCustomDateTime.SetAsDateTime(Value: TDateTime);
begin
  FDateParam.AsDate := Value;
  FTimeParam.AsTime := Value;
end;

function TXSCustomDateTime.GetAsDateTime: TDateTime;
var
  DateString: string;
  Slash: string;
  Colon: string;
begin
  Slash := DateSeparator;
  Colon := TimeSeparator;
  DateString := IntToStr(Month) + Slash + IntToStr(Day) + Slash + IntToStr(Year)
                + ' ' + IntToStr(Hour) + Colon + IntToStr(Minute) + Colon +
                IntToStr(Second);
  Result := StrToDateTime(DateString);
end;

{ TXSDateTime }

function TXSDateTime.Clone: TXSDateTime;
begin
  Result := TXSDateTime.Create;
  Result.FDateParam.Day := Day;
  Result.FDateParam.Month := Month;
  Result.FDateParam.Year := Year;
  Result.FTimeParam.Hour := Hour;
  Result.FTimeParam.Minute := Minute;
  Result.FTimeParam.Second := Second;
  Result.FTimeParam.MilliSecond := MilliSecond;
  Result.FTimeParam.HourOffset := HourOffset;
  Result.FTimeParam.MinuteOffset := MinuteOffset;
end;

procedure TXSDateTime.XSToNative(Value: WideString);
var
  TimeString, DateString: WideString;
  TimePosition: Integer;
begin
  TimePosition := Pos(SoapTimePrefix, Value);
  if TimePosition > 0 then
  begin
    DateString := Copy(Value, 1, TimePosition -1);
    TimeString := Copy(Value, TimePosition + 1, Length(Value) - TimePosition);
    FDateParam.XSToNative(DateString);
    FTimeParam.XSToNative(TimeString);
  end else
    FDateParam.XSToNative(Value);
end;

function TXSDateTime.NativeToXS: WideString;
var
  TimeString: WideString;
begin
  TimeString := FTimeParam.NativeToXS;
  if TimeString <> '' then
    Result := FDateParam.NativeToXS + SoapTimePrefix + TimeString
  else
    Result := FDateParam.NativeToXS;
end;

function TXSDateTime.ValidValue(Value, Subtract, Min, Max: Integer; var Remainder: Integer): Integer;
begin
  Result := Value - Subtract;
  Remainder := 0;
  if Result < Min then
  begin
    Remainder := 1;
    Inc(Result,Max);
  end;  
end;

function TXSDateTime.CompareDateTimeParam(const Value1, Value2: TXSDateTime): TXSDuration;
var
  Remainder, Milliseconds, Seconds: Integer;
begin
    Result := TXSDuration.Create;
    try
      MilliSeconds := ValidValue(Value1.Millisecond, Value2.Millisecond, 0, 1000, Remainder);
      Seconds := ValidValue(Value1.Second + Remainder, Value2.Second, 0, 60, Remainder);
      Result.DecimalSecond := Seconds + Milliseconds / 1000;
      Result.Minute := ValidValue(Value1.Minute + Remainder, Value2.Minute, 0, 60, Remainder);
      Result.Hour := ValidValue(Value1.Hour + Remainder, Value2.Hour, 0, 24, Remainder);
      Result.Day := ValidValue(Value1.Day + Remainder, Value2.Day, 0, 31, Remainder);
      Result.Month := ValidValue(Value1.Month + Remainder, Value2.Month, 0, 12, Remainder);
      Result.Year := ValidValue(Value1.Year + Remainder, Value2.Year, -9999, 0, Remainder);
    except
      Result.Free;
      Result := nil;
    end;
end;

{ TXSDuration }

constructor TXSDuration.Create;
begin
  inherited Create;
  FDateParam.MaxDay := 30;
  FDateParam.MinDay := 0;
  FDateParam.MaxMonth := 11;
  FDateParam.MinMonth := 0;
end;

procedure TXSDuration.SetDecimalSecond(const Value: Double);
begin
  if Value < 60 then
    FDecimalSecond := Value
  else  
    SoapDateTimeErrorFmt(SInvalidFractionSecond, [Value]);
end;

function TXSDuration.GetNumericString(const AParam: string; const AType: string;
         const Decimals: Boolean = False): WideString;
var
  I, J: Integer;
begin
  I := Pos(AType, AParam);
  J := I;
  while (I > 0) and ((AParam[I-1] in ['0'..'9']) or
        (Decimals and (AParam[I-1] = '.'))) do
    Dec(I);
  if J > I then
    Result := Copy(AParam, I, J-I)
  else
    Result := '0';  
end;

function TXSDuration.GetIntegerValue(const AParam: string; const AType: string): Integer;
begin
  Result := StrToInt(GetNumericString(AParam, AType));
end;

function TXSDuration.GetDecimalValue(const AParam: string; const AType: string): Double;
begin
  Result := StrToFloat(GetNumericString(AParam, AType, True));
end;

procedure TXSDuration.XSToNative(Value: WideString);
var
  DateString, TimeString: string;
  TimePosition: Integer;
begin
  if Value[1] <> XMLDurationStart then
    SoapDateTimeErrorFmt(SInvalidDuration, [Value]);
  TimePosition := Pos(SoapTimePrefix, Value);
  if TimePosition > 0 then
  begin
    TimeString := Copy(Value, TimePosition + 1, Length(Value) - TimePosition);
    DateString := Copy(Value, 1, TimePosition - 1);
  end else
    DateString := Value;
  Year := GetIntegerValue(DateString, XMLDurationYear);
  Month := GetIntegerValue(DateString, XMLDurationMonth);
  Day := GetIntegerValue(DateString, XMLDurationDay);
  if TimePosition > 0 then
  begin
    Hour := GetIntegerValue(TimeString, XMLDurationHour);
    Minute := GetIntegerValue(TimeString, XMLDurationMinute);
    DecimalSecond := GetDecimalValue(TimeString, XMLDurationSecond);
  end;
end;

{ format is 'P1Y2M3DT10H30M12.3S' }
function TXSDuration.NativeToXS: WideString;
begin
  Result := XMLDurationStart +
              IntToStr(Year) + XMLDurationYear +
              IntToStr(Month) + XMLDurationMonth +
              IntToStr(Day) + XMLDurationDay + SoapTimePrefix +
              IntToStr(Hour) + XMLDurationHour +
              IntToStr(Minute) + XMLDurationMinute +
              FloatToStr(DecimalSecond) + XMLDurationSecond;
end;

initialization
  RemClassRegistry.RegisterXSClass(TXSDateTime, XMLSchemaNameSpace, 'dateTime', '',True );
  RemClassRegistry.RegisterXSClass(TXSTime, XMLSchemaNameSpace, 'time', '', True );
  RemClassRegistry.RegisterXSClass(TXSDate, XMLSchemaNameSpace, 'date', '', True );
  RemClassRegistry.RegisterXSClass(TXSDuration, XMLSchemaNameSpace, 'duration', '', True );
finalization
  RemClassRegistry.UnRegisterXSClass(TXSDateTime);
  RemClassRegistry.UnRegisterXSClass(TXSTime);
  RemClassRegistry.UnRegisterXSClass(TXSDate);
  RemClassRegistry.UnRegisterXSClass(TXSDuration);
end.



