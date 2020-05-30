unit ClientMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Corba, Account_I, Account_C;

type
  TForm1 = class(TForm)
    btnBalance: TButton;
    Label1: TLabel;
    btnGetYearOpened: TButton;
    btnSetYearOpened: TButton;
    Label2: TLabel;
    Edit1: TEdit;
    chkToaster: TCheckBox;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnBalanceClick(Sender: TObject);
    procedure btnGetYearOpenedClick(Sender: TObject);
    procedure btnSetYearOpenedClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

procedure TForm1.btnBalanceClick(Sender: TObject);
begin
    Label1.Caption := 'Balance = ' + FormatFloat('$#,##0.00', acct.balance);
end;

procedure TForm1.btnGetYearOpenedClick(Sender: TObject);
begin
  Label2.Caption := 'Year Opened = ' + IntToStr(acct.YearOpened);
end;

procedure TForm1.btnSetYearOpenedClick(Sender: TObject);
begin
  if Edit1.Text <> '' then  //no check to ensure numbers!!
  begin
    Acct.YearOpened := StrToInt(Edit1.Text);
    btnGetYearOpenedClick(Self);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  chkToaster.checked := acct.GotToaster;
end;

end.
