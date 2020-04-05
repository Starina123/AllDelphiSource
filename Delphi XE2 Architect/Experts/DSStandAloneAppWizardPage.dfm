object DSStandAloneAppWizardFrame: TDSStandAloneAppWizardFrame
  Left = 0
  Top = 0
  Width = 332
  Height = 75
  TabOrder = 0
  object rbVCLApp: TRadioButton
    Left = 0
    Top = 0
    Width = 199
    Height = 20
    Caption = '&VCL Forms Application'
    Checked = True
    TabOrder = 0
    TabStop = True
    OnClick = OnRadioClick
  end
  object rbConsoleApp: TRadioButton
    Left = 0
    Top = 22
    Width = 233
    Height = 16
    Caption = '&Console Application'
    TabOrder = 1
    OnClick = OnRadioClick
  end
  object rbServiceApp: TRadioButton
    Left = 0
    Top = 40
    Width = 233
    Height = 20
    Caption = '&Service Application'
    TabOrder = 2
    OnClick = OnRadioClick
  end
end
