unit clientmain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Corba, OrbPas30, Server_I, Server_C;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

var MyFac : MyTestFactory;
    MyRate : IMyTest;

procedure TForm1.Button2Click(Sender: TObject);
begin
   Memo1.lines.clear;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
   CorbaInitialize;
   MyFac := TMyTestFactoryHelper.bind('MyTest');
   MyRate := MyFac.CreateInstance('MyTest');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   Memo1.Lines.Add(DateTimeToStr(Now) + ' :   ' + IntToStr(MyRate.Get_X) );
end;

end.
