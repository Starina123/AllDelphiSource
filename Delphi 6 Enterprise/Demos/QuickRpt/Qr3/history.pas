{ :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  :: QuickReport 3.0 for Delphi 3.0/4.0/5.0                  ::
  ::                                                         ::
  :: Simple report for print the contents of a stringlist    ::
  ::                                                         ::
  :: Copyright (c) 1995-1999 QuSoft AS                       ::
  :: All Rights Reserved                                     ::
  ::                                                         ::
  :: web: http://www.qusoft.com  fax: +47 22 41 74 91        ::
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: }
unit history;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  TfrmHistory = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRMemo1: TQRMemo;
    PageHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistory: TfrmHistory;

implementation

{$R *.dfm}

end.
