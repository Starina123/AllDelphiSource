unit IdLogDebug;

interface

uses
  Classes,
  IdLogBase;

type
  TIdLogDebugTarget = (ltFile, ltDebugOutput, ltEvent);

  TIdLogDebug = class(TIdLogBase)
  protected
    procedure LogStatus(const AText: string); override;
    procedure LogReceivedData(const AText: string; const AData: string); override;
    procedure LogSentData(const AText: string; const AData: string); override;
  public
  published
  end;

implementation

uses
  IdGlobal;

{ TIdLogDebug }

procedure TIdLogDebug.LogReceivedData(const AText, AData: string);
begin
  DebugOutput('Recv ' + AText + ': ' + AData);    {Do not Localize}
end;

procedure TIdLogDebug.LogSentData(const AText, AData: string);
begin
  DebugOutput('Sent ' + AText + ': ' + AData);    {Do not Localize}
end;

procedure TIdLogDebug.LogStatus(const AText: string);
begin
  DebugOutput('Stat ' + AText);    {Do not Localize}
end;

end.
