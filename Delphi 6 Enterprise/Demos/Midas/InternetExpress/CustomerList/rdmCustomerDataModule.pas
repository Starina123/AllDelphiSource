unit rdmCustomerDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, rdmCustomerData_TLB, Provider, Db, DBTables, Stdvcl;

type
  TCustomerData = class(TRemoteDataModule, ICustomerData)
    Session1: TSession;
    SelectCustOrders: TQuery;
    OrderItems: TTable;
    SelectCustOrderSrc: TDataSource;
    CustOrders: TDataSetProvider;
    SelectCustNames: TQuery;
    CustNames: TDataSetProvider;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  public
    { Public declarations }
  end;

var
  CustomerData: TCustomerData;

implementation

{$R *.dfm}

class procedure TCustomerData.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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
  TComponentFactory.Create(ComServer, TCustomerData,
    Class_CustomerData, ciMultiInstance, tmApartment);
end.
