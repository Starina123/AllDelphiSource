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
  CLASS_ComWebApp: TGUID = '{E5409787-B66B-4914-871D-79A0B80404FB}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'MasterDetailTest', 'MasterDetailTest Object');

end.
