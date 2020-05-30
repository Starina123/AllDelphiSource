unit empform;

{
  This program demonstrates using TClientDataSet in a distributed data
  application.  The data comes from a separate OLE Automation server,
  so before running this project you must compile and run EmpServ.dpr.
}

interface

uses
  SysUtils, Forms, Dialogs, ExtCtrls, StdCtrls, Mask, Classes,
    DBClient, Db, Controls, DBCtrls, ComCtrls, MConnect;

type
  TEmployeeForm = class(TForm)
    Label2: TLabel;
    UpdateButton: TButton;
    UndoButton: TButton;
    QueryButton: TButton;
    DBText1: TDBText;
    FirstName: TDBEdit;
    LastName: TDBEdit;
    PhoneExt: TDBEdit;
    HireDate: TDBEdit;
    Salary: TDBEdit;
    EmpData: TDataSource;
    DBNavigator1: TDBNavigator;
    Employees: TClientDataSet;
    RemoteServer1: TDCOMConnection;
    StatusBar1: TStatusBar;
    procedure QueryButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure UndoButtonClick(Sender: TObject);
    procedure EmployeesReconcileError(DataSet: TCustomClientDataSet;
     E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure EmpDataDataChange(Sender: TObject; Field: TField);
  end;

var
  EmployeeForm: TEmployeeForm;

implementation

uses recerror;

{$R *.dfm}

procedure TEmployeeForm.QueryButtonClick(Sender: TObject);
begin

{ Get data from the server.  The number of records returned is dependent on
  the PacketRecords property of TClientDataSet.  If PacketRecords is set
  to -1 then all records are returned.  Otherwise, as the user scrolls
  through the data, additional records are returned in separate data packets. }

  Employees.Close;
  Employees.Open;

end;

procedure TEmployeeForm.UpdateButtonClick(Sender: TObject);
begin

{ Apply any edits.  The parameter indicates the number of errors which
  are allowed before the updating is aborted.  A value of -1 indicates that
  all successful updates be applied regardless of the number of errors. }

  Employees.ApplyUpdates(-1);
  
end;

procedure TEmployeeForm.UndoButtonClick(Sender: TObject);
begin

{ Here we demonstrate a new feature in TClientDataSet, the ability to undo
  changes in reverse order.  The parameter indicates if the cursor should
  be repositioned to then record association with the change. }


  Employees.UndoLastChange(True);

end;

procedure TEmployeeForm.EmployeesReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin

{ This is the event handler which is called when there are errors during the
  update process.  To demonstrate, you can create an error by running two
  copies of this application and modifying the same record in each one.
  Here we use the standard reconcile error dialog from the object repository. }

  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TEmployeeForm.EmpDataDataChange(Sender: TObject; Field: TField);
begin

{ This code is used to update the status bar to show the number of records
  that have been retrieved an our relative position with the dataset. }

  with Employees do
    if Active then
      StatusBar1.Panels[1].Text := Format(' %d of %d', [RecNo, RecordCount]);

end;


end.
