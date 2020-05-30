program Word8Auto;

uses
  Forms,
  WordAuto in 'WordAuto.pas' {Form1},
  Word97 in 'Word97.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
