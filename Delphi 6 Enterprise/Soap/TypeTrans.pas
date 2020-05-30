{*******************************************************}
{                                                       }
{ Borland Delphi Visual Component Library               }
{                SOAP Support                           }
{                                                       }
{ Copyright (c) 2001 Borland Software Corporation       }
{                                                       }
{*******************************************************}

unit TypeTrans;

interface

uses TypInfo, IntfInfo, SysUtils, InvokeRegistry;

type

  TTypeTranslator = class
  public
    constructor Create;
    destructor Destroy; override;

    function CastSoapToNative(Info: PTypeInfo;
      SoapData: WideString; NatData: Pointer; IsNull: Boolean): Boolean;
    procedure CastNativeToSoap(Info: PTypeInfo;
      var SoapData: WideString; NatData: Pointer; var IsNull: Boolean);
    procedure CastSoapToVariant(SoapInfo: PTypeInfo; SoapData: WideString; NatData: Pointer); overload;
    function CastSoapToVariant(SoapInfo: PTypeInfo; SoapData: WideString): Variant; overload;
    procedure  Base64ToVar(NatData: Pointer; SoapData: WideString);
  end;

  ETypeTransException = class(Exception);

var
  TypeTranslator: TTypeTranslator;

implementation

uses   Variants, SoapConst, EncdDecd, Types;


constructor TTypeTranslator.Create;
begin
  inherited Create;
end;

destructor TTypeTranslator.Destroy;
begin
  inherited;
end;

type
  PWideChar = ^WideChar;

function TTypeTranslator.CastSoapToVariant(SoapInfo: PTypeInfo; SoapData: WideString): Variant;
var
  SavedDecSep: Char;
  I64: Int64;
begin
  SavedDecSep := DecimalSeparator;
  try
    DecimalSeparator := '.';
    case SoapInfo.Kind of
      tkString,
      tkLString,
      tkChar:
       Result  := SoapData;
      tkInt64:
        Result := StrToInt64(Trim(SoapData));
      tkInteger:
        begin
          if GetTypeData(SoapInfo).OrdType = otULong then
          begin
            I64 := StrToInt64(Trim(SoapData));
            Result := Cardinal(I64);
          end else
            Result := StrToInt(Trim(SoapData));
        end;
      tkFloat:
        Result:= StrToFloat(Trim(SoapData));
      tkWChar,
      tkWString:
        Result := WideString(Trim(SoapData));
      tkClass:
        ;
      tkSet,
      tkMethod,

      tkArray,
      tkRecord,
      tkInterface,
      tkEnumeration,
      tkDynArray:
        raise ETypeTransException.Create(SVariantCastNotSupported);
    end;
  finally
    DecimalSeparator := SavedDecSep;
  end;
end;


procedure TTypeTranslator.CastSoapToVariant(SoapInfo: PTypeInfo; SoapData: WideString; NatData: Pointer);
var
  SavedDecSep: Char;
begin
  SavedDecSep := DecimalSeparator;
  try
    DecimalSeparator := '.';
    case SoapInfo.Kind of
      tkString,
      tkLString,
      tkChar:
        Variant(PVarData(NatData)^) := SoapData;
      tkInt64:
        Variant(PVarData(NatData)^) := StrToInt64(Trim(SoapData));
      tkInteger:
        Variant(PVarData(NatData)^) := StrToInt(Trim(SoapData));
      tkFloat:
        Variant(PVarData(NatData)^) := StrToFloat(Trim(SoapData));
      tkWChar,
      tkWString:
        Variant(PVarData(NatData)^) := WideString(SoapData);
      tkDynArray:
        begin
          if SoapInfo = TypeInfo(Types.TByteDynArray) then
            Base64ToVar(NatData, SoapData)
          else
           raise ETypeTransException.Create(SVariantCastNotSupported);
         end;
      tkClass:
        ;
      tkSet,
      tkMethod,

      tkArray,
      tkRecord,
      tkInterface,
      tkEnumeration:
        raise ETypeTransException.Create(SVariantCastNotSupported); 
    end;
  finally
    DecimalSeparator := SavedDecSep;
  end;
end;


function  TTypeTranslator.CastSoapToNative(
  Info: PTypeInfo; SoapData: WideString; NatData: Pointer; IsNull: Boolean): Boolean;
var
  ParamTypeData: PTypeData;
  SavedDecSep: Char;
