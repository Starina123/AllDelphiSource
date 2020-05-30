unit GdsStd;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TGDSStdForm = class(TForm)
    GDSStdPanel: TPanel;
    GDSStdImage: TImage;
    GDSLabel: TLabel;
    GDSLabel2: TLabel;
    GDSSloganLabel: TLabel;
    GDSSloganLabel2: TLabel;
    ImageBevel: TBevel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GDSStdForm: TGDSStdForm;

implementation

{$R *.dfm}

end.
