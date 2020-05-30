unit BaseFormViewU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  BaseViewU, StdCtrls, Mask, DBCtrls, ExtCtrls, ComCtrls, ToolWin;

type
  TBaseFormView = class(TBaseView)
    ScrollBox1: TScrollBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseFormView: TBaseFormView;

implementation

{$R *.DFM}

end.
