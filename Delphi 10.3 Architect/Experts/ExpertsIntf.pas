{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit ExpertsIntf;


interface

uses ToolsAPI, ExpertsProject;

type
  IExpertsProjectAccessor = interface
    ['{5758F0ED-8CE5-48C1-B772-739005977158}']
    function GetCreatorType: string;
    function NewProjectSource(const ProjectName: string): IOTAFile;
    procedure NewDefaultModule;
    function GetFileName: string;
    function GetDirectory: string;
    function GetFrameWorkType: string;
    { Return the platform keys for the platforms this wizard selects }
    function GetPlatformTypes: TOSFamilySet;
    function GetUnnamed: Boolean;
  end;

  IExpertsProjectAccessor190 = interface(IExpertsProjectAccessor)
    ['{EDC8656E-4474-4F7A-86E0-86F44DA40B03}']
    { Return the platform keys for the platforms this wizard supports }
    function GetProjectPlatformTypes: TOSFamilySet;
  end;
  IExpertsModuleAccessor = interface
    ['{1452FEA7-4A4A-4A34-B7E3-CCB3A6604EDE}']
    function Designing: Boolean;
    function NewSourceFile(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
    function NewInterfaceFile(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
    function NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
    function GetAncestorName: string;
    function GetFileName: string;
    function GetFileNameExt: string;
    function GetUnnamed: Boolean;
    function GetFormName: string;
  end;

implementation

end.
