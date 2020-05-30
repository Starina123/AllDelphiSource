unit SeverUnitCust2;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, ServerCust_TLB, StdVcl, Provider, DB, DBTables;

type
  TCustomer_MinMax = class(TRemoteDataModule, ICustomer_MinMax)
    Query1: TQuery;
    DataSetProvider1: TDataSetProvider;
    Table1: TTable;
    DataSetProvider2: TDataSetProvider;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant;
      MaxErrors: Integer; out ErrorCount: Integer;
      var OwnerData: OleVariant): OleVariant; safecall;
    function AS_DataRequest(const ProviderName: WideString;
      Data: OleVariant): OleVariant; safecall;
    function AS_GetParams(const ProviderName: WideString;
      var OwnerData: OleVariant): OleVariant; safecall;
    function AS_GetProviderNames: OleVariant; safecall;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer;
      out RecsOut: Integer; Options: Integer;
      const CommandText: WideString; var Params,
      OwnerData: OleVariant): OleVariant; safecall;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant;
      RequestType: Integer; var OwnerData: OleVariant): OleVariant;
      safecall;
    procedure AS_Execute(const ProviderName, CommandText: WideString;
      var Params, OwnerData: OleVariant); safecall;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TCustomer_MinMax.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

function TCustomer_MinMax.AS_ApplyUpdates(const ProviderName: WideString;
  Delta: OleVariant; MaxErrors: Integer; out ErrorCount: Integer;
  var OwnerData: OleVariant): OleVariant;
begin

end;

function TCustomer_MinMax.AS_DataRequest(const ProviderName: WideString;
  Data: OleVariant): OleVariant;
begin

end;

function TCustomer_MinMax.AS_GetParams(const ProviderName: WideString;
  var OwnerData: OleVariant): OleVariant;
begin

end;

function TCustomer_MinMax.AS_GetProviderNames: OleVariant;
begin

end;

function TCustomer_MinMax.AS_GetRecords(const ProviderName: WideString;
  Count: Integer; out RecsOut: Integer; Options: Integer;
  const CommandText: WideString; var Params,
  OwnerData: OleVariant): OleVariant;
begin

end;

function TCustomer_MinMax.AS_RowRequest(const ProviderName: WideString;
  Row: OleVariant; RequestType: Integer;
  var OwnerData: OleVariant): OleVariant;
begin

end;

procedure TCustomer_MinMax.AS_Execute(const ProviderName,
  CommandText: WideString; var Params, OwnerData: OleVariant);
begin

end;

initialization
  TComponentFactory.Create(ComServer, TCustomer_MinMax,
    Class_Customer_MinMax, ciMultiInstance, tmApartment);
end.
