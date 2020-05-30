{ :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  :: QuickReport 2.0 for Delphi 1.0/2.0/3.0                  ::
  ::                                                         ::
  :: Example reports project                                 ::
  ::                                                         ::
  :: Copyright (c) 1997 QuSoft AS                            ::
  :: All Rights Reserved                                     ::
  ::                                                         ::
  :: web: http://www.qusoft.no   mail: support@qusoft.no     ::
  ::                             fax: +47 22 41 74 91        ::
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: }

unit Menu;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Quickrpt, List, GrpList, manygrp, MD, ExtCtrls, qrextra;

type
  TMainForm = class(TForm)
    GroupBox1: TGroupBox;
    SimpleList: TRadioButton;
    GroupedList: TRadioButton;
    MasterDetail: TRadioButton;
    SQLMasterDetail: TRadioButton;
    Description: TMemo;
    Preview: TButton;
    Print: TButton;
    Exit: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image2: TImage;
    RadioButton1: TRadioButton;
    CompositeReport: TQuickRep;
    QRCompositeReport1: TQRCompositeReport;
    procedure SimpleListClick(Sender: TObject);
    procedure PreviewClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure GroupedListClick(Sender: TObject);
    procedure MasterDetailClick(Sender: TObject);
    procedure SQLMasterDetailClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    FReport : TQuickRep;
    procedure SetReport(Value : TQuickRep);
  public
    property Report : TQuickRep read FReport write SetReport;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.SetReport(Value : TQuickRep);
begin
  FReport:=Value;
  Description.Lines.Assign(Report.Description);
end;

procedure TMainForm.PreviewClick(Sender: TObject);
begin
  if Report = CompositeReport then
  begin
    QRCompositeReport1.Preview;
  end else
    Report.Preview;
end;

procedure TMainForm.PrintClick(Sender: TObject);
begin
  if Report = CompositeReport then
  begin
    QRCompositeReport1.Print;
  end else
    Report.Print;
end;

procedure TMainForm.ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  if Description.Lines.Count = 0 then
    SimpleListClick(Self);
end;

procedure TMainForm.SimpleListClick(Sender: TObject);
begin
  Report:=ListForm.QuickRep;
end;

procedure TMainForm.GroupedListClick(Sender: TObject);
begin
  Report := GrpListForm.QuickRep;
end;

procedure TMainForm.MasterDetailClick(Sender: TObject);
begin
  Report:=MDForm.QuickRep;
end;

procedure TMainForm.SQLMasterDetailClick(Sender: TObject);
begin
  Report:= ManyGrpForm.QuickRep;
end;

procedure TMainForm.RadioButton1Click(Sender: TObject);
begin
  Report := CompositeReport;
end;

procedure TMainForm.QRCompositeReport1AddReports(Sender: TObject);
begin
  with QRCompositeReport1 do
  begin
    Reports.Add(ListForm.QuickRep);
    Reports.Add(GrpListForm.QuickRep);
    Reports.Add(MDForm.QuickRep);
    Reports.Add(ManyGrpForm.QuickRep);
  end;
end;

end.
