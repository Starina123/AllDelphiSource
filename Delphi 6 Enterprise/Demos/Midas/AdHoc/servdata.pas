unit servdata;

{
  This is the remote datamodule for this demo.  It contains the implementaion
  of the OLE automation object that the client application talks to.  The
  datamodule contains a TDataSetProvider component that has an OnDataRequest event
  which is used for dynamically assigning a SQL string.  This demo also
  shows how to use automation methods which are used by the client.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComServ, ComObj, VCLCom, StdVcl, DataBkr, serv_tlb, Db, DBTables,
  Provider, Variants;

type
  TAdHocQueryDemo = class(TRemoteDataModule, IAdHocQueryDemo)
    AdHocQuery: TQuery;
    AdHocProvider: TDataSetProvider;
    Database1: TDatabase;
    Session1: TSession;
    procedure AdHocQueryDemoCreate(Sender: TObject);
    procedure AdHocQueryDemoDestroy(Sender: TObject);
    procedure AdHocQueryAfterOpen(DataSet: TDataSet);
  protected
    function GetDatabaseNames: OleVariant; safecall;
    procedure SetDatabaseName(const DBName, Password: WideString); safecall;
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  end;

var
  AdHocQueryDemo: TAdHocQueryDemo;

implementation

uses ServMain, BDE;

{$R *.dfm}

function TAdHocQueryDemo.GetDatabaseNames: OleVariant;
var
  I: Integer;
  DBNames: TStrings;
begin
  { Return a list of all of the database names to the client }
  DBNames := TStringList.Create;
  try
    Session1.GetDatabaseNames(DBNames);
    Result := VarArrayCreate([0, DBNames.Count - 1], varOleStr);
    for I := 0 to DBNames.Count - 1 do
      Result[I] := DBNames[I];
  finally
    DBNames.Free;
  end;
end;

procedure TAdHocQueryDemo.SetDatabaseName(const DBName,
  Password: WideString);
begin
  { Assign a new Database name }
  try
    Database1.Close;
    Database1.AliasName := DBName;
    if Password <> '' then
      Database1.Params.Values['PASSWORD'] := Password;
    Database1.Open;
  except
    { If the DB open fails, assume it is because a password is required and
      raise a special exception which will cause the client to prompt the
      user for a password }
    on E: EDBEngineError do
      if (Password = '') then
        raise Exception.Create('Password Required') else
        raise;
  end;
end;

procedure TAdHocQueryDemo.AdHocQueryDemoCreate(Sender: TObject);
begin
  { Update the client counter }
  MainForm.UpdateClientCount(1);
end;

procedure TAdHocQueryDemo.AdHocQueryDemoDestroy(Sender: TObject);
begin
  { Update the client counter }
  MainForm.UpdateClientCount(-1);
end;

procedure TAdHocQueryDemo.AdHocQueryAfterOpen(DataSet: TDataSet);
begin
  { Update the query counter }
  MainForm.IncQueryCount;
end;

class procedure TAdHocQueryDemo.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

initialization
  TComponentFactory.Create(ComServer, TAdHocQueryDemo,
    Class_AdHocQueryDemo, ciMultiInstance);
end.
