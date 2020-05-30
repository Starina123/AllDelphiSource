unit frmMonitorU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, IBSQLMonitor, ComCtrls, ExtCtrls;

type
  TfrmMonitor = class(TForm)
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    SQLMonitor1: TMenuItem;
    Monitoring1: TMenuItem;
    Flags1: TMenuItem;
    Clear2: TMenuItem;
    ListView1: TListView;
    StatusBar1: TStatusBar;
    Splitter1: TSplitter;
    procedure IBSQLMonitor1SQL(EventText: String; EventTime : TDateTime);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Clear1Click(Sender: TObject);
    procedure Monitoring1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Flags1Click(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    mon : TIBSQLMonitor;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses IBDatabase, frmTraceFlagsU;

{$R *.dfm}

procedure TfrmMonitor.IBSQLMonitor1SQL(EventText: String; EventTime : TDateTime);
var
  s : String;
  Start, Ending, len : Integer;
  FBuffer : PChar;
begin
  with ListView1.Items.Add do
  begin
    Caption := FormatDateTime('hh:nn:ss.zzz', EventTime);
    Start := Pos(']', EventText) + 3;
    len := Length(EventText);
    Ending := Pos(']', Copy(EventText, Start, len));
    s := Copy(EventText, Start,Ending);
    GetMem(FBuffer, len + SizeOf(Integer));
    Move(len, FBuffer[0], Sizeof(Integer));
    Move(EventText[1], FBuffer[SizeOf(Integer)], len);
    Data := FBuffer;
    SubItems.Add(s);
  end;
end;

procedure TfrmMonitor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Clear1Click(nil);  { Free all the memory associated with the LsitView }
  Action := caFree;
end;

procedure TfrmMonitor.Clear1Click(Sender: TObject);
var
  i : Integer;
begin
  Memo1.Lines.Clear;
  ListView1.Items.BeginUpdate;
  for i := 0 to Pred(ListView1.Items.Count) do
  begin
    FreeMem(ListView1.Items[i].Data);
    ListView1.Items[i].Data := nil;
  end;
  ListView1.Items.Clear;
  ListView1.Items.EndUpdate;
end;

procedure TfrmMonitor.Monitoring1Click(Sender: TObject);
begin
  with Sender as TMenuItem do
  begin
    Checked := not Checked;
    mon.Enabled := Checked;
  end;
end;

procedure TfrmMonitor.FormCreate(Sender: TObject);
begin
  mon := TIBSQLMonitor.Create(self);
  mon.OnSQL := IBSQLMonitor1SQL;
end;

procedure TfrmMonitor.Flags1Click(Sender: TObject);
begin
  with TfrmTraceFlags.Create(self) do
  try
    SetTraceFlags(mon.TraceFlags);
    if ShowModal = IDOK then
      mon.TraceFlags := GetTraceFlags;
  finally
    Free;
  end;
end;

procedure TfrmMonitor.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  st : String;
begin
  if Selected then
  begin
    Memo1.Clear;
    SetString(st, PChar(Item.Data) + SizeOf(Integer), PInteger(Item.Data)^);
    Memo1.Lines.Add(st);
  end;
end;

end.
