unit ConsoleU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

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
  CLASS_ComWebApp: TGUID = '{93D07168-FD34-11D4-A564-00C04F6BB853}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'InternetExpressTest', 'InternetExpressTest Object');

end.
