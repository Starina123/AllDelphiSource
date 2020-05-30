unit RecForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, DB, DBTables, ExtCtrls, StdCtrls, Buttons, Mask, Menus,
  ComCtrls, GdsData;

type
  TRecViewForm = class(TStdDataForm)
    GroupBox2: TPanel;
    OrderNo: TDBEdit;
    CustName: TDBEdit;
    SaleDate: TDBEdit;
    AmountDue: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Bevel1: TBevel;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    OnCredit: TDBCheckBox;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label12: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RecViewForm: TRecViewForm;

implementation

{$R *.dfm}

end.
