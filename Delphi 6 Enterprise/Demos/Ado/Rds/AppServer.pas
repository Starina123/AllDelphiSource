unit AppServer;

interface

uses
  ComObj, ActiveX, RServer_TLB, ADODB, ADODB_TLB;

type
  TRDSAppServer = class(TAutoObject, IRDSAppServer)
  protected
    function Get_Employee: _Recordset; safecall;
  end;

implementation

uses ComServ;

function TRDSAppServer.Get_Employee: _Recordset;
var
  ConnStr: WideString;
begin
  { Create an ADO Recordset instance directly }
  ConnStr := 'FILE NAME=' + DataLinkDir + '\DBDEMOS.UDL';
  Result := CoRecordSet.Create;
  Result.CursorLocation := adUseClient;
  Result.Open('Employee', ConnStr, adOpenStatic, adLockBatchOptimistic, adCmdTable);
end;

initialization
  TAutoObjectFactory.Create(ComServer, TRDSAppServer, Class_RDSAppServer,
    ciMultiInstance, tmSingle);
end.
