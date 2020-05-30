unit ServerMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Corba, Bank_I, Bank_C, Bank_S, Bank_Impl;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    CheckingAccount : Checking;
    SavingsAccount : Savings;
    procedure CorbaInit;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.CorbaInit;
begin
  CorbaInitialize;
  CheckingAccount := TCheckingSkeleton.Create('Jack B Quick', TChecking.Create);
  SavingsAccount := TSavingsSkeleton.Create('John Doe', TSavings.Create);
  BOA.ObjIsReady(CheckingAccount as _Object);
  BOA.ObjIsReady(SavingsAccount as _Object);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CorbaInit;
end;

end.
