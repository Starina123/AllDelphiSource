unit ClientMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Corba, Broker_I, Broker_C;

type
  TForm2 = class(TForm)
    btnMoneyMarket: TButton;
    btnMargin: TButton;
    btnInvestment: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnMoneyMarketClick(Sender: TObject);
    procedure btnMarginClick(Sender: TObject);
    procedure btnInvestmentClick(Sender: TObject);
  private
    { Private declarations }
    MoneyMarketAcct : MoneyMarket;
    MarginAcct : MarginAccount;
    InvestmentAcct : InvestmentAccount;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

procedure TForm2.FormCreate(Sender: TObject);
begin
  CorbaInitialize;
  MoneyMarketAcct := TMoneyMarketHelper.Bind;
  MarginAcct := TMarginAccountHelper.Bind;
  InvestmentAcct := TInvestmentAccountHelper.Bind;
end;

procedure TForm2.btnMoneyMarketClick(Sender: TObject);
begin
  Memo1.Lines.Add('Money Market Interest Rate = ' +
    FormatFloat('#0.00%', MoneyMarketAcct.interest_rate));
end;

procedure TForm2.btnMarginClick(Sender: TObject);
begin
  Memo1.Lines.Add('Margin Interest Rate = ' +
    FormatFloat('#0.00%', MarginAcct.margin_rate));
end;


procedure TForm2.btnInvestmentClick(Sender: TObject);
begin
  Memo1.Lines.Add('Investment Acct Interest Rate = ' +
    FormatFloat('#0.00%', InvestmentAcct.interest_rate));
  Memo1.Lines.Add('Investment Acct Balance = ' +
    FormatFloat('$###,##0.00', InvestmentAcct.balance));
  Memo1.Lines.Add('Investment Acct Margin Rate = ' +
    FormatFloat('$###,##0.00', InvestmentAcct.margin_rate));

end;

end.
