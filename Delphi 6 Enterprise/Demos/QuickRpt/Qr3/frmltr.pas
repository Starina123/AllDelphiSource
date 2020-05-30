{ :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  :: QuickReport 3.0 for Delphi 3.0/4.0/5.0                  ::
  ::                                                         ::
  :: Simple report for doing a form letter                   ::
  ::                                                         ::
  :: Copyright (c) 1995-1999 QuSoft AS                       ::
  :: All Rights Reserved                                     ::
  ::                                                         ::
  :: web: http://www.qusoft.com  fax: +47 22 41 74 91        ::
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: }
unit frmltr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, QuickRpt, Qrctrls;

type
  TfrmFormLetter = class(TForm)
    QuickRep1: TQuickRep;
    qryEmployee: TQuery;
    DetailBand1: TQRBand;
    qryEmployeeEmpNo: TIntegerField;
    qryEmployeeLastName: TStringField;
    qryEmployeeFirstName: TStringField;
    qryEmployeePhoneExt: TStringField;
    qryEmployeeHireDate: TDateTimeField;
    qryEmployeeSalary: TFloatField;
    QRExprMemo1: TQRExprMemo;
    PageHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
    FirstDetail: boolean;
  public
    { Public declarations }
  end;

var
  frmFormLetter: TfrmFormLetter;

implementation

{$R *.dfm}

procedure TfrmFormLetter.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if FirstDetail then
    FirstDetail := False
  else
    QuickRep1.NewPage;
end;

procedure TfrmFormLetter.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  FirstDetail := True;
end;

end.
