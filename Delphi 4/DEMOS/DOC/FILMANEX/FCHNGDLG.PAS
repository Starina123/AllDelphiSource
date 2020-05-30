unit FChngDlg;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TChangeDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    CurrentDir: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    ToFileName: TEdit;
    FromFileName: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChangeDlg: TChangeDlg;

implementation

{$R *.DFM}

end.
