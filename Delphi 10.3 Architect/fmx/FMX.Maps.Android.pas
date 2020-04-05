{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Maps.Android;

interface

{$SCOPEDENUMS ON}

procedure RegisterMapService;

implementation

uses
  System.Types, System.SysUtils, System.Generics.Collections, System.Classes, System.SyncObjs, System.Messaging,
  Androidapi.JNI.Widget, Androidapi.JNIBridge, Androidapi.JNI.App, Androidapi.JNI.PlayServices,
  Androidapi.JNI.Embarcadero, Androidapi.Helpers, Androidapi.Jni.Os,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes, // for debug only
  FMX.Types, FMX.Platform, FMX.Maps, FMX.Helpers.Android, FMX.Forms, FMX.Graphics, FMX.Surfaces,
  FMX.Platform.Android, FMX.Consts, FMX.Dialogs, FMX.DialogService, FMX.ZOrder.Android;

type

  {$REGION 'New map header from the Google Play Services'}
  JMapViewWithGestures = interface;
  JMapView = interface;

  JOnMapReadyCallbackClass = interface(IJavaClass)
    ['{B19B1560-053F-438D-BA83-9CCC414D09D6}']
  end;

  [JavaSignature('com/google/android/gms/maps/OnMapReadyCallback')]
  JOnMapReadyCallback = interface(IJavaInstance)
    ['{C5394813-868D-43FA-8778-71F37DFA699F}']
    procedure onMapReady(googleMap: JGoogleMap); cdecl;
  end;
  TJOnMapReadyCallback = class(TJavaGenericImport<JOnMapReadyCallbackClass, JOnMapReadyCallback>) end;

  JMapViewClass = interface(JFrameLayoutClass)
    ['{1EE5FDF1-67E7-4FC9-AA41-D5B05E629B84}']
    {class} function init(context: JContext): JMapView; cdecl; overload;
    {class} function init(context: JContext; googleMapOptions: JGoogleMapOptions): JMapView; cdecl; overload;
  end;

  [JavaSignature('com/google/android/gms/maps/MapView')]
  JMapView = interface(JFrameLayout)
    ['{FDC9DF68-5392-450C-A85C-E33754D8BFAD}']
    procedure getMapAsync(onMapReadyCallback: JOnMapReadyCallback); cdecl;
    procedure onCreate(bundle: JBundle); cdecl;
    procedure onDestroy; cdecl;
    procedure onEnterAmbient(bundle: JBundle); cdecl;
    procedure onExitAmbient; cdecl;
    procedure onLowMemory; cdecl;
    procedure onPause; cdecl;
    procedure onResume; cdecl;
    procedure onSaveInstanceState(bundle: JBundle); cdecl;
    procedure onStart; cdecl;
    procedure onStop; cdecl;
  end;
  TJMapView = class(TJavaGenericImport<JMapViewClass, JMapView>) end;

  JMapViewWithGesturesClass = interface(JMapViewClass)
    ['{1C7E8661-598A-495E-B93F-F7F8ABFDE659}']
    {class} function init(context: JContext; options: JGoogleMapOptions): JMapViewWithGestures; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/maps/MapViewWithGestures')]
  JMapViewWithGestures = interface(JMapView)
    ['{619B12B4-6B8D-4FF0-B1E6-89E864F0C073}']
    function dispatchTouchEvent(ev: JMotionEvent): Boolean; cdecl;
    function getGestureDetector: JGestureDetector; cdecl;
  end;
  TJMapViewWithGestures = class(TJavaGenericImport<JMapViewWithGesturesClass, JMapViewWithGestures>) end;
  {$ENDREGION}

  TAndroidMapView = class;

  TAndroidMapService = class(TInterfacedObject, IFMXMapService)
  private
    FMapViews: TList<TAndroidMapView>;
    procedure FormActivateHandler(const Sender: TObject; const M: TMessage);
  public
    constructor Create; overload;
    destructor Destroy; override;
    function CreateMapView: ICustomMapView;
    procedure DestroyMapView(const MapView: ICustomMapView);
    procedure RealignMapViews;
  end;

  TMapEventKind = (CameraChanged, MarkerClick, MarkerDragStart, MarkerDrag, MarkerDragEnd, MapClick, MapLongClick,
    MapDoubleClick);

  TMapEvent = record
    Marker: JMarker;
    LatLng: TMapCoordinate;
    Kind: TMapEventKind;

    class function Create(Marker: JMarker; Kind: TMapEventKind): TMapEvent; overload; static;
    class function Create(Kind: TMapEventKind): TMapEvent; overload; static;
    class function Create(Kind: TMapEventKind; const LatLng: TMapCoordinate): TMapEvent; overload; static;
  end;

  TAndroidMapMarker = class(TMapMarker)
  private
    FJavaMarker: JMarker;
    [Weak] FMapView: TAndroidMapView;
  public
    constructor Create(const Descriptor: TMapMarkerDescriptor); override;
    destructor Destroy; override;
    procedure SetJMarker(Marker: JMarker);
    procedure SetHostView(MapView: TAndroidMapView);
    procedure Remove; override;
    procedure SetVisible(const Value: Boolean); override;
    function ToString: string; override;
  end;

  TAndroidMapCircle = class(TMapCircle)
  private
    FJavaCircle: JCircle;
    [Weak] FMapView: TAndroidMapView;
  public
    destructor Destroy; override;
    procedure SetJCircle(Circle: JCircle);
    procedure SetHostView(MapView: TAndroidMapView);
    procedure Remove; override;
    procedure SetVisible(const Value: Boolean); override;
    function ToString: string; override;
  end;

  TAndroidMapPolygon = class(TMapPolygon)
  private
    FJavaPolygon: JPolygon;
    [Weak] FMapView: TAndroidMapView;
  public
    destructor Destroy; override;
    procedure SetJPolygon(Polygon: JPolygon);
    procedure SetHostView(MapView: TAndroidMapView);
    procedure Remove; override;
    procedure SetVisible(const Value: Boolean); override;
    function ToString: string; override;
  end;

  TAndroidMapPolyline = class(TMapPolyline)
  private
    FJavaPolyline: JPolyline;
    [Weak] FMapView: TAndroidMapView;
  public
    destructor Destroy; override;
    procedure SetJPolyline(Polyline: JPolyline);
    procedure SetHostView(MapView: TAndroidMapView);
    procedure Remove; override;
    procedure SetVisible(const Value: Boolean); override;
    function ToString: string; override;
  end;

  TCameraCallback = class;
  TMarkerClickListener = class;
  TMarkerDragListener = class;
  TMapClickListener = class;
  TMapLongClickListener = class;
  TSnapshotReadyCallback = class;
  TMapLoadedCallback = class;
  TMapReadyCallback = class;

  TAndroidMapView = class(TMapViewBase, ICustomMapView)
  private type
    TServicesStatus = (Unchecked, Clear, Error);
  private
    [Weak] FHostControl: TCustomMapView;
    FMapView: JMapViewWithGestures;
    FGoogleMap: JGoogleMap;
    FMapViewContainer: JViewGroup;
    FChildrenContainer: JViewGroup;
    FJBundle: JBundle;

    { Camera }
    FCameraPosition: JCameraPosition;
    FTilt: Single;
    FBearing: Single;
    FZoom: Single;
    FLocation: TMapCoordinate;
    FUpdateOptions: TMapOptionSets;

    { Markers and shapes }
    FMapObjects: TDictionary<string, TMapObjectBase>;
    FUninitialized: TList<TMapObjectBase>;
    FSelectedMarker: TMapMarker;

    FViewShown: Boolean;
    FViewShowing: Boolean;
    FCameraChangeListener: JCameraChangeListener;
    FCameraCallback: TCameraCallback;
    FMarkerClickListener: TMarkerClickListener;
    FMarkerDragListener: TMarkerDragListener;
    FClickListener: TMapClickListener;
    FLongClickListener: TMapLongClickListener;
    FSnapshotReadyCallback: TSnapshotReadyCallback;
    FMapLoadedCallback: TMapLoadedCallback;
    FDoubleTapListener: JGestureDetector_OnDoubleTapListener;
    FMapReadyCallback: TMapReadyCallback;

    function BuildGoogleMapOptions: JGoogleMapOptions;
    function BuildMarkerOptions(const D: TMapMarkerDescriptor): JMarkerOptions;
    function BuildCircleOptions(const D: TMapCircleDescriptor): JCircleOptions;
    function BuildPolygonOptions(const D: TMapPolygonDescriptor): JPolygonOptions;
    function BuildPolylineOptions(const D: TMapPolylineDescriptor): JPolylineOptions;
    function InvokeOnMap(const MapView: JMapViewWithGestures; const Proc: TProc<JGoogleMap>): Boolean; overload;
    function InvokeOnMap(const Proc: TProc<JGoogleMap>): Boolean; overload;
    function ApplyToMap<TResult>(const Func: TFunc<JGoogleMap,TResult>): TResult;
    function InvokeOnUISettings(const Proc: TProc<JUiSettings>): Boolean;
    function SetLayers: Boolean;
    function SetControls: Boolean;
    function SetGestures: Boolean;
    function GetZOrderManager: TAndroidZOrderManager;
  class var
    FPlayServicesStatus: TServicesStatus;
    class function CheckGooglePlayServices: Boolean;
  protected
    function BuildCameraPosition: JCameraPosition;
    function GetGoogleMapType: Integer;
    procedure InitMapView;
    procedure InitGoogleMap;
    procedure InitGestureDetector;
    procedure UpdateNativeBounds;
    property Bundle: JBundle read FJBundle;
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
  public
    constructor Create;
    class constructor Create;
    destructor Destroy; override;
    procedure SetHostControl(const Host: TCustomMapView);
    procedure UpdateContentFromControl;

    procedure DestroyView;
    procedure Hide;
    procedure Show;

    procedure AnimateToCameraPosition;
    procedure SyncCameraPosition;

    procedure SetLocation(const ACoordinate: TMapCoordinate);
    function GetLocation: TMapCoordinate;

    procedure SetZoom(const Zoom: Single);
    function GetZoom: Single;
    procedure SetBearing(const Bearing: Single);
    function GetBearing: Single;
    procedure SetTilt(const Tilt: Single);
    function GetTilt: Single;

    procedure SetMapType(const AValue: TMapType);
    procedure OptionsChanged(const OptionSets: TMapOptionSets); override;
    function AddMarker(const Descriptor: TMapMarkerDescriptor): TMapMarker; override;
    function AddCircle(const Descriptor: TMapCircleDescriptor): TMapCircle; override;
    function AddPolygon(const Descriptor: TMapPolygonDescriptor): TMapPolygon; override;
    function AddPolyline(const Descriptor: TMapPolylineDescriptor): TMapPolyline; override;

    function CaptureBitmap: TBitmap; override;
    procedure Snapshot(const Recipient: TMapScreenshotRecipient); override;
    procedure DispatchMapEvent(const MapEvent: TMapEvent);

    function GetMapObject<T:TMapObjectBase>(const Key: string): T;
    procedure PutMapObject<T:TMapObjectBase>(const Key: string; const MapObject: T);
    procedure RemoveMapObject(const Key: string);

    procedure StashUninitializedMapObject(const MapObject: TMapObjectBase);
    procedure ClearUninitializedMapObjects;

    procedure InitializeMapObjects;
    procedure AnimateCameraToPosition;
    procedure GetCameraPosition;
    function AddJMarker(const D: TMapMarkerDescriptor): JMarker;
    function AddJCircle(const D: TMapCircleDescriptor): JCircle;
    function AddJPolygon(const D: TMapPolygonDescriptor): JPolygon;
    function AddJPolyline(const D: TMapPolylineDescriptor): JPolyline;
    property ZOrderManager: TAndroidZOrderManager read GetZOrderManager;
  end;

  TCameraCallback = class(TJavaLocal, JCameraChangeListener_Callback)
  private
    [Weak] FMapView: TAndroidMapView;
  public
    constructor Create(MapView: TAndroidMapView);
    procedure onCameraChange(listener: JCameraChangeListener); cdecl;
  end;

  TMarkerClickListener = class(TJavaLocal, JGoogleMap_OnMarkerClickListener)
  private
    [Weak] FMapView: TAndroidMapView;
  public
    constructor Create(MapView: TAndroidMapView);
    function onMarkerClick(P1: JMarker): Boolean; cdecl;
  end;

  TMarkerDragListener = class(TJavaLocal, JGoogleMap_OnMarkerDragListener)
  private
    [Weak] FMapView: TAndroidMapView;
  public
    constructor Create(MapView: TAndroidMapView);
    procedure onMarkerDrag(P1: JMarker); cdecl;
    procedure onMarkerDragEnd(P1: JMarker); cdecl;
    procedure onMarkerDragStart(P1: JMarker); cdecl;
  end;

  TMapClickListener = class(TJavaLocal, JGoogleMap_OnMapClickListener)
  private
    [Weak] FMapView: TAndroidMapView;
  public
    constructor Create(MapView: TAndroidMapView);
    procedure onMapClick(P1: JLatLng); cdecl;
  end;

  TMapLongClickListener = class(TJavaLocal, JGoogleMap_OnMapLongClickListener)
  private
    [Weak] FMapView: TAndroidMapView;
  public
    constructor Create(MapView: TAndroidMapView);
    procedure onMapLongClick(P1: JLatLng); cdecl;
  end;

  TDoubleTapListener = class(TJavaLocal, JGestureDetector_OnDoubleTapListener)
  private
    [Weak] FMapView: TAndroidMapView;
  public
    constructor Create(const MapView: TAndroidMapView);
    function onDoubleTap(e: JMotionEvent): Boolean; cdecl;
    function onDoubleTapEvent(e: JMotionEvent): Boolean; cdecl;
    function onSingleTapConfirmed(e: JMotionEvent): Boolean; cdecl;
  end;

  TSnapshotReadyCallback = class(TJavaLocal, JGoogleMap_SnapshotReadyCallback)
  private
    [Weak] FMapView: TAndroidMapView;
    FRecipient: TMapScreenshotRecipient;
    FBitmapResult: JBitmap;
  public
    constructor Create(MapView: TAndroidMapView; const Recipient: TMapScreenshotRecipient);
    procedure onSnapshotReady(P1: JBitmap); cdecl;
  end;

  TMapLoadedCallback = class(TJavaLocal, JGoogleMap_OnMapLoadedCallback)
  private
    [Weak] FMapView: TAndroidMapView;
  public
    constructor Create(MapView: TAndroidMapView);
    procedure onMapLoaded; cdecl;
  end;

  TMapReadyCallback = class(TJavaLocal, JOnMapReadyCallback)
  private
    FCallback: TProc<JGoogleMap>;
  public
    constructor Create(const ACallback: TProc<JGoogleMap>);

    { JOnMapReadyCallback }
    procedure onMapReady(googleMap: JGoogleMap); cdecl;
  end;

var
  MapService: TAndroidMapService;

procedure RegisterMapService;
begin
  MapService := TAndroidMapService.Create;
  TPlatformServices.Current.AddPlatformService(IFMXMapService, MapService);
end;

function CreateBitmapDescriptorFromBitmap(const Bitmap: TBitmap): JBitmapDescriptor;
var
  Surface: TBitmapSurface;
  JavaBitmap: JBitmap;
begin
  Result := nil;
  Surface := TBitmapSurface.Create;
  try
    Surface.Assign(Bitmap);
    JavaBitmap := TJBitmap.JavaClass.createBitmap(Surface.Width, Surface.Height, TJBitmap_Config.JavaClass.ARGB_8888);
    if SurfaceToJBitmap(Surface, JavaBitmap) then
      Result := TJBitmapDescriptorFactory.JavaClass.fromBitmap(JavaBitmap);
  finally
    Surface.DisposeOf;
  end;
end;

function CoordToLatLng(const C: TMapCoordinate): JLatLng;
begin
  Result := TJLatLng.JavaClass.init(C.Latitude, C.Longitude)
end;

{ TAndroidMapService }

constructor TAndroidMapService.Create;
begin
  inherited;
  FMapViews := TList<TAndroidMapView>.Create;
  TMessageManager.DefaultManager.SubscribeToMessage(TFormActivateMessage, FormActivateHandler);
end;

destructor TAndroidMapService.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TFormActivateMessage, FormActivateHandler);
  FreeAndNil(FMapViews);
  inherited;
