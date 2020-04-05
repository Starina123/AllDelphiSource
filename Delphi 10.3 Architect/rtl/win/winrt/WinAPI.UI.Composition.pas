{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.UI.Composition;

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses 
  Winapi.Winrt, 
  System.Types, 
  System.Win.WinRT, 
  Winapi.CommonTypes, 
  Winapi.Foundation.Types, 
  Winapi.GraphicsRT, 
  Winapi.Foundation, 
  Winapi.SystemRT, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.UI.Composition.ICompositionSurface
  ICompositionSurface = interface;
  PICompositionSurface = ^ICompositionSurface;

  // Windows.UI.Composition.ICompositionEasingFunction
  ICompositionEasingFunction = interface;
  PICompositionEasingFunction = ^ICompositionEasingFunction;

  // Windows.UI.Composition.IColorKeyFrameAnimation
  IColorKeyFrameAnimation = interface;
  PIColorKeyFrameAnimation = ^IColorKeyFrameAnimation;

  // Windows.UI.Composition.ICompositionColorBrush
  ICompositionColorBrush = interface;
  PICompositionColorBrush = ^ICompositionColorBrush;

  // Windows.UI.Composition.ICompositionClip
  ICompositionClip = interface;
  PICompositionClip = ^ICompositionClip;

  // Windows.UI.Composition.IVisual
  IVisual = interface;
  PIVisual = ^IVisual;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.IVisual>
  IIterator_1__IVisual = interface;
  PIIterator_1__IVisual = ^IIterator_1__IVisual;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.IVisual>
  IIterable_1__IVisual = interface;
  PIIterable_1__IVisual = ^IIterable_1__IVisual;

  // Windows.UI.Composition.IVisualCollection
  IVisualCollection = interface;
  PIVisualCollection = ^IVisualCollection;

  // Windows.UI.Composition.IContainerVisual
  IContainerVisual = interface;
  PIContainerVisual = ^IContainerVisual;

  // Windows.UI.Composition.ICubicBezierEasingFunction
  ICubicBezierEasingFunction = interface;
  PICubicBezierEasingFunction = ^ICubicBezierEasingFunction;

  // Windows.UI.Composition.ICompositionBrush
  ICompositionBrush = interface;
  PICompositionBrush = ^ICompositionBrush;

  // Windows.UI.Composition.ICompositionEffectBrush
  ICompositionEffectBrush = interface;
  PICompositionEffectBrush = ^ICompositionEffectBrush;

  // Windows.UI.Composition.ICompositionEffectFactory
  ICompositionEffectFactory = interface;
  PICompositionEffectFactory = ^ICompositionEffectFactory;

  // Windows.UI.Composition.IExpressionAnimation
  IExpressionAnimation = interface;
  PIExpressionAnimation = ^IExpressionAnimation;

  // Windows.UI.Composition.IInsetClip
  IInsetClip = interface;
  PIInsetClip = ^IInsetClip;

  // Windows.UI.Composition.ILinearEasingFunction
  ILinearEasingFunction = interface;
  PILinearEasingFunction = ^ILinearEasingFunction;

  // Windows.UI.Composition.ICompositionPropertySet
  ICompositionPropertySet = interface;
  PICompositionPropertySet = ^ICompositionPropertySet;

  // Windows.UI.Composition.IQuaternionKeyFrameAnimation
  IQuaternionKeyFrameAnimation = interface;
  PIQuaternionKeyFrameAnimation = ^IQuaternionKeyFrameAnimation;

  // Windows.UI.Composition.IScalarKeyFrameAnimation
  IScalarKeyFrameAnimation = interface;
  PIScalarKeyFrameAnimation = ^IScalarKeyFrameAnimation;

  // Windows.UI.Composition.ICompositionBatchCompletedEventArgs
  ICompositionBatchCompletedEventArgs = interface;
  PICompositionBatchCompletedEventArgs = ^ICompositionBatchCompletedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Composition.ICompositionBatchCompletedEventArgs>
  TypedEventHandler_2__IInspectable__ICompositionBatchCompletedEventArgs = interface;
  PTypedEventHandler_2__IInspectable__ICompositionBatchCompletedEventArgs = ^TypedEventHandler_2__IInspectable__ICompositionBatchCompletedEventArgs;

  // Windows.UI.Composition.ICompositionScopedBatch
  ICompositionScopedBatch = interface;
  PICompositionScopedBatch = ^ICompositionScopedBatch;

  // Windows.UI.Composition.ISpriteVisual
  ISpriteVisual = interface;
  PISpriteVisual = ^ISpriteVisual;

  // Windows.UI.Composition.ICompositionSurfaceBrush
  ICompositionSurfaceBrush = interface;
  PICompositionSurfaceBrush = ^ICompositionSurfaceBrush;

  // Windows.UI.Composition.ICompositionTarget
  ICompositionTarget = interface;
  PICompositionTarget = ^ICompositionTarget;

  // Windows.UI.Composition.IVector2KeyFrameAnimation
  IVector2KeyFrameAnimation = interface;
  PIVector2KeyFrameAnimation = ^IVector2KeyFrameAnimation;

  // Windows.UI.Composition.IVector3KeyFrameAnimation
  IVector3KeyFrameAnimation = interface;
  PIVector3KeyFrameAnimation = ^IVector3KeyFrameAnimation;

  // Windows.UI.Composition.IVector4KeyFrameAnimation
  IVector4KeyFrameAnimation = interface;
  PIVector4KeyFrameAnimation = ^IVector4KeyFrameAnimation;

  // Windows.UI.Composition.ICompositionCommitBatch
  ICompositionCommitBatch = interface;
  PICompositionCommitBatch = ^ICompositionCommitBatch;

  // Windows.UI.Composition.ICompositor
  ICompositor = interface;
  PICompositor = ^ICompositor;

  // Windows.UI.Composition.ICompositionAnimationBase
  ICompositionAnimationBase = interface;
  PICompositionAnimationBase = ^ICompositionAnimationBase;

  // Windows.UI.Composition.IVisualUnorderedCollection
  IVisualUnorderedCollection = interface;
  PIVisualUnorderedCollection = ^IVisualUnorderedCollection;

  // Windows.UI.Composition.ICompositionLight
  ICompositionLight = interface;
  PICompositionLight = ^ICompositionLight;

  // Windows.UI.Composition.Effects.ISceneLightingEffect
  Effects_ISceneLightingEffect = interface;
  PEffects_ISceneLightingEffect = ^Effects_ISceneLightingEffect;

  // Windows.UI.Composition.Effects.ISceneLightingEffect2
  Effects_ISceneLightingEffect2 = interface;
  PEffects_ISceneLightingEffect2 = ^Effects_ISceneLightingEffect2;

  // Windows.UI.Composition.Interactions.ICompositionConditionalValue
  Interactions_ICompositionConditionalValue = interface;
  PInteractions_ICompositionConditionalValue = ^Interactions_ICompositionConditionalValue;

  // Windows.UI.Composition.Interactions.ICompositionConditionalValueStatics
  Interactions_ICompositionConditionalValueStatics = interface;
  PInteractions_ICompositionConditionalValueStatics = ^Interactions_ICompositionConditionalValueStatics;

  // Windows.UI.Composition.Interactions.ICompositionInteractionSource
  Interactions_ICompositionInteractionSource = interface;
  PInteractions_ICompositionInteractionSource = ^Interactions_ICompositionInteractionSource;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.Interactions.ICompositionInteractionSource>
  IIterator_1__Interactions_ICompositionInteractionSource = interface;
  PIIterator_1__Interactions_ICompositionInteractionSource = ^IIterator_1__Interactions_ICompositionInteractionSource;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.Interactions.ICompositionInteractionSource>
  IIterable_1__Interactions_ICompositionInteractionSource = interface;
  PIIterable_1__Interactions_ICompositionInteractionSource = ^IIterable_1__Interactions_ICompositionInteractionSource;

  // Windows.UI.Composition.Interactions.ICompositionInteractionSourceCollection
  Interactions_ICompositionInteractionSourceCollection = interface;
  PInteractions_ICompositionInteractionSourceCollection = ^Interactions_ICompositionInteractionSourceCollection;

  // Windows.UI.Composition.Interactions.IInteractionTrackerCustomAnimationStateEnteredArgs
  Interactions_IInteractionTrackerCustomAnimationStateEnteredArgs = interface;
  PInteractions_IInteractionTrackerCustomAnimationStateEnteredArgs = ^Interactions_IInteractionTrackerCustomAnimationStateEnteredArgs;

  // Windows.UI.Composition.Interactions.IInteractionTrackerIdleStateEnteredArgs
  Interactions_IInteractionTrackerIdleStateEnteredArgs = interface;
  PInteractions_IInteractionTrackerIdleStateEnteredArgs = ^Interactions_IInteractionTrackerIdleStateEnteredArgs;

  // Windows.UI.Composition.Interactions.IInteractionTrackerInertiaStateEnteredArgs
  Interactions_IInteractionTrackerInertiaStateEnteredArgs = interface;
  PInteractions_IInteractionTrackerInertiaStateEnteredArgs = ^Interactions_IInteractionTrackerInertiaStateEnteredArgs;

  // Windows.UI.Composition.Interactions.IInteractionTrackerInteractingStateEnteredArgs
  Interactions_IInteractionTrackerInteractingStateEnteredArgs = interface;
  PInteractions_IInteractionTrackerInteractingStateEnteredArgs = ^Interactions_IInteractionTrackerInteractingStateEnteredArgs;

  // Windows.UI.Composition.Interactions.IInteractionTrackerRequestIgnoredArgs
  Interactions_IInteractionTrackerRequestIgnoredArgs = interface;
  PInteractions_IInteractionTrackerRequestIgnoredArgs = ^Interactions_IInteractionTrackerRequestIgnoredArgs;

  // Windows.UI.Composition.Interactions.IInteractionTrackerValuesChangedArgs
  Interactions_IInteractionTrackerValuesChangedArgs = interface;
  PInteractions_IInteractionTrackerValuesChangedArgs = ^Interactions_IInteractionTrackerValuesChangedArgs;

  // Windows.UI.Composition.Interactions.IInteractionTrackerOwner
  Interactions_IInteractionTrackerOwner = interface;
  PInteractions_IInteractionTrackerOwner = ^Interactions_IInteractionTrackerOwner;

  // Windows.UI.Composition.Interactions.IInteractionTrackerInertiaModifier
  Interactions_IInteractionTrackerInertiaModifier = interface;
  PInteractions_IInteractionTrackerInertiaModifier = ^Interactions_IInteractionTrackerInertiaModifier;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.Interactions.IInteractionTrackerInertiaModifier>
  IIterator_1__Interactions_IInteractionTrackerInertiaModifier = interface;
  PIIterator_1__Interactions_IInteractionTrackerInertiaModifier = ^IIterator_1__Interactions_IInteractionTrackerInertiaModifier;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.Interactions.IInteractionTrackerInertiaModifier>
  IIterable_1__Interactions_IInteractionTrackerInertiaModifier = interface;
  PIIterable_1__Interactions_IInteractionTrackerInertiaModifier = ^IIterable_1__Interactions_IInteractionTrackerInertiaModifier;

  // Windows.UI.Composition.ICompositionObject
  ICompositionObject = interface;
  PICompositionObject = ^ICompositionObject;

  // Windows.UI.Composition.ICompositionAnimation
  ICompositionAnimation = interface;
  PICompositionAnimation = ^ICompositionAnimation;

  // Windows.UI.Composition.Interactions.IInteractionTracker
  Interactions_IInteractionTracker = interface;
  PInteractions_IInteractionTracker = ^Interactions_IInteractionTracker;

  // Windows.UI.Composition.Interactions.IInteractionTrackerStatics
  Interactions_IInteractionTrackerStatics = interface;
  PInteractions_IInteractionTrackerStatics = ^Interactions_IInteractionTrackerStatics;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.Interactions.ICompositionConditionalValue>
  IIterator_1__Interactions_ICompositionConditionalValue = interface;
  PIIterator_1__Interactions_ICompositionConditionalValue = ^IIterator_1__Interactions_ICompositionConditionalValue;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.Interactions.ICompositionConditionalValue>
  IIterable_1__Interactions_ICompositionConditionalValue = interface;
  PIIterable_1__Interactions_ICompositionConditionalValue = ^IIterable_1__Interactions_ICompositionConditionalValue;

  // Windows.UI.Composition.Interactions.IInteractionTracker2
  Interactions_IInteractionTracker2 = interface;
  PInteractions_IInteractionTracker2 = ^Interactions_IInteractionTracker2;

  // Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaModifier
  Interactions_IInteractionTrackerVector2InertiaModifier = interface;
  PInteractions_IInteractionTrackerVector2InertiaModifier = ^Interactions_IInteractionTrackerVector2InertiaModifier;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaModifier>
  IIterator_1__Interactions_IInteractionTrackerVector2InertiaModifier = interface;
  PIIterator_1__Interactions_IInteractionTrackerVector2InertiaModifier = ^IIterator_1__Interactions_IInteractionTrackerVector2InertiaModifier;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaModifier>
  IIterable_1__Interactions_IInteractionTrackerVector2InertiaModifier = interface;
  PIIterable_1__Interactions_IInteractionTrackerVector2InertiaModifier = ^IIterable_1__Interactions_IInteractionTrackerVector2InertiaModifier;

  // Windows.UI.Composition.Interactions.IInteractionTracker3
  Interactions_IInteractionTracker3 = interface;
  PInteractions_IInteractionTracker3 = ^Interactions_IInteractionTracker3;

  // Windows.UI.Composition.IScalarNaturalMotionAnimation
  IScalarNaturalMotionAnimation = interface;
  PIScalarNaturalMotionAnimation = ^IScalarNaturalMotionAnimation;

  // Windows.UI.Composition.Interactions.IInteractionTrackerInertiaNaturalMotion
  Interactions_IInteractionTrackerInertiaNaturalMotion = interface;
  PInteractions_IInteractionTrackerInertiaNaturalMotion = ^Interactions_IInteractionTrackerInertiaNaturalMotion;

  // Windows.UI.Composition.Interactions.IInteractionTrackerInertiaNaturalMotionStatics
  Interactions_IInteractionTrackerInertiaNaturalMotionStatics = interface;
  PInteractions_IInteractionTrackerInertiaNaturalMotionStatics = ^Interactions_IInteractionTrackerInertiaNaturalMotionStatics;

  // Windows.UI.Composition.Interactions.IInteractionTrackerInertiaRestingValue
  Interactions_IInteractionTrackerInertiaRestingValue = interface;
  PInteractions_IInteractionTrackerInertiaRestingValue = ^Interactions_IInteractionTrackerInertiaRestingValue;

  // Windows.UI.Composition.Interactions.IInteractionTrackerInertiaRestingValueStatics
  Interactions_IInteractionTrackerInertiaRestingValueStatics = interface;
  PInteractions_IInteractionTrackerInertiaRestingValueStatics = ^Interactions_IInteractionTrackerInertiaRestingValueStatics;

  // Windows.UI.Composition.Interactions.IInteractionTrackerInertiaMotion
  Interactions_IInteractionTrackerInertiaMotion = interface;
  PInteractions_IInteractionTrackerInertiaMotion = ^Interactions_IInteractionTrackerInertiaMotion;

  // Windows.UI.Composition.Interactions.IInteractionTrackerInertiaMotionStatics
  Interactions_IInteractionTrackerInertiaMotionStatics = interface;
  PInteractions_IInteractionTrackerInertiaMotionStatics = ^Interactions_IInteractionTrackerInertiaMotionStatics;

  // Windows.UI.Composition.Interactions.IVisualInteractionSource
  Interactions_IVisualInteractionSource = interface;
  PInteractions_IVisualInteractionSource = ^Interactions_IVisualInteractionSource;

  // Windows.UI.Composition.Interactions.IVisualInteractionSourceStatics
  Interactions_IVisualInteractionSourceStatics = interface;
  PInteractions_IVisualInteractionSourceStatics = ^Interactions_IVisualInteractionSourceStatics;

  // Windows.UI.Composition.Interactions.IVisualInteractionSource2
  Interactions_IVisualInteractionSource2 = interface;
  PInteractions_IVisualInteractionSource2 = ^Interactions_IVisualInteractionSource2;

  // Windows.UI.Composition.Interactions.IInteractionTrackerInertiaModifierFactory
  Interactions_IInteractionTrackerInertiaModifierFactory = interface;
  PInteractions_IInteractionTrackerInertiaModifierFactory = ^Interactions_IInteractionTrackerInertiaModifierFactory;

  // Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaModifierFactory
  Interactions_IInteractionTrackerVector2InertiaModifierFactory = interface;
  PInteractions_IInteractionTrackerVector2InertiaModifierFactory = ^Interactions_IInteractionTrackerVector2InertiaModifierFactory;

  // Windows.UI.Composition.IVector2NaturalMotionAnimation
  IVector2NaturalMotionAnimation = interface;
  PIVector2NaturalMotionAnimation = ^IVector2NaturalMotionAnimation;

  // Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaNaturalMotion
  Interactions_IInteractionTrackerVector2InertiaNaturalMotion = interface;
  PInteractions_IInteractionTrackerVector2InertiaNaturalMotion = ^Interactions_IInteractionTrackerVector2InertiaNaturalMotion;

  // Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaNaturalMotionStatics
  Interactions_IInteractionTrackerVector2InertiaNaturalMotionStatics = interface;
  PInteractions_IInteractionTrackerVector2InertiaNaturalMotionStatics = ^Interactions_IInteractionTrackerVector2InertiaNaturalMotionStatics;

  // Windows.UI.Composition.Interactions.IVisualInteractionSourceObjectFactory
  Interactions_IVisualInteractionSourceObjectFactory = interface;
  PInteractions_IVisualInteractionSourceObjectFactory = ^Interactions_IVisualInteractionSourceObjectFactory;

  // Windows.UI.Composition.IAmbientLight
  IAmbientLight = interface;
  PIAmbientLight = ^IAmbientLight;

  // Windows.UI.Composition.IAmbientLight2
  IAmbientLight2 = interface;
  PIAmbientLight2 = ^IAmbientLight2;

  // Windows.UI.Composition.ICompositionAnimation2
  ICompositionAnimation2 = interface;
  PICompositionAnimation2 = ^ICompositionAnimation2;

  // Windows.UI.Composition.ICompositionAnimation3
  ICompositionAnimation3 = interface;
  PICompositionAnimation3 = ^ICompositionAnimation3;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.ICompositionAnimation>
  IIterator_1__ICompositionAnimation = interface;
  PIIterator_1__ICompositionAnimation = ^IIterator_1__ICompositionAnimation;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.ICompositionAnimation>
  IIterable_1__ICompositionAnimation = interface;
  PIIterable_1__ICompositionAnimation = ^IIterable_1__ICompositionAnimation;

  // Windows.UI.Composition.ICompositionAnimationGroup
  ICompositionAnimationGroup = interface;
  PICompositionAnimationGroup = ^ICompositionAnimationGroup;

  // Windows.UI.Composition.ICompositionBackdropBrush
  ICompositionBackdropBrush = interface;
  PICompositionBackdropBrush = ^ICompositionBackdropBrush;

  // Windows.UI.Composition.ICompositionCapabilitiesStatics
  ICompositionCapabilitiesStatics = interface;
  PICompositionCapabilitiesStatics = ^ICompositionCapabilitiesStatics;

  // Windows.UI.Composition.ICompositionClip2
  ICompositionClip2 = interface;
  PICompositionClip2 = ^ICompositionClip2;

  // Windows.UI.Composition.ICompositionColorGradientStop
  ICompositionColorGradientStop = interface;
  PICompositionColorGradientStop = ^ICompositionColorGradientStop;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.ICompositionColorGradientStop>
  IIterator_1__ICompositionColorGradientStop = interface;
  PIIterator_1__ICompositionColorGradientStop = ^IIterator_1__ICompositionColorGradientStop;

  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Composition.ICompositionColorGradientStop>
  IVectorView_1__ICompositionColorGradientStop = interface;
  PIVectorView_1__ICompositionColorGradientStop = ^IVectorView_1__ICompositionColorGradientStop;

  // Windows.UI.Composition.ICompositionDrawingSurface
  ICompositionDrawingSurface = interface;
  PICompositionDrawingSurface = ^ICompositionDrawingSurface;

  // Windows.UI.Composition.ICompositionDrawingSurface2
  ICompositionDrawingSurface2 = interface;
  PICompositionDrawingSurface2 = ^ICompositionDrawingSurface2;

  // Windows.UI.Composition.ICompositionEffectSourceParameter
  ICompositionEffectSourceParameter = interface;
  PICompositionEffectSourceParameter = ^ICompositionEffectSourceParameter;

  // Windows.UI.Composition.ICompositionEffectSourceParameterFactory
  ICompositionEffectSourceParameterFactory = interface;
  PICompositionEffectSourceParameterFactory = ^ICompositionEffectSourceParameterFactory;

  // Windows.UI.Composition.IRenderingDeviceReplacedEventArgs
  IRenderingDeviceReplacedEventArgs = interface;
  PIRenderingDeviceReplacedEventArgs = ^IRenderingDeviceReplacedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Composition.ICompositionGraphicsDevice,Windows.UI.Composition.IRenderingDeviceReplacedEventArgs>
  TypedEventHandler_2__ICompositionGraphicsDevice__IRenderingDeviceReplacedEventArgs = interface;
  PTypedEventHandler_2__ICompositionGraphicsDevice__IRenderingDeviceReplacedEventArgs = ^TypedEventHandler_2__ICompositionGraphicsDevice__IRenderingDeviceReplacedEventArgs;

  // Windows.UI.Composition.ICompositionGraphicsDevice
  ICompositionGraphicsDevice = interface;
  PICompositionGraphicsDevice = ^ICompositionGraphicsDevice;

  // Windows.UI.Composition.ICompositionVirtualDrawingSurface
  ICompositionVirtualDrawingSurface = interface;
  PICompositionVirtualDrawingSurface = ^ICompositionVirtualDrawingSurface;

  // Windows.UI.Composition.ICompositionGraphicsDevice2
  ICompositionGraphicsDevice2 = interface;
  PICompositionGraphicsDevice2 = ^ICompositionGraphicsDevice2;

  // Windows.UI.Composition.ICompositionLight2
  ICompositionLight2 = interface;
  PICompositionLight2 = ^ICompositionLight2;

  // Windows.UI.Composition.ICompositionLinearGradientBrush
  ICompositionLinearGradientBrush = interface;
  PICompositionLinearGradientBrush = ^ICompositionLinearGradientBrush;

  // Windows.UI.Composition.ICompositionMaskBrush
  ICompositionMaskBrush = interface;
  PICompositionMaskBrush = ^ICompositionMaskBrush;

  // Windows.UI.Composition.ICompositionNineGridBrush
  ICompositionNineGridBrush = interface;
  PICompositionNineGridBrush = ^ICompositionNineGridBrush;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.UI.Composition.ICompositionAnimationBase>
  IKeyValuePair_2__HSTRING__ICompositionAnimationBase = interface;
  PIKeyValuePair_2__HSTRING__ICompositionAnimationBase = ^IKeyValuePair_2__HSTRING__ICompositionAnimationBase;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.UI.Composition.ICompositionAnimationBase>>
  IIterator_1__IKeyValuePair_2__HSTRING__ICompositionAnimationBase = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__ICompositionAnimationBase = ^IIterator_1__IKeyValuePair_2__HSTRING__ICompositionAnimationBase;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.UI.Composition.ICompositionAnimationBase>>
  IIterable_1__IKeyValuePair_2__HSTRING__ICompositionAnimationBase = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__ICompositionAnimationBase = ^IIterable_1__IKeyValuePair_2__HSTRING__ICompositionAnimationBase;

  // Windows.Foundation.Collections.IMapView`2<String,Windows.UI.Composition.ICompositionAnimationBase>
  IMapView_2__HSTRING__ICompositionAnimationBase = interface;
  PIMapView_2__HSTRING__ICompositionAnimationBase = ^IMapView_2__HSTRING__ICompositionAnimationBase;

  // Windows.Foundation.Collections.IMap`2<String,Windows.UI.Composition.ICompositionAnimationBase>
  IMap_2__HSTRING__ICompositionAnimationBase = interface;
  PIMap_2__HSTRING__ICompositionAnimationBase = ^IMap_2__HSTRING__ICompositionAnimationBase;

  // Windows.UI.Composition.IImplicitAnimationCollection
  IImplicitAnimationCollection = interface;
  PIImplicitAnimationCollection = ^IImplicitAnimationCollection;

  // Windows.UI.Composition.ICompositionObject2
  ICompositionObject2 = interface;
  PICompositionObject2 = ^ICompositionObject2;

  // Windows.UI.Composition.ICompositionObject3
  ICompositionObject3 = interface;
  PICompositionObject3 = ^ICompositionObject3;

  // Windows.UI.Composition.ICompositionPropertySet2
  ICompositionPropertySet2 = interface;
  PICompositionPropertySet2 = ^ICompositionPropertySet2;

  // Windows.UI.Composition.ICompositionShadow
  ICompositionShadow = interface;
  PICompositionShadow = ^ICompositionShadow;

  // Windows.UI.Composition.ICompositionSurfaceBrush2
  ICompositionSurfaceBrush2 = interface;
  PICompositionSurfaceBrush2 = ^ICompositionSurfaceBrush2;

  // Windows.UI.Composition.IDistantLight
  IDistantLight = interface;
  PIDistantLight = ^IDistantLight;

  // Windows.UI.Composition.IDropShadow
  IDropShadow = interface;
  PIDropShadow = ^IDropShadow;

  // Windows.UI.Composition.ILayerVisual
  ILayerVisual = interface;
  PILayerVisual = ^ILayerVisual;

  // Windows.UI.Composition.IPointLight
  IPointLight = interface;
  PIPointLight = ^IPointLight;

  // Windows.UI.Composition.ISpotLight
  ISpotLight = interface;
  PISpotLight = ^ISpotLight;

  // Windows.UI.Composition.IStepEasingFunction
  IStepEasingFunction = interface;
  PIStepEasingFunction = ^IStepEasingFunction;

  // Windows.UI.Composition.ICompositor2
  ICompositor2 = interface;
  PICompositor2 = ^ICompositor2;

  // Windows.UI.Composition.ICompositor3
  ICompositor3 = interface;
  PICompositor3 = ^ICompositor3;

  // Windows.UI.Composition.ISpringScalarNaturalMotionAnimation
  ISpringScalarNaturalMotionAnimation = interface;
  PISpringScalarNaturalMotionAnimation = ^ISpringScalarNaturalMotionAnimation;

  // Windows.UI.Composition.ISpringVector2NaturalMotionAnimation
  ISpringVector2NaturalMotionAnimation = interface;
  PISpringVector2NaturalMotionAnimation = ^ISpringVector2NaturalMotionAnimation;

  // Windows.UI.Composition.ISpringVector3NaturalMotionAnimation
  ISpringVector3NaturalMotionAnimation = interface;
  PISpringVector3NaturalMotionAnimation = ^ISpringVector3NaturalMotionAnimation;

  // Windows.UI.Composition.ICompositor4
  ICompositor4 = interface;
  PICompositor4 = ^ICompositor4;

  // Windows.UI.Composition.IDistantLight2
  IDistantLight2 = interface;
  PIDistantLight2 = ^IDistantLight2;

  // Windows.UI.Composition.IDropShadow2
  IDropShadow2 = interface;
  PIDropShadow2 = ^IDropShadow2;

  // Windows.UI.Composition.IKeyFrameAnimation
  IKeyFrameAnimation = interface;
  PIKeyFrameAnimation = ^IKeyFrameAnimation;

  // Windows.UI.Composition.IKeyFrameAnimation2
  IKeyFrameAnimation2 = interface;
  PIKeyFrameAnimation2 = ^IKeyFrameAnimation2;

  // Windows.UI.Composition.IKeyFrameAnimation3
  IKeyFrameAnimation3 = interface;
  PIKeyFrameAnimation3 = ^IKeyFrameAnimation3;

  // Windows.UI.Composition.ILayerVisual2
  ILayerVisual2 = interface;
  PILayerVisual2 = ^ILayerVisual2;

  // Windows.UI.Composition.INaturalMotionAnimation
  INaturalMotionAnimation = interface;
  PINaturalMotionAnimation = ^INaturalMotionAnimation;

  // Windows.UI.Composition.IPointLight2
  IPointLight2 = interface;
  PIPointLight2 = ^IPointLight2;

  // Windows.UI.Composition.ISpotLight2
  ISpotLight2 = interface;
  PISpotLight2 = ^ISpotLight2;

  // Windows.UI.Composition.ISpriteVisual2
  ISpriteVisual2 = interface;
  PISpriteVisual2 = ^ISpriteVisual2;

  // Windows.UI.Composition.IVector3NaturalMotionAnimation
  IVector3NaturalMotionAnimation = interface;
  PIVector3NaturalMotionAnimation = ^IVector3NaturalMotionAnimation;

  // Windows.UI.Composition.IVisual2
  IVisual2 = interface;
  PIVisual2 = ^IVisual2;

  // Windows.UI.Composition.ICompositionAnimationFactory
  ICompositionAnimationFactory = interface;
  PICompositionAnimationFactory = ^ICompositionAnimationFactory;

  // Windows.UI.Composition.ICompositionBrushFactory
  ICompositionBrushFactory = interface;
  PICompositionBrushFactory = ^ICompositionBrushFactory;

  // Windows.UI.Composition.ICompositionClipFactory
  ICompositionClipFactory = interface;
  PICompositionClipFactory = ^ICompositionClipFactory;

  // Windows.UI.Composition.ICompositionGradientBrushFactory
  ICompositionGradientBrushFactory = interface;
  PICompositionGradientBrushFactory = ^ICompositionGradientBrushFactory;

  // Windows.UI.Composition.ICompositionDrawingSurfaceFactory
  ICompositionDrawingSurfaceFactory = interface;
  PICompositionDrawingSurfaceFactory = ^ICompositionDrawingSurfaceFactory;

  // Windows.UI.Composition.ICompositionEasingFunctionFactory
  ICompositionEasingFunctionFactory = interface;
  PICompositionEasingFunctionFactory = ^ICompositionEasingFunctionFactory;

  // Windows.UI.Composition.ICompositionLightFactory
  ICompositionLightFactory = interface;
  PICompositionLightFactory = ^ICompositionLightFactory;

  // Windows.UI.Composition.ICompositionObjectFactory
  ICompositionObjectFactory = interface;
  PICompositionObjectFactory = ^ICompositionObjectFactory;

  // Windows.UI.Composition.ICompositionShadowFactory
  ICompositionShadowFactory = interface;
  PICompositionShadowFactory = ^ICompositionShadowFactory;

  // Windows.UI.Composition.ICompositionTargetFactory
  ICompositionTargetFactory = interface;
  PICompositionTargetFactory = ^ICompositionTargetFactory;

  // Windows.UI.Composition.ICompositionVirtualDrawingSurfaceFactory
  ICompositionVirtualDrawingSurfaceFactory = interface;
  PICompositionVirtualDrawingSurfaceFactory = ^ICompositionVirtualDrawingSurfaceFactory;

  // Windows.UI.Composition.IContainerVisualFactory
  IContainerVisualFactory = interface;
  PIContainerVisualFactory = ^IContainerVisualFactory;

  // Windows.UI.Composition.IKeyFrameAnimationFactory
  IKeyFrameAnimationFactory = interface;
  PIKeyFrameAnimationFactory = ^IKeyFrameAnimationFactory;

  // Windows.UI.Composition.INaturalMotionAnimationFactory
  INaturalMotionAnimationFactory = interface;
  PINaturalMotionAnimationFactory = ^INaturalMotionAnimationFactory;

  // Windows.UI.Composition.IScalarNaturalMotionAnimationFactory
  IScalarNaturalMotionAnimationFactory = interface;
  PIScalarNaturalMotionAnimationFactory = ^IScalarNaturalMotionAnimationFactory;

  // Windows.UI.Composition.IVector2NaturalMotionAnimationFactory
  IVector2NaturalMotionAnimationFactory = interface;
  PIVector2NaturalMotionAnimationFactory = ^IVector2NaturalMotionAnimationFactory;

  // Windows.UI.Composition.IVector3NaturalMotionAnimationFactory
  IVector3NaturalMotionAnimationFactory = interface;
  PIVector3NaturalMotionAnimationFactory = ^IVector3NaturalMotionAnimationFactory;

  // Windows.UI.Composition.IVisualFactory
  IVisualFactory = interface;
  PIVisualFactory = ^IVisualFactory;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.UI.Composition Interfaces
  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.UI.Composition.ICompositionSurface
  ICompositionSurface = interface(IInspectable)
  ['{1527540D-42C7-47A6-A408-668F79A90DFB}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.UI.Composition.ICompositionEasingFunction
  [WinRTClassNameAttribute(SCompositionEasingFunction)]
  ICompositionEasingFunction = interface(IInspectable)
  ['{5145E356-BF79-4EA8-8CC2-6B5B472E6C9A}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.CompositionColorSpace
  // Used Types:  Single
  // Used Types:  Windows.UI.Color
  // Used Types:  Windows.UI.Composition.ICompositionEasingFunction
  }
  // Windows.UI.Composition.IColorKeyFrameAnimation
  [WinRTClassNameAttribute(SColorKeyFrameAnimation)]
  IColorKeyFrameAnimation = interface(IInspectable)
  ['{93ADB5E9-8E05-4593-84A3-DCA152781E56}']
    function get_InterpolationColorSpace: CompositionColorSpace; safecall;
    procedure put_InterpolationColorSpace(value: CompositionColorSpace); safecall;
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Color); overload; safecall;
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Color; easingFunction: ICompositionEasingFunction); overload; safecall;
    property InterpolationColorSpace: CompositionColorSpace read get_InterpolationColorSpace write put_InterpolationColorSpace;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Color
  }
  // Windows.UI.Composition.ICompositionColorBrush
  [WinRTClassNameAttribute(SCompositionColorBrush)]
  ICompositionColorBrush = interface(IInspectable)
  ['{2B264C5E-BF35-4831-8642-CF70C20FFF2F}']
    function get_Color: Color; safecall;
    procedure put_Color(value: Color); safecall;
    property Color: Color read get_Color write put_Color;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.UI.Composition.ICompositionClip
  [WinRTClassNameAttribute(SCompositionClip)]
  ICompositionClip = interface(IInspectable)
  ['{1CCD2A52-CFC7-4ACE-9983-146BB8EB6A3C}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Numerics.Vector2
  // Used Types:  Windows.UI.Composition.CompositionBackfaceVisibility
  // Used Types:  Windows.UI.Composition.CompositionBorderMode
  // Used Types:  Windows.Foundation.Numerics.Vector3
  // Used Types:  Windows.UI.Composition.ICompositionClip
  // Used Types:  Windows.UI.Composition.CompositionCompositeMode
  // Used Types:  Boolean
  // Used Types:  Single
  // Used Types:  Windows.Foundation.Numerics.Quaternion
  // Used Types:  Windows.UI.Composition.IContainerVisual
  // Used Types:  Windows.Foundation.Numerics.Matrix4x4
  }
  // Windows.UI.Composition.IVisual
  [WinRTClassNameAttribute(SVisual)]
  IVisual = interface(IInspectable)
  ['{117E202D-A859-4C89-873B-C2AA566788E3}']
    function get_AnchorPoint: Numerics_Vector2; safecall;
    procedure put_AnchorPoint(value: Numerics_Vector2); safecall;
    function get_BackfaceVisibility: CompositionBackfaceVisibility; safecall;
    procedure put_BackfaceVisibility(value: CompositionBackfaceVisibility); safecall;
    function get_BorderMode: CompositionBorderMode; safecall;
    procedure put_BorderMode(value: CompositionBorderMode); safecall;
    function get_CenterPoint: Numerics_Vector3; safecall;
    procedure put_CenterPoint(value: Numerics_Vector3); safecall;
    function get_Clip: ICompositionClip; safecall;
    procedure put_Clip(value: ICompositionClip); safecall;
    function get_CompositeMode: CompositionCompositeMode; safecall;
    procedure put_CompositeMode(value: CompositionCompositeMode); safecall;
    function get_IsVisible: Boolean; safecall;
    procedure put_IsVisible(value: Boolean); safecall;
    function get_Offset: Numerics_Vector3; safecall;
    procedure put_Offset(value: Numerics_Vector3); safecall;
    function get_Opacity: Single; safecall;
    procedure put_Opacity(value: Single); safecall;
    function get_Orientation: Numerics_Quaternion; safecall;
    procedure put_Orientation(value: Numerics_Quaternion); safecall;
    function get_Parent: IContainerVisual; safecall;
    function get_RotationAngle: Single; safecall;
    procedure put_RotationAngle(value: Single); safecall;
    function get_RotationAngleInDegrees: Single; safecall;
    procedure put_RotationAngleInDegrees(value: Single); safecall;
    function get_RotationAxis: Numerics_Vector3; safecall;
    procedure put_RotationAxis(value: Numerics_Vector3); safecall;
    function get_Scale: Numerics_Vector3; safecall;
    procedure put_Scale(value: Numerics_Vector3); safecall;
    function get_Size: Numerics_Vector2; safecall;
    procedure put_Size(value: Numerics_Vector2); safecall;
    function get_TransformMatrix: Numerics_Matrix4x4; safecall;
    procedure put_TransformMatrix(value: Numerics_Matrix4x4); safecall;
    property AnchorPoint: Numerics_Vector2 read get_AnchorPoint write put_AnchorPoint;
    property BackfaceVisibility: CompositionBackfaceVisibility read get_BackfaceVisibility write put_BackfaceVisibility;
    property BorderMode: CompositionBorderMode read get_BorderMode write put_BorderMode;
    property CenterPoint: Numerics_Vector3 read get_CenterPoint write put_CenterPoint;
    property Clip: ICompositionClip read get_Clip write put_Clip;
    property CompositeMode: CompositionCompositeMode read get_CompositeMode write put_CompositeMode;
    property IsVisible: Boolean read get_IsVisible write put_IsVisible;
    property Offset: Numerics_Vector3 read get_Offset write put_Offset;
    property Opacity: Single read get_Opacity write put_Opacity;
    property Orientation: Numerics_Quaternion read get_Orientation write put_Orientation;
    property Parent: IContainerVisual read get_Parent;
    property RotationAngle: Single read get_RotationAngle write put_RotationAngle;
    property RotationAngleInDegrees: Single read get_RotationAngleInDegrees write put_RotationAngleInDegrees;
    property RotationAxis: Numerics_Vector3 read get_RotationAxis write put_RotationAxis;
    property Scale: Numerics_Vector3 read get_Scale write put_Scale;
    property Size: Numerics_Vector2 read get_Size write put_Size;
    property TransformMatrix: Numerics_Matrix4x4 read get_TransformMatrix write put_TransformMatrix;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.IVisual>
  IIterator_1__IVisual_Base = interface(IInspectable)
  ['{ECA15496-DCAA-5095-A898-F8602A40E10A}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.IVisual
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.IVisual>
  IIterator_1__IVisual = interface(IIterator_1__IVisual_Base)
  ['{FF131014-C5A1-5346-812D-81A8BF384CBC}']
    function get_Current: IVisual; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIVisual): Cardinal; safecall;
    property Current: IVisual read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.IVisual>
  IIterable_1__IVisual_Base = interface(IInspectable)
  ['{4EED7DCE-E4AC-5891-9B52-799D70DF47FE}']
  end;
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.IVisual>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.IVisual>
  IIterable_1__IVisual = interface(IIterable_1__IVisual_Base)
  ['{C070CCBA-78C7-5F68-AE5E-7ACC52BF8B57}']
    function First: IIterator_1__IVisual; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Windows.UI.Composition.IVisual
  }
  // Windows.UI.Composition.IVisualCollection
  [WinRTClassNameAttribute(SVisualCollection)]
  IVisualCollection = interface(IInspectable)
  ['{8B745505-FD3E-4A98-84A8-E949468C6BCB}']
    function get_Count: Integer; safecall;
    procedure InsertAbove(newChild: IVisual; sibling: IVisual); safecall;
    procedure InsertAtBottom(newChild: IVisual); safecall;
    procedure InsertAtTop(newChild: IVisual); safecall;
    procedure InsertBelow(newChild: IVisual; sibling: IVisual); safecall;
    procedure Remove(child: IVisual); safecall;
    procedure RemoveAll; safecall;
    property Count: Integer read get_Count;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.IVisualCollection
  }
  // Windows.UI.Composition.IContainerVisual
  [WinRTClassNameAttribute(SContainerVisual)]
  IContainerVisual = interface(IInspectable)
  ['{02F6BC74-ED20-4773-AFE6-D49B4A93DB32}']
    function get_Children: IVisualCollection; safecall;
    property Children: IVisualCollection read get_Children;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Numerics.Vector2
  }
  // Windows.UI.Composition.ICubicBezierEasingFunction
  [WinRTClassNameAttribute(SCubicBezierEasingFunction)]
  ICubicBezierEasingFunction = interface(IInspectable)
  ['{32350666-C1E8-44F9-96B8-C98ACF0AE698}']
    function get_ControlPoint1: Numerics_Vector2; safecall;
    function get_ControlPoint2: Numerics_Vector2; safecall;
    property ControlPoint1: Numerics_Vector2 read get_ControlPoint1;
    property ControlPoint2: Numerics_Vector2 read get_ControlPoint2;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.UI.Composition.ICompositionBrush
  [WinRTClassNameAttribute(SCompositionBrush)]
  ICompositionBrush = interface(IInspectable)
  ['{AB0D7608-30C0-40E9-B568-B60A6BD1FB46}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.ICompositionBrush
  // Used Types:  String
  }
  // Windows.UI.Composition.ICompositionEffectBrush
  [WinRTClassNameAttribute(SCompositionEffectBrush)]
  ICompositionEffectBrush = interface(IInspectable)
  ['{BF7F795E-83CC-44BF-A447-3E3C071789EC}']
    function GetSourceParameter(name: HSTRING): ICompositionBrush; safecall;
    procedure SetSourceParameter(name: HSTRING; source: ICompositionBrush); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.ICompositionEffectBrush
  // Used Types:  Windows.Foundation.HResult
  // Used Types:  Windows.UI.Composition.CompositionEffectFactoryLoadStatus
  }
  // Windows.UI.Composition.ICompositionEffectFactory
  [WinRTClassNameAttribute(SCompositionEffectFactory)]
  ICompositionEffectFactory = interface(IInspectable)
  ['{BE5624AF-BA7E-4510-9850-41C0B4FF74DF}']
    function CreateBrush: ICompositionEffectBrush; safecall;
    function get_ExtendedError: HRESULT; safecall;
    function get_LoadStatus: CompositionEffectFactoryLoadStatus; safecall;
    property ExtendedError: HRESULT read get_ExtendedError;
    property LoadStatus: CompositionEffectFactoryLoadStatus read get_LoadStatus;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.UI.Composition.IExpressionAnimation
  [WinRTClassNameAttribute(SExpressionAnimation)]
  IExpressionAnimation = interface(IInspectable)
  ['{6ACC5431-7D3D-4BF3-ABB6-F44BDC4888C1}']
    function get_Expression: HSTRING; safecall;
    procedure put_Expression(value: HSTRING); safecall;
    property Expression: HSTRING read get_Expression write put_Expression;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Single
  }
  // Windows.UI.Composition.IInsetClip
  [WinRTClassNameAttribute(SInsetClip)]
  IInsetClip = interface(IInspectable)
  ['{1E73E647-84C7-477A-B474-5880E0442E15}']
    function get_BottomInset: Single; safecall;
    procedure put_BottomInset(value: Single); safecall;
    function get_LeftInset: Single; safecall;
    procedure put_LeftInset(value: Single); safecall;
    function get_RightInset: Single; safecall;
    procedure put_RightInset(value: Single); safecall;
    function get_TopInset: Single; safecall;
    procedure put_TopInset(value: Single); safecall;
    property BottomInset: Single read get_BottomInset write put_BottomInset;
    property LeftInset: Single read get_LeftInset write put_LeftInset;
    property RightInset: Single read get_RightInset write put_RightInset;
    property TopInset: Single read get_TopInset write put_TopInset;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.UI.Composition.ILinearEasingFunction
  [WinRTClassNameAttribute(SLinearEasingFunction)]
  ILinearEasingFunction = interface(IInspectable)
  ['{9400975A-C7A6-46B3-ACF7-1A268A0A117D}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.UI.Color
  // Used Types:  Windows.Foundation.Numerics.Matrix3x2
  // Used Types:  Windows.Foundation.Numerics.Matrix4x4
  // Used Types:  Windows.Foundation.Numerics.Quaternion
  // Used Types:  Single
  // Used Types:  Windows.Foundation.Numerics.Vector2
  // Used Types:  Windows.Foundation.Numerics.Vector3
  // Used Types:  Windows.Foundation.Numerics.Vector4
  // Used Types:  Windows.UI.Composition.CompositionGetValueStatus
  }
  // Windows.UI.Composition.ICompositionPropertySet
  [WinRTClassNameAttribute(SCompositionPropertySet)]
  ICompositionPropertySet = interface(IInspectable)
  ['{C9D6D202-5F67-4453-9117-9EADD430D3C2}']
    procedure InsertColor(propertyName: HSTRING; value: Color); safecall;
    procedure InsertMatrix3x2(propertyName: HSTRING; value: Numerics_Matrix3x2); safecall;
    procedure InsertMatrix4x4(propertyName: HSTRING; value: Numerics_Matrix4x4); safecall;
    procedure InsertQuaternion(propertyName: HSTRING; value: Numerics_Quaternion); safecall;
    procedure InsertScalar(propertyName: HSTRING; value: Single); safecall;
    procedure InsertVector2(propertyName: HSTRING; value: Numerics_Vector2); safecall;
    procedure InsertVector3(propertyName: HSTRING; value: Numerics_Vector3); safecall;
    procedure InsertVector4(propertyName: HSTRING; value: Numerics_Vector4); safecall;
    function TryGetColor(propertyName: HSTRING; out value: Color): CompositionGetValueStatus; safecall;
    function TryGetMatrix3x2(propertyName: HSTRING; out value: Numerics_Matrix3x2): CompositionGetValueStatus; safecall;
    function TryGetMatrix4x4(propertyName: HSTRING; out value: Numerics_Matrix4x4): CompositionGetValueStatus; safecall;
    function TryGetQuaternion(propertyName: HSTRING; out value: Numerics_Quaternion): CompositionGetValueStatus; safecall;
    function TryGetScalar(propertyName: HSTRING; out value: Single): CompositionGetValueStatus; safecall;
    function TryGetVector2(propertyName: HSTRING; out value: Numerics_Vector2): CompositionGetValueStatus; safecall;
    function TryGetVector3(propertyName: HSTRING; out value: Numerics_Vector3): CompositionGetValueStatus; safecall;
    function TryGetVector4(propertyName: HSTRING; out value: Numerics_Vector4): CompositionGetValueStatus; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Single
  // Used Types:  Windows.Foundation.Numerics.Quaternion
  // Used Types:  Windows.UI.Composition.ICompositionEasingFunction
  }
  // Windows.UI.Composition.IQuaternionKeyFrameAnimation
  [WinRTClassNameAttribute(SQuaternionKeyFrameAnimation)]
  IQuaternionKeyFrameAnimation = interface(IInspectable)
  ['{404E5835-ECF6-4240-8520-671279CF36BC}']
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Numerics_Quaternion); overload; safecall;
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Numerics_Quaternion; easingFunction: ICompositionEasingFunction); overload; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Single
  // Used Types:  Windows.UI.Composition.ICompositionEasingFunction
  }
  // Windows.UI.Composition.IScalarKeyFrameAnimation
  [WinRTClassNameAttribute(SScalarKeyFrameAnimation)]
  IScalarKeyFrameAnimation = interface(IInspectable)
  ['{AE288FA9-252C-4B95-A725-BF85E38000A1}']
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Single); overload; safecall;
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Single; easingFunction: ICompositionEasingFunction); overload; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.UI.Composition.ICompositionBatchCompletedEventArgs
  [WinRTClassNameAttribute(SCompositionBatchCompletedEventArgs)]
  ICompositionBatchCompletedEventArgs = interface(IInspectable)
  ['{0D00DAD0-9464-450A-A562-2E2698B0A812}']
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Composition.ICompositionBatchCompletedEventArgs>
  TypedEventHandler_2__IInspectable__ICompositionBatchCompletedEventArgs_Delegate_Base = interface(IUnknown)
  ['{9DF03456-3383-508B-9C75-EE840A7E1A39}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Object
  // Used Types:  Windows.UI.Composition.ICompositionBatchCompletedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Composition.ICompositionBatchCompletedEventArgs>
  TypedEventHandler_2__IInspectable__ICompositionBatchCompletedEventArgs = interface(TypedEventHandler_2__IInspectable__ICompositionBatchCompletedEventArgs_Delegate_Base)
  ['{7C8E0B74-2AC8-5AE5-98BE-5D8F40CF6B4E}']
    procedure Invoke(sender: IInspectable; args: ICompositionBatchCompletedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Composition.ICompositionBatchCompletedEventArgs>
  }
  // Windows.UI.Composition.ICompositionScopedBatch
  [WinRTClassNameAttribute(SCompositionScopedBatch)]
  ICompositionScopedBatch = interface(IInspectable)
  ['{0D00DAD0-FB07-46FD-8C72-6280D1A3D1DD}']
    function get_IsActive: Boolean; safecall;
    function get_IsEnded: Boolean; safecall;
    procedure &End; safecall;
    procedure Resume; safecall;
    procedure Suspend; safecall;
    function add_Completed(handler: TypedEventHandler_2__IInspectable__ICompositionBatchCompletedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Completed(token: EventRegistrationToken); safecall;
    property IsActive: Boolean read get_IsActive;
    property IsEnded: Boolean read get_IsEnded;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.ICompositionBrush
  }
  // Windows.UI.Composition.ISpriteVisual
  [WinRTClassNameAttribute(SSpriteVisual)]
  ISpriteVisual = interface(IInspectable)
  ['{08E05581-1AD1-4F97-9757-402D76E4233B}']
    function get_Brush: ICompositionBrush; safecall;
    procedure put_Brush(value: ICompositionBrush); safecall;
    property Brush: ICompositionBrush read get_Brush write put_Brush;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.CompositionBitmapInterpolationMode
  // Used Types:  Single
  // Used Types:  Windows.UI.Composition.CompositionStretch
  // Used Types:  Windows.UI.Composition.ICompositionSurface
  }
  // Windows.UI.Composition.ICompositionSurfaceBrush
  [WinRTClassNameAttribute(SCompositionSurfaceBrush)]
  ICompositionSurfaceBrush = interface(IInspectable)
  ['{AD016D79-1E4C-4C0D-9C29-83338C87C162}']
    function get_BitmapInterpolationMode: CompositionBitmapInterpolationMode; safecall;
    procedure put_BitmapInterpolationMode(value: CompositionBitmapInterpolationMode); safecall;
    function get_HorizontalAlignmentRatio: Single; safecall;
    procedure put_HorizontalAlignmentRatio(value: Single); safecall;
    function get_Stretch: CompositionStretch; safecall;
    procedure put_Stretch(value: CompositionStretch); safecall;
    function get_Surface: ICompositionSurface; safecall;
    procedure put_Surface(value: ICompositionSurface); safecall;
    function get_VerticalAlignmentRatio: Single; safecall;
    procedure put_VerticalAlignmentRatio(value: Single); safecall;
    property BitmapInterpolationMode: CompositionBitmapInterpolationMode read get_BitmapInterpolationMode write put_BitmapInterpolationMode;
    property HorizontalAlignmentRatio: Single read get_HorizontalAlignmentRatio write put_HorizontalAlignmentRatio;
    property Stretch: CompositionStretch read get_Stretch write put_Stretch;
    property Surface: ICompositionSurface read get_Surface write put_Surface;
    property VerticalAlignmentRatio: Single read get_VerticalAlignmentRatio write put_VerticalAlignmentRatio;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.IVisual
  }
  // Windows.UI.Composition.ICompositionTarget
  [WinRTClassNameAttribute(SCompositionTarget)]
  ICompositionTarget = interface(IInspectable)
  ['{A1BEA8BA-D726-4663-8129-6B5E7927FFA6}']
    function get_Root: IVisual; safecall;
    procedure put_Root(value: IVisual); safecall;
    property Root: IVisual read get_Root write put_Root;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Single
  // Used Types:  Windows.Foundation.Numerics.Vector2
  // Used Types:  Windows.UI.Composition.ICompositionEasingFunction
  }
  // Windows.UI.Composition.IVector2KeyFrameAnimation
  [WinRTClassNameAttribute(SVector2KeyFrameAnimation)]
  IVector2KeyFrameAnimation = interface(IInspectable)
  ['{DF414515-4E29-4F11-B55E-BF2A6EB36294}']
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Numerics_Vector2); overload; safecall;
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Numerics_Vector2; easingFunction: ICompositionEasingFunction); overload; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Single
  // Used Types:  Windows.Foundation.Numerics.Vector3
  // Used Types:  Windows.UI.Composition.ICompositionEasingFunction
  }
  // Windows.UI.Composition.IVector3KeyFrameAnimation
  [WinRTClassNameAttribute(SVector3KeyFrameAnimation)]
  IVector3KeyFrameAnimation = interface(IInspectable)
  ['{C8039DAA-A281-43C2-A73D-B68E3C533C40}']
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Numerics_Vector3); overload; safecall;
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Numerics_Vector3; easingFunction: ICompositionEasingFunction); overload; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Single
  // Used Types:  Windows.Foundation.Numerics.Vector4
  // Used Types:  Windows.UI.Composition.ICompositionEasingFunction
  }
  // Windows.UI.Composition.IVector4KeyFrameAnimation
  [WinRTClassNameAttribute(SVector4KeyFrameAnimation)]
  IVector4KeyFrameAnimation = interface(IInspectable)
  ['{2457945B-ADDD-4385-9606-B6A3D5E4E1B9}']
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Numerics_Vector4); overload; safecall;
    procedure InsertKeyFrame(normalizedProgressKey: Single; value: Numerics_Vector4; easingFunction: ICompositionEasingFunction); overload; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Object,Windows.UI.Composition.ICompositionBatchCompletedEventArgs>
  }
  // Windows.UI.Composition.ICompositionCommitBatch
  [WinRTClassNameAttribute(SCompositionCommitBatch)]
  ICompositionCommitBatch = interface(IInspectable)
  ['{0D00DAD0-CA07-4400-8C8E-CB5DB08559CC}']
    function get_IsActive: Boolean; safecall;
    function get_IsEnded: Boolean; safecall;
    function add_Completed(handler: TypedEventHandler_2__IInspectable__ICompositionBatchCompletedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Completed(token: EventRegistrationToken); safecall;
    property IsActive: Boolean read get_IsActive;
    property IsEnded: Boolean read get_IsEnded;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.IColorKeyFrameAnimation
  // Used Types:  Windows.UI.Composition.ICompositionColorBrush
  // Used Types:  Windows.UI.Color
  // Used Types:  Windows.UI.Composition.IContainerVisual
  // Used Types:  Windows.UI.Composition.ICubicBezierEasingFunction
  // Used Types:  Windows.Foundation.Numerics.Vector2
  // Used Types:  Windows.UI.Composition.ICompositionEffectFactory
  // Used Types:  Windows.Graphics.Effects.IGraphicsEffect
  // Used Types:  Windows.Foundation.Collections.IIterable`1<String>
  // Used Types:  Windows.UI.Composition.IExpressionAnimation
  // Used Types:  String
  // Used Types:  Windows.UI.Composition.IInsetClip
  // Used Types:  Single
  // Used Types:  Windows.UI.Composition.ILinearEasingFunction
  // Used Types:  Windows.UI.Composition.ICompositionPropertySet
  // Used Types:  Windows.UI.Composition.IQuaternionKeyFrameAnimation
  // Used Types:  Windows.UI.Composition.IScalarKeyFrameAnimation
  // Used Types:  Windows.UI.Composition.ICompositionScopedBatch
  // Used Types:  Windows.UI.Composition.CompositionBatchTypes
  // Used Types:  Windows.UI.Composition.ISpriteVisual
  // Used Types:  Windows.UI.Composition.ICompositionSurfaceBrush
  // Used Types:  Windows.UI.Composition.ICompositionSurface
  // Used Types:  Windows.UI.Composition.ICompositionTarget
  // Used Types:  Windows.UI.Composition.IVector2KeyFrameAnimation
  // Used Types:  Windows.UI.Composition.IVector3KeyFrameAnimation
  // Used Types:  Windows.UI.Composition.IVector4KeyFrameAnimation
  // Used Types:  Windows.UI.Composition.ICompositionCommitBatch
  }
  // Windows.UI.Composition.ICompositor
  [WinRTClassNameAttribute(SCompositor)]
  ICompositor = interface(IInspectable)
  ['{B403CA50-7F8C-4E83-985F-CC45060036D8}']
    function CreateColorKeyFrameAnimation: IColorKeyFrameAnimation; safecall;
    function CreateColorBrush: ICompositionColorBrush; overload; safecall;
    function CreateColorBrush(color: Color): ICompositionColorBrush; overload; safecall;
    function CreateContainerVisual: IContainerVisual; safecall;
    function CreateCubicBezierEasingFunction(controlPoint1: Numerics_Vector2; controlPoint2: Numerics_Vector2): ICubicBezierEasingFunction; safecall;
    function CreateEffectFactory(graphicsEffect: Effects_IGraphicsEffect): ICompositionEffectFactory; overload; safecall;
    function CreateEffectFactory(graphicsEffect: Effects_IGraphicsEffect; animatableProperties: IIterable_1__HSTRING): ICompositionEffectFactory; overload; safecall;
    function CreateExpressionAnimation: IExpressionAnimation; overload; safecall;
    function CreateExpressionAnimation(expression: HSTRING): IExpressionAnimation; overload; safecall;
    function CreateInsetClip: IInsetClip; overload; safecall;
    function CreateInsetClip(leftInset: Single; topInset: Single; rightInset: Single; bottomInset: Single): IInsetClip; overload; safecall;
    function CreateLinearEasingFunction: ILinearEasingFunction; safecall;
    function CreatePropertySet: ICompositionPropertySet; safecall;
    function CreateQuaternionKeyFrameAnimation: IQuaternionKeyFrameAnimation; safecall;
    function CreateScalarKeyFrameAnimation: IScalarKeyFrameAnimation; safecall;
    function CreateScopedBatch(batchType: CompositionBatchTypes): ICompositionScopedBatch; safecall;
    function CreateSpriteVisual: ISpriteVisual; safecall;
    function CreateSurfaceBrush: ICompositionSurfaceBrush; overload; safecall;
    function CreateSurfaceBrush(surface: ICompositionSurface): ICompositionSurfaceBrush; overload; safecall;
    function CreateTargetForCurrentView: ICompositionTarget; safecall;
    function CreateVector2KeyFrameAnimation: IVector2KeyFrameAnimation; safecall;
    function CreateVector3KeyFrameAnimation: IVector3KeyFrameAnimation; safecall;
    function CreateVector4KeyFrameAnimation: IVector4KeyFrameAnimation; safecall;
    function GetCommitBatch(batchType: CompositionBatchTypes): ICompositionCommitBatch; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.UI.Composition.ICompositionAnimationBase
  ICompositionAnimationBase = interface(IInspectable)
  ['{1C2C2999-E818-48D3-A6DD-D78C82F8ACE9}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Windows.UI.Composition.IVisual
  }
  // Windows.UI.Composition.IVisualUnorderedCollection
  [WinRTClassNameAttribute(SVisualUnorderedCollection)]
  IVisualUnorderedCollection = interface(IInspectable)
  ['{338FAA70-54C8-40A7-8029-C9CEEB0AA250}']
    function get_Count: Integer; safecall;
    procedure Add(newVisual: IVisual); safecall;
    procedure Remove(visual: IVisual); safecall;
    procedure RemoveAll; safecall;
    property Count: Integer read get_Count;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.IVisualUnorderedCollection
  }
  // Windows.UI.Composition.ICompositionLight
  [WinRTClassNameAttribute(SCompositionLight)]
  ICompositionLight = interface(IInspectable)
  ['{41A6D7C2-2E5D-4BC1-B09E-8F0A03E3D8D3}']
    function get_Targets: IVisualUnorderedCollection; safecall;
    property Targets: IVisualUnorderedCollection read get_Targets;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Single
  // Used Types:  Windows.Graphics.Effects.IGraphicsEffectSource
  }
  // Windows.UI.Composition.Effects.ISceneLightingEffect
  [WinRTClassNameAttribute(SEffects_SceneLightingEffect)]
  Effects_ISceneLightingEffect = interface(IInspectable)
  ['{91BB5E52-95D1-4F8B-9A5A-6408B24B8C6A}']
    function get_AmbientAmount: Single; safecall;
    procedure put_AmbientAmount(value: Single); safecall;
    function get_DiffuseAmount: Single; safecall;
    procedure put_DiffuseAmount(value: Single); safecall;
    function get_NormalMapSource: Effects_IGraphicsEffectSource; safecall;
    procedure put_NormalMapSource(value: Effects_IGraphicsEffectSource); safecall;
    function get_SpecularAmount: Single; safecall;
    procedure put_SpecularAmount(value: Single); safecall;
    function get_SpecularShine: Single; safecall;
    procedure put_SpecularShine(value: Single); safecall;
    property AmbientAmount: Single read get_AmbientAmount write put_AmbientAmount;
    property DiffuseAmount: Single read get_DiffuseAmount write put_DiffuseAmount;
    property NormalMapSource: Effects_IGraphicsEffectSource read get_NormalMapSource write put_NormalMapSource;
    property SpecularAmount: Single read get_SpecularAmount write put_SpecularAmount;
    property SpecularShine: Single read get_SpecularShine write put_SpecularShine;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.Effects.SceneLightingEffectReflectanceModel
  }
  // Windows.UI.Composition.Effects.ISceneLightingEffect2
  Effects_ISceneLightingEffect2 = interface(IInspectable)
  ['{9E270E81-72F0-4C5C-95F8-8A6E0024F409}']
    function get_ReflectanceModel: Effects_SceneLightingEffectReflectanceModel; safecall;
    procedure put_ReflectanceModel(value: Effects_SceneLightingEffectReflectanceModel); safecall;
    property ReflectanceModel: Effects_SceneLightingEffectReflectanceModel read get_ReflectanceModel write put_ReflectanceModel;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.IExpressionAnimation
  }
  // Windows.UI.Composition.Interactions.ICompositionConditionalValue
  [WinRTClassNameAttribute(SInteractions_CompositionConditionalValue)]
  Interactions_ICompositionConditionalValue = interface(IInspectable)
  ['{43250538-EB73-4561-A71D-1A43EAEB7A9B}']
    function get_Condition: IExpressionAnimation; safecall;
    procedure put_Condition(value: IExpressionAnimation); safecall;
    function get_Value: IExpressionAnimation; safecall;
    procedure put_Value(value: IExpressionAnimation); safecall;
    property Condition: IExpressionAnimation read get_Condition write put_Condition;
    property Value: IExpressionAnimation read get_Value write put_Value;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.Interactions.ICompositionConditionalValue
  // Used Types:  Windows.UI.Composition.ICompositor
  }
  // Windows.UI.Composition.Interactions.ICompositionConditionalValueStatics
  [WinRTClassNameAttribute(SInteractions_CompositionConditionalValue)]
  Interactions_ICompositionConditionalValueStatics = interface(IInspectable)
  ['{090C4B72-8467-4D0A-9065-AC46B80A5522}']
    function Create(compositor: ICompositor): Interactions_ICompositionConditionalValue; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.UI.Composition.Interactions.ICompositionInteractionSource
  Interactions_ICompositionInteractionSource = interface(IInspectable)
  ['{043B2431-06E3-495A-BA54-409F0017FAC0}']
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.Interactions.ICompositionInteractionSource>
  IIterator_1__Interactions_ICompositionInteractionSource_Base = interface(IInspectable)
  ['{20259EF3-9F4B-5257-8581-6D3EABBBD690}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.Interactions.ICompositionInteractionSource
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.Interactions.ICompositionInteractionSource>
  IIterator_1__Interactions_ICompositionInteractionSource = interface(IIterator_1__Interactions_ICompositionInteractionSource_Base)
  ['{20259EF3-9F4B-5257-8581-6D3EABBBD690}']
    function get_Current: Interactions_ICompositionInteractionSource; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PInteractions_ICompositionInteractionSource): Cardinal; safecall;
    property Current: Interactions_ICompositionInteractionSource read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.Interactions.ICompositionInteractionSource>
  IIterable_1__Interactions_ICompositionInteractionSource_Base = interface(IInspectable)
  ['{17C50E21-CB70-5A2B-B797-A8DC01A99113}']
  end;
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.Interactions.ICompositionInteractionSource>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.Interactions.ICompositionInteractionSource>
  IIterable_1__Interactions_ICompositionInteractionSource = interface(IIterable_1__Interactions_ICompositionInteractionSource_Base)
  ['{17C50E21-CB70-5A2B-B797-A8DC01A99113}']
    function First: IIterator_1__Interactions_ICompositionInteractionSource; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Windows.UI.Composition.Interactions.ICompositionInteractionSource
  }
  // Windows.UI.Composition.Interactions.ICompositionInteractionSourceCollection
  [WinRTClassNameAttribute(SInteractions_CompositionInteractionSourceCollection)]
  Interactions_ICompositionInteractionSourceCollection = interface(IInspectable)
  ['{1B468E4B-A5BF-47D8-A547-3894155A158C}']
    function get_Count: Integer; safecall;
    procedure Add(value: Interactions_ICompositionInteractionSource); safecall;
    procedure Remove(value: Interactions_ICompositionInteractionSource); safecall;
    procedure RemoveAll; safecall;
    property Count: Integer read get_Count;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  }
  // Windows.UI.Composition.Interactions.IInteractionTrackerCustomAnimationStateEnteredArgs
  [WinRTClassNameAttribute(SInteractions_InteractionTrackerCustomAnimationStateEnteredArgs)]
  Interactions_IInteractionTrackerCustomAnimationStateEnteredArgs = interface(IInspectable)
  ['{8D1C8CF1-D7B0-434C-A5D2-2D7611864834}']
    function get_RequestId: Integer; safecall;
    property RequestId: Integer read get_RequestId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  }
  // Windows.UI.Composition.Interactions.IInteractionTrackerIdleStateEnteredArgs
  [WinRTClassNameAttribute(SInteractions_InteractionTrackerIdleStateEnteredArgs)]
  Interactions_IInteractionTrackerIdleStateEnteredArgs = interface(IInspectable)
  ['{50012FAA-1510-4142-A1A5-019B09F8857B}']
    function get_RequestId: Integer; safecall;
    property RequestId: Integer read get_RequestId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.Numerics.Vector3>
  // Used Types:  Windows.Foundation.IReference`1<Single>
  // Used Types:  Windows.Foundation.Numerics.Vector3
  // Used Types:  Single
  // Used Types:  Int32
  }
  // Windows.UI.Composition.Interactions.IInteractionTrackerInertiaStateEnteredArgs
  [WinRTClassNameAttribute(SInteractions_InteractionTrackerInertiaStateEnteredArgs)]
  Interactions_IInteractionTrackerInertiaStateEnteredArgs = interface(IInspectable)
  ['{87108CF2-E7FF-4F7D-9FFD-D72F1E409B63}']
    function get_ModifiedRestingPosition: IReference_1__Numerics_Vector3; safecall;
    function get_ModifiedRestingScale: IReference_1__Single; safecall;
    function get_NaturalRestingPosition: Numerics_Vector3; safecall;
    function get_NaturalRestingScale: Single; safecall;
    function get_PositionVelocityInPixelsPerSecond: Numerics_Vector3; safecall;
    function get_RequestId: Integer; safecall;
    function get_ScaleVelocityInPercentPerSecond: Single; safecall;
    property ModifiedRestingPosition: IReference_1__Numerics_Vector3 read get_ModifiedRestingPosition;
    property ModifiedRestingScale: IReference_1__Single read get_ModifiedRestingScale;
    property NaturalRestingPosition: Numerics_Vector3 read get_NaturalRestingPosition;
    property NaturalRestingScale: Single read get_NaturalRestingScale;
    property PositionVelocityInPixelsPerSecond: Numerics_Vector3 read get_PositionVelocityInPixelsPerSecond;
    property RequestId: Integer read get_RequestId;
    property ScaleVelocityInPercentPerSecond: Single read get_ScaleVelocityInPercentPerSecond;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  }
  // Windows.UI.Composition.Interactions.IInteractionTrackerInteractingStateEnteredArgs
  [WinRTClassNameAttribute(SInteractions_InteractionTrackerInteractingStateEnteredArgs)]
  Interactions_IInteractionTrackerInteractingStateEnteredArgs = interface(IInspectable)
  ['{A7263939-A17B-4011-99FD-B5C24F143748}']
    function get_RequestId: Integer; safecall;
    property RequestId: Integer read get_RequestId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  }
  // Windows.UI.Composition.Interactions.IInteractionTrackerRequestIgnoredArgs
  [WinRTClassNameAttribute(SInteractions_InteractionTrackerRequestIgnoredArgs)]
  Interactions_IInteractionTrackerRequestIgnoredArgs = interface(IInspectable)
  ['{80DD82F1-CE25-488F-91DD-CB6455CCFF2E}']
    function get_RequestId: Integer; safecall;
    property RequestId: Integer read get_RequestId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Numerics.Vector3
  // Used Types:  Int32
  // Used Types:  Single
  }
  // Windows.UI.Composition.Interactions.IInteractionTrackerValuesChangedArgs
  [WinRTClassNameAttribute(SInteractions_InteractionTrackerValuesChangedArgs)]
  Interactions_IInteractionTrackerValuesChangedArgs = interface(IInspectable)
  ['{CF1578EF-D3DF-4501-B9E6-F02FB22F73D0}']
    function get_Position: Numerics_Vector3; safecall;
    function get_RequestId: Integer; safecall;
    function get_Scale: Single; safecall;
    property Position: Numerics_Vector3 read get_Position;
    property RequestId: Integer read get_RequestId;
    property Scale: Single read get_Scale;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.Interactions.IInteractionTracker
  // Used Types:  Windows.UI.Composition.Interactions.IInteractionTrackerCustomAnimationStateEnteredArgs
  // Used Types:  Windows.UI.Composition.Interactions.IInteractionTrackerIdleStateEnteredArgs
  // Used Types:  Windows.UI.Composition.Interactions.IInteractionTrackerInertiaStateEnteredArgs
  // Used Types:  Windows.UI.Composition.Interactions.IInteractionTrackerInteractingStateEnteredArgs
  // Used Types:  Windows.UI.Composition.Interactions.IInteractionTrackerRequestIgnoredArgs
  // Used Types:  Windows.UI.Composition.Interactions.IInteractionTrackerValuesChangedArgs
  }
  // Windows.UI.Composition.Interactions.IInteractionTrackerOwner
  Interactions_IInteractionTrackerOwner = interface(IInspectable)
  ['{DB2E8AF3-4DEB-4E53-B29C-B06C9F96D651}']
    procedure CustomAnimationStateEntered(sender: Interactions_IInteractionTracker; args: Interactions_IInteractionTrackerCustomAnimationStateEnteredArgs); safecall;
    procedure IdleStateEntered(sender: Interactions_IInteractionTracker; args: Interactions_IInteractionTrackerIdleStateEnteredArgs); safecall;
    procedure InertiaStateEntered(sender: Interactions_IInteractionTracker; args: Interactions_IInteractionTrackerInertiaStateEnteredArgs); safecall;
    procedure InteractingStateEntered(sender: Interactions_IInteractionTracker; args: Interactions_IInteractionTrackerInteractingStateEnteredArgs); safecall;
    procedure RequestIgnored(sender: Interactions_IInteractionTracker; args: Interactions_IInteractionTrackerRequestIgnoredArgs); safecall;
    procedure ValuesChanged(sender: Interactions_IInteractionTracker; args: Interactions_IInteractionTrackerValuesChangedArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.UI.Composition.Interactions.IInteractionTrackerInertiaModifier
  [WinRTClassNameAttribute(SInteractions_InteractionTrackerInertiaModifier)]
  Interactions_IInteractionTrackerInertiaModifier = interface(IInspectable)
  ['{A0E2C920-26B4-4DA2-8B61-5E683979BBE2}']
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.Interactions.IInteractionTrackerInertiaModifier>
  IIterator_1__Interactions_IInteractionTrackerInertiaModifier_Base = interface(IInspectable)
  ['{46617D87-2CD2-5E31-9A30-EA86F8AA7CA1}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.Interactions.IInteractionTrackerInertiaModifier
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.Interactions.IInteractionTrackerInertiaModifier>
  IIterator_1__Interactions_IInteractionTrackerInertiaModifier = interface(IIterator_1__Interactions_IInteractionTrackerInertiaModifier_Base)
  ['{D26AD81E-4175-5D12-8048-42995F22AC85}']
    function get_Current: Interactions_IInteractionTrackerInertiaModifier; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PInteractions_IInteractionTrackerInertiaModifier): Cardinal; safecall;
    property Current: Interactions_IInteractionTrackerInertiaModifier read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.Interactions.IInteractionTrackerInertiaModifier>
  IIterable_1__Interactions_IInteractionTrackerInertiaModifier_Base = interface(IInspectable)
  ['{9A245C40-AAE6-59FB-87F5-4BB05599F0B1}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.Interactions.IInteractionTrackerInertiaModifier>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.Interactions.IInteractionTrackerInertiaModifier>
  IIterable_1__Interactions_IInteractionTrackerInertiaModifier = interface(IIterable_1__Interactions_IInteractionTrackerInertiaModifier_Base)
  ['{0A807270-A641-50B9-A240-40FEDEC0FCFD}']
    function First: IIterator_1__Interactions_IInteractionTrackerInertiaModifier; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.ICompositor
  // Used Types:  Windows.UI.Core.ICoreDispatcher
  // Used Types:  Windows.UI.Composition.ICompositionPropertySet
  // Used Types:  String
  // Used Types:  Windows.UI.Composition.ICompositionAnimation
  }
  // Windows.UI.Composition.ICompositionObject
  [WinRTClassNameAttribute(SCompositionObject)]
  ICompositionObject = interface(IInspectable)
  ['{BCB4AD45-7609-4550-934F-16002A68FDED}']
    function get_Compositor: ICompositor; safecall;
    function get_Dispatcher: ICoreDispatcher; safecall;
    function get_Properties: ICompositionPropertySet; safecall;
    procedure StartAnimation(propertyName: HSTRING; animation: ICompositionAnimation); safecall;
    procedure StopAnimation(propertyName: HSTRING); safecall;
    property Compositor: ICompositor read get_Compositor;
    property Dispatcher: ICoreDispatcher read get_Dispatcher;
    property Properties: ICompositionPropertySet read get_Properties;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.UI.Color
  // Used Types:  Windows.Foundation.Numerics.Matrix3x2
  // Used Types:  Windows.Foundation.Numerics.Matrix4x4
  // Used Types:  Windows.Foundation.Numerics.Quaternion
  // Used Types:  Windows.UI.Composition.ICompositionObject
  // Used Types:  Single
  // Used Types:  Windows.Foundation.Numerics.Vector2
  // Used Types:  Windows.Foundation.Numerics.Vector3
  // Used Types:  Windows.Foundation.Numerics.Vector4
  }
  // Windows.UI.Composition.ICompositionAnimation
  [WinRTClassNameAttribute(SCompositionAnimation)]
  ICompositionAnimation = interface(IInspectable)
  ['{464C4C2C-1CAA-4061-9B40-E13FDE1503CA}']
    procedure ClearAllParameters; safecall;
    procedure ClearParameter(key: HSTRING); safecall;
    procedure SetColorParameter(key: HSTRING; value: Color); safecall;
    procedure SetMatrix3x2Parameter(key: HSTRING; value: Numerics_Matrix3x2); safecall;
    procedure SetMatrix4x4Parameter(key: HSTRING; value: Numerics_Matrix4x4); safecall;
    procedure SetQuaternionParameter(key: HSTRING; value: Numerics_Quaternion); safecall;
    procedure SetReferenceParameter(key: HSTRING; compositionObject: ICompositionObject); safecall;
    procedure SetScalarParameter(key: HSTRING; value: Single); safecall;
    procedure SetVector2Parameter(key: HSTRING; value: Numerics_Vector2); safecall;
    procedure SetVector3Parameter(key: HSTRING; value: Numerics_Vector3); safecall;
    procedure SetVector4Parameter(key: HSTRING; value: Numerics_Vector4); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.Interactions.ICompositionInteractionSourceCollection
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Numerics.Vector3
  // Used Types:  Single
  // Used Types:  Windows.UI.Composition.Interactions.IInteractionTrackerOwner
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.Numerics.Vector3>
  // Used Types:  Windows.Foundation.IReference`1<Single>
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.Interactions.IInteractionTrackerInertiaModifier>
  // Used Types:  Int32
  // Used Types:  Windows.UI.Composition.ICompositionAnimation
  }
  // Windows.UI.Composition.Interactions.IInteractionTracker
  [WinRTClassNameAttribute(SInteractions_InteractionTracker)]
  Interactions_IInteractionTracker = interface(IInspectable)
  ['{2A8E8CB1-1000-4416-8363-CC27FB877308}']
    function get_InteractionSources: Interactions_ICompositionInteractionSourceCollection; safecall;
    function get_IsPositionRoundingSuggested: Boolean; safecall;
    function get_MaxPosition: Numerics_Vector3; safecall;
    procedure put_MaxPosition(value: Numerics_Vector3); safecall;
    function get_MaxScale: Single; safecall;
    procedure put_MaxScale(value: Single); safecall;
    function get_MinPosition: Numerics_Vector3; safecall;
    procedure put_MinPosition(value: Numerics_Vector3); safecall;
    function get_MinScale: Single; safecall;
    procedure put_MinScale(value: Single); safecall;
    function get_NaturalRestingPosition: Numerics_Vector3; safecall;
    function get_NaturalRestingScale: Single; safecall;
    function get_Owner: Interactions_IInteractionTrackerOwner; safecall;
    function get_Position: Numerics_Vector3; safecall;
    function get_PositionInertiaDecayRate: IReference_1__Numerics_Vector3; safecall;
    procedure put_PositionInertiaDecayRate(value: IReference_1__Numerics_Vector3); safecall;
    function get_PositionVelocityInPixelsPerSecond: Numerics_Vector3; safecall;
    function get_Scale: Single; safecall;
    function get_ScaleInertiaDecayRate: IReference_1__Single; safecall;
    procedure put_ScaleInertiaDecayRate(value: IReference_1__Single); safecall;
    function get_ScaleVelocityInPercentPerSecond: Single; safecall;
    procedure AdjustPositionXIfGreaterThanThreshold(adjustment: Single; positionThreshold: Single); safecall;
    procedure AdjustPositionYIfGreaterThanThreshold(adjustment: Single; positionThreshold: Single); safecall;
    procedure ConfigurePositionXInertiaModifiers(modifiers: IIterable_1__Interactions_IInteractionTrackerInertiaModifier); safecall;
    procedure ConfigurePositionYInertiaModifiers(modifiers: IIterable_1__Interactions_IInteractionTrackerInertiaModifier); safecall;
    procedure ConfigureScaleInertiaModifiers(modifiers: IIterable_1__Interactions_IInteractionTrackerInertiaModifier); safecall;
    function TryUpdatePosition(value: Numerics_Vector3): Integer; safecall;
    function TryUpdatePositionBy(amount: Numerics_Vector3): Integer; safecall;
    function TryUpdatePositionWithAnimation(animation: ICompositionAnimation): Integer; safecall;
    function TryUpdatePositionWithAdditionalVelocity(velocityInPixelsPerSecond: Numerics_Vector3): Integer; safecall;
    function TryUpdateScale(value: Single; centerPoint: Numerics_Vector3): Integer; safecall;
    function TryUpdateScaleWithAnimation(animation: ICompositionAnimation; centerPoint: Numerics_Vector3): Integer; safecall;
    function TryUpdateScaleWithAdditionalVelocity(velocityInPercentPerSecond: Single; centerPoint: Numerics_Vector3): Integer; safecall;
    property InteractionSources: Interactions_ICompositionInteractionSourceCollection read get_InteractionSources;
    property IsPositionRoundingSuggested: Boolean read get_IsPositionRoundingSuggested;
    property MaxPosition: Numerics_Vector3 read get_MaxPosition write put_MaxPosition;
    property MaxScale: Single read get_MaxScale write put_MaxScale;
    property MinPosition: Numerics_Vector3 read get_MinPosition write put_MinPosition;
    property MinScale: Single read get_MinScale write put_MinScale;
    property NaturalRestingPosition: Numerics_Vector3 read get_NaturalRestingPosition;
    property NaturalRestingScale: Single read get_NaturalRestingScale;
    property Owner: Interactions_IInteractionTrackerOwner read get_Owner;
    property Position: Numerics_Vector3 read get_Position;
    property PositionInertiaDecayRate: IReference_1__Numerics_Vector3 read get_PositionInertiaDecayRate write put_PositionInertiaDecayRate;
    property PositionVelocityInPixelsPerSecond: Numerics_Vector3 read get_PositionVelocityInPixelsPerSecond;
    property Scale: Single read get_Scale;
    property ScaleInertiaDecayRate: IReference_1__Single read get_ScaleInertiaDecayRate write put_ScaleInertiaDecayRate;
    property ScaleVelocityInPercentPerSecond: Single read get_ScaleVelocityInPercentPerSecond;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.Interactions.IInteractionTracker
  // Used Types:  Windows.UI.Composition.ICompositor
  // Used Types:  Windows.UI.Composition.Interactions.IInteractionTrackerOwner
  }
  // Windows.UI.Composition.Interactions.IInteractionTrackerStatics
  [WinRTClassNameAttribute(SInteractions_InteractionTracker)]
  Interactions_IInteractionTrackerStatics = interface(IInspectable)
  ['{BBA5D7B7-6590-4498-8D6C-EB62B514C92A}']
    function Create(compositor: ICompositor): Interactions_IInteractionTracker; safecall;
    function CreateWithOwner(compositor: ICompositor; owner: Interactions_IInteractionTrackerOwner): Interactions_IInteractionTracker; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.Interactions.ICompositionConditionalValue>
  IIterator_1__Interactions_ICompositionConditionalValue_Base = interface(IInspectable)
  ['{8A75B02D-3991-55A6-BFE2-82CB7DD65B98}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.Interactions.ICompositionConditionalValue
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.Interactions.ICompositionConditionalValue>
  IIterator_1__Interactions_ICompositionConditionalValue = interface(IIterator_1__Interactions_ICompositionConditionalValue_Base)
  ['{0E0EA8B0-30B9-55DD-BF50-C971E1007661}']
    function get_Current: Interactions_ICompositionConditionalValue; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PInteractions_ICompositionConditionalValue): Cardinal; safecall;
    property Current: Interactions_ICompositionConditionalValue read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.Interactions.ICompositionConditionalValue>
  IIterable_1__Interactions_ICompositionConditionalValue_Base = interface(IInspectable)
  ['{B268447B-F519-5CE5-89CD-B7E1BC5652EE}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.Interactions.ICompositionConditionalValue>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.Interactions.ICompositionConditionalValue>
  IIterable_1__Interactions_ICompositionConditionalValue = interface(IIterable_1__Interactions_ICompositionConditionalValue_Base)
  ['{E2082853-3D1B-5F73-BD55-E02BC606FA01}']
    function First: IIterator_1__Interactions_ICompositionConditionalValue; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.Interactions.ICompositionConditionalValue>
  }
  // Windows.UI.Composition.Interactions.IInteractionTracker2
  Interactions_IInteractionTracker2 = interface(IInspectable)
  ['{25769A3E-CE6D-448C-8386-92620D240756}']
    procedure ConfigureCenterPointXInertiaModifiers(conditionalValues: IIterable_1__Interactions_ICompositionConditionalValue); safecall;
    procedure ConfigureCenterPointYInertiaModifiers(conditionalValues: IIterable_1__Interactions_ICompositionConditionalValue); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaModifier
  [WinRTClassNameAttribute(SInteractions_InteractionTrackerVector2InertiaModifier)]
  Interactions_IInteractionTrackerVector2InertiaModifier = interface(IInspectable)
  ['{87E08AB0-3086-4853-A4B7-77882AD5D7E3}']
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaModifier>
  IIterator_1__Interactions_IInteractionTrackerVector2InertiaModifier_Base = interface(IInspectable)
  ['{7762CAAB-5B42-5958-9F49-06AEFD43AD75}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaModifier
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaModifier>
  IIterator_1__Interactions_IInteractionTrackerVector2InertiaModifier = interface(IIterator_1__Interactions_IInteractionTrackerVector2InertiaModifier_Base)
  ['{7F56D2B7-9A86-541E-97AC-ACD9A71C1220}']
    function get_Current: Interactions_IInteractionTrackerVector2InertiaModifier; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PInteractions_IInteractionTrackerVector2InertiaModifier): Cardinal; safecall;
    property Current: Interactions_IInteractionTrackerVector2InertiaModifier read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaModifier>
  IIterable_1__Interactions_IInteractionTrackerVector2InertiaModifier_Base = interface(IInspectable)
  ['{3AEACFD8-C7F1-580C-A23B-99666E42E62B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaModifier>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaModifier>
  IIterable_1__Interactions_IInteractionTrackerVector2InertiaModifier = interface(IIterable_1__Interactions_IInteractionTrackerVector2InertiaModifier_Base)
  ['{4C721963-D0EA-5416-A314-FE28F5061E50}']
    function First: IIterator_1__Interactions_IInteractionTrackerVector2InertiaModifier; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaModifier>
  }
  // Windows.UI.Composition.Interactions.IInteractionTracker3
  Interactions_IInteractionTracker3 = interface(IInspectable)
  ['{E6C5D7A2-5C4B-42C6-84B7-F69441B18091}']
    procedure ConfigureVector2PositionInertiaModifiers(modifiers: IIterable_1__Interactions_IInteractionTrackerVector2InertiaModifier); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Single>
  // Used Types:  Single
  }
  // Windows.UI.Composition.IScalarNaturalMotionAnimation
  [WinRTClassNameAttribute(SScalarNaturalMotionAnimation)]
  IScalarNaturalMotionAnimation = interface(IInspectable)
  ['{94A94581-BF92-495B-B5BD-D2C659430737}']
    function get_FinalValue: IReference_1__Single; safecall;
    procedure put_FinalValue(value: IReference_1__Single); safecall;
    function get_InitialValue: IReference_1__Single; safecall;
    procedure put_InitialValue(value: IReference_1__Single); safecall;
    function get_InitialVelocity: Single; safecall;
    procedure put_InitialVelocity(value: Single); safecall;
    property FinalValue: IReference_1__Single read get_FinalValue write put_FinalValue;
    property InitialValue: IReference_1__Single read get_InitialValue write put_InitialValue;
    property InitialVelocity: Single read get_InitialVelocity write put_InitialVelocity;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.IExpressionAnimation
  // Used Types:  Windows.UI.Composition.IScalarNaturalMotionAnimation
  }
  // Windows.UI.Composition.Interactions.IInteractionTrackerInertiaNaturalMotion
  [WinRTClassNameAttribute(SInteractions_InteractionTrackerInertiaNaturalMotion)]
  Interactions_IInteractionTrackerInertiaNaturalMotion = interface(IInspectable)
  ['{70ACDAAE-27DC-48ED-A3C3-6D61C9A029D2}']
    function get_Condition: IExpressionAnimation; safecall;
    procedure put_Condition(value: IExpressionAnimation); safecall;
    function get_NaturalMotion: IScalarNaturalMotionAnimation; safecall;
    procedure put_NaturalMotion(value: IScalarNaturalMotionAnimation); safecall;
    property Condition: IExpressionAnimation read get_Condition write put_Condition;
    property NaturalMotion: IScalarNaturalMotionAnimation read get_NaturalMotion write put_NaturalMotion;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.Interactions.IInteractionTrackerInertiaNaturalMotion
  // Used Types:  Windows.UI.Composition.ICompositor
  }
  // Windows.UI.Composition.Interactions.IInteractionTrackerInertiaNaturalMotionStatics
  [WinRTClassNameAttribute(SInteractions_InteractionTrackerInertiaNaturalMotion)]
  Interactions_IInteractionTrackerInertiaNaturalMotionStatics = interface(IInspectable)
  ['{CFDA55B0-5E3E-4289-932D-EE5F50E74283}']
    function Create(compositor: ICompositor): Interactions_IInteractionTrackerInertiaNaturalMotion; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.IExpressionAnimation
  }
  // Windows.UI.Composition.Interactions.IInteractionTrackerInertiaRestingValue
  [WinRTClassNameAttribute(SInteractions_InteractionTrackerInertiaRestingValue)]
  Interactions_IInteractionTrackerInertiaRestingValue = interface(IInspectable)
  ['{86F7EC09-5096-4170-9CC8-DF2FE101BB93}']
    function get_Condition: IExpressionAnimation; safecall;
    procedure put_Condition(value: IExpressionAnimation); safecall;
    function get_RestingValue: IExpressionAnimation; safecall;
    procedure put_RestingValue(value: IExpressionAnimation); safecall;
    property Condition: IExpressionAnimation read get_Condition write put_Condition;
    property RestingValue: IExpressionAnimation read get_RestingValue write put_RestingValue;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.Interactions.IInteractionTrackerInertiaRestingValue
  // Used Types:  Windows.UI.Composition.ICompositor
  }
  // Windows.UI.Composition.Interactions.IInteractionTrackerInertiaRestingValueStatics
  [WinRTClassNameAttribute(SInteractions_InteractionTrackerInertiaRestingValue)]
  Interactions_IInteractionTrackerInertiaRestingValueStatics = interface(IInspectable)
  ['{18ED4699-0745-4096-BCAB-3A4E99569BCF}']
    function Create(compositor: ICompositor): Interactions_IInteractionTrackerInertiaRestingValue; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.IExpressionAnimation
  }
  // Windows.UI.Composition.Interactions.IInteractionTrackerInertiaMotion
  [WinRTClassNameAttribute(SInteractions_InteractionTrackerInertiaMotion)]
  Interactions_IInteractionTrackerInertiaMotion = interface(IInspectable)
  ['{04922FDC-F154-4CB8-BF33-CC1BA611E6DB}']
    function get_Condition: IExpressionAnimation; safecall;
    procedure put_Condition(value: IExpressionAnimation); safecall;
    function get_Motion: IExpressionAnimation; safecall;
    procedure put_Motion(value: IExpressionAnimation); safecall;
    property Condition: IExpressionAnimation read get_Condition write put_Condition;
    property Motion: IExpressionAnimation read get_Motion write put_Motion;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.Interactions.IInteractionTrackerInertiaMotion
  // Used Types:  Windows.UI.Composition.ICompositor
  }
  // Windows.UI.Composition.Interactions.IInteractionTrackerInertiaMotionStatics
  [WinRTClassNameAttribute(SInteractions_InteractionTrackerInertiaMotion)]
  Interactions_IInteractionTrackerInertiaMotionStatics = interface(IInspectable)
  ['{8CC83DD6-BA7B-431A-844B-6EAC9130F99A}']
    function Create(compositor: ICompositor): Interactions_IInteractionTrackerInertiaMotion; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.UI.Composition.Interactions.VisualInteractionSourceRedirectionMode
  // Used Types:  Windows.UI.Composition.Interactions.InteractionChainingMode
  // Used Types:  Windows.UI.Composition.Interactions.InteractionSourceMode
  // Used Types:  Windows.UI.Composition.IVisual
  // Used Types:  Windows.UI.Input.IPointerPoint
  }
  // Windows.UI.Composition.Interactions.IVisualInteractionSource
  [WinRTClassNameAttribute(SInteractions_VisualInteractionSource)]
  Interactions_IVisualInteractionSource = interface(IInspectable)
  ['{CA0E8A86-D8D6-4111-B088-70347BD2B0ED}']
    function get_IsPositionXRailsEnabled: Boolean; safecall;
    procedure put_IsPositionXRailsEnabled(value: Boolean); safecall;
    function get_IsPositionYRailsEnabled: Boolean; safecall;
    procedure put_IsPositionYRailsEnabled(value: Boolean); safecall;
    function get_ManipulationRedirectionMode: Interactions_VisualInteractionSourceRedirectionMode; safecall;
    procedure put_ManipulationRedirectionMode(value: Interactions_VisualInteractionSourceRedirectionMode); safecall;
    function get_PositionXChainingMode: Interactions_InteractionChainingMode; safecall;
    procedure put_PositionXChainingMode(value: Interactions_InteractionChainingMode); safecall;
    function get_PositionXSourceMode: Interactions_InteractionSourceMode; safecall;
    procedure put_PositionXSourceMode(value: Interactions_InteractionSourceMode); safecall;
    function get_PositionYChainingMode: Interactions_InteractionChainingMode; safecall;
    procedure put_PositionYChainingMode(value: Interactions_InteractionChainingMode); safecall;
    function get_PositionYSourceMode: Interactions_InteractionSourceMode; safecall;
    procedure put_PositionYSourceMode(value: Interactions_InteractionSourceMode); safecall;
    function get_ScaleChainingMode: Interactions_InteractionChainingMode; safecall;
    procedure put_ScaleChainingMode(value: Interactions_InteractionChainingMode); safecall;
    function get_ScaleSourceMode: Interactions_InteractionSourceMode; safecall;
    procedure put_ScaleSourceMode(value: Interactions_InteractionSourceMode); safecall;
    function get_Source: IVisual; safecall;
    procedure TryRedirectForManipulation(pointerPoint: IPointerPoint); safecall;
    property IsPositionXRailsEnabled: Boolean read get_IsPositionXRailsEnabled write put_IsPositionXRailsEnabled;
    property IsPositionYRailsEnabled: Boolean read get_IsPositionYRailsEnabled write put_IsPositionYRailsEnabled;
    property ManipulationRedirectionMode: Interactions_VisualInteractionSourceRedirectionMode read get_ManipulationRedirectionMode write put_ManipulationRedirectionMode;
    property PositionXChainingMode: Interactions_InteractionChainingMode read get_PositionXChainingMode write put_PositionXChainingMode;
    property PositionXSourceMode: Interactions_InteractionSourceMode read get_PositionXSourceMode write put_PositionXSourceMode;
    property PositionYChainingMode: Interactions_InteractionChainingMode read get_PositionYChainingMode write put_PositionYChainingMode;
    property PositionYSourceMode: Interactions_InteractionSourceMode read get_PositionYSourceMode write put_PositionYSourceMode;
    property ScaleChainingMode: Interactions_InteractionChainingMode read get_ScaleChainingMode write put_ScaleChainingMode;
    property ScaleSourceMode: Interactions_InteractionSourceMode read get_ScaleSourceMode write put_ScaleSourceMode;
    property Source: IVisual read get_Source;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.Interactions.IVisualInteractionSource
  // Used Types:  Windows.UI.Composition.IVisual
  }
  // Windows.UI.Composition.Interactions.IVisualInteractionSourceStatics
  [WinRTClassNameAttribute(SInteractions_VisualInteractionSource)]
  Interactions_IVisualInteractionSourceStatics = interface(IInspectable)
  ['{369965E1-8645-4F75-BA00-6479CD10C8E6}']
    function Create(source: IVisual): Interactions_IVisualInteractionSource; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Numerics.Vector3
  // Used Types:  Single
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.Interactions.ICompositionConditionalValue>
  }
  // Windows.UI.Composition.Interactions.IVisualInteractionSource2
  Interactions_IVisualInteractionSource2 = interface(IInspectable)
  ['{AA914893-A73C-414D-80D0-249BAD2FBD93}']
    function get_DeltaPosition: Numerics_Vector3; safecall;
    function get_DeltaScale: Single; safecall;
    function get_Position: Numerics_Vector3; safecall;
    function get_PositionVelocity: Numerics_Vector3; safecall;
    function get_Scale: Single; safecall;
    function get_ScaleVelocity: Single; safecall;
    procedure ConfigureCenterPointXModifiers(conditionalValues: IIterable_1__Interactions_ICompositionConditionalValue); safecall;
    procedure ConfigureCenterPointYModifiers(conditionalValues: IIterable_1__Interactions_ICompositionConditionalValue); safecall;
    procedure ConfigureDeltaPositionXModifiers(conditionalValues: IIterable_1__Interactions_ICompositionConditionalValue); safecall;
    procedure ConfigureDeltaPositionYModifiers(conditionalValues: IIterable_1__Interactions_ICompositionConditionalValue); safecall;
    procedure ConfigureDeltaScaleModifiers(conditionalValues: IIterable_1__Interactions_ICompositionConditionalValue); safecall;
    property DeltaPosition: Numerics_Vector3 read get_DeltaPosition;
    property DeltaScale: Single read get_DeltaScale;
    property Position: Numerics_Vector3 read get_Position;
    property PositionVelocity: Numerics_Vector3 read get_PositionVelocity;
    property Scale: Single read get_Scale;
    property ScaleVelocity: Single read get_ScaleVelocity;
  end;

  {
  }
  // Windows.UI.Composition.Interactions.IInteractionTrackerInertiaModifierFactory
  Interactions_IInteractionTrackerInertiaModifierFactory = interface(IInspectable)
  ['{993818FE-C94E-4B86-87F3-922665BA46B9}']
  end;

  {
  }
  // Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaModifierFactory
  Interactions_IInteractionTrackerVector2InertiaModifierFactory = interface(IInspectable)
  ['{7401D6C4-6C6D-48DF-BC3E-171E227E7D7F}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.Numerics.Vector2>
  // Used Types:  Windows.Foundation.Numerics.Vector2
  }
  // Windows.UI.Composition.IVector2NaturalMotionAnimation
  [WinRTClassNameAttribute(SVector2NaturalMotionAnimation)]
  IVector2NaturalMotionAnimation = interface(IInspectable)
  ['{0F3E0B7D-E512-479D-A00C-77C93A30A395}']
    function get_FinalValue: IReference_1__Numerics_Vector2; safecall;
    procedure put_FinalValue(value: IReference_1__Numerics_Vector2); safecall;
    function get_InitialValue: IReference_1__Numerics_Vector2; safecall;
    procedure put_InitialValue(value: IReference_1__Numerics_Vector2); safecall;
    function get_InitialVelocity: Numerics_Vector2; safecall;
    procedure put_InitialVelocity(value: Numerics_Vector2); safecall;
    property FinalValue: IReference_1__Numerics_Vector2 read get_FinalValue write put_FinalValue;
    property InitialValue: IReference_1__Numerics_Vector2 read get_InitialValue write put_InitialValue;
    property InitialVelocity: Numerics_Vector2 read get_InitialVelocity write put_InitialVelocity;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.IExpressionAnimation
  // Used Types:  Windows.UI.Composition.IVector2NaturalMotionAnimation
  }
  // Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaNaturalMotion
  [WinRTClassNameAttribute(SInteractions_InteractionTrackerVector2InertiaNaturalMotion)]
  Interactions_IInteractionTrackerVector2InertiaNaturalMotion = interface(IInspectable)
  ['{5F17695C-162D-4C07-9400-C282B28276CA}']
    function get_Condition: IExpressionAnimation; safecall;
    procedure put_Condition(value: IExpressionAnimation); safecall;
    function get_NaturalMotion: IVector2NaturalMotionAnimation; safecall;
    procedure put_NaturalMotion(value: IVector2NaturalMotionAnimation); safecall;
    property Condition: IExpressionAnimation read get_Condition write put_Condition;
    property NaturalMotion: IVector2NaturalMotionAnimation read get_NaturalMotion write put_NaturalMotion;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaNaturalMotion
  // Used Types:  Windows.UI.Composition.ICompositor
  }
  // Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaNaturalMotionStatics
  [WinRTClassNameAttribute(SInteractions_InteractionTrackerVector2InertiaNaturalMotion)]
  Interactions_IInteractionTrackerVector2InertiaNaturalMotionStatics = interface(IInspectable)
  ['{82001A48-09C0-434F-8189-141C66DF362F}']
    function Create(compositor: ICompositor): Interactions_IInteractionTrackerVector2InertiaNaturalMotion; safecall;
  end;

  {
  }
  // Windows.UI.Composition.Interactions.IVisualInteractionSourceObjectFactory
  Interactions_IVisualInteractionSourceObjectFactory = interface(IInspectable)
  ['{B2CA917C-E98A-41F2-B3C9-891C9266C8F6}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Color
  }
  // Windows.UI.Composition.IAmbientLight
  [WinRTClassNameAttribute(SAmbientLight)]
  IAmbientLight = interface(IInspectable)
  ['{A48130A1-B7C4-46F7-B9BF-DAF43A44E6EE}']
    function get_Color: Color; safecall;
    procedure put_Color(value: Color); safecall;
    property Color: Color read get_Color write put_Color;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Single
  }
  // Windows.UI.Composition.IAmbientLight2
  IAmbientLight2 = interface(IInspectable)
  ['{3B64A6BF-5F97-4C94-86E5-042DD386B27D}']
    function get_Intensity: Single; safecall;
    procedure put_Intensity(value: Single); safecall;
    property Intensity: Single read get_Intensity write put_Intensity;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.UI.Composition.ICompositionAnimation2
  ICompositionAnimation2 = interface(IInspectable)
  ['{369B603E-A80F-4948-93E3-ED23FB38C6CB}']
    procedure SetBooleanParameter(key: HSTRING; value: Boolean); safecall;
    function get_Target: HSTRING; safecall;
    procedure put_Target(value: HSTRING); safecall;
    property Target: HSTRING read get_Target write put_Target;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IMap`2<String,String>
  }
  // Windows.UI.Composition.ICompositionAnimation3
  ICompositionAnimation3 = interface(IInspectable)
  ['{D51E030D-7DA4-4BD7-BC2D-F4517529F43A}']
    function get_InitialValueExpressions: IMap_2__HSTRING__HSTRING; safecall;
    property InitialValueExpressions: IMap_2__HSTRING__HSTRING read get_InitialValueExpressions;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.ICompositionAnimation>
  IIterator_1__ICompositionAnimation_Base = interface(IInspectable)
  ['{98EFBE55-0A66-556A-9ADC-4AB59C696846}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.ICompositionAnimation
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.ICompositionAnimation>
  IIterator_1__ICompositionAnimation = interface(IIterator_1__ICompositionAnimation_Base)
  ['{D8D0A91C-2C1E-5E23-A950-0A45D3BA8D53}']
    function get_Current: ICompositionAnimation; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PICompositionAnimation): Cardinal; safecall;
    property Current: ICompositionAnimation read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.ICompositionAnimation>
  IIterable_1__ICompositionAnimation_Base = interface(IInspectable)
  ['{0CB59942-C6F3-585F-9A92-B47E8DD38EBF}']
  end;
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.ICompositionAnimation>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.ICompositionAnimation>
  IIterable_1__ICompositionAnimation = interface(IIterable_1__ICompositionAnimation_Base)
  ['{31FD1F3F-3E8D-5B7F-9584-5070D24E3679}']
    function First: IIterator_1__ICompositionAnimation; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Windows.UI.Composition.ICompositionAnimation
  }
  // Windows.UI.Composition.ICompositionAnimationGroup
  [WinRTClassNameAttribute(SCompositionAnimationGroup)]
  ICompositionAnimationGroup = interface(IInspectable)
  ['{5E7CC90C-CD14-4E07-8A55-C72527AABDAC}']
    function get_Count: Integer; safecall;
    procedure Add(value: ICompositionAnimation); safecall;
    procedure Remove(value: ICompositionAnimation); safecall;
    procedure RemoveAll; safecall;
    property Count: Integer read get_Count;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.UI.Composition.ICompositionBackdropBrush
  [WinRTClassNameAttribute(SCompositionBackdropBrush)]
  ICompositionBackdropBrush = interface(IInspectable)
  ['{C5ACAE58-3898-499E-8D7F-224E91286A5D}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.ICompositionCapabilities
  }
  // Windows.UI.Composition.ICompositionCapabilitiesStatics
  [WinRTClassNameAttribute(SCompositionCapabilities)]
  ICompositionCapabilitiesStatics = interface(IInspectable)
  ['{F7B7A86E-6416-49E5-8DDF-AFE949E20562}']
    function GetForCurrentView: ICompositionCapabilities; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Numerics.Vector2
  // Used Types:  Single
  // Used Types:  Windows.Foundation.Numerics.Matrix3x2
  }
  // Windows.UI.Composition.ICompositionClip2
  ICompositionClip2 = interface(IInspectable)
  ['{5893E069-3516-40E1-89E0-5BA924927235}']
    function get_AnchorPoint: Numerics_Vector2; safecall;
    procedure put_AnchorPoint(value: Numerics_Vector2); safecall;
    function get_CenterPoint: Numerics_Vector2; safecall;
    procedure put_CenterPoint(value: Numerics_Vector2); safecall;
    function get_Offset: Numerics_Vector2; safecall;
    procedure put_Offset(value: Numerics_Vector2); safecall;
    function get_RotationAngle: Single; safecall;
    procedure put_RotationAngle(value: Single); safecall;
    function get_RotationAngleInDegrees: Single; safecall;
    procedure put_RotationAngleInDegrees(value: Single); safecall;
    function get_Scale: Numerics_Vector2; safecall;
    procedure put_Scale(value: Numerics_Vector2); safecall;
    function get_TransformMatrix: Numerics_Matrix3x2; safecall;
    procedure put_TransformMatrix(value: Numerics_Matrix3x2); safecall;
    property AnchorPoint: Numerics_Vector2 read get_AnchorPoint write put_AnchorPoint;
    property CenterPoint: Numerics_Vector2 read get_CenterPoint write put_CenterPoint;
    property Offset: Numerics_Vector2 read get_Offset write put_Offset;
    property RotationAngle: Single read get_RotationAngle write put_RotationAngle;
    property RotationAngleInDegrees: Single read get_RotationAngleInDegrees write put_RotationAngleInDegrees;
    property Scale: Numerics_Vector2 read get_Scale write put_Scale;
    property TransformMatrix: Numerics_Matrix3x2 read get_TransformMatrix write put_TransformMatrix;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Color
  // Used Types:  Single
  }
  // Windows.UI.Composition.ICompositionColorGradientStop
  ICompositionColorGradientStop = interface(IInspectable)
  ['{6F00CA92-C801-4E41-9A8F-A53E20F57778}']
    function get_Color: Color; safecall;
    procedure put_Color(value: Color); safecall;
    function get_Offset: Single; safecall;
    procedure put_Offset(value: Single); safecall;
    property Color: Color read get_Color write put_Color;
    property Offset: Single read get_Offset write put_Offset;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.ICompositionColorGradientStop>
  IIterator_1__ICompositionColorGradientStop_Base = interface(IInspectable)
  ['{746A0F51-47F4-5395-8EDD-8AE1E93A8183}']
  end;
  {
  // Used Types:  Windows.UI.Composition.ICompositionColorGradientStop
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Composition.ICompositionColorGradientStop>
  IIterator_1__ICompositionColorGradientStop = interface(IIterator_1__ICompositionColorGradientStop_Base)
  ['{70558704-CBDB-5BC3-90D2-902DA0942B27}']
    function get_Current: ICompositionColorGradientStop; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PICompositionColorGradientStop): Cardinal; safecall;
    property Current: ICompositionColorGradientStop read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.UI.Composition.ICompositionColorGradientStop
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Composition.ICompositionColorGradientStop>
  IVectorView_1__ICompositionColorGradientStop = interface(IInspectable)
  ['{E52E5555-E4A1-50D9-9C8F-BDDD9F4020E4}']
    function GetAt(index: Cardinal): ICompositionColorGradientStop; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: ICompositionColorGradientStop; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PICompositionColorGradientStop): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.DirectX.DirectXAlphaMode
  // Used Types:  Windows.Graphics.DirectX.DirectXPixelFormat
  // Used Types:  Windows.Foundation.Size
  }
  // Windows.UI.Composition.ICompositionDrawingSurface
  [WinRTClassNameAttribute(SCompositionDrawingSurface)]
  ICompositionDrawingSurface = interface(IInspectable)
  ['{A166C300-FAD0-4D11-9E67-E433162FF49E}']
    function get_AlphaMode: DirectX_DirectXAlphaMode; safecall;
    function get_PixelFormat: DirectX_DirectXPixelFormat; safecall;
    function get_Size: TSizeF; safecall;
    property AlphaMode: DirectX_DirectXAlphaMode read get_AlphaMode;
    property PixelFormat: DirectX_DirectXPixelFormat read get_PixelFormat;
    property Size: TSizeF read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.SizeInt32
  // Used Types:  Windows.Graphics.PointInt32
  // Used Types:  Windows.Graphics.RectInt32
  }
  // Windows.UI.Composition.ICompositionDrawingSurface2
  ICompositionDrawingSurface2 = interface(IInspectable)
  ['{FAD0E88B-E354-44E8-8E3D-C4880D5A213F}']
    function get_SizeInt32: SizeInt32; safecall;
    procedure Resize(sizePixels: SizeInt32); safecall;
    procedure Scroll(offset: PointInt32); overload; safecall;
    procedure Scroll(offset: PointInt32; scrollRect: RectInt32); overload; safecall;
    procedure ScrollWithClip(offset: PointInt32; clipRect: RectInt32); overload; safecall;
    procedure ScrollWithClip(offset: PointInt32; clipRect: RectInt32; scrollRect: RectInt32); overload; safecall;
    property SizeInt32: SizeInt32 read get_SizeInt32;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.UI.Composition.ICompositionEffectSourceParameter
  [WinRTClassNameAttribute(SCompositionEffectSourceParameter)]
  ICompositionEffectSourceParameter = interface(IInspectable)
  ['{858AB13A-3292-4E4E-B3BB-2B6C6544A6EE}']
    function get_Name: HSTRING; safecall;
    property Name: HSTRING read get_Name;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.ICompositionEffectSourceParameter
  // Used Types:  String
  }
  // Windows.UI.Composition.ICompositionEffectSourceParameterFactory
  [WinRTClassNameAttribute(SCompositionEffectSourceParameter)]
  ICompositionEffectSourceParameterFactory = interface(IInspectable)
  ['{B3D9F276-ABA3-4724-ACF3-D0397464DB1C}']
    function Create(name: HSTRING): ICompositionEffectSourceParameter; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.ICompositionGraphicsDevice
  }
  // Windows.UI.Composition.IRenderingDeviceReplacedEventArgs
  [WinRTClassNameAttribute(SRenderingDeviceReplacedEventArgs)]
  IRenderingDeviceReplacedEventArgs = interface(IInspectable)
  ['{3A31AC7D-28BF-4E7A-8524-71679D480F38}']
    function get_GraphicsDevice: ICompositionGraphicsDevice; safecall;
    property GraphicsDevice: ICompositionGraphicsDevice read get_GraphicsDevice;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Composition.ICompositionGraphicsDevice,Windows.UI.Composition.IRenderingDeviceReplacedEventArgs>
  TypedEventHandler_2__ICompositionGraphicsDevice__IRenderingDeviceReplacedEventArgs_Delegate_Base = interface(IUnknown)
  ['{259B32BE-BD06-53C2-BD51-89E8E0F9E239}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.ICompositionGraphicsDevice
  // Used Types:  Windows.UI.Composition.IRenderingDeviceReplacedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Composition.ICompositionGraphicsDevice,Windows.UI.Composition.IRenderingDeviceReplacedEventArgs>
  TypedEventHandler_2__ICompositionGraphicsDevice__IRenderingDeviceReplacedEventArgs = interface(TypedEventHandler_2__ICompositionGraphicsDevice__IRenderingDeviceReplacedEventArgs_Delegate_Base)
  ['{876392D2-70D0-550F-AFD3-6E2824D1073B}']
    procedure Invoke(sender: ICompositionGraphicsDevice; args: IRenderingDeviceReplacedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.ICompositionDrawingSurface
  // Used Types:  Windows.Foundation.Size
  // Used Types:  Windows.Graphics.DirectX.DirectXPixelFormat
  // Used Types:  Windows.Graphics.DirectX.DirectXAlphaMode
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.UI.Composition.ICompositionGraphicsDevice,Windows.UI.Composition.IRenderingDeviceReplacedEventArgs>
  }
  // Windows.UI.Composition.ICompositionGraphicsDevice
  [WinRTClassNameAttribute(SCompositionGraphicsDevice)]
  ICompositionGraphicsDevice = interface(IInspectable)
  ['{FB22C6E1-80A2-4667-9936-DBEAF6EEFE95}']
    function CreateDrawingSurface(sizePixels: TSizeF; pixelFormat: DirectX_DirectXPixelFormat; alphaMode: DirectX_DirectXAlphaMode): ICompositionDrawingSurface; safecall;
    function add_RenderingDeviceReplaced(handler: TypedEventHandler_2__ICompositionGraphicsDevice__IRenderingDeviceReplacedEventArgs): EventRegistrationToken; safecall;
    procedure remove_RenderingDeviceReplaced(token: EventRegistrationToken); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.RectInt32
  }
  // Windows.UI.Composition.ICompositionVirtualDrawingSurface
  [WinRTClassNameAttribute(SCompositionVirtualDrawingSurface)]
  ICompositionVirtualDrawingSurface = interface(IInspectable)
  ['{A9C384DB-8740-4F94-8B9D-B68521E7863D}']
    procedure Trim(rectsSize: Cardinal; rects: PRectInt32); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.ICompositionDrawingSurface
  // Used Types:  Windows.Graphics.SizeInt32
  // Used Types:  Windows.Graphics.DirectX.DirectXPixelFormat
  // Used Types:  Windows.Graphics.DirectX.DirectXAlphaMode
  // Used Types:  Windows.UI.Composition.ICompositionVirtualDrawingSurface
  }
  // Windows.UI.Composition.ICompositionGraphicsDevice2
  ICompositionGraphicsDevice2 = interface(IInspectable)
  ['{0FB8BDF6-C0F0-4BCC-9FB8-084982490D7D}']
    function CreateDrawingSurface2(sizePixels: SizeInt32; pixelFormat: DirectX_DirectXPixelFormat; alphaMode: DirectX_DirectXAlphaMode): ICompositionDrawingSurface; safecall;
    function CreateVirtualDrawingSurface(sizePixels: SizeInt32; pixelFormat: DirectX_DirectXPixelFormat; alphaMode: DirectX_DirectXAlphaMode): ICompositionVirtualDrawingSurface; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.IVisualUnorderedCollection
  }
  // Windows.UI.Composition.ICompositionLight2
  ICompositionLight2 = interface(IInspectable)
  ['{A7BCDA72-F35D-425D-9B98-23F4205F6669}']
    function get_ExclusionsFromTargets: IVisualUnorderedCollection; safecall;
    property ExclusionsFromTargets: IVisualUnorderedCollection read get_ExclusionsFromTargets;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Numerics.Vector2
  }
  // Windows.UI.Composition.ICompositionLinearGradientBrush
  ICompositionLinearGradientBrush = interface(IInspectable)
  ['{983BC519-A9DB-413C-A2D8-2A9056FC525E}']
    function get_EndPoint: Numerics_Vector2; safecall;
    procedure put_EndPoint(value: Numerics_Vector2); safecall;
    function get_StartPoint: Numerics_Vector2; safecall;
    procedure put_StartPoint(value: Numerics_Vector2); safecall;
    property EndPoint: Numerics_Vector2 read get_EndPoint write put_EndPoint;
    property StartPoint: Numerics_Vector2 read get_StartPoint write put_StartPoint;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.ICompositionBrush
  }
  // Windows.UI.Composition.ICompositionMaskBrush
  [WinRTClassNameAttribute(SCompositionMaskBrush)]
  ICompositionMaskBrush = interface(IInspectable)
  ['{522CF09E-BE6B-4F41-BE49-F9226D471B4A}']
    function get_Mask: ICompositionBrush; safecall;
    procedure put_Mask(value: ICompositionBrush); safecall;
    function get_Source: ICompositionBrush; safecall;
    procedure put_Source(value: ICompositionBrush); safecall;
    property Mask: ICompositionBrush read get_Mask write put_Mask;
    property Source: ICompositionBrush read get_Source write put_Source;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Single
  // Used Types:  Boolean
  // Used Types:  Windows.UI.Composition.ICompositionBrush
  }
  // Windows.UI.Composition.ICompositionNineGridBrush
  [WinRTClassNameAttribute(SCompositionNineGridBrush)]
  ICompositionNineGridBrush = interface(IInspectable)
  ['{F25154E4-BC8C-4BE7-B80F-8685B83C0186}']
    function get_BottomInset: Single; safecall;
    procedure put_BottomInset(value: Single); safecall;
    function get_BottomInsetScale: Single; safecall;
    procedure put_BottomInsetScale(value: Single); safecall;
    function get_IsCenterHollow: Boolean; safecall;
    procedure put_IsCenterHollow(value: Boolean); safecall;
    function get_LeftInset: Single; safecall;
    procedure put_LeftInset(value: Single); safecall;
    function get_LeftInsetScale: Single; safecall;
    procedure put_LeftInsetScale(value: Single); safecall;
    function get_RightInset: Single; safecall;
    procedure put_RightInset(value: Single); safecall;
    function get_RightInsetScale: Single; safecall;
    procedure put_RightInsetScale(value: Single); safecall;
    function get_Source: ICompositionBrush; safecall;
    procedure put_Source(value: ICompositionBrush); safecall;
    function get_TopInset: Single; safecall;
    procedure put_TopInset(value: Single); safecall;
    function get_TopInsetScale: Single; safecall;
    procedure put_TopInsetScale(value: Single); safecall;
    procedure SetInsets(inset: Single); overload; safecall;
    procedure SetInsets(left: Single; top: Single; right: Single; bottom: Single); overload; safecall;
    procedure SetInsetScales(scale: Single); overload; safecall;
    procedure SetInsetScales(left: Single; top: Single; right: Single; bottom: Single); overload; safecall;
    property BottomInset: Single read get_BottomInset write put_BottomInset;
    property BottomInsetScale: Single read get_BottomInsetScale write put_BottomInsetScale;
    property IsCenterHollow: Boolean read get_IsCenterHollow write put_IsCenterHollow;
    property LeftInset: Single read get_LeftInset write put_LeftInset;
    property LeftInsetScale: Single read get_LeftInsetScale write put_LeftInsetScale;
    property RightInset: Single read get_RightInset write put_RightInset;
    property RightInsetScale: Single read get_RightInsetScale write put_RightInsetScale;
    property Source: ICompositionBrush read get_Source write put_Source;
    property TopInset: Single read get_TopInset write put_TopInset;
    property TopInsetScale: Single read get_TopInsetScale write put_TopInsetScale;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.UI.Composition.ICompositionAnimationBase
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.UI.Composition.ICompositionAnimationBase>
  IKeyValuePair_2__HSTRING__ICompositionAnimationBase = interface(IInspectable)
  ['{3B9A274F-891D-5208-96BB-E3F40C809E9B}']
    function get_Key: HSTRING; safecall;
    function get_Value: ICompositionAnimationBase; safecall;
    property Key: HSTRING read get_Key;
    property Value: ICompositionAnimationBase read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.UI.Composition.ICompositionAnimationBase>>
  IIterator_1__IKeyValuePair_2__HSTRING__ICompositionAnimationBase_Base = interface(IInspectable)
  ['{85924E77-FC46-5A0D-BDAF-463C4F86C172}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.UI.Composition.ICompositionAnimationBase>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.UI.Composition.ICompositionAnimationBase>>
  IIterator_1__IKeyValuePair_2__HSTRING__ICompositionAnimationBase = interface(IIterator_1__IKeyValuePair_2__HSTRING__ICompositionAnimationBase_Base)
  ['{85924E77-FC46-5A0D-BDAF-463C4F86C172}']
    function get_Current: IKeyValuePair_2__HSTRING__ICompositionAnimationBase; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__ICompositionAnimationBase): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__ICompositionAnimationBase read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.UI.Composition.ICompositionAnimationBase>>
  IIterable_1__IKeyValuePair_2__HSTRING__ICompositionAnimationBase_Base = interface(IInspectable)
  ['{C739C420-64B2-53F2-89B9-05906ABA7CB0}']
  end;
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.UI.Composition.ICompositionAnimationBase>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.UI.Composition.ICompositionAnimationBase>>
  IIterable_1__IKeyValuePair_2__HSTRING__ICompositionAnimationBase = interface(IIterable_1__IKeyValuePair_2__HSTRING__ICompositionAnimationBase_Base)
  ['{C739C420-64B2-53F2-89B9-05906ABA7CB0}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__ICompositionAnimationBase; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IMapView`2<String,Windows.UI.Composition.ICompositionAnimationBase>
  IMapView_2__HSTRING__ICompositionAnimationBase_Base = interface(IInspectable)
  ['{B65E6ECE-D9AF-5D4A-ABAA-C08E34A5F815}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.ICompositionAnimationBase
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Windows.UI.Composition.ICompositionAnimationBase>
  }
  // Windows.Foundation.Collections.IMapView`2<String,Windows.UI.Composition.ICompositionAnimationBase>
  IMapView_2__HSTRING__ICompositionAnimationBase = interface(IMapView_2__HSTRING__ICompositionAnimationBase_Base)
  ['{B65E6ECE-D9AF-5D4A-ABAA-C08E34A5F815}']
    function Lookup(key: HSTRING): ICompositionAnimationBase; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__ICompositionAnimationBase; out second: IMapView_2__HSTRING__ICompositionAnimationBase); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.ICompositionAnimationBase
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Windows.UI.Composition.ICompositionAnimationBase>
  }
  // Windows.Foundation.Collections.IMap`2<String,Windows.UI.Composition.ICompositionAnimationBase>
  IMap_2__HSTRING__ICompositionAnimationBase = interface(IInspectable)
  ['{4BA9AA1D-57AC-54DE-A807-B52E689BFC04}']
    function Lookup(key: HSTRING): ICompositionAnimationBase; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    function GetView: IMapView_2__HSTRING__ICompositionAnimationBase; safecall;
    function Insert(key: HSTRING; value: ICompositionAnimationBase): Boolean; safecall;
    procedure Remove(key: HSTRING); safecall;
    procedure Clear; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.UI.Composition.IImplicitAnimationCollection
  [WinRTClassNameAttribute(SImplicitAnimationCollection)]
  IImplicitAnimationCollection = interface(IInspectable)
  ['{0598A3FF-0A92-4C9D-A427-B25519250DBF}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.UI.Composition.IImplicitAnimationCollection
  // Used Types:  Windows.UI.Composition.ICompositionAnimationBase
  }
  // Windows.UI.Composition.ICompositionObject2
  ICompositionObject2 = interface(IInspectable)
  ['{EF874EA1-5CFF-4B68-9E30-A1519D08BA03}']
    function get_Comment: HSTRING; safecall;
    procedure put_Comment(value: HSTRING); safecall;
    function get_ImplicitAnimations: IImplicitAnimationCollection; safecall;
    procedure put_ImplicitAnimations(value: IImplicitAnimationCollection); safecall;
    procedure StartAnimationGroup(value: ICompositionAnimationBase); safecall;
    procedure StopAnimationGroup(value: ICompositionAnimationBase); safecall;
    property Comment: HSTRING read get_Comment write put_Comment;
    property ImplicitAnimations: IImplicitAnimationCollection read get_ImplicitAnimations write put_ImplicitAnimations;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IDispatcherQueue
  }
  // Windows.UI.Composition.ICompositionObject3
  ICompositionObject3 = interface(IInspectable)
  ['{4BC27925-DACD-4CF2-98B1-986B76E7EBE6}']
    function get_DispatcherQueue: IDispatcherQueue; safecall;
    property DispatcherQueue: IDispatcherQueue read get_DispatcherQueue;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Boolean
  // Used Types:  Windows.UI.Composition.CompositionGetValueStatus
  }
  // Windows.UI.Composition.ICompositionPropertySet2
  ICompositionPropertySet2 = interface(IInspectable)
  ['{DE80731E-A211-4455-8880-7D0F3F6A44FD}']
    procedure InsertBoolean(propertyName: HSTRING; value: Boolean); safecall;
    function TryGetBoolean(propertyName: HSTRING; out value: Boolean): CompositionGetValueStatus; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.UI.Composition.ICompositionShadow
  [WinRTClassNameAttribute(SCompositionShadow)]
  ICompositionShadow = interface(IInspectable)
  ['{329E52E2-4335-49CC-B14A-37782D10F0C4}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Numerics.Vector2
  // Used Types:  Single
  // Used Types:  Windows.Foundation.Numerics.Matrix3x2
  }
  // Windows.UI.Composition.ICompositionSurfaceBrush2
  ICompositionSurfaceBrush2 = interface(IInspectable)
  ['{D27174D5-64F5-4692-9DC7-71B61D7E5880}']
    function get_AnchorPoint: Numerics_Vector2; safecall;
    procedure put_AnchorPoint(value: Numerics_Vector2); safecall;
    function get_CenterPoint: Numerics_Vector2; safecall;
    procedure put_CenterPoint(value: Numerics_Vector2); safecall;
    function get_Offset: Numerics_Vector2; safecall;
    procedure put_Offset(value: Numerics_Vector2); safecall;
    function get_RotationAngle: Single; safecall;
    procedure put_RotationAngle(value: Single); safecall;
    function get_RotationAngleInDegrees: Single; safecall;
    procedure put_RotationAngleInDegrees(value: Single); safecall;
    function get_Scale: Numerics_Vector2; safecall;
    procedure put_Scale(value: Numerics_Vector2); safecall;
    function get_TransformMatrix: Numerics_Matrix3x2; safecall;
    procedure put_TransformMatrix(value: Numerics_Matrix3x2); safecall;
    property AnchorPoint: Numerics_Vector2 read get_AnchorPoint write put_AnchorPoint;
    property CenterPoint: Numerics_Vector2 read get_CenterPoint write put_CenterPoint;
    property Offset: Numerics_Vector2 read get_Offset write put_Offset;
    property RotationAngle: Single read get_RotationAngle write put_RotationAngle;
    property RotationAngleInDegrees: Single read get_RotationAngleInDegrees write put_RotationAngleInDegrees;
    property Scale: Numerics_Vector2 read get_Scale write put_Scale;
    property TransformMatrix: Numerics_Matrix3x2 read get_TransformMatrix write put_TransformMatrix;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Color
  // Used Types:  Windows.UI.Composition.IVisual
  // Used Types:  Windows.Foundation.Numerics.Vector3
  }
  // Windows.UI.Composition.IDistantLight
  [WinRTClassNameAttribute(SDistantLight)]
  IDistantLight = interface(IInspectable)
  ['{318CFAFC-5CE3-4B55-AB5D-07A00353AC99}']
    function get_Color: Color; safecall;
    procedure put_Color(value: Color); safecall;
    function get_CoordinateSpace: IVisual; safecall;
    procedure put_CoordinateSpace(value: IVisual); safecall;
    function get_Direction: Numerics_Vector3; safecall;
    procedure put_Direction(value: Numerics_Vector3); safecall;
    property Color: Color read get_Color write put_Color;
    property CoordinateSpace: IVisual read get_CoordinateSpace write put_CoordinateSpace;
    property Direction: Numerics_Vector3 read get_Direction write put_Direction;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Single
  // Used Types:  Windows.UI.Color
  // Used Types:  Windows.UI.Composition.ICompositionBrush
  // Used Types:  Windows.Foundation.Numerics.Vector3
  }
  // Windows.UI.Composition.IDropShadow
  [WinRTClassNameAttribute(SDropShadow)]
  IDropShadow = interface(IInspectable)
  ['{CB977C07-A154-4851-85E7-A8924C84FAD8}']
    function get_BlurRadius: Single; safecall;
    procedure put_BlurRadius(value: Single); safecall;
    function get_Color: Color; safecall;
    procedure put_Color(value: Color); safecall;
    function get_Mask: ICompositionBrush; safecall;
    procedure put_Mask(value: ICompositionBrush); safecall;
    function get_Offset: Numerics_Vector3; safecall;
    procedure put_Offset(value: Numerics_Vector3); safecall;
    function get_Opacity: Single; safecall;
    procedure put_Opacity(value: Single); safecall;
    property BlurRadius: Single read get_BlurRadius write put_BlurRadius;
    property Color: Color read get_Color write put_Color;
    property Mask: ICompositionBrush read get_Mask write put_Mask;
    property Offset: Numerics_Vector3 read get_Offset write put_Offset;
    property Opacity: Single read get_Opacity write put_Opacity;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.ICompositionEffectBrush
  }
  // Windows.UI.Composition.ILayerVisual
  [WinRTClassNameAttribute(SLayerVisual)]
  ILayerVisual = interface(IInspectable)
  ['{AF843985-0444-4887-8E83-B40B253F822C}']
    function get_Effect: ICompositionEffectBrush; safecall;
    procedure put_Effect(value: ICompositionEffectBrush); safecall;
    property Effect: ICompositionEffectBrush read get_Effect write put_Effect;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Color
  // Used Types:  Single
  // Used Types:  Windows.UI.Composition.IVisual
  // Used Types:  Windows.Foundation.Numerics.Vector3
  }
  // Windows.UI.Composition.IPointLight
  [WinRTClassNameAttribute(SPointLight)]
  IPointLight = interface(IInspectable)
  ['{B18545B3-0C5A-4AB0-BEDC-4F3546948272}']
    function get_Color: Color; safecall;
    procedure put_Color(value: Color); safecall;
    function get_ConstantAttenuation: Single; safecall;
    procedure put_ConstantAttenuation(value: Single); safecall;
    function get_CoordinateSpace: IVisual; safecall;
    procedure put_CoordinateSpace(value: IVisual); safecall;
    function get_LinearAttenuation: Single; safecall;
    procedure put_LinearAttenuation(value: Single); safecall;
    function get_Offset: Numerics_Vector3; safecall;
    procedure put_Offset(value: Numerics_Vector3); safecall;
    function get_QuadraticAttenuation: Single; safecall;
    procedure put_QuadraticAttenuation(value: Single); safecall;
    property Color: Color read get_Color write put_Color;
    property ConstantAttenuation: Single read get_ConstantAttenuation write put_ConstantAttenuation;
    property CoordinateSpace: IVisual read get_CoordinateSpace write put_CoordinateSpace;
    property LinearAttenuation: Single read get_LinearAttenuation write put_LinearAttenuation;
    property Offset: Numerics_Vector3 read get_Offset write put_Offset;
    property QuadraticAttenuation: Single read get_QuadraticAttenuation write put_QuadraticAttenuation;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Single
  // Used Types:  Windows.UI.Composition.IVisual
  // Used Types:  Windows.Foundation.Numerics.Vector3
  // Used Types:  Windows.UI.Color
  }
  // Windows.UI.Composition.ISpotLight
  [WinRTClassNameAttribute(SSpotLight)]
  ISpotLight = interface(IInspectable)
  ['{5A9FE273-44A1-4F95-A422-8FA5116BDB44}']
    function get_ConstantAttenuation: Single; safecall;
    procedure put_ConstantAttenuation(value: Single); safecall;
    function get_CoordinateSpace: IVisual; safecall;
    procedure put_CoordinateSpace(value: IVisual); safecall;
    function get_Direction: Numerics_Vector3; safecall;
    procedure put_Direction(value: Numerics_Vector3); safecall;
    function get_InnerConeAngle: Single; safecall;
    procedure put_InnerConeAngle(value: Single); safecall;
    function get_InnerConeAngleInDegrees: Single; safecall;
    procedure put_InnerConeAngleInDegrees(value: Single); safecall;
    function get_InnerConeColor: Color; safecall;
    procedure put_InnerConeColor(value: Color); safecall;
    function get_LinearAttenuation: Single; safecall;
    procedure put_LinearAttenuation(value: Single); safecall;
    function get_Offset: Numerics_Vector3; safecall;
    procedure put_Offset(value: Numerics_Vector3); safecall;
    function get_OuterConeAngle: Single; safecall;
    procedure put_OuterConeAngle(value: Single); safecall;
    function get_OuterConeAngleInDegrees: Single; safecall;
    procedure put_OuterConeAngleInDegrees(value: Single); safecall;
    function get_OuterConeColor: Color; safecall;
    procedure put_OuterConeColor(value: Color); safecall;
    function get_QuadraticAttenuation: Single; safecall;
    procedure put_QuadraticAttenuation(value: Single); safecall;
    property ConstantAttenuation: Single read get_ConstantAttenuation write put_ConstantAttenuation;
    property CoordinateSpace: IVisual read get_CoordinateSpace write put_CoordinateSpace;
    property Direction: Numerics_Vector3 read get_Direction write put_Direction;
    property InnerConeAngle: Single read get_InnerConeAngle write put_InnerConeAngle;
    property InnerConeAngleInDegrees: Single read get_InnerConeAngleInDegrees write put_InnerConeAngleInDegrees;
    property InnerConeColor: Color read get_InnerConeColor write put_InnerConeColor;
    property LinearAttenuation: Single read get_LinearAttenuation write put_LinearAttenuation;
    property Offset: Numerics_Vector3 read get_Offset write put_Offset;
    property OuterConeAngle: Single read get_OuterConeAngle write put_OuterConeAngle;
    property OuterConeAngleInDegrees: Single read get_OuterConeAngleInDegrees write put_OuterConeAngleInDegrees;
    property OuterConeColor: Color read get_OuterConeColor write put_OuterConeColor;
    property QuadraticAttenuation: Single read get_QuadraticAttenuation write put_QuadraticAttenuation;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Boolean
  }
  // Windows.UI.Composition.IStepEasingFunction
  [WinRTClassNameAttribute(SStepEasingFunction)]
  IStepEasingFunction = interface(IInspectable)
  ['{D0CAA74B-560C-4A0B-A5F6-206CA8C3ECD6}']
    function get_FinalStep: Integer; safecall;
    procedure put_FinalStep(value: Integer); safecall;
    function get_InitialStep: Integer; safecall;
    procedure put_InitialStep(value: Integer); safecall;
    function get_IsFinalStepSingleFrame: Boolean; safecall;
    procedure put_IsFinalStepSingleFrame(value: Boolean); safecall;
    function get_IsInitialStepSingleFrame: Boolean; safecall;
    procedure put_IsInitialStepSingleFrame(value: Boolean); safecall;
    function get_StepCount: Integer; safecall;
    procedure put_StepCount(value: Integer); safecall;
    property FinalStep: Integer read get_FinalStep write put_FinalStep;
    property InitialStep: Integer read get_InitialStep write put_InitialStep;
    property IsFinalStepSingleFrame: Boolean read get_IsFinalStepSingleFrame write put_IsFinalStepSingleFrame;
    property IsInitialStepSingleFrame: Boolean read get_IsInitialStepSingleFrame write put_IsInitialStepSingleFrame;
    property StepCount: Integer read get_StepCount write put_StepCount;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.IAmbientLight
  // Used Types:  Windows.UI.Composition.ICompositionAnimationGroup
  // Used Types:  Windows.UI.Composition.ICompositionBackdropBrush
  // Used Types:  Windows.UI.Composition.IDistantLight
  // Used Types:  Windows.UI.Composition.IDropShadow
  // Used Types:  Windows.UI.Composition.IImplicitAnimationCollection
  // Used Types:  Windows.UI.Composition.ILayerVisual
  // Used Types:  Windows.UI.Composition.ICompositionMaskBrush
  // Used Types:  Windows.UI.Composition.ICompositionNineGridBrush
  // Used Types:  Windows.UI.Composition.IPointLight
  // Used Types:  Windows.UI.Composition.ISpotLight
  // Used Types:  Windows.UI.Composition.IStepEasingFunction
  // Used Types:  Int32
  }
  // Windows.UI.Composition.ICompositor2
  ICompositor2 = interface(IInspectable)
  ['{735081DC-5E24-45DA-A38F-E32CC349A9A0}']
    function CreateAmbientLight: IAmbientLight; safecall;
    function CreateAnimationGroup: ICompositionAnimationGroup; safecall;
    function CreateBackdropBrush: ICompositionBackdropBrush; safecall;
    function CreateDistantLight: IDistantLight; safecall;
    function CreateDropShadow: IDropShadow; safecall;
    function CreateImplicitAnimationCollection: IImplicitAnimationCollection; safecall;
    function CreateLayerVisual: ILayerVisual; safecall;
    function CreateMaskBrush: ICompositionMaskBrush; safecall;
    function CreateNineGridBrush: ICompositionNineGridBrush; safecall;
    function CreatePointLight: IPointLight; safecall;
    function CreateSpotLight: ISpotLight; safecall;
    function CreateStepEasingFunction: IStepEasingFunction; overload; safecall;
    function CreateStepEasingFunction(stepCount: Integer): IStepEasingFunction; overload; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.ICompositionBackdropBrush
  }
  // Windows.UI.Composition.ICompositor3
  ICompositor3 = interface(IInspectable)
  ['{C9DD8EF0-6EB1-4E3C-A658-675D9C64D4AB}']
    function CreateHostBackdropBrush: ICompositionBackdropBrush; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Single
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.UI.Composition.ISpringScalarNaturalMotionAnimation
  [WinRTClassNameAttribute(SSpringScalarNaturalMotionAnimation)]
  ISpringScalarNaturalMotionAnimation = interface(IInspectable)
  ['{0572A95F-37F9-4FBE-B87B-5CD03A89501C}']
    function get_DampingRatio: Single; safecall;
    procedure put_DampingRatio(value: Single); safecall;
    function get_Period: TimeSpan; safecall;
    procedure put_Period(value: TimeSpan); safecall;
    property DampingRatio: Single read get_DampingRatio write put_DampingRatio;
    property Period: TimeSpan read get_Period write put_Period;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Single
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.UI.Composition.ISpringVector2NaturalMotionAnimation
  [WinRTClassNameAttribute(SSpringVector2NaturalMotionAnimation)]
  ISpringVector2NaturalMotionAnimation = interface(IInspectable)
  ['{23F494B5-EE73-4F0F-A423-402B946DF4B3}']
    function get_DampingRatio: Single; safecall;
    procedure put_DampingRatio(value: Single); safecall;
    function get_Period: TimeSpan; safecall;
    procedure put_Period(value: TimeSpan); safecall;
    property DampingRatio: Single read get_DampingRatio write put_DampingRatio;
    property Period: TimeSpan read get_Period write put_Period;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Single
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.UI.Composition.ISpringVector3NaturalMotionAnimation
  [WinRTClassNameAttribute(SSpringVector3NaturalMotionAnimation)]
  ISpringVector3NaturalMotionAnimation = interface(IInspectable)
  ['{6C8749DF-D57B-4794-8E2D-CECB11E194E5}']
    function get_DampingRatio: Single; safecall;
    procedure put_DampingRatio(value: Single); safecall;
    function get_Period: TimeSpan; safecall;
    procedure put_Period(value: TimeSpan); safecall;
    property DampingRatio: Single read get_DampingRatio write put_DampingRatio;
    property Period: TimeSpan read get_Period write put_Period;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.ICompositionColorGradientStop
  // Used Types:  Single
  // Used Types:  Windows.UI.Color
  // Used Types:  Windows.UI.Composition.ICompositionLinearGradientBrush
  // Used Types:  Windows.UI.Composition.ISpringScalarNaturalMotionAnimation
  // Used Types:  Windows.UI.Composition.ISpringVector2NaturalMotionAnimation
  // Used Types:  Windows.UI.Composition.ISpringVector3NaturalMotionAnimation
  }
  // Windows.UI.Composition.ICompositor4
  ICompositor4 = interface(IInspectable)
  ['{AE47E78A-7910-4425-A482-A05B758ADCE9}']
    function CreateColorGradientStop: ICompositionColorGradientStop; overload; safecall;
    function CreateColorGradientStop(offset: Single; color: Color): ICompositionColorGradientStop; overload; safecall;
    function CreateLinearGradientBrush: ICompositionLinearGradientBrush; safecall;
    function CreateSpringScalarAnimation: ISpringScalarNaturalMotionAnimation; safecall;
    function CreateSpringVector2Animation: ISpringVector2NaturalMotionAnimation; safecall;
    function CreateSpringVector3Animation: ISpringVector3NaturalMotionAnimation; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Single
  }
  // Windows.UI.Composition.IDistantLight2
  IDistantLight2 = interface(IInspectable)
  ['{DBCDAA1C-294B-48D7-B60E-76DF64AA392B}']
    function get_Intensity: Single; safecall;
    procedure put_Intensity(value: Single); safecall;
    property Intensity: Single read get_Intensity write put_Intensity;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.CompositionDropShadowSourcePolicy
  }
  // Windows.UI.Composition.IDropShadow2
  IDropShadow2 = interface(IInspectable)
  ['{6C4218BC-15B9-4C2D-8D4A-0767DF11977A}']
    function get_SourcePolicy: CompositionDropShadowSourcePolicy; safecall;
    procedure put_SourcePolicy(value: CompositionDropShadowSourcePolicy); safecall;
    property SourcePolicy: CompositionDropShadowSourcePolicy read get_SourcePolicy write put_SourcePolicy;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.UI.Composition.AnimationIterationBehavior
  // Used Types:  Int32
  // Used Types:  Windows.UI.Composition.AnimationStopBehavior
  // Used Types:  Single
  // Used Types:  String
  // Used Types:  Windows.UI.Composition.ICompositionEasingFunction
  }
  // Windows.UI.Composition.IKeyFrameAnimation
  [WinRTClassNameAttribute(SKeyFrameAnimation)]
  IKeyFrameAnimation = interface(IInspectable)
  ['{126E7F22-3AE9-4540-9A8A-DEAE8A4A4A84}']
    function get_DelayTime: TimeSpan; safecall;
    procedure put_DelayTime(value: TimeSpan); safecall;
    function get_Duration: TimeSpan; safecall;
    procedure put_Duration(value: TimeSpan); safecall;
    function get_IterationBehavior: AnimationIterationBehavior; safecall;
    procedure put_IterationBehavior(value: AnimationIterationBehavior); safecall;
    function get_IterationCount: Integer; safecall;
    procedure put_IterationCount(value: Integer); safecall;
    function get_KeyFrameCount: Integer; safecall;
    function get_StopBehavior: AnimationStopBehavior; safecall;
    procedure put_StopBehavior(value: AnimationStopBehavior); safecall;
    procedure InsertExpressionKeyFrame(normalizedProgressKey: Single; value: HSTRING); overload; safecall;
    procedure InsertExpressionKeyFrame(normalizedProgressKey: Single; value: HSTRING; easingFunction: ICompositionEasingFunction); overload; safecall;
    property DelayTime: TimeSpan read get_DelayTime write put_DelayTime;
    property Duration: TimeSpan read get_Duration write put_Duration;
    property IterationBehavior: AnimationIterationBehavior read get_IterationBehavior write put_IterationBehavior;
    property IterationCount: Integer read get_IterationCount write put_IterationCount;
    property KeyFrameCount: Integer read get_KeyFrameCount;
    property StopBehavior: AnimationStopBehavior read get_StopBehavior write put_StopBehavior;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.AnimationDirection
  }
  // Windows.UI.Composition.IKeyFrameAnimation2
  IKeyFrameAnimation2 = interface(IInspectable)
  ['{F4B488BB-2940-4EC0-A41A-EB6D801A2F18}']
    function get_Direction: AnimationDirection; safecall;
    procedure put_Direction(value: AnimationDirection); safecall;
    property Direction: AnimationDirection read get_Direction write put_Direction;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.AnimationDelayBehavior
  }
  // Windows.UI.Composition.IKeyFrameAnimation3
  IKeyFrameAnimation3 = interface(IInspectable)
  ['{845BF0B4-D8DE-462F-8753-C80D43C6FF5A}']
    function get_DelayBehavior: AnimationDelayBehavior; safecall;
    procedure put_DelayBehavior(value: AnimationDelayBehavior); safecall;
    property DelayBehavior: AnimationDelayBehavior read get_DelayBehavior write put_DelayBehavior;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.ICompositionShadow
  }
  // Windows.UI.Composition.ILayerVisual2
  ILayerVisual2 = interface(IInspectable)
  ['{98F9AEEB-6F23-49F1-90B1-1F59A14FBCE3}']
    function get_Shadow: ICompositionShadow; safecall;
    procedure put_Shadow(value: ICompositionShadow); safecall;
    property Shadow: ICompositionShadow read get_Shadow write put_Shadow;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.AnimationDelayBehavior
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.UI.Composition.AnimationStopBehavior
  }
  // Windows.UI.Composition.INaturalMotionAnimation
  [WinRTClassNameAttribute(SNaturalMotionAnimation)]
  INaturalMotionAnimation = interface(IInspectable)
  ['{438DE12D-769B-4821-A949-284A6547E873}']
    function get_DelayBehavior: AnimationDelayBehavior; safecall;
    procedure put_DelayBehavior(value: AnimationDelayBehavior); safecall;
    function get_DelayTime: TimeSpan; safecall;
    procedure put_DelayTime(value: TimeSpan); safecall;
    function get_StopBehavior: AnimationStopBehavior; safecall;
    procedure put_StopBehavior(value: AnimationStopBehavior); safecall;
    property DelayBehavior: AnimationDelayBehavior read get_DelayBehavior write put_DelayBehavior;
    property DelayTime: TimeSpan read get_DelayTime write put_DelayTime;
    property StopBehavior: AnimationStopBehavior read get_StopBehavior write put_StopBehavior;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Single
  }
  // Windows.UI.Composition.IPointLight2
  IPointLight2 = interface(IInspectable)
  ['{EFE98F2C-0678-4F69-B164-A810D995BCB7}']
    function get_Intensity: Single; safecall;
    procedure put_Intensity(value: Single); safecall;
    property Intensity: Single read get_Intensity write put_Intensity;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Single
  }
  // Windows.UI.Composition.ISpotLight2
  ISpotLight2 = interface(IInspectable)
  ['{64EE615E-0686-4DEA-A9E8-BC3A8C701459}']
    function get_InnerConeIntensity: Single; safecall;
    procedure put_InnerConeIntensity(value: Single); safecall;
    function get_OuterConeIntensity: Single; safecall;
    procedure put_OuterConeIntensity(value: Single); safecall;
    property InnerConeIntensity: Single read get_InnerConeIntensity write put_InnerConeIntensity;
    property OuterConeIntensity: Single read get_OuterConeIntensity write put_OuterConeIntensity;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.ICompositionShadow
  }
  // Windows.UI.Composition.ISpriteVisual2
  ISpriteVisual2 = interface(IInspectable)
  ['{588C9664-997A-4850-91FE-53CB58F81CE9}']
    function get_Shadow: ICompositionShadow; safecall;
    procedure put_Shadow(value: ICompositionShadow); safecall;
    property Shadow: ICompositionShadow read get_Shadow write put_Shadow;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.Numerics.Vector3>
  // Used Types:  Windows.Foundation.Numerics.Vector3
  }
  // Windows.UI.Composition.IVector3NaturalMotionAnimation
  [WinRTClassNameAttribute(SVector3NaturalMotionAnimation)]
  IVector3NaturalMotionAnimation = interface(IInspectable)
  ['{9C17042C-E2CA-45AD-969E-4E78B7B9AD41}']
    function get_FinalValue: IReference_1__Numerics_Vector3; safecall;
    procedure put_FinalValue(value: IReference_1__Numerics_Vector3); safecall;
    function get_InitialValue: IReference_1__Numerics_Vector3; safecall;
    procedure put_InitialValue(value: IReference_1__Numerics_Vector3); safecall;
    function get_InitialVelocity: Numerics_Vector3; safecall;
    procedure put_InitialVelocity(value: Numerics_Vector3); safecall;
    property FinalValue: IReference_1__Numerics_Vector3 read get_FinalValue write put_FinalValue;
    property InitialValue: IReference_1__Numerics_Vector3 read get_InitialValue write put_InitialValue;
    property InitialVelocity: Numerics_Vector3 read get_InitialVelocity write put_InitialVelocity;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Composition.IVisual
  // Used Types:  Windows.Foundation.Numerics.Vector3
  // Used Types:  Windows.Foundation.Numerics.Vector2
  }
  // Windows.UI.Composition.IVisual2
  IVisual2 = interface(IInspectable)
  ['{3052B611-56C3-4C3E-8BF3-F6E1AD473F06}']
    function get_ParentForTransform: IVisual; safecall;
    procedure put_ParentForTransform(value: IVisual); safecall;
    function get_RelativeOffsetAdjustment: Numerics_Vector3; safecall;
    procedure put_RelativeOffsetAdjustment(value: Numerics_Vector3); safecall;
    function get_RelativeSizeAdjustment: Numerics_Vector2; safecall;
    procedure put_RelativeSizeAdjustment(value: Numerics_Vector2); safecall;
    property ParentForTransform: IVisual read get_ParentForTransform write put_ParentForTransform;
    property RelativeOffsetAdjustment: Numerics_Vector3 read get_RelativeOffsetAdjustment write put_RelativeOffsetAdjustment;
    property RelativeSizeAdjustment: Numerics_Vector2 read get_RelativeSizeAdjustment write put_RelativeSizeAdjustment;
  end;

  {
  }
  // Windows.UI.Composition.ICompositionAnimationFactory
  ICompositionAnimationFactory = interface(IInspectable)
  ['{10F6C4FB-6E51-4C25-BBD3-586A9BEC3EF4}']
  end;

  {
  }
  // Windows.UI.Composition.ICompositionBrushFactory
  ICompositionBrushFactory = interface(IInspectable)
  ['{DA53FB4C-4650-47C4-AD76-765379607ED6}']
  end;

  {
  }
  // Windows.UI.Composition.ICompositionClipFactory
  ICompositionClipFactory = interface(IInspectable)
  ['{B9484CAF-20C7-4AED-AC4A-9C78BA1302CF}']
  end;

  {
  }
  // Windows.UI.Composition.ICompositionGradientBrushFactory
  ICompositionGradientBrushFactory = interface(IInspectable)
  ['{56D765D7-F189-48C9-9C8D-94DAF1BEC010}']
  end;

  {
  }
  // Windows.UI.Composition.ICompositionDrawingSurfaceFactory
  ICompositionDrawingSurfaceFactory = interface(IInspectable)
  ['{9497B00A-312D-46B9-9DB3-412FD79464C8}']
  end;

  {
  }
  // Windows.UI.Composition.ICompositionEasingFunctionFactory
  ICompositionEasingFunctionFactory = interface(IInspectable)
  ['{60840774-3DA0-4949-8200-7206C00190A0}']
  end;

  {
  }
  // Windows.UI.Composition.ICompositionLightFactory
  ICompositionLightFactory = interface(IInspectable)
  ['{069CF306-DA3C-4B44-838A-5E03D51ACE55}']
  end;

  {
  }
  // Windows.UI.Composition.ICompositionObjectFactory
  ICompositionObjectFactory = interface(IInspectable)
  ['{51205C5E-558A-4F2A-8D39-37BFE1E20DDD}']
  end;

  {
  }
  // Windows.UI.Composition.ICompositionShadowFactory
  ICompositionShadowFactory = interface(IInspectable)
  ['{221F492F-DCBA-4B91-999E-1DC217A01530}']
  end;

  {
  }
  // Windows.UI.Composition.ICompositionTargetFactory
  ICompositionTargetFactory = interface(IInspectable)
  ['{93CD9D2B-8516-4B14-A8CE-F49E2119EC42}']
  end;

  {
  }
  // Windows.UI.Composition.ICompositionVirtualDrawingSurfaceFactory
  ICompositionVirtualDrawingSurfaceFactory = interface(IInspectable)
  ['{6766106C-D56B-4A49-B1DF-5076A0620768}']
  end;

  {
  }
  // Windows.UI.Composition.IContainerVisualFactory
  IContainerVisualFactory = interface(IInspectable)
  ['{0363A65B-C7DA-4D9A-95F4-69B5C8DF670B}']
  end;

  {
  }
  // Windows.UI.Composition.IKeyFrameAnimationFactory
  IKeyFrameAnimationFactory = interface(IInspectable)
  ['{BF0803F8-712A-4FC1-8C87-970859ED8D2E}']
  end;

  {
  }
  // Windows.UI.Composition.INaturalMotionAnimationFactory
  INaturalMotionAnimationFactory = interface(IInspectable)
  ['{F53ACB06-CF6A-4387-A3FE-5221F3E7E0E0}']
  end;

  {
  }
  // Windows.UI.Composition.IScalarNaturalMotionAnimationFactory
  IScalarNaturalMotionAnimationFactory = interface(IInspectable)
  ['{835AA4FC-671C-41DD-AF48-AE8DEF8B1529}']
  end;

  {
  }
  // Windows.UI.Composition.IVector2NaturalMotionAnimationFactory
  IVector2NaturalMotionAnimationFactory = interface(IInspectable)
  ['{8C74FF61-0761-48A2-BDDB-6AFCC52B89D8}']
  end;

  {
  }
  // Windows.UI.Composition.IVector3NaturalMotionAnimationFactory
  IVector3NaturalMotionAnimationFactory = interface(IInspectable)
  ['{21A81D2F-0880-457B-AC87-B609018C876D}']
  end;

  {
  }
  // Windows.UI.Composition.IVisualFactory
  IVisualFactory = interface(IInspectable)
  ['{AD0FF93E-B502-4EB5-87B4-9A38A71D0137}']
  end;


  // Emit Forwarded classes
  // Windows.UI.Composition.Effects.SceneLightingEffect
  // DualAPI
  // Implements: Windows.UI.Composition.Effects.ISceneLightingEffect
  // Implements: Windows.Graphics.Effects.IGraphicsEffect
  // Implements: Windows.Graphics.Effects.IGraphicsEffectSource
  // Implements: Windows.UI.Composition.Effects.ISceneLightingEffect2
  // Instantiable: "Effects_ISceneLightingEffect"
  TEffects_SceneLightingEffect = class(TWinRTGenericImportI<Effects_ISceneLightingEffect>) end;

  // Windows.UI.Composition.Interactions.InteractionTrackerCustomAnimationStateEnteredArgs
  // DualAPI
  // Implements: Windows.UI.Composition.Interactions.IInteractionTrackerCustomAnimationStateEnteredArgs

  // Windows.UI.Composition.Interactions.InteractionTrackerIdleStateEnteredArgs
  // DualAPI
  // Implements: Windows.UI.Composition.Interactions.IInteractionTrackerIdleStateEnteredArgs

  // Windows.UI.Composition.Interactions.InteractionTrackerInertiaStateEnteredArgs
  // DualAPI
  // Implements: Windows.UI.Composition.Interactions.IInteractionTrackerInertiaStateEnteredArgs

  // Windows.UI.Composition.Interactions.InteractionTrackerInteractingStateEnteredArgs
  // DualAPI
  // Implements: Windows.UI.Composition.Interactions.IInteractionTrackerInteractingStateEnteredArgs

  // Windows.UI.Composition.Interactions.InteractionTrackerRequestIgnoredArgs
  // DualAPI
  // Implements: Windows.UI.Composition.Interactions.IInteractionTrackerRequestIgnoredArgs

  // Windows.UI.Composition.Interactions.InteractionTrackerValuesChangedArgs
  // DualAPI
  // Implements: Windows.UI.Composition.Interactions.IInteractionTrackerValuesChangedArgs

  // Windows.UI.Composition.CompositionObject
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionObject
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.UI.Composition.ICompositionObject2
  // Implements: Windows.UI.Composition.ICompositionObject3

  // Windows.UI.Composition.Interactions.CompositionConditionalValue
  // DualAPI
  // Implements: Windows.UI.Composition.Interactions.ICompositionConditionalValue
  // Statics: "Windows.UI.Composition.Interactions.ICompositionConditionalValueStatics"
  TInteractions_CompositionConditionalValue = class(TWinRTGenericImportS<Interactions_ICompositionConditionalValueStatics>)
  public
    // -> Interactions_ICompositionConditionalValueStatics
    class function Create(compositor: ICompositor): Interactions_ICompositionConditionalValue; static; inline;
  end;

  // Windows.UI.Composition.Interactions.CompositionInteractionSourceCollection
  // DualAPI
  // Implements: Windows.UI.Composition.Interactions.ICompositionInteractionSourceCollection
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.Interactions.ICompositionInteractionSource>

  // Windows.UI.Composition.Interactions.InteractionTracker
  // DualAPI
  // Implements: Windows.UI.Composition.Interactions.IInteractionTracker
  // Implements: Windows.UI.Composition.Interactions.IInteractionTracker2
  // Implements: Windows.UI.Composition.Interactions.IInteractionTracker3
  // Statics: "Windows.UI.Composition.Interactions.IInteractionTrackerStatics"
  TInteractions_InteractionTracker = class(TWinRTGenericImportS<Interactions_IInteractionTrackerStatics>)
  public
    // -> Interactions_IInteractionTrackerStatics
    class function Create(compositor: ICompositor): Interactions_IInteractionTracker; static; inline;
    class function CreateWithOwner(compositor: ICompositor; owner: Interactions_IInteractionTrackerOwner): Interactions_IInteractionTracker; static; inline;
  end;

  // Windows.UI.Composition.Interactions.InteractionTrackerInertiaModifier
  // DualAPI
  // Implements: Windows.UI.Composition.Interactions.IInteractionTrackerInertiaModifier

  // Windows.UI.Composition.Interactions.InteractionTrackerVector2InertiaModifier
  // DualAPI
  // Implements: Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaModifier

  // Windows.UI.Composition.Interactions.InteractionTrackerInertiaNaturalMotion
  // DualAPI
  // Implements: Windows.UI.Composition.Interactions.IInteractionTrackerInertiaNaturalMotion
  // Statics: "Windows.UI.Composition.Interactions.IInteractionTrackerInertiaNaturalMotionStatics"
  TInteractions_InteractionTrackerInertiaNaturalMotion = class(TWinRTGenericImportS<Interactions_IInteractionTrackerInertiaNaturalMotionStatics>)
  public
    // -> Interactions_IInteractionTrackerInertiaNaturalMotionStatics
    class function Create(compositor: ICompositor): Interactions_IInteractionTrackerInertiaNaturalMotion; static; inline;
  end;

  // Windows.UI.Composition.Interactions.InteractionTrackerInertiaRestingValue
  // DualAPI
  // Implements: Windows.UI.Composition.Interactions.IInteractionTrackerInertiaRestingValue
  // Statics: "Windows.UI.Composition.Interactions.IInteractionTrackerInertiaRestingValueStatics"
  TInteractions_InteractionTrackerInertiaRestingValue = class(TWinRTGenericImportS<Interactions_IInteractionTrackerInertiaRestingValueStatics>)
  public
    // -> Interactions_IInteractionTrackerInertiaRestingValueStatics
    class function Create(compositor: ICompositor): Interactions_IInteractionTrackerInertiaRestingValue; static; inline;
  end;

  // Windows.UI.Composition.Interactions.InteractionTrackerInertiaMotion
  // DualAPI
  // Implements: Windows.UI.Composition.Interactions.IInteractionTrackerInertiaMotion
  // Statics: "Windows.UI.Composition.Interactions.IInteractionTrackerInertiaMotionStatics"
  TInteractions_InteractionTrackerInertiaMotion = class(TWinRTGenericImportS<Interactions_IInteractionTrackerInertiaMotionStatics>)
  public
    // -> Interactions_IInteractionTrackerInertiaMotionStatics
    class function Create(compositor: ICompositor): Interactions_IInteractionTrackerInertiaMotion; static; inline;
  end;

  // Windows.UI.Composition.Interactions.VisualInteractionSource
  // DualAPI
  // Implements: Windows.UI.Composition.Interactions.IVisualInteractionSource
  // Implements: Windows.UI.Composition.Interactions.ICompositionInteractionSource
  // Implements: Windows.UI.Composition.Interactions.IVisualInteractionSource2
  // Statics: "Windows.UI.Composition.Interactions.IVisualInteractionSourceStatics"
  TInteractions_VisualInteractionSource = class(TWinRTGenericImportS<Interactions_IVisualInteractionSourceStatics>)
  public
    // -> Interactions_IVisualInteractionSourceStatics
    class function Create(source: IVisual): Interactions_IVisualInteractionSource; static; inline;
  end;

  // Windows.UI.Composition.Interactions.InteractionTrackerVector2InertiaNaturalMotion
  // DualAPI
  // Implements: Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaNaturalMotion
  // Statics: "Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaNaturalMotionStatics"
  TInteractions_InteractionTrackerVector2InertiaNaturalMotion = class(TWinRTGenericImportS<Interactions_IInteractionTrackerVector2InertiaNaturalMotionStatics>)
  public
    // -> Interactions_IInteractionTrackerVector2InertiaNaturalMotionStatics
    class function Create(compositor: ICompositor): Interactions_IInteractionTrackerVector2InertiaNaturalMotion; static; inline;
  end;

  // Windows.UI.Composition.InitialValueExpressionCollection
  // DualAPI
  // Implements: Windows.Foundation.Collections.IMap`2<String,String>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>

  // Windows.UI.Composition.CompositionCapabilities
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionCapabilities
  // Statics: "Windows.UI.Composition.ICompositionCapabilitiesStatics"
  TCompositionCapabilities = class(TWinRTGenericImportS<ICompositionCapabilitiesStatics>)
  public
    // -> ICompositionCapabilitiesStatics
    class function GetForCurrentView: ICompositionCapabilities; static; inline;
  end;

  // Windows.UI.Composition.CompositionBatchCompletedEventArgs
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionBatchCompletedEventArgs

  // Windows.UI.Composition.CompositionEasingFunction
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionEasingFunction

  // Windows.UI.Composition.CompositionBrush
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionBrush

  // Windows.UI.Composition.CompositionEffectBrush
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionEffectBrush

  // Windows.UI.Composition.CompositionEffectSourceParameter
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionEffectSourceParameter
  // Implements: Windows.Graphics.Effects.IGraphicsEffectSource
  // Factory: "Windows.UI.Composition.ICompositionEffectSourceParameterFactory"
  TCompositionEffectSourceParameter = class(TWinRTGenericImportF<ICompositionEffectSourceParameterFactory>)
  public
    // -> ICompositionEffectSourceParameterFactory
    class function Create(name: HSTRING): ICompositionEffectSourceParameter; static; inline;
  end;

  // Windows.UI.Composition.CompositionGraphicsDevice
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionGraphicsDevice
  // Implements: Windows.UI.Composition.ICompositionGraphicsDevice2

  // Windows.UI.Composition.Compositor
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositor
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.UI.Composition.ICompositor2
  // Implements: Windows.UI.Composition.ICompositor3
  // Implements: Windows.UI.Composition.ICompositor4
  // Instantiable: "ICompositor"
  TCompositor = class(TWinRTGenericImportI<ICompositor>) end;

  // Windows.UI.Composition.CompositionPropertySet
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionPropertySet
  // Implements: Windows.UI.Composition.ICompositionPropertySet2

  // Windows.UI.Composition.CompositionDrawingSurface
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionDrawingSurface
  // Implements: Windows.UI.Composition.ICompositionSurface
  // Implements: Windows.UI.Composition.ICompositionDrawingSurface2

  // Windows.UI.Composition.CompositionVirtualDrawingSurface
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionVirtualDrawingSurface

  // Windows.UI.Composition.CompositionColorBrush
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionColorBrush

  // Windows.UI.Composition.CompositionEffectFactory
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionEffectFactory

  // Windows.UI.Composition.CompositionScopedBatch
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionScopedBatch

  // Windows.UI.Composition.CompositionSurfaceBrush
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionSurfaceBrush
  // Implements: Windows.UI.Composition.ICompositionSurfaceBrush2

  // Windows.UI.Composition.CompositionTarget
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionTarget

  // Windows.UI.Composition.CompositionCommitBatch
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionCommitBatch

  // Windows.UI.Composition.CompositionAnimationGroup
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionAnimationGroup
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.ICompositionAnimation>
  // Implements: Windows.UI.Composition.ICompositionAnimationBase

  // Windows.UI.Composition.CompositionBackdropBrush
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionBackdropBrush

  // Windows.UI.Composition.CompositionMaskBrush
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionMaskBrush

  // Windows.UI.Composition.CompositionNineGridBrush
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionNineGridBrush

  // Windows.UI.Composition.CubicBezierEasingFunction
  // DualAPI
  // Implements: Windows.UI.Composition.ICubicBezierEasingFunction

  // Windows.UI.Composition.ImplicitAnimationCollection
  // DualAPI
  // Implements: Windows.UI.Composition.IImplicitAnimationCollection
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.UI.Composition.ICompositionAnimationBase>>
  // Implements: Windows.Foundation.Collections.IMap`2<String,Windows.UI.Composition.ICompositionAnimationBase>

  // Windows.UI.Composition.CompositionShadow
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionShadow

  // Windows.UI.Composition.DropShadow
  // DualAPI
  // Implements: Windows.UI.Composition.IDropShadow
  // Implements: Windows.UI.Composition.IDropShadow2

  // Windows.UI.Composition.LinearEasingFunction
  // DualAPI
  // Implements: Windows.UI.Composition.ILinearEasingFunction

  // Windows.UI.Composition.RenderingDeviceReplacedEventArgs
  // DualAPI
  // Implements: Windows.UI.Composition.IRenderingDeviceReplacedEventArgs

  // Windows.UI.Composition.StepEasingFunction
  // DualAPI
  // Implements: Windows.UI.Composition.IStepEasingFunction

  // Windows.UI.Composition.CompositionClip
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionClip
  // Implements: Windows.UI.Composition.ICompositionClip2

  // Windows.UI.Composition.InsetClip
  // DualAPI
  // Implements: Windows.UI.Composition.IInsetClip

  // Windows.UI.Composition.VisualCollection
  // DualAPI
  // Implements: Windows.UI.Composition.IVisualCollection
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.IVisual>

  // Windows.UI.Composition.VisualUnorderedCollection
  // DualAPI
  // Implements: Windows.UI.Composition.IVisualUnorderedCollection
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.UI.Composition.IVisual>

  // Windows.UI.Composition.CompositionAnimation
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionAnimation
  // Implements: Windows.UI.Composition.ICompositionAnimation2
  // Implements: Windows.UI.Composition.ICompositionAnimationBase
  // Implements: Windows.UI.Composition.ICompositionAnimation3

  // Windows.UI.Composition.ExpressionAnimation
  // DualAPI
  // Implements: Windows.UI.Composition.IExpressionAnimation

  // Windows.UI.Composition.Visual
  // DualAPI
  // Implements: Windows.UI.Composition.IVisual
  // Implements: Windows.UI.Composition.IVisual2

  // Windows.UI.Composition.ContainerVisual
  // DualAPI
  // Implements: Windows.UI.Composition.IContainerVisual

  // Windows.UI.Composition.SpriteVisual
  // DualAPI
  // Implements: Windows.UI.Composition.ISpriteVisual
  // Implements: Windows.UI.Composition.ISpriteVisual2

  // Windows.UI.Composition.LayerVisual
  // DualAPI
  // Implements: Windows.UI.Composition.ILayerVisual
  // Implements: Windows.UI.Composition.ILayerVisual2

  // Windows.UI.Composition.CompositionLight
  // DualAPI
  // Implements: Windows.UI.Composition.ICompositionLight
  // Implements: Windows.UI.Composition.ICompositionLight2

  // Windows.UI.Composition.AmbientLight
  // DualAPI
  // Implements: Windows.UI.Composition.IAmbientLight
  // Implements: Windows.UI.Composition.IAmbientLight2

  // Windows.UI.Composition.DistantLight
  // DualAPI
  // Implements: Windows.UI.Composition.IDistantLight
  // Implements: Windows.UI.Composition.IDistantLight2

  // Windows.UI.Composition.PointLight
  // DualAPI
  // Implements: Windows.UI.Composition.IPointLight
  // Implements: Windows.UI.Composition.IPointLight2

  // Windows.UI.Composition.SpotLight
  // DualAPI
  // Implements: Windows.UI.Composition.ISpotLight
  // Implements: Windows.UI.Composition.ISpotLight2

  // Windows.UI.Composition.KeyFrameAnimation
  // DualAPI
  // Implements: Windows.UI.Composition.IKeyFrameAnimation
  // Implements: Windows.UI.Composition.IKeyFrameAnimation2
  // Implements: Windows.UI.Composition.IKeyFrameAnimation3

  // Windows.UI.Composition.ColorKeyFrameAnimation
  // DualAPI
  // Implements: Windows.UI.Composition.IColorKeyFrameAnimation

  // Windows.UI.Composition.QuaternionKeyFrameAnimation
  // DualAPI
  // Implements: Windows.UI.Composition.IQuaternionKeyFrameAnimation

  // Windows.UI.Composition.ScalarKeyFrameAnimation
  // DualAPI
  // Implements: Windows.UI.Composition.IScalarKeyFrameAnimation

  // Windows.UI.Composition.Vector2KeyFrameAnimation
  // DualAPI
  // Implements: Windows.UI.Composition.IVector2KeyFrameAnimation

  // Windows.UI.Composition.Vector3KeyFrameAnimation
  // DualAPI
  // Implements: Windows.UI.Composition.IVector3KeyFrameAnimation

  // Windows.UI.Composition.Vector4KeyFrameAnimation
  // DualAPI
  // Implements: Windows.UI.Composition.IVector4KeyFrameAnimation

  // Windows.UI.Composition.NaturalMotionAnimation
  // DualAPI
  // Implements: Windows.UI.Composition.INaturalMotionAnimation

  // Windows.UI.Composition.ScalarNaturalMotionAnimation
  // DualAPI
  // Implements: Windows.UI.Composition.IScalarNaturalMotionAnimation

  // Windows.UI.Composition.SpringScalarNaturalMotionAnimation
  // DualAPI
  // Implements: Windows.UI.Composition.ISpringScalarNaturalMotionAnimation

  // Windows.UI.Composition.Vector2NaturalMotionAnimation
  // DualAPI
  // Implements: Windows.UI.Composition.IVector2NaturalMotionAnimation

  // Windows.UI.Composition.SpringVector2NaturalMotionAnimation
  // DualAPI
  // Implements: Windows.UI.Composition.ISpringVector2NaturalMotionAnimation

  // Windows.UI.Composition.Vector3NaturalMotionAnimation
  // DualAPI
  // Implements: Windows.UI.Composition.IVector3NaturalMotionAnimation

  // Windows.UI.Composition.SpringVector3NaturalMotionAnimation
  // DualAPI
  // Implements: Windows.UI.Composition.ISpringVector3NaturalMotionAnimation


