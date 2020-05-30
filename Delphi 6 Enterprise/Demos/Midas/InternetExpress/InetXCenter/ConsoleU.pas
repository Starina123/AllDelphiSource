unit ConsoleU;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm2 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses ComApp;

{$R *.DFM}

const
  CLASS_ComWebApp: TGUID = '{C5006C58-DBE3-419D-A7B4-1E16F7AC591C}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'inetxcustomtestsvr', 'inetxcustomtestsvr Object');

end.
