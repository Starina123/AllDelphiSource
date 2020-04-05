{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.GraphicsRT;

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
  Winapi.ServicesRT, 
  Winapi.SystemRT, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.Graphics.Imaging.IBitmapBuffer
  Imaging_IBitmapBuffer = interface;
  PImaging_IBitmapBuffer = ^Imaging_IBitmapBuffer;

  // Windows.Graphics.Imaging.ISoftwareBitmap
  Imaging_ISoftwareBitmap = interface;
  PImaging_ISoftwareBitmap = ^Imaging_ISoftwareBitmap;

  // Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
  DirectX_Direct3D11_IDirect3DSurface = interface;
  PDirectX_Direct3D11_IDirect3DSurface = ^DirectX_Direct3D11_IDirect3DSurface;

  // Windows.Graphics.Imaging.IBitmapTypedValue
  Imaging_IBitmapTypedValue = interface;
  PImaging_IBitmapTypedValue = ^Imaging_IBitmapTypedValue;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>
  IKeyValuePair_2__HSTRING__Imaging_IBitmapTypedValue = interface;
  PIKeyValuePair_2__HSTRING__Imaging_IBitmapTypedValue = ^IKeyValuePair_2__HSTRING__Imaging_IBitmapTypedValue;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>>
  IIterator_1__IKeyValuePair_2__HSTRING__Imaging_IBitmapTypedValue = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__Imaging_IBitmapTypedValue = ^IIterator_1__IKeyValuePair_2__HSTRING__Imaging_IBitmapTypedValue;

  // Windows.Foundation.Collections.IMapView`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>
  IMapView_2__HSTRING__Imaging_IBitmapTypedValue = interface;
  PIMapView_2__HSTRING__Imaging_IBitmapTypedValue = ^IMapView_2__HSTRING__Imaging_IBitmapTypedValue;

  // Windows.Foundation.Collections.IMap`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>
  IMap_2__HSTRING__Imaging_IBitmapTypedValue = interface;
  PIMap_2__HSTRING__Imaging_IBitmapTypedValue = ^IMap_2__HSTRING__Imaging_IBitmapTypedValue;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMap`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>>
  AsyncOperationCompletedHandler_1__IMap_2__HSTRING__Imaging_IBitmapTypedValue = interface;
  PAsyncOperationCompletedHandler_1__IMap_2__HSTRING__Imaging_IBitmapTypedValue = ^AsyncOperationCompletedHandler_1__IMap_2__HSTRING__Imaging_IBitmapTypedValue;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMap`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>>
  IAsyncOperation_1__IMap_2__HSTRING__Imaging_IBitmapTypedValue = interface;
  PIAsyncOperation_1__IMap_2__HSTRING__Imaging_IBitmapTypedValue = ^IAsyncOperation_1__IMap_2__HSTRING__Imaging_IBitmapTypedValue;

  // Windows.Graphics.Imaging.IBitmapPropertiesView
  Imaging_IBitmapPropertiesView = interface;
  PImaging_IBitmapPropertiesView = ^Imaging_IBitmapPropertiesView;

  // Windows.Graphics.Imaging.IPixelDataProvider
  Imaging_IPixelDataProvider = interface;
  PImaging_IPixelDataProvider = ^Imaging_IPixelDataProvider;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Imaging.IPixelDataProvider>
  AsyncOperationCompletedHandler_1__Imaging_IPixelDataProvider = interface;
  PAsyncOperationCompletedHandler_1__Imaging_IPixelDataProvider = ^AsyncOperationCompletedHandler_1__Imaging_IPixelDataProvider;

  // Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Imaging.IPixelDataProvider>
  IAsyncOperation_1__Imaging_IPixelDataProvider = interface;
  PIAsyncOperation_1__Imaging_IPixelDataProvider = ^IAsyncOperation_1__Imaging_IPixelDataProvider;

  // Windows.Graphics.Imaging.IBitmapTransform
  Imaging_IBitmapTransform = interface;
  PImaging_IBitmapTransform = ^Imaging_IBitmapTransform;

  // Windows.Graphics.Imaging.IBitmapFrame
  Imaging_IBitmapFrame = interface;
  PImaging_IBitmapFrame = ^Imaging_IBitmapFrame;

  // Windows.Graphics.Printing3D.IPrint3DTaskCompletedEventArgs
  Printing3D_IPrint3DTaskCompletedEventArgs = interface;
  PPrinting3D_IPrint3DTaskCompletedEventArgs = ^Printing3D_IPrint3DTaskCompletedEventArgs;

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

  // Windows.Graphics.Printing3D.IPrinting3DTextureResource
  Printing3D_IPrinting3DTextureResource = interface;
  PPrinting3D_IPrinting3DTextureResource = ^Printing3D_IPrinting3DTextureResource;

  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DTextureResource>
  IIterator_1__Printing3D_IPrinting3DTextureResource = interface;
  PIIterator_1__Printing3D_IPrinting3DTextureResource = ^IIterator_1__Printing3D_IPrinting3DTextureResource;

  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DTextureResource>
  IIterable_1__Printing3D_IPrinting3DTextureResource = interface;
  PIIterable_1__Printing3D_IPrinting3DTextureResource = ^IIterable_1__Printing3D_IPrinting3DTextureResource;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DTextureResource>
  IVectorView_1__Printing3D_IPrinting3DTextureResource = interface;
  PIVectorView_1__Printing3D_IPrinting3DTextureResource = ^IVectorView_1__Printing3D_IPrinting3DTextureResource;

  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DTextureResource>
  IVector_1__Printing3D_IPrinting3DTextureResource = interface;
  PIVector_1__Printing3D_IPrinting3DTextureResource = ^IVector_1__Printing3D_IPrinting3DTextureResource;

  // Windows.Graphics.Printing3D.IPrinting3DModelTexture
  Printing3D_IPrinting3DModelTexture = interface;
  PPrinting3D_IPrinting3DModelTexture = ^Printing3D_IPrinting3DModelTexture;

  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DModelTexture>
  IIterator_1__Printing3D_IPrinting3DModelTexture = interface;
  PIIterator_1__Printing3D_IPrinting3DModelTexture = ^IIterator_1__Printing3D_IPrinting3DModelTexture;

  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DModelTexture>
  IIterable_1__Printing3D_IPrinting3DModelTexture = interface;
  PIIterable_1__Printing3D_IPrinting3DModelTexture = ^IIterable_1__Printing3D_IPrinting3DModelTexture;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DModelTexture>
  IVectorView_1__Printing3D_IPrinting3DModelTexture = interface;
  PIVectorView_1__Printing3D_IPrinting3DModelTexture = ^IVectorView_1__Printing3D_IPrinting3DModelTexture;

  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DModelTexture>
  IVector_1__Printing3D_IPrinting3DModelTexture = interface;
  PIVector_1__Printing3D_IPrinting3DModelTexture = ^IVector_1__Printing3D_IPrinting3DModelTexture;

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

  // Windows.Foundation.Collections.IMap`2<String,Object>
  IMap_2__HSTRING__IInspectable = interface;
  PIMap_2__HSTRING__IInspectable = ^IMap_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IMapChangedEventArgs`1<String>
  IMapChangedEventArgs_1__HSTRING = interface;
  PIMapChangedEventArgs_1__HSTRING = ^IMapChangedEventArgs_1__HSTRING;

  // Windows.Foundation.Collections.MapChangedEventHandler`2<String,Object>
  MapChangedEventHandler_2__HSTRING__IInspectable = interface;
  PMapChangedEventHandler_2__HSTRING__IInspectable = ^MapChangedEventHandler_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IObservableMap`2<String,Object>
  IObservableMap_2__HSTRING__IInspectable = interface;
  PIObservableMap_2__HSTRING__IInspectable = ^IObservableMap_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IIterator`1<UInt32>
  IIterator_1__Cardinal = interface;
  PIIterator_1__Cardinal = ^IIterator_1__Cardinal;

  // Windows.Foundation.Collections.IIterable`1<UInt32>
  IIterable_1__Cardinal = interface;
  PIIterable_1__Cardinal = ^IIterable_1__Cardinal;

  // Windows.Foundation.Collections.IVectorView`1<UInt32>
  IVectorView_1__Cardinal = interface;
  PIVectorView_1__Cardinal = ^IVectorView_1__Cardinal;

  // Windows.Graphics.Printing3D.IPrinting3DMeshVerificationResult
  Printing3D_IPrinting3DMeshVerificationResult = interface;
  PPrinting3D_IPrinting3DMeshVerificationResult = ^Printing3D_IPrinting3DMeshVerificationResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Printing3D.IPrinting3DMeshVerificationResult>
  AsyncOperationCompletedHandler_1__Printing3D_IPrinting3DMeshVerificationResult = interface;
  PAsyncOperationCompletedHandler_1__Printing3D_IPrinting3DMeshVerificationResult = ^AsyncOperationCompletedHandler_1__Printing3D_IPrinting3DMeshVerificationResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Printing3D.IPrinting3DMeshVerificationResult>
  IAsyncOperation_1__Printing3D_IPrinting3DMeshVerificationResult = interface;
  PIAsyncOperation_1__Printing3D_IPrinting3DMeshVerificationResult = ^IAsyncOperation_1__Printing3D_IPrinting3DMeshVerificationResult;

  // Windows.Graphics.Printing3D.IPrinting3DMesh
  Printing3D_IPrinting3DMesh = interface;
  PPrinting3D_IPrinting3DMesh = ^Printing3D_IPrinting3DMesh;

  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DMesh>
  IIterator_1__Printing3D_IPrinting3DMesh = interface;
  PIIterator_1__Printing3D_IPrinting3DMesh = ^IIterator_1__Printing3D_IPrinting3DMesh;

  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DMesh>
  IIterable_1__Printing3D_IPrinting3DMesh = interface;
  PIIterable_1__Printing3D_IPrinting3DMesh = ^IIterable_1__Printing3D_IPrinting3DMesh;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DMesh>
  IVectorView_1__Printing3D_IPrinting3DMesh = interface;
  PIVectorView_1__Printing3D_IPrinting3DMesh = ^IVectorView_1__Printing3D_IPrinting3DMesh;

  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DMesh>
  IVector_1__Printing3D_IPrinting3DMesh = interface;
  PIVector_1__Printing3D_IPrinting3DMesh = ^IVector_1__Printing3D_IPrinting3DMesh;

  // Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix
  Printing3D_IPrinting3DComponentWithMatrix = interface;
  PPrinting3D_IPrinting3DComponentWithMatrix = ^Printing3D_IPrinting3DComponentWithMatrix;

  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix>
  IIterator_1__Printing3D_IPrinting3DComponentWithMatrix = interface;
  PIIterator_1__Printing3D_IPrinting3DComponentWithMatrix = ^IIterator_1__Printing3D_IPrinting3DComponentWithMatrix;

  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix>
  IIterable_1__Printing3D_IPrinting3DComponentWithMatrix = interface;
  PIIterable_1__Printing3D_IPrinting3DComponentWithMatrix = ^IIterable_1__Printing3D_IPrinting3DComponentWithMatrix;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix>
  IVectorView_1__Printing3D_IPrinting3DComponentWithMatrix = interface;
  PIVectorView_1__Printing3D_IPrinting3DComponentWithMatrix = ^IVectorView_1__Printing3D_IPrinting3DComponentWithMatrix;

  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix>
  IVector_1__Printing3D_IPrinting3DComponentWithMatrix = interface;
  PIVector_1__Printing3D_IPrinting3DComponentWithMatrix = ^IVector_1__Printing3D_IPrinting3DComponentWithMatrix;

  // Windows.Graphics.Printing3D.IPrinting3DComponent
  Printing3D_IPrinting3DComponent = interface;
  PPrinting3D_IPrinting3DComponent = ^Printing3D_IPrinting3DComponent;

  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DComponent>
  IIterator_1__Printing3D_IPrinting3DComponent = interface;
  PIIterator_1__Printing3D_IPrinting3DComponent = ^IIterator_1__Printing3D_IPrinting3DComponent;

  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DComponent>
  IIterable_1__Printing3D_IPrinting3DComponent = interface;
  PIIterable_1__Printing3D_IPrinting3DComponent = ^IIterable_1__Printing3D_IPrinting3DComponent;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DComponent>
  IVectorView_1__Printing3D_IPrinting3DComponent = interface;
  PIVectorView_1__Printing3D_IPrinting3DComponent = ^IVectorView_1__Printing3D_IPrinting3DComponent;

  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DComponent>
  IVector_1__Printing3D_IPrinting3DComponent = interface;
  PIVector_1__Printing3D_IPrinting3DComponent = ^IVector_1__Printing3D_IPrinting3DComponent;

  // Windows.Graphics.Printing3D.IPrinting3DColorMaterial
  Printing3D_IPrinting3DColorMaterial = interface;
  PPrinting3D_IPrinting3DColorMaterial = ^Printing3D_IPrinting3DColorMaterial;

  // Windows.Graphics.Printing3D.IPrinting3DBaseMaterial
  Printing3D_IPrinting3DBaseMaterial = interface;
  PPrinting3D_IPrinting3DBaseMaterial = ^Printing3D_IPrinting3DBaseMaterial;

  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterial>
  IIterator_1__Printing3D_IPrinting3DBaseMaterial = interface;
  PIIterator_1__Printing3D_IPrinting3DBaseMaterial = ^IIterator_1__Printing3D_IPrinting3DBaseMaterial;

  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterial>
  IIterable_1__Printing3D_IPrinting3DBaseMaterial = interface;
  PIIterable_1__Printing3D_IPrinting3DBaseMaterial = ^IIterable_1__Printing3D_IPrinting3DBaseMaterial;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterial>
  IVectorView_1__Printing3D_IPrinting3DBaseMaterial = interface;
  PIVectorView_1__Printing3D_IPrinting3DBaseMaterial = ^IVectorView_1__Printing3D_IPrinting3DBaseMaterial;

  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterial>
  IVector_1__Printing3D_IPrinting3DBaseMaterial = interface;
  PIVector_1__Printing3D_IPrinting3DBaseMaterial = ^IVector_1__Printing3D_IPrinting3DBaseMaterial;

  // Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup
  Printing3D_IPrinting3DBaseMaterialGroup = interface;
  PPrinting3D_IPrinting3DBaseMaterialGroup = ^Printing3D_IPrinting3DBaseMaterialGroup;

  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup>
  IIterator_1__Printing3D_IPrinting3DBaseMaterialGroup = interface;
  PIIterator_1__Printing3D_IPrinting3DBaseMaterialGroup = ^IIterator_1__Printing3D_IPrinting3DBaseMaterialGroup;

  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup>
  IIterable_1__Printing3D_IPrinting3DBaseMaterialGroup = interface;
  PIIterable_1__Printing3D_IPrinting3DBaseMaterialGroup = ^IIterable_1__Printing3D_IPrinting3DBaseMaterialGroup;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup>
  IVectorView_1__Printing3D_IPrinting3DBaseMaterialGroup = interface;
  PIVectorView_1__Printing3D_IPrinting3DBaseMaterialGroup = ^IVectorView_1__Printing3D_IPrinting3DBaseMaterialGroup;

  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup>
  IVector_1__Printing3D_IPrinting3DBaseMaterialGroup = interface;
  PIVector_1__Printing3D_IPrinting3DBaseMaterialGroup = ^IVector_1__Printing3D_IPrinting3DBaseMaterialGroup;

  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterial>
  IIterator_1__Printing3D_IPrinting3DColorMaterial = interface;
  PIIterator_1__Printing3D_IPrinting3DColorMaterial = ^IIterator_1__Printing3D_IPrinting3DColorMaterial;

  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterial>
  IIterable_1__Printing3D_IPrinting3DColorMaterial = interface;
  PIIterable_1__Printing3D_IPrinting3DColorMaterial = ^IIterable_1__Printing3D_IPrinting3DColorMaterial;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterial>
  IVectorView_1__Printing3D_IPrinting3DColorMaterial = interface;
  PIVectorView_1__Printing3D_IPrinting3DColorMaterial = ^IVectorView_1__Printing3D_IPrinting3DColorMaterial;

  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterial>
  IVector_1__Printing3D_IPrinting3DColorMaterial = interface;
  PIVector_1__Printing3D_IPrinting3DColorMaterial = ^IVector_1__Printing3D_IPrinting3DColorMaterial;

  // Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup
  Printing3D_IPrinting3DColorMaterialGroup = interface;
  PPrinting3D_IPrinting3DColorMaterialGroup = ^Printing3D_IPrinting3DColorMaterialGroup;

  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup>
  IIterator_1__Printing3D_IPrinting3DColorMaterialGroup = interface;
  PIIterator_1__Printing3D_IPrinting3DColorMaterialGroup = ^IIterator_1__Printing3D_IPrinting3DColorMaterialGroup;

  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup>
  IIterable_1__Printing3D_IPrinting3DColorMaterialGroup = interface;
  PIIterable_1__Printing3D_IPrinting3DColorMaterialGroup = ^IIterable_1__Printing3D_IPrinting3DColorMaterialGroup;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup>
  IVectorView_1__Printing3D_IPrinting3DColorMaterialGroup = interface;
  PIVectorView_1__Printing3D_IPrinting3DColorMaterialGroup = ^IVectorView_1__Printing3D_IPrinting3DColorMaterialGroup;

  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup>
  IVector_1__Printing3D_IPrinting3DColorMaterialGroup = interface;
  PIVector_1__Printing3D_IPrinting3DColorMaterialGroup = ^IVector_1__Printing3D_IPrinting3DColorMaterialGroup;

  // Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial
  Printing3D_IPrinting3DTexture2CoordMaterial = interface;
  PPrinting3D_IPrinting3DTexture2CoordMaterial = ^Printing3D_IPrinting3DTexture2CoordMaterial;

  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial>
  IIterator_1__Printing3D_IPrinting3DTexture2CoordMaterial = interface;
  PIIterator_1__Printing3D_IPrinting3DTexture2CoordMaterial = ^IIterator_1__Printing3D_IPrinting3DTexture2CoordMaterial;

  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial>
  IIterable_1__Printing3D_IPrinting3DTexture2CoordMaterial = interface;
  PIIterable_1__Printing3D_IPrinting3DTexture2CoordMaterial = ^IIterable_1__Printing3D_IPrinting3DTexture2CoordMaterial;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial>
  IVectorView_1__Printing3D_IPrinting3DTexture2CoordMaterial = interface;
  PIVectorView_1__Printing3D_IPrinting3DTexture2CoordMaterial = ^IVectorView_1__Printing3D_IPrinting3DTexture2CoordMaterial;

  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial>
  IVector_1__Printing3D_IPrinting3DTexture2CoordMaterial = interface;
  PIVector_1__Printing3D_IPrinting3DTexture2CoordMaterial = ^IVector_1__Printing3D_IPrinting3DTexture2CoordMaterial;

  // Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup
  Printing3D_IPrinting3DTexture2CoordMaterialGroup = interface;
  PPrinting3D_IPrinting3DTexture2CoordMaterialGroup = ^Printing3D_IPrinting3DTexture2CoordMaterialGroup;

  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup>
  IIterator_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup = interface;
  PIIterator_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup = ^IIterator_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup;

  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup>
  IIterable_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup = interface;
  PIIterable_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup = ^IIterable_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup>
  IVectorView_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup = interface;
  PIVectorView_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup = ^IVectorView_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup;

  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup>
  IVector_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup = interface;
  PIVector_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup = ^IVector_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup;

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

  // Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial
  Printing3D_IPrinting3DCompositeMaterial = interface;
  PPrinting3D_IPrinting3DCompositeMaterial = ^Printing3D_IPrinting3DCompositeMaterial;

  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial>
  IIterator_1__Printing3D_IPrinting3DCompositeMaterial = interface;
  PIIterator_1__Printing3D_IPrinting3DCompositeMaterial = ^IIterator_1__Printing3D_IPrinting3DCompositeMaterial;

  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial>
  IIterable_1__Printing3D_IPrinting3DCompositeMaterial = interface;
  PIIterable_1__Printing3D_IPrinting3DCompositeMaterial = ^IIterable_1__Printing3D_IPrinting3DCompositeMaterial;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial>
  IVectorView_1__Printing3D_IPrinting3DCompositeMaterial = interface;
  PIVectorView_1__Printing3D_IPrinting3DCompositeMaterial = ^IVectorView_1__Printing3D_IPrinting3DCompositeMaterial;

  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial>
  IVector_1__Printing3D_IPrinting3DCompositeMaterial = interface;
  PIVector_1__Printing3D_IPrinting3DCompositeMaterial = ^IVector_1__Printing3D_IPrinting3DCompositeMaterial;

  // Windows.Foundation.Collections.IVector`1<UInt32>
  IVector_1__Cardinal = interface;
  PIVector_1__Cardinal = ^IVector_1__Cardinal;

  // Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup
  Printing3D_IPrinting3DCompositeMaterialGroup = interface;
  PPrinting3D_IPrinting3DCompositeMaterialGroup = ^Printing3D_IPrinting3DCompositeMaterialGroup;

  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup>
  IIterator_1__Printing3D_IPrinting3DCompositeMaterialGroup = interface;
  PIIterator_1__Printing3D_IPrinting3DCompositeMaterialGroup = ^IIterator_1__Printing3D_IPrinting3DCompositeMaterialGroup;

  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup>
  IIterable_1__Printing3D_IPrinting3DCompositeMaterialGroup = interface;
  PIIterable_1__Printing3D_IPrinting3DCompositeMaterialGroup = ^IIterable_1__Printing3D_IPrinting3DCompositeMaterialGroup;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup>
  IVectorView_1__Printing3D_IPrinting3DCompositeMaterialGroup = interface;
  PIVectorView_1__Printing3D_IPrinting3DCompositeMaterialGroup = ^IVectorView_1__Printing3D_IPrinting3DCompositeMaterialGroup;

  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup>
  IVector_1__Printing3D_IPrinting3DCompositeMaterialGroup = interface;
  PIVector_1__Printing3D_IPrinting3DCompositeMaterialGroup = ^IVector_1__Printing3D_IPrinting3DCompositeMaterialGroup;

  // Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial
  Printing3D_IPrinting3DMultiplePropertyMaterial = interface;
  PPrinting3D_IPrinting3DMultiplePropertyMaterial = ^Printing3D_IPrinting3DMultiplePropertyMaterial;

  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial>
  IIterator_1__Printing3D_IPrinting3DMultiplePropertyMaterial = interface;
  PIIterator_1__Printing3D_IPrinting3DMultiplePropertyMaterial = ^IIterator_1__Printing3D_IPrinting3DMultiplePropertyMaterial;

  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial>
  IIterable_1__Printing3D_IPrinting3DMultiplePropertyMaterial = interface;
  PIIterable_1__Printing3D_IPrinting3DMultiplePropertyMaterial = ^IIterable_1__Printing3D_IPrinting3DMultiplePropertyMaterial;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial>
  IVectorView_1__Printing3D_IPrinting3DMultiplePropertyMaterial = interface;
  PIVectorView_1__Printing3D_IPrinting3DMultiplePropertyMaterial = ^IVectorView_1__Printing3D_IPrinting3DMultiplePropertyMaterial;

  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial>
  IVector_1__Printing3D_IPrinting3DMultiplePropertyMaterial = interface;
  PIVector_1__Printing3D_IPrinting3DMultiplePropertyMaterial = ^IVector_1__Printing3D_IPrinting3DMultiplePropertyMaterial;

  // Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup
  Printing3D_IPrinting3DMultiplePropertyMaterialGroup = interface;
  PPrinting3D_IPrinting3DMultiplePropertyMaterialGroup = ^Printing3D_IPrinting3DMultiplePropertyMaterialGroup;

  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup>
  IIterator_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup = interface;
  PIIterator_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup = ^IIterator_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup;

  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup>
  IIterable_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup = interface;
  PIIterable_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup = ^IIterable_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup>
  IVectorView_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup = interface;
  PIVectorView_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup = ^IVectorView_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup;

  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup>
  IVector_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup = interface;
  PIVector_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup = ^IVector_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup;

  // Windows.Graphics.Printing3D.IPrinting3DMaterial
  Printing3D_IPrinting3DMaterial = interface;
  PPrinting3D_IPrinting3DMaterial = ^Printing3D_IPrinting3DMaterial;

  // Windows.Foundation.Collections.IIterator`1<String>
  IIterator_1__HSTRING = interface;
  PIIterator_1__HSTRING = ^IIterator_1__HSTRING;

  // Windows.Foundation.Collections.IIterable`1<String>
  IIterable_1__HSTRING = interface;
  PIIterable_1__HSTRING = ^IIterable_1__HSTRING;

  // Windows.Foundation.Collections.IVectorView`1<String>
  IVectorView_1__HSTRING = interface;
  PIVectorView_1__HSTRING = ^IVectorView_1__HSTRING;

  // Windows.Foundation.Collections.IVector`1<String>
  IVector_1__HSTRING = interface;
  PIVector_1__HSTRING = ^IVector_1__HSTRING;

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

  // Windows.Graphics.Printing3D.IPrinting3DModel
  Printing3D_IPrinting3DModel = interface;
  PPrinting3D_IPrinting3DModel = ^Printing3D_IPrinting3DModel;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Printing3D.IPrinting3DModel>
  AsyncOperationCompletedHandler_1__Printing3D_IPrinting3DModel = interface;
  PAsyncOperationCompletedHandler_1__Printing3D_IPrinting3DModel = ^AsyncOperationCompletedHandler_1__Printing3D_IPrinting3DModel;

  // Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Printing3D.IPrinting3DModel>
  IAsyncOperation_1__Printing3D_IPrinting3DModel = interface;
  PIAsyncOperation_1__Printing3D_IPrinting3DModel = ^IAsyncOperation_1__Printing3D_IPrinting3DModel;

  // Windows.Graphics.Printing3D.IPrinting3D3MFPackage
  Printing3D_IPrinting3D3MFPackage = interface;
  PPrinting3D_IPrinting3D3MFPackage = ^Printing3D_IPrinting3D3MFPackage;

  // Windows.Graphics.Printing3D.IPrint3DTaskSourceChangedEventArgs
  Printing3D_IPrint3DTaskSourceChangedEventArgs = interface;
  PPrinting3D_IPrint3DTaskSourceChangedEventArgs = ^Printing3D_IPrint3DTaskSourceChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Graphics.Printing3D.IPrint3DTask,Object>
  TypedEventHandler_2__Printing3D_IPrint3DTask__IInspectable = interface;
  PTypedEventHandler_2__Printing3D_IPrint3DTask__IInspectable = ^TypedEventHandler_2__Printing3D_IPrint3DTask__IInspectable;

  // Windows.Foundation.TypedEventHandler`2<Windows.Graphics.Printing3D.IPrint3DTask,Windows.Graphics.Printing3D.IPrint3DTaskCompletedEventArgs>
  TypedEventHandler_2__Printing3D_IPrint3DTask__Printing3D_IPrint3DTaskCompletedEventArgs = interface;
  PTypedEventHandler_2__Printing3D_IPrint3DTask__Printing3D_IPrint3DTaskCompletedEventArgs = ^TypedEventHandler_2__Printing3D_IPrint3DTask__Printing3D_IPrint3DTaskCompletedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Graphics.Printing3D.IPrint3DTask,Windows.Graphics.Printing3D.IPrint3DTaskSourceChangedEventArgs>
  TypedEventHandler_2__Printing3D_IPrint3DTask__Printing3D_IPrint3DTaskSourceChangedEventArgs = interface;
  PTypedEventHandler_2__Printing3D_IPrint3DTask__Printing3D_IPrint3DTaskSourceChangedEventArgs = ^TypedEventHandler_2__Printing3D_IPrint3DTask__Printing3D_IPrint3DTaskSourceChangedEventArgs;

  // Windows.Graphics.Printing3D.IPrint3DTask
  Printing3D_IPrint3DTask = interface;
  PPrinting3D_IPrint3DTask = ^Printing3D_IPrint3DTask;

  // Windows.Graphics.Printing3D.IPrint3DTaskSourceRequestedArgs
  Printing3D_IPrint3DTaskSourceRequestedArgs = interface;
  PPrinting3D_IPrint3DTaskSourceRequestedArgs = ^Printing3D_IPrint3DTaskSourceRequestedArgs;

  // Windows.Graphics.Printing3D.Print3DTaskSourceRequestedHandler
  Printing3D_Print3DTaskSourceRequestedHandler = interface;
  PPrinting3D_Print3DTaskSourceRequestedHandler = ^Printing3D_Print3DTaskSourceRequestedHandler;

  // Windows.Graphics.Printing3D.IPrint3DTaskRequest
  Printing3D_IPrint3DTaskRequest = interface;
  PPrinting3D_IPrint3DTaskRequest = ^Printing3D_IPrint3DTaskRequest;

  // Windows.Graphics.Printing3D.IPrint3DTaskRequestedEventArgs
  Printing3D_IPrint3DTaskRequestedEventArgs = interface;
  PPrinting3D_IPrint3DTaskRequestedEventArgs = ^Printing3D_IPrint3DTaskRequestedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Graphics.Printing3D.IPrint3DManager,Windows.Graphics.Printing3D.IPrint3DTaskRequestedEventArgs>
  TypedEventHandler_2__Printing3D_IPrint3DManager__Printing3D_IPrint3DTaskRequestedEventArgs = interface;
  PTypedEventHandler_2__Printing3D_IPrint3DManager__Printing3D_IPrint3DTaskRequestedEventArgs = ^TypedEventHandler_2__Printing3D_IPrint3DManager__Printing3D_IPrint3DTaskRequestedEventArgs;

  // Windows.Graphics.Printing3D.IPrint3DManager
  Printing3D_IPrint3DManager = interface;
  PPrinting3D_IPrint3DManager = ^Printing3D_IPrint3DManager;

  // Windows.Graphics.Printing3D.IPrint3DManagerStatics
  Printing3D_IPrint3DManagerStatics = interface;
  PPrinting3D_IPrint3DManagerStatics = ^Printing3D_IPrint3DManagerStatics;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Boolean,Double>
  AsyncOperationProgressHandler_2__Boolean__Double = interface;
  PAsyncOperationProgressHandler_2__Boolean__Double = ^AsyncOperationProgressHandler_2__Boolean__Double;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Boolean,Double>
  AsyncOperationWithProgressCompletedHandler_2__Boolean__Double = interface;
  PAsyncOperationWithProgressCompletedHandler_2__Boolean__Double = ^AsyncOperationWithProgressCompletedHandler_2__Boolean__Double;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Boolean,Double>
  IAsyncOperationWithProgress_2__Boolean__Double = interface;
  PIAsyncOperationWithProgress_2__Boolean__Double = ^IAsyncOperationWithProgress_2__Boolean__Double;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Printing3D.IPrinting3D3MFPackage>
  AsyncOperationCompletedHandler_1__Printing3D_IPrinting3D3MFPackage = interface;
  PAsyncOperationCompletedHandler_1__Printing3D_IPrinting3D3MFPackage = ^AsyncOperationCompletedHandler_1__Printing3D_IPrinting3D3MFPackage;

  // Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Printing3D.IPrinting3D3MFPackage>
  IAsyncOperation_1__Printing3D_IPrinting3D3MFPackage = interface;
  PIAsyncOperation_1__Printing3D_IPrinting3D3MFPackage = ^IAsyncOperation_1__Printing3D_IPrinting3D3MFPackage;

  // Windows.Foundation.IReference`1<Double>
  IReference_1__Double = interface;
  PIReference_1__Double = ^IReference_1__Double;

  // Windows.Graphics.Display.DisplayPropertiesEventHandler
  Display_DisplayPropertiesEventHandler = interface;
  PDisplay_DisplayPropertiesEventHandler = ^Display_DisplayPropertiesEventHandler;

  // Windows.Foundation.TypedEventHandler`2<Windows.Foundation.IMemoryBufferReference,Object>
  TypedEventHandler_2__IMemoryBufferReference__IInspectable = interface;
  PTypedEventHandler_2__IMemoryBufferReference__IInspectable = ^TypedEventHandler_2__IMemoryBufferReference__IInspectable;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Imaging.ISoftwareBitmap>
  AsyncOperationCompletedHandler_1__Imaging_ISoftwareBitmap = interface;
  PAsyncOperationCompletedHandler_1__Imaging_ISoftwareBitmap = ^AsyncOperationCompletedHandler_1__Imaging_ISoftwareBitmap;

  // Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Imaging.ISoftwareBitmap>
  IAsyncOperation_1__Imaging_ISoftwareBitmap = interface;
  PIAsyncOperation_1__Imaging_ISoftwareBitmap = ^IAsyncOperation_1__Imaging_ISoftwareBitmap;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Imaging.IBitmapFrame>
  AsyncOperationCompletedHandler_1__Imaging_IBitmapFrame = interface;
  PAsyncOperationCompletedHandler_1__Imaging_IBitmapFrame = ^AsyncOperationCompletedHandler_1__Imaging_IBitmapFrame;

  // Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Imaging.IBitmapFrame>
  IAsyncOperation_1__Imaging_IBitmapFrame = interface;
  PIAsyncOperation_1__Imaging_IBitmapFrame = ^IAsyncOperation_1__Imaging_IBitmapFrame;

  // Windows.Graphics.Imaging.ISoftwareBitmapFactory
  Imaging_ISoftwareBitmapFactory = interface;
  PImaging_ISoftwareBitmapFactory = ^Imaging_ISoftwareBitmapFactory;

  // Windows.Graphics.Imaging.ISoftwareBitmapStatics
  Imaging_ISoftwareBitmapStatics = interface;
  PImaging_ISoftwareBitmapStatics = ^Imaging_ISoftwareBitmapStatics;

  // Windows.Graphics.Display.Core.IHdmiDisplayMode
  Display_Core_IHdmiDisplayMode = interface;
  PDisplay_Core_IHdmiDisplayMode = ^Display_Core_IHdmiDisplayMode;

  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Display.Core.IHdmiDisplayMode>
  IIterator_1__Display_Core_IHdmiDisplayMode = interface;
  PIIterator_1__Display_Core_IHdmiDisplayMode = ^IIterator_1__Display_Core_IHdmiDisplayMode;

  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Display.Core.IHdmiDisplayMode>
  IIterable_1__Display_Core_IHdmiDisplayMode = interface;
  PIIterable_1__Display_Core_IHdmiDisplayMode = ^IIterable_1__Display_Core_IHdmiDisplayMode;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Display.Core.IHdmiDisplayMode>
  IVectorView_1__Display_Core_IHdmiDisplayMode = interface;
  PIVectorView_1__Display_Core_IHdmiDisplayMode = ^IVectorView_1__Display_Core_IHdmiDisplayMode;

  // Windows.Foundation.TypedEventHandler`2<Windows.Graphics.Display.Core.IHdmiDisplayInformation,Object>
  TypedEventHandler_2__Display_Core_IHdmiDisplayInformation__IInspectable = interface;
  PTypedEventHandler_2__Display_Core_IHdmiDisplayInformation__IInspectable = ^TypedEventHandler_2__Display_Core_IHdmiDisplayInformation__IInspectable;

  // Windows.Graphics.Display.Core.IHdmiDisplayInformation
  Display_Core_IHdmiDisplayInformation = interface;
  PDisplay_Core_IHdmiDisplayInformation = ^Display_Core_IHdmiDisplayInformation;

  // Windows.Graphics.Display.Core.IHdmiDisplayInformationStatics
  Display_Core_IHdmiDisplayInformationStatics = interface;
  PDisplay_Core_IHdmiDisplayInformationStatics = ^Display_Core_IHdmiDisplayInformationStatics;

  // Windows.Graphics.Effects.IGraphicsEffectSource
  Effects_IGraphicsEffectSource = interface;
  PEffects_IGraphicsEffectSource = ^Effects_IGraphicsEffectSource;

  // Windows.Graphics.Effects.IGraphicsEffect
  Effects_IGraphicsEffect = interface;
  PEffects_IGraphicsEffect = ^Effects_IGraphicsEffect;

  // Windows.Graphics.Printing.OptionDetails.IPrintTextOptionDetails
  Printing_OptionDetails_IPrintTextOptionDetails = interface;
  PPrinting_OptionDetails_IPrintTextOptionDetails = ^Printing_OptionDetails_IPrintTextOptionDetails;

  // Windows.Foundation.Collections.IIterator`1<Object>
  IIterator_1__IInspectable = interface;
  PIIterator_1__IInspectable = ^IIterator_1__IInspectable;

  // Windows.Foundation.Collections.IIterable`1<Object>
  IIterable_1__IInspectable = interface;
  PIIterable_1__IInspectable = ^IIterable_1__IInspectable;

  // Windows.Foundation.Collections.IVectorView`1<Object>
  IVectorView_1__IInspectable = interface;
  PIVectorView_1__IInspectable = ^IVectorView_1__IInspectable;

  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.Activation.ISplashScreen,Object>
  TypedEventHandler_2__Activation_ISplashScreen__IInspectable = interface;
  PTypedEventHandler_2__Activation_ISplashScreen__IInspectable = ^TypedEventHandler_2__Activation_ISplashScreen__IInspectable;

  // Windows.Graphics.DirectX.Direct3D11.IDirect3DDevice
  DirectX_Direct3D11_IDirect3DDevice = interface;
  PDirectX_Direct3D11_IDirect3DDevice = ^DirectX_Direct3D11_IDirect3DDevice;

  // Windows.Foundation.IReference`1<Windows.Graphics.Holographic.HolographicStereoTransform>
  IReference_1__Holographic_HolographicStereoTransform = interface;
  PIReference_1__Holographic_HolographicStereoTransform = ^IReference_1__Holographic_HolographicStereoTransform;

  // Windows.Foundation.EventHandler`1<Object>
  EventHandler_1__IInspectable = interface;
  PEventHandler_1__IInspectable = ^EventHandler_1__IInspectable;

  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Imaging.BitmapPixelFormat>
  IIterator_1__Imaging_BitmapPixelFormat = interface;
  PIIterator_1__Imaging_BitmapPixelFormat = ^IIterator_1__Imaging_BitmapPixelFormat;

  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Imaging.BitmapPixelFormat>
  IIterable_1__Imaging_BitmapPixelFormat = interface;
  PIIterable_1__Imaging_BitmapPixelFormat = ^IIterable_1__Imaging_BitmapPixelFormat;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Imaging.BitmapPixelFormat>
  IVectorView_1__Imaging_BitmapPixelFormat = interface;
  PIVectorView_1__Imaging_BitmapPixelFormat = ^IVectorView_1__Imaging_BitmapPixelFormat;

  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Imaging.ISoftwareBitmap>
  IIterator_1__Imaging_ISoftwareBitmap = interface;
  PIIterator_1__Imaging_ISoftwareBitmap = ^IIterator_1__Imaging_ISoftwareBitmap;

  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Imaging.ISoftwareBitmap>
  IIterable_1__Imaging_ISoftwareBitmap = interface;
  PIIterable_1__Imaging_ISoftwareBitmap = ^IIterable_1__Imaging_ISoftwareBitmap;

  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface>
  IIterator_1__DirectX_Direct3D11_IDirect3DSurface = interface;
  PIIterator_1__DirectX_Direct3D11_IDirect3DSurface = ^IIterator_1__DirectX_Direct3D11_IDirect3DSurface;

  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface>
  IIterable_1__DirectX_Direct3D11_IDirect3DSurface = interface;
  PIIterable_1__DirectX_Direct3D11_IDirect3DSurface = ^IIterable_1__DirectX_Direct3D11_IDirect3DSurface;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface>
  IVectorView_1__DirectX_Direct3D11_IDirect3DSurface = interface;
  PIVectorView_1__DirectX_Direct3D11_IDirect3DSurface = ^IVectorView_1__DirectX_Direct3D11_IDirect3DSurface;

  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.DirectX.DirectXPixelFormat>
  IIterator_1__DirectX_DirectXPixelFormat = interface;
  PIIterator_1__DirectX_DirectXPixelFormat = ^IIterator_1__DirectX_DirectXPixelFormat;

  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.DirectX.DirectXPixelFormat>
  IIterable_1__DirectX_DirectXPixelFormat = interface;
  PIIterable_1__DirectX_DirectXPixelFormat = ^IIterable_1__DirectX_DirectXPixelFormat;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.DirectX.DirectXPixelFormat>
  IVectorView_1__DirectX_DirectXPixelFormat = interface;
  PIVectorView_1__DirectX_DirectXPixelFormat = ^IVectorView_1__DirectX_DirectXPixelFormat;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.Graphics Interfaces
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Windows.Graphics.Imaging.BitmapPlaneDescription
  }
  // Windows.Graphics.Imaging.IBitmapBuffer
  [WinRTClassNameAttribute(SImaging_BitmapBuffer)]
  Imaging_IBitmapBuffer = interface(IInspectable)
  ['{A53E04C4-399C-438C-B28F-A63A6B83D1A1}']
    function GetPlaneCount: Integer; safecall;
    function GetPlaneDescription(index: Integer): Imaging_BitmapPlaneDescription; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Imaging.BitmapPixelFormat
  // Used Types:  Windows.Graphics.Imaging.BitmapAlphaMode
  // Used Types:  Int32
  // Used Types:  Boolean
  // Used Types:  Double
  // Used Types:  Windows.Graphics.Imaging.IBitmapBuffer
  // Used Types:  Windows.Graphics.Imaging.BitmapBufferAccessMode
  // Used Types:  Windows.Graphics.Imaging.ISoftwareBitmap
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Graphics.Imaging.ISoftwareBitmap
  [WinRTClassNameAttribute(SImaging_SoftwareBitmap)]
  Imaging_ISoftwareBitmap = interface(IInspectable)
  ['{689E0708-7EEF-483F-963F-DA938818E073}']
    function get_BitmapPixelFormat: Imaging_BitmapPixelFormat; safecall;
    function get_BitmapAlphaMode: Imaging_BitmapAlphaMode; safecall;
    function get_PixelWidth: Integer; safecall;
    function get_PixelHeight: Integer; safecall;
    function get_IsReadOnly: Boolean; safecall;
    procedure put_DpiX(value: Double); safecall;
    function get_DpiX: Double; safecall;
    procedure put_DpiY(value: Double); safecall;
    function get_DpiY: Double; safecall;
    function LockBuffer(mode: Imaging_BitmapBufferAccessMode): Imaging_IBitmapBuffer; safecall;
    procedure CopyTo(bitmap: Imaging_ISoftwareBitmap); safecall;
    procedure CopyFromBuffer(buffer: IBuffer); safecall;
    procedure CopyToBuffer(buffer: IBuffer); safecall;
    function GetReadOnlyView: Imaging_ISoftwareBitmap; safecall;
    property BitmapAlphaMode: Imaging_BitmapAlphaMode read get_BitmapAlphaMode;
    property BitmapPixelFormat: Imaging_BitmapPixelFormat read get_BitmapPixelFormat;
    property DpiX: Double read get_DpiX write put_DpiX;
    property DpiY: Double read get_DpiY write put_DpiY;
    property IsReadOnly: Boolean read get_IsReadOnly;
    property PixelHeight: Integer read get_PixelHeight;
    property PixelWidth: Integer read get_PixelWidth;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.DirectX.Direct3D11.Direct3DSurfaceDescription
  }
  // Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
  DirectX_Direct3D11_IDirect3DSurface = interface(IInspectable)
  ['{0BF4A146-13C1-4694-BEE3-7ABF15EAF586}']
    function get_Description: DirectX_Direct3D11_Direct3DSurfaceDescription; safecall;
    property Description: DirectX_Direct3D11_Direct3DSurfaceDescription read get_Description;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Object
  // Used Types:  Windows.Foundation.PropertyType
  }
  // Windows.Graphics.Imaging.IBitmapTypedValue
  Imaging_IBitmapTypedValue = interface(IInspectable)
  ['{CD8044A9-2443-4000-B0CD-79316C56F589}']
    function get_Value: IInspectable; safecall;
    function get_Type: PropertyType; safecall;
    property &Type: PropertyType read get_Type;
    property Value: IInspectable read get_Value;
  end;

  {
  // Used Types:  String
  // Used Types:  Windows.Graphics.Imaging.IBitmapTypedValue
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>
  IKeyValuePair_2__HSTRING__Imaging_IBitmapTypedValue = interface(IInspectable)
  ['{8D976C0D-55AF-5C97-8CFE-1ED80D315433}']
    function get_Key: HSTRING; safecall;
    function get_Value: Imaging_IBitmapTypedValue; safecall;
    property Key: HSTRING read get_Key;
    property Value: Imaging_IBitmapTypedValue read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>>
  IIterator_1__IKeyValuePair_2__HSTRING__Imaging_IBitmapTypedValue_Base = interface(IInspectable)
  ['{2AD3FB0C-0656-5302-B504-3153BE845161}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>>
  IIterator_1__IKeyValuePair_2__HSTRING__Imaging_IBitmapTypedValue = interface(IIterator_1__IKeyValuePair_2__HSTRING__Imaging_IBitmapTypedValue_Base)
  ['{C55FDBC5-56E9-50D3-BD3A-E60220DF6089}']
    function get_Current: IKeyValuePair_2__HSTRING__Imaging_IBitmapTypedValue; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__Imaging_IBitmapTypedValue): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__Imaging_IBitmapTypedValue read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>
  IMapView_2__HSTRING__Imaging_IBitmapTypedValue_Base = interface(IInspectable)
  ['{9CDA5A9A-8924-5B3B-8B19-894D8DA99DDE}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Imaging.IBitmapTypedValue
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>
  }
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>
  IMapView_2__HSTRING__Imaging_IBitmapTypedValue = interface(IMapView_2__HSTRING__Imaging_IBitmapTypedValue_Base)
  ['{6869F6A4-63D4-5765-B72D-C2DDBD4A18F8}']
    function Lookup(key: HSTRING): Imaging_IBitmapTypedValue; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__Imaging_IBitmapTypedValue; out second: IMapView_2__HSTRING__Imaging_IBitmapTypedValue); safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Imaging.IBitmapTypedValue
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>
  }
  // Windows.Foundation.Collections.IMap`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>
  IMap_2__HSTRING__Imaging_IBitmapTypedValue = interface(IInspectable)
  ['{11A0A0DF-5490-58DA-9EA2-AF48FE7D4AD0}']
    function Lookup(key: HSTRING): Imaging_IBitmapTypedValue; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    function GetView: IMapView_2__HSTRING__Imaging_IBitmapTypedValue; safecall;
    function Insert(key: HSTRING; value: Imaging_IBitmapTypedValue): Boolean; safecall;
    procedure Remove(key: HSTRING); safecall;
    procedure Clear; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMap`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>>
  AsyncOperationCompletedHandler_1__IMap_2__HSTRING__Imaging_IBitmapTypedValue_Delegate_Base = interface(IUnknown)
  ['{A8325BD7-A3BE-5881-9FA7-04CEEFB9DC2F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMap`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMap`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>>
  AsyncOperationCompletedHandler_1__IMap_2__HSTRING__Imaging_IBitmapTypedValue = interface(AsyncOperationCompletedHandler_1__IMap_2__HSTRING__Imaging_IBitmapTypedValue_Delegate_Base)
  ['{89339D3F-D9E3-5A3B-8EAF-967389F9742A}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IMap_2__HSTRING__Imaging_IBitmapTypedValue; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMap`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>>
  IAsyncOperation_1__IMap_2__HSTRING__Imaging_IBitmapTypedValue_Base = interface(IInspectable)
  ['{464AC000-B1F1-5246-8268-912A2593D889}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMap`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>>
  // Used Types:  Windows.Foundation.Collections.IMap`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMap`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>>
  IAsyncOperation_1__IMap_2__HSTRING__Imaging_IBitmapTypedValue = interface(IAsyncOperation_1__IMap_2__HSTRING__Imaging_IBitmapTypedValue_Base)
  ['{4DE24D17-E83D-5B1C-A636-382C8C788E8E}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IMap_2__HSTRING__Imaging_IBitmapTypedValue); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IMap_2__HSTRING__Imaging_IBitmapTypedValue; safecall;
    function GetResults: IMap_2__HSTRING__Imaging_IBitmapTypedValue; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IMap_2__HSTRING__Imaging_IBitmapTypedValue read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMap`2<String,Windows.Graphics.Imaging.IBitmapTypedValue>>
  // Used Types:  Windows.Foundation.Collections.IIterable`1<String>
  }
  // Windows.Graphics.Imaging.IBitmapPropertiesView
  Imaging_IBitmapPropertiesView = interface(IInspectable)
  ['{7E0FE87A-3A70-48F8-9C55-196CF5A545F5}']
    function GetPropertiesAsync(propertiesToRetrieve: IIterable_1__HSTRING): IAsyncOperation_1__IMap_2__HSTRING__Imaging_IBitmapTypedValue; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  UInt8[]
  }
  // Windows.Graphics.Imaging.IPixelDataProvider
  Imaging_IPixelDataProvider = interface(IInspectable)
  ['{DD831F25-185C-4595-9FB9-CCBE6EC18A6F}']
    function DetachPixelData(resultSize: Cardinal; resultValue: PByte): HRESULT; stdcall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Imaging.IPixelDataProvider>
  AsyncOperationCompletedHandler_1__Imaging_IPixelDataProvider_Delegate_Base = interface(IUnknown)
  ['{37BDF4BE-2F39-592C-A4F7-D16A09D2B2DB}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Imaging.IPixelDataProvider>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Imaging.IPixelDataProvider>
  AsyncOperationCompletedHandler_1__Imaging_IPixelDataProvider = interface(AsyncOperationCompletedHandler_1__Imaging_IPixelDataProvider_Delegate_Base)
  ['{22507086-CC01-5215-A74B-0C16548003C4}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Imaging_IPixelDataProvider; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Imaging.IPixelDataProvider>
  IAsyncOperation_1__Imaging_IPixelDataProvider_Base = interface(IInspectable)
  ['{8C2DFEB0-6C22-5863-88D8-85C1FBC75697}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Imaging.IPixelDataProvider>
  // Used Types:  Windows.Graphics.Imaging.IPixelDataProvider
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Imaging.IPixelDataProvider>
  IAsyncOperation_1__Imaging_IPixelDataProvider = interface(IAsyncOperation_1__Imaging_IPixelDataProvider_Base)
  ['{2A2A05E4-33DC-5F8C-B9BF-4F1548FC581B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Imaging_IPixelDataProvider); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Imaging_IPixelDataProvider; safecall;
    function GetResults: Imaging_IPixelDataProvider; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Imaging_IPixelDataProvider read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Windows.Graphics.Imaging.BitmapInterpolationMode
  // Used Types:  Windows.Graphics.Imaging.BitmapFlip
  // Used Types:  Windows.Graphics.Imaging.BitmapRotation
  // Used Types:  Windows.Graphics.Imaging.BitmapBounds
  }
  // Windows.Graphics.Imaging.IBitmapTransform
  Imaging_IBitmapTransform = interface(IInspectable)
  ['{AE755344-E268-4D35-ADCF-E995D31A8D34}']
    function get_ScaledWidth: Cardinal; safecall;
    procedure put_ScaledWidth(value: Cardinal); safecall;
    function get_ScaledHeight: Cardinal; safecall;
    procedure put_ScaledHeight(value: Cardinal); safecall;
    function get_InterpolationMode: Imaging_BitmapInterpolationMode; safecall;
    procedure put_InterpolationMode(value: Imaging_BitmapInterpolationMode); safecall;
    function get_Flip: Imaging_BitmapFlip; safecall;
    procedure put_Flip(value: Imaging_BitmapFlip); safecall;
    function get_Rotation: Imaging_BitmapRotation; safecall;
    procedure put_Rotation(value: Imaging_BitmapRotation); safecall;
    function get_Bounds: Imaging_BitmapBounds; safecall;
    procedure put_Bounds(value: Imaging_BitmapBounds); safecall;
    property Bounds: Imaging_BitmapBounds read get_Bounds write put_Bounds;
    property Flip: Imaging_BitmapFlip read get_Flip write put_Flip;
    property InterpolationMode: Imaging_BitmapInterpolationMode read get_InterpolationMode write put_InterpolationMode;
    property Rotation: Imaging_BitmapRotation read get_Rotation write put_Rotation;
    property ScaledHeight: Cardinal read get_ScaledHeight write put_ScaledHeight;
    property ScaledWidth: Cardinal read get_ScaledWidth write put_ScaledWidth;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IRandomAccessStreamWithContentType>
  // Used Types:  Windows.Graphics.Imaging.IBitmapPropertiesView
  // Used Types:  Windows.Graphics.Imaging.BitmapPixelFormat
  // Used Types:  Windows.Graphics.Imaging.BitmapAlphaMode
  // Used Types:  Double
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Imaging.IPixelDataProvider>
  // Used Types:  Windows.Graphics.Imaging.IBitmapTransform
  // Used Types:  Windows.Graphics.Imaging.ExifOrientationMode
  // Used Types:  Windows.Graphics.Imaging.ColorManagementMode
  }
  // Windows.Graphics.Imaging.IBitmapFrame
  Imaging_IBitmapFrame = interface(IInspectable)
  ['{72A49A1C-8081-438D-91BC-94ECFC8185C6}']
    function GetThumbnailAsync: IAsyncOperation_1__IRandomAccessStreamWithContentType; safecall;
    function get_BitmapProperties: Imaging_IBitmapPropertiesView; safecall;
    function get_BitmapPixelFormat: Imaging_BitmapPixelFormat; safecall;
    function get_BitmapAlphaMode: Imaging_BitmapAlphaMode; safecall;
    function get_DpiX: Double; safecall;
    function get_DpiY: Double; safecall;
    function get_PixelWidth: Cardinal; safecall;
    function get_PixelHeight: Cardinal; safecall;
    function get_OrientedPixelWidth: Cardinal; safecall;
    function get_OrientedPixelHeight: Cardinal; safecall;
    function GetPixelDataAsync: IAsyncOperation_1__Imaging_IPixelDataProvider; overload; safecall;
    function GetPixelDataAsync(pixelFormat: Imaging_BitmapPixelFormat; alphaMode: Imaging_BitmapAlphaMode; transform: Imaging_IBitmapTransform; exifOrientationMode: Imaging_ExifOrientationMode; colorManagementMode: Imaging_ColorManagementMode): IAsyncOperation_1__Imaging_IPixelDataProvider; overload; safecall;
    property BitmapAlphaMode: Imaging_BitmapAlphaMode read get_BitmapAlphaMode;
    property BitmapPixelFormat: Imaging_BitmapPixelFormat read get_BitmapPixelFormat;
    property BitmapProperties: Imaging_IBitmapPropertiesView read get_BitmapProperties;
    property DpiX: Double read get_DpiX;
    property DpiY: Double read get_DpiY;
    property OrientedPixelHeight: Cardinal read get_OrientedPixelHeight;
    property OrientedPixelWidth: Cardinal read get_OrientedPixelWidth;
    property PixelHeight: Cardinal read get_PixelHeight;
    property PixelWidth: Cardinal read get_PixelWidth;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.Print3DTaskCompletion
  // Used Types:  Windows.Graphics.Printing3D.Print3DTaskDetail
  }
  // Windows.Graphics.Printing3D.IPrint3DTaskCompletedEventArgs
  [WinRTClassNameAttribute(SPrinting3D_Print3DTaskCompletedEventArgs)]
  Printing3D_IPrint3DTaskCompletedEventArgs = interface(IInspectable)
  ['{CC1914AF-2614-4F1D-ACCC-D6FC4FDA5455}']
    function get_Completion: Printing3D_Print3DTaskCompletion; safecall;
    function get_ExtendedStatus: Printing3D_Print3DTaskDetail; safecall;
    property Completion: Printing3D_Print3DTaskCompletion read get_Completion;
    property ExtendedStatus: Printing3D_Print3DTaskDetail read get_ExtendedStatus;
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

  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Streams.IRandomAccessStreamWithContentType
  // Used Types:  String
  }
  // Windows.Graphics.Printing3D.IPrinting3DTextureResource
  Printing3D_IPrinting3DTextureResource = interface(IInspectable)
  ['{A70DF32D-6AB1-44AE-BC45-A27382C0D38C}']
    function get_TextureData: IRandomAccessStreamWithContentType; safecall;
    procedure put_TextureData(value: IRandomAccessStreamWithContentType); safecall;
    function get_Name: HSTRING; safecall;
    procedure put_Name(value: HSTRING); safecall;
    property Name: HSTRING read get_Name write put_Name;
    property TextureData: IRandomAccessStreamWithContentType read get_TextureData write put_TextureData;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DTextureResource>
  IIterator_1__Printing3D_IPrinting3DTextureResource_Base = interface(IInspectable)
  ['{0678D5DB-8FCA-5084-A851-7312FE53F735}']
  end;
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DTextureResource
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DTextureResource>
  IIterator_1__Printing3D_IPrinting3DTextureResource = interface(IIterator_1__Printing3D_IPrinting3DTextureResource_Base)
  ['{F1C54B31-8237-59FE-9DAF-1611C831299A}']
    function get_Current: Printing3D_IPrinting3DTextureResource; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DTextureResource): Cardinal; safecall;
    property Current: Printing3D_IPrinting3DTextureResource read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DTextureResource>
  IIterable_1__Printing3D_IPrinting3DTextureResource_Base = interface(IInspectable)
  ['{54E3A71D-EAE0-5199-9728-FAC964850EBB}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DTextureResource>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DTextureResource>
  IIterable_1__Printing3D_IPrinting3DTextureResource = interface(IIterable_1__Printing3D_IPrinting3DTextureResource_Base)
  ['{B82D7C82-F89C-5F53-B39E-4399A6BEF6AB}']
    function First: IIterator_1__Printing3D_IPrinting3DTextureResource; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DTextureResource
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DTextureResource>
  IVectorView_1__Printing3D_IPrinting3DTextureResource = interface(IInspectable)
  ['{982A938E-5678-5378-87AB-8A35B5F31220}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DTextureResource; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Printing3D_IPrinting3DTextureResource; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DTextureResource): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DTextureResource
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DTextureResource>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DTextureResource>
  IVector_1__Printing3D_IPrinting3DTextureResource = interface(IInspectable)
  ['{8A343BBE-54C9-510C-96EA-C105A15B7CBD}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DTextureResource; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Printing3D_IPrinting3DTextureResource; safecall;
    function IndexOf(value: Printing3D_IPrinting3DTextureResource; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Printing3D_IPrinting3DTextureResource); safecall;
    procedure InsertAt(index: Cardinal; value: Printing3D_IPrinting3DTextureResource); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Printing3D_IPrinting3DTextureResource); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DTextureResource): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DTextureResource); safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DTextureResource
  // Used Types:  Windows.Graphics.Printing3D.Printing3DTextureEdgeBehavior
  }
  // Windows.Graphics.Printing3D.IPrinting3DModelTexture
  Printing3D_IPrinting3DModelTexture = interface(IInspectable)
  ['{5DAFCF01-B59D-483C-97BB-A4D546D1C75C}']
    function get_TextureResource: Printing3D_IPrinting3DTextureResource; safecall;
    procedure put_TextureResource(value: Printing3D_IPrinting3DTextureResource); safecall;
    function get_TileStyleU: Printing3D_Printing3DTextureEdgeBehavior; safecall;
    procedure put_TileStyleU(value: Printing3D_Printing3DTextureEdgeBehavior); safecall;
    function get_TileStyleV: Printing3D_Printing3DTextureEdgeBehavior; safecall;
    procedure put_TileStyleV(value: Printing3D_Printing3DTextureEdgeBehavior); safecall;
    property TextureResource: Printing3D_IPrinting3DTextureResource read get_TextureResource write put_TextureResource;
    property TileStyleU: Printing3D_Printing3DTextureEdgeBehavior read get_TileStyleU write put_TileStyleU;
    property TileStyleV: Printing3D_Printing3DTextureEdgeBehavior read get_TileStyleV write put_TileStyleV;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DModelTexture>
  IIterator_1__Printing3D_IPrinting3DModelTexture_Base = interface(IInspectable)
  ['{3D473CA2-4A8C-5CBD-807F-49AF1580D2BA}']
  end;
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DModelTexture
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DModelTexture>
  IIterator_1__Printing3D_IPrinting3DModelTexture = interface(IIterator_1__Printing3D_IPrinting3DModelTexture_Base)
  ['{80E1B7C4-0355-595C-9703-E796B91DBE8A}']
    function get_Current: Printing3D_IPrinting3DModelTexture; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DModelTexture): Cardinal; safecall;
    property Current: Printing3D_IPrinting3DModelTexture read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DModelTexture>
  IIterable_1__Printing3D_IPrinting3DModelTexture_Base = interface(IInspectable)
  ['{94790870-6041-5D04-8699-17417117BB85}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DModelTexture>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DModelTexture>
  IIterable_1__Printing3D_IPrinting3DModelTexture = interface(IIterable_1__Printing3D_IPrinting3DModelTexture_Base)
  ['{B7B865E8-DEAD-5A1C-810F-A2C8789043FB}']
    function First: IIterator_1__Printing3D_IPrinting3DModelTexture; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DModelTexture
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DModelTexture>
  IVectorView_1__Printing3D_IPrinting3DModelTexture = interface(IInspectable)
  ['{DD4FA3CC-A965-51D3-9046-AF58EE17584A}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DModelTexture; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Printing3D_IPrinting3DModelTexture; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DModelTexture): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DModelTexture
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DModelTexture>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DModelTexture>
  IVector_1__Printing3D_IPrinting3DModelTexture = interface(IInspectable)
  ['{26F8F853-4490-5DD2-B398-36E5783124FF}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DModelTexture; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Printing3D_IPrinting3DModelTexture; safecall;
    function IndexOf(value: Printing3D_IPrinting3DModelTexture; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Printing3D_IPrinting3DModelTexture); safecall;
    procedure InsertAt(index: Cardinal; value: Printing3D_IPrinting3DModelTexture); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Printing3D_IPrinting3DModelTexture); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DModelTexture): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DModelTexture); safecall;
    property Size: Cardinal read get_Size;
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
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IIterator`1<UInt32>
  IIterator_1__Cardinal = interface(IInspectable)
  ['{F06A2739-9443-5EF0-B284-DC5AFF3E7D10}']
    function get_Current: Cardinal; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCardinal): Cardinal; safecall;
    property Current: Cardinal read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<UInt32>
  }
  // Windows.Foundation.Collections.IIterable`1<UInt32>
  IIterable_1__Cardinal = interface(IInspectable)
  ['{421D4B91-B13B-5F37-AE54-B5249BD80539}']
    function First: IIterator_1__Cardinal; safecall;
  end;

  {
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<UInt32>
  IVectorView_1__Cardinal = interface(IInspectable)
  ['{E5CE1A07-8D33-5007-BA64-7D2508CCF85C}']
    function GetAt(index: Cardinal): Cardinal; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Cardinal; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCardinal): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<UInt32>
  }
  // Windows.Graphics.Printing3D.IPrinting3DMeshVerificationResult
  Printing3D_IPrinting3DMeshVerificationResult = interface(IInspectable)
  ['{195671BA-E93A-4E8A-A46F-DEA8E852197E}']
    function get_IsValid: Boolean; safecall;
    function get_NonmanifoldTriangles: IVectorView_1__Cardinal; safecall;
    function get_ReversedNormalTriangles: IVectorView_1__Cardinal; safecall;
    property IsValid: Boolean read get_IsValid;
    property NonmanifoldTriangles: IVectorView_1__Cardinal read get_NonmanifoldTriangles;
    property ReversedNormalTriangles: IVectorView_1__Cardinal read get_ReversedNormalTriangles;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Printing3D.IPrinting3DMeshVerificationResult>
  AsyncOperationCompletedHandler_1__Printing3D_IPrinting3DMeshVerificationResult_Delegate_Base = interface(IUnknown)
  ['{186BAE17-5896-56DE-BFF4-4F176B3E6194}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Printing3D.IPrinting3DMeshVerificationResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Printing3D.IPrinting3DMeshVerificationResult>
  AsyncOperationCompletedHandler_1__Printing3D_IPrinting3DMeshVerificationResult = interface(AsyncOperationCompletedHandler_1__Printing3D_IPrinting3DMeshVerificationResult_Delegate_Base)
  ['{CAB9430B-0AB4-56B9-81FF-7B276D015760}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Printing3D_IPrinting3DMeshVerificationResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Printing3D.IPrinting3DMeshVerificationResult>
  IAsyncOperation_1__Printing3D_IPrinting3DMeshVerificationResult_Base = interface(IInspectable)
  ['{0F9EB6C4-19F5-5BE9-9ADB-64F24AF115D8}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Printing3D.IPrinting3DMeshVerificationResult>
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DMeshVerificationResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Printing3D.IPrinting3DMeshVerificationResult>
  IAsyncOperation_1__Printing3D_IPrinting3DMeshVerificationResult = interface(IAsyncOperation_1__Printing3D_IPrinting3DMeshVerificationResult_Base)
  ['{810CF25C-2BEF-5233-BD26-57CE9FD5652E}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Printing3D_IPrinting3DMeshVerificationResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Printing3D_IPrinting3DMeshVerificationResult; safecall;
    function GetResults: Printing3D_IPrinting3DMeshVerificationResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Printing3D_IPrinting3DMeshVerificationResult read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Windows.Graphics.Printing3D.Printing3DBufferDescription
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Printing3D.IPrinting3DMeshVerificationResult>
  // Used Types:  Windows.Graphics.Printing3D.Printing3DMeshVerificationMode
  }
  // Windows.Graphics.Printing3D.IPrinting3DMesh
  Printing3D_IPrinting3DMesh = interface(IInspectable)
  ['{192E90DC-0228-2E01-BC20-C5290CBF32C4}']
    function get_VertexCount: Cardinal; safecall;
    procedure put_VertexCount(value: Cardinal); safecall;
    function get_IndexCount: Cardinal; safecall;
    procedure put_IndexCount(value: Cardinal); safecall;
    function get_VertexPositionsDescription: Printing3D_Printing3DBufferDescription; safecall;
    procedure put_VertexPositionsDescription(value: Printing3D_Printing3DBufferDescription); safecall;
    function get_VertexNormalsDescription: Printing3D_Printing3DBufferDescription; safecall;
    procedure put_VertexNormalsDescription(value: Printing3D_Printing3DBufferDescription); safecall;
    function get_TriangleIndicesDescription: Printing3D_Printing3DBufferDescription; safecall;
    procedure put_TriangleIndicesDescription(value: Printing3D_Printing3DBufferDescription); safecall;
    function get_TriangleMaterialIndicesDescription: Printing3D_Printing3DBufferDescription; safecall;
    procedure put_TriangleMaterialIndicesDescription(value: Printing3D_Printing3DBufferDescription); safecall;
    function GetVertexPositions: IBuffer; safecall;
    procedure CreateVertexPositions(value: Cardinal); safecall;
    function GetVertexNormals: IBuffer; safecall;
    procedure CreateVertexNormals(value: Cardinal); safecall;
    function GetTriangleIndices: IBuffer; safecall;
    procedure CreateTriangleIndices(value: Cardinal); safecall;
    function GetTriangleMaterialIndices: IBuffer; safecall;
    procedure CreateTriangleMaterialIndices(value: Cardinal); safecall;
    function get_BufferDescriptionSet: IPropertySet; safecall;
    function get_BufferSet: IPropertySet; safecall;
    function VerifyAsync(value: Printing3D_Printing3DMeshVerificationMode): IAsyncOperation_1__Printing3D_IPrinting3DMeshVerificationResult; safecall;
    property BufferDescriptionSet: IPropertySet read get_BufferDescriptionSet;
    property BufferSet: IPropertySet read get_BufferSet;
    property IndexCount: Cardinal read get_IndexCount write put_IndexCount;
    property TriangleIndicesDescription: Printing3D_Printing3DBufferDescription read get_TriangleIndicesDescription write put_TriangleIndicesDescription;
    property TriangleMaterialIndicesDescription: Printing3D_Printing3DBufferDescription read get_TriangleMaterialIndicesDescription write put_TriangleMaterialIndicesDescription;
    property VertexCount: Cardinal read get_VertexCount write put_VertexCount;
    property VertexNormalsDescription: Printing3D_Printing3DBufferDescription read get_VertexNormalsDescription write put_VertexNormalsDescription;
    property VertexPositionsDescription: Printing3D_Printing3DBufferDescription read get_VertexPositionsDescription write put_VertexPositionsDescription;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DMesh>
  IIterator_1__Printing3D_IPrinting3DMesh_Base = interface(IInspectable)
  ['{16DDF132-F80D-53B2-B09F-A42ED9689FC4}']
  end;
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DMesh
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DMesh>
  IIterator_1__Printing3D_IPrinting3DMesh = interface(IIterator_1__Printing3D_IPrinting3DMesh_Base)
  ['{E5AFC4A4-FBF2-5B6E-86D9-7947F0ACA0D7}']
    function get_Current: Printing3D_IPrinting3DMesh; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DMesh): Cardinal; safecall;
    property Current: Printing3D_IPrinting3DMesh read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DMesh>
  IIterable_1__Printing3D_IPrinting3DMesh_Base = interface(IInspectable)
  ['{A8018FDA-DE4D-56FA-8609-FD2298BFB558}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DMesh>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DMesh>
  IIterable_1__Printing3D_IPrinting3DMesh = interface(IIterable_1__Printing3D_IPrinting3DMesh_Base)
  ['{52F56826-8227-54C4-9830-117CE741F98B}']
    function First: IIterator_1__Printing3D_IPrinting3DMesh; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DMesh
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DMesh>
  IVectorView_1__Printing3D_IPrinting3DMesh = interface(IInspectable)
  ['{98D57DB9-CE52-5440-B55B-4CD489403B5C}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DMesh; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Printing3D_IPrinting3DMesh; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DMesh): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DMesh
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DMesh>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DMesh>
  IVector_1__Printing3D_IPrinting3DMesh = interface(IInspectable)
  ['{DEFEF6FF-A965-55A9-AD0A-3AC93191815F}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DMesh; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Printing3D_IPrinting3DMesh; safecall;
    function IndexOf(value: Printing3D_IPrinting3DMesh; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Printing3D_IPrinting3DMesh); safecall;
    procedure InsertAt(index: Cardinal; value: Printing3D_IPrinting3DMesh); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Printing3D_IPrinting3DMesh); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DMesh): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DMesh); safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DComponent
  // Used Types:  Windows.Foundation.Numerics.Matrix4x4
  }
  // Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix
  Printing3D_IPrinting3DComponentWithMatrix = interface(IInspectable)
  ['{3279F335-0EF0-456B-9A21-49BEBE8B51C2}']
    function get_Component: Printing3D_IPrinting3DComponent; safecall;
    procedure put_Component(value: Printing3D_IPrinting3DComponent); safecall;
    function get_Matrix: Numerics_Matrix4x4; safecall;
    procedure put_Matrix(value: Numerics_Matrix4x4); safecall;
    property Component: Printing3D_IPrinting3DComponent read get_Component write put_Component;
    property Matrix: Numerics_Matrix4x4 read get_Matrix write put_Matrix;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix>
  IIterator_1__Printing3D_IPrinting3DComponentWithMatrix_Base = interface(IInspectable)
  ['{01D2CE44-8B63-571F-B92E-BF2CF7CC6D53}']
  end;
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix>
  IIterator_1__Printing3D_IPrinting3DComponentWithMatrix = interface(IIterator_1__Printing3D_IPrinting3DComponentWithMatrix_Base)
  ['{CC0FF882-740D-59A6-9456-3F61015E0CC0}']
    function get_Current: Printing3D_IPrinting3DComponentWithMatrix; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DComponentWithMatrix): Cardinal; safecall;
    property Current: Printing3D_IPrinting3DComponentWithMatrix read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix>
  IIterable_1__Printing3D_IPrinting3DComponentWithMatrix_Base = interface(IInspectable)
  ['{8A213648-0B81-5E23-A48E-AFE9F6691CC1}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix>
  IIterable_1__Printing3D_IPrinting3DComponentWithMatrix = interface(IIterable_1__Printing3D_IPrinting3DComponentWithMatrix_Base)
  ['{58521B5C-FAA5-5F45-9FDB-04E4DD1A62E5}']
    function First: IIterator_1__Printing3D_IPrinting3DComponentWithMatrix; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix>
  IVectorView_1__Printing3D_IPrinting3DComponentWithMatrix = interface(IInspectable)
  ['{91544CF0-1B5B-5B15-81FC-067459089B9C}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DComponentWithMatrix; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Printing3D_IPrinting3DComponentWithMatrix; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DComponentWithMatrix): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix>
  IVector_1__Printing3D_IPrinting3DComponentWithMatrix = interface(IInspectable)
  ['{7E199659-C85A-5AC9-AE7D-FC5C026EBD44}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DComponentWithMatrix; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Printing3D_IPrinting3DComponentWithMatrix; safecall;
    function IndexOf(value: Printing3D_IPrinting3DComponentWithMatrix; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Printing3D_IPrinting3DComponentWithMatrix); safecall;
    procedure InsertAt(index: Cardinal; value: Printing3D_IPrinting3DComponentWithMatrix); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Printing3D_IPrinting3DComponentWithMatrix); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DComponentWithMatrix): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DComponentWithMatrix); safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DMesh
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DComponentWithMatrix>
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DTextureResource
  // Used Types:  Windows.Graphics.Printing3D.Printing3DObjectType
  // Used Types:  String
  }
  // Windows.Graphics.Printing3D.IPrinting3DComponent
  Printing3D_IPrinting3DComponent = interface(IInspectable)
  ['{7E287845-BF7F-4CDB-A27F-30A01437FEDE}']
    function get_Mesh: Printing3D_IPrinting3DMesh; safecall;
    procedure put_Mesh(value: Printing3D_IPrinting3DMesh); safecall;
    function get_Components: IVector_1__Printing3D_IPrinting3DComponentWithMatrix; safecall;
    function get_Thumbnail: Printing3D_IPrinting3DTextureResource; safecall;
    procedure put_Thumbnail(value: Printing3D_IPrinting3DTextureResource); safecall;
    function get_Type: Printing3D_Printing3DObjectType; safecall;
    procedure put_Type(value: Printing3D_Printing3DObjectType); safecall;
    function get_Name: HSTRING; safecall;
    procedure put_Name(value: HSTRING); safecall;
    function get_PartNumber: HSTRING; safecall;
    procedure put_PartNumber(value: HSTRING); safecall;
    property Components: IVector_1__Printing3D_IPrinting3DComponentWithMatrix read get_Components;
    property Mesh: Printing3D_IPrinting3DMesh read get_Mesh write put_Mesh;
    property Name: HSTRING read get_Name write put_Name;
    property PartNumber: HSTRING read get_PartNumber write put_PartNumber;
    property Thumbnail: Printing3D_IPrinting3DTextureResource read get_Thumbnail write put_Thumbnail;
    property &Type: Printing3D_Printing3DObjectType read get_Type write put_Type;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DComponent>
  IIterator_1__Printing3D_IPrinting3DComponent_Base = interface(IInspectable)
  ['{2E9EABBA-184B-5C14-AE5F-EB634AA717E0}']
  end;
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DComponent
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DComponent>
  IIterator_1__Printing3D_IPrinting3DComponent = interface(IIterator_1__Printing3D_IPrinting3DComponent_Base)
  ['{CDB6492A-B2EE-5707-BB49-F5E3DE91AECD}']
    function get_Current: Printing3D_IPrinting3DComponent; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DComponent): Cardinal; safecall;
    property Current: Printing3D_IPrinting3DComponent read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DComponent>
  IIterable_1__Printing3D_IPrinting3DComponent_Base = interface(IInspectable)
  ['{516556CA-F862-59F8-8241-E0F0C177DADD}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DComponent>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DComponent>
  IIterable_1__Printing3D_IPrinting3DComponent = interface(IIterable_1__Printing3D_IPrinting3DComponent_Base)
  ['{974F07E1-E491-5006-BB68-3616409A7F8D}']
    function First: IIterator_1__Printing3D_IPrinting3DComponent; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DComponent
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DComponent>
  IVectorView_1__Printing3D_IPrinting3DComponent = interface(IInspectable)
  ['{1CB57292-8550-5F87-BB54-1FC2A7199F19}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DComponent; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Printing3D_IPrinting3DComponent; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DComponent): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DComponent
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DComponent>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DComponent>
  IVector_1__Printing3D_IPrinting3DComponent = interface(IInspectable)
  ['{A5E70DA4-FA6B-5E7B-A1AC-398FB8B7251C}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DComponent; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Printing3D_IPrinting3DComponent; safecall;
    function IndexOf(value: Printing3D_IPrinting3DComponent; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Printing3D_IPrinting3DComponent); safecall;
    procedure InsertAt(index: Cardinal; value: Printing3D_IPrinting3DComponent); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Printing3D_IPrinting3DComponent); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DComponent): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DComponent); safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  UInt32
  }
  // Windows.Graphics.Printing3D.IPrinting3DColorMaterial
  Printing3D_IPrinting3DColorMaterial = interface(IInspectable)
  ['{E1899928-7CE7-4285-A35D-F145C9510C7B}']
    function get_Value: Cardinal; safecall;
    procedure put_Value(value: Cardinal); safecall;
    property Value: Cardinal read get_Value write put_Value;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DColorMaterial
  }
  // Windows.Graphics.Printing3D.IPrinting3DBaseMaterial
  Printing3D_IPrinting3DBaseMaterial = interface(IInspectable)
  ['{D0F0E743-C50C-4BCB-9D04-FC16ADCEA2C9}']
    function get_Name: HSTRING; safecall;
    procedure put_Name(value: HSTRING); safecall;
    function get_Color: Printing3D_IPrinting3DColorMaterial; safecall;
    procedure put_Color(value: Printing3D_IPrinting3DColorMaterial); safecall;
    property Color: Printing3D_IPrinting3DColorMaterial read get_Color write put_Color;
    property Name: HSTRING read get_Name write put_Name;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterial>
  IIterator_1__Printing3D_IPrinting3DBaseMaterial_Base = interface(IInspectable)
  ['{DAD4DD0D-59AB-501F-9D6B-A209C7D54649}']
  end;
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DBaseMaterial
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterial>
  IIterator_1__Printing3D_IPrinting3DBaseMaterial = interface(IIterator_1__Printing3D_IPrinting3DBaseMaterial_Base)
  ['{554183C9-C06B-52F8-9312-DF17E5FC59B0}']
    function get_Current: Printing3D_IPrinting3DBaseMaterial; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DBaseMaterial): Cardinal; safecall;
    property Current: Printing3D_IPrinting3DBaseMaterial read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterial>
  IIterable_1__Printing3D_IPrinting3DBaseMaterial_Base = interface(IInspectable)
  ['{9A6BD130-6F22-559C-B92C-14F9F8DDDA47}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterial>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterial>
  IIterable_1__Printing3D_IPrinting3DBaseMaterial = interface(IIterable_1__Printing3D_IPrinting3DBaseMaterial_Base)
  ['{C5D08812-990E-5B4C-B9FE-CC64C2BA1E42}']
    function First: IIterator_1__Printing3D_IPrinting3DBaseMaterial; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DBaseMaterial
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterial>
  IVectorView_1__Printing3D_IPrinting3DBaseMaterial = interface(IInspectable)
  ['{CD2E2B52-D8D5-5138-9958-A9434F1BEE9D}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DBaseMaterial; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Printing3D_IPrinting3DBaseMaterial; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DBaseMaterial): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DBaseMaterial
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterial>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterial>
  IVector_1__Printing3D_IPrinting3DBaseMaterial = interface(IInspectable)
  ['{2320DA4D-71C2-51A9-923E-596D62E9D50D}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DBaseMaterial; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Printing3D_IPrinting3DBaseMaterial; safecall;
    function IndexOf(value: Printing3D_IPrinting3DBaseMaterial; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Printing3D_IPrinting3DBaseMaterial); safecall;
    procedure InsertAt(index: Cardinal; value: Printing3D_IPrinting3DBaseMaterial); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Printing3D_IPrinting3DBaseMaterial); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DBaseMaterial): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DBaseMaterial); safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterial>
  // Used Types:  UInt32
  }
  // Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup
  Printing3D_IPrinting3DBaseMaterialGroup = interface(IInspectable)
  ['{94F070B8-2515-4A8D-A1F0-D0FC13D06021}']
    function get_Bases: IVector_1__Printing3D_IPrinting3DBaseMaterial; safecall;
    function get_MaterialGroupId: Cardinal; safecall;
    property Bases: IVector_1__Printing3D_IPrinting3DBaseMaterial read get_Bases;
    property MaterialGroupId: Cardinal read get_MaterialGroupId;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup>
  IIterator_1__Printing3D_IPrinting3DBaseMaterialGroup_Base = interface(IInspectable)
  ['{A34DC709-E2A7-5254-9DC1-CD47E85E2504}']
  end;
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup>
  IIterator_1__Printing3D_IPrinting3DBaseMaterialGroup = interface(IIterator_1__Printing3D_IPrinting3DBaseMaterialGroup_Base)
  ['{56BDF2AE-AACB-5F77-870B-EA3D323D0BF7}']
    function get_Current: Printing3D_IPrinting3DBaseMaterialGroup; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DBaseMaterialGroup): Cardinal; safecall;
    property Current: Printing3D_IPrinting3DBaseMaterialGroup read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup>
  IIterable_1__Printing3D_IPrinting3DBaseMaterialGroup_Base = interface(IInspectable)
  ['{C08F8E70-F6EF-5469-806A-7CB601DDDB67}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup>
  IIterable_1__Printing3D_IPrinting3DBaseMaterialGroup = interface(IIterable_1__Printing3D_IPrinting3DBaseMaterialGroup_Base)
  ['{BD818304-E7A1-5BD6-A3AE-8756A0DB15CF}']
    function First: IIterator_1__Printing3D_IPrinting3DBaseMaterialGroup; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup>
  IVectorView_1__Printing3D_IPrinting3DBaseMaterialGroup = interface(IInspectable)
  ['{604A4A76-2482-586A-98E0-817A8FDF8BD3}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DBaseMaterialGroup; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Printing3D_IPrinting3DBaseMaterialGroup; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DBaseMaterialGroup): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup>
  IVector_1__Printing3D_IPrinting3DBaseMaterialGroup = interface(IInspectable)
  ['{BEBC9817-B94D-54ED-97C9-8FD53FE16064}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DBaseMaterialGroup; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Printing3D_IPrinting3DBaseMaterialGroup; safecall;
    function IndexOf(value: Printing3D_IPrinting3DBaseMaterialGroup; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Printing3D_IPrinting3DBaseMaterialGroup); safecall;
    procedure InsertAt(index: Cardinal; value: Printing3D_IPrinting3DBaseMaterialGroup); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Printing3D_IPrinting3DBaseMaterialGroup); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DBaseMaterialGroup): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DBaseMaterialGroup); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterial>
  IIterator_1__Printing3D_IPrinting3DColorMaterial_Base = interface(IInspectable)
  ['{5A54A4A1-4D97-58D3-BDCC-1BF38B438D6D}']
  end;
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DColorMaterial
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterial>
  IIterator_1__Printing3D_IPrinting3DColorMaterial = interface(IIterator_1__Printing3D_IPrinting3DColorMaterial_Base)
  ['{6FA3C260-9ADD-5402-ACB8-20C6CF151786}']
    function get_Current: Printing3D_IPrinting3DColorMaterial; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DColorMaterial): Cardinal; safecall;
    property Current: Printing3D_IPrinting3DColorMaterial read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterial>
  IIterable_1__Printing3D_IPrinting3DColorMaterial_Base = interface(IInspectable)
  ['{C77D4F28-7882-52B4-B3C9-7D58C8836573}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterial>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterial>
  IIterable_1__Printing3D_IPrinting3DColorMaterial = interface(IIterable_1__Printing3D_IPrinting3DColorMaterial_Base)
  ['{18277BF1-9FC4-5AFC-AEAD-75774B96371F}']
    function First: IIterator_1__Printing3D_IPrinting3DColorMaterial; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DColorMaterial
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterial>
  IVectorView_1__Printing3D_IPrinting3DColorMaterial = interface(IInspectable)
  ['{CBD171C8-A1B5-5F88-AAFD-E5EE72B1306E}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DColorMaterial; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Printing3D_IPrinting3DColorMaterial; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DColorMaterial): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DColorMaterial
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterial>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterial>
  IVector_1__Printing3D_IPrinting3DColorMaterial = interface(IInspectable)
  ['{3EBF04EA-4993-53C0-987A-0D9F1AF74A55}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DColorMaterial; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Printing3D_IPrinting3DColorMaterial; safecall;
    function IndexOf(value: Printing3D_IPrinting3DColorMaterial; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Printing3D_IPrinting3DColorMaterial); safecall;
    procedure InsertAt(index: Cardinal; value: Printing3D_IPrinting3DColorMaterial); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Printing3D_IPrinting3DColorMaterial); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DColorMaterial): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DColorMaterial); safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterial>
  // Used Types:  UInt32
  }
  // Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup
  Printing3D_IPrinting3DColorMaterialGroup = interface(IInspectable)
  ['{001A6BD0-AADF-4226-AFE9-F369A0B45004}']
    function get_Colors: IVector_1__Printing3D_IPrinting3DColorMaterial; safecall;
    function get_MaterialGroupId: Cardinal; safecall;
    property Colors: IVector_1__Printing3D_IPrinting3DColorMaterial read get_Colors;
    property MaterialGroupId: Cardinal read get_MaterialGroupId;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup>
  IIterator_1__Printing3D_IPrinting3DColorMaterialGroup_Base = interface(IInspectable)
  ['{498467BE-DE0E-552B-B24E-8EE25EC9A486}']
  end;
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup>
  IIterator_1__Printing3D_IPrinting3DColorMaterialGroup = interface(IIterator_1__Printing3D_IPrinting3DColorMaterialGroup_Base)
  ['{A040AFB1-5C30-56C7-8E56-05F4BE542920}']
    function get_Current: Printing3D_IPrinting3DColorMaterialGroup; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DColorMaterialGroup): Cardinal; safecall;
    property Current: Printing3D_IPrinting3DColorMaterialGroup read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup>
  IIterable_1__Printing3D_IPrinting3DColorMaterialGroup_Base = interface(IInspectable)
  ['{1BF32A86-26AB-5750-B54C-3BDA67867F8A}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup>
  IIterable_1__Printing3D_IPrinting3DColorMaterialGroup = interface(IIterable_1__Printing3D_IPrinting3DColorMaterialGroup_Base)
  ['{2AF52DC1-D5C9-5823-85D8-49CF3FEE21C2}']
    function First: IIterator_1__Printing3D_IPrinting3DColorMaterialGroup; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup>
  IVectorView_1__Printing3D_IPrinting3DColorMaterialGroup = interface(IInspectable)
  ['{684C232E-F89D-5DDC-9B93-66D8ECDCD5B2}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DColorMaterialGroup; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Printing3D_IPrinting3DColorMaterialGroup; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DColorMaterialGroup): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup>
  IVector_1__Printing3D_IPrinting3DColorMaterialGroup = interface(IInspectable)
  ['{E9D413D0-5D89-5C11-862B-92CC89C86A71}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DColorMaterialGroup; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Printing3D_IPrinting3DColorMaterialGroup; safecall;
    function IndexOf(value: Printing3D_IPrinting3DColorMaterialGroup; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Printing3D_IPrinting3DColorMaterialGroup); safecall;
    procedure InsertAt(index: Cardinal; value: Printing3D_IPrinting3DColorMaterialGroup); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Printing3D_IPrinting3DColorMaterialGroup); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DColorMaterialGroup): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DColorMaterialGroup); safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DModelTexture
  // Used Types:  Double
  }
  // Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial
  Printing3D_IPrinting3DTexture2CoordMaterial = interface(IInspectable)
  ['{8D844BFB-07E9-4986-9833-8DD3D48C6859}']
    function get_Texture: Printing3D_IPrinting3DModelTexture; safecall;
    procedure put_Texture(value: Printing3D_IPrinting3DModelTexture); safecall;
    function get_U: Double; safecall;
    procedure put_U(value: Double); safecall;
    function get_V: Double; safecall;
    procedure put_V(value: Double); safecall;
    property Texture: Printing3D_IPrinting3DModelTexture read get_Texture write put_Texture;
    property U: Double read get_U write put_U;
    property V: Double read get_V write put_V;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial>
  IIterator_1__Printing3D_IPrinting3DTexture2CoordMaterial_Base = interface(IInspectable)
  ['{72D80D63-3626-5A2F-A579-78E70AA86D46}']
  end;
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial>
  IIterator_1__Printing3D_IPrinting3DTexture2CoordMaterial = interface(IIterator_1__Printing3D_IPrinting3DTexture2CoordMaterial_Base)
  ['{3F41C68D-E03B-5FA8-8B60-551986FDA50C}']
    function get_Current: Printing3D_IPrinting3DTexture2CoordMaterial; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DTexture2CoordMaterial): Cardinal; safecall;
    property Current: Printing3D_IPrinting3DTexture2CoordMaterial read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial>
  IIterable_1__Printing3D_IPrinting3DTexture2CoordMaterial_Base = interface(IInspectable)
  ['{28373276-483C-5BD0-99C7-01BFA04A57D4}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial>
  IIterable_1__Printing3D_IPrinting3DTexture2CoordMaterial = interface(IIterable_1__Printing3D_IPrinting3DTexture2CoordMaterial_Base)
  ['{123F7245-99B4-5C91-BC24-69817A81724A}']
    function First: IIterator_1__Printing3D_IPrinting3DTexture2CoordMaterial; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial>
  IVectorView_1__Printing3D_IPrinting3DTexture2CoordMaterial = interface(IInspectable)
  ['{C75A5592-56A6-5F5E-9811-4467AA7BB799}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DTexture2CoordMaterial; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Printing3D_IPrinting3DTexture2CoordMaterial; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DTexture2CoordMaterial): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial>
  IVector_1__Printing3D_IPrinting3DTexture2CoordMaterial = interface(IInspectable)
  ['{13121B2B-F279-5445-A956-AEFF8032A442}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DTexture2CoordMaterial; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Printing3D_IPrinting3DTexture2CoordMaterial; safecall;
    function IndexOf(value: Printing3D_IPrinting3DTexture2CoordMaterial; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Printing3D_IPrinting3DTexture2CoordMaterial); safecall;
    procedure InsertAt(index: Cardinal; value: Printing3D_IPrinting3DTexture2CoordMaterial); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Printing3D_IPrinting3DTexture2CoordMaterial); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DTexture2CoordMaterial): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DTexture2CoordMaterial); safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterial>
  // Used Types:  UInt32
  }
  // Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup
  Printing3D_IPrinting3DTexture2CoordMaterialGroup = interface(IInspectable)
  ['{627D7CA7-6D90-4FB9-9FC4-9FEFF3DFA892}']
    function get_Texture2Coords: IVector_1__Printing3D_IPrinting3DTexture2CoordMaterial; safecall;
    function get_MaterialGroupId: Cardinal; safecall;
    property MaterialGroupId: Cardinal read get_MaterialGroupId;
    property Texture2Coords: IVector_1__Printing3D_IPrinting3DTexture2CoordMaterial read get_Texture2Coords;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup>
  IIterator_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup_Base = interface(IInspectable)
  ['{11EAECC4-6AC1-5697-9BF5-1EF617E1DFEB}']
  end;
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup>
  IIterator_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup = interface(IIterator_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup_Base)
  ['{7B8DD78A-E720-5310-AF5A-F507674268C4}']
    function get_Current: Printing3D_IPrinting3DTexture2CoordMaterialGroup; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DTexture2CoordMaterialGroup): Cardinal; safecall;
    property Current: Printing3D_IPrinting3DTexture2CoordMaterialGroup read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup>
  IIterable_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup_Base = interface(IInspectable)
  ['{00017A1D-96BC-5C0E-B786-594FB4D077B6}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup>
  IIterable_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup = interface(IIterable_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup_Base)
  ['{2B58CE32-38EE-59BA-AA73-EA2B807C87E1}']
    function First: IIterator_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup>
  IVectorView_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup = interface(IInspectable)
  ['{B02EEF03-B90A-5DCD-9EF3-D2550288765D}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DTexture2CoordMaterialGroup; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Printing3D_IPrinting3DTexture2CoordMaterialGroup; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DTexture2CoordMaterialGroup): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup>
  IVector_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup = interface(IInspectable)
  ['{756A81F3-DD00-51FE-A4EB-3F800462DA68}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DTexture2CoordMaterialGroup; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup; safecall;
    function IndexOf(value: Printing3D_IPrinting3DTexture2CoordMaterialGroup; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Printing3D_IPrinting3DTexture2CoordMaterialGroup); safecall;
    procedure InsertAt(index: Cardinal; value: Printing3D_IPrinting3DTexture2CoordMaterialGroup); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Printing3D_IPrinting3DTexture2CoordMaterialGroup); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DTexture2CoordMaterialGroup): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DTexture2CoordMaterialGroup); safecall;
    property Size: Cardinal read get_Size;
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

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Double>
  }
  // Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial
  Printing3D_IPrinting3DCompositeMaterial = interface(IInspectable)
  ['{462238DD-562E-4F6C-882D-F4D841FD63C7}']
    function get_Values: IVector_1__Double; safecall;
    property Values: IVector_1__Double read get_Values;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial>
  IIterator_1__Printing3D_IPrinting3DCompositeMaterial_Base = interface(IInspectable)
  ['{B7E6B17A-A885-5C97-B29E-BF261EB5DAD4}']
  end;
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial>
  IIterator_1__Printing3D_IPrinting3DCompositeMaterial = interface(IIterator_1__Printing3D_IPrinting3DCompositeMaterial_Base)
  ['{927C2496-40DC-56CD-A5B4-EF01B516A485}']
    function get_Current: Printing3D_IPrinting3DCompositeMaterial; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DCompositeMaterial): Cardinal; safecall;
    property Current: Printing3D_IPrinting3DCompositeMaterial read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial>
  IIterable_1__Printing3D_IPrinting3DCompositeMaterial_Base = interface(IInspectable)
  ['{A0AF2623-1B11-53CF-975D-64959386CDD3}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial>
  IIterable_1__Printing3D_IPrinting3DCompositeMaterial = interface(IIterable_1__Printing3D_IPrinting3DCompositeMaterial_Base)
  ['{FCECFD8A-616D-5166-B72D-EBF4BAC48E6F}']
    function First: IIterator_1__Printing3D_IPrinting3DCompositeMaterial; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial>
  IVectorView_1__Printing3D_IPrinting3DCompositeMaterial = interface(IInspectable)
  ['{70B2D562-E1BE-50EA-9698-8D4298D1B422}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DCompositeMaterial; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Printing3D_IPrinting3DCompositeMaterial; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DCompositeMaterial): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial>
  IVector_1__Printing3D_IPrinting3DCompositeMaterial = interface(IInspectable)
  ['{71D196E7-9173-5B99-A01E-1B014A8448EE}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DCompositeMaterial; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Printing3D_IPrinting3DCompositeMaterial; safecall;
    function IndexOf(value: Printing3D_IPrinting3DCompositeMaterial; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Printing3D_IPrinting3DCompositeMaterial); safecall;
    procedure InsertAt(index: Cardinal; value: Printing3D_IPrinting3DCompositeMaterial); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Printing3D_IPrinting3DCompositeMaterial); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DCompositeMaterial): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DCompositeMaterial); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<UInt32>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<UInt32>
  IVector_1__Cardinal = interface(IInspectable)
  ['{534832ED-2A03-5604-890D-5A928CD427B9}']
    function GetAt(index: Cardinal): Cardinal; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Cardinal; safecall;
    function IndexOf(value: Cardinal; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Cardinal); safecall;
    procedure InsertAt(index: Cardinal; value: Cardinal); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Cardinal); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCardinal): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PCardinal); safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterial>
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVector`1<UInt32>
  }
  // Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup
  Printing3D_IPrinting3DCompositeMaterialGroup = interface(IInspectable)
  ['{8D946A5B-40F1-496D-A5FB-340A5A678E30}']
    function get_Composites: IVector_1__Printing3D_IPrinting3DCompositeMaterial; safecall;
    function get_MaterialGroupId: Cardinal; safecall;
    function get_MaterialIndices: IVector_1__Cardinal; safecall;
    property Composites: IVector_1__Printing3D_IPrinting3DCompositeMaterial read get_Composites;
    property MaterialGroupId: Cardinal read get_MaterialGroupId;
    property MaterialIndices: IVector_1__Cardinal read get_MaterialIndices;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup>
  IIterator_1__Printing3D_IPrinting3DCompositeMaterialGroup_Base = interface(IInspectable)
  ['{AF86EEA4-DD9D-5AA9-AEE5-BE3892124742}']
  end;
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup>
  IIterator_1__Printing3D_IPrinting3DCompositeMaterialGroup = interface(IIterator_1__Printing3D_IPrinting3DCompositeMaterialGroup_Base)
  ['{7A3823C5-4890-5A00-B63A-A45265854B94}']
    function get_Current: Printing3D_IPrinting3DCompositeMaterialGroup; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DCompositeMaterialGroup): Cardinal; safecall;
    property Current: Printing3D_IPrinting3DCompositeMaterialGroup read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup>
  IIterable_1__Printing3D_IPrinting3DCompositeMaterialGroup_Base = interface(IInspectable)
  ['{F2FFEF61-C254-58C0-8206-B3B3096BE9CB}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup>
  IIterable_1__Printing3D_IPrinting3DCompositeMaterialGroup = interface(IIterable_1__Printing3D_IPrinting3DCompositeMaterialGroup_Base)
  ['{66D9950E-0510-5A4C-8005-282E56C01361}']
    function First: IIterator_1__Printing3D_IPrinting3DCompositeMaterialGroup; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup>
  IVectorView_1__Printing3D_IPrinting3DCompositeMaterialGroup = interface(IInspectable)
  ['{4FF3642A-FE61-5E9A-99D6-8C58679A9FC8}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DCompositeMaterialGroup; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Printing3D_IPrinting3DCompositeMaterialGroup; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DCompositeMaterialGroup): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup>
  IVector_1__Printing3D_IPrinting3DCompositeMaterialGroup = interface(IInspectable)
  ['{91048A2E-951A-5523-8F41-E91A093C07BB}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DCompositeMaterialGroup; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Printing3D_IPrinting3DCompositeMaterialGroup; safecall;
    function IndexOf(value: Printing3D_IPrinting3DCompositeMaterialGroup; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Printing3D_IPrinting3DCompositeMaterialGroup); safecall;
    procedure InsertAt(index: Cardinal; value: Printing3D_IPrinting3DCompositeMaterialGroup); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Printing3D_IPrinting3DCompositeMaterialGroup); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DCompositeMaterialGroup): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DCompositeMaterialGroup); safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<UInt32>
  }
  // Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial
  Printing3D_IPrinting3DMultiplePropertyMaterial = interface(IInspectable)
  ['{25A6254B-C6E9-484D-A214-A25E5776BA62}']
    function get_MaterialIndices: IVector_1__Cardinal; safecall;
    property MaterialIndices: IVector_1__Cardinal read get_MaterialIndices;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial>
  IIterator_1__Printing3D_IPrinting3DMultiplePropertyMaterial_Base = interface(IInspectable)
  ['{614C0A0A-BF75-56AD-A304-B79F60017B83}']
  end;
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial>
  IIterator_1__Printing3D_IPrinting3DMultiplePropertyMaterial = interface(IIterator_1__Printing3D_IPrinting3DMultiplePropertyMaterial_Base)
  ['{E70D5AD3-D569-5AD4-9050-E44FB8F1C41D}']
    function get_Current: Printing3D_IPrinting3DMultiplePropertyMaterial; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DMultiplePropertyMaterial): Cardinal; safecall;
    property Current: Printing3D_IPrinting3DMultiplePropertyMaterial read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial>
  IIterable_1__Printing3D_IPrinting3DMultiplePropertyMaterial_Base = interface(IInspectable)
  ['{0DFC274E-AE4D-5BBB-93A8-7DC9F84DDAC3}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial>
  IIterable_1__Printing3D_IPrinting3DMultiplePropertyMaterial = interface(IIterable_1__Printing3D_IPrinting3DMultiplePropertyMaterial_Base)
  ['{231E974E-34D5-5C64-B66E-C37FD8F5F606}']
    function First: IIterator_1__Printing3D_IPrinting3DMultiplePropertyMaterial; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial>
  IVectorView_1__Printing3D_IPrinting3DMultiplePropertyMaterial = interface(IInspectable)
  ['{668C7B77-E1D1-5B9C-B13F-8EE900C32BF4}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DMultiplePropertyMaterial; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Printing3D_IPrinting3DMultiplePropertyMaterial; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DMultiplePropertyMaterial): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial>
  IVector_1__Printing3D_IPrinting3DMultiplePropertyMaterial = interface(IInspectable)
  ['{A96C14BD-C789-56C6-90A6-E9EC18EEF181}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DMultiplePropertyMaterial; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Printing3D_IPrinting3DMultiplePropertyMaterial; safecall;
    function IndexOf(value: Printing3D_IPrinting3DMultiplePropertyMaterial; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Printing3D_IPrinting3DMultiplePropertyMaterial); safecall;
    procedure InsertAt(index: Cardinal; value: Printing3D_IPrinting3DMultiplePropertyMaterial); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Printing3D_IPrinting3DMultiplePropertyMaterial); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DMultiplePropertyMaterial): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DMultiplePropertyMaterial); safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterial>
  // Used Types:  Windows.Foundation.Collections.IVector`1<UInt32>
  // Used Types:  UInt32
  }
  // Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup
  Printing3D_IPrinting3DMultiplePropertyMaterialGroup = interface(IInspectable)
  ['{F0950519-AEB9-4515-A39B-A088FBBB277C}']
    function get_MultipleProperties: IVector_1__Printing3D_IPrinting3DMultiplePropertyMaterial; safecall;
    function get_MaterialGroupIndices: IVector_1__Cardinal; safecall;
    function get_MaterialGroupId: Cardinal; safecall;
    property MaterialGroupId: Cardinal read get_MaterialGroupId;
    property MaterialGroupIndices: IVector_1__Cardinal read get_MaterialGroupIndices;
    property MultipleProperties: IVector_1__Printing3D_IPrinting3DMultiplePropertyMaterial read get_MultipleProperties;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup>
  IIterator_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup_Base = interface(IInspectable)
  ['{A24BAB9A-D946-5036-B1C9-1C09B793F36C}']
  end;
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup>
  IIterator_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup = interface(IIterator_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup_Base)
  ['{0007E339-CF16-5EA1-9ECF-72711DFDB933}']
    function get_Current: Printing3D_IPrinting3DMultiplePropertyMaterialGroup; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DMultiplePropertyMaterialGroup): Cardinal; safecall;
    property Current: Printing3D_IPrinting3DMultiplePropertyMaterialGroup read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup>
  IIterable_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup_Base = interface(IInspectable)
  ['{23F7518E-2439-5573-A683-EFCA0C61A8D6}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup>
  IIterable_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup = interface(IIterable_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup_Base)
  ['{28A64E3D-5859-5FDF-8F7C-214CBD1FC8DD}']
    function First: IIterator_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup>
  IVectorView_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup = interface(IInspectable)
  ['{1B1F556D-17F1-523C-8D31-B9747419CD2C}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DMultiplePropertyMaterialGroup; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Printing3D_IPrinting3DMultiplePropertyMaterialGroup; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DMultiplePropertyMaterialGroup): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup>
  IVector_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup = interface(IInspectable)
  ['{15874BEC-0852-5189-97BB-3C204648D709}']
    function GetAt(index: Cardinal): Printing3D_IPrinting3DMultiplePropertyMaterialGroup; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup; safecall;
    function IndexOf(value: Printing3D_IPrinting3DMultiplePropertyMaterialGroup; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Printing3D_IPrinting3DMultiplePropertyMaterialGroup); safecall;
    procedure InsertAt(index: Cardinal; value: Printing3D_IPrinting3DMultiplePropertyMaterialGroup); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Printing3D_IPrinting3DMultiplePropertyMaterialGroup); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPrinting3D_IPrinting3DMultiplePropertyMaterialGroup): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PPrinting3D_IPrinting3DMultiplePropertyMaterialGroup); safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DBaseMaterialGroup>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DColorMaterialGroup>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DTexture2CoordMaterialGroup>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DCompositeMaterialGroup>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DMultiplePropertyMaterialGroup>
  }
  // Windows.Graphics.Printing3D.IPrinting3DMaterial
  Printing3D_IPrinting3DMaterial = interface(IInspectable)
  ['{378DB256-ED62-4952-B85B-03567D7C465E}']
    function get_BaseGroups: IVector_1__Printing3D_IPrinting3DBaseMaterialGroup; safecall;
    function get_ColorGroups: IVector_1__Printing3D_IPrinting3DColorMaterialGroup; safecall;
    function get_Texture2CoordGroups: IVector_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup; safecall;
    function get_CompositeGroups: IVector_1__Printing3D_IPrinting3DCompositeMaterialGroup; safecall;
    function get_MultiplePropertyGroups: IVector_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup; safecall;
    property BaseGroups: IVector_1__Printing3D_IPrinting3DBaseMaterialGroup read get_BaseGroups;
    property ColorGroups: IVector_1__Printing3D_IPrinting3DColorMaterialGroup read get_ColorGroups;
    property CompositeGroups: IVector_1__Printing3D_IPrinting3DCompositeMaterialGroup read get_CompositeGroups;
    property MultiplePropertyGroups: IVector_1__Printing3D_IPrinting3DMultiplePropertyMaterialGroup read get_MultiplePropertyGroups;
    property Texture2CoordGroups: IVector_1__Printing3D_IPrinting3DTexture2CoordMaterialGroup read get_Texture2CoordGroups;
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

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.Printing3DModelUnit
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DModelTexture>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DMesh>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DComponent>
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DMaterial
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DComponent
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVector`1<String>
  // Used Types:  Windows.Foundation.Collections.IMap`2<String,String>
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DModel
  }
  // Windows.Graphics.Printing3D.IPrinting3DModel
  Printing3D_IPrinting3DModel = interface(IInspectable)
  ['{2D012EF0-52FB-919A-77B0-4B1A3B80324F}']
    function get_Unit: Printing3D_Printing3DModelUnit; safecall;
    procedure put_Unit(value: Printing3D_Printing3DModelUnit); safecall;
    function get_Textures: IVector_1__Printing3D_IPrinting3DModelTexture; safecall;
    function get_Meshes: IVector_1__Printing3D_IPrinting3DMesh; safecall;
    function get_Components: IVector_1__Printing3D_IPrinting3DComponent; safecall;
    function get_Material: Printing3D_IPrinting3DMaterial; safecall;
    procedure put_Material(value: Printing3D_IPrinting3DMaterial); safecall;
    function get_Build: Printing3D_IPrinting3DComponent; safecall;
    procedure put_Build(value: Printing3D_IPrinting3DComponent); safecall;
    function get_Version: HSTRING; safecall;
    procedure put_Version(value: HSTRING); safecall;
    function get_RequiredExtensions: IVector_1__HSTRING; safecall;
    function get_Metadata: IMap_2__HSTRING__HSTRING; safecall;
    function RepairAsync: IAsyncAction; safecall;
    function Clone: Printing3D_IPrinting3DModel; safecall;
    property Build: Printing3D_IPrinting3DComponent read get_Build write put_Build;
    property Components: IVector_1__Printing3D_IPrinting3DComponent read get_Components;
    property Material: Printing3D_IPrinting3DMaterial read get_Material write put_Material;
    property Meshes: IVector_1__Printing3D_IPrinting3DMesh read get_Meshes;
    property Metadata: IMap_2__HSTRING__HSTRING read get_Metadata;
    property RequiredExtensions: IVector_1__HSTRING read get_RequiredExtensions;
    property Textures: IVector_1__Printing3D_IPrinting3DModelTexture read get_Textures;
    property &Unit: Printing3D_Printing3DModelUnit read get_Unit write put_Unit;
    property Version: HSTRING read get_Version write put_Version;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Printing3D.IPrinting3DModel>
  AsyncOperationCompletedHandler_1__Printing3D_IPrinting3DModel_Delegate_Base = interface(IUnknown)
  ['{26F4D34C-A11D-5B09-9908-ADE8B1B13555}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Printing3D.IPrinting3DModel>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Printing3D.IPrinting3DModel>
  AsyncOperationCompletedHandler_1__Printing3D_IPrinting3DModel = interface(AsyncOperationCompletedHandler_1__Printing3D_IPrinting3DModel_Delegate_Base)
  ['{CAE40DF1-F459-5C86-B28B-C5A0FC437AB9}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Printing3D_IPrinting3DModel; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Printing3D.IPrinting3DModel>
  IAsyncOperation_1__Printing3D_IPrinting3DModel_Base = interface(IInspectable)
  ['{1B27900B-10D5-53FF-9A34-4B31F31582B0}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Printing3D.IPrinting3DModel>
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DModel
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Printing3D.IPrinting3DModel>
  IAsyncOperation_1__Printing3D_IPrinting3DModel = interface(IAsyncOperation_1__Printing3D_IPrinting3DModel_Base)
  ['{2E87092F-7EA2-5D57-A220-5B53AB96379E}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Printing3D_IPrinting3DModel); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Printing3D_IPrinting3DModel; safecall;
    function GetResults: Printing3D_IPrinting3DModel; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Printing3D_IPrinting3DModel read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IRandomAccessStream>
  // Used Types:  Windows.Storage.Streams.IRandomAccessStream
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DTextureResource
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Graphics.Printing3D.IPrinting3DTextureResource>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Printing3D.IPrinting3DModel>
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3DModel
  }
  // Windows.Graphics.Printing3D.IPrinting3D3MFPackage
  Printing3D_IPrinting3D3MFPackage = interface(IInspectable)
  ['{F64DD5C8-2AB7-45A9-A1B7-267E948D5B18}']
    function SaveAsync: IAsyncOperation_1__IRandomAccessStream; safecall;
    function get_PrintTicket: IRandomAccessStream; safecall;
    procedure put_PrintTicket(value: IRandomAccessStream); safecall;
    function get_ModelPart: IRandomAccessStream; safecall;
    procedure put_ModelPart(value: IRandomAccessStream); safecall;
    function get_Thumbnail: Printing3D_IPrinting3DTextureResource; safecall;
    procedure put_Thumbnail(value: Printing3D_IPrinting3DTextureResource); safecall;
    function get_Textures: IVector_1__Printing3D_IPrinting3DTextureResource; safecall;
    function LoadModelFromPackageAsync(value: IRandomAccessStream): IAsyncOperation_1__Printing3D_IPrinting3DModel; safecall;
    function SaveModelToPackageAsync(value: Printing3D_IPrinting3DModel): IAsyncAction; safecall;
    property ModelPart: IRandomAccessStream read get_ModelPart write put_ModelPart;
    property PrintTicket: IRandomAccessStream read get_PrintTicket write put_PrintTicket;
    property Textures: IVector_1__Printing3D_IPrinting3DTextureResource read get_Textures;
    property Thumbnail: Printing3D_IPrinting3DTextureResource read get_Thumbnail write put_Thumbnail;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3D3MFPackage
  }
  // Windows.Graphics.Printing3D.IPrint3DTaskSourceChangedEventArgs
  [WinRTClassNameAttribute(SPrinting3D_Print3DTaskSourceChangedEventArgs)]
  Printing3D_IPrint3DTaskSourceChangedEventArgs = interface(IInspectable)
  ['{5BCD34AF-24E9-4C10-8D07-14C346BA3FCF}']
    function get_Source: Printing3D_IPrinting3D3MFPackage; safecall;
    property Source: Printing3D_IPrinting3D3MFPackage read get_Source;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Graphics.Printing3D.IPrint3DTask,Object>
  TypedEventHandler_2__Printing3D_IPrint3DTask__IInspectable_Delegate_Base = interface(IUnknown)
  ['{C0081611-7485-58A8-88BE-82E712D8C1BA}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrint3DTask
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Graphics.Printing3D.IPrint3DTask,Object>
  TypedEventHandler_2__Printing3D_IPrint3DTask__IInspectable = interface(TypedEventHandler_2__Printing3D_IPrint3DTask__IInspectable_Delegate_Base)
  ['{1412284C-867A-5C17-BA5E-5F7BCD2098B5}']
    procedure Invoke(sender: Printing3D_IPrint3DTask; args: IInspectable); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Graphics.Printing3D.IPrint3DTask,Windows.Graphics.Printing3D.IPrint3DTaskCompletedEventArgs>
  TypedEventHandler_2__Printing3D_IPrint3DTask__Printing3D_IPrint3DTaskCompletedEventArgs_Delegate_Base = interface(IUnknown)
  ['{BCCF7095-BC8E-5FF5-83C0-D5691E0AA24D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrint3DTask
  // Used Types:  Windows.Graphics.Printing3D.IPrint3DTaskCompletedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Graphics.Printing3D.IPrint3DTask,Windows.Graphics.Printing3D.IPrint3DTaskCompletedEventArgs>
  TypedEventHandler_2__Printing3D_IPrint3DTask__Printing3D_IPrint3DTaskCompletedEventArgs = interface(TypedEventHandler_2__Printing3D_IPrint3DTask__Printing3D_IPrint3DTaskCompletedEventArgs_Delegate_Base)
  ['{E32B9E59-D059-58CF-BDAC-30D4BFC78FF5}']
    procedure Invoke(sender: Printing3D_IPrint3DTask; args: Printing3D_IPrint3DTaskCompletedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Graphics.Printing3D.IPrint3DTask,Windows.Graphics.Printing3D.IPrint3DTaskSourceChangedEventArgs>
  TypedEventHandler_2__Printing3D_IPrint3DTask__Printing3D_IPrint3DTaskSourceChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{58D36055-0241-555D-AF7B-9F05E5DAA412}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrint3DTask
  // Used Types:  Windows.Graphics.Printing3D.IPrint3DTaskSourceChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Graphics.Printing3D.IPrint3DTask,Windows.Graphics.Printing3D.IPrint3DTaskSourceChangedEventArgs>
  TypedEventHandler_2__Printing3D_IPrint3DTask__Printing3D_IPrint3DTaskSourceChangedEventArgs = interface(TypedEventHandler_2__Printing3D_IPrint3DTask__Printing3D_IPrint3DTaskSourceChangedEventArgs_Delegate_Base)
  ['{4D259B83-5723-5ADA-95F3-152B37270E22}']
    procedure Invoke(sender: Printing3D_IPrint3DTask; args: Printing3D_IPrint3DTaskSourceChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3D3MFPackage
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Graphics.Printing3D.IPrint3DTask,Object>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Graphics.Printing3D.IPrint3DTask,Windows.Graphics.Printing3D.IPrint3DTaskCompletedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Graphics.Printing3D.IPrint3DTask,Windows.Graphics.Printing3D.IPrint3DTaskSourceChangedEventArgs>
  }
  // Windows.Graphics.Printing3D.IPrint3DTask
  [WinRTClassNameAttribute(SPrinting3D_Print3DTask)]
  Printing3D_IPrint3DTask = interface(IInspectable)
  ['{8CE3D080-2118-4C28-80DE-F426D70191AE}']
    function get_Source: Printing3D_IPrinting3D3MFPackage; safecall;
    function add_Submitting(eventHandler: TypedEventHandler_2__Printing3D_IPrint3DTask__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Submitting(eventCookie: EventRegistrationToken); safecall;
    function add_Completed(eventHandler: TypedEventHandler_2__Printing3D_IPrint3DTask__Printing3D_IPrint3DTaskCompletedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Completed(eventCookie: EventRegistrationToken); safecall;
    function add_SourceChanged(eventHandler: TypedEventHandler_2__Printing3D_IPrint3DTask__Printing3D_IPrint3DTaskSourceChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_SourceChanged(eventCookie: EventRegistrationToken); safecall;
    property Source: Printing3D_IPrinting3D3MFPackage read get_Source;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3D3MFPackage
  }
  // Windows.Graphics.Printing3D.IPrint3DTaskSourceRequestedArgs
  [WinRTClassNameAttribute(SPrinting3D_Print3DTaskSourceRequestedArgs)]
  Printing3D_IPrint3DTaskSourceRequestedArgs = interface(IInspectable)
  ['{C77C9ABA-24AF-424D-A3BF-92250C355602}']
    procedure SetSource(source: Printing3D_IPrinting3D3MFPackage); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrint3DTaskSourceRequestedArgs
  }
  // Windows.Graphics.Printing3D.Print3DTaskSourceRequestedHandler
  Printing3D_Print3DTaskSourceRequestedHandler = interface(IUnknown)
  ['{E9175E70-C917-46DE-BB51-D9A94DB3711F}']
    procedure Invoke(args: Printing3D_IPrint3DTaskSourceRequestedArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrint3DTask
  // Used Types:  String
  // Used Types:  Windows.Graphics.Printing3D.Print3DTaskSourceRequestedHandler
  }
  // Windows.Graphics.Printing3D.IPrint3DTaskRequest
  [WinRTClassNameAttribute(SPrinting3D_Print3DTaskRequest)]
  Printing3D_IPrint3DTaskRequest = interface(IInspectable)
  ['{2595C46F-2245-4C5A-8731-0D604DC6BC3C}']
    function CreateTask(title: HSTRING; printerId: HSTRING; handler: Printing3D_Print3DTaskSourceRequestedHandler): Printing3D_IPrint3DTask; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrint3DTaskRequest
  }
  // Windows.Graphics.Printing3D.IPrint3DTaskRequestedEventArgs
  Printing3D_IPrint3DTaskRequestedEventArgs = interface(IInspectable)
  ['{150CB77F-18C5-40D7-9F40-FAB3096E05A9}']
    function get_Request: Printing3D_IPrint3DTaskRequest; safecall;
    property Request: Printing3D_IPrint3DTaskRequest read get_Request;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Graphics.Printing3D.IPrint3DManager,Windows.Graphics.Printing3D.IPrint3DTaskRequestedEventArgs>
  TypedEventHandler_2__Printing3D_IPrint3DManager__Printing3D_IPrint3DTaskRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{77C464A3-A7C6-5512-9859-412DB3F66AC4}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrint3DManager
  // Used Types:  Windows.Graphics.Printing3D.IPrint3DTaskRequestedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Graphics.Printing3D.IPrint3DManager,Windows.Graphics.Printing3D.IPrint3DTaskRequestedEventArgs>
  TypedEventHandler_2__Printing3D_IPrint3DManager__Printing3D_IPrint3DTaskRequestedEventArgs = interface(TypedEventHandler_2__Printing3D_IPrint3DManager__Printing3D_IPrint3DTaskRequestedEventArgs_Delegate_Base)
  ['{1EF166C7-7F2F-513A-B9F6-554C6DFE89AD}']
    procedure Invoke(sender: Printing3D_IPrint3DManager; args: Printing3D_IPrint3DTaskRequestedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Graphics.Printing3D.IPrint3DManager,Windows.Graphics.Printing3D.IPrint3DTaskRequestedEventArgs>
  }
  // Windows.Graphics.Printing3D.IPrint3DManager
  [WinRTClassNameAttribute(SPrinting3D_Print3DManager)]
  Printing3D_IPrint3DManager = interface(IInspectable)
  ['{4D2FCB0A-7366-4971-8BD5-17C4E3E8C6C0}']
    function add_TaskRequested(eventHandler: TypedEventHandler_2__Printing3D_IPrint3DManager__Printing3D_IPrint3DTaskRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_TaskRequested(token: EventRegistrationToken); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Printing3D.IPrint3DManager
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  }
  // Windows.Graphics.Printing3D.IPrint3DManagerStatics
  [WinRTClassNameAttribute(SPrinting3D_Print3DManager)]
  Printing3D_IPrint3DManagerStatics = interface(IInspectable)
  ['{0EF1CAFE-A9AD-4C08-A917-1D1F863EABCB}']
    function GetForCurrentView: Printing3D_IPrint3DManager; safecall;
    function ShowPrintUIAsync: IAsyncOperation_1__Boolean; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Boolean,Double>
  AsyncOperationProgressHandler_2__Boolean__Double_Delegate_Base = interface(IUnknown)
  ['{CADF3784-1200-5633-8280-163849914AB3}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Boolean,Double>
  // Used Types:  Double
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Boolean,Double>
  AsyncOperationProgressHandler_2__Boolean__Double = interface(AsyncOperationProgressHandler_2__Boolean__Double_Delegate_Base)
  ['{CADF3784-1200-5633-8280-163849914AB3}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Boolean__Double; progressInfo: Double); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Boolean,Double>
  AsyncOperationWithProgressCompletedHandler_2__Boolean__Double_Delegate_Base = interface(IUnknown)
  ['{0EC5345B-B37A-5CD5-83D7-9590CDF445B5}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Boolean,Double>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Boolean,Double>
  AsyncOperationWithProgressCompletedHandler_2__Boolean__Double = interface(AsyncOperationWithProgressCompletedHandler_2__Boolean__Double_Delegate_Base)
  ['{0EC5345B-B37A-5CD5-83D7-9590CDF445B5}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Boolean__Double; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Boolean,Double>
  IAsyncOperationWithProgress_2__Boolean__Double_Base = interface(IInspectable)
  ['{AF873C66-2DF0-5A95-AB54-25634DA3FFA9}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Boolean,Double>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Boolean,Double>
  // Used Types:  Boolean
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Boolean,Double>
  IAsyncOperationWithProgress_2__Boolean__Double = interface(IAsyncOperationWithProgress_2__Boolean__Double_Base)
  ['{AF873C66-2DF0-5A95-AB54-25634DA3FFA9}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__Boolean__Double); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__Boolean__Double; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__Boolean__Double); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__Boolean__Double; safecall;
    function GetResults: Boolean; safecall;
    property Progress: AsyncOperationProgressHandler_2__Boolean__Double read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__Boolean__Double read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Printing3D.IPrinting3D3MFPackage>
  AsyncOperationCompletedHandler_1__Printing3D_IPrinting3D3MFPackage_Delegate_Base = interface(IUnknown)
  ['{28B6B208-85A7-53F1-83AE-577A7DE66A9B}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Printing3D.IPrinting3D3MFPackage>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Printing3D.IPrinting3D3MFPackage>
  AsyncOperationCompletedHandler_1__Printing3D_IPrinting3D3MFPackage = interface(AsyncOperationCompletedHandler_1__Printing3D_IPrinting3D3MFPackage_Delegate_Base)
  ['{41D023B3-7055-5679-9BEA-2763B728B8F7}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Printing3D_IPrinting3D3MFPackage; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Printing3D.IPrinting3D3MFPackage>
  IAsyncOperation_1__Printing3D_IPrinting3D3MFPackage_Base = interface(IInspectable)
  ['{6CF2EB38-E068-5558-94B0-0161192C5F19}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Printing3D.IPrinting3D3MFPackage>
  // Used Types:  Windows.Graphics.Printing3D.IPrinting3D3MFPackage
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Printing3D.IPrinting3D3MFPackage>
  IAsyncOperation_1__Printing3D_IPrinting3D3MFPackage = interface(IAsyncOperation_1__Printing3D_IPrinting3D3MFPackage_Base)
  ['{E8A14278-C484-5C8E-BEF1-DC025757B5E4}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Printing3D_IPrinting3D3MFPackage); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Printing3D_IPrinting3D3MFPackage; safecall;
    function GetResults: Printing3D_IPrinting3D3MFPackage; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Printing3D_IPrinting3D3MFPackage read get_Completed write put_Completed;
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
  // Used Types:  Object
  }
  // Windows.Graphics.Display.DisplayPropertiesEventHandler
  Display_DisplayPropertiesEventHandler = interface(IUnknown)
  ['{DBDD8B01-F1A1-46D1-9EE3-543BCC995980}']
    procedure Invoke(sender: IInspectable); safecall;
  end deprecated;

  {
  // Used Types:  Windows.Foundation.IMemoryBufferReference
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Foundation.IMemoryBufferReference,Object>
  TypedEventHandler_2__IMemoryBufferReference__IInspectable = interface(IUnknown)
  ['{F4637D4A-0760-5431-BFC0-24EB1D4F6C4F}']
    procedure Invoke(sender: IMemoryBufferReference; args: IInspectable); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Imaging.ISoftwareBitmap>
  AsyncOperationCompletedHandler_1__Imaging_ISoftwareBitmap_Delegate_Base = interface(IUnknown)
  ['{B699B653-33ED-5E2D-A75F-02BF90E32619}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Imaging.ISoftwareBitmap>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Imaging.ISoftwareBitmap>
  AsyncOperationCompletedHandler_1__Imaging_ISoftwareBitmap = interface(AsyncOperationCompletedHandler_1__Imaging_ISoftwareBitmap_Delegate_Base)
  ['{17C5C9CA-A7E8-5D2D-A505-711CF7942368}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Imaging_ISoftwareBitmap; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Imaging.ISoftwareBitmap>
  IAsyncOperation_1__Imaging_ISoftwareBitmap_Base = interface(IInspectable)
  ['{C4A10980-714B-5501-8DA2-DBDACCE70F73}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Imaging.ISoftwareBitmap>
  // Used Types:  Windows.Graphics.Imaging.ISoftwareBitmap
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Imaging.ISoftwareBitmap>
  IAsyncOperation_1__Imaging_ISoftwareBitmap = interface(IAsyncOperation_1__Imaging_ISoftwareBitmap_Base)
  ['{B15AFB2D-7DE2-5C65-AE8D-4B68B90FE93E}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Imaging_ISoftwareBitmap); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Imaging_ISoftwareBitmap; safecall;
    function GetResults: Imaging_ISoftwareBitmap; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Imaging_ISoftwareBitmap read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Imaging.IBitmapFrame>
  AsyncOperationCompletedHandler_1__Imaging_IBitmapFrame_Delegate_Base = interface(IUnknown)
  ['{2817455A-983F-5A06-9FE4-FB9637684320}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Imaging.IBitmapFrame>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Imaging.IBitmapFrame>
  AsyncOperationCompletedHandler_1__Imaging_IBitmapFrame = interface(AsyncOperationCompletedHandler_1__Imaging_IBitmapFrame_Delegate_Base)
  ['{E0CF2FB8-5D52-5EC7-BBE8-AC19DFAE4A19}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Imaging_IBitmapFrame; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Imaging.IBitmapFrame>
  IAsyncOperation_1__Imaging_IBitmapFrame_Base = interface(IInspectable)
  ['{CB1483D1-1464-5BF9-9346-D537735DFBD6}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Graphics.Imaging.IBitmapFrame>
  // Used Types:  Windows.Graphics.Imaging.IBitmapFrame
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Imaging.IBitmapFrame>
  IAsyncOperation_1__Imaging_IBitmapFrame = interface(IAsyncOperation_1__Imaging_IBitmapFrame_Base)
  ['{B0D3F5E9-5871-58B9-AC1A-B152AD5F1582}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Imaging_IBitmapFrame); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Imaging_IBitmapFrame; safecall;
    function GetResults: Imaging_IBitmapFrame; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Imaging_IBitmapFrame read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Imaging.ISoftwareBitmap
  // Used Types:  Windows.Graphics.Imaging.BitmapPixelFormat
  // Used Types:  Int32
  // Used Types:  Windows.Graphics.Imaging.BitmapAlphaMode
  }
  // Windows.Graphics.Imaging.ISoftwareBitmapFactory
  [WinRTClassNameAttribute(SImaging_SoftwareBitmap)]
  Imaging_ISoftwareBitmapFactory = interface(IInspectable)
  ['{C99FEB69-2D62-4D47-A6B3-4FDB6A07FDF8}']
    function Create(format: Imaging_BitmapPixelFormat; width: Integer; height: Integer): Imaging_ISoftwareBitmap; safecall;
    function CreateWithAlpha(format: Imaging_BitmapPixelFormat; width: Integer; height: Integer; alpha: Imaging_BitmapAlphaMode): Imaging_ISoftwareBitmap; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Imaging.ISoftwareBitmap
  // Used Types:  Windows.Graphics.Imaging.BitmapPixelFormat
  // Used Types:  Windows.Graphics.Imaging.BitmapAlphaMode
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Int32
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Graphics.Imaging.ISoftwareBitmap>
  // Used Types:  Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
  }
  // Windows.Graphics.Imaging.ISoftwareBitmapStatics
  [WinRTClassNameAttribute(SImaging_SoftwareBitmap)]
  Imaging_ISoftwareBitmapStatics = interface(IInspectable)
  ['{DF0385DB-672F-4A9D-806E-C2442F343E86}']
    function Copy(source: Imaging_ISoftwareBitmap): Imaging_ISoftwareBitmap; safecall;
    function Convert(source: Imaging_ISoftwareBitmap; format: Imaging_BitmapPixelFormat): Imaging_ISoftwareBitmap; overload; safecall;
    function Convert(source: Imaging_ISoftwareBitmap; format: Imaging_BitmapPixelFormat; alpha: Imaging_BitmapAlphaMode): Imaging_ISoftwareBitmap; overload; safecall;
    function CreateCopyFromBuffer(source: IBuffer; format: Imaging_BitmapPixelFormat; width: Integer; height: Integer): Imaging_ISoftwareBitmap; overload; safecall;
    function CreateCopyFromBuffer(source: IBuffer; format: Imaging_BitmapPixelFormat; width: Integer; height: Integer; alpha: Imaging_BitmapAlphaMode): Imaging_ISoftwareBitmap; overload; safecall;
    function CreateCopyFromSurfaceAsync(surface: DirectX_Direct3D11_IDirect3DSurface): IAsyncOperation_1__Imaging_ISoftwareBitmap; overload; safecall;
    function CreateCopyFromSurfaceAsync(surface: DirectX_Direct3D11_IDirect3DSurface; alpha: Imaging_BitmapAlphaMode): IAsyncOperation_1__Imaging_ISoftwareBitmap; overload; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Double
  // Used Types:  Boolean
  // Used Types:  UInt16
  // Used Types:  Windows.Graphics.Display.Core.IHdmiDisplayMode
  // Used Types:  Windows.Graphics.Display.Core.HdmiDisplayColorSpace
  // Used Types:  Windows.Graphics.Display.Core.HdmiDisplayPixelEncoding
  }
  // Windows.Graphics.Display.Core.IHdmiDisplayMode
  [WinRTClassNameAttribute(SDisplay_Core_HdmiDisplayMode)]
  Display_Core_IHdmiDisplayMode = interface(IInspectable)
  ['{0C06D5AD-1B90-4F51-9981-EF5A1C0DDF66}']
    function get_ResolutionWidthInRawPixels: Cardinal; safecall;
    function get_ResolutionHeightInRawPixels: Cardinal; safecall;
    function get_RefreshRate: Double; safecall;
    function get_StereoEnabled: Boolean; safecall;
    function get_BitsPerPixel: Word; safecall;
    function IsEqual(mode: Display_Core_IHdmiDisplayMode): Boolean; safecall;
    function get_ColorSpace: Display_Core_HdmiDisplayColorSpace; safecall;
    function get_PixelEncoding: Display_Core_HdmiDisplayPixelEncoding; safecall;
    function get_IsSdrLuminanceSupported: Boolean; safecall;
    function get_IsSmpte2084Supported: Boolean; safecall;
    function get_Is2086MetadataSupported: Boolean; safecall;
    property BitsPerPixel: Word read get_BitsPerPixel;
    property ColorSpace: Display_Core_HdmiDisplayColorSpace read get_ColorSpace;
    property Is2086MetadataSupported: Boolean read get_Is2086MetadataSupported;
    property IsSdrLuminanceSupported: Boolean read get_IsSdrLuminanceSupported;
    property IsSmpte2084Supported: Boolean read get_IsSmpte2084Supported;
    property PixelEncoding: Display_Core_HdmiDisplayPixelEncoding read get_PixelEncoding;
    property RefreshRate: Double read get_RefreshRate;
    property ResolutionHeightInRawPixels: Cardinal read get_ResolutionHeightInRawPixels;
    property ResolutionWidthInRawPixels: Cardinal read get_ResolutionWidthInRawPixels;
    property StereoEnabled: Boolean read get_StereoEnabled;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Display.Core.IHdmiDisplayMode>
  IIterator_1__Display_Core_IHdmiDisplayMode_Base = interface(IInspectable)
  ['{D66EB831-E22C-5EE3-AF45-E1C03DE4BC62}']
  end;
  {
  // Used Types:  Windows.Graphics.Display.Core.IHdmiDisplayMode
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Display.Core.IHdmiDisplayMode>
  IIterator_1__Display_Core_IHdmiDisplayMode = interface(IIterator_1__Display_Core_IHdmiDisplayMode_Base)
  ['{81D1A91F-6D91-5821-AD41-F6B8300AAA20}']
    function get_Current: Display_Core_IHdmiDisplayMode; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PDisplay_Core_IHdmiDisplayMode): Cardinal; safecall;
    property Current: Display_Core_IHdmiDisplayMode read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Display.Core.IHdmiDisplayMode>
  IIterable_1__Display_Core_IHdmiDisplayMode_Base = interface(IInspectable)
  ['{497E3D51-0EA1-5BE0-8DBA-8F7F4CE4FB33}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Display.Core.IHdmiDisplayMode>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Display.Core.IHdmiDisplayMode>
  IIterable_1__Display_Core_IHdmiDisplayMode = interface(IIterable_1__Display_Core_IHdmiDisplayMode_Base)
  ['{70B05995-63D6-5764-A988-AEFB469490C7}']
    function First: IIterator_1__Display_Core_IHdmiDisplayMode; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Display.Core.IHdmiDisplayMode
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Display.Core.IHdmiDisplayMode>
  IVectorView_1__Display_Core_IHdmiDisplayMode = interface(IInspectable)
  ['{8F92D8FD-DC7B-5855-8A94-438C76A3F54B}']
    function GetAt(index: Cardinal): Display_Core_IHdmiDisplayMode; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Display_Core_IHdmiDisplayMode; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDisplay_Core_IHdmiDisplayMode): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Graphics.Display.Core.IHdmiDisplayInformation,Object>
  TypedEventHandler_2__Display_Core_IHdmiDisplayInformation__IInspectable_Delegate_Base = interface(IUnknown)
  ['{D109932B-9CE1-5CDD-94C7-93C60C833AA3}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Display.Core.IHdmiDisplayInformation
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Graphics.Display.Core.IHdmiDisplayInformation,Object>
  TypedEventHandler_2__Display_Core_IHdmiDisplayInformation__IInspectable = interface(TypedEventHandler_2__Display_Core_IHdmiDisplayInformation__IInspectable_Delegate_Base)
  ['{5AD20A88-C02A-5D55-BAE6-FF9F947EF6F1}']
    procedure Invoke(sender: Display_Core_IHdmiDisplayInformation; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Display.Core.IHdmiDisplayMode>
  // Used Types:  Windows.Graphics.Display.Core.IHdmiDisplayMode
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  // Used Types:  Windows.Graphics.Display.Core.HdmiDisplayHdrOption
  // Used Types:  Windows.Graphics.Display.Core.HdmiDisplayHdr2086Metadata
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Graphics.Display.Core.IHdmiDisplayInformation,Object>
  }
  // Windows.Graphics.Display.Core.IHdmiDisplayInformation
  [WinRTClassNameAttribute(SDisplay_Core_HdmiDisplayInformation)]
  Display_Core_IHdmiDisplayInformation = interface(IInspectable)
  ['{130B3C0A-F565-476E-ABD5-EA05AEE74C69}']
    function GetSupportedDisplayModes: IVectorView_1__Display_Core_IHdmiDisplayMode; safecall;
    function GetCurrentDisplayMode: Display_Core_IHdmiDisplayMode; safecall;
    function SetDefaultDisplayModeAsync: IAsyncAction; safecall;
    function RequestSetCurrentDisplayModeAsync(mode: Display_Core_IHdmiDisplayMode): IAsyncOperation_1__Boolean; overload; safecall;
    function RequestSetCurrentDisplayModeAsync(mode: Display_Core_IHdmiDisplayMode; hdrOption: Display_Core_HdmiDisplayHdrOption): IAsyncOperation_1__Boolean; overload; safecall;
    function RequestSetCurrentDisplayModeAsync(mode: Display_Core_IHdmiDisplayMode; hdrOption: Display_Core_HdmiDisplayHdrOption; hdrMetadata: Display_Core_HdmiDisplayHdr2086Metadata): IAsyncOperation_1__Boolean; overload; safecall;
    function add_DisplayModesChanged(value: TypedEventHandler_2__Display_Core_IHdmiDisplayInformation__IInspectable): EventRegistrationToken; safecall;
    procedure remove_DisplayModesChanged(token: EventRegistrationToken); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Display.Core.IHdmiDisplayInformation
  }
  // Windows.Graphics.Display.Core.IHdmiDisplayInformationStatics
  [WinRTClassNameAttribute(SDisplay_Core_HdmiDisplayInformation)]
  Display_Core_IHdmiDisplayInformationStatics = interface(IInspectable)
  ['{6CE6B260-F42A-4A15-914C-7B8E2A5A65DF}']
    function GetForCurrentView: Display_Core_IHdmiDisplayInformation; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.Graphics.Effects.IGraphicsEffectSource
  Effects_IGraphicsEffectSource = interface(IInspectable)
  ['{2D8F9DDC-4339-4EB9-9216-F9DEB75658A2}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Graphics.Effects.IGraphicsEffect
  Effects_IGraphicsEffect = interface(IInspectable)
  ['{CB51C0CE-8FE6-4636-B202-861FAA07D8F3}']
    function get_Name: HSTRING; safecall;
    procedure put_Name(name: HSTRING); safecall;
    property Name: HSTRING read get_Name write put_Name;
  end;

  {
  // Used Types:  UInt32
  }
  // Windows.Graphics.Printing.OptionDetails.IPrintTextOptionDetails
  Printing_OptionDetails_IPrintTextOptionDetails = interface(IInspectable)
  ['{AD75E563-5CE4-46BC-9918-AB9FAD144C5B}']
    function get_MaxCharacters: Cardinal; safecall;
    property MaxCharacters: Cardinal read get_MaxCharacters;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Object>
  IIterator_1__IInspectable_Base = interface(IInspectable)
  ['{44A94F2D-04F8-5091-B336-BE7892DD10BE}']
  end;
  {
  // Used Types:  Object
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Object>
  IIterator_1__IInspectable = interface(IIterator_1__IInspectable_Base)
  ['{44A94F2D-04F8-5091-B336-BE7892DD10BE}']
    function get_Current: IInspectable; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIInspectable): Cardinal; safecall;
    property Current: IInspectable read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Object>
  IIterable_1__IInspectable_Base = interface(IInspectable)
  ['{092B849B-60B1-52BE-A44A-6FE8E933CBE4}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Object>
  }
  // Windows.Foundation.Collections.IIterable`1<Object>
  IIterable_1__IInspectable = interface(IIterable_1__IInspectable_Base)
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
  // Used Types:  Windows.ApplicationModel.Activation.ISplashScreen
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.Activation.ISplashScreen,Object>
  TypedEventHandler_2__Activation_ISplashScreen__IInspectable = interface(IUnknown)
  ['{359B8887-2FA6-5405-A4AF-642C9FDACC93}']
    procedure Invoke(sender: Activation_ISplashScreen; args: IInspectable); safecall;
  end;

  {
  }
  // Windows.Graphics.DirectX.Direct3D11.IDirect3DDevice
  DirectX_Direct3D11_IDirect3DDevice = interface(IInspectable)
  ['{A37624AB-8D5F-4650-9D3E-9EAE3D9BC670}']
    procedure Trim; safecall;
  end;

  {
  // Used Types:  Windows.Graphics.Holographic.HolographicStereoTransform
  }
  // Windows.Foundation.IReference`1<Windows.Graphics.Holographic.HolographicStereoTransform>
  IReference_1__Holographic_HolographicStereoTransform = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: Holographic_HolographicStereoTransform; safecall;
    property Value: Holographic_HolographicStereoTransform read get_Value;
  end;

  {
  // Used Types:  Object
  }
  // Windows.Foundation.EventHandler`1<Object>
  EventHandler_1__IInspectable = interface(IUnknown)
  ['{C50898F6-C536-5F47-8583-8B2C2438A13B}']
    procedure Invoke(sender: IInspectable; args: IInspectable); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Imaging.BitmapPixelFormat>
  IIterator_1__Imaging_BitmapPixelFormat_Base = interface(IInspectable)
  ['{7FC2E293-1084-5D45-B8B8-93E10692BCC8}']
  end;
  {
  // Used Types:  Windows.Graphics.Imaging.BitmapPixelFormat
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Imaging.BitmapPixelFormat>
  IIterator_1__Imaging_BitmapPixelFormat = interface(IIterator_1__Imaging_BitmapPixelFormat_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: Imaging_BitmapPixelFormat; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PImaging_BitmapPixelFormat): Cardinal; safecall;
    property Current: Imaging_BitmapPixelFormat read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Imaging.BitmapPixelFormat>
  IIterable_1__Imaging_BitmapPixelFormat_Base = interface(IInspectable)
  ['{E924D9ED-A13E-5BDB-9ED8-65A1474DC274}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Imaging.BitmapPixelFormat>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Imaging.BitmapPixelFormat>
  IIterable_1__Imaging_BitmapPixelFormat = interface(IIterable_1__Imaging_BitmapPixelFormat_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__Imaging_BitmapPixelFormat; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Imaging.BitmapPixelFormat
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Imaging.BitmapPixelFormat>
  IVectorView_1__Imaging_BitmapPixelFormat = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): Imaging_BitmapPixelFormat; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Imaging_BitmapPixelFormat; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PImaging_BitmapPixelFormat): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Imaging.ISoftwareBitmap>
  IIterator_1__Imaging_ISoftwareBitmap_Base = interface(IInspectable)
  ['{CD12E4C3-8CA8-5BE6-B64B-204A014FC620}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Imaging.ISoftwareBitmap
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Imaging.ISoftwareBitmap>
  IIterator_1__Imaging_ISoftwareBitmap = interface(IIterator_1__Imaging_ISoftwareBitmap_Base)
  ['{5D992AEB-ADA2-5B25-8E47-CB5A9DCCCA27}']
    function get_Current: Imaging_ISoftwareBitmap; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PImaging_ISoftwareBitmap): Cardinal; safecall;
    property Current: Imaging_ISoftwareBitmap read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Imaging.ISoftwareBitmap>
  IIterable_1__Imaging_ISoftwareBitmap_Base = interface(IInspectable)
  ['{22D3A30F-0898-5E94-99A3-AFA5951DFCD4}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Graphics.Imaging.ISoftwareBitmap>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Imaging.ISoftwareBitmap>
  IIterable_1__Imaging_ISoftwareBitmap = interface(IIterable_1__Imaging_ISoftwareBitmap_Base)
  ['{54E17562-ACE7-5210-B02C-C6A6679A0806}']
    function First: IIterator_1__Imaging_ISoftwareBitmap; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface>
  IIterator_1__DirectX_Direct3D11_IDirect3DSurface_Base = interface(IInspectable)
  ['{BDFB6D0B-E785-5D5A-ABD2-FE1B18C43257}']
  end;
  {
  // Used Types:  Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface>
  IIterator_1__DirectX_Direct3D11_IDirect3DSurface = interface(IIterator_1__DirectX_Direct3D11_IDirect3DSurface_Base)
  ['{BDFB6D0B-E785-5D5A-ABD2-FE1B18C43257}']
    function get_Current: DirectX_Direct3D11_IDirect3DSurface; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PDirectX_Direct3D11_IDirect3DSurface): Cardinal; safecall;
    property Current: DirectX_Direct3D11_IDirect3DSurface read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface>
  IIterable_1__DirectX_Direct3D11_IDirect3DSurface_Base = interface(IInspectable)
  ['{CC63BF9C-E16A-5A75-A5AA-2B53F975B0B0}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface>
  IIterable_1__DirectX_Direct3D11_IDirect3DSurface = interface(IIterable_1__DirectX_Direct3D11_IDirect3DSurface_Base)
  ['{CC63BF9C-E16A-5A75-A5AA-2B53F975B0B0}']
    function First: IIterator_1__DirectX_Direct3D11_IDirect3DSurface; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface>
  IVectorView_1__DirectX_Direct3D11_IDirect3DSurface = interface(IInspectable)
  ['{1A81EC3E-5AFB-5E10-92BB-C843FEC70887}']
    function GetAt(index: Cardinal): DirectX_Direct3D11_IDirect3DSurface; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: DirectX_Direct3D11_IDirect3DSurface; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDirectX_Direct3D11_IDirect3DSurface): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.DirectX.DirectXPixelFormat>
  IIterator_1__DirectX_DirectXPixelFormat_Base = interface(IInspectable)
  ['{EA016190-AC80-5840-8F58-FF434C7B2907}']
  end;
  {
  // Used Types:  Windows.Graphics.DirectX.DirectXPixelFormat
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Graphics.DirectX.DirectXPixelFormat>
  IIterator_1__DirectX_DirectXPixelFormat = interface(IIterator_1__DirectX_DirectXPixelFormat_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: DirectX_DirectXPixelFormat; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PDirectX_DirectXPixelFormat): Cardinal; safecall;
    property Current: DirectX_DirectXPixelFormat read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.DirectX.DirectXPixelFormat>
  IIterable_1__DirectX_DirectXPixelFormat_Base = interface(IInspectable)
  ['{3908F2C6-1AEE-5129-B9A6-2A6E01D9507E}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Graphics.DirectX.DirectXPixelFormat>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Graphics.DirectX.DirectXPixelFormat>
  IIterable_1__DirectX_DirectXPixelFormat = interface(IIterable_1__DirectX_DirectXPixelFormat_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__DirectX_DirectXPixelFormat; safecall;
  end;

  {
  // Used Types:  Windows.Graphics.DirectX.DirectXPixelFormat
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.DirectX.DirectXPixelFormat>
  IVectorView_1__DirectX_DirectXPixelFormat = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): DirectX_DirectXPixelFormat; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: DirectX_DirectXPixelFormat; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDirectX_DirectXPixelFormat): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;


  // Emit Forwarded classes
  // Windows.Graphics.Printing3D.Print3DTaskCompletedEventArgs
  // DualAPI
  // Implements: Windows.Graphics.Printing3D.IPrint3DTaskCompletedEventArgs

  // Windows.Graphics.Printing3D.Print3DTaskSourceChangedEventArgs
  // DualAPI
  // Implements: Windows.Graphics.Printing3D.IPrint3DTaskSourceChangedEventArgs

  // Windows.Graphics.Printing3D.Print3DTask
  // DualAPI
  // Implements: Windows.Graphics.Printing3D.IPrint3DTask

  // Windows.Graphics.Printing3D.Print3DTaskSourceRequestedArgs
  // DualAPI
  // Implements: Windows.Graphics.Printing3D.IPrint3DTaskSourceRequestedArgs

  // Windows.Graphics.Printing3D.Print3DTaskRequest
  // DualAPI
  // Implements: Windows.Graphics.Printing3D.IPrint3DTaskRequest

  // Windows.Graphics.Printing3D.Print3DManager
  // DualAPI
  // Implements: Windows.Graphics.Printing3D.IPrint3DManager
  // Statics: "Windows.Graphics.Printing3D.IPrint3DManagerStatics"
  TPrinting3D_Print3DManager = class(TWinRTGenericImportS<Printing3D_IPrint3DManagerStatics>)
  public
    // -> Printing3D_IPrint3DManagerStatics
    class function GetForCurrentView: Printing3D_IPrint3DManager; static; inline;
    class function ShowPrintUIAsync: IAsyncOperation_1__Boolean; static; inline;
  end;

  // Windows.Graphics.Imaging.BitmapBuffer
  // DualAPI
  // Implements: Windows.Graphics.Imaging.IBitmapBuffer
  // Implements: Windows.Foundation.IMemoryBuffer
  // Implements: Windows.Foundation.IClosable

  // Windows.Graphics.Imaging.SoftwareBitmap
  // DualAPI
  // Implements: Windows.Graphics.Imaging.ISoftwareBitmap
  // Implements: Windows.Foundation.IClosable
  // Statics: "Windows.Graphics.Imaging.ISoftwareBitmapStatics"
  // Factory: "Windows.Graphics.Imaging.ISoftwareBitmapFactory"
  TImaging_SoftwareBitmap = class(TWinRTGenericImportFS<Imaging_ISoftwareBitmapFactory, Imaging_ISoftwareBitmapStatics>)
  public
    // -> Imaging_ISoftwareBitmapStatics
    class function Copy(source: Imaging_ISoftwareBitmap): Imaging_ISoftwareBitmap; static; inline;
    class function Convert(source: Imaging_ISoftwareBitmap; format: Imaging_BitmapPixelFormat): Imaging_ISoftwareBitmap; overload; static; inline;
    class function Convert(source: Imaging_ISoftwareBitmap; format: Imaging_BitmapPixelFormat; alpha: Imaging_BitmapAlphaMode): Imaging_ISoftwareBitmap; overload; static; inline;
    class function CreateCopyFromBuffer(source: IBuffer; format: Imaging_BitmapPixelFormat; width: Integer; height: Integer): Imaging_ISoftwareBitmap; overload; static; inline;
    class function CreateCopyFromBuffer(source: IBuffer; format: Imaging_BitmapPixelFormat; width: Integer; height: Integer; alpha: Imaging_BitmapAlphaMode): Imaging_ISoftwareBitmap; overload; static; inline;
    class function CreateCopyFromSurfaceAsync(surface: DirectX_Direct3D11_IDirect3DSurface): IAsyncOperation_1__Imaging_ISoftwareBitmap; overload; static; inline;
    class function CreateCopyFromSurfaceAsync(surface: DirectX_Direct3D11_IDirect3DSurface; alpha: Imaging_BitmapAlphaMode): IAsyncOperation_1__Imaging_ISoftwareBitmap; overload; static; inline;

    // -> Imaging_ISoftwareBitmapFactory
    class function Create(format: Imaging_BitmapPixelFormat; width: Integer; height: Integer): Imaging_ISoftwareBitmap; static; inline;
    class function CreateWithAlpha(format: Imaging_BitmapPixelFormat; width: Integer; height: Integer; alpha: Imaging_BitmapAlphaMode): Imaging_ISoftwareBitmap; static; inline;
  end;

  // Windows.Graphics.Display.Core.HdmiDisplayMode
  // DualAPI
  // Implements: Windows.Graphics.Display.Core.IHdmiDisplayMode

  // Windows.Graphics.Display.Core.HdmiDisplayInformation
  // DualAPI
  // Implements: Windows.Graphics.Display.Core.IHdmiDisplayInformation
  // Statics: "Windows.Graphics.Display.Core.IHdmiDisplayInformationStatics"
  TDisplay_Core_HdmiDisplayInformation = class(TWinRTGenericImportS<Display_Core_IHdmiDisplayInformationStatics>)
  public
    // -> Display_Core_IHdmiDisplayInformationStatics
    class function GetForCurrentView: Display_Core_IHdmiDisplayInformation; static; inline;
  end;


implementation

  // Emit Classes Implementation
 { TPrinting3D_Print3DManager }

class function TPrinting3D_Print3DManager.GetForCurrentView: Printing3D_IPrint3DManager;
begin
  Result := Statics.GetForCurrentView;
end;

class function TPrinting3D_Print3DManager.ShowPrintUIAsync: IAsyncOperation_1__Boolean;
begin
  Result := Statics.ShowPrintUIAsync;
end;


 { TImaging_SoftwareBitmap }

class function TImaging_SoftwareBitmap.Copy(source: Imaging_ISoftwareBitmap): Imaging_ISoftwareBitmap;
begin
  Result := Statics.Copy(source);
end;

class function TImaging_SoftwareBitmap.Convert(source: Imaging_ISoftwareBitmap; format: Imaging_BitmapPixelFormat): Imaging_ISoftwareBitmap;
begin
  Result := Statics.Convert(source, format);
end;

class function TImaging_SoftwareBitmap.Convert(source: Imaging_ISoftwareBitmap; format: Imaging_BitmapPixelFormat; alpha: Imaging_BitmapAlphaMode): Imaging_ISoftwareBitmap;
begin
  Result := Statics.Convert(source, format, alpha);
end;

class function TImaging_SoftwareBitmap.CreateCopyFromBuffer(source: IBuffer; format: Imaging_BitmapPixelFormat; width: Integer; height: Integer): Imaging_ISoftwareBitmap;
begin
  Result := Statics.CreateCopyFromBuffer(source, format, width, height);
end;

class function TImaging_SoftwareBitmap.CreateCopyFromBuffer(source: IBuffer; format: Imaging_BitmapPixelFormat; width: Integer; height: Integer; alpha: Imaging_BitmapAlphaMode): Imaging_ISoftwareBitmap;
begin
  Result := Statics.CreateCopyFromBuffer(source, format, width, height, alpha);
end;

class function TImaging_SoftwareBitmap.CreateCopyFromSurfaceAsync(surface: DirectX_Direct3D11_IDirect3DSurface): IAsyncOperation_1__Imaging_ISoftwareBitmap;
begin
  Result := Statics.CreateCopyFromSurfaceAsync(surface);
end;

class function TImaging_SoftwareBitmap.CreateCopyFromSurfaceAsync(surface: DirectX_Direct3D11_IDirect3DSurface; alpha: Imaging_BitmapAlphaMode): IAsyncOperation_1__Imaging_ISoftwareBitmap;
begin
  Result := Statics.CreateCopyFromSurfaceAsync(surface, alpha);
end;

// Factories for : "Imaging_SoftwareBitmap"
// Factory: "Windows.Graphics.Imaging.ISoftwareBitmapFactory"
// -> Imaging_ISoftwareBitmapFactory

class function TImaging_SoftwareBitmap.Create(format: Imaging_BitmapPixelFormat; width: Integer; height: Integer): Imaging_ISoftwareBitmap;
begin
  Result := Factory.Create(format, width, height);
end;

class function TImaging_SoftwareBitmap.CreateWithAlpha(format: Imaging_BitmapPixelFormat; width: Integer; height: Integer; alpha: Imaging_BitmapAlphaMode): Imaging_ISoftwareBitmap;
begin
  Result := Factory.CreateWithAlpha(format, width, height, alpha);
end;


 { TDisplay_Core_HdmiDisplayInformation }

class function TDisplay_Core_HdmiDisplayInformation.GetForCurrentView: Display_Core_IHdmiDisplayInformation;
begin
  Result := Statics.GetForCurrentView;
end;



end.
