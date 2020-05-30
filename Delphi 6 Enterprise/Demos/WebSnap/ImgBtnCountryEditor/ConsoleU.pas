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
  CLASS_ComWebApp: TGUID = '{DDAD26FE-C421-4CAE-8FBF-771A1DFC1283}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'ImgBtnCountryEditorTestSvr', 'ImgBtnCountryEditorTestSvr Object');

end.
