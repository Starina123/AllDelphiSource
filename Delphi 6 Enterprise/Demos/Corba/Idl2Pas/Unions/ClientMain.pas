unit ClientMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Corba, MyUnion_I, MyUnion_C;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    acct : Account;
    myUnion : UnionType;
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
  myUnion := TUnionType.Create;
  acct := TAccountHelper.bind;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  myUnion.l := StrToInt(Edit1.Text);  //send a long
  Label2.Caption := FormatFloat('$###,##0.00', Acct.balance(myUnion));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  myUnion.s := StrToInt(Edit2.Text);  //send a short
  Label2.Caption := FormatFloat('$###,##0.00', Acct.balance(myUnion));
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if edit3.text = '' then
  begin
    ShowMessage('Cannot send a null string!  Enter some text');
    exit;
  end;
  myUnion.i := Edit3.Text;            //send a string
  Label2.Caption := FormatFloat('$###,##0.00', Acct.balance(myUnion));
end;

end.
