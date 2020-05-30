inherited StringsEditDlg: TStringsEditDlg
  HelpContext = 26000
  ActiveControl = Memo
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LineCount: TLabel [0]
    Left = 12
    Top = 12
    Width = 169
    Height = 17
    AutoSize = False
    Caption = '0 lines'
  end
  object Bevel1: TBevel [1]
    Left = 8
    Top = 8
    Width = 413
    Height = 229
    Shape = bsFrame
  end
  object Memo: TRichEdit [6]
    Left = 16
    Top = 31
    Width = 397
    Height = 197
    HideScrollBars = False
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 4
    WordWrap = False
    OnChange = UpdateStatus
    OnKeyDown = Memo1KeyDown
  end
end
