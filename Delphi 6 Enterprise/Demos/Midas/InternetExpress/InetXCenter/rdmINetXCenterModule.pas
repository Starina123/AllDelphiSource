{
  InternetExpress sample data module.

  The remote data module provides data used
  by the InetXCenter sample application.

}

unit rdmINetXCenterModule;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, rdmINetXCenter_TLB, Stdvcl, Provider, Db, DBTables;

type
  TINetXCenterData = class(TRemoteDataModule, IINetXCenterData)
    Session1: TSession;
    SelectCustNames: TQuery;
    OrderItems: TTable;
    SelectCustOrders: TQuery;
    SelectCustOrderSrc: TDataSource;
    CustOrders: TDataSetProvider;
    CustNames: TDataSetProvider;
    SelectAllCustomers: TQuery;
    AllCustomers: TDataSetProvider;
    SelectAllCountries: TQuery;
    AllCountries: TDataSetProvider;
    AllCustOrders: TDataSetProvider;
    SelectAllCustomersSrc: TDataSource;
    CustOrderTable: TTable;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

class procedure TINetXCenterData.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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
  TComponentFactory.Create(ComServer, TINetXCenterData,
    Class_INetXCenterData, ciMultiInstance, tmApartment);
end.
