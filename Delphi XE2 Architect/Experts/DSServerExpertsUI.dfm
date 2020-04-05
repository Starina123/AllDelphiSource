object DSServerExpertsUIModule: TDSServerExpertsUIModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 381
  Width = 502
  object ApplicationTypeWizardPage1: TExpertsFrameWizardPage
    OnFrameCreate = ApplicationTypeWizardPage1CreateFrame
    OnFrameCreated = ApplicationTypeWizardPage1FrameCreated
    OnFrameOptionChanged = ApplicationTypeWizardPage1FrameOptionChanged
    Left = 80
    Top = 80
  end
  object DSStandAloneAppWizard: TExpertsWizard
    WizardPages = <
      item
        WizardPage = ApplicationTypeWizardPage1
      end
      item
        WizardPage = DSStandAloneFeaturesWizardPage
      end
      item
        WizardPage = PortsWizardPage
      end
      item
        WizardPage = CertFilesWizardPage
      end
      item
        WizardPage = ServerClassWizardPage
      end
      item
        WizardPage = LocationWizardPage
      end>
    Caption = 'New DataSnap Server'
    HelpContext = 0
    OnLoadImage = DSStandAloneAppWizardLoadImage
    Left = 80
    Top = 24
  end
  object PortsWizardPage: TExpertsFrameWizardPage
    OnFrameCreate = PortsWizardPageCreateFrame
    OnEnterPage = PortsWizardPageEnterPage
    Left = 104
    Top = 144
  end
  object DSStandAloneFeaturesWizardPage: TExpertsFeaturesWizardPage
    OnFeatureChecked = DSStandAloneFeaturesWizardPageFeatureChecked
    OnWizardPageCreated = DSStandAloneFeaturesWizardPageWizardPageCreated
    OnEnterPage = DSStandAloneFeaturesWizardPageEnterPage
    OnLeavingPage = DSStandAloneFeaturesWizardPageLeavingPage
    Left = 320
    Top = 32
  end
  object ServerClassWizardPage: TExpertsFrameWizardPage
    OnFrameCreate = ServerClassWizardPageCreateFrame
    OnFrameCreated = ServerClassWizardPageFrameCreated
    OnFrameOptionChanged = ServerClassWizardPageFrameOptionChanged
    Left = 80
    Top = 208
  end
  object CertFilesWizardPage: TExpertsFrameWizardPage
    OnFrameCreate = CertFilesWizardPageCreateFrame
    OnFrameCreated = CertFilesWizardPageFrameCreated
    Left = 288
    Top = 176
  end
  object LocationWizardPage: TExpertsFrameWizardPage
    OnFrameCreate = LocationWizardPageFrameCreate
    Left = 320
    Top = 152
  end
end
