{*******************************************************}
{                                                       }
{ Borland Delphi Visual Component Library               }
{                SOAP Support                           }
{                                                       }
{ Copyright (c) 2001 Borland Software Corporation       }
{                                                       }
{*******************************************************}

unit SoapConst;

interface

uses TypInfo, XMLSchema;

const

  SSoapXMLHeader = '<?xml version="1.0" encoding=''UTF-8''?>'; { do not localize}
  SSoapNameSpace = 'http://schemas.xmlsoap.org/soap/envelope/'; { do not localize}
  SXMLNS = 'xmlns';                                           { do not localize}
  SSoapEncodingAttr = 'encodingStyle';                        { do not localize}
  SSoap11EncodingS5 = 'http://schemas.xmlsoap.org/soap/encoding/';  { do not localize}

  SSoapEncodingArray = 'Array';                            { do not localize}
  SSoapEncodingArrayType = 'arrayType';                    { do not localize}
                                                                    
  SSoapHTTPTransport = 'http://schemas.xmlsoap.org/soap/http';   { do not localize}
  SSoapBodyUseEncoded = 'encoded';                         { do not localize}
  SSoapBodyUseLiteral = 'literal';                         { do not localize}

  SSoapEnvelope = 'Envelope'; { do not localize}           { do not localize}
  SSoapHeader = 'Header'; { do not localize}               { do not localize}
  SSoapBody = 'Body'; { do not localize}                   { do not localize}
  SSoapResponseSuff = 'Response'; { do not localize }      { do not localize}

  SSoapMustUnderstand = 'mustUnderstand';                  { do not localize}
  SSoapActor = 'actor';                                    { do not localize}
                                                           
  SSoapServerFaultCode = 'Server';                         { do not localize}
  SSoapServerFaultString = 'Server Error';                 { do not localize}
  SSoapFault = 'Fault';                                    { do not localize}
  SSoapFaultCode = 'faultcode';                            { do not localize}
  SSoapFaultString = 'faultstring';                        { do not localize}
  SSoapFaultActor = 'faultactor';                          { do not localize}
  SSoapFaultDetails =  'detail';                           { do not localize}

  SHTTPSoapAction = 'SOAPAction';                          { do not localize}

  SSoapType = 'type';                                      { do not localize}
  SSoapResponse = 'Response';                              { do not localize}
  SDefaultReturnName = 'return';                           { do not localize}
  SDefaultResultName = 'result';                           { do not localize}

  sNewPage = 'WebServices';                                { do not localize}

  SXMLID = 'id';                                           { do not localize}
  SXMLHREF = 'href';                                       { do not localize}

  SSoapNULL = 'NULL';                                      { do not localize}

  SHREFPre = '#';                                          { do not localize}
  SArrayIDPre = 'Array-';                                  { do not localize}
  SDefVariantElemName = 'V';                               { do not localize}


  SDelphiTypeNamespace = 'http://www.borland.com/namespaces/Delphi/Types';   { do not localize}


  KindNameArray:  array[tkUnknown..tkDynArray] of string =
    ('Unknown', 'Integer', 'Char', 'Enumeration', 'Float',
    'String', 'Set', 'Class', 'Method', 'WChar', 'LString', 'WString',
    'Variant', 'Array', 'Record', 'Interface', 'Int64', 'DynArray');

var

  XMLSchemaNameSpace: string = SXMLSchemaURI_1999;
  XMLSchemaInstNameSpace: string =  SXMLSchemaInstURI_1999;

