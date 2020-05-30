unit OrdersListViewU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  BaseListViewU, Grids, DBGrids, ComCtrls, StdCtrls, Mask, DBCtrls,
  ToolWin, ExtCtrls;

type
  TOrdersListView = class(TBaseListView)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OrdersListView: TOrdersListView;

implementation

uses ClientDataModuleU;

{$R *.DFM}

end.
