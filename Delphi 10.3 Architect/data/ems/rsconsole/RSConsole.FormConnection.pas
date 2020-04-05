{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit RSConsole.FormConnection;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  RSConsole.FrameSettings, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TConnectionForm = class(TForm)
    SettingsFrame: TSettingsFrame;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SettingsFrameCloseButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetTitle(const ATitle: String);
  end;

var
  ConnectionForm: TConnectionForm;

implementation

{$R *.fmx}

uses
  RSConsole.Form, RSConsole.Consts;

procedure TConnectionForm.SetTitle(const ATitle: String);
begin
  Caption := strRSFormTitle + ATitle;
end;

procedure TConnectionForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ConnectionForm.Visible then
    Action := TCloseAction.caHide;
end;

procedure TConnectionForm.FormCreate(Sender: TObject);
var
  DefaultLoaded: Boolean;
begin
  MainForm.ApplyStyle(ConnectionForm);

  DefaultLoaded := SettingsFrame.ShowDefaultProfile;
  SettingsFrame.Enabled := DefaultLoaded;
  MainForm.ViewsLayout.Enabled := DefaultLoaded;
end;

procedure TConnectionForm.SettingsFrameCloseButtonClick(Sender: TObject);
begin
  MainForm.RefreshEndpoints;
  SettingsFrame.CloseButtonClick(Sender);
end;

end.
