{******************************************}
{    TeeChart. TChart Component            }
{ Copyright (c) 1995-2001 by David Berneda }
{    All Rights Reserved                   }
{******************************************}
unit upages;

interface
{ This form demonstrates how Charts can be divided in several Pages.
  The main Chart property is "MaxPointsPerPage".
  TeeChart automatically calculates the total number of pages based on that
  property.
  The other Paging properties and methods are:

    Chart.Page     : Longint    Sets and returns the current Chart Page.
    Chart.NumPages : Longint    Returns the Total Number of Pages.
    method Chart.NextPage ;     Goes to next page.
    method Chart.PreviousPage ; Goes to previous page.
}
uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Chart, Series, ExtCtrls, StdCtrls, Spin, BubbleCh, Buttons,
  Teengine, TeeProcs;

type
  TPagesForm = class(TForm)
    Chart1: TChart;
    LineSeries1: TLineSeries;
    BubbleSeries1: TBubbleSeries;
    Panel1: TPanel;
    SpinEdit1: TSpinEdit;
    Label2: TLabel;
    Label1: TLabel;
    ButtonPrevious: TBitBtn;
    ButtonNext: TBitBtn;
    BLastPage: TBitBtn;
    BFirstPage: TBitBtn;
    CheckBox1: TCheckBox;
    BitBtn3: TBitBtn;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure Chart1PageChange(Sender: TObject);
    procedure ButtonPreviousClick(Sender: TObject);
    procedure ButtonNextClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BFirstPageClick(Sender: TObject);
    procedure BLastPageClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagesForm: TPagesForm;

implementation

{$R *.dfm}

procedure TPagesForm.FormCreate(Sender: TObject);
begin
  LineSeries1.FillSampleValues(100);      { <-- some random points }
  BubbleSeries1.FillSampleValues(100);
  SpinEdit1.Value:=18;         { <-- max number of points per page }
  Chart1PageChange(Chart1);    { <-- repaint page / number of pages }
end;

procedure TPagesForm.SpinEdit1Change(Sender: TObject);
begin
  { change the max number of points per page }
  { a value of Zero means "No pages. Show all points" }
  Chart1.MaxPointsPerPage:=SpinEdit1.Value;
  Chart1PageChange(Chart1); { <-- repaint page / number of pages }
end;

procedure TPagesForm.Chart1PageChange(Sender: TObject);
begin
  Chart1.UndoZoom;
  { show the current page number and the total number of pages }
  { (like a report) }
  Label1.Caption:=IntToStr(Chart1.Page)+'/'+IntToStr(Chart1.NumPages);
  { enable or disable buttons }
  ButtonPrevious.Enabled:=Chart1.Page > 1;
  ButtonNext.Enabled:=Chart1.Page < Chart1.NumPages;
  BLastPage.Enabled:=ButtonNext.Enabled;
  BFirstPage.Enabled:=ButtonPrevious.Enabled;
end;

procedure TPagesForm.ButtonPreviousClick(Sender: TObject);
begin
  Chart1.PreviousPage; { <-- goto previous chart page }
end;

procedure TPagesForm.ButtonNextClick(Sender: TObject);
begin
  Chart1.NextPage;  { <-- goto next chart page }
end;

procedure TPagesForm.CheckBox1Click(Sender: TObject);
begin
  Chart1.ScaleLastPage:=CheckBox1.Checked;  { <-- only for last page }
end;

procedure TPagesForm.BFirstPageClick(Sender: TObject);
begin
  Chart1.Page:=1;  { go to first page }
end;

procedure TPagesForm.BLastPageClick(Sender: TObject);
begin
  Chart1.Page:=Chart1.NumPages;  { go to last page }
end;

end.
