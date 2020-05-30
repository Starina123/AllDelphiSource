unit Ffactlin;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QExtCtrls, QDBCtrls, QStdCtrls, DB, DBClient, QGrids, QDBGrids, QButtons;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    DBImage1: TDBImage;
    DBText1: TDBText;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Label1: TLabel;
    DBText2: TDBText;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    DBMemo1: TDBMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.xfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  ClientDataSet1.LoadFromFile('biolife.cds');
end;

end.
