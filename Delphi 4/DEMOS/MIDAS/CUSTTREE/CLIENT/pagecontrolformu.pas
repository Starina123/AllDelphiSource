unit PageControlFormU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls;

type
  TPageControlForm = class(TForm)
    ViewPageControl: TPageControl;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PageControlForm: TPageControlForm;

implementation

{$R *.DFM}

end.
