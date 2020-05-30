unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  CtlPanel;

type
  TDTConfig = class(TAppletModule)
    procedure DTConfigActivate(Sender: TObject; Data: Integer);
  private
  { private declarations }
  protected
  { protected declarations }
  public
  { public declarations }
  end;

var
  DTConfig: TDTConfig;

implementation

{$R *.dfm}

uses
  ufrmdt;

procedure TDTConfig.DTConfigActivate(Sender: TObject; Data: Integer);
var
  SysTime: TSystemTime;
  DateTime: TDateTime;

begin
  with TfrmDateTime.CreateParented(Application.ControlPanelHandle) do
  begin
    if ShowModal = mrOK then
    begin
      DateTime := Now;
      ReplaceDate(DateTime, Calendar.CalendarDate);
      DateTimeToSystemTime(DateTime, SysTime);
      SetLocalTime(SysTime);
    end;
    Free;
  end;
end;

end.
