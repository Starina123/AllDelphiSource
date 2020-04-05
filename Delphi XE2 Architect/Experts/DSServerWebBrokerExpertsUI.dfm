inherited DSServerWebBrokerExpertsUIModule: TDSServerWebBrokerExpertsUIModule
  OldCreateOrder = True
  inherited WebServerProjectWizard: TExpertsWizard
    WizardPages = <
      item
        WizardPage = ApplicationTypeWizardPage1
      end
      item
        WizardPage = PortsWizardPage
      end
      item
        WizardPage = CertFilesWizardPage
      end
      item
        WizardPage = FeaturesWizardPage
      end
      item
        WizardPage = ServerClassWizardPage
      end
      item
        WizardPage = LocationWizardPage
      end>
  end
  object FeaturesWizardPage: TExpertsFeaturesWizardPage
    OnFeatureChecked = FeaturesWizardPageFeatureChecked
    OnWizardPageCreated = FeaturesWizardPageWizardPageCreated
    OnEnterPage = FeaturesWizardPageEnterPage
    Left = 288
    Top = 256
  end
  object ServerClassWizardPage: TExpertsFrameWizardPage
    OnFrameCreate = ServerClassWizardPageCreateFrame
    OnFrameCreated = ServerClassWizardPageFrameCreated
    OnFrameOptionChanged = ServerClassWizardPageFrameOptionChanged
    Left = 72
    Top = 248
  end
  object LocationWizardPage: TExpertsFrameWizardPage
    OnFrameCreate = LocationWizardPageFrameCreate
    Left = 320
    Top = 152
  end
end
