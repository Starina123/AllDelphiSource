object frmTraceFlags: TfrmTraceFlags
  Left = 331
  Top = 345
  Width = 280
  Height = 212
  Caption = 'Set Trace Flags'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CheckBox1: TCheckBox
    Left = 16
    Top = 12
    Width = 97
    Height = 17
    Caption = 'tfQPrepare'
    TabOrder = 0
  end
  object CheckBox2: TCheckBox
    Left = 16
    Top = 39
    Width = 97
    Height = 17
    Caption = 'tfQExecute'
    TabOrder = 1
  end
  object CheckBox3: TCheckBox
    Left = 16
    Top = 66
    Width = 97
    Height = 17
    Caption = 'tfQFetch'
    TabOrder = 2
  end
  object CheckBox4: TCheckBox
    Left = 16
    Top = 93
    Width = 97
    Height = 17
    Caption = 'tfError'
    TabOrder = 3
  end
  object CheckBox5: TCheckBox
    Left = 16
    Top = 120
    Width = 97
    Height = 17
    Caption = 'tfStmt'
    TabOrder = 4
  end
  object CheckBox6: TCheckBox
    Left = 156
    Top = 12
    Width = 97
    Height = 17
    Caption = 'tfConnect'
    TabOrder = 5
  end
  object CheckBox7: TCheckBox
    Left = 156
    Top = 39
    Width = 97
    Height = 17
    Caption = 'tfTransact'
    TabOrder = 6
  end
  object CheckBox8: TCheckBox
    Left = 156
    Top = 66
    Width = 97
    Height = 17
    Caption = 'tfBlob'
    TabOrder = 7
  end
  object CheckBox9: TCheckBox
    Left = 156
    Top = 93
    Width = 97
    Height = 17
    Caption = 'tfService'
    TabOrder = 8
  end
  object CheckBox10: TCheckBox
    Left = 156
    Top = 120
    Width = 97
    Height = 17
    Caption = 'tfMisc'
    TabOrder = 9
  end
  object BitBtn1: TBitBtn
    Left = 46
    Top = 148
    Width = 75
    Height = 25
    TabOrder = 10
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 150
    Top = 148
    Width = 75
    Height = 25
    TabOrder = 11
    Kind = bkCancel
  end
end
