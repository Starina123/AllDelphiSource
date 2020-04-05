object NewStdDataBindingDlg: TNewStdDataBindingDlg
  Left = 209
  Top = 219
  HelpContext = 16204
  BorderIcons = [biSystemMenu]
  Caption = 'New LiveBinding'
  ClientHeight = 355
  ClientWidth = 244
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 254
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    244
    355)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 6
    Width = 77
    Height = 13
    Caption = '&Binding Classes:'
    FocusControl = ActionTree
  end
  object HelpBtn: TButton
    Left = 165
    Top = 325
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Help'
    TabOrder = 2
    OnClick = HelpBtnClick
  end
  object OKBtn: TButton
    Left = 3
    Top = 325
    Width = 75
    Height = 25
    Action = AcceptAction
    Anchors = [akRight, akBottom]
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object CancelBtn: TButton
    Left = 84
    Top = 325
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object ActionTree: TTreeView
    Left = 3
    Top = 23
    Width = 237
    Height = 294
    Anchors = [akLeft, akTop, akRight, akBottom]
    Indent = 19
    MultiSelectStyle = [msControlSelect, msShiftSelect]
    ReadOnly = True
    TabOrder = 3
    OnDblClick = DataBindingListDblClick
  end
  object ActionList1: TActionList
    Left = 180
    Top = 12
    object AcceptAction: TAction
      Caption = 'OK'
      Enabled = False
      OnUpdate = AcceptActionUpdate
    end
  end
end
