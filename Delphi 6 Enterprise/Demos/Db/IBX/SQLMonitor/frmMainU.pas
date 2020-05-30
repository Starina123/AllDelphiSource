unit frmMainU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IBDatabase, Db, IBCustomDataSet, IBQuery, IBSQLMonitor, Grids,
  DBGrids, Buttons, IBServices, IBUpdateSQL, Menus, ExtCtrls, ImgList,
  ComCtrls, ToolWin;

type
  TfrmMain = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    Memo1: TMemo;
    Memo2: TMemo;
    IBDataSet1: TIBDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    IBSQLMonitor1: TIBSQLMonitor;
    MainMenu1: TMainMenu;
    Trace1: TMenuItem;
    Trace2: TMenuItem;
    Clear1: TMenuItem;
    Connect3: TMenuItem;
    SQLMonitor1: TMenuItem;
    Flags1: TMenuItem;
    Database1: TMenuItem;
    MonitorHook1: TMenuItem;
    SQLMonitor2: TMenuItem;
    ToolBar1: TToolBar;
    btnRun: TToolButton;
    btnLaunch: TToolButton;
    ImageList1: TImageList;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Label1: TLabel;
    Label2: TLabel;
    MonitorCount1: TMenuItem;
    procedure RunClick(Sender: TObject);
    procedure IBSQLMonitor1SQL(EventText: String; EventTime : TDateTime);
    procedure LaunchClick(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure Trace2Click(Sender: TObject);
    procedure Connect3Click(Sender: TObject);
    procedure SQLMonitor1Click(Sender: TObject);
    procedure Database1Click(Sender: TObject);
    procedure MonitorHook1Click(Sender: TObject);
    procedure SQLMonitor2Click(Sender: TObject);
    procedure MonitorCount1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses frmConnectU, frmMonitorU, frmTraceFlagsU;

{$R *.dfm}

procedure TfrmMain.RunClick(Sender: TObject);
begin
  Memo2.Lines.Clear;
  IBDataset1.Close;
  IBDataset1.SelectSQL.Clear;
  IBDataset1.SelectSQL.AddStrings(Memo1.Lines);
  IBDataset1.Open;
  Label1.Caption := 'Line count = ' + IntToStr(Memo2.Lines.count);
end;

procedure TfrmMain.IBSQLMonitor1SQL(EventText: String; EventTime : TDateTime);
begin
  Memo2.Lines.Add(EventText);
  Label1.Caption := Format('Memo line count = %d', [Memo2.Lines.Count]);
end;

procedure TfrmMain.LaunchClick(Sender: TObject);
begin
  TfrmMonitor.Create(self).Show;
end;

procedure TfrmMain.Clear1Click(Sender: TObject);
begin
  Memo2.Lines.Clear;
end;

procedure TfrmMain.Trace2Click(Sender: TObject);
begin
  with Sender as TMenuItem do
  begin
    Checked := not Checked;
    if Checked then
      EnableMonitoring
    else
      DisableMonitoring;
  end;
end;

procedure TfrmMain.Connect3Click(Sender: TObject);
begin
  with TfrmConnect.Create(self) do
  try
    if ShowModal = IDOK then
    begin
      btnRun.Enabled := false;
      IBDataSet1.Active := false;
      IBTransaction1.Active := false;
      IBDatabase1.Connected := false;
      IBDatabase1.DatabaseName := edtDatabase.Text;
      IBDatabase1.Params.Clear;
      IBDatabase1.Params.Add(Format('USER_NAME=%s', [edtUser.Text]));
      IBDatabase1.Params.Add(Format('PASSWORD=%s', [edtPassword.Text]));
      if edtRole.Text <> '' then
        IBDatabase1.Params.Add(Format('ROLE=%s', [edtRole.Text]));
      IBDatabase1.Connected := true;
      IBTransaction1.Active := true;
      btnRun.Enabled := true;
    end;
  finally
    Free;
  end;   
end;

procedure TfrmMain.SQLMonitor1Click(Sender: TObject);
begin
  with Sender as TMenuItem do
  begin
    Checked := not Checked;
    IBSQLMonitor1.Enabled := Checked;
  end;
end;

procedure TfrmMain.Database1Click(Sender: TObject);
begin
  with TfrmTraceFlags.Create(self) do
  try
    SetTraceFlags(IBDatabase1.TraceFlags);
    if ShowModal = IDOK then
      IBDatabase1.TraceFlags := GetTraceFlags;
  finally
    Free;
  end;
end;

procedure TfrmMain.MonitorHook1Click(Sender: TObject);
begin
  with TfrmTraceFlags.Create(self) do
  try
    SetTraceFlags(MonitorHook.TraceFlags);
    if ShowModal = IDOK then
      MonitorHook.TraceFlags := GetTraceFlags;
  finally
    Free;
  end;
end;

procedure TfrmMain.SQLMonitor2Click(Sender: TObject);
begin
  with TfrmTraceFlags.Create(self) do
  try
    SetTraceFlags(IBSQLMonitor1.TraceFlags);
    if ShowModal = IDOK then
      IBSQLMonitor1.TraceFlags := GetTraceFlags;
  finally
    Free;
  end;
end;

procedure TfrmMain.MonitorCount1Click(Sender: TObject);
begin
  ShowMessage(Format('Monitor count = %d', [MonitorHook.GetMonitorCount]));
end;

end.
