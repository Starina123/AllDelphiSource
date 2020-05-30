object OrdersGrid: TOrdersGrid
  OldCreateOrder = False
  PageProducer = AdapterPageProducer
  Left = 359
  Top = 182
  Height = 150
  Width = 215
  object AdapterPageProducer: TAdapterPageProducer
    HTMLDoc.Strings = (
      '<html>'
      '<head>'
      '</head>'
      '<body>'
      '<#STYLES><#WARNINGS><#SERVERSCRIPT>'
      '</body>'
      '</html>')
    Left = 48
    Top = 8
    object AdapterForm1: TAdapterForm
      FormMethod = fmGet
      object AdapterErrorList1: TAdapterErrorList
        Adapter = WebDataModule1.OrdersAdapter
      end
    end
  end
end
