unit CtrlForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, ExtCtrls, Mask, DBTables, DB, Grids, DBGrids, Menus,
  DBCGrids;

type
  TFmCtrlGrid = class(TForm)
    DBCtrlGrid1: TDBCtrlGrid;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Button1: TButton;
    Bevel1: TBevel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lPurchase: TLabel;
    lTotalCost: TLabel;
    lTotalShares: TLabel;
    lDifference: TLabel;
    DBNavigator1: TDBNavigator;
    MainMenu1: TMainMenu;
    About1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBCtrlGrid1Enter(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmCtrlGrid: TFmCtrlGrid;

implementation

uses DM, About;

{$R *.dfm}

procedure TFmCtrlGrid.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFmCtrlGrid.FormShow(Sender: TObject);
begin
  DM1.CalculateTotals(Sender, nil);
end;

procedure TFmCtrlGrid.DBGrid1Enter(Sender: TObject);
begin
  DBNavigator1.DataSource := DM1.DSMaster;
end;

procedure TFmCtrlGrid.DBCtrlGrid1Enter(Sender: TObject);
begin
  DBNavigator1.DataSource := DM1.DSHoldings;
end;

procedure TFmCtrlGrid.About1Click(Sender: TObject);
begin
  with TFMAboutBox.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

end.
