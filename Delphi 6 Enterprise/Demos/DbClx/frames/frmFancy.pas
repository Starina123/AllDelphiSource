unit frmFancy;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QDBCtrls, QExtCtrls, QStdCtrls;

type
  TFancyFrame = class(TFrame)
    DBMemo1: TDBMemo;
    Splitter1: TSplitter;
    DBImage1: TDBImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.xfm}

end.
