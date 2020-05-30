unit ClientMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  Corba, StdCtrls, Account_I, Account_C;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
  { private declarations }
  protected
  { protected declarations }
    Acct : Account;
    myArray : ArrayType;
    procedure InitCorba;
  public
  { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.InitCorba;
begin
  CorbaInitialize;
  Acct := TAccountHelper.bind;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  j: Integer;
begin
  InitCorba;
  for j := 0 to 2 do
    myArray[j] := (j + 1) * 100;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Label1.Caption := FormatFloat('Balance = $#,##0.00', Acct.balance(myArray));
end;

end.