end;

function TAndroidMapService.CreateMapView: ICustomMapView;
var
  MapView: TAndroidMapView;
begin
  MapView := TAndroidMapView.Create;
  FMapViews.Add(MapView);
  Result := MapView;
end;

procedure TAndroidMapService.DestroyMapView(const MapView: ICustomMapView);
begin
  FMapViews.Remove(TAndroidMapView(MapView));
  TAndroidMapView(MapView).DestroyView;
end;

procedure TAndroidMapService.FormActivateHandler(const Sender: TObject; const M: TMessage);
begin
  RealignMapViews;
end;

procedure TAndroidMapService.RealignMapViews;
var
  Map: TAndroidMapView;
begin
  for Map in FMapViews do
    Map.InitMapView;
end;

{ TAndroidMapView }

constructor TAndroidMapView.Create;
begin
  inherited;
  FZoom := 1;
  FTilt := 0;
  FBearing := 0;
  FMapObjects := TDictionary<string, TMapObjectBase>.Create;
  FJBundle := TJBundle.JavaClass.init;
  FMapReadyCallback := TMapReadyCallback.Create(procedure (googleMap: JGoogleMap) begin
    FGoogleMap := googleMap;
    InitializeMapObjects;
    InitGoogleMap;
  end);
end;

destructor TAndroidMapView.Destroy;
begin
  FreeAndNil(FMapReadyCallback);
  if ZOrderManager <> nil then
    ZOrderManager.RemoveLink(FHostControl);
  FMapObjects.DisposeOf;
  inherited;
