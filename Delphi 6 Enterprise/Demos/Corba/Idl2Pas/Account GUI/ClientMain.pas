unit ClientMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  Corba, Account_I, Account_C, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
  { private declarations }
  protected
     Acct : Account;
    procedure InitCorba;
  { protected declarations }
  public
  { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.InitCorba;
begin
  CorbaInitialize;
  Acct := TAccountHelper.bind;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  InitCorba;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Label1.Caption := FormatFloat('Balance = $#,##0.00', Acct.Balance);
end;

end.