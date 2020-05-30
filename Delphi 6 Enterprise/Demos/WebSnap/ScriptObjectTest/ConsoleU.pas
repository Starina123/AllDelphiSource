unit ConsoleU;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ComApp;

{$R *.dfm}

const
  CLASS_ComWebApp: TGUID = '{A2821FF2-D2E8-4F7C-ABA7-A3E65A9656AD}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'ScriptObjectTestSvr', 'ScriptObjectTestSvr Object');

end.
