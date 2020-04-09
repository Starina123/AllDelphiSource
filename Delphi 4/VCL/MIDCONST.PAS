
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{       Copyright (c) 1997,98 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit MidConst;

interface

resourcestring
  { DBClient }
  SNoDataProvider = 'Missing data provider or data packet';
  SInvalidDataPacket = 'Invalid data packet';
  SRefreshError = 'Must apply updates before refreshing data';
  SProviderInvalid = 'Invalid provider. Provider was freed by the application server';
  SServerNameBlank = 'Cannot connect, %s must contain a valid ServerName or ServerGUID';
  SRepositoryIdBlank = 'Cannot connect, %s must contain a valid repository id';
  SAggsGroupingLevel = 'Grouping level exceeds current index field count';
  SAggsNoSuchLevel = 'Grouping level not defined';
  SNoCircularReference = 'Circular provider references not allowed';

  { MConnect }
  SSocketReadError = 'Error reading from socket';
  SInvalidProviderName = 'Provider name "%s" was not recognized by the server';
  SBadVariantType = 'Unsupported variant type: %s';
  SInvalidAction = 'Invalid action received: %d';

  { Resolver }
  SInvalidResponse = 'Invalid response';
  SRecordChanged = 'Record changed by another user';
  SRecordNotFound = 'Record not found';
  STooManyRecordsModified = 'Update affected more than 1 record.';

  { Provider }
  SInvalidOptParamType = 'Value cannot be stored in an optional parameter';
  SMissingDataSet = 'Missing DataSet property';
  SConstraintFailed = 'Record or field constraint failed.';
  SField = 'Field';
  SReadOnlyProvider = 'Cannot apply updates to a ReadOnly provider';
  SNoKeySpecified = 'Unable to find record.  No key specified';
  SFieldNameTooLong = 'Field name cannot be longer then %d characters.  Try ' +
                      'setting ObjectView to True on the dataset';
  SNoDataSets = 'Cannot resolve to dataset when using nested datasets or references';
  SRecConstFail = 'Preparation of record constraint failed with error "%s"';
  SFieldConstFail = 'Preparation of field constraint failed with error "%s"';
  SDefExprFail = 'Preparation of default expression failed with error "%s"';
  SArrayElementError = 'Array elements of type %s are not supported'; 

  { ObjectBroker }
  SNoServers = 'No server available';

  { Socket Connection }
  SReturnError = 'Expected return value not received';

implementation

end.
