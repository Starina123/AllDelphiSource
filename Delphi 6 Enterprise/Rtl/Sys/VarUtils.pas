{ *********************************************************************** }
{                                                                         }
{ Delphi / Kylix Cross-Platform Runtime Library                           }
{ Variant Utilities Unit                                                  }
{                                                                         }
{ Copyright (c) 1995-2001 Borland Software Corporation                    }
{                                                                         }
{ *********************************************************************** }

unit VarUtils;

interface

// These entry points are used by Variants.pas.  The generic versions
//  of these routines (which are enabled if this unit is compiled under
//  an operating system other than Windows) are as similar as possible to
//  their Windows counter parts.  Please note that there are differences
//  but they have been kept to a minimum.

function VariantInit(var V: TVarData): HRESULT; stdcall;
function VariantClear(var V: TVarData): HRESULT; stdcall;
function VariantCopy(var Dest: TVarData;
  const Source: TVarData): HRESULT; stdcall;
function VariantCopyInd(var Dest: TVarData;
  const Source: TVarData): HRESULT; stdcall;
function VariantChangeTypeEx(var Dest: TVarData; const Source: TVarData;
  LCID: Integer; Flags: Word; VarType: Word): HRESULT; stdcall;

function SafeArrayCreate(VarType, DimCount: Integer;
  const Bounds: TVarArrayBoundArray): PVarArray; stdcall;
function SafeArrayAllocDescriptor(DimCount: Integer;
  out VarArray: PVarArray): HRESULT; stdcall;
function SafeArrayAllocData(VarArray: PVarArray): HRESULT; stdcall;

function SafeArrayDestroy(VarArray: PVarArray): HRESULT; stdcall;
function SafeArrayDestroyDescriptor(VarArray: PVarArray): HRESULT; stdcall;
function SafeArrayDestroyData(VarArray: PVarArray): HRESULT; stdcall;

function SafeArrayRedim(VarArray: PVarArray; const NewBound: TVarArrayBound): HRESULT; stdcall;
function SafeArrayCopy(SourceArray: PVarArray; out TargetArray: PVarArray): HRESULT; stdcall;
function SafeArrayCopyData(SourceArray, TargetArray: PVarArray): HRESULT; stdcall;

function SafeArrayGetLBound(VarArray: PVarArray; Dim: Integer;
  out LBound: Integer): HRESULT; stdcall;
function SafeArrayGetUBound(VarArray: PVarArray; Dim: Integer;
  out UBound: Integer): HRESULT; stdcall;
function SafeArrayGetDim(VarArray: PVarArray): Integer; stdcall;

function SafeArrayAccessData(VarArray: PVarArray;
  out Data: Pointer): HRESULT; stdcall;
function SafeArrayUnaccessData(VarArray: PVarArray): HRESULT; stdcall;
function SafeArrayLock(VarArray: PVarArray): HRESULT; stdcall;
function SafeArrayUnlock(VarArray: PVarArray): HRESULT; stdcall;

function SafeArrayGetElement(VarArray: PVarArray; Indices: PVarArrayCoorArray;
  Data: Pointer): HRESULT; stdcall;
function SafeArrayPutElement(VarArray: PVarArray; Indices: PVarArrayCoorArray;
  const Data: Pointer): HRESULT; stdcall;
function SafeArrayPtrOfIndex(VarArray: PVarArray; Indices: PVarArrayCoorArray;
  var Address: Pointer): HRESULT; stdcall;
function SafeArrayGetElemSize(VarArray: PVarArray): LongWord; stdcall;

// These equate to Window's constants but are renamed to less OS dependent
const
  VAR_OK            = HRESULT($00000000); // = Windows.S_OK
  VAR_TYPEMISMATCH  = HRESULT($80020005); // = Windows.DISP_E_TYPEMISMATCH
  VAR_BADVARTYPE    = HRESULT($80020008); // = Windows.DISP_E_BADVARTYPE
  VAR_EXCEPTION     = HRESULT($80020009); // = Windows.DISP_E_EXCEPTION
  VAR_OVERFLOW      = HRESULT($8002000A); // = Windows.DISP_E_OVERFLOW
  VAR_BADINDEX      = HRESULT($8002000B); // = Windows.DISP_E_BADINDEX
  VAR_ARRAYISLOCKED = HRESULT($8002000D); // = Windows.DISP_E_ARRAYISLOCKED
  VAR_NOTIMPL       = HRESULT($80004001); // = Windows.E_NOTIMPL
  VAR_OUTOFMEMORY   = HRESULT($8007000E); // = Windows.E_OUTOFMEMORY
  VAR_INVALIDARG    = HRESULT($80070057); // = Windows.E_INVALIDARG
  VAR_UNEXPECTED    = HRESULT($8000FFFF); // = Windows.E_UNEXPECTED

  ARR_NONE          = $0000;  { no flags set }
  ARR_FIXEDSIZE     = $0010;  { ActiveX.FADF_FIXEDSIZE, array may not be resized or reallocated }
  ARR_OLESTR        = $0100;  { ActiveX.FADF_BSTR, an array of BSTRs }
  ARR_UNKNOWN       = $0200;  { ActiveX.FADF_UNKNOWN, an array of IUnknown }
  ARR_DISPATCH      = $0400;  { ActiveX.FADF_DISPATCH, an array of IDispatch }
  ARR_VARIANT       = $0800;  { ActiveX.FADF_VARIANT, an array of VARIANTs }

type
  TVarTypeToElementInfo = record
    ValidBase: Boolean;
    ValidElement: Boolean;
    Size: Integer;
    Flags: Word;
  end;

