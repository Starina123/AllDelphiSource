program XMLTransformProvider;

//----------------------------------------------------------------------------
//Borland Delphi
//Copyright (c) 2001 Borland International Inc. All Rights Reserved.
//----------------------------------------------------------------------------

uses
  Forms,
  XMLProvider in 'XMLProvider.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
