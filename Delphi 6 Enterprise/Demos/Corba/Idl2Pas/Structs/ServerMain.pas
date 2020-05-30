unit ServerMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CORBA, MyStruct_I, MyStruct_S, MyStruct_Impl;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Acct : Account;
    procedure CorbaInit;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CorbaInit;
begin
  CorbaInitialize;
  Acct := TAccountSkeleton.Create('Jack B Quick', TAccount.Create);
  BOA.ObjIsReady(Acct as _Object);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CorbaInit;
  Memo1.Lines.Add('Account object created...');
  Memo1.Lines.Add('Server is ready');
end;

end.
