object Form1: TForm1
  Left = 192
  Top = 107
  Width = 256
  Height = 156
  Caption = 'Form1'
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
    Left = 16
    Top = 16
    Width = 105
    Height = 29
    Caption = 'Guilders'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 63
    Height = 29
    Caption = 'Euros'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 136
    Top = 16
    Width = 97
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 136
    Top = 88
    Width = 97
    Height = 25
    Caption = 'Convert'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 136
    Top = 48
    Width = 97
    Height = 21
    TabOrder = 2
  end
end
