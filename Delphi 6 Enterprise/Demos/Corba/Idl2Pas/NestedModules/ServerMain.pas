unit ServerMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CORBA, Financials_MutualFund_i, Financials_MutualFund_c, Financials_MutualFund_s,
  Financials_MutualFund_impl, Financials_Bank_i, Financials_Bank_c, Financials_Bank_s,
  Financials_Bank_impl;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Acct : Account;
    MutualFund : Asset;
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

  MutualFund := TAssetSkeleton.Create('My Mutual Fund', TAsset.Create);
  BOA.ObjIsReady(MutualFund as _Object);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CorbaInit;
  Memo1.Lines.Add('Account object created...');
  Memo1.Lines.Add('Server is ready');
end;

end.
