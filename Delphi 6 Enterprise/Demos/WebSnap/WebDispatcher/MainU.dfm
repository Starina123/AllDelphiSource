object Main: TMain
  OldCreateOrder = False
  AppServices = WebAppComponents
  Left = 270
  Top = 177
  Height = 152
  Width = 215
  object WebAppComponents: TWebAppComponents
    DispatchActions = WebDispatcher
    Left = 48
    Top = 8
  end
  inline WebDispatcher: TWebDispatcher
    OldCreateOrder = True
    Actions = <
      item
        Default = True
        Name = 'WebActionItem1'
        OnAction = WebDispatcherWebActionItem1Action
      end
      item
        Name = 'WebActionItem2'
        PathInfo = '/PageProducer1'
        Producer = Module.PageProducer1
      end
      item
        Name = 'WebActionItem3'
        PathInfo = '/Test'
        OnAction = WebDispatcherWebActionItem3Action
      end>
    Left = 48
    Top = 56
    Height = 0
    Width = 0
  end
end
