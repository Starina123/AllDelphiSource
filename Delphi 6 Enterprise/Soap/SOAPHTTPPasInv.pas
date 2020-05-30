{*******************************************************}
{                                                       }
{ Borland Delphi Visual Component Library               }
{                SOAP Support                           }
{                                                       }
{ Copyright (c) 2001 Borland Software Corporation       }
{                                                       }
{*******************************************************}

unit SOAPHTTPPasInv;

interface

uses
  Invoker, Classes, SoapPasInv, SoapHTTPDisp;

type
  THTTPSoapPascalInvoker = class(TSoapPascalInvoker, IHTTPSoapDispatch)
  public
    procedure DispatchSOAP(const Path, SoapAction: WideString; const Request: TStream;
       Response: TStream);
  end;

implementation

uses   SoapConst, InvokeRegistry, SysUtils, InvConst, TypInfo, IntfInfo,
  OPConvert, OPToSoapDomConv, HTTPSOAPToPasBind, Controls;

procedure THTTPSoapPascalInvoker.DispatchSOAP(const Path, SoapAction: WideString; const Request: TStream;
   Response: TStream);
var
  IntfInfo: PTypeInfo;
  PascalBind: IHTTPSOAPToPasBind;
  InvClassType: TClass;
  ActionMeth: String;
  MD: TIntfMetaData;
begin
  PascalBind := THTTPSOAPToPasBind.Create as IHTTPSOAPToPasBind;
  if SoapAction <> '' then
  begin
    if not PascalBind.BindToPascalByAction(SoapAction, InvClassType, IntfInfo, ActionMeth) or (InvClassType = nil) then
    begin
      if IntfInfo = nil then
        raise Exception.CreateFmt(SInvInterfaceNotReg, [SoapAction])
      else if InvClassType = nil then
      begin
        try
          GetIntfMetaData(IntfInfo, MD);
        except
        end;
        raise Exception.CreateFmt(SInvClassNotRegistered,  [MD.UnitName + '.' + MD.Name, SoapAction])
      end else
        raise Exception.CreateFmt(SUnknownSoapAction, [SoapAction]);
    end;
  end else
  begin
    if not PascalBind.BindToPascalByPath(Path, InvClassType, IntfInfo, ActionMeth)  or (InvClassType = nil) then
    begin
      if IntfInfo = nil then
        raise Exception.CreateFmt(SInvInterfaceNotRegURL, [Path])
      else if InvClassType = nil then
      begin
        try
          GetIntfMetaData(IntfInfo, MD);
        except
        end;
        raise Exception.CreateFmt(SInvClassNotRegistered,  [MD.UnitName + '.' + MD.Name, Path])
      end else
        raise Exception.CreateFmt(SNoServiceForURL, [Path]);
    end;
  end;
  Invoke(InvClassType, IntfInfo, ActionMeth, Request, Response);
end;


initialization
  GroupDescendentsWith(THTTPSoapPascalInvoker, Controls.TControl);

end.
