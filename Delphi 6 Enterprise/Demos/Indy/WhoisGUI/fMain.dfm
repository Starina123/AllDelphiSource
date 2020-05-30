object frmMain: TfrmMain
  Left = 192
  Top = 107
  Width = 362
  Height = 225
  HorzScrollBar.Range = 346
  VertScrollBar.Range = 183
  ActiveControl = mmoResults
  Caption = 'Whois GUI Indy Demo for Windows'
  Color = clButton
  Font.Color = clText
  Font.Height = 11
  Font.Name = 'MS Sans Serif'
  Font.Pitch = fpVariable
  Font.Style = []
  ParentFont = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  TextWidth = 5
  object Label1: TLabel
    Left = 12
    Top = 12
    Width = 57
    Height = 13
    Caption = 'Whois Host:'
  end
  object Label2: TLabel
    Left = 12
    Top = 48
    Width = 80
    Height = 13
    Caption = 'Domain to check:'
  end
  object Label3: TLabel
    Left = 12
    Top = 76
    Width = 33
    Height = 13
    Caption = 'Results'
  end
  object mmoResults: TMemo
    Left = 12
    Top = 92
    Width = 253
    Height = 89
    TabOrder = 0
  end
  object edtDomainToCheck: TEdit
    Left = 112
    Top = 44
    Width = 153
    Height = 21
    TabOrder = 1
    Text = 'borland.com'
  end
  object cboWhoisHosts: TComboBox
    Left = 72
    Top = 8
    Width = 193
    Height = 21
    ItemHeight = 15
    Items.Strings = (
      'whois.internic.net'
      'whois.networksolutions.com'
      'whois.register.com')
    TabOrder = 5
    Text = 'whois.internic.net'
  end
  object btnCheck: TButton
    Left = 271
    Top = 43
    Width = 75
    Height = 24
    Caption = '&Check'
    TabOrder = 3
    OnClick = btnCheckClick
  end
  object btnExit: TButton
    Left = 271
    Top = 159
    Width = 75
    Height = 24
    Caption = 'E&xit'
    TabOrder = 4
    OnClick = btnExitClick
  end
  object IdWhois: TIdWhois
    RecvBufferSize = 8192
    Host = 'whois.internic.net'
    Left = 272
    Top = 4
  end
end
