unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, StdCtrls, ComCtrls, MMSystem;

const
  RBTOP : integer = 58;
  RBMIDDLE  : integer = 74;
  RBBOTTOM  : integer = 90;
  RBLEFT  : integer = 36;
  TACKLETOP  : integer = 59;
  TACKLEMIDDLE  : integer = 75;
  TACKLEBOTTOM  : integer = 91;
  TACKLEROW1  : integer = 104;
  TACKLEROW2  : integer = 148;
  TACKLEROW3  : integer = 236;

type
  spot = record
    player : TLabel;
    rb : boolean;
  end;
  
  TMainForm = class(TForm)
    Image7: TImage;
    HomeDisplay: TLabel;
    TimeDisplay: TLabel;
    VisitorDisplay: TLabel;
    Runningback: TLabel;
    Tackler1: TLabel;
    Tackler2: TLabel;
    Tackler3: TLabel;
    Tackler4: TLabel;
    Tackler5: TLabel;
    HomeLabel: TLabel;
    TimeLabel: TLabel;
    VisitorLabel: TLabel;
    MoveForward: TImage;
    MoveUp: TImage;
    MoveDown: TImage;
    Kick: TImage;
    Score: TImage;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    DownDisplay: TLabel;
    FieldPosDisplay: TLabel;
    YTGDisplay: TLabel;
    DownLabel: TLabel;
    FieldPosLabel: TLabel;
    YTGLabel: TLabel;
    MoveBack: TImage;
    OnOffSwitch: TTrackBar;
    Computer: TButton;
    Timer: TTimer;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Clock: TTimer;
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure MoveUpClick(Sender: TObject);
    procedure MoveDownClick(Sender: TObject);
    procedure MoveForwardClick(Sender: TObject);
    procedure MoveBackClick(Sender: TObject);
    procedure ComputerClick(Sender: TObject);
    procedure ClockTimer(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure ScoreMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ScoreMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure KickClick(Sender: TObject);
    procedure OnOffSwitchChange(Sender: TObject);
  private
    { Private declarations }
    field : array[0..9]of array[0..2] of spot;  // the X and Y coordinates of the field
    rbx, rby : integer;      // the X and Y coordinates of the runningback
    running : boolean;
    LastSack : TLabel;
    YardsToGo : integer;
    Down : integer;
    FieldPosition : integer;
    Home : integer;
    Visitor : integer;
    Quarter : integer;
    TimeLeft : double;
    procedure ShowField(visible : boolean);
    procedure ResetField;
    procedure Sacked(Player : TLabel);
    procedure ShowDisplay(visible : boolean);
    procedure TogglePlay( toggle : boolean );
    procedure ResetGame;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses about;

{$R *.dfm}

procedure TMainForm.About1Click(Sender: TObject);
begin
  AboutForm.ShowModal;
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMainForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    'i':
      MoveUpClick(Sender);
    'k':
      MoveDownClick(Sender);
    'l':
      MoveForwardClick(Sender);
    'j':
      MoveBackClick(Sender);
  end;
end;

procedure TMainForm.MoveUpClick(Sender: TObject);
begin
  if ((OnOffSwitch.Position = 2) or (LastSack <> Nil)) then
    exit;

  if not running then
    TogglePlay(true);

  if (Runningback.Top = RBTOP) then
    exit; // already as up as it gets

  if (field[rbx][rby-1].player <> Nil) then
  begin
    Sacked(field[rbx][rby-1].player);
    exit;
  end;

  if (Runningback.Top = RBBOTTOM) then
    Runningback.Top := RBMIDDLE
  else if (Runningback.Top = RBMIDDLE) then
    Runningback.Top := RBTOP;

  field[rbx][rby].player := Nil;
  field[rbx][rby].rb := false;
  dec( rby );
  field[rbx][rby].player := Runningback;
  field[rbx][rby].rb := true;
end;

procedure TMainForm.MoveDownClick(Sender: TObject);
begin
    if ((OnOffSwitch.Position = 2) or (LastSack <> Nil)) then
        exit;

    if not running then
        TogglePlay(true);

    if (Runningback.Top = RBBOTTOM) then
        exit; // already as down as it gets

    if (field[rbx][rby+1].player <> Nil) then
    begin
        Sacked(field[rbx][rby+1].player);
        exit;
    end;

    if (Runningback.Top = RBTOP) then
        Runningback.Top := RBMIDDLE
    else if (Runningback.Top = RBMIDDLE) then
        Runningback.Top := RBBOTTOM;

    field[rbx][rby].player := Nil;
    field[rbx][rby].rb := false;
    inc( rby );
    field[rbx][rby].player := Runningback;
    field[rbx][rby].rb := true;
end;

procedure TMainForm.MoveForwardClick(Sender: TObject);
begin
  if ((OnOffSwitch.Position = 2) or (LastSack <> Nil)) then
    exit;

  if not running then
    TogglePlay(true);

  if (Runningback.Left < TACKLEROW3 - 2) then
  begin
    if (field[rbx+1][rby].player <> Nil) then
    begin
      Sacked(field[rbx+1][rby].player);
      exit;
    end;
    field[rbx][rby].player := Nil;
    field[rbx][rby].rb := false;
    Runningback.Left := Runningback.Left + 22;
    inc( rbx );
  end
  else
  begin
    if (field[0][rby].player <> Nil) then
    begin
        Sacked(field[0][rby].player);
        exit;
    end;
    field[rbx][rby].player := Nil;
    field[rbx][rby].rb := false;
    Runningback.Left := RBLEFT;
    rbx := 0;
  end;

  dec( YardsToGo );
  inc( FieldPosition );
  if (FieldPosition = 100) then
  begin
    sndPlaySound('td.wav', SND_SYNC);
    running := false;
    ShowField(false);
    inc( Home, 7);
    HomeDisplay.Caption := inttostr(Home);
    FieldPosition:=80;  // Starting position for visitor
    Down := 1;
    YardsToGo := 10;
    Computer.Visible := true;
    exit;
  end;
  field[rbx][rby].player := Runningback;
  field[rbx][rby].rb := true;
end;

procedure TMainForm.MoveBackClick(Sender: TObject);
begin
  if ((OnOffSwitch.Position = 2) or (LastSack <> Nil)) then
    exit;

  if not running then
    TogglePlay(true);
  if(FieldPosition > 0) then
  begin
    if (Runningback.Left > RBLEFT + 2) then
    begin
      if (field[rbx-1][rby].player <> Nil) then
      begin
        Sacked(field[rbx-1][rby].player);
        exit;
      end;
      field[rbx][rby].player := Nil;
      field[rbx][rby].rb := false;
      Runningback.Left := Runningback.Left - 22;
      dec( rbx );
    end
    else
    begin
      if (field[9][rby].player <> Nil) then
      begin
        Sacked(field[9][rby].player);
        exit;
      end;
      field[rbx][rby].player := Nil;
      field[rbx][rby].rb := false;
      Runningback.Left := TACKLEROW3;
      rbx := 9;
    end;

    Inc( YardsToGo );
    Dec( FieldPosition );

    field[rbx][rby].player := Runningback;
    field[rbx][rby].rb := true;
  end;
end;

procedure TMainForm.ResetField;
var
  x, y :integer;
begin
  TogglePlay(false);
  LastSack := Nil;

  // empty the field
  for y := 0 to 2 do
    for x := 0 to 9 do
    begin
        field[x][y].player := Nil;
        field[x][y].rb := false;
    end;

  // initial locations of players
  field[0][1].player := Runningback;
  field[0][1].rb := true;
  rbx := 0;
  rby := 1;
  field[3][0].player := Tackler1;
  field[3][1].player := Tackler2;
  field[3][2].player := Tackler3;
  field[5][1].player := Tackler4;
  field[9][1].player := Tackler5;

  Runningback.Left := RBLEFT;
  Runningback.Top := RBMIDDLE;
  Tackler1.Left := TACKLEROW1;
  Tackler1.Top := TACKLETOP;
  Tackler2.Left := TACKLEROW1;
  Tackler2.Top := TACKLEMIDDLE;
  Tackler3.Left := TACKLEROW1;
  Tackler3.Top := TACKLEBOTTOM;
  Tackler4.Left := TACKLEROW2;
  Tackler4.Top := TACKLEMIDDLE;
  Tackler5.Left := TACKLEROW3;
  Tackler5.Top := TACKLEMIDDLE;

  ShowField(true);
end;

procedure TMainForm.Sacked( Player: TLabel);
begin
  sndPlaySound('whistle.wav', SND_SYNC);
  running := false;
  LastSack := player;
  if (YardsToGo <=0) then
  begin
    Down := 1;
    YardsToGo := 10;
  end
  else
  begin
    inc( Down );
    if (Down > 4) then
    begin
      sndPlaySound('whistle.wav', SND_SYNC);
      Down := 1;  // First down for visitor
      YardsToGo := 10;
      Computer.Visible := true;
    end;
  end;
end;

procedure TMainForm.ShowDisplay(visible: boolean);
begin
  DownLabel.Visible := visible;
  FieldPosLabel.Visible := visible;
  YTGLabel.Visible := visible;
  DownDisplay.Visible := visible;
  FieldPosDisplay.Visible := visible;
  YTGDisplay.Visible := visible;
end;

procedure TMainForm.ShowField(visible: boolean);
begin
  Runningback.Visible := visible;
  Tackler1.Visible := visible;
  Tackler2.Visible := visible;
  Tackler3.Visible := visible;
  Tackler4.Visible := visible;
  Tackler5.Visible := visible;
end;

procedure TMainForm.TogglePlay(toggle: boolean);
begin
  running := toggle;
  Timer.Enabled := toggle;
  Clock.Enabled := toggle;
end;

procedure TMainForm.ComputerClick(Sender: TObject);
begin
  ShowField(false);
  Dec( FieldPosition, random(100) );
  if (FieldPosition <= 0) then
  begin
    sndPlaySound('td.wav', SND_ASYNC);
    inc( Visitor, 7);
    VisitorDisplay.Caption := IntToStr(Visitor);
    FieldPosition := 20;
  end
  else
  begin
    sndPlaySound('whistle.wav', SND_SYNC);
    sndPlaySound('whistle.wav', SND_SYNC);
  end;
  Computer.Visible := false;
  LastSack := Runningback; // hack to keep movement keys disabled
end;

procedure TMainForm.ClockTimer(Sender: TObject);
begin
  if not running then
    exit;

  sndPlaySound('tick.wav', SND_ASYNC);
  TimeLeft := TimeLeft - 0.1;
  TimeDisplay.Caption := FloatToStrF(TimeLeft, ffGeneral, 4, 4);

  if (TimeLeft <= 0) then
  begin
    inc( Quarter );
    TimeLeft := 15;
  end;
  if (Quarter >= 5) then
  begin
    // game over
    sndPlaySound('whistle.wav', SND_SYNC);
    sndPlaySound('whistle.wav', SND_SYNC);
    LastSack := Runningback; // hack to keep movement keys disabled
    TogglePlay(false);
    ShowField(false);
    ShowDisplay(true);
  end;
end;

procedure TMainForm.TimerTimer(Sender: TObject);
var
  x, y, newx, newy, direction : integer;
begin
  newy := random(3);
  y := newy;
  newx := random(10);
  x := newx;
  direction := random(2); // 0 is for x, 1 is for y

  if not running then
  begin
    if (LastSack <> Nil) then
      LastSack.Visible := not LastSack.Visible;
    exit;
  end;

  if (field[x][y].rb) then
    exit; // can't move the runningback!

  if (field[x][y].player = Nil) then
    exit; // no tacker at this spot

  if (field[x][y].player.Left <= RBLEFT) then
    exit; // already at the endzone

  if (direction = 0)  then// we're moving horizontal
  begin
    if (x < rbx) then
      newx := x + 1
    else if (x > rbx) then
      newx := x - 1
    else
      exit;
    //  we're already horizontally lined up with rb
  end
  else if (direction = 1)  then// we're moving vertical
  begin
    if (y < rby) then
      newy := y + 1
    else if (y > rby) then
      newy := y - 1
    else
      exit;
    //  we're already vertically lined up with rb
  end;

  if field[newx][newy].rb  then// got him!
  begin
    Sacked(field[x][y].player);
    exit;
  end;

  if (field[newx][newy].player = Nil) then// not blocked
  begin
    field[x][y].player.Left := field[x][y].player.Left - (22 * (x - newx));
    field[x][y].player.Top := field[x][y].player.Top - (16 * (y - newy));
    field[newx][newy].player := field[x][y].player;
    field[x][y].player := Nil;
  end;
end;

procedure TMainForm.ScoreMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if ((OnOffSwitch.Position = 2) or (running)) then
    exit;

  ShowDisplay(false);
  if not(Computer.Visible) then
    ResetField;
end;

procedure TMainForm.ScoreMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if ((OnOffSwitch.Position = 2) or (running)) then
    exit;

  if (Quarter = 5) then
    exit;

  YTGDisplay.Caption := IntToStr(YardsToGo);

  if (FieldPosition <= 50) then
  begin
    FieldPosDisplay.Caption := IntToStr(FieldPosition) + ' <';
  end
  else
  begin
    FieldPosDisplay.Caption := '> ' + IntToStr(100 - FieldPosition);
  end;

  DownDisplay.Caption := IntToStr(Down);

  ShowField(false);
  ShowDisplay(true);
end;

procedure TMainForm.KickClick(Sender: TObject);
begin
  if ((running) or (Down <> 4)) then
    exit;  // button only valid just before fourth down

  ShowField(false);
  inc(FieldPosition,random(100) );
  if (FieldPosition >= 100) then
  begin
    sndPlaySound('td.wav', SND_SYNC);
    inc( Home, 3 );
    HomeDisplay.Caption := IntToStr(Home);
    FieldPosition := 80;  // Starting position for visitor
  end
  else
  begin
    sndPlaySound('whistle.wav', SND_SYNC);
    sndPlaySound('whistle.wav', SND_SYNC);
  end;
  Down := 1;  // first down for visitor
  YardsToGo := 10;
  Computer.Visible := true;
  LastSack := Runningback; // hack to keep movement keys disabled
end;

procedure TMainForm.OnOffSwitchChange(Sender: TObject);
begin
  case OnOffSwitch.Position of
    1:
    begin
      Timer.Interval := 250;
      HomeDisplay.Visible := true;
      VisitorDisplay.Visible := true;
      TimeDisplay.Visible := true;
      ResetGame;
    end;
    2:
    begin
      ShowField(false);
      HomeDisplay.Visible := false;
      VisitorDisplay.Visible := false;
      TimeDisplay.Visible := false;
    end;
    3:
    begin
      Timer.Interval := 100;
      HomeDisplay.Visible := true;
      VisitorDisplay.Visible := true;
      TimeDisplay.Visible := true;
      ResetGame;
    end;
  end;
end;

procedure TMainForm.ResetGame;
begin
  YardsToGo := 10;
  Down := 1;
  FieldPosition := 20;
  Home := 0;
  Visitor := 0;
  Quarter := 1;
  TimeLeft := 15;
  TimeDisplay.Caption := FloatToStrF(TimeLeft, ffGeneral, 4, 4);
  HomeDisplay.Caption := IntToStr(Home);
  VisitorDisplay.Caption := intToStr(Visitor);
  randomize;
  ResetField;
end;

end.
