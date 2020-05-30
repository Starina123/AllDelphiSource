object formReadme: TformReadme
  Left = 264
  Top = 144
  Width = 576
  Height = 441
  Caption = 'formReadme'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 568
    Height = 409
    Align = alClient
    Lines.Strings = (
      'TXMLTransformProvider transforms a generic xml-document into a'
      'Datapacket.'
      
        'Data aware controls such as DBGrids,  XMLBroker( Internet Expres' +
        's)  etc. '
      
        'can now be used to display, browse  and update the data from the' +
        'se documents.'
      
        'The updated data can then be resolved back to the original xml-d' +
        'ocument.'
      ''
      ''
      'TXMLTransformProvider  description:'
      ''
      'XMLDataFile:'
      'Points to the generic xml-file  '
      ''
      'TransformRead.TransformationFile:'
      
        'Points to the transformation file ('#39'.xtr'#39')  for '#39'Xml to Datapack' +
        'et'#39'.'
      'Created by '#39'XmlMapper'#39'.'
      ''
      'TransformWrite.TransformationFile:'
      'Points to the transformation file for '#39'Datapacket to Xml'#39'.'
      ''
      'CacheData :'
      'Set property to cache the '#39'transformed'#39' Xml file.'
      ''
      ''
      'Events:'
      ''
      'TransformRead.OnTranslate'
      'TransformWrite.OnTranslate:'
      ''
      
        'Used to intercept and translate field-values marked as '#39'Userdefi' +
        'ned'#39'  in XmlMapper.'
      ''
      ''
      
        'Note: When writing back updates to the xml-file the file is recr' +
        'eated and '
      
        'rewritten, so when creating the transformations all data-fields ' +
        'should be mapped '
      'to avoid data-loss.'
      ''
      
        'Note: As is the case with ClientDatasets, this technology limits' +
        ' data-size'
      'to available memory and is not intended for '#39'huge'#39' xml-files.'
      '')
    ScrollBars = ssBoth
    TabOrder = 0
  end
end
