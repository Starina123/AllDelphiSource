
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{       Copyright (c) 1997,98 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit WebConst;

interface

resourcestring
  sInvalidActionRegistration = 'Invalid Action registration';
  sOnlyOneDataModuleAllowed = 'Only one data module per application';
  sNoDataModulesRegistered = 'No data modules registered';
  sNoDispatcherComponent = 'No dispatcher component found on data module';
  sOnlyOneDispatcher = 'Only one WebDispatcher per form/data module';
  sDuplicateActionName = 'Duplicate action name';
  sTooManyActiveConnections = 'Maximum number of concurrent connections exceeded.  ' +
    'Please try again later';
  sHTTPItemName = 'Name';
  sHTTPItemURI = 'PathInfo';
  sHTTPItemEnabled = 'Enabled';
  sHTTPItemDefault = 'Default';

  sInternalServerError = '<html><title>Internal Server Error 500</title>'#13#10 +
    '<h1>Internal Server Error 500</h1><hr>'#13#10 +
    'Exception: %s<br>'#13#10 +
    'Message: %s<br></html>'#13#10;
  sDocumentMoved = '<html><title>Document Moved 302</title>'#13#10 +
    '<body><h1>Object Moved</h1><hr>'#13#10 +
    'This Object may be found <a HREF="%s">here.</a><br>'#13#10 +
    '<br></body></html>'#13#10;

  sResNotFound = 'Resource %s not found';

  sTooManyColumns = 'Too many table columns';
  sFieldNameColumn = 'Field Name';
  sFieldTypeColumn = 'Field Type';

  sInvalidMask = '''%s'' is an invalid mask at (%d)';


implementation

end.