const
  CMinArrayVarType = varEmpty;
  CMaxArrayVarType = $0015; // varWord64 if that actually existed
  CVarTypeToElementInfo: array [CMinArrayVarType..CMaxArrayVarType] of TVarTypeToElementInfo = (

    { * = unsupported as of VCLv6  }
    { varEmpty/vt_empty        $00 }
    (ValidBase: False; ValidElement:  True; Size:  0; Flags: ARR_NONE),
    { varNull/vt_null          $01 }
    (ValidBase: False; ValidElement:  True; Size:  0; Flags: ARR_NONE),
    { varSmallint/vt_i2        $02 }
    (ValidBase:  True; ValidElement:  True; Size:  2; Flags: ARR_NONE),
    { varInteger/vt_i4         $03 }
    (ValidBase:  True; ValidElement:  True; Size:  4; Flags: ARR_NONE),
    { varSingle/vt_r4          $04 }
    (ValidBase:  True; ValidElement:  True; Size:  4; Flags: ARR_NONE),
    { varDouble/vt_r8          $05 }
    (ValidBase:  True; ValidElement:  True; Size:  8; Flags: ARR_NONE),
    { varCurrency/vt_cy        $06 }
    (ValidBase:  True; ValidElement:  True; Size:  8; Flags: ARR_NONE),
    { varDate/vt_date          $07 }
    (ValidBase:  True; ValidElement:  True; Size:  8; Flags: ARR_NONE),
    { varOleStr/vt_bstr        $08 }
    (ValidBase:  True; ValidElement:  True; Size:  4; Flags: ARR_OLESTR),
    { varDispatch/vt_dispatch  $09 }
    (ValidBase:  True; ValidElement:  True; Size:  4; Flags: ARR_DISPATCH),
    { varError/vt_error        $0A }
    (ValidBase:  True; ValidElement:  True; Size:  4; Flags: ARR_NONE),
    { varBoolean/vt_bool       $0B }
    (ValidBase:  True; ValidElement:  True; Size:  2; Flags: ARR_NONE),
    { varVariant/vt_variant    $0C }
    (ValidBase:  True; ValidElement:  True; Size: 16; Flags: ARR_VARIANT),
    { varUnknown/vt_unknown    $0D }
    (ValidBase:  True; ValidElement:  True; Size:  4; Flags: ARR_UNKNOWN),
    {*varDecimal/vt_decimal    $0E }
    (ValidBase: False; ValidElement: False; Size: 14; Flags: ARR_NONE),
    {*unused/undefined         $0F }
    (ValidBase: False; ValidElement: False; Size:  0; Flags: ARR_NONE),
    { varShortInt/vt_i1        $10 }
    (ValidBase:  True; ValidElement:  True; Size:  1; Flags: ARR_NONE),
    { varByte/vt_ui1           $11 }
    (ValidBase:  True; ValidElement:  True; Size:  1; Flags: ARR_NONE),
    { varWord/vt_ui2           $12 }
    (ValidBase:  True; ValidElement:  True; Size:  2; Flags: ARR_NONE),
    { varSmallWord/vt_ui4      $13 }
    (ValidBase:  True; ValidElement:  True; Size:  4; Flags: ARR_NONE),
    { varInt64/vt_i8           $14 }
    (ValidBase: False; ValidElement: False; Size:  8; Flags: ARR_NONE),
    {*varWord64/vt_ui8         $15 }
    (ValidBase: False; ValidElement: False; Size:  8; Flags: ARR_NONE));

implementation

{******************************************************************************}
{ WIN32 functions                                                              }
{******************************************************************************}
{$IFDEF MSWINDOWS}
const
  oleaut = 'oleaut32.dll';

function VariantInit; external oleaut name 'VariantInit';
function VariantClear; external oleaut name 'VariantClear';
function VariantCopy; external oleaut name 'VariantCopy';
function VariantCopyInd; external oleaut name 'VariantCopyInd';
function VariantChangeTypeEx; external oleaut name 'VariantChangeTypeEx';

function SafeArrayCreate; external oleaut name 'SafeArrayCreate';
function SafeArrayAllocDescriptor; external oleaut name 'SafeArrayAllocDescriptor';
function SafeArrayAllocData; external oleaut name 'SafeArrayAllocData';
function SafeArrayDestroy; external oleaut name 'SafeArrayDestroy';
function SafeArrayDestroyDescriptor; external oleaut name 'SafeArrayDestroyDescriptor';
function SafeArrayDestroyData; external oleaut name 'SafeArrayDestroyData';
function SafeArrayRedim; external oleaut name 'SafeArrayRedim';
function SafeArrayCopy; external oleaut name 'SafeArrayCopy';
function SafeArrayCopyData; external oleaut name 'SafeArrayCopyData';
function SafeArrayGetLBound; external oleaut name 'SafeArrayGetLBound';
function SafeArrayGetUBound; external oleaut name 'SafeArrayGetUBound';
function SafeArrayGetDim; external oleaut name 'SafeArrayGetDim';
function SafeArrayAccessData; external oleaut name 'SafeArrayAccessData';
function SafeArrayUnaccessData; external oleaut name 'SafeArrayUnaccessData';
function SafeArrayLock; external oleaut name 'SafeArrayLock';
function SafeArrayUnlock; external oleaut name 'SafeArrayUnlock';
function SafeArrayGetElement; external oleaut name 'SafeArrayGetElement';
function SafeArrayPutElement; external oleaut name 'SafeArrayPutElement';
function SafeArrayPtrOfIndex; external oleaut name 'SafeArrayPtrOfIndex';
function SafeArrayGetElemSize; external oleaut name 'SafeArrayGetElemsize';

{******************************************************************************}
{ Generic functions                                                            }
{******************************************************************************}
{$ELSE}
uses
  Libc, SysUtils;

function VariantInit(var V: TVarData): HRESULT;
begin
  Result := VAR_OK;
  V.VType := varEmpty;
  FillChar(V.VBytes, SizeOf(V.VBytes), 0);
end;

function VariantClear(var V: TVarData): HRESULT;
begin
  Result := VAR_OK;

  // var is an array
  if (V.VType and varArray) <> 0 then
    Result := SafeArrayDestroy(V.VArray)
  else
  begin

    // var is not byref
    if (V.VType and varByRef) = 0 then
      case V.VType of
        varEmpty, varNull, varSmallint, varInteger, varSingle, varDouble,
        varCurrency, varDate, varError, varBoolean, varShortInt, varByte,
        varWord, varLongWord:;
          // the fill char later on will take care of these
        varOleStr:
          WideString(Pointer(V.VOleStr)) := '';
        varDispatch:
          IUnknown(V.VDispatch) := nil;
        //varVariant:
        //  taken care of by the above ByRef code but we should error if not
        varUnknown:
          IUnknown(V.VUnknown) := nil;
      else
        Result := VAR_BADVARTYPE;
      end;
  end;

  // all is swell so lets slick it
  if Result = VAR_OK then
    Result := VariantInit(V);
end;

function VariantCopy(var Dest: TVarData; const Source: TVarData): HRESULT;
begin
  // Dest is pointing to the source, nothing need be done
  if @Source = @Dest then
    Result := VAR_OK
  else
  begin

    // wipe out the destination
    Result := VariantClear(Dest);
    if Result = VAR_OK then
    begin

      // var is an array!
      if (Source.VType and varArray) <> 0 then
        Result := SafeArrayCopy(Source.VArray, Dest.VArray)
      else
      begin
        if (Source.VType and varByRef) <> 0 then // var is byref
          Dest.VPointer := Source.VPointer
        else
          case (Source.VType and varTypeMask) of // strip off modifier flags
            varEmpty, varNull:;
              // nothing do!
            varSmallint, varInteger, varSingle, varDouble, varCurrency, varDate,
            varError, varBoolean, varShortInt, varByte, varWord, varLongWord:
              Move(Source.VBytes, Dest.VBytes, SizeOf(Dest.VBytes));
            varOleStr:
              WideString(Pointer(Dest.VOleStr)) := Copy(Source.VOleStr, 1, MaxInt);
            varDispatch:
              IUnknown(Dest.VDispatch) := IUnknown(Source.VDispatch);
            //varVariant:
            //  taken care of by the above ByRef code but we should error if not
            varUnknown:
              IUnknown(Dest.VUnknown) := IUnknown(Source.VUnknown);
          else
            Result := VAR_BADVARTYPE;
          end;
      end;

      // if all is swell then copy over the VType
      if Result = VAR_OK then
        Dest.VType := Source.VType;
    end;
  end;
