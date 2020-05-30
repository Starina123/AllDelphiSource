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
  CLASS_ComWebApp: TGUID = '{0CAEBB39-AE95-44DE-8E93-3D0CD01933DB}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'XMLBiolifeTestSvr', 'XMLBiolifeTestSvr Object');

end.
