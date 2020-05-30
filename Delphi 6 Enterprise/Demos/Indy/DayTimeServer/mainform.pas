{***************************************************************
 *
 * Project  : DayTimeServer
 * Unit Name: mainform
 * Purpose  : Demonstrates the use of DayTimeServer ... objective is simply to issue the current
 *  date and time to any client who connects. All functionality is inbuilt into component
 * Date  : 21/01/2001  -  12:52:02
 * History  :
 *
 ****************************************************************}

unit mainform;

interface

uses
  {$IFDEF Linux}
  QForms, QControls, QGraphics, QDialogs,
  {$ELSE}
  windows, messages, graphics, controls, forms, dialogs,
  {$ENDIF}
  SysUtils, Classes, 
  IdComponent, IdTCPServer, IdDayTimeServer, IdBaseComponent;

type
  TfrmMain = class(TForm)
  IdDayTimeServer1: TIdDayTimeServer;
  procedure FormActivate(Sender: TObject);
  private
  public
  end;

var
  frmMain: TfrmMain;

implementation
{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

// No Code required - DayTimeServer is functional as is.
 procedure TfrmMain.FormActivate(Sender: TObject);
begin
  try
  IdDayTimeServer1.Active := True;
  except
  ShowMessage('Permission Denied. Cannot bind reserved port due to security reasons');
  Application.Terminate;
  end;
end;


end.
