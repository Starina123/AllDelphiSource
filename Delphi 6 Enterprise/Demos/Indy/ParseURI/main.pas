{***************************************************************
 *
 * Project  : ParseURI
 * Unit Name: main
 * Purpose  : Demonstrates the URL parser component
 * Date  : 21/01/2001  -  14:38:56
 * History  :
 *
 ****************************************************************}

unit main;

interface

uses
  {$IFDEF Linux}
  QControls, QGraphics, QForms, QDialogs, QStdCtrls,
  {$ELSE}
  windows, messages, graphics, controls, forms, dialogs, stdctrls,
  {$ENDIF}
  SysUtils, Classes;

type
  TfrmDemo = class(TForm)
  edtURI: TEdit;
  edtProtocol: TEdit;
  edtHost: TEdit;
  edtPort: TEdit;
  lblProtocol: TLabel;
  lblHost: TLabel;
  lblPort: TLabel;
  lblPath: TLabel;
  lblDocument: TLabel;
  edtPath: TEdit;
  edtDocument: TEdit;
  btnDoIt: TButton;
  lblURI: TLabel;
  lblInstructions: TLabel;
  procedure btnDoItClick(Sender: TObject);
  private
  { Private declarations }
  public
  { Public declarations }
  end;

var
  frmDemo: TfrmDemo;

implementation
uses  IdURI;

{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

procedure TfrmDemo.btnDoItClick(Sender: TObject);
var URI : TIdURI;
begin
  URI := TIdURI.Create(edtURI.Text);
  try
  edtProtocol.Text := URI.Protocol;
  edtHost.Text := URI.Host;
  edtPort.Text := URI.Port;
  edtPath.Text := URI.Path;
  edtDocument.Text := URI.Document;
  finally
  URI.Free;
  end;
end;

end.
