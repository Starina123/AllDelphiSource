unit Pies;

interface

uses Classes, Controls, Forms, Graphics, StdCtrls;

type
  TAngles = class(TPersistent)
  private
    FStartAngle: Integer;
    FEndAngle: Integer;
    FOnChange: TNotifyEvent;
    procedure SetStart(Value: Integer);
    procedure SetEnd(Value: Integer);
  public
    procedure Assign(Value: TAngles);
    procedure Changed;
  published
    property StartAngle: Integer read FStartAngle write SetStart;
    property EndAngle: Integer read FEndAngle write SetEnd;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;
  
  TPie = class(TGraphicControl)
    FPen: TPen;
    FBrush: TBrush;
    FEdit: TEdit;
    FAngles: TAngles;
    constructor Create(AOwner: TComponent); override;
    procedure Paint; override;
    procedure SetBrush(Value: TBrush);
    procedure SetPen(Value: TPen);
    procedure SetAngles(Value: TAngles);
    procedure StyleChanged(Sender: TObject);

  published
    property Angles: TAngles read FAngles write SetAngles;
    property Brush: TBrush read FBrush write SetBrush;
    property Pen: TPen read FPen write SetPen;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

implementation

uses Windows;

procedure TAngles.Assign(Value: TAngles);
begin
  StartAngle := Value.StartAngle;
  EndAngle := Value.EndAngle;
end;

procedure TAngles.SetStart(Value: Integer);
begin
  if Value <> FStartAngle then
  begin
    FStartAngle := Value;
    Changed;
  end;
end;

procedure TAngles.SetEnd(Value: Integer);
begin
  if Value <> FEndAngle then
  begin
    FEndAngle := Value;
    Changed;
  end;
end;

procedure TAngles.Changed;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

constructor TPie.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Width := 100;
  Height := 100;
  FPen := TPen.Create;
  FPen.OnChange := StyleChanged;
  FBrush := TBrush.Create;
  FBrush.OnChange := StyleChanged;
  FAngles := TAngles.Create;
  FAngles.OnChange := StyleChanged;
  FAngles.StartAngle := 180;
  FAngles.EndAngle := 90;
end;

procedure TPie.StyleChanged(Sender: TObject);
begin
  Invalidate;
end;

procedure TPie.SetBrush(Value: TBrush);
begin
  FBrush.Assign(Value);
end;

procedure TPie.SetPen(Value: TPen);
begin
  FPen.Assign(Value);
end;

procedure TPie.SetAngles(Value: TAngles);
begin
  FAngles.Assign(Value);
  Invalidate;
end;

procedure TPie.Paint;
var
  StartA, EndA: Integer;
  midX, midY, stX, stY, endX, endY: Integer;
  sX, sY, eX, eY: Real;

begin
  StartA := FAngles.StartAngle;
  EndA := FAngles.EndAngle;
  midX := Width div 2;
  midY := Height div 2;

  sX := Cos((StartA / 180.0) * pi);
  sY := Sin((StartA / 180.0) * pi);
  eX := Cos((EndA / 180.0) * pi);
  eY := Sin((EndA / 180.0) * pi);

  stX := Round(sX * 100);
  stY := Round(sY * 100);
  endX := Round(eX * 100);
  endY := Round(eY * 100);

  with Canvas do
  begin
    Pen := FPen;
    Brush := FBrush;
    Pie(0,0, Width,Height, midX + stX, midY - stY, midX + endX, midY - endY);
  end;
end;

end.
