{******************************************}
{ TeeChart Delphi Component Library        }
{ SQL Query Chart Demo                     }
{ Copyright (c) 1995-2001 by David Berneda }
{ All rights reserved                      }
{******************************************}
unit sqlbars;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  DBTables, Chart, Series, DbChart, Teengine, TeeProcs;

type
  TSQLBarsForm = class(TForm)
    DBChart1: TDBChart;
    DataSource1: TDataSource;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BarSeries1: TBarSeries;
    Query1: TQuery;
    Panel2: TPanel;
    Memo1: TMemo;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    Label1: TLabel;
    CBRandomBar: TCheckBox;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBChart1ClickLegend(Sender: TCustomChart;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure BarSeries1Click(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure BarSeries1GetBarStyle(Sender: TCustomBarSeries;
      ValueIndex: Longint; var TheBarStyle: TBarStyle);
    procedure CBRandomBarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
Uses UDemUtil;

procedure TSQLBarsForm.BitBtn2Click(Sender: TObject);
begin { rerun the SQL query }
  Screen.Cursor:=crHourGlass;
  try
    Query1.Close;
    Query1.Sql:=Memo1.Lines;
    Query1.Open;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TSQLBarsForm.ComboBox1Change(Sender: TObject);
begin
  if BarSeries1 is TCustomBarSeries then
  BarSeries1.BarStyle:=TBarStyle(ComboBox1.ItemIndex); { <-- change bar style }
end;

procedure TSQLBarsForm.FormCreate(Sender: TObject);
begin
  ComboBox1.ItemIndex:=Ord(BarSeries1.BarStyle); { <-- set combobox1 }
end;

procedure TSQLBarsForm.DBChart1ClickLegend(Sender: TCustomChart;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  With DBChart1.Legend do Color:=EditColor(Self,Color);
end;

procedure TSQLBarsForm.BarSeries1Click(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  With BarSeries1 do
       ValueColor[ValueIndex]:=EditColor(Self,ValueColor[ValueIndex]);
end;

procedure TSQLBarsForm.BarSeries1GetBarStyle(Sender: TCustomBarSeries;
  ValueIndex: Longint; var TheBarStyle: TBarStyle);
begin
  if CBRandomBar.Checked then
     TheBarStyle:=TBarStyle(Random(1+Ord(High(TBarStyle))));
end;

procedure TSQLBarsForm.CBRandomBarClick(Sender: TObject);
begin
  ComboBox1.Enabled:=not CBRandomBar.Checked;
  DBChart1.Repaint;
end;

end.
