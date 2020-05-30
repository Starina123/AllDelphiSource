unit uDM2;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, ShareServer_TLB, StdVcl, Provider, Db, DBTables;

type
  TChildRDM = class(TRemoteDataModule, IChildRDM)
    tblVendors: TTable;
    prvVendors: TDataSetProvider;
  private
    { Private declarations }
    FMainDM: IMainRDM;
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function Get_MainDM: IMainRDM; safecall;
    procedure Set_MainDM(const Value: IMainRDM); safecall;
    function Get_SessionName: WideString; safecall;
    procedure Set_SessionName(const Value: WideString); safecall;
  public
    { Public declarations }
  end;

var
  FChildRDMFactory: TComponentFactory;

implementation

{$R *.DFM}

class procedure TChildRDM.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

function TChildRDM.Get_MainDM: IMainRDM;
begin
  Result := FMainDM;
end;

procedure TChildRDM.Set_MainDM(const Value: IMainRDM);
begin
  FMainDM := Value;
end;

// We could get the SessionName from the DBDataset here,
// but this shows how to access components on the main form.
// We also could have passed the integer(Session1) value into
// the child RDM as a property in the TMainRDM.Get_ChildDM method,
// and just set session names from that assignment.
function TChildRDM.Get_SessionName: WideString;
begin
  Result := TSession(FMainDM.Session).SessionName;
end;

procedure TChildRDM.Set_SessionName(const Value: WideString);
var
  i: integer;
begin
  for i:=0 to ComponentCount-1 do
    if Components[i] is TDBDataset then
      TDBDataset(Components[i]).SessionName := Value;
end;

// Assign the FChildRDMFactory variable so we can create instances of this
// RDM from the parent RDM. Also be sure to create the child RDM with
// ciInternal instancing.
initialization
  FChildRDMFactory := TComponentFactory.Create(ComServer, TChildRDM,
    Class_ChildRDM, ciInternal, tmApartment);
end.