end;

procedure TAndroidMapView.DispatchMapEvent(const MapEvent: TMapEvent);
begin
  case MapEvent.Kind of
    TMapEventKind.MarkerClick:
      begin
        FSelectedMarker := GetMapObject<TMapMarker>(JStringToString(MapEvent.Marker.getId));
        FHostControl.DoMarkerClick(FSelectedMarker);
      end;
    TMapEventKind.MarkerDragStart:
      FHostControl.DoMarkerDragStart(GetMapObject<TMapMarker>(JStringToString(MapEvent.Marker.getId)));
    TMapEventKind.MarkerDrag:
      FHostControl.DoMarkerDrag(GetMapObject<TMapMarker>(JStringToString(MapEvent.Marker.getId)));
    TMapEventKind.MarkerDragEnd:
      FHostControl.DoMarkerDragEnd(GetMapObject<TMapMarker>(JStringToString(MapEvent.Marker.getId)));
    TMapEventKind.MapClick:
      begin
        FSelectedMarker := nil;
        FHostControl.DoMapClick(MapEvent.LatLng);
      end;
    TMapEventKind.MapLongClick:
      begin
        FSelectedMarker := nil;
        FHostControl.DoMapLongClick(MapEvent.LatLng);
      end;
    TMapEventKind.MapDoubleClick:
      if FSelectedMarker <> nil then
        FHostControl.DoMarkerDoubleClick(FSelectedMarker)
      else
        FHostControl.DoMapDoubleClick(MapEvent.LatLng);
    TMapEventKind.CameraChanged:
      FHostControl.DoCameraChanged;
  end;
end;

procedure TAndroidMapView.InitMapView;
var
  LayoutParams: JRelativeLayout_LayoutParams;
begin
  if CheckGooglePlayServices then
  begin
    TJMapsInitializer.JavaClass.initialize(TAndroidHelper.Activity);
    if FMapView = nil then
    begin
      FMapView := TJMapViewWithGestures.JavaClass.init(TAndroidHelper.Activity, BuildGoogleMapOptions);
      FMapView.onCreate(Bundle);

      FMapViewContainer := TJRelativeLayout.JavaClass.init(TAndroidHelper.Context);
      FChildrenContainer := TJRelativeLayout.JavaClass.init(TAndroidHelper.Context);
      LayoutParams := TJRelativeLayout_LayoutParams.JavaClass.init(TJViewGroup_LayoutParams.JavaClass.MATCH_PARENT, TJViewGroup_LayoutParams.JavaClass.MATCH_PARENT);
      FMapViewContainer.addView(FMapView, LayoutParams);
      LayoutParams := TJRelativeLayout_LayoutParams.JavaClass.init(TJViewGroup_LayoutParams.JavaClass.MATCH_PARENT, TJViewGroup_LayoutParams.JavaClass.MATCH_PARENT);
      FMapViewContainer.addView(FChildrenContainer, LayoutParams);

      InitGestureDetector;
      FMapView.getMapAsync(FMapReadyCallback);
    end;
  end;
  UpdateContentFromControl;
