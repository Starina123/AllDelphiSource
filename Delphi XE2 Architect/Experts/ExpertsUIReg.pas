{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}
unit ExpertsUIReg;

interface

uses ToolsAPI, SysUtils;

procedure Register;

implementation

uses ExpertsUIResStrs, Classes,  DesignEditors, DesignIntf,
  Dialogs, Forms, ExpertsUIWizard;


procedure Register;
begin
  RegisterComponents(rsExpertsComponents, [TExpertsWizard, TExpertsFrameWizardPage,
    TExpertsFeaturesWizardPage]);
end;


end.
