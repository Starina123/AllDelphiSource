{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit RSConfig.ListControlFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ListBox, FMX.Layouts, RSConfig.ConfigDM;

type
  TListControlFrame = class(TFrame)
    Layout1: TLayout;
    AddButton: TButton;
    RemoveButton: TButton;
    Layout2: TLayout;
    DownButton: TButton;
    UpButton: TButton;
    HelpButton: TButton;
    procedure AddButtonClick(Sender: TObject);
    procedure RemoveButtonClick(Sender: TObject);
    procedure DownButtonClick(Sender: TObject);
    procedure UpButtonClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
  private
    { Private declarations }
    FFrameType: Integer;
    FVertScrollBox: TVertScrollBox;
    FListBox: TListBox;
    FCallback: TNotifyEvent;
  public
    { Public declarations }
    function GetFrameType: Integer;
    procedure SetFrameType(AFrameType: Integer);
    procedure SetVertScrollBox(AVertScrollBox: TVertScrollBox);
    procedure SetListBox(AListBox: TListBox);
    procedure SetCallback(ACallback: TNotifyEvent);
  end;

implementation

{$R *.fmx}

uses
  RSConsole.FormConfig, RSConfig.NameValueFrame, RSConfig.Consts;

procedure TListControlFrame.DownButtonClick(Sender: TObject);
begin
  if FListBox.Items.Count > FListBox.ItemIndex + 1 then
  begin
    FListBox.ItemsExchange(FListBox.ListItems[FListBox.ItemIndex],
      FListBox.ListItems[FListBox.ItemIndex + 1]);
    ConfigDM.RenumberListItems(FListBox);
  end;
end;

function TListControlFrame.GetFrameType: Integer;
begin
  Result := FFrameType;
end;

procedure TListControlFrame.HelpButtonClick(Sender: TObject);
begin
  ConfigDM.ShowHelp(Sender);
end;

procedure TListControlFrame.RemoveButtonClick(Sender: TObject);
begin
  if FListBox.ItemIndex > -1 then
  begin
    FListBox.Items.Delete(FListBox.ItemIndex);
    ConfigDM.RenumberListItems(FListBox);
  end;
end;

procedure TListControlFrame.SetFrameType(AFrameType: Integer);
begin
  FFrameType := AFrameType;
end;

procedure TListControlFrame.AddButtonClick(Sender: TObject);
begin
  ConfigDM.AddSectionListItem(True, '', '', FListBox, FCallback);
end;

procedure TListControlFrame.SetVertScrollBox(AVertScrollBox: TVertScrollBox);
begin
  FVertScrollBox := AVertScrollBox;
end;

procedure TListControlFrame.UpButtonClick(Sender: TObject);
begin
  if FListBox.ItemIndex > 0 then
  begin
    FListBox.ItemsExchange(FListBox.ListItems[FListBox.ItemIndex],
      FListBox.ListItems[FListBox.ItemIndex - 1]);
    ConfigDM.RenumberListItems(FListBox);
  end
end;

procedure TListControlFrame.SetListBox(AListBox: TListBox);
begin
  FListBox := AListBox;
end;

procedure TListControlFrame.SetCallback(ACallback: TNotifyEvent);
begin
  FCallback := ACallback;
end;

end.
