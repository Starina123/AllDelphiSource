{***************************************************************
 *
 * Project  : QotdClient
 * Unit Name: main
 * Purpose  : Quote of the day client
 * Version  : 1.0
 * Date  : Wed 25 Apr 2001  -  01:31:32
 * Author  : <unknown>
 * History  :
 * Tested  : Wed 25 Apr 2001  // Allen O'Neill <allen_oneill@hotmail.com> 
 *
 ****************************************************************}

unit main;

interface

uses
  {$IFDEF Linux}
  QForms, QDialogs, QControls, QGraphics, QStdCtrls,
  {$ELSE}
  windows, messages, graphics, controls, forms, dialogs, stdctrls,
  {$ENDIF}
  SysUtils, Classes, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdQotd;

type
  TfrmQuoteOfTheDayDemo = class(TForm)
  mmoQuoteOfTheDay: TMemo;
  lblServer: TLabel;
  edtQuoteDayServer: TEdit;
  lblQuote: TLabel;
  btnQuote: TButton;
  IdQtdDemo: TIdQOTD;
  procedure btnQuoteClick(Sender: TObject);
  private
  public
  end;

var
  frmQuoteOfTheDayDemo: TfrmQuoteOfTheDayDemo;

implementation
{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

procedure TfrmQuoteOfTheDayDemo.btnQuoteClick(Sender: TObject);
begin
  IdQtdDemo.Host := edtQuoteDayServer.Text;
  {Get the quote of the day}
  mmoQuoteOfTheDay.Lines.Text := IdQtdDemo.Quote;
end;

end.
