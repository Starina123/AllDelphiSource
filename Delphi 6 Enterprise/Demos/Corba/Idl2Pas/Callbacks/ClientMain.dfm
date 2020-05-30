object Form1: TForm1
  Left = 192
  Top = 107
  Width = 385
  Height = 162
  Caption = 'Interface Arg Client'
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
  object btnBalance: TButton
    Left = 16
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Balance'
    TabOrder = 0
    OnClick = btnBalanceClick
  end
  object Memo1: TMemo
    Left = 112
    Top = 8
    Width = 257
    Height = 121
    TabOrder = 1
  end
  object btnRates: TButton
    Left = 16
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Get Rates'
    TabOrder = 2
    OnClick = btnRatesClick
  end
end
