program Mastapp;

uses
  Forms,
  Main in 'MAIN.PAS' {MainForm},
  Brparts in 'BRPARTS.PAS' {BrPartsForm},
  QryCust in 'QryCust.pas' {QueryCustDlg},
  Edparts in 'EDPARTS.PAS' {EdPartsForm},
  BrCstOrd in 'BrCstOrd.pas' {BrCustOrdForm},
  Edcust in 'EDCUST.PAS' {EdCustForm},
  Edorders in 'EDORDERS.PAS' {EdOrderForm},
  SrchDlg in 'SrchDlg.pas' {SearchDlg},
  Splash in 'SPLASH.PAS' {SplashForm},
  Pickdate in 'PICKDATE.PAS' {BrDateForm},
  About in 'ABOUT.PAS' {AboutBox},
  Pickrep in 'PICKREP.PAS' {PickRpt},
  CustRpt in 'CustRpt.pas' {CustomerByInvoiceReport: TQuickRep},
  OrderRpt in 'OrderRpt.pas' {OrdersByDateReport: TQuickRep},
  InvcRpt in 'InvcRpt.pas' {InvoiceByOrderNoReport: TQuickRep},
  PickInvc in 'PickInvc.pas' {PickOrderNoDlg},
  DataMod in 'DataMod.pas' {MastData: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  SplashForm := TSplashForm.Create(Application);
  SplashForm.Show;
  SplashForm.Update;
  Application.Title := 'Marine Adventures Order Entry';
  Application.HelpFile := 'MASTAPP.HLP';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TBrPartsForm, BrPartsForm);
  Application.CreateForm(TQueryCustDlg, QueryCustDlg);
  Application.CreateForm(TEdPartsForm, EdPartsForm);
  Application.CreateForm(TBrCustOrdForm, BrCustOrdForm);
  Application.CreateForm(TEdCustForm, EdCustForm);
  Application.CreateForm(TEdOrderForm, EdOrderForm);
  Application.CreateForm(TSearchDlg, SearchDlg);
  Application.CreateForm(TBrDateForm, BrDateForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TPickRpt, PickRpt);
  Application.CreateForm(TCustomerByInvoiceReport, CustomerByInvoiceReport);
  Application.CreateForm(TOrdersByDateReport, OrdersByDateReport);
  Application.CreateForm(TInvoiceByOrderNoReport, InvoiceByOrderNoReport);
  Application.CreateForm(TPickOrderNoDlg, PickOrderNoDlg);
  Application.CreateForm(TMastData, MastData);
  SplashForm.Hide;
  SplashForm.Free;
  Application.Run;
end.
