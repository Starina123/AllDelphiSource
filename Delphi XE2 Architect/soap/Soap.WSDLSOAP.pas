{*******************************************************}
{                                                       }
{                Delphi Runtime Library                 }
{                  SOAP Support                         }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Soap.WSDLSOAP;

interface

uses Soap.InvokeRegistry, System.Types;

type

  TWSDLSOAPPort = class(TRemotable)
  private
    FPortName: WideString;
    FAddresses: TWideStringDynArray;
  published
    property PortName: WideString read FPortName write FPortName;
    property Addresses: TWideStringDynArray read FAddresses write FAddresses;
  end;

  TWSDLSOAPPortArray = array of TWSDLSOAPPort;

implementation

uses Soap.SOAPConst;

initialization
  RemClassRegistry.RegisterXSClass(TWSDLSOAPPort, SBorlandTypeNamespace);
end.
