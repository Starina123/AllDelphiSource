{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit RSConfig.PackagesFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Data.Bind.Controls, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts,
  FMX.Bind.Navigator, FMX.Platform, System.StrUtils, RSConfig.NameValueFrame,
  FMX.ListBox, RSConfig.ListControlFrame;

type
  TPackagesFrame = class(TFrame)
    ListControlFrame1: TListControlFrame;
    ListBox1: TListBox;
  private
    { Private declarations }
  public
    { Public declarations }
    ActiveFrame: TNameValueFrame;
    constructor Create(AOwner: TComponent); override;
    procedure Callback(Sender: TObject);
    procedure LoadSectionList;
    procedure SaveSectionList;
  end;

implementation

{$R *.fmx}

uses
  RSConsole.FormConfig, RSConfig.ConfigDM, RSConfig.Consts;

constructor TPackagesFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ListControlFrame1.HelpButton.Hint := strPackagesHelp;
end;

procedure TPackagesFrame.Callback(Sender: TObject);
var
  LOpenDialog: TOpenDialog;
begin
  ActiveFrame := TNameValueFrame(Sender);
  LOpenDialog := TOpenDialog.Create(Self);
  try
    LOpenDialog.DefaultExt := 'bpl';
    LOpenDialog.Filter := strResModuleFiles + '|*.bpl';
    LOpenDialog.FileName := ExtractFileName(ActiveFrame.NameEdit.Text);
    LOpenDialog.InitialDir := IfThen(ActiveFrame.NameEdit.Text <> '',
      ExtractFilePath(ActiveFrame.NameEdit.Text), GetCurrentDir);
    if LOpenDialog.Execute then
      ActiveFrame.NameEdit.Text := LOpenDialog.FileName;
  finally
    LOpenDialog.Free;
  end;
  ActiveFrame := nil;
end;

procedure TPackagesFrame.LoadSectionList;
begin
  ListControlFrame1.SetFrameType(PACKAGES_FRAME);
  ListControlFrame1.SetListBox(ListBox1);
  ListControlFrame1.SetCallback(Callback);
  ConfigDM.LoadSectionList(strServerPackages, ListBox1, Callback);
end;

procedure TPackagesFrame.SaveSectionList;
begin
  ConfigDM.SaveSectionList(strServerPackages, ListBox1);
end;

end.
