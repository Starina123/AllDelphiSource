{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.UI.Input.Inking;

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
  Winapi.Foundation, 
  Winapi.Devices, 
  Winapi.UI.Composition, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.IInkStrokeRenderingSegment>
  IIterator_1__IInkStrokeRenderingSegment = interface;
  PIIterator_1__IInkStrokeRenderingSegment = ^IIterator_1__IInkStrokeRenderingSegment;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.IInkStrokeRenderingSegment>
  IIterable_1__IInkStrokeRenderingSegment = interface;
  PIIterable_1__IInkStrokeRenderingSegment = ^IIterable_1__IInkStrokeRenderingSegment;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.IInkStroke>
  IIterator_1__IInkStroke = interface;
  PIIterator_1__IInkStroke = ^IIterator_1__IInkStroke;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.IInkStroke>
  IIterable_1__IInkStroke = interface;
  PIIterable_1__IInkStroke = ^IIterable_1__IInkStroke;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.IInkRecognitionResult>
  IIterator_1__IInkRecognitionResult = interface;
  PIIterator_1__IInkRecognitionResult = ^IIterator_1__IInkRecognitionResult;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.IInkRecognitionResult>
  IIterable_1__IInkRecognitionResult = interface;
  PIIterable_1__IInkRecognitionResult = ^IIterable_1__IInkRecognitionResult;

  // Windows.UI.Input.Inking.IInkPresenterStencil
  IInkPresenterStencil = interface;
  PIInkPresenterStencil = ^IInkPresenterStencil;

  // Windows.UI.Input.Inking.IInkPresenterRuler
  IInkPresenterRuler = interface;
  PIInkPresenterRuler = ^IInkPresenterRuler;

  // Windows.UI.Input.Inking.IInkPresenterProtractor
  IInkPresenterProtractor = interface;
  PIInkPresenterProtractor = ^IInkPresenterProtractor;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.Analysis.IInkAnalysisNode>
  IIterator_1__Analysis_IInkAnalysisNode = interface;
  PIIterator_1__Analysis_IInkAnalysisNode = ^IIterator_1__Analysis_IInkAnalysisNode;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.Analysis.IInkAnalysisNode>
  IIterable_1__Analysis_IInkAnalysisNode = interface;
  PIIterable_1__Analysis_IInkAnalysisNode = ^IIterable_1__Analysis_IInkAnalysisNode;

  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.Analysis.IInkAnalysisNode>
  IVectorView_1__Analysis_IInkAnalysisNode = interface;
  PIVectorView_1__Analysis_IInkAnalysisNode = ^IVectorView_1__Analysis_IInkAnalysisNode;

  // Windows.UI.Input.Inking.Analysis.IInkAnalysisNode
  Analysis_IInkAnalysisNode = interface;
  PAnalysis_IInkAnalysisNode = ^Analysis_IInkAnalysisNode;

  // Windows.UI.Input.Inking.Analysis.IInkAnalysisRoot
  Analysis_IInkAnalysisRoot = interface;
  PAnalysis_IInkAnalysisRoot = ^Analysis_IInkAnalysisRoot;

  // Windows.UI.Input.Inking.Analysis.IInkAnalysisResult
  Analysis_IInkAnalysisResult = interface;
  PAnalysis_IInkAnalysisResult = ^Analysis_IInkAnalysisResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.UI.Input.Inking.Analysis.IInkAnalysisResult>
  AsyncOperationCompletedHandler_1__Analysis_IInkAnalysisResult = interface;
  PAsyncOperationCompletedHandler_1__Analysis_IInkAnalysisResult = ^AsyncOperationCompletedHandler_1__Analysis_IInkAnalysisResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.UI.Input.Inking.Analysis.IInkAnalysisResult>
  IAsyncOperation_1__Analysis_IInkAnalysisResult = interface;
  PIAsyncOperation_1__Analysis_IInkAnalysisResult = ^IAsyncOperation_1__Analysis_IInkAnalysisResult;

  // Windows.UI.Input.Inking.Analysis.IInkAnalyzer
  Analysis_IInkAnalyzer = interface;
  PAnalysis_IInkAnalyzer = ^Analysis_IInkAnalyzer;

  // Windows.UI.Input.Inking.Analysis.IInkAnalyzerFactory
  Analysis_IInkAnalyzerFactory = interface;
  PAnalysis_IInkAnalyzerFactory = ^Analysis_IInkAnalyzerFactory;

  // Windows.UI.Input.Inking.Analysis.IInkAnalysisWritingRegion
  Analysis_IInkAnalysisWritingRegion = interface;
  PAnalysis_IInkAnalysisWritingRegion = ^Analysis_IInkAnalysisWritingRegion;

  // Windows.UI.Input.Inking.Analysis.IInkAnalysisParagraph
  Analysis_IInkAnalysisParagraph = interface;
  PAnalysis_IInkAnalysisParagraph = ^Analysis_IInkAnalysisParagraph;

  // Windows.UI.Input.Inking.Analysis.IInkAnalysisListItem
  Analysis_IInkAnalysisListItem = interface;
  PAnalysis_IInkAnalysisListItem = ^Analysis_IInkAnalysisListItem;

  // Windows.UI.Input.Inking.Analysis.IInkAnalysisInkBullet
  Analysis_IInkAnalysisInkBullet = interface;
  PAnalysis_IInkAnalysisInkBullet = ^Analysis_IInkAnalysisInkBullet;

  // Windows.UI.Input.Inking.Analysis.IInkAnalysisLine
  Analysis_IInkAnalysisLine = interface;
  PAnalysis_IInkAnalysisLine = ^Analysis_IInkAnalysisLine;

  // Windows.UI.Input.Inking.Analysis.IInkAnalysisInkWord
  Analysis_IInkAnalysisInkWord = interface;
  PAnalysis_IInkAnalysisInkWord = ^Analysis_IInkAnalysisInkWord;

  // Windows.UI.Input.Inking.Analysis.IInkAnalysisInkDrawing
  Analysis_IInkAnalysisInkDrawing = interface;
  PAnalysis_IInkAnalysisInkDrawing = ^Analysis_IInkAnalysisInkDrawing;

  // Windows.UI.Input.Inking.IInkPresenter2
  IInkPresenter2 = interface;
  PIInkPresenter2 = ^IInkPresenter2;

  // Windows.UI.Input.Inking.IInkPresenterRuler2
  IInkPresenterRuler2 = interface;
  PIInkPresenterRuler2 = ^IInkPresenterRuler2;

  // Windows.UI.Input.Inking.IInkPresenterRulerFactory
  IInkPresenterRulerFactory = interface;
  PIInkPresenterRulerFactory = ^IInkPresenterRulerFactory;

  // Windows.UI.Input.Inking.IInkPresenterProtractorFactory
  IInkPresenterProtractorFactory = interface;
  PIInkPresenterProtractorFactory = ^IInkPresenterProtractorFactory;

  // Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSourceStatics
  Core_ICoreInkIndependentInputSourceStatics = interface;
  PCore_ICoreInkIndependentInputSourceStatics = ^Core_ICoreInkIndependentInputSourceStatics;

  // Windows.UI.Input.Inking.IInkPoint
  IInkPoint = interface;
  PIInkPoint = ^IInkPoint;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.IInkPoint>
  IIterator_1__IInkPoint = interface;
  PIIterator_1__IInkPoint = ^IIterator_1__IInkPoint;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.IInkPoint>
  IIterable_1__IInkPoint = interface;
  PIIterable_1__IInkPoint = ^IIterable_1__IInkPoint;

  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkPoint>
  IVectorView_1__IInkPoint = interface;
  PIVectorView_1__IInkPoint = ^IVectorView_1__IInkPoint;

  // Windows.Foundation.Collections.IVector`1<Windows.UI.Input.Inking.IInkPoint>
  IVector_1__IInkPoint = interface;
  PIVector_1__IInkPoint = ^IVector_1__IInkPoint;

  // Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs
  Core_ICoreWetStrokeUpdateEventArgs = interface;
  PCore_ICoreWetStrokeUpdateEventArgs = ^Core_ICoreWetStrokeUpdateEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource,Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs>
  TypedEventHandler_2__Core_ICoreWetStrokeUpdateSource__Core_ICoreWetStrokeUpdateEventArgs = interface;
  PTypedEventHandler_2__Core_ICoreWetStrokeUpdateSource__Core_ICoreWetStrokeUpdateEventArgs = ^TypedEventHandler_2__Core_ICoreWetStrokeUpdateSource__Core_ICoreWetStrokeUpdateEventArgs;

  // Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource
  Core_ICoreWetStrokeUpdateSource = interface;
  PCore_ICoreWetStrokeUpdateSource = ^Core_ICoreWetStrokeUpdateSource;

  // Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSourceStatics
  Core_ICoreWetStrokeUpdateSourceStatics = interface;
  PCore_ICoreWetStrokeUpdateSourceStatics = ^Core_ICoreWetStrokeUpdateSourceStatics;

  // Windows.UI.Input.Inking.Core.ICoreInkPresenterHost
  Core_ICoreInkPresenterHost = interface;
  PCore_ICoreInkPresenterHost = ^Core_ICoreInkPresenterHost;

  // Windows.UI.Input.Inking.IInkPoint2
  IInkPoint2 = interface;
  PIInkPoint2 = ^IInkPoint2;

  // Windows.UI.Input.Inking.IInkPointFactory
  IInkPointFactory = interface;
  PIInkPointFactory = ^IInkPointFactory;

  // Windows.UI.Input.Inking.IInkPointFactory2
  IInkPointFactory2 = interface;
  PIInkPointFactory2 = ^IInkPointFactory2;

  // Windows.UI.Input.Inking.IInkDrawingAttributes2
  IInkDrawingAttributes2 = interface;
  PIInkDrawingAttributes2 = ^IInkDrawingAttributes2;

  // Windows.UI.Input.Inking.IInkDrawingAttributesPencilProperties
  IInkDrawingAttributesPencilProperties = interface;
  PIInkDrawingAttributesPencilProperties = ^IInkDrawingAttributesPencilProperties;

  // Windows.UI.Input.Inking.IInkDrawingAttributes3
  IInkDrawingAttributes3 = interface;
  PIInkDrawingAttributes3 = ^IInkDrawingAttributes3;

  // Windows.UI.Input.Inking.IInkDrawingAttributes4
  IInkDrawingAttributes4 = interface;
  PIInkDrawingAttributes4 = ^IInkDrawingAttributes4;

  // Windows.UI.Input.Inking.IInkDrawingAttributesStatics
  IInkDrawingAttributesStatics = interface;
  PIInkDrawingAttributesStatics = ^IInkDrawingAttributesStatics;

  // Windows.UI.Input.Inking.IInkStroke2
  IInkStroke2 = interface;
  PIInkStroke2 = ^IInkStroke2;

  // Windows.UI.Input.Inking.IInkStroke3
  IInkStroke3 = interface;
  PIInkStroke3 = ^IInkStroke3;

  // Windows.UI.Input.Inking.IInkStrokeBuilder
  IInkStrokeBuilder = interface;
  PIInkStrokeBuilder = ^IInkStrokeBuilder;

  // Windows.UI.Input.Inking.IInkStrokeBuilder2
  IInkStrokeBuilder2 = interface;
  PIInkStrokeBuilder2 = ^IInkStrokeBuilder2;

  // Windows.UI.Input.Inking.IInkStrokeBuilder3
  IInkStrokeBuilder3 = interface;
  PIInkStrokeBuilder3 = ^IInkStrokeBuilder3;

  // Windows.UI.Input.Inking.IInkStrokeContainer2
  IInkStrokeContainer2 = interface;
  PIInkStrokeContainer2 = ^IInkStrokeContainer2;

  // Windows.UI.Input.Inking.IInkStrokeContainer3
  IInkStrokeContainer3 = interface;
  PIInkStrokeContainer3 = ^IInkStrokeContainer3;

  // Windows.UI.Input.Inking.IInkRecognizer
  IInkRecognizer = interface;
  PIInkRecognizer = ^IInkRecognizer;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkRecognitionResult>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IInkRecognitionResult = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__IInkRecognitionResult = ^AsyncOperationCompletedHandler_1__IVectorView_1__IInkRecognitionResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkRecognitionResult>>
  IAsyncOperation_1__IVectorView_1__IInkRecognitionResult = interface;
  PIAsyncOperation_1__IVectorView_1__IInkRecognitionResult = ^IAsyncOperation_1__IVectorView_1__IInkRecognitionResult;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.IInkRecognizer>
  IIterator_1__IInkRecognizer = interface;
  PIIterator_1__IInkRecognizer = ^IIterator_1__IInkRecognizer;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.IInkRecognizer>
  IIterable_1__IInkRecognizer = interface;
  PIIterable_1__IInkRecognizer = ^IIterable_1__IInkRecognizer;

  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkRecognizer>
  IVectorView_1__IInkRecognizer = interface;
  PIVectorView_1__IInkRecognizer = ^IVectorView_1__IInkRecognizer;

  // Windows.UI.Input.Inking.IInkRecognizerContainer
  IInkRecognizerContainer = interface;
  PIInkRecognizerContainer = ^IInkRecognizerContainer;

  // Windows.UI.Input.Inking.IInkManager
  IInkManager = interface;
  PIInkManager = ^IInkManager;

  // Windows.UI.Input.Inking.Core.ICoreIncrementalInkStroke
  Core_ICoreIncrementalInkStroke = interface;
  PCore_ICoreIncrementalInkStroke = ^Core_ICoreIncrementalInkStroke;

  // Windows.UI.Input.Inking.Core.ICoreIncrementalInkStrokeFactory
  Core_ICoreIncrementalInkStrokeFactory = interface;
  PCore_ICoreIncrementalInkStrokeFactory = ^Core_ICoreIncrementalInkStrokeFactory;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.UI.Input.Inking Interfaces
  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.IInkStrokeRenderingSegment>
  IIterator_1__IInkStrokeRenderingSegment_Base = interface(IInspectable)
  ['{D7D8C317-6F3F-5192-9210-65A263BAF8D1}']
  end;
  {
  // Used Types:  Windows.UI.Input.Inking.IInkStrokeRenderingSegment
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.IInkStrokeRenderingSegment>
  IIterator_1__IInkStrokeRenderingSegment = interface(IIterator_1__IInkStrokeRenderingSegment_Base)
  ['{4C6160CF-7BA6-560A-B27C-80F5E4F7FDF5}']
    function get_Current: IInkStrokeRenderingSegment; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIInkStrokeRenderingSegment): Cardinal; safecall;
    property Current: IInkStrokeRenderingSegment read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.IInkStrokeRenderingSegment>
  IIterable_1__IInkStrokeRenderingSegment_Base = interface(IInspectable)
  ['{27000F47-2885-5DA9-8923-16A3A58B7A55}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.IInkStrokeRenderingSegment>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.IInkStrokeRenderingSegment>
  IIterable_1__IInkStrokeRenderingSegment = interface(IIterable_1__IInkStrokeRenderingSegment_Base)
  ['{8257ED76-E624-53F9-A263-989CE2165CBD}']
    function First: IIterator_1__IInkStrokeRenderingSegment; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.IInkStroke>
  IIterator_1__IInkStroke_Base = interface(IInspectable)
  ['{5608D5A9-E7E4-5A0B-941F-B7FED76B35BF}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.IInkStroke
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.IInkStroke>
  IIterator_1__IInkStroke = interface(IIterator_1__IInkStroke_Base)
  ['{290D40AA-369B-5B43-89AB-EB478BF8E02E}']
    function get_Current: IInkStroke; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIInkStroke): Cardinal; safecall;
    property Current: IInkStroke read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.IInkStroke>
  IIterable_1__IInkStroke_Base = interface(IInspectable)
  ['{BBC11401-89D0-5305-A3B3-36C887714B9B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.IInkStroke>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.IInkStroke>
  IIterable_1__IInkStroke = interface(IIterable_1__IInkStroke_Base)
  ['{D85C9152-A2E8-5C08-AD59-D32E7631674F}']
    function First: IIterator_1__IInkStroke; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.IInkRecognitionResult>
  IIterator_1__IInkRecognitionResult_Base = interface(IInspectable)
  ['{9ABC247F-0223-5F44-8FA1-0D6D691BF9AF}']
  end;
  {
  // Used Types:  Windows.UI.Input.Inking.IInkRecognitionResult
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.IInkRecognitionResult>
  IIterator_1__IInkRecognitionResult = interface(IIterator_1__IInkRecognitionResult_Base)
  ['{666B7A6D-1A5C-5075-8320-52A4D5F5727A}']
    function get_Current: IInkRecognitionResult; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIInkRecognitionResult): Cardinal; safecall;
    property Current: IInkRecognitionResult read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.IInkRecognitionResult>
  IIterable_1__IInkRecognitionResult_Base = interface(IInspectable)
  ['{E29B658B-7CC1-561C-9912-001DBCA86651}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.IInkRecognitionResult>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.IInkRecognitionResult>
  IIterable_1__IInkRecognitionResult = interface(IIterable_1__IInkRecognitionResult_Base)
  ['{146806FB-6B02-587F-9054-0F8C7AFD57BC}']
    function First: IIterator_1__IInkRecognitionResult; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.InkPresenterStencilKind
  // Used Types:  Boolean
  // Used Types:  Windows.UI.Color
  // Used Types:  Windows.Foundation.Numerics.Matrix3x2
  }
  // Windows.UI.Input.Inking.IInkPresenterStencil
  IInkPresenterStencil = interface(IInspectable)
  ['{30D12D6D-3E06-4D02-B116-277FB5D8ADDC}']
    function get_Kind: InkPresenterStencilKind; safecall;
    function get_IsVisible: Boolean; safecall;
    procedure put_IsVisible(value: Boolean); safecall;
    function get_BackgroundColor: Color; safecall;
    procedure put_BackgroundColor(value: Color); safecall;
    function get_ForegroundColor: Color; safecall;
    procedure put_ForegroundColor(value: Color); safecall;
    function get_Transform: Numerics_Matrix3x2; safecall;
    procedure put_Transform(value: Numerics_Matrix3x2); safecall;
    property BackgroundColor: Color read get_BackgroundColor write put_BackgroundColor;
    property ForegroundColor: Color read get_ForegroundColor write put_ForegroundColor;
    property IsVisible: Boolean read get_IsVisible write put_IsVisible;
    property Kind: InkPresenterStencilKind read get_Kind;
    property Transform: Numerics_Matrix3x2 read get_Transform write put_Transform;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Double
  }
  // Windows.UI.Input.Inking.IInkPresenterRuler
  [WinRTClassNameAttribute(SInkPresenterRuler)]
  IInkPresenterRuler = interface(IInspectable)
  ['{6CDA7D5A-DEC7-4DD7-877A-2133F183D48A}']
    function get_Length: Double; safecall;
    procedure put_Length(value: Double); safecall;
    function get_Width: Double; safecall;
    procedure put_Width(value: Double); safecall;
    property Length: Double read get_Length write put_Length;
    property Width: Double read get_Width write put_Width;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Double
  // Used Types:  Windows.UI.Color
  }
  // Windows.UI.Input.Inking.IInkPresenterProtractor
  [WinRTClassNameAttribute(SInkPresenterProtractor)]
  IInkPresenterProtractor = interface(IInspectable)
  ['{7DE3F2AA-EF6C-4E91-A73B-5B70D56FBD17}']
    function get_AreTickMarksVisible: Boolean; safecall;
    procedure put_AreTickMarksVisible(value: Boolean); safecall;
    function get_AreRaysVisible: Boolean; safecall;
    procedure put_AreRaysVisible(value: Boolean); safecall;
    function get_IsCenterMarkerVisible: Boolean; safecall;
    procedure put_IsCenterMarkerVisible(value: Boolean); safecall;
    function get_IsAngleReadoutVisible: Boolean; safecall;
    procedure put_IsAngleReadoutVisible(value: Boolean); safecall;
    function get_IsResizable: Boolean; safecall;
    procedure put_IsResizable(value: Boolean); safecall;
    function get_Radius: Double; safecall;
    procedure put_Radius(value: Double); safecall;
    function get_AccentColor: Color; safecall;
    procedure put_AccentColor(value: Color); safecall;
    property AccentColor: Color read get_AccentColor write put_AccentColor;
    property AreRaysVisible: Boolean read get_AreRaysVisible write put_AreRaysVisible;
    property AreTickMarksVisible: Boolean read get_AreTickMarksVisible write put_AreTickMarksVisible;
    property IsAngleReadoutVisible: Boolean read get_IsAngleReadoutVisible write put_IsAngleReadoutVisible;
    property IsCenterMarkerVisible: Boolean read get_IsCenterMarkerVisible write put_IsCenterMarkerVisible;
    property IsResizable: Boolean read get_IsResizable write put_IsResizable;
    property Radius: Double read get_Radius write put_Radius;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.Analysis.IInkAnalysisNode>
  IIterator_1__Analysis_IInkAnalysisNode_Base = interface(IInspectable)
  ['{AD35ED5C-5F8C-5A68-A6E1-67F209A05EA7}']
  end;
  {
  // Used Types:  Windows.UI.Input.Inking.Analysis.IInkAnalysisNode
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.Analysis.IInkAnalysisNode>
  IIterator_1__Analysis_IInkAnalysisNode = interface(IIterator_1__Analysis_IInkAnalysisNode_Base)
  ['{AD35ED5C-5F8C-5A68-A6E1-67F209A05EA7}']
    function get_Current: Analysis_IInkAnalysisNode; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PAnalysis_IInkAnalysisNode): Cardinal; safecall;
    property Current: Analysis_IInkAnalysisNode read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.Analysis.IInkAnalysisNode>
  IIterable_1__Analysis_IInkAnalysisNode_Base = interface(IInspectable)
  ['{784F069E-BADD-5258-BD8F-42CE205CC95A}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.Analysis.IInkAnalysisNode>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.Analysis.IInkAnalysisNode>
  IIterable_1__Analysis_IInkAnalysisNode = interface(IIterable_1__Analysis_IInkAnalysisNode_Base)
  ['{784F069E-BADD-5258-BD8F-42CE205CC95A}']
    function First: IIterator_1__Analysis_IInkAnalysisNode; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.Analysis.IInkAnalysisNode
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.Analysis.IInkAnalysisNode>
  IVectorView_1__Analysis_IInkAnalysisNode = interface(IInspectable)
  ['{2B3FEE11-53B5-55B0-8D71-C40B427DE029}']
    function GetAt(index: Cardinal): Analysis_IInkAnalysisNode; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Analysis_IInkAnalysisNode; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAnalysis_IInkAnalysisNode): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Windows.UI.Input.Inking.Analysis.InkAnalysisNodeKind
  // Used Types:  Windows.Foundation.Rect
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.Point>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.Analysis.IInkAnalysisNode>
  // Used Types:  Windows.UI.Input.Inking.Analysis.IInkAnalysisNode
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<UInt32>
  }
  // Windows.UI.Input.Inking.Analysis.IInkAnalysisNode
  [WinRTClassNameAttribute(SAnalysis_InkAnalysisNode)]
  Analysis_IInkAnalysisNode = interface(IInspectable)
  ['{30831F05-5F64-4A2C-BA37-4F4887879574}']
    function get_Id: Cardinal; safecall;
    function get_Kind: Analysis_InkAnalysisNodeKind; safecall;
    function get_BoundingRect: TRectF; safecall;
    function get_RotatedBoundingRect: IVectorView_1__Point; safecall;
    function get_Children: IVectorView_1__Analysis_IInkAnalysisNode; safecall;
    function get_Parent: Analysis_IInkAnalysisNode; safecall;
    function GetStrokeIds: IVectorView_1__Cardinal; safecall;
    property BoundingRect: TRectF read get_BoundingRect;
    property Children: IVectorView_1__Analysis_IInkAnalysisNode read get_Children;
    property Id: Cardinal read get_Id;
    property Kind: Analysis_InkAnalysisNodeKind read get_Kind;
    property Parent: Analysis_IInkAnalysisNode read get_Parent;
    property RotatedBoundingRect: IVectorView_1__Point read get_RotatedBoundingRect;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.Analysis.IInkAnalysisNode>
  // Used Types:  Windows.UI.Input.Inking.Analysis.InkAnalysisNodeKind
  }
  // Windows.UI.Input.Inking.Analysis.IInkAnalysisRoot
  [WinRTClassNameAttribute(SAnalysis_InkAnalysisRoot)]
  Analysis_IInkAnalysisRoot = interface(IInspectable)
  ['{3FB6A3C4-2FDE-4061-8502-A90F32545B84}']
    function get_RecognizedText: HSTRING; safecall;
    function FindNodes(nodeKind: Analysis_InkAnalysisNodeKind): IVectorView_1__Analysis_IInkAnalysisNode; safecall;
    property RecognizedText: HSTRING read get_RecognizedText;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.Analysis.InkAnalysisStatus
  }
  // Windows.UI.Input.Inking.Analysis.IInkAnalysisResult
  [WinRTClassNameAttribute(SAnalysis_InkAnalysisResult)]
  Analysis_IInkAnalysisResult = interface(IInspectable)
  ['{8948BA79-A243-4AA3-A294-1F98BD0FF580}']
    function get_Status: Analysis_InkAnalysisStatus; safecall;
    property Status: Analysis_InkAnalysisStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.UI.Input.Inking.Analysis.IInkAnalysisResult>
  AsyncOperationCompletedHandler_1__Analysis_IInkAnalysisResult_Delegate_Base = interface(IUnknown)
  ['{A7EF2666-6FC4-568F-BBF3-19C1036A26BF}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.UI.Input.Inking.Analysis.IInkAnalysisResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.UI.Input.Inking.Analysis.IInkAnalysisResult>
  AsyncOperationCompletedHandler_1__Analysis_IInkAnalysisResult = interface(AsyncOperationCompletedHandler_1__Analysis_IInkAnalysisResult_Delegate_Base)
  ['{C89B2AB8-C6A2-559E-B5C5-FD5BBC9F7F29}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Analysis_IInkAnalysisResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.UI.Input.Inking.Analysis.IInkAnalysisResult>
  IAsyncOperation_1__Analysis_IInkAnalysisResult_Base = interface(IInspectable)
  ['{2C46D1BD-6DBB-5007-BA85-3D0106BDDF50}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.UI.Input.Inking.Analysis.IInkAnalysisResult>
  // Used Types:  Windows.UI.Input.Inking.Analysis.IInkAnalysisResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.UI.Input.Inking.Analysis.IInkAnalysisResult>
  IAsyncOperation_1__Analysis_IInkAnalysisResult = interface(IAsyncOperation_1__Analysis_IInkAnalysisResult_Base)
  ['{E0B82816-9C19-5B96-8D45-EA09933B5E33}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Analysis_IInkAnalysisResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Analysis_IInkAnalysisResult; safecall;
    function GetResults: Analysis_IInkAnalysisResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Analysis_IInkAnalysisResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.Analysis.IInkAnalysisRoot
  // Used Types:  Boolean
  // Used Types:  Windows.UI.Input.Inking.IInkStroke
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.IInkStroke>
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IIterable`1<UInt32>
  // Used Types:  Windows.UI.Input.Inking.Analysis.InkAnalysisStrokeKind
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.UI.Input.Inking.Analysis.IInkAnalysisResult>
  }
  // Windows.UI.Input.Inking.Analysis.IInkAnalyzer
  [WinRTClassNameAttribute(SAnalysis_InkAnalyzer)]
  Analysis_IInkAnalyzer = interface(IInspectable)
  ['{F12B8F95-0866-4DC5-8C77-F88614DFE38C}']
    function get_AnalysisRoot: Analysis_IInkAnalysisRoot; safecall;
    function get_IsAnalyzing: Boolean; safecall;
    procedure AddDataForStroke(stroke: IInkStroke); safecall;
    procedure AddDataForStrokes(strokes: IIterable_1__IInkStroke); safecall;
    procedure ClearDataForAllStrokes; safecall;
    procedure RemoveDataForStroke(strokeId: Cardinal); safecall;
    procedure RemoveDataForStrokes(strokeIds: IIterable_1__Cardinal); safecall;
    procedure ReplaceDataForStroke(stroke: IInkStroke); safecall;
    procedure SetStrokeDataKind(strokeId: Cardinal; strokeKind: Analysis_InkAnalysisStrokeKind); safecall;
    function AnalyzeAsync: IAsyncOperation_1__Analysis_IInkAnalysisResult; safecall;
    property AnalysisRoot: Analysis_IInkAnalysisRoot read get_AnalysisRoot;
    property IsAnalyzing: Boolean read get_IsAnalyzing;
  end;

  {
  // Used Types:  Windows.UI.Input.Inking.Analysis.IInkAnalyzer
  }
  // Windows.UI.Input.Inking.Analysis.IInkAnalyzerFactory
  Analysis_IInkAnalyzerFactory = interface(IInspectable)
  ['{29138686-1963-49D8-9589-E14384C769E3}']
    function CreateAnalyzer: Analysis_IInkAnalyzer; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.UI.Input.Inking.Analysis.IInkAnalysisWritingRegion
  [WinRTClassNameAttribute(SAnalysis_InkAnalysisWritingRegion)]
  Analysis_IInkAnalysisWritingRegion = interface(IInspectable)
  ['{DD6D6231-BD16-4663-B5AE-941D3043EF5B}']
    function get_RecognizedText: HSTRING; safecall;
    property RecognizedText: HSTRING read get_RecognizedText;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.UI.Input.Inking.Analysis.IInkAnalysisParagraph
  [WinRTClassNameAttribute(SAnalysis_InkAnalysisParagraph)]
  Analysis_IInkAnalysisParagraph = interface(IInspectable)
  ['{D9AD045C-0CD1-4DD4-A68B-EB1F12B3D727}']
    function get_RecognizedText: HSTRING; safecall;
    property RecognizedText: HSTRING read get_RecognizedText;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.UI.Input.Inking.Analysis.IInkAnalysisListItem
  [WinRTClassNameAttribute(SAnalysis_InkAnalysisListItem)]
  Analysis_IInkAnalysisListItem = interface(IInspectable)
  ['{B4E3C23F-C4C3-4C3A-A1A6-9D85547EE586}']
    function get_RecognizedText: HSTRING; safecall;
    property RecognizedText: HSTRING read get_RecognizedText;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.UI.Input.Inking.Analysis.IInkAnalysisInkBullet
  [WinRTClassNameAttribute(SAnalysis_InkAnalysisInkBullet)]
  Analysis_IInkAnalysisInkBullet = interface(IInspectable)
  ['{EE049368-6110-4136-95F9-EE809FC20030}']
    function get_RecognizedText: HSTRING; safecall;
    property RecognizedText: HSTRING read get_RecognizedText;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Int32
  }
  // Windows.UI.Input.Inking.Analysis.IInkAnalysisLine
  [WinRTClassNameAttribute(SAnalysis_InkAnalysisLine)]
  Analysis_IInkAnalysisLine = interface(IInspectable)
  ['{A06D048D-2B8D-4754-AD5A-D0871193A956}']
    function get_RecognizedText: HSTRING; safecall;
    function get_IndentLevel: Integer; safecall;
    property IndentLevel: Integer read get_IndentLevel;
    property RecognizedText: HSTRING read get_RecognizedText;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  }
  // Windows.UI.Input.Inking.Analysis.IInkAnalysisInkWord
  [WinRTClassNameAttribute(SAnalysis_InkAnalysisInkWord)]
  Analysis_IInkAnalysisInkWord = interface(IInspectable)
  ['{4BD228AD-83AF-4034-8F3B-F8687DFFF436}']
    function get_RecognizedText: HSTRING; safecall;
    function get_TextAlternates: IVectorView_1__HSTRING; safecall;
    property RecognizedText: HSTRING read get_RecognizedText;
    property TextAlternates: IVectorView_1__HSTRING read get_TextAlternates;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.Analysis.InkAnalysisDrawingKind
  // Used Types:  Windows.Foundation.Point
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.Point>
  }
  // Windows.UI.Input.Inking.Analysis.IInkAnalysisInkDrawing
  [WinRTClassNameAttribute(SAnalysis_InkAnalysisInkDrawing)]
  Analysis_IInkAnalysisInkDrawing = interface(IInspectable)
  ['{6A85ED1F-1FE4-4E15-898C-8E112377E021}']
    function get_DrawingKind: Analysis_InkAnalysisDrawingKind; safecall;
    function get_Center: TPointF; safecall;
    function get_Points: IVectorView_1__Point; safecall;
    property Center: TPointF read get_Center;
    property DrawingKind: Analysis_InkAnalysisDrawingKind read get_DrawingKind;
    property Points: IVectorView_1__Point read get_Points;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.InkHighContrastAdjustment
  }
  // Windows.UI.Input.Inking.IInkPresenter2
  IInkPresenter2 = interface(IInspectable)
  ['{CF53E612-9A34-11E6-9F33-A24FC0D9649C}']
    function get_HighContrastAdjustment: InkHighContrastAdjustment; safecall;
    procedure put_HighContrastAdjustment(value: InkHighContrastAdjustment); safecall;
    property HighContrastAdjustment: InkHighContrastAdjustment read get_HighContrastAdjustment write put_HighContrastAdjustment;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.UI.Input.Inking.IInkPresenterRuler2
  IInkPresenterRuler2 = interface(IInspectable)
  ['{45130DC1-BC61-44D4-A423-54712AE671C4}']
    function get_AreTickMarksVisible: Boolean; safecall;
    procedure put_AreTickMarksVisible(value: Boolean); safecall;
    function get_IsCompassVisible: Boolean; safecall;
    procedure put_IsCompassVisible(value: Boolean); safecall;
    property AreTickMarksVisible: Boolean read get_AreTickMarksVisible write put_AreTickMarksVisible;
    property IsCompassVisible: Boolean read get_IsCompassVisible write put_IsCompassVisible;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.IInkPresenterRuler
  // Used Types:  Windows.UI.Input.Inking.IInkPresenter
  }
  // Windows.UI.Input.Inking.IInkPresenterRulerFactory
  [WinRTClassNameAttribute(SInkPresenterRuler)]
  IInkPresenterRulerFactory = interface(IInspectable)
  ['{34361BEB-9001-4A4B-A690-69DBAF63E501}']
    function Create(inkPresenter: IInkPresenter): IInkPresenterRuler; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.IInkPresenterProtractor
  // Used Types:  Windows.UI.Input.Inking.IInkPresenter
  }
  // Windows.UI.Input.Inking.IInkPresenterProtractorFactory
  [WinRTClassNameAttribute(SInkPresenterProtractor)]
  IInkPresenterProtractorFactory = interface(IInspectable)
  ['{320103C9-68FA-47E9-8127-8370711FC46C}']
    function Create(inkPresenter: IInkPresenter): IInkPresenterProtractor; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
  // Used Types:  Windows.UI.Input.Inking.IInkPresenter
  }
  // Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSourceStatics
  [WinRTClassNameAttribute(SCore_CoreInkIndependentInputSource)]
  Core_ICoreInkIndependentInputSourceStatics = interface(IInspectable)
  ['{73E6011B-80C0-4DFB-9B66-10BA7F3F9C84}']
    function Create(inkPresenter: IInkPresenter): Core_ICoreInkIndependentInputSource; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Point
  // Used Types:  Single
  }
  // Windows.UI.Input.Inking.IInkPoint
  [WinRTClassNameAttribute(SInkPoint)]
  IInkPoint = interface(IInspectable)
  ['{9F87272B-858C-46A5-9B41-D195970459FD}']
    function get_Position: TPointF; safecall;
    function get_Pressure: Single; safecall;
    property Position: TPointF read get_Position;
    property Pressure: Single read get_Pressure;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.IInkPoint>
  IIterator_1__IInkPoint_Base = interface(IInspectable)
  ['{47415452-DB79-567E-84D5-E9912330F944}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.IInkPoint
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.IInkPoint>
  IIterator_1__IInkPoint = interface(IIterator_1__IInkPoint_Base)
  ['{CDD4F975-F1AD-501A-95D1-5CD7053A3DE1}']
    function get_Current: IInkPoint; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIInkPoint): Cardinal; safecall;
    property Current: IInkPoint read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.IInkPoint>
  IIterable_1__IInkPoint_Base = interface(IInspectable)
  ['{0630C0EF-A4E2-5AF6-B2E9-8E042E294E17}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.IInkPoint>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.IInkPoint>
  IIterable_1__IInkPoint = interface(IIterable_1__IInkPoint_Base)
  ['{A9E993DD-3779-5FEF-B8B2-1E40384D55DA}']
    function First: IIterator_1__IInkPoint; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.IInkPoint
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkPoint>
  IVectorView_1__IInkPoint = interface(IInspectable)
  ['{86BAE711-F0CD-51F6-B838-CC568D127246}']
    function GetAt(index: Cardinal): IInkPoint; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IInkPoint; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIInkPoint): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.IInkPoint
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkPoint>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.UI.Input.Inking.IInkPoint>
  IVector_1__IInkPoint = interface(IInspectable)
  ['{79F75E88-4A97-5865-9F28-583145FA6024}']
    function GetAt(index: Cardinal): IInkPoint; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IInkPoint; safecall;
    function IndexOf(value: IInkPoint; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IInkPoint); safecall;
    procedure InsertAt(index: Cardinal; value: IInkPoint); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IInkPoint); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIInkPoint): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIInkPoint); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.UI.Input.Inking.IInkPoint>
  // Used Types:  UInt32
  // Used Types:  Windows.UI.Input.Inking.Core.CoreWetStrokeDisposition
  }
  // Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs
  [WinRTClassNameAttribute(SCore_CoreWetStrokeUpdateEventArgs)]
  Core_ICoreWetStrokeUpdateEventArgs = interface(IInspectable)
  ['{FB07D14C-3380-457A-A987-991357896C1B}']
    function get_NewInkPoints: IVector_1__IInkPoint; safecall;
    function get_PointerId: Cardinal; safecall;
    function get_Disposition: Core_CoreWetStrokeDisposition; safecall;
    procedure put_Disposition(value: Core_CoreWetStrokeDisposition); safecall;
    property Disposition: Core_CoreWetStrokeDisposition read get_Disposition write put_Disposition;
    property NewInkPoints: IVector_1__IInkPoint read get_NewInkPoints;
    property PointerId: Cardinal read get_PointerId;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource,Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs>
  TypedEventHandler_2__Core_ICoreWetStrokeUpdateSource__Core_ICoreWetStrokeUpdateEventArgs_Delegate_Base = interface(IUnknown)
  ['{67FF75E8-02A4-5254-A965-0B254C7D0788}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource
  // Used Types:  Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource,Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs>
  TypedEventHandler_2__Core_ICoreWetStrokeUpdateSource__Core_ICoreWetStrokeUpdateEventArgs = interface(TypedEventHandler_2__Core_ICoreWetStrokeUpdateSource__Core_ICoreWetStrokeUpdateEventArgs_Delegate_Base)
  ['{0F5956D0-3883-5571-A68B-29E8B79654CC}']
    procedure Invoke(sender: Core_ICoreWetStrokeUpdateSource; args: Core_ICoreWetStrokeUpdateEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource,Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs>
  // Used Types:  Windows.UI.Input.Inking.IInkPresenter
  }
  // Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource
  [WinRTClassNameAttribute(SCore_CoreWetStrokeUpdateSource)]
  Core_ICoreWetStrokeUpdateSource = interface(IInspectable)
  ['{1F718E22-EE52-4E00-8209-4C3E5B21A3CC}']
    function add_WetStrokeStarting(handler: TypedEventHandler_2__Core_ICoreWetStrokeUpdateSource__Core_ICoreWetStrokeUpdateEventArgs): EventRegistrationToken; safecall;
    procedure remove_WetStrokeStarting(cookie: EventRegistrationToken); safecall;
    function add_WetStrokeContinuing(handler: TypedEventHandler_2__Core_ICoreWetStrokeUpdateSource__Core_ICoreWetStrokeUpdateEventArgs): EventRegistrationToken; safecall;
    procedure remove_WetStrokeContinuing(cookie: EventRegistrationToken); safecall;
    function add_WetStrokeStopping(handler: TypedEventHandler_2__Core_ICoreWetStrokeUpdateSource__Core_ICoreWetStrokeUpdateEventArgs): EventRegistrationToken; safecall;
    procedure remove_WetStrokeStopping(cookie: EventRegistrationToken); safecall;
    function add_WetStrokeCompleted(handler: TypedEventHandler_2__Core_ICoreWetStrokeUpdateSource__Core_ICoreWetStrokeUpdateEventArgs): EventRegistrationToken; safecall;
    procedure remove_WetStrokeCompleted(cookie: EventRegistrationToken); safecall;
    function add_WetStrokeCanceled(handler: TypedEventHandler_2__Core_ICoreWetStrokeUpdateSource__Core_ICoreWetStrokeUpdateEventArgs): EventRegistrationToken; safecall;
    procedure remove_WetStrokeCanceled(cookie: EventRegistrationToken); safecall;
    function get_InkPresenter: IInkPresenter; safecall;
    property InkPresenter: IInkPresenter read get_InkPresenter;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource
  // Used Types:  Windows.UI.Input.Inking.IInkPresenter
  }
  // Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSourceStatics
  [WinRTClassNameAttribute(SCore_CoreWetStrokeUpdateSource)]
  Core_ICoreWetStrokeUpdateSourceStatics = interface(IInspectable)
  ['{3DAD9CBA-1D3D-46AE-AB9D-8647486C6F90}']
    function Create(inkPresenter: IInkPresenter): Core_ICoreWetStrokeUpdateSource; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.IInkPresenter
  // Used Types:  Windows.UI.Composition.IContainerVisual
  }
  // Windows.UI.Input.Inking.Core.ICoreInkPresenterHost
  [WinRTClassNameAttribute(SCore_CoreInkPresenterHost)]
  Core_ICoreInkPresenterHost = interface(IInspectable)
  ['{396E89E6-7D55-4617-9E58-68C70C9169B9}']
    function get_InkPresenter: IInkPresenter; safecall;
    function get_RootVisual: IContainerVisual; safecall;
    procedure put_RootVisual(value: IContainerVisual); safecall;
    property InkPresenter: IInkPresenter read get_InkPresenter;
    property RootVisual: IContainerVisual read get_RootVisual write put_RootVisual;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Single
  // Used Types:  UInt64
  }
  // Windows.UI.Input.Inking.IInkPoint2
  IInkPoint2 = interface(IInspectable)
  ['{FBA9C3F7-AE56-4D5C-BD2F-0AC45F5E4AF9}']
    function get_TiltX: Single; safecall;
    function get_TiltY: Single; safecall;
    function get_Timestamp: UInt64; safecall;
    property TiltX: Single read get_TiltX;
    property TiltY: Single read get_TiltY;
    property Timestamp: UInt64 read get_Timestamp;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.IInkPoint
  // Used Types:  Windows.Foundation.Point
  // Used Types:  Single
  }
  // Windows.UI.Input.Inking.IInkPointFactory
  [WinRTClassNameAttribute(SInkPoint)]
  IInkPointFactory = interface(IInspectable)
  ['{29E5D51C-C98F-405D-9F3B-E53E31068D4D}']
    function CreateInkPoint(position: TPointF; pressure: Single): IInkPoint; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.IInkPoint
  // Used Types:  Windows.Foundation.Point
  // Used Types:  Single
  // Used Types:  UInt64
  }
  // Windows.UI.Input.Inking.IInkPointFactory2
  [WinRTClassNameAttribute(SInkPoint)]
  IInkPointFactory2 = interface(IInspectable)
  ['{E0145E85-DAFF-45F2-AD69-050D8256A209}']
    function CreateInkPointWithTiltAndTimestamp(position: TPointF; pressure: Single; tiltX: Single; tiltY: Single; timestamp: UInt64): IInkPoint; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Numerics.Matrix3x2
  // Used Types:  Boolean
  }
  // Windows.UI.Input.Inking.IInkDrawingAttributes2
  IInkDrawingAttributes2 = interface(IInspectable)
  ['{7CAB6508-8EC4-42FD-A5A5-E4B7D1D5316D}']
    function get_PenTipTransform: Numerics_Matrix3x2; safecall;
    procedure put_PenTipTransform(value: Numerics_Matrix3x2); safecall;
    function get_DrawAsHighlighter: Boolean; safecall;
    procedure put_DrawAsHighlighter(value: Boolean); safecall;
    property DrawAsHighlighter: Boolean read get_DrawAsHighlighter write put_DrawAsHighlighter;
    property PenTipTransform: Numerics_Matrix3x2 read get_PenTipTransform write put_PenTipTransform;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Double
  }
  // Windows.UI.Input.Inking.IInkDrawingAttributesPencilProperties
  [WinRTClassNameAttribute(SInkDrawingAttributesPencilProperties)]
  IInkDrawingAttributesPencilProperties = interface(IInspectable)
  ['{4F2534CB-2D86-41BB-B0E8-E4C2A0253C52}']
    function get_Opacity: Double; safecall;
    procedure put_Opacity(value: Double); safecall;
    property Opacity: Double read get_Opacity write put_Opacity;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.InkDrawingAttributesKind
  // Used Types:  Windows.UI.Input.Inking.IInkDrawingAttributesPencilProperties
  }
  // Windows.UI.Input.Inking.IInkDrawingAttributes3
  IInkDrawingAttributes3 = interface(IInspectable)
  ['{72020002-7D5B-4690-8AF4-E664CBE2B74F}']
    function get_Kind: InkDrawingAttributesKind; safecall;
    function get_PencilProperties: IInkDrawingAttributesPencilProperties; safecall;
    property Kind: InkDrawingAttributesKind read get_Kind;
    property PencilProperties: IInkDrawingAttributesPencilProperties read get_PencilProperties;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.UI.Input.Inking.IInkDrawingAttributes4
  IInkDrawingAttributes4 = interface(IInspectable)
  ['{EF65DC25-9F19-456D-91A3-BC3A3D91C5FB}']
    function get_IgnoreTilt: Boolean; safecall;
    procedure put_IgnoreTilt(value: Boolean); safecall;
    property IgnoreTilt: Boolean read get_IgnoreTilt write put_IgnoreTilt;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.IInkDrawingAttributes
  }
  // Windows.UI.Input.Inking.IInkDrawingAttributesStatics
  [WinRTClassNameAttribute(SInkDrawingAttributes)]
  IInkDrawingAttributesStatics = interface(IInspectable)
  ['{F731E03F-1A65-4862-96CB-6E1665E17F6D}']
    function CreateForPencil: IInkDrawingAttributes; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Numerics.Matrix3x2
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkPoint>
  }
  // Windows.UI.Input.Inking.IInkStroke2
  IInkStroke2 = interface(IInspectable)
  ['{5DB9E4F4-BAFA-4DE1-89D3-201B1ED7D89B}']
    function get_PointTransform: Numerics_Matrix3x2; safecall;
    procedure put_PointTransform(value: Numerics_Matrix3x2); safecall;
    function GetInkPoints: IVectorView_1__IInkPoint; safecall;
    property PointTransform: Numerics_Matrix3x2 read get_PointTransform write put_PointTransform;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.DateTime>
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  }
  // Windows.UI.Input.Inking.IInkStroke3
  IInkStroke3 = interface(IInspectable)
  ['{4A807374-9499-411D-A1C4-68855D03D65F}']
    function get_Id: Cardinal; safecall;
    function get_StrokeStartedTime: IReference_1__DateTime; safecall;
    procedure put_StrokeStartedTime(value: IReference_1__DateTime); safecall;
    function get_StrokeDuration: IReference_1__TimeSpan; safecall;
    procedure put_StrokeDuration(value: IReference_1__TimeSpan); safecall;
    property Id: Cardinal read get_Id;
    property StrokeDuration: IReference_1__TimeSpan read get_StrokeDuration write put_StrokeDuration;
    property StrokeStartedTime: IReference_1__DateTime read get_StrokeStartedTime write put_StrokeStartedTime;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.IPointerPoint
  // Used Types:  Windows.UI.Input.Inking.IInkStroke
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>
  // Used Types:  Windows.UI.Input.Inking.IInkDrawingAttributes
  }
  // Windows.UI.Input.Inking.IInkStrokeBuilder
  [WinRTClassNameAttribute(SInkStrokeBuilder)]
  IInkStrokeBuilder = interface(IInspectable)
  ['{82BBD1DC-1C63-41DC-9E07-4B4A70CED801}']
    procedure BeginStroke(pointerPoint: IPointerPoint); safecall;
    function AppendToStroke(pointerPoint: IPointerPoint): IPointerPoint; safecall;
    function EndStroke(pointerPoint: IPointerPoint): IInkStroke; safecall;
    function CreateStroke(points: IIterable_1__Point): IInkStroke; safecall;
    procedure SetDefaultDrawingAttributes(drawingAttributes: IInkDrawingAttributes); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.IInkStroke
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.IInkPoint>
  // Used Types:  Windows.Foundation.Numerics.Matrix3x2
  }
  // Windows.UI.Input.Inking.IInkStrokeBuilder2
  IInkStrokeBuilder2 = interface(IInspectable)
  ['{BD82BC27-731F-4CBC-BBBF-6D468044F1E5}']
    function CreateStrokeFromInkPoints(inkPoints: IIterable_1__IInkPoint; transform: Numerics_Matrix3x2): IInkStroke; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.IInkStroke
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.IInkPoint>
  // Used Types:  Windows.Foundation.Numerics.Matrix3x2
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.DateTime>
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  }
  // Windows.UI.Input.Inking.IInkStrokeBuilder3
  IInkStrokeBuilder3 = interface(IInspectable)
  ['{B2C71FCD-5472-46B1-A81D-C37A3D169441}']
    function CreateStrokeFromInkPoints(inkPoints: IIterable_1__IInkPoint; transform: Numerics_Matrix3x2; strokeStartedTime: IReference_1__DateTime; strokeDuration: IReference_1__TimeSpan): IInkStroke; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.IInkStroke>
  }
  // Windows.UI.Input.Inking.IInkStrokeContainer2
  IInkStrokeContainer2 = interface(IInspectable)
  ['{8901D364-DA36-4BCF-9E5C-D195825995B4}']
    procedure AddStrokes(strokes: IIterable_1__IInkStroke); safecall;
    procedure Clear; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  // Used Types:  Windows.Storage.Streams.IOutputStream
  // Used Types:  Windows.UI.Input.Inking.InkPersistenceFormat
  // Used Types:  Windows.UI.Input.Inking.IInkStroke
  // Used Types:  UInt32
  }
  // Windows.UI.Input.Inking.IInkStrokeContainer3
  IInkStrokeContainer3 = interface(IInspectable)
  ['{3D07BEA5-BAEA-4C82-A719-7B83DA1067D2}']
    function SaveAsync(outputStream: IOutputStream; inkPersistenceFormat: InkPersistenceFormat): IAsyncOperationWithProgress_2__Cardinal__Cardinal; safecall;
    function GetStrokeById(id: Cardinal): IInkStroke; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.UI.Input.Inking.IInkRecognizer
  [WinRTClassNameAttribute(SInkRecognizer)]
  IInkRecognizer = interface(IInspectable)
  ['{077CCEA3-904D-442A-B151-AACA3631C43B}']
    function get_Name: HSTRING; safecall;
    property Name: HSTRING read get_Name;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkRecognitionResult>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IInkRecognitionResult_Delegate_Base = interface(IUnknown)
  ['{ECE8567F-8080-5CED-8988-BB0364C803D4}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkRecognitionResult>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkRecognitionResult>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IInkRecognitionResult = interface(AsyncOperationCompletedHandler_1__IVectorView_1__IInkRecognitionResult_Delegate_Base)
  ['{B658F05D-8BA7-5DAC-9253-FF7006750267}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__IInkRecognitionResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkRecognitionResult>>
  IAsyncOperation_1__IVectorView_1__IInkRecognitionResult_Base = interface(IInspectable)
  ['{B1923F59-D674-5365-B99A-3F1E52268C7F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkRecognitionResult>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkRecognitionResult>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkRecognitionResult>>
  IAsyncOperation_1__IVectorView_1__IInkRecognitionResult = interface(IAsyncOperation_1__IVectorView_1__IInkRecognitionResult_Base)
  ['{13D81DD7-2C81-5ADB-9106-2B3C3E6F8298}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__IInkRecognitionResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IInkRecognitionResult; safecall;
    function GetResults: IVectorView_1__IInkRecognitionResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IInkRecognitionResult read get_Completed write put_Completed;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.IInkRecognizer>
  IIterator_1__IInkRecognizer_Base = interface(IInspectable)
  ['{F8BD3097-5262-5E7A-A19D-13C029D2D7E5}']
  end;
  {
  // Used Types:  Windows.UI.Input.Inking.IInkRecognizer
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.IInkRecognizer>
  IIterator_1__IInkRecognizer = interface(IIterator_1__IInkRecognizer_Base)
  ['{28DFF88B-C687-51E7-B261-11999AA27264}']
    function get_Current: IInkRecognizer; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIInkRecognizer): Cardinal; safecall;
    property Current: IInkRecognizer read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.IInkRecognizer>
  IIterable_1__IInkRecognizer_Base = interface(IInspectable)
  ['{611B7E84-A803-5071-AAEA-4F2CE0151052}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.Input.Inking.IInkRecognizer>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.IInkRecognizer>
  IIterable_1__IInkRecognizer = interface(IIterable_1__IInkRecognizer_Base)
  ['{DAB88C7D-BE83-5950-B0EA-4B7018E046BE}']
    function First: IIterator_1__IInkRecognizer; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.IInkRecognizer
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkRecognizer>
  IVectorView_1__IInkRecognizer = interface(IInspectable)
  ['{C6A52642-FFBD-5410-ABA3-517FF9A91011}']
    function GetAt(index: Cardinal): IInkRecognizer; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IInkRecognizer; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIInkRecognizer): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.IInkRecognizer
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkRecognitionResult>>
  // Used Types:  Windows.UI.Input.Inking.IInkStrokeContainer
  // Used Types:  Windows.UI.Input.Inking.InkRecognitionTarget
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkRecognizer>
  }
  // Windows.UI.Input.Inking.IInkRecognizerContainer
  [WinRTClassNameAttribute(SInkRecognizerContainer)]
  IInkRecognizerContainer = interface(IInspectable)
  ['{A74D9A31-8047-4698-A912-F82A5085012F}']
    procedure SetDefaultRecognizer(recognizer: IInkRecognizer); safecall;
    function RecognizeAsync(strokeCollection: IInkStrokeContainer; recognitionTarget: InkRecognitionTarget): IAsyncOperation_1__IVectorView_1__IInkRecognitionResult; safecall;
    function GetRecognizers: IVectorView_1__IInkRecognizer; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.InkManipulationMode
  // Used Types:  Windows.UI.Input.IPointerPoint
  // Used Types:  Object
  // Used Types:  Windows.Foundation.Rect
  // Used Types:  Windows.UI.Input.Inking.IInkDrawingAttributes
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkRecognitionResult>>
  // Used Types:  Windows.UI.Input.Inking.InkRecognitionTarget
  }
  // Windows.UI.Input.Inking.IInkManager
  [WinRTClassNameAttribute(SInkManager)]
  IInkManager = interface(IInspectable)
  ['{4744737D-671B-4163-9C95-4E8D7A035FE1}']
    function get_Mode: InkManipulationMode; safecall;
    procedure put_Mode(value: InkManipulationMode); safecall;
    procedure ProcessPointerDown(pointerPoint: IPointerPoint); safecall;
    function ProcessPointerUpdate(pointerPoint: IPointerPoint): IInspectable; safecall;
    function ProcessPointerUp(pointerPoint: IPointerPoint): TRectF; safecall;
    procedure SetDefaultDrawingAttributes(drawingAttributes: IInkDrawingAttributes); safecall;
    function RecognizeAsync(recognitionTarget: InkRecognitionTarget): IAsyncOperation_1__IVectorView_1__IInkRecognitionResult; safecall;
    property Mode: InkManipulationMode read get_Mode write put_Mode;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Rect
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.UI.Input.Inking.IInkPoint>
  // Used Types:  Windows.UI.Input.Inking.IInkStroke
  // Used Types:  Windows.UI.Input.Inking.IInkDrawingAttributes
  // Used Types:  Windows.Foundation.Numerics.Matrix3x2
  }
  // Windows.UI.Input.Inking.Core.ICoreIncrementalInkStroke
  [WinRTClassNameAttribute(SCore_CoreIncrementalInkStroke)]
  Core_ICoreIncrementalInkStroke = interface(IInspectable)
  ['{FDA015D3-9D66-4F7D-A57F-CC70B9CFAA76}']
    function AppendInkPoints(inkPoints: IIterable_1__IInkPoint): TRectF; safecall;
    function CreateInkStroke: IInkStroke; safecall;
    function get_DrawingAttributes: IInkDrawingAttributes; safecall;
    function get_PointTransform: Numerics_Matrix3x2; safecall;
    function get_BoundingRect: TRectF; safecall;
    property BoundingRect: TRectF read get_BoundingRect;
    property DrawingAttributes: IInkDrawingAttributes read get_DrawingAttributes;
    property PointTransform: Numerics_Matrix3x2 read get_PointTransform;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Input.Inking.Core.ICoreIncrementalInkStroke
  // Used Types:  Windows.UI.Input.Inking.IInkDrawingAttributes
  // Used Types:  Windows.Foundation.Numerics.Matrix3x2
  }
  // Windows.UI.Input.Inking.Core.ICoreIncrementalInkStrokeFactory
  [WinRTClassNameAttribute(SCore_CoreIncrementalInkStroke)]
  Core_ICoreIncrementalInkStrokeFactory = interface(IInspectable)
  ['{D7C59F46-8DA8-4F70-9751-E53BB6DF4596}']
    function Create(drawingAttributes: IInkDrawingAttributes; pointTransform: Numerics_Matrix3x2): Core_ICoreIncrementalInkStroke; safecall;
  end;


  // Emit Forwarded classes
  // Windows.UI.Input.Inking.Analysis.InkAnalysisRoot
  // DualAPI
  // Implements: Windows.UI.Input.Inking.Analysis.IInkAnalysisRoot
  // Implements: Windows.UI.Input.Inking.Analysis.IInkAnalysisNode

  // Windows.UI.Input.Inking.Analysis.InkAnalysisResult
  // DualAPI
  // Implements: Windows.UI.Input.Inking.Analysis.IInkAnalysisResult

  // Windows.UI.Input.Inking.Analysis.InkAnalyzer
  // DualAPI
  // Implements: Windows.UI.Input.Inking.Analysis.IInkAnalyzer
  // Instantiable: "Analysis_IInkAnalyzer"
  TAnalysis_InkAnalyzer = class(TWinRTGenericImportI<Analysis_IInkAnalyzer>) end;

  // Windows.UI.Input.Inking.Analysis.InkAnalysisNode
  // DualAPI
  // Implements: Windows.UI.Input.Inking.Analysis.IInkAnalysisNode

  // Windows.UI.Input.Inking.Analysis.InkAnalysisWritingRegion
  // DualAPI
  // Implements: Windows.UI.Input.Inking.Analysis.IInkAnalysisWritingRegion
  // Implements: Windows.UI.Input.Inking.Analysis.IInkAnalysisNode

  // Windows.UI.Input.Inking.Analysis.InkAnalysisParagraph
  // DualAPI
  // Implements: Windows.UI.Input.Inking.Analysis.IInkAnalysisParagraph
  // Implements: Windows.UI.Input.Inking.Analysis.IInkAnalysisNode

  // Windows.UI.Input.Inking.Analysis.InkAnalysisListItem
  // DualAPI
  // Implements: Windows.UI.Input.Inking.Analysis.IInkAnalysisListItem
  // Implements: Windows.UI.Input.Inking.Analysis.IInkAnalysisNode

  // Windows.UI.Input.Inking.Analysis.InkAnalysisInkBullet
  // DualAPI
  // Implements: Windows.UI.Input.Inking.Analysis.IInkAnalysisInkBullet
  // Implements: Windows.UI.Input.Inking.Analysis.IInkAnalysisNode

  // Windows.UI.Input.Inking.Analysis.InkAnalysisLine
  // DualAPI
  // Implements: Windows.UI.Input.Inking.Analysis.IInkAnalysisLine
  // Implements: Windows.UI.Input.Inking.Analysis.IInkAnalysisNode

  // Windows.UI.Input.Inking.Analysis.InkAnalysisInkWord
  // DualAPI
  // Implements: Windows.UI.Input.Inking.Analysis.IInkAnalysisInkWord
  // Implements: Windows.UI.Input.Inking.Analysis.IInkAnalysisNode

  // Windows.UI.Input.Inking.Analysis.InkAnalysisInkDrawing
  // DualAPI
  // Implements: Windows.UI.Input.Inking.Analysis.IInkAnalysisInkDrawing
  // Implements: Windows.UI.Input.Inking.Analysis.IInkAnalysisNode

  // Windows.UI.Input.Inking.InkUnprocessedInput
  // DualAPI
  // Implements: Windows.UI.Input.Inking.IInkUnprocessedInput

  // Windows.UI.Input.Inking.InkStrokeInput
  // DualAPI
  // Implements: Windows.UI.Input.Inking.IInkStrokeInput

  // Windows.UI.Input.Inking.InkInputProcessingConfiguration
  // DualAPI
  // Implements: Windows.UI.Input.Inking.IInkInputProcessingConfiguration

  // Windows.UI.Input.Inking.InkSynchronizer
  // DualAPI
  // Implements: Windows.UI.Input.Inking.IInkSynchronizer

  // Windows.UI.Input.Inking.InkPresenter
  // DualAPI
  // Implements: Windows.UI.Input.Inking.IInkPresenter
  // Implements: Windows.UI.Input.Inking.IInkPresenter2

  // Windows.UI.Input.Inking.InkStrokesCollectedEventArgs
  // DualAPI
  // Implements: Windows.UI.Input.Inking.IInkStrokesCollectedEventArgs

  // Windows.UI.Input.Inking.InkStrokesErasedEventArgs
  // DualAPI
  // Implements: Windows.UI.Input.Inking.IInkStrokesErasedEventArgs

  // Windows.UI.Input.Inking.InkPresenterRuler
  // DualAPI
  // Implements: Windows.UI.Input.Inking.IInkPresenterRuler
  // Implements: Windows.UI.Input.Inking.IInkPresenterStencil
  // Implements: Windows.UI.Input.Inking.IInkPresenterRuler2
  // Factory: "Windows.UI.Input.Inking.IInkPresenterRulerFactory"
  TInkPresenterRuler = class(TWinRTGenericImportF<IInkPresenterRulerFactory>)
  public
    // -> IInkPresenterRulerFactory
    class function Create(inkPresenter: IInkPresenter): IInkPresenterRuler; static; inline;
  end;

  // Windows.UI.Input.Inking.InkPresenterProtractor
  // DualAPI
  // Implements: Windows.UI.Input.Inking.IInkPresenterProtractor
  // Implements: Windows.UI.Input.Inking.IInkPresenterStencil
  // Factory: "Windows.UI.Input.Inking.IInkPresenterProtractorFactory"
  TInkPresenterProtractor = class(TWinRTGenericImportF<IInkPresenterProtractorFactory>)
  public
    // -> IInkPresenterProtractorFactory
    class function Create(inkPresenter: IInkPresenter): IInkPresenterProtractor; static; inline;
  end;

  // Windows.UI.Input.Inking.Core.CoreInkIndependentInputSource
  // DualAPI
  // Implements: Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
  // Statics: "Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSourceStatics"
  TCore_CoreInkIndependentInputSource = class(TWinRTGenericImportS<Core_ICoreInkIndependentInputSourceStatics>)
  public
    // -> Core_ICoreInkIndependentInputSourceStatics
    class function Create(inkPresenter: IInkPresenter): Core_ICoreInkIndependentInputSource; static; inline;
  end;

  // Windows.UI.Input.Inking.Core.CoreWetStrokeUpdateEventArgs
  // DualAPI
  // Implements: Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs

  // Windows.UI.Input.Inking.Core.CoreWetStrokeUpdateSource
  // DualAPI
  // Implements: Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource
  // Statics: "Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSourceStatics"
  TCore_CoreWetStrokeUpdateSource = class(TWinRTGenericImportS<Core_ICoreWetStrokeUpdateSourceStatics>)
  public
    // -> Core_ICoreWetStrokeUpdateSourceStatics
    class function Create(inkPresenter: IInkPresenter): Core_ICoreWetStrokeUpdateSource; static; inline;
  end;

  // Windows.UI.Input.Inking.Core.CoreInkPresenterHost
  // DualAPI
  // Implements: Windows.UI.Input.Inking.Core.ICoreInkPresenterHost
  // Instantiable: "Core_ICoreInkPresenterHost"
  TCore_CoreInkPresenterHost = class(TWinRTGenericImportI<Core_ICoreInkPresenterHost>) end;

  // Windows.UI.Input.Inking.InkPoint
  // DualAPI
  // Implements: Windows.UI.Input.Inking.IInkPoint
  // Implements: Windows.UI.Input.Inking.IInkPoint2
  // Factory: "Windows.UI.Input.Inking.IInkPointFactory"
  // Factory: "Windows.UI.Input.Inking.IInkPointFactory2"
  TInkPoint = class(TWinRTGenericImportF2<IInkPointFactory, IInkPointFactory2>)
  public
    // -> IInkPointFactory
    class function CreateInkPoint(position: TPointF; pressure: Single): IInkPoint; static; inline;

    // -> IInkPointFactory2
    class function CreateInkPointWithTiltAndTimestamp(position: TPointF; pressure: Single; tiltX: Single; tiltY: Single; timestamp: UInt64): IInkPoint; static; inline;
  end;

  // Windows.UI.Input.Inking.InkDrawingAttributesPencilProperties
  // DualAPI
  // Implements: Windows.UI.Input.Inking.IInkDrawingAttributesPencilProperties

  // Windows.UI.Input.Inking.InkDrawingAttributes
  // DualAPI
  // Implements: Windows.UI.Input.Inking.IInkDrawingAttributes
  // Implements: Windows.UI.Input.Inking.IInkDrawingAttributes2
  // Implements: Windows.UI.Input.Inking.IInkDrawingAttributes3
  // Implements: Windows.UI.Input.Inking.IInkDrawingAttributes4
  // Statics: "Windows.UI.Input.Inking.IInkDrawingAttributesStatics"
  // Instantiable: "IInkDrawingAttributes"
  TInkDrawingAttributes = class(TWinRTGenericImportSI<IInkDrawingAttributesStatics, IInkDrawingAttributes>)
  public
    // -> IInkDrawingAttributesStatics
    class function CreateForPencil: IInkDrawingAttributes; static; inline;
  end;

  // Windows.UI.Input.Inking.InkStrokeRenderingSegment
  // DualAPI
  // Implements: Windows.UI.Input.Inking.IInkStrokeRenderingSegment

  // Windows.UI.Input.Inking.InkStroke
  // DualAPI
  // Implements: Windows.UI.Input.Inking.IInkStroke
  // Implements: Windows.UI.Input.Inking.IInkStroke2
  // Implements: Windows.UI.Input.Inking.IInkStroke3

  // Windows.UI.Input.Inking.InkStrokeBuilder
  // DualAPI
  // Implements: Windows.UI.Input.Inking.IInkStrokeBuilder
  // Implements: Windows.UI.Input.Inking.IInkStrokeBuilder2
  // Implements: Windows.UI.Input.Inking.IInkStrokeBuilder3
  // Instantiable: "IInkStrokeBuilder"
  TInkStrokeBuilder = class(TWinRTGenericImportI<IInkStrokeBuilder>) end;

  // Windows.UI.Input.Inking.InkRecognitionResult
  // DualAPI
  // Implements: Windows.UI.Input.Inking.IInkRecognitionResult

  // Windows.UI.Input.Inking.InkStrokeContainer
  // DualAPI
  // Implements: Windows.UI.Input.Inking.IInkStrokeContainer
  // Implements: Windows.UI.Input.Inking.IInkStrokeContainer2
  // Implements: Windows.UI.Input.Inking.IInkStrokeContainer3
  // Instantiable: "IInkStrokeContainer"
  TInkStrokeContainer = class(TWinRTGenericImportI<IInkStrokeContainer>) end;

  // Windows.UI.Input.Inking.InkRecognizer
  // DualAPI
  // Implements: Windows.UI.Input.Inking.IInkRecognizer

  // Windows.UI.Input.Inking.InkRecognizerContainer
  // DualAPI
  // Implements: Windows.UI.Input.Inking.IInkRecognizerContainer
  // Instantiable: "IInkRecognizerContainer"
  TInkRecognizerContainer = class(TWinRTGenericImportI<IInkRecognizerContainer>) end;

  // Windows.UI.Input.Inking.InkManager
  // DualAPI
  // Implements: Windows.UI.Input.Inking.IInkManager
  // Implements: Windows.UI.Input.Inking.IInkRecognizerContainer
  // Implements: Windows.UI.Input.Inking.IInkStrokeContainer
  // Instantiable: "IInkManager"
  TInkManager = class(TWinRTGenericImportI<IInkManager>) end;

  // Windows.UI.Input.Inking.Core.CoreIncrementalInkStroke
  // DualAPI
  // Implements: Windows.UI.Input.Inking.Core.ICoreIncrementalInkStroke
  // Factory: "Windows.UI.Input.Inking.Core.ICoreIncrementalInkStrokeFactory"
  TCore_CoreIncrementalInkStroke = class(TWinRTGenericImportF<Core_ICoreIncrementalInkStrokeFactory>)
  public
    // -> Core_ICoreIncrementalInkStrokeFactory
    class function Create(drawingAttributes: IInkDrawingAttributes; pointTransform: Numerics_Matrix3x2): Core_ICoreIncrementalInkStroke; static; inline;
  end;


implementation

  // Emit Classes Implementation
 { TAnalysis_InkAnalyzer }

 { TInkPresenterRuler }
// Factories for : "InkPresenterRuler"
// Factory: "Windows.UI.Input.Inking.IInkPresenterRulerFactory"
// -> IInkPresenterRulerFactory

class function TInkPresenterRuler.Create(inkPresenter: IInkPresenter): IInkPresenterRuler;
begin
  Result := Factory.Create(inkPresenter);
end;


 { TInkPresenterProtractor }
// Factories for : "InkPresenterProtractor"
// Factory: "Windows.UI.Input.Inking.IInkPresenterProtractorFactory"
// -> IInkPresenterProtractorFactory

class function TInkPresenterProtractor.Create(inkPresenter: IInkPresenter): IInkPresenterProtractor;
begin
  Result := Factory.Create(inkPresenter);
end;


 { TCore_CoreInkIndependentInputSource }

class function TCore_CoreInkIndependentInputSource.Create(inkPresenter: IInkPresenter): Core_ICoreInkIndependentInputSource;
begin
  Result := Statics.Create(inkPresenter);
end;


 { TCore_CoreWetStrokeUpdateSource }

class function TCore_CoreWetStrokeUpdateSource.Create(inkPresenter: IInkPresenter): Core_ICoreWetStrokeUpdateSource;
begin
  Result := Statics.Create(inkPresenter);
end;


 { TCore_CoreInkPresenterHost }

 { TInkPoint }
// Factories for : "InkPoint"
// Factory: "Windows.UI.Input.Inking.IInkPointFactory"
// -> IInkPointFactory

class function TInkPoint.CreateInkPoint(position: TPointF; pressure: Single): IInkPoint;
begin
  Result := Factory.CreateInkPoint(position, pressure);
end;

// Factory: "Windows.UI.Input.Inking.IInkPointFactory2"
// -> IInkPointFactory2

class function TInkPoint.CreateInkPointWithTiltAndTimestamp(position: TPointF; pressure: Single; tiltX: Single; tiltY: Single; timestamp: UInt64): IInkPoint;
begin
  Result := Factory2.CreateInkPointWithTiltAndTimestamp(position, pressure, tiltX, tiltY, timestamp);
end;


 { TInkDrawingAttributes }

class function TInkDrawingAttributes.CreateForPencil: IInkDrawingAttributes;
begin
  Result := Statics.CreateForPencil;
end;


 { TInkStrokeBuilder }

 { TInkStrokeContainer }

 { TInkRecognizerContainer }

 { TInkManager }

 { TCore_CoreIncrementalInkStroke }
// Factories for : "Core_CoreIncrementalInkStroke"
// Factory: "Windows.UI.Input.Inking.Core.ICoreIncrementalInkStrokeFactory"
// -> Core_ICoreIncrementalInkStrokeFactory

class function TCore_CoreIncrementalInkStroke.Create(drawingAttributes: IInkDrawingAttributes; pointTransform: Numerics_Matrix3x2): Core_ICoreIncrementalInkStroke;
begin
  Result := Factory.Create(drawingAttributes, pointTransform);
end;



end.
