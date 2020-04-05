{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit EMS.Consts;

interface

resourcestring
  sBodyTypeNotFound = 'Body does not contain %s';
  sAddNotSupported = 'Add not supported';
  sNameNotFound = 'Name not found: %s';
  sNoEndpointImplementationFound = 'No endpoint implementation found';
  sHeaderNotFound = 'Header not found: %s';
  sSetValueNotSupported = 'SetValue not supported';
  sDuplicateEndpoints = 'Duplicate endpoints: %0:s. Each endpoint must have an unique HTTP method, URL or produce / consume types';
  sConstructorNotFound = 'Constructor not found for %s';
  sUnrecognizedEndpointMethodSignature = 'Unrecognized signature for endpoint method %0:s.%1s';
  sInvalidAttributeUsage = 'Attribute with method name cannot be specified for endpoint method: %s';
  sResourceErrorMessage = 'Resource error';
  sEndpointCantProduce = 'Endpoint found, but it cannot produce requested MIME type';
  sEndpointCantConsume = 'Endpoint found, but it cannot consume specified MIME type';

  sUnauthorizedDescription = 'The credentials of the request are not authorized for the requested operation.';
  sUnauthorizedMessage = 'Unauthorized request';
  sNotFoundDescription = 'The request does not identify a known application, resource, endpoint, entity or static item';
  sNotFoundMessage = 'Not found';
  sForbiddenDescription = 'The request is for an operation that is not allowed';
  sForbiddenMessage = 'Forbidden';
  sBadRequestDescription = 'The request has unexpected or missing query parameters, url segments or request body';
  sBadRequestMessage = 'Bad request';
  sDuplicateDescription = 'The request is to create or rename an entity, with a name already in use';
  sDuplicateMessage = 'Duplicate';
  sInvalidTenant = 'TenantId or TenantSecret is not valid';
  sNotAcceptable = 'Not acceptable';
  sUnsupportedMedia = 'Unsupported media type';

  sGroupNotFound = 'Group not found: %s';
  sChannelNamesExpected = 'Channel names expected';

  sSwaggerVersion = '2.0';
  sEMSMetaDataVersion = '0.0.0';
  sEMSMetaDataTitle = 'EMS API Documentation';
  sEMSMetaDataDescription = 'Enterprise Mobility Services API' +  sLineBreak +  sLineBreak +
      '  [Learn about EMS](https://www.embarcadero.com/products/rad-studio/enterprise-mobility-services)' +  sLineBreak +  sLineBreak +
      '  EMS (Enterprise Mobility Services) offers a Mobile Enterprise Application Platform (MEAP)'+  sLineBreak +  sLineBreak +
      '  TurnKey Middleware for Interconnected Distributed Apps';
  sAuthHeaderDesc = 'Header used by the EMS server';

  sDataSetNotAssigned = 'DataSet is not assigned to DB resource';
  sCannotGuessMappingMode = 'Cannot guess mapping mode for dataset';
  sKeyFieldsNotDefined = 'Key fields are not defined for dataset';
  sInvalidDataSetAdaptor = 'Invalid dataset adaptor registration information';
  sDataSetAdaptorNotFound = 'Dataset adaptor class is not found';
  sDataSetAdaptorNoPaging = 'Paging is not supported';
  sDataSetAdaptorInvalidPaging = 'Invalid value for paging parameter';
  sDataSetAdaptorNoSorting = 'Sorting is not supported';
  sDataSetAdaptorInvalidSorting = 'Invalid value for sorting parameter';
  sDataSetAdaptorNoContentType = 'Response content type is not set';

implementation

end.
