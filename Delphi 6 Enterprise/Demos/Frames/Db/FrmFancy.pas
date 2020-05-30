unit FrmFancy;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls;

type
  TFancyFrame = class(TFrame)
    DBMemo1: TDBMemo;
    DBImage1: TDBImage;
    Splitter1: TSplitter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
  