end;

procedure TAndroidMapView.Snapshot(const Recipient: TMapScreenshotRecipient);
begin
  InvokeOnMap(procedure(Map: JGoogleMap) begin
    FSnapshotReadyCallback := TSnapshotReadyCallback.Create(Self, Recipient);
    Map.snapshot(FSnapshotReadyCallback);
  end);
end;

procedure TAndroidMapView.OptionsChanged(const OptionSets: TMapOptionSets);
begin
  FUpdateOptions := FUpdateOptions + OptionSets;
  if (TMapOptionSet.Layer in FUpdateOptions) and SetLayers then
    Exclude(FUpdateOptions, TMapOptionSet.Layer);
  if (TMapOptionSet.Control in FUpdateOptions) and SetControls then
    Exclude(FUpdateOptions, TMapOptionSet.Control);
  if (TMapOptionSet.Gesture in FUpdateOptions) and SetGestures then
    Exclude(FUpdateOptions, TMapOptionSet.Gesture);
end;

procedure TAndroidMapView.DestroyView;
begin
  Hide;
  if FMapView <> nil then
    FMapView.onDestroy;
end;

function TAndroidMapView.GetGoogleMapType: Integer;
begin
  case FHostControl.MapType of
    TMapType.None:
      Result := TJGoogleMap.JavaClass.MAP_TYPE_NONE;
    TMapType.Normal:
      Result := TJGoogleMap.JavaClass.MAP_TYPE_NORMAL;
    TMapType.Satellite:
      Result := TJGoogleMap.JavaClass.MAP_TYPE_SATELLITE;
    TMapType.Hybrid:
      Result := TJGoogleMap.JavaClass.MAP_TYPE_HYBRID;
    TMapType.Terrain:
      Result := TJGoogleMap.JavaClass.MAP_TYPE_TERRAIN;
  else
      Result := TJGoogleMap.JavaClass.MAP_TYPE_NORMAL;
  end;
end;

procedure TAndroidMapView.SetTilt(const Tilt: Single);
begin
  FTilt := Tilt;
end;

function TAndroidMapView.GetTilt: Single;
begin
  Result := FTilt;
end;

procedure TAndroidMapView.SetBearing(const Bearing: Single);
begin
  FBearing := Bearing;
end;

function TAndroidMapView.GetBearing: Single;
begin
  Result := FBearing;
end;

procedure TAndroidMapView.SetZoom(const Zoom: Single);
begin
  FZoom := Zoom;
end;

function TAndroidMapView.GetZoom: Single;
begin
  Result := FZoom;
end;

function TAndroidMapView.GetZOrderManager: TAndroidZOrderManager;
var
  Form: TCommonCustomForm;
begin
  if (FHostControl <> nil) and (FHostControl.Root <> nil) and (FHostControl.Root.GetObject is TCommonCustomForm) then
  begin
    Form := TCommonCustomForm(FHostControl.Root);
    Result := WindowHandleToPlatform(Form.Handle).ZOrderManager;
  end
  else
    Result := nil;
end;

procedure TAndroidMapView.SetHostControl(const Host: TCustomMapView);
begin
  FHostControl := Host;
  if FMapView <> nil then
    FMapView.setFocusable(FHostControl.CanFocus);
end;

procedure TAndroidMapView.Show;
begin
  FUpdateOptions := [TMapOptionSet.Layer, TMapOptionSet.Control, TMapOptionSet.Gesture];

  if FCameraChangeListener = nil then
  begin
    FCameraChangeListener := TJCameraChangeListener.JavaClass.init;
    FCameraCallback := TCameraCallback.Create(Self);
    FCameraChangeListener.setCallback(FCameraCallback);

    FMarkerClickListener := TMarkerClickListener.Create(Self);
    FMarkerDragListener := TMarkerDragListener.Create(Self);

    FClickListener := TMapClickListener.Create(Self);
    FLongClickListener := TMapLongClickListener.Create(Self);

    FMapLoadedCallback := TMapLoadedCallback.Create(Self);
  end;

  if (FMapView <> nil) and not FViewShown and not FViewShowing then
  begin
    FViewShowing := True;
    FMapView.onResume;
    InitGoogleMap;
  end;
end;

procedure TAndroidMapView.SyncCameraPosition;
begin
  if FCameraChangeListener <> nil then
  begin
    FBearing := FCameraChangeListener.getBearing();
    FZoom := FCameraChangeListener.getZoom();
    FTilt := FCameraChangeListener.getTilt();
    FLocation := TMapCoordinate.Create(FCameraChangeListener.getLatitude(), FCameraChangeListener.getLongitude());
  end;
end;

procedure TAndroidMapView.Hide;
begin
  if FMapView <> nil then
  begin
    if FViewShown or FViewShowing then
    begin
      InvokeOnMap(FMapView, procedure (Map: JGoogleMap)
        begin
          Map.setOnMapLoadedCallback(nil);
          Map.setOnCameraChangeListener(nil);
          Map.setOnMarkerClickListener(nil);
          Map.setOnMarkerDragListener(nil);
          Map.setOnMapClickListener(nil);
          Map.setOnMapLongClickListener(nil);
        end);
      FViewShown := False;
      FViewShowing := False;
      FMapView.onSaveInstanceState(Bundle);
      FMapView.onPause;
    end;
  end;
end;

function TAndroidMapView.BuildCameraPosition: JCameraPosition;
begin
  Result := TJCameraPosition_Builder.JavaClass.init()
    .target(TJLatLng.JavaClass.init(FLocation.Latitude, FLocation.Longitude))
    .zoom(GetZoom)
    .tilt(GetTilt)
    .bearing(GetBearing)
    .build;
end;

function TAndroidMapView.AddMarker(const Descriptor: TMapMarkerDescriptor): TMapMarker;
var
  R: TAndroidMapMarker;
begin
  R := TAndroidMapMarker.Create(Descriptor);
  R.SetHostView(Self);
  Result := R;
  if FGoogleMap <> nil then
  begin
    R.SetJMarker(AddJMarker(Descriptor));
    if R.FJavaMarker <> nil then
      PutMapObject<TMapMarker>(JStringToString(R.FJavaMarker.getId), Result);
  end
  else
    StashUninitializedMapObject(R);
end;

function TAndroidMapView.AddCircle(const Descriptor: TMapCircleDescriptor): TMapCircle;
var
  R: TAndroidMapCircle;
