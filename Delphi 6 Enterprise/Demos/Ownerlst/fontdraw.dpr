program Fontdraw;

uses
  Forms,
  Fontlist in 'FONTLIST.PAS' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
