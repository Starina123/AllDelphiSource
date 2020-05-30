unit ClientMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Corba, MyStruct_I, MyStruct_C;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    acct : Account;
    st1, st2, st3 : MyStructType;
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
  st1 := TMyStructType.Create(1, 2, '1st Struct');
  st2 := TMyStructType.Create(100, 200, '2nd Struct');
  st3 := TMyStructType.Create(1000, 2000, '3rd Struct');

  acct := TAccountHelper.bind;
end;

procedure TForm1.Button1Click(Sender: TObject);
var f : single;
begin
  if acct <> nil then
  begin
    Memo1.Lines.Add('Sending:');
    Memo1.Lines.Add('Struct1 =(' + IntToStr(st1.s) + ', ' + IntToStr(st1.l) + ', ' + st1.st + ')');
    Memo1.Lines.Add('Struct2 =(' + IntToStr(st2.s) + ', ' + IntToStr(st2.l) + ', ' + st2.st + ')');
    Memo1.Lines.Add('Struct3 =(' + IntToStr(st3.s) + ', ' + IntToStr(st3.l) + ', ' + st3.st + ')');
    Memo1.Lines.Add('');
    Memo1.Lines.Add('Calling Corba Server...');
    Memo1.Lines.Add('');

    f := Acct.balance(st1, st2, st3);

    Memo1.Lines.Add('Got Response back...');
    Memo1.Lines.Add('Struct2 =(' + IntToStr(st2.s) + ', ' + IntToStr(st2.l) + ', ' + st2.st + ')');
    Memo1.Lines.Add('Struct3 =(' + IntToStr(st3.s) + ', ' + IntToStr(st3.l) + ', ' + st3.st + ')');
    Memo1.Lines.Add('Balance = '+ FormatFloat('$#,##0.00', f));
  end
  else Memo1.Lines.Add('No connection');
end;

end.
