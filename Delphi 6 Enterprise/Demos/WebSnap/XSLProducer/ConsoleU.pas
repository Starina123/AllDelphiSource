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
  CLASS_ComWebApp: TGUID = '{41EE7895-C63B-4783-9E47-A7ABEAA43737}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'XSLPageProducerTest', 'XSLPageProducerTest Object');

end.
