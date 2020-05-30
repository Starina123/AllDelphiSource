unit ClientMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Corba, Bank_I, Bank_C;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    CheckingAccount : Checking;
    SavingsAccount : Savings;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  CorbaInitialize;
  CheckingAccount := TCheckingHelper.Bind;
  SavingsAccount := TSavingsHelper.Bind;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  CheckingBalance, SavingsBalance, SavingsInterestRate : Single;
begin
   CheckingBalance := CheckingAccount.balance;
   SavingsBalance := SavingsAccount.balance;
   SavingsInterestRate := SavingsAccount.interest_rate;

   Memo1.Lines.Add('Checking Balance = ' + FormatFloat('$#,##0.00', CheckingBalance));
   Memo1.Lines.Add('Savings Balance = ' + FormatFloat('$#,##0.00', SavingsBalance));
   Memo1.Lines.Add('Savings Interest Rate = ' + FormatFloat('##0.00%', SavingsInterestRate));
end;

end.
