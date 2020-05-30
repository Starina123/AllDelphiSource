unit frmData;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs, QGrids,
  QDBGrids, QExtCtrls, QDBCtrls, frmFancy, DB, DBClient;

type
  TDataFrame = class(TFrame)
    DBNavigator1: TDBNavigator;
    FancyFrame1: TFancyFrame;
    Splitter1: TSplitter;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.xfm}

end.
