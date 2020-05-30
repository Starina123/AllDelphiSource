unit uTabHost;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls;

type
  TTabDockHost = class(TForm)
    PageControl1: TPageControl;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageControl1UnDock(Sender: TObject; Client: TControl;
      NewTarget: TWinControl; var Allow: Boolean);
    procedure PageControl1GetSiteInfo(Sender: TObject;
      DockClient: TControl; var InfluenceRect: TRect; MousePos: TPoint;
      var CanDock: Boolean);
    procedure PageControl1DockOver(Sender: TObject;
      Source: TDragDockObject; X, Y: Integer; State: TDragState;
      var Accept: Boolean);
  private

   { Private declarations }
  public
    { Public declarations }
  end;

var
  TabDockHost: TTabDockHost;

implementation

{$R *.dfm}

uses uDockForm;

procedure TTabDockHost.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  ARect: TRect;
begin
  if PageControl1.DockClientCount = 1 then
  begin
    with PageControl1.DockClients[0] do
    begin
      ARect.TopLeft := ClientToScreen(Point(0, 0));
      ARect.BottomRight := ClientToScreen(Point(UndockWidth, UndockHeight));
      ManualFloat(ARect);
    end;
    Action := caFree;
  end else
    Action := caHide;
end;

procedure TTabDockHost.PageControl1UnDock(Sender: TObject;
  Client: TControl; NewTarget: TWinControl; var Allow: Boolean);
begin
  //only 2 dock clients means the host must be destroyed and
  //the remaining window undocked to its old position and size.
  if (PageControl1.DockClientCount = 2) and (NewTarget <> Self) then
    PostMessage(Self.Handle, WM_CLOSE, 0, 0);
end;

procedure TTabDockHost.PageControl1GetSiteInfo(Sender: TObject;
  DockClient: TControl; var InfluenceRect: TRect; MousePos: TPoint;
  var CanDock: Boolean);
begin
  CanDock := DockClient is TDockableForm;
end;

procedure TTabDockHost.PageControl1DockOver(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
begin
  Accept := Source.Control is TDockableForm;
end;

end.
