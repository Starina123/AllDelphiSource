{*******************************************************}
{                                                       }
{             Delphi LiveBindings Framework             }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit Data.Bind.Consts;

interface

resourcestring
  SBindingComponentsCategory = 'LiveBindings';
  SInvalidBindCompRegistration = 'Invalid LiveBinding registration';
  SInvalidBindCompUnregistration = 'Invalid LiveBinding unregistration';
  SInvalidBindCompEnumeration = 'Invalid LiveBinding enumeration';
  SInvalidBindCompCreation = 'Invalid LiveBinding creation';
  SInvalidBindCompFactory = 'Invalid LiveBinding factory';
  SInvalidBindCompFactoryEnumeration = 'Invalid LiveBinding factory enumeration';
  SInvalidBindCompDesigner =  'Invalid LiveBinding designer';
  SInvalidBindCompComponents = 'Invalid data bound components';
  sArgCount = 'Unexpected argument count';
  sNameAttr = 'Name';  
  sControlAttr = 'Control Expression';
  sSourceAttr = 'Source Expression';
  sIDAttr = 'ID';  
  sStateAttr = 'State';
  sNotImplemented = 'Not implemented';
  sNoEditor = 'Error in %0:s.  No editor available for %1:s';
  sNoEnumerator = 'Error in %0:s.  No enumerator available for %1:s';
  sNoInsertItem = 'Error in %0:s.  Inserted item not available for %1:s';
  sNoControl = 'Error in %0:s.  No control component';
  sNoControlObserverSupport = 'Error in %0:s.  No observer support for %1:s';
  sObjectValueExpected = 'TObject value expected';
  sLinkFieldNotFound = 'Unable to determine field name';
  sLinkUnexpectedGridCurrentType = 'Unexpected grid current type';
  // Categories
  SDataBindingsCategory_BindingExpressions = 'Binding Expressions';
  SDataBindingsCategory_Links = 'Links';
  SDataBindingsCategory_Lists = 'Lists';
  SDataBindingsCategory_DBLinks = 'DB Links';
  // Method
  sCheckedState = 'CheckedState';
  sCheckedStateDesc = 'Bidirectional method to either get the checked state of a control,'#13#10 +
    'or set the checked state in a control'#13#10 +
    'Example usage when binding to a TCheckBox:'#13#10 +
    '   CheckedState(Self)';
  sSelectedText = 'SelectedText';
  sSelectedTextDesc = 'Bidirectional method to either get the text selected in a control,'#13#10 +
     'or set the text selected in a control'#13#10 +
     'Example usage when binding to a TListBox:'#13#10 +
     '  SelectedText(Self)';
  sSelectedItem = 'SelectedItem';
  sSelectedItemDesc = 'Bidirectional method to either get the selected item in a control,'#13#10 +
     'or set the selected item in a control'#13#10 +
     'Example usage when binding to a TListBox:'#13#10 +
     '  SelectedItem(Self).Text';
  //LinkObservers
  sBindLinkIncompatible = 'Object must implement IBindLink';
  sBindPositionIncompatible = 'Object must implement IBindPosition';

implementation

end.
