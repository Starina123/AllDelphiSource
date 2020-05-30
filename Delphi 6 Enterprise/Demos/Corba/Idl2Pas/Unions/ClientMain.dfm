object Form1: TForm1
  Left = 11
  Top = 112
  Width = 241
  Height = 153
  Caption = 'Struct Client'
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
    Left = 24
    Top = 104
    Width = 42
    Height = 13
    Caption = 'Balance:'
  end
  object Label2: TLabel
    Left = 96
    Top = 104
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Send Long'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Send Short'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Send Str'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 96
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '12345'
  end
  object Edit2: TEdit
    Left = 96
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '256'
  end
  object Edit3: TEdit
    Left = 96
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'Hello, world!'
  end
end
