unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  AppEvnts, ActnList, Menus, StdCtrls;

type
  TMainForm = class(TForm)
    ApplicationEvents: TApplicationEvents;
    ActionList: TActionList;
    Action: TAction;
    MainMenu: TMainMenu;
    MenuAction: TMenuItem;
    MenuException: TMenuItem;
    HintButton: TButton;
    lbOnMessage: TListBox;
    lblOnMessage: TLabel;
    lbOther: TListBox;
    lblOther: TLabel;
    lbIdle: TListBox;
    lblOnIdle: TLabel;
    lbActionUpdate: TListBox;
    lblOnActionUpdate: TLabel;
    procedure ApplicationEventsActionExecute(Action: TBasicAction;
      var Handled: Boolean);
    procedure ApplicationEventsActionUpdate(Action: TBasicAction;
      var Handled: Boolean);
    procedure ApplicationEventsActivate(Sender: TObject);
    procedure ApplicationEventsDeactivate(Sender: TObject);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    function ApplicationEventsHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure ApplicationEventsHint(Sender: TObject);
    procedure ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
    procedure ApplicationEventsMessage(var Msg: tagMSG;
      var Handled: Boolean);
    procedure ApplicationEventsMinimize(Sender: TObject);
    procedure ApplicationEventsRestore(Sender: TObject);
    procedure ApplicationEventsShortCut(var Msg: TWMKey;
      var Handled: Boolean);
    procedure ApplicationEventsShowHint(var HintStr: String;
      var CanShow: Boolean; var HintInfo: THintInfo);
    procedure ActionExecute(Sender: TObject);
    procedure MenuExceptionClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.ApplicationEventsActionExecute(Action: TBasicAction;
  var Handled: Boolean);
begin
  lbOther.Items.Add('Event OnActionExecute');
end;

procedure TMainForm.ApplicationEventsActionUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  lbActionUpdate.Items.Add('Event OnActionUpdate');
end;

procedure TMainForm.ApplicationEventsActivate(Sender: TObject);
begin
  lbOther.Items.Add('Event OnActivate');
end;

procedure TMainForm.ApplicationEventsDeactivate(Sender: TObject);
begin
  lbOther.Items.Add('Event OnDeactivate');
end;

procedure TMainForm.ApplicationEventsException(Sender: TObject;
  E: Exception);
begin
  lbOther.Items.Add('Event OnException: ' + E.Message);
end;

function TMainForm.ApplicationEventsHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
  lbOther.Items.Add('Event OnHelp');
  Result := False;
end;

procedure TMainForm.ApplicationEventsHint(Sender: TObject);
begin
  lbOther.Items.Add('Event OnHint');
end;

procedure TMainForm.ApplicationEventsIdle(Sender: TObject;
  var Done: Boolean);
begin
  lbIdle.Items.Add('Event OnIdle');
end;

procedure TMainForm.ApplicationEventsMessage(var Msg: tagMSG;
  var Handled: Boolean);
begin
  lbOnMessage.Items.Add('X:=' + IntToStr(Msg.pt.x) + '|Y:=' + IntToStr(Msg.pt.y));
end;

procedure TMainForm.ApplicationEventsMinimize(Sender: TObject);
begin
  lbOther.Items.Add('Event OnMinimize');
end;

procedure TMainForm.ApplicationEventsRestore(Sender: TObject);
begin
  lbOther.Items.Add('Event OnRestore');
end;

procedure TMainForm.ApplicationEventsShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
  lbOther.Items.Add('Event OnShortCut');
end;

procedure TMainForm.ApplicationEventsShowHint(var HintStr: String;
  var CanShow: Boolean; var HintInfo: THintInfo);
begin
  lbOther.Items.Add('Event OnShowHint');
end;

procedure TMainForm.ActionExecute(Sender: TObject);
begin
  ShowMessage('Action executed');
end;

procedure TMainForm.MenuExceptionClick(Sender: TObject);
resourcestring
  sExceptionRaised = 'This is an exception';

begin
  raise Exception.Create(sExceptionRaised);
end;

end.
