{*******************************************************}
{                                                       }
{ Borland Delphi Visual Component Library               }
{                SOAP Support                           }
{                                                       }
{ Copyright (c) 2001 Borland Software Corporation       }
{                                                       }
{*******************************************************}

unit SOAPMidas;

interface

implementation

uses Midas, InvokeRegistry;

initialization
  InvRegistry.RegisterInterface(TypeInfo(IAppServer));
end.
