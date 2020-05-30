unit MainFrm;

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
  CLASS_ComWebApp: TGUID = '{59584008-4BD5-4A83-B3DB-7237866A3347}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'WebMail', 'WebMail Object');

end.
