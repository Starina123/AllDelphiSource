{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.UI.Xaml;

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses 
  Winapi.Winrt, 
  System.Types, 
  System.Win.WinRT, 
  Winapi.CommonTypes, 
  Winapi.Foundation, 
  Winapi.GraphicsRT, 
  Winapi.ApplicationModel, 
  Winapi.Media, 
  Winapi.ServicesRT, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.Foundation.IReference`1<Windows.UI.Color>
  IReference_1__Color = interface;
  PIReference_1__Color = ^IReference_1__Color;

  // Windows.UI.Xaml.CreateDefaultValueCallback
  CreateDefaultValueCallback = interface;
  PCreateDefaultValueCallback = ^CreateDefaultValueCallback;

  // Windows.UI.Xaml.Controls.IIconSourceFactory
  Controls_IIconSourceFactory = interface;
  PControls_IIconSourceFactory = ^Controls_IIconSourceFactory;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,Object>
  IKeyValuePair_2__HSTRING__IInspectable = interface;
  PIKeyValuePair_2__HSTRING__IInspectable = ^IKeyValuePair_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterator_1__IKeyValuePair_2__HSTRING__IInspectable = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__IInspectable = ^IIterator_1__IKeyValuePair_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterable_1__IKeyValuePair_2__HSTRING__IInspectable = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__IInspectable = ^IIterable_1__IKeyValuePair_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IMapView`2<String,Object>
  IMapView_2__HSTRING__IInspectable = interface;
  PIMapView_2__HSTRING__IInspectable = ^IMapView_2__HSTRING__IInspectable;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationProgressHandler_2__IBuffer__Cardinal = interface;
  PAsyncOperationProgressHandler_2__IBuffer__Cardinal = ^AsyncOperationProgressHandler_2__IBuffer__Cardinal;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal = interface;
  PAsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal = ^AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt32>
  IAsyncOperationWithProgress_2__IBuffer__Cardinal = interface;
  PIAsyncOperationWithProgress_2__IBuffer__Cardinal = ^IAsyncOperationWithProgress_2__IBuffer__Cardinal;

  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt32,UInt32>
  AsyncOperationProgressHandler_2__Cardinal__Cardinal = interface;
  PAsyncOperationProgressHandler_2__Cardinal__Cardinal = ^AsyncOperationProgressHandler_2__Cardinal__Cardinal;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt32,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = interface;
  PAsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = ^AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal;

  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  IAsyncOperationWithProgress_2__Cardinal__Cardinal = interface;
  PIAsyncOperationWithProgress_2__Cardinal__Cardinal = ^IAsyncOperationWithProgress_2__Cardinal__Cardinal;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  AsyncOperationCompletedHandler_1__Boolean = interface;
  PAsyncOperationCompletedHandler_1__Boolean = ^AsyncOperationCompletedHandler_1__Boolean;

  // Windows.Foundation.IAsyncOperation`1<Boolean>
  IAsyncOperation_1__Boolean = interface;
  PIAsyncOperation_1__Boolean = ^IAsyncOperation_1__Boolean;

  // Windows.Foundation.Collections.IIterator`1<String>
  IIterator_1__HSTRING = interface;
  PIIterator_1__HSTRING = ^IIterator_1__HSTRING;

  // Windows.Foundation.Collections.IIterable`1<String>
  IIterable_1__HSTRING = interface;
  PIIterable_1__HSTRING = ^IIterable_1__HSTRING;

  // Windows.Foundation.Collections.IVectorView`1<String>
  IVectorView_1__HSTRING = interface;
  PIVectorView_1__HSTRING = ^IVectorView_1__HSTRING;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Object>
  AsyncOperationCompletedHandler_1__IInspectable = interface;
  PAsyncOperationCompletedHandler_1__IInspectable = ^AsyncOperationCompletedHandler_1__IInspectable;

  // Windows.Foundation.IAsyncOperation`1<Object>
  IAsyncOperation_1__IInspectable = interface;
  PIAsyncOperation_1__IInspectable = ^IAsyncOperation_1__IInspectable;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<String>
  AsyncOperationCompletedHandler_1__HSTRING = interface;
  PAsyncOperationCompletedHandler_1__HSTRING = ^AsyncOperationCompletedHandler_1__HSTRING;

  // Windows.Foundation.IAsyncOperation`1<String>
  IAsyncOperation_1__HSTRING = interface;
  PIAsyncOperation_1__HSTRING = ^IAsyncOperation_1__HSTRING;

  // Windows.Foundation.Collections.IMap`2<String,Object>
  IMap_2__HSTRING__IInspectable = interface;
  PIMap_2__HSTRING__IInspectable = ^IMap_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IVector`1<String>
  IVector_1__HSTRING = interface;
  PIVector_1__HSTRING = ^IVector_1__HSTRING;

  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataPackage,Object>
  TypedEventHandler_2__IDataPackage__IInspectable = interface;
  PTypedEventHandler_2__IDataPackage__IInspectable = ^TypedEventHandler_2__IDataPackage__IInspectable;

  // Windows.Foundation.Collections.IIterator`1<Object>
  IIterator_1__IInspectable = interface;
  PIIterator_1__IInspectable = ^IIterator_1__IInspectable;

  // Windows.Foundation.Collections.IIterable`1<Object>
  IIterable_1__IInspectable = interface;
  PIIterable_1__IInspectable = ^IIterable_1__IInspectable;

  // Windows.Foundation.Collections.IVectorView`1<Object>
  IVectorView_1__IInspectable = interface;
  PIVectorView_1__IInspectable = ^IVectorView_1__IInspectable;

  // Windows.Foundation.Collections.IVector`1<Object>
  IVector_1__IInspectable = interface;
  PIVector_1__IInspectable = ^IVector_1__IInspectable;

  // Windows.UI.Xaml.Controls.INavigationViewItemBaseFactory
  Controls_INavigationViewItemBaseFactory = interface;
  PControls_INavigationViewItemBaseFactory = ^Controls_INavigationViewItemBaseFactory;

  // Windows.Foundation.EventHandler`1<Object>
  EventHandler_1__IInspectable = interface;
  PEventHandler_1__IInspectable = ^EventHandler_1__IInspectable;

  // Windows.UI.Xaml.Input.ICommand
  Input_ICommand = interface;
  PInput_ICommand = ^Input_ICommand;

  // Windows.UI.Xaml.Interop.IBindableIterator
  Interop_IBindableIterator = interface;
  PInterop_IBindableIterator = ^Interop_IBindableIterator;

  // Windows.UI.Xaml.Interop.IBindableIterable
  Interop_IBindableIterable = interface;
  PInterop_IBindableIterable = ^Interop_IBindableIterable;

  // Windows.UI.Xaml.Interop.IBindableVectorView
  Interop_IBindableVectorView = interface;
  PInterop_IBindableVectorView = ^Interop_IBindableVectorView;

  // Windows.UI.Xaml.Interop.IBindableVector
  Interop_IBindableVector = interface;
  PInterop_IBindableVector = ^Interop_IBindableVector;

  // Windows.UI.Xaml.Interop.IBindableObservableVector
  Interop_IBindableObservableVector = interface;
  PInterop_IBindableObservableVector = ^Interop_IBindableObservableVector;

  // Windows.UI.Xaml.Interop.BindableVectorChangedEventHandler
  Interop_BindableVectorChangedEventHandler = interface;
  PInterop_BindableVectorChangedEventHandler = ^Interop_BindableVectorChangedEventHandler;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.UI.Xaml.Data.LoadMoreItemsResult>
  AsyncOperationCompletedHandler_1__Data_LoadMoreItemsResult = interface;
  PAsyncOperationCompletedHandler_1__Data_LoadMoreItemsResult = ^AsyncOperationCompletedHandler_1__Data_LoadMoreItemsResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.UI.Xaml.Data.LoadMoreItemsResult>
  IAsyncOperation_1__Data_LoadMoreItemsResult = interface;
  PIAsyncOperation_1__Data_LoadMoreItemsResult = ^IAsyncOperation_1__Data_LoadMoreItemsResult;

  // Windows.Foundation.Collections.IKeyValuePair`2<Object,Object>
  IKeyValuePair_2__IInspectable__IInspectable = interface;
  PIKeyValuePair_2__IInspectable__IInspectable = ^IKeyValuePair_2__IInspectable__IInspectable;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<Object,Object>>
  IIterator_1__IKeyValuePair_2__IInspectable__IInspectable = interface;
  PIIterator_1__IKeyValuePair_2__IInspectable__IInspectable = ^IIterator_1__IKeyValuePair_2__IInspectable__IInspectable;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<Object,Object>>
  IIterable_1__IKeyValuePair_2__IInspectable__IInspectable = interface;
  PIIterable_1__IKeyValuePair_2__IInspectable__IInspectable = ^IIterable_1__IKeyValuePair_2__IInspectable__IInspectable;

  // Windows.Foundation.Collections.IMapView`2<Object,Object>
  IMapView_2__IInspectable__IInspectable = interface;
  PIMapView_2__IInspectable__IInspectable = ^IMapView_2__IInspectable__IInspectable;

  // Windows.Foundation.Collections.IMap`2<Object,Object>
  IMap_2__IInspectable__IInspectable = interface;
  PIMap_2__IInspectable__IInspectable = ^IMap_2__IInspectable__IInspectable;

  // Windows.Foundation.Collections.IMapChangedEventArgs`1<String>
  IMapChangedEventArgs_1__HSTRING = interface;
  PIMapChangedEventArgs_1__HSTRING = ^IMapChangedEventArgs_1__HSTRING;

  // Windows.Foundation.Collections.MapChangedEventHandler`2<String,Object>
  MapChangedEventHandler_2__HSTRING__IInspectable = interface;
  PMapChangedEventHandler_2__HSTRING__IInspectable = ^MapChangedEventHandler_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IObservableMap`2<String,Object>
  IObservableMap_2__HSTRING__IInspectable = interface;
  PIObservableMap_2__HSTRING__IInspectable = ^IObservableMap_2__HSTRING__IInspectable;

  // Windows.UI.Xaml.WindowActivatedEventHandler
  WindowActivatedEventHandler = interface;
  PWindowActivatedEventHandler = ^WindowActivatedEventHandler;

  // Windows.UI.Xaml.WindowClosedEventHandler
  WindowClosedEventHandler = interface;
  PWindowClosedEventHandler = ^WindowClosedEventHandler;

  // Windows.UI.Xaml.WindowSizeChangedEventHandler
  WindowSizeChangedEventHandler = interface;
  PWindowSizeChangedEventHandler = ^WindowSizeChangedEventHandler;

  // Windows.UI.Xaml.WindowVisibilityChangedEventHandler
  WindowVisibilityChangedEventHandler = interface;
  PWindowVisibilityChangedEventHandler = ^WindowVisibilityChangedEventHandler;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Xaml.Documents.TextRange>
  IIterator_1__Documents_TextRange = interface;
  PIIterator_1__Documents_TextRange = ^IIterator_1__Documents_TextRange;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Xaml.Documents.TextRange>
  IIterable_1__Documents_TextRange = interface;
  PIIterable_1__Documents_TextRange = ^IIterable_1__Documents_TextRange;

  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Xaml.Documents.TextRange>
  IVectorView_1__Documents_TextRange = interface;
  PIVectorView_1__Documents_TextRange = ^IVectorView_1__Documents_TextRange;

  // Windows.Foundation.Collections.IVector`1<Windows.UI.Xaml.Documents.TextRange>
  IVector_1__Documents_TextRange = interface;
  PIVector_1__Documents_TextRange = ^IVector_1__Documents_TextRange;

  // Windows.UI.Xaml.Documents.ITextElementFactory
  Documents_ITextElementFactory = interface;
  PDocuments_ITextElementFactory = ^Documents_ITextElementFactory;

  // Windows.UI.Xaml.Documents.ITextHighlighterBaseFactory
  Documents_ITextHighlighterBaseFactory = interface;
  PDocuments_ITextHighlighterBaseFactory = ^Documents_ITextHighlighterBaseFactory;

  // Windows.Foundation.IReference`1<Int32>
  IReference_1__Integer = interface;
  PIReference_1__Integer = ^IReference_1__Integer;

  // Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>
  IKeyValuePair_2__TGuid__IInspectable = interface;
  PIKeyValuePair_2__TGuid__IInspectable = ^IKeyValuePair_2__TGuid__IInspectable;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>>
  IIterator_1__IKeyValuePair_2__TGuid__IInspectable = interface;
  PIIterator_1__IKeyValuePair_2__TGuid__IInspectable = ^IIterator_1__IKeyValuePair_2__TGuid__IInspectable;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>>
  IIterable_1__IKeyValuePair_2__TGuid__IInspectable = interface;
  PIIterable_1__IKeyValuePair_2__TGuid__IInspectable = ^IIterable_1__IKeyValuePair_2__TGuid__IInspectable;

  // Windows.Foundation.Collections.IMapView`2<Guid,Object>
  IMapView_2__TGuid__IInspectable = interface;
  PIMapView_2__TGuid__IInspectable = ^IMapView_2__TGuid__IInspectable;

  // Windows.Foundation.Collections.IMap`2<Guid,Object>
  IMap_2__TGuid__IInspectable = interface;
  PIMap_2__TGuid__IInspectable = ^IMap_2__TGuid__IInspectable;

  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Object>
  VectorChangedEventHandler_1__IInspectable = interface;
  PVectorChangedEventHandler_1__IInspectable = ^VectorChangedEventHandler_1__IInspectable;

  // Windows.Foundation.Collections.IObservableVector`1<Object>
  IObservableVector_1__IInspectable = interface;
  PIObservableVector_1__IInspectable = ^IObservableVector_1__IInspectable;

  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.UI.Xaml.Controls.IGroupStyle>
  VectorChangedEventHandler_1__Controls_IGroupStyle = interface;
  PVectorChangedEventHandler_1__Controls_IGroupStyle = ^VectorChangedEventHandler_1__Controls_IGroupStyle;

  // Windows.Foundation.Collections.IObservableVector`1<Windows.UI.Xaml.Controls.IGroupStyle>
  IObservableVector_1__Controls_IGroupStyle = interface;
  PIObservableVector_1__Controls_IGroupStyle = ^IObservableVector_1__Controls_IGroupStyle;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<String>>
  AsyncOperationCompletedHandler_1__IVectorView_1__HSTRING = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__HSTRING = ^AsyncOperationCompletedHandler_1__IVectorView_1__HSTRING;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<String>>
  IAsyncOperation_1__IVectorView_1__HSTRING = interface;
  PIAsyncOperation_1__IVectorView_1__HSTRING = ^IAsyncOperation_1__IVectorView_1__HSTRING;

  // Windows.UI.Xaml.Controls.IVirtualizingPanelFactory
  Controls_IVirtualizingPanelFactory = interface;
  PControls_IVirtualizingPanelFactory = ^Controls_IVirtualizingPanelFactory;

  // Windows.UI.Xaml.Controls.IListViewBaseHeaderItemFactory
  Controls_IListViewBaseHeaderItemFactory = interface;
  PControls_IListViewBaseHeaderItemFactory = ^Controls_IListViewBaseHeaderItemFactory;

  // Windows.Foundation.Collections.IIterator`1<Single>
  IIterator_1__Single = interface;
  PIIterator_1__Single = ^IIterator_1__Single;

  // Windows.Foundation.Collections.IIterable`1<Single>
  IIterable_1__Single = interface;
  PIIterable_1__Single = ^IIterable_1__Single;

  // Windows.Foundation.Collections.IVectorView`1<Single>
  IVectorView_1__Single = interface;
  PIVectorView_1__Single = ^IVectorView_1__Single;

  // Windows.UI.Xaml.Controls.Primitives.IOrientedVirtualizingPanelFactory
  Controls_Primitives_IOrientedVirtualizingPanelFactory = interface;
  PControls_Primitives_IOrientedVirtualizingPanelFactory = ^Controls_Primitives_IOrientedVirtualizingPanelFactory;

  // Windows.Foundation.IReference`1<Boolean>
  IReference_1__Boolean = interface;
  PIReference_1__Boolean = ^IReference_1__Boolean;

  // Windows.UI.Xaml.Controls.Primitives.ISelectorFactory
  Controls_Primitives_ISelectorFactory = interface;
  PControls_Primitives_ISelectorFactory = ^Controls_Primitives_ISelectorFactory;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Color>
  IIterator_1__Color = interface;
  PIIterator_1__Color = ^IIterator_1__Color;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Color>
  IIterable_1__Color = interface;
  PIIterable_1__Color = ^IIterable_1__Color;

  // Windows.UI.Xaml.Controls.ListViewItemToKeyHandler
  Controls_ListViewItemToKeyHandler = interface;
  PControls_ListViewItemToKeyHandler = ^Controls_ListViewItemToKeyHandler;

  // Windows.UI.Xaml.Controls.ListViewKeyToItemHandler
  Controls_ListViewKeyToItemHandler = interface;
  PControls_ListViewKeyToItemHandler = ^Controls_ListViewKeyToItemHandler;

  // Windows.UI.Xaml.Controls.ISectionsInViewChangedEventArgsFactory
  Controls_ISectionsInViewChangedEventArgsFactory = interface;
  PControls_ISectionsInViewChangedEventArgsFactory = ^Controls_ISectionsInViewChangedEventArgsFactory;

  // Windows.UI.Xaml.Controls.IIconElementFactory
  Controls_IIconElementFactory = interface;
  PControls_IIconElementFactory = ^Controls_IIconElementFactory;

  // Windows.Foundation.AsyncActionProgressHandler`1<UInt64>
  AsyncActionProgressHandler_1__UInt64 = interface;
  PAsyncActionProgressHandler_1__UInt64 = ^AsyncActionProgressHandler_1__UInt64;

  // Windows.Foundation.AsyncActionWithProgressCompletedHandler`1<UInt64>
  AsyncActionWithProgressCompletedHandler_1__UInt64 = interface;
  PAsyncActionWithProgressCompletedHandler_1__UInt64 = ^AsyncActionWithProgressCompletedHandler_1__UInt64;

  // Windows.Foundation.IAsyncActionWithProgress`1<UInt64>
  IAsyncActionWithProgress_1__UInt64 = interface;
  PIAsyncActionWithProgress_1__UInt64 = ^IAsyncActionWithProgress_1__UInt64;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlayer,Object>
  TypedEventHandler_2__Playback_IMediaPlayer__IInspectable = interface;
  PTypedEventHandler_2__Playback_IMediaPlayer__IInspectable = ^TypedEventHandler_2__Playback_IMediaPlayer__IInspectable;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,String>
  IKeyValuePair_2__HSTRING__HSTRING = interface;
  PIKeyValuePair_2__HSTRING__HSTRING = ^IKeyValuePair_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterator_1__IKeyValuePair_2__HSTRING__HSTRING = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__HSTRING = ^IIterator_1__IKeyValuePair_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterable_1__IKeyValuePair_2__HSTRING__HSTRING = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__HSTRING = ^IIterable_1__IKeyValuePair_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.IMapView`2<String,String>
  IMapView_2__HSTRING__HSTRING = interface;
  PIMapView_2__HSTRING__HSTRING = ^IMapView_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.IMap`2<String,String>
  IMap_2__HSTRING__HSTRING = interface;
  PIMap_2__HSTRING__HSTRING = ^IMap_2__HSTRING__HSTRING;

  // Windows.Foundation.IReference`1<UInt64>
  IReference_1__UInt64 = interface;
  PIReference_1__UInt64 = ^IReference_1__UInt64;

  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt64,UInt64>
  AsyncOperationProgressHandler_2__UInt64__UInt64 = interface;
  PAsyncOperationProgressHandler_2__UInt64__UInt64 = ^AsyncOperationProgressHandler_2__UInt64__UInt64;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt64,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64 = interface;
  PAsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64 = ^AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64;

  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt64,UInt64>
  IAsyncOperationWithProgress_2__UInt64__UInt64 = interface;
  PIAsyncOperationWithProgress_2__UInt64__UInt64 = ^IAsyncOperationWithProgress_2__UInt64__UInt64;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  AsyncOperationProgressHandler_2__IBuffer__UInt64 = interface;
  PAsyncOperationProgressHandler_2__IBuffer__UInt64 = ^AsyncOperationProgressHandler_2__IBuffer__UInt64;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64 = interface;
  PAsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64 = ^AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt64>
  IAsyncOperationWithProgress_2__IBuffer__UInt64 = interface;
  PIAsyncOperationWithProgress_2__IBuffer__UInt64 = ^IAsyncOperationWithProgress_2__IBuffer__UInt64;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  AsyncOperationProgressHandler_2__IInputStream__UInt64 = interface;
  PAsyncOperationProgressHandler_2__IInputStream__UInt64 = ^AsyncOperationProgressHandler_2__IInputStream__UInt64;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64 = interface;
  PAsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64 = ^AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,UInt64>
  IAsyncOperationWithProgress_2__IInputStream__UInt64 = interface;
  PIAsyncOperationWithProgress_2__IInputStream__UInt64 = ^IAsyncOperationWithProgress_2__IInputStream__UInt64;

  // Windows.Foundation.AsyncOperationProgressHandler`2<String,UInt64>
  AsyncOperationProgressHandler_2__HSTRING__UInt64 = interface;
  PAsyncOperationProgressHandler_2__HSTRING__UInt64 = ^AsyncOperationProgressHandler_2__HSTRING__UInt64;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<String,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64 = interface;
  PAsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64 = ^AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64;

  // Windows.Foundation.IAsyncOperationWithProgress`2<String,UInt64>
  IAsyncOperationWithProgress_2__HSTRING__UInt64 = interface;
  PIAsyncOperationWithProgress_2__HSTRING__UInt64 = ^IAsyncOperationWithProgress_2__HSTRING__UInt64;

  // Windows.Foundation.IReference`1<Double>
  IReference_1__Double = interface;
  PIReference_1__Double = ^IReference_1__Double;

  // Windows.Foundation.IReference`1<UInt32>
  IReference_1__Cardinal = interface;
  PIReference_1__Cardinal = ^IReference_1__Cardinal;

  // Windows.Foundation.IReference`1<UInt8>
  IReference_1__Byte = interface;
  PIReference_1__Byte = ^IReference_1__Byte;

  // Windows.UI.Xaml.Controls.IMenuFlyoutItemBaseFactory
  Controls_IMenuFlyoutItemBaseFactory = interface;
  PControls_IMenuFlyoutItemBaseFactory = ^Controls_IMenuFlyoutItemBaseFactory;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.UI.Xaml.Controls.ContentDialogResult>
  AsyncOperationCompletedHandler_1__Controls_ContentDialogResult = interface;
  PAsyncOperationCompletedHandler_1__Controls_ContentDialogResult = ^AsyncOperationCompletedHandler_1__Controls_ContentDialogResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.UI.Xaml.Controls.ContentDialogResult>
  IAsyncOperation_1__Controls_ContentDialogResult = interface;
  PIAsyncOperation_1__Controls_ContentDialogResult = ^IAsyncOperation_1__Controls_ContentDialogResult;

  // Windows.Foundation.Collections.IVector`1<Single>
  IVector_1__Single = interface;
  PIVector_1__Single = ^IVector_1__Single;

  // Windows.Foundation.IReference`1<Single>
  IReference_1__Single = interface;
  PIReference_1__Single = ^IReference_1__Single;

  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.UI.Xaml.Controls.ICommandBarElement>
  VectorChangedEventHandler_1__Controls_ICommandBarElement = interface;
  PVectorChangedEventHandler_1__Controls_ICommandBarElement = ^VectorChangedEventHandler_1__Controls_ICommandBarElement;

  // Windows.Foundation.Collections.IObservableVector`1<Windows.UI.Xaml.Controls.ICommandBarElement>
  IObservableVector_1__Controls_ICommandBarElement = interface;
  PIObservableVector_1__Controls_ICommandBarElement = ^IObservableVector_1__Controls_ICommandBarElement;

  // Windows.Foundation.TypedEventHandler`2<Windows.Foundation.IMemoryBufferReference,Object>
  TypedEventHandler_2__IMemoryBufferReference__IInspectable = interface;
  PTypedEventHandler_2__IMemoryBufferReference__IInspectable = ^TypedEventHandler_2__IMemoryBufferReference__IInspectable;

  // Windows.UI.Xaml.IExceptionRoutedEventArgsFactory
  IExceptionRoutedEventArgsFactory = interface;
  PIExceptionRoutedEventArgsFactory = ^IExceptionRoutedEventArgsFactory;

  // Windows.UI.Xaml.ISetterBaseFactory
  ISetterBaseFactory = interface;
  PISetterBaseFactory = ^ISetterBaseFactory;

  // Windows.UI.Xaml.ITriggerActionFactory
  ITriggerActionFactory = interface;
  PITriggerActionFactory = ^ITriggerActionFactory;

  // Windows.UI.Xaml.ITriggerBaseFactory
  ITriggerBaseFactory = interface;
  PITriggerBaseFactory = ^ITriggerBaseFactory;

  // Windows.UI.Xaml.IUIElementFactory
  IUIElementFactory = interface;
  PIUIElementFactory = ^IUIElementFactory;

  // Windows.UI.Xaml.Media.IGeometryFactory
  Media_IGeometryFactory = interface;
  PMedia_IGeometryFactory = ^Media_IGeometryFactory;

  // Windows.UI.Xaml.Media.IImageSourceFactory
  Media_IImageSourceFactory = interface;
  PMedia_IImageSourceFactory = ^Media_IImageSourceFactory;

  // Windows.UI.Xaml.Media.IPathSegmentFactory
  Media_IPathSegmentFactory = interface;
  PMedia_IPathSegmentFactory = ^Media_IPathSegmentFactory;

  // Windows.UI.Xaml.Media.ITransformFactory
  Media_ITransformFactory = interface;
  PMedia_ITransformFactory = ^Media_ITransformFactory;

  // Windows.UI.Xaml.Media.Animation.IEasingFunctionBaseFactory
  Media_Animation_IEasingFunctionBaseFactory = interface;
  PMedia_Animation_IEasingFunctionBaseFactory = ^Media_Animation_IEasingFunctionBaseFactory;

  // Windows.UI.Xaml.Media.Animation.ITransitionFactory
  Media_Animation_ITransitionFactory = interface;
  PMedia_Animation_ITransitionFactory = ^Media_Animation_ITransitionFactory;

  // Windows.Foundation.TypedEventHandler`2<Object,Object>
  TypedEventHandler_2__IInspectable__IInspectable = interface;
  PTypedEventHandler_2__IInspectable__IInspectable = ^TypedEventHandler_2__IInspectable__IInspectable;

  // Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
  Automation_Provider_IIRawElementProviderSimple = interface;
  PAutomation_Provider_IIRawElementProviderSimple = ^Automation_Provider_IIRawElementProviderSimple;

  // Windows.UI.Xaml.Automation.Provider.IAnnotationProvider
  Automation_Provider_IAnnotationProvider = interface;
  PAutomation_Provider_IAnnotationProvider = ^Automation_Provider_IAnnotationProvider;

  // Windows.UI.Xaml.Automation.Provider.IDockProvider
  Automation_Provider_IDockProvider = interface;
  PAutomation_Provider_IDockProvider = ^Automation_Provider_IDockProvider;

  // Windows.UI.Xaml.Automation.Provider.IDragProvider
  Automation_Provider_IDragProvider = interface;
  PAutomation_Provider_IDragProvider = ^Automation_Provider_IDragProvider;

  // Windows.UI.Xaml.Automation.Provider.IGridItemProvider
  Automation_Provider_IGridItemProvider = interface;
  PAutomation_Provider_IGridItemProvider = ^Automation_Provider_IGridItemProvider;

  // Windows.UI.Xaml.Automation.Provider.IGridProvider
  Automation_Provider_IGridProvider = interface;
  PAutomation_Provider_IGridProvider = ^Automation_Provider_IGridProvider;

  // Windows.UI.Xaml.Automation.Provider.IMultipleViewProvider
  Automation_Provider_IMultipleViewProvider = interface;
  PAutomation_Provider_IMultipleViewProvider = ^Automation_Provider_IMultipleViewProvider;

  // Windows.UI.Xaml.Automation.Provider.IObjectModelProvider
  Automation_Provider_IObjectModelProvider = interface;
  PAutomation_Provider_IObjectModelProvider = ^Automation_Provider_IObjectModelProvider;

  // Windows.UI.Xaml.Automation.Provider.ISpreadsheetItemProvider
  Automation_Provider_ISpreadsheetItemProvider = interface;
  PAutomation_Provider_ISpreadsheetItemProvider = ^Automation_Provider_ISpreadsheetItemProvider;

  // Windows.UI.Xaml.Automation.Provider.ISpreadsheetProvider
  Automation_Provider_ISpreadsheetProvider = interface;
  PAutomation_Provider_ISpreadsheetProvider = ^Automation_Provider_ISpreadsheetProvider;

  // Windows.UI.Xaml.Automation.Provider.IStylesProvider
  Automation_Provider_IStylesProvider = interface;
  PAutomation_Provider_IStylesProvider = ^Automation_Provider_IStylesProvider;

  // Windows.UI.Xaml.Automation.Provider.ISynchronizedInputProvider
  Automation_Provider_ISynchronizedInputProvider = interface;
  PAutomation_Provider_ISynchronizedInputProvider = ^Automation_Provider_ISynchronizedInputProvider;

  // Windows.UI.Xaml.Automation.Provider.ITableItemProvider
  Automation_Provider_ITableItemProvider = interface;
  PAutomation_Provider_ITableItemProvider = ^Automation_Provider_ITableItemProvider;

  // Windows.UI.Xaml.Automation.Provider.ITableProvider
  Automation_Provider_ITableProvider = interface;
  PAutomation_Provider_ITableProvider = ^Automation_Provider_ITableProvider;

  // Windows.UI.Xaml.Automation.Provider.ITextRangeProvider
  Automation_Provider_ITextRangeProvider = interface;
  PAutomation_Provider_ITextRangeProvider = ^Automation_Provider_ITextRangeProvider;

  // Windows.UI.Xaml.Automation.Provider.ITextChildProvider
  Automation_Provider_ITextChildProvider = interface;
  PAutomation_Provider_ITextChildProvider = ^Automation_Provider_ITextChildProvider;

  // Windows.UI.Xaml.Automation.Provider.ITextProvider
  Automation_Provider_ITextProvider = interface;
  PAutomation_Provider_ITextProvider = ^Automation_Provider_ITextProvider;

  // Windows.UI.Xaml.Automation.Provider.ITextProvider2
  Automation_Provider_ITextProvider2 = interface;
  PAutomation_Provider_ITextProvider2 = ^Automation_Provider_ITextProvider2;

  // Windows.UI.Xaml.Automation.Provider.ITextRangeProvider2
  Automation_Provider_ITextRangeProvider2 = interface;
  PAutomation_Provider_ITextRangeProvider2 = ^Automation_Provider_ITextRangeProvider2;

  // Windows.UI.Xaml.Data.ICustomProperty
  Data_ICustomProperty = interface;
  PData_ICustomProperty = ^Data_ICustomProperty;

  // Windows.UI.Xaml.Data.ISupportIncrementalLoading
  Data_ISupportIncrementalLoading = interface;
  PData_ISupportIncrementalLoading = ^Data_ISupportIncrementalLoading;

  // Windows.UI.Xaml.Data.IBindingExpressionBaseFactory
  Data_IBindingExpressionBaseFactory = interface;
  PData_IBindingExpressionBaseFactory = ^Data_IBindingExpressionBaseFactory;

  // Windows.UI.Xaml.Data.IBindingExpressionFactory
  Data_IBindingExpressionFactory = interface;
  PData_IBindingExpressionFactory = ^Data_IBindingExpressionFactory;

  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.Activation.ISplashScreen,Object>
  TypedEventHandler_2__Activation_ISplashScreen__IInspectable = interface;
  PTypedEventHandler_2__Activation_ISplashScreen__IInspectable = ^TypedEventHandler_2__Activation_ISplashScreen__IInspectable;

  // Windows.Foundation.Collections.IIterator`1<Double>
  IIterator_1__Double = interface;
  PIIterator_1__Double = ^IIterator_1__Double;

  // Windows.Foundation.Collections.IIterable`1<Double>
  IIterable_1__Double = interface;
  PIIterable_1__Double = ^IIterable_1__Double;

  // Windows.Foundation.Collections.IVectorView`1<Double>
  IVectorView_1__Double = interface;
  PIVectorView_1__Double = ^IVectorView_1__Double;

  // Windows.Foundation.Collections.IVector`1<Double>
  IVector_1__Double = interface;
  PIVector_1__Double = ^IVector_1__Double;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.UI.Xaml.Media.Imaging.SvgImageSourceLoadStatus>
  AsyncOperationCompletedHandler_1__Media_Imaging_SvgImageSourceLoadStatus = interface;
  PAsyncOperationCompletedHandler_1__Media_Imaging_SvgImageSourceLoadStatus = ^AsyncOperationCompletedHandler_1__Media_Imaging_SvgImageSourceLoadStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.UI.Xaml.Media.Imaging.SvgImageSourceLoadStatus>
  IAsyncOperation_1__Media_Imaging_SvgImageSourceLoadStatus = interface;
  PIAsyncOperation_1__Media_Imaging_SvgImageSourceLoadStatus = ^IAsyncOperation_1__Media_Imaging_SvgImageSourceLoadStatus;

  // Windows.UI.Xaml.Automation.Provider.ICustomNavigationProvider
  Automation_Provider_ICustomNavigationProvider = interface;
  PAutomation_Provider_ICustomNavigationProvider = ^Automation_Provider_ICustomNavigationProvider;

  // Windows.UI.Xaml.Automation.Provider.ITextEditProvider
  Automation_Provider_ITextEditProvider = interface;
  PAutomation_Provider_ITextEditProvider = ^Automation_Provider_ITextEditProvider;

  // Windows.UI.Xaml.Data.ICollectionViewGroup
  Data_ICollectionViewGroup = interface;
  PData_ICollectionViewGroup = ^Data_ICollectionViewGroup;

  // Windows.UI.Xaml.Markup.IComponentConnector
  Markup_IComponentConnector = interface;
  PMarkup_IComponentConnector = ^Markup_IComponentConnector;

  // Windows.UI.Xaml.Markup.IComponentConnector2
  Markup_IComponentConnector2 = interface;
  PMarkup_IComponentConnector2 = ^Markup_IComponentConnector2;

  // Windows.UI.Xaml.Markup.IDataTemplateComponent
  Markup_IDataTemplateComponent = interface;
  PMarkup_IDataTemplateComponent = ^Markup_IDataTemplateComponent;

  // Windows.UI.Xaml.Markup.IXamlType
  Markup_IXamlType = interface;
  PMarkup_IXamlType = ^Markup_IXamlType;

  // Windows.UI.Xaml.Markup.IXamlMember
  Markup_IXamlMember = interface;
  PMarkup_IXamlMember = ^Markup_IXamlMember;

  // Windows.UI.Xaml.Markup.IXamlMetadataProvider
  Markup_IXamlMetadataProvider = interface;
  PMarkup_IXamlMetadataProvider = ^Markup_IXamlMetadataProvider;

  // Windows.UI.Xaml.Controls.IInkToolbarMenuButtonFactory
  Controls_IInkToolbarMenuButtonFactory = interface;
  PControls_IInkToolbarMenuButtonFactory = ^Controls_IInkToolbarMenuButtonFactory;

  // Windows.UI.Xaml.Controls.IInkToolbarToggleButtonFactory
  Controls_IInkToolbarToggleButtonFactory = interface;
  PControls_IInkToolbarToggleButtonFactory = ^Controls_IInkToolbarToggleButtonFactory;

  // Windows.UI.Xaml.Controls.IInkToolbarToolButtonFactory
  Controls_IInkToolbarToolButtonFactory = interface;
  PControls_IInkToolbarToolButtonFactory = ^Controls_IInkToolbarToolButtonFactory;

  // Windows.UI.Xaml.Controls.IInkToolbarPenButtonFactory
  Controls_IInkToolbarPenButtonFactory = interface;
  PControls_IInkToolbarPenButtonFactory = ^Controls_IInkToolbarPenButtonFactory;

  // Windows.Foundation.IReference`1<Windows.UI.Xaml.Thickness>
  IReference_1__Thickness = interface;
  PIReference_1__Thickness = ^IReference_1__Thickness;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Object>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IInspectable = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__IInspectable = ^AsyncOperationCompletedHandler_1__IVectorView_1__IInspectable;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Object>>
  IAsyncOperation_1__IVectorView_1__IInspectable = interface;
  PIAsyncOperation_1__IVectorView_1__IInspectable = ^IAsyncOperation_1__IVectorView_1__IInspectable;

  // Windows.UI.Xaml.Hosting.IXamlUIPresenterHost
  Hosting_IXamlUIPresenterHost = interface;
  PHosting_IXamlUIPresenterHost = ^Hosting_IXamlUIPresenterHost;

  // Windows.UI.Xaml.Hosting.IXamlUIPresenterHost2
  Hosting_IXamlUIPresenterHost2 = interface;
  PHosting_IXamlUIPresenterHost2 = ^Hosting_IXamlUIPresenterHost2;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.UI.Xaml Interfaces
  {
  // Used Types:  Windows.UI.Color
  }
  // Windows.Foundation.IReference`1<Windows.UI.Color>
  IReference_1__Color = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: Color; safecall;
    property Value: Color read get_Value;
  end;

  {
  // Used Types:  Object
  }
  // Windows.UI.Xaml.CreateDefaultValueCallback
  CreateDefaultValueCallback = interface(IUnknown)
  ['{D6ECB12C-15B5-4EC8-B95C-CDD208F08153}']
    function Invoke: IInspectable; safecall;
  end;

  {
  }
  // Windows.UI.Xaml.Controls.IIconSourceFactory
  Controls_IIconSourceFactory = interface(IInspectable)
  ['{4D117CF1-1FD6-49D7-B483-02EC3DE997D6}']
  end;

  {
  // Used Types:  String
  // Used Types:  Object
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<String,Object>
  IKeyValuePair_2__HSTRING__IInspectable = interface(IInspectable)
  ['{09335560-6C6B-5A26-9348-97B781132B20}']
    function get_Key: HSTRING; safecall;
    function get_Value: IInspectable; safecall;
    property Key: HSTRING read get_Key;
    property Value: IInspectable read get_Value;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<String,Object>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterator_1__IKeyValuePair_2__HSTRING__IInspectable = interface(IInspectable)
  ['{5DB5FA32-707C-5849-A06B-91C8EB9D10E8}']
    function get_Current: IKeyValuePair_2__HSTRING__IInspectable; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__IInspectable): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__IInspectable read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterable_1__IKeyValuePair_2__HSTRING__IInspectable = interface(IInspectable)
  ['{FE2F3D47-5D47-5499-8374-430C7CDA0204}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__IInspectable; safecall;
  end;

  {
  // Used Types:  Object
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  }
  // Windows.Foundation.Collections.IMapView`2<String,Object>
  IMapView_2__HSTRING__IInspectable = interface(IInspectable)
  ['{BB78502A-F79D-54FA-92C9-90C5039FDF7E}']
    function Lookup(key: HSTRING): IInspectable; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__IInspectable; out second: IMapView_2__HSTRING__IInspectable); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt32>
  // Used Types:  UInt32
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationProgressHandler_2__IBuffer__Cardinal = interface(IUnknown)
  ['{BF666554-7605-5D9A-B14E-18D8C8472AFE}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IBuffer__Cardinal; progressInfo: Cardinal); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt32>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal = interface(IUnknown)
  ['{06386A7A-E009-5B0B-AB68-A8E48B516647}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IBuffer__Cardinal; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt32>
  IAsyncOperationWithProgress_2__IBuffer__Cardinal = interface(IInspectable)
  ['{D26B2819-897F-5C7D-84D6-56D796561431}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__IBuffer__Cardinal); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__IBuffer__Cardinal; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal; safecall;
    function GetResults: IBuffer; safecall;
    property Progress: AsyncOperationProgressHandler_2__IBuffer__Cardinal read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  // Used Types:  UInt32
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt32,UInt32>
  AsyncOperationProgressHandler_2__Cardinal__Cardinal = interface(IUnknown)
  ['{EA0FE405-D432-5AC7-9EF8-5A65E1F97D7E}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Cardinal__Cardinal; progressInfo: Cardinal); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt32,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = interface(IUnknown)
  ['{1E466DC5-840F-54F9-B877-5E3A9F4B6C74}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Cardinal__Cardinal; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<UInt32,UInt32>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt32,UInt32>
  // Used Types:  UInt32
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  IAsyncOperationWithProgress_2__Cardinal__Cardinal = interface(IInspectable)
  ['{ECCB574A-C684-5572-A679-6B0842CFB57F}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__Cardinal__Cardinal); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__Cardinal__Cardinal; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal; safecall;
    function GetResults: Cardinal; safecall;
    property Progress: AsyncOperationProgressHandler_2__Cardinal__Cardinal read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  AsyncOperationCompletedHandler_1__Boolean = interface(IUnknown)
  ['{C1D3D1A2-AE17-5A5F-B5A2-BDCC8844889A}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Boolean; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  // Used Types:  Boolean
  }
  // Windows.Foundation.IAsyncOperation`1<Boolean>
  IAsyncOperation_1__Boolean = interface(IInspectable)
  ['{CDB5EFB3-5788-509D-9BE1-71CCB8A3362A}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Boolean); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Boolean; safecall;
    function GetResults: Boolean; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Boolean read get_Completed write put_Completed;
  end;

  {
  // Used Types:  String
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<String>
  IIterator_1__HSTRING = interface(IInspectable)
  ['{8C304EBB-6615-50A4-8829-879ECD443236}']
    function get_Current: HSTRING; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHSTRING): Cardinal; safecall;
    property Current: HSTRING read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<String>
  }
  // Windows.Foundation.Collections.IIterable`1<String>
  IIterable_1__HSTRING = interface(IInspectable)
  ['{E2FCC7C1-3BFC-5A0B-B2B0-72E769D1CB7E}']
    function First: IIterator_1__HSTRING; safecall;
  end;

  {
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<String>
  IVectorView_1__HSTRING = interface(IInspectable)
  ['{2F13C006-A03A-5F69-B090-75A43E33423E}']
    function GetAt(index: Cardinal): HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: HSTRING; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHSTRING): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Object>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Object>
  AsyncOperationCompletedHandler_1__IInspectable = interface(IUnknown)
  ['{3F08262E-A2E1-5134-9297-E9211F481A2D}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IInspectable; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Object>
  // Used Types:  Object
  }
  // Windows.Foundation.IAsyncOperation`1<Object>
  IAsyncOperation_1__IInspectable = interface(IInspectable)
  ['{ABF53C57-EE50-5342-B52A-26E3B8CC024F}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IInspectable); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IInspectable; safecall;
    function GetResults: IInspectable; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IInspectable read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<String>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<String>
  AsyncOperationCompletedHandler_1__HSTRING = interface(IUnknown)
  ['{B79A741F-7FB5-50AE-9E99-911201EC3D41}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__HSTRING; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<String>
  // Used Types:  String
  }
  // Windows.Foundation.IAsyncOperation`1<String>
  IAsyncOperation_1__HSTRING = interface(IInspectable)
  ['{3E1FE603-F897-5263-B328-0806426B8A79}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__HSTRING); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__HSTRING; safecall;
    function GetResults: HSTRING; safecall;
    property Completed: AsyncOperationCompletedHandler_1__HSTRING read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Object
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  }
  // Windows.Foundation.Collections.IMap`2<String,Object>
  IMap_2__HSTRING__IInspectable = interface(IInspectable)
  ['{1B0D3570-0877-5EC2-8A2C-3B9539506ACA}']
    function Lookup(key: HSTRING): IInspectable; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    function GetView: IMapView_2__HSTRING__IInspectable; safecall;
    function Insert(key: HSTRING; value: IInspectable): Boolean; safecall;
    procedure Remove(key: HSTRING); safecall;
    procedure Clear; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<String>
  IVector_1__HSTRING = interface(IInspectable)
  ['{98B9ACC1-4B56-532E-AC73-03D5291CCA90}']
    function GetAt(index: Cardinal): HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__HSTRING; safecall;
    function IndexOf(value: HSTRING; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: HSTRING); safecall;
    procedure InsertAt(index: Cardinal; value: HSTRING); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: HSTRING); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHSTRING): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PHSTRING); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.ApplicationModel.DataTransfer.IDataPackage
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataPackage,Object>
  TypedEventHandler_2__IDataPackage__IInspectable = interface(IUnknown)
  ['{FFA86A6A-1BEE-540E-9911-7272C487A1ED}']
    procedure Invoke(sender: IDataPackage; args: IInspectable); safecall;
  end;

  {
  // Used Types:  Object
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Object>
  IIterator_1__IInspectable = interface(IInspectable)
  ['{44A94F2D-04F8-5091-B336-BE7892DD10BE}']
    function get_Current: IInspectable; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIInspectable): Cardinal; safecall;
    property Current: IInspectable read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Object>
  }
  // Windows.Foundation.Collections.IIterable`1<Object>
  IIterable_1__IInspectable = interface(IInspectable)
  ['{092B849B-60B1-52BE-A44A-6FE8E933CBE4}']
    function First: IIterator_1__IInspectable; safecall;
  end;

  {
  // Used Types:  Object
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Object>
  IVectorView_1__IInspectable = interface(IInspectable)
  ['{A6487363-B074-5C60-AB16-866DCE4EE54D}']
    function GetAt(index: Cardinal): IInspectable; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IInspectable; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIInspectable): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Object
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Object>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Object>
  IVector_1__IInspectable = interface(IInspectable)
  ['{B32BDCA4-5E52-5B27-BC5D-D66A1A268C2A}']
    function GetAt(index: Cardinal): IInspectable; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IInspectable; safecall;
    function IndexOf(value: IInspectable; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IInspectable); safecall;
    procedure InsertAt(index: Cardinal; value: IInspectable); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IInspectable); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIInspectable): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIInspectable); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  }
  // Windows.UI.Xaml.Controls.INavigationViewItemBaseFactory
  Controls_INavigationViewItemBaseFactory = interface(IInspectable)
  ['{EB014CEF-7890-4EBB-8245-02E8510F321D}']
  end;

  {
  // Used Types:  Object
  }
  // Windows.Foundation.EventHandler`1<Object>
  EventHandler_1__IInspectable = interface(IUnknown)
  ['{C50898F6-C536-5F47-8583-8B2C2438A13B}']
    procedure Invoke(sender: IInspectable; args: IInspectable); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.EventHandler`1<Object>
  // Used Types:  Boolean
  // Used Types:  Object
  }
  // Windows.UI.Xaml.Input.ICommand
  Input_ICommand = interface(IInspectable)
  ['{E5AF3542-CA67-4081-995B-709DD13792DF}']
    function add_CanExecuteChanged(value: EventHandler_1__IInspectable): EventRegistrationToken; safecall;
    procedure remove_CanExecuteChanged(token: EventRegistrationToken); safecall;
    function CanExecute(parameter: IInspectable): Boolean; safecall;
    procedure Execute(parameter: IInspectable); safecall;
  end;

  {
  // Used Types:  Object
  // Used Types:  Boolean
  }
  // Windows.UI.Xaml.Interop.IBindableIterator
  Interop_IBindableIterator = interface(IInspectable)
  ['{6A1D6C07-076D-49F2-8314-F52C9C9A8331}']
    function get_Current: IInspectable; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    property Current: IInspectable read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.UI.Xaml.Interop.IBindableIterator
  }
  // Windows.UI.Xaml.Interop.IBindableIterable
  Interop_IBindableIterable = interface(IInspectable)
  ['{036D2C08-DF29-41AF-8AA2-D774BE62BA6F}']
    function First: Interop_IBindableIterator; safecall;
  end;

  {
  // Used Types:  Object
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.UI.Xaml.Interop.IBindableVectorView
  Interop_IBindableVectorView = interface(IInspectable)
  ['{346DD6E7-976E-4BC3-815D-ECE243BC0F33}']
    function GetAt(index: Cardinal): IInspectable; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IInspectable; out index: Cardinal): Boolean; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Object
  // Used Types:  UInt32
  // Used Types:  Windows.UI.Xaml.Interop.IBindableVectorView
  // Used Types:  Boolean
  }
  // Windows.UI.Xaml.Interop.IBindableVector
  Interop_IBindableVector = interface(IInspectable)
  ['{393DE7DE-6FD0-4C0D-BB71-47244A113E93}']
    function GetAt(index: Cardinal): IInspectable; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: Interop_IBindableVectorView; safecall;
    function IndexOf(value: IInspectable; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IInspectable); safecall;
    procedure InsertAt(index: Cardinal; value: IInspectable); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IInspectable); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.UI.Xaml.Interop.BindableVectorChangedEventHandler
  }
  // Windows.UI.Xaml.Interop.IBindableObservableVector
  Interop_IBindableObservableVector = interface(IInspectable)
  ['{FE1EB536-7E7F-4F90-AC9A-474984AAE512}']
    function add_VectorChanged(value: Interop_BindableVectorChangedEventHandler): EventRegistrationToken; safecall;
    procedure remove_VectorChanged(token: EventRegistrationToken); safecall;
  end;

  {
  // Used Types:  Windows.UI.Xaml.Interop.IBindableObservableVector
  // Used Types:  Object
  }
  // Windows.UI.Xaml.Interop.BindableVectorChangedEventHandler
  Interop_BindableVectorChangedEventHandler = interface(IUnknown)
  ['{624CD4E1-D007-43B1-9C03-AF4D3E6258C4}']
    procedure Invoke(vector: Interop_IBindableObservableVector; e: IInspectable); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.UI.Xaml.Data.LoadMoreItemsResult>
  AsyncOperationCompletedHandler_1__Data_LoadMoreItemsResult_Delegate_Base = interface(IUnknown)
  ['{10FB738B-A63B-506E-9ED7-2EAB37915221}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.UI.Xaml.Data.LoadMoreItemsResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.UI.Xaml.Data.LoadMoreItemsResult>
  AsyncOperationCompletedHandler_1__Data_LoadMoreItemsResult = interface(AsyncOperationCompletedHandler_1__Data_LoadMoreItemsResult_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Data_LoadMoreItemsResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.UI.Xaml.Data.LoadMoreItemsResult>
  IAsyncOperation_1__Data_LoadMoreItemsResult_Base = interface(IInspectable)
  ['{C788089D-37AB-5BA2-B865-5A309ACDFC4D}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.UI.Xaml.Data.LoadMoreItemsResult>
  // Used Types:  Windows.UI.Xaml.Data.LoadMoreItemsResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.UI.Xaml.Data.LoadMoreItemsResult>
  IAsyncOperation_1__Data_LoadMoreItemsResult = interface(IAsyncOperation_1__Data_LoadMoreItemsResult_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Data_LoadMoreItemsResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Data_LoadMoreItemsResult; safecall;
    function GetResults: Data_LoadMoreItemsResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Data_LoadMoreItemsResult read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Object
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<Object,Object>
  IKeyValuePair_2__IInspectable__IInspectable = interface(IInspectable)
  ['{59E7AE0C-C29D-5AD6-BEF5-DEDB52A198E1}']
    function get_Key: IInspectable; safecall;
    function get_Value: IInspectable; safecall;
    property Key: IInspectable read get_Key;
    property Value: IInspectable read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<Object,Object>>
  IIterator_1__IKeyValuePair_2__IInspectable__IInspectable_Base = interface(IInspectable)
  ['{31E55E8A-0F05-52FD-90D3-B04AA331AAA4}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<Object,Object>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<Object,Object>>
  IIterator_1__IKeyValuePair_2__IInspectable__IInspectable = interface(IIterator_1__IKeyValuePair_2__IInspectable__IInspectable_Base)
  ['{31E55E8A-0F05-52FD-90D3-B04AA331AAA4}']
    function get_Current: IKeyValuePair_2__IInspectable__IInspectable; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__IInspectable__IInspectable): Cardinal; safecall;
    property Current: IKeyValuePair_2__IInspectable__IInspectable read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<Object,Object>>
  IIterable_1__IKeyValuePair_2__IInspectable__IInspectable_Base = interface(IInspectable)
  ['{33AC68F0-1084-529A-8A17-4E7C8ADB7A0C}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<Object,Object>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<Object,Object>>
  IIterable_1__IKeyValuePair_2__IInspectable__IInspectable = interface(IIterable_1__IKeyValuePair_2__IInspectable__IInspectable_Base)
  ['{33AC68F0-1084-529A-8A17-4E7C8ADB7A0C}']
    function First: IIterator_1__IKeyValuePair_2__IInspectable__IInspectable; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IMapView`2<Object,Object>
  IMapView_2__IInspectable__IInspectable_Base = interface(IInspectable)
  ['{EFE76D10-CB60-50AD-8A4F-6885CD6212A1}']
  end;
  {
  // Used Types:  Object
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<Object,Object>
  }
  // Windows.Foundation.Collections.IMapView`2<Object,Object>
  IMapView_2__IInspectable__IInspectable = interface(IMapView_2__IInspectable__IInspectable_Base)
  ['{EFE76D10-CB60-50AD-8A4F-6885CD6212A1}']
    function Lookup(key: IInspectable): IInspectable; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: IInspectable): Boolean; safecall;
    procedure Split(out first: IMapView_2__IInspectable__IInspectable; out second: IMapView_2__IInspectable__IInspectable); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Object
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<Object,Object>
  }
  // Windows.Foundation.Collections.IMap`2<Object,Object>
  IMap_2__IInspectable__IInspectable = interface(IInspectable)
  ['{F5F69427-55ED-5512-8429-D4F6626DFCDD}']
    function Lookup(key: IInspectable): IInspectable; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: IInspectable): Boolean; safecall;
    function GetView: IMapView_2__IInspectable__IInspectable; safecall;
    function Insert(key: IInspectable; value: IInspectable): Boolean; safecall;
    procedure Remove(key: IInspectable); safecall;
    procedure Clear; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.CollectionChange
  // Used Types:  String
  }
  // Windows.Foundation.Collections.IMapChangedEventArgs`1<String>
  IMapChangedEventArgs_1__HSTRING = interface(IInspectable)
  ['{60141EFB-F2F9-5377-96FD-F8C60D9558B5}']
    function get_CollectionChange: CollectionChange; safecall;
    function get_Key: HSTRING; safecall;
    property CollectionChange: CollectionChange read get_CollectionChange;
    property Key: HSTRING read get_Key;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IObservableMap`2<String,Object>
  // Used Types:  Windows.Foundation.Collections.IMapChangedEventArgs`1<String>
  }
  // Windows.Foundation.Collections.MapChangedEventHandler`2<String,Object>
  MapChangedEventHandler_2__HSTRING__IInspectable = interface(IUnknown)
  ['{24F981E5-DDCA-538D-AADA-A59906084CF1}']
    procedure Invoke(sender: IObservableMap_2__HSTRING__IInspectable; event: IMapChangedEventArgs_1__HSTRING); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.Collections.MapChangedEventHandler`2<String,Object>
  }
  // Windows.Foundation.Collections.IObservableMap`2<String,Object>
  IObservableMap_2__HSTRING__IInspectable = interface(IInspectable)
  ['{236AAC9D-FB12-5C4D-A41C-9E445FB4D7EC}']
    function add_MapChanged(vhnd: MapChangedEventHandler_2__HSTRING__IInspectable): EventRegistrationToken; safecall;
    procedure remove_MapChanged(token: EventRegistrationToken); safecall;
  end;

  {
  // Used Types:  Object
  // Used Types:  Windows.UI.Core.IWindowActivatedEventArgs
  }
  // Windows.UI.Xaml.WindowActivatedEventHandler
  WindowActivatedEventHandler = interface(IUnknown)
  ['{18026348-8619-4C7B-B534-CED45D9DE219}']
    procedure Invoke(sender: IInspectable; e: IWindowActivatedEventArgs); safecall;
  end;

  {
  // Used Types:  Object
  // Used Types:  Windows.UI.Core.ICoreWindowEventArgs
  }
  // Windows.UI.Xaml.WindowClosedEventHandler
  WindowClosedEventHandler = interface(IUnknown)
  ['{0DB89161-20D7-45DF-9122-BA89576703BA}']
    procedure Invoke(sender: IInspectable; e: ICoreWindowEventArgs); safecall;
  end;

  {
  // Used Types:  Object
  // Used Types:  Windows.UI.Core.IWindowSizeChangedEventArgs
  }
  // Windows.UI.Xaml.WindowSizeChangedEventHandler
  WindowSizeChangedEventHandler = interface(IUnknown)
  ['{5C21C742-2CED-4FD9-BA38-7118D40E966B}']
    procedure Invoke(sender: IInspectable; e: IWindowSizeChangedEventArgs); safecall;
  end;

  {
  // Used Types:  Object
  // Used Types:  Windows.UI.Core.IVisibilityChangedEventArgs
  }
  // Windows.UI.Xaml.WindowVisibilityChangedEventHandler
  WindowVisibilityChangedEventHandler = interface(IUnknown)
  ['{10406AD6-B090-4A4A-B2AD-D682DF27130F}']
    procedure Invoke(sender: IInspectable; e: IVisibilityChangedEventArgs); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Xaml.Documents.TextRange>
  IIterator_1__Documents_TextRange_Base = interface(IInspectable)
  ['{71F63622-C0FE-5423-914E-D319D25BCC84}']
  end;
  {
  // Used Types:  Windows.UI.Xaml.Documents.TextRange
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Xaml.Documents.TextRange>
  IIterator_1__Documents_TextRange = interface(IIterator_1__Documents_TextRange_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: Documents_TextRange; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PDocuments_TextRange): Cardinal; safecall;
    property Current: Documents_TextRange read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Xaml.Documents.TextRange>
  IIterable_1__Documents_TextRange_Base = interface(IInspectable)
  ['{2AD42FDB-56DB-500B-8EA8-3D57EDFADFC6}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.Xaml.Documents.TextRange>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Xaml.Documents.TextRange>
  IIterable_1__Documents_TextRange = interface(IIterable_1__Documents_TextRange_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__Documents_TextRange; safecall;
  end;

  {
  // Used Types:  Windows.UI.Xaml.Documents.TextRange
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Xaml.Documents.TextRange>
  IVectorView_1__Documents_TextRange = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): Documents_TextRange; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Documents_TextRange; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDocuments_TextRange): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.UI.Xaml.Documents.TextRange
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.UI.Xaml.Documents.TextRange>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.UI.Xaml.Documents.TextRange>
  IVector_1__Documents_TextRange = interface(IInspectable)
  ['{A4739064-B54E-55D4-8012-317E2B6A807B}']
    function GetAt(index: Cardinal): Documents_TextRange; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Documents_TextRange; safecall;
    function IndexOf(value: Documents_TextRange; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Documents_TextRange); safecall;
    procedure InsertAt(index: Cardinal; value: Documents_TextRange); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Documents_TextRange); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDocuments_TextRange): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PDocuments_TextRange); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  }
  // Windows.UI.Xaml.Documents.ITextElementFactory
  Documents_ITextElementFactory = interface(IInspectable)
  ['{35007285-CF47-4BFE-B1BC-39C93AF4AE80}']
  end;

  {
  }
  // Windows.UI.Xaml.Documents.ITextHighlighterBaseFactory
  Documents_ITextHighlighterBaseFactory = interface(IInspectable)
  ['{9592B2D0-EADC-4C74-92C8-6E896E22506D}']
  end;

  {
  // Used Types:  Int32
  }
  // Windows.Foundation.IReference`1<Int32>
  IReference_1__Integer = interface(IInspectable)
  ['{548CEFBD-BC8A-5FA0-8DF2-957440FC8BF4}']
    function get_Value: Integer; safecall;
    property Value: Integer read get_Value;
  end;

  {
  // Used Types:  Guid
  // Used Types:  Object
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>
  IKeyValuePair_2__TGuid__IInspectable = interface(IInspectable)
  ['{3BDA1540-D089-5A1A-8F0D-94EBA8068E58}']
    function get_Key: TGuid; safecall;
    function get_Value: IInspectable; safecall;
    property Key: TGuid read get_Key;
    property Value: IInspectable read get_Value;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>>
  IIterator_1__IKeyValuePair_2__TGuid__IInspectable = interface(IInspectable)
  ['{4F25059A-0B9A-5F25-9B9E-4B9F1D22FF65}']
    function get_Current: IKeyValuePair_2__TGuid__IInspectable; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__TGuid__IInspectable): Cardinal; safecall;
    property Current: IKeyValuePair_2__TGuid__IInspectable read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>>
  IIterable_1__IKeyValuePair_2__TGuid__IInspectable = interface(IInspectable)
  ['{F3B20528-E3B3-5331-B2D0-0C2623AEE785}']
    function First: IIterator_1__IKeyValuePair_2__TGuid__IInspectable; safecall;
  end;

  {
  // Used Types:  Object
  // Used Types:  Guid
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<Guid,Object>
  }
  // Windows.Foundation.Collections.IMapView`2<Guid,Object>
  IMapView_2__TGuid__IInspectable = interface(IInspectable)
  ['{E4D2C732-BBC1-5EF4-869F-5007CEB55F6E}']
    function Lookup(key: TGuid): IInspectable; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: TGuid): Boolean; safecall;
    procedure Split(out first: IMapView_2__TGuid__IInspectable; out second: IMapView_2__TGuid__IInspectable); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Object
  // Used Types:  Guid
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<Guid,Object>
  }
  // Windows.Foundation.Collections.IMap`2<Guid,Object>
  IMap_2__TGuid__IInspectable = interface(IInspectable)
  ['{5EE3189C-7DBF-5998-AD07-5414FB82567C}']
    function Lookup(key: TGuid): IInspectable; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: TGuid): Boolean; safecall;
    function GetView: IMapView_2__TGuid__IInspectable; safecall;
    function Insert(key: TGuid; value: IInspectable): Boolean; safecall;
    procedure Remove(key: TGuid); safecall;
    procedure Clear; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Object>
  VectorChangedEventHandler_1__IInspectable_Delegate_Base = interface(IUnknown)
  ['{B423A801-D35E-56B9-813B-00889536CB98}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IObservableVector`1<Object>
  // Used Types:  Windows.Foundation.Collections.IVectorChangedEventArgs
  }
  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Object>
  VectorChangedEventHandler_1__IInspectable = interface(VectorChangedEventHandler_1__IInspectable_Delegate_Base)
  ['{B423A801-D35E-56B9-813B-00889536CB98}']
    procedure Invoke(sender: IObservableVector_1__IInspectable; event: IVectorChangedEventArgs); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.Collections.VectorChangedEventHandler`1<Object>
  }
  // Windows.Foundation.Collections.IObservableVector`1<Object>
  IObservableVector_1__IInspectable = interface(IInspectable)
  ['{7B81C56A-0985-518D-BAA9-0DA9AE009F65}']
    function add_VectorChanged(vhnd: VectorChangedEventHandler_1__IInspectable): EventRegistrationToken; safecall;
    procedure remove_VectorChanged(token: EventRegistrationToken); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.UI.Xaml.Controls.IGroupStyle>
  VectorChangedEventHandler_1__Controls_IGroupStyle_Delegate_Base = interface(IUnknown)
  ['{2CAA8225-B3D4-5725-B0CF-5E6E61453B23}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IObservableVector`1<Windows.UI.Xaml.Controls.IGroupStyle>
  // Used Types:  Windows.Foundation.Collections.IVectorChangedEventArgs
  }
  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.UI.Xaml.Controls.IGroupStyle>
  VectorChangedEventHandler_1__Controls_IGroupStyle = interface(VectorChangedEventHandler_1__Controls_IGroupStyle_Delegate_Base)
  ['{9F07FAA2-97FC-5A69-9C31-FA23937DB2E9}']
    procedure Invoke(sender: IObservableVector_1__Controls_IGroupStyle; event: IVectorChangedEventArgs); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.UI.Xaml.Controls.IGroupStyle>
  }
  // Windows.Foundation.Collections.IObservableVector`1<Windows.UI.Xaml.Controls.IGroupStyle>
  IObservableVector_1__Controls_IGroupStyle = interface(IInspectable)
  ['{693D0DA3-AF0B-533B-9642-F16B63E0BC4F}']
    function add_VectorChanged(vhnd: VectorChangedEventHandler_1__Controls_IGroupStyle): EventRegistrationToken; safecall;
    procedure remove_VectorChanged(token: EventRegistrationToken); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<String>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<String>>
  AsyncOperationCompletedHandler_1__IVectorView_1__HSTRING = interface(IUnknown)
  ['{7C7899BE-5F2E-5BF3-ADE5-AD98B772C7CD}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__HSTRING; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<String>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<String>>
  IAsyncOperation_1__IVectorView_1__HSTRING = interface(IInspectable)
  ['{2F92B529-119B-575A-A419-3904B4E41AF2}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__HSTRING); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__HSTRING; safecall;
    function GetResults: IVectorView_1__HSTRING; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__HSTRING read get_Completed write put_Completed;
  end;

  {
  }
  // Windows.UI.Xaml.Controls.IVirtualizingPanelFactory
  Controls_IVirtualizingPanelFactory = interface(IInspectable)
  ['{BE19F839-CBD0-43E9-A5D0-0BDBA0FFBD38}']
  end;

  {
  }
  // Windows.UI.Xaml.Controls.IListViewBaseHeaderItemFactory
  Controls_IListViewBaseHeaderItemFactory = interface(IInspectable)
  ['{3872A6A1-EA19-455F-9DF7-147CC41D329C}']
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Single>
  IIterator_1__Single_Base = interface(IInspectable)
  ['{42614E61-B0AA-5E72-9354-2771DB20B7A8}']
  end;
  {
  // Used Types:  Single
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Single>
  IIterator_1__Single = interface(IIterator_1__Single_Base)
  ['{42614E61-B0AA-5E72-9354-2771DB20B7A8}']
    function get_Current: Single; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PSingle): Cardinal; safecall;
    property Current: Single read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Single>
  IIterable_1__Single_Base = interface(IInspectable)
  ['{B01BEE51-063A-5FDA-BD72-D76637BB8CB8}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Single>
  }
  // Windows.Foundation.Collections.IIterable`1<Single>
  IIterable_1__Single = interface(IIterable_1__Single_Base)
  ['{B01BEE51-063A-5FDA-BD72-D76637BB8CB8}']
    function First: IIterator_1__Single; safecall;
  end;

  {
  // Used Types:  Single
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Single>
  IVectorView_1__Single = interface(IInspectable)
  ['{7BCA64FD-150C-5D50-B56B-9F4F474C5930}']
    function GetAt(index: Cardinal): Single; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Single; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSingle): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  }
  // Windows.UI.Xaml.Controls.Primitives.IOrientedVirtualizingPanelFactory
  Controls_Primitives_IOrientedVirtualizingPanelFactory = interface(IInspectable)
  ['{7B8EAEAF-F92F-439D-9EBF-E9919F56C94D}']
  end;

  {
  // Used Types:  Boolean
  }
  // Windows.Foundation.IReference`1<Boolean>
  IReference_1__Boolean = interface(IInspectable)
  ['{3C00FD60-2950-5939-A21A-2D12C5A01B8A}']
    function get_Value: Boolean; safecall;
    property Value: Boolean read get_Value;
  end;

  {
  }
  // Windows.UI.Xaml.Controls.Primitives.ISelectorFactory
  Controls_Primitives_ISelectorFactory = interface(IInspectable)
  ['{C9BE2995-D136-4600-B187-8AD56079B48A}']
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Color>
  IIterator_1__Color_Base = interface(IInspectable)
  ['{C4310B12-7AC2-5E5B-B511-E546EEA473B4}']
  end;
  {
  // Used Types:  Windows.UI.Color
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Color>
  IIterator_1__Color = interface(IIterator_1__Color_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: Color; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PColor): Cardinal; safecall;
    property Current: Color read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Color>
  IIterable_1__Color_Base = interface(IInspectable)
  ['{932EEF5E-2C2F-5EAE-929A-74E973B57C27}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.Color>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Color>
  IIterable_1__Color = interface(IIterable_1__Color_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__Color; safecall;
  end;

  {
  // Used Types:  String
  // Used Types:  Object
  }
  // Windows.UI.Xaml.Controls.ListViewItemToKeyHandler
  Controls_ListViewItemToKeyHandler = interface(IUnknown)
  ['{6AF5DA76-7E8B-4A91-9A56-460CB47D523F}']
    function Invoke(item: IInspectable): HSTRING; safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Object>
  // Used Types:  String
  }
  // Windows.UI.Xaml.Controls.ListViewKeyToItemHandler
  Controls_ListViewKeyToItemHandler = interface(IUnknown)
  ['{26FD5855-B530-4688-B9F0-428249178EF8}']
    function Invoke(key: HSTRING): IAsyncOperation_1__IInspectable; safecall;
  end;

  {
  }
  // Windows.UI.Xaml.Controls.ISectionsInViewChangedEventArgsFactory
  Controls_ISectionsInViewChangedEventArgsFactory = interface(IInspectable)
  ['{557F5244-92F8-4150-B730-E6346E8F50D1}']
  end;

  {
  }
  // Windows.UI.Xaml.Controls.IIconElementFactory
  Controls_IIconElementFactory = interface(IInspectable)
  ['{CF37A562-0424-43C7-8BEA-720FBA973EF1}']
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncActionWithProgress`1<UInt64>
  // Used Types:  UInt64
  }
  // Windows.Foundation.AsyncActionProgressHandler`1<UInt64>
  AsyncActionProgressHandler_1__UInt64 = interface(IUnknown)
  ['{55E233CA-F243-5AE2-853B-F9CC7C0AE0CF}']
    procedure Invoke(asyncInfo: IAsyncActionWithProgress_1__UInt64; progressInfo: UInt64); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncActionWithProgress`1<UInt64>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncActionWithProgressCompletedHandler`1<UInt64>
  AsyncActionWithProgressCompletedHandler_1__UInt64 = interface(IUnknown)
  ['{E6FF857B-F160-571A-A934-2C61F98C862D}']
    procedure Invoke(asyncInfo: IAsyncActionWithProgress_1__UInt64; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncActionProgressHandler`1<UInt64>
  // Used Types:  Windows.Foundation.AsyncActionWithProgressCompletedHandler`1<UInt64>
  }
  // Windows.Foundation.IAsyncActionWithProgress`1<UInt64>
  IAsyncActionWithProgress_1__UInt64 = interface(IInspectable)
  ['{43F713D0-C49D-5E55-AEBF-AF395768351E}']
    procedure put_Progress(handler: AsyncActionProgressHandler_1__UInt64); safecall;
    function get_Progress: AsyncActionProgressHandler_1__UInt64; safecall;
    procedure put_Completed(handler: AsyncActionWithProgressCompletedHandler_1__UInt64); safecall;
    function get_Completed: AsyncActionWithProgressCompletedHandler_1__UInt64; safecall;
    procedure GetResults; safecall;
    property Progress: AsyncActionProgressHandler_1__UInt64 read get_Progress write put_Progress;
    property Completed: AsyncActionWithProgressCompletedHandler_1__UInt64 read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Windows.Media.Playback.IMediaPlayer
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlayer,Object>
  TypedEventHandler_2__Playback_IMediaPlayer__IInspectable = interface(IUnknown)
  ['{C518DF12-1F91-5238-AB1E-ED0D1B4AF00D}']
    procedure Invoke(sender: Playback_IMediaPlayer; args: IInspectable); safecall;
  end;

  {
  // Used Types:  String
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<String,String>
  IKeyValuePair_2__HSTRING__HSTRING = interface(IInspectable)
  ['{60310303-49C5-52E6-ABC6-A9B36ECCC716}']
    function get_Key: HSTRING; safecall;
    function get_Value: HSTRING; safecall;
    property Key: HSTRING read get_Key;
    property Value: HSTRING read get_Value;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<String,String>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterator_1__IKeyValuePair_2__HSTRING__HSTRING = interface(IInspectable)
  ['{05EB86F1-7140-5517-B88D-CBAEBE57E6B1}']
    function get_Current: IKeyValuePair_2__HSTRING__HSTRING; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__HSTRING): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__HSTRING read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterable_1__IKeyValuePair_2__HSTRING__HSTRING = interface(IInspectable)
  ['{E9BDAAF0-CBF6-5C72-BE90-29CBF3A1319B}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__HSTRING; safecall;
  end;

  {
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,String>
  }
  // Windows.Foundation.Collections.IMapView`2<String,String>
  IMapView_2__HSTRING__HSTRING = interface(IInspectable)
  ['{AC7F26F2-FEB7-5B2A-8AC4-345BC62CAEDE}']
    function Lookup(key: HSTRING): HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__HSTRING; out second: IMapView_2__HSTRING__HSTRING); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,String>
  }
  // Windows.Foundation.Collections.IMap`2<String,String>
  IMap_2__HSTRING__HSTRING = interface(IInspectable)
  ['{F6D1F700-49C2-52AE-8154-826F9908773C}']
    function Lookup(key: HSTRING): HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    function GetView: IMapView_2__HSTRING__HSTRING; safecall;
    function Insert(key: HSTRING; value: HSTRING): Boolean; safecall;
    procedure Remove(key: HSTRING); safecall;
    procedure Clear; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  UInt64
  }
  // Windows.Foundation.IReference`1<UInt64>
  IReference_1__UInt64 = interface(IInspectable)
  ['{6755E376-53BB-568B-A11D-17239868309E}']
    function get_Value: UInt64; safecall;
    property Value: UInt64 read get_Value;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<UInt64,UInt64>
  // Used Types:  UInt64
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt64,UInt64>
  AsyncOperationProgressHandler_2__UInt64__UInt64 = interface(IUnknown)
  ['{FFB2B65D-4120-5D13-826D-107851E6BB1C}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__UInt64__UInt64; progressInfo: UInt64); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<UInt64,UInt64>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt64,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64 = interface(IUnknown)
  ['{D2024E41-5500-5B5A-BA46-CB7009596A2F}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__UInt64__UInt64; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<UInt64,UInt64>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt64,UInt64>
  // Used Types:  UInt64
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt64,UInt64>
  IAsyncOperationWithProgress_2__UInt64__UInt64 = interface(IInspectable)
  ['{8F1DB6E3-6556-5516-825C-1021EE27CD0C}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__UInt64__UInt64); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__UInt64__UInt64; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64; safecall;
    function GetResults: UInt64; safecall;
    property Progress: AsyncOperationProgressHandler_2__UInt64__UInt64 read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64 read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt64>
  // Used Types:  UInt64
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  AsyncOperationProgressHandler_2__IBuffer__UInt64 = interface(IUnknown)
  ['{D17F5EB6-B422-5E26-A817-7E0FD08F75D5}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IBuffer__UInt64; progressInfo: UInt64); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt64>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64 = interface(IUnknown)
  ['{ABC81235-39C7-59BF-9948-2D14A93D40FD}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IBuffer__UInt64; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt64>
  IAsyncOperationWithProgress_2__IBuffer__UInt64 = interface(IInspectable)
  ['{AD960E7F-D73B-56E4-A58C-6EC7678CFD88}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__IBuffer__UInt64); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__IBuffer__UInt64; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64; safecall;
    function GetResults: IBuffer; safecall;
    property Progress: AsyncOperationProgressHandler_2__IBuffer__UInt64 read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64 read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,UInt64>
  // Used Types:  UInt64
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  AsyncOperationProgressHandler_2__IInputStream__UInt64 = interface(IUnknown)
  ['{F9B2E7F6-762F-50DB-95DD-7F6C6EC47090}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IInputStream__UInt64; progressInfo: UInt64); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,UInt64>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64 = interface(IUnknown)
  ['{8DB69706-3DD1-5A28-986A-93BE0776D9C3}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IInputStream__UInt64; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  // Used Types:  Windows.Storage.Streams.IInputStream
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,UInt64>
  IAsyncOperationWithProgress_2__IInputStream__UInt64 = interface(IInspectable)
  ['{455AA601-F13E-5DEE-B9CB-16B531996327}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__IInputStream__UInt64); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__IInputStream__UInt64; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64; safecall;
    function GetResults: IInputStream; safecall;
    property Progress: AsyncOperationProgressHandler_2__IInputStream__UInt64 read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64 read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<String,UInt64>
  // Used Types:  UInt64
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<String,UInt64>
  AsyncOperationProgressHandler_2__HSTRING__UInt64 = interface(IUnknown)
  ['{14DA7DE7-40DF-5D4C-823F-CF310625AD39}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__HSTRING__UInt64; progressInfo: UInt64); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<String,UInt64>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<String,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64 = interface(IUnknown)
  ['{BD75EEBE-E7B5-5AF6-8415-A4B9C9045202}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__HSTRING__UInt64; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<String,UInt64>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<String,UInt64>
  // Used Types:  String
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<String,UInt64>
  IAsyncOperationWithProgress_2__HSTRING__UInt64 = interface(IInspectable)
  ['{C8BBCB29-6B64-5CE2-A831-038F6E02199E}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__HSTRING__UInt64); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__HSTRING__UInt64; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64; safecall;
    function GetResults: HSTRING; safecall;
    property Progress: AsyncOperationProgressHandler_2__HSTRING__UInt64 read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64 read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Double
  }
  // Windows.Foundation.IReference`1<Double>
  IReference_1__Double = interface(IInspectable)
  ['{2F2D6C29-5473-5F3E-92E7-96572BB990E2}']
    function get_Value: Double; safecall;
    property Value: Double read get_Value;
  end;

  {
  // Used Types:  UInt32
  }
  // Windows.Foundation.IReference`1<UInt32>
  IReference_1__Cardinal = interface(IInspectable)
  ['{513EF3AF-E784-5325-A91E-97C2B8111CF3}']
    function get_Value: Cardinal; safecall;
    property Value: Cardinal read get_Value;
  end;

  {
  // Used Types:  UInt8
  }
  // Windows.Foundation.IReference`1<UInt8>
  IReference_1__Byte = interface(IInspectable)
  ['{E5198CC8-2873-55F5-B0A1-84FF9E4AAD62}']
    function get_Value: Byte; safecall;
    property Value: Byte read get_Value;
  end;

  {
  }
  // Windows.UI.Xaml.Controls.IMenuFlyoutItemBaseFactory
  Controls_IMenuFlyoutItemBaseFactory = interface(IInspectable)
  ['{83E6DBAD-FC67-41D5-8797-60ACD1CEB1D9}']
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.UI.Xaml.Controls.ContentDialogResult>
  AsyncOperationCompletedHandler_1__Controls_ContentDialogResult_Delegate_Base = interface(IUnknown)
  ['{45C7A306-E330-54D6-A9BA-61C91F93F53B}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.UI.Xaml.Controls.ContentDialogResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.UI.Xaml.Controls.ContentDialogResult>
  AsyncOperationCompletedHandler_1__Controls_ContentDialogResult = interface(AsyncOperationCompletedHandler_1__Controls_ContentDialogResult_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Controls_ContentDialogResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.UI.Xaml.Controls.ContentDialogResult>
  IAsyncOperation_1__Controls_ContentDialogResult_Base = interface(IInspectable)
  ['{1F23BDD1-06DC-5BE9-9A60-0B4D94D4D72C}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.UI.Xaml.Controls.ContentDialogResult>
  // Used Types:  Windows.UI.Xaml.Controls.ContentDialogResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.UI.Xaml.Controls.ContentDialogResult>
  IAsyncOperation_1__Controls_ContentDialogResult = interface(IAsyncOperation_1__Controls_ContentDialogResult_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Controls_ContentDialogResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Controls_ContentDialogResult; safecall;
    function GetResults: Controls_ContentDialogResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Controls_ContentDialogResult read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Single
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Single>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Single>
  IVector_1__Single = interface(IInspectable)
  ['{61CF693F-DB4C-579F-B905-5DD3D23CFD4D}']
    function GetAt(index: Cardinal): Single; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Single; safecall;
    function IndexOf(value: Single; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Single); safecall;
    procedure InsertAt(index: Cardinal; value: Single); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Single); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSingle): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PSingle); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Single
  }
  // Windows.Foundation.IReference`1<Single>
  IReference_1__Single = interface(IInspectable)
  ['{719CC2BA-3E76-5DEF-9F1A-38D85A145EA8}']
    function get_Value: Single; safecall;
    property Value: Single read get_Value;
  end;

  // Generic Delegate for 
  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.UI.Xaml.Controls.ICommandBarElement>
  VectorChangedEventHandler_1__Controls_ICommandBarElement_Delegate_Base = interface(IUnknown)
  ['{20B884E1-C1DA-5332-B801-4F1C21744AC8}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IObservableVector`1<Windows.UI.Xaml.Controls.ICommandBarElement>
  // Used Types:  Windows.Foundation.Collections.IVectorChangedEventArgs
  }
  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.UI.Xaml.Controls.ICommandBarElement>
  VectorChangedEventHandler_1__Controls_ICommandBarElement = interface(VectorChangedEventHandler_1__Controls_ICommandBarElement_Delegate_Base)
  ['{20B884E1-C1DA-5332-B801-4F1C21744AC8}']
    procedure Invoke(sender: IObservableVector_1__Controls_ICommandBarElement; event: IVectorChangedEventArgs); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.UI.Xaml.Controls.ICommandBarElement>
  }
  // Windows.Foundation.Collections.IObservableVector`1<Windows.UI.Xaml.Controls.ICommandBarElement>
  IObservableVector_1__Controls_ICommandBarElement = interface(IInspectable)
  ['{D5644006-717D-512D-8785-B48C17E73468}']
    function add_VectorChanged(vhnd: VectorChangedEventHandler_1__Controls_ICommandBarElement): EventRegistrationToken; safecall;
    procedure remove_VectorChanged(token: EventRegistrationToken); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IMemoryBufferReference
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Foundation.IMemoryBufferReference,Object>
  TypedEventHandler_2__IMemoryBufferReference__IInspectable = interface(IUnknown)
  ['{F4637D4A-0760-5431-BFC0-24EB1D4F6C4F}']
    procedure Invoke(sender: IMemoryBufferReference; args: IInspectable); safecall;
  end;

  {
  }
  // Windows.UI.Xaml.IExceptionRoutedEventArgsFactory
  IExceptionRoutedEventArgsFactory = interface(IInspectable)
  ['{BBA9826D-5D7A-44E7-B893-B2AE0DD24273}']
  end;

  {
  }
  // Windows.UI.Xaml.ISetterBaseFactory
  ISetterBaseFactory = interface(IInspectable)
  ['{81F8AD60-1CE8-469D-A667-16E37CEF8BA9}']
  end;

  {
  }
  // Windows.UI.Xaml.ITriggerActionFactory
  ITriggerActionFactory = interface(IInspectable)
  ['{68D2C0B9-3289-414F-8F6E-C6B97AEDDA03}']
  end;

  {
  }
  // Windows.UI.Xaml.ITriggerBaseFactory
  ITriggerBaseFactory = interface(IInspectable)
  ['{6A3B9E57-FC5D-42D0-8CB9-CA50667AF746}']
  end;

  {
  }
  // Windows.UI.Xaml.IUIElementFactory
  IUIElementFactory = interface(IInspectable)
  ['{B9EE93FE-A338-419F-AC32-91DCAADF5D08}']
  end;

  {
  }
  // Windows.UI.Xaml.Media.IGeometryFactory
  Media_IGeometryFactory = interface(IInspectable)
  ['{F65DAF23-D5FD-42F9-B32A-929C5A4B54E1}']
  end;

  {
  }
  // Windows.UI.Xaml.Media.IImageSourceFactory
  Media_IImageSourceFactory = interface(IInspectable)
  ['{297EC001-2540-4E5A-AB66-88035DD3DDB5}']
  end;

  {
  }
  // Windows.UI.Xaml.Media.IPathSegmentFactory
  Media_IPathSegmentFactory = interface(IInspectable)
  ['{2A1C0AAE-ECCD-4464-A148-6FFDB3AA281F}']
  end;

  {
  }
  // Windows.UI.Xaml.Media.ITransformFactory
  Media_ITransformFactory = interface(IInspectable)
  ['{1A955A66-7CF4-4320-B416-6181192FCC6D}']
  end;

  {
  }
  // Windows.UI.Xaml.Media.Animation.IEasingFunctionBaseFactory
  Media_Animation_IEasingFunctionBaseFactory = interface(IInspectable)
  ['{1830FE6A-F01B-43E0-B61F-B452A1C66FD2}']
  end;

  {
  }
  // Windows.UI.Xaml.Media.Animation.ITransitionFactory
  Media_Animation_ITransitionFactory = interface(IInspectable)
  ['{DC9AB2CF-3BC9-44AA-B3FC-883A83233A2C}']
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Object,Object>
  TypedEventHandler_2__IInspectable__IInspectable_Delegate_Base = interface(IUnknown)
  ['{C7E65CE2-FAD5-5E3B-9C58-186CA8C1DD57}']
  end;
  {
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Object,Object>
  TypedEventHandler_2__IInspectable__IInspectable = interface(TypedEventHandler_2__IInspectable__IInspectable_Delegate_Base)
  ['{C7E65CE2-FAD5-5E3B-9C58-186CA8C1DD57}']
    procedure Invoke(sender: IInspectable; args: IInspectable); safecall;
  end;

  // UsedAPI Interface
  {
  }
  // Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
  Automation_Provider_IIRawElementProviderSimple = interface(IInspectable)
  ['{EC752224-9B77-4720-BB21-4AC89FDB1AFD}']
  end;

  {
  // Used Types:  Int32
  // Used Types:  String
  // Used Types:  Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
  }
  // Windows.UI.Xaml.Automation.Provider.IAnnotationProvider
  Automation_Provider_IAnnotationProvider = interface(IInspectable)
  ['{95BA1417-4437-451B-9461-050A49B59D06}']
    function get_AnnotationTypeId: Integer; safecall;
    function get_AnnotationTypeName: HSTRING; safecall;
    function get_Author: HSTRING; safecall;
    function get_DateTime: HSTRING; safecall;
    function get_Target: Automation_Provider_IIRawElementProviderSimple; safecall;
    property AnnotationTypeId: Integer read get_AnnotationTypeId;
    property AnnotationTypeName: HSTRING read get_AnnotationTypeName;
    property Author: HSTRING read get_Author;
    property DateTime: HSTRING read get_DateTime;
    property Target: Automation_Provider_IIRawElementProviderSimple read get_Target;
  end;

  {
  // Used Types:  Windows.UI.Xaml.Automation.DockPosition
  }
  // Windows.UI.Xaml.Automation.Provider.IDockProvider
  Automation_Provider_IDockProvider = interface(IInspectable)
  ['{48C243F8-78B1-44A0-AC5F-750757BCDE3C}']
    function get_DockPosition: Automation_DockPosition; safecall;
    procedure SetDockPosition(dockPosition: Automation_DockPosition); safecall;
    property DockPosition: Automation_DockPosition read get_DockPosition;
  end;

  {
  // Used Types:  Boolean
  // Used Types:  String
  // Used Types:  String[]
  // Used Types:  Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple[]
  }
  // Windows.UI.Xaml.Automation.Provider.IDragProvider
  Automation_Provider_IDragProvider = interface(IInspectable)
  ['{2E7786A9-7FFC-4F57-B965-1EF1F373F546}']
    function get_IsGrabbed: Boolean; safecall;
    function get_DropEffect: HSTRING; safecall;
    function get_DropEffects(resultSize: Cardinal; resultValue: PHSTRING): HRESULT; stdcall;
    function GetGrabbedItems(resultSize: Cardinal; resultValue: PAutomation_Provider_IIRawElementProviderSimple): HRESULT; stdcall;
    property DropEffect: HSTRING read get_DropEffect;
    // property DropEffects: PHSTRING read get_DropEffects;
    property IsGrabbed: Boolean read get_IsGrabbed;
  end;

  {
  // Used Types:  Int32
  // Used Types:  Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
  }
  // Windows.UI.Xaml.Automation.Provider.IGridItemProvider
  Automation_Provider_IGridItemProvider = interface(IInspectable)
  ['{FFF3683C-7407-45BB-A936-DF3ED6D3837D}']
    function get_Column: Integer; safecall;
    function get_ColumnSpan: Integer; safecall;
    function get_ContainingGrid: Automation_Provider_IIRawElementProviderSimple; safecall;
    function get_Row: Integer; safecall;
    function get_RowSpan: Integer; safecall;
    property Column: Integer read get_Column;
    property ColumnSpan: Integer read get_ColumnSpan;
    property ContainingGrid: Automation_Provider_IIRawElementProviderSimple read get_ContainingGrid;
    property Row: Integer read get_Row;
    property RowSpan: Integer read get_RowSpan;
  end;

  {
  // Used Types:  Int32
  // Used Types:  Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
  }
  // Windows.UI.Xaml.Automation.Provider.IGridProvider
  Automation_Provider_IGridProvider = interface(IInspectable)
  ['{8B62B7A0-932C-4490-9A13-02FDB39A8F5B}']
    function get_ColumnCount: Integer; safecall;
    function get_RowCount: Integer; safecall;
    function GetItem(row: Integer; column: Integer): Automation_Provider_IIRawElementProviderSimple; safecall;
    property ColumnCount: Integer read get_ColumnCount;
    property RowCount: Integer read get_RowCount;
  end;

  {
  // Used Types:  Int32
  // Used Types:  Int32[]
  // Used Types:  String
  }
  // Windows.UI.Xaml.Automation.Provider.IMultipleViewProvider
  Automation_Provider_IMultipleViewProvider = interface(IInspectable)
  ['{D014E196-0E50-4843-A5D2-C22897C8845A}']
    function get_CurrentView: Integer; safecall;
    function GetSupportedViews(resultSize: Cardinal; resultValue: PInteger): HRESULT; stdcall;
    function GetViewName(viewId: Integer): HSTRING; safecall;
    procedure SetCurrentView(viewId: Integer); safecall;
    property CurrentView: Integer read get_CurrentView;
  end;

  {
  // Used Types:  Object
  }
  // Windows.UI.Xaml.Automation.Provider.IObjectModelProvider
  Automation_Provider_IObjectModelProvider = interface(IInspectable)
  ['{C3CA36B9-0793-4ED0-BBF4-9FF4E0F98F80}']
    function GetUnderlyingObjectModel: IInspectable; safecall;
  end;

  {
  // Used Types:  String
  // Used Types:  Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple[]
  // Used Types:  Windows.UI.Xaml.Automation.AnnotationType[]
  }
  // Windows.UI.Xaml.Automation.Provider.ISpreadsheetItemProvider
  Automation_Provider_ISpreadsheetItemProvider = interface(IInspectable)
  ['{EBDE8F92-6015-4826-B719-47521A81C67E}']
    function get_Formula: HSTRING; safecall;
    function GetAnnotationObjects(resultSize: Cardinal; resultValue: PAutomation_Provider_IIRawElementProviderSimple): HRESULT; stdcall;
    function GetAnnotationTypes(resultSize: Cardinal; resultValue: PAutomation_AnnotationType): HRESULT; stdcall;
    property Formula: HSTRING read get_Formula;
  end;

  {
  // Used Types:  Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
  // Used Types:  String
  }
  // Windows.UI.Xaml.Automation.Provider.ISpreadsheetProvider
  Automation_Provider_ISpreadsheetProvider = interface(IInspectable)
  ['{15359093-BD99-4CFD-9F07-3B14B315E23D}']
    function GetItemByName(name: HSTRING): Automation_Provider_IIRawElementProviderSimple; safecall;
  end;

  {
  // Used Types:  String
  // Used Types:  Windows.UI.Color
  // Used Types:  Int32
  }
  // Windows.UI.Xaml.Automation.Provider.IStylesProvider
  Automation_Provider_IStylesProvider = interface(IInspectable)
  ['{1A5B7A17-7C01-4BEC-9CD4-2DFA7DC246CD}']
    function get_ExtendedProperties: HSTRING; safecall;
    function get_FillColor: Color; safecall;
    function get_FillPatternColor: Color; safecall;
    function get_FillPatternStyle: HSTRING; safecall;
    function get_Shape: HSTRING; safecall;
    function get_StyleId: Integer; safecall;
    function get_StyleName: HSTRING; safecall;
    property ExtendedProperties: HSTRING read get_ExtendedProperties;
    property FillColor: Color read get_FillColor;
    property FillPatternColor: Color read get_FillPatternColor;
    property FillPatternStyle: HSTRING read get_FillPatternStyle;
    property Shape: HSTRING read get_Shape;
    property StyleId: Integer read get_StyleId;
    property StyleName: HSTRING read get_StyleName;
  end;

  {
  // Used Types:  Windows.UI.Xaml.Automation.SynchronizedInputType
  }
  // Windows.UI.Xaml.Automation.Provider.ISynchronizedInputProvider
  Automation_Provider_ISynchronizedInputProvider = interface(IInspectable)
  ['{3D60CECB-DA54-4AA3-B915-E3244427D4AC}']
    procedure Cancel; safecall;
    procedure StartListening(inputType: Automation_SynchronizedInputType); safecall;
  end;

  {
  // Used Types:  Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple[]
  }
  // Windows.UI.Xaml.Automation.Provider.ITableItemProvider
  Automation_Provider_ITableItemProvider = interface(IInspectable)
  ['{3B2C49CD-1DE2-4EE2-A3E1-FB553559D15D}']
    function GetColumnHeaderItems(resultSize: Cardinal; resultValue: PAutomation_Provider_IIRawElementProviderSimple): HRESULT; stdcall;
    function GetRowHeaderItems(resultSize: Cardinal; resultValue: PAutomation_Provider_IIRawElementProviderSimple): HRESULT; stdcall;
  end;

  {
  // Used Types:  Windows.UI.Xaml.Automation.RowOrColumnMajor
  // Used Types:  Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple[]
  }
  // Windows.UI.Xaml.Automation.Provider.ITableProvider
  Automation_Provider_ITableProvider = interface(IInspectable)
  ['{7A8ED399-6824-4595-BAB3-464BC9A04417}']
    function get_RowOrColumnMajor: Automation_RowOrColumnMajor; safecall;
    function GetColumnHeaders(resultSize: Cardinal; resultValue: PAutomation_Provider_IIRawElementProviderSimple): HRESULT; stdcall;
    function GetRowHeaders(resultSize: Cardinal; resultValue: PAutomation_Provider_IIRawElementProviderSimple): HRESULT; stdcall;
    property RowOrColumnMajor: Automation_RowOrColumnMajor read get_RowOrColumnMajor;
  end;

  {
  // Used Types:  Windows.UI.Xaml.Automation.Provider.ITextRangeProvider
  // Used Types:  Boolean
  // Used Types:  Int32
  // Used Types:  Windows.UI.Xaml.Automation.Text.TextPatternRangeEndpoint
  // Used Types:  Windows.UI.Xaml.Automation.Text.TextUnit
  // Used Types:  Object
  // Used Types:  String
  // Used Types:  Double
  // Used Types:  Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
  // Used Types:  Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple[]
  }
  // Windows.UI.Xaml.Automation.Provider.ITextRangeProvider
  Automation_Provider_ITextRangeProvider = interface(IInspectable)
  ['{0274688D-06E9-4F66-9446-28A5BE98FBD0}']
    function Clone: Automation_Provider_ITextRangeProvider; safecall;
    function Compare(textRangeProvider: Automation_Provider_ITextRangeProvider): Boolean; safecall;
    function CompareEndpoints(endpoint: Automation_Text_TextPatternRangeEndpoint; textRangeProvider: Automation_Provider_ITextRangeProvider; targetEndpoint: Automation_Text_TextPatternRangeEndpoint): Integer; safecall;
    procedure ExpandToEnclosingUnit(&unit: Automation_Text_TextUnit); safecall;
    function FindAttribute(attributeId: Integer; value: IInspectable; backward: Boolean): Automation_Provider_ITextRangeProvider; safecall;
    function FindText(text: HSTRING; backward: Boolean; ignoreCase: Boolean): Automation_Provider_ITextRangeProvider; safecall;
    function GetAttributeValue(attributeId: Integer): IInspectable; safecall;
    procedure GetBoundingRectangles(returnValueSize: Cardinal; returnValue: PDouble); safecall;
    function GetEnclosingElement: Automation_Provider_IIRawElementProviderSimple; safecall;
    function GetText(maxLength: Integer): HSTRING; safecall;
    function Move(&unit: Automation_Text_TextUnit; count: Integer): Integer; safecall;
    function MoveEndpointByUnit(endpoint: Automation_Text_TextPatternRangeEndpoint; &unit: Automation_Text_TextUnit; count: Integer): Integer; safecall;
    procedure MoveEndpointByRange(endpoint: Automation_Text_TextPatternRangeEndpoint; textRangeProvider: Automation_Provider_ITextRangeProvider; targetEndpoint: Automation_Text_TextPatternRangeEndpoint); safecall;
    procedure Select; safecall;
    procedure AddToSelection; safecall;
    procedure RemoveFromSelection; safecall;
    procedure ScrollIntoView(alignToTop: Boolean); safecall;
    function GetChildren(resultSize: Cardinal; resultValue: PAutomation_Provider_IIRawElementProviderSimple): HRESULT; stdcall;
  end;

  {
  // Used Types:  Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
  // Used Types:  Windows.UI.Xaml.Automation.Provider.ITextRangeProvider
  }
  // Windows.UI.Xaml.Automation.Provider.ITextChildProvider
  Automation_Provider_ITextChildProvider = interface(IInspectable)
  ['{1133C336-A89B-4130-9BE6-55E33334F557}']
    function get_TextContainer: Automation_Provider_IIRawElementProviderSimple; safecall;
    function get_TextRange: Automation_Provider_ITextRangeProvider; safecall;
    property TextContainer: Automation_Provider_IIRawElementProviderSimple read get_TextContainer;
    property TextRange: Automation_Provider_ITextRangeProvider read get_TextRange;
  end;

  {
  // Used Types:  Windows.UI.Xaml.Automation.Provider.ITextRangeProvider
  // Used Types:  Windows.UI.Xaml.Automation.SupportedTextSelection
  // Used Types:  Windows.UI.Xaml.Automation.Provider.ITextRangeProvider[]
  // Used Types:  Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
  // Used Types:  Windows.Foundation.Point
  }
  // Windows.UI.Xaml.Automation.Provider.ITextProvider
  Automation_Provider_ITextProvider = interface(IInspectable)
  ['{DB5BBC9F-4807-4F2A-8678-1B13F3C60E22}']
    function get_DocumentRange: Automation_Provider_ITextRangeProvider; safecall;
    function get_SupportedTextSelection: Automation_SupportedTextSelection; safecall;
    function GetSelection(resultSize: Cardinal; resultValue: PAutomation_Provider_ITextRangeProvider): HRESULT; stdcall;
    function GetVisibleRanges(resultSize: Cardinal; resultValue: PAutomation_Provider_ITextRangeProvider): HRESULT; stdcall;
    function RangeFromChild(childElement: Automation_Provider_IIRawElementProviderSimple): Automation_Provider_ITextRangeProvider; safecall;
    function RangeFromPoint(screenLocation: TPointF): Automation_Provider_ITextRangeProvider; safecall;
    property DocumentRange: Automation_Provider_ITextRangeProvider read get_DocumentRange;
    property SupportedTextSelection: Automation_SupportedTextSelection read get_SupportedTextSelection;
  end;

  {
  // Used Types:  Windows.UI.Xaml.Automation.Provider.ITextRangeProvider
  // Used Types:  Windows.UI.Xaml.Automation.Provider.IIRawElementProviderSimple
  // Used Types:  Boolean
  }
  // Windows.UI.Xaml.Automation.Provider.ITextProvider2
  Automation_Provider_ITextProvider2 = interface(IInspectable)
  ['{DF1D48BC-0487-4E7F-9D5E-F09E77E41246}']
    function RangeFromAnnotation(annotationElement: Automation_Provider_IIRawElementProviderSimple): Automation_Provider_ITextRangeProvider; safecall;
    function GetCaretRange(out isActive: Boolean): Automation_Provider_ITextRangeProvider; safecall;
  end;

  {
  }
  // Windows.UI.Xaml.Automation.Provider.ITextRangeProvider2
  Automation_Provider_ITextRangeProvider2 = interface(IInspectable)
  ['{D3BE3DFB-9F54-4642-A7A5-5C18D5EE2A3F}']
    procedure ShowContextMenu; safecall;
  end;

  {
  // Used Types:  Windows.UI.Xaml.Interop.TypeName
  // Used Types:  String
  // Used Types:  Object
  // Used Types:  Boolean
  }
  // Windows.UI.Xaml.Data.ICustomProperty
  Data_ICustomProperty = interface(IInspectable)
  ['{30DA92C0-23E8-42A0-AE7C-734A0E5D2782}']
    function get_Type: Interop_TypeName; safecall;
    function get_Name: HSTRING; safecall;
    function GetValue(target: IInspectable): IInspectable; safecall;
    procedure SetValue(target: IInspectable; value: IInspectable); safecall;
    function GetIndexedValue(target: IInspectable; index: IInspectable): IInspectable; safecall;
    procedure SetIndexedValue(target: IInspectable; value: IInspectable; index: IInspectable); safecall;
    function get_CanWrite: Boolean; safecall;
    function get_CanRead: Boolean; safecall;
    property CanRead: Boolean read get_CanRead;
    property CanWrite: Boolean read get_CanWrite;
    property Name: HSTRING read get_Name;
    property &Type: Interop_TypeName read get_Type;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.UI.Xaml.Data.LoadMoreItemsResult>
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.UI.Xaml.Data.ISupportIncrementalLoading
  Data_ISupportIncrementalLoading = interface(IInspectable)
  ['{7F5EE992-7694-4E6C-A51B-E34BF43DE743}']
    function LoadMoreItemsAsync(count: Cardinal): IAsyncOperation_1__Data_LoadMoreItemsResult; safecall;
    function get_HasMoreItems: Boolean; safecall;
    property HasMoreItems: Boolean read get_HasMoreItems;
  end;

  {
  }
  // Windows.UI.Xaml.Data.IBindingExpressionBaseFactory
  Data_IBindingExpressionBaseFactory = interface(IInspectable)
  ['{EA7116A7-C2D9-4375-B471-66B9C48C7930}']
  end;

  {
  }
  // Windows.UI.Xaml.Data.IBindingExpressionFactory
  Data_IBindingExpressionFactory = interface(IInspectable)
  ['{1CB55CD9-DB72-40B3-A2B5-24EE6EA5C328}']
  end;

  {
  // Used Types:  Windows.ApplicationModel.Activation.ISplashScreen
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.Activation.ISplashScreen,Object>
  TypedEventHandler_2__Activation_ISplashScreen__IInspectable = interface(IUnknown)
  ['{359B8887-2FA6-5405-A4AF-642C9FDACC93}']
    procedure Invoke(sender: Activation_ISplashScreen; args: IInspectable); safecall;
  end;

  {
  // Used Types:  Double
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Double>
  IIterator_1__Double = interface(IInspectable)
  ['{638A2CF4-F474-5318-9055-141CB909AC4B}']
    function get_Current: Double; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PDouble): Cardinal; safecall;
    property Current: Double read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Double>
  }
  // Windows.Foundation.Collections.IIterable`1<Double>
  IIterable_1__Double = interface(IInspectable)
  ['{C738964E-9C64-5BCE-B5CE-61E9A282EC4A}']
    function First: IIterator_1__Double; safecall;
  end;

  {
  // Used Types:  Double
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Double>
  IVectorView_1__Double = interface(IInspectable)
  ['{AF7586A8-6B21-5F61-BFF1-1B682293AD96}']
    function GetAt(index: Cardinal): Double; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Double; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDouble): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Double
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Double>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Double>
  IVector_1__Double = interface(IInspectable)
  ['{F452D23C-BF05-5F3E-88E7-D17A6716B911}']
    function GetAt(index: Cardinal): Double; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Double; safecall;
    function IndexOf(value: Double; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Double); safecall;
    procedure InsertAt(index: Cardinal; value: Double); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Double); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDouble): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PDouble); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.UI.Xaml.Media.Imaging.SvgImageSourceLoadStatus>
  AsyncOperationCompletedHandler_1__Media_Imaging_SvgImageSourceLoadStatus_Delegate_Base = interface(IUnknown)
  ['{7C8BC668-4E0B-5924-B7E7-234A11D63D61}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.UI.Xaml.Media.Imaging.SvgImageSourceLoadStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.UI.Xaml.Media.Imaging.SvgImageSourceLoadStatus>
  AsyncOperationCompletedHandler_1__Media_Imaging_SvgImageSourceLoadStatus = interface(AsyncOperationCompletedHandler_1__Media_Imaging_SvgImageSourceLoadStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Media_Imaging_SvgImageSourceLoadStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.UI.Xaml.Media.Imaging.SvgImageSourceLoadStatus>
  IAsyncOperation_1__Media_Imaging_SvgImageSourceLoadStatus_Base = interface(IInspectable)
  ['{F19DF5C2-2B78-53A9-8D38-5CA8DBB5DBC6}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.UI.Xaml.Media.Imaging.SvgImageSourceLoadStatus>
  // Used Types:  Windows.UI.Xaml.Media.Imaging.SvgImageSourceLoadStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.UI.Xaml.Media.Imaging.SvgImageSourceLoadStatus>
  IAsyncOperation_1__Media_Imaging_SvgImageSourceLoadStatus = interface(IAsyncOperation_1__Media_Imaging_SvgImageSourceLoadStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Media_Imaging_SvgImageSourceLoadStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Media_Imaging_SvgImageSourceLoadStatus; safecall;
    function GetResults: Media_Imaging_SvgImageSourceLoadStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Media_Imaging_SvgImageSourceLoadStatus read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Object
  // Used Types:  Windows.UI.Xaml.Automation.Peers.AutomationNavigationDirection
  }
  // Windows.UI.Xaml.Automation.Provider.ICustomNavigationProvider
  Automation_Provider_ICustomNavigationProvider = interface(IInspectable)
  ['{2BD8A6D0-2FA3-4717-B28C-4917CE54928D}']
    function NavigateCustom(direction: Automation_Peers_AutomationNavigationDirection): IInspectable; safecall;
  end;

  {
  // Used Types:  Windows.UI.Xaml.Automation.Provider.ITextRangeProvider
  }
  // Windows.UI.Xaml.Automation.Provider.ITextEditProvider
  Automation_Provider_ITextEditProvider = interface(IInspectable)
  ['{EA3605B4-3A05-400E-B5F9-4E91B40F6176}']
    function GetActiveComposition: Automation_Provider_ITextRangeProvider; safecall;
    function GetConversionTarget: Automation_Provider_ITextRangeProvider; safecall;
  end;

  {
  // Used Types:  Object
  // Used Types:  Windows.Foundation.Collections.IObservableVector`1<Object>
  }
  // Windows.UI.Xaml.Data.ICollectionViewGroup
  Data_ICollectionViewGroup = interface(IInspectable)
  ['{7E01B9D8-D7B5-48B6-B31C-5BB5BDF5F09B}']
    function get_Group: IInspectable; safecall;
    function get_GroupItems: IObservableVector_1__IInspectable; safecall;
    property Group: IInspectable read get_Group;
    property GroupItems: IObservableVector_1__IInspectable read get_GroupItems;
  end;

  {
  // Used Types:  Int32
  // Used Types:  Object
  }
  // Windows.UI.Xaml.Markup.IComponentConnector
  Markup_IComponentConnector = interface(IInspectable)
  ['{F6790987-E6E5-47F2-92C6-ECCCE4BA159A}']
    procedure Connect(connectionId: Integer; target: IInspectable); safecall;
  end;

  {
  // Used Types:  Windows.UI.Xaml.Markup.IComponentConnector
  // Used Types:  Int32
  // Used Types:  Object
  }
  // Windows.UI.Xaml.Markup.IComponentConnector2
  Markup_IComponentConnector2 = interface(IInspectable)
  ['{DC8F368B-ECCC-498E-B139-91142254D7AE}']
    function GetBindingConnector(connectionId: Integer; target: IInspectable): Markup_IComponentConnector; safecall;
  end;

  {
  // Used Types:  Object
  // Used Types:  Int32
  }
  // Windows.UI.Xaml.Markup.IDataTemplateComponent
  Markup_IDataTemplateComponent = interface(IInspectable)
  ['{08429DC8-8AB0-4747-AA9A-FEADFC8DA8E1}']
    procedure Recycle; safecall;
    procedure ProcessBindings(item: IInspectable; itemIndex: Integer; phase: Integer; out nextPhase: Integer); safecall;
  end;

  {
  // Used Types:  Windows.UI.Xaml.Markup.IXamlType
  // Used Types:  Windows.UI.Xaml.Markup.IXamlMember
  // Used Types:  String
  // Used Types:  Boolean
  // Used Types:  Windows.UI.Xaml.Interop.TypeName
  // Used Types:  Object
  }
  // Windows.UI.Xaml.Markup.IXamlType
  Markup_IXamlType = interface(IInspectable)
  ['{7920EAB1-A2E5-479A-BD50-6CEF3C0B4970}']
    function get_BaseType: Markup_IXamlType; safecall;
    function get_ContentProperty: Markup_IXamlMember; safecall;
    function get_FullName: HSTRING; safecall;
    function get_IsArray: Boolean; safecall;
    function get_IsCollection: Boolean; safecall;
    function get_IsConstructible: Boolean; safecall;
    function get_IsDictionary: Boolean; safecall;
    function get_IsMarkupExtension: Boolean; safecall;
    function get_IsBindable: Boolean; safecall;
    function get_ItemType: Markup_IXamlType; safecall;
    function get_KeyType: Markup_IXamlType; safecall;
    function get_UnderlyingType: Interop_TypeName; safecall;
    function ActivateInstance: IInspectable; safecall;
    function CreateFromString(value: HSTRING): IInspectable; safecall;
    function GetMember(name: HSTRING): Markup_IXamlMember; safecall;
    procedure AddToVector(instance: IInspectable; value: IInspectable); safecall;
    procedure AddToMap(instance: IInspectable; key: IInspectable; value: IInspectable); safecall;
    procedure RunInitializer; safecall;
    property BaseType: Markup_IXamlType read get_BaseType;
    property ContentProperty: Markup_IXamlMember read get_ContentProperty;
    property FullName: HSTRING read get_FullName;
    property IsArray: Boolean read get_IsArray;
    property IsBindable: Boolean read get_IsBindable;
    property IsCollection: Boolean read get_IsCollection;
    property IsConstructible: Boolean read get_IsConstructible;
    property IsDictionary: Boolean read get_IsDictionary;
    property IsMarkupExtension: Boolean read get_IsMarkupExtension;
    property ItemType: Markup_IXamlType read get_ItemType;
    property KeyType: Markup_IXamlType read get_KeyType;
    property UnderlyingType: Interop_TypeName read get_UnderlyingType;
  end;

  {
  // Used Types:  Boolean
  // Used Types:  String
  // Used Types:  Windows.UI.Xaml.Markup.IXamlType
  // Used Types:  Object
  }
  // Windows.UI.Xaml.Markup.IXamlMember
  Markup_IXamlMember = interface(IInspectable)
  ['{C541F58C-43A9-4216-B718-E0B11B14E93E}']
    function get_IsAttachable: Boolean; safecall;
    function get_IsDependencyProperty: Boolean; safecall;
    function get_IsReadOnly: Boolean; safecall;
    function get_Name: HSTRING; safecall;
    function get_TargetType: Markup_IXamlType; safecall;
    function get_Type: Markup_IXamlType; safecall;
    function GetValue(instance: IInspectable): IInspectable; safecall;
    procedure SetValue(instance: IInspectable; value: IInspectable); safecall;
    property IsAttachable: Boolean read get_IsAttachable;
    property IsDependencyProperty: Boolean read get_IsDependencyProperty;
    property IsReadOnly: Boolean read get_IsReadOnly;
    property Name: HSTRING read get_Name;
    property TargetType: Markup_IXamlType read get_TargetType;
    property &Type: Markup_IXamlType read get_Type;
  end;

  {
  // Used Types:  Windows.UI.Xaml.Markup.IXamlType
  // Used Types:  Windows.UI.Xaml.Interop.TypeName
  // Used Types:  String
  // Used Types:  Windows.UI.Xaml.Markup.XmlnsDefinition[]
  }
  // Windows.UI.Xaml.Markup.IXamlMetadataProvider
  Markup_IXamlMetadataProvider = interface(IInspectable)
  ['{B3765D69-68A5-4B32-8861-FDB90C1F5836}']
    function GetXamlType(&type: Interop_TypeName): Markup_IXamlType; overload; safecall;
    function GetXamlType(fullName: HSTRING): Markup_IXamlType; overload; safecall;
    function GetXmlnsDefinitions(resultSize: Cardinal; resultValue: PMarkup_XmlnsDefinition): HRESULT; stdcall;
  end;

  {
  }
  // Windows.UI.Xaml.Controls.IInkToolbarMenuButtonFactory
  Controls_IInkToolbarMenuButtonFactory = interface(IInspectable)
  ['{7A463A9D-5DC7-44A7-AFD0-2B685CB9A96C}']
  end;

  {
  }
  // Windows.UI.Xaml.Controls.IInkToolbarToggleButtonFactory
  Controls_IInkToolbarToggleButtonFactory = interface(IInspectable)
  ['{B2F90710-E5A1-4365-9D1A-E5B7AD8B9668}']
  end;

  {
  }
  // Windows.UI.Xaml.Controls.IInkToolbarToolButtonFactory
  Controls_IInkToolbarToolButtonFactory = interface(IInspectable)
  ['{6293BF4B-89FE-4ED0-A1A6-88D3EBA917B2}']
  end;

  {
  }
  // Windows.UI.Xaml.Controls.IInkToolbarPenButtonFactory
  Controls_IInkToolbarPenButtonFactory = interface(IInspectable)
  ['{B1463D21-59CB-4A83-92E1-692842797B2E}']
  end;

  {
  // Used Types:  Windows.UI.Xaml.Thickness
  }
  // Windows.Foundation.IReference`1<Windows.UI.Xaml.Thickness>
  IReference_1__Thickness = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: Thickness; safecall;
    property Value: Thickness read get_Value;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Object>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IInspectable_Delegate_Base = interface(IUnknown)
  ['{261A9D81-F58F-5283-9461-CA3E31C1123C}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Object>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Object>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IInspectable = interface(AsyncOperationCompletedHandler_1__IVectorView_1__IInspectable_Delegate_Base)
  ['{261A9D81-F58F-5283-9461-CA3E31C1123C}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__IInspectable; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Object>>
  IAsyncOperation_1__IVectorView_1__IInspectable_Base = interface(IInspectable)
  ['{D671D332-22AA-5597-8DCC-2459EAB49418}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Object>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Object>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Object>>
  IAsyncOperation_1__IVectorView_1__IInspectable = interface(IAsyncOperation_1__IVectorView_1__IInspectable_Base)
  ['{D671D332-22AA-5597-8DCC-2459EAB49418}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__IInspectable); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IInspectable; safecall;
    function GetResults: IVectorView_1__IInspectable; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IInspectable read get_Completed write put_Completed;
  end;

  {
  // Used Types:  String
  }
  // Windows.UI.Xaml.Hosting.IXamlUIPresenterHost
  Hosting_IXamlUIPresenterHost = interface(IInspectable)
  ['{AAFB84CD-9F6D-4F80-AC2C-0E6CB9F31659}']
    function ResolveFileResource(path: HSTRING): HSTRING; safecall;
  end;

  {
  // Used Types:  String
  }
  // Windows.UI.Xaml.Hosting.IXamlUIPresenterHost2
  Hosting_IXamlUIPresenterHost2 = interface(IInspectable)
  ['{61595672-7CA4-4A21-B56A-88F4812388CA}']
    function GetGenericXamlFilePath: HSTRING; safecall;
  end;


  // Emit Forwarded classes

implementation

  // Emit Classes Implementation

end.