begin
  R := TAndroidMapCircle.Create(Descriptor);
  R.SetHostView(Self);
  Result := R;
  if FGoogleMap <> nil then
  begin
    R.SetJCircle(AddJCircle(Descriptor));
    if R.FJavaCircle <> nil then
      PutMapObject<TMapCircle>(JStringToString(R.FJavaCircle.getId), Result);
  end
  else
    StashUninitializedMapObject(R);
end;

function TAndroidMapView.AddPolygon(const Descriptor: TMapPolygonDescriptor): TMapPolygon;
var
  R: TAndroidMapPolygon;
begin
  R := TAndroidMapPolygon.Create(Descriptor);
  R.SetHostView(Self);
  Result := R;
  if FGoogleMap <> nil then
  begin
    R.SetJPolygon(AddJPolygon(Descriptor));
    if R.FJavaPolygon <> nil then
      PutMapObject<TMapPolygon>(JStringToString(R.FJavaPolygon.getId), Result);
  end
  else
    StashUninitializedMapObject(R);
end;

function TAndroidMapView.AddPolyline(const Descriptor: TMapPolylineDescriptor): TMapPolyline;
var
  R: TAndroidMapPolyline;
begin
  R := TAndroidMapPolyline.Create(Descriptor);
  R.SetHostView(Self);
  Result := R;
  if FGoogleMap <> nil then
  begin
    R.SetJPolyline(AddJPolyline(Descriptor));
    if R.FJavaPolyline <> nil then
      PutMapObject<TMapPolyline>(JStringToString(R.FJavaPolyline.getId), Result);
  end
  else
    StashUninitializedMapObject(R);
end;

procedure TAndroidMapView.AnimateToCameraPosition;
begin
  FCameraPosition := BuildCameraPosition;
  if FMapView <> nil then
    InvokeOnMap(procedure (Map: JGoogleMap) begin
      TJMapsInitializer.JavaClass.initialize(TAndroidHelper.Activity);  // workaround for older version of gms
      Map.animateCamera(TJCameraUpdateFactory.JavaClass.newCameraPosition(FCameraPosition));
    end);
end;

procedure TAndroidMapView.SetLocation(const ACoordinate: TMapCoordinate);
begin
  FLocation := ACoordinate;
end;

function TAndroidMapView.GetLocation: TMapCoordinate;
begin
  Result := FLocation;
end;

procedure TAndroidMapView.SetMapType(const AValue: TMapType);
begin
  if FGoogleMap <> nil then
    FGoogleMap.setMapType(GetGoogleMapType);
end;

procedure TAndroidMapView.UpdateContentFromControl;
begin
  if FHostControl = nil then
    Exit;
  // if native MapView is not yet initialized, call InitMapView. It starts initialization
  // of the native control and calls UpdateNativeBounds when native MapView is ready
  if FMapView = nil then
    InitMapView
  else
    UpdateNativeBounds;
end;

procedure TAndroidMapView.UpdateNativeBounds;
begin
  if ZOrderManager = nil then
    Exit;

  ZOrderManager.AddOrSetLink(FHostControl, FMapViewContainer, FChildrenContainer);
  ZOrderManager.UpdateOrderAndBounds(FHostControl);
  Show;
end;

function TAndroidMapView.CaptureBitmap: TBitmap;
begin
  Result := nil;
end;

function TAndroidMapView.GetMapObject<T>(const Key: string): T;
var
  TmpResult: TMapObjectBase;
begin
  if FMapObjects.TryGetValue(Key, TmpResult) then
    try
      Result := TmpResult as T;
    except
      on EInvalidCast do
        Result := nil;
    end;
end;

procedure TAndroidMapView.PutMapObject<T>(const Key: string; const MapObject: T);
var
  MObject: TMapObjectBase;
begin
  if FMapObjects.TryGetValue(Key, MObject) then
    FMapObjects[Key] := MapObject
  else
    FMapObjects.Add(Key, MapObject);
end;

function TAndroidMapView.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  Result := inherited QueryInterface(IID, Obj);
  if (FMapView <> nil) and (Result <> S_OK) then
    Result := FMapView.QueryInterface(IID, Obj);
  if (FJBundle <> nil) and (Result <> S_OK) then
    Result := FJBundle.QueryInterface(IID, Obj);
  if (FCameraPosition <> nil) and (Result <> S_OK) then
    Result := FCameraPosition.QueryInterface(IID, Obj);
  if (FCameraChangeListener <> nil) and (Result <> S_OK) then
    Result := FCameraChangeListener.QueryInterface(IID, Obj);
  if (FDoubleTapListener <> nil) and (Result <> S_OK) then
    Result := FDoubleTapListener.QueryInterface(IID, Obj);
end;

procedure TAndroidMapView.RemoveMapObject(const Key: string);
var
  M: TMapMarker;
begin
  M := GetMapObject<TMapMarker>(Key);
  if (M <> nil) and (M = FSelectedMarker) then
    FSelectedMarker := nil;
  FMapObjects.Remove(Key);
end;

procedure TAndroidMapView.StashUninitializedMapObject(const MapObject: TMapObjectBase);
begin
  if FUninitialized = nil then
    FUninitialized := TList<TMapObjectBase>.Create;
  FUninitialized.Add(MapObject);
end;

procedure TAndroidMapView.ClearUninitializedMapObjects;
begin
  FUninitialized.Clear;
  FUninitialized := nil;
end;

class constructor TAndroidMapView.Create;
begin
  FPlayServicesStatus := TServicesStatus.Unchecked;
end;

class function TAndroidMapView.CheckGooglePlayServices: Boolean;
const
  PLAY_SERVICES_RESOLUTION_REQUEST = 10000;
var
  ErrorCode: Integer;
begin
  if FPlayServicesStatus = TServicesStatus.Unchecked then
  begin
    ErrorCode := TJGooglePlayServicesUtil.JavaClass.isGooglePlayServicesAvailable(TAndroidHelper.Activity);
    if ErrorCode <> TJConnectionResult.JavaClass.SUCCESS then
    begin
      FPlayServicesStatus := TServicesStatus.Error;
      try
        TJGooglePlayServicesUtil.JavaClass.getErrorDialog(ErrorCode, TAndroidHelper.Activity,
          PLAY_SERVICES_RESOLUTION_REQUEST).show;
      except
        on Exception do
        begin
          TDialogService.ShowMessage(SMsgGooglePlayServicesNeedUpdating);
        end;
      end;
    end
    else
      FPlayServicesStatus := TServicesStatus.Clear;
  end;
  Result := FPlayServicesStatus = TServicesStatus.Clear;
end;

procedure TAndroidMapView.InitGestureDetector;
begin
  FDoubleTapListener := TDoubleTapListener.Create(Self);
  FMapView.getGestureDetector.setOnDoubleTapListener(FDoubleTapListener);
end;

