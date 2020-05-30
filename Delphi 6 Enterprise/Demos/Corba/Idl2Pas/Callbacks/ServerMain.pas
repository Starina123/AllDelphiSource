unit ServerMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CORBA, Bank_I, Bank_S, Bank_Impl;

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
var num, k : integer;
    ListID : TStringList;
begin
  CorbaInit;
   With Memo1.Lines do
   begin
     Add('Account object created...');
     Add('Server is ready');
     try
       ListID :=  TStringList.Create;
       Corba.InterfaceIDManager.GetInterfaceList(ListID);
       num := ListID.Count;
       if num > 0 then
          for k := 0 to num - 1 do
              Add(ListID[k]);
     finally
       ListID.Free;
     end;
   end;
end;

end.
