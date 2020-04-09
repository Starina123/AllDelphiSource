
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{       Common BDE and DBClient Code                    }
{                                                       }
{       Copyright (c) 1995,98 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit DBCommon;

interface

uses Windows, Classes, DB, BDE;

{ FieldType Mappings }

const
  FldTypeMap: array[TFieldType] of Byte = (
    fldUNKNOWN, fldZSTRING, fldINT16, fldINT32, fldUINT16, fldBOOL,
    fldFLOAT, fldFLOAT, fldBCD, fldDATE, fldTIME, fldTIMESTAMP, fldBYTES,
    fldVARBYTES, fldINT32, fldBLOB, fldBLOB, fldBLOB, fldBLOB, fldBLOB,
    fldBLOB, fldBLOB, fldCURSOR, fldZSTRING, fldZSTRING, fldINT64, fldADT,
    fldArray, fldREF, fldTABLE);

  FldSubTypeMap: array[TFieldType] of Word = (
    0, 0, 0, 0, 0, 0, 0, fldstMONEY, 0, 0, 0, 0, 0, 0, fldstAUTOINC,
    fldstBINARY, fldstMEMO, fldstGRAPHIC, fldstFMTMEMO, fldstOLEOBJ,
    fldstDBSOLEOBJ, fldstTYPEDBINARY, 0, fldstFIXED, fldstUNICODE,
    0, 0, 0, 0, 0);

  DataTypeMap: array[0..MAXLOGFLDTYPES - 1] of TFieldType = (
    ftUnknown, ftString, ftDate, ftBlob, ftBoolean, ftSmallint,
    ftInteger, ftFloat, ftBCD, ftBytes, ftTime, ftDateTime,
    ftWord, ftInteger, ftUnknown, ftVarBytes, ftUnknown, ftUnknown,
    ftLargeInt, ftLargeInt, ftADT, ftArray, ftReference, ftDataSet);

  BlobTypeMap: array[fldstMEMO..fldstBFILE] of TFieldType = (
    ftMemo, ftBlob, ftFmtMemo, ftParadoxOle, ftGraphic, ftDBaseOle,
    ftTypedBinary, ftBlob, ftBlob, ftBlob, ftBlob, ftMemo, ftBlob,
    ftBlob, ftBlob);

{ TFilterExpr }

type

  TParserOption = (poExtSyntax, poAggregate, poDefaultExpr, poUseOrigNames,
                   poFieldNameGiven, poFieldDepend);
  TParserOptions = set of TParserOption;

  TExprNodeKind = (enField, enConst, enOperator, enFunc);
  TExprScopeKind = (skField, skAgg, skConst);

  PExprNode = ^TExprNode;
  TExprNode = record
    FNext: PExprNode;
    FKind: TExprNodeKind;
    FPartial: Boolean;
    FOperator: CanOp;
    FData: Variant;
    FLeft: PExprNode;
    FRight: PExprNode;
    FDataType: Integer;
    FDataSize: Integer;
    FArgs: TList;
    FScopeKind: TExprScopeKind;
  end;

  TFilterExpr = class
  private
    FDataSet: TDataSet;
    FOptions: TFilterOptions;
    FParserOptions: TParserOptions;
    FNodes: PExprNode;
    FExprBuffer: PCANExpr;
    FExprBufSize: Integer;
    FExprNodeSize: Integer;
    FExprDataSize: Integer;
    FFieldName: string;
    FDependentFields: TBits;
    function FieldFromNode(Node: PExprNode): TField;
    function GetExprData(Pos, Size: Integer): PChar;
    function PutConstBCD(const Value: Variant; Decimals: Integer): Integer;
    function PutConstBool(const Value: Variant): Integer;
    function PutConstDate(const Value: Variant): Integer;
    function PutConstDateTime(const Value: Variant): Integer;
    function PutConstFloat(const Value: Variant): Integer;
    function PutConstInt(DataType: Integer; const Value: Variant): Integer;
    function PutConstNode(DataType: Integer; Data: PChar;
      Size: Integer): Integer;
    function PutConstStr(const Value: string): Integer;
    function PutConstTime(const Value: Variant): Integer;
    function PutData(Data: PChar; Size: Integer): Integer;
    function PutExprNode(Node: PExprNode; ParentOp: CanOp): Integer;
    function PutFieldNode(Field: TField; Node: PExprNode): Integer;
    function PutNode(NodeType: NodeClass; OpType: CanOp;
      OpCount: Integer): Integer;
    procedure SetNodeOp(Node, Index, Data: Integer);
    function PutConstant(Node: PExprNode): Integer;
    function GetFieldByName(Name: string) : TField;
  public
    constructor Create(DataSet: TDataSet; Options: TFilterOptions;
      ParseOptions: TParserOptions; const FieldName: string; DepFields: TBits);
    destructor Destroy; override;
    function NewCompareNode(Field: TField; Operator: CanOp;
      const Value: Variant): PExprNode;
    function NewNode(Kind: TExprNodeKind; Operator: CanOp;
      const Data: Variant; Left, Right: PExprNode): PExprNode;
    function GetFilterData(Root: PExprNode): PCANExpr;
    property DataSet: TDataSet write FDataSet;
  end;

{ TExprParser }

  TExprToken = (etEnd, etSymbol, etName, etLiteral,  etLParen, etRParen,
    etEQ, etNE, etGE, etLE, etGT, etLT, etADD, etSUB, etMUL, etDIV,
    etComma, etLIKE, etISNULL, etISNOTNULL, etIN);


  TExprParser = class
  private
    FFilter: TFilterExpr;
    FText: string;
    FSourcePtr: PChar;
    FTokenPtr: PChar;
    FTokenString: string;
    FStrTrue: string;
    FStrFalse: string;
    FToken: TExprToken;
    FPrevToken: TExprToken;
    FFilterData: PCANExpr;
    FNumericLit: Boolean;
    FDataSize: Integer;
    FParserOptions: TParserOptions;
    FFieldName: string;
    FDataSet: TDataSet;
    FDependentFields: TBits;
    procedure NextToken;
    function NextTokenIsLParen : Boolean;
    function ParseExpr: PExprNode;
    function ParseExpr2: PExprNode;
    function ParseExpr3: PExprNode;
    function ParseExpr4: PExprNode;
    function ParseExpr5: PExprNode;
    function ParseExpr6: PExprNode;
    function ParseExpr7: PExprNode;
    function TokenName: string;
    function TokenSymbolIs(const S: string): Boolean;
    function TokenSymbolIsFunc(const S: string) : Boolean;
    procedure GetFuncResultInfo(Node: PExprNode);
    procedure TypeCheckArithOp(Node: PExprNode);
    procedure GetScopeKind(Root, Left, Right : PExprNode);
  public
    constructor Create(DataSet: TDataSet; const Text: string;
      Options: TFilterOptions; ParserOptions: TParserOptions;
      const FieldName: string; DepFields: TBits);
    destructor Destroy; override;
    procedure SetExprParams(const Text: string; Options: TFilterOptions;
      ParserOptions: TParserOptions; const FieldName: string);
    property FilterData: PCANExpr read FFilterData;
    property DataSize: Integer read FDataSize;
  end;

{ TMasterDataLink }

  TMasterDataLink = class(TDetailDataLink)
  private
    FDataSet: TDataSet;
    FFieldNames: string;
    FFields: TList;
    FOnMasterChange: TNotifyEvent;
    FOnMasterDisable: TNotifyEvent;
    procedure SetFieldNames(const Value: string);
  protected
    procedure ActiveChanged; override;
    procedure CheckBrowseMode; override;
    function GetDetailDataSet: TDataSet; override;
    procedure LayoutChanged; override;
    procedure RecordChanged(Field: TField); override;
  public
    constructor Create(DataSet: TDataSet);
    destructor Destroy; override;
    property FieldNames: string read FFieldNames write SetFieldNames;
    property Fields: TList read FFields;
    property OnMasterChange: TNotifyEvent read FOnMasterChange write FOnMasterChange;
    property OnMasterDisable: TNotifyEvent read FOnMasterDisable write FOnMasterDisable;
  end;

function FMTBCDToCurr(const BCD: FMTBcd; var Curr: Currency): Boolean;
function CurrToFMTBCD(Curr: Currency; var BCD: FMTBcd; Precision,
  Decimals: Integer): Boolean;
function GetFieldSource(ADataSet: TDataSet; var ADataSources:  DataSources): Boolean;

implementation

uses SysUtils, DBConsts;

function GetFieldSource(ADataSet: TDataSet; var ADataSources:  DataSources): Boolean;
var
  Current: PChar;
  Field: TField;
  Values: array[0..4] of string;
  I: Integer;

  function GetPChar(const S: string): PChar;
  begin
    if S <> '' then Result := PChar(Pointer(S)) else Result := '';
  end;

  procedure Split(const S: string);
  begin
    Current := PChar(Pointer(S));
  end;

  function NextItem: string;
  var
    C: PChar;
    I: PChar;
    Terminator: Char;
    Ident: array[0..1023] of Char;
  begin
    Result := '';
    C := Current;
    I := Ident;
    while C^ in ['.',' ',#0] do
      if C^ = #0 then Exit else Inc(C);
    Terminator := '.';
    if C^ = '"' then
    begin
      Terminator := '"';
      Inc(C);
    end;
    while not (C^ in [Terminator, #0]) do
    begin
      if C^ in LeadBytes then
      begin
        I^ := C^;
        Inc(C);
        Inc(I);
      end
      else if C^ = '\' then
      begin
        Inc(C);
        if C^ in LeadBytes then
        begin
          I^ := C^;
          Inc(C);
          Inc(I);
        end;
        if C^ = #0 then Dec(C);
      end;
      I^ := C^;
      Inc(C);
      Inc(I);
    end;
    SetString(Result, Ident, I - Ident);
    if (Terminator = '"') and (C^ <> #0) then Inc(C);
    Current := C;
  end;

  function PopValue: PChar;
  begin
    if I >= 0 then
    begin
      Result := GetPChar(Values[I]);
      Dec(I);
    end else Result := '';
  end;

begin
  Result := False;
  Field := ADataSet.FindField(ADataSources.szSourceFldName);
  if (Field = nil) or (Field.Origin = '') then Exit;
  Split(Field.Origin);
  I := -1;
  repeat
    Inc(I);
    Values[I] := NextItem;
  until (Values[I] = '') or (I = High(Values));
  if I = High(Values) then Exit;
  Dec(I);
  StrCopy(ADataSources.szOrigFldName, PopValue);
  StrCopy(ADataSources.szTblName, PopValue);
  StrCopy(ADataSources.szDbName, PopValue);
  Result := (ADataSources.szOrigFldName[0] <> #0) and
    (ADataSources.szTblName[0] <> #0);
end;

function FMTBCDToCurr(const BCD: FMTBcd; var Curr: Currency): Boolean;
const
  FConst10: Single = 10;
  CWNear: Word = $133F;
var
  CtrlWord: Word;
  Temp: Integer;
  Digits: array[0..63] of Byte;
asm
        PUSH    EBX
        PUSH    ESI
        MOV     EBX,EAX
        MOV     ESI,EDX
        MOV     AL,0
        MOVZX   EDX,[EBX].FMTBcd.iPrecision
        OR      EDX,EDX
        JE      @@8
        LEA     ECX,[EDX+1]
        SHR     ECX,1
@@1:    MOV     AL,[EBX].FMTBcd.iFraction.Byte[ECX-1]
        MOV     AH,AL
        SHR     AL,4
        AND     AH,0FH
        MOV     Digits.Word[ECX*2-2],AX
        DEC     ECX
        JNE     @@1
        XOR     EAX,EAX
@@2:    MOV     AL,Digits.Byte[ECX]
        OR      AL,AL
        JNE     @@3
        INC     ECX
        CMP     ECX,EDX
        JNE     @@2
        FLDZ
        JMP     @@7
@@3:    MOV     Temp,EAX
        FILD    Temp
@@4:    INC     ECX
        CMP     ECX,EDX
        JE      @@5
        FMUL    FConst10
        MOV     AL,Digits.Byte[ECX]
        MOV     Temp,EAX
        FIADD   Temp
        JMP     @@4
@@5:    MOV     AL,[EBX].FMTBcd.iSignSpecialPlaces
        OR      AL,AL
        JNS     @@6
        FCHS
@@6:    AND     EAX,3FH
        SUB     EAX,4
        NEG     EAX
        CALL    FPower10
@@7:    FSTCW   CtrlWord
        FLDCW   CWNear
        FISTP   [ESI].Currency
        FSTSW   AX
        NOT     AL
        AND     AL,1
        FCLEX
        FLDCW   CtrlWord
        FWAIT
@@8:    POP     ESI
        POP     EBX
end;

function CurrToFMTBCD(Curr: Currency; var BCD: FMTBcd; Precision,
  Decimals: Integer): Boolean;
const
  Power10: array[0..3] of Single = (10000, 1000, 100, 10);
var
  Digits: array[0..63] of Byte;
asm
        PUSH    EBX
        PUSH    ESI
        PUSH    EDI
        MOV     ESI,EAX
        XCHG    ECX,EDX
        MOV     [ESI].FMTBcd.iPrecision,CL
        MOV     [ESI].FMTBcd.iSignSpecialPlaces,DL
@@1:    SUB     EDX,4
        JE      @@3
        JA      @@2
        FILD    Curr
        FDIV    Power10.Single[EDX*4+16]
        FISTP   Curr
        JMP     @@3
@@2:    DEC     ECX
        MOV     Digits.Byte[ECX],0
        DEC     EDX
        JNE     @@2
@@3:    MOV     EAX,Curr.Integer[0]
        MOV     EBX,Curr.Integer[4]
        OR      EBX,EBX
        JNS     @@4
        NEG     EBX
        NEG     EAX
        SBB     EBX,0
        OR      [ESI].FMTBcd.iSignSpecialPlaces,80H
@@4:    MOV     EDI,10
@@5:    MOV     EDX,EAX
        OR      EDX,EBX
        JE      @@7
        XOR     EDX,EDX
        OR      EBX,EBX
        JE      @@6
        XCHG    EAX,EBX
        DIV     EDI
        XCHG    EAX,EBX
@@6:    DIV     EDI
@@7:    MOV     Digits.Byte[ECX-1],DL
        DEC     ECX
        JNE     @@5
        OR      EAX,EBX
        MOV     AL,0
        JNE     @@9
        MOV     CL,[ESI].FMTBcd.iPrecision
        INC     ECX
        SHR     ECX,1
@@8:    MOV     AX,Digits.Word[ECX*2-2]
        SHL     AL,4
        OR      AL,AH
        MOV     [ESI].FMTBcd.iFraction.Byte[ECX-1],AL
        DEC     ECX
        JNE     @@8
        MOV     AL,1
@@9:    POP     EDI
        POP     ESI
        POP     EBX
end;

function IsNumeric(DataType: Integer): Boolean;
begin
  Result := DataType in [fldINT16, fldINT32, fldFLOAT, fldBCD];
end;

function IsTemporal(DataType: Integer): Boolean;
begin
  Result := DataType in [fldDATE, fldTIME, fldTIMESTAMP];
end;


{ TFilterExpr }

constructor TFilterExpr.Create(DataSet: TDataSet; Options: TFilterOptions;
  ParseOptions: TParserOptions; const FieldName: string; DepFields: TBits);
begin
  FDataSet := DataSet;
  FOptions := Options;
  FFieldName := FieldName;
  FParserOptions := ParseOptions;
  FDependentFields := DepFields;
end;

destructor TFilterExpr.Destroy;
var
  Node: PExprNode;
begin
  FreeMem(FExprBuffer, FExprBufSize);
  while FNodes <> nil do
  begin
    Node := FNodes;
    FNodes := Node^.FNext;
    if (Node^.FKind = enFunc) and (Node^.FArgs <> nil) then
      Node^.FArgs.Free; 
    Dispose(Node);
  end;
end;

function TFilterExpr.FieldFromNode(Node: PExprNode): TField;
begin
  Result := GetFieldByName(Node^.FData);
  if not (Result.FieldKind in [fkData, fkInternalCalc]) then
    DatabaseErrorFmt(SExprBadField, [Result.FieldName]);
end;

function TFilterExpr.GetExprData(Pos, Size: Integer): PChar;
begin
  ReallocMem(FExprBuffer, FExprBufSize + Size);
  Move(PChar(FExprBuffer)[Pos], PChar(FExprBuffer)[Pos + Size],
    FExprBufSize - Pos);
  Inc(FExprBufSize, Size);
  Result := PChar(FExprBuffer) + Pos;
end;

function TFilterExpr.GetFilterData(Root: PExprNode): PCANExpr;
begin
  FExprBufSize := SizeOf(CANExpr);
  GetMem(FExprBuffer, FExprBufSize);
  PutExprNode(Root, canNOTDEFINED);
  with FExprBuffer^ do
  begin
    iVer := CANEXPRVERSION;
    iTotalSize := FExprBufSize;
    iNodes := $FFFF;
    iNodeStart := SizeOf(CANExpr);
    iLiteralStart := FExprNodeSize + SizeOf(CANExpr);
  end;
  Result := FExprBuffer;
end;

function TFilterExpr.NewCompareNode(Field: TField; Operator: CanOp;
  const Value: Variant): PExprNode;
var 
  ConstExpr: PExprNode;
begin
  ConstExpr := NewNode(enConst, canNOTDEFINED, Value, nil, nil);
  ConstExpr^.FDataType := FldTypeMap[ Field.DataType ];
  ConstExpr^.FDataSize := Field.Size;
  Result := NewNode(enOperator, Operator, Unassigned,
    NewNode(enField, canNOTDEFINED, Field.FieldName, nil, nil), ConstExpr);
end;

function TFilterExpr.NewNode(Kind: TExprNodeKind; Operator: CanOp;
  const Data: Variant; Left, Right: PExprNode): PExprNode;
var
  Field : TField;
begin
  New(Result);
  with Result^ do
  begin
    FNext := FNodes;
    FKind := Kind;
    FPartial := False;
    FOperator := Operator;
    FData := Data;
    FLeft := Left;
    FRight := Right;
  end;
  FNodes := Result;
  if Kind = enField then
  begin
    Field := GetFieldByName(Data);
    if Field = nil then
      DatabaseErrorFmt(SFieldNotFound, [Data]);
    Result^.FDataType := FldTypeMap[ Field.DataType ];
    Result^.FDataSize := Field.Size;
  end;
end;

function TFilterExpr.PutConstBCD(const Value: Variant;
  Decimals: Integer): Integer;
var
  C: Currency;
  BCD: FMTBcd;
begin
  if VarType(Value) = varString then
    C := StrToCurr(string(TVarData(Value).VString)) else
    C := Value;
  CurrToFMTBCD(C, BCD, 32, Decimals);
  Result := PutConstNode(fldBCD, @BCD, 18);
end;

function TFilterExpr.PutConstBool(const Value: Variant): Integer;
var
  B: WordBool;
begin
  B := Value;
  Result := PutConstNode(fldBOOL, @B, SizeOf(WordBool));
end;

function TFilterExpr.PutConstDate(const Value: Variant): Integer;
var
  DateTime: TDateTime;
  TimeStamp: TTimeStamp;
begin
  if VarType(Value) = varString then
    DateTime := StrToDate(string(TVarData(Value).VString)) else
    DateTime := VarToDateTime(Value);
  TimeStamp := DateTimeToTimeStamp(DateTime);
  Result := PutConstNode(fldDATE, @TimeStamp.Date, 4);
end;

function TFilterExpr.PutConstDateTime(const Value: Variant): Integer;
var
  DateTime: TDateTime;
  DateData: Double;
begin
  if VarType(Value) = varString then
    DateTime := StrToDateTime(string(TVarData(Value).VString)) else
    DateTime := VarToDateTime(Value);
  DateData := TimeStampToMSecs(DateTimeToTimeStamp(DateTime));
  Result := PutConstNode(fldTIMESTAMP, @DateData, 8);
end;

function TFilterExpr.PutConstFloat(const Value: Variant): Integer;
var
  F: Double;
begin
  if VarType(Value) = varString then
    F := StrToFloat(string(TVarData(Value).VString)) else
    F := Value;
  Result := PutConstNode(fldFLOAT, @F, SizeOf(Double));
end;

function TFilterExpr.PutConstInt(DataType: Integer;
  const Value: Variant): Integer;
var
  I, Size: Integer;
begin
  if VarType(Value) = varString then
    I := StrToInt(string(TVarData(Value).VString)) else
    I := Value;
  Size := 2;
  case DataType of
    fldINT16:
      if (I < -32768) or (I > 32767) then DatabaseError(SExprRangeError);
    fldUINT16:
      if (I < 0) or (I > 65535) then DatabaseError(SExprRangeError);
  else
    Size := 4;
  end;
  Result := PutConstNode(DataType, @I, Size);
end;

function TFilterExpr.PutConstNode(DataType: Integer; Data: PChar;
  Size: Integer): Integer;
begin
  Result := PutNode(nodeCONST, canCONST2, 3);
  SetNodeOp(Result, 0, DataType);
  SetNodeOp(Result, 1, Size);
  SetNodeOp(Result, 2, PutData(Data, Size));
end;

function TFilterExpr.PutConstStr(const Value: string): Integer;
var
  Str: string;
  Buffer: array[0..255] of Char;
begin
  if Length(Value) >= SizeOf(Buffer) then
    Str := Copy(Value, 1, SizeOf(Buffer) - 1) else
    Str := Value;
  FDataSet.Translate(PChar(Str), Buffer, True);
  Result := PutConstNode(fldZSTRING, Buffer, Length(Str) + 1);
end;

function TFilterExpr.PutConstTime(const Value: Variant): Integer;
var
  DateTime: TDateTime;
  TimeStamp: TTimeStamp;
begin
  if VarType(Value) = varString then
    DateTime := StrToTime(string(TVarData(Value).VString)) else
    DateTime := VarToDateTime(Value);
  TimeStamp := DateTimeToTimeStamp(DateTime);
  Result := PutConstNode(fldTIME, @TimeStamp.Time, 4);
end;

function TFilterExpr.PutData(Data: PChar; Size: Integer): Integer;
begin
  Move(Data^, GetExprData(FExprBufSize, Size)^, Size);
  Result := FExprDataSize;
  Inc(FExprDataSize, Size);
end;

function TFilterExpr.PutConstant(Node: PExprNode): Integer;
begin
  Result := 0;
  case Node^.FDataType of
    fldINT16, fldINT32:
      Result := PutConstInt(Node^.FDataType, Node^.FData);
    fldFLOAT:
      Result := PutConstFloat(Node^.FData);
    fldZSTRING:
      Result := PutConstStr(Node^.FData);
    fldDATE:
      Result := PutConstDate(Node^.FData);
    fldTIME:
      Result := PutConstTime(Node^.FData);
    fldTIMESTAMP:
      Result := PutConstDateTime(Node^.FData);
    fldBOOL:
      Result := PutConstBool(Node^.FData);
    fldBCD:
      Result := PutConstBCD(Node^.FData, Node^.FDataSize);
    else
      DatabaseErrorFmt(SExprBadConst, [Node^.FData]); 
  end;
end;

function TFilterExpr.PutExprNode(Node: PExprNode; ParentOp: CanOp): Integer;
const
  ReverseOperator: array[canEQ..canLE] of CanOp = (canEQ, canNE, canLT,
    canGT, canLE, canGE);
  BoolFalse: WordBool = False;
var
  Field: TField;
  Left, Right, Temp : PExprNode;
  LeftPos, RightPos, ListElem, PrevListElem, I: Integer;
  Operator: CanOp;
  CaseInsensitive, PartialLength, L:  Integer;
  S: string;
begin
  Result := 0;
  case Node^.FKind of
    enField:
      begin
        Field := FieldFromNode(Node);
        if (ParentOp in [canOR, canNOT, canAND, canNOTDEFINED]) and
           (Field.DataType = ftBoolean) then
        begin
          Result := PutNode(nodeBINARY, canNE, 2);
          SetNodeOp(Result, 0, PutFieldNode(Field, Node));
          SetNodeOp(Result, 1, PutConstNode(fldBOOL, @BoolFalse,
            SizeOf(WordBool)));
        end
        else
          Result := PutFieldNode(Field, Node);
      end;
    enConst:
      Result := PutConstant(Node);
    enOperator:
      case Node^.FOperator of
        canIN:
          begin
            Result := PutNode(nodeBINARY, canIN, 2);
            SetNodeOp(Result, 0, PutExprNode(Node^.FLeft,Node^.FOperator));
            ListElem := PutNode(nodeLISTELEM, canLISTELEM2, 2);
            SetNodeOp(Result, 1, ListElem);
            PrevListElem := ListElem;
            for I := 0 to Node^.FArgs.Count - 1 do 
            begin
              LeftPos := PutExprNode(Node^.FArgs.Items[I],Node^.FOperator);
              if I = 0 then 
                begin
                  SetNodeOp(PrevListElem, 0, LeftPos);
                  SetNodeOp(PrevListElem, 1, 0);
                end
              else
                begin
                  ListElem := PutNode(nodeLISTELEM, canLISTELEM2, 2);
                  SetNodeOp(ListElem, 0, LeftPos);
                  SetNodeOp(ListElem, 1, 0);
                  SetNodeOp(PrevListElem, 1, ListElem);
                  PrevListElem := ListElem;
                end;
              end;
          end;
        canNOT,
        canISBLANK,
        canNOTBLANK:
          begin
            Result := PutNode(nodeUNARY, Node^.FOperator, 1);
            SetNodeOp(Result, 0, PutExprNode(Node^.FLeft,Node^.FOperator));
          end;
        canEQ..canLE,
        canAND,canOR,
        canADD..canDIV,
        canLIKE,
        canASSIGN:
          begin
            Operator := Node^.FOperator;
            Left := Node^.FLeft;
            Right := Node^.FRight;
            if (Operator in [CanEQ..canLE]) and (Right^.FKind = enField) and
               (Left^.FKind <> enField) then
            begin
              Temp := Left;
              Left := Right;
              Right := Temp;
              Operator := ReverseOperator[Operator];
            end;

            Result := 0;
            if (Left^.FKind = enField) and (Right^.FKind = enConst)
               and ((Node^.FOperator = canEQ)  or (Node^.FOperator = canNE)
               or (Node^.FOperator = canLIKE)) then
            begin
              if VarIsNull(Right^.FData) then
              begin
                case Node^.FOperator of
                  canEQ: Operator := canISBLANK;
                  canNE: Operator := canNOTBLANK;
                else
                  DatabaseError(SExprBadNullTest);
                end;
                Result := PutNode(nodeUNARY, Operator, 1);
                SetNodeOp(Result, 0, PutExprNode(Left,Node^.FOperator));
              end
              else if (Right^.FDataType = fldZSTRING) then
              begin
                S := Right^.FData;
                L := Length(S);
                if L <> 0 then
                begin
                  CaseInsensitive := 0;
                  PartialLength := 0;
                  if foCaseInsensitive in FOptions then CaseInsensitive := 1;
                  if Node^.FPartial then PartialLength := L else
                    if not (foNoPartialCompare in FOptions) and (L > 1) and
                      (S[L] = '*') then
                    begin
                      Delete(S, L, 1);
                      PartialLength := L - 1;
                    end;
                  if (CaseInsensitive <> 0) or (PartialLength <> 0) then
                  begin
                    Result := PutNode(nodeCOMPARE, Operator, 4);
                    SetNodeOp(Result, 0, CaseInsensitive);
                    SetNodeOp(Result, 1, PartialLength);
                    SetNodeOp(Result, 2, PutExprNode(Left,Node^.FOperator));
                    SetNodeOp(Result, 3, PutConstStr(S));
                  end;
                end;
              end;
            end;

            if Result = 0 then
            begin
              if (Operator = canISBLANK) or (Operator = canNOTBLANK) then
              begin
                Result := PutNode(nodeUNARY, Operator, 1);
                LeftPos := PutExprNode(Left,Node^.FOperator);
                SetNodeOp(Result, 0, LeftPos);
              end else
              begin
                Result := PutNode(nodeBINARY, Operator, 2);
                LeftPos := PutExprNode(Left,Node^.FOperator);
                RightPos := PutExprNode(Right,Node^.FOperator);
                SetNodeOp(Result, 0, LeftPos);
                SetNodeOp(Result, 1, RightPos);
              end;
            end;
          end;
      end;
    enFunc:
      begin
        Result := PutNode(nodeFUNC, canFUNC2, 2);
        SetNodeOp(Result, 0,  PutData(PChar(string(Node^.FData)),
          Length(string(Node^.FData)) + 1));
        if Node^.FArgs <> nil then
        begin
          ListElem := PutNode(nodeLISTELEM, canLISTELEM2, 2);
          SetNodeOp(Result, 1, ListElem);
          PrevListElem := ListElem;
          for I := 0 to Node^.FArgs.Count - 1 do
          begin
            LeftPos := PutExprNode(Node^.FArgs.Items[I],Node^.FOperator);
            if I = 0 then
            begin
              SetNodeOp(PrevListElem, 0, LeftPos);
              SetNodeOp(PrevListElem, 1, 0);
            end
            else
            begin
              ListElem := PutNode(nodeLISTELEM, canLISTELEM2, 2);
              SetNodeOp(ListElem, 0, LeftPos);
              SetNodeOp(ListElem, 1, 0);
              SetNodeOp(PrevListElem, 1, ListElem);
              PrevListElem := ListElem;
            end;
          end;
        end else
          SetNodeOp(Result, 1, 0);
      end;
  end;
end;


function TFilterExpr.PutFieldNode(Field: TField; Node: PExprNode): Integer;
var
  Buffer: array[0..255] of Char;
begin
  if poFieldNameGiven in FParserOptions then
    FDataSet.Translate(PChar(Field.FieldName), Buffer, True)
  else
    FDataSet.Translate(PChar(string(Node^.FData)), Buffer, True);
  Result := PutNode(nodeFIELD, canFIELD2, 2);
  SetNodeOp(Result, 0, Field.FieldNo);
  SetNodeOp(Result, 1, PutData(Buffer, StrLen(Buffer) + 1));
end;

function TFilterExpr.PutNode(NodeType: NodeClass; OpType: CanOp;
  OpCount: Integer): Integer;
var
  Size: Integer;
begin
  Size := SizeOf(CANHdr) + OpCount * SizeOf(Word);
  with PCANHdr(GetExprData(SizeOf(CANExpr) + FExprNodeSize, Size))^ do
  begin
    nodeClass := NodeType;
    canOp := OpType;
  end;
  Result := FExprNodeSize;
  Inc(FExprNodeSize, Size);
end;

procedure TFilterExpr.SetNodeOp(Node, Index, Data: Integer);
begin
  PWordArray(PChar(FExprBuffer) + (SizeOf(CANExpr) + Node +
    SizeOf(CANHdr)))^[Index] := Data;
end;

function TFilterExpr.GetFieldByName(Name: string) : TField;
var
  I: Integer;
  F: TField;
  ADataSources: DataSources;
begin
  Result := nil;
  if poFieldNameGiven in FParserOptions then
    Result := FDataSet.FieldByName(FFieldName)
  else if poUseOrigNames in FParserOptions then
  begin
    for I := 0 to FDataset.FieldCount - 1 do
    begin
      F := FDataSet.Fields[I];
      StrCopy(ADataSources.szSourceFldName, PChar(F.FieldName));
      if GetFieldSource(FDataSet, ADataSources)
         and (AnsiStrComp(PChar(Name), ADataSources.szOrigFldName) = 0) then
      begin
        Result := F;
        Exit;
      end;
    end;
  end;
  if Result = nil then
    Result := FDataSet.FieldByName(Name);
  if (poFieldDepend in FParserOptions) and (Result <> nil) and
     (FDependentFields <> nil) then
    FDependentFields[Result.FieldNo-1] := True;
end;

constructor TExprParser.Create(DataSet: TDataSet; const Text: string;
  Options: TFilterOptions; ParserOptions: TParserOptions; const FieldName: string;
  DepFields: TBits);
begin
  FStrTrue := STextTrue;
  FStrFalse := STextFalse;
  FDataSet := DataSet;
  FDependentFields := DepFields;
  FFilter := TFilterExpr.Create(DataSet, Options, ParserOptions, FieldName, DepFields);
  if Text <> '' then
    SetExprParams(Text, Options, ParserOptions, FieldName);
end;

destructor TExprParser.Destroy;
begin
  FFilter.Free;
end;

procedure  TExprParser.SetExprParams(const Text: string; Options: TFilterOptions;
  ParserOptions: TParserOptions; const FieldName: string);
var
  Root, DefField: PExprNode;
begin
  FParserOptions := ParserOptions;
  if FFilter <> nil then
    FFilter.Free;
  FFilter := TFilterExpr.Create(FDataSet, Options, ParserOptions, FieldName,
    FDependentFields);
  FText := Text;
  FSourcePtr := PChar(Text);
  FFieldName := FieldName;
  NextToken;
  Root := ParseExpr;
  if FToken <> etEnd then DatabaseError(SExprTermination);
  if (poAggregate in FParserOptions) and (Root^.FScopeKind <> skAgg) then
     DatabaseError(SExprNotAgg);
  if (not (poAggregate in FParserOptions)) and (Root^.FScopeKind = skAgg) then
     DatabaseError(SExprNoAggFilter);
  if poDefaultExpr in ParserOptions then
  begin
    DefField := FFilter.NewNode(enField, canNOTDEFINED, FFieldName, nil, nil);
    if (IsTemporal(DefField^.FDataType) and (Root^.FDataType = fldZSTRING)) or
       ((DefField^.FDataType = fldBOOL ) and (Root^.FDataType = fldZSTRING)) then
      Root^.FDataType := DefField^.FDataType;


    if not ((IsTemporal(DefField^.FDataType) and IsTemporal(Root^.FDataType))
       or (IsNumeric(DefField^.FDataType) and IsNumeric(Root^.FDataType))
       or ((DefField^.FDataType = fldZSTRING) and (Root^.FDataType = fldZSTRING))
       or ((DefField^.FDataType = fldBOOL) and (Root^.FDataType = fldBOOL))) then
      DatabaseError(SExprTypeMis);
    Root := FFilter.NewNode(enOperator, canASSIGN, Unassigned, Root, DefField);
  end;
  FFilterData := FFilter.GetFilterData(Root);
  FDataSize := FFilter.FExprBufSize;
end;

function TExprParser.NextTokenIsLParen : Boolean;
var
  P : PChar;
begin
  P := FSourcePtr;
  while (P^ <> #0) and (P^ <= ' ') do Inc(P);
  Result := P^ = '(';
end;

procedure TExprParser.NextToken;
type
  ASet = Set of Char;
var
  P, TokenStart: PChar;
  L: Integer;
  StrBuf: array[0..255] of Char;

  function IsKatakana(const Chr: Byte): Boolean;
  begin
    Result := (SysLocale.PriLangID = LANG_JAPANESE) and (Chr in [$A1..$DF]);
  end;

  procedure Skip(TheSet: ASet);
  begin
    while TRUE do
    begin
      if P^ in LeadBytes then
        Inc(P, 2)
      else if (P^ in TheSet) or IsKatakana(Byte(P^)) then
        Inc(P)
      else
        Exit;
    end;
  end;

begin
  FPrevToken := FToken;
  FTokenString := '';
  P := FSourcePtr;
  while (P^ <> #0) and (P^ <= ' ') do Inc(P);
  if (P^ <> #0) and (P^ = '/') and (P[1] <> #0) and (P[1] = '*')then
  begin
    P := P + 2;
    while (P^ <> #0) and (P^ <> '*') do Inc(P);
    if (P^ = '*') and (P[1] <> #0) and (P[1] =  '/')  then
      P := P + 2
    else
      DatabaseErrorFmt(SExprInvalidChar, [P^]);
  end;
  while (P^ <> #0) and (P^ <= ' ') do Inc(P);
  FTokenPtr := P;
  case P^ of
    'A'..'Z', 'a'..'z', '_', #$81..#$fe:
      begin
        TokenStart := P;
        if not SysLocale.FarEast then
        begin
          Inc(P);
          while P^ in ['A'..'Z', 'a'..'z', '0'..'9', '_', '.', '[', ']'] do Inc(P);
        end
        else
          Skip(['A'..'Z', 'a'..'z', '0'..'9', '_', '.', '[', ']']);
        SetString(FTokenString, TokenStart, P - TokenStart);
        FToken := etSymbol;
        if CompareText(FTokenString, 'LIKE') = 0 then   { do not localize }
          FToken := etLIKE
        else if CompareText(FTokenString, 'IN') = 0 then   { do not localize }
          FToken := etIN
        else if CompareText(FTokenString, 'IS') = 0 then    { do not localize }
        begin
          while (P^ <> #0) and (P^ <= ' ') do Inc(P);
          TokenStart := P;
          Skip(['A'..'Z', 'a'..'z']);
          SetString(FTokenString, TokenStart, P - TokenStart);
          if CompareText(FTokenString, 'NOT')= 0 then  { do not localize }
          begin
            while (P^ <> #0) and (P^ <= ' ') do Inc(P);
            TokenStart := P;
            Skip(['A'..'Z', 'a'..'z']);
            SetString(FTokenString, TokenStart, P - TokenStart);
            if CompareText(FTokenString, 'NULL') = 0 then
              FToken := etISNOTNULL
            else
              DatabaseError(SInvalidKeywordUse);
          end
          else if CompareText (FTokenString, 'NULL') = 0  then  { do not localize }
          begin
            FToken := etISNULL;
          end
          else
            DatabaseError(SInvalidKeywordUse);
        end;
      end;
    '[':
      begin
        Inc(P);
        TokenStart := P;
        P := AnsiStrScan(P, ']');
        if P = nil then DatabaseError(SExprNameError);
        SetString(FTokenString, TokenStart, P - TokenStart);
        FToken := etName;
        Inc(P);
      end;
    '''':
      begin
        Inc(P);
        L := 0;
        while True do
        begin
          if P^ = #0 then DatabaseError(SExprStringError);
          if P^ = '''' then
          begin
            Inc(P);
            if P^ <> '''' then Break;
          end;
          if L < SizeOf(StrBuf) then
          begin
            StrBuf[L] := P^;
            Inc(L);
          end;
          Inc(P);
        end;
        SetString(FTokenString, StrBuf, L);
        FToken := etLiteral;
        FNumericLit := False;
      end;
    '-', '0'..'9':
      begin
        if (FPrevToken <> etLiteral) and (FPrevToken <> etName) and
           (FPrevToken <> etSymbol)and (FPrevToken <> etRParen) then
          begin
            TokenStart := P;
            Inc(P);
            while P^ in ['0'..'9', '.', 'e', 'E', '+', '-'] do Inc(P);
            SetString(FTokenString, TokenStart, P - TokenStart);
            FToken := etLiteral;
            FNumericLit := True;
          end
        else
         begin
           FToken := etSUB;
           Inc(P);
         end;
      end;
    '(':
      begin
        Inc(P);
        FToken := etLParen;
      end;
    ')':
      begin
        Inc(P);
        FToken := etRParen;
      end;
    '<':
      begin
        Inc(P);
        case P^ of
          '=':
            begin
              Inc(P);
              FToken := etLE;
            end;
          '>':
            begin
              Inc(P);
              FToken := etNE;
            end;
        else
          FToken := etLT;
        end;
      end;
    '=':
      begin
        Inc(P);
        FToken := etEQ;
      end;
    '>':
      begin
        Inc(P);
        if P^ = '=' then
        begin
          Inc(P);
          FToken := etGE;
        end else
          FToken := etGT;
      end;
    '+':
      begin
        Inc(P);
        FToken := etADD;
      end;
    '*':
      begin
        Inc(P);
        FToken := etMUL;
      end;
    '/':
      begin
        Inc(P);
        FToken := etDIV;
      end;
    ',':
      begin
        Inc(P);
        FToken := etComma;
      end;
    #0:
      FToken := etEnd;
  else
    DatabaseErrorFmt(SExprInvalidChar, [P^]);
  end;
  FSourcePtr := P;
end;

function TExprParser.ParseExpr: PExprNode;
begin
  Result := ParseExpr2;
  while TokenSymbolIs('OR') do
  begin
    NextToken;
    Result := FFilter.NewNode(enOperator, canOR, Unassigned,
      Result, ParseExpr2);
    GetScopeKind(Result, Result^.FLeft, Result^.FRight);
  end;
end;

function TExprParser.ParseExpr2: PExprNode;
begin
  Result := ParseExpr3;
  while TokenSymbolIs('AND') do
  begin
    NextToken;
    Result := FFilter.NewNode(enOperator, canAND, Unassigned,
      Result, ParseExpr3);
    GetScopeKind(Result, Result^.FLeft, Result^.FRight);
  end;
end;

function TExprParser.ParseExpr3: PExprNode;
begin
  if TokenSymbolIs('NOT') then
  begin
    NextToken;
    Result := FFilter.NewNode(enOperator, canNOT, Unassigned,
      ParseExpr4, nil);
  end else
    Result := ParseExpr4;
  GetScopeKind(Result, Result^.FLeft, Result^.FRight);
end;


function TExprParser.ParseExpr4: PExprNode;
const
  Operators: array[etEQ..etLT] of CanOp = (
    canEQ, canNE, canGE, canLE, canGT, canLT);
var
  Operator: CanOp;
  Left, Right: PExprNode;
begin
  Result := ParseExpr5;
  if (FToken in [etEQ..etLT]) or (FToken = etLIKE)
     or (FToken = etISNULL) or (FToken = etISNOTNULL)
     or (FToken = etIN) then
  begin
    case FToken of
      etEQ..etLT:
        Operator := Operators[FToken];
      etLIKE:
        Operator := canLIKE;
      etISNULL:
        Operator := canISBLANK;
      etISNOTNULL:
        Operator := canNOTBLANK;
      etIN:
        Operator := canIN;
      else
        Operator := canNOTDEFINED;
    end;
    NextToken;
    Left := Result;
    if Operator = canIN then
    begin
      if FToken <> etLParen then 
        DatabaseErrorFmt(SExprNoLParen, [TokenName]); 
      NextToken;
      Result := FFilter.NewNode(enOperator, canIN, Unassigned,
                 Left, nil);
      if FToken <> etRParen then
      begin
        Result.FArgs := TList.Create;
        repeat
          Right := ParseExpr;
          if IsTemporal(Left.FDataType) then
            Right.FDataType := Left.FDataType;
          Result.FArgs.Add(Right);
          if (FToken <> etComma) and (FToken <> etRParen) then
            DatabaseErrorFmt(SExprNoRParenOrComma, [TokenName]);
          if FToken = etComma then NextToken;
        until (FToken = etRParen) or (FToken = etEnd);
        if FToken <> etRParen then
          DatabaseErrorFmt(SExprNoRParen, [TokenName]);
        NextToken;
      end else
        DatabaseError(SExprEmptyInList);
    end else
    begin
      if (Operator <> canISBLANK) and (Operator <> canNOTBLANK) then
        Right := ParseExpr5
      else
        Right := nil;
      Result := FFilter.NewNode(enOperator, Operator, Unassigned,
        Left, Right);
      if Right <> nil then
      begin
        if (Left^.FKind = enField) and (Right^.FKind = enConst) then
          begin
            Right^.FDataType := Left^.FDataType;
            Right^.FDataSize := Left^.FDataSize;
          end
        else if (Right^.FKind = enField) and (Left^.FKind = enConst) then
          begin
            Left^.FDataType := Right^.FDataType;
            Left^.FDataSize := Right^.FDataSize;
          end;
      end;
      if (Left^.FDataType = fldBLOB) and (Operator = canLIKE) then
      begin
        if Right^.FKind = enConst then Right^.FDataType := fldZSTRING;
      end 
      else if (Operator <> canISBLANK) and (Operator <> canNOTBLANK)
         and ((Left^.FDataType in [ fldBLOB, fldBYTES]) or 
         ((Right <> nil) and (Right^.FDataType in [ fldBLOB, fldBYTES]))) then
        DatabaseError(SExprTypeMis);
      Result.FDataType := fldBOOL;
      if Right <> nil then
      begin
        if IsTemporal(Left.FDataType) and (Right.FDataType = fldZSTRING) then
          Right.FDataType := Left.FDataType
        else if IsTemporal(Right.FDataType) and (Left.FDataType = fldZSTRING) then
          Left.FDataType := Right.FDataType;
      end;
      GetScopeKind(Result, Left, Right);
    end;
  end;
end;

function TExprParser.ParseExpr5: PExprNode;
const
  Operators: array[etADD..etDIV] of CanOp = (
    canADD, canSUB, canMUL, canDIV);
var
  Operator: CanOp;
  Left, Right: PExprNode;
begin
  Result := ParseExpr6;
  while FToken in [etADD, etSUB] do
  begin
    if not (poExtSyntax in FParserOptions) then
      DatabaseError(SExprNoArith);
    Operator := Operators[FToken];
    Left := Result;
    NextToken;
    Right := ParseExpr6;
    Result := FFilter.NewNode(enOperator, Operator, Unassigned, Left, Right);
    TypeCheckArithOp(Result);
    GetScopeKind(Result, Left, Right);
  end;
end;

function TExprParser.ParseExpr6: PExprNode;
const
  Operators: array[etADD..etDIV] of CanOp = (
    canADD, canSUB, canMUL, canDIV);
var
  Operator: CanOp;
  Left, Right: PExprNode;
begin
  Result := ParseExpr7;
  while FToken in [etMUL, etDIV] do
  begin
    if not (poExtSyntax in FParserOptions) then
      DatabaseError(SExprNoArith);
    Operator := Operators[FToken];
    Left := Result;
    NextToken;
    Right := ParseExpr7;
    Result := FFilter.NewNode(enOperator, Operator, Unassigned, Left, Right);
    TypeCheckArithOp(Result);
    GetScopeKind(Result, Left, Right);
  end;
end;


function TExprParser.ParseExpr7: PExprNode;
var
  FuncName: string;
begin
  case FToken of
    etSymbol:
      if (poExtSyntax in FParserOptions)
         and  NextTokenIsLParen and TokenSymbolIsFunc(FTokenString) then
        begin
          Funcname := FTokenString;
          NextToken;
          if FToken <> etLParen then 
            DatabaseErrorFmt(SExprNoLParen, [TokenName]); 
          NextToken;
          if (CompareText(FuncName,'count') = 0) and (FToken = etMUL) then 
          begin
            FuncName := 'COUNT(*)';
            NextToken;
          end;
          Result := FFilter.NewNode(enFunc, canNOTDEFINED, FuncName,
                    nil, nil);
          if FToken <> etRParen then
          begin
            Result.FArgs := TList.Create;
            repeat
              Result.FArgs.Add(ParseExpr);
              if (FToken <> etComma) and (FToken <> etRParen) then
                DatabaseErrorFmt(SExprNoRParenOrComma, [TokenName]); 
              if FToken = etComma then NextToken;
            until (FToken = etRParen) or (FToken = etEnd);
          end else 
            Result.FArgs := nil;

          GetFuncResultInfo(Result);
        end
      else if TokenSymbolIs('NULL') then
        begin
          Result := FFilter.NewNode(enConst, canNOTDEFINED, System.Null, nil, nil);
          Result.FScopeKind := skConst;
        end
      else if TokenSymbolIs(FStrTrue) then
        begin
          Result := FFilter.NewNode(enConst, canNOTDEFINED, 1, nil, nil);
          Result.FScopeKind := skConst;
        end
      else if TokenSymbolIs(FStrFalse) then
        begin
          Result := FFilter.NewNode(enConst, canNOTDEFINED, 0, nil, nil);
          Result.FScopeKind := skConst;
        end
      else
        begin
          Result := FFilter.NewNode(enField, canNOTDEFINED, FTokenString, nil, nil);
          Result.FScopeKind := skField;
        end;
    etName:
      begin
        Result := FFilter.NewNode(enField, canNOTDEFINED, FTokenString, nil, nil);
        Result.FScopeKind := skField;
      end;
    etLiteral:
      begin
        Result := FFilter.NewNode(enConst, canNOTDEFINED, FTokenString, nil, nil);
        if FNumericLit then Result^.FDataType := fldFLOAT else 
           Result^.FDataType := fldZSTRING;
        Result.FScopeKind := skConst;
      end;
    etLParen:
      begin
        NextToken;
        Result := ParseExpr;
        if FToken <> etRParen then DatabaseErrorFmt(SExprNoRParen, [TokenName]);
      end;
  else
    DatabaseErrorFmt(SExprExpected, [TokenName]);
    Result := nil;
  end;
  NextToken;
end;

procedure  TExprParser.GetScopeKind(Root, Left, Right : PExprNode);
begin
  if (Left = nil) and (Right = nil) then Exit;
  if Right = nil then
  begin
    Root.FScopeKind := Left.FScopeKind;
    Exit;
  end;
  if ((Left^.FScopeKind = skField) and (Right^.FScopeKind = skAgg))
     or ((Left^.FScopeKind = skAgg) and (Right^.FScopeKind = skField)) then
    DatabaseError(SExprBadScope);
  if (Left^.FScopeKind = skConst) and (Right^.FScopeKind = skConst) then
    Root^.FScopeKind := skConst
  else if (Left^.FScopeKind = skAgg) or (Right^.FScopeKind = skAgg) then
    Root^.FScopeKind := skAgg
  else if (Left^.FScopeKind = skField) or (Right^.FScopeKind = skField) then
    Root^.FScopeKind := skField;
end;

procedure TExprParser.GetFuncResultInfo(Node : PExprNode);
begin
  Node^.FDataType := fldZSTRING;
  if (CompareText(Node^.FData, 'COUNT(*)') <> 0 )
     and (CompareText(Node^.FData,'GETDATE') <> 0 )
     and ( (Node^.FArgs = nil ) or ( Node^.FArgs.Count = 0) ) then
      DatabaseError(SExprTypeMis);

  if (Node^.FArgs <> nil) and (Node^.FArgs.Count > 0) then
     Node^.FScopeKind := PExprNode(Node^.FArgs.Items[0])^.FScopeKind;
  if (CompareText(Node^.FData , 'SUM') = 0) or
     (CompareText(Node^.FData , 'AVG') = 0) then
  begin
    Node^.FDataType := fldFLOAT;
    Node^.FScopeKind := skAgg;
  end
  else if (CompareText(Node^.FData , 'MIN') = 0) or
          (CompareText(Node^.FData , 'MAX') = 0) then
  begin
    Node^.FDataType := PExprNode(Node^.FArgs.Items[0])^.FDataType;
    Node^.FScopeKind := skAgg;
  end
  else if  (CompareText(Node^.FData , 'COUNT') = 0) or
           (CompareText(Node^.FData , 'COUNT(*)') = 0) then
  begin
    Node^.FDataType := fldINT32;
    Node^.FScopeKind := skAgg;
  end
  else if (CompareText(Node^.FData , 'YEAR') = 0) or
          (CompareText(Node^.FData , 'MONTH') = 0) or
          (CompareText(Node^.FData , 'DAY') = 0) or
          (CompareText(Node^.FData , 'HOUR') = 0) or
          (CompareText(Node^.FData , 'MINUTE') = 0) or
          (CompareText(Node^.FData , 'SECOND') = 0 ) then
  begin
    Node^.FDataType := fldINT32;
    Node^.FScopeKind := PExprNode(Node^.FArgs.Items[0])^.FScopeKind;
  end
  else if CompareText(Node^.FData , 'GETDATE') = 0  then
  begin
    Node^.FDataType := fldTIMESTAMP;
    Node^.FScopeKind := skConst;
  end
  else if CompareText(Node^.FData , 'DATE') = 0  then
  begin
    Node^.FDataType := fldDATE;
    Node^.FScopeKind := PExprNode(Node^.FArgs.Items[0])^.FScopeKind;
  end
  else if CompareText(Node^.FData , 'TIME') = 0  then
  begin
    Node^.FDataType := fldTIME;
    Node^.FScopeKind := PExprNode(Node^.FArgs.Items[0])^.FScopeKind;
  end;
end;

function TExprParser.TokenName: string;
begin
  if FSourcePtr = FTokenPtr then Result := SExprNothing else
  begin
    SetString(Result, FTokenPtr, FSourcePtr - FTokenPtr);
    Result := '''' + Result + '''';
  end;
end;

function TExprParser.TokenSymbolIs(const S: string): Boolean;
begin
  Result := (FToken = etSymbol) and (CompareText(FTokenString, S) = 0);
end;


function TExprParser.TokenSymbolIsFunc(const S: string) : Boolean;
begin
  Result := (CompareText(S, 'UPPER') = 0) or
            (CompareText(S, 'LOWER') = 0) or
            (CompareText(S, 'SUBSTRING') = 0) or
            (CompareText(S, 'TRIM') = 0) or
            (CompareText(S, 'TRIMLEFT') = 0) or
            (CompareText(S, 'TRIMRIGHT') = 0) or
            (CompareText(S, 'YEAR') = 0) or
            (CompareText(S, 'MONTH') = 0) or
            (CompareText(S, 'DAY') = 0) or
            (CompareText(S, 'HOUR') = 0) or
            (CompareText(S, 'MINUTE') = 0) or
            (CompareText(S, 'SECOND') = 0) or
            (CompareText(S, 'GETDATE') = 0) or
            (CompareText(S, 'DATE') = 0) or
            (CompareText(S, 'TIME') = 0) or
            (CompareText(S, 'SUM') = 0) or
            (CompareText(S, 'MIN') = 0) or
            (CompareText(S, 'MAX') = 0) or
            (CompareText(S, 'AVG') = 0) or
            (CompareText(S, 'COUNT') = 0);

end;

procedure  TExprParser.TypeCheckArithOp(Node: PExprNode);
begin
  with Node^ do
  begin
    if IsNumeric(FLeft.FDataType) and IsNumeric(FRight.FDataType)  then
      FDataType := fldFLOAT
    else if (FLeft.FDataType = fldZSTRING) and
       (FRight.FDataType = fldZSTRING) and (FOperator = canADD) then
      FDataType := fldZSTRING
    else if IsTemporal(FLeft.FDataType) and IsNumeric(FRight.FDataType) and
       (FOperator = canADD) then
      FDataType := fldTIMESTAMP
    else if IsTemporal(FLeft.FDataType) and IsNumeric(FRight.FDataType) and
       (FOperator = canSUB) then
      FDataType := FLeft.FDataType
    else if IsTemporal(FLeft.FDataType) and IsTemporal(FRight.FDataType) and
       (FOperator = canSUB) then
      FDataType := fldFLOAT
    else if (FLeft.FDataType = fldZSTRING) and IsTemporal(FRight.FDataType) and
       (FOperator = canSUB) then
    begin
      FLeft.FDataType := FRight.FDataType;
      FDataType := fldFLOAT;
    end
    else if ( FLeft.FDataType = fldZSTRING) and  IsNumeric(FRight.FDataType )and
         (FLeft.FKind = enConst)  then
      FLeft.FDataType := fldTIMESTAMP
    else
      DatabaseError(SExprTypeMis);
  end;
end;

{ TMasterDataLink }

constructor TMasterDataLink.Create(DataSet: TDataSet);
begin
  inherited Create;
  FDataSet := DataSet;
  FFields := TList.Create;
end;

destructor TMasterDataLink.Destroy;
begin
  FFields.Free;
  inherited Destroy;
end;

procedure TMasterDataLink.ActiveChanged;
begin
  FFields.Clear;
  if Active then
    try
      DataSet.GetFieldList(FFields, FFieldNames);
    except
      FFields.Clear;
      raise;
    end;
  if FDataSet.Active and not (csDestroying in FDataSet.ComponentState) then
    if Active and (FFields.Count > 0) then
    begin
      if Assigned(FOnMasterChange) then FOnMasterChange(Self);
    end else
      if Assigned(FOnMasterDisable) then FOnMasterDisable(Self);
end;

procedure TMasterDataLink.CheckBrowseMode;
begin
  if FDataSet.Active then FDataSet.CheckBrowseMode;
end;

function TMasterDataLink.GetDetailDataSet: TDataSet;
begin
  Result := FDataSet;
end;

procedure TMasterDataLink.LayoutChanged;
begin
  ActiveChanged;
end;

procedure TMasterDataLink.RecordChanged(Field: TField);
begin
  if (DataSource.State <> dsSetKey) and FDataSet.Active and
    (FFields.Count > 0) and ((Field = nil) or
    (FFields.IndexOf(Field) >= 0)) and
     Assigned(FOnMasterChange) then
    FOnMasterChange(Self);
end;

procedure TMasterDataLink.SetFieldNames(const Value: string);
begin
  if FFieldNames <> Value then
  begin
    FFieldNames := Value;
    ActiveChanged;
  end;
end;


end.
