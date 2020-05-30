unit ServData;

{
  This is the remote datamodule for this demo.  It contains the implementaion
  of the OLE automation object that the client application talks to.  The
  client project contains the code which calls the SetParams method of the
  IProvider interface.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComServ, ComObj, VCLCom, StdVcl, BdeProv, DataBkr, Serv_TLB, Db, DBTables;

type
  TSetParamDemo = class(TDataModule, ISetParamDemo)
    Events: TQuery;
    procedure SetParamDemoCreate(Sender: TObject);
    procedure SetParamDemoDestroy(Sender: TObject);
    procedure EventsAfterOpen(DataSet: TDataSet);
  protected
    function Get_Events: IProvider; safecall;
  end;

var
  SetParamDemo: TSetParamDemo;

implementation

{$R *.DFM}

uses ServMain;

function TSetParamDemo.Get_Events: IProvider;
begin
  { Return the IProvider interface from the Events TQuery component }
  Result := Events.Provider;
end;

procedure TSetParamDemo.SetParamDemoCreate(Sender: TObject);
begin
  { Update the client counter }
  MainForm.UpdateClientCount(1);
end;

procedure TSetParamDemo.SetParamDemoDestroy(Sender: TObject);
begin
  { Update the client counter }
  MainForm.UpdateClientCount(-1);
end;

procedure TSetParamDemo.EventsAfterOpen(DataSet: TDataSet);
begin
  { Update the query counter }
  MainForm.IncQueryCount;
end;

initialization
  TComponentFactory.Create(ComServer, TSetParamDemo,
    Class_SetParamDemo, ciMultiInstance);
end.
