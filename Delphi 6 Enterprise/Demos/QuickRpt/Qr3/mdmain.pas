{ :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  :: QuickReport 3.0 for Delphi 3.0/4.0/5.0/6.0              ::
  ::                                                         ::
  :: Example reports project                                 ::
  ::                                                         ::
  :: Copyright (c) 1995-1999 QuSoft AS                       ::
  :: All Rights Reserved                                     ::
  ::                                                         ::
  :: web: http://www.qusoft.com  fax: +47 22 41 74 91        ::
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: }
unit mdmain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, quickrpt, Db, DBTables, printers, qrextra, QRExport,
  qrprntr;

const
 Composite_Description = 'The composite control can be used to link several'+
                         ' reports together as a single report.';

type
  TfrmQR3Demo = class(TForm)
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRCompositeReport1: TQRCompositeReport;
    Label1: TLabel;
    VersionLbl: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    rbCreateList: TRadioButton;
    btnPreview: TButton;
    btnPrint: TButton;
    rbMasterDetail: TRadioButton;
    Description: TMemo;
    OpenDialog1: TOpenDialog;
    cbPreview: TComboBox;
    Label4: TLabel;
    rbExprMemo: TRadioButton;
    rbImage: TRadioButton;
    rbBasicMD: TRadioButton;
    btnFilters: TButton;
    rbComposite: TRadioButton;
    Label5: TLabel;
    rbNeedData: TRadioButton;
    rbFormLetter: TRadioButton;
    btnExport: TButton;
    SaveDialog1: TSaveDialog;
    rbAbout: TRadioButton;
    rbGrouping: TRadioButton;
    Image2: TImage;
    procedure CreateList(Sender: TObject);
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure btnCRClick(Sender: TObject);
    procedure rbCreateListClick(Sender: TObject);
    procedure rbMasterDetailClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure rbExprMemoClick(Sender: TObject);
    procedure rbImageClick(Sender: TObject);
    procedure rbBasicMDClick(Sender: TObject);
    procedure btnFiltersClick(Sender: TObject);
    procedure rbCompositeClick(Sender: TObject);
    procedure rbNeedDataClick(Sender: TObject);
    procedure rbFormLetterClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure rbAboutClick(Sender: TObject);
    procedure rbGroupingClick(Sender: TObject);
  private
    { Private declarations }
    FReport : TCustomQuickRep;
    CreateListReport : TQuickRep;
    procedure SetReport(Value : TCustomQuickRep);
  public
    { Public declarations }
    property Report : TCustomQuickRep read FReport write SetReport;
  end;

var
  frmQR3Demo: TfrmQR3Demo;

implementation

uses mdrpt, exprmemo, image, basicmd, needdata, frmltr,
  history, grouping;

{$R *.dfm}

procedure TfrmQR3Demo.SetReport(Value : TCustomQuickRep);
begin
  FReport := Value;
  if Value <> nil then
    if Value = TCustomQuickRep(QRCompositeReport1) then
      Description.Lines.Text := Composite_Description
    else
      Description.Lines.Assign(Report.Description);
end;

procedure TfrmQR3Demo.CreateList(Sender: TObject);
var
  aReport : TCustomQuickRep;
  SomeFields: TStringList;
  MyTable: TTable;
  nIdx: integer;
begin
  { Create a table on the fly, this example uses a table from the demo database }
  MyTable := TTable.Create(self);

  { create the list of fields to output from the table }
  SomeFields := TStringList.Create;
  with MyTable do
  begin
    DatabaseName := 'DBDEMOS';
    TableName := 'COUNTRY.DB';
    ReadOnly := True;
    Active := True;

    // For this example, we will pull the field names from the table
    // If you wanted to only use some of the fields, you would edit
    // this list.
    for nIdx := 0 to FieldCount - 1 do
      SomeFields.Add(Fields[nIdx].FieldName);
  end;

  // If you didn't create the report, you must set the report object to nil
  // before calling QRCreateList

  areport := nil;

  { Build the report }

  // If you change the displaywidth, it will be reflecte in the created
  // report

  with MyTable.Fields[1] do
    DisplayWidth := DisplayWidth div 2;

  // create the report
  QRCreateList(aReport, nil, MyTable, 'Country Listing', SomeFields);

  // Make the column header's font use bold attribute
  aReport.Bands.ColumnHeaderBand.Font.Style := [fsBold];

  // Now adjust the spacing of the fields.  There isn't any reason to
  // do this, this is just to show how to access the controls on the
  // report.

  for nIdx := 0 to aReport.Bands.ColumnHeaderBand.ControlCount -1 do
    if aReport.Bands.ColumnHeaderBand.Controls[nIdx] is TQRPrintable then
      with TQRPrintable(aReport.Bands.ColumnHeaderBand.Controls[nIdx]) do
        Left := Left - (5 * nIdx);

  for nIdx := 0 to aReport.Bands.DetailBand.ControlCount -1 do
    if aReport.Bands.DetailBand.Controls[nIdx] is TQRPrintable then
      with TQRPrintable(aReport.Bands.DetailBand.Controls[nIdx]) do
        Left := Left - (5 * nIdx);


  { You can change the report objects before calling the report }