implementation

  // Emit Classes Implementation
 { TEffects_SceneLightingEffect }

 { TInteractions_CompositionConditionalValue }

class function TInteractions_CompositionConditionalValue.Create(compositor: ICompositor): Interactions_ICompositionConditionalValue;
begin
  Result := Statics.Create(compositor);
end;


 { TInteractions_InteractionTracker }

class function TInteractions_InteractionTracker.Create(compositor: ICompositor): Interactions_IInteractionTracker;
begin
  Result := Statics.Create(compositor);
end;

class function TInteractions_InteractionTracker.CreateWithOwner(compositor: ICompositor; owner: Interactions_IInteractionTrackerOwner): Interactions_IInteractionTracker;
begin
  Result := Statics.CreateWithOwner(compositor, owner);
end;


 { TInteractions_InteractionTrackerInertiaNaturalMotion }

class function TInteractions_InteractionTrackerInertiaNaturalMotion.Create(compositor: ICompositor): Interactions_IInteractionTrackerInertiaNaturalMotion;
begin
  Result := Statics.Create(compositor);
end;


 { TInteractions_InteractionTrackerInertiaRestingValue }

class function TInteractions_InteractionTrackerInertiaRestingValue.Create(compositor: ICompositor): Interactions_IInteractionTrackerInertiaRestingValue;
begin
  Result := Statics.Create(compositor);
