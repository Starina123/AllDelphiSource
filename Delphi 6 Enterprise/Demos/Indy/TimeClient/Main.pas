{***************************************************************
 *
 * Project  : TimeDemo
 * Unit Name: Main
 * Purpose  : Demonstrates a DateTime client getting current date and time from remote DateTimeServer
 * Date  : 21/01/2001  -  12:55:37
 * History  :
 *
 ****************************************************************}

unit Main;

// A list of time servers is available at:
// http://www.eecis.udel.edu/~mills/ntp/servers.html

interface

uses
  {$IFDEF Linux}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls,
  {$ELSE}
  windows, messages, graphics, controls, forms, dialogs, stdctrls,
  {$ENDIF}
  SysUtils, Classes, IdComponent, IdTCPConnection, IdTCPClient, IdTime,
  IdBaseComponent;

type
  TfrmTimeDemo = class(TForm)
  lblTimeServer: TLabel;
  IdDemoTime: TIdTime;
  edtTimeResult: TEdit;
  Label1: TLabel;
  btnGetTime: TButton;
  cmboTimeServer: TComboBox;
  procedure btnGetTimeClick(Sender: TObject);
  private
  public
  end;

var
  frmTimeDemo: TfrmTimeDemo;

implementation
{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

// No real code required - all functionality built into component !
procedure TfrmTimeDemo.btnGetTimeClick(Sender: TObject);
begin
  IdDemoTime.Host := cmboTimeServer.Text;
  { After setting Host, this is all you have to get the time from a time
  server.  We do the rest. }
  edtTimeResult.Text := DateTimeToStr ( IdDemoTime.DateTime );
end;

end.
