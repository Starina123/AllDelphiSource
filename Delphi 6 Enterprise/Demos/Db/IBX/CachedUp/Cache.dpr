program Cache;

uses
  Forms,
  CachedUp in 'CachedUp.pas' {CacheDemoForm},
  About in 'About.pas' {AboutDialog},
  ErrForm in 'Errform.pas' {UpdateErrorForm},
  DataMod in 'DataMod.pas' {CacheData: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TCacheData, CacheData);
  Application.CreateForm(TCacheDemoForm, CacheDemoForm);
  Application.CreateForm(TUpdateErrorForm, UpdateErrorForm);
  Application.Run;
end.
