unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CORBA, COSNaming, StdCtrls, Bank_I, Bank_C;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    acct : Account;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
	nameArray : COSNaming.Name;
	nameComp  : COSNaming.NameComponent;
   nameContext : COSNaming.NamingContext;
begin
   //create the naming component -- match test server id and kind values
   nameComp := TNameComponent.Create('Test1', 'AccountServer');

   //set up the Name sequence
   SetLength(NameArray, 1);
   NameArray[0] := nameComp;

   //bind to the naming context
   NameContext := TNamingContextHelper.Bind;

   //resolve to our Account object and narrow it to an Account type
   acct := TAccountHelper.narrow( NameContext.resolve(NameArray), True );
   
   Label1.Caption := FormatFloat('Balance = $#,##0.00', acct.balance);

end;

end.
