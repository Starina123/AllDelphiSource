{*******************************************************}
{                                                       }
{      Copyright (C) 1999-2000 Inprise Corporation      }
{                                                       }
{*******************************************************}
program Client;

uses
  Forms,
  ClientMain in 'ClientMain.pas' {Form1},
  employee_c in 'employee_c.pas',
  employee_i in 'employee_i.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