end;


 { TInteractions_InteractionTrackerInertiaMotion }

class function TInteractions_InteractionTrackerInertiaMotion.Create(compositor: ICompositor): Interactions_IInteractionTrackerInertiaMotion;
begin
  Result := Statics.Create(compositor);
end;


 { TInteractions_VisualInteractionSource }

class function TInteractions_VisualInteractionSource.Create(source: IVisual): Interactions_IVisualInteractionSource;
begin
  Result := Statics.Create(source);
end;


 { TInteractions_InteractionTrackerVector2InertiaNaturalMotion }

class function TInteractions_InteractionTrackerVector2InertiaNaturalMotion.Create(compositor: ICompositor): Interactions_IInteractionTrackerVector2InertiaNaturalMotion;
begin
  Result := Statics.Create(compositor);
end;


 { TCompositionCapabilities }

class function TCompositionCapabilities.GetForCurrentView: ICompositionCapabilities;
begin
  Result := Statics.GetForCurrentView;
end;


 { TCompositionEffectSourceParameter }
// Factories for : "CompositionEffectSourceParameter"
// Factory: "Windows.UI.Composition.ICompositionEffectSourceParameterFactory"
// -> ICompositionEffectSourceParameterFactory

class function TCompositionEffectSourceParameter.Create(name: HSTRING): ICompositionEffectSourceParameter;
begin
  Result := Factory.Create(name);
end;


 { TCompositor }


end.
