{***************************************************************
 *
 * Project  : Proxy
 * Unit Name: Main
 * Purpose  : Demonstrates using mapped port component to create a simple proxy server
 * Version  : 1.0
 * Date  : Wed 25 Apr 2001  -  01:54:50
 * Author  : <unknown>
 * History  :
 * Tested  : Wed 25 Apr 2001  // Allen O'Neill <allen_oneill@hotmail.com> 
 *
 ****************************************************************}

unit Main;

interface

uses
  {$IFDEF Linux}
  QControls, QStdCtrls, QGraphics, QForms, QDialogs,
  {$ELSE}
  windows, messages, graphics, controls, forms, dialogs, stdctrls,
  {$ENDIF}
  SysUtils, Classes, IdBaseComponent, IdComponent, IdTCPServer, IdMappedPortTCP;


type
  TForm1 = class(TForm)
  Memo1: TMemo;
  IdMappedPortTCP1 : TIdMappedPortTCP;
  private
  public
  end;

var
  Form1: TForm1;

implementation
{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

end.
