program PullSupplierServer;

uses
  Forms,
  PullSupplierMain in 'PullSupplierMain.pas' {Form1},
  PullSupplier_Impl in 'PullSupplier_Impl.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
