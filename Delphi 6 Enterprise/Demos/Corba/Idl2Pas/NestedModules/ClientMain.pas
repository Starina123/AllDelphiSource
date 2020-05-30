unit ClientMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Corba, Financials_Bank_i, Financials_Bank_c, Financials_MutualFund_i,
  Financials_MutualFund_c;

type
  TForm1 = class(TForm)
    btnBalance: TButton;
    Memo1: TMemo;
    btnNav: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnBalanceClick(Sender: TObject);
    procedure btnNavClick(Sender: TObject);
  private
    { Private declarations }
    Acct : Account;
    MutualFund : Asset;
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
  Acct := TAccountHelper.Bind;
  MutualFund := TAssetHelper.Bind;
end;

procedure TForm1.btnBalanceClick(Sender: TObject);
begin
  Memo1.Lines.Add('Balance = ' +
    FormatFloat('$###,##0.00', Acct.Balance));
end;

procedure TForm1.btnNavClick(Sender: TObject);
var _nav : Single;
begin
  _nav := MutualFund.nav;

  Memo1.Lines.Add('NAV = ' + FormatFloat('$###0.00', _nav));
end;

initialization

end.
