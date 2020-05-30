object Form1: TForm1
  Left = 192
  Top = 107
  Width = 315
  Height = 276
  Caption = 'VisiBroker 4 for Delphi Client Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 289
    Height = 105
    Caption = ' Use OSAgent to Bind '
    TabOrder = 0
    object Label1: TLabel
      Left = 96
      Top = 48
      Width = 51
      Height = 13
      Caption = 'Balance = '
    end
    object btnOSAgentBalance: TButton
      Left = 8
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Balance'
      TabOrder = 0
      OnClick = btnOSAgentBalanceClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 136
    Width = 289
    Height = 105
    Caption = ' Use Name Service to Bind '
    TabOrder = 1
    object Label2: TLabel
      Left = 96
      Top = 32
      Width = 32
      Height = 13
      Caption = 'Label2'
      Visible = False
    end
    object Label3: TLabel
      Left = 96
      Top = 72
      Width = 32
      Height = 13
      Caption = 'Label3'
      Visible = False
    end
    object btnBindNS: TButton
      Left = 8
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Bind to NS'
      TabOrder = 0
      OnClick = btnBindNSClick
    end
    object btnNSBalance: TButton
      Left = 8
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Balance'
      Enabled = False
      TabOrder = 1
      OnClick = btnNSBalanceClick
    end
  end
end
