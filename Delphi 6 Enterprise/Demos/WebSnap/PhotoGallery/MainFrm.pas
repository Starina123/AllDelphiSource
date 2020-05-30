unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TMainForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses ComApp;

{$R *.dfm}

const
  CLASS_ComWebApp: TGUID = '{4DEB0139-71E5-4867-9F9D-AC910CD15169}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'PhotoGalleryTestSvr', 'PhotoGallery Object');

end.
 