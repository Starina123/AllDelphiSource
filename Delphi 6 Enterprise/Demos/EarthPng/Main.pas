unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls;

type
  TForm1 = class(TForm)
    procedure FormPaint(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FGameOver : Boolean;
  public
    { Public declarations }
    backgroundImage : TImage;
    spriteImage : TImage;
    paddle : TImage;
    backgroundCanvas : TCanvas;
    workCanvas : TCanvas;
    backgroundRect, spriteRect, changeRect, paddleRect, changePaddleRect :TRect;
    x, y, xDir, yDir, paddleX, paddleY, paddleCenter, Angle : integer;
    procedure IdleLoop( Sender: TObject; var Done: Boolean );
    procedure WMSetCursor(var Message: TWMSetCursor); message WM_SETCURSOR;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses MMSystem;

procedure TForm1.FormPaint(Sender: TObject);
begin
  RealizePalette(backgroundCanvas.Handle);
  RealizePalette(workCanvas.Handle);
  Canvas.CopyRect(backgroundRect, workCanvas, backgroundRect);
end;

procedure TForm1.FormActivate(Sender: TObject);
var
  backgrounddc, workdc : HDC;
  bkbmp, bmp : HBITMAP;
begin
  backgroundImage := TImage.Create( Self );
  spriteImage := TImage.Create( Self );
  paddle := TImage.Create( Self );
  workCanvas := TCanvas.Create;
  backgroundCanvas := TCanvas.Create;

  Angle := 1;

  spriteImage.Picture.LoadFromFile('Earth.ico');
  backgroundImage.Picture.LoadFromFile('androm.bmp');
  paddle.Picture.LoadFromFile('paddle.ico');

  WindowState := wsMaximized;

  backgroundRect.Top := 0;
  backgroundRect.Left := 0;
  backgroundRect.Right :=  ClientWidth;
  backgroundRect.Bottom :=  ClientHeight;


  spriteRect.Top := 0;
  spriteRect.Left := 0;
  spriteRect.Right := spriteImage.Picture.Width;
  spriteRect.Bottom := spriteImage.Picture.Height;

  //Set up backgroundCanvas
  backgrounddc := CreateCompatibleDC(Canvas.Handle);
  bkbmp := CreateCompatibleBitmap(Canvas.Handle, ClientWidth, ClientHeight);
  SelectObject(backgrounddc, bkbmp);
  SelectPalette(backgrounddc, backgroundImage.Picture.Bitmap.Palette, false);
  backgroundCanvas.Handle := backgrounddc;
  backgroundCanvas.StretchDraw( backgroundRect, backgroundImage.Picture.Bitmap);


  //Set up workCanvas
  workdc := CreateCompatibleDC(Canvas.Handle);
  bmp := CreateCompatibleBitmap(Canvas.Handle, ClientWidth, ClientHeight);
  SelectObject(workdc, bmp);
  SelectPalette(workdc, backgroundImage.Picture.Bitmap.Palette, false);
  workCanvas.Handle := workdc;
  workCanvas.CopyRect(backgroundRect,  backgroundCanvas, backgroundRect);
  workCanvas.Draw( 0, 0, spriteImage.Picture.Icon);
  paddleX := ClientWidth div 2;
  paddleY := ClientHeight - 50;
  workCanvas.Draw( paddleX, paddleY, paddle.Picture.Icon);

  paddleRect.Left := paddleX - paddle.Width;
  paddleRect.Right := paddleX + paddle.Width;
  paddleRect.Top	:= paddleY;
  paddleRect.Bottom := paddleY + paddle.Height;


  RealizePalette(backgroundCanvas.Handle);
  RealizePalette(workCanvas.Handle);
  Canvas.CopyRect(backgroundRect, workCanvas, backgroundRect);
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  //Animates and moves paddle
  paddleCenter := X;
  if(paddleCenter < paddle.Picture.Width div 2) then
      paddleCenter := paddle.Picture.Width div 2;
  if(paddleCenter > ClientWidth - (paddle.Picture.Width div 2)) then
      paddleCenter := ClientWidth - (paddle.Picture.Width div 2);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //Assign idle time function
  Application.OnIdle := IdleLoop;

  if(Application.MessageBox('Would you like to play with Earth?', 'Hello Earthling', MB_OKCANCEL) = IDOK) then
  begin
      //load sound effect
      sndPlaySound('Utopia Default.wav', SND_ASYNC or SND_FILENAME);
      x := 0;
      y := 0;
      FGameOver := false;
      ShowCursor(false);

  end
  else
      Application.Terminate;
end;

procedure TForm1.IdleLoop(Sender: TObject; var Done: Boolean);
var
  choice, SideDef, TopDef, PaddleDifference: integer; 
begin
  //keeps loop going
  done := false;
  //slows down action
  Sleep(1);

  changeRect := spriteRect;
  spriteRect.Left := x;
  spriteRect.Top := y;
  spriteRect.Right := x + spriteImage.Picture.Width;
  spriteRect.Bottom := y + spriteImage.Picture.Height;

  workCanvas.CopyRect(paddleRect, backgroundCanvas, paddleRect);

  changePaddleRect := paddleRect;
  paddleRect.Left := paddleCenter - ((paddle.Picture.Width) div 2);
  paddleX := paddleRect.Left;
  paddleRect.Top := paddleY;
  paddleRect.Right := paddleX + paddle.Picture.Width;
  paddleRect.Bottom := paddleY + paddle.Picture.Height;

  SideDef := changeRect.Left - spriteRect.Left;
  // If SideDiff < 0 the paddle is to the right
  if(SideDef < 0) then
  begin
    changeRect.Right := spriteRect.Right;
  end
  else
  begin
    changeRect.Left := spriteRect.Left;
  end;

  TopDef := changeRect.Top - spriteRect.Top;
  // If SideDiff < 0 the paddle is to the Down
  if(TopDef < 0) then
  begin
    changeRect.Bottom := spriteRect.Bottom;
  end
  else
  begin
    changeRect.Top := spriteRect.Top;
  end;

  workCanvas.CopyRect(spriteRect, backgroundCanvas, spriteRect);


  //ChangeRectCalcs
  if (y <= 0) then
  begin
    yDir := 5;
  end;
  if (y >= ClientHeight - 16) then
  begin
    FGameOver := true;
    SetCursor(HCURSOR( IDC_ARROW ));
    ShowCursor(true);
    choice := MessageBox(Handle, 'You lost Earth', 'Try Again?', MB_RETRYCANCEL);
    if(choice = IDRETRY) then
    begin
      x := 0;
      y := 0;
      ShowCursor(false);
    end
    else
      Form1.Close;
  end;

  if ( (spriteRect.Bottom - 16) >= (paddleRect.Top) )
   and ( (spriteRect.Bottom - 16) <= (paddleRect.Top + 5) )
   and ( (spriteRect.Right) >= (paddleRect.Left) )
   and ( (spriteRect.Left) <= (paddleRect.Right) ) then
  begin
    yDir := -5;
    sndPlaySound('Utopia Default.wav', SND_ASYNC or SND_FILENAME);
  end;

  if (x <= 0) then
  begin
    xDir := 5;
  end;

  if(x >= ClientWidth - 16) then
  begin
    xDir := -5;
  end;

  inc ( x , xDir );
  inc ( y , yDir );

  PaddleDifference := changePaddleRect.Left - paddleRect.Left;
  // If PaddleDiff < 0 the paddle is to the right
  if(PaddleDifference < 0) then
  begin
    changePaddleRect.Right := paddleRect.Right;
  end
  else
  begin
    changePaddleRect.Left := paddleRect.Left;
  end;

  //Perform dirty rectangle animation on memory and Form canvas
  workCanvas.Draw(x, y, spriteImage.Picture.Icon);
  workCanvas.Draw(paddleX, paddleY, paddle.Picture.Icon);
  RealizePalette(backgroundCanvas.Handle);
  RealizePalette(workCanvas.Handle);
  Canvas.CopyRect(changeRect, workCanvas, changeRect);
  Canvas.CopyRect(changePaddleRect, workCanvas, changePaddleRect);
end;

procedure TForm1.WMSetCursor(var Message: TWMSetCursor);
begin
  //Hides Cursor
  if not(FGameOver) then
  begin
    SetCursor( HCURSOR( nil ) );
  end;
end;

end.
