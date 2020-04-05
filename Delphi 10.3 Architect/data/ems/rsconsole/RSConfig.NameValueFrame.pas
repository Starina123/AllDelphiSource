{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit RSConfig.NameValueFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, System.StrUtils,
  FMX.DialogService,
  RSConfig.ConfigDM;

type
  TNameValueFrame = class(TFrame)
    Layout: TLayout;
    ValueEdit: TEdit;
    ConfigButton: TButton;
    CheckBox: TCheckBox;
    NameEdit: TEdit;
    LeftLayout: TLayout;
    procedure ConfigButtonClick(Sender: TObject);
  private
    { Private declarations }
    FCallback: TNotifyEvent;
  public
    { Public declarations }
    procedure SetCallback(ACallback: TNotifyEvent);
  end;

implementation

{$R *.fmx}

procedure TNameValueFrame.ConfigButtonClick(Sender: TObject);
begin
  FCallback(Self);
end;

procedure TNameValueFrame.SetCallback(ACallback: TNotifyEvent);
begin
  FCallback := ACallback;
end;

end.
