{***************************************************************
 *
 * Project  : fingerclient
 * Unit Name: main
 * Purpose  : Demonstrates a bacic FINGER request
 * Date  : 21/01/2001  -  13:10:09
 * History  :
 *
 ****************************************************************}

unit main;

interface

uses
  {$IFDEF Linux}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons,
  {$ELSE}
  windows, messages, graphics, controls, forms, dialogs, stdctrls, buttons,
  {$ENDIF}
  SysUtils, Classes, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdFinger;

type
  TfrmFingerDemo = class(TForm)
  IdFngFinger: TIdFinger;
  edtQuerry: TEdit;
  lblQuerry: TLabel;
  mmoQuerryResults: TMemo;
  lblInstructions: TLabel;
  chkVerboseQuerry: TCheckBox;
  bbtnQuerry: TBitBtn;
  procedure bbtnQuerryClick(Sender: TObject);
  private
  public
  end;

var
  frmFingerDemo: TfrmFingerDemo;

implementation
{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

procedure TfrmFingerDemo.bbtnQuerryClick(Sender: TObject);
begin
  {Set the Query string for the Finger from the text entered}
  IdFngFinger.CompleteQuery := edtQuerry.Text;
  {Do we want verbose query - not supported on many systems}
  IdFngFinger.VerboseOutput := chkVerboseQuerry.Checked;
  {Do our query with the Finger function}
  mmoQuerryResults.Lines.Text := IdFngFinger.Finger;
end;

end.
