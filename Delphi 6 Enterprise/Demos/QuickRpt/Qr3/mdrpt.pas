{ :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  :: QuickReport 3.0 for Delphi 3.0/4.0/5.0                  ::
  ::                                                         ::
  :: Master/Detail report with some extra code               ::
  ::                                                         ::
  :: Copyright (c) 1995-1999 QuSoft AS                       ::
  :: All Rights Reserved                                     ::
  ::                                                         ::
  :: web: http://www.qusoft.com  fax: +47 22 41 74 91        ::
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: }
unit mdrpt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, Db, DBTables, ExtCtrls;

type
  TfrmMasterDetail = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    dsCustomer: TDataSource;
    qryCustomer: TQuery;
    PageHeaderBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSubDetailOrders: TQRSubDetail;
    qryOrders: TQuery;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    dsOrders: TDataSource;
    qryItems: TQuery;
    QRSubDetailItems: TQRSubDetail;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRGroupCust: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShapeGray: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBOrderNo: TQRDBText;
    QRDBSalesDate: TQRDBText;
    GroupFooterBand1: TQRBand;
    procedure QRSubDetailOrdersBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetailItemsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupCustBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetailItemsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMasterDetail: TfrmMasterDetail;

implementation

{$R *.dfm}

procedure TfrmMasterDetail.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  // If there are no subdetails, then we print this band.  Otherwise we
  // let the group header print the controls from this band.  Group bands
  // can be reprinted on page breaks, which detail and subdetails can't do.
  qryOrders.First;
  PrintBand := qryOrders.EOF;

  // If it's our turn to print and the group band has our controls, then
  // we take them back.
  if PrintBand and (Sender.ControlCount = 0) then
    with QRGroupCust do
      while ControlCount > 0 do
        Controls[0].Parent := Sender;
end;

procedure TfrmMasterDetail.QRGroupCustBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  // We grab the detail band fields right from under it.
  if Sender.ControlCount = 0 then
    with DetailBand1 do
      While ControlCount > 0 do
        Controls[0].Parent := Sender;
end;

procedure TfrmMasterDetail.QRSubDetailOrdersBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  // We are print the order information on the first item subdetail
  // record.  If there are no item records, then we print the subdetail

  // Enable the order fields on the item subdetail band.  After they are
  // printed once, they will be disabled until the next order/item set
  QRDBOrderNo.Enabled := true;
  QRDBSalesDate.Enabled := QRDBOrderNo.Enabled;

  // Only allow this band to print if there are no subdetails
  qryItems.First;
  PrintBand := qryItems.EOF;
end;

procedure TfrmMasterDetail.QRSubDetailItemsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  // toggle the item background so that we can have alternating colors
  // like the greenbar paper we all know and love.
  with QRShapeGray.Brush do
    if Color = $00F0F0F0 then
      Color := $00E0E0E0
    else
      Color := $00F0F0F0;
end;

procedure TfrmMasterDetail.QRSubDetailItemsAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  // After we print it once, we disable the controls
  QRDBOrderNo.Enabled := false;
  QRDBSalesDate.Enabled := QRDBOrderNo.Enabled;
end;

procedure TfrmMasterDetail.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  // Re-enable the order fields on the item subdetail so that the order
  // information will be repeated after a page break
  QRDBOrderNo.Enabled := true;
  QRDBSalesDate.Enabled := QRDBOrderNo.Enabled;
end;

end.
