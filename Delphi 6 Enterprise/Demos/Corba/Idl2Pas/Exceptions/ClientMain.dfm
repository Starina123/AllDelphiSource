object Form1: TForm1
  Left = 15
  Top = 113
  Width = 254
  Height = 169
  Caption = 'Bank Account Client'
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
  object btnDeposit: TButton
    Left = 16
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Deposit'
    TabOrder = 0
    OnClick = btnDepositClick
  end
  object btnWithdraw: TButton
    Left = 16
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Withdraw'
    TabOrder = 1
    OnClick = btnWithdrawClick
  end
  object btnBalance: TButton
    Left = 16
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Balance'
    TabOrder = 2
    OnClick = btnBalanceClick
  end
  object Edit1: TEdit
    Left = 112
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 112
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 112
    Top = 72
    Width = 121
    Height = 21
    Color = clBtnFace
    TabOrder = 5
  end
  object btnDoException: TButton
    Left = 16
    Top = 112
    Width = 89
    Height = 25
    Caption = 'Throw Exception'
    TabOrder = 6
    OnClick = btnDoExceptionClick
  end
end