end;

function VariantCopyInd(var Dest: TVarData; const Source: TVarData): HRESULT;
begin
  if (Source.VType and varByRef) = 0 then // var is NOT byref, so just copy
    Result := VariantCopy(Dest, Source)
  else if (Source.VType and varArray) <> 0 then // var is an array, bad!
    Result := VAR_INVALIDARG
  else
  begin
    Result := VAR_OK;
    case (Source.VType and varTypeMask) of // strip off modifier flags
      varEmpty, varNull:;
        // do nothing
      varSmallint:
        Dest.VSmallInt := PSmallInt(Source.VPointer)^;
      varInteger:
        Dest.VInteger := PInteger(Source.VPointer)^;
      varSingle:
        Dest.VSingle := PSingle(Source.VPointer)^;
      varDouble:
        Dest.VDouble := PDouble(Source.VPointer)^;
      varCurrency:
        Dest.VCurrency := PCurrency(Source.VPointer)^;
      varDate:
        Dest.VDate := PDate(Source.VPointer)^;
      varOleStr:
        WideString(Pointer(Dest.VOleStr)) := Copy(PPWideChar(Source.VPointer)^, 1, MaxInt);
      varDispatch:
        IUnknown(Dest.VDispatch) := IUnknown(PDispatch(Source.VPointer)^);
      varError:
        Dest.VError := System.PError(Source.VPointer)^;
      varBoolean:
        Dest.VBoolean := PWordBool(Source.VPointer)^;
      varVariant:
        Variant(Dest) := PVariant(Source.VPointer)^; { this in turn will cause a VarCopy[Ind] }
      varUnknown:
        IUnknown(Dest.VUnknown) := IUnknown(PUnknown(Source.VPointer)^);
      varShortInt:
        Dest.VShortInt := PShortInt(Source.VPointer)^;
      varByte:
        Dest.VByte := PByte(Source.VPointer)^;
      varWord:
        Dest.VWord := PWord(Source.VPointer)^;
      varLongWord:
        Dest.VLongWord := PLongWord(Source.VPointer)^;
    else
      Result := VAR_BADVARTYPE;
    end;
    if Result = VAR_OK then
      Dest.VType := Source.VType and VarTypeMask; // strip off modifier flags
  end;
end;

function VariantChangeTypeEx(var Dest: TVarData; const Source: TVarData;
  LCID: Integer; Flags: Word; VarType: Word): HRESULT;
var
  LSource: TVarData;
