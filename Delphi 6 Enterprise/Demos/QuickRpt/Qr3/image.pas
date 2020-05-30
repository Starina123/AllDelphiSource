{ :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  :: QuickReport 3.0 for Delphi 3.0/4.0/5.0                  ::
  ::                                                         ::
  :: Simple report with graphics                             ::
  ::                                                         ::
  :: Copyright (c) 1995-1999 QuSoft AS                       ::
  :: All Rights Reserved                                     ::
  ::                                                         ::
  :: web: http://www.qusoft.com  fax: +47 22 41 74 91        ::
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: }
unit image;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, Db, DBTables, ExtCtrls;

type
  TfrmImageRpt = class(TForm)
    QuickRep1: TQuickRep;
    tbBio: TTable;
    DetailBand1: TQRBand;
    tbBioSpeciesNo: TFloatField;
    tbBioCategory: TStringField;
    tbBioCommon_Name: TStringField;
    tbBioSpeciesName: TStringField;
    tbBioLengthcm: TFloatField;
    tbBioLength_In: TFloatField;
    tbBioNotes: TMemoField;
    tbBioGraphic: TGraphicField;
    QRDBText1: TQRDBText;
    QRDBImage1: TQRDBImage;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImageRpt: TfrmImageRpt;

implementation

{$R *.dfm}

end.
