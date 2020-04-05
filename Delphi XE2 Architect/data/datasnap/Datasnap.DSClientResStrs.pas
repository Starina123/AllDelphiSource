{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Datasnap.DSClientResStrs;

interface

resourcestring
  SJSProxyNoStream      = 'No output stream was specified.';
  SJSProxyNoConnection  = 'No Connection was specified.';
  SUnexpectedRequestType = 'Unexpected request type: %s.';
  sUnexpectedResult = 'Unexpected server method result';
  SNoWriter = 'Proxy writer not specified';
  SUnknownWriter = 'Unknown proxy writer: %s';
  SGeneratedCode = 'Created by the DataSnap proxy generator.';
  SStreamNotFound = 'Stream not found';
  SNoMetaData = 'No proxy meta data';
  SNoMetaDataAtDesignTime = 'Cannot retrieve meta data from %s at design time.';
  SUnableToRetrieveServerMethodParameters = 'Unable to retrieve server method parameters';
  sInvalidServerMethodName = 'Invalid server method name: %s';
  sMissingCommandPath = 'Missing command path';
  sMissingParameterPath = 'Missing parameter path';
  sLoadPackageNextTime = 'Do you want to attempt to load this package in the future?';
  sUntitledPackage = '(untitled)';
  sErrorLoadingPackage = 'Can''t load package %s.' + sLineBreak + '%s';
  sCannotChangeIPImplID = 'Cannot change IPImplementationID once DSRestConnection is initialized';

implementation

end.
