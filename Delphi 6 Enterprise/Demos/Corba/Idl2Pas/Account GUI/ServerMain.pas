unit ServerMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Corba,
  Account_I, Account_C, Account_S, Account_Impl;

type
  TForm1 = class(TForm)
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

{$R *.DFM}

procedure TForm1.InitCorba;
begin
  CorbaInitialize;

  // Add CORBA server Code Here
  Acct := TAccountSkeleton.Create('Jack B Quick', TAccount.Create);
  BOA.ObjIsReady(Acct as _Object);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  InitCorba;
end;

end.