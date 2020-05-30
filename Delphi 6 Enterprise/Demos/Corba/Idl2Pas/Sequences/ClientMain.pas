unit ClientMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Corba, Account_I, Account_C;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    acct : Account;
    aSequence : IntSeq;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var k : integer;
begin
  acct := TAccountHelper.bind;
  for k := 0 to High(aSequence) do
    aSequence[k] := k;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Label1.Caption := 'Balance = ' +
    FormatFloat('$#,##0.00', acct.balance(aSequence));
end;

end.
