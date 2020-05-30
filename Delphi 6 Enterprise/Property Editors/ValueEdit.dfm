inherited ValueEditDlg: TValueEditDlg
  HelpContext = 26005
  ActiveControl = ValueListEditor1
  Caption = 'Value List editor'
  PixelsPerInch = 96
  TextHeight = 13
  object ValueListEditor1: TValueListEditor [4]
    Left = 8
    Top = 7
    Width = 412
    Height = 233
    KeyOptions = [keyEdit, keyAdd, keyDelete]
    TabOrder = 4
    OnStringsChange = ValueListEditor1StringsChange
    ColWidths = (
      150
      256)
  end
end
