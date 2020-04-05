object InetExpertsUIModule: TInetExpertsUIModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 326
  Width = 461
  object ApplicationTypeWizardPage1: TExpertsFrameWizardPage
    OnFrameCreate = ApplicationTypeWizardPage1CreateFrame
    OnFrameCreated = ApplicationTypeWizardPage1FrameCreated
    OnFrameOptionChanged = ApplicationTypeWizardPage1FrameOptionChanged
    Left = 224
    Top = 24
  end
  object WebServerProjectWizard: TExpertsWizard
    WizardPages = <
      item
        WizardPage = ApplicationTypeWizardPage1
      end
      item
        WizardPage = PortsWizardPage
      end
      item
        WizardPage = CertFilesWizardPage
      end>
    Caption = 'New Web Server Application'
    HelpContext = 0
    OnLoadImage = WebServerProjectWizardLoadImage
    Left = 56
    Top = 24
  end
  object PortsWizardPage: TExpertsFrameWizardPage
    OnFrameCreate = PortsWizardPageCreateFrame
    OnFrameCreated = PortsWizardPageFrameCreated
    OnFrameOptionChanged = PortsWizardPageFrameOptionChanged
    OnEnterPage = PortsWizardPageEnterPage
    Left = 216
    Top = 104
  end
  object CertFilesWizardPage: TExpertsFrameWizardPage
    OnFrameCreate = CertFilesWizardPageCreateFrame
    OnFrameCreated = CertFilesWizardPageFrameCreated
    Left = 208
    Top = 184
  end
end
