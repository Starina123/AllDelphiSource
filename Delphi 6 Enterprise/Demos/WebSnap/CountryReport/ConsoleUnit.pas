unit ConsoleUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm5 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses ComApp;

{$R *.dfm}

const
  CLASS_ComWebApp: TGUID = '{B5D9AAB5-ECD4-11D4-A54F-00C04F6BB853}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'CountryReportTestSvr', 'CountryReport Object');

end.
