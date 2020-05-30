unit ClientMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Corba, AnyTest_I, AnyTest_C;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Acct : MyTest;
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
   Acct := TMyTestHelper.bind;
end;

procedure TForm1.Button1Click(Sender: TObject);
var myAny : Any;
begin
   myAny := Acct.GetAny();
   Label1.Caption := 'Any value = ' + IntToStr(myany);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
   Acct := nil;
end;

end.
