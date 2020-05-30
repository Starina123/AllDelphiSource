// This is the parent RDM. All access to the server is done through
// this RDM. The property ChildDM was added to the type library, and
// is of type IChildDM. In this example, IChildDM descends from
// IBaseDM, which in turn descends from IAppServer. Using this
// technique, you can add common properties to the IBaseDM interface.
//
// Also note that you must take care to have your children RDM use
// their data-access components in a thread-safe manner. For the BDE,
// this means having a separate SessionName for each connection.
// As each parent RDM is created in a new thread, and the
// TSession.AutoSessionName property is set to true on this RDM,
// we will pass the session name to the children RDM so that they
// may use BDE datasets.
unit uDM1;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, ShareServer_TLB, StdVcl, DBTables;

type
  TMainRDM = class(TRemoteDataModule, IMainRDM)
    Session1: TSession;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function Get_ChildDM: IChildRDM; safecall;
    function MainMethod: WideString; safecall;
    function Get_Session: Integer; safecall;
  public
    { Public declarations }
  end;

implementation

uses
  uDM2;

{$R *.DFM}

class procedure TMainRDM.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

function TMainRDM.Get_ChildDM: IChildRDM;
begin
  Result := FChildRDMFactory.CreateComObject(nil) as IChildRDM;
  Result.MainDM := Self;
  Result.SessionName := Session1.SessionName;
end;

function TMainRDM.MainMethod: WideString;
begin
  Result := 'Calling MainMethod';
end;

function TMainRDM.Get_Session: Integer;
begin
  Result := Integer(Session1);
end;

initialization
  TComponentFactory.Create(ComServer, TMainRDM,
    Class_MainRDM, ciMultiInstance, tmApartment);
end.
