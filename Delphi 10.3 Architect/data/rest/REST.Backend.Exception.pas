{*******************************************************}
{                                                       }
{             Delphi REST Client Framework              }
{                                                       }
{ Copyright(c) 2014-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit REST.Backend.Exception;

interface

uses
  System.Classes, System.SysUtils;

type
  EBackendError = class(Exception);

  EBackendServiceError = class(EBackendError);

  EBackendProviderError = class(EBackendError);

  EBackendAPIError = class(EBackendError);

implementation

end.
