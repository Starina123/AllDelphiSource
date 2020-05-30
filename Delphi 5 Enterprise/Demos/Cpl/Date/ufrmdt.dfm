object frmDateTime: TfrmDateTime
  Left = 192
  Top = 103
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Date Config'
  ClientHeight = 218
  ClientWidth = 216
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  OnCreate = frmDateTimeCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel: TPanel
    Left = 0
    Top = 177
    Width = 216
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnCancel: TButton
      Left = 24
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancel'
      ModalResult = 2
      TabOrder = 0
    end
    object btnOK: TButton
      Left = 120
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Ok'
      ModalResult = 1
      TabOrder = 1
    end
  end
  object grpboxDate: TGroupBox
    Left = 0
    Top = 0
    Width = 216
    Height = 177
    Align = alClient
    Caption = 'Date:'
    TabOrder = 1
    object Calendar: TCalendar
      Left = 8
      Top = 56
      Width = 201
      Height = 113
      StartOfWeek = 0
      TabOrder = 0
    end
    object cmboBoxMonth: TComboBox
      Left = 8
      Top = 24
      Width = 89
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = cmboBoxMonthChange
    end
    object udYear: TUpDown
      Left = 193
      Top = 24
      Width = 15
      Height = 21
      Associate = edtYear
      Min = 0
      Max = 2050
      Position = 0
      TabOrder = 2
      Thousands = False
      Wrap = False
    end
    object edtYear: TEdit
      Left = 128
      Top = 24
      Width = 65
      Height = 21
      TabOrder = 3
      Text = '0'
      OnChange = edtYearChange
      OnKeyPress = edtYearKeyPress
    end
  end
end
