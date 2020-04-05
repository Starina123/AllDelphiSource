{*******************************************************}
{                                                       }
{             Delphi REST Client Framework              }
{                                                       }
{ Copyright(c) 2013-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit uWait;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs,
  FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation;

type
  ///	<summary>
  ///	  TWait is a simple TForm based that can be used to visualize, that the application is currently busy executing
  ///	  some code.
  ///	</summary>
  ///	<remarks>
  ///	  TWait implements a singleton pattern.
  ///	</remarks>
  ///	<example>
  ///	  TWait.Start;<br />try<br />  // do your time consuming stuff here<br />finally<br />  TWait.Done;<br />end;
  ///	</example>
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
    ///	<summary>
    ///	  Call Start to bring up the Wait form on top and centered above your main form.
    ///	</summary>
    ///	<param name="AMessage">
    ///	  <para>
    ///	    An optional short message to present to the user. Default is "Working ..."
    ///	  </para>
    ///	  <para>
    ///	    Can be called multiple times, to update its message.
    ///	  </para>
    ///	  <para>
    ///	    Calls Application.ProcessMessages 
    ///	  </para>
    ///	</param>
    class procedure Start(const AMessage: string = '');

    ///	<summary>
    ///	  Call Done to close the Wait form. If there is currently no Wait form, then this call will just be ignored.
    ///	</summary>
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
    if not FindCmdLineSwitch('nw') and (DebugHook = 0) then
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
  if assigned(FInstance) then
  begin
    FInstance.Release;
    FInstance := nil;
  end;
end;

class function TWait.Instance: TWait;
begin
  if not assigned(FInstance) then begin
    FInstance := TWait.create(Application.MainForm);
    //center manually, as poOwnerFormCenter appears to be broken in XE4
    FInstance.Top := Application.MainForm.Top + Trunc(Application.MainForm.Height / 2 ) - Trunc(FInstance.Height /2);
    FInstance.Left := Application.MainForm.Left + Trunc(Application.MainForm.Width / 2 ) - Trunc(FInstance.Width /2);
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
