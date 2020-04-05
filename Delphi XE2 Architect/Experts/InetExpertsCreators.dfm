object InetExpertsCreatorsModule: TInetExpertsCreatorsModule
  OldCreateOrder = False
  Height = 384
  Width = 526
  object CommonTemplateProperties: TExpertsTemplateProperties
    Left = 184
    Top = 144
  end
  object WebModule: TExpertsModule
    SourceTemplateFile = WebModuleSourceTemplate
    InterfaceTemplateFile = WebModuleIntfTemplate
    FormTemplateFile = WebModuleDFMTemplate
    TemplateProperties = CommonTemplateProperties
    AncestorName = 'WebModule'
    FileName = 'WebModuleUnit%d'
    FormName = 'WebModule%d'
    Left = 56
    Top = 144
  end
  object ProjectTemplate: TExpertsTemplateFile
    TemplateFileManager = WebModulesTemplatePersonalityFiles
    Left = 168
    Top = 24
  end
  object WebProject: TExpertsProject
    ProjectType = ptApplication
    ProjectTemplateFile = ProjectTemplate
    TemplateProperties = CommonTemplateProperties
    OnCreateModules = WebProjectCreateModules
    Left = 64
    Top = 24
  end
  object ConsoleSourceTemplate: TExpertsTemplateFile
    TemplateProperties = CommonTemplateProperties
    TemplatePropertiesDoc.Strings = (
      'IndyFormConsoleSource=TRUE')
    TemplateFileManager = WebModulesTemplatePersonalityFiles
    Left = 416
    Top = 80
  end
  object WebModuleIntfTemplate: TExpertsTemplateFile
    TemplateProperties = CommonTemplateProperties
    TemplatePropertiesDoc.Strings = (
      'WebModuleIntf=TRUE')
    TemplateFileManager = WebModulesTemplatePersonalityFiles
    Left = 56
    Top = 248
  end
  object WebModuleSourceTemplate: TExpertsTemplateFile
    TemplateProperties = CommonTemplateProperties
    TemplatePropertiesDoc.Strings = (
      'WebModuleSource=TRUE')
    TemplateFileManager = WebModulesTemplatePersonalityFiles
    Left = 56
    Top = 200
  end
  object WebModuleDFMTemplate: TExpertsTemplateFile
    TemplateProperties = CommonTemplateProperties
    TemplatePropertiesDoc.Strings = (
      'WebModuleDFMSource=TRUE')
    TemplateFileManager = WebModulesTemplatePersonalityFiles
    Left = 48
    Top = 304
  end
  object ConsoleModule: TExpertsModule
    SourceTemplateFile = ConsoleSourceTemplate
    InterfaceTemplateFile = ConsoleIntfTemplate
    FormTemplateFile = ConsoleDFMTemplate
    TemplateProperties = CommonTemplateProperties
    AncestorName = 'Form'
    FileName = 'FormUnit%d'
    FormName = 'Form%d'
    Left = 416
    Top = 32
  end
  object ConsoleIntfTemplate: TExpertsTemplateFile
    TemplateProperties = CommonTemplateProperties
    TemplatePropertiesDoc.Strings = (
      'IndyFormConsoleIntf=TRUE')
    TemplateFileManager = WebModulesTemplatePersonalityFiles
    Left = 416
    Top = 136
  end
  object ConsoleDFMTemplate: TExpertsTemplateFile
    TemplateProperties = CommonTemplateProperties
    TemplatePropertiesDoc.Strings = (
      'IndyFormConsoleDFMSource=TRUE')
    TemplateFileManager = WebModulesTemplatePersonalityFiles
    Left = 416
    Top = 192
  end
  object WebModulesTemplatePersonalityFiles: TExpertsTemplatePersonalityFiles
    DelphiTemplateFile = 'newwebmodules.pas'
    CBuilderTemplateFile = 'cpp\newwebmodules.cpp'
    Left = 240
    Top = 240
  end
end
