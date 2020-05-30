unit MyBaseExpMain;

interface

uses
  SysUtils, Types, Classes, Variants, QGraphics, QControls, QForms, QDialogs,
  QComCtrls, QDBCtrls, QExtCtrls, QMenus, QTypes, QGrids, QDBGrids, DB,
  DBClient, QButtons, QStdCtrls;

type
  TForm1 = class(TForm)
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    F1: TMenuItem;
    O1: TMenuItem;
    C1: TMenuItem;
    E1: TMenuItem;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    DBNavigator1: TDBNavigator;
    OpenDialog1: TOpenDialog;
    ButtonLoadXML: TSpeedButton;
    ButtonNewXML: TSpeedButton;
    N1: TMenuItem;
    procedure O1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure ButtonLoadXMLClick(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure ButtonNewXMLClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses AddNewTable;

{$R *.xfm}

procedure TForm1.O1Click(Sender: TObject);
begin
if OpenDialog1.Execute then
  begin
  ClientDataSet1.Active:=false;
  ClientDataSet1.FileName:=OpenDialog1.FileName;
  ClientDataSet1.Active:=true;
  StatusBar1.Panels[0].Text:=OpenDialog1.FileName;
  end;

end;

procedure TForm1.C1Click(Sender: TObject);
begin
  ClientDataSet1.Active:=false;
  StatusBar1.Panels[0].Text:='No Table Open';

end;

procedure TForm1.ButtonLoadXMLClick(Sender: TObject);
begin
  O1Click(self);
end;

procedure TForm1.E1Click(Sender: TObject);
begin
  ClientDataSet1.Active:=false;
  Form1.Close;
end;

procedure TForm1.ButtonNewXMLClick(Sender: TObject);
begin
  form2.ShowModal;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  form2.ShowModal;
end;

end.