//  areport.page.orientation := poLandscape;
  {preview or print the report}

  if sender = btnPreview then
  begin
    case cbPreview.ItemIndex of
      0: areport.preview;
      1: areport.previewModal;
      2: areport.previewModeless;
    end;
  end
  else if sender = btnPrint then
    areport.print;

  { all done, free the objects }
  aReport.Free;
  MyTable.Free;
  SomeFields.Free;
end;

procedure TfrmQR3Demo.QRCompositeReport1AddReports(Sender: TObject);
begin
  // The OnAddReports event is called by the CompositeReport
  // to add the reports to list of reports
  with QRCompositeReport1.Reports do
  begin
    Add(frmMasterDetail.QuickRep1);
    Add(frmBasicMD.QuickRep1);
    Add(frmImageRpt.QuickRep1);
  end;
end;

procedure TfrmQR3Demo.btnCRClick(Sender: TObject);
begin
  QRCompositeReport1.Preview;
end;

procedure TfrmQR3Demo.rbCreateListClick(Sender: TObject);
begin
  Report := CreateListReport;
end;

procedure TfrmQR3Demo.rbMasterDetailClick(Sender: TObject);
begin
  Report := frmMasterDetail.QuickRep1;
end;

procedure TfrmQR3Demo.FormCreate(Sender: TObject);
var i: integer;
begin
  // Get the current QuickReport version number from
  // the qrprntr unit
  i := pos(' ', cQRName);
  if i >=0 then
    VersionLbl.Caption := 'Version' + copy(cQRName, i, 99);
  // Create the report object used by the QRCreateList() function
  CreateListReport := TQuickRep.Create(self);
  CreateListReport.Description.Text := 'Example of how to call the QRCreateList function';
  cbPreview.ItemIndex := 0;
end;

procedure TfrmQR3Demo.FormActivate(Sender: TObject);
begin
  if Description.Lines.Count = 0 then
  begin
    rbCreateListClick(Self);
    rbCreateList.Checked := True;
  end;
end;

procedure TfrmQR3Demo.btnPreviewClick(Sender: TObject);
begin
  // This code is more complicated than what you would
  // typically need to run a report.  Most of this code
  // is to handle the selection of the various types of
  // reports.

  if report <> nil then
  begin
    if report = CreateListReport then
      CreateList(Sender)
    else if report = TCustomQuickRep(QRCompositeReport1) then
    begin
      if sender = btnPreview then
        QRCompositeReport1.preview
      else
        QRCompositeReport1.print;
    end
    else
    begin
      if sender = btnPreview then
      begin
        case cbPreview.ItemIndex of
          0: report.preview;
          1: report.previewModal;
          2: report.previewModeless;
        end;
      end
      else if sender = btnPrint then
        report.print;
    end;
  end;
end;

procedure TfrmQR3Demo.rbExprMemoClick(Sender: TObject);
begin
  Report := frmExprmemo.QuickRep1;
end;

procedure TfrmQR3Demo.rbImageClick(Sender: TObject);
begin
  Report := frmImageRpt.QuickRep1;
end;

procedure TfrmQR3Demo.rbBasicMDClick(Sender: TObject);
begin
  Report := frmBasicMD.QuickRep1;
end;

procedure TfrmQR3Demo.btnFiltersClick(Sender: TObject);
begin
  MessageDlg('When an export filter control is dropped on a form, it''s added to all of the previews',mtInformation, [mbok], 0);
end;

procedure TfrmQR3Demo.rbCompositeClick(Sender: TObject);
begin
  Report := TCustomQuickRep(QRCompositeReport1);
end;

procedure TfrmQR3Demo.rbNeedDataClick(Sender: TObject);
begin
  Report := frmNeedData.QuickRep1;
end;

procedure TfrmQR3Demo.rbFormLetterClick(Sender: TObject);
begin
  Report := frmFormLetter.QuickRep1;
end;

// The following code show how to explicitly call an export
// filter without going through the preview
procedure TfrmQR3Demo.btnExportClick(Sender: TObject);
begin
  btnExport.Enabled := False;
  with SaveDialog1 do
  begin
    if Execute then
    begin
      frmFormLetter.QuickRep1.ExportToFilter(TQRCommaSeparatedFilter.Create(FileName));
{
Other filters:
HTML: TQRHTMLDocumentFilter
ASCII: TQRAsciiExportFilter
CSV: TQRCommaSeparatedFilter

In Professional Version:
RTF: TQRRTFExportFilter
WMF: TQRWMFExportFilter
Excel: TQRXLSFilter
}
    end;
  end;
  btnExport.Enabled := True;
end;

procedure TfrmQR3Demo.rbAboutClick(Sender: TObject);
begin
  Report := frmHistory.QuickRep1;
end;

procedure TfrmQR3Demo.rbGroupingClick(Sender: TObject);
begin
  Report := frmGrouping.QuickRep1;
end;

end.
