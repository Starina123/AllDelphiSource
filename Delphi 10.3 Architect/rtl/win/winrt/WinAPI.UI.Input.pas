{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.UI.Input;

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses 
  Winapi.Winrt, 
  System.Types, 
  System.Win.WinRT, 
  Winapi.CommonTypes, 
  Winapi.Devices, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.IPointerPoint>
  IIterator_1__IPointerPoint = interface;
  PIIterator_1__IPointerPoint = ^IIterator_1__IPointerPoint;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.IPointerPoint>
  IIterable_1__IPointerPoint = interface;
  PIIterable_1__IPointerPoint = ^IIterable_1__IPointerPoint;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.IRadialControllerMenuItem>
  IIterator_1__IRadialControllerMenuItem = interface;
  PIIterator_1__IRadialControllerMenuItem = ^IIterator_1__IRadialControllerMenuItem;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.IRadialControllerMenuItem>
  IIterable_1__IRadialControllerMenuItem = interface;
  PIIterable_1__IRadialControllerMenuItem = ^IIterable_1__IRadialControllerMenuItem;

  // Windows.UI.Input.Core.IRadialControllerIndependentInputSource
  Core_IRadialControllerIndependentInputSource = interface;
  PCore_IRadialControllerIndependentInputSource = ^Core_IRadialControllerIndependentInputSource;

  // Windows.UI.Input.Core.IRadialControllerIndependentInputSourceStatics
  Core_IRadialControllerIndependentInputSourceStatics = interface;
  PCore_IRadialControllerIndependentInputSourceStatics = ^Core_IRadialControllerIndependentInputSourceStatics;

  // Windows.UI.Input.IPointerPointTransform
  IPointerPointTransform = interface;
  PIPointerPointTransform = ^IPointerPointTransform;

  // Windows.UI.Input.IRadialControllerRotationChangedEventArgs2
  IRadialControllerRotationChangedEventArgs2 = interface;
  PIRadialControllerRotationChangedEventArgs2 = ^IRadialControllerRotationChangedEventArgs2;

  // Windows.UI.Input.IRadialControllerButtonPressedEventArgs
  IRadialControllerButtonPressedEventArgs = interface;
  PIRadialControllerButtonPressedEventArgs = ^IRadialControllerButtonPressedEventArgs;

  // Windows.UI.Input.IRadialControllerButtonHoldingEventArgs
  IRadialControllerButtonHoldingEventArgs = interface;
  PIRadialControllerButtonHoldingEventArgs = ^IRadialControllerButtonHoldingEventArgs;

  // Windows.UI.Input.IRadialControllerButtonReleasedEventArgs
  IRadialControllerButtonReleasedEventArgs = interface;
  PIRadialControllerButtonReleasedEventArgs = ^IRadialControllerButtonReleasedEventArgs;

  // Windows.UI.Input.IRadialControllerScreenContactStartedEventArgs2
  IRadialControllerScreenContactStartedEventArgs2 = interface;
  PIRadialControllerScreenContactStartedEventArgs2 = ^IRadialControllerScreenContactStartedEventArgs2;

  // Windows.UI.Input.IRadialControllerScreenContactContinuedEventArgs2
  IRadialControllerScreenContactContinuedEventArgs2 = interface;
  PIRadialControllerScreenContactContinuedEventArgs2 = ^IRadialControllerScreenContactContinuedEventArgs2;

  // Windows.UI.Input.IRadialControllerScreenContactEndedEventArgs
  IRadialControllerScreenContactEndedEventArgs = interface;
  PIRadialControllerScreenContactEndedEventArgs = ^IRadialControllerScreenContactEndedEventArgs;

  // Windows.UI.Input.IRadialControllerButtonClickedEventArgs2
  IRadialControllerButtonClickedEventArgs2 = interface;
  PIRadialControllerButtonClickedEventArgs2 = ^IRadialControllerButtonClickedEventArgs2;

  // Windows.UI.Input.IRadialControllerControlAcquiredEventArgs2
  IRadialControllerControlAcquiredEventArgs2 = interface;
  PIRadialControllerControlAcquiredEventArgs2 = ^IRadialControllerControlAcquiredEventArgs2;

  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerButtonPressedEventArgs>
  TypedEventHandler_2__IRadialController__IRadialControllerButtonPressedEventArgs = interface;
  PTypedEventHandler_2__IRadialController__IRadialControllerButtonPressedEventArgs = ^TypedEventHandler_2__IRadialController__IRadialControllerButtonPressedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerButtonHoldingEventArgs>
  TypedEventHandler_2__IRadialController__IRadialControllerButtonHoldingEventArgs = interface;
  PTypedEventHandler_2__IRadialController__IRadialControllerButtonHoldingEventArgs = ^TypedEventHandler_2__IRadialController__IRadialControllerButtonHoldingEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerButtonReleasedEventArgs>
  TypedEventHandler_2__IRadialController__IRadialControllerButtonReleasedEventArgs = interface;
  PTypedEventHandler_2__IRadialController__IRadialControllerButtonReleasedEventArgs = ^TypedEventHandler_2__IRadialController__IRadialControllerButtonReleasedEventArgs;

  // Windows.UI.Input.IRadialController2
  IRadialController2 = interface;
  PIRadialController2 = ^IRadialController2;

  // Windows.UI.Input.IRadialControllerStatics
  IRadialControllerStatics = interface;
  PIRadialControllerStatics = ^IRadialControllerStatics;

  // Windows.UI.Input.IRadialControllerMenuItemStatics
  IRadialControllerMenuItemStatics = interface;
  PIRadialControllerMenuItemStatics = ^IRadialControllerMenuItemStatics;

  // Windows.UI.Input.IRadialControllerMenuItemStatics2
  IRadialControllerMenuItemStatics2 = interface;
  PIRadialControllerMenuItemStatics2 = ^IRadialControllerMenuItemStatics2;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.RadialControllerSystemMenuItemKind>
  IIterator_1__RadialControllerSystemMenuItemKind = interface;
  PIIterator_1__RadialControllerSystemMenuItemKind = ^IIterator_1__RadialControllerSystemMenuItemKind;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.RadialControllerSystemMenuItemKind>
  IIterable_1__RadialControllerSystemMenuItemKind = interface;
  PIIterable_1__RadialControllerSystemMenuItemKind = ^IIterable_1__RadialControllerSystemMenuItemKind;

  // Windows.UI.Input.IRadialControllerConfiguration
  IRadialControllerConfiguration = interface;
  PIRadialControllerConfiguration = ^IRadialControllerConfiguration;

  // Windows.UI.Input.IRadialControllerConfigurationStatics
  IRadialControllerConfigurationStatics = interface;
  PIRadialControllerConfigurationStatics = ^IRadialControllerConfigurationStatics;

  // Windows.UI.Input.IRadialControllerConfiguration2
  IRadialControllerConfiguration2 = interface;
  PIRadialControllerConfiguration2 = ^IRadialControllerConfiguration2;

  // Windows.UI.Input.IRadialControllerConfigurationStatics2
  IRadialControllerConfigurationStatics2 = interface;
  PIRadialControllerConfigurationStatics2 = ^IRadialControllerConfigurationStatics2;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.UI.Input Interfaces
  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.IPointerPoint>
  IIterator_1__IPointerPoint_Base = interface(IInspectable)
  ['{721FE01C-5AD4-5262-B078-3AB345105DB8}']
  end;
  {
  // Used Types:  Windows.UI.Input.IPointerPoint
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.IPointerPoint>
  IIterator_1__IPointerPoint = interface(IIterator_1__IPointerPoint_Base)
  ['{2C506FAB-54BD-5007-8847-46FB9494DFB3}']
    function get_Current: IPointerPoint; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIPointerPoint): Cardinal; safecall;
    property Current: IPointerPoint read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.IPointerPoint>
  IIterable_1__IPointerPoint_Base = interface(IInspectable)
  ['{F6F2CBA6-7076-5B59-9631-F6AC32B57695}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.IPointerPoint>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.IPointerPoint>
  IIterable_1__IPointerPoint = interface(IIterable_1__IPointerPoint_Base)
  ['{69A48EED-AF6C-5AE9-ACAD-A403EB13C0DA}']
    function First: IIterator_1__IPointerPoint; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.IRadialControllerMenuItem>
  IIterator_1__IRadialControllerMenuItem_Base = interface(IInspectable)
  ['{5A773E24-D968-535E-969A-76CE3602A637}']
  end;
  {
  // Used Types:  Windows.UI.Input.IRadialControllerMenuItem
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.IRadialControllerMenuItem>
  IIterator_1__IRadialControllerMenuItem = interface(IIterator_1__IRadialControllerMenuItem_Base)
  ['{1A32FA4D-B3ED-5B91-AC5D-F5CC1845E696}']
    function get_Current: IRadialControllerMenuItem; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIRadialControllerMenuItem): Cardinal; safecall;
    property Current: IRadialControllerMenuItem read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.IRadialControllerMenuItem>
  IIterable_1__IRadialControllerMenuItem_Base = interface(IInspectable)
  ['{1AA752B3-DC11-5BCE-B2B9-CD1BF8F235BE}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.IRadialControllerMenuItem>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.IRadialControllerMenuItem>
  IIterable_1__IRadialControllerMenuItem = interface(IIterable_1__IRadialControllerMenuItem_Base)
  ['{7C62A666-8F21-5875-AA98-951AC77DAEB3}']
    function First: IIterator_1__IRadialControllerMenuItem; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.IRadialController
  // Used Types:  Windows.UI.Core.ICoreDispatcher
  }
  // Windows.UI.Input.Core.IRadialControllerIndependentInputSource
  [WinRTClassNameAttribute(SCore_RadialControllerIndependentInputSource)]
  Core_IRadialControllerIndependentInputSource = interface(IInspectable)
  ['{3D577EF6-4CEE-11E6-B535-001BDC06AB3B}']
    function get_Controller: IRadialController; safecall;
    function get_Dispatcher: ICoreDispatcher; safecall;
    property Controller: IRadialController read get_Controller;
    property Dispatcher: ICoreDispatcher read get_Dispatcher;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Core.IRadialControllerIndependentInputSource
  // Used Types:  Windows.ApplicationModel.Core.ICoreApplicationView
  }
  // Windows.UI.Input.Core.IRadialControllerIndependentInputSourceStatics
  [WinRTClassNameAttribute(SCore_RadialControllerIndependentInputSource)]
  Core_IRadialControllerIndependentInputSourceStatics = interface(IInspectable)
  ['{3D577EF5-4CEE-11E6-B535-001BDC06AB3B}']
    function CreateForView(view: ICoreApplicationView): Core_IRadialControllerIndependentInputSource; safecall;
  end;

  {
  // Used Types:  Windows.UI.Input.IPointerPointTransform
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Point
  // Used Types:  Windows.Foundation.Rect
  }
  // Windows.UI.Input.IPointerPointTransform
  IPointerPointTransform = interface(IInspectable)
  ['{4D5FE14F-B87C-4028-BC9C-59E9947FB056}']
    function get_Inverse: IPointerPointTransform; safecall;
    function TryTransform(inPoint: TPointF; out outPoint: TPointF): Boolean; safecall;
    function TransformBounds(rect: TRectF): TRectF; safecall;
    property Inverse: IPointerPointTransform read get_Inverse;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Haptics.ISimpleHapticsController
  }
  // Windows.UI.Input.IRadialControllerRotationChangedEventArgs2
  IRadialControllerRotationChangedEventArgs2 = interface(IInspectable)
  ['{3D577EEC-4CEE-11E6-B535-001BDC06AB3B}']
    function get_IsButtonPressed: Boolean; safecall;
    function get_SimpleHapticsController: Haptics_ISimpleHapticsController; safecall;
    property IsButtonPressed: Boolean read get_IsButtonPressed;
    property SimpleHapticsController: Haptics_ISimpleHapticsController read get_SimpleHapticsController;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.IRadialControllerScreenContact
  // Used Types:  Windows.Devices.Haptics.ISimpleHapticsController
  }
  // Windows.UI.Input.IRadialControllerButtonPressedEventArgs
  [WinRTClassNameAttribute(SRadialControllerButtonPressedEventArgs)]
  IRadialControllerButtonPressedEventArgs = interface(IInspectable)
  ['{3D577EED-4CEE-11E6-B535-001BDC06AB3B}']
    function get_Contact: IRadialControllerScreenContact; safecall;
    function get_SimpleHapticsController: Haptics_ISimpleHapticsController; safecall;
    property Contact: IRadialControllerScreenContact read get_Contact;
    property SimpleHapticsController: Haptics_ISimpleHapticsController read get_SimpleHapticsController;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.IRadialControllerScreenContact
  // Used Types:  Windows.Devices.Haptics.ISimpleHapticsController
  }
  // Windows.UI.Input.IRadialControllerButtonHoldingEventArgs
  [WinRTClassNameAttribute(SRadialControllerButtonHoldingEventArgs)]
  IRadialControllerButtonHoldingEventArgs = interface(IInspectable)
  ['{3D577EEE-3CEE-11E6-B535-001BDC06AB3B}']
    function get_Contact: IRadialControllerScreenContact; safecall;
    function get_SimpleHapticsController: Haptics_ISimpleHapticsController; safecall;
    property Contact: IRadialControllerScreenContact read get_Contact;
    property SimpleHapticsController: Haptics_ISimpleHapticsController read get_SimpleHapticsController;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.IRadialControllerScreenContact
  // Used Types:  Windows.Devices.Haptics.ISimpleHapticsController
  }
  // Windows.UI.Input.IRadialControllerButtonReleasedEventArgs
  [WinRTClassNameAttribute(SRadialControllerButtonReleasedEventArgs)]
  IRadialControllerButtonReleasedEventArgs = interface(IInspectable)
  ['{3D577EEF-3CEE-11E6-B535-001BDC06AB3B}']
    function get_Contact: IRadialControllerScreenContact; safecall;
    function get_SimpleHapticsController: Haptics_ISimpleHapticsController; safecall;
    property Contact: IRadialControllerScreenContact read get_Contact;
    property SimpleHapticsController: Haptics_ISimpleHapticsController read get_SimpleHapticsController;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Haptics.ISimpleHapticsController
  }
  // Windows.UI.Input.IRadialControllerScreenContactStartedEventArgs2
  IRadialControllerScreenContactStartedEventArgs2 = interface(IInspectable)
  ['{3D577EF0-3CEE-11E6-B535-001BDC06AB3B}']
    function get_IsButtonPressed: Boolean; safecall;
    function get_SimpleHapticsController: Haptics_ISimpleHapticsController; safecall;
    property IsButtonPressed: Boolean read get_IsButtonPressed;
    property SimpleHapticsController: Haptics_ISimpleHapticsController read get_SimpleHapticsController;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Haptics.ISimpleHapticsController
  }
  // Windows.UI.Input.IRadialControllerScreenContactContinuedEventArgs2
  IRadialControllerScreenContactContinuedEventArgs2 = interface(IInspectable)
  ['{3D577EF1-3CEE-11E6-B535-001BDC06AB3B}']
    function get_IsButtonPressed: Boolean; safecall;
    function get_SimpleHapticsController: Haptics_ISimpleHapticsController; safecall;
    property IsButtonPressed: Boolean read get_IsButtonPressed;
    property SimpleHapticsController: Haptics_ISimpleHapticsController read get_SimpleHapticsController;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Haptics.ISimpleHapticsController
  }
  // Windows.UI.Input.IRadialControllerScreenContactEndedEventArgs
  [WinRTClassNameAttribute(SRadialControllerScreenContactEndedEventArgs)]
  IRadialControllerScreenContactEndedEventArgs = interface(IInspectable)
  ['{3D577EF2-3CEE-11E6-B535-001BDC06AB3B}']
    function get_IsButtonPressed: Boolean; safecall;
    function get_SimpleHapticsController: Haptics_ISimpleHapticsController; safecall;
    property IsButtonPressed: Boolean read get_IsButtonPressed;
    property SimpleHapticsController: Haptics_ISimpleHapticsController read get_SimpleHapticsController;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Haptics.ISimpleHapticsController
  }
  // Windows.UI.Input.IRadialControllerButtonClickedEventArgs2
  IRadialControllerButtonClickedEventArgs2 = interface(IInspectable)
  ['{3D577EF3-3CEE-11E6-B535-001BDC06AB3B}']
    function get_SimpleHapticsController: Haptics_ISimpleHapticsController; safecall;
    property SimpleHapticsController: Haptics_ISimpleHapticsController read get_SimpleHapticsController;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Haptics.ISimpleHapticsController
  }
  // Windows.UI.Input.IRadialControllerControlAcquiredEventArgs2
  IRadialControllerControlAcquiredEventArgs2 = interface(IInspectable)
  ['{3D577EF4-3CEE-11E6-B535-001BDC06AB3B}']
    function get_IsButtonPressed: Boolean; safecall;
    function get_SimpleHapticsController: Haptics_ISimpleHapticsController; safecall;
    property IsButtonPressed: Boolean read get_IsButtonPressed;
    property SimpleHapticsController: Haptics_ISimpleHapticsController read get_SimpleHapticsController;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerButtonPressedEventArgs>
  TypedEventHandler_2__IRadialController__IRadialControllerButtonPressedEventArgs_Delegate_Base = interface(IUnknown)
  ['{660BEE4A-4FED-5A62-AA5D-8113B477BC69}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.IRadialController
  // Used Types:  Windows.UI.Input.IRadialControllerButtonPressedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerButtonPressedEventArgs>
  TypedEventHandler_2__IRadialController__IRadialControllerButtonPressedEventArgs = interface(TypedEventHandler_2__IRadialController__IRadialControllerButtonPressedEventArgs_Delegate_Base)
  ['{A84E58BE-27BD-5B94-BD1C-AC5319506931}']
    procedure Invoke(sender: IRadialController; args: IRadialControllerButtonPressedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerButtonHoldingEventArgs>
  TypedEventHandler_2__IRadialController__IRadialControllerButtonHoldingEventArgs_Delegate_Base = interface(IUnknown)
  ['{4C44F2FF-3A4A-51BA-A01F-9F2002471F59}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.IRadialController
  // Used Types:  Windows.UI.Input.IRadialControllerButtonHoldingEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerButtonHoldingEventArgs>
  TypedEventHandler_2__IRadialController__IRadialControllerButtonHoldingEventArgs = interface(TypedEventHandler_2__IRadialController__IRadialControllerButtonHoldingEventArgs_Delegate_Base)
  ['{1DD1E759-DDBD-5FCC-AE7B-9DCFE3B28F7B}']
    procedure Invoke(sender: IRadialController; args: IRadialControllerButtonHoldingEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerButtonReleasedEventArgs>
  TypedEventHandler_2__IRadialController__IRadialControllerButtonReleasedEventArgs_Delegate_Base = interface(IUnknown)
  ['{C22FF62C-C642-5D50-9340-FE163122720C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.IRadialController
  // Used Types:  Windows.UI.Input.IRadialControllerButtonReleasedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerButtonReleasedEventArgs>
  TypedEventHandler_2__IRadialController__IRadialControllerButtonReleasedEventArgs = interface(TypedEventHandler_2__IRadialController__IRadialControllerButtonReleasedEventArgs_Delegate_Base)
  ['{16547458-2C91-5F76-AB77-69CBECB5085F}']
    procedure Invoke(sender: IRadialController; args: IRadialControllerButtonReleasedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerButtonPressedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerButtonHoldingEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerButtonReleasedEventArgs>
  }
  // Windows.UI.Input.IRadialController2
  IRadialController2 = interface(IInspectable)
  ['{3D577EFF-4CEE-11E6-B535-001BDC06AB3B}']
    function add_ButtonPressed(handler: TypedEventHandler_2__IRadialController__IRadialControllerButtonPressedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ButtonPressed(token: EventRegistrationToken); safecall;
    function add_ButtonHolding(handler: TypedEventHandler_2__IRadialController__IRadialControllerButtonHoldingEventArgs): EventRegistrationToken; safecall;
    procedure remove_ButtonHolding(token: EventRegistrationToken); safecall;
    function add_ButtonReleased(handler: TypedEventHandler_2__IRadialController__IRadialControllerButtonReleasedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ButtonReleased(token: EventRegistrationToken); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.UI.Input.IRadialController
  }
  // Windows.UI.Input.IRadialControllerStatics
  [WinRTClassNameAttribute(SRadialController)]
  IRadialControllerStatics = interface(IInspectable)
  ['{FADED0B7-B84C-4894-87AA-8F25AA5F288B}']
    function IsSupported: Boolean; safecall;
    function CreateForCurrentView: IRadialController; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.IRadialControllerMenuItem
  // Used Types:  String
  // Used Types:  Windows.Storage.Streams.IRandomAccessStreamReference
  // Used Types:  Windows.UI.Input.RadialControllerMenuKnownIcon
  }
  // Windows.UI.Input.IRadialControllerMenuItemStatics
  [WinRTClassNameAttribute(SRadialControllerMenuItem)]
  IRadialControllerMenuItemStatics = interface(IInspectable)
  ['{249E0887-D842-4524-9DF8-E0D647EDC887}']
    function CreateFromIcon(displayText: HSTRING; icon: IRandomAccessStreamReference): IRadialControllerMenuItem; safecall;
    function CreateFromKnownIcon(displayText: HSTRING; value: RadialControllerMenuKnownIcon): IRadialControllerMenuItem; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.IRadialControllerMenuItem
  // Used Types:  String
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.UI.Input.IRadialControllerMenuItemStatics2
  [WinRTClassNameAttribute(SRadialControllerMenuItem)]
  IRadialControllerMenuItemStatics2 = interface(IInspectable)
  ['{0CBB70BE-7E3E-48BD-BE04-2C7FCAA9C1FF}']
    function CreateFromFontGlyph(displayText: HSTRING; glyph: HSTRING; fontFamily: HSTRING): IRadialControllerMenuItem; overload; safecall;
    function CreateFromFontGlyph(displayText: HSTRING; glyph: HSTRING; fontFamily: HSTRING; fontUri: IUriRuntimeClass): IRadialControllerMenuItem; overload; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.RadialControllerSystemMenuItemKind>
  IIterator_1__RadialControllerSystemMenuItemKind_Base = interface(IInspectable)
  ['{3FBC1858-A43E-54DC-B0E2-8B098BDDACF6}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.RadialControllerSystemMenuItemKind
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.RadialControllerSystemMenuItemKind>
  IIterator_1__RadialControllerSystemMenuItemKind = interface(IIterator_1__RadialControllerSystemMenuItemKind_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: RadialControllerSystemMenuItemKind; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PRadialControllerSystemMenuItemKind): Cardinal; safecall;
    property Current: RadialControllerSystemMenuItemKind read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.RadialControllerSystemMenuItemKind>
  IIterable_1__RadialControllerSystemMenuItemKind_Base = interface(IInspectable)
  ['{4516010F-FD98-5E1D-BF3F-AEAF79F1F3DA}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.RadialControllerSystemMenuItemKind>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.RadialControllerSystemMenuItemKind>
  IIterable_1__RadialControllerSystemMenuItemKind = interface(IIterable_1__RadialControllerSystemMenuItemKind_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__RadialControllerSystemMenuItemKind; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.RadialControllerSystemMenuItemKind>
  // Used Types:  Boolean
  // Used Types:  Windows.UI.Input.RadialControllerSystemMenuItemKind
  }
  // Windows.UI.Input.IRadialControllerConfiguration
  [WinRTClassNameAttribute(SRadialControllerConfiguration)]
  IRadialControllerConfiguration = interface(IInspectable)
  ['{A6B79ECB-6A52-4430-910C-56370A9D6B42}']
    procedure SetDefaultMenuItems(buttons: IIterable_1__RadialControllerSystemMenuItemKind); safecall;
    procedure ResetToDefaultMenuItems; safecall;
    function TrySelectDefaultMenuItem(&type: RadialControllerSystemMenuItemKind): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.IRadialControllerConfiguration
  }
  // Windows.UI.Input.IRadialControllerConfigurationStatics
  [WinRTClassNameAttribute(SRadialControllerConfiguration)]
  IRadialControllerConfigurationStatics = interface(IInspectable)
  ['{79B6B0E5-069A-4486-A99D-8DB772B9642F}']
    function GetForCurrentView: IRadialControllerConfiguration; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.IRadialController
  // Used Types:  Boolean
  }
  // Windows.UI.Input.IRadialControllerConfiguration2
  IRadialControllerConfiguration2 = interface(IInspectable)
  ['{3D577EF7-3CEE-11E6-B535-001BDC06AB3B}']
    procedure put_ActiveControllerWhenMenuIsSuppressed(value: IRadialController); safecall;
    function get_ActiveControllerWhenMenuIsSuppressed: IRadialController; safecall;
    procedure put_IsMenuSuppressed(value: Boolean); safecall;
    function get_IsMenuSuppressed: Boolean; safecall;
    property ActiveControllerWhenMenuIsSuppressed: IRadialController read get_ActiveControllerWhenMenuIsSuppressed write put_ActiveControllerWhenMenuIsSuppressed;
    property IsMenuSuppressed: Boolean read get_IsMenuSuppressed write put_IsMenuSuppressed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.IRadialController
  // Used Types:  Boolean
  }
  // Windows.UI.Input.IRadialControllerConfigurationStatics2
  [WinRTClassNameAttribute(SRadialControllerConfiguration)]
  IRadialControllerConfigurationStatics2 = interface(IInspectable)
  ['{53E08B17-E205-48D3-9CAF-80FF47C4D7C7}']
    procedure put_AppController(value: IRadialController); safecall;
    function get_AppController: IRadialController; safecall;
    procedure put_IsAppControllerEnabled(value: Boolean); safecall;
    function get_IsAppControllerEnabled: Boolean; safecall;
    property AppController: IRadialController read get_AppController write put_AppController;
    property IsAppControllerEnabled: Boolean read get_IsAppControllerEnabled write put_IsAppControllerEnabled;
  end;


  // Emit Forwarded classes
  // Windows.UI.Input.Core.RadialControllerIndependentInputSource
  // DualAPI
  // Implements: Windows.UI.Input.Core.IRadialControllerIndependentInputSource
  // Statics: "Windows.UI.Input.Core.IRadialControllerIndependentInputSourceStatics"
  TCore_RadialControllerIndependentInputSource = class(TWinRTGenericImportS<Core_IRadialControllerIndependentInputSourceStatics>)
  public
    // -> Core_IRadialControllerIndependentInputSourceStatics
    class function CreateForView(view: ICoreApplicationView): Core_IRadialControllerIndependentInputSource; static; inline;
  end;

  // Windows.UI.Input.RadialControllerScreenContact
  // DualAPI
  // Implements: Windows.UI.Input.IRadialControllerScreenContact

  // Windows.UI.Input.RadialControllerMenu
  // DualAPI
  // Implements: Windows.UI.Input.IRadialControllerMenu

  // Windows.UI.Input.RadialController
  // DualAPI
  // Implements: Windows.UI.Input.IRadialController
  // Implements: Windows.UI.Input.IRadialController2
  // Statics: "Windows.UI.Input.IRadialControllerStatics"
  TRadialController = class(TWinRTGenericImportS<IRadialControllerStatics>)
  public
    // -> IRadialControllerStatics
    class function IsSupported: Boolean; static; inline;
    class function CreateForCurrentView: IRadialController; static; inline;
  end;

  // Windows.UI.Input.RadialControllerScreenContactStartedEventArgs
  // DualAPI
  // Implements: Windows.UI.Input.IRadialControllerScreenContactStartedEventArgs
  // Implements: Windows.UI.Input.IRadialControllerScreenContactStartedEventArgs2

  // Windows.UI.Input.RadialControllerScreenContactContinuedEventArgs
  // DualAPI
  // Implements: Windows.UI.Input.IRadialControllerScreenContactContinuedEventArgs
  // Implements: Windows.UI.Input.IRadialControllerScreenContactContinuedEventArgs2

  // Windows.UI.Input.RadialControllerRotationChangedEventArgs
  // DualAPI
  // Implements: Windows.UI.Input.IRadialControllerRotationChangedEventArgs
  // Implements: Windows.UI.Input.IRadialControllerRotationChangedEventArgs2

  // Windows.UI.Input.RadialControllerButtonClickedEventArgs
  // DualAPI
  // Implements: Windows.UI.Input.IRadialControllerButtonClickedEventArgs
  // Implements: Windows.UI.Input.IRadialControllerButtonClickedEventArgs2

  // Windows.UI.Input.RadialControllerControlAcquiredEventArgs
  // DualAPI
  // Implements: Windows.UI.Input.IRadialControllerControlAcquiredEventArgs
  // Implements: Windows.UI.Input.IRadialControllerControlAcquiredEventArgs2

  // Windows.UI.Input.RadialControllerButtonPressedEventArgs
  // DualAPI
  // Implements: Windows.UI.Input.IRadialControllerButtonPressedEventArgs

  // Windows.UI.Input.RadialControllerButtonHoldingEventArgs
  // DualAPI
  // Implements: Windows.UI.Input.IRadialControllerButtonHoldingEventArgs

  // Windows.UI.Input.RadialControllerButtonReleasedEventArgs
  // DualAPI
  // Implements: Windows.UI.Input.IRadialControllerButtonReleasedEventArgs

  // Windows.UI.Input.RadialControllerMenuItem
  // DualAPI
  // Implements: Windows.UI.Input.IRadialControllerMenuItem
  // Statics: "Windows.UI.Input.IRadialControllerMenuItemStatics2"
  // Statics: "Windows.UI.Input.IRadialControllerMenuItemStatics"
  TRadialControllerMenuItem = class(TWinRTGenericImportS2<IRadialControllerMenuItemStatics, IRadialControllerMenuItemStatics2>)
  public
    // -> IRadialControllerMenuItemStatics2
    class function CreateFromFontGlyph(displayText: HSTRING; glyph: HSTRING; fontFamily: HSTRING): IRadialControllerMenuItem; overload; static; inline;
    class function CreateFromFontGlyph(displayText: HSTRING; glyph: HSTRING; fontFamily: HSTRING; fontUri: IUriRuntimeClass): IRadialControllerMenuItem; overload; static; inline;

    // -> IRadialControllerMenuItemStatics
    class function CreateFromIcon(displayText: HSTRING; icon: IRandomAccessStreamReference): IRadialControllerMenuItem; static; inline;
    class function CreateFromKnownIcon(displayText: HSTRING; value: RadialControllerMenuKnownIcon): IRadialControllerMenuItem; static; inline;
  end;

  // Windows.UI.Input.RadialControllerConfiguration
  // DualAPI
  // Implements: Windows.UI.Input.IRadialControllerConfiguration
  // Implements: Windows.UI.Input.IRadialControllerConfiguration2
  // Statics: "Windows.UI.Input.IRadialControllerConfigurationStatics2"
  // Statics: "Windows.UI.Input.IRadialControllerConfigurationStatics"
  TRadialControllerConfiguration = class(TWinRTGenericImportS2<IRadialControllerConfigurationStatics, IRadialControllerConfigurationStatics2>)
  public
    // -> IRadialControllerConfigurationStatics2
    class procedure put_AppController(value: IRadialController); static; inline;
    class function get_AppController: IRadialController; static; inline;
    class procedure put_IsAppControllerEnabled(value: Boolean); static; inline;
    class function get_IsAppControllerEnabled: Boolean; static; inline;
    class property AppController: IRadialController read get_AppController write put_AppController;
    class property IsAppControllerEnabled: Boolean read get_IsAppControllerEnabled write put_IsAppControllerEnabled;

    // -> IRadialControllerConfigurationStatics
    class function GetForCurrentView: IRadialControllerConfiguration; static; inline;
  end;

  // Windows.UI.Input.RadialControllerScreenContactEndedEventArgs
  // DualAPI
  // Implements: Windows.UI.Input.IRadialControllerScreenContactEndedEventArgs


implementation

  // Emit Classes Implementation
 { TCore_RadialControllerIndependentInputSource }

class function TCore_RadialControllerIndependentInputSource.CreateForView(view: ICoreApplicationView): Core_IRadialControllerIndependentInputSource;
begin
  Result := Statics.CreateForView(view);
end;


 { TRadialController }

class function TRadialController.IsSupported: Boolean;
begin
  Result := Statics.IsSupported;
end;

class function TRadialController.CreateForCurrentView: IRadialController;
begin
  Result := Statics.CreateForCurrentView;
end;


 { TRadialControllerMenuItem }

class function TRadialControllerMenuItem.CreateFromIcon(displayText: HSTRING; icon: IRandomAccessStreamReference): IRadialControllerMenuItem;
begin
  Result := Statics.CreateFromIcon(displayText, icon);
end;

class function TRadialControllerMenuItem.CreateFromKnownIcon(displayText: HSTRING; value: RadialControllerMenuKnownIcon): IRadialControllerMenuItem;
begin
  Result := Statics.CreateFromKnownIcon(displayText, value);
end;


class function TRadialControllerMenuItem.CreateFromFontGlyph(displayText: HSTRING; glyph: HSTRING; fontFamily: HSTRING): IRadialControllerMenuItem;
begin
  Result := Statics2.CreateFromFontGlyph(displayText, glyph, fontFamily);
end;

class function TRadialControllerMenuItem.CreateFromFontGlyph(displayText: HSTRING; glyph: HSTRING; fontFamily: HSTRING; fontUri: IUriRuntimeClass): IRadialControllerMenuItem;
begin
  Result := Statics2.CreateFromFontGlyph(displayText, glyph, fontFamily, fontUri);
end;


 { TRadialControllerConfiguration }

class function TRadialControllerConfiguration.GetForCurrentView: IRadialControllerConfiguration;
begin
  Result := Statics.GetForCurrentView;
end;


class procedure TRadialControllerConfiguration.put_AppController(value: IRadialController);
begin
  Statics2.put_AppController(value);
end;

class function TRadialControllerConfiguration.get_AppController: IRadialController;
begin
  Result := Statics2.get_AppController;
end;

class procedure TRadialControllerConfiguration.put_IsAppControllerEnabled(value: Boolean);
begin
  Statics2.put_IsAppControllerEnabled(value);
end;

class function TRadialControllerConfiguration.get_IsAppControllerEnabled: Boolean;
begin
  Result := Statics2.get_IsAppControllerEnabled;
end;



end.