begin
  if ((Source.VType and varArray) <> 0) or // we don't support arrays either as
     ((VarType and varArray) <> 0) or      //  source or destination and
     ((VarType and varByRef) <> 0) then    //  we also don't support ByRef dest
    Result := VAR_INVALIDARG
  else
  begin
    // this will take care of both ByRef Source and Dest = Source
    Result := VariantCopyInd(LSource, Source);
    if Result = VAR_OK then
    try
      Result := VariantClear(Dest);
      {$RANGECHECKS ON}
      if Result = VAR_OK then
      try
        case (LSource.VType and varTypeMask) of // strip off modifier flags
          varEmpty:
            case VarType of
              varEmpty, varNull, varSmallInt, varInteger, varSingle, varDouble,
              varCurrency, varDate, varOleStr, varBoolean, varShortInt, varByte,
              varWord, varLongWord:;
                // these are taken care of by the above Dest clear
            else
              Result := VAR_TYPEMISMATCH;
            end;
          varNull:
            Result := VAR_TYPEMISMATCH;
          varSmallint:
            case VarType of
              varEmpty:;
              varSmallInt:
                Dest.VSmallInt := LSource.VSmallInt;
              varInteger:
                Dest.VInteger := LSource.VSmallInt;
              varSingle:
                Dest.VSingle := LSource.VSmallInt;
              varDouble:
                Dest.VDouble := LSource.VSmallInt;
              varCurrency:
                Dest.VCurrency := LSource.VSmallInt;
              varDate:
                Dest.VDate := FloatToDateTime(LSource.VSmallInt); // range?
              varOleStr:
                WideString(Pointer(Dest.VOleStr)) := IntToStr(LSource.VSmallInt);
              varBoolean:
                Dest.VBoolean := LSource.VSmallInt <> 0;
              varShortInt:
                Dest.VShortInt := LSource.VSmallInt; // range?
              varByte:
                Dest.VByte := LSource.VSmallInt; // range?
              varWord:
                Dest.VWord := LSource.VSmallInt; // range?
              varLongWord:
                Dest.VLongWord := LSource.VSmallInt; // range?
            else
              Result := VAR_TYPEMISMATCH;
            end;
          varInteger:
            case VarType of
              varEmpty:;
              varSmallInt:
                Dest.VSmallInt := LSource.VInteger; // range?
              varInteger:
                Dest.VInteger := LSource.VInteger;
              varSingle:
                Dest.VSingle := LSource.VInteger;
              varDouble:
                Dest.VDouble := LSource.VInteger;
              varCurrency:
                Dest.VCurrency := LSource.VInteger;
              varDate:
                Dest.VDate := FloatToDateTime(LSource.VInteger); // range?
              varOleStr:
                WideString(Pointer(Dest.VOleStr)) := IntToStr(LSource.VInteger);
              varBoolean:
                Dest.VBoolean := LSource.VInteger <> 0;
              varShortInt:
                Dest.VShortInt := LSource.VInteger; // range?
              varByte:
                Dest.VByte := LSource.VInteger; // range?
              varWord:
                Dest.VWord := LSource.VInteger; // range?
              varLongWord:
                Dest.VLongWord := LSource.VInteger; // range?
            else
              Result := VAR_TYPEMISMATCH;
            end;
          varSingle:
            case VarType of
              varEmpty:;
              varSmallInt:
                Dest.VSmallInt := Round(LSource.VSingle); // range?
              varInteger:
                Dest.VInteger := Round(LSource.VSingle); // range?
              varSingle:
                Dest.VSingle := LSource.VSingle;
              varDouble:
                Dest.VDouble := LSource.VSingle;
              varCurrency:
                Dest.VCurrency := FloatToCurr(LSource.VSingle); // range?
              varDate:
                Dest.VDate := FloatToDateTime(LSource.VSingle); // range?
              varOleStr:
                WideString(Pointer(Dest.VOleStr)) := FloatToStr(LSource.VSingle);
              varBoolean:
                Dest.VBoolean := LSource.VSingle <> 0;
              varShortInt:
                Dest.VShortInt := Round(LSource.VSingle); // range?
              varByte:
                Dest.VByte := Round(LSource.VSingle); // range?
              varWord:
                Dest.VWord := Round(LSource.VSingle); // range?
              varLongWord:
                Dest.VLongWord := Round(LSource.VSingle); // range?
            else
              Result := VAR_TYPEMISMATCH;
            end;
          varDouble:
            case VarType of
              varEmpty:;
              varSmallInt:
                Dest.VSmallInt := Round(LSource.VDouble); // range?
              varInteger:
                Dest.VInteger := Round(LSource.VDouble); // range?
              varSingle:
                Dest.VSingle := LSource.VDouble; // range?
              varDouble:
                Dest.VDouble := LSource.VDouble;
              varCurrency:
                Dest.VCurrency := FloatToCurr(LSource.VDouble); // range?
              varDate:
                Dest.VDate := FloatToDateTime(LSource.VDouble); // range?
              varOleStr:
                WideString(Pointer(Dest.VOleStr)) := FloatToStr(LSource.VDouble);
              varBoolean:
                Dest.VBoolean := LSource.VDouble <> 0;
              varShortInt:
                Dest.VShortInt := Round(LSource.VDouble); // range?
              varByte:
                Dest.VByte := Round(LSource.VDouble); // range?
              varWord:
                Dest.VWord := Round(LSource.VDouble); // range?
              varLongWord:
                Dest.VLongWord := Round(LSource.VDouble); // range?
            else
              Result := VAR_TYPEMISMATCH;
            end;
          varCurrency:
            case VarType of
              varEmpty:;
              varSmallInt:
                Dest.VSmallInt := Round(LSource.VCurrency); // range?
              varInteger:
                Dest.VInteger := Round(LSource.VCurrency); // range?
              varSingle:
                Dest.VSingle := LSource.VCurrency; // range?
              varDouble:
                Dest.VDouble := LSource.VCurrency;
              varCurrency:
                Dest.VCurrency := LSource.VCurrency;
              varDate:
                Dest.VDate := FloatToDateTime(LSource.VCurrency); // range?
              varOleStr:
                WideString(Pointer(Dest.VOleStr)) := CurrToStr(LSource.VCurrency);
              varBoolean:
                Dest.VBoolean := LSource.VCurrency <> 0;
              varShortInt:
                Dest.VShortInt := Round(LSource.VCurrency); // range?
              varByte:
                Dest.VByte := Round(LSource.VCurrency); // range?
              varWord:
                Dest.VWord := Round(LSource.VCurrency); // range?
              varLongWord:
                Dest.VLongWord := Round(LSource.VCurrency); // range?
            else
              Result := VAR_TYPEMISMATCH;
            end;
          varDate:
            case VarType of
              varEmpty:;
              varSmallInt:
                Dest.VSmallInt := Round(LSource.VDate); // range?
              varInteger:
                Dest.VInteger := Round(LSource.VDate); // range?
              varSingle:
                Dest.VSingle := LSource.VDate;
              varDouble:
                Dest.VDouble := LSource.VDate;
              varCurrency:
                Dest.VCurrency := FloatToCurr(LSource.VDate); // range?
              varDate:
                Dest.VDate := LSource.VDate;
              varOleStr:
                begin
                  if Trunc(LSource.VDate) = 0 then
                    WideString(Pointer(Dest.VOleStr)) := TimeToStr(LSource.VDate)
                  else
                    WideString(Pointer(Dest.VOleStr)) := DateTimeToStr(LSource.VDate);
                end;
              varBoolean:
                Dest.VBoolean := LSource.VDate <> 0;
              varShortInt:
                Dest.VShortInt := Round(LSource.VDate); // range?
              varByte:
                Dest.VByte := Round(LSource.VDate); // range?
              varWord:
                Dest.VWord := Round(LSource.VDate); // range?
              varLongWord:
                Dest.VLongWord := Round(LSource.VDate); // range?
            else
              Result := VAR_TYPEMISMATCH;
            end;
          varOleStr:
            case VarType of
              varEmpty:;
              varSmallInt:
                Dest.VSmallInt := StrToInt(WideString(LSource.VOleStr)); // conversion & range?
              varInteger:
                Dest.VInteger := StrToInt(WideString(LSource.VOleStr)); // conversion & range?
              varSingle:
                Dest.VSingle := StrToFloat(WideString(LSource.VOleStr)); // conversion & range?
              varDouble:
                Dest.VDouble := StrToFloat(WideString(LSource.VOleStr)); // conversion & range?
              varCurrency:
                Dest.VCurrency := StrToCurr(WideString(LSource.VOleStr)); // conversion & range?
              varDate:
                Dest.VDate := StrToDateTime(WideString(LSource.VOleStr)); // conversion & range?
              varOleStr:
                WideString(Pointer(Dest.VOleStr)) := Copy(LSource.VOleStr, 1, MaxInt);
              varBoolean:
                Dest.VBoolean := StrToBool(WideString(LSource.VOleStr)); // conversion & range?
              varShortInt:
                Dest.VShortInt := StrToInt(WideString(LSource.VOleStr)); // conversion & range?
              varByte:
                Dest.VByte := StrToInt(WideString(LSource.VOleStr)); // conversion & range?
              varWord:
                Dest.VWord := StrToInt(WideString(LSource.VOleStr)); // conversion & range?
              varLongWord:
                Dest.VLongWord := StrToInt(WideString(LSource.VOleStr)); // conversion & range?
            else
              Result := VAR_TYPEMISMATCH;
            end;
          varDispatch:
            Result := VAR_TYPEMISMATCH;
          varError:
            Result := VAR_TYPEMISMATCH;
          varBoolean:
            case VarType of
              varEmpty:;
              varSmallInt:
                Dest.VSmallInt := SmallInt(LSource.VBoolean);
              varInteger:
                Dest.VInteger := Integer(LSource.VBoolean);
              varSingle:
                Dest.VSingle := Integer(LSource.VBoolean);
              varDouble:
                Dest.VDouble := Integer(LSource.VBoolean);
              varCurrency:
                Dest.VCurrency := Integer(LSource.VBoolean);
              varDate:
                Dest.VDate := Integer(LSource.VBoolean);
              varOleStr:
                WideString(Pointer(Dest.VOleStr)) := BoolToStr(LSource.VBoolean);
              varBoolean:
                Dest.VBoolean := LSource.VBoolean;
              varShortInt:
                Dest.VShortInt := ShortInt(LSource.VBoolean);
              varByte:
                Dest.VByte := Byte(LSource.VBoolean);
              varWord:
                Dest.VWord := Word(LSource.VBoolean);
              varLongWord:
                Dest.VLongWord := LongWord(LSource.VBoolean);
            else
              Result := VAR_TYPEMISMATCH;
            end;
          varVariant:
            Result := VAR_TYPEMISMATCH;
          varUnknown:
            Result := VAR_TYPEMISMATCH;
          varShortInt:
            case VarType of
              varEmpty:;
              varSmallInt:
                Dest.VSmallInt := LSource.VSmallInt;
              varInteger:
                Dest.VInteger := LSource.VSmallInt;
              varSingle:
                Dest.VSingle := LSource.VSmallInt;
              varDouble:
                Dest.VDouble := LSource.VSmallInt;
              varCurrency:
                Dest.VCurrency := LSource.VSmallInt;
              varDate:
                Dest.VDate := LSource.VSmallInt;
              varOleStr:
                WideString(Pointer(Dest.VOleStr)) := IntToStr(LSource.VSmallInt);
              varBoolean:
                Dest.VBoolean := LSource.VSmallInt <> 0;
              varShortInt:
                Dest.VShortInt := LSource.VSmallInt;
              varByte:
                Dest.VByte := LSource.VSmallInt;
              varWord:
                Dest.VWord := LSource.VSmallInt;
              varLongWord:
                Dest.VLongWord := LSource.VSmallInt;
            else
              Result := VAR_TYPEMISMATCH;
            end;
          varByte:
            case VarType of
              varEmpty:;
              varSmallInt:
                Dest.VSmallInt := LSource.VByte;
              varInteger:
                Dest.VInteger := LSource.VByte;
              varSingle:
                Dest.VSingle := LSource.VByte;
              varDouble:
                Dest.VDouble := LSource.VByte;
              varCurrency:
                Dest.VCurrency := LSource.VByte;
              varDate:
                Dest.VDate := LSource.VByte;
              varOleStr:
                WideString(Pointer(Dest.VOleStr)) := IntToStr(LSource.VByte);
              varBoolean:
                Dest.VBoolean := LSource.VByte <> 0;
              varShortInt:
                Dest.VShortInt := LSource.VByte;
              varByte:
                Dest.VByte := LSource.VByte;
              varWord:
                Dest.VWord := LSource.VByte;
              varLongWord:
                Dest.VLongWord := LSource.VByte;
            else
              Result := VAR_TYPEMISMATCH;
            end;
          varWord:
            case VarType of
              varEmpty:;
              varSmallInt:
                Dest.VSmallInt := LSource.VWord;
              varInteger:
                Dest.VInteger := LSource.VWord;
              varSingle:
                Dest.VSingle := LSource.VWord;
              varDouble:
                Dest.VDouble := LSource.VWord;
              varCurrency:
                Dest.VCurrency := LSource.VWord;
              varDate:
                Dest.VDate := LSource.VWord;
              varOleStr:
                WideString(Pointer(Dest.VOleStr)) := IntToStr(LSource.VWord);
              varBoolean:
                Dest.VBoolean := LSource.VWord <> 0;
              varShortInt:
                Dest.VShortInt := LSource.VWord;
              varByte:
                Dest.VByte := LSource.VWord;
              varWord:
                Dest.VWord := LSource.VWord;
              varLongWord:
                Dest.VLongWord := LSource.VWord;
            else
              Result := VAR_TYPEMISMATCH;
            end;
          varLongWord:
            case VarType of
              varEmpty:;
              varSmallInt:
                Dest.VSmallInt := LSource.VLongWord;
              varInteger:
                Dest.VInteger := LSource.VLongWord;
              varSingle:
                Dest.VSingle := LSource.VLongWord;
              varDouble:
                Dest.VDouble := LSource.VLongWord;
              varCurrency:
                Dest.VCurrency := LSource.VLongWord;
              varDate:
                Dest.VDate := LSource.VLongWord;
              varOleStr:
                WideString(Pointer(Dest.VOleStr)) := IntToStr(LSource.VLongWord);
              varBoolean:
                Dest.VBoolean := LSource.VLongWord <> 0;
              varShortInt:
                Dest.VShortInt := LSource.VLongWord;
              varByte:
                Dest.VByte := LSource.VLongWord;
              varWord:
                Dest.VWord := LSource.VLongWord;
              varLongWord:
                Dest.VLongWord := LSource.VLongWord;
            else
              Result := VAR_TYPEMISMATCH;
            end;
        else
          Result := VAR_BADVARTYPE;
        end;
        if Result = VAR_OK then
          Dest.VType := VarType;
      except
        // string to int conversion error
        // string to float conversion error
        // string to currency conversion error
        // string to datetime conversion error
        // float to currency conversion error
        // float to datetime conversion error
        on EConvertError do
          Result := VAR_TYPEMISMATCH;

        // float range error
        on EOverflow do
          Result := VAR_OVERFLOW;
        on EUnderflow do
          Result := VAR_OVERFLOW;

        // int range error
        on ERangeError do
          Result := VAR_OVERFLOW;

        // rounding overflow, possible during string conversion
        on EIntOverflow do
          Result := VAR_OVERFLOW;

        // something really really bad happened
        on EOutOfMemory do
          Result := VAR_OUTOFMEMORY;

      // catch all else
      else
        Result := VAR_INVALIDARG;
      end;
      {$RANGECHECKS OFF}
    finally
      VariantClear(LSource);
    end;
  end;