procedure TAndroidMapView.InitGoogleMap;
begin
  InvokeOnMap(procedure (Map: JGoogleMap)
    begin
      Map.setOnMapLoadedCallback(FMapLoadedCallback); // called when the map will have been fully loaded
      Map.setOnCameraChangeListener(JGoogleMap_OnCameraChangeListener(FCameraChangeListener));
      Map.setOnMarkerClickListener(JGoogleMap_OnMarkerClickListener(FMarkerClickListener));
      Map.setOnMarkerDragListener(JGoogleMap_OnMarkerDragListener(FMarkerDragListener));
      Map.setOnMapClickListener(FClickListener);
      Map.setOnMapLongClickListener(FLongClickListener);
      Map.setMapType(GetGoogleMapType);
    end);
end;

procedure TAndroidMapView.InitializeMapObjects;
  procedure InitializeMapObject(const Marker: TAndroidMapMarker); overload;
  begin
    Marker.SetJMarker(AddJMarker(Marker.Descriptor));
    PutMapObject<TMapMarker>(JStringToString(Marker.FJavaMarker.getId), Marker);
  end;

  procedure InitializeMapObject(const Polyline: TAndroidMapPolyline); overload;
  begin
    Polyline.SetJPolyline(AddJPolyline(Polyline.Descriptor));
    PutMapObject<TMapPolyline>(JStringToString(Polyline.FJavaPolyline.getId), Polyline);
  end;

  procedure InitializeMapObject(const Polygon: TAndroidMapPolygon); overload;
  begin
    Polygon.SetJPolygon(AddJPolygon(Polygon.Descriptor));
    PutMapObject<TMapPolygon>(JStringToString(Polygon.FJavaPolygon.getId), Polygon);
  end;

  procedure InitializeMapObject(const Circle: TAndroidMapCircle); overload;
  begin
    Circle.SetJCircle(AddJCircle(Circle.Descriptor));
    PutMapObject<TMapCircle>(JStringToString(Circle.FJavaCircle.getId), Circle);
  end;

var
  Obj: TMapObjectBase;
begin
  if FUninitialized <> nil then
  try
    for Obj in FUninitialized do
      if Obj is TAndroidMapMarker then
        InitializeMapObject(TAndroidMapMarker(Obj))
      else if Obj is TAndroidMapPolygon then
        InitializeMapObject(TAndroidMapPolygon(Obj))
      else if Obj is TAndroidMapPolyline then
        InitializeMapObject(TAndroidMapPolygon(Obj))
      else if Obj is TAndroidMapCircle then
        InitializeMapObject(TAndroidMapCircle(Obj));
  finally
    ClearUninitializedMapObjects;
  end;
end;

{ TMapLoadedCallback }

constructor TMapLoadedCallback.Create(MapView: TAndroidMapView);
begin
  inherited Create;
  FMapView := MapView;
end;

procedure TMapLoadedCallback.onMapLoaded;
begin
  FMapView.FViewShown := True;
  FMapView.FViewShowing := False;
  FMapView.InvokeOnMap(procedure (Map: JGoogleMap) begin
    FMapView.OptionsChanged([TMapOptionSet.Gesture, TMapOptionSet.Control, TMapOptionSet.Layer]);
  end);
end;

procedure TAndroidMapView.AnimateCameraToPosition;
begin
end;

procedure TAndroidMapView.GetCameraPosition;
begin
  InvokeOnMap(procedure (Map: JGoogleMap) begin
    TJMapsInitializer.JavaClass.initialize(TAndroidHelper.Activity);  // workaround for older version of gms
    FCameraPosition := Map.getCameraPosition;
  end);
end;

function TAndroidMapView.InvokeOnMap(const MapView: JMapViewWithGestures; const Proc: TProc<JGoogleMap>): Boolean;
var
  Map: JGoogleMap;
begin
  Result := False;
  if MapView <> nil then
  begin
    Map := FGoogleMap;
    if Map <> nil then
    try
      Proc(Map);
      Result := True;
    except
      Result := False;
    end;
  end;
end;

function TAndroidMapView.InvokeOnMap(const Proc: TProc<JGoogleMap>): Boolean;
begin
  Result := InvokeOnMap(FMapView, Proc);
end;

function TAndroidMapView.ApplyToMap<TResult>(const Func: TFunc<JGoogleMap,TResult>): TResult;
var
  Map: JGoogleMap;
  MapView: JMapView;
begin
  MapView := FMapView;
  if MapView <> nil then
  begin
    Map := FGoogleMap;
    if Map <> nil then
      Result := Func(Map);
  end;
end;

function TAndroidMapView.InvokeOnUISettings(const Proc: TProc<JUiSettings>): Boolean;
begin
  Result := InvokeOnMap(procedure(Map: JGoogleMap)
    var
      UiSettings: JUiSettings;
    begin
      UiSettings := Map.getUiSettings;
      if UiSettings <> nil then
        Proc(UiSettings)
      else
        raise Exception.Create('Map.getUiSettings is nil');
    end);
end;

function TAndroidMapView.SetLayers: Boolean;
begin
  Result := InvokeOnMap(procedure (Map: JGoogleMap) begin
    Map.setBuildingsEnabled(TMapLayerOption.Buildings in FHostControl.LayerOptions);
    Map.setTrafficEnabled(TMapLayerOption.Traffic in FHostControl.LayerOptions);
    Map.setMyLocationEnabled(TMapLayerOption.UserLocation in FHostControl.LayerOptions);
                                                 
  end);
end;

function TAndroidMapView.SetControls: Boolean;
begin
  Result := InvokeOnUISettings(procedure(UISettings: JUiSettings)
    begin
      UISettings.setCompassEnabled(TMapControlOption.Compass in FHostControl.ControlOptions);
      UISettings.setZoomControlsEnabled(TMapControlOption.Zoom in FHostControl.ControlOptions);
      UISettings.setMyLocationButtonEnabled(TMapControlOption.MyLocation in FHostControl.ControlOptions);
    end);
end;

function TAndroidMapView.SetGestures: Boolean;
begin
  Result := InvokeOnUISettings(procedure(UISettings: JUiSettings)
    begin
      UISettings.setZoomGesturesEnabled(TMapGestureOption.Zoom in FHostControl.GestureOptions);
      UISettings.setTiltGesturesEnabled(TMapGestureOption.Tilt in FHostControl.GestureOptions);
      UISettings.setScrollGesturesEnabled(TMapGestureOption.Scroll in FHostControl.GestureOptions);
      UISettings.setRotateGesturesEnabled(TMapGestureOption.Rotate in FHostControl.GestureOptions);
    end);
end;

function TAndroidMapView.BuildGoogleMapOptions: JGoogleMapOptions;
begin
  Result := TFunc<TCustomMapView, JGoogleMapOptions>(function(Host: TCustomMapView): JGoogleMapOptions
    begin
      Result := TJGoogleMapOptions.JavaClass.init().camera(BuildCameraPosition)
        .zoomGesturesEnabled(TMapGestureOption.Zoom in Host.GestureOptions)
        .tiltGesturesEnabled(TMapGestureOption.Tilt in Host.GestureOptions)
        .scrollGesturesEnabled(TMapGestureOption.Scroll in Host.GestureOptions)
        .rotateGesturesEnabled(TMapGestureOption.Rotate in Host.GestureOptions)
        .zoomControlsEnabled(TMapControlOption.Zoom in Host.ControlOptions)
        .compassEnabled(TMapControlOption.Compass in Host.ControlOptions)
        .mapType(GetGoogleMapType);
    end)(FHostControl);
