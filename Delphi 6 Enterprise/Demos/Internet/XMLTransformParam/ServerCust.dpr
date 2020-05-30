program ServerCust;

uses
  Forms,
  ServerUnitCust1 in 'ServerUnitCust1.pas' {Form1},
  ServerCust_TLB in 'ServerCust_TLB.pas',
  SeverUnitCust2 in 'SeverUnitCust2.pas' {Customer_MinMax: TRemoteDataModule} {Customer_MinMax: CoClass};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
