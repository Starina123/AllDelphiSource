{ :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  :: QuickReport 3.0 for Delphi 3.0/4.0/5.0                  ::
  ::                                                         ::
  :: Demo report that is populated by the OnNeedData event   ::
  ::                                                         ::
  :: Copyright (c) 1995-1999 QuSoft AS                       ::
  :: All Rights Reserved                                     ::
  ::                                                         ::
  :: web: http://www.qusoft.com  fax: +47 22 41 74 91        ::
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: }
unit needdata;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TfrmNeedData = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    TitleBand1: TQRBand;
    QRSysData1: TQRSysData;
    procedure FormCreate(Sender: TObject);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
  private
    { Private declarations }
    SomeList: TStringlist;
    CurrentIndex: integer;
  public
    { Public declarations }
  end;

var
  frmNeedData: TfrmNeedData;

implementation

{$R *.dfm}

procedure TfrmNeedData.FormCreate(Sender: TObject);
var
  i: integer;
begin
  SomeList := TStringlist.Create;

  for i := 0 to 500 do
    SomeList.Add('Line ' + IntToStr(i));
end;

procedure TfrmNeedData.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  // You must reset your data in the BeforePrint event
  // or when you print from the preview, the report will
  // start with the last value(s)
  CurrentIndex := 0;
end;

procedure TfrmNeedData.QuickRep1NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  // If MoreData is true, then QuickReport will print
  // another detail band.  When you set it to false,
  // the report is done.  

  MoreData := (CurrentIndex < SomeList.Count);

  if MoreData then
  begin
    QRLabel1.Caption := SomeList[CurrentIndex];

    // Here's how to set the progress bar
    QuickRep1.QRPrinter.Progress := (Longint(CurrentIndex) * 100) div SomeList.Count;
  end
  else
    QuickRep1.QRPrinter.Progress := 100;

  Inc(CurrentIndex);
end;

end.
