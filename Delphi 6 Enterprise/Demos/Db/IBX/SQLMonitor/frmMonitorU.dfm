object frmMonitor: TfrmMonitor
  Left = 233
  Top = 300
  Width = 488
  Height = 316
  Caption = 'Extra Monitor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 250
    Top = 0
    Width = 3
    Height = 250
    Cursor = crHSplit
    Beveled = True
  end
  object Memo1: TMemo
    Left = 253
    Top = 0
    Width = 227
    Height = 250
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object ListView1: TListView
    Left = 0
    Top = 0
    Width = 250
    Height = 250
    Align = alLeft
    Columns = <
      item
        Caption = 'Time'
        Width = 75
      end
      item
        AutoSize = True
        Caption = 'Type'
      end>
    MultiSelect = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
    OnSelectItem = ListView1SelectItem
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 250
    Width = 480
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object MainMenu1: TMainMenu
    Left = 284
    Top = 20
    object SQLMonitor1: TMenuItem
      Caption = 'SQL Monitor'
      object Clear2: TMenuItem
        Caption = 'Clear'
        OnClick = Clear1Click
      end
      object Flags1: TMenuItem
        Caption = 'Flags'
        OnClick = Flags1Click
      end
      object Monitoring1: TMenuItem
        Caption = 'Monitoring'
        Checked = True
        OnClick = Monitoring1Click
      end
    end
  end
end
