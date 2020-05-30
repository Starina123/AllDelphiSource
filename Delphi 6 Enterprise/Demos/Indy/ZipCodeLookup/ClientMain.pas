{***************************************************************
 *
 * Project  : WSZipCodeClient
 * Unit Name: ClientMain
 * Purpose  : Demonstrates using TCPClient to lookup ZIP codes
 * Version  : 1.0
 * Date  : Wed 25 Apr 2001  -  01:47:23
 * Author  : <unknown>
 * History  :
 * Tested  : Wed 25 Apr 2001  // Allen O'Neill <allen_oneill@hotmail.com> 
 *
 ****************************************************************}

unit ClientMain;

interface

uses
  {$IFDEF Linux}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls,
  {$ELSE}
  windows, messages, graphics, controls, forms, dialogs, stdctrls, extctrls,
  {$ENDIF}
  SysUtils, Classes, IdAntiFreezeBase,
  IdAntiFreeze, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient;

type
  TformMain = class(TForm)
  Panel1: TPanel;
  Panel2: TPanel;
  memoInput: TMemo;
  lboxResults: TListBox;
  Panel3: TPanel;
  butnLookup: TButton;
  butnClear: TButton;
  Label1: TLabel;
  Client: TIdTCPClient;
  IdAntiFreeze1: TIdAntiFreeze;
  procedure butnClearClick(Sender: TObject);
  procedure butnLookupClick(Sender: TObject);
  private
  public
  end;

var
  formMain: TformMain;

implementation
{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

procedure TformMain.butnClearClick(Sender: TObject);
begin
  memoInput.Clear;
  lboxResults.Clear;
end;

procedure TformMain.butnLookupClick(Sender: TObject);
var
  i: integer;
  s: string;
begin
  butnLookup.Enabled := true; try
  lboxResults.Clear;
  with Client do begin
  Connect; try
  lboxResults.Items.Add(ReadLn);
  for i := 0 to memoInput.Lines.Count - 1 do begin
  WriteLn('ZipCode ' + memoInput.Lines[i]);
  lboxResults.Items.Add(memoInput.Lines[i]);

  s := ReadLn;
  if s = '' then begin
  s := '-- No entry found for this zip code.';
  end;
  lboxResults.Items.Add(s);

  lboxResults.Items.Add('');
  end;
  WriteLn('Quit');
  finally Disconnect; end;
  end;
  finally butnLookup.Enabled := true; end;
end;

end.
