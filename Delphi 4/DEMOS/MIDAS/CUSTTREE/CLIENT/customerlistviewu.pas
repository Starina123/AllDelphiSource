unit CustomerListViewU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  BaseListViewU, DBCtrls, Grids, DBGrids, ExtCtrls;

type
  TCustomersListView = class(TBaseListView)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomersListView: TCustomersListView;

implementation

uses ClientDataModuleU;

{$R *.DFM}

end.
