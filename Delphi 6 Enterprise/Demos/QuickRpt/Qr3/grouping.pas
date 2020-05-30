{ :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  :: QuickReport 3.0 for Delphi 3.0/4.0/5.0                  ::
  ::                                                         ::
  :: Simple report for grouping data                         ::
  ::                                                         ::
  :: Copyright (c) 1995-1999 QuSoft AS                       ::
  :: All Rights Reserved                                     ::
  ::                                                         ::
  :: web: http://www.qusoft.com  fax: +47 22 41 74 91        ::
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: }
unit grouping;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, QuickRpt, Qrctrls;

type
  TfrmGrouping = class(TForm)
    QuickRep1: TQuickRep;
    MasterQry: TQuery;
    MasterQrycompany: TStringField;
    MasterQryorderno: TFloatField;
    MasterQrycustno: TFloatField;
    MasterQryItemsTotal: TCurrencyField;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText4: TQRDBText;
    DataSource1: TDataSource;
    DetailQry: TQuery;
    DetailQryOrderNo: TFloatField;
    DetailQryQty: TIntegerField;
    DetailQryItemNo: TFloatField;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRBand2: TQRBand;
    QRExpr2: TQRExpr;
    SummaryBand1: TQRBand;
    QRExpr3: TQRExpr;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrouping: TfrmGrouping;

implementation

{$R *.dfm}

end.
