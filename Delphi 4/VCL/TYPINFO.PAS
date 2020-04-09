
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{       Copyright (c) 1995,98 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit TypInfo;

interface

uses SysUtils;

type

  TTypeKind = (tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
    tkString, tkSet, tkClass, tkMethod, tkWChar, tkLString, tkWString,
    tkVariant, tkArray, tkRecord, tkInterface, tkInt64, tkDynArray);
  TTypeKinds = set of TTypeKind;

  TOrdType = (otSByte, otUByte, otSWord, otUWord, otSLong);

  TFloatType = (ftSingle, ftDouble, ftExtended, ftComp, ftCurr);

  TMethodKind = (mkProcedure, mkFunction, mkConstructor, mkDestructor,
    mkClassProcedure, mkClassFunction,
    { Obsolete }
    mkSafeProcedure, mkSafeFunction);

  TParamFlag = (pfVar, pfConst, pfArray, pfAddress, pfReference, pfOut);
  {$EXTERNALSYM TParamFlag}
  TParamFlags = set of TParamFlag;
  TParamFlagsBase = set of TParamFlag;
  {$EXTERNALSYM TParamFlagsBase}
  TIntfFlag = (ifHasGuid, ifDispInterface, ifDispatch);
  {$EXTERNALSYM TIntfFlag}
  TIntfFlags = set of TIntfFlag;
  TIntfFlagsBase = set of TIntfFlag;
  {$EXTERNALSYM TIntfFlagsBase}

  (*$HPPEMIT 'namespace Typinfo'*)
  (*$HPPEMIT '{'}*)
  (*$HPPEMIT '  enum TParamFlag {pfVar, pfConst, pfArray, pfAddress, pfReference, pfOut};'*)
  (*$HPPEMIT '  enum TIntfFlag {ifHasGuid, ifDispInterface, ifDispatch};'*)
  (*$HPPEMIT '  typedef SetBase<TParamFlag, pfVar, pfOut> TParamFlagsBase;'*)
  (*$HPPEMIT '  typedef SetBase<TIntfFlag, ifHasGuid, ifDispatch> TIntfFlagsBase;'*)
  (*$HPPEMIT '}'*)


  ShortStringBase = string[255];
  {$EXTERNALSYM ShortStringBase}

  PPTypeInfo = ^PTypeInfo;
  PTypeInfo = ^TTypeInfo;
  TTypeInfo = record
    Kind: TTypeKind;
    Name: ShortString;
   {TypeData: TTypeData}
  end;

  PTypeData = ^TTypeData;
  TTypeData = packed record
    case TTypeKind of
      tkUnknown, tkLString, tkWString, tkVariant: ();
      tkInteger, tkChar, tkEnumeration, tkSet, tkWChar: (
        OrdType: TOrdType;
        case TTypeKind of
          tkInteger, tkChar, tkEnumeration, tkWChar: (
			MinValue: Longint;
            MaxValue: Longint;
            case TTypeKind of
              tkInteger, tkChar, tkWChar: ();
              tkEnumeration: (
                BaseType: PPTypeInfo;
                NameList: ShortStringBase));
          tkSet: (
            CompType: PPTypeInfo));
      tkFloat: (
        FloatType: TFloatType);
      tkString: (
        MaxLength: Byte);
      tkClass: (
        ClassType: TClass;
        ParentInfo: PPTypeInfo;
        PropCount: SmallInt;
        UnitName: ShortStringBase;
       {PropData: TPropData});
      tkMethod: (
        MethodKind: TMethodKind;
        ParamCount: Byte;
        ParamList: array[0..1023] of Char
       {ParamList: array[1..ParamCount] of
          record
            Flags: TParamFlags;
            ParamName: ShortString;
            TypeName: ShortString;
          end;
        ResultType: ShortString});
      tkInterface: (
        IntfParent : PPTypeInfo; { ancestor }
        IntfFlags : TIntfFlagsBase;
        Guid : TGUID;
        IntfUnit : ShortStringBase;
       {PropData: TPropData});
      tkInt64: (
        MinInt64Value, MaxInt64Value: Int64);
  end;

  TPropData = packed record
    PropCount: Word;
    PropList: record end;
   {PropList: array[1..PropCount] of TPropInfo}
  end;

  PPropInfo = ^TPropInfo;
  TPropInfo = packed record
    PropType: PPTypeInfo;
    GetProc: Pointer;
    SetProc: Pointer;
    StoredProc: Pointer;
    Index: Integer;
    Default: Longint;
    NameIndex: SmallInt;
    Name: ShortString;
  end;

  TPropInfoProc = procedure(PropInfo: PPropInfo) of object;

  PPropList = ^TPropList;
  TPropList = array[0..16379] of PPropInfo;

const
  tkAny = [Low(TTypeKind)..High(TTypeKind)];
  tkMethods = [tkMethod];
  tkProperties = tkAny - tkMethods - [tkUnknown];

{ Property access routines }

function GetTypeData(TypeInfo: PTypeInfo): PTypeData;

function GetEnumName(TypeInfo: PTypeInfo; Value: Integer): string;
function GetEnumValue(TypeInfo: PTypeInfo; const Name: string): Integer;

function GetPropInfo(TypeInfo: PTypeInfo; const PropName: string): PPropInfo;
procedure GetPropInfos(TypeInfo: PTypeInfo; PropList: PPropList);
function GetPropList(TypeInfo: PTypeInfo; TypeKinds: TTypeKinds;
  PropList: PPropList): Integer;

function IsStoredProp(Instance: TObject; PropInfo: PPropInfo): Boolean;

function GetOrdProp(Instance: TObject; PropInfo: PPropInfo): Longint;
procedure SetOrdProp(Instance: TObject; PropInfo: PPropInfo;
  Value: Longint);