begin
  SavedDecSep := DecimalSeparator;
  try
    DecimalSeparator := '.';
    Result := True;  
    if IsNull and (Info.Kind = tkVariant) then
    begin
      Variant(PVarData(NatData)^) := NULL;
      Exit;
    end;
    ParamTypeData := GetTypeData(Info);
    case Info^.Kind of
      tkInteger:
        case ParamTypeData^.OrdType of
          otSByte,
          otUByte:
            PByte(NatData)^ :=  StrToInt(Trim(SoapData));
          otSWord,
          otUWord:
            PSmallInt(NatData)^ := StrToInt(Trim(SoapData));
          otSLong,
          otULong:
            PInteger(NatData)^ := StrToInt(Trim(SoapData));
        end;
      tkFloat:
        case ParamTypeData^.FloatType of
          ftSingle:
            PSingle(NatData)^ := StrToFloat(Trim(SoapData));
          ftDouble:
            PDouble(NatData)^ := StrToFloat(Trim(SoapData));
          ftComp:
            PComp(NatData)^ := StrToFloat(Trim(SoapData));
          ftCurr:
            PCurrency(NatData)^ := StrToFloat(Trim(SoapData));
          ftExtended:
            PExtended(NatData)^ := StrToFloat(Trim(SoapData));
        end;
      tkWString:
        PWideString(NatData)^ := SoapData;
      tkString:
        PShortString(NatData)^ := SoapData;
      tkLString:
        PString(NatData)^ := SoapData;
      tkChar:
        if SoapData <> '' then
          PChar(NatData)^ := Char(SoapData[1]);
      tkWChar:
        if SoapData <> '' then
          PWideChar(NatData)^ := WideChar(SoapData[1]);
      tkInt64:
        PInt64(NatData)^ := StrToInt64(Trim(SoapData));

      tkEnumeration:
        PByte(NatData)^ :=  GetEnumValue(Info, Trim(SoapData));
      tkClass:
        ;
      tkSet,
      tkMethod,

      tkArray,
      tkRecord,
      tkInterface,


      tkDynArray:
        raise ETypeTransException.CreateFmt(SUnexpectedDataType, [ KindNameArray[Info.Kind]] );
      tkVariant:
        CastSoapToVariant(Info, SoapData, NatData);
    end;
  finally
    DecimalSeparator := SavedDecSep;
  end;
end;


// allow custom streaming for scalars ?
procedure TTypeTranslator.CastNativeToSoap(Info: PTypeInfo;
     var SoapData: WideString; NatData: Pointer; var IsNull: Boolean);
var
  TypeData: PTypeData;
  SavedDecSep: Char;
begin
  SavedDecSep := DecimalSeparator;
  try
    DecimalSeparator := '.';
    TypeData := GetTypeData(Info);
    case Info.Kind of
      tkInteger:
        case TypeData.OrdType of
          otSByte,
          otUByte:
            SoapData := IntToStr(byte(NatData^) );
          otSWord:
            SoapData := IntToStr(SmallInt(NatData^));
          otUWord:
             SoapData := IntToStr(SmallInt(NatData^));
          otSLong,
          otULong:
            SoapData := IntToStr(Integer(NatData^));
        end;
      tkFloat:
        case TypeData.FloatType of
          ftSingle:
            SoapData := FloatToStr(Single(NatData^));
          ftDouble:
            SoapData := FloatToStr(Double(NatData^));
          ftComp:
            SoapData := FloatToStr(Comp(NatData^));
          ftCurr:
            SoapData := FloatToStr(Currency(NatData^));
          ftExtended:
           SoapData := FloatToStr(Extended(NatData^));
        end;
      tkInt64:
        SoapData := IntToStr(Int64(NatData^));
      tkChar:
        SoapData := Char(NatData^);
      tkWChar:
        SoapData := WideChar(NatData^);
      tkWString:
        SoapData  := PWideString(NatData)^;
      tkString:
        SoapData := PShortString(NatData)^;
      tkLString:
        SoapData := PAnsiString(NatData)^;
    end;
  finally
    DecimalSeparator := SavedDecSep;
  end;
end;

procedure TTypeTranslator.Base64ToVar(NatData: Pointer; SoapData: WideString);
var
  Base64Dec: String;
  P: Pointer;
begin
  Base64Dec := DecodeString(SoapData);
  Variant(PVarData(NatData)^) :=  VarArrayCreate([0, Length(Base64Dec) - 1], varByte);
  P := VarArrayLock(Variant(PVarData(NatData)^));
  try
    Move(Base64Dec[1], P^, Length(Base64Dec));
  finally
    VarArrayUnLock(Variant(PVarData(NatData)^));
  end;
end;


initialization
  TypeTranslator := TTypeTranslator.Create;


finalization
  TypeTranslator.Free;

end.
