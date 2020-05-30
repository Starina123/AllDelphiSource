unit BriefcaseMain;

{ This program demonstrates how to do disconnected briefcase applications
  with ADO.  When the Connected checkbox is unchecked the application is
  switched into offline mode.  If the application is exited at that point
  then the data is persisted to a file on disk (along with any edits to the
  data).  When the application is restarted it will load the persisted data
  if present, otherwise it will fetch the data from the database. }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DB, ADODB, Grids, DBGrids, ExtCtrls;

type
  TForm1 = class(TForm)
    Employees: TADODataSet;
    EmpSource: TDataSource;
    DBGrid1: TDBGrid;
    Connection: TADOConnection;
    Panel1: TPanel;
    ConnectionInd: TCheckBox;
    UpdateButton: TButton;
    RefreshButton: TButton;
    SaveButton: TButton;
    procedure Form1Create(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure Form1CloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure UpdateButtonClick(Sender: TObject);
    procedure ConnectionIndClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
  private
    DataFileName: string;
  public
    procedure LoadData;
    procedure SaveData;
    procedure UpdateData;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const
  BaseFileName = 'EMPLOYEE.ADTG';

procedure TForm1.LoadData;
begin
  DataFileName := ExtractFilePath(Paramstr(0))+BaseFileName;
  { If a persisted datafile exists, assume we exited in a disconnected
    (offline) state and load the data from the file. }
  if FileExists(DataFileName) then
    Employees.LoadFromFile(DataFileName)
  else
  begin
    { Otherwise establish the connection and get data from the database }
    ConnectionInd.Checked := True;
    Employees.Open;
  end;
end;

procedure TForm1.UpdateData;
begin
  { Connect to the database and send the pending updates }
  ConnectionInd.Checked := True;
  Employees.UpdateBatch;
  DeleteFile(DataFileName);
end;

procedure TForm1.SaveData;
begin
  { Persist the data to disk }
  Employees.SaveToFile(DataFileName, pfADTG);
end;

procedure TForm1.Form1Create(Sender: TObject);
begin
  Connection.ConnectionString := 'FILE NAME=' + DataLinkDir + '\DBDEMOS.UDL';
  LoadData;
end;

procedure TForm1.SaveButtonClick(Sender: TObject);
begin
  SaveData;
end;

procedure TForm1.UpdateButtonClick(Sender: TObject);
begin
  UpdateData;
end;

procedure TForm1.Form1CloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Employees.Active then
  try
    { When closing, update the database if connected or save it to disk if not }
    if Connection.Connected then
      UpdateData else
      SaveData;
  except
    on E: Exception do
    begin
      Application.HandleException(Self);
      CanClose := MessageDlg('Data not saved/updated, exit anyway?',
        mtConfirmation, mbYesNoCancel, 0) = mrYes;
    end;
  end;
end;

procedure TForm1.ConnectionIndClick(Sender: TObject);
begin
  { Toggle the connection's state }
  if ConnectionInd.Checked then
  begin
    Connection.Open;
    Employees.Connection := Connection;
  end else
  begin
    { Note here you must clear the connection property of the dataset before
      closing the connection.  Otherwise the dataset will close with the
      connection. }
    Employees.Connection := nil;
    Connection.Close;
  end;
end;

procedure TForm1.RefreshButtonClick(Sender: TObject);
begin
  { Close and reopen the dataset to refresh the data.  Note that in this demo
    there is no checking for pending updates so they are lost if you click
    the refresh data button before clicking the Update database button. }
  ConnectionInd.Checked := True;
  Employees.Close;
  Employees.CommandType := cmdTable;
  Employees.CommandText := 'Employee';
  Employees.Open;
end;

end.
