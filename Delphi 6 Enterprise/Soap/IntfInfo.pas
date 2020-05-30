{*******************************************************}
{                                                       }
{ Borland Delphi Visual Component Library               }
{       Interface RTTI Support                          }
{                                                       }
{ Copyright (c) 2001 Borland Software Corporation       }
{                                                       }
{*******************************************************}

Unit IntfInfo;

interface

uses TypInfo, SysUtils;

type

  PIntfParamEntry = ^TIntfParamEntry;
  TIntfParamEntry = record
    Flags: TParamFlags;
    Name: string;
    Info: PTypeInfo;
  end;

  TIntfParamEntryArray = array of TIntfParamEntry;

  TCallConv = (ccReg, ccCdecl, ccPascal, ccStdCall, ccSafeCall);

  PIntfMethEntry = ^TIntfMethEntry;
  TIntfMethEntry = record
    Name: string;
    CC: TCallConv;
    Pos: Integer;
    ParamCount: Integer;
    ResultInfo: PTypeInfo;
    SelfInfo: PTypeInfo;
    Params: TIntfParamEntryArray;
    HasRTTI: Boolean;
  end;
  TIntfMethEntryArray = array of TIntfMethEntry;


  TPIntfMethEntryArray = array of PIntfMethEntry;

  PIntfMetaData = ^TIntfMetaData;
  TIntfMetaData = record
    Name: string;
    UnitName: string;
    MDA: TIntfMethEntryArray;
    IID: TGUID;
    Info: PTypeInfo;
    AncInfo: PTypeInfo;
    NumAnc: Integer;
  end;

  EInterfaceRTTIException = class(Exception);

procedure GetIntfMetaData(Info: PTypeInfo; var IntfMD: TIntfMetaData; IncludeAncMethods: Boolean = False);
function GetMethNum(const IntfMD: TIntfMetaData; const MethName: string): Integer;
procedure GetDynArrayElTypeInfo(typeInfo: PTypeInfo; var EltInfo: PTypeInfo; var Dims: Integer);
function GetDynArrayNextInfo(typeInfo: PTypeInfo): PTypeInfo;
const
  CallingConventionName:  array[ccReg..ccSafeCall] of string =
     ('REGISTER', 'CDECL', 'PASCAL', 'STDCALL', 'SAFECALL');     { do not localize }

function GetDynArrayNextInfo2(typeInfo: PTypeInfo; var Name: string): PTypeInfo;

resourcestring
  SNoRTTI = 'Interface %s has no RTTI';   
  SNoRTTIParam = 'Parameter %s on Method %s of Interface %s has no RTTI';

implementation

const
  CCMap:  array[0..4] of TCallConv = (ccReg, ccCdecl, ccPascal, ccStdCall, ccSafeCall);



function GetMethNum(const IntfMD: TIntfMetaData; const MethName: string): Integer;
var
  I, NumNames: Integer;
begin
  NumNames := 0;
  Result := -1;
  for I := 0 to Length(IntfMD.MDA) - 1 do
  begin
    if CompareText(IntfMD.MDA[I].Name, MethName) = 0  then
    begin
      Result := I;
      Inc(NumNames);
    end;
  end;
  if NumNames > 1 then
    Result := -1; 
end;



function ReadString(var P: Pointer): String;
var
  B: Byte;
begin
  B := Byte(P^);
  SetLength(Result, B);
  P := Pointer( Integer(P) + 1);
  Move(P^, Result[1], Integer(B));
  P := Pointer( Integer(P) + B );
end;

function ReadByte(var P: Pointer): Byte;
begin
  Result := Byte(P^);
  P := Pointer( Integer(P) + 1);
end;

function ReadWord(var P: Pointer): Word;
begin
  Result := Word(P^);
  P := Pointer( Integer(P) + 2);
end;

function ReadLong(var P: Pointer): Integer;
begin
  Result := Integer(P^);
  P := Pointer( Integer(P) + 4);
end;

