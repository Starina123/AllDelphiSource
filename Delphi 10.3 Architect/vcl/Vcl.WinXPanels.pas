{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 2017-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Vcl.WinXPanels;

interface

uses
  System.Types,
  System.Classes,
  System.SysUtils,
  System.Generics.Collections,
  Vcl.Controls,
  Vcl.ExtCtrls;

resourcestring
  SInvalidCardPanelActiveCard = 'CardPanel.ActiveCard is out of range.';

type
  { TCardPanel }

  /// <summary>
  /// Exception class representing errors in the TCardPanel control.
  /// </summary>
  ECardPanelException = class(Exception);

  TCustomCardPanel = class;

  /// <summary>
  ///   TCard represents an individual container card in a TCardPanel control. TCard is a panel descendant and can hold
  ///   multiple controls. Only one TCard is visible at a time in a TCardPanel.
  /// </summary>
  TCard = class(TCustomPanel)
  private
    FCardPanel: TCustomCardPanel;
    FCardVisible: Boolean;
    function GetCardIndex: Integer;
    procedure SetCardIndex(const Value: Integer);
    function GetActive: Boolean;
    procedure SetActive(const Value: Boolean);
    procedure SetCardVisible(const Value: Boolean);
  protected
    procedure ReadState(Reader: TReader); override;
    procedure SetParent(AParent: TWinControl); override;
  public
    constructor Create(AOwner: TComponent); override;

    /// <summary>
    ///   Represents the TCardPanel instance that is managing this TCard instance.
    /// </summary>
    property CardPanel: TCustomCardPanel read FCardPanel;
    /// <summary>
    ///   Specifies whether the TCard instance is currently the active card in a TCardPanel.
    /// </summary>
    property Active: Boolean read GetActive write SetActive;
  published
    property Alignment;
    property BevelEdges;
    property BevelInner;
    property BevelKind;
    property BevelOuter default bvNone;
    property BevelWidth;
    property BiDiMode;
    property BorderWidth;
    property BorderStyle;
    property Caption;
    /// <summary>
    ///   Specifies the index of the card in the list of TCardPanel cards.
    /// </summary>
    property CardIndex: Integer read GetCardIndex write SetCardIndex;
    /// <summary>
    ///   Specifies whether the card is visible at runtime.
    /// </summary>
    property CardVisible: Boolean read FCardVisible write SetCardVisible default True;
    property Color;
    property Constraints;
    property Ctl3D;
    property UseDockManager default True;
    property DockSite;
    property DoubleBuffered;
    property Enabled;
    property FullRepaint;
    property Font;
    property Locked;
    property Padding;
    property ParentBiDiMode;
    property ParentBackground;
    property ParentColor;
    property ParentCtl3D;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowCaption default False;
    property ShowHint;
    property StyleElements;
    property TabOrder;
    property TabStop;
    property Touch;
    property VerticalAlignment;

    property OnAlignInsertBefore;
    property OnAlignPosition;
    property OnCanResize;
    property OnClick;
    property OnConstrainedResize;
    property OnContextPopup;
    property OnDblClick;
    property OnEnter;
    property OnExit;
    property OnGesture;
    property OnGetSiteInfo;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
  end;

  TCardClass = class of TCard;

  /// <summary>
  ///   Event handler signature for TCardPanel.OnCardChange event.
  /// </summary>
  TCardChangeEvent = procedure(Sender: TObject; PrevCard, NextCard: TCard) of object;

  /// <summary>
  /// TCustomCardPanel is the base class for TCardPanel.
  /// </summary>
  TCustomCardPanel = class(TCustomPanel)
  private
    FActiveCardIndex: Integer;
    FCardList: TList<TCard>;
    FSavedActiveCard: Integer;
    FInsertingControl: TControl;
    FInsertingControlCard: TCard;
    FLoop: Boolean;
    FOnCardChange: TCardChangeEvent;
    procedure CardRemove(Card: TCard);
    procedure Change;
    procedure ChangeActiveCard(Index: Integer);
    procedure CMControlListChanging(var Msg: TCMControlListChanging); message CM_CONTROLLISTCHANGING;
    procedure SetActiveCardIndex(Value: Integer);
    procedure DoCardChange(PrevCard, NextCard: TCard);
    procedure UpdateCardsShowing;
    function GetCardCount: Integer;
    function GetCard(Index: Integer): TCard;
    procedure MoveCard(Card: TCard; Index: Integer);
    function GetActiveCard: TCard;
    procedure SetActiveCard(const Value: TCard);
  protected
    const
      DefaultWidth = 300;
      DefaultHeight = 200;
      DefaultSpacing = 2;

    procedure Loaded; override;
    function GetCardClass: TCardClass; virtual;
    procedure CreateHandle; override;
    procedure ShowControl(AControl: TControl); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    /// <summary>
    ///   Use CreateNewCard to dynamically create a new TCard instance and make the new card active.
    /// </summary>
    function CreateNewCard: TCard; virtual;
    /// <summary>
    ///   Use DeleteCard to remove a card from a TCardPanel.
    /// </summary>
    procedure DeleteCard(Index: Integer);
    /// <summary>
    ///   Use FindNextCard to get the index of the next card in sequence going forward or backward.
    /// </summary>
    /// <param name="Index">
    ///   Starting index for search
    /// </param>
    /// <param name="GoForward">
    ///   Specifies the search direction (forward or backward)
    /// </param>
    /// <param name="CheckCardVisible">
    ///   When true, non-visible cards are ignored in search
    /// </param>
    function FindNextCard(Index: Integer; GoForward, CheckCardVisible: Boolean): Integer;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    /// <summary>
    ///   Change the active card to be the next visible card in sequence. If Loop is True and the current card is
    ///   the last card in the list, then the first card is activated. When Loop is False, navigation stops at
    ///   the last card.
    /// </summary>
    procedure NextCard;
    /// <summary>
    ///   Change the active card to be the previous visible card in sequence. If Loop is True and the current card
    ///   is the first card in the list, then the last card is activated. When Loop is False, navigation stops at
    ///   the first card.
    /// </summary>
    procedure PreviousCard;

    /// <summary>
    ///   Specifies the index of the active card.
    /// </summary>
    property ActiveCardIndex: Integer read FActiveCardIndex write SetActiveCardIndex default -1;
    /// <summary>
    ///   Specifies the reference of the currently active card.
    /// </summary>
    property ActiveCard: TCard read GetActiveCard write SetActiveCard;
    /// <summary>
    ///   Specifies the number of cards in the TCardPanel.
    /// </summary>
    property CardCount: Integer read GetCardCount;
    /// <summary>
    ///   Indexed property providing access to individual TCard instances.
    /// </summary>
    property Cards[Index: Integer]: TCard read GetCard;
    /// <summary>
    ///   Use this property to control whether the NextCard and PreviousCard methods loop around to the other end
    ///   of the card list when navigating.
    /// </summary>
    property Loop: Boolean read FLoop write FLoop default True;
    /// <summary>
    ///   This event occurs when the active card is changed to another card.
    /// </summary>
    property OnCardChange: TCardChangeEvent read FOnCardChange write FOnCardChange;
  end;

  /// <summary>
  ///   TCardPanel is a specialized panel component that manages a collection of cards. Only one card is active/visible
  ///   at a time and each card is a container for other controls.
  /// </summary>
  TCardPanel = class(TCustomCardPanel)
  published
    // Inherited Properties & Events
    property Align;
    property Alignment;
    property Anchors;
    property ActiveCard;
    property AutoSize;
    property BevelEdges;
    property BevelInner;
    property BevelKind;
    property BevelOuter;
    property BevelWidth;
    property BiDiMode;
    property BorderWidth;
    property BorderStyle;
    property Caption;
    property Color;
    property Constraints;
    property Ctl3D;
    property UseDockManager default True;
    property DockSite;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property FullRepaint;
    property Font;
    property Locked;
    property Padding;
    property ParentBiDiMode;
    property ParentBackground;
    property ParentColor;
    property ParentCtl3D;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowCaption default False;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Touch;
    property VerticalAlignment;
    property Visible;
    property StyleElements;

    property OnAlignInsertBefore;
    property OnAlignPosition;
    property OnCanResize;
    property OnCardChange;
    property OnClick;
    property OnConstrainedResize;
    property OnContextPopup;
    property OnDockDrop;
    property OnDockOver;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGesture;
    property OnGetSiteInfo;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;
  end;

  /// <summary>
  ///   Specifies orientation of TStackPanel.
  ///   spoVertical - stack will be oriented vertically, controls will be placed one under another
  ///   spoHorizontal - stack will be oriented horizontally, controls will be placed side to side
  /// </summary>
  TStackPanelOrientation = (spoVertical, spoHorizontal);

  /// <summary>
  ///   Enumeration type that specifies a control's horizontal positioning inside a vertically oriented TStackPanel.
  /// </summary>
  TStackPanelControlHorizontalPositioning = (
    /// <summary>
    ///   Control is positioned according to stack panel's HorizontalPositioning property.
    /// </summary>
    sphpDefault,
    /// <summary>
    ///   Control is positioned so that its left edge is aligned with the left edge of the stack panel.
    /// </summary>
    sphpLeft,
    /// <summary>
    ///   Control is positioned so that it is aligned horizontally with the center of the stack panel.
    /// </summary>
    sphpCenter,
    /// <summary>
    ///   Control is positioned so that its right edge is aligned with the right edge of the stack panel.
    /// </summary>
    sphpRight,
    /// <summary>
    ///   Control is resized so that its width matches the width of the stack panel.
    /// </summary>
    sphpFill);
  /// <summary>
  ///   Enumeration type that specifies the default horizontal positioning of a vertically orientated TStackPanel.
  /// </summary>
  TStackPanelHorizontalPositioning = TStackPanelControlHorizontalPositioning.sphpLeft..TStackPanelControlHorizontalPositioning.sphpFill;

  /// <summary>
  ///   Enumeration type that specifies a control's vertical positioning inside a horizontally oriented TStackPanel.
  /// </summary>
  TStackPanelControlVerticalPositioning = (
    /// <summary>
    ///   Control is positioned according to the stack panel's VerticalPositioning property.
    /// </summary>
    spvpDefault,
    /// <summary>
    ///   Control is positioned so that its top edge is aligned with the top edge of the stack panel.
    /// </summary>
    spvpTop,
    /// <summary>
    ///   Control is positioned so that it is aligned vertically with the center of the stack panel.
    /// </summary>
    spvpCenter,
    /// <summary>
    ///   Control is positioned so that its bottom edge is aligned with bottom edge of stack panel.
    /// </summary>
    spvpBottom,
    /// <summary>
    ///   Control is resized so that its height matches the height of the stack panel.
    /// </summary>
    spvpFill);
  /// <summary>
  ///   Enumeration type that specifies the default vertical positioning of a horizontally oriented TStackPanel.
  /// </summary>
  TStackPanelVerticalPositioning = TStackPanelControlVerticalPositioning.spvpTop..TStackPanelControlVerticalPositioning.spvpFill;

  /// <summary>
  ///   TStackPanelControlItem determines how the associated TControl instance is positioned within a TStackPanel.
  /// </summary>
  TStackPanelControlItem = class(TCollectionItem)
  strict private
    FControl: TControl;
    FHorizontalPositioning: TStackPanelControlHorizontalPositioning;
    FVerticalPositioning: TStackPanelControlVerticalPositioning;
  private
    function GetBounds: TRect;
    procedure SetBounds(const Value: TRect);
    procedure SetHorizontalPositioning(Value: TStackPanelControlHorizontalPositioning);
    procedure SetVerticalPositioning(Value: TStackPanelControlVerticalPositioning);
  public
    /// <summary>
    ///   Automatically sets the HorizontalPositioning and VerticalPositioning properties based on the associated
    ///   control's Align property.
    /// </summary>
    procedure MapAlign;
    constructor Create(Collection: TCollection); override;
  published
    /// <summary> Link to Control which is placed on the panel</summary>
    property Control: TControl read FControl write FControl;
    /// <summary> Control's bounds rectangle</summary>
    property Bounds: TRect read GetBounds write SetBounds;
    /// <summary>
    ///   Use this property to override the default horizontal positioning of the control
    /// </summary>
    property HorizontalPositioning: TStackPanelControlHorizontalPositioning read FHorizontalPositioning
      write SetHorizontalPositioning default sphpDefault;
    /// <summary>
    ///   Use this property to override the default vertical positioning of the control
    /// </summary>
    property VerticalPositioning: TStackPanelControlVerticalPositioning read FVerticalPositioning write SetVerticalPositioning
      default spvpDefault;
  end;

  /// <summary>
  ///   Internal class used to implement the TStackPanel.ControlCollection property
  /// </summary>
  TStackPanelControlCollection = class(TOwnedCollection)
  strict private
    function GetItem(AIndex: Integer): TStackPanelControlItem; inline;
  protected
    procedure Update(Item: TCollectionItem); override;
  public
    /// <summary>
    ///   Use this method to add a new item to the collection.
    /// </summary>
    function Add: TStackPanelControlItem; inline;
    /// <summary>
    ///   Use this method to get the index of the TStackPanelControlItem instance that is associated with the specified
    ///   TControl.
    /// </summary>
    function IndexOf(AControl: TControl): Integer;
    /// <summary>
    ///   Array property that provides access to the individual TStackPanelControlItem instances in the collection.
    /// </summary>
    property Items[AIndex: Integer]: TStackPanelControlItem read GetItem; default;
  end;

  /// <summary>
  ///   TCustomStackPanel is the base class for the TStackPanel.
  /// </summary>
  TCustomStackPanel = class(TCustomPanel)
  private
    FControlCollection: TStackPanelControlCollection;
    FHorizontalPositioning: TStackPanelHorizontalPositioning;
    FOrientation: TStackPanelOrientation;
    FSpacing: Integer;
    FVerticalPositioning: TStackPanelVerticalPositioning;
    function GetControlHorizontalPositioning(AControl: TControl): TStackPanelControlHorizontalPositioning;
    function GetControlIndex(AControl: TControl): Integer;
    function GetControlVerticalPositioning(AControl: TControl): TStackPanelControlVerticalPositioning;
    procedure MoveControlToItsCoordinates(AMovedControl: TControl);
    procedure SetControlCollection(const Value: TStackPanelControlCollection);
    procedure SetControlHorizontalPositioning(AControl: TControl; Positioning: TStackPanelControlHorizontalPositioning);
    procedure SetControlIndex(AControl: TControl; Index: Integer);
    procedure SetHorizontalPositioning(const Value: TStackPanelHorizontalPositioning);
    procedure SetOrientation(const Value: TStackPanelOrientation);
    procedure SetVerticalPositioning(const Value: TStackPanelVerticalPositioning);
    procedure SetControlVerticalPositioning(AControl: TControl; Positioning: TStackPanelControlVerticalPositioning);
    procedure SetSpacing(const Value: Integer);
  protected
    const
      DefaultHeight = 200;
      DefaultWidth = 185;
      DefaultHorizontalPositioning = sphpLeft;
      DefaultOrientation = spoVertical;
      DefaultSpacing = 2;
      DefaultVerticalPositioning = spvpCenter;

    procedure AlignControls(AControl: TControl; var Rect: TRect); override;
    procedure CMControlChange(var Msg: TCMControlChange); message CM_CONTROLCHANGE;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    /// <summary>
    ///   Use this property to access the individual control items that hold the horizontal and vertical positioning
    ///   values for each control dropped onto a stack panel.
    /// </summary>
    /// <remarks>
    ///   This property is published in the TStackPanel class so that the custom selection editor can be registered
    ///   with the development environment. However, the selection editor removes the ControlCollection property from
    ///   the list of properties that appear in the Object Inspector.
    /// </remarks>
    property ControlCollection: TStackPanelControlCollection read FControlCollection write SetControlCollection;
    /// <summary>
    ///   Use this property to change the HorizontalPositioning property of an individual control
    /// </summary>
    property ControlHorizontalPositioning[AControl: TControl]: TStackPanelControlHorizontalPositioning
      read GetControlHorizontalPositioning write SetControlHorizontalPositioning;
    /// <summary>
    ///   Use this property to get the index in the ControlCollection of the TStackPanelControlItem associated with the
    ///   specified control instance.
    /// </summary>
    property ControlIndex[AControl: TControl]: Integer read GetControlIndex write SetControlIndex;
    /// <summary>
    ///   Use this property to change the VerticalPositioning property of an individual control
    /// </summary>
    property ControlVerticalPositioning[AControl: TControl]: TStackPanelControlVerticalPositioning
      read GetControlVerticalPositioning write SetControlVerticalPositioning;
    /// <summary>
    ///   Use this property to set the default horizontal positioning of controls contained within the stack panel.
    /// </summary>
    property HorizontalPositioning: TStackPanelHorizontalPositioning read FHorizontalPositioning
      write SetHorizontalPositioning;
    /// <summary>
    ///   Use this property to set the orientation of the stack panel.
    /// </summary>
    property Orientation: TStackPanelOrientation read FOrientation write SetOrientation;
    /// <summary>
    ///   Use this property to control the spacing between controls.
    /// </summary>
    property Spacing: Integer read FSpacing write SetSpacing;
    /// <summary>
    ///   Use this property to set the default vertical positioning of controls contained within the stack panel.
    /// </summary>
    property VerticalPositioning: TStackPanelVerticalPositioning read FVerticalPositioning write SetVerticalPositioning;
  end;

  TStackPanel = class(TCustomStackPanel)
  published
    property Align;
    property Anchors;
    property AutoSize;
    property BevelEdges;
    property BevelInner;
    property BevelKind;
    property BevelOuter;
    property BevelWidth;
    property BiDiMode;
    property BorderStyle;
    property BorderWidth;
    property Color;
    property Constraints;
    property ControlCollection;
    property Ctl3D;
    property DockSite;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property FullRepaint;
    property Height default TCustomStackPanel.DefaultHeight;
    property HorizontalPositioning default TCustomStackPanel.DefaultHorizontalPositioning;
    property Locked;
    property Orientation default TCustomStackPanel.DefaultOrientation;
    property Padding;
    property ParentBackground;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Spacing default TCustomStackPanel.DefaultSpacing;
    property StyleElements;
    property TabOrder;
    property TabStop;
    property Touch;
    property UseDockManager default True;
    property VerticalPositioning default TCustomStackPanel.DefaultVerticalPositioning;
    property Visible;
    property Width default TCustomStackPanel.DefaultWidth;

    property OnAlignInsertBefore;
    property OnAlignPosition;
    property OnCanResize;
    property OnClick;
    property OnConstrainedResize;
    property OnContextPopup;
    property OnDblClick;
    property OnDockDrop;
    property OnDockOver;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGesture;
    property OnGetSiteInfo;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;
  end;

implementation

uses
  System.Math,
  Vcl.Forms;

{$WARN UNSUPPORTED_CONSTRUCT OFF}
{$WARN UNSAFE_CAST OFF}

type
  /// class TWinControlAccess was created to access protected methods of TWinControl class.
  TWinControlAccess = class(TWinControl);

{ TCard Methods }

constructor TCard.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  ControlStyle := ControlStyle + [csNoDesignVisible, csParentBackground, csPannable];

  Align := alClient;
  ShowCaption := False;
  BevelOuter := bvNone;

  FCardVisible := True;
end;

function TCard.GetActive: Boolean;
begin
  if CardPanel = nil then
    Exit(False);

  Result := CardPanel.ActiveCardIndex = CardIndex;
end;

function TCard.GetCardIndex: Integer;
begin
  if CardPanel = nil then
    Exit(-1);

  Result := CardPanel.FCardList.IndexOf(Self);
end;

procedure TCard.SetActive(const Value: Boolean);
begin
  if CardPanel = nil then
    Exit;

  if Value then
    CardPanel.ActiveCardIndex := CardIndex
  else
    CardPanel.NextCard;
end;

procedure TCard.SetCardIndex(const Value: Integer);
begin
  if (CardIndex <> Value) and (CardPanel <> nil) then
    CardPanel.MoveCard(Self, Value);
end;

procedure TCard.SetCardVisible(const Value: Boolean);
begin
  if FCardVisible = Value then
    Exit;

  FCardVisible := Value;

  if (not FCardVisible) and Active and (CardPanel <> nil) and
     not (csDesigning in ComponentState) then
    CardPanel.NextCard;
end;

procedure TCard.SetParent(AParent: TWinControl);
begin
  if Parent = AParent then
    Exit;

  inherited SetParent(AParent);

  if (Parent <> nil) and (Parent is TCardPanel) then
    FCardPanel := Parent as TCardPanel
  else
    FCardPanel := nil;
end;

procedure TCard.ReadState(Reader: TReader);
begin
  inherited;
  if Reader.Parent is TCardPanel then
    FCardPanel := TCardPanel(Reader.Parent);
end;


{ TCustomCardPanel Methods }

constructor TCustomCardPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Width := DefaultWidth;
  Height := DefaultHeight;
  FActiveCardIndex := -1;
  FSavedActiveCard := -1;
  FLoop := True;
  FCardList := TList<TCard>.Create();
  ShowCaption := False;
  UseDockManager := True;
  FInsertingControl := nil;
  FInsertingControlCard := nil;
end;

destructor TCustomCardPanel.Destroy;
begin
  inherited;
  FreeAndNil(FCardList);
end;

procedure TCustomCardPanel.CreateHandle;
begin
  inherited CreateHandle;
  if HandleAllocated then
    UpdateCardsShowing;
end;

procedure TCustomCardPanel.Loaded;
begin
  inherited Loaded;
  SetActiveCardIndex(FSavedActiveCard);
end;

function TCustomCardPanel.GetActiveCard: TCard;
begin
  if (ActiveCardIndex >= 0) and (ActiveCardIndex < CardCount) then
    Result := Cards[ActiveCardIndex]
  else
    Result := nil;
end;

function TCustomCardPanel.GetCard(Index: Integer): TCard;
begin
  Result := TCard(FCardList[Index]);
end;

function TCustomCardPanel.GetCardCount: Integer;
begin
  Result := FCardList.Count;
end;

procedure TCustomCardPanel.CardRemove(Card: TCard);
var
  Index, NextIndex: Integer;
begin
  Index := Card.CardIndex;
  if (Index = FActiveCardIndex) then
  begin
    Dec(Index);
    FActiveCardIndex := -1;

    FCardList.Remove(Card);

    NextIndex := FindNextCard(Index, True, not (csDesigning in ComponentState));
    SetActiveCardIndex(NextIndex);
  end
  else
    FCardList.Remove(Card);
end;

procedure TCustomCardPanel.Change;
var
  Form: TCustomForm;
begin
  if csDesigning in ComponentState then
  begin
    Form := GetParentForm(Self);
    if (Form <> nil) and (Form.Designer <> nil) then
      Form.Designer.Modified;
  end;
end;

procedure TCustomCardPanel.ChangeActiveCard(Index: Integer);
var
  ParentForm: TCustomForm;
  CurCard: TCard;
  NewCard: TCard;
begin
  if (Index < 0) then
    Index := 0;
  if Index >= CardCount then
    Index := CardCount - 1;

  if FActiveCardIndex <> Index then
  begin
    ParentForm := GetParentForm(Self);

    CurCard := ActiveCard;
    FActiveCardIndex := Index;
    NewCard := ActiveCard;

    if (CurCard <> nil) then
    begin
      if (ParentForm <> nil) and (CurCard is TWinControl) and
        TWinControl(CurCard).ContainsControl(ParentForm.ActiveControl) then
      begin
        ParentForm.ActiveControl := TWinControl(CurCard);
        if ParentForm.ActiveControl <> CurCard then
          Exit;
      end;
    end;

    if (NewCard <> nil) then
    begin
      NewCard.BringToFront;
      if not NewCard.Visible then
        NewCard.Visible := True;

      if (ParentForm <> nil) and (CurCard <> nil) and
        (ParentForm.ActiveControl = CurCard) then
      begin
        if (NewCard is TWinControl) and TWinControl(NewCard).CanFocus then
          ParentForm.ActiveControl := TWinControl(NewCard)
        else
          ParentForm.ActiveControl := Self;
      end;

      if (ParentForm <> nil) and
        (ParentForm.ActiveControl = NewCard) and (NewCard is TWinControl) then
      begin
        TWinControlAccess(NewCard).SelectFirst;
      end;
    end;

    UpdateCardsShowing;
    DoCardChange(CurCard, NewCard);
  end;
end;

procedure TCustomCardPanel.CMControlListChanging(var Msg: TCMControlListChanging);
var
  Idx: Integer;
  Control: TControl;
  DefaultCard: TCard;
begin
  inherited;

  if Msg.ControlListItem^.Parent = Self then
  begin
    Control := Msg.ControlListItem^.Control;
    if Msg.Inserting then
    begin
      if not (Control is TCard) then
      begin
        if (FInsertingControl = Control) and Assigned(FInsertingControlCard) and
          (FInsertingControlCard.CardIndex >= 0) then
        begin
          Control.Parent := FInsertingControlCard;
          Msg.ControlListItem^.Parent := FInsertingControlCard;
        end
        else
        begin
          DefaultCard := ActiveCard;
          if (DefaultCard = nil) then
            DefaultCard := CreateNewCard;

          if (DefaultCard <> nil) then
          begin
            Control.Parent := DefaultCard;
            Msg.ControlListItem^.Parent := DefaultCard;
            FInsertingControl := Control;
            FInsertingControlCard := DefaultCard;
          end;
        end;
      end
      else
      begin
        FInsertingControl := nil;
        FInsertingControlCard := nil;
        DefaultCard := Control as TCard;

        if FCardList.IndexOf(DefaultCard) < 0 then
        begin
          Idx := FCardList.Add(DefaultCard);
          DefaultCard.Align := alClient;

          if (not (csDesigning in ComponentState)) and
            (csGestures in DefaultCard.ControlStyle) and
            (Touch.GestureManager <> nil) then
          begin
            Touch.GestureManager.RegisterControl(DefaultCard);
          end;

          if not (csLoading in ComponentState) and (Idx <> -1) then
            SetActiveCardIndex(Idx);
        end;
      end;
    end
    else
    begin
      FInsertingControl := nil;
      FInsertingControlCard := nil;

      if (not (csDesigning in ComponentState)) and
        (csGestures in Control.ControlStyle) and
        (Touch.GestureManager <> nil) then
      begin
        Touch.GestureManager.UnregisterControl(Control);
      end;

      if Control is TCard then
        CardRemove(TCard(Control));
    end;
  end;
end;

function TCustomCardPanel.CreateNewCard: TCard;
var
  NewCard: TCard;
  NewOwner: TWinControl;
begin
  NewOwner := GetParentForm(Self);
  if NewOwner = nil then
    NewOwner := Self;

  NewCard := GetCardClass.Create(NewOwner);
  try
    if (csDesigning in ComponentState) and
      (NewOwner is TCustomForm) and
      (TCustomForm(NewOwner).Designer <> nil) then
    begin
      NewCard.Name := TCustomForm(NewOwner).Designer.UniqueName(NewCard.ClassName);
    end;
    NewCard.Parent := Self;
    Result := NewCard;
  except
    NewCard.Free;
    raise;
  end;
end;

procedure TCustomCardPanel.DeleteCard(Index: Integer);
var
  Card: TCard;
begin
  Card := Cards[Index];
  FreeAndNil(Card);
end;

procedure TCustomCardPanel.DoCardChange(PrevCard, NextCard: TCard);
begin
  if Assigned(FOnCardChange) then
    FOnCardChange(Self, PrevCard, NextCard);
end;

function TCustomCardPanel.FindNextCard(Index: Integer; GoForward, CheckCardVisible: Boolean): Integer;
var
  I, StartIndex: Integer;
  Card: TCard;
begin
  if (CardCount = 0) then
    Exit(-1);

  StartIndex := Index;
  if (StartIndex < 0) or (StartIndex >= CardCount) then
  begin
    if GoForward then
      StartIndex := CardCount - 1
    else
      StartIndex := 0;
  end;

  I := StartIndex;
  repeat
    if GoForward then
    begin
      Inc(I);
      if I > CardCount - 1 then
      begin
        if FLoop then
          I := 0
        else
          I := CardCount - 1;
      end;
    end else
    begin
      Dec(I);
      if I < 0 then
      begin
        if FLoop then
          I := CardCount - 1
        else
          I := 0;
      end;
    end;

    Result := I;
    Card := FCardList[Result];
    if not CheckCardVisible or Card.CardVisible then
      Exit;
  until I = StartIndex;

  Result := -1;
end;

function TCustomCardPanel.GetCardClass: TCardClass;
begin
  Result := TCard;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TCustomCardPanel.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I: Integer;
  Control: TControl;
begin
  for I := 0 to CardCount - 1 do
  begin
    Control := TControl(FCardList[I]);
    Proc(Control);
  end;
end;

procedure TCustomCardPanel.NextCard;
var
  Index: Integer;
begin
  Index := FindNextCard(FActiveCardIndex, True, not (csDesigning in ComponentState));
  if (Index <> -1) and (Index <> FActiveCardIndex) then
  begin
    SetActiveCardIndex(Index);
    Change;
  end else
  if (FActiveCardIndex <> -1) and not ActiveCard.CardVisible then
    FActiveCardIndex := -1;
end;

procedure TCustomCardPanel.PreviousCard;
var
  Index: Integer;
begin
  Index := FindNextCard(FActiveCardIndex, False, not (csDesigning in ComponentState));
  if (Index <> -1) and (Index <> FActiveCardIndex) then
  begin
    SetActiveCardIndex(Index);
    Change;
  end else
  if (FActiveCardIndex <> -1) and not ActiveCard.CardVisible then
    FActiveCardIndex := -1;
end;

procedure TCustomCardPanel.SetActiveCard(const Value: TCard);
var
  Idx: Integer;
begin
  Idx := Value.CardIndex;
  if (ActiveCardIndex <> Idx) and (Idx <> -1) then
    ActiveCardIndex := Idx;
end;

procedure TCustomCardPanel.SetActiveCardIndex(Value: Integer);
begin
  if (csLoading in ComponentState) then
    FSavedActiveCard := Value
  else
  begin
    if (CardCount > 0) and (FActiveCardIndex <> Value) then
    begin
      if (Value >= 0) and (Value < CardCount) then
        ChangeActiveCard(Value)
      else if not (csDesigning in ComponentState) then
        raise ECardPanelException.Create(SInvalidCardPanelActiveCard);
    end;
  end;
end;

procedure TCustomCardPanel.MoveCard(Card: TCard; Index: Integer);
var
  CurIndex: Integer;
begin
  CurIndex := FCardList.IndexOf(Card);
  if (CurIndex > -1) and (CurIndex <> Index) and
    ((csDesigning in ComponentState) or
    ((Index > -1) and (Index < CardCount))) then
  begin
    if (csDesigning in ComponentState) then
    begin
      if Index < 0 then
        Index := 0
      else if Index > CardCount - 1 then
        Index := CardCount - 1;
    end;
    if (CurIndex <> Index) then
    begin
      FCardList.Move(CurIndex, Index);
      if CurIndex = FActiveCardIndex then
        FActiveCardIndex := Index;
    end;
  end;
end;

procedure TCustomCardPanel.ShowControl(AControl: TControl);
begin
  if (AControl is TCard) and ( TCard(AControl).CardPanel = Self) then
    SetActiveCard(TCard(AControl));
  inherited;
end;

procedure TCustomCardPanel.UpdateCardsShowing;
var
  Card: TCard;
  CurrentActiveCard: TCard;
begin
  CurrentActiveCard := ActiveCard;

  for Card in FCardList do
  begin
    Card.Visible := (CurrentActiveCard = Card) and (Card.CardVisible or (csDesigning in ComponentState));
  end;
end;


{ TStackPanelControlItem Methods }

constructor TStackPanelControlItem.Create(Collection: TCollection);
begin
  inherited;
  FHorizontalPositioning := sphpDefault;
  FVerticalPositioning := spvpDefault;
end;

function TStackPanelControlItem.GetBounds: TRect;
begin
  Result := Control.BoundsRect;
end;

procedure TStackPanelControlItem.MapAlign;
begin
  if Control <> nil then
  begin
    case Control.Align of
      alTop:
        begin
          HorizontalPositioning := sphpFill;
          VerticalPositioning := spvpTop;
        end;
      alBottom:
        begin
          HorizontalPositioning := sphpFill;
          VerticalPositioning := spvpBottom;
        end;
      alLeft:
        begin
          VerticalPositioning := spvpFill;
          HorizontalPositioning := sphpLeft;
        end;
      alRight:
        begin
          VerticalPositioning := spvpFill;
          HorizontalPositioning := sphpRight;
        end;
      alClient:
        begin
          HorizontalPositioning := sphpFill;
          VerticalPositioning := spvpFill;
        end;
      alNone, alCustom:
        { do nothing };
    end;
  end;
end;

procedure TStackPanelControlItem.SetBounds(const Value: TRect);
begin
  Control.Margins.SetControlBounds(Value);
end;

procedure TStackPanelControlItem.SetHorizontalPositioning(Value: TStackPanelControlHorizontalPositioning);
begin
  if FHorizontalPositioning <> Value then
  begin
    FHorizontalPositioning := Value;
    Changed(False);
  end;
end;

procedure TStackPanelControlItem.SetVerticalPositioning(Value: TStackPanelControlVerticalPositioning);
begin
  if FVerticalPositioning <> Value then
  begin
    FVerticalPositioning := Value;
    Changed(False);
  end;
end;

{ TStackPanelControlCollection Methods }

function TStackPanelControlCollection.Add: TStackPanelControlItem;
begin
  Result := TStackPanelControlItem(inherited Add)
end;

function TStackPanelControlCollection.GetItem(AIndex: Integer): TStackPanelControlItem;
begin
  Result := TStackPanelControlItem(inherited Items[AIndex]);
end;

function TStackPanelControlCollection.IndexOf(AControl: TControl): Integer;
begin
  for Result := 0 to Count - 1 do
  begin
    if TStackPanelControlItem(Items[Result]).Control = AControl then
      Exit;
  end;
  Result := -1;
end;

procedure TStackPanelControlCollection.Update(Item: TCollectionItem);
begin
  inherited;
  Assert(Owner is TWinControl);
  TWinControl(Owner).Realign;
  TWinControl(Owner).Invalidate;
end;

{ TCustomStackPanel Methods }

constructor TCustomStackPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FControlCollection := TStackPanelControlCollection.Create(Self, TStackPanelControlItem);

  FHorizontalPositioning := DefaultHorizontalPositioning;
  FOrientation := DefaultOrientation;
  FSpacing := DefaultSpacing;
  FVerticalPositioning := DefaultVerticalPositioning;
  ShowCaption := False;
  Height := DefaultHeight;
  Width := DefaultWidth;
end;

destructor TCustomStackPanel.Destroy;
begin
  FreeAndNil(FControlCollection);
  inherited;
end;

procedure TCustomStackPanel.AlignControls(AControl: TControl; var Rect: TRect);
var
  I: Integer;
  Position: TPoint;
  Size: TSize;
  Control: TControl;
  ControlInfo: TStackPanelControlItem;
  Bounds: TRect;
  HorzPos: TStackPanelControlHorizontalPositioning;
  VertPos: TStackPanelControlVerticalPositioning;
begin
  if (csDesigning in ComponentState) and (AControl <> nil) then
    MoveControlToItsCoordinates(AControl);

  if (FControlCollection <> nil) and (ControlCollection.Count > 0) then
  begin
    AdjustClientRect(Rect);
    Position := Rect.TopLeft;

    for I := 0 to ControlCollection.Count - 1 do
    begin
      ControlInfo := ControlCollection[I];
      if ControlInfo <> nil then
      begin
        ControlInfo.MapAlign;

        Control := ControlInfo.Control;
        if ((Control <> nil) and (Control.Visible or (csDesigning in ComponentState))) then
        begin
          // The area occupied by the control is affected by the Margins
          Size.cx := Control.Margins.ControlWidth;
          Size.cy := Control.Margins.ControlHeight;
          Bounds := ControlInfo.Bounds;
          Bounds.Width := Size.cx;
          Bounds.Height := Size.cy;

          if Orientation = spoVertical then
          begin
            HorzPos := ControlHorizontalPositioning[Control];
            if HorzPos = sphpDefault then
              HorzPos := FHorizontalPositioning;

            case HorzPos of
              sphpLeft:
                Bounds.SetLocation(Rect.Left, Position.Y);
              sphpCenter:
                Bounds.SetLocation(Rect.Left + (Rect.Width - Size.cx) div 2, Position.Y);
              sphpRight:
                Bounds.SetLocation(Rect.Left + Rect.Width - Size.cx, Position.Y);
              sphpFill:
                begin
                  Bounds.SetLocation(Rect.Left, Position.Y);
                  Bounds.Width := Rect.Width;
                end
            end;

            Inc(Position.Y, Size.cy + Spacing);
          end
          else if Orientation = spoHorizontal then
          begin
            VertPos := ControlVerticalPositioning[Control];
            if VertPos = spvpDefault then
              VertPos := FVerticalPositioning;

            case VertPos of
              spvpTop:
                Bounds.SetLocation(Position.X, Rect.Top);
              spvpCenter:
                Bounds.SetLocation(Position.X, Rect.Top + (Rect.Height - Size.cy) div 2);
              spvpBottom:
                Bounds.SetLocation(Position.X, Rect.Top + Rect.Height - Size.cy);
              spvpFill:
                begin
                  Bounds.SetLocation(Position.X, Rect.Top);
                  Bounds.Height := Rect.Height;
                end
            end;

            Inc(Position.X, Size.cx + Spacing);
          end;

          ControlInfo.SetBounds(Bounds);
          if csDesigning in ComponentState then
            Control.Invalidate;
        end;
      end;
    end;
    ControlsAligned;
  end;
  if Showing then
    AdjustSize;
end;

procedure TCustomStackPanel.CMControlChange(var Msg: TCMControlChange);
var
  Index: Integer;
begin
  inherited;

  if (csDestroying in ComponentState) or (csLoading in ComponentState) or (FControlCollection = nil) then
    Exit;

  if Msg.Inserting and (Msg.Control.Parent = Self) then
  begin
    DisableAlign;
    try
      if (ControlCollection.IndexOf(Msg.Control) < 0) and (Msg.Control.Owner = Self.Owner) then
      begin
        ControlCollection.Add.Control := Msg.Control;
        if csDesigning in ComponentState then
          MoveControlToItsCoordinates(Msg.Control);
        Realign;
      end;
    finally
      EnableAlign;
    end;
  end
  else
  begin
    Index := ControlCollection.IndexOf(Msg.Control);
    if (Index > -1) then
      ControlCollection.Delete(Index);
  end;
end;

procedure TCustomStackPanel.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I: Integer;
  Control: TControl;
begin
  if ControlCollection <> nil then
  begin
    for I := 0 to ControlCollection.Count - 1 do
    begin
      Control := TControl(ControlCollection[I].Control);
      if (Control <> nil) and (Control.Owner = Root) then
        Proc(Control);
    end;
  end;
end;

function TCustomStackPanel.GetControlHorizontalPositioning(AControl: TControl): TStackPanelControlHorizontalPositioning;
var
  ControlIndex: Integer;
begin
  Result := sphpDefault;
  ControlIndex := GetControlIndex(AControl);
  if (ControlIndex > -1) and (ControlIndex < ControlCollection.Count) then
    Result := ControlCollection[ControlIndex].HorizontalPositioning;
end;

function TCustomStackPanel.GetControlIndex(AControl: TControl): Integer;
begin
  Result := ControlCollection.IndexOf(AControl);
end;

function TCustomStackPanel.GetControlVerticalPositioning(AControl: TControl): TStackPanelControlVerticalPositioning;
var
  ControlIndex: Integer;
begin
  Result := spvpDefault;
  ControlIndex := GetControlIndex(AControl);
  if (ControlIndex > -1) and (ControlIndex < ControlCollection.Count) then
    Result := ControlCollection[ControlIndex].VerticalPositioning;
end;

procedure TCustomStackPanel.MoveControlToItsCoordinates(AMovedControl: TControl);
const
  MaxDelta = 8;
var
  I, CurIndex, FoundIndex, Delta: Integer;
  Control: TControl;
  ControlRect: TRect;
begin
  if (ControlCollection = nil) or (AMovedControl = nil) then
    Exit;

  CurIndex := GetControlIndex(AMovedControl);

  if (CurIndex = -1) or (CurIndex >= ControlCollection.Count) then
    Exit;

  ControlRect := AMovedControl.BoundsRect;
  FoundIndex := 0;

  for I := 0 to ControlCollection.Count - 1 do
  begin
    Control := ControlCollection[I].Control;
    if (Control = nil) or (Control = AMovedControl) then
      Continue;

    case Orientation of
      spoVertical:
        begin
          Delta := Min(MaxDelta, Control.Height div 2);
          if ((ControlRect.Top + Delta) > (Control.Top + Control.Height div 2)) then
            FoundIndex := I + 1;
        end;

      spoHorizontal:
        begin
          Delta := Min(MaxDelta, Control.Width div 2);
          if ((ControlRect.Left + Delta) > (Control.Left + Control.Width div 2)) then
            FoundIndex := I + 1;
        end;
    end;
  end;

  if (FoundIndex > CurIndex) and (FoundIndex > 0) then
    FoundIndex := FoundIndex - 1;

  if (FoundIndex >= ControlCollection.Count) then
    FoundIndex := ControlCollection.Count - 1;

  ControlCollection[CurIndex].Index := FoundIndex;
end;

procedure TCustomStackPanel.SetControlCollection(const Value: TStackPanelControlCollection);
begin
  ControlCollection.Assign(Value);
end;

procedure TCustomStackPanel.SetControlHorizontalPositioning(AControl: TControl;
  Positioning: TStackPanelControlHorizontalPositioning);
var
  ControlIndex: Integer;
begin
  ControlIndex := GetControlIndex(AControl);
  if (ControlIndex > -1) and (ControlIndex < ControlCollection.Count) then
    ControlCollection[ControlIndex].HorizontalPositioning := Positioning;
end;

procedure TCustomStackPanel.SetControlIndex(AControl: TControl; Index: Integer);
var
  CurIndex: Integer;
begin
  CurIndex := GetControlIndex(AControl);
  if (CurIndex > -1) and (CurIndex <> Index) and (Index < ControlCollection.Count) then
  begin
    ControlCollection[CurIndex].Index := Index;
    Realign;
  end;
end;

procedure TCustomStackPanel.SetControlVerticalPositioning(AControl: TControl;
  Positioning: TStackPanelControlVerticalPositioning);
var
  Index: Integer;
begin
  Index := GetControlIndex(AControl);
  if (Index > -1) and (Index < ControlCollection.Count) then
    ControlCollection[Index].VerticalPositioning := Positioning;
end;

procedure TCustomStackPanel.SetHorizontalPositioning(const Value: TStackPanelHorizontalPositioning);
begin
  if FHorizontalPositioning <> Value then
  begin
    FHorizontalPositioning := Value;
    if Orientation = spoVertical then
      Realign;
  end;
end;

procedure TCustomStackPanel.SetOrientation(const Value: TStackPanelOrientation);
begin
  if FOrientation <> Value then
  begin
    FOrientation := Value;
    Realign;
  end;
end;

procedure TCustomStackPanel.SetSpacing(const Value: Integer);
begin
  if FSpacing <> Value then
  begin
    FSpacing := Value;
    Realign;
  end;
end;

procedure TCustomStackPanel.SetVerticalPositioning(const Value: TStackPanelVerticalPositioning);
begin
  if FVerticalPositioning <> Value then
  begin
    FVerticalPositioning := Value;
    if Orientation = spoHorizontal then
      Realign;
  end;
end;

initialization

  System.Classes.RegisterClasses([TCard]);

end.
