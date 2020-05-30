program Filter;

uses
  Forms,
  DM in 'DM.pas' {DM1},
  CustView in 'CustView.pas' {fmCustView},
  About in 'About.pas' {fmAboutBox},
  Filter1 in 'Filter1.pas' {fmFilterFrm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmCustView, fmCustView);
  Application.CreateForm(TDM1, DM1);
  Application.CreateForm(TfmFilterFrm, fmFilterFrm);
  Application.Run;
end.