function GetStrProp(Instance: TObject; PropInfo: PPropInfo): string;
procedure SetStrProp(Instance: TObject; PropInfo: PPropInfo;
  const Value: string);

function GetFloatProp(Instance: TObject; PropInfo: PPropInfo): Extended;
procedure SetFloatProp(Instance: TObject; PropInfo: PPropInfo;
  Value: Extended);

function GetVariantProp(Instance: TObject; PropInfo: PPropInfo): Variant;
procedure SetVariantProp(Instance: TObject; PropInfo: PPropInfo;
  const Value: Variant);

function GetMethodProp(Instance: TObject; PropInfo: PPropInfo): TMethod;
procedure SetMethodProp(Instance: TObject; PropInfo: PPropInfo;
  const Value: TMethod);

function GetInt64Prop(Instance: TObject; PropInfo: PPropInfo): Int64;
procedure SetInt64Prop(Instance: TObject; PropInfo: PPropInfo;
  const Value: Int64);

var
  BooleanIdents: array [Boolean] of string = ('False', 'True');
  DotSep: string = '.';

implementation

function GetTypeData(TypeInfo: PTypeInfo): PTypeData; assembler;
asm
        { ->    EAX Pointer to type info }
        { <-    EAX Pointer to type data }
        {       it's really just to skip the kind and the name  }
        XOR     EDX,EDX
        MOV     DL,[EAX].TTypeInfo.Name.Byte[0]
        LEA     EAX,[EAX].TTypeInfo.Name[EDX+1]
end;

function GetEnumName(TypeInfo: PTypeInfo; Value: Integer): string;
var
  P: ^ShortString;
  T: PTypeData;
begin
  if TypeInfo = System.TypeInfo(Boolean) then
  begin
    Result := BooleanIdents[Boolean(Value)];
    if CompareText(HexDisplayPrefix, '0x') = 0 then Result := LowerCase(Result);
    Exit;
  end;
  T := GetTypeData(GetTypeData(TypeInfo)^.BaseType^);
  if T^.MinValue < 0 then      { must be LongBool/WordBool/ByteBool }
    Value := Ord(Value <> 0);  { map non-zero to true in this case  }
  P := @T^.NameList;
  while Value <> 0 do
  begin
    Inc(Integer(P), Length(P^) + 1);
    Dec(Value);
  end;
  Result := P^;
end;

function GetEnumValue(TypeInfo: PTypeInfo; const Name: string): Integer;
  assembler;
asm
        { ->    EAX Pointer to type info        }
        {       EDX Pointer to string           }
        { <-    EAX Value                       }

        PUSH    EBX
        PUSH    ESI
        PUSH    EDI

	TEST	EDX,EDX
	JE	@notFound

        {       point ESI to first name of the base type }
        XOR     ECX,ECX
        MOV     CL,[EAX].TTypeInfo.Name.Byte[0]
        MOV     EAX,[EAX].TTypeInfo.Name[ECX+1].TTypeData.BaseType
        MOV     EAX,[EAX]
        MOV     CL,[EAX].TTypeInfo.Name.Byte[0]
        LEA     ESI,[EAX].TTypeInfo.Name[ECX+1].TTypeData.NameList

        {       make EDI the high bound of the enum type }
        MOV     EDI,[EAX].TTypeInfo.Name[ECX+1].TTypeData.MaxValue

        {       EAX is our running index }
        XOR     EAX,EAX

        {       make ECX the length of the current string }

@outerLoop:
        MOV     CL,[ESI]
	CMP	ECX,[EDX-4]
        JNE     @lengthMisMatch

        {       we know for sure the names won't be zero length }
@cmpLoop:
        MOV     BL,[EDX+ECX-1]
        XOR     BL,[ESI+ECX]
        TEST    BL,0DFH
        JNE     @misMatch
        DEC     ECX
        JNE     @cmpLoop

        {       as we didn't have a mismatch, we must have found the name }
        JMP     @exit

@misMatch:
        MOV     CL,[ESI]
@lengthMisMatch:
        INC     EAX
        LEA     ESI,[ESI+ECX+1]
        CMP     EAX,EDI
        JLE     @outerLoop

        {       we haven't found the thing - return -1  }
@notFound:
        OR      EAX,-1

@exit:
        POP     EDI
        POP     ESI
	POP	EBX
end;

function GetPropInfo(TypeInfo: PTypeInfo; const PropName: string): PPropInfo;
  assembler;
asm
        { ->    EAX Pointer to type info        }
        {       EDX Pointer to prop name        }
        { <-    EAX Pointer to prop info        }

        PUSH    EBX
        PUSH    ESI
        PUSH    EDI

        MOV     ECX,EDX
        OR      EDX,EDX
        JE      @outerLoop
        MOV     CL,[EDX-4]
        MOV     CH,[EDX]
        AND     ECX,0DFFFH

@outerLoop:
        XOR     EBX,EBX
        MOV     BL,[EAX].TTypeInfo.Name.Byte[0]
        LEA     ESI,[EAX].TTypeInfo.Name[EBX+1]
        MOV     BL,[ESI].TTypeData.UnitName.Byte[0]
        MOVZX   EDI,[ESI].TTypeData.UnitName[EBX+1].TPropData.PropCount
        TEST    EDI,EDI
        JE      @parent
        LEA     EAX,[ESI].TTypeData.UnitName[EBX+1].TPropData.PropList

@innerLoop:
        MOV     BX,[EAX].TPropInfo.Name.Word[0]
        AND     BH,0DFH
        CMP     EBX,ECX
        JE      @matchStart

@nextProperty:
        MOV     BH,0
        DEC     EDI
        LEA     EAX,[EAX].TPropInfo.Name[EBX+1]
        JNE     @innerLoop

@parent:
        MOV     EAX,[ESI].TTypeData.ParentInfo
        TEST    EAX,EAX
        JE      @exit
        MOV     EAX,[EAX]
        JMP     @outerLoop

@misMatch:
        MOV     CH,[EDX]
        AND     CH,0DFH
        MOV     BL,[EAX].TPropInfo.Name.Byte[0]
        JMP     @nextProperty

@matchStart:
        MOV     BH,0

@matchLoop:
        MOV     CH,[EDX+EBX-1]
        XOR     CH,[EAX].TPropInfo.Name.Byte[EBX]
        TEST    CH,0DFH
        JNE     @misMatch
        DEC     EBX
        JNE     @matchLoop

@exit:
        POP     EDI
        POP     ESI
        POP     EBX
end;

procedure GetPropInfos(TypeInfo: PTypeInfo; PropList: PPropList); assembler;
asm
        { ->    EAX Pointer to type info        }
        {       EDX Pointer to prop list        }
        { <-    nothing                         }

        PUSH    EBX
        PUSH    ESI
        PUSH    EDI

        XOR     ECX,ECX
        MOV     ESI,EAX
        MOV     CL,[EAX].TTypeInfo.Name.Byte[0]
        MOV     EDI,EDX
        XOR     EAX,EAX
        MOVZX   ECX,[ESI].TTypeInfo.Name[ECX+1].TTypeData.PropCount
        REP     STOSD

@outerLoop:
        MOV     CL,[ESI].TTypeInfo.Name.Byte[0]
        LEA     ESI,[ESI].TTypeInfo.Name[ECX+1]
        MOV     CL,[ESI].TTypeData.UnitName.Byte[0]
        MOVZX   EAX,[ESI].TTypeData.UnitName[ECX+1].TPropData.PropCount
        TEST    EAX,EAX
        JE      @parent
        LEA     EDI,[ESI].TTypeData.UnitName[ECX+1].TPropData.PropList

@innerLoop:

        MOVZX   EBX,[EDI].TPropInfo.NameIndex
        MOV     CL,[EDI].TPropInfo.Name.Byte[0]
        CMP     dword ptr [EDX+EBX*4],0
        JNE     @alreadySet
        MOV     [EDX+EBX*4],EDI

@alreadySet:
        LEA     EDI,[EDI].TPropInfo.Name[ECX+1]
        DEC     EAX
        JNE     @innerLoop

@parent:
        MOV     ESI,[ESI].TTypeData.ParentInfo
        XOR     ECX,ECX
        TEST    ESI,ESI
        JE      @exit
        MOV     ESI,[ESI]
        JMP     @outerLoop
@exit:
        POP     EDI
        POP     ESI
        POP     EBX

end;

procedure SortPropList(PropList: PPropList; PropCount: Integer); assembler;
asm
        { ->    EAX Pointer to prop list        }
        {       EDX Property count              }
        { <-    nothing                         }

        PUSH    EBX
        PUSH    ESI
        PUSH    EDI
        MOV     ECX,EAX
        XOR     EAX,EAX
        DEC     EDX
        CALL    @@qsort
        POP     EDI
        POP     ESI
        POP     EBX
        JMP     @@exit

@@qsort:
        PUSH    EAX
        PUSH    EDX
        LEA     EDI,[EAX+EDX]           { pivot := (left + right) div 2 }
        SHR     EDI,1
        MOV     EDI,[ECX+EDI*4]
        ADD     EDI,OFFSET TPropInfo.Name
@@repeat:                               { repeat                        }
@@while1:
        CALL    @@compare               { while a[i] < a[pivot] do inc(i);}
        JAE     @@endWhile1
        INC     EAX
        JMP     @@while1
@@endWhile1:
        XCHG    EAX,EDX
@@while2:
        CALL    @@compare               { while a[j] > a[pivot] do dec(j);}
        JBE     @@endWhile2
        DEC     EAX
        JMP     @@while2
@@endWhile2:
        XCHG    EAX,EDX
        CMP     EAX,EDX                 { if i <= j then begin          }
        JG      @@endRepeat
        MOV     EBX,[ECX+EAX*4]         { x := a[i];                    }
        MOV     ESI,[ECX+EDX*4]         { y := a[j];                    }
        MOV     [ECX+EDX*4],EBX         { a[j] := x;                    }
        MOV     [ECX+EAX*4],ESI         { a[i] := y;                    }
        INC     EAX                     { inc(i);                       }
        DEC     EDX                     { dec(j);                       }
                                        { end;                          }
        CMP     EAX,EDX                 { until i > j;                  }
        JLE     @@repeat

@@endRepeat:
        POP     ESI
        POP     EBX

        CMP     EAX,ESI
        JL      @@rightNonEmpty         { if i >= right then begin      }
        CMP     EDX,EBX
        JG      @@leftNonEmpty1         { if j <= left then exit        }
        RET

@@leftNonEmpty1:
        MOV     EAX,EBX
        JMP     @@qsort                 { qsort(left, j)                }

@@rightNonEmpty:
        CMP     EAX,EBX
        JG      @@leftNonEmpty2
        MOV     EDX,ESI                 { qsort(i, right)               }
        JMP     @@qsort
@@leftNonEmpty2:
        PUSH    EAX
        PUSH    ESI
        MOV     EAX,EBX
        CALL    @@qsort                 { qsort(left, j)                }
        POP     EDX
        POP     EAX
        JMP     @@qsort                 { qsort(i, right)               }

@@compare:
        PUSH    EAX
        PUSH    EDI
        MOV     ESI,[ECX+EAX*4]
        ADD     ESI,OFFSET TPropInfo.Name
        PUSH    ESI
        XOR     EBX,EBX
        MOV     BL,[ESI]
        INC     ESI
        CMP     BL,[EDI]
        JBE     @@firstLenSmaller
        MOV     BL,[EDI]
@@firstLenSmaller:
        INC     EDI
        TEST    BL,BL
        JE      @@endLoop
@@loop:
        MOV     AL,[ESI]
        MOV     AH,[EDI]
        AND     EAX,$DFDF
        CMP     AL,AH
        JNE     @@difference
        INC     ESI
        INC     EDI
        DEC     EBX
        JNZ     @@loop
@@endLoop:
        POP     ESI
        POP     EDI
        MOV     AL,[ESI]
        MOV     AH,[EDI]
        CMP     AL,AH
        POP     EAX
        RET
@@difference:
        POP     ESI
        POP     EDI
        POP     EAX
        RET
@@exit:
end;

{ TypeInfo is the type info of a class. Return all properties matching
  TypeKinds in this class or its ancestors in PropList and return the count }

function GetPropList(TypeInfo: PTypeInfo; TypeKinds: TTypeKinds;
  PropList: PPropList): Integer;
var
  I, Count: Integer;
  PropInfo: PPropInfo;
  TempList: PPropList;
begin
  Result := 0;
  Count := GetTypeData(TypeInfo)^.PropCount;
  if Count > 0 then
  begin
    GetMem(TempList, Count * SizeOf(Pointer));
    try
      GetPropInfos(TypeInfo, TempList);
      for I := 0 to Count - 1 do
      begin
        PropInfo := TempList^[I];
        if PropInfo^.PropType^.Kind in TypeKinds then
        begin
          if PropList <> nil then PropList^[Result] := PropInfo;
          Inc(Result);
        end;
      end;
      if (PropList <> nil) and (Result > 1) then
        SortPropList(PropList, Result);
    finally
      FreeMem(TempList, Count * SizeOf(Pointer));
    end;
  end;
end;

function IsStoredProp(Instance: TObject; PropInfo: PPropInfo): Boolean;
  assembler;
asm
        { ->    EAX Pointer to Instance         }
        {       EDX Pointer to prop info        }
        { <-    AL  Function result             }

        MOV     ECX,[EDX].TPropInfo.StoredProc
        TEST    ECX,0FFFFFF00H
        JE      @@returnCL
        CMP     [EDX].TPropInfo.StoredProc.Byte[3],0FEH
        MOV     EDX,[EDX].TPropInfo.Index
        JB      @@isStaticMethod
        JA      @@isField

        {       the StoredProc is a virtual method }
        MOVSX   ECX,CX                  { sign extend slot offs }
        ADD     ECX,[EAX]               { vmt   + slotoffs      }
        CALL    dword ptr [ECX]         { call vmt[slot]        }
        JMP     @@exit

@@isStaticMethod:
        CALL    ECX
        JMP     @@exit

@@isField:
        AND     ECX,$00FFFFFF
        MOV     CL,[EAX+ECX]

@@returnCL:
        MOV     AL,CL

@@exit:
end;

function GetOrdProp(Instance: TObject; PropInfo: PPropInfo): Longint;
  assembler;
asm
        { ->    EAX Pointer to instance         }
        {       EDX Pointer to property info    }
        { <-    EAX Longint result              }

        PUSH    EBX
        PUSH    EDI
        MOV     EDI,[EDX].TPropInfo.PropType
        MOV     EDI,[EDI]
        MOV     BL,otSLong
        CMP     [EDI].TTypeInfo.Kind,tkClass
        JE      @@isClass
        XOR     ECX,ECX
        MOV     CL,[EDI].TTypeInfo.Name.Byte[0]
        MOV     BL,[EDI].TTypeInfo.Name[ECX+1].TTypeData.OrdType
@@isClass:
        MOV     ECX,[EDX].TPropInfo.GetProc
        CMP     [EDX].TPropInfo.GetProc.Byte[3],$FE
        MOV     EDX,[EDX].TPropInfo.Index
        JB      @@isStaticMethod
        JA      @@isField

        {       the GetProc is a virtual method }
        MOVSX   ECX,CX                  { sign extend slot offs }
        ADD     ECX,[EAX]               { vmt   + slotoffs      }
        CALL    dword ptr [ECX]         { call vmt[slot]        }
        JMP     @@final

@@isStaticMethod:
        CALL    ECX
        JMP     @@final

@@isField:
        AND     ECX,$00FFFFFF
        ADD     ECX,EAX
        MOV     AL,[ECX]
        CMP     BL,otSWord
        JB      @@final
        MOV     AX,[ECX]
        CMP     BL,otSLong
        JB      @@final
        MOV     EAX,[ECX]
@@final:
        CMP     BL,otSLong
        JAE     @@exit
        CMP     BL,otSWord
        JAE     @@word
        CMP     BL,otSByte
        MOVSX   EAX,AL
        JE      @@exit
        AND     EAX,$FF
        JMP     @@exit
@@word:
        MOVSX   EAX,AX
        JE      @@exit
        AND     EAX,$FFFF
@@exit:
        POP     EDI
        POP     EBX
end;

procedure SetOrdProp(Instance: TObject; PropInfo: PPropInfo;
  Value: Longint); assembler;
asm
        { ->    EAX Pointer to instance         }
        {       EDX Pointer to property info    }
        {       ECX Value                       }

        PUSH    EBX
        PUSH    ESI
        PUSH    EDI
        MOV     EDI,EDX

        MOV     ESI,[EDI].TPropInfo.PropType
        MOV     ESI,[ESI]
        MOV     BL,otSLong
        CMP     [ESI].TTypeInfo.Kind,tkClass
        JE      @@isClass
        XOR     EBX,EBX
        MOV     BL,[ESI].TTypeInfo.Name.Byte[0]
        MOV     BL,[ESI].TTypeInfo.Name[EBX+1].TTypeData.OrdType
@@isClass:
        MOV     EDX,[EDI].TPropInfo.Index       { pass Index in DX      }
        CMP     EDX,$80000000
        JNE     @@hasIndex
        MOV     EDX,ECX                         { pass value in EDX     }
@@hasIndex:
        MOV     ESI,[EDI].TPropInfo.SetProc
        CMP     [EDI].TPropInfo.SetProc.Byte[3],$FE
        JA      @@isField
        JB      @@isStaticMethod

        {       SetProc turned out to be a virtual method. call it      }
        MOVSX   ESI,SI                          { sign extend slot offset }
        ADD     ESI,[EAX]                       { vmt   + slot offset   }
        CALL    dword ptr [ESI]
        JMP     @@exit

@@isStaticMethod:
        CALL    ESI
        JMP     @@exit

@@isField:
        AND     ESI,$00FFFFFF
        ADD     EAX,ESI
        MOV     [EAX],CL
        CMP     BL,otSWord
        JB      @@exit
        MOV     [EAX],CX
        CMP     BL,otSLong
        JB      @@exit
        MOV     [EAX],ECX
@@exit:
        POP     EDI
        POP     ESI
        POP     EBX
end;

procedure GetShortStrProp(Instance: TObject; PropInfo: PPropInfo;
  var Value: ShortString); assembler;
asm
        { ->    EAX Pointer to instance         }
        {       EDX Pointer to property info    }
        {       ECX Pointer to result string    }

        PUSH    ESI
        PUSH    EDI
        MOV     EDI,EDX

        MOV     EDX,[EDI].TPropInfo.Index       { pass index in EDX }
        CMP     EDX,$80000000
        JNE     @@hasIndex
        MOV     EDX,ECX                         { pass value in EDX }
@@hasIndex:
        MOV     ESI,[EDI].TPropInfo.GetProc
        CMP     [EDI].TPropInfo.GetProc.Byte[3],$FE
        JA      @@isField
        JB      @@isStaticMethod

        {       GetProc turned out to be a virtual method       }
        MOVSX   ESI,SI                          { sign extend slot offset}
        ADD     ESI,[EAX]                       { vmt + slot offset     }
        CALL    dword ptr [ESI]
        JMP     @@exit

@@isStaticMethod:
        CALL    ESI
        JMP     @@exit

@@isField:
        AND     ESI,$00FFFFFF
        ADD     ESI,EAX
        MOV     EDI,ECX
        XOR     ECX,ECX
        MOV     CL,[ESI]
        INC     ECX
        REP     MOVSB

@@exit:
        POP     EDI
        POP     ESI
end;

procedure SetShortStrProp(Instance: TObject; PropInfo: PPropInfo;
  const Value: ShortString); assembler;
asm
        { ->    EAX Pointer to instance         }
        {       EDX Pointer to property info    }
        {       ECX Pointer to string value     }

        PUSH    ESI
        PUSH    EDI
        MOV     ESI,EDX

        MOV     EDX,[ESI].TPropInfo.Index       { pass index in EDX }
        CMP     EDX,$80000000
        JNE     @@hasIndex
        MOV     EDX,ECX                         { pass value in EDX }
@@hasIndex:
        MOV     EDI,[ESI].TPropInfo.SetProc
        CMP     [ESI].TPropInfo.SetProc.Byte[3],$FE
        JA      @@isField
        JB      @@isStaticMethod

        {       SetProc is a virtual method }
        MOVSX   EDI,DI
        ADD     EDI,[EAX]
        CALL    dword ptr [EDI]
        JMP     @@exit

@@isStaticMethod:
        CALL    EDI
        JMP     @@exit

@@isField:
        AND     EDI,$00FFFFFF
        ADD     EDI,EAX
        MOV     EAX,[ESI].TPropInfo.PropType
        MOV     EAX,[EAX]
        MOV     ESI,ECX
        XOR     ECX,ECX
        MOV     CL,[EAX].TTypeInfo.Name.Byte[0]
        MOV     CL,[EAX].TTypeInfo.Name[ECX+1].TTypeData.MaxLength

        LODSB
        CMP     AL,CL
        JB      @@noTruncate
        MOV     AL,CL
@@noTruncate:
        STOSB
        MOV     CL,AL
        REP     MOVSB
@@exit:
        POP     EDI
        POP     ESI
end;

procedure GetShortStrPropAsLongStr(Instance: TObject; PropInfo: PPropInfo;
  var Value: string);
var
  Temp: ShortString;
begin
  GetShortStrProp(Instance, PropInfo, Temp);
  Value := Temp;
end;

procedure SetShortStrPropAsLongStr(Instance: TObject; PropInfo: PPropInfo;
  const Value: string); assembler;
var
  Temp: ShortString;
begin
  Temp := Value;
  SetShortStrProp(Instance, PropInfo, Temp);
end;

procedure AssignLongStr(var Dest: string; const Source: string);
begin
  Dest := Source;
end;

procedure GetLongStrProp(Instance: TObject; PropInfo: PPropInfo;
  var Value: string); assembler;
asm
        { ->    EAX Pointer to instance         }
        {       EDX Pointer to property info    }
        {       ECX Pointer to result string    }

        PUSH    ESI
        PUSH    EDI
        MOV     EDI,EDX

        MOV     EDX,[EDI].TPropInfo.Index       { pass index in EDX }
        CMP     EDX,$80000000
        JNE     @@hasIndex
        MOV     EDX,ECX                         { pass value in EDX }
@@hasIndex:
        MOV     ESI,[EDI].TPropInfo.GetProc
        CMP     [EDI].TPropInfo.GetProc.Byte[3],$FE
        JA      @@isField
        JB      @@isStaticMethod

@@isVirtualMethod:
        MOVSX   ESI,SI                          { sign extend slot offset }
        ADD     ESI,[EAX]                       { vmt + slot offset }
        CALL    DWORD PTR [ESI]
        JMP     @@exit

@@isStaticMethod:
        CALL    ESI
        JMP     @@exit

@@isField:
	AND	ESI,$00FFFFFF
	MOV	EDX,[EAX+ESI]
	MOV	EAX,ECX
	CALL	AssignLongStr

@@exit:
        POP     EDI
        POP     ESI
end;

procedure SetLongStrProp(Instance: TObject; PropInfo: PPropInfo;
  const Value: string); assembler;
asm
        { ->    EAX Pointer to instance         }
        {       EDX Pointer to property info    }
        {       ECX Pointer to string value     }

        PUSH    ESI
        PUSH    EDI
        MOV     ESI,EDX

        MOV     EDX,[ESI].TPropInfo.Index       { pass index in EDX }
        CMP     EDX,$80000000
        JNE     @@hasIndex
        MOV     EDX,ECX                         { pass value in EDX }
@@hasIndex:
        MOV     EDI,[ESI].TPropInfo.SetProc
        CMP     [ESI].TPropInfo.SetProc.Byte[3],$FE
        JA      @@isField
        JB      @@isStaticMethod

@@isVirtualMethod:
        MOVSX   EDI,DI
        ADD     EDI,[EAX]
        CALL    DWORD PTR [EDI]
        JMP     @@exit

@@isStaticMethod:
        CALL    EDI
        JMP     @@exit

@@isField:
	AND	EDI,$00FFFFFF
	ADD	EAX,EDI
	MOV	EDX,ECX
	CALL	AssignLongStr

@@exit:
        POP     EDI
        POP     ESI
end;

procedure AssignWideStr(var Dest: WideString; const Source: WideString);
begin
  Dest := Source;
end;

procedure GetWideStrProp(Instance: TObject; PropInfo: PPropInfo;
  var Value: WideString); assembler;
asm
        { ->    EAX Pointer to instance         }
        {       EDX Pointer to property info    }
        {       ECX Pointer to result string    }

        PUSH    ESI
        PUSH    EDI
        MOV     EDI,EDX

        MOV     EDX,[EDI].TPropInfo.Index       { pass index in EDX }
        CMP     EDX,$80000000
        JNE     @@hasIndex
        MOV     EDX,ECX                         { pass value in EDX }
@@hasIndex:
        MOV     ESI,[EDI].TPropInfo.GetProc
        CMP     [EDI].TPropInfo.GetProc.Byte[3],$FE
        JA      @@isField
        JB      @@isStaticMethod

@@isVirtualMethod:
        MOVSX   ESI,SI                          { sign extend slot offset }
        ADD     ESI,[EAX]                       { vmt + slot offset }
        CALL    DWORD PTR [ESI]
        JMP     @@exit

@@isStaticMethod:
        CALL    ESI
        JMP     @@exit

@@isField:
	AND	ESI,$00FFFFFF
	MOV	EDX,[EAX+ESI]
	MOV	EAX,ECX
	CALL	AssignWideStr

@@exit:
        POP     EDI
        POP     ESI
end;

procedure SetWideStrProp(Instance: TObject; PropInfo: PPropInfo;
  const Value: WideString); assembler;
asm
        { ->    EAX Pointer to instance         }
        {       EDX Pointer to property info    }
        {       ECX Pointer to string value     }

        PUSH    ESI
        PUSH    EDI
        MOV     ESI,EDX

        MOV     EDX,[ESI].TPropInfo.Index       { pass index in EDX }
        CMP     EDX,$80000000
        JNE     @@hasIndex
        MOV     EDX,ECX                         { pass value in EDX }
@@hasIndex:
        MOV     EDI,[ESI].TPropInfo.SetProc
        CMP     [ESI].TPropInfo.SetProc.Byte[3],$FE
        JA      @@isField
        JB      @@isStaticMethod

@@isVirtualMethod:
        MOVSX   EDI,DI
        ADD     EDI,[EAX]
        CALL    DWORD PTR [EDI]
        JMP     @@exit

@@isStaticMethod:
        CALL    EDI
        JMP     @@exit

@@isField:
	AND	EDI,$00FFFFFF
	ADD	EAX,EDI
	MOV	EDX,ECX
	CALL	AssignWideStr

@@exit:
        POP     EDI
        POP     ESI
end;

procedure GetWideStrPropAsLongStr(Instance: TObject; PropInfo: PPropInfo;
  var Value: string);
var
  Temp: WideString;
begin
  GetWideStrProp(Instance, PropInfo, Temp);
  Value := Temp;
end;

procedure SetWideStrPropAsLongStr(Instance: TObject; PropInfo: PPropInfo;
  const Value: string); assembler;
var
  Temp: WideString;
begin
  Temp := Value;
  SetWideStrProp(Instance, PropInfo, Temp);
end;

function GetStrProp(Instance: TObject; PropInfo: PPropInfo): string;
begin
  case PropInfo^.PropType^.Kind of
    tkString: GetShortStrPropAsLongStr(Instance, PropInfo, Result);
    tkLString: GetLongStrProp(Instance, PropInfo, Result);
    tkWString: GetWideStrPropAsLongStr(Instance, PropInfo, Result);
  else
    Result := '';
  end;
end;

procedure SetStrProp(Instance: TObject; PropInfo: PPropInfo;
  const Value: string);
begin
  case PropInfo^.PropType^.Kind of
    tkString: SetShortStrPropAsLongStr(Instance, PropInfo, Value);
    tkLString: SetLongStrProp(Instance, PropInfo, Value);
    tkWString: SetWideStrPropAsLongStr(Instance, PropInfo, Value);
  end;
end;

const
  C10000: Single = 10000;

function GetFloatProp(Instance: TObject; PropInfo: PPropInfo): Extended;
  assembler;
asm
        { ->    EAX Pointer to instance         }
        {       EDX Pointer to property info    }
        { <-    FST(0) Extended result          }

        MOV     ECX,[EDX].TPropInfo.GetProc
        CMP     [EDX].TPropInfo.GetProc.Byte[3],$FE
        JA      @@isField
        PUSH    EDX
        JE      @@isVirtualMethod

        MOV     EDX,[EDX].TPropInfo.Index       { pass Index in DX      }
        CALL    ECX
        JMP     @@checkForCurrency

@@isVirtualMethod:
        MOVSX   ECX,CX
        ADD     ECX,[EAX]
        MOV     EDX,[EDX].TPropInfo.Index       { pass Index in DX      }
        CALL    dword ptr [ECX]

@@checkForCurrency:

        POP     EDX

        MOV     ECX,[EDX].TPropInfo.PropType
        MOV     ECX,[ECX]
        XOR     EDX,EDX
        MOV     DL,[ECX].TTypeInfo.Name.Byte[0]
        CMP     [ECX].TTypeInfo.Name[EDX+1].TTypeData.FloatType,ftCurr
        JE      @@div10000
        JMP     @@exit

@@jmpTab:
        DD      @@single,@@double,@@extended,@@comp,@@curr

@@single:
        FLD     [EAX].Single
        RET

@@double:
        FLD     [EAX].Double
        RET

@@extended:
        FLD     [EAX].Extended
        RET

@@comp:
        FILD    [EAX].Comp
        RET

@@curr:
        FILD    [EAX].Currency
@@div10000:
        FDIV    C10000
        RET

@@isField:
        AND     ECX,$00FFFFFF
        ADD     EAX,ECX
        MOV     ECX,[EDX].TPropInfo.PropType
        MOV     ECX,[ECX]
        XOR     EDX,EDX
        MOV     DL,[ECX].TTypeInfo.Name.Byte[0]
        MOV     DL,[ECX].TTypeInfo.Name[EDX+1].TTypeData.FloatType

        CALL    dword ptr @@jmpTab[EDX*4]

@@exit:

end;

procedure SetFloatProp(Instance: TObject; PropInfo: PPropInfo;
  Value: Extended); assembler;
asm
        { ->    EAX Pointer to instance         }
        {       EDX Pointer to property info    }
        {       Stack: Value                    }

        PUSH    EBX
        PUSH    ESI

        XOR     EBX,EBX
        MOV     ECX,[EDX].TPropInfo.PropType
        MOV     ECX,[ECX]
        MOV     BL,[ECX].TTypeInfo.Name.Byte[0]
        MOV     BL,[ECX].TTypeInfo.Name[EBX+1].TTypeData.FloatType
        SHL     EBX,2
        FLD     Value
        MOV     ECX,[EDX].TPropInfo.SetProc
        CMP     [EDX].TPropInfo.SetProc.Byte[3],$FE
        JA      @@isField
        SUB     ESP,dword ptr @@sizTab[EBX]
        MOV     ESI,ESP
        CALL    dword ptr @@storeProc[EBX]

        CMP     [EDX].TPropInfo.SetProc.Byte[3],$FE
        MOV     EDX,[EDX].TPropInfo.Index       { pass Index in DX      }
        JB      @@isStaticMethod

        MOVSX   ECX,CX
        ADD     ECX,[EAX]
        CALL    dword ptr [ECX]
        JMP     @@exit

@@isStaticMethod:
        CALL    ECX
        JMP     @@exit

@@sizTab:
        DD      4,8,12,8,8

@@storeProc:
        DD      @@single,@@double,@@extended,@@comp,@@curr

@@single:
        FSTP    [ESI].Single
        RET

@@double:
        FSTP    [ESI].Double
        RET

@@extended:
        FSTP    [ESI].Extended
        RET

@@comp:
        FISTP   [ESI].Comp
        RET

@@curr:
        FMUL    C10000
        FISTP   [ESI].Currency
        RET

@@isField:
        AND     ECX,$00FFFFFF
        LEA     ESI,[EAX+ECX]
        CALL    dword ptr @@storeProc[EBX]

@@exit:
        POP     ESI
        POP     EBX
end;

procedure AssignVariant(var Dest: Variant; const Source: Variant);
begin
  Dest := Source;
end;

function GetVariantProp(Instance: TObject; PropInfo: PPropInfo): Variant;
asm
        { ->    EAX Pointer to instance         }
        {       EDX Pointer to property info    }
        {       ECX Pointer to result variant   }

        PUSH    ESI
        PUSH    EDI
        MOV     EDI,EDX

        MOV     EDX,[EDI].TPropInfo.Index       { pass index in EDX }
        CMP     EDX,$80000000
        JNE     @@hasIndex
        MOV     EDX,ECX                         { pass value in EDX }
@@hasIndex:
        MOV     ESI,[EDI].TPropInfo.GetProc
        CMP     [EDI].TPropInfo.GetProc.Byte[3],$FE
        JA      @@isField
        JB      @@isStaticMethod

@@isVirtualMethod:
        MOVSX   ESI,SI                          { sign extend slot offset }
        ADD     ESI,[EAX]                       { vmt + slot offset }
        CALL    DWORD PTR [ESI]
        JMP     @@exit

@@isStaticMethod:
        CALL    ESI
        JMP     @@exit

@@isField:
	AND	ESI,$00FFFFFF
	LEA	EDX,[EAX+ESI]
	MOV	EAX,ECX
	CALL	AssignVariant

@@exit:
        POP     EDI
        POP     ESI
end;

procedure SetVariantProp(Instance: TObject; PropInfo: PPropInfo;
  const Value: Variant);
asm
        { ->    EAX Pointer to instance         }
        {       EDX Pointer to property info    }
        {       ECX Pointer to variant value    }

        PUSH    ESI
        PUSH    EDI
        MOV     ESI,EDX

        MOV     EDX,[ESI].TPropInfo.Index       { pass index in EDX }
        CMP     EDX,$80000000
        JNE     @@hasIndex
        MOV     EDX,ECX                         { pass value in EDX }
@@hasIndex:
        MOV     EDI,[ESI].TPropInfo.SetProc
        CMP     [ESI].TPropInfo.SetProc.Byte[3],$FE
        JA      @@isField
        JB      @@isStaticMethod

@@isVirtualMethod:
        MOVSX   EDI,DI
        ADD     EDI,[EAX]
        CALL    DWORD PTR [EDI]
        JMP     @@exit

@@isStaticMethod:
        CALL    EDI
        JMP     @@exit

@@isField:
	AND	EDI,$00FFFFFF
	ADD	EAX,EDI
	MOV	EDX,ECX
	CALL	AssignVariant

@@exit:
        POP     EDI
        POP     ESI
end;

function GetMethodProp(Instance: TObject; PropInfo: PPropInfo): TMethod;
  assembler;
asm
        { ->    EAX Pointer to instance         }
        {       EDX Pointer to property info    }
        {       ECX Pointer to result           }

        PUSH    EBX
        PUSH    ESI
        MOV     ESI,EDX

        MOV     EDX,[ESI].TPropInfo.Index       { pass Index in DX      }
        CMP     EDX,$80000000
        JNE     @@hasIndex
        MOV     EDX,ECX                         { pass value in EDX     }
@@hasIndex:

        MOV     EBX,[ESI].TPropInfo.GetProc
        CMP     [ESI].TPropInfo.GetProc.Byte[3],$FE
        JA      @@isField
        JB      @@isStaticMethod

        {       GetProc is a virtual method     }
        MOVSX   EBX,BX                          { sign extend slot number }
        ADD     EBX,[EAX]
        CALL    dword ptr [EBX]
        JMP     @@exit

@@isStaticMethod:
        CALL    EBX
        JMP     @@exit

@@isField:
        AND     EBX,$00FFFFFF
        ADD     EAX,EBX
        MOV     EDX,[EAX]
        MOV     EBX,[EAX+4]
        MOV     [ECX],EDX
        MOV     [ECX+4],EBX

@@exit:
        POP     ESI
        POP     EBX
end;

procedure SetMethodProp(Instance: TObject; PropInfo: PPropInfo;
  const Value: TMethod); assembler;
asm
        { ->    EAX Pointer to instance         }
        {       EDX Pointer to property info    }
        {       ECX Pointer to value            }
        PUSH    EBX
        MOV     EBX,[EDX].TPropInfo.SetProc
        CMP     [EDX].TPropInfo.SetProc.Byte[3],$FE
        JA      @@isField
        MOV     EDX,[EDX].TPropInfo.Index
        PUSH    dword ptr [ECX+4]
        PUSH    dword ptr [ECX]
        JB      @@isStaticMethod

        {       SetProc is a virtual method     }
        MOVSX   EBX,BX
        ADD     EBX,[EAX]
        CALL    dword ptr [EBX]
        JMP     @@exit

@@isStaticMethod:
        CALL    EBX
        JMP     @@exit

@@isField:
        AND     EBX,$00FFFFFF
        ADD     EAX,EBX
        MOV     EDX,[ECX]
        MOV     EBX,[ECX+4]
        MOV     [EAX],EDX
        MOV     [EAX+4],EBX

@@exit:
        POP     EBX
end;

function GetInt64Prop(Instance: TObject; PropInfo: PPropInfo): Int64;
  assembler;
asm
        { ->    EAX Pointer to instance         }
        {       EDX Pointer to property info    }
        { <-    EDX:EAX result                  }

        CMP     [EDX].TPropInfo.GetProc.Byte[3],$FE

        MOV     ECX,[EDX].TPropInfo.GetProc
        MOV     EDX,[EDX].TPropInfo.Index       { pass Index in EDX     }

        JA      @@isField
        JB      @@isStaticMethod

        {       GetProc is a virtual method     }
        MOVSX   ECX,CX                          { sign extend slot number }
        ADD     ECX,[EAX]
        CALL    dword ptr [ECX]
        JMP     @@exit

@@isStaticMethod:
        CALL    ECX
        JMP     @@exit

@@isField:
        AND     ECX,$00FFFFFF
        ADD     EAX,ECX
        MOV     EDX,[EAX].Integer[4]
        MOV     EAX,[EAX].Integer[0]

@@exit:
end;

procedure SetInt64Prop(Instance: TObject; PropInfo: PPropInfo;
  const Value: Int64); assembler;
asm
        { ->    EAX Pointer to instance         }
        {       EDX Pointer to property info    }
        {       [ESP+4] Value                   }
        CMP     [EDX].TPropInfo.SetProc.Byte[3],$FE
        MOV     ECX,[EDX].TPropInfo.SetProc
        JA      @@isField
        MOV     EDX,[EDX].TPropInfo.Index
        PUSH    Value.Integer[4]
        PUSH    Value.Integer[0]
        JB      @@isStaticMethod

        {       SetProc is a virtual method     }
        MOVSX   ECX,CX
        ADD     ECX,[EAX]
        CALL    dword ptr [ECX]
        JMP     @@exit

@@isStaticMethod:
        CALL    ECX
        JMP     @@exit

@@isField:
        AND     ECX,$00FFFFFF
        ADD     EAX,ECX
        MOV     EDX,Value.Integer[0]
        MOV     ECX,Value.Integer[4]
        MOV     [EAX].Integer[0],EDX
        MOV     [EAX].Integer[4],ECX

@@exit:
end;



end.
