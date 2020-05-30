unit ServerMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CORBA, Broker_I, Broker_S, Broker_Impl;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    MoneyMarketAcct : MoneyMarket;
    MarginAcct : MarginAccount;
    InvestmentAcct : InvestmentAccount;
    procedure CorbaInit;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.CorbaInit;
begin
  CorbaInitialize;

  MoneyMarketAcct := TMoneyMarketSkeleton.Create('One', TMoneyMarket.Create);
  BOA.ObjIsReady(MoneyMarketAcct as _Object);

  MarginAcct := TMarginAccountSkeleton.Create('Two', TMarginAccount.Create);
  BOA.ObjIsReady(MarginAcct as _Object);

  InvestmentAcct := TInvestmentAccountSkeleton.Create('Three', TInvestmentAccount.Create);
  BOA.ObjIsReady(InvestmentAcct as _Object);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CorbaInit;
  Memo1.Lines.Add('Account object created...');
  Memo1.Lines.Add('Server is ready');
end;

end.
