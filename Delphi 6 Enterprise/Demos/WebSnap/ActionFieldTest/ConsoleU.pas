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

{$R *.DFM}

const
  CLASS_ComWebApp: TGUID = '{3584E220-4B49-4997-AEC9-4D38C1000F37}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'ActionFieldTest', 'ActionFieldTest Object');

end.
