{*********************************************}
{ TeeChart Delphi Component Library           }
{ Table Data-Aware Chart Demo                 }
{ Copyright (c) 1995-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
unit tablepie;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  DBTables, Chart, Series, DbChart, Teengine, TeeProcs;

type
  TTablePieForm = class(TForm)
    DBChart1: TDBChart;
    PieSeries1: TPieSeries;
    Table1: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Table1NAME: TStringField;
    Table1SIZE: TSmallintField;
    Table1WEIGHT: TSmallintField;
    CheckBox1: TCheckBox;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    procedure CheckBox1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure PieSeries1Click(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TTablePieForm.CheckBox1Click(Sender: TObject);
begin
  Table1.Active:=CheckBox1.Checked;  { <-- open / close the table }
end;

procedure TTablePieForm.RadioGroup1Click(Sender: TObject);
begin
  { change the Pie value source (the table field name) }
  Case RadioGroup1.ItemIndex of
    0: PieSeries1.PieValues.ValueSource:='Size';
    1: PieSeries1.PieValues.ValueSource:='Weight';
  end;
  { change the Chart Foot text to display the current table Field }
  DBChart1.Foot.Text[1]:='PieValueSource:=Table1'+
                          PieSeries1.PieValues.ValueSource;
end;

procedure TTablePieForm.PieSeries1Click(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
Const CarriageReturn=#13#10;
begin
  { On Clicked Pie, show the user the pie data }
  With PieSeries1 do
  ShowMessage( XLabel[ValueIndex] + CarriageReturn+
               MarkPercent(ValueIndex,True) );
end;

end.