end;

type
  TSafeArrayValidateCheck = (savLockCheck);
  TSafeArrayValidateChecks = set of TSafeArrayValidateCheck;
const
  cCheckAll: TSafeArrayValidateChecks = [savLockCheck];

function SafeArrayValidate(VarArray: PVarArray; AndCheck: TSafeArrayValidateChecks = []): HRESULT;
const
  cResults: array [Boolean] of HRESULT = (VAR_INVALIDARG, VAR_OK);
  cLockResult: array [Boolean] of HRESULT = (VAR_ARRAYISLOCKED, VAR_OK);
begin
  Result := cResults[VarArray <> nil];
  if (savLockCheck in AndCheck) and
     (Result = VAR_OK)  then
    Result := cLockResult[VarArray^.LockCount = 0];
end;

function SafeArrayCalculateElementAddress(VarArray: PVarArray; AElement: Integer): Pointer;
begin
  Result := Pointer(Integer(VarArray^.Data) + (AElement * VarArray^.ElementSize));
end;

function SafeArrayValidateAndCalculateAddress(VarArray: PVarArray;
  Indices: PVarArrayCoorArray; var Address: Pointer; Lockit: Boolean): HRESULT;
  function CountElements(LDim: Integer): Integer;
  begin
    Result := 1;
    if LDim < VarArray^.DimCount then
      Result := CountElements(LDim + 1) + VarArray^.Bounds[LDim - 1].ElementCount;
  end;
var
  LDim: Integer;
  LLow, LHigh: Integer;
  LElement: Integer;
