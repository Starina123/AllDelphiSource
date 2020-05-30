object frmConnect: TfrmConnect
  Left = 309
  Top = 209
  Width = 329
  Height = 179
  Caption = 'Connect'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 4
    Width = 46
    Height = 13
    Caption = 'Database'
  end
  object Label2: TLabel
    Left = 4
    Top = 44
    Width = 48
    Height = 13
    Caption = 'Username'
  end
  object Label3: TLabel
    Left = 4
    Top = 80
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object Label4: TLabel
    Left = 4
    Top = 112
    Width = 22
    Height = 13
    Caption = 'Role'
  end
  object btnOK: TBitBtn
    Left = 188
    Top = 64
    Width = 75
    Height = 25
    TabOrder = 0
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 188
    Top = 104
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkCancel
  end
  object edtDatabase: TEdit
    Left = 4
    Top = 20
    Width = 293
    Height = 21
    TabOrder = 2
    Text = 
      'C:\Program Files\Borland\InterBase\examples\Database\employee.gd' +
      'b'
    OnChange = edtDatabaseChange
  end
  object edtUser: TEdit
    Left = 4
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'sysdba'
    OnChange = edtDatabaseChange
  end
  object edtPassword: TEdit
    Left = 4
    Top = 92
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'masterkey'
    OnChange = edtDatabaseChange
  end
  object edtRole: TEdit
    Left = 4
    Top = 124
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object btnBrowse: TButton
    Left = 296
    Top = 20
    Width = 21
    Height = 21
    Caption = '...'
    TabOrder = 6
    OnClick = btnBrowseClick
  end
  object dlgOpen: TOpenDialog
    DefaultExt = '*.gdb'
    FileName = 
      'C:\Program Files\InterBase Corp\InterBase\examples\Database\empl' +
      'oyee.gdb'
    Filter = 'Interbase DBs|*.gdb'
    InitialDir = '.'
    Options = [ofHideReadOnly, ofExtensionDifferent, ofEnableSizing]
    Title = 'Browse Database'
    Left = 144
    Top = 68
  end
end
