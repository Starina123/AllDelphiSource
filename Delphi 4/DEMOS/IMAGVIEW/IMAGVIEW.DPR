program Imagview;

uses
  Forms,
  Imagewin in 'IMAGEWIN.PAS' {ImageForm},
  Viewwin in 'VIEWWIN.PAS' {ViewForm};

{$R *.RES}

begin
  Application.CreateForm(TImageForm, ImageForm);
  Application.CreateForm(TViewForm, ViewForm);
  Application.Run;
end.
