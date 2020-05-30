program Word8Auto;

uses
  Forms,
  WordAuto in 'WordAuto.pas' {Form1},
  AutoImpl in 'AutoImpl.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
