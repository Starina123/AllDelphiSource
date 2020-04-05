{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit DSServerFeatures;

interface

type

  TDSWizardType = (wtAll, wtStandAlone, wtWebBroker, wtWebBrokerRest);
  TDSWizardTypes = set of TDSWizardType;

  TDSServerProjectType = (ptConsole, ptService, ptVCL);
  TDSServerProjectTypes = set of TDSServerProjectType;

  TDSServerFeature = (dsNull, dsProtocols, dsFilters, dsServerModule,
    dsTCPProtocol, dsHTTPProtocol, dsHTTPSProtocol, dsAuthentication, dsServerMethodClass,
    dsSampleMethods, dsAuthorization, dsRSAFilter, dsPC1Filter, dsZLibFilter, dsProjectLocation, dsWebServerPort,
    dsWebFiles, dsSampleWebFiles, dsEncryptionFilters, dsCompressionFilter, dsHTTPSCertFiles, dsConnectors,
    dsCustom1, dsCustom2, dsCustom3, dsCustom4, dsCustom5, dsCustom6, dsCustom7, dsCustom8, dsCustom9, dsCustom10);

  TDSServerFeatures = set of TDSServerFeature;

  TDSServerClassName = (scComponent, scDataModule, scDSServerModule);

function GetAncestorClass(AValue: TDSServerClassName): string;

implementation

// 'T' prefix not included
function GetAncestorClass(AValue: TDSServerClassName): string;
begin
  case AValue of
    scComponent: Result := 'Component';
    scDataModule: Result := 'DataModule';
    scDSServerModule: Result := 'DSServerModule';
  else
    Assert(False);
  end;
end;

end.
