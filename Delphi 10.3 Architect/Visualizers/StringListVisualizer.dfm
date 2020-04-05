object StringListViewerFrame: TStringListViewerFrame
  Left = 0
  Top = 0
  Width = 547
  Height = 249
  TabOrder = 0
  object PCViews: TPageControl
    Left = 0
    Top = 0
    Width = 547
    Height = 249
    ActivePage = TabText
    Align = alClient
    TabOrder = 0
    OnChange = PCViewsChange
    object TabList: TTabSheet
      Caption = '&List'
      object StringListView: TListView
        Left = 0
        Top = 0
        Width = 539
        Height = 221
        Align = alClient
        Columns = <
          item
            Caption = 'Index'
          end
          item
            AutoSize = True
            Caption = 'Value'
          end>
        OwnerData = True
        ReadOnly = True
        TabOrder = 0
        ViewStyle = vsReport
        OnData = StringListViewData
      end
    end
    object TabText: TTabSheet
      Caption = '&Text'
      ImageIndex = 1
      object StringTextView: TMemo
        Left = 0
        Top = 0
        Width = 539
        Height = 221
        Align = alClient
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
        WantReturns = False
        WordWrap = False
      end
    end
  end
end
