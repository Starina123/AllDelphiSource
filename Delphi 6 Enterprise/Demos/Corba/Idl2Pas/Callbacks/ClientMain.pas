unit ClientMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Corba, Bank_I, Bank_C, ClientGlobals;

type
  TForm1 = class(TForm)
    btnBalance: TButton;
    Memo1: TMemo;
    btnRates: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnBalanceClick(Sender: TObject);
    procedure btnRatesClick(Sender: TObject);
  private
    { Private declarations }
    Acct : Account;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  CorbaInitialize;
  Acct := TAccountHelper.Bind;
end;

procedure TForm1.btnBalanceClick(Sender: TObject);
begin
  Memo1.Lines.Add('Balance = ' +
    FormatFloat('$##,##0.00', Acct.Balance));
end;

procedure TForm1.btnRatesClick(Sender: TObject);
var _rates : Single;
begin
  _rates := Acct.get_rates(myRatesSkel);

  Memo1.Lines.Add('Rate = ' +
    FormatFloat('#0.00%', _rates));
end;

end.
