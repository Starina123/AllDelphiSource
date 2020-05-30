unit FrmMD;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, FrmData;

type
  TMasterDetailFrame = class(TFrame)
    MasterFrame: TDataFrame;
    DetailFrame: TDataFrame;
    Splitter2: TSplitter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
  