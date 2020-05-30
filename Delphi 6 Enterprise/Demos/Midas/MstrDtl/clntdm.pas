unit clntdm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, DBClient, MConnect;

type
  TDM = class(TDataModule)
    ProjectSource: TDataSource;
    EmpProjSource: TDataSource;
    EmployeeSource: TDataSource;
    Project: TClientDataSet;
    Emp_Proj: TClientDataSet;
    Employee: TClientDataSet;
    Emp_ProjEMP_NO: TSmallintField;
    Emp_ProjPROJ_ID: TStringField;
    Emp_ProjEmployeeName: TStringField;
    ProjectPROJ_ID: TStringField;
    ProjectPROJ_NAME: TStringField;
    ProjectPROJ_DESC: TMemoField;
    ProjectTEAM_LEADER: TSmallintField;
    ProjectPRODUCT: TStringField;
    ProjectEmpProj: TDataSetField;
    DCOMConnection: TDCOMConnection;
    procedure ProjectNewRecord(DataSet: TDataSet);
    procedure ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  public
    procedure ApplyUpdates;
  end;

var
  DM: TDM;

implementation

uses recerror;

{$R *.dfm}

procedure TDM.ApplyUpdates;
begin
  if Project.ApplyUpdates(0) = 0 then
    Project.Refresh;
end;

procedure TDM.ProjectNewRecord(DataSet: TDataSet);
var
  Value: String;
begin
  if InputQuery('Project ID','Enter Project ID:',Value) then
  begin
    if Length(Value) > ProjectPROJ_ID.Size then
      raise Exception.CreateFmt('Project ID can only be %d characters',
        [ProjectPROJ_ID.Size]);
    if Length(Value) = 0 then
      raise Exception.Create('Project ID is required');
  end else
    SysUtils.Abort;
  ProjectPROJ_ID.Value := Value;
end;

{ Look at recerror.pas for information on the HandleError dialog. }
procedure TDM.ReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

end.