begin
  // validate the array
  Result := SafeArrayValidate(VarArray);
  Address := nil;
  LElement := 0;

  // if all is swell so far
  if Result = VAR_OK then
  begin

    // validate the indices first
    for LDim := 1 to VarArray^.DimCount do
    begin
      LLow := VarArray^.Bounds[LDim - 1].LowBound;
      LHigh := LLow + VarArray^.Bounds[LDim - 1].ElementCount;
      if (LLow = LHigh) or
         ((Indices^[LDim - 1] < LLow) or
          (Indices^[LDim - 1] > LHigh)) then
      begin
        Result := VAR_BADINDEX;
        Break;
      end;

      // continue to calculate the element count
      Inc(LElement, (Indices^[LDim - 1] - LLow) * CountElements(LDim + 1));
    end;

    // all is swell?
    if Result = VAR_OK then
    begin
      Address := SafeArrayCalculateElementAddress(VarArray, LElement);

      // finally lets lock it we need to
      if LockIt then
        Result := SafeArrayLock(VarArray);
    end;
  end;
end;

function SafeArrayElementTotal(VarArray: PVarArray): Integer;
var
  LDim: Integer;
begin
  Result := 1;
  for LDim := 0 to VarArray^.DimCount - 1 do
    Result := Result * VarArray^.Bounds[LDim].ElementCount;
end;

type
  TElementStyle = (esNormal, esReference, esOleStr, esVariant);

function SafeArrayElementStyle(VarArray: PVarArray): TElementStyle;
begin
  // interface type thingy
  if ((VarArray^.Flags and ARR_DISPATCH) <> 0) or
     ((VarArray^.Flags and ARR_UNKNOWN) <> 0) then
    Result := esReference

  // string type thingy
  else if (VarArray^.Flags and ARR_OLESTR) <> 0 then
    Result := esOleStr

  // variant type thingy
  else if (VarArray^.Flags and ARR_VARIANT) <> 0 then
    Result := esVariant

  // otherwise is just a normal thingy
  else
    Result := esNormal;
end;

function SafeArrayClearDataSpace(VarArray: PVarArray; WipeBytes: Boolean = True): HRESULT;
var
  LElement: Integer;
  LAddress: Pointer;
  LElementStyle: TElementStyle;
begin
  Result := VAR_OK;

  // just in case
  try

    // what type of data do we have?
    LElementStyle := SafeArrayElementStyle(VarArray);
    case LElementStyle of

      // simple fill
      esNormal:
        if WipeBytes then
          FillChar(VarArray^.Data^, SafeArrayElementTotal(VarArray) *
                                    VarArray^.ElementSize, 0);

      // we have to go though each element
      esReference, esOleStr, esVariant:
        for LElement := 0 to SafeArrayElementTotal(VarArray) - 1 do
        begin
          LAddress := SafeArrayCalculateElementAddress(VarArray, LElement);

          // do the right thing
          case LElementStyle of
            esReference:
              IUnknown(LAddress) := nil;
            esOleStr:
              WideString(LAddress) := '';
            esVariant:
              Result := VariantClear(PVarData(LAddress)^);
          else
            Result := VAR_EXCEPTION;
          end;
        end;
    end;

  // oops!
  except
    // something really really bad happened
    on EOutOfMemory do
      Result := VAR_OUTOFMEMORY;

  // catch all else
  else
    Result := VAR_EXCEPTION;
  end;
end;

function SafeArrayCopyDataSpace(SourceArray, TargetArray: PVarArray): HRESULT;
var
  LElement: Integer;
  LSource, LTarget: Pointer;
  LElementStyle: TElementStyle;
begin
  Result := VAR_OK;

  // just in case
  try

    // what type of data do we have?
    LElementStyle := SafeArrayElementStyle(SourceArray);
    case LElementStyle of

      // simple fill
      esNormal:
        Move(SourceArray^.Data^, TargetArray^.Data^, SafeArrayElementTotal(SourceArray) *
                                                     SourceArray^.ElementSize);

      // we have to go though each element
      esReference, esOleStr, esVariant:
        for LElement := 0 to SafeArrayElementTotal(SourceArray) - 1 do
        begin
          LSource := SafeArrayCalculateElementAddress(SourceArray, LElement);
          LTarget := SafeArrayCalculateElementAddress(TargetArray, LElement);

          // do the right thing
          case LElementStyle of
            esReference:
              IUnknown(PUnknown(LTarget)) := IUnknown(PUnknown(LSource));
            esOleStr:
              WideString(Pointer(LTarget)) := Copy(PWideChar(LSource), 1, MaxInt);
            esVariant:
              Result := VariantCopy(PVarData(LTarget)^, PVarData(LSource)^);
          else
            Result := VAR_EXCEPTION;
          end;
        end;
    end;

  // oops!
  except
    // something really really bad happened
    on EOutOfMemory do
      Result := VAR_OUTOFMEMORY;

  // catch all else
  else
    Result := VAR_EXCEPTION;
  end;
end;

function SafeArrayAllocMem(const Size: LongWord): Pointer;
begin
  Result := Libc.calloc(1, Size);
end;

procedure SafeArrayFreeMem(const Address: Pointer);
begin
  Libc.free(Address);
end;

procedure SafeArrayReallocMem(var Address: Pointer; const OldSize, NewSize: LongWord);
var
  Temp: Pointer;
begin
  if Address <> nil then
  begin
    if NewSize > 0 then
    begin
      Temp := SafeArrayAllocMem(NewSize);
      Move(Address^, Temp^, OldSize);
      SafeArrayFreeMem(Address);
      Address := Temp;
    end
    else
    begin
      SafeArrayFreeMem(Address);
      Address := nil;
    end;
  end else
    Address := SafeArrayAllocMem(NewSize);
end;

function SafeArrayCreate(VarType, DimCount: Integer; const Bounds: TVarArrayBoundArray): PVarArray;
var
  LResult: HRESULT;
  LDim: Integer;
begin
  Result := nil;

  // is this something we want to deal with?
  if (VarType in [CMinArrayVarType..CMaxArrayVarType]) and
     CVarTypeToElementInfo[VarType].ValidBase then
  begin

    // make room for the descriptor
    LResult := SafeArrayAllocDescriptor(DimCount, Result);
    if LResult = VAR_OK then
    begin

      // add our bits of information
      Result^.DimCount := DimCount;
      Result^.Flags := cVarTypeToElementInfo[VarType].Flags;
      Result^.ElementSize := cVarTypeToElementInfo[VarType].Size;

      // fill in the bounds info
      for LDim := 0 to Result^.DimCount - 1 do
      begin
        Result^.Bounds[LDim].ElementCount := Bounds[DimCount - LDim - 1].ElementCount;
        Result^.Bounds[LDim].LowBound := Bounds[DimCount - LDim - 1].LowBound;
      end;

      // try to allocate the data
      LResult := SafeArrayAllocData(Result);

      // if not then get rid of the descriptor
      if LResult <> VAR_OK then
      begin
        SafeArrayDestroyDescriptor(Result);
        Result := nil;
      end;
    end;
  end;
