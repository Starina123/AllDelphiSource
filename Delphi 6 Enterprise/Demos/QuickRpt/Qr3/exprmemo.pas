{ :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  :: QuickReport 3.0 for Delphi 3.0/4.0/5.0                  ::
  ::                                                         ::
  :: Demonstration on how to use the TQRExprMemo control     ::
  ::                                                         ::
  :: Copyright (c) 1995-1999 QuSoft AS                       ::
  :: All Rights Reserved                                     ::
  ::                                                         ::
  :: web: http://www.qusoft.com  fax: +47 22 41 74 91        ::
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: }
unit exprmemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, Db, DBTables, ExtCtrls;

type
  TfrmExprmemo = class(TForm)
    QuickRep1: TQuickRep;
    tbCustomer: TTable;
    DetailBand1: TQRBand;
    tbCustomerCustNo: TFloatField;
    tbCustomerCompany: TStringField;
    tbCustomerAddr1: TStringField;
    tbCustomerAddr2: TStringField;
    tbCustomerCity: TStringField;
    tbCustomerState: TStringField;
    tbCustomerZip: TStringField;
    tbCustomerCountry: TStringField;
    tbCustomerPhone: TStringField;
    tbCustomerFAX: TStringField;
    tbCustomerTaxRate: TFloatField;
    tbCustomerContact: TStringField;
    tbCustomerLastInvoiceDate: TDateTimeField;
    QRExprMemo1: TQRExprMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExprmemo: TfrmExprmemo;

implementation

{$R *.dfm}

end.