end;

function TAndroidMapView.BuildMarkerOptions(const D: TMapMarkerDescriptor): JMarkerOptions;
begin
  Result := TJMarkerOptions.JavaClass.init.alpha(D.Opacity)
    .anchor(D.Origin.X, D.Origin.Y)
    .draggable(D.Draggable)
    .flat(D.Appearance = TMarkerAppearance.Flat)
    .position(CoordToLatLng(D.Position))
    .rotation(D.Rotation)
    .snippet(StringToJString(D.Snippet))
    .title(StringToJString(D.Title))
    .visible(D.Visible);
  if D.Icon <> nil then
    Result := Result.icon(CreateBitmapDescriptorFromBitmap(D.Icon));
end;

function TAndroidMapView.BuildCircleOptions(const D: TMapCircleDescriptor): JCircleOptions;
begin
  Result := TJCircleOptions.JavaClass.init
    .center(CoordToLatLng(D.Center))
    .fillColor(D.FillColor)
    .radius(D.Radius)
    .strokeWidth(D.StrokeWidth)
    .strokeColor(D.StrokeColor)
    .zIndex(D.ZIndex);
end;

function TAndroidMapView.BuildPolygonOptions(const D: TMapPolygonDescriptor): JPolygonOptions;
var
  Vertex: TMapCoordinate;
  Hole: TMapPolygonPolyvertex;
  List: JArrayList;
begin
  Result := TJPolygonOptions.JavaClass.init
    .fillColor(D.FillColor)
    .strokeWidth(D.StrokeWidth)
    .strokeColor(D.StrokeColor)
    .zIndex(D.ZIndex);

  List := TJArrayList.JavaClass.init;
  for Vertex in D.Outline.Points do
    List.add(TJObject.Wrap(CoordToLatLng(Vertex)));
  Result.addAll(JIterable(List));

  for Hole in D.Holes do
  begin
    List.clear;
    for Vertex in Hole.Points do
      List.add(TJObject.Wrap(CoordToLatLng(Vertex)));
    Result.addHole(JIterable(List));
  end;
end;

function TAndroidMapView.BuildPolylineOptions(const D: TMapPolylineDescriptor): JPolylineOptions;
var
  List: JArrayList;
  Vertex: TMapCoordinate;
begin
  Result := TJPolylineOptions.JavaClass.init
    .width(D.StrokeWidth)
    .color(D.StrokeColor)
    .zIndex(D.ZIndex);

  List := TJArrayList.JavaClass.init;
  for Vertex in D.Points.Points do
    List.add(TJObject.Wrap(CoordToLatLng(Vertex)));
  Result.addAll(JIterable(List));
end;

function TAndroidMapView.AddJMarker(const D: TMapMarkerDescriptor): JMarker;
begin
  Result := ApplyToMap<JMarker>(function(Map: JGoogleMap): JMarker
    begin
      Result := Map.addMarker(BuildMarkerOptions(D));
    end);
end;

function TAndroidMapView.AddJCircle(const D: TMapCircleDescriptor): JCircle;
begin
  Result := ApplyToMap<JCircle>(function(Map: JGoogleMap): JCircle
    begin
      Result := Map.addCircle(BuildCircleOptions(D));
    end);
end;

function TAndroidMapView.AddJPolygon(const D: TMapPolygonDescriptor): JPolygon;
begin
  Result := ApplyToMap<JPolygon>(function(Map: JGoogleMap): JPolygon
    begin
      Result := Map.addPolygon(BuildPolygonOptions(D));
    end);
end;

function TAndroidMapView.AddJPolyline(const D: TMapPolylineDescriptor): JPolyline;
begin
  Result := ApplyToMap<JPolyline>(function(Map: JGoogleMap): JPolyline
    begin
      Result := Map.addPolyline(BuildPolylineOptions(D));
    end);
end;

{ TCameraCallback }

constructor TCameraCallback.Create(MapView: TAndroidMapView);
begin
  inherited Create;
  FMapView := MapView;
end;

procedure TCameraCallback.onCameraChange(listener: JCameraChangeListener);
begin
  FMapView.FTilt := listener.getTilt;
  FMapView.FBearing := listener.getBearing;
  FMapView.FZoom := listener.getZoom;
  FMapView.FLocation := TMapCoordinate.Create(listener.getLatitude, listener.getLongitude);
  FMapView.DispatchMapEvent(TMapEvent.Create(TMapEventKind.CameraChanged));
end;

{ TMapEvent }

class function TMapEvent.Create(Marker: JMarker; Kind: TMapEventKind): TMapEvent;
begin
  Result.Marker := Marker;
  Result.Kind := Kind;
end;

class function TMapEvent.Create(Kind: TMapEventKind): TMapEvent;
begin
  Result.Kind := Kind;
end;

class function TMapEvent.Create(Kind: TMapEventKind; const LatLng: TMapCoordinate): TMapEvent;
begin
  Result.Marker := nil;
  Result.Kind := Kind;
  Result.LatLng := LatLng;
end;

{ TMarkerListener }

constructor TMarkerDragListener.Create(MapView: TAndroidMapView);
begin
  inherited Create;
  FMapView := MapView;
end;

procedure TMarkerDragListener.onMarkerDragStart(P1: JMarker);
begin
  FMapView.DispatchMapEvent(TMapEvent.Create(P1, TMapEventKind.MarkerDragStart));
end;

procedure TMarkerDragListener.onMarkerDrag(P1: JMarker);
begin
  FMapView.DispatchMapEvent(TMapEvent.Create(P1, TMapEventKind.MarkerDrag));
end;

procedure TMarkerDragListener.onMarkerDragEnd(P1: JMarker);
begin
  FMapView.DispatchMapEvent(TMapEvent.Create(P1, TMapEventKind.MarkerDragEnd));
end;

{ TMarkerClickListener }
constructor TMarkerClickListener.Create(MapView: TAndroidMapView);
begin
  inherited Create;
  FMapView := MapView;
end;

function TMarkerClickListener.onMarkerClick(P1: JMarker): Boolean;
begin
  FMapView.DispatchMapEvent(TMapEvent.Create(P1, TMapEventKind.MarkerClick));
  Result := False;                                                                      
end;

{ TMapClickListener }

constructor TMapClickListener.Create(MapView: TAndroidMapView);
begin
  inherited Create;
  FMapView := MapView;
end;

procedure TMapClickListener.onMapClick(P1: JLatLng);
begin
  FMapView.DispatchMapEvent(TMapEvent.Create(TMapEventKind.MapClick, TMapCoordinate.Create(P1.latitude, P1.longitude)));
