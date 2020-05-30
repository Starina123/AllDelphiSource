unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, StdCtrls;

const
  crMaletUp : integer = 5;
  crMaletDown : integer  = 6;
  MissedPoints : integer  = -2;
  HitPoints  : integer = 5;
  MissedCritter : integer = -1;
  CritterSize : integer = 72;
  TimerId  : integer = 1;

type
  THole = record
    Time : integer;
    Dead : boolean;
  end;
  
  TSwatForm = class(TForm)
    MainMenu1: TMainMenu;
    Gamr1: TMenuItem;
    New1: TMenuItem;
    Options1: TMenuItem;
    Stop1: TMenuItem;
    Pause1: TMenuItem;
    About1: TMenuItem;
    Timer1: TTimer;
    GameOverImage: TImage;
    Image1: TImage;
    TimeLabel: TLabel;
    MissLabel: TLabel;
    HitsLabel: TLabel;
    EscapedLabel: TLabel;
    ScoreLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure New1Click(Sender: TObject);
    procedure Options1Click(Sender: TObject);
    procedure Stop1Click(Sender: TObject);
    procedure Pause1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    { Private declarations }
    Score : integer;
    Hits, Miss, Escaped : integer;
    IsGameOver, IsPause : Boolean;
    Live : TBitmap;
    Dead : TBitmap;
    HoleInfo : array[0..4] of THole;
    Holes : array[0..4] of TPoint;
    procedure WriteScore;
  public
    { Public declarations }
    LiveTime,  Frequence, GameTime : integer;
  end;

var
  SwatForm: TSwatForm;

implementation

uses options, about;

{$R *.dfm}
{$R extrares.res}

procedure TSwatForm.FormCreate(Sender: TObject);
begin
  Holes[0] := Point( 10, 10 );
  Holes[1] := Point( 200, 10 );
  Holes[2] := Point( 100, 100 );
  Holes[3] := Point( 10, 200 );
  Holes[4] := Point( 200, 200 );

  Screen.Cursors[crMaletUp] := LoadCursor(HInstance, 'Malet');
  Screen.Cursors[crMaletDown] := LoadCursor(HInstance, 'MaletDown');
  Screen.Cursor := TCursor(crMaletUp);

  randomize;

  Live := TBitmap.Create;
  Live.LoadFromResourceName(HInstance, 'Live');
  Dead := TBitmap.Create;
  Dead.LoadFromResourceName(HInstance, 'Dead');

  IsGameOver := true;
  IsPause := false;
  LiveTime := 10;
  Frequence := 20;
  GameTime := 150;        // fifteen seconds

  Application.OnMinimize := Pause1Click;
  Application.OnRestore := Pause1Click;
end;

procedure TSwatForm.Timer1Timer(Sender: TObject);
var
  i : integer;
begin
  Timer1.Tag := Timer1.Tag + 1;
  i := random(Frequence);
  if (i < 5) then
  begin
    if (HoleInfo[i].Time = 0) then
    begin
      HoleInfo[i].Time := Timer1.Tag + LiveTime;
      HoleInfo[i].Dead := false;
      Canvas.Draw(Holes[i].x, Holes[i].y, Live);
    end;
  end;
  for i := 0 to 4 do
  begin
    if ( (Timer1.Tag > HoleInfo[i].Time ) and ( HoleInfo[i].Time <> 0 ) ) then
    begin
      HoleInfo[i].Time := 0;
      if not(HoleInfo[i].Dead) then
      begin
        inc( Score, MissedCritter );
        inc( Escaped );
      end;
      Canvas.FillRect(Rect(Holes[i].x, Holes[i].y, Holes[i].x + Dead.Width, Holes[i].y + Dead.Height));
    end;
  end;
  WriteScore;
  if (Timer1.Tag >= GameTime) then
    Stop1Click(self);
end;

procedure TSwatForm.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i : integer;
  hit : boolean;
begin
  Screen.Cursor := TCursor(crMaletDown);

  if (IsGameOver or IsPause) then
    exit;

  hit := false;
  for i := 0 to 4 do
    if ( (not HoleInfo[i].Dead) and (HoleInfo[i].Time <> 0) ) then
      if (X > Holes[i].x ) and ( X < (Holes[i].x + Live.Width) ) and
         ( Y > Holes[i].y ) and ( Y < (Holes[i].y + Live.Height)) then
      begin
        inc( Score, HitPoints );
        HoleInfo[i].Dead := true;
        HoleInfo[i].Time := Timer1.Tag + 2 * LiveTime;
        inc( Hits );
        hit := true;
        Canvas.Draw(Holes[i].x, Holes[i].y, Dead);
      end;
  if not(hit) then
  begin
    inc ( Score, MissedPoints );
    inc( Miss );
  end;
  WriteScore;
end;

procedure TSwatForm.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := TCursor(crMaletUp);
end;

procedure TSwatForm.New1Click(Sender: TObject);
begin
  Timer1.Enabled := true;
  Timer1.Tag := 0;
  Score := 0;
  Hits := 0;
  Miss := 0;
  Escaped := 0;
  if (IsPause)
  then begin
    IsPause := false;
    Pause1.Caption := '&Pause';
  end;
  GameOverImage.Visible := false;
  IsGameOver := false;
  FillChar(HoleInfo, sizeof(HoleInfo), 0);
  New1.Enabled := false;
  Options1.Enabled := false;
  Stop1.Enabled := true;
end;

procedure TSwatForm.Options1Click(Sender: TObject);
begin
  OptionsDlg.ShowModal;
end;

procedure TSwatForm.Stop1Click(Sender: TObject);
var
 i : integer;
begin
  Timer1.Enabled := false;
  IsPause := false;
  GameOverImage.Visible := true;
  IsGameOver := true;
  Timer1.Tag := GameTime;
  New1.Enabled := true;
  Options1.Enabled := true;
  Stop1.Enabled := false;
  for i := 0 to 4 do
    if (HoleInfo[i].Time <> 0) then
      Canvas.FillRect(Rect(Holes[i].x, Holes[i].y, Holes[i].x + Dead.Width,
        Holes[i].y + Dead.Height));
end;

procedure TSwatForm.Pause1Click(Sender: TObject);
begin
  if (IsGameOver) then
    exit;

  if (IsPause) then
  begin
    IsPause := false;
    Pause1.Caption := '&Pause';
    Stop1.Enabled := true;
    Timer1.Enabled := true;
  end
  else
  begin
    IsPause := true;
    Pause1.Caption := '&Continue';
    Stop1.Enabled := false;
    Timer1.Enabled := false;
  end;
end;

procedure TSwatForm.About1Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TSwatForm.WriteScore;
begin
  TimeLabel.Caption := IntToStr(GameTime - Timer1.Tag);
  HitsLabel.Caption := IntToStr(Hits);
  MissLabel.Caption := IntToStr(Miss);
  EscapedLabel.Caption := IntToStr(Escaped);
  ScoreLabel.Caption := IntToStr(Score);
end;

end.
