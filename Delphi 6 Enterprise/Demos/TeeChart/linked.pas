{*********************************************}
{ TeeChart Delphi Component Library           }
{ Linked Tables Chart Demo                    }
{ Copyright (c) 1995-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
unit linked;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  DBTables, Chart, Series, DbChart, DBCtrls, Teengine, TeeProcs;

type
  TLinkedTablesForm = class(TForm)
    DBChart1: TDBChart;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Table1: TTable;
    Table2: TTable;
    DBNavigator1: TDBNavigator;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    Table2OrderNo: TFloatField;
    Table2CustNo: TFloatField;
    Table2SaleDate: TDateTimeField;
    Table2AmountPaid: TCurrencyField;
    Table1CustNo: TFloatField;
    Table1Company: TStringField;
    Table1City: TStringField;
    Table1State: TStringField;
    Table1Country: TStringField;
    AreaSeries1: TAreaSeries;
    BitBtn1: TBitBtn;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TLinkedTablesForm.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin  { force dbchart to refresh ! }
  DBChart1.CheckDataSource(AreaSeries1);
end;

end.
