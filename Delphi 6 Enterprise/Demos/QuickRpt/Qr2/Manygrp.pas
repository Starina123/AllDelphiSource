unit Manygrp;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, quickrpt, Qrctrls, DBTables, DB, ExtCtrls;

type
  TManyGrpForm = class(TForm)
    QuickRep: TQuickRep;
    RepQuery: TQuery;
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRGroup2: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRDBText4: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText5: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    RepQueryCustNo: TFloatField;
    RepQueryCompany: TStringField;
    RepQueryAddr1: TStringField;
    RepQueryAddr2: TStringField;
    RepQueryCity: TStringField;
    RepQueryState: TStringField;
    RepQueryZip: TStringField;
    RepQueryCountry: TStringField;
    RepQueryPhone: TStringField;
    RepQueryFAX: TStringField;
    RepQueryTaxRate: TFloatField;
    RepQueryContact: TStringField;
    RepQueryLastInvoiceDate: TDateTimeField;
    RepQueryOrderNo: TFloatField;
    RepQueryCustNo_1: TFloatField;
    RepQuerySaleDate: TDateTimeField;
    RepQueryShipDate: TDateTimeField;
    RepQueryEmpNo: TIntegerField;
    RepQueryShipToContact: TStringField;
    RepQueryShipToAddr1: TStringField;
    RepQueryShipToAddr2: TStringField;
    RepQueryShipToCity: TStringField;
    RepQueryShipToState: TStringField;
    RepQueryShipToZip: TStringField;
    RepQueryShipToCountry: TStringField;
    RepQueryShipToPhone: TStringField;
    RepQueryShipVIA: TStringField;
    RepQueryPO: TStringField;
    RepQueryTerms: TStringField;
    RepQueryPaymentMethod: TStringField;
    RepQueryItemsTotal: TCurrencyField;
    RepQueryTaxRate_1: TFloatField;
    RepQueryFreight: TCurrencyField;
    RepQueryAmountPaid: TCurrencyField;
    RepQueryOrderNo_1: TFloatField;
    RepQueryItemNo: TFloatField;
    RepQueryPartNo: TFloatField;
    RepQueryQty: TIntegerField;
    RepQueryDiscount: TFloatField;
    RepQueryPartNo_1: TFloatField;
    RepQueryVendorNo: TFloatField;
    RepQueryDescription: TStringField;
    RepQueryOnHand: TFloatField;
    RepQueryOnOrder: TFloatField;
    RepQueryCost: TCurrencyField;
    RepQueryListPrice: TCurrencyField;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel5: TQRLabel;
    ChildBand1: TQRChildBand;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ManyGrpForm: TManyGrpForm;

implementation

{$R *.dfm}

end.
