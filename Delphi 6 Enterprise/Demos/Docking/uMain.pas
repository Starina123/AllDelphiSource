unit uMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ComCtrls, ActnList, ToolWin, ExtCtrls, uDockForm;

type
  TMainForm = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton13: TToolButton;
    btnToolBar1: TToolButton;
    btnToolBar2: TToolButton;
    ActionList1: TActionList;
    ViewToolBar1: TAction;
    ViewToolBar2: TAction;
    LeftDockPanel: TPanel;
    BottomDockPanel: TPanel;
    VSplitter: TSplitter;
    HSplitter: TSplitter;
    MainMenu1: TMainMenu;
    File2: TMenuItem;
    Exit2: TMenuItem;
    View2: TMenuItem;
    N2: TMenuItem;
    ToolBar21: TMenuItem;
    ToolBar11: TMenuItem;
    ToolButton16: TToolButton;
    ViewWhiteWindow: TAction;
    ExitAction: TAction;
    ViewBlueWindow: TAction;
    ViewGreenWindow: TAction;
    ViewRedWindow: TAction;
    ViewTealWindow: TAction;
    ViewPurpleWindow: TAction;
    ViewLimeWindow: TAction;
    ToolButton4: TToolButton;
    White1: TMenuItem;
    Blue1: TMenuItem;
    Green1: TMenuItem;
    Lime1: TMenuItem;
    Purple1: TMenuItem;
    Red1: TMenuItem;
    Teal1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure CoolBar1DockOver(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure ViewToolBar1Execute(Sender: TObject);
    procedure ViewToolBar2Execute(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure LeftDockPanelDockDrop(Sender: TObject;
      Source: TDragDockObject; X, Y: Integer);
    procedure LeftDockPanelDockOver(Sender: TObject;
      Source: TDragDockObject; X, Y: Integer; State: TDragState;
      var Accept: Boolean);
    procedure BottomDockPanelDockOver(Sender: TObject;
      Source: TDragDockObject; X, Y: Integer; State: TDragState;
      var Accept: Boolean);
    procedure LeftDockPanelUnDock(Sender: TObject; Client: TControl;
      NewTarget: TWinControl; var Allow: Boolean);
    procedure ExitActionExecute(Sender: TObject);
    procedure ViewWhiteWindowExecute(Sender: TObject);
    procedure LeftDockPanelGetSiteInfo(Sender: TObject;
      DockClient: TControl; var InfluenceRect: TRect; MousePos: TPoint;
      var CanDock: Boolean);
  private
    procedure CreateDockableWindows;
  public
    procedure ShowDockPanel(APanel: TPanel; MakeVisible: Boolean; Client: TControl);
  end;

var
  MainForm: TMainForm;

implementation

uses uTabHost, uConjoinHost;

{$R *.dfm}

const
  Colors: array[0..6] of TColor = (clWhite, clBlue, clGreen, clRed, clTeal,
                                   clPurple, clLime);
  ColStr: array[0..6] of string = ('White', 'Blue', 'Green', 'Red', 'Teal',
                                   'Purple', 'Lime');

var
  DockWindows: array[0..6] of TDockableForm;

{TMainForm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  CreateDockableWindows;
end;

procedure TMainForm.CreateDockableWindows;
var
  I: Integer;
begin
  for I := 0 to High(DockWindows) do
  begin
    DockWindows[I] := TDockableForm.Create(Application);
    DockWindows[I].Caption := ColStr[I];
    DockWindows[I].Memo1.Color := Colors[I];
    DockWindows[I].Memo1.Font.Color := Colors[I] xor $00FFFFFF;
    DockWindows[I].Memo1.Text := ColStr[I] + ' window ';
  end;
end;

procedure TMainForm.CoolBar1DockOver(Sender: TObject; Source: TDragDockObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  ARect: TRect;
begin
  Accept := (Source.Control is TToolBar);
  if Accept then
  begin
    //Modify the DockRect to preview dock area (Coolbar client area)
    ARect.TopLeft := CoolBar1.ClientToScreen(CoolBar1.ClientRect.TopLeft);
    ARect.BottomRight := CoolBar1.ClientToScreen(CoolBar1.ClientRect.BottomRight);
    Source.DockRect := ARect;
  end;
end;

procedure TMainForm.ViewToolBar1Execute(Sender: TObject);
begin
  //Toggles the visible state of Toolbar1, regardless of it's docked state.
  ToolBar11.Checked := not ToolBar11.Checked;
  btnToolBar1.Down := ToolBar11.Checked;
  if ToolBar1.Floating then
    ToolBar1.HostDockSite.Visible := ToolBar11.Checked
  else
    ToolBar1.Visible := ToolBar11.Checked;
end;

procedure TMainForm.ViewToolBar2Execute(Sender: TObject);
begin
  //Toggles the visible state of Toolbar2, regardless of it's docked state.
  ToolBar21.Checked := not ToolBar21.Checked;
  btnToolBar2.Down := ToolBar21.Checked;
  if ToolBar2.Floating then
    TToolDockForm(ToolBar2.HostDockSite).Visible := ToolBar21.Checked
  else
    ToolBar2.Visible := ToolBar21.Checked;
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.LeftDockPanelDockDrop(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer);
begin
  //OnDockDrop gets called AFTER the client has actually docked,
  //so we check for DockClientCount = 1 before making the dock panel visible.
  if (Sender as TPanel).DockClientCount = 1 then
    ShowDockPanel(Sender as TPanel, True, nil);
  (Sender as TPanel).DockManager.ResetBounds(True);
  //Make DockManager repaints it's clients.    
end;

procedure TMainForm.LeftDockPanelDockOver(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
var
  ARect: TRect;
begin
  Accept := Source.Control is TDockableForm;
  if Accept then
  begin
    //Modify the DockRect to preview dock area.
    ARect.TopLeft := LeftDockPanel.ClientToScreen(Point(0, 0));
    ARect.BottomRight := LeftDockPanel.ClientToScreen(
      Point(Self.ClientWidth div 3, LeftDockPanel.Height));
    Source.DockRect := ARect;
  end;
end;

procedure TMainForm.BottomDockPanelDockOver(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
var
  ARect: TRect;
begin
  Accept := Source.Control is TDockableForm;
  if Accept then
  begin
    //Modify the DockRect to preview dock area.
    ARect.TopLeft := BottomDockPanel.ClientToScreen(
      Point(0, -Self.ClientHeight div 3));
    ARect.BottomRight := BottomDockPanel.ClientToScreen(
      Point(BottomDockPanel.Width, BottomDockPanel.Height));
    Source.DockRect := ARect;
  end;
end;

procedure TMainForm.LeftDockPanelUnDock(Sender: TObject; Client: TControl;
  NewTarget: TWinControl; var Allow: Boolean);
begin
  //OnUnDock gets called BEFORE the client is undocked, in order to optionally
  //disallow the undock. DockClientCount is never 0 when called from this event.
  if (Sender as TPanel).DockClientCount = 1 then
    ShowDockPanel(Sender as TPanel, False, nil);
end;

procedure TMainForm.ShowDockPanel(APanel: TPanel; MakeVisible: Boolean; Client: TControl);
begin
  //Client - the docked client to show if we are re-showing the panel.
  //Client is ignored if hiding the panel.

  //Since docking to a non-visible docksite isn't allowed, instead of setting
  //Visible for the panels we set the width to zero. The default InfluenceRect
  //for a control extends a few pixels beyond it's boundaries, so it is possible
  //to dock to zero width controls.

  //Don't try to hide a panel which has visible dock clients.
  if not MakeVisible and (APanel.VisibleDockClientCount > 1) then
    Exit;

  if APanel = LeftDockPanel then
    VSplitter.Visible := MakeVisible
  else
    HSplitter.Visible := MakeVisible;

    if MakeVisible then
      if APanel = LeftDockPanel then
      begin
        APanel.Width := ClientWidth div 3;
        VSplitter.Left := APanel.Width + VSplitter.Width;
      end
      else begin
        APanel.Height := ClientHeight div 3;
        HSplitter.Top := ClientHeight - APanel.Height - HSplitter.Width;
      end
    else
      if APanel = LeftDockPanel then
        APanel.Width := 0
      else
        APanel.Height := 0;
  if MakeVisible and (Client <> nil) then Client.Show;
end;

procedure TMainForm.ExitActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.ViewWhiteWindowExecute(Sender: TObject);
var
  DockWindow: TDockableForm;
begin
  DockWindow := DockWindows[(Sender as TComponent).Tag];
  with DockWindow do
    //if the docked window is TabDocked, it is docked to the PageControl
    //(owned by TTabDockHost) so show the host form.
    if HostDockSite is TPageControl then
      TTabDockHost(HostDockSite.Owner).Show
    else
      //If window is conjoin-docked, host and/or form may not be visible
      //so show both.
      if (HostDockSite is TConjoinDockHost) and not HostDockSite.Visible then
      begin
        HostDockSite.Show;
        TConjoinDockHost(HostDockSite).UpdateCaption(nil);
        DockWindow.Show;
      end else
        //If form is docked to one of the "hidden" docking panels, resize the
        //panel and re-show the docked form.
        if (HostDockSite is TPanel)
        and ((HostDockSite.Height = 0) or (HostDockSite.Width = 0)) then
          MainForm.ShowDockPanel(HostDockSite as TPanel, True, DockWindow)
        else
          //if the window isn't docked at all, simply show it.
          DockWindow.Show;
end;

procedure TMainForm.LeftDockPanelGetSiteInfo(Sender: TObject;
  DockClient: TControl; var InfluenceRect: TRect; MousePos: TPoint;
  var CanDock: Boolean);
begin
  //if CanDock is true, the panel will not automatically draw the preview rect.
  CanDock := DockClient is TDockableForm;
end;

end.
