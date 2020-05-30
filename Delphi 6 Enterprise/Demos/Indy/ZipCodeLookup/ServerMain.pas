{***************************************************************
 *
 * Project  : WSZipCodeServer
 * Unit Name: ServerMain
 * Purpose  : Demonstrates serving Address informaiton data back to client after query on ZIP code
 * Version  : 1.0
 * Date  : Wed 25 Apr 2001  -  01:48:02
 * Author  : <unknown>
 * History  :
 * Tested  : Wed 25 Apr 2001  // Allen O'Neill <allen_oneill@hotmail.com> 
 *
 ****************************************************************}


unit ServerMain;

interface

uses
  {$IFDEF Linux}
  QControls, QGraphics, QForms, QDialogs,
  {$ELSE}
  windows, messages, graphics, controls, forms, dialogs,
  {$ENDIF}
  SysUtils, Classes, IdBaseComponent, IdComponent, IdTCPServer;

type
  TformMain = class(TForm)
  IdTCPServer1: TIdTCPServer;
  procedure FormCreate(Sender: TObject);
  procedure FormDestroy(Sender: TObject);
  procedure IdTCPServer1Connect(AThread: TIdPeerThread);
  procedure IdTCPServer1Execute(AThread: TIdPeerThread);
  private
  ZipCodeList: TStrings;
  public
  end;

var
  formMain: TformMain;

implementation
{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

procedure TformMain.FormCreate(Sender: TObject);
begin
  ZipCodeList := TStringList.Create;
  ZipCodeList.LoadFromFile(ExtractFilePath(Application.EXEName) + 'ZipCodes.dat');
end;

procedure TformMain.FormDestroy(Sender: TObject);
begin
  ZipCodeList := nil;
  ZipCodeList.Free;
end;

procedure TformMain.IdTCPServer1Connect(AThread: TIdPeerThread);
begin
  AThread.Connection.WriteLn('Indy Zip Code Server Ready.');
end;

procedure TformMain.IdTCPServer1Execute(AThread: TIdPeerThread);
var
  sCommand: string;
begin
  with AThread.Connection do begin
  sCommand := ReadLn;
  if SameText(sCommand, 'QUIT') then begin
  Disconnect;
  end else if SameText(Copy(sCommand, 1, 8), 'ZipCode ') then begin
  WriteLn(ZipCodeList.Values[Copy(sCommand, 9, MaxInt)]);
  end;
  end;
end;

end.
