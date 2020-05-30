unit ConsoleU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TConsole = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Console: TConsole;

implementation

uses ComApp;

{$R *.dfm}

const
  CLASS_ComWebApp: TGUID = '{00A581F6-ED6A-11D4-A551-00C04F6BB853}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'SimpleAdapterTestSvr', 'SimpleAdapterTestSvr Object');

end.