procedure FillMethodArray(P: Pointer; IntfMD: PIntfMetaData; Offset, Methods: Integer);
var
  S: string;
  I, J, K, L: Integer;
  ParamCount: Integer;
  Kind, Flags: Byte;
  ParamInfo: PTypeInfo;
  ParamName: string;
begin
  for I := 0 to Methods -1 do
  begin
    IntfMD.MDA[Offset].Name := ReadString(P);
    Kind := ReadByte(P);           // kind
    IntfMd.MDA[Offset].CC := CCMap[ReadByte(P)];
    ParamCount := ReadByte(P);     // param count including self
    IntfMd.MDA[Offset].ParamCount := ParamCount - 1;
    IntfMd.MDA[Offset].Pos := I;
    IntfMd.MDA[Offset].HasRTTI := True;

    SetLength(IntfMD.MDA[Offset].Params, ParamCount);
    K := 0;
    for J := 0 to ParamCount - 1 do
    begin
      Flags := ReadByte(P); // flags
      ParamName := ReadString(P); // param name
      S := ReadString(P); // param type name
      L := ReadLong(P);
      if L <> 0 then
        ParamInfo := PPTypeInfo(L)^
      else
        raise EInterfaceRTTIException.CreateFmt(SNoRTTIParam, [ParamName, IntfMD.MDA[Offset].Name, IntfMD.UnitName + '.' + IntfMd.Name]);
      if J = 0 then
        IntfMd.MDA[Offset].SelfInfo := ParamInfo
      else
      begin
        IntfMd.MDA[Offset].Params[K].Flags := TParamFlags(Flags);
        IntfMd.MDA[Offset].Params[K].Name := ParamName;
        IntfMd.MDA[Offset].Params[K].Info := ParamInfo;
        Inc(K);
      end;
    end;
    if Kind = Byte(mkFunction) then
    begin
      S := ReadString(P);  
      IntfMd.MDA[Offset].ResultInfo := PPTypeInfo(ReadLong(P))^;
    end;
    Inc(Offset);
  end;
end;

function WalkAncestors(PP: PPTypeInfo; AddMeths: Boolean; IntfMD: PIntfMetaData; Offset, Methods: Integer): Integer;
var
  S: string;
  AncTP: Pointer;
  P: Pointer;
  B: Byte;
  NumMethods, NumAncMeths: Integer;
  HasRTTI: Integer;
begin
  P := Pointer(PP^);
  Result := 0;
  ReadByte(P);    // Kind
  S := ReadString(P);
  AncTP := Pointer(ReadLong(P));
  if AncTP <> nil then
  begin
    NumAncMeths  := WalkAncestors(AncTP, False, nil, 0, 0);
    Result := Result +  NumAncMeths;
  end else
    NumAncMeths := 0;
  P := Pointer(Integer(P) + 17); //  intf.flags and guid
  B := Byte(P^);            // str len
  P := Pointer(Integer(P) + B + 1);  // skip unit name  and count
  NumMethods :=  ReadWord(P);    // # methods
  Result := Result + NumMethods;
  if AddMeths then
  begin
    HasRTTI := ReadWord(P);     // $FFFF if no RTTI, # methods again if has RTTI
    if HasRTTI <> $FFFF then
    begin
       FillMethodArray(P, IntfMD, Offset + NumAncMeths, NumMethods);
       Dec(Offset, NumMethods);
       if Offset > 0 then
         WalkAncestors(AncTP, True, IntfMD, Offset, NumMethods);
    end;
  end;
end;

function GetNumAncMeths(P: Pointer): Integer;
var
  B: Byte;
  Anc: Pointer;
begin
  Result := 0;
  ReadByte(P);            // kind
  B := Byte(P^);            // str len
  P := Pointer(Integer(P) + B + 1);        // skip sym name  and count
  Anc := Pointer(ReadLong(P));
  if Anc <> nil then
    Result := WalkAncestors(Anc, False, nil, 0, 0);
end;




