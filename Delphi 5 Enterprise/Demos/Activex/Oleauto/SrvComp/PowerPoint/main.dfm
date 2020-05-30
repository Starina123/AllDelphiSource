object Form1: TForm1
  Left = 215
  Top = 160
  Width = 641
  Height = 314
  AutoSize = True
  Caption = 'Powerpoint demonstration'
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  OnActivate = Form1Activate
  OnClose = Form1Close
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 124
    Width = 119
    Height = 13
    Caption = 'Presentations and Slides:'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 59
    Width = 349
    Height = 62
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 33
    Width = 348
    Height = 26
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 1
  end
  object DBImage1: TDBImage
    Left = 375
    Top = 33
    Width = 163
    Height = 78
    DataField = 'Graphic'
    DataSource = DataSource1
    Stretch = True
    TabOrder = 2
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 633
    Height = 28
    ButtonHeight = 21
    ButtonWidth = 89
    Caption = 'ToolBar1'
    ShowCaptions = True
    TabOrder = 3
    object StartPPoint: TToolButton
      Left = 0
      Top = 2
      Caption = 'Start Powerpoint'
      ImageIndex = 5
      OnClick = StartPPointClick
    end
    object AddPresentation: TToolButton
      Left = 89
      Top = 2
      Caption = 'Add Presentation'
      Enabled = False
      ImageIndex = 3
      OnClick = AddPresentationClick
    end
    object AddSlide: TToolButton
      Left = 178
      Top = 2
      Caption = 'Add Slide'
      Enabled = False
      ImageIndex = 5
      OnClick = AddSlideClick
    end
    object RunSlideShow: TToolButton
      Left = 267
      Top = 2
      Caption = 'Run Slideshow'
      Enabled = False
      ImageIndex = 0
      OnClick = RunSlideShowClick
    end
    object ClosePPoint: TToolButton
      Left = 356
      Top = 2
      Caption = 'Close Powerpoint'
      Enabled = False
      ImageIndex = 4
      OnClick = ClosePPointClick
    end
  end
  object TV1: TTreeView
    Left = 0
    Top = 137
    Width = 514
    Height = 150
    AutoExpand = True
    Indent = 19
    ReadOnly = True
    TabOrder = 4
  end
  object PowerPointApplication1: TPowerPointApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 456
    Top = 144
  end
  object PowerPointSlide1: TPowerPointSlide
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 488
    Top = 144
  end
  object PowerPointPresentation1: TPowerPointPresentation
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 424
    Top = 144
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    ReadOnly = True
    TableName = 'biolife.db'
    Left = 440
    Top = 104
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 472
    Top = 104
  end
end
