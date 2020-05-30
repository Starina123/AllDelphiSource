unit ServData;

{ This Datamodule is the CoClass for the IEmpServer interface.  It was
  created using the File | New | Remote Data Module menu option }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComServ, ComObj, VCLCom, StdVcl, DataBkr, Provider, BdeProv, Db, DBTables,
  Serv_TLB;

type

  TEmpServer = class(TDataModule, IEmpServer)
    EmpQuery: TQuery;
    procedure EmpQueryAfterOpen(DataSet: TDataSet);
    procedure EmpServerCreate(Sender: TObject);
    procedure EmpServerDestroy(Sender: TObject);
  protected
    function Get_EmpQuery: IProvider; safecall;
  end;

var
  EmpServer: TEmpServer;

implementation

{$R *.DFM}

uses ServMain;

{ This method was generated using the "export from datamodule" option on the
  local menu of any TQuery, Table, or TProvider component.  It returns the
  IProvider interface used by the client. }

function TEmpServer.Get_EmpQuery: IProvider;
begin
  Result := EmpQuery.Provider;
end;


{ This rest of this code just demonstrates how you might monitor client
  activity from the server.  None of this is required to develop an
  application server. }

procedure TEmpServer.EmpQueryAfterOpen(DataSet: TDataSet);
begin
  { Update the query counter }
  MainForm.IncQueryCount;
end;

procedure TEmpServer.EmpServerCreate(Sender: TObject);
begin
  { Update the client counter }
  MainForm.UpdateClientCount(1);
end;

procedure TEmpServer.EmpServerDestroy(Sender: TObject);
begin
  { Update the client counter }
  MainForm.UpdateClientCount(-1);
end;

initialization
 { This creates the class factory for us.  This code is generated automatically }
  TComponentFactory.Create(ComServer, TEmpServer, Class_EmpServer,
    ciMultiInstance);
end.
