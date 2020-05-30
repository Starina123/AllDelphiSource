
unit DMUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, DB, DBClient,
  Provider, SqlExpr, WebAdapt, WebComp, FMTBcd, DBAdapt, DBXpress;

type
  TDM = class(TWebDataModule)
    SQLConnection1: TSQLConnection;
    DataSetAdapter1: TDataSetAdapter;
    SQLTable1: TSQLTable;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1CUST_NO: TIntegerField;
    ClientDataSet1CUSTOMER: TStringField;
    ClientDataSet1CONTACT_FIRST: TStringField;
    ClientDataSet1CONTACT_LAST: TStringField;
    ClientDataSet1PHONE_NO: TStringField;
    ClientDataSet1ADDRESS_LINE1: TStringField;
    ClientDataSet1ADDRESS_LINE2: TStringField;
    ClientDataSet1CITY: TStringField;
    ClientDataSet1STATE_PROVINCE: TStringField;
    ClientDataSet1COUNTRY: TStringField;
    ClientDataSet1POSTAL_CODE: TStringField;
    ClientDataSet1ON_HOLD: TStringField;
    procedure ClientDataSet1BeforeClose(DataSet: TDataSet);
    procedure ClientDataSet1ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DataSetAdapter1AfterExecuteAction(Sender, Action: TObject;
      Params: TStrings);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function DM: TDM;

implementation

{$R *.dfm} 

uses WebReq, WebCntxt, WebFact, Variants;

function DM: TDM;
begin
  Result := TDM(WebContext.FindModuleClass(TDM));
end;

procedure TDM.ClientDataSet1ReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
var
  GetErrors: IGetAdapterErrorsList;
begin
  // Add reconcile errors to the adapter's errors object
  if Supports(TObject(DM.DataSetAdapter1), IGetAdapterErrorsList, GetErrors) then
    GetErrors.GetAdapterErrorsList.AddError(E);
end;

procedure TDM.ClientDataSet1BeforeClose(DataSet: TDataSet);
begin
  // Clear cached data once we have serviced a request
  (DataSet as TClientDataSet).EmptyDataSet;
end;

procedure TDM.DataSetAdapter1AfterExecuteAction(Sender, Action: TObject;
  Params: TStrings);
begin
  if ClientDataSet1.ChangeCount > 0 then
    if ClientDataSet1.ApplyUpdates(-1) > 0 then
      // If an error occurs restore the record so that valid values are used to
      // build the response page.
      ClientDataSet1.CancelUpdates
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebDataModuleFactory.Create(TDM, crOnDemand, caCache));

end.
