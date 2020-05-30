object MainForm: TMainForm
  Left = 192
  Top = 107
  Width = 302
  Height = 186
  Caption = 'Clock Publisher'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object TimeLabel: TLabel
    Left = 96
    Top = 64
    Width = 72
    Height = 37
    HelpType = htKeyword
    Caption = '0:0:0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Timer1: TTimer
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 24
    Top = 40
  end
end