end;

function SafeArrayAllocDescriptor(DimCount: Integer; out VarArray: PVarArray): HRESULT;
begin
  Result := VAR_OK;

  // give it a shot
  try
    VarArray := SafeArrayAllocMem(SizeOf(TVarArray) + SizeOf(TVarArrayBound) * (DimCount - 1));
  except
    // something really really bad happened
    on EOutOfMemory do
      Result := VAR_OUTOFMEMORY;

  // catch all else
  else
    Result := VAR_UNEXPECTED;
  end;
end;

function SafeArrayAllocData(VarArray: PVarArray): HRESULT;
begin
  Result := VAR_OK;

  // give it a shot
  try
    VarArray^.Data := SafeArrayAllocMem(SafeArrayElementTotal(VarArray) *
                                        VarArray^.ElementSize);
  except
    // something really really bad happened
    on EOutOfMemory do
      Result := VAR_OUTOFMEMORY;

  // catch all else
  else
    Result := VAR_UNEXPECTED;
  end;
end;

function SafeArrayDestroy(VarArray: PVarArray): HRESULT;
begin
  // all is swell?
  Result := SafeArrayValidate(VarArray, cCheckAll);
  if Result = VAR_OK then
  begin

    // well then lets try to destroy the pieces parts
    Result := SafeArrayDestroyData(VarArray);
    if Result = VAR_OK then
      Result := SafeArrayDestroyDescriptor(VarArray);
  end;
end;

function SafeArrayDestroyDescriptor(VarArray: PVarArray): HRESULT;
begin
  // all is swell?
  Result := SafeArrayValidate(VarArray, cCheckAll);
  if Result = VAR_OK then
  try

    // try and free it then
    SafeArrayFreeMem(VarArray);
  except
    Result := VAR_UNEXPECTED;
  end;
end;

function SafeArrayDestroyData(VarArray: PVarArray): HRESULT;
begin
  // all is swell?
  Result := SafeArrayValidate(VarArray, cCheckAll);
  if Result = VAR_OK then
  try

    // slick the data space
    Result := SafeArrayClearDataSpace(VarArray, False);

    // if all is swell and, if we are supposed to, free the data
    if (Result = VAR_OK) and
       ((VarArray^.Flags and ARR_FIXEDSIZE) = 0) then
    begin
      SafeArrayFreeMem(VarArray^.Data);
      VarArray^.Data := nil;
    end;
  except
    Result := VAR_UNEXPECTED;
  end;
end;

function SafeArrayRedim(VarArray: PVarArray; const NewBound: TVarArrayBound): HRESULT;
var
  LDim, LDelta: Integer;
  LTotal, LElement: Integer;
  LAddress: Pointer;
  LElementStyle: TElementStyle;
begin
  // check out the array
  Result := SafeArrayValidate(VarArray);
  if Result = VAR_OK then
  begin
    if (VarArray^.Flags and ARR_FIXEDSIZE) <> 0 then
      Result := VAR_INVALIDARG;

    // is still swell?
    if Result = VAR_OK then
    begin
      Result := SafeArrayLock(VarArray);
      if Result = VAR_OK then
      try
        try

          // calculate the delta
          LDelta := NewBound.ElementCount - VarArray^.Bounds[0].ElementCount;
          for LDim := 1 to VarArray^.DimCount - 1 do
            LDelta := LDelta * VarArray^.Bounds[LDim].ElementCount;

          // any change?
          if LDelta <> 0 then
          begin

            // how big are we currently?
            LTotal := SafeArrayElementTotal(VarArray);

            // make things shorter?
            if LDelta < 0 then
            begin

              // what type of stuff are we dealing with?
              LElementStyle := SafeArrayElementStyle(VarArray);

              // for each element
              for LElement := LTotal - 1 downto LTotal + LDelta do { Delta is negative }
              begin
                LAddress := SafeArrayCalculateElementAddress(VarArray, LElement);

                // do the right thing
                case LElementStyle of
                  esReference:
                    IUnknown(LAddress) := nil;
                  esOleStr:
                    WideString(LAddress) := '';
                  esVariant:
                    Result := VariantClear(PVarData(LAddress)^);
                else
                  Result := VAR_EXCEPTION;
                end;
              end;
            end;

            // failure?
            if Result <> VAR_OK then
              Exit;

            // regrab the memory
            SafeArrayReallocMem(VarArray^.Data, LTotal, LTotal + LDelta);
          end;

          // copy over the new bound info
          VarArray^.Bounds[0].ElementCount := NewBound.ElementCount;
          VarArray^.Bounds[0].LowBound := NewBound.LowBound;

        // oops!
        except

          // something really really bad happened
          on EOutOfMemory do
            Result := VAR_OUTOFMEMORY;

        // catch all else
        else
          Result := VAR_EXCEPTION;
        end;

      // put away our toys
      finally
        if Result = VAR_OK then
          Result := SafeArrayUnlock(VarArray)
        else
          SafeArrayUnlock(VarArray);
      end;
    end;
  end;
end;

function SafeArrayCopy(SourceArray: PVarArray; out TargetArray: PVarArray): HRESULT;
var
  LDim: Integer;
begin
  // check out the source array
  Result := SafeArrayValidate(SourceArray);
  if Result = VAR_OK then
  begin
    Result := SafeArrayLock(SourceArray);
    if Result = VAR_OK then
    try //and
      try // again

        // make room for the descriptor
        Result := SafeArrayAllocDescriptor(SourceArray^.DimCount, TargetArray);
        if Result = VAR_OK then
        try

          // add our bits of information
          TargetArray^.DimCount := SourceArray^.DimCount;
          TargetArray^.Flags := SourceArray^.Flags;
          TargetArray^.ElementSize := SourceArray^.ElementSize;

          // fill in the bounds info
          for LDim := 0 to TargetArray^.DimCount - 1 do
          begin
            TargetArray^.Bounds[LDim].ElementCount := SourceArray^.Bounds[LDim].ElementCount;
            TargetArray^.Bounds[LDim].LowBound := SourceArray^.Bounds[LDim].LowBound;
          end;

          // try to allocate the data
          Result := SafeArrayAllocData(TargetArray);

          // now copy it!
          if Result = VAR_OK then
            Result := SafeArrayCopyDataSpace(SourceArray, TargetArray);

        // remember to clean up if needed
        finally
          if Result <> VAR_OK then
          begin
            SafeArrayDestroyDescriptor(TargetArray);
            TargetArray := nil;
          end;
        end;

      // oops!
      except

        // something really really bad happened
        on EOutOfMemory do
          Result := VAR_OUTOFMEMORY;

      // catch all else
      else
        Result := VAR_EXCEPTION;
      end;

    // put away our toys
    finally
      if Result = VAR_OK then
        Result := SafeArrayUnlock(SourceArray)
      else
        SafeArrayUnlock(SourceArray);
    end;
  end;
