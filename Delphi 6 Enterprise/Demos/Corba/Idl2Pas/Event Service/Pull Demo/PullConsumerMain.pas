unit PullConsumerMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
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

uses CORBA, COSEvent, PullConsumerGlobalVars;

procedure TForm1.Button1Click(Sender: TObject);
var st : String;
//    has_event : Boolean;
//    x : integer;
begin
(*  x := Pull_Supplier.try_pull(has_event);
  if has_event then
    Memo1.Lines.Add('Server value = ' + IntToStr(x));
*)
  st := Pull_Supplier.Pull;
  Memo1.Lines.Add(St);
end;

end.
