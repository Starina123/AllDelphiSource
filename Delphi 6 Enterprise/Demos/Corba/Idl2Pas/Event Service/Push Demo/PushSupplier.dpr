program PushSupplier;

uses
  Forms,
  PushSupplierMain in 'PushSupplierMain.pas' {Form1},
  PushSupplier_Impl in 'PushSupplier_Impl.pas';

{$R *.RES}


begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
