{***************************************************************
 *
 * Project  : TCPStreamServer
 * Unit Name: ServerMain
 * Purpose  : Indy TCP Stream Server Demo
 * Version  : 1.0
 * Date  : October 6, 2000
 * Author  : Don Siders  <sidersd@att.net>
 * History  :
 * Tested  : Wed 25 Apr 2001  // Allen O'Neill <allen_oneill@hotmail.com>
 *
 ****************************************************************}

unit ServerMain;

interface

uses
{$IFDEF Linux}
   QGraphics,  QControls,  QForms,  QDialogs,  QStdCtrls,
{$ELSE}
   Graphics,  Controls,  Forms,  Dialogs,  StdCtrls,
{$ENDIF}
  windows, messages,  SysUtils,  Classes, IdBaseComponent, IdComponent,
  IdTCPServer, IdThreadMgr, IdThreadMgrPool;

{
  ** NOTES **

  OnExecute sends a HELLO message to the client and waits for a command.

  OnExecute handles the client command OUTLINE by writing hard-coded data
  using WriteStream.

  OnExecute disconnects prior to exiting.

  Displays a connection count for the number of running threads.
  Displays a request count for the number of connections requested.
}

type
  TForm1 = class(TForm)
    TCPServer: TIdTCPServer;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure TCPServerExecute(AThread: TIdPeerThread);
  private
    FConnectionCount: Integer;
    FRequestCount: Integer;
  public
    procedure IncrConnectionCount;
    procedure DecrConnectionCount;
  end;

var
  Form1: TForm1;

implementation
{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

procedure TForm1.FormCreate(Sender: TObject);
begin
  TCPServer.Active := True;
end;

procedure TForm1.TCPServerExecute(AThread: TIdPeerThread);
var
  SRequest: string;
  SOutline: string;
  AStream: TStringStream;

const
  EOL: string = #13#10;

begin
  with AThread.Connection do
  begin
    AThread.Synchronize(IncrConnectionCount);

    WriteLn('Hello from Indy TCP Stream Server.');

    try
      SRequest := UpperCase(ReadLn);

      if SRequest = 'OUTLINE' then
      begin
        SOutline :=
          'Level 1' + EOL +
          ' Level 1.1' + EOL +
          ' Level 1.2' + EOL +
          'Level 2' + EOL +
          ' Level 2.1' + EOL +
          ' Level 2.2' + EOL +
          'Level 3' + EOL +
          ' Level 3.1' + EOL +
          ' Level 3.2' + EOL +
          'Level 4' + EOL +
          ' Level 4.1' + EOL +
          ' Level 4.2' + EOL +
          'Level 5' + EOL +
          ' Level 5.1' + EOL +
          ' Level 5.2' + EOL +
          'Level 6' + EOL +
          ' Level 6.1' + EOL +
          ' Level 6.2' + EOL +
          'Level 7' + EOL +
          ' Level 7.1' + EOL +
          ' Level 7.2' + EOL +
          'Level 8' + EOL +
          ' Level 8.1' + EOL +
          ' Level 8.2' + EOL +
          'Level 9' + EOL +
          ' Level 9.1' + EOL +
          ' Level 9.2';

        AStream := TStringStream.Create(SOutline);

        OpenWriteBuffer;
        WriteStream(AStream);
        CloseWriteBuffer;

        AStream.Free;
      end;

    finally
      Disconnect;
      AThread.Synchronize(DecrConnectionCount);

    end;
  end;
end;

procedure TForm1.IncrConnectionCount;
begin
  Inc(FConnectionCount);
  Inc(FRequestCount);

  Edit1.Text := IntToStr(FConnectionCount);
  Edit2.Text := IntToStr(FRequestCount);

  Edit1.Invalidate;
  Edit2.Invalidate;
end;

procedure TForm1.DecrConnectionCount;
begin
  Dec(FConnectionCount);
  Edit1.Text := IntToStr(FConnectionCount);
  Edit1.Invalidate;
end;

end.

