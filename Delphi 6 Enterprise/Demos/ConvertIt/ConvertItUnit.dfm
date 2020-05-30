object Form1: TForm1
  Left = 192
  Top = 107
  Width = 420
  Height = 466
  Caption = 'Conversion Tester'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ConvFamilies: TTabControl
    Left = 0
    Top = 0
    Width = 412
    Height = 420
    Align = alClient
    TabOrder = 0
    Tabs.Strings = (
      'Testing')
    TabIndex = 0
    OnChange = ConvFamiliesChange
    object ConvTypes: TListBox
      Left = 16
      Top = 32
      Width = 177
      Height = 372
      Anchors = [akLeft, akTop, akBottom]
      ItemHeight = 13
      Sorted = True
      TabOrder = 0
      OnClick = ConvTypesClick
    end
    object ConvValueIncDec: TUpDown
      Left = 377
      Top = 32
      Width = 16
      Height = 21
      Anchors = [akTop, akRight]
      Associate = ConvValue
      Min = -32000
      Max = 32000
      Position = 1
      TabOrder = 2
      Thousands = False
      Wrap = False
    end
    object ConvResults: TListBox
      Left = 200
      Top = 56
      Width = 196
      Height = 348
      TabStop = False
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      ParentColor = True
      TabOrder = 3
    end
    object ConvValue: TEdit
      Left = 200
      Top = 32
      Width = 177
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Text = '1'
      OnChange = ConvValueChange
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 420
    Width = 412
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = False
  end
end
