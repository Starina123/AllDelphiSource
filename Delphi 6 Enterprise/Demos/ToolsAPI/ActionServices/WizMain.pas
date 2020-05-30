unit WizMain;

interface

uses
  SysUtils, ToolsApi;

type
  EActionServices = class(Exception);

  TActionServices = class(TNotifierObject, IOTAWizard, IOTAMenuWizard)
  private
    FIndex: Integer;
    procedure SetIndex(const Value: Integer);
  public
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Execute;
    function GetMenuText: string;
    property Index: Integer read FIndex write SetIndex;
  end;

implementation

uses
  FrmMain;

var
  ActionServices: TActionServices;

resourcestring
  sActionError = 'Error creating ActionServices wizard';

{ TActionServices }

procedure TActionServices.Execute;
begin
  if Form2 = nil then
    Form2 := TForm2.Create(nil);

  Form2.Show;
end;

function TActionServices.GetIDString: string;
begin
  Result := 'Borland.ActionServices.Demo.1'; { do not localize }
end;

function TActionServices.GetMenuText: string;
resourcestring
  sMenuText = 'Test Action Services';

begin
  Result := sMenuText;
end;

function TActionServices.GetName: string;
begin
  Result := 'Borland.ActionServices.Demo'; { do not localize }
end;

function TActionServices.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

procedure InitActionServices;
begin
  if (BorlandIDEServices <> nil) then
  begin
    ActionServices := TActionServices.Create;
    ActionServices.Index := (BorlandIDEServices as IOTAWizardServices).AddWizard(ActionServices as IOTAWizard);
    if ActionServices.Index < 0 then
      raise EActionServices.Create(sActionError);
  end;
end;

procedure DoneActionServices;
begin
  if (BorlandIDEServices <> nil) then
  begin
    if Form2 <> nil then
      Form2.Free;

    (BorlandIDEServices as IOTAWizardServices).RemoveWizard(ActionServices.Index);
  end;
end;

procedure TActionServices.SetIndex(const Value: Integer);
begin
  FIndex := Value;
end;

initialization
  InitActionServices;

finalization
  DoneActionServices;

end.
