unit ItemsListViewU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  BaseListViewU, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ComCtrls,
  ToolWin, ExtCtrls;

type
  TItemsListView = class(TBaseListView)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ItemsListView: TItemsListView;

implementation

uses ClientDataModuleU;

{$R *.DFM}

end.
