unit ClientMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Corba, Bank_I, Bank_C;

type
  TClientForm = class(TForm)
    btnBalance: TButton;
    Memo1: TMemo;
    btnRates: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnBalanceClick(Sender: TObject);
    procedure btnRatesClick(Sender: TObject);
  private
    { Private declarations }
    Acct : Account;
    Rate : Rates;
  public
    { Public declarations }
  end;

var
  ClientForm: TClientForm;

implementation

{$R *.DFM}


procedure TClientForm.FormCreate(Sender: TObject);
begin
  CorbaInitialize;
  Acct := TAccountHelper.Bind;
  Rate := TRatesHelper.Bind;
end;

procedure TClientForm.btnBalanceClick(Sender: TObject);
begin
  Memo1.Lines.Add('Balance = ' +
    FormatFloat('$##,##0.00', Acct.Balance));
end;

procedure TClientForm.btnRatesClick(Sender: TObject);
begin
  Memo1.Lines.Add('Rates = ' +
    FormatFloat('#0.00%', Acct.get_rates(Rate)));
end;

end.
