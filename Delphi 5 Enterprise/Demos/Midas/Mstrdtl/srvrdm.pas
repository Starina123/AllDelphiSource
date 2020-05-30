unit SrvrDM;

interface

{ This DataModule is the COM object that the TRemoteServer component will
  connect to.  Each remote connection gets a new DataModule that is used
  during that clients session.  When using a TDatabase on a Remote Data
  Module, be sure to set it's HandleShared property to True.  If you use
  a TSession then set it's AutoSessionName property to True.
}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComServ, ComObj, VCLCom, StdVcl, DataBkr, Serv_TLB,
  DBTables, Provider, Db, DBClient, BDE;

type
  TProjectData = class(TRemoteDataModule, IProjectData)
    Project: TTable;
    Employee: TQuery;
    EmpProj: TQuery;
    ProjectProvider: TDataSetProvider;
    UpdateQuery: TQuery;
    Database: TDatabase;
    ProjectSource: TDataSource;
    EmployeeProvider: TDataSetProvider;
    procedure ProjectProviderBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
  end;

var
  ProjectData: TProjectData;

implementation

{$R *.DFM}

{ This function implements cascaded deletes.  Normally, you would do this in a
  trigger, but for the sake of this demo, it is done here. }
procedure TProjectData.ProjectProviderBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
const
  DeleteQuery = 'delete from EMPLOYEE_PROJECT where PROJ_ID = :ProjID';
begin
  if (UpdateKind = ukDelete) and (SourceDS = Project) then
  begin
    UpdateQuery.SQL.Text := DeleteQuery;
    UpdateQuery.Params[0].AsString := DeltaDS.FieldByName('PROJ_ID').AsString;
    UpdateQuery.ExecSQL;
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TProjectData,
    Class_ProjectData, ciMultiInstance);
end.