end;

{ TMapLongClickListener }

constructor TMapLongClickListener.Create(MapView: TAndroidMapView);
begin
  inherited Create;
  FMapView := MapView;
end;

procedure TMapLongClickListener.onMapLongClick(P1: JLatLng);
begin
  FMapView.DispatchMapEvent(TMapEvent.Create(TMapEventKind.MapLongClick, TMapCoordinate.Create(P1.latitude, P1.longitude)));
end;

{ TSnapshotReadyCallback }

constructor TSnapshotReadyCallback.Create(MapView: TAndroidMapView; const Recipient: TMapScreenshotRecipient);
begin
  inherited Create;
  FMapView := MapView;
  FRecipient := Recipient;
end;

procedure TSnapshotReadyCallback.onSnapshotReady(P1: JBitmap);
var
  Surface: TBitmapSurface;
  Bitmap: TBitmap;
begin
  if Assigned(FRecipient) then
  begin
    FBitmapResult := P1;
    Surface := TBitmapSurface.Create;
    Bitmap := nil;
    try
      if JBitmapToSurface(FBitmapResult, Surface) then
      begin
        Bitmap := TBitmap.Create;
        Bitmap.Assign(Surface);
        if Assigned(FRecipient) then
          FRecipient(Bitmap);
      end;
    finally
      Surface.Free;
      Bitmap.Free;
    end;
  end;
end;

{ TAndroidMapMarker }

constructor TAndroidMapMarker.Create(const Descriptor: TMapMarkerDescriptor);
begin
  inherited;
end;

destructor TAndroidMapMarker.Destroy;
begin
  Remove;
  inherited;
end;

procedure TAndroidMapMarker.SetHostView(MapView: TAndroidMapView);
begin
  FMapView := MapView;
end;

procedure TAndroidMapMarker.SetJMarker(Marker: JMarker);
begin
  FJavaMarker := Marker;
end;

procedure TAndroidMapMarker.Remove;
begin
  inherited;
  if FJavaMarker <> nil then
    FJavaMarker.remove;
end;

procedure TAndroidMapMarker.SetVisible(const Value: Boolean);
begin
  inherited;
  if FJavaMarker <> nil then
    FJavaMarker.setVisible(Value);
end;

function TAndroidMapMarker.ToString: string;
begin
  Result := Format('%s[Pos:%s;Title:%s,Visible=%s]', [inherited, Descriptor.Position.ToString, Descriptor.Title,
    BoolToStr(Descriptor.Visible, True)]);
end;

{ TAndroidMapCircle }

destructor TAndroidMapCircle.Destroy;
begin
  Remove;
  inherited;
end;

procedure TAndroidMapCircle.SetHostView(MapView: TAndroidMapView);
begin
  FMapView := MapView;
end;

procedure TAndroidMapCircle.SetJCircle(Circle: JCircle);
begin
  FJavaCircle := Circle;
end;

procedure TAndroidMapCircle.Remove;
begin
  inherited;
  if FJavaCircle <> nil then
    FJavaCircle.remove;
end;

procedure TAndroidMapCircle.SetVisible(const Value: Boolean);
begin
  inherited;
  if FJavaCircle <> nil then
    FJavaCircle.setVisible(Value);
end;

function TAndroidMapCircle.ToString: string;
begin
  Result := Format('%s[Center:%3.4f;%3.4f;R:%3.4f]', [inherited, Descriptor.Center.Latitude, Descriptor.Center.Longitude,
    Descriptor.Radius]);
end;

{ TAndroidMapPolygon }

destructor TAndroidMapPolygon.Destroy;
begin
  Remove;
  inherited;
end;

procedure TAndroidMapPolygon.SetHostView(MapView: TAndroidMapView);
begin
  FMapView := MapView;
end;

procedure TAndroidMapPolygon.SetJPolygon(Polygon: JPolygon);
begin
  FJavaPolygon := Polygon;
end;

procedure TAndroidMapPolygon.Remove;
begin
  inherited;
  if FJavaPolygon <> nil then
    FJavaPolygon.remove;
end;

procedure TAndroidMapPolygon.SetVisible(const Value: Boolean);
begin
  inherited;
  if FJavaPolygon <> nil then
    FJavaPolygon.setVisible(Value);
end;

function TAndroidMapPolygon.ToString: string;
begin
  Result := Format('%s[|Points|=%d;|Holes|=%d;Geo=%d]', [inherited, Length(Descriptor.Outline.Points),
    Length(Descriptor.Holes), BoolToStr(Descriptor.Geodesic, True)]);
end;

{ TAndroidMapPolyline }

destructor TAndroidMapPolyline.Destroy;
begin
  Remove;
  inherited;
end;

procedure TAndroidMapPolyline.SetHostView(MapView: TAndroidMapView);
begin
  FMapView := MapView;
end;

procedure TAndroidMapPolyline.SetJPolyline(Polyline: JPolyline);
begin
  FJavaPolyline := Polyline;
end;

procedure TAndroidMapPolyline.Remove;
begin
  inherited;
  if FJavaPolyline <> nil then
    FJavaPolyline.remove;
end;

procedure TAndroidMapPolyline.SetVisible(const Value: Boolean);
begin
  inherited;
  if FJavaPolyline <> nil then
    FJavaPolyline.setVisible(Value);
end;

function TAndroidMapPolyline.ToString: string;
begin
  Result := Format('%s[|Points|=%d;Geo=%d]', [inherited, Length(Descriptor.Points.Points),
    BoolToStr(Descriptor.Geodesic, True)]);
end;

{ TDoubleTapListener }

constructor TDoubleTapListener.Create(const MapView: TAndroidMapView);
begin
  inherited Create;
  FMapView := MapView;
end;

function TDoubleTapListener.onDoubleTap(e: JMotionEvent): Boolean;
var
  P: JPoint;
  LatLng: JLatLng;
begin
  if FMapView.FGoogleMap = nil then
    Exit(False);

  P := TJPoint.JavaClass.init(Round(e.getX), Round(e.getY));
  LatLng := FMapView.FGoogleMap.getProjection.fromScreenLocation(P);
  FMapView.DispatchMapEvent(TMapEvent.Create(TMapEventKind.MapDoubleClick,
    TMapCoordinate.Create(LatLng.latitude, LatLng.longitude)));
  Result := False;                                                                      
end;

function TDoubleTapListener.onDoubleTapEvent(e: JMotionEvent): Boolean;
begin
  Result := False;
end;

function TDoubleTapListener.onSingleTapConfirmed(e: JMotionEvent): Boolean;
begin
  Result := False;
end;

{ TMapReadyCallback }

constructor TMapReadyCallback.Create(const ACallback: TProc<JGoogleMap>);
begin
  inherited Create;
  FCallback := ACallback;
end;

procedure TMapReadyCallback.onMapReady(googleMap: JGoogleMap);
begin
  FCallback(googleMap);
end;

end.

