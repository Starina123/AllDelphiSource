{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.UI.ViewManagement;

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses 
  Winapi.Winrt, 
  System.Types, 
  System.Win.WinRT, 
  Winapi.CommonTypes, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.Foundation.IReference`1<Windows.UI.ViewManagement.UIElementType>
  IReference_1__UIElementType = interface;
  PIReference_1__UIElementType = ^IReference_1__UIElementType;

  // Windows.UI.ViewManagement.IInputPaneVisibilityEventArgs
  IInputPaneVisibilityEventArgs = interface;
  PIInputPaneVisibilityEventArgs = ^IInputPaneVisibilityEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.IInputPane,Windows.UI.ViewManagement.IInputPaneVisibilityEventArgs>
  TypedEventHandler_2__IInputPane__IInputPaneVisibilityEventArgs = interface;
  PTypedEventHandler_2__IInputPane__IInputPaneVisibilityEventArgs = ^TypedEventHandler_2__IInputPane__IInputPaneVisibilityEventArgs;

  // Windows.UI.ViewManagement.IInputPane
  IInputPane = interface;
  PIInputPane = ^IInputPane;

  // Windows.UI.ViewManagement.IInputPane2
  IInputPane2 = interface;
  PIInputPane2 = ^IInputPane2;

  // Windows.UI.ViewManagement.IInputPaneControl
  IInputPaneControl = interface;
  PIInputPaneControl = ^IInputPaneControl;

  // Windows.UI.ViewManagement.IInputPaneStatics
  IInputPaneStatics = interface;
  PIInputPaneStatics = ^IInputPaneStatics;

  // Windows.UI.ViewManagement.IUIViewSettings
  IUIViewSettings = interface;
  PIUIViewSettings = ^IUIViewSettings;

  // Windows.UI.ViewManagement.IUIViewSettingsStatics
  IUIViewSettingsStatics = interface;
  PIUIViewSettingsStatics = ^IUIViewSettingsStatics;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.UI.ViewManagement Interfaces
  {
  // Used Types:  Windows.UI.ViewManagement.UIElementType
  }
  // Windows.Foundation.IReference`1<Windows.UI.ViewManagement.UIElementType>
  IReference_1__UIElementType = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: UIElementType; safecall;
    property Value: UIElementType read get_Value;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Rect
  // Used Types:  Boolean
  }
  // Windows.UI.ViewManagement.IInputPaneVisibilityEventArgs
  IInputPaneVisibilityEventArgs = interface(IInspectable)
  ['{D243E016-D907-4FCC-BB8D-F77BAA5028F1}']
    function get_OccludedRect: TRectF; safecall;
    procedure put_EnsuredFocusedElementInView(value: Boolean); safecall;
    function get_EnsuredFocusedElementInView: Boolean; safecall;
    property EnsuredFocusedElementInView: Boolean read get_EnsuredFocusedElementInView write put_EnsuredFocusedElementInView;
    property OccludedRect: TRectF read get_OccludedRect;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.IInputPane,Windows.UI.ViewManagement.IInputPaneVisibilityEventArgs>
  TypedEventHandler_2__IInputPane__IInputPaneVisibilityEventArgs_Delegate_Base = interface(IUnknown)
  ['{B813D684-D953-5A8A-9B30-78B79FB9147B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.ViewManagement.IInputPane
  // Used Types:  Windows.UI.ViewManagement.IInputPaneVisibilityEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.IInputPane,Windows.UI.ViewManagement.IInputPaneVisibilityEventArgs>
  TypedEventHandler_2__IInputPane__IInputPaneVisibilityEventArgs = interface(TypedEventHandler_2__IInputPane__IInputPaneVisibilityEventArgs_Delegate_Base)
  ['{DBA5B41B-EA45-5B69-B0D4-80493AE17F1C}']
    procedure Invoke(sender: IInputPane; args: IInputPaneVisibilityEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.UI.ViewManagement.IInputPane,Windows.UI.ViewManagement.IInputPaneVisibilityEventArgs>
  // Used Types:  Windows.Foundation.Rect
  }
  // Windows.UI.ViewManagement.IInputPane
  [WinRTClassNameAttribute(SInputPane)]
  IInputPane = interface(IInspectable)
  ['{640ADA70-06F3-4C87-A678-9829C9127C28}']
    function add_Showing(handler: TypedEventHandler_2__IInputPane__IInputPaneVisibilityEventArgs): EventRegistrationToken; safecall;
    procedure remove_Showing(token: EventRegistrationToken); safecall;
    function add_Hiding(handler: TypedEventHandler_2__IInputPane__IInputPaneVisibilityEventArgs): EventRegistrationToken; safecall;
    procedure remove_Hiding(token: EventRegistrationToken); safecall;
    function get_OccludedRect: TRectF; safecall;
    property OccludedRect: TRectF read get_OccludedRect;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.UI.ViewManagement.IInputPane2
  IInputPane2 = interface(IInspectable)
  ['{8A6B3F26-7090-4793-944C-C3F2CDE26276}']
    function TryShow: Boolean; safecall;
    function TryHide: Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.UI.ViewManagement.IInputPaneControl
  IInputPaneControl = interface(IInspectable)
  ['{088BB24F-962F-489D-AA6E-C6BE1A0A6E52}']
    function get_Visible: Boolean; safecall;
    procedure put_Visible(value: Boolean); safecall;
    property Visible: Boolean read get_Visible write put_Visible;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.ViewManagement.IInputPane
  }
  // Windows.UI.ViewManagement.IInputPaneStatics
  [WinRTClassNameAttribute(SInputPane)]
  IInputPaneStatics = interface(IInspectable)
  ['{95F4AF3A-EF47-424A-9741-FD2815EBA2BD}']
    function GetForCurrentView: IInputPane; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.ViewManagement.UserInteractionMode
  }
  // Windows.UI.ViewManagement.IUIViewSettings
  [WinRTClassNameAttribute(SUIViewSettings)]
  IUIViewSettings = interface(IInspectable)
  ['{C63657F6-8850-470D-88F8-455E16EA2C26}']
    function get_UserInteractionMode: UserInteractionMode; safecall;
    property UserInteractionMode: UserInteractionMode read get_UserInteractionMode;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.ViewManagement.IUIViewSettings
  }
  // Windows.UI.ViewManagement.IUIViewSettingsStatics
  [WinRTClassNameAttribute(SUIViewSettings)]
  IUIViewSettingsStatics = interface(IInspectable)
  ['{595C97A5-F8F6-41CF-B0FB-AACDB81FD5F6}']
    function GetForCurrentView: IUIViewSettings; safecall;
  end;


  // Emit Forwarded classes
  // Windows.UI.ViewManagement.InputPane
  // DualAPI
  // Implements: Windows.UI.ViewManagement.IInputPane
  // Implements: Windows.UI.ViewManagement.IInputPane2
  // Implements: Windows.UI.ViewManagement.IInputPaneControl
  // Statics: "Windows.UI.ViewManagement.IInputPaneStatics"
  TInputPane = class(TWinRTGenericImportS<IInputPaneStatics>)
  public
    // -> IInputPaneStatics
    class function GetForCurrentView: IInputPane; static; inline;
  end;

  // Windows.UI.ViewManagement.UIViewSettings
  // DualAPI
  // Implements: Windows.UI.ViewManagement.IUIViewSettings
  // Statics: "Windows.UI.ViewManagement.IUIViewSettingsStatics"
  TUIViewSettings = class(TWinRTGenericImportS<IUIViewSettingsStatics>)
  public
    // -> IUIViewSettingsStatics
    class function GetForCurrentView: IUIViewSettings; static; inline;
  end;


implementation

  // Emit Classes Implementation
 { TInputPane }

class function TInputPane.GetForCurrentView: IInputPane;
begin
  Result := Statics.GetForCurrentView;
end;


 { TUIViewSettings }

class function TUIViewSettings.GetForCurrentView: IUIViewSettings;
begin
  Result := Statics.GetForCurrentView;
end;



end.
