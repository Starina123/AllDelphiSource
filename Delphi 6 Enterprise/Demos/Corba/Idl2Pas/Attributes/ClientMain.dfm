object Form1: TForm1
  Left = 111
  Top = 119
  Width = 267
  Height = 203
  Caption = 'Account Client'
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
  object Label1: TLabel
    Left = 120
    Top = 32
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 120
    Top = 72
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object btnBalance: TButton
    Left = 8
    Top = 24
    Width = 97
    Height = 25
    Caption = 'Get Balance'
    TabOrder = 0
    OnClick = btnBalanceClick
  end
  object btnGetYearOpened: TButton
    Left = 8
    Top = 64
    Width = 97
    Height = 25
    Caption = 'Get Year Opened'
    TabOrder = 1
    OnClick = btnGetYearOpenedClick
  end
  object btnSetYearOpened: TButton
    Left = 8
    Top = 104
    Width = 97
    Height = 25
    Caption = 'Set Year Opened'
    TabOrder = 2
    OnClick = btnSetYearOpenedClick
  end
  object Edit1: TEdit
    Left = 120
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object chkToaster: TCheckBox
    Left = 120
    Top = 144
    Width = 129
    Height = 17
    Caption = 'Got Free Toaster?'
    Enabled = False
    TabOrder = 4
  end
  object Button1: TButton
    Left = 8
    Top = 144
    Width = 97
    Height = 25
    Caption = 'Toaster?'
    TabOrder = 5
    OnClick = Button1Click
  end
end