procedure GetIntfMetaData(Info: PTypeInfo; var IntfMD: TIntfMetaData; IncludeAncMethods: Boolean = False);
var
  I, Offset: Integer;
  Methods: Integer;
  HasRTTI: Integer;
  PP: PPTypeInfo;
  P: Pointer;
  SelfMethCount: Integer;
begin
  P := Pointer(Info);
  IntfMD.NumAnc := GetNumAncMeths(P);
  IntfMD.Info := Info;
  ReadByte(P);            // kind
  IntfMD.Name := ReadString(P);
  PP := PPTypeInfo(ReadLong(P));
  if PP <> nil then
    IntfMD.AncInfo := PP^; // ancestor typeinfo
  ReadByte(P);  // interface flags
  IntfMD.IID.D1 := ReadLong(P);
  IntfMD.IID.D2 := ReadWord(P);
  IntfMD.IID.D3 := ReadWord(P);
  for I := 0 to 7 do
    IntfMD.IID.D4[I] := ReadByte(P);
  IntfMD.UnitName := ReadString(P);
  Methods := ReadWord(P);   // # methods
  HasRTTI := ReadWord(P);     // $FFFF if no RTTI, # methods again if has RTTI
  if HasRTTI = $FFFF then
    raise EInterfaceRTTIException.CreateFmt(SNoRTTI, [IntfMD.UnitName + '.' + IntfMd.Name]);

  SelfMethCount := Methods;
  if IncludeAncMethods then
  begin
    Methods := Methods + IntfMD.NumAnc;
    Offset := IntfMD.NumAnc;
  end else
  begin
    Offset := 0;
  end;
  SetLength(IntfMD.MDA, Methods);

  FillMethodArray(P, @IntfMD, Offset, SelfMethCount);

  if IncludeAncMethods then
  begin
    if PP <> nil then
      WalkAncestors(PP, True, @IntfMD, Offset - IntfMD.NumAnc, IntfMD.NumAnc);
    IntfMD.NumAnc := 0;
    for I := 0 to Length(IntfMD.MDA) - 1 do
    begin
      if not IntfMD.MDA[I].HasRTTI then
        Inc(IntfMD.NumAnc)
      else
        break;
    end;
  end;
end;

procedure GetDynArrayElTypeInfo(typeInfo: PTypeInfo; var EltInfo: PTypeInfo; var Dims: Integer);
var
  L: Integer;
  S: string;
  P: Pointer;
  Info: PTypeInfo;
begin
  Dims := 0;
  P := Pointer(typeInfo);
  ReadByte(P);  // kind
  S := ReadString(P);     // symname
  ReadLong(P);    // elsize
  L := ReadLong(P);
  if (L <> 0) then
  begin
    Info := PPTypeInfo(L)^;
    if Info.Kind = tkDynArray then
    begin
      GetDynArrayElTypeInfo(Info, EltInfo, Dims);
    end;
  end;
  ReadLong(P);     // vartype
  L := ReadLong(P); // elttype, even if not destructable, 0 if type has no RTTI
  if L <> 0 then
    EltInfo := PPTypeInfo(L)^;
  Inc(Dims);
end;

function GetDynArrayNextInfo(typeInfo: PTypeInfo): PTypeInfo;
var
  S: string;
  P: Pointer;
  L: Integer;
begin
  Result := nil;
  P := Pointer(typeInfo);
  ReadByte(P);  // kind
  S := ReadString(P);     // symname
  ReadLong(P);    // elsize
  L := ReadLong(P);
  if L <> 0 then
    Result := PPTypeInfo(L)^;     // eltype or 0 if not destructable
end;

function GetDynArrayNextInfo2(typeInfo: PTypeInfo; var Name: string): PTypeInfo;
var
  P: Pointer;
  L: Integer;
begin
  Result := nil;
  P := Pointer(typeInfo);
  ReadByte(P);  // kind
  Name := ReadString(P);     // symname
  ReadLong(P);    // elsize
  L := ReadLong(P);
  if L <> 0 then
    Result := PPTypeInfo(L)^;     // eltype or 0 if not destructable
end;


end.
