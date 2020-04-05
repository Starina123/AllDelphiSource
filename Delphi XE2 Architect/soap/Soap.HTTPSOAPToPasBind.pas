{*******************************************************}
{                                                       }
{                Delphi Runtime Library                 }
{                  SOAP Support                         }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Soap.HTTPSOAPToPasBind;

interface

uses System.TypInfo;

type
   IHTTPSOAPToPasBind = interface
   ['{FDA9957E-F8A1-4E46-9107-9DB7E90E0DBE}']
     function BindToPascalByAction(const Action: AnsiString; var AClass: TClass; var IntfInfo: PTypeInfo; var AMeth: string): Boolean;
     function BindToPascalByPath(const Path: AnsiString; var AClass: TClass; var IntfInfo: PTypeInfo; var AMeth: string): Boolean;
   end;

   THTTPSOAPToPasBind = class(TInterfacedObject, IHTTPSOAPToPasBind)
   public
     function BindToPascalByAction(const Action: AnsiString; var AClass: TClass; var IntfInfo: PTypeInfo; var AMeth: string): Boolean; virtual;
     function BindToPascalByPath(const Path: AnsiString; var AClass: TClass; var IntfInfo: PTypeInfo; var AMeth: String): Boolean; virtual;
   end;

implementation

uses Soap.InvokeRegistry;

function THTTPSOAPToPasBind.BindToPascalByAction(const Action: AnsiString; var AClass: TClass; var IntfInfo: PTypeInfo; var AMeth: string): Boolean;
begin
  Result := InvRegistry.GetInfoForURI('', string(Action), AClass, IntfInfo, AMeth);
end;

function THTTPSOAPToPasBind.BindToPascalByPath(const Path: AnsiString;
  var AClass: TClass; var IntfInfo: PTypeInfo; var AMeth: String): Boolean;
begin
  Result := InvRegistry.GetInfoForURI(string(Path), '', AClass, IntfInfo, AMeth);
end;

end.
