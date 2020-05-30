unit ServerMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Corba, CosNaming, Bank_I, Bank_C, Bank_S, Bank_Impl;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    AccountServer : Account;
    nameArray : COSNaming.Name;
    nameComp  : COSNaming.NameComponent;
    nameContext : COSNaming.NamingContext;
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
    {Corba Initialization}
  CorbaInitialize;
  AccountServer := TAccountSkeleton.Create('Jack B Quick', TAccount.Create);
  BOA.ObjIsReady(AccountServer as _Object);

  {Set up the CosNaming Registration - unregister when program shuts down}

  // create the naming component -- match test server id and kind values
  // Note that "Test1" is the Naming Component specified on the cmd line for
  // the naming service i.e. NameExtF Test1 mylog.txt
  nameComp := TNameComponent.Create('Test1', 'AccountServer');

  //set up the Name sequence
  SetLength(NameArray, 1);
  NameArray[0] := nameComp;

  //bind to the naming context
  NameContext := TNamingContextHelper.Bind;

  NameContext.bind(NameArray, AccountServer as CorbaObject);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CorbaInit;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  //unregister server with CosNaming
  NameContext.unbind(NameArray);
end;

end.
