unit BaseListViewU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  BaseViewU, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ComCtrls, ToolWin,
  ExtCtrls;

type
  TBaseListView = class(TBaseView)
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseListView: TBaseListView;

implementation

{$R *.DFM}

end.
