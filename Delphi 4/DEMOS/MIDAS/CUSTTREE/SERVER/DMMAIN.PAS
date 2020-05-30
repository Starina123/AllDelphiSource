unit DMMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComServ, ComObj, VCLCom, StdVcl, BdeProv, BdeMts, DataBkr, DBClient,
  MtsRdm, Mtx, MtsCustomerTreeProject_TLB, Db, DBTables, Provider, DMCustomerTreeU;

type
  TMtsCustomerTree = class(TMtsDataModule, IMtsCustomerTree)
    procedure CustomerTreeDeactivate(Sender: TObject);
    procedure CustomerTreeActivate(Sender: TObject);
  private
    { Private declarations }
    Group: ISharedPropertyGroup;
    FDMCustomerTree: TDMCustomerTree;
    procedure CreateSharedProperties;
    function GetEditCustomerRole: WideString;
    function GetEmpNo: Integer;
    function GetDMCustomerTree: TDMCustomerTree;
  public
    { Public declarations }
    property DMCustomerTree: TDMCustomerTree read GetDMCustomerTree;
  protected
    function GetCustomersList: OleVariant; safecall;
    function GetCustomerTree(CustNo: Integer; MetaData: WordBool): OleVariant;
      safecall;
    procedure SetEmpNo(EmpNo: Integer); safecall;
    procedure SetMTSOptions(const RoleCanEdit: WideString); safecall;
    function ApplyCustomerTree(Delta: OleVariant;
      out ErrorCount: Integer): OleVariant; safecall;
    function GetPartsList: OleVariant; safecall;
  end;

implementation

{$R *.DFM}

uses ActiveX;

const
  { Shared property names }
  SEditCustomerRole = 'EditCustomerRole';
  SEmpNo = 'EmpNo';

function TMtsCustomerTree.GetCustomersList: OleVariant;
begin
  Result := DMCustomerTree.GetCustomersList;
  SetComplete;
end;

function TMtsCustomerTree.GetCustomerTree(CustNo: Integer;
  MetaData: WordBool): OleVariant;
begin
 // DMCustomerTree.CanEditCustomer := IsCallerInRole(GetEditCustomerRole);
  Result := DMCustomerTree.GetCustomerOrdersTree(CustNo, MetaData);
  SetComplete;
end;

procedure TMtsCustomerTree.SetMTSOptions(const RoleCanEdit: WideString);
begin
  if Assigned(Group) then
    Group.PropertyByName[sEditCustomerRole].Value := RoleCanEdit;
  SetComplete;
end;

procedure TMtsCustomerTree.CreateSharedProperties;
const
  SQualifier = 'CustomerTree';
var
  W: PWideChar;
  Activity: IObjectContextActivity;
  Guid: TGuid;
  Exists: WordBool;
begin
  if Assigned(ObjectContext) then
  begin
    ObjectContext.QueryInterface(IObjectContextActivity, Activity);
    if Assigned(Activity) then
    begin
      Guid := Activity.GetActivityId;
      StringFromCLSID(Guid, W);
    end
    else
      W := '';
    Group := CreateSharedPropertyGroup(SQualifier + '.' + W);
    CoTaskMemFree(W);
    Group.CreateProperty(sEditCustomerRole, Exists);
    if not Exists then
      Group.PropertyByName[sEditCustomerRole].Value := '';
    Group.CreateProperty(sEmpNo, Exists);
    if not Exists then
      Group.PropertyByName[sEmpNo].Value := 0;
  end;
end;

function TMtsCustomerTree.GetEditCustomerRole: WideString;
begin
  if Assigned(Group) then
    Result := Group.PropertyByName[sEditCustomerRole].Value
  else
    Result := '';
end;

function TMtsCustomerTree.GetEmpNo: Integer;
begin
  if Assigned(Group) then
    Result := Group.PropertyByName[SEmpNo].Value
  else
    Result := 1;
end;

procedure TMtsCustomerTree.SetEmpNo(EmpNo: Integer);
begin
  try
    DMCustomerTree.ValidateEmpNo(EmpNo);
    if Assigned(Group) then
      Group.PropertyByName[SEmpNo].Value := EmpNo;
  finally
    SetComplete;
  end;
end;

function TMtsCustomerTree.ApplyCustomerTree(Delta: OleVariant;
  out ErrorCount: Integer): OleVariant;
begin
  Result := DMCustomerTree.ApplyCustomerTree(Delta, ErrorCount);
end;

procedure TMtsCustomerTree.CustomerTreeDeactivate(Sender: TObject);
begin
  Group := nil;
  if Assigned(FDMCustomerTree) then
    FDMCustomerTree.Database1.Connected := False;
end;

function TMtsCustomerTree.GetPartsList: OleVariant;
begin
  Result := DMCustomerTree.GetPartsList;
end;

function TMtsCustomerTree.GetDMCustomerTree: TDMCustomerTree;
begin
  if not Assigned(FDMCustomerTree) then
  begin
    FDMCustomerTree := TDMCustomerTree.Create(nil);
    FDMCustomerTree.Database1.Connected := True;
  end;
  Result := FDMCustomerTree;
end;

procedure TMtsCustomerTree.CustomerTreeActivate(Sender: TObject);
begin
  CreateSharedProperties;
end;

initialization
  TComponentFactory.Create(ComServer, TMtsCustomerTree,
    Class_MtsCustomerTree, ciMultiInstance, tmApartment);
end.
