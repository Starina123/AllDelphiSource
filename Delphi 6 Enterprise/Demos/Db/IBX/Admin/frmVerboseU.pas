unit frmVerboseU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfrmVerbose = class(TForm)
    stbStatusBar: TStatusBar;
    edOutput: TRichEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmVerbose.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
