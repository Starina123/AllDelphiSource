
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{       Registration of WebBroker components            }
{                                                       }
{       Copyright (c) 2000 Inprise Corporation          }
{                                                       }
{*******************************************************}

unit DispHandlersReg;

interface


uses DesignIntf, DesignEditors, Classes, SysUtils,
 WebComp,
 DMForm, (* ParentageSupport,*)
 WebCntxt, WebDisp, WebAdapt, DBAdapt, DBAdaptImg,
 InetReg, WCmpEdit, WebModu, TreeIntf, Controls,
 WebSprig, SiteEdit, SiteComp, WebForm,
 SiteProd, WCompReg, SItemEdt, TypInfo, Consts, HTTPProd, MidProd,
 MidItems, WebSess, HTTPApp, WProdReg, DSProd,
 ActiveScriptCat, WSvcReg, SiteWiz, WebUsers,
 InetFileTypeReg, XSLProd, XMLIntf, ColnEdit, Forms, NetConst, DispHandlers;

  procedure Register;

implementation

const
  sPalettePage = 'WebSnap Demos';

{ Register procedure }

procedure Register;
begin
  RegisterPropertyEditor(TypeInfo(TFileName), TCustomFileDispatchHandler, 'HTMLFile',
    THTMLFilePropertyEditor);

  RegisterComponents(sPalettePage, [TDispatchHandlers]);
  RegisterNonActiveX([TDispatchHandlers], axrIncludeDescendants);

  RegisterWebAppServices([TDispatchHandlers]);

  RegisterPropertyEditor(TypeInfo(TWebComponentList), TCustomDispatchHandlers,
    '', TSimpleWebItemsPropertyEditor);
  RegisterComponentEditor(TCustomDispatchHandlers, TSimpleWebItemsComponentEditor);

  RegisterPropertyEditor(TypeInfo(TComponent), TCustomWebDispatchHandler, 'Producer', TProducerIntfProperty);
  RegisterWebComponents([TWebDispatchHandler, TFileDispatchHandler, TPageDispatchHandler]);
end;


initialization
finalization
  UnRegisterWebComponents([TWebDispatchHandler, TFileDispatchHandler, TPageDispatchHandler]);
  UnregisterWebAppServices([TDispatchHandlers]);
end.
