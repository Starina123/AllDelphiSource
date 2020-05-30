{***************************************************************
 *
 * Project  : TFTPServer
 * Unit Name: transfer
 * Purpose  : Sub form
 * Version  : 1.0
 * Date  : Wed 25 Apr 2001  -  01:40:05
 * Author  : <unknown>
 * History  :
 * Tested  : Wed 25 Apr 2001  // Allen O'Neill <allen_oneill@hotmail.com>
 *
 ****************************************************************}

unit transfer;

interface

uses
{$IFDEF Linux}
   QControls,  QForms,  QDialogs,  QComCtrls,  QStdCtrls,
{$ELSE}
   Controls,  Forms,  Dialogs,  ComCtrls,  StdCtrls,
{$ENDIF}
   Classes,  SyncObjs;

type
  TProgressStream = class(TFileStream) // single way progress anyway
  private
    FActivity: TEvent;
    FProgress: Integer;
  public
    constructor Create(const FileName: string; Mode: Word);
    destructor Destroy; override;
    function Read(var Buffer; Count: Integer): Integer; override;
    function Write(const Buffer; Count: Integer): Integer; override;
    property Progress: Integer read FProgress;
  end;

  TfrmTransfer = class(TForm)
    prgTransfer: TProgressBar;
    Label1: TLabel;
    lblByteRate: TLabel;
  private
    FStartTime: Cardinal;
    FThread: TThread;
    function GetStream: TProgressStream;
  public
    procedure CheckProgress;
    constructor Create(AOwner: TComponent; AStream: TProgressStream; const
      FileName: string; const FileMode: Word); reintroduce; virtual;
    destructor Destroy; override;
    property Stream: TProgressStream read GetStream;
  end;

implementation

uses  SysUtils, windows;

{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

type
  TWaitThread = class(TThread)
  private
    FOwner: TfrmTransfer;
    FStream: TProgressStream;
    evtFinished: TEvent;
  protected
    procedure Execute; override;
  public
    constructor Create(AOwner: TfrmTransfer; AStream: TProgressStream);
    destructor Destroy; override;
  end;

  { TfrmTransfer }

procedure TfrmTransfer.CheckProgress;
begin
  prgTransfer.Position := Stream.Progress;
  prgTransfer.Update;
  lblByteRate.Caption := IntToStr(Round((Stream.Progress / (GetTickCount -
    FStartTime)) * 1000));
end;

constructor TfrmTransfer.Create(AOwner: TComponent; AStream: TProgressStream;
  const FileName: string; const FileMode: Word);
var
  s: string;
begin
  inherited Create(AOwner);
  prgTransfer.Max := AStream.Size;
  if FileMode = fmOpenRead then
    s := 'Reading'
  else
    s := 'Writing';
  Caption := Format('%s %s', [s, ExtractFileName(FileName)]);
  FThread := TWaitThread.Create(self, AStream);
  FStartTime := GetTickCount;
end;

destructor TfrmTransfer.Destroy;
begin
  FThread.Free;
  inherited;
end;

function TfrmTransfer.GetStream: TProgressStream;
begin
  result := TWaitThread(FThread).FStream;
end;

{ TWaitThread }

constructor TWaitThread.Create(AOwner: TfrmTransfer; AStream: TProgressStream);
begin
  FOwner := AOwner;
  FStream := AStream;
  FreeOnTerminate := False;
  evtFinished := TEvent.Create(nil, false, false, '');
  inherited Create(False);
end;

destructor TWaitThread.Destroy;
begin
  evtFinished.SetEvent;
  WaitFor;
  evtFinished.Free;
  inherited;
end;

procedure TWaitThread.Execute;
var
  hndArray: array[0..1] of THandle;
begin
  hndArray[0] := FStream.FActivity.Handle;
  hndArray[1] := evtFinished.Handle;
  while WaitForMultipleObjects(2, @hndArray, false, INFINITE) = WAIT_OBJECT_0 do
    Synchronize(FOwner.CheckProgress);
end;

{ TProgressStream }

constructor TProgressStream.Create(const FileName: string; Mode: Word);
begin
  inherited Create(FileName, Mode);
  FActivity := TEvent.Create(nil, False, False, '');
end;

destructor TProgressStream.Destroy;
begin
  FActivity.Free;
  sleep(0);
  inherited;
end;

function TProgressStream.Read(var Buffer; Count: Integer): Integer;
begin
  FProgress := FProgress + Count;
  Result := inherited Read(Buffer, Count);
  FActivity.SetEvent;
end;

function TProgressStream.Write(const Buffer; Count: Integer): Integer;
begin
  FProgress := FProgress + Count;
  Result := inherited Write(Buffer, Count);
  FActivity.SetEvent;
end;

end.
