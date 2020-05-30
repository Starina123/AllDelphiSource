object Form2: TForm2
  Left = 13
  Top = 105
  Width = 584
  Height = 242
  Caption = 'Multiple Inheritence Client'
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
  object btnMoneyMarket: TButton
    Left = 16
    Top = 8
    Width = 73
    Height = 25
    Caption = 'Money Mkt'
    TabOrder = 0
    OnClick = btnMoneyMarketClick
  end
  object btnMargin: TButton
    Left = 16
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Margin'
    TabOrder = 1
    OnClick = btnMarginClick
  end
  object btnInvestment: TButton
    Left = 16
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Investment'
    TabOrder = 2
    OnClick = btnInvestmentClick
  end
  object Memo1: TMemo
    Left = 112
    Top = 8
    Width = 449
    Height = 201
    ScrollBars = ssVertical
    TabOrder = 3
  end
end