end;

function SafeArrayCopyData(SourceArray, TargetArray: PVarArray): HRESULT;
var
  LDim: Integer;
begin
  // check out the source array
  Result := SafeArrayValidate(SourceArray);
  if Result = VAR_OK then
  begin
    Result := SafeArrayLock(SourceArray);
    if Result = VAR_OK then
    try

      // check out the target array
      Result := SafeArrayValidate(TargetArray);
      if Result = VAR_OK then
      begin
        Result := SafeArrayLock(TargetArray);
        if Result = VAR_OK then
        try

          // now make sure the two arrays are similar
          if (SourceArray^.DimCount <> TargetArray^.DimCount) or
             (SourceArray^.Flags <> TargetArray^.Flags) or
             (SourceArray^.ElementSize <> TargetArray^.ElementSize) then
            Result := VAR_INVALIDARG
          else
          begin

            // now make sure the bounds match
            for LDim := 0 to SourceArray^.DimCount - 1 do
              if (SourceArray^.Bounds[LDim].LowBound <> TargetArray^.Bounds[LDim].LowBound) or
                 (SourceArray^.Bounds[LDim].ElementCount <> TargetArray^.Bounds[LDim].ElementCount) then
              begin
                Result := VAR_INVALIDARG;
                Break;
              end;

            // if all is still well then lets copy the data
            if Result = VAR_OK then
            begin

              // clear the destination
              Result := SafeArrayClearDataSpace(TargetArray);

              // if all is still swell then copy the data space
              if Result = VAR_OK then
                Result := SafeArrayCopyDataSpace(SourceArray, TargetArray);
            end;
          end;

        // put away our toys
        finally
          if Result = VAR_OK then
            Result := SafeArrayUnlock(TargetArray)
          else
            SafeArrayUnlock(TargetArray);
        end;
      end;
    finally
      if Result = VAR_OK then
        Result := SafeArrayUnlock(SourceArray)
      else
        SafeArrayUnlock(SourceArray);
    end;
  end;
end;

function SafeArrayGetLBound(VarArray: PVarArray; Dim: Integer; out LBound: Integer): HRESULT;
begin
  Result := SafeArrayValidate(VarArray);
  if Result = VAR_OK then
    if (Dim < 1) or (Dim > VarArray^.DimCount) then
      Result := VAR_BADINDEX
    else
      LBound := VarArray^.Bounds[Dim - 1].LowBound;
end;

function SafeArrayGetUBound(VarArray: PVarArray; Dim: Integer; out UBound: Integer): HRESULT;
begin
  Result := SafeArrayValidate(VarArray);
  if Result = VAR_OK then
    if (Dim < 1) or (Dim > VarArray^.DimCount) then
      Result := VAR_BADINDEX
    else
      UBound := VarArray^.Bounds[Dim - 1].LowBound +
                VarArray^.Bounds[Dim - 1].ElementCount - 1;
end;

function SafeArrayGetDim(VarArray: PVarArray): Integer;
begin
  Result := 0;
  if SafeArrayValidate(VarArray) = VAR_OK then
    Result := VarArray^.DimCount;
end;

function SafeArrayAccessData(VarArray: PVarArray; out Data: Pointer): HRESULT;
begin
  Data := nil;
  Result := SafeArrayLock(VarArray);
  if Result = VAR_OK then
    Data := VarArray^.Data;
end;

function SafeArrayUnaccessData(VarArray: PVarArray): HRESULT;
begin
  Result := SafeArrayUnlock(VarArray);
end;

function SafeArrayLock(VarArray: PVarArray): HRESULT;
begin
  Result := SafeArrayValidate(VarArray);
  if Result = VAR_OK then
    Inc(VarArray^.LockCount);
end;

function SafeArrayUnlock(VarArray: PVarArray): HRESULT;
begin
  Result := SafeArrayValidate(VarArray);
  if (Result = VAR_OK) and
     (VarArray^.LockCount > 0) then
    Dec(VarArray^.LockCount);
end;

function SafeArrayGetElement(VarArray: PVarArray; Indices: PVarArrayCoorArray;
  Data: Pointer): HRESULT;
var
  LAddress: Pointer;
begin
  Result := SafeArrayValidateAndCalculateAddress(VarArray, Indices, LAddress, True);
  if Result = VAR_OK then
  try //and
    try // again

      // data type please
      case SafeArrayElementStyle(VarArray) of
        esNormal:
          Move(LAddress^, Data^, VarArray^.ElementSize);
        esReference:
          IUnknown(Data) := IUnknown(PUnknown(LAddress)^);
        esOleStr:
          WideString(Pointer(Data)) := Copy(PWideChar(LAddress), 1, MaxInt);
        esVariant:
          VariantCopy(PVarData(Data)^, PVarData(LAddress)^);
      end;

    // oops!
    except

      // something really really bad happened
      on EOutOfMemory do
        Result := VAR_OUTOFMEMORY;

    // catch all else
    else
      Result := VAR_EXCEPTION;
    end;

  // clean up please
  finally
    if Result = VAR_OK then
      Result := SafeArrayUnlock(VarArray)
    else
      SafeArrayUnlock(VarArray);
  end;
end;

function SafeArrayPutElement(VarArray: PVarArray; Indices: PVarArrayCoorArray;
  const Data: Pointer): HRESULT;
var
  LAddress: Pointer;
begin
  Result := SafeArrayValidateAndCalculateAddress(VarArray, Indices, LAddress, True);
  if Result = VAR_OK then
  try // and
    try // again

      // data type please
      case SafeArrayElementStyle(VarArray) of
        esNormal:
          Move(Data^, LAddress^, VarArray^.ElementSize);
        esReference:
          IUnknown(PUnknown(LAddress)^) := IUnknown(Data);
        esOleStr:
          WideString(Pointer(LAddress)) := Copy(PWideChar(Data), 1, MaxInt);
        esVariant:
          VariantCopy(PVarData(LAddress)^, PVarData(Data)^);
      end;

    // oops!
    except
      // something really really bad happened
      on EOutOfMemory do
        Result := VAR_OUTOFMEMORY;

    // catch all else
    else
      Result := VAR_EXCEPTION;
    end;

  // clean up please
  finally
    if Result = VAR_OK then
      Result := SafeArrayUnlock(VarArray)
    else
      SafeArrayUnlock(VarArray);
  end;
end;

function SafeArrayPtrOfIndex(VarArray: PVarArray; Indices: PVarArrayCoorArray;
  var Address: Pointer): HRESULT;
begin
  // call the common code
  Result := SafeArrayValidateAndCalculateAddress(VarArray, Indices, Address, False);
end;

function SafeArrayGetElemSize(VarArray: PVarArray): LongWord;
begin
  Result := 0;
  if SafeArrayValidate(VarArray) = VAR_OK then
    Result := VarArray^.ElementSize;
end;

{$ENDIF}

end.
