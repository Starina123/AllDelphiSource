
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{       Copyright (c) 1998 Inprise Corporation          }
{                                                       }
{*******************************************************}

unit StdActns;

interface

uses Classes, ActnList, StdCtrls, Forms;

type

{ Hint actions }

  THintAction = class(TCustomAction)
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Hint;
  end;

{ Edit actions }

  TEditAction = class(TAction)
  private
    FControl: TCustomEdit;
    procedure SetControl(Value: TCustomEdit);
  protected
    function GetControl(Target: TObject): TCustomEdit; virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure UpdateTarget(Target: TObject); override;
    property Control: TCustomEdit read FControl write SetControl;
  end;

  TEditCut = class(TEditAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
  end;

  TEditCopy = class(TEditAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
  end;

  TEditPaste = class(TEditAction)
  public
    procedure UpdateTarget(Target: TObject); override;
    procedure ExecuteTarget(Target: TObject); override;
  end;

{ MDI Window actions }

  TWindowAction = class(TAction)
  private
    FForm: TForm;
    procedure SetForm(Value: TForm);
  protected
    function GetForm(Target: TObject): TForm; virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure UpdateTarget(Target: TObject); override;
    property Form: TForm read FForm write SetForm;
  end;

  TWindowClose = class(TWindowAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  end;

  TWindowCascade = class(TWindowAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
  end;

  TWindowTileHorizontal = class(TWindowAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
  end;

  TWindowTileVertical = class(TWindowAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
  end;

  TWindowMinimizeAll = class(TWindowAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
  end;

  TWindowArrange = class(TWindowAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
  end;

implementation

uses Windows, Messages, Clipbrd;

{ THintAction }

constructor THintAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DisableIfNoHandler := False;
end;

{ TEditAction }

function TEditAction.GetControl(Target: TObject): TCustomEdit;
begin
  { We could hard cast Target as a TCustomEdit since HandlesTarget "should" be
    called before ExecuteTarget and UpdateTarget, however, we're being safe. }
  Result := Target as TCustomEdit;
end;

function TEditAction.HandlesTarget(Target: TObject): Boolean;
begin
  Result := ((Control <> nil) and (Target = Control) or
    (Control = nil) and (Target is TCustomEdit)) and TCustomEdit(Target).Focused;
end;

procedure TEditAction.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = Control) then Control := nil;
end;

procedure TEditAction.UpdateTarget(Target: TObject);
begin
  if (Self is TEditCut) or (Self is TEditCopy) then
    Enabled := GetControl(Target).SelLength > 0;
end;

procedure TEditAction.SetControl(Value: TCustomEdit);
begin
  if Value <> FControl then
  begin
    FControl := Value;
    if Value <> nil then Value.FreeNotification(Self);
  end;
end;

{ TEditCopy }

procedure TEditCopy.ExecuteTarget(Target: TObject);
begin
  GetControl(Target).CopyToClipboard;
end;

{ TEditCut }

procedure TEditCut.ExecuteTarget(Target: TObject);
begin
  GetControl(Target).CutToClipboard;
end;

{ TEditPaste }

procedure TEditPaste.ExecuteTarget(Target: TObject);
begin
   GetControl(Target).PasteFromClipboard;
end;

procedure TEditPaste.UpdateTarget(Target: TObject);
begin
  Enabled := Clipboard.HasFormat(CF_TEXT);
end;

{ TWindowAction }

function TWindowAction.GetForm(Target: TObject): TForm;
begin
  { We could hard cast Target as a TForm since HandlesTarget "should" be called
    before ExecuteTarget and UpdateTarget, however, we're being safe. }
  Result := (Target as TForm);
end;

function TWindowAction.HandlesTarget(Target: TObject): Boolean;
begin
  Result := ((Form <> nil) and (Target = Form) or
    (Form = nil) and (Target is TForm)) and
    (TForm(Target).FormStyle = fsMDIForm);
end;

procedure TWindowAction.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = Form) then Form := nil;
end;

procedure TWindowAction.UpdateTarget(Target: TObject);
begin
  Enabled := GetForm(Target).MDIChildCount > 0;
end;

procedure TWindowAction.SetForm(Value: TForm);
begin
  if Value <> FForm then
  begin
    FForm := Value;
    if Value <> nil then Value.FreeNotification(Self);
  end;
end;

{ TWindowClose }

procedure TWindowClose.ExecuteTarget(Target: TObject);
begin
  with GetForm(Target) do
    if ActiveMDIChild <> nil then ActiveMDIChild.Close;
end;

procedure TWindowClose.UpdateTarget(Target: TObject);
begin
  Enabled := GetForm(Target).ActiveMDIChild <> nil;
end;

{ TWindowCascade }

procedure TWindowCascade.ExecuteTarget(Target: TObject);
begin
  GetForm(Target).Cascade;
end;

{ TWindowTileHorizontal }

procedure DoTile(Form: TForm; TileMode: TTileMode);
const
  TileParams: array[TTileMode] of Word = (MDITILE_HORIZONTAL, MDITILE_VERTICAL);
begin
  if (Form.FormStyle = fsMDIForm) and (Form.ClientHandle <> 0) then
    SendMessage(Form.ClientHandle, WM_MDITILE, TileParams[TileMode], 0);
end;

procedure TWindowTileHorizontal.ExecuteTarget(Target: TObject);
begin
  DoTile(GetForm(Target), tbHorizontal);
end;

{ TWindowTileVertical }

procedure TWindowTileVertical.ExecuteTarget(Target: TObject);
begin
  DoTile(GetForm(Target), tbVertical);
end;

{ TWindowMinimizeAll }

procedure TWindowMinimizeAll.ExecuteTarget(Target: TObject);
var
  I: Integer;
begin
  { Must be done backwards through the MDIChildren array }
  with GetForm(Target) do
    for I := MDIChildCount - 1 downto 0 do
      MDIChildren[I].WindowState := wsMinimized;
end;

{ TWindowArrange }

procedure TWindowArrange.ExecuteTarget(Target: TObject);
begin
  GetForm(Target).ArrangeIcons;
end;

end.
