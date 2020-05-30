unit DmCSDemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, DB;

type
  TDmEmployee = class(TDataModule)
    SalesTable: TTable;
    SalesSource: TDataSource;
    CustomerTable: TTable;
    CustomerSource: TDataSource;
    ShipOrderProc: TStoredProc;
    EmployeeDatabase: TDatabase;
    EmployeeSource: TDataSource;
    EmployeeTable: TTable;
    EmployeeTableEMP_NO: TSmallintField;
    EmployeeTableFIRST_NAME: TStringField;
    EmployeeTableLAST_NAME: TStringField;
    EmployeeTablePHONE_EXT: TStringField;
    EmployeeTableHIRE_DATE: TDateTimeField;
    EmployeeTableDEPT_NO: TStringField;
    EmployeeTableJOB_CODE: TStringField;
    EmployeeTableJOB_GRADE: TSmallintField;
    EmployeeTableJOB_COUNTRY: TStringField;
    EmployeeTableSALARY: TFloatField;
    EmployeeTableFULL_NAME: TStringField;
    DeleteEmployeeProc: TStoredProc;
    SalaryHistoryTable: TTable;
    SalaryHistorySource: TDataSource;
    SalaryHistoryTableCHANGE_DATE: TDateTimeField;
    SalaryHistoryTableUPDATER_ID: TStringField;
    SalaryHistoryTableOLD_SALARY: TFloatField;
    SalaryHistoryTablePERCENT_CHANGE: TFloatField;
    SalaryHistoryTableNEW_SALARY: TFloatField;
    CustomerTableCUST_NO: TIntegerField;
    CustomerTableCUSTOMER: TStringField;
    CustomerTableCONTACT_FIRST: TStringField;
    CustomerTableCONTACT_LAST: TStringField;
    CustomerTablePHONE_NO: TStringField;
    CustomerTableADDRESS_LINE1: TStringField;
    CustomerTableADDRESS_LINE2: TStringField;
    CustomerTableCITY: TStringField;
    CustomerTableSTATE_PROVINCE: TStringField;
    CustomerTableCOUNTRY: TStringField;
    CustomerTablePOSTAL_CODE: TStringField;
    CustomerTableON_HOLD: TStringField;
    SalesTablePO_NUMBER: TStringField;
    SalesTableCUST_NO: TIntegerField;
    SalesTableSALES_REP: TSmallintField;
    SalesTableORDER_STATUS: TStringField;
    SalesTableORDER_DATE: TDateTimeField;
    SalesTableSHIP_DATE: TDateTimeField;
    SalesTableDATE_NEEDED: TDateTimeField;
    SalesTablePAID: TStringField;
    SalesTableQTY_ORDERED: TIntegerField;
    SalesTableTOTAL_VALUE: TIntegerField;
    SalesTableDISCOUNT: TFloatField;
    SalesTableITEM_TYPE: TStringField;
    SalesTableAGED: TFloatField;
    EmployeeLookup: TTable;
    SmallintField1: TSmallintField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    DateTimeField1: TDateTimeField;
    StringField4: TStringField;
    StringField5: TStringField;
    SmallintField2: TSmallintField;
    StringField6: TStringField;
    FloatField1: TFloatField;
    StringField7: TStringField;
    SalaryHistoryTableEMP_NO: TSmallintField;
    SalaryHistoryTableEMPLOYEE: TStringField;
    procedure EmployeeTableBeforeDelete(DataSet: TDataSet);
    procedure EmployeeTableAfterPost(DataSet: TDataSet);
    procedure DmEmployeeCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmEmployee: TDmEmployee;

implementation

{$R *.dfm}

{ Note: Business rules go in the data model.  Here is an example, used by
  the transaction editing demo.  Deletes for the employee table are done
  with a stored procedure rather than the normal BDE record delete
  mechanism, so an audit trail could be provided, etc... }

{ The database, EmployeeDatabase, is the InterBase example EMPLOYEE.GDB database
  accessed thru the BDE alias IBLOCAL.  This database contains examples
  of stored procedures, triggers, check constraints, views, etc., many of
  which are used within this demo project. }

procedure TDmEmployee.EmployeeTableBeforeDelete(DataSet: TDataSet);
begin
  { Assign the current employee's id to the stored procedure's parameter }
  DeleteEmployeeProc.Params.ParamValues['EMP_NUM'] := EmployeeTable['EMP_NO'];
  DeleteEmployeeProc.ExecProc;          { Trigger the stored proc }
  EmployeeTable.Refresh;                { Refresh the data }
  { Block the EmployeeTable delete since the stored procedure did the work }
  Abort;
end;

procedure TDmEmployee.EmployeeTableAfterPost(DataSet: TDataSet);
begin
  { A change in an employee salary triggers a change in the salary history,
    so if that table is open, it needs to be refreshed now }
  with SalaryHistoryTable do if Active then Refresh;
end;

procedure TDmEmployee.DmEmployeeCreate(Sender: TObject);
begin
  EmployeeDatabase.Open;
end;

end.
