unit ClientMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Corba, Bank_I, Bank_C;

type
  TForm1 = class(TForm)
    btnDeposit: TButton;
    btnWithdraw: TButton;
    btnBalance: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    btnDoException: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnDepositClick(Sender: TObject);
    procedure btnWithdrawClick(Sender: TObject);
    procedure btnBalanceClick(Sender: TObject);
    procedure btnDoExceptionClick(Sender: TObject);
  private
    { Private declarations }
    acct : Account;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  acct := TAccountHelper.bind;
end;

procedure TForm1.btnDepositClick(Sender: TObject);
begin
  if acct <> nil then
  begin
    acct.deposit(StrToFloat(Edit1.Text));
    Edit3.Text := FormatFloat('$#,##0.00', acct.balance);
  end
  else Edit3.Text := 'No connection';
end;

procedure TForm1.btnWithdrawClick(Sender: TObject);
var errstr : AnsiString;
begin
  if acct <> nil then
  begin
    try
      acct.withdrawl(StrToFloat(Edit2.text));
    except
      on E : EAccountOverRun do
      begin
        errStr := 'Account Over Run Exception ==> Balance = ' + FormatFloat('#,##0.00', E.value);
        ShowMessage(errStr);
        exit;
      end;
    end;
    Edit3.Text := FormatFloat('$#,##0.00', acct.balance);
  end
  else Edit3.Text := 'No connection';
end;

procedure TForm1.btnBalanceClick(Sender: TObject);
begin
  if acct <> nil then
    Edit3.Text := FormatFloat('$#,##0.00', acct.balance)
  else Edit3.Text := 'No connection';
end;

procedure TForm1.btnDoExceptionClick(Sender: TObject);
begin
  try
    acct.DoException; //manually trigger the exception on the server side
  except
    on E: EAccountOverRun do
       ShowMessage('Account Over Run exception:  Negative account balance.  Balance  = ' +
         FormatFloat('$##,##0.00', E.value) );
    on E: EThrowOne do
       ShowMessage('Throw One exception: st = ' + E.st);
    on E: UNKNOWN do
       ShowMessage('Got an **UNKNOWN** system exception');
    on E: EFoo do
    begin
      ShowMessage('Foo Struct = (' + IntToStr(E.MyStruct.myint) + ', ' + E.MyStruct.myStr + ')');
    end;
  end;

end;

end.
