{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit RSConsole.Wait;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs,
  FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation;

type
  TWait = class(TForm)
    LabelStatus: TLabel;
    Image1: TImage;
  private
  class var
    FInstance: TWait;
    FWaitEnabled: Integer;
    class function Instance: TWait; static;
    class function WaitEnabled: Boolean; static;
    class constructor Create;
  public
    class procedure Start(const AMessage: string = '');
    class procedure Done;
  end;

implementation

{$R *.fmx}

class constructor TWait.Create;
begin
  FWaitEnabled := -1;
end;

class function TWait.WaitEnabled: Boolean;
begin
  if FWaitEnabled < 0 then
{$WARNINGS OFF}
    if not FindCmdLineSwitch('nw') and (DebugHook = 0) then
{$WARNINGS ON}
      FWaitEnabled := 1
    else
      FWaitEnabled := 0;
  Result := FWaitEnabled = 1;
end;

// Simplistic Singleton/Lazyloader
class procedure TWait.Done;
begin
  if not WaitEnabled then
    Exit;
  if Assigned(FInstance) then
  begin
    FInstance.DisposeOf;
    FInstance := nil;
  end;
end;

class function TWait.Instance: TWait;
begin
  if not Assigned(FInstance) then
  begin
    FInstance := TWait.Create(Application.MainForm);
    // center manually, as poOwnerFormCenter appears to be broken in XE4
    FInstance.Top := Application.MainForm.Top +
      Trunc(Application.MainForm.Height / 2) - Trunc(FInstance.Height / 2);
    FInstance.Left := Application.MainForm.Left +
      Trunc(Application.MainForm.Width / 2) - Trunc(FInstance.Width / 2);
  end;
  Result := FInstance;
end;

class procedure TWait.Start(const AMessage: string = '');
begin
  if not WaitEnabled then
    Exit;
  if AMessage <> '' then
    Instance.LabelStatus.Text := AMessage;
  Instance.Show;
  Application.ProcessMessages;
end;

end.
