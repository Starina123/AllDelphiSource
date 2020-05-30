unit FrmMD;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QExtCtrls, frmData;

type
  TMasterDetailFrame = class(TFrame)
    MasterFrame: TDataFrame;
    Splitter1: TSplitter;
    DetailFrame: TDataFrame;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.xfm}

end.