resourcestring

  SUnsupportedEncodingSyle = 'Unsupported SOAP encodingStyle %s';
  SInvalidSoapRequest = 'Invalid SOAP request';
  SMultiBodyNotSupported = 'Multiple body elements not supported';
  SUnsupportedCC = 'Unsupported calling convention: %s';
  SUnsupportedCCIntfMeth = 'Remote Method Call: unsupported calling convention %s for method %s on interface %s';
  SInvClassNotRegistered  = 'No class registered to implement interface %s for soap action %s';
  SInvInterfaceNotReg = 'No interface  registered for soap action %s';
  SInvInterfaceNotRegURL = 'No interface  registered for URL %s';
  SRemTypeNotRegistered  = 'Remotable Type %s not registered';
  STypeMismatchInParam = 'Type mismatch in parameter %s';
  SNoSuchMethod = 'No such method %s';
  SInterfaceNotReg = 'Interface not registered, UUID = %s';
  SInterfaceNoRTTI = 'Interface has no RTTI, UUID = %s';
  SNoWSDL = 'No WSDL document associated with WSDLView';
  SDataTypeNotSupported = 'Datatype of TypeKind: %s not supported as argument for remote invocation';
  SNoMatchingDelphiType = 'No matching Delphi type was found for type: URI = %s, Name = %s on Node %s';
  SUnknownSOAPAction = 'Unknown SOAPAction %s';
  SScalarFromTRemotableS = 'Classes that represent scalar types must decsend from TRemotable, %s does not';
  SNoSerializeGraphs = 'Must allow multiref output for objects when serializing a graph of objects';
  SUnsuportedClassType = 'Conversion from Class %s to SOAP is not supported';
  SUnexpectedDataType = 'Internal error: data type kind %s not expected in this context';


  SArrayTooManyElem = 'Array Node: %s has too many elements';
  SWrongDocElem = 'DocumentElement %s:%s expected, %s:%s found';
  STooManyParameters = 'Too many parameters in method %s';
  SArrayExpected = 'Array type expected. Node %s';
  SNoMultiDimVar = 'Multidimensional variant arrays not supported in this release';
  SNoURL = 'No URL set';

  SNoInterfaceGUID = 'Class %s does not implement interface GUID %s';
  SNoArrayElemRTTI = 'Element of Array type %s has no RTTI';
  SInvalidResponse = 'Invalid SOAP Response';
  SInvalidArraySpec = 'Invalid SOAP array specification';
  SCannotFindNodeID = 'Cannot find node referenced by ID %s';
  SNoNativeNULL = 'Option not set to allow Native type to be set to NULL';
  SFaultCodeOnlyAllowed = 'Only one FaultCode element allowed';
  SFaultStringOnlyAllowed = 'Only one FaultString element allowed';
  SMissingFaultValue = 'Missing FaultString or FaultCode element';
  SNoInterfacesInClass = 'Invokable Class %s implements no interfaces';

  SVariantCastNotSupported = 'Type cannot be cast as Variant';
  SVarDateNotSupported = 'varDate type not supported';
  SVarDispatchNotSupported = 'varDispatch type not supported';
  SVarErrorNotSupported = 'varError type not supported';
  SVarVariantNotSupported = 'varVariant type not supported';
  SHeaderError = 'Error Processing Header %s';
  SMissingSoapReturn = 'SOAP Response Packet: result element expected, %s found';
  SInvalidPointer = 'Invalid Pointer';
  SNoMessageConverter = 'No Pascal to Message converter set';
  SNoMsgProcessingNode = 'No Message processing node set';
  SHeaderAttributeError = 'Soap header attribute %s with must understand true not understand';

  SNoServiceForURL = 'No service available for URL %s';
  SNoInterfaceForURL = 'No interface is registered to handle URL %s';
  SNoClassRegisteredForURL = 'No Class is regisgtered to implement interface %s';
  SInvalidURL = 'Invalid url';
  SNoClassRegistered = 'No class registered for invokable interface %s';
  SNoDispatcher = 'No Dispatcher set'; 
  SMethNoRTTI = 'Method has no RTTI';
  SUnsupportedVariant = 'Unsuppported variant type';
  SNoVarDispatch = 'varDispatch type not supported';
  SNoErrorDispatch = 'varError type not supported';
  
  SInvalidTimeZone = 'Invalid or Unknown Time Zone';
  SLocationFilter = 'WSDL files (*.wsdl)|*.wsdl|XML files (*.xml)|*.xml';

implementation

end.
