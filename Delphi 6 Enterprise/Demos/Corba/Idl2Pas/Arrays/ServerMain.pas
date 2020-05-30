unit ServerMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Corba,
  Account_I, Account_C, Account_S, Account_Impl, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
  { private declarations }
  protected
  { protected declarations }
    Acct : Account; // skeleton object
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
  Acct := TAccountSkeleton.Create('Array Server', TAccount.Create);
  BOA.ObjIsReady(Acct as _Object);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  InitCorba;
  Memo1.Lines.Add('Account object created...');
  Memo1.Lines.Add('Server is ready');
end;

end.