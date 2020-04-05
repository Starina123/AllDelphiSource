{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.UI.Core;

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
  // Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Core.IInputEnabledEventArgs>
  TypedEventHandler_2__IInspectable__IInputEnabledEventArgs = interface;
  PTypedEventHandler_2__IInspectable__IInputEnabledEventArgs = ^TypedEventHandler_2__IInspectable__IInputEnabledEventArgs;

  // Windows.UI.Core.IInitializeWithCoreWindow
  IInitializeWithCoreWindow = interface;
  PIInitializeWithCoreWindow = ^IInitializeWithCoreWindow;

  // Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Core.IPointerEventArgs>
  TypedEventHandler_2__IInspectable__IPointerEventArgs = interface;
  PTypedEventHandler_2__IInspectable__IPointerEventArgs = ^TypedEventHandler_2__IInspectable__IPointerEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Core.ICharacterReceivedEventArgs>
  TypedEventHandler_2__IInspectable__ICharacterReceivedEventArgs = interface;
  PTypedEventHandler_2__IInspectable__ICharacterReceivedEventArgs = ^TypedEventHandler_2__IInspectable__ICharacterReceivedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Core.IKeyEventArgs>
  TypedEventHandler_2__IInspectable__IKeyEventArgs = interface;
  PTypedEventHandler_2__IInspectable__IKeyEventArgs = ^TypedEventHandler_2__IInspectable__IKeyEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Core.ICoreWindowEventArgs>
  TypedEventHandler_2__IInspectable__ICoreWindowEventArgs = interface;
  PTypedEventHandler_2__IInspectable__ICoreWindowEventArgs = ^TypedEventHandler_2__IInspectable__ICoreWindowEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Core.ITouchHitTestingEventArgs>
  TypedEventHandler_2__IInspectable__ITouchHitTestingEventArgs = interface;
  PTypedEventHandler_2__IInspectable__ITouchHitTestingEventArgs = ^TypedEventHandler_2__IInspectable__ITouchHitTestingEventArgs;

  // Windows.UI.Core.AnimationMetrics.IPropertyAnimation
  AnimationMetrics_IPropertyAnimation = interface;
  PAnimationMetrics_IPropertyAnimation = ^AnimationMetrics_IPropertyAnimation;

  // Windows.UI.Core.AnimationMetrics.IScaleAnimation
  AnimationMetrics_IScaleAnimation = interface;
  PAnimationMetrics_IScaleAnimation = ^AnimationMetrics_IScaleAnimation;

  // Windows.UI.Core.AnimationMetrics.IOpacityAnimation
  AnimationMetrics_IOpacityAnimation = interface;
  PAnimationMetrics_IOpacityAnimation = ^AnimationMetrics_IOpacityAnimation;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Core.AnimationMetrics.IPropertyAnimation>
  IIterator_1__AnimationMetrics_IPropertyAnimation = interface;
  PIIterator_1__AnimationMetrics_IPropertyAnimation = ^IIterator_1__AnimationMetrics_IPropertyAnimation;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Core.AnimationMetrics.IPropertyAnimation>
  IIterable_1__AnimationMetrics_IPropertyAnimation = interface;
  PIIterable_1__AnimationMetrics_IPropertyAnimation = ^IIterable_1__AnimationMetrics_IPropertyAnimation;

  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Core.AnimationMetrics.IPropertyAnimation>
  IVectorView_1__AnimationMetrics_IPropertyAnimation = interface;
  PIVectorView_1__AnimationMetrics_IPropertyAnimation = ^IVectorView_1__AnimationMetrics_IPropertyAnimation;

  // Windows.UI.Core.AnimationMetrics.IAnimationDescription
  AnimationMetrics_IAnimationDescription = interface;
  PAnimationMetrics_IAnimationDescription = ^AnimationMetrics_IAnimationDescription;

  // Windows.UI.Core.AnimationMetrics.IAnimationDescriptionFactory
  AnimationMetrics_IAnimationDescriptionFactory = interface;
  PAnimationMetrics_IAnimationDescriptionFactory = ^AnimationMetrics_IAnimationDescriptionFactory;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.UI.Core Interfaces
  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Core.IInputEnabledEventArgs>
  TypedEventHandler_2__IInspectable__IInputEnabledEventArgs_Delegate_Base = interface(IUnknown)
  ['{C9965F1C-3641-51B6-B823-048EC3628FB0}']
  end;
  {
  // Used Types:  Object
  // Used Types:  Windows.UI.Core.IInputEnabledEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Core.IInputEnabledEventArgs>
  TypedEventHandler_2__IInspectable__IInputEnabledEventArgs = interface(TypedEventHandler_2__IInspectable__IInputEnabledEventArgs_Delegate_Base)
  ['{CAEE5D54-F45C-56BC-8F24-FFB2A20A00B5}']
    procedure Invoke(sender: IInspectable; args: IInputEnabledEventArgs); safecall;
  end;

  {
  // Used Types:  Windows.UI.Core.ICoreWindow
  }
  // Windows.UI.Core.IInitializeWithCoreWindow
  IInitializeWithCoreWindow = interface(IInspectable)
  ['{188F20D6-9873-464A-ACE5-57E010F465E6}']
    procedure Initialize(window: ICoreWindow); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Core.IPointerEventArgs>
  TypedEventHandler_2__IInspectable__IPointerEventArgs_Delegate_Base = interface(IUnknown)
  ['{26AABF41-A0FD-5E66-B188-6C74182D00CD}']
  end;
  {
  // Used Types:  Object
  // Used Types:  Windows.UI.Core.IPointerEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Core.IPointerEventArgs>
  TypedEventHandler_2__IInspectable__IPointerEventArgs = interface(TypedEventHandler_2__IInspectable__IPointerEventArgs_Delegate_Base)
  ['{698383FB-4816-51E2-B784-F1EFD30A0A7F}']
    procedure Invoke(sender: IInspectable; args: IPointerEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Core.ICharacterReceivedEventArgs>
  TypedEventHandler_2__IInspectable__ICharacterReceivedEventArgs_Delegate_Base = interface(IUnknown)
  ['{5AA4A848-86B2-506B-89AB-5EB5786420C6}']
  end;
  {
  // Used Types:  Object
  // Used Types:  Windows.UI.Core.ICharacterReceivedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Core.ICharacterReceivedEventArgs>
  TypedEventHandler_2__IInspectable__ICharacterReceivedEventArgs = interface(TypedEventHandler_2__IInspectable__ICharacterReceivedEventArgs_Delegate_Base)
  ['{B1626D26-8C50-5526-947F-76E5652A527F}']
    procedure Invoke(sender: IInspectable; args: ICharacterReceivedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Core.IKeyEventArgs>
  TypedEventHandler_2__IInspectable__IKeyEventArgs_Delegate_Base = interface(IUnknown)
  ['{EADFFDF7-D70E-5688-906C-C2B1229EA16D}']
  end;
  {
  // Used Types:  Object
  // Used Types:  Windows.UI.Core.IKeyEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Core.IKeyEventArgs>
  TypedEventHandler_2__IInspectable__IKeyEventArgs = interface(TypedEventHandler_2__IInspectable__IKeyEventArgs_Delegate_Base)
  ['{DEC68719-2C61-5E75-8DCB-AEA742273701}']
    procedure Invoke(sender: IInspectable; args: IKeyEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Core.ICoreWindowEventArgs>
  TypedEventHandler_2__IInspectable__ICoreWindowEventArgs_Delegate_Base = interface(IUnknown)
  ['{1A8AC270-A777-50F7-88A1-E34E56C09449}']
  end;
  {
  // Used Types:  Object
  // Used Types:  Windows.UI.Core.ICoreWindowEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Core.ICoreWindowEventArgs>
  TypedEventHandler_2__IInspectable__ICoreWindowEventArgs = interface(TypedEventHandler_2__IInspectable__ICoreWindowEventArgs_Delegate_Base)
  ['{F520E86D-9D9B-5024-8BAE-1DCBDDEFC67E}']
    procedure Invoke(sender: IInspectable; args: ICoreWindowEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Core.ITouchHitTestingEventArgs>
  TypedEventHandler_2__IInspectable__ITouchHitTestingEventArgs_Delegate_Base = interface(IUnknown)
  ['{C76E9D25-6A96-58FD-874F-AE52BD603AF8}']
  end;
  {
  // Used Types:  Object
  // Used Types:  Windows.UI.Core.ITouchHitTestingEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Core.ITouchHitTestingEventArgs>
  TypedEventHandler_2__IInspectable__ITouchHitTestingEventArgs = interface(TypedEventHandler_2__IInspectable__ITouchHitTestingEventArgs_Delegate_Base)
  ['{202CDEA7-C8ED-5F65-9E1A-9FD2606E6851}']
    procedure Invoke(sender: IInspectable; args: ITouchHitTestingEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Core.AnimationMetrics.PropertyAnimationType
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Foundation.Point
  }
  // Windows.UI.Core.AnimationMetrics.IPropertyAnimation
  [WinRTClassNameAttribute(SAnimationMetrics_TranslationAnimation)]
  AnimationMetrics_IPropertyAnimation = interface(IInspectable)
  ['{3A01B4DA-4D8C-411E-B615-1ADE683A9903}']
    function get_Type: AnimationMetrics_PropertyAnimationType; safecall;
    function get_Delay: TimeSpan; safecall;
    function get_Duration: TimeSpan; safecall;
    function get_Control1: TPointF; safecall;
    function get_Control2: TPointF; safecall;
    property Control1: TPointF read get_Control1;
    property Control2: TPointF read get_Control2;
    property Delay: TimeSpan read get_Delay;
    property Duration: TimeSpan read get_Duration;
    property &Type: AnimationMetrics_PropertyAnimationType read get_Type;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Single>
  // Used Types:  Single
  // Used Types:  Windows.Foundation.Point
  }
  // Windows.UI.Core.AnimationMetrics.IScaleAnimation
  [WinRTClassNameAttribute(SAnimationMetrics_ScaleAnimation)]
  AnimationMetrics_IScaleAnimation = interface(IInspectable)
  ['{023552C7-71AB-428C-9C9F-D31780964995}']
    function get_InitialScaleX: IReference_1__Single; safecall;
    function get_InitialScaleY: IReference_1__Single; safecall;
    function get_FinalScaleX: Single; safecall;
    function get_FinalScaleY: Single; safecall;
    function get_NormalizedOrigin: TPointF; safecall;
    property FinalScaleX: Single read get_FinalScaleX;
    property FinalScaleY: Single read get_FinalScaleY;
    property InitialScaleX: IReference_1__Single read get_InitialScaleX;
    property InitialScaleY: IReference_1__Single read get_InitialScaleY;
    property NormalizedOrigin: TPointF read get_NormalizedOrigin;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Single>
  // Used Types:  Single
  }
  // Windows.UI.Core.AnimationMetrics.IOpacityAnimation
  [WinRTClassNameAttribute(SAnimationMetrics_OpacityAnimation)]
  AnimationMetrics_IOpacityAnimation = interface(IInspectable)
  ['{803AABE5-EE7E-455F-84E9-2506AFB8D2B4}']
    function get_InitialOpacity: IReference_1__Single; safecall;
    function get_FinalOpacity: Single; safecall;
    property FinalOpacity: Single read get_FinalOpacity;
    property InitialOpacity: IReference_1__Single read get_InitialOpacity;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Core.AnimationMetrics.IPropertyAnimation>
  IIterator_1__AnimationMetrics_IPropertyAnimation_Base = interface(IInspectable)
  ['{BB6799D3-9F1A-5A4E-A940-945F1AB8C4FE}']
  end;
  {
  // Used Types:  Windows.UI.Core.AnimationMetrics.IPropertyAnimation
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Core.AnimationMetrics.IPropertyAnimation>
  IIterator_1__AnimationMetrics_IPropertyAnimation = interface(IIterator_1__AnimationMetrics_IPropertyAnimation_Base)
  ['{BB6799D3-9F1A-5A4E-A940-945F1AB8C4FE}']
    function get_Current: AnimationMetrics_IPropertyAnimation; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PAnimationMetrics_IPropertyAnimation): Cardinal; safecall;
    property Current: AnimationMetrics_IPropertyAnimation read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Core.AnimationMetrics.IPropertyAnimation>
  IIterable_1__AnimationMetrics_IPropertyAnimation_Base = interface(IInspectable)
  ['{C75F1BD1-A3C1-5881-9DA0-1ECDB8E51BC3}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.Core.AnimationMetrics.IPropertyAnimation>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Core.AnimationMetrics.IPropertyAnimation>
  IIterable_1__AnimationMetrics_IPropertyAnimation = interface(IIterable_1__AnimationMetrics_IPropertyAnimation_Base)
  ['{C75F1BD1-A3C1-5881-9DA0-1ECDB8E51BC3}']
    function First: IIterator_1__AnimationMetrics_IPropertyAnimation; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Core.AnimationMetrics.IPropertyAnimation
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Core.AnimationMetrics.IPropertyAnimation>
  IVectorView_1__AnimationMetrics_IPropertyAnimation = interface(IInspectable)
  ['{3A6ED95D-6A50-5EAD-A4C6-09F8BABC632C}']
    function GetAt(index: Cardinal): AnimationMetrics_IPropertyAnimation; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: AnimationMetrics_IPropertyAnimation; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAnimationMetrics_IPropertyAnimation): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.UI.Core.AnimationMetrics.IPropertyAnimation>
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Single
  // Used Types:  Int32
  }
  // Windows.UI.Core.AnimationMetrics.IAnimationDescription
  [WinRTClassNameAttribute(SAnimationMetrics_AnimationDescription)]
  AnimationMetrics_IAnimationDescription = interface(IInspectable)
  ['{7D11A549-BE3D-41DE-B081-05C149962F9B}']
    function get_Animations: IVectorView_1__AnimationMetrics_IPropertyAnimation; safecall;
    function get_StaggerDelay: TimeSpan; safecall;
    function get_StaggerDelayFactor: Single; safecall;
    function get_DelayLimit: TimeSpan; safecall;
    function get_ZOrder: Integer; safecall;
    property Animations: IVectorView_1__AnimationMetrics_IPropertyAnimation read get_Animations;
    property DelayLimit: TimeSpan read get_DelayLimit;
    property StaggerDelay: TimeSpan read get_StaggerDelay;
    property StaggerDelayFactor: Single read get_StaggerDelayFactor;
    property ZOrder: Integer read get_ZOrder;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Core.AnimationMetrics.IAnimationDescription
  // Used Types:  Windows.UI.Core.AnimationMetrics.AnimationEffect
  // Used Types:  Windows.UI.Core.AnimationMetrics.AnimationEffectTarget
  }
  // Windows.UI.Core.AnimationMetrics.IAnimationDescriptionFactory
  [WinRTClassNameAttribute(SAnimationMetrics_AnimationDescription)]
  AnimationMetrics_IAnimationDescriptionFactory = interface(IInspectable)
  ['{C6E27ABE-C1FB-48B5-9271-ECC70AC86EF0}']
    function CreateInstance(effect: AnimationMetrics_AnimationEffect; target: AnimationMetrics_AnimationEffectTarget): AnimationMetrics_IAnimationDescription; safecall;
  end;


  // Emit Forwarded classes
  // Windows.UI.Core.AnimationMetrics.AnimationDescription
  // DualAPI
  // Implements: Windows.UI.Core.AnimationMetrics.IAnimationDescription
  // Factory: "Windows.UI.Core.AnimationMetrics.IAnimationDescriptionFactory"
  TAnimationMetrics_AnimationDescription = class(TWinRTGenericImportF<AnimationMetrics_IAnimationDescriptionFactory>)
  public
    // -> AnimationMetrics_IAnimationDescriptionFactory
    class function CreateInstance(effect: AnimationMetrics_AnimationEffect; target: AnimationMetrics_AnimationEffectTarget): AnimationMetrics_IAnimationDescription; static; inline;
  end;

  // Windows.UI.Core.AnimationMetrics.PropertyAnimation
  // DualAPI
  // Implements: Windows.UI.Core.AnimationMetrics.IPropertyAnimation

  // Windows.UI.Core.AnimationMetrics.ScaleAnimation
  // DualAPI
  // Implements: Windows.UI.Core.AnimationMetrics.IScaleAnimation
  // Implements: Windows.UI.Core.AnimationMetrics.IPropertyAnimation

  // Windows.UI.Core.AnimationMetrics.TranslationAnimation
  // DualAPI
  // Implements: Windows.UI.Core.AnimationMetrics.IPropertyAnimation

  // Windows.UI.Core.AnimationMetrics.OpacityAnimation
  // DualAPI
  // Implements: Windows.UI.Core.AnimationMetrics.IOpacityAnimation
  // Implements: Windows.UI.Core.AnimationMetrics.IPropertyAnimation


implementation

  // Emit Classes Implementation
 { TAnimationMetrics_AnimationDescription }
// Factories for : "AnimationMetrics_AnimationDescription"
// Factory: "Windows.UI.Core.AnimationMetrics.IAnimationDescriptionFactory"
// -> AnimationMetrics_IAnimationDescriptionFactory

class function TAnimationMetrics_AnimationDescription.CreateInstance(effect: AnimationMetrics_AnimationEffect; target: AnimationMetrics_AnimationEffectTarget): AnimationMetrics_IAnimationDescription;
begin
  Result := Factory.CreateInstance(effect, target);
end;



end.
