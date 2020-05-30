unit ServData;

{
  This is the remote datamodule for this demo.  It contains the implementaion
  of the OLE automation object that the client application talks to.  The
  datamodule contains a TProvider component that has an OnDataRequest event
  which is used for dynamically assigning a SQL string.  This demo also
  shows how to use automation methods which are used by the client.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComServ, ComObj, VCLCom, StdVcl, DataBkr, Serv_TLB, Db, DBTables,
  Provider;

type
  TAdHocQueryDemo = class(TRemoteDataModule, IAdHocQueryDemo)
    AdHocQuery: TQuery;
    AdHocProvider: TProvider;
    Database1: TDatabase;
    Session1: TSession;
    procedure AdHocQueryDemoCreate(Sender: TObject);
    procedure AdHocQueryDemoDestroy(Sender: TObject);
    procedure AdHocQueryAfterOpen(DataSet: TDataSet);
  protected
    function GetDatabaseNames: OleVariant; safecall;
    procedure SetDatabaseName(const DBName, Password: WideString); safecall;
  end;

var
  AdHocQueryDemo: TAdHocQueryDemo;

implementation

uses ServMain, BDE;

{$R *.DFM}

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

initialization
  TComponentFactory.Create(ComServer, TAdHocQueryDemo,
    Class_AdHocQueryDemo, ciMultiInstance);
end.
