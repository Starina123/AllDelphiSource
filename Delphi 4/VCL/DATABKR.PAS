
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{       Remote Data Module support                      }
{                                                       }
{       Copyright (c) 1997,98 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit DataBkr;

interface

uses Classes, ActiveX, StdVcl, Forms;

type
  { TRemoteDataModule }

  TRemoteDataModule = class(TDataModule, IDataBroker)
  end;

{ IDataBroker support }

procedure EnumIProviderProps(TypeInfo: ITypeInfo; PropNames: TStrings);
function VarArrayFromStrings(Strings: TStrings): Variant;

implementation

uses ComObj;

{ IDataBroker support }

function VarArrayFromStrings(Strings: TStrings): Variant;
var
  I: Integer;
begin
  Result := Null;
  if Strings.Count > 0 then
  begin
    Result := VarArrayCreate([0, Strings.Count - 1], varOleStr);
    for I := 0 to Strings.Count - 1 do Result[I] := WideString(Strings[I]);
  end;
end;

procedure EnumIProviderProps(TypeInfo: ITypeInfo; PropNames: TStrings);

  procedure SaveName(const TypeInfo: ITypeInfo; Id: Integer);
  var
    Name: WideString;
  begin
    OleCheck(TypeInfo.GetDocumentation(Id, @Name, nil, nil, nil));
    PropNames.Add(Name);
  end;

  function IsProviderProp(const TypeInfo: ITypeInfo; TypeDesc: PTypeDesc): Boolean;
  var
    RefInfo: ITypeInfo;
    RefAttr: PTypeAttr;
  begin
    Result := False;
    if TypeDesc.vt = VT_PTR then
    begin
      TypeDesc := TypeDesc.ptdesc;
      if TypeDesc.vt <> VT_USERDEFINED then Exit;
      OleCheck(TypeInfo.GetRefTypeInfo(TypeDesc.hreftype, RefInfo));
      OleCheck(RefInfo.GetTypeAttr(RefAttr));
      try
        Result := IsEqualGUID(RefAttr.guid, IProvider);
      finally
        RefInfo.ReleaseTypeAttr(RefAttr);
      end;
    end;
  end;

var
  I: Integer;
  TypeAttr: PTypeAttr;
  FuncDesc: PFuncDesc;
  VarDesc: PVarDesc;
  TI: ITypeInfo;
  RefType: HRefType;
begin
  OleCheck(TypeInfo.GetTypeAttr(TypeAttr));
  try
    if (TypeAttr.typekind = TKIND_DISPATCH)
      and (TypeAttr.wTypeFlags and TYPEFLAG_FDUAL <> 0) then
    begin
      OleCheck(TypeInfo.GetRefTypeOfImplType(-1, RefType));
      OleCheck(TypeInfo.GetRefTypeInfo(RefType, TI));
    end
    else
      TI := TypeInfo;
  finally
    TypeInfo.ReleaseTypeAttr(TypeAttr);
  end;

  OleCheck(TI.GetTypeAttr(TypeAttr));
  try
    for I := 0 to TypeAttr.cVars - 1 do
    begin
      OleCheck(TypeInfo.GetVarDesc(I, VarDesc));
      try
        if IsProviderProp(TI, @VarDesc.elemdescVar.tdesc) then
          SaveName(TI, VarDesc.memid);
      finally
        TI.ReleaseVarDesc(VarDesc);
      end;
    end;
    for I := 0 to TypeAttr.cFuncs - 1 do
    begin
      OleCheck(TI.GetFuncDesc(I, FuncDesc));
      try
        if (FuncDesc.invkind = INVOKE_PROPERTYGET) then
        begin
          if TypeAttr.TypeKind = TKIND_INTERFACE then
          begin
            if (FuncDesc.cParams > 0) and
              (FuncDesc.lprgelemdescParam[0].tdesc.vt = VT_PTR) and
              (IsProviderProp(TI, FuncDesc.lprgelemdescParam[0].tdesc.ptdesc)) then
              SaveName(TI, FuncDesc.memid);
          end
          else if IsProviderProp(TI, @FuncDesc.elemdescFunc.tdesc) then
            SaveName(TI, FuncDesc.memid);
        end;
      finally
        TI.ReleaseFuncDesc(FuncDesc);
      end;
    end;
  finally
    TI.ReleaseTypeAttr(TypeAttr);
  end;
end;

function GetProviderNamesFromObject(Component: TComponent): Variant;
var
  VCLComObject: IVCLComObject;
  TypeInfo: ITypeInfo;
  Count: Integer;
  ProviderNames: TStrings;
begin
  Result := Null;
  VCLComObject := Component.ComObject as IVCLComObject;
  OleCheck(VCLComObject.GetTypeInfoCount(Count));
  if Count > 0 then
  begin
    ProviderNames := TStringList.Create;
    try
      OleCheck(VCLComObject.GetTypeInfo(0, 0, TypeInfo));
      EnumIProviderProps(TypeInfo, ProviderNames);
      Result := VarArrayFromStrings(ProviderNames);
    finally
      ProviderNames.Free;
    end;
  end;
end;

procedure RegisterAsDataBroker(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
    CreateRegKey('CLSID\' + ClassID + '\Borland DataBroker', '', '') else
    DeleteRegKey('CLSID\' + ClassID + '\Borland DataBroker');
end;

initialization
  Forms.GetDataModuleProviderNames := GetProviderNamesFromObject;
  Forms.UpdateDataModuleRegistry := RegisterAsDataBroker;

end.
