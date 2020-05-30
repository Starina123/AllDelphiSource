unit ServerMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Corba,
  AnyTest_I, AnyTest_C, AnyTest_S, AnyTest_Impl, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
  private
  { private declarations }
  protected
  { protected declarations }
    anyTest : MyTest; // skeleton object
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

  // Add CORBA server Code Here
  AnyTest := TMyTestSkeleton.Create('Any Test Server', TMyTest.Create);
  BOA.ObjIsReady(AnyTest as _Object);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  InitCorba;
end;

end.