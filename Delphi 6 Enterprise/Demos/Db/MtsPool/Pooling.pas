unit Pooling;

interface

uses
  Windows, Classes, SysUtils, Controls, Forms, StdCtrls, DBTables, Registry, Db;

const
  MTSRegistryKey : PChar = '\SOFTWARE\BORLAND\DATABASE ENGINE\SETTINGS\SYSTEM\INIT';
                            
type
  TForm1 = class(TForm)
    MTSPooling: TCheckBox;
    Query1: TQuery;
    Database1: TDatabase;
    Label1: TLabel;
    TestBtn: TButton;
    StartTimeEdt: TEdit;
    EndTimeEdt: TEdit;
    ElpTimeEdt: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Count: TEdit;
    procedure TestBtnClick(Sender: TObject);
    procedure DoTest;
    procedure MTSPoolingClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    dtStart, dtEnd, dtElp : TDateTime;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.TestBtnClick(Sender: TObject);
var
  Hour, Min, Sec, MSec : Word;
begin
  // Start the timer
  dtStart := Now;
  StartTimeEdt.Text := TimeToStr( dtStart );

  // Run the test
  DoTest;
  
  // End the timer, and calculate the elapsed time
  dtEnd := Now;
  EndTimeEdt.Text := TimeToStr( dtEnd );

  dtElp := dtEnd - dtStart;
  DecodeTime( dtElp, Hour, Min, Sec, MSec );
  
  ElpTimeEdt.Text := IntToStr( Hour * 60 + Min )  + ':' +
                     IntToStr( Sec ) + '.' + IntToStr( MSec );
end;

procedure TForm1.DoTest;
var
  iCnt : Integer;
begin
  // Close bde to ensure MTS Pooling param will be used
  Session.Close;
  for iCnt := 1 to StrToInt( Count.Text ) do
  begin
    Database1.Connected := True;
    Query1.Active := True;

    Query1.Active := False;
    Database1.Connected := False;
  end;
  Session.Close;
end;
  
procedure TForm1.MTSPoolingClick(Sender: TObject);
var
  reg : TRegistry;
begin
  // Set the registry value to whatever the flag is
  reg := TRegistry.Create;
  reg.RootKey := HKEY_LOCAL_MACHINE;
  if ( reg.OpenKey( MTSRegistryKey, False) ) then
  begin
    if MTSPooling.Checked then
      reg.WriteString('MTS POOLING', 'TRUE')
    else
      reg.WriteString('MTS POOLING', 'FALSE');
    reg.CloseKey;
  end;
  reg.Destroy;
end;

procedure TForm1.FormActivate(Sender: TObject);
var
  reg : TRegistry;
  keyValue : string;
begin
  // Determine the current registry value
  reg := TRegistry.Create;
  reg.RootKey := HKEY_LOCAL_MACHINE;
  if ( reg.OpenKey( MTSRegistryKey, False) ) then
  begin
    keyValue := reg.ReadString('MTS POOLING');

    if ( keyValue = 'TRUE' ) then
      MTSPooling.Checked := True
    else
      MTSPooling.Checked := False;
    reg.CloseKey;
  end;
  reg.Destroy;
end;

end.
