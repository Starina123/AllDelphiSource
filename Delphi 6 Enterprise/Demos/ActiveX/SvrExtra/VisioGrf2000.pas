unit VisioGrf2000;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : $Revision:   1.0  $
// File generated on 12/20/2000 8:50:39 AM from Type Library described below.

// ************************************************************************ //
// Type Lib: ..\typelibraries\visgrf32.tlb (1)
// IID\LCID: {000D1140-0000-0000-C000-000000000046}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
// Errors:
//   Hint: Symbol 'Graph' renamed to 'VisioGraph'
//   Hint: TypeInfo 'Graph' changed to 'VisioGraph'
//   Hint: Symbol 'Container' renamed to 'VisioContainer'
//   Hint: Symbol 'GraphPoints' renamed to 'VisioGraphPoints'
//   Hint: Symbol 'GraphPointsEx' renamed to 'VisioGraphPointsEx'
//   Hint: Parameter 'Type' of IGraph.SetRouteJumpType changed to 'Type_'
//   Hint: Member 'Type' of 'ILayoutObject' changed to 'Type_'
//   Hint: Parameter 'Type' of IContainer.SetRouteJumpType changed to 'Type_'
//   Hint: Symbol 'Graph' renamed to 'VisioGraph'
//   Hint: TypeInfo 'Graph' changed to 'VisioGraph'
//   Hint: Symbol 'Container' renamed to 'VisioContainer'
//   Hint: Symbol 'GraphPoints' renamed to 'VisioGraphPoints'
//   Hint: Symbol 'GraphPointsEx' renamed to 'VisioGraphPointsEx'
//   Hint: Member 'Type' of 'ILayoutObject' changed to 'Type_'
//   Error creating palette bitmap of (TVisioGraph) : Server D:\Program Files\Visio\VISGRF32.DLL contains no icons
//   Error creating palette bitmap of (TVisioContainer) : Server D:\Program Files\Visio\VISGRF32.DLL contains no icons
//   Error creating palette bitmap of (TVisioGraphPoints) : Server D:\Program Files\Visio\VISGRF32.DLL contains no icons
//   Error creating palette bitmap of (TVisioGraphPointsEx) : Server D:\Program Files\Visio\VISGRF32.DLL contains no icons
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
interface

uses Windows, ActiveX, Classes, Graphics, StdVCL, OleServer;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  VisioGraphMajorVersion = 2;
  VisioGraphMinorVersion = 60;

  LIBID_VisioGraph: TGUID = '{000D1140-0000-0000-C000-000000000046}';

  IID_IGraphVersion: TGUID = '{000D1154-0000-0000-C000-000000000046}';
  IID_IGraphSite: TGUID = '{000D1155-0000-0000-C000-000000000046}';
  IID_IGraph: TGUID = '{000D1142-0000-0000-C000-000000000046}';
  IID_INodes: TGUID = '{000D1146-0000-0000-C000-000000000046}';
  IID_ILayoutObject: TGUID = '{000D1150-0000-0000-C000-000000000046}';
  IID_INode: TGUID = '{000D1145-0000-0000-C000-000000000046}';
  IID_IGraphProps: TGUID = '{000D114D-0000-0000-C000-000000000046}';
  IID_IConnections: TGUID = '{000D114F-0000-0000-C000-000000000046}';
  IID_IConnection: TGUID = '{000D114E-0000-0000-C000-000000000046}';
  IID_IEdge: TGUID = '{000D1148-0000-0000-C000-000000000046}';
  IID_IGraphPoints: TGUID = '{000D114B-0000-0000-C000-000000000046}';
  IID_INodeList: TGUID = '{000D1147-0000-0000-C000-000000000046}';
  IID_IContainer: TGUID = '{000D1144-0000-0000-C000-000000000046}';
  IID_IEdges: TGUID = '{000D1149-0000-0000-C000-000000000046}';
  IID_IGraphRect: TGUID = '{000D114C-0000-0000-C000-000000000046}';
  IID_IEdgeList: TGUID = '{000D114A-0000-0000-C000-000000000046}';
  IID_ILayoutObjectList: TGUID = '{000D1151-0000-0000-C000-000000000046}';
  IID_IGraphPointsEx: TGUID = '{000D1153-0000-0000-C000-000000000046}';
  CLASS_VisioGraph: TGUID = '{000D1143-0000-0000-C000-000000000046}';
  CLASS_VisioContainer: TGUID = '{000D1181-0000-0000-C000-000000000046}';
  CLASS_LayoutObject: TGUID = '{000D1182-0000-0000-C000-000000000046}';
  CLASS_Node: TGUID = '{000D1183-0000-0000-C000-000000000046}';
  CLASS_Nodes: TGUID = '{000D1184-0000-0000-C000-000000000046}';
  CLASS_Edge: TGUID = '{000D1185-0000-0000-C000-000000000046}';
  CLASS_Edges: TGUID = '{000D1186-0000-0000-C000-000000000046}';
  CLASS_Connection: TGUID = '{000D1187-0000-0000-C000-000000000046}';
  CLASS_Connections: TGUID = '{000D1188-0000-0000-C000-000000000046}';
  CLASS_LayoutObjectList: TGUID = '{000D1189-0000-0000-C000-000000000046}';
  CLASS_NodeList: TGUID = '{000D118A-0000-0000-C000-000000000046}';
  CLASS_EdgeList: TGUID = '{000D118B-0000-0000-C000-000000000046}';
  CLASS_GraphRect: TGUID = '{000D118C-0000-0000-C000-000000000046}';
  CLASS_VisioGraphPoints: TGUID = '{000D118D-0000-0000-C000-000000000046}';
  CLASS_GraphProps: TGUID = '{000D118E-0000-0000-C000-000000000046}';
  CLASS_VisioGraphPointsEx: TGUID = '{000D118F-0000-0000-C000-000000000046}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum Constants
type
  Constants = TOleEnum;
const
  vgInvID = $FFFFFFFF;
  vgMinLineJumpFactor = $FFFFFFD6;
  vgMaxLineJumpFactor = $0000000A;

// Constants for enum VGPlacementDepth
type
  VGPlacementDepth = TOleEnum;
const
  vgPlaceDepthNone = $FFFFFFFF;
  vgPlaceDepthShallow = $00000000;
  vgPlaceDepthMedium = $00000001;
  vgPlaceDepthDeep = $00000002;

// Constants for enum VGPlacementStyle
type
  VGPlacementStyle = TOleEnum;
const
  vgPlaceNone = $FFFFFFFF;
  vgPlaceUndirected = $00000000;
  vgPlaceNS = $00000001;
  vgPlaceWE = $00000002;
  vgPlaceSN = $00000003;
  vgPlaceEW = $00000004;
  vgPlaceCircular = $00000005;

// Constants for enum VGRoutingStyle
type
  VGRoutingStyle = TOleEnum;
const
  vgRouteNone = $FFFFFFFF;
  vgRouteNetwork = $00000000;
  vgRouteRightAngle = $00000001;
  vgRouteStraight = $00000002;
  vgRouteOrgChartNS = $00000003;
  vgRouteOrgChartWE = $00000004;
  vgRouteFlowchartNS = $00000005;
  vgRouteFlowchartWE = $00000006;
  vgRouteTreeNS = $00000007;
  vgRouteTreeWE = $00000008;
  vgRouteCenterToCenter = $00000009;
  vgRouteSimpleHH = $0000000A;
  vgRouteSimpleVH = $0000000B;
  vgRouteSimpleHV = $0000000C;
  vgRouteSimpleVV = $0000000D;

// Constants for enum VGConnectionType
type
  VGConnectionType = TOleEnum;
const
  vgFrom = $00000000;
  vgTo = $00000001;
  vgFromOrTo = $00000002;
  vgNeitherFromNorTo = $00000003;
  vgSuccessor = $00000000;
  vgPredecessor = $00000001;
  vgSuccessorOrPredecessor = $00000002;

// Constants for enum VGGeneralDirection
type
  VGGeneralDirection = TOleEnum;
const
  vgDirRight = $00000000;
  vgDirTop = $00000001;
  vgDirLeft = $00000002;
  vgDirBottom = $00000003;
  vgDirTopRight = $00000004;
  vgDirBottomLeft = $00000005;
  vgDirTopLeft = $00000006;
  vgDirBottomRight = $00000007;
  vgDirCenter = $0000000A;
  vgDirNone = $0000000A;
  vgDirAny = $0000000A;

// Constants for enum VGObjectType
type
  VGObjectType = TOleEnum;
const
  vgObjTypeObject = $00000000;
  vgObjTypeNode = $00000001;
  vgObjTypeEdge = $00000002;
  vgObjTypeConnection = $00000003;
  vgObjTypeConnectionPoint = $00000004;

// Constants for enum VGNodeFixedFlags
type
  VGNodeFixedFlags = TOleEnum;
const
  vgNodeFixedFlagFixedPlace = $00000001;
  vgNodeFixedFlagPermeableX = $00000002;
  vgNodeFixedFlagPermeableY = $00000004;
  vgNodeFixedFlagPermeablePlace = $00000008;
  vgNodeFixedFlagFixedPlow = $00000010;
  vgNodeFixedFlagNoFoldToShape = $00000020;
  vgNodeFixedFlagPermeablePlow = $00000040;

// Constants for enum VGPageLineJumpCodes
type
  VGPageLineJumpCodes = TOleEnum;
const
  vgPageJumpCodeNoJumps = $00000000;
  vgPageJumpCodeHorizontal = $00000001;
  vgPageJumpCodeVertical = $00000002;
  vgPageJumpCodeLastRouted = $00000003;
  vgPageJumpCodeZOrder = $00000004;
  vgPageJumpCodeReverseZOrder = $00000005;

// Constants for enum VGObjLineJumpCodes
type
  VGObjLineJumpCodes = TOleEnum;
const
  vgObjJumpCodePage = $00000000;
  vgObjJumpCodeNever = $00000001;
  vgObjJumpCodeAlways = $00000002;
  vgObjJumpCodeAlwaysOther = $00000003;
  vgObjJumpCodeNeither = $00000004;

// Constants for enum VGFixedCodes
type
  VGFixedCodes = TOleEnum;
const
  vgFixedCodeNotFixed = $00000000;
  vgFixedCodeByCaller = $00000001;
  vgFixedCodeByAlgorithm = $00000002;
  vgFixedCodeByCallerNoRipup = $00000003;
  vgFixedCodeByCallerOnCrossover = $00000004;

// Constants for enum VGRouteAdjustCodes
type
  VGRouteAdjustCodes = TOleEnum;
const
  vgRouteAdjustRelated = $00000000;
  vgRouteAdjustAll = $00000001;
  vgRouteAdjustNone = $00000002;
  vgRouteAdjustSource = $00000003;
  vgRouteAdjustTarget = $00000004;
  vgRouteAdjustDefaults = $00000005;

// Constants for enum VGVisgrfVersions
type
  VGVisgrfVersions = TOleEnum;
const
  vgVersionMajor = $00000006;
  vgVersionMinor = $00000000;
  vgVersionBuild = $00000818;
  vgForwardVersionMajor = $00000006;
  vgForwardVersionMinor = $00000000;
  vgForwardVersionBuild = $00000468;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IGraphVersion = interface;
  IGraphVersionDisp = dispinterface;
  IGraphSite = interface;
  IGraphSiteDisp = dispinterface;
  IGraph = interface;
  IGraphDisp = dispinterface;
  INodes = interface;
  INodesDisp = dispinterface;
  ILayoutObject = interface;
  ILayoutObjectDisp = dispinterface;
  INode = interface;
  INodeDisp = dispinterface;
  IGraphProps = interface;
  IGraphPropsDisp = dispinterface;
  IConnections = interface;
  IConnectionsDisp = dispinterface;
  IConnection = interface;
  IConnectionDisp = dispinterface;
  IEdge = interface;
  IEdgeDisp = dispinterface;
  IGraphPoints = interface;
  IGraphPointsDisp = dispinterface;
  INodeList = interface;
  INodeListDisp = dispinterface;
  IContainer = interface;
  IContainerDisp = dispinterface;
  IEdges = interface;
  IEdgesDisp = dispinterface;
  IGraphRect = interface;
  IGraphRectDisp = dispinterface;
  IEdgeList = interface;
  IEdgeListDisp = dispinterface;
  ILayoutObjectList = interface;
  ILayoutObjectListDisp = dispinterface;
  IGraphPointsEx = interface;
  IGraphPointsExDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  VisioGraph = IGraph;
  VisioContainer = IContainer;
  LayoutObject = ILayoutObject;
  Node = INode;
  Nodes = INodes;
  Edge = IEdge;
  Edges = IEdges;
  Connection = IConnection;
  Connections = IConnections;
  LayoutObjectList = ILayoutObjectList;
  NodeList = INodeList;
  EdgeList = IEdgeList;
  GraphRect = IGraphRect;
  VisioGraphPoints = IGraphPoints;
  GraphProps = IGraphProps;
  VisioGraphPointsEx = IGraphPointsEx;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PPSafeArray1 = ^PSafeArray; {*}
  PPSafeArray2 = ^PSafeArray; {*}

  GraphPointEx = packed record
    x: Double;
    y: Double;
    flag: Integer;
    dummy: Integer;
  end;


// *********************************************************************//
// Interface: IGraphVersion
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {000D1154-0000-0000-C000-000000000046}
// *********************************************************************//
  IGraphVersion = interface(IDispatch)
    ['{000D1154-0000-0000-C000-000000000046}']
    procedure TypeLibVersionInfo(out pMajor: Integer; out pMinor: Integer); safecall;
    procedure FileVersionInfo(out pMajor: Integer; out pMinor: Integer; out pBuild: Integer; 
                              out pForwardMajor: Integer; out pForwardMinor: Integer; 
                              out pForwardBuild: Integer; out pBackwardMajor: Integer; 
                              out pBackwardMinor: Integer; out pBackwardBuild: Integer); safecall;
    function  IsCompatible(major: Integer; minor: Integer; build: Integer; forwardMajor: Integer; 
                           forwardMinor: Integer; forwardBuild: Integer): Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  IGraphVersionDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {000D1154-0000-0000-C000-000000000046}
// *********************************************************************//
  IGraphVersionDisp = dispinterface
    ['{000D1154-0000-0000-C000-000000000046}']
    procedure TypeLibVersionInfo(out pMajor: Integer; out pMinor: Integer); dispid 1610743808;
    procedure FileVersionInfo(out pMajor: Integer; out pMinor: Integer; out pBuild: Integer; 
                              out pForwardMajor: Integer; out pForwardMinor: Integer; 
                              out pForwardBuild: Integer; out pBackwardMajor: Integer; 
                              out pBackwardMinor: Integer; out pBackwardBuild: Integer); dispid 1610743809;
    function  IsCompatible(major: Integer; minor: Integer; build: Integer; forwardMajor: Integer; 
                           forwardMinor: Integer; forwardBuild: Integer): Integer; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: IGraphSite
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D1155-0000-0000-C000-000000000046}
// *********************************************************************//
  IGraphSite = interface(IDispatch)
    ['{000D1155-0000-0000-C000-000000000046}']
    procedure FoldToShape(shpID: LongWord; shpX: Double; shpY: Double; ptX: Double; ptY: Double; 
                          vecX: Double; vecY: Double; out foldX: Double; out foldY: Double; 
                          out bFound: Integer); safecall;
    procedure GetDisplayOrder(shpID: LongWord; out zOrder: Double); safecall;
  end;

// *********************************************************************//
// DispIntf:  IGraphSiteDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D1155-0000-0000-C000-000000000046}
// *********************************************************************//
  IGraphSiteDisp = dispinterface
    ['{000D1155-0000-0000-C000-000000000046}']
    procedure FoldToShape(shpID: LongWord; shpX: Double; shpY: Double; ptX: Double; ptY: Double; 
                          vecX: Double; vecY: Double; out foldX: Double; out foldY: Double; 
                          out bFound: Integer); dispid 1610743808;
    procedure GetDisplayOrder(shpID: LongWord; out zOrder: Double); dispid 1610743809;
  end;

// *********************************************************************//
// Interface: IGraph
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D1142-0000-0000-C000-000000000046}
// *********************************************************************//
  IGraph = interface(IDispatch)
    ['{000D1142-0000-0000-C000-000000000046}']
    function  Get_Nodes: INodes; safecall;
    function  Get_Edges: IEdges; safecall;
    function  Get_Properties: IGraphProps; safecall;
    procedure Layout; safecall;
    procedure LayoutSelected; safecall;
    procedure Place; safecall;
    procedure PlaceSelected; safecall;
    procedure Route; safecall;
    procedure RouteSelected; safecall;
    procedure Reroute; safecall;
    procedure Empty; safecall;
    procedure GetBoundingRect(out px0: Double; out py0: Double; out px1: Double; out py1: Double); safecall;
    function  Get_BoundingRect: IGraphRect; safecall;
    procedure Set_PlacementStyle(pstyle: Integer); safecall;
    function  Get_PlacementStyle: Integer; safecall;
    procedure Set_PlacementDepth(pdepth: Integer); safecall;
    function  Get_PlacementDepth: Integer; safecall;
    function  Get_PlacementDirection: Integer; safecall;
    procedure Set_RoutingStyle(pstyle: Integer); safecall;
    function  Get_RoutingStyle: Integer; safecall;
    procedure Set_Gridding(pflag: Smallint); safecall;
    function  Get_Gridding: Smallint; safecall;
    procedure SetBlockSize(x: Double; y: Double); safecall;
    procedure GetBlockSize(out px: Double; out py: Double); safecall;
    procedure SetAvenueSize(x: Double; y: Double); safecall;
    procedure GetAvenueSize(out px: Double; out py: Double); safecall;
    procedure SetNodeToNodeClearance(x: Double; y: Double); safecall;
    procedure GetNodeToNodeClearance(out px: Double; out py: Double); safecall;
    procedure SetLineToLineClearance(x: Double; y: Double); safecall;
    procedure GetLineToLineClearance(out px: Double; out py: Double); safecall;
    procedure SetLineToNodeClearance(x: Double; y: Double); safecall;
    procedure GetLineToNodeClearance(out px: Double; out py: Double); safecall;
    procedure SetMargins(x: Double; y: Double); safecall;
    procedure GetMargins(out px: Double; out py: Double); safecall;
    procedure SelectAll; safecall;
    procedure DeselectAll; safecall;
    function  CreateNodeList: INodeList; safecall;
    function  CreateEdgeList: IEdgeList; safecall;
    function  GetNearestNode(x: Double; y: Double; distance: Double): INode; safecall;
    function  GetNearestConnection(x: Double; y: Double; distance: Double): IConnection; safecall;
    procedure SetPageSize(x: Double; y: Double); safecall;
    procedure GetPageSize(out px: Double; out py: Double); safecall;
    procedure StartRecorder; safecall;
    procedure AppendRecorder; safecall;
    procedure StopRecorder; safecall;
    procedure OverrideRecorder(override: Integer); safecall;
    function  GetRecordedObjects: ILayoutObjectList; safecall;
    procedure SetRouteJumpType(Type_: Integer); safecall;
    procedure GetRouteJumpType(out ptype: Integer); safecall;
    function  GetNearestEdge(x: Double; y: Double; distance: Double): IEdge; safecall;
    procedure TranslateGraph(dx: Double; dy: Double); safecall;
    procedure Set_Loading(pflag: Smallint); safecall;
    function  Get_Loading: Smallint; safecall;
    procedure OnIdle; safecall;
    procedure Set_PageScale(ppageScale: Double); safecall;
    function  Get_PageScale: Double; safecall;
    procedure SetGraphSite(const pIGraphSite: IGraphSite); safecall;
    procedure SetLineJumpFactor(jumpFactorX: Double; jumpFactorY: Double); safecall;
    procedure GetLineJumpFactor(out pJumpFactorX: Double; out pJumpFactorY: Double); safecall;
    procedure SetRouteAdjustFrom(adjustCode: VGRouteAdjustCodes); safecall;
    procedure GetRouteAdjustFrom(out adjustCode: VGRouteAdjustCodes); safecall;
    procedure SetRouteAdjustTo(adjustCode: VGRouteAdjustCodes); safecall;
    procedure GetRouteAdjustTo(out adjustCode: VGRouteAdjustCodes); safecall;
    property Nodes: INodes read Get_Nodes;
    property Edges: IEdges read Get_Edges;
    property Properties: IGraphProps read Get_Properties;
    property BoundingRect: IGraphRect read Get_BoundingRect;
    property PlacementStyle: Integer write Set_PlacementStyle;
    property PlacementDepth: Integer write Set_PlacementDepth;
    property PlacementDirection: Integer read Get_PlacementDirection;
    property RoutingStyle: Integer write Set_RoutingStyle;
    property Gridding: Smallint write Set_Gridding;
    property Loading: Smallint write Set_Loading;
    property PageScale: Double write Set_PageScale;
  end;

// *********************************************************************//
// DispIntf:  IGraphDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D1142-0000-0000-C000-000000000046}
// *********************************************************************//
  IGraphDisp = dispinterface
    ['{000D1142-0000-0000-C000-000000000046}']
    property Nodes: INodes readonly dispid 1610743808;
    property Edges: IEdges readonly dispid 1610743809;
    property Properties: IGraphProps readonly dispid 1610743810;
    procedure Layout; dispid 1610743811;
    procedure LayoutSelected; dispid 1610743812;
    procedure Place; dispid 1610743813;
    procedure PlaceSelected; dispid 1610743814;
    procedure Route; dispid 1610743815;
    procedure RouteSelected; dispid 1610743816;
    procedure Reroute; dispid 1610743817;
    procedure Empty; dispid 1610743818;
    procedure GetBoundingRect(out px0: Double; out py0: Double; out px1: Double; out py1: Double); dispid 1610743819;
    property BoundingRect: IGraphRect readonly dispid 1610743820;
    property PlacementStyle: Integer writeonly dispid 1610743821;
    property PlacementDepth: Integer writeonly dispid 1610743823;
    property PlacementDirection: Integer readonly dispid 1610743825;
    property RoutingStyle: Integer writeonly dispid 1610743826;
    property Gridding: Smallint writeonly dispid 1610743828;
    procedure SetBlockSize(x: Double; y: Double); dispid 1610743830;
    procedure GetBlockSize(out px: Double; out py: Double); dispid 1610743831;
    procedure SetAvenueSize(x: Double; y: Double); dispid 1610743832;
    procedure GetAvenueSize(out px: Double; out py: Double); dispid 1610743833;
    procedure SetNodeToNodeClearance(x: Double; y: Double); dispid 1610743834;
    procedure GetNodeToNodeClearance(out px: Double; out py: Double); dispid 1610743835;
    procedure SetLineToLineClearance(x: Double; y: Double); dispid 1610743836;
    procedure GetLineToLineClearance(out px: Double; out py: Double); dispid 1610743837;
    procedure SetLineToNodeClearance(x: Double; y: Double); dispid 1610743838;
    procedure GetLineToNodeClearance(out px: Double; out py: Double); dispid 1610743839;
    procedure SetMargins(x: Double; y: Double); dispid 1610743840;
    procedure GetMargins(out px: Double; out py: Double); dispid 1610743841;
    procedure SelectAll; dispid 1610743842;
    procedure DeselectAll; dispid 1610743843;
    function  CreateNodeList: INodeList; dispid 1610743844;
    function  CreateEdgeList: IEdgeList; dispid 1610743845;
    function  GetNearestNode(x: Double; y: Double; distance: Double): INode; dispid 1610743846;
    function  GetNearestConnection(x: Double; y: Double; distance: Double): IConnection; dispid 1610743847;
    procedure SetPageSize(x: Double; y: Double); dispid 1610743848;
    procedure GetPageSize(out px: Double; out py: Double); dispid 1610743849;
    procedure StartRecorder; dispid 1610743850;
    procedure AppendRecorder; dispid 1610743851;
    procedure StopRecorder; dispid 1610743852;
    procedure OverrideRecorder(override: Integer); dispid 1610743853;
    function  GetRecordedObjects: ILayoutObjectList; dispid 1610743854;
    procedure SetRouteJumpType(Type_: Integer); dispid 1610743855;
    procedure GetRouteJumpType(out ptype: Integer); dispid 1610743856;
    function  GetNearestEdge(x: Double; y: Double; distance: Double): IEdge; dispid 1610743857;
    procedure TranslateGraph(dx: Double; dy: Double); dispid 1610743858;
    property Loading: Smallint writeonly dispid 1610743859;
    procedure OnIdle; dispid 1610743861;
    property PageScale: Double writeonly dispid 1610743862;
    procedure SetGraphSite(const pIGraphSite: IGraphSite); dispid 1610743864;
    procedure SetLineJumpFactor(jumpFactorX: Double; jumpFactorY: Double); dispid 1610743865;
    procedure GetLineJumpFactor(out pJumpFactorX: Double; out pJumpFactorY: Double); dispid 1610743866;
    procedure SetRouteAdjustFrom(adjustCode: VGRouteAdjustCodes); dispid 1610743867;
    procedure GetRouteAdjustFrom(out adjustCode: VGRouteAdjustCodes); dispid 1610743868;
    procedure SetRouteAdjustTo(adjustCode: VGRouteAdjustCodes); dispid 1610743869;
    procedure GetRouteAdjustTo(out adjustCode: VGRouteAdjustCodes); dispid 1610743870;
  end;

// *********************************************************************//
// Interface: INodes
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D1146-0000-0000-C000-000000000046}
// *********************************************************************//
  INodes = interface(IDispatch)
    ['{000D1146-0000-0000-C000-000000000046}']
    function  Get_Count: Integer; safecall;
    function  Get_Item(Item: OleVariant): INode; safecall;
    function  Get_ItemByID(ID: Integer): INode; safecall;
    function  Add: INode; safecall;
    procedure Remove(Item: OleVariant); safecall;
    procedure RemoveByID(ID: Integer); safecall;
    procedure RemoveAll; safecall;
    procedure SelectAll; safecall;
    procedure DeselectAll; safecall;
    procedure Init(const pContainer: IContainer); safecall;
    procedure Destroy; safecall;
    property Count: Integer read Get_Count;
    property Item[Item: OleVariant]: INode read Get_Item;
    property ItemByID[ID: Integer]: INode read Get_ItemByID;
  end;

// *********************************************************************//
// DispIntf:  INodesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D1146-0000-0000-C000-000000000046}
// *********************************************************************//
  INodesDisp = dispinterface
    ['{000D1146-0000-0000-C000-000000000046}']
    property Count: Integer readonly dispid 1610743808;
    property Item[Item: OleVariant]: INode readonly dispid 1610743809;
    property ItemByID[ID: Integer]: INode readonly dispid 1610743810;
    function  Add: INode; dispid 1610743811;
    procedure Remove(Item: OleVariant); dispid 1610743812;
    procedure RemoveByID(ID: Integer); dispid 1610743813;
    procedure RemoveAll; dispid 1610743814;
    procedure SelectAll; dispid 1610743815;
    procedure DeselectAll; dispid 1610743816;
    procedure Init(const pContainer: IContainer); dispid 1610743817;
    procedure Destroy; dispid 1610743818;
  end;

// *********************************************************************//
// Interface: ILayoutObject
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D1150-0000-0000-C000-000000000046}
// *********************************************************************//
  ILayoutObject = interface(IDispatch)
    ['{000D1150-0000-0000-C000-000000000046}']
    procedure Set_ID(pID: Integer); safecall;
    function  Get_ID: Integer; safecall;
    procedure Set_Name(const pname: WideString); safecall;
    function  Get_Name: WideString; safecall;
    procedure Set_Text(const ptext: WideString); safecall;
    function  Get_Text: WideString; safecall;
    procedure Set_Type_(ptype: Integer); safecall;
    function  Get_Type_: Integer; safecall;
    procedure Set_Width(px: Double); safecall;
    function  Get_Width: Double; safecall;
    procedure Set_Height(py: Double); safecall;
    function  Get_Height: Double; safecall;
    procedure Set_Select(pflag: Smallint); safecall;
    function  Get_Select: Smallint; safecall;
    procedure SetCenter(x: Double; y: Double); safecall;
    procedure GetCenter(out px: Double; out py: Double); safecall;
    procedure SetOldCenter(x: Double; y: Double); safecall;
    procedure GetOldCenter(out px: Double; out py: Double); safecall;
    procedure Set_Data1(pdata1: Integer); safecall;
    function  Get_Data1: Integer; safecall;
    procedure Ripup; safecall;
    function  Get_ArcLayoutObject: Integer; safecall;
    function  Get_Properties: IGraphProps; safecall;
    procedure Set_PlacementStyle(pstyle: Integer); safecall;
    function  Get_PlacementStyle: Integer; safecall;
    procedure Set_PlacementDepth(pdepth: Integer); safecall;
    function  Get_PlacementDepth: Integer; safecall;
    procedure Set_RoutingStyle(pstyle: Integer); safecall;
    function  Get_RoutingStyle: Integer; safecall;
    procedure Place(x: Double; y: Double; flags: Integer); safecall;
    function  Get_LayoutObjectType: VGObjectType; safecall;
    function  Get_Connections: IConnections; safecall;
    function  GetNearestNode(x: Double; y: Double; distance: Double): INode; safecall;
    function  GetNearestConnection(x: Double; y: Double; distance: Double): IConnection; safecall;
    function  GetNearestEdge(x: Double; y: Double; distance: Double): IEdge; safecall;
    function  Get_Container: IContainer; safecall;
    procedure Set_Fixed(pfixed: Integer); safecall;
    function  Get_Fixed: Integer; safecall;
    property ID: Integer write Set_ID;
    property Name: WideString write Set_Name;
    property Text: WideString write Set_Text;
    property Type_: Integer write Set_Type_;
    property Width: Double write Set_Width;
    property Height: Double write Set_Height;
    property Select: Smallint write Set_Select;
    property Data1: Integer write Set_Data1;
    property ArcLayoutObject: Integer read Get_ArcLayoutObject;
    property Properties: IGraphProps read Get_Properties;
    property PlacementStyle: Integer write Set_PlacementStyle;
    property PlacementDepth: Integer write Set_PlacementDepth;
    property RoutingStyle: Integer write Set_RoutingStyle;
    property LayoutObjectType: VGObjectType read Get_LayoutObjectType;
    property Connections: IConnections read Get_Connections;
    property Container: IContainer read Get_Container;
    property Fixed: Integer write Set_Fixed;
  end;

// *********************************************************************//
// DispIntf:  ILayoutObjectDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D1150-0000-0000-C000-000000000046}
// *********************************************************************//
  ILayoutObjectDisp = dispinterface
    ['{000D1150-0000-0000-C000-000000000046}']
    property ID: Integer writeonly dispid 1610743808;
    property Name: WideString writeonly dispid 1610743810;
    property Text: WideString writeonly dispid 1610743812;
    property Type_: Integer writeonly dispid 1610743814;
    property Width: Double writeonly dispid 1610743816;
    property Height: Double writeonly dispid 1610743818;
    property Select: Smallint writeonly dispid 1610743820;
    procedure SetCenter(x: Double; y: Double); dispid 1610743822;
    procedure GetCenter(out px: Double; out py: Double); dispid 1610743823;
    procedure SetOldCenter(x: Double; y: Double); dispid 1610743824;
    procedure GetOldCenter(out px: Double; out py: Double); dispid 1610743825;
    property Data1: Integer writeonly dispid 1610743826;
    procedure Ripup; dispid 1610743828;
    property ArcLayoutObject: Integer readonly dispid 1610743829;
    property Properties: IGraphProps readonly dispid 1610743830;
    property PlacementStyle: Integer writeonly dispid 1610743831;
    property PlacementDepth: Integer writeonly dispid 1610743833;
    property RoutingStyle: Integer writeonly dispid 1610743835;
    procedure Place(x: Double; y: Double; flags: Integer); dispid 1610743837;
    property LayoutObjectType: VGObjectType readonly dispid 1610743838;
    property Connections: IConnections readonly dispid 1610743839;
    function  GetNearestNode(x: Double; y: Double; distance: Double): INode; dispid 1610743840;
    function  GetNearestConnection(x: Double; y: Double; distance: Double): IConnection; dispid 1610743841;
    function  GetNearestEdge(x: Double; y: Double; distance: Double): IEdge; dispid 1610743842;
    property Container: IContainer readonly dispid 1610743843;
    property Fixed: Integer writeonly dispid 1610743844;
  end;

// *********************************************************************//
// Interface: INode
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D1145-0000-0000-C000-000000000046}
// *********************************************************************//
  INode = interface(ILayoutObject)
    ['{000D1145-0000-0000-C000-000000000046}']
    procedure GhostMethod_INode_0_0; safecall;
    procedure GhostMethod_INode_4_1; safecall;
    procedure GhostMethod_INode_8_2; safecall;
    procedure GhostMethod_INode_12_3; safecall;
    procedure GhostMethod_INode_16_4; safecall;
    procedure GhostMethod_INode_20_5; safecall;
    procedure GhostMethod_INode_24_6; safecall;
    procedure GhostMethod_INode_28_7; safecall;
    procedure GhostMethod_INode_32_8; safecall;
    procedure GhostMethod_INode_36_9; safecall;
    procedure GhostMethod_INode_40_10; safecall;
    procedure GhostMethod_INode_44_11; safecall;
    procedure GhostMethod_INode_48_12; safecall;
    procedure GhostMethod_INode_52_13; safecall;
    procedure GhostMethod_INode_56_14; safecall;
    procedure GhostMethod_INode_60_15; safecall;
    procedure GhostMethod_INode_64_16; safecall;
    procedure GhostMethod_INode_68_17; safecall;
    procedure GhostMethod_INode_72_18; safecall;
    procedure GhostMethod_INode_76_19; safecall;
    procedure GhostMethod_INode_80_20; safecall;
    procedure GhostMethod_INode_84_21; safecall;
    procedure GhostMethod_INode_88_22; safecall;
    procedure GhostMethod_INode_92_23; safecall;
    procedure GhostMethod_INode_96_24; safecall;
    procedure GhostMethod_INode_100_25; safecall;
    procedure GhostMethod_INode_104_26; safecall;
    procedure GhostMethod_INode_108_27; safecall;
    procedure GhostMethod_INode_112_28; safecall;
    procedure GhostMethod_INode_116_29; safecall;
    procedure GhostMethod_INode_120_30; safecall;
    procedure GhostMethod_INode_124_31; safecall;
    procedure GhostMethod_INode_128_32; safecall;
    procedure GhostMethod_INode_132_33; safecall;
    procedure GhostMethod_INode_136_34; safecall;
    procedure GhostMethod_INode_140_35; safecall;
    procedure GhostMethod_INode_144_36; safecall;
    procedure GhostMethod_INode_148_37; safecall;
    procedure GhostMethod_INode_152_38; safecall;
    procedure GhostMethod_INode_156_39; safecall;
    procedure GhostMethod_INode_160_40; safecall;
    procedure GhostMethod_INode_164_41; safecall;
    procedure GhostMethod_INode_168_42; safecall;
    procedure GhostMethod_INode_172_43; safecall;
    procedure GhostMethod_INode_176_44; safecall;
    function  GetAdjacentNodes(SuccessorOrPredecessor: VGConnectionType): INodeList; safecall;
    function  GetAdjacentEdges(SuccessorOrPredecessor: VGConnectionType): IEdgeList; safecall;
    function  GetNumAdjacentNodes(SuccessorOrPredecessor: VGConnectionType): Integer; safecall;
    function  GetAncestorNodes(SuccessorOrPredecessor: VGConnectionType; Height: Integer): INodeList; safecall;
    procedure Init(const pContainer: IContainer; const pNode: INode); safecall;
    procedure Destroy; safecall;
    function  Get_ArcLayoutNode: Integer; safecall;
    property ArcLayoutNode: Integer read Get_ArcLayoutNode;
  end;

// *********************************************************************//
// DispIntf:  INodeDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D1145-0000-0000-C000-000000000046}
// *********************************************************************//
  INodeDisp = dispinterface
    ['{000D1145-0000-0000-C000-000000000046}']
    procedure GhostMethod_INode_0_0; dispid 1610809396;
    procedure GhostMethod_INode_4_1; dispid 1610809397;
    procedure GhostMethod_INode_8_2; dispid 1610809398;
    procedure GhostMethod_INode_12_3; dispid 1610809399;
    procedure GhostMethod_INode_16_4; dispid 1610809400;
    procedure GhostMethod_INode_20_5; dispid 1610809401;
    procedure GhostMethod_INode_24_6; dispid 1610809402;
    procedure GhostMethod_INode_28_7; dispid 1610809351;
    procedure GhostMethod_INode_32_8; dispid 1610809352;
    procedure GhostMethod_INode_36_9; dispid 1610809353;
    procedure GhostMethod_INode_40_10; dispid 1610809354;
    procedure GhostMethod_INode_44_11; dispid 1610809355;
    procedure GhostMethod_INode_48_12; dispid 1610809356;
    procedure GhostMethod_INode_52_13; dispid 1610809357;
    procedure GhostMethod_INode_56_14; dispid 1610809358;
    procedure GhostMethod_INode_60_15; dispid 1610809359;
    procedure GhostMethod_INode_64_16; dispid 1610809360;
    procedure GhostMethod_INode_68_17; dispid 1610809361;
    procedure GhostMethod_INode_72_18; dispid 1610809362;
    procedure GhostMethod_INode_76_19; dispid 1610809363;
    procedure GhostMethod_INode_80_20; dispid 1610809364;
    procedure GhostMethod_INode_84_21; dispid 1610809365;
    procedure GhostMethod_INode_88_22; dispid 1610809366;
    procedure GhostMethod_INode_92_23; dispid 1610809367;
    procedure GhostMethod_INode_96_24; dispid 1610809368;
    procedure GhostMethod_INode_100_25; dispid 1610809369;
    procedure GhostMethod_INode_104_26; dispid 1610809370;
    procedure GhostMethod_INode_108_27; dispid 1610809371;
    procedure GhostMethod_INode_112_28; dispid 1610809372;
    procedure GhostMethod_INode_116_29; dispid 1610809373;
    procedure GhostMethod_INode_120_30; dispid 1610809374;
    procedure GhostMethod_INode_124_31; dispid 1610809375;
    procedure GhostMethod_INode_128_32; dispid 1610809376;
    procedure GhostMethod_INode_132_33; dispid 1610809377;
    procedure GhostMethod_INode_136_34; dispid 1610809378;
    procedure GhostMethod_INode_140_35; dispid 1610809379;
    procedure GhostMethod_INode_144_36; dispid 1610809380;
    procedure GhostMethod_INode_148_37; dispid 1610809381;
    procedure GhostMethod_INode_152_38; dispid 1610809382;
    procedure GhostMethod_INode_156_39; dispid 1610809383;
    procedure GhostMethod_INode_160_40; dispid 1610809384;
    procedure GhostMethod_INode_164_41; dispid 1610809385;
    procedure GhostMethod_INode_168_42; dispid 1610809386;
    procedure GhostMethod_INode_172_43; dispid 1610809387;
    procedure GhostMethod_INode_176_44; dispid 1610809388;
    function  GetAdjacentNodes(SuccessorOrPredecessor: VGConnectionType): INodeList; dispid 1610809344;
    function  GetAdjacentEdges(SuccessorOrPredecessor: VGConnectionType): IEdgeList; dispid 1610809345;
    function  GetNumAdjacentNodes(SuccessorOrPredecessor: VGConnectionType): Integer; dispid 1610809346;
    function  GetAncestorNodes(SuccessorOrPredecessor: VGConnectionType; Height: Integer): INodeList; dispid 1610809347;
    procedure Init(const pContainer: IContainer; const pNode: INode); dispid 1610809348;
    procedure Destroy; dispid 1610809349;
    property ArcLayoutNode: Integer readonly dispid 1610809350;
    property ID: Integer writeonly dispid 1610743808;
    property Name: WideString writeonly dispid 1610743810;
    property Text: WideString writeonly dispid 1610743812;
    property Type_: Integer writeonly dispid 1610743814;
    property Width: Double writeonly dispid 1610743816;
    property Height: Double writeonly dispid 1610743818;
    property Select: Smallint writeonly dispid 1610743820;
    procedure SetCenter(x: Double; y: Double); dispid 1610743822;
    procedure GetCenter(out px: Double; out py: Double); dispid 1610743823;
    procedure SetOldCenter(x: Double; y: Double); dispid 1610743824;
    procedure GetOldCenter(out px: Double; out py: Double); dispid 1610743825;
    property Data1: Integer writeonly dispid 1610743826;
    procedure Ripup; dispid 1610743828;
    property ArcLayoutObject: Integer readonly dispid 1610743829;
    property Properties: IGraphProps readonly dispid 1610743830;
    property PlacementStyle: Integer writeonly dispid 1610743831;
    property PlacementDepth: Integer writeonly dispid 1610743833;
    property RoutingStyle: Integer writeonly dispid 1610743835;
    procedure Place(x: Double; y: Double; flags: Integer); dispid 1610743837;
    property LayoutObjectType: VGObjectType readonly dispid 1610743838;
    property Connections: IConnections readonly dispid 1610743839;
    function  GetNearestNode(x: Double; y: Double; distance: Double): INode; dispid 1610743840;
    function  GetNearestConnection(x: Double; y: Double; distance: Double): IConnection; dispid 1610743841;
    function  GetNearestEdge(x: Double; y: Double; distance: Double): IEdge; dispid 1610743842;
    property Container: IContainer readonly dispid 1610743843;
    property Fixed: Integer writeonly dispid 1610743844;
  end;

// *********************************************************************//
// Interface: IGraphProps
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D114D-0000-0000-C000-000000000046}
// *********************************************************************//
  IGraphProps = interface(IDispatch)
    ['{000D114D-0000-0000-C000-000000000046}']
    function  Get_Count: Integer; safecall;
    procedure Set_Value(index: Integer; pvalue: OleVariant); safecall;
    function  Get_Value(index: Integer): OleVariant; safecall;
    property Count: Integer read Get_Count;
    property Value[index: Integer]: OleVariant write Set_Value;
  end;

// *********************************************************************//
// DispIntf:  IGraphPropsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D114D-0000-0000-C000-000000000046}
// *********************************************************************//
  IGraphPropsDisp = dispinterface
    ['{000D114D-0000-0000-C000-000000000046}']
    property Count: Integer readonly dispid 1610743808;
    property Value[index: Integer]: OleVariant writeonly dispid 1610743809;
  end;

// *********************************************************************//
// Interface: IConnections
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D114F-0000-0000-C000-000000000046}
// *********************************************************************//
  IConnections = interface(IDispatch)
    ['{000D114F-0000-0000-C000-000000000046}']
    function  Get_Count: Integer; safecall;
    function  Get_Item(Item: OleVariant): IConnection; safecall;
    function  Get_ItemByID(ID: Integer): IConnection; safecall;
    function  Add: IConnection; safecall;
    procedure Remove(Item: OleVariant); safecall;
    procedure RemoveByID(ID: Integer); safecall;
    procedure RemoveAll; safecall;
    procedure Init(const pLayObj: ILayoutObject); safecall;
    procedure Destroy; safecall;
    property Count: Integer read Get_Count;
    property Item[Item: OleVariant]: IConnection read Get_Item;
    property ItemByID[ID: Integer]: IConnection read Get_ItemByID;
  end;

// *********************************************************************//
// DispIntf:  IConnectionsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D114F-0000-0000-C000-000000000046}
// *********************************************************************//
  IConnectionsDisp = dispinterface
    ['{000D114F-0000-0000-C000-000000000046}']
    property Count: Integer readonly dispid 1610743808;
    property Item[Item: OleVariant]: IConnection readonly dispid 1610743809;
    property ItemByID[ID: Integer]: IConnection readonly dispid 1610743810;
    function  Add: IConnection; dispid 1610743811;
    procedure Remove(Item: OleVariant); dispid 1610743812;
    procedure RemoveByID(ID: Integer); dispid 1610743813;
    procedure RemoveAll; dispid 1610743814;
    procedure Init(const pLayObj: ILayoutObject); dispid 1610743815;
    procedure Destroy; dispid 1610743816;
  end;

// *********************************************************************//
// Interface: IConnection
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D114E-0000-0000-C000-000000000046}
// *********************************************************************//
  IConnection = interface(ILayoutObject)
    ['{000D114E-0000-0000-C000-000000000046}']
    procedure SetRelativePosition(x: Double; y: Double); safecall;
    procedure GetRelativePosition(out x: Double; out y: Double); safecall;
    function  Get_RelativePositionX: Double; safecall;
    function  Get_RelativePositionY: Double; safecall;
    procedure Set_Side(pside: Integer); safecall;
    function  Get_Side: Integer; safecall;
    procedure Set_InOut(pinout: Integer); safecall;
    function  Get_InOut: Integer; safecall;
    procedure Set_EscapeDir(pescapeDir: Integer); safecall;
    function  Get_EscapeDir: Integer; safecall;
    function  Get_Node: INode; safecall;
    function  Get_Edge: IEdge; safecall;
    function  Get_LayoutObject: ILayoutObject; safecall;
    procedure Init(const pLayObj: ILayoutObject); safecall;
    procedure Destroy; safecall;
    function  Get_ArcConnectionPoint: Integer; safecall;
    property RelativePositionX: Double read Get_RelativePositionX;
    property RelativePositionY: Double read Get_RelativePositionY;
    property Side: Integer write Set_Side;
    property InOut: Integer write Set_InOut;
    property EscapeDir: Integer write Set_EscapeDir;
    property Node: INode read Get_Node;
    property Edge: IEdge read Get_Edge;
    property LayoutObject: ILayoutObject read Get_LayoutObject;
    property ArcConnectionPoint: Integer read Get_ArcConnectionPoint;
  end;

// *********************************************************************//
// DispIntf:  IConnectionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D114E-0000-0000-C000-000000000046}
// *********************************************************************//
  IConnectionDisp = dispinterface
    ['{000D114E-0000-0000-C000-000000000046}']
    procedure SetRelativePosition(x: Double; y: Double); dispid 1610809344;
    procedure GetRelativePosition(out x: Double; out y: Double); dispid 1610809345;
    property RelativePositionX: Double readonly dispid 1610809346;
    property RelativePositionY: Double readonly dispid 1610809347;
    property Side: Integer writeonly dispid 1610809348;
    property InOut: Integer writeonly dispid 1610809350;
    property EscapeDir: Integer writeonly dispid 1610809352;
    property Node: INode readonly dispid 1610809354;
    property Edge: IEdge readonly dispid 1610809355;
    property LayoutObject: ILayoutObject readonly dispid 1610809356;
    procedure Init(const pLayObj: ILayoutObject); dispid 1610809357;
    procedure Destroy; dispid 1610809358;
    property ArcConnectionPoint: Integer readonly dispid 1610809359;
    property ID: Integer writeonly dispid 1610743808;
    property Name: WideString writeonly dispid 1610743810;
    property Text: WideString writeonly dispid 1610743812;
    property Type_: Integer writeonly dispid 1610743814;
    property Width: Double writeonly dispid 1610743816;
    property Height: Double writeonly dispid 1610743818;
    property Select: Smallint writeonly dispid 1610743820;
    procedure SetCenter(x: Double; y: Double); dispid 1610743822;
    procedure GetCenter(out px: Double; out py: Double); dispid 1610743823;
    procedure SetOldCenter(x: Double; y: Double); dispid 1610743824;
    procedure GetOldCenter(out px: Double; out py: Double); dispid 1610743825;
    property Data1: Integer writeonly dispid 1610743826;
    procedure Ripup; dispid 1610743828;
    property ArcLayoutObject: Integer readonly dispid 1610743829;
    property Properties: IGraphProps readonly dispid 1610743830;
    property PlacementStyle: Integer writeonly dispid 1610743831;
    property PlacementDepth: Integer writeonly dispid 1610743833;
    property RoutingStyle: Integer writeonly dispid 1610743835;
    procedure Place(x: Double; y: Double; flags: Integer); dispid 1610743837;
    property LayoutObjectType: VGObjectType readonly dispid 1610743838;
    property Connections: IConnections readonly dispid 1610743839;
    function  GetNearestNode(x: Double; y: Double; distance: Double): INode; dispid 1610743840;
    function  GetNearestConnection(x: Double; y: Double; distance: Double): IConnection; dispid 1610743841;
    function  GetNearestEdge(x: Double; y: Double; distance: Double): IEdge; dispid 1610743842;
    property Container: IContainer readonly dispid 1610743843;
    property Fixed: Integer writeonly dispid 1610743844;
  end;

// *********************************************************************//
// Interface: IEdge
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D1148-0000-0000-C000-000000000046}
// *********************************************************************//
  IEdge = interface(ILayoutObject)
    ['{000D1148-0000-0000-C000-000000000046}']
    function  Get_FromNode: INode; safecall;
    function  Get_ToNode: INode; safecall;
    procedure Set_FromNodeName(Param1: OleVariant); safecall;
    procedure Set_ToNodeName(Param1: OleVariant); safecall;
    procedure Set_FromNodeID(pID: Integer); safecall;
    function  Get_FromNodeID: Integer; safecall;
    procedure Set_ToNodeID(pID: Integer); safecall;
    function  Get_ToNodeID: Integer; safecall;
    function  Get_Points: IGraphPoints; safecall;
    procedure Set_Points(const ppIPoints: IGraphPoints); safecall;
    procedure Set_FromEndPoint(x: Double; Param2: Double); safecall;
    procedure Set_ToEndPoint(x: Double; Param2: Double); safecall;
    function  GetAdjacentNodes(SuccessorOrPredecessor: VGConnectionType): INodeList; safecall;
    procedure Init(const pContainer: IContainer; const pEdge: IEdge); safecall;
    function  Get_ArcLayoutLink: Integer; safecall;
    function  Get_FromConnectionID: Integer; safecall;
    function  Get_ToConnectionID: Integer; safecall;
    procedure Set_ImaginaryFromConnection(pflag: Smallint); safecall;
    function  Get_ImaginaryFromConnection: Smallint; safecall;
    procedure Set_ImaginaryToConnection(pflag: Smallint); safecall;
    function  Get_ImaginaryToConnection: Smallint; safecall;
    procedure Set_FixedFrom(pfixed: Smallint); safecall;
    function  Get_FixedFrom: Smallint; safecall;
    procedure Set_FixedTo(pfixed: Smallint); safecall;
    function  Get_FixedTo: Smallint; safecall;
    procedure RouteJIT(flag: Integer); safecall;
    procedure Set_FromEdgeID(pID: Integer); safecall;
    function  Get_FromEdgeID: Integer; safecall;
    procedure Set_ToEdgeID(pID: Integer); safecall;
    function  Get_ToEdgeID: Integer; safecall;
    procedure Set_FromLayoutObjectID(pID: Integer); safecall;
    function  Get_FromLayoutObjectID: Integer; safecall;
    procedure Set_ToLayoutObjectID(pID: Integer); safecall;
    function  Get_ToLayoutObjectID: Integer; safecall;
    function  Get_FromLayoutObject: ILayoutObject; safecall;
    function  Get_ToLayoutObject: ILayoutObject; safecall;
    procedure Destroy; safecall;
    function  Get_PointsNoJumps: IGraphPoints; safecall;
    function  can_put_LayoutObjectID(ID: Integer): Integer; safecall;
    function  Get_PointsEx: IGraphPointsEx; safecall;
    procedure Set_PointsEx(const ppIPoints: IGraphPointsEx); safecall;
    function  Get_PointsExNoJumps: IGraphPointsEx; safecall;
    procedure Set_RouteJumpType(jumpType: Integer); safecall;
    function  Get_RouteJumpType: Integer; safecall;
    procedure Set_EscapeFrom(pescapeDir: Integer); safecall;
    function  Get_EscapeFrom: Integer; safecall;
    procedure Set_EscapeTo(pescapeDir: Integer); safecall;
    function  Get_EscapeTo: Integer; safecall;
    procedure GetFromEndPoint(out px: Double; out py: Double); safecall;
    procedure GetToEndPoint(out px: Double; out py: Double); safecall;
    procedure AddToRecorder; safecall;
    procedure Set_FromConnectionID(pID: Integer); safecall;
    procedure Set_ToConnectionID(pID: Integer); safecall;
    property FromNode: INode read Get_FromNode;
    property ToNode: INode read Get_ToNode;
    property FromNodeName: OleVariant write Set_FromNodeName;
    property ToNodeName: OleVariant write Set_ToNodeName;
    property FromNodeID: Integer write Set_FromNodeID;
    property ToNodeID: Integer write Set_ToNodeID;
    property Points: IGraphPoints read Get_Points;
    property FromEndPoint[x: Double]: Double write Set_FromEndPoint;
    property ToEndPoint[x: Double]: Double write Set_ToEndPoint;
    property ArcLayoutLink: Integer read Get_ArcLayoutLink;
    property FromConnectionID: Integer read Get_FromConnectionID;
    property ToConnectionID: Integer read Get_ToConnectionID;
    property ImaginaryFromConnection: Smallint write Set_ImaginaryFromConnection;
    property ImaginaryToConnection: Smallint write Set_ImaginaryToConnection;
    property FixedFrom: Smallint write Set_FixedFrom;
    property FixedTo: Smallint write Set_FixedTo;
    property FromEdgeID: Integer write Set_FromEdgeID;
    property ToEdgeID: Integer write Set_ToEdgeID;
    property FromLayoutObjectID: Integer write Set_FromLayoutObjectID;
    property ToLayoutObjectID: Integer write Set_ToLayoutObjectID;
    property FromLayoutObject: ILayoutObject read Get_FromLayoutObject;
    property ToLayoutObject: ILayoutObject read Get_ToLayoutObject;
    property PointsNoJumps: IGraphPoints read Get_PointsNoJumps;
    property PointsEx: IGraphPointsEx read Get_PointsEx;
    property PointsExNoJumps: IGraphPointsEx read Get_PointsExNoJumps;
    property RouteJumpType: Integer write Set_RouteJumpType;
    property EscapeFrom: Integer write Set_EscapeFrom;
    property EscapeTo: Integer write Set_EscapeTo;
  end;

// *********************************************************************//
// DispIntf:  IEdgeDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D1148-0000-0000-C000-000000000046}
// *********************************************************************//
  IEdgeDisp = dispinterface
    ['{000D1148-0000-0000-C000-000000000046}']
    property FromNode: INode readonly dispid 1610809344;
    property ToNode: INode readonly dispid 1610809345;
    property FromNodeName: OleVariant writeonly dispid 1610809346;
    property ToNodeName: OleVariant writeonly dispid 1610809347;
    property FromNodeID: Integer writeonly dispid 1610809348;
    property ToNodeID: Integer writeonly dispid 1610809350;
    property Points: IGraphPoints readonly dispid 1610809352;
    property FromEndPoint[x: Double]: Double writeonly dispid 1610809354;
    property ToEndPoint[x: Double]: Double writeonly dispid 1610809355;
    function  GetAdjacentNodes(SuccessorOrPredecessor: VGConnectionType): INodeList; dispid 1610809356;
    procedure Init(const pContainer: IContainer; const pEdge: IEdge); dispid 1610809357;
    property ArcLayoutLink: Integer readonly dispid 1610809358;
    property FromConnectionID: Integer readonly dispid 1610809359;
    property ToConnectionID: Integer readonly dispid 1610809360;
    property ImaginaryFromConnection: Smallint writeonly dispid 1610809361;
    property ImaginaryToConnection: Smallint writeonly dispid 1610809363;
    property FixedFrom: Smallint writeonly dispid 1610809365;
    property FixedTo: Smallint writeonly dispid 1610809367;
    procedure RouteJIT(flag: Integer); dispid 1610809369;
    property FromEdgeID: Integer writeonly dispid 1610809370;
    property ToEdgeID: Integer writeonly dispid 1610809372;
    property FromLayoutObjectID: Integer writeonly dispid 1610809374;
    property ToLayoutObjectID: Integer writeonly dispid 1610809376;
    property FromLayoutObject: ILayoutObject readonly dispid 1610809378;
    property ToLayoutObject: ILayoutObject readonly dispid 1610809379;
    procedure Destroy; dispid 1610809380;
    property PointsNoJumps: IGraphPoints readonly dispid 1610809381;
    function  can_put_LayoutObjectID(ID: Integer): Integer; dispid 1610809382;
    property PointsEx: IGraphPointsEx readonly dispid 1610809383;
    property PointsExNoJumps: IGraphPointsEx readonly dispid 1610809385;
    property RouteJumpType: Integer writeonly dispid 1610809386;
    property EscapeFrom: Integer writeonly dispid 1610809388;
    property EscapeTo: Integer writeonly dispid 1610809390;
    procedure GetFromEndPoint(out px: Double; out py: Double); dispid 1610809392;
    procedure GetToEndPoint(out px: Double; out py: Double); dispid 1610809393;
    procedure AddToRecorder; dispid 1610809394;
    property ID: Integer writeonly dispid 1610743808;
    property Name: WideString writeonly dispid 1610743810;
    property Text: WideString writeonly dispid 1610743812;
    property Type_: Integer writeonly dispid 1610743814;
    property Width: Double writeonly dispid 1610743816;
    property Height: Double writeonly dispid 1610743818;
    property Select: Smallint writeonly dispid 1610743820;
    procedure SetCenter(x: Double; y: Double); dispid 1610743822;
    procedure GetCenter(out px: Double; out py: Double); dispid 1610743823;
    procedure SetOldCenter(x: Double; y: Double); dispid 1610743824;
    procedure GetOldCenter(out px: Double; out py: Double); dispid 1610743825;
    property Data1: Integer writeonly dispid 1610743826;
    procedure Ripup; dispid 1610743828;
    property ArcLayoutObject: Integer readonly dispid 1610743829;
    property Properties: IGraphProps readonly dispid 1610743830;
    property PlacementStyle: Integer writeonly dispid 1610743831;
    property PlacementDepth: Integer writeonly dispid 1610743833;
    property RoutingStyle: Integer writeonly dispid 1610743835;
    procedure Place(x: Double; y: Double; flags: Integer); dispid 1610743837;
    property LayoutObjectType: VGObjectType readonly dispid 1610743838;
    property Connections: IConnections readonly dispid 1610743839;
    function  GetNearestNode(x: Double; y: Double; distance: Double): INode; dispid 1610743840;
    function  GetNearestConnection(x: Double; y: Double; distance: Double): IConnection; dispid 1610743841;
    function  GetNearestEdge(x: Double; y: Double; distance: Double): IEdge; dispid 1610743842;
    property Container: IContainer readonly dispid 1610743843;
    property Fixed: Integer writeonly dispid 1610743844;
  end;

// *********************************************************************//
// Interface: IGraphPoints
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D114B-0000-0000-C000-000000000046}
// *********************************************************************//
  IGraphPoints = interface(IDispatch)
    ['{000D114B-0000-0000-C000-000000000046}']
    function  Get_Count: Integer; safecall;
    procedure Add(x: Double; y: Double); safecall;
    procedure Remove(index: Integer); safecall;
    procedure Put(index: Integer; x: Double; y: Double); safecall;
    procedure Get(index: Integer; out px: Double; out py: Double); safecall;
    procedure GetArray(out pArray: PSafeArray); safecall;
    procedure Init(var psa: PSafeArray); safecall;
    procedure PutArray(pArray: PSafeArray); safecall;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  IGraphPointsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D114B-0000-0000-C000-000000000046}
// *********************************************************************//
  IGraphPointsDisp = dispinterface
    ['{000D114B-0000-0000-C000-000000000046}']
    property Count: Integer readonly dispid 1610743808;
    procedure Add(x: Double; y: Double); dispid 1610743809;
    procedure Remove(index: Integer); dispid 1610743810;
    procedure Put(index: Integer; x: Double; y: Double); dispid 1610743811;
    procedure Get(index: Integer; out px: Double; out py: Double); dispid 1610743812;
    procedure GetArray(out pArray: {??PSafeArray} OleVariant); dispid 1610743813;
    procedure Init(var psa: {??PSafeArray} OleVariant); dispid 1610743814;
    procedure PutArray(pArray: {??PSafeArray} OleVariant); dispid 1610743815;
  end;

// *********************************************************************//
// Interface: INodeList
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D1147-0000-0000-C000-000000000046}
// *********************************************************************//
  INodeList = interface(IDispatch)
    ['{000D1147-0000-0000-C000-000000000046}']
    function  Get_Count: Integer; safecall;
    function  Get_Item(Item: OleVariant): INode; safecall;
    function  Get_ItemByID(ID: Integer): INode; safecall;
    procedure Add(const pINode: INode); safecall;
    procedure Remove(Item: OleVariant); safecall;
    procedure RemoveByID(ID: Integer); safecall;
    procedure RemoveAll; safecall;
    procedure SelectAll; safecall;
    procedure DeselectAll; safecall;
    procedure SetPlacementStyle(style: Integer); safecall;
    procedure SetPlacementDepth(depth: Integer); safecall;
    procedure SetRoutingStyle(style: Integer); safecall;
    procedure Init(const pContainer: IContainer); safecall;
    procedure Destroy; safecall;
    property Count: Integer read Get_Count;
    property Item[Item: OleVariant]: INode read Get_Item;
    property ItemByID[ID: Integer]: INode read Get_ItemByID;
  end;

// *********************************************************************//
// DispIntf:  INodeListDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D1147-0000-0000-C000-000000000046}
// *********************************************************************//
  INodeListDisp = dispinterface
    ['{000D1147-0000-0000-C000-000000000046}']
    property Count: Integer readonly dispid 1610743808;
    property Item[Item: OleVariant]: INode readonly dispid 1610743809;
    property ItemByID[ID: Integer]: INode readonly dispid 1610743810;
    procedure Add(const pINode: INode); dispid 1610743811;
    procedure Remove(Item: OleVariant); dispid 1610743812;
    procedure RemoveByID(ID: Integer); dispid 1610743813;
    procedure RemoveAll; dispid 1610743814;
    procedure SelectAll; dispid 1610743815;
    procedure DeselectAll; dispid 1610743816;
    procedure SetPlacementStyle(style: Integer); dispid 1610743817;
    procedure SetPlacementDepth(depth: Integer); dispid 1610743818;
    procedure SetRoutingStyle(style: Integer); dispid 1610743819;
    procedure Init(const pContainer: IContainer); dispid 1610743820;
    procedure Destroy; dispid 1610743821;
  end;

// *********************************************************************//
// Interface: IContainer
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D1144-0000-0000-C000-000000000046}
// *********************************************************************//
  IContainer = interface(IDispatch)
    ['{000D1144-0000-0000-C000-000000000046}']
    function  Get_Nodes: INodes; safecall;
    function  Get_Edges: IEdges; safecall;
    function  Get_Properties: IGraphProps; safecall;
    procedure Layout; safecall;
    procedure LayoutSelected; safecall;
    procedure Place; safecall;
    procedure PlaceSelected; safecall;
    procedure Route; safecall;
    procedure RouteSelected; safecall;
    procedure Reroute; safecall;
    procedure Empty; safecall;
    procedure GetBoundingRect(out px0: Double; out py0: Double; out px1: Double; out py1: Double); safecall;
    function  Get_BoundingRect: IGraphRect; safecall;
    procedure Set_PlacementStyle(pstyle: Integer); safecall;
    function  Get_PlacementStyle: Integer; safecall;
    procedure Set_PlacementDepth(pdepth: Integer); safecall;
    function  Get_PlacementDepth: Integer; safecall;
    function  Get_PlacementDirection: Integer; safecall;
    procedure Set_RoutingStyle(pstyle: Integer); safecall;
    function  Get_RoutingStyle: Integer; safecall;
    procedure Set_Gridding(pflag: Smallint); safecall;
    function  Get_Gridding: Smallint; safecall;
    procedure SetBlockSize(x: Double; y: Double); safecall;
    procedure GetBlockSize(out px: Double; out py: Double); safecall;
    procedure SetAvenueSize(x: Double; y: Double); safecall;
    procedure GetAvenueSize(out px: Double; out py: Double); safecall;
    procedure SetNodeToNodeClearance(x: Double; y: Double); safecall;
    procedure GetNodeToNodeClearance(out px: Double; out py: Double); safecall;
    procedure SetLineToLineClearance(x: Double; y: Double); safecall;
    procedure GetLineToLineClearance(out px: Double; out py: Double); safecall;
    procedure SetLineToNodeClearance(x: Double; y: Double); safecall;
    procedure GetLineToNodeClearance(out px: Double; out py: Double); safecall;
    procedure SetMargins(x: Double; y: Double); safecall;
    procedure GetMargins(out px: Double; out py: Double); safecall;
    procedure SelectAll; safecall;
    procedure DeselectAll; safecall;
    function  CreateNodeList: INodeList; safecall;
    function  CreateEdgeList: IEdgeList; safecall;
    function  GetNearestNode(x: Double; y: Double; distance: Double): INode; safecall;
    function  GetNearestConnection(x: Double; y: Double; distance: Double): IConnection; safecall;
    procedure Init(const pContainer: IContainer); safecall;
    procedure Destroy; safecall;
    function  Get_ArcLayoutContainer: Integer; safecall;
    function  Get_CContainer: Integer; safecall;
    procedure SetPageSize(x: Double; y: Double); safecall;
    procedure GetPageSize(out px: Double; out py: Double); safecall;
    procedure StartRecorder; safecall;
    procedure AppendRecorder; safecall;
    procedure StopRecorder; safecall;
    procedure OverrideRecorder(override: Integer); safecall;
    function  GetRecordedObjects: ILayoutObjectList; safecall;
    procedure SetRouteJumpType(Type_: Integer); safecall;
    procedure GetRouteJumpType(out ptype: Integer); safecall;
    function  GetNearestEdge(x: Double; y: Double; distance: Double): IEdge; safecall;
    procedure TranslateGraph(dx: Double; dy: Double); safecall;
    procedure Set_Loading(pflag: Smallint); safecall;
    function  Get_Loading: Smallint; safecall;
    procedure OnIdle; safecall;
    procedure Set_PageScale(ppageScale: Double); safecall;
    function  Get_PageScale: Double; safecall;
    procedure SetGraphSite(const pIGraphSite: IGraphSite); safecall;
    procedure SetLineJumpFactor(jumpFactorX: Double; jumpFactorY: Double); safecall;
    procedure GetLineJumpFactor(out pJumpFactorX: Double; out pJumpFactorY: Double); safecall;
    procedure SetRouteAdjustFrom(adjustCode: VGRouteAdjustCodes); safecall;
    procedure GetRouteAdjustFrom(out adjustCode: VGRouteAdjustCodes); safecall;
    procedure SetRouteAdjustTo(adjustCode: VGRouteAdjustCodes); safecall;
    procedure GetRouteAdjustTo(out adjustCode: VGRouteAdjustCodes); safecall;
    property Nodes: INodes read Get_Nodes;
    property Edges: IEdges read Get_Edges;
    property Properties: IGraphProps read Get_Properties;
    property BoundingRect: IGraphRect read Get_BoundingRect;
    property PlacementStyle: Integer write Set_PlacementStyle;
    property PlacementDepth: Integer write Set_PlacementDepth;
    property PlacementDirection: Integer read Get_PlacementDirection;
    property RoutingStyle: Integer write Set_RoutingStyle;
    property Gridding: Smallint write Set_Gridding;
    property ArcLayoutContainer: Integer read Get_ArcLayoutContainer;
    property CContainer: Integer read Get_CContainer;
    property Loading: Smallint write Set_Loading;
    property PageScale: Double write Set_PageScale;
  end;

// *********************************************************************//
// DispIntf:  IContainerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D1144-0000-0000-C000-000000000046}
// *********************************************************************//
  IContainerDisp = dispinterface
    ['{000D1144-0000-0000-C000-000000000046}']
    property Nodes: INodes readonly dispid 1610743808;
    property Edges: IEdges readonly dispid 1610743809;
    property Properties: IGraphProps readonly dispid 1610743810;
    procedure Layout; dispid 1610743811;
    procedure LayoutSelected; dispid 1610743812;
    procedure Place; dispid 1610743813;
    procedure PlaceSelected; dispid 1610743814;
    procedure Route; dispid 1610743815;
    procedure RouteSelected; dispid 1610743816;
    procedure Reroute; dispid 1610743817;
    procedure Empty; dispid 1610743818;
    procedure GetBoundingRect(out px0: Double; out py0: Double; out px1: Double; out py1: Double); dispid 1610743819;
    property BoundingRect: IGraphRect readonly dispid 1610743820;
    property PlacementStyle: Integer writeonly dispid 1610743821;
    property PlacementDepth: Integer writeonly dispid 1610743823;
    property PlacementDirection: Integer readonly dispid 1610743825;
    property RoutingStyle: Integer writeonly dispid 1610743826;
    property Gridding: Smallint writeonly dispid 1610743828;
    procedure SetBlockSize(x: Double; y: Double); dispid 1610743830;
    procedure GetBlockSize(out px: Double; out py: Double); dispid 1610743831;
    procedure SetAvenueSize(x: Double; y: Double); dispid 1610743832;
    procedure GetAvenueSize(out px: Double; out py: Double); dispid 1610743833;
    procedure SetNodeToNodeClearance(x: Double; y: Double); dispid 1610743834;
    procedure GetNodeToNodeClearance(out px: Double; out py: Double); dispid 1610743835;
    procedure SetLineToLineClearance(x: Double; y: Double); dispid 1610743836;
    procedure GetLineToLineClearance(out px: Double; out py: Double); dispid 1610743837;
    procedure SetLineToNodeClearance(x: Double; y: Double); dispid 1610743838;
    procedure GetLineToNodeClearance(out px: Double; out py: Double); dispid 1610743839;
    procedure SetMargins(x: Double; y: Double); dispid 1610743840;
    procedure GetMargins(out px: Double; out py: Double); dispid 1610743841;
    procedure SelectAll; dispid 1610743842;
    procedure DeselectAll; dispid 1610743843;
    function  CreateNodeList: INodeList; dispid 1610743844;
    function  CreateEdgeList: IEdgeList; dispid 1610743845;
    function  GetNearestNode(x: Double; y: Double; distance: Double): INode; dispid 1610743846;
    function  GetNearestConnection(x: Double; y: Double; distance: Double): IConnection; dispid 1610743847;
    procedure Init(const pContainer: IContainer); dispid 1610743848;
    procedure Destroy; dispid 1610743849;
    property ArcLayoutContainer: Integer readonly dispid 1610743850;
    property CContainer: Integer readonly dispid 1610743851;
    procedure SetPageSize(x: Double; y: Double); dispid 1610743852;
    procedure GetPageSize(out px: Double; out py: Double); dispid 1610743853;
    procedure StartRecorder; dispid 1610743854;
    procedure AppendRecorder; dispid 1610743855;
    procedure StopRecorder; dispid 1610743856;
    procedure OverrideRecorder(override: Integer); dispid 1610743857;
    function  GetRecordedObjects: ILayoutObjectList; dispid 1610743858;
    procedure SetRouteJumpType(Type_: Integer); dispid 1610743859;
    procedure GetRouteJumpType(out ptype: Integer); dispid 1610743860;
    function  GetNearestEdge(x: Double; y: Double; distance: Double): IEdge; dispid 1610743861;
    procedure TranslateGraph(dx: Double; dy: Double); dispid 1610743862;
    property Loading: Smallint writeonly dispid 1610743863;
    procedure OnIdle; dispid 1610743865;
    property PageScale: Double writeonly dispid 1610743866;
    procedure SetGraphSite(const pIGraphSite: IGraphSite); dispid 1610743868;
    procedure SetLineJumpFactor(jumpFactorX: Double; jumpFactorY: Double); dispid 1610743869;
    procedure GetLineJumpFactor(out pJumpFactorX: Double; out pJumpFactorY: Double); dispid 1610743870;
    procedure SetRouteAdjustFrom(adjustCode: VGRouteAdjustCodes); dispid 1610743871;
    procedure GetRouteAdjustFrom(out adjustCode: VGRouteAdjustCodes); dispid 1610743872;
    procedure SetRouteAdjustTo(adjustCode: VGRouteAdjustCodes); dispid 1610743873;
    procedure GetRouteAdjustTo(out adjustCode: VGRouteAdjustCodes); dispid 1610743874;
  end;

// *********************************************************************//
// Interface: IEdges
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D1149-0000-0000-C000-000000000046}
// *********************************************************************//
  IEdges = interface(IDispatch)
    ['{000D1149-0000-0000-C000-000000000046}']
    function  Get_Count: Integer; safecall;
    function  Get_Item(Item: OleVariant): IEdge; safecall;
    function  Get_ItemByID(ID: Integer): IEdge; safecall;
    function  Add: IEdge; safecall;
    procedure Remove(Item: OleVariant); safecall;
    procedure RemoveByID(ID: Integer); safecall;
    procedure RemoveAll; safecall;
    procedure SelectAll; safecall;
    procedure DeselectAll; safecall;
    procedure Init(const pContainer: IContainer); safecall;
    procedure Destroy; safecall;
    property Count: Integer read Get_Count;
    property Item[Item: OleVariant]: IEdge read Get_Item;
    property ItemByID[ID: Integer]: IEdge read Get_ItemByID;
  end;

// *********************************************************************//
// DispIntf:  IEdgesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D1149-0000-0000-C000-000000000046}
// *********************************************************************//
  IEdgesDisp = dispinterface
    ['{000D1149-0000-0000-C000-000000000046}']
    property Count: Integer readonly dispid 1610743808;
    property Item[Item: OleVariant]: IEdge readonly dispid 1610743809;
    property ItemByID[ID: Integer]: IEdge readonly dispid 1610743810;
    function  Add: IEdge; dispid 1610743811;
    procedure Remove(Item: OleVariant); dispid 1610743812;
    procedure RemoveByID(ID: Integer); dispid 1610743813;
    procedure RemoveAll; dispid 1610743814;
    procedure SelectAll; dispid 1610743815;
    procedure DeselectAll; dispid 1610743816;
    procedure Init(const pContainer: IContainer); dispid 1610743817;
    procedure Destroy; dispid 1610743818;
  end;

// *********************************************************************//
// Interface: IGraphRect
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D114C-0000-0000-C000-000000000046}
// *********************************************************************//
  IGraphRect = interface(IDispatch)
    ['{000D114C-0000-0000-C000-000000000046}']
    procedure Set_Left(px: Double); safecall;
    function  Get_Left: Double; safecall;
    procedure Set_Top(py: Double); safecall;
    function  Get_Top: Double; safecall;
    procedure Set_Right(px: Double); safecall;
    function  Get_Right: Double; safecall;
    procedure Set_Bottom(py: Double); safecall;
    function  Get_Bottom: Double; safecall;
    procedure Set_x(px: Double); safecall;
    function  Get_x: Double; safecall;
    procedure Set_y(py: Double); safecall;
    function  Get_y: Double; safecall;
    procedure Set_Width(px: Double); safecall;
    function  Get_Width: Double; safecall;
    procedure Set_Height(py: Double); safecall;
    function  Get_Height: Double; safecall;
    property Left: Double write Set_Left;
    property Top: Double write Set_Top;
    property Right: Double write Set_Right;
    property Bottom: Double write Set_Bottom;
    property x: Double write Set_x;
    property y: Double write Set_y;
    property Width: Double write Set_Width;
    property Height: Double write Set_Height;
  end;

// *********************************************************************//
// DispIntf:  IGraphRectDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D114C-0000-0000-C000-000000000046}
// *********************************************************************//
  IGraphRectDisp = dispinterface
    ['{000D114C-0000-0000-C000-000000000046}']
    property Left: Double writeonly dispid 1610743808;
    property Top: Double writeonly dispid 1610743810;
    property Right: Double writeonly dispid 1610743812;
    property Bottom: Double writeonly dispid 1610743814;
    property x: Double writeonly dispid 1610743816;
    property y: Double writeonly dispid 1610743818;
    property Width: Double writeonly dispid 1610743820;
    property Height: Double writeonly dispid 1610743822;
  end;

// *********************************************************************//
// Interface: IEdgeList
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D114A-0000-0000-C000-000000000046}
// *********************************************************************//
  IEdgeList = interface(IDispatch)
    ['{000D114A-0000-0000-C000-000000000046}']
    function  Get_Count: Integer; safecall;
    function  Get_Item(Item: OleVariant): IEdge; safecall;
    function  Get_ItemByID(ID: Integer): IEdge; safecall;
    procedure Add(const pEdge: IEdge); safecall;
    procedure Remove(Item: OleVariant); safecall;
    procedure RemoveByID(ID: Integer); safecall;
    procedure RemoveAll; safecall;
    procedure SelectAll; safecall;
    procedure DeselectAll; safecall;
    procedure SetPlacementStyle(style: Integer); safecall;
    procedure SetPlacementDepth(depth: Integer); safecall;
    procedure SetRoutingStyle(style: Integer); safecall;
    procedure Init(const pContainer: IContainer); safecall;
    procedure Destroy; safecall;
    property Count: Integer read Get_Count;
    property Item[Item: OleVariant]: IEdge read Get_Item;
    property ItemByID[ID: Integer]: IEdge read Get_ItemByID;
  end;

// *********************************************************************//
// DispIntf:  IEdgeListDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D114A-0000-0000-C000-000000000046}
// *********************************************************************//
  IEdgeListDisp = dispinterface
    ['{000D114A-0000-0000-C000-000000000046}']
    property Count: Integer readonly dispid 1610743808;
    property Item[Item: OleVariant]: IEdge readonly dispid 1610743809;
    property ItemByID[ID: Integer]: IEdge readonly dispid 1610743810;
    procedure Add(const pEdge: IEdge); dispid 1610743811;
    procedure Remove(Item: OleVariant); dispid 1610743812;
    procedure RemoveByID(ID: Integer); dispid 1610743813;
    procedure RemoveAll; dispid 1610743814;
    procedure SelectAll; dispid 1610743815;
    procedure DeselectAll; dispid 1610743816;
    procedure SetPlacementStyle(style: Integer); dispid 1610743817;
    procedure SetPlacementDepth(depth: Integer); dispid 1610743818;
    procedure SetRoutingStyle(style: Integer); dispid 1610743819;
    procedure Init(const pContainer: IContainer); dispid 1610743820;
    procedure Destroy; dispid 1610743821;
  end;

// *********************************************************************//
// Interface: ILayoutObjectList
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D1151-0000-0000-C000-000000000046}
// *********************************************************************//
  ILayoutObjectList = interface(IDispatch)
    ['{000D1151-0000-0000-C000-000000000046}']
    function  Get_Count: Integer; safecall;
    function  Get_Item(Item: OleVariant): ILayoutObject; safecall;
    function  Get_ItemByID(ID: Integer): ILayoutObject; safecall;
    procedure Add(Item: OleVariant); safecall;
    procedure Remove(Item: OleVariant); safecall;
    procedure RemoveAll; safecall;
    procedure SelectAll; safecall;
    procedure DeselectAll; safecall;
    procedure SetPlacementStyle(style: Integer); safecall;
    procedure SetPlacementDepth(depth: Integer); safecall;
    procedure SetRoutingStyle(style: Integer); safecall;
    procedure Ripup; safecall;
    procedure Init(const pContainer: IContainer); safecall;
    procedure Destroy; safecall;
    property Count: Integer read Get_Count;
    property Item[Item: OleVariant]: ILayoutObject read Get_Item;
    property ItemByID[ID: Integer]: ILayoutObject read Get_ItemByID;
  end;

// *********************************************************************//
// DispIntf:  ILayoutObjectListDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D1151-0000-0000-C000-000000000046}
// *********************************************************************//
  ILayoutObjectListDisp = dispinterface
    ['{000D1151-0000-0000-C000-000000000046}']
    property Count: Integer readonly dispid 1610743808;
    property Item[Item: OleVariant]: ILayoutObject readonly dispid 1610743809;
    property ItemByID[ID: Integer]: ILayoutObject readonly dispid 1610743810;
    procedure Add(Item: OleVariant); dispid 1610743811;
    procedure Remove(Item: OleVariant); dispid 1610743812;
    procedure RemoveAll; dispid 1610743813;
    procedure SelectAll; dispid 1610743814;
    procedure DeselectAll; dispid 1610743815;
    procedure SetPlacementStyle(style: Integer); dispid 1610743816;
    procedure SetPlacementDepth(depth: Integer); dispid 1610743817;
    procedure SetRoutingStyle(style: Integer); dispid 1610743818;
    procedure Ripup; dispid 1610743819;
    procedure Init(const pContainer: IContainer); dispid 1610743820;
    procedure Destroy; dispid 1610743821;
  end;

// *********************************************************************//
// Interface: IGraphPointsEx
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D1153-0000-0000-C000-000000000046}
// *********************************************************************//
  IGraphPointsEx = interface(IDispatch)
    ['{000D1153-0000-0000-C000-000000000046}']
    function  Get_Count: Integer; safecall;
    procedure Add(x: Double; y: Double; flag: Integer); safecall;
    procedure Remove(index: Integer); safecall;
    procedure Put(index: Integer; x: Double; y: Double; flag: Integer); safecall;
    procedure Get(index: Integer; out px: Double; out py: Double; out pflag: Integer); safecall;
    procedure GetArray(out pArray: PSafeArray); safecall;
    procedure Init(var psa: PSafeArray); safecall;
    procedure PutArray(pArray: PSafeArray); safecall;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  IGraphPointsExDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {000D1153-0000-0000-C000-000000000046}
// *********************************************************************//
  IGraphPointsExDisp = dispinterface
    ['{000D1153-0000-0000-C000-000000000046}']
    property Count: Integer readonly dispid 1610743808;
    procedure Add(x: Double; y: Double; flag: Integer); dispid 1610743809;
    procedure Remove(index: Integer); dispid 1610743810;
    procedure Put(index: Integer; x: Double; y: Double; flag: Integer); dispid 1610743811;
    procedure Get(index: Integer; out px: Double; out py: Double; out pflag: Integer); dispid 1610743812;
    procedure GetArray(out pArray: {??PSafeArray} OleVariant); dispid 1610743813;
    procedure Init(var psa: {??PSafeArray} OleVariant); dispid 1610743814;
    procedure PutArray(pArray: {??PSafeArray} OleVariant); dispid 1610743815;
  end;

// *********************************************************************//
// The Class CoVisioGraph provides a Create and CreateRemote method to          
// create instances of the default interface IGraph exposed by              
// the CoClass VisioGraph. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoVisioGraph = class
    class function Create: IGraph;
    class function CreateRemote(const MachineName: string): IGraph;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TVisioGraph
// Help String      : Graph Class
// Default Interface: IGraph
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TVisioGraphProperties= class;
{$ENDIF}
  TVisioGraph = class(TOleServer)
  private
    FIntf:        IGraph;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TVisioGraphProperties;
    function      GetServerProperties: TVisioGraphProperties;
{$ENDIF}
    function      GetDefaultInterface: IGraph;
  protected
    procedure InitServerData; override;
    function  Get_Nodes: INodes;
    function  Get_Edges: IEdges;
    function  Get_Properties: IGraphProps;
    function  Get_BoundingRect: IGraphRect;
    procedure Set_PlacementStyle(pstyle: Integer);
    function  Get_PlacementStyle: Integer;
    procedure Set_PlacementDepth(pdepth: Integer);
    function  Get_PlacementDepth: Integer;
    function  Get_PlacementDirection: Integer;
    procedure Set_RoutingStyle(pstyle: Integer);
    function  Get_RoutingStyle: Integer;
    procedure Set_Gridding(pflag: Smallint);
    function  Get_Gridding: Smallint;
    procedure Set_Loading(pflag: Smallint);
    function  Get_Loading: Smallint;
    procedure Set_PageScale(ppageScale: Double);
    function  Get_PageScale: Double;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IGraph);
    procedure Disconnect; override;
    procedure Layout;
    procedure LayoutSelected;
    procedure Place;
    procedure PlaceSelected;
    procedure Route;
    procedure RouteSelected;
    procedure Reroute;
    procedure Empty;
    procedure GetBoundingRect(out px0: Double; out py0: Double; out px1: Double; out py1: Double);
    procedure SetBlockSize(x: Double; y: Double);
    procedure GetBlockSize(out px: Double; out py: Double);
    procedure SetAvenueSize(x: Double; y: Double);
    procedure GetAvenueSize(out px: Double; out py: Double);
    procedure SetNodeToNodeClearance(x: Double; y: Double);
    procedure GetNodeToNodeClearance(out px: Double; out py: Double);
    procedure SetLineToLineClearance(x: Double; y: Double);
    procedure GetLineToLineClearance(out px: Double; out py: Double);
    procedure SetLineToNodeClearance(x: Double; y: Double);
    procedure GetLineToNodeClearance(out px: Double; out py: Double);
    procedure SetMargins(x: Double; y: Double);
    procedure GetMargins(out px: Double; out py: Double);
    procedure SelectAll;
    procedure DeselectAll;
    function  CreateNodeList: INodeList;
    function  CreateEdgeList: IEdgeList;
    function  GetNearestNode(x: Double; y: Double; distance: Double): INode;
    function  GetNearestConnection(x: Double; y: Double; distance: Double): IConnection;
    procedure SetPageSize(x: Double; y: Double);
    procedure GetPageSize(out px: Double; out py: Double);
    procedure StartRecorder;
    procedure AppendRecorder;
    procedure StopRecorder;
    procedure OverrideRecorder(override: Integer);
    function  GetRecordedObjects: ILayoutObjectList;
    procedure SetRouteJumpType(Type_: Integer);
    procedure GetRouteJumpType(out ptype: Integer);
    function  GetNearestEdge(x: Double; y: Double; distance: Double): IEdge;
    procedure TranslateGraph(dx: Double; dy: Double);
    procedure OnIdle;
    procedure SetGraphSite(const pIGraphSite: IGraphSite);
    procedure SetLineJumpFactor(jumpFactorX: Double; jumpFactorY: Double);
    procedure GetLineJumpFactor(out pJumpFactorX: Double; out pJumpFactorY: Double);
    procedure SetRouteAdjustFrom(adjustCode: VGRouteAdjustCodes);
    procedure GetRouteAdjustFrom(out adjustCode: VGRouteAdjustCodes);
    procedure SetRouteAdjustTo(adjustCode: VGRouteAdjustCodes);
    procedure GetRouteAdjustTo(out adjustCode: VGRouteAdjustCodes);
    property  DefaultInterface: IGraph read GetDefaultInterface;
    property Nodes: INodes read Get_Nodes;
    property Edges: IEdges read Get_Edges;
    property Properties: IGraphProps read Get_Properties;
    property BoundingRect: IGraphRect read Get_BoundingRect;
    property PlacementDirection: Integer read Get_PlacementDirection;
    property PlacementStyle: Integer read Get_PlacementStyle write Set_PlacementStyle;
    property PlacementDepth: Integer read Get_PlacementDepth write Set_PlacementDepth;
    property RoutingStyle: Integer read Get_RoutingStyle write Set_RoutingStyle;
    property Gridding: Smallint read Get_Gridding write Set_Gridding;
    property Loading: Smallint read Get_Loading write Set_Loading;
    property PageScale: Double read Get_PageScale write Set_PageScale;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TVisioGraphProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TVisioGraph
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TVisioGraphProperties = class(TPersistent)
  private
    FServer:    TVisioGraph;
    function    GetDefaultInterface: IGraph;
    constructor Create(AServer: TVisioGraph);
  protected
    function  Get_Nodes: INodes;
    function  Get_Edges: IEdges;
    function  Get_Properties: IGraphProps;
    function  Get_BoundingRect: IGraphRect;
    procedure Set_PlacementStyle(pstyle: Integer);
    function  Get_PlacementStyle: Integer;
    procedure Set_PlacementDepth(pdepth: Integer);
    function  Get_PlacementDepth: Integer;
    function  Get_PlacementDirection: Integer;
    procedure Set_RoutingStyle(pstyle: Integer);
    function  Get_RoutingStyle: Integer;
    procedure Set_Gridding(pflag: Smallint);
    function  Get_Gridding: Smallint;
    procedure Set_Loading(pflag: Smallint);
    function  Get_Loading: Smallint;
    procedure Set_PageScale(ppageScale: Double);
    function  Get_PageScale: Double;
  public
    property DefaultInterface: IGraph read GetDefaultInterface;
  published
    property PlacementStyle: Integer read Get_PlacementStyle write Set_PlacementStyle;
    property PlacementDepth: Integer read Get_PlacementDepth write Set_PlacementDepth;
    property RoutingStyle: Integer read Get_RoutingStyle write Set_RoutingStyle;
    property Gridding: Smallint read Get_Gridding write Set_Gridding;
    property Loading: Smallint read Get_Loading write Set_Loading;
    property PageScale: Double read Get_PageScale write Set_PageScale;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoVisioContainer provides a Create and CreateRemote method to          
// create instances of the default interface IContainer exposed by              
// the CoClass VisioContainer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoVisioContainer = class
    class function Create: IContainer;
    class function CreateRemote(const MachineName: string): IContainer;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TVisioContainer
// Help String      : Container Class
// Default Interface: IContainer
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TVisioContainerProperties= class;
{$ENDIF}
  TVisioContainer = class(TOleServer)
  private
    FIntf:        IContainer;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TVisioContainerProperties;
    function      GetServerProperties: TVisioContainerProperties;
{$ENDIF}
    function      GetDefaultInterface: IContainer;
  protected
    procedure InitServerData; override;
    function  Get_Nodes: INodes;
    function  Get_Edges: IEdges;
    function  Get_Properties: IGraphProps;
    function  Get_BoundingRect: IGraphRect;
    procedure Set_PlacementStyle(pstyle: Integer);
    function  Get_PlacementStyle: Integer;
    procedure Set_PlacementDepth(pdepth: Integer);
    function  Get_PlacementDepth: Integer;
    function  Get_PlacementDirection: Integer;
    procedure Set_RoutingStyle(pstyle: Integer);
    function  Get_RoutingStyle: Integer;
    procedure Set_Gridding(pflag: Smallint);
    function  Get_Gridding: Smallint;
    procedure Set_Loading(pflag: Smallint);
    function  Get_Loading: Smallint;
    procedure Set_PageScale(ppageScale: Double);
    function  Get_PageScale: Double;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IContainer);
    procedure Disconnect; override;
    procedure Layout;
    procedure LayoutSelected;
    procedure Place;
    procedure PlaceSelected;
    procedure Route;
    procedure RouteSelected;
    procedure Reroute;
    procedure Empty;
    procedure GetBoundingRect(out px0: Double; out py0: Double; out px1: Double; out py1: Double);
    procedure SetBlockSize(x: Double; y: Double);
    procedure GetBlockSize(out px: Double; out py: Double);
    procedure SetAvenueSize(x: Double; y: Double);
    procedure GetAvenueSize(out px: Double; out py: Double);
    procedure SetNodeToNodeClearance(x: Double; y: Double);
    procedure GetNodeToNodeClearance(out px: Double; out py: Double);
    procedure SetLineToLineClearance(x: Double; y: Double);
    procedure GetLineToLineClearance(out px: Double; out py: Double);
    procedure SetLineToNodeClearance(x: Double; y: Double);
    procedure GetLineToNodeClearance(out px: Double; out py: Double);
    procedure SetMargins(x: Double; y: Double);
    procedure GetMargins(out px: Double; out py: Double);
    procedure SelectAll;
    procedure DeselectAll;
    function  CreateNodeList: INodeList;
    function  CreateEdgeList: IEdgeList;
    function  GetNearestNode(x: Double; y: Double; distance: Double): INode;
    function  GetNearestConnection(x: Double; y: Double; distance: Double): IConnection;
    procedure SetPageSize(x: Double; y: Double);
    procedure GetPageSize(out px: Double; out py: Double);
    procedure StartRecorder;
    procedure AppendRecorder;
    procedure StopRecorder;
    procedure OverrideRecorder(override: Integer);
    function  GetRecordedObjects: ILayoutObjectList;
    procedure SetRouteJumpType(Type_: Integer);
    procedure GetRouteJumpType(out ptype: Integer);
    function  GetNearestEdge(x: Double; y: Double; distance: Double): IEdge;
    procedure TranslateGraph(dx: Double; dy: Double);
    procedure OnIdle;
    procedure SetGraphSite(const pIGraphSite: IGraphSite);
    procedure SetLineJumpFactor(jumpFactorX: Double; jumpFactorY: Double);
    procedure GetLineJumpFactor(out pJumpFactorX: Double; out pJumpFactorY: Double);
    procedure SetRouteAdjustFrom(adjustCode: VGRouteAdjustCodes);
    procedure GetRouteAdjustFrom(out adjustCode: VGRouteAdjustCodes);
    procedure SetRouteAdjustTo(adjustCode: VGRouteAdjustCodes);
    procedure GetRouteAdjustTo(out adjustCode: VGRouteAdjustCodes);
    property  DefaultInterface: IContainer read GetDefaultInterface;
    property Nodes: INodes read Get_Nodes;
    property Edges: IEdges read Get_Edges;
    property Properties: IGraphProps read Get_Properties;
    property BoundingRect: IGraphRect read Get_BoundingRect;
    property PlacementDirection: Integer read Get_PlacementDirection;
    property PlacementStyle: Integer read Get_PlacementStyle write Set_PlacementStyle;
    property PlacementDepth: Integer read Get_PlacementDepth write Set_PlacementDepth;
    property RoutingStyle: Integer read Get_RoutingStyle write Set_RoutingStyle;
    property Gridding: Smallint read Get_Gridding write Set_Gridding;
    property Loading: Smallint read Get_Loading write Set_Loading;
    property PageScale: Double read Get_PageScale write Set_PageScale;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TVisioContainerProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TVisioContainer
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TVisioContainerProperties = class(TPersistent)
  private
    FServer:    TVisioContainer;
    function    GetDefaultInterface: IContainer;
    constructor Create(AServer: TVisioContainer);
  protected
    function  Get_Nodes: INodes;
    function  Get_Edges: IEdges;
    function  Get_Properties: IGraphProps;
    function  Get_BoundingRect: IGraphRect;
    procedure Set_PlacementStyle(pstyle: Integer);
    function  Get_PlacementStyle: Integer;
    procedure Set_PlacementDepth(pdepth: Integer);
    function  Get_PlacementDepth: Integer;
    function  Get_PlacementDirection: Integer;
    procedure Set_RoutingStyle(pstyle: Integer);
    function  Get_RoutingStyle: Integer;
    procedure Set_Gridding(pflag: Smallint);
    function  Get_Gridding: Smallint;
    procedure Set_Loading(pflag: Smallint);
    function  Get_Loading: Smallint;
    procedure Set_PageScale(ppageScale: Double);
    function  Get_PageScale: Double;
  public
    property DefaultInterface: IContainer read GetDefaultInterface;
  published
    property PlacementStyle: Integer read Get_PlacementStyle write Set_PlacementStyle;
    property PlacementDepth: Integer read Get_PlacementDepth write Set_PlacementDepth;
    property RoutingStyle: Integer read Get_RoutingStyle write Set_RoutingStyle;
    property Gridding: Smallint read Get_Gridding write Set_Gridding;
    property Loading: Smallint read Get_Loading write Set_Loading;
    property PageScale: Double read Get_PageScale write Set_PageScale;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoLayoutObject provides a Create and CreateRemote method to          
// create instances of the default interface ILayoutObject exposed by              
// the CoClass LayoutObject. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoLayoutObject = class
    class function Create: ILayoutObject;
    class function CreateRemote(const MachineName: string): ILayoutObject;
  end;

// *********************************************************************//
// The Class CoNode provides a Create and CreateRemote method to          
// create instances of the default interface INode exposed by              
// the CoClass Node. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoNode = class
    class function Create: INode;
    class function CreateRemote(const MachineName: string): INode;
  end;

// *********************************************************************//
// The Class CoNodes provides a Create and CreateRemote method to          
// create instances of the default interface INodes exposed by              
// the CoClass Nodes. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoNodes = class
    class function Create: INodes;
    class function CreateRemote(const MachineName: string): INodes;
  end;

// *********************************************************************//
// The Class CoEdge provides a Create and CreateRemote method to          
// create instances of the default interface IEdge exposed by              
// the CoClass Edge. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoEdge = class
    class function Create: IEdge;
    class function CreateRemote(const MachineName: string): IEdge;
  end;

// *********************************************************************//
// The Class CoEdges provides a Create and CreateRemote method to          
// create instances of the default interface IEdges exposed by              
// the CoClass Edges. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoEdges = class
    class function Create: IEdges;
    class function CreateRemote(const MachineName: string): IEdges;
  end;

// *********************************************************************//
// The Class CoConnection provides a Create and CreateRemote method to          
// create instances of the default interface IConnection exposed by              
// the CoClass Connection. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoConnection = class
    class function Create: IConnection;
    class function CreateRemote(const MachineName: string): IConnection;
  end;

// *********************************************************************//
// The Class CoConnections provides a Create and CreateRemote method to          
// create instances of the default interface IConnections exposed by              
// the CoClass Connections. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoConnections = class
    class function Create: IConnections;
    class function CreateRemote(const MachineName: string): IConnections;
  end;

// *********************************************************************//
// The Class CoLayoutObjectList provides a Create and CreateRemote method to          
// create instances of the default interface ILayoutObjectList exposed by              
// the CoClass LayoutObjectList. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoLayoutObjectList = class
    class function Create: ILayoutObjectList;
    class function CreateRemote(const MachineName: string): ILayoutObjectList;
  end;

// *********************************************************************//
// The Class CoNodeList provides a Create and CreateRemote method to          
// create instances of the default interface INodeList exposed by              
// the CoClass NodeList. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoNodeList = class
    class function Create: INodeList;
    class function CreateRemote(const MachineName: string): INodeList;
  end;

// *********************************************************************//
// The Class CoEdgeList provides a Create and CreateRemote method to          
// create instances of the default interface IEdgeList exposed by              
// the CoClass EdgeList. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoEdgeList = class
    class function Create: IEdgeList;
    class function CreateRemote(const MachineName: string): IEdgeList;
  end;

// *********************************************************************//
// The Class CoGraphRect provides a Create and CreateRemote method to          
// create instances of the default interface IGraphRect exposed by              
// the CoClass GraphRect. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoGraphRect = class
    class function Create: IGraphRect;
    class function CreateRemote(const MachineName: string): IGraphRect;
  end;

// *********************************************************************//
// The Class CoVisioGraphPoints provides a Create and CreateRemote method to          
// create instances of the default interface IGraphPoints exposed by              
// the CoClass VisioGraphPoints. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoVisioGraphPoints = class
    class function Create: IGraphPoints;
    class function CreateRemote(const MachineName: string): IGraphPoints;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TVisioGraphPoints
// Help String      : GraphPoints Class
// Default Interface: IGraphPoints
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TVisioGraphPointsProperties= class;
{$ENDIF}
  TVisioGraphPoints = class(TOleServer)
  private
    FIntf:        IGraphPoints;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TVisioGraphPointsProperties;
    function      GetServerProperties: TVisioGraphPointsProperties;
{$ENDIF}
    function      GetDefaultInterface: IGraphPoints;
  protected
    procedure InitServerData; override;
    function  Get_Count: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IGraphPoints);
    procedure Disconnect; override;
    procedure Add(x: Double; y: Double);
    procedure Remove(index: Integer);
    procedure Put(index: Integer; x: Double; y: Double);
    procedure Get(index: Integer; out px: Double; out py: Double);
    procedure GetArray(out pArray: PSafeArray);
    procedure PutArray(pArray: PSafeArray);
    property  DefaultInterface: IGraphPoints read GetDefaultInterface;
    property Count: Integer read Get_Count;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TVisioGraphPointsProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TVisioGraphPoints
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TVisioGraphPointsProperties = class(TPersistent)
  private
    FServer:    TVisioGraphPoints;
    function    GetDefaultInterface: IGraphPoints;
    constructor Create(AServer: TVisioGraphPoints);
  protected
    function  Get_Count: Integer;
  public
    property DefaultInterface: IGraphPoints read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoGraphProps provides a Create and CreateRemote method to          
// create instances of the default interface IGraphProps exposed by              
// the CoClass GraphProps. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoGraphProps = class
    class function Create: IGraphProps;
    class function CreateRemote(const MachineName: string): IGraphProps;
  end;

// *********************************************************************//
// The Class CoVisioGraphPointsEx provides a Create and CreateRemote method to          
// create instances of the default interface IGraphPointsEx exposed by              
// the CoClass VisioGraphPointsEx. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoVisioGraphPointsEx = class
    class function Create: IGraphPointsEx;
    class function CreateRemote(const MachineName: string): IGraphPointsEx;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TVisioGraphPointsEx
// Help String      : GraphPointsEx Class
// Default Interface: IGraphPointsEx
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TVisioGraphPointsExProperties= class;
{$ENDIF}
  TVisioGraphPointsEx = class(TOleServer)
  private
    FIntf:        IGraphPointsEx;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TVisioGraphPointsExProperties;
    function      GetServerProperties: TVisioGraphPointsExProperties;
{$ENDIF}
    function      GetDefaultInterface: IGraphPointsEx;
  protected
    procedure InitServerData; override;
    function  Get_Count: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IGraphPointsEx);
    procedure Disconnect; override;
    procedure Add(x: Double; y: Double; flag: Integer);
    procedure Remove(index: Integer);
    procedure Put(index: Integer; x: Double; y: Double; flag: Integer);
    procedure Get(index: Integer; out px: Double; out py: Double; out pflag: Integer);
    property  DefaultInterface: IGraphPointsEx read GetDefaultInterface;
    property Count: Integer read Get_Count;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TVisioGraphPointsExProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TVisioGraphPointsEx
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TVisioGraphPointsExProperties = class(TPersistent)
  private
    FServer:    TVisioGraphPointsEx;
    function    GetDefaultInterface: IGraphPointsEx;
    constructor Create(AServer: TVisioGraphPointsEx);
  protected
    function  Get_Count: Integer;
  public
    property DefaultInterface: IGraphPointsEx read GetDefaultInterface;
  published
  end;
{$ENDIF}


implementation

uses ComObj;

class function CoVisioGraph.Create: IGraph;
begin
  Result := CreateComObject(CLASS_VisioGraph) as IGraph;
end;

class function CoVisioGraph.CreateRemote(const MachineName: string): IGraph;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_VisioGraph) as IGraph;
end;

procedure TVisioGraph.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{000D1143-0000-0000-C000-000000000046}';
    IntfIID:   '{000D1142-0000-0000-C000-000000000046}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TVisioGraph.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IGraph;
  end;
end;

procedure TVisioGraph.ConnectTo(svrIntf: IGraph);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TVisioGraph.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TVisioGraph.GetDefaultInterface: IGraph;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TVisioGraph.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TVisioGraphProperties.Create(Self);
{$ENDIF}
end;

destructor TVisioGraph.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TVisioGraph.GetServerProperties: TVisioGraphProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TVisioGraph.Get_Nodes: INodes;
begin
  Result := DefaultInterface.Get_Nodes;
end;

function  TVisioGraph.Get_Edges: IEdges;
begin
  Result := DefaultInterface.Get_Edges;
end;

function  TVisioGraph.Get_Properties: IGraphProps;
begin
  Result := DefaultInterface.Get_Properties;
end;

function  TVisioGraph.Get_BoundingRect: IGraphRect;
begin
  Result := DefaultInterface.Get_BoundingRect;
end;

procedure TVisioGraph.Set_PlacementStyle(pstyle: Integer);
begin
  DefaultInterface.Set_PlacementStyle(pstyle);
end;

function  TVisioGraph.Get_PlacementStyle: Integer;
begin
  Result := DefaultInterface.Get_PlacementStyle;
end;

procedure TVisioGraph.Set_PlacementDepth(pdepth: Integer);
begin
  DefaultInterface.Set_PlacementDepth(pdepth);
end;

function  TVisioGraph.Get_PlacementDepth: Integer;
begin
  Result := DefaultInterface.Get_PlacementDepth;
end;

function  TVisioGraph.Get_PlacementDirection: Integer;
begin
  Result := DefaultInterface.Get_PlacementDirection;
end;

procedure TVisioGraph.Set_RoutingStyle(pstyle: Integer);
begin
  DefaultInterface.Set_RoutingStyle(pstyle);
end;

function  TVisioGraph.Get_RoutingStyle: Integer;
begin
  Result := DefaultInterface.Get_RoutingStyle;
end;

procedure TVisioGraph.Set_Gridding(pflag: Smallint);
begin
  DefaultInterface.Set_Gridding(pflag);
end;

function  TVisioGraph.Get_Gridding: Smallint;
begin
  Result := DefaultInterface.Get_Gridding;
end;

procedure TVisioGraph.Set_Loading(pflag: Smallint);
begin
  DefaultInterface.Set_Loading(pflag);
end;

function  TVisioGraph.Get_Loading: Smallint;
begin
  Result := DefaultInterface.Get_Loading;
end;

procedure TVisioGraph.Set_PageScale(ppageScale: Double);
begin
  DefaultInterface.Set_PageScale(ppageScale);
end;

function  TVisioGraph.Get_PageScale: Double;
begin
  Result := DefaultInterface.Get_PageScale;
end;

procedure TVisioGraph.Layout;
begin
  DefaultInterface.Layout;
end;

procedure TVisioGraph.LayoutSelected;
begin
  DefaultInterface.LayoutSelected;
end;

procedure TVisioGraph.Place;
begin
  DefaultInterface.Place;
end;

procedure TVisioGraph.PlaceSelected;
begin
  DefaultInterface.PlaceSelected;
end;

procedure TVisioGraph.Route;
begin
  DefaultInterface.Route;
end;

procedure TVisioGraph.RouteSelected;
begin
  DefaultInterface.RouteSelected;
end;

procedure TVisioGraph.Reroute;
begin
  DefaultInterface.Reroute;
end;

procedure TVisioGraph.Empty;
begin
  DefaultInterface.Empty;
end;

procedure TVisioGraph.GetBoundingRect(out px0: Double; out py0: Double; out px1: Double; 
                                       out py1: Double);
begin
  DefaultInterface.GetBoundingRect(px0, py0, px1, py1);
end;

procedure TVisioGraph.SetBlockSize(x: Double; y: Double);
begin
  DefaultInterface.SetBlockSize(x, y);
end;

procedure TVisioGraph.GetBlockSize(out px: Double; out py: Double);
begin
  DefaultInterface.GetBlockSize(px, py);
end;

procedure TVisioGraph.SetAvenueSize(x: Double; y: Double);
begin
  DefaultInterface.SetAvenueSize(x, y);
end;

procedure TVisioGraph.GetAvenueSize(out px: Double; out py: Double);
begin
  DefaultInterface.GetAvenueSize(px, py);
end;

procedure TVisioGraph.SetNodeToNodeClearance(x: Double; y: Double);
begin
  DefaultInterface.SetNodeToNodeClearance(x, y);
end;

procedure TVisioGraph.GetNodeToNodeClearance(out px: Double; out py: Double);
begin
  DefaultInterface.GetNodeToNodeClearance(px, py);
end;

procedure TVisioGraph.SetLineToLineClearance(x: Double; y: Double);
begin
  DefaultInterface.SetLineToLineClearance(x, y);
end;

procedure TVisioGraph.GetLineToLineClearance(out px: Double; out py: Double);
begin
  DefaultInterface.GetLineToLineClearance(px, py);
end;

procedure TVisioGraph.SetLineToNodeClearance(x: Double; y: Double);
begin
  DefaultInterface.SetLineToNodeClearance(x, y);
end;

procedure TVisioGraph.GetLineToNodeClearance(out px: Double; out py: Double);
begin
  DefaultInterface.GetLineToNodeClearance(px, py);
end;

procedure TVisioGraph.SetMargins(x: Double; y: Double);
begin
  DefaultInterface.SetMargins(x, y);
end;

procedure TVisioGraph.GetMargins(out px: Double; out py: Double);
begin
  DefaultInterface.GetMargins(px, py);
end;

procedure TVisioGraph.SelectAll;
begin
  DefaultInterface.SelectAll;
end;

procedure TVisioGraph.DeselectAll;
begin
  DefaultInterface.DeselectAll;
end;

function  TVisioGraph.CreateNodeList: INodeList;
begin
  Result := DefaultInterface.CreateNodeList;
end;

function  TVisioGraph.CreateEdgeList: IEdgeList;
begin
  Result := DefaultInterface.CreateEdgeList;
end;

function  TVisioGraph.GetNearestNode(x: Double; y: Double; distance: Double): INode;
begin
  Result := DefaultInterface.GetNearestNode(x, y, distance);
end;

function  TVisioGraph.GetNearestConnection(x: Double; y: Double; distance: Double): IConnection;
begin
  Result := DefaultInterface.GetNearestConnection(x, y, distance);
end;

procedure TVisioGraph.SetPageSize(x: Double; y: Double);
begin
  DefaultInterface.SetPageSize(x, y);
end;

procedure TVisioGraph.GetPageSize(out px: Double; out py: Double);
begin
  DefaultInterface.GetPageSize(px, py);
end;

procedure TVisioGraph.StartRecorder;
begin
  DefaultInterface.StartRecorder;
end;

procedure TVisioGraph.AppendRecorder;
begin
  DefaultInterface.AppendRecorder;
end;

procedure TVisioGraph.StopRecorder;
begin
  DefaultInterface.StopRecorder;
end;

procedure TVisioGraph.OverrideRecorder(override: Integer);
begin
  DefaultInterface.OverrideRecorder(override);
end;

function  TVisioGraph.GetRecordedObjects: ILayoutObjectList;
begin
  Result := DefaultInterface.GetRecordedObjects;
end;

procedure TVisioGraph.SetRouteJumpType(Type_: Integer);
begin
  DefaultInterface.SetRouteJumpType(Type_);
end;

procedure TVisioGraph.GetRouteJumpType(out ptype: Integer);
begin
  DefaultInterface.GetRouteJumpType(ptype);
end;

function  TVisioGraph.GetNearestEdge(x: Double; y: Double; distance: Double): IEdge;
begin
  Result := DefaultInterface.GetNearestEdge(x, y, distance);
end;

procedure TVisioGraph.TranslateGraph(dx: Double; dy: Double);
begin
  DefaultInterface.TranslateGraph(dx, dy);
end;

procedure TVisioGraph.OnIdle;
begin
  DefaultInterface.OnIdle;
end;

procedure TVisioGraph.SetGraphSite(const pIGraphSite: IGraphSite);
begin
  DefaultInterface.SetGraphSite(pIGraphSite);
end;

procedure TVisioGraph.SetLineJumpFactor(jumpFactorX: Double; jumpFactorY: Double);
begin
  DefaultInterface.SetLineJumpFactor(jumpFactorX, jumpFactorY);
end;

procedure TVisioGraph.GetLineJumpFactor(out pJumpFactorX: Double; out pJumpFactorY: Double);
begin
  DefaultInterface.GetLineJumpFactor(pJumpFactorX, pJumpFactorY);
end;

procedure TVisioGraph.SetRouteAdjustFrom(adjustCode: VGRouteAdjustCodes);
begin
  DefaultInterface.SetRouteAdjustFrom(adjustCode);
end;

procedure TVisioGraph.GetRouteAdjustFrom(out adjustCode: VGRouteAdjustCodes);
begin
  DefaultInterface.GetRouteAdjustFrom(adjustCode);
end;

procedure TVisioGraph.SetRouteAdjustTo(adjustCode: VGRouteAdjustCodes);
begin
  DefaultInterface.SetRouteAdjustTo(adjustCode);
end;

procedure TVisioGraph.GetRouteAdjustTo(out adjustCode: VGRouteAdjustCodes);
begin
  DefaultInterface.GetRouteAdjustTo(adjustCode);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TVisioGraphProperties.Create(AServer: TVisioGraph);
begin
  inherited Create;
  FServer := AServer;
end;

function TVisioGraphProperties.GetDefaultInterface: IGraph;
begin
  Result := FServer.DefaultInterface;
end;

function  TVisioGraphProperties.Get_Nodes: INodes;
begin
  Result := DefaultInterface.Get_Nodes;
end;

function  TVisioGraphProperties.Get_Edges: IEdges;
begin
  Result := DefaultInterface.Get_Edges;
end;

function  TVisioGraphProperties.Get_Properties: IGraphProps;
begin
  Result := DefaultInterface.Get_Properties;
end;

function  TVisioGraphProperties.Get_BoundingRect: IGraphRect;
begin
  Result := DefaultInterface.Get_BoundingRect;
end;

procedure TVisioGraphProperties.Set_PlacementStyle(pstyle: Integer);
begin
  DefaultInterface.Set_PlacementStyle(pstyle);
end;

function  TVisioGraphProperties.Get_PlacementStyle: Integer;
begin
  Result := DefaultInterface.Get_PlacementStyle;
end;

procedure TVisioGraphProperties.Set_PlacementDepth(pdepth: Integer);
begin
  DefaultInterface.Set_PlacementDepth(pdepth);
end;

function  TVisioGraphProperties.Get_PlacementDepth: Integer;
begin
  Result := DefaultInterface.Get_PlacementDepth;
end;

function  TVisioGraphProperties.Get_PlacementDirection: Integer;
begin
  Result := DefaultInterface.Get_PlacementDirection;
end;

procedure TVisioGraphProperties.Set_RoutingStyle(pstyle: Integer);
begin
  DefaultInterface.Set_RoutingStyle(pstyle);
end;

function  TVisioGraphProperties.Get_RoutingStyle: Integer;
begin
  Result := DefaultInterface.Get_RoutingStyle;
end;

procedure TVisioGraphProperties.Set_Gridding(pflag: Smallint);
begin
  DefaultInterface.Set_Gridding(pflag);
end;

function  TVisioGraphProperties.Get_Gridding: Smallint;
begin
  Result := DefaultInterface.Get_Gridding;
end;

procedure TVisioGraphProperties.Set_Loading(pflag: Smallint);
begin
  DefaultInterface.Set_Loading(pflag);
end;

function  TVisioGraphProperties.Get_Loading: Smallint;
begin
  Result := DefaultInterface.Get_Loading;
end;

procedure TVisioGraphProperties.Set_PageScale(ppageScale: Double);
begin
  DefaultInterface.Set_PageScale(ppageScale);
end;

function  TVisioGraphProperties.Get_PageScale: Double;
begin
  Result := DefaultInterface.Get_PageScale;
end;

{$ENDIF}

class function CoVisioContainer.Create: IContainer;
begin
  Result := CreateComObject(CLASS_VisioContainer) as IContainer;
end;

class function CoVisioContainer.CreateRemote(const MachineName: string): IContainer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_VisioContainer) as IContainer;
end;

procedure TVisioContainer.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{000D1181-0000-0000-C000-000000000046}';
    IntfIID:   '{000D1144-0000-0000-C000-000000000046}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TVisioContainer.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IContainer;
  end;
end;

procedure TVisioContainer.ConnectTo(svrIntf: IContainer);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TVisioContainer.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TVisioContainer.GetDefaultInterface: IContainer;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TVisioContainer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TVisioContainerProperties.Create(Self);
{$ENDIF}
end;

destructor TVisioContainer.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TVisioContainer.GetServerProperties: TVisioContainerProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TVisioContainer.Get_Nodes: INodes;
begin
  Result := DefaultInterface.Get_Nodes;
end;

function  TVisioContainer.Get_Edges: IEdges;
begin
  Result := DefaultInterface.Get_Edges;
end;

function  TVisioContainer.Get_Properties: IGraphProps;
begin
  Result := DefaultInterface.Get_Properties;
end;

function  TVisioContainer.Get_BoundingRect: IGraphRect;
begin
  Result := DefaultInterface.Get_BoundingRect;
end;

procedure TVisioContainer.Set_PlacementStyle(pstyle: Integer);
begin
  DefaultInterface.Set_PlacementStyle(pstyle);
end;

function  TVisioContainer.Get_PlacementStyle: Integer;
begin
  Result := DefaultInterface.Get_PlacementStyle;
end;

procedure TVisioContainer.Set_PlacementDepth(pdepth: Integer);
begin
  DefaultInterface.Set_PlacementDepth(pdepth);
end;

function  TVisioContainer.Get_PlacementDepth: Integer;
begin
  Result := DefaultInterface.Get_PlacementDepth;
end;

function  TVisioContainer.Get_PlacementDirection: Integer;
begin
  Result := DefaultInterface.Get_PlacementDirection;
end;

procedure TVisioContainer.Set_RoutingStyle(pstyle: Integer);
begin
  DefaultInterface.Set_RoutingStyle(pstyle);
end;

function  TVisioContainer.Get_RoutingStyle: Integer;
begin
  Result := DefaultInterface.Get_RoutingStyle;
end;

procedure TVisioContainer.Set_Gridding(pflag: Smallint);
begin
  DefaultInterface.Set_Gridding(pflag);
end;

function  TVisioContainer.Get_Gridding: Smallint;
begin
  Result := DefaultInterface.Get_Gridding;
end;

procedure TVisioContainer.Set_Loading(pflag: Smallint);
begin
  DefaultInterface.Set_Loading(pflag);
end;

function  TVisioContainer.Get_Loading: Smallint;
begin
  Result := DefaultInterface.Get_Loading;
end;

procedure TVisioContainer.Set_PageScale(ppageScale: Double);
begin
  DefaultInterface.Set_PageScale(ppageScale);
end;

function  TVisioContainer.Get_PageScale: Double;
begin
  Result := DefaultInterface.Get_PageScale;
end;

procedure TVisioContainer.Layout;
begin
  DefaultInterface.Layout;
end;

procedure TVisioContainer.LayoutSelected;
begin
  DefaultInterface.LayoutSelected;
end;

procedure TVisioContainer.Place;
begin
  DefaultInterface.Place;
end;

procedure TVisioContainer.PlaceSelected;
begin
  DefaultInterface.PlaceSelected;
end;

procedure TVisioContainer.Route;
begin
  DefaultInterface.Route;
end;

procedure TVisioContainer.RouteSelected;
begin
  DefaultInterface.RouteSelected;
end;

procedure TVisioContainer.Reroute;
begin
  DefaultInterface.Reroute;
end;

procedure TVisioContainer.Empty;
begin
  DefaultInterface.Empty;
end;

procedure TVisioContainer.GetBoundingRect(out px0: Double; out py0: Double; out px1: Double; 
                                          out py1: Double);
begin
  DefaultInterface.GetBoundingRect(px0, py0, px1, py1);
end;

procedure TVisioContainer.SetBlockSize(x: Double; y: Double);
begin
  DefaultInterface.SetBlockSize(x, y);
end;

procedure TVisioContainer.GetBlockSize(out px: Double; out py: Double);
begin
  DefaultInterface.GetBlockSize(px, py);
end;

procedure TVisioContainer.SetAvenueSize(x: Double; y: Double);
begin
  DefaultInterface.SetAvenueSize(x, y);
end;

procedure TVisioContainer.GetAvenueSize(out px: Double; out py: Double);
begin
  DefaultInterface.GetAvenueSize(px, py);
end;

procedure TVisioContainer.SetNodeToNodeClearance(x: Double; y: Double);
begin
  DefaultInterface.SetNodeToNodeClearance(x, y);
end;

procedure TVisioContainer.GetNodeToNodeClearance(out px: Double; out py: Double);
begin
  DefaultInterface.GetNodeToNodeClearance(px, py);
end;

procedure TVisioContainer.SetLineToLineClearance(x: Double; y: Double);
begin
  DefaultInterface.SetLineToLineClearance(x, y);
end;

procedure TVisioContainer.GetLineToLineClearance(out px: Double; out py: Double);
begin
  DefaultInterface.GetLineToLineClearance(px, py);
end;

procedure TVisioContainer.SetLineToNodeClearance(x: Double; y: Double);
begin
  DefaultInterface.SetLineToNodeClearance(x, y);
end;

procedure TVisioContainer.GetLineToNodeClearance(out px: Double; out py: Double);
begin
  DefaultInterface.GetLineToNodeClearance(px, py);
end;

procedure TVisioContainer.SetMargins(x: Double; y: Double);
begin
  DefaultInterface.SetMargins(x, y);
end;

procedure TVisioContainer.GetMargins(out px: Double; out py: Double);
begin
  DefaultInterface.GetMargins(px, py);
end;

procedure TVisioContainer.SelectAll;
begin
  DefaultInterface.SelectAll;
end;

procedure TVisioContainer.DeselectAll;
begin
  DefaultInterface.DeselectAll;
end;

function  TVisioContainer.CreateNodeList: INodeList;
begin
  Result := DefaultInterface.CreateNodeList;
end;

function  TVisioContainer.CreateEdgeList: IEdgeList;
begin
  Result := DefaultInterface.CreateEdgeList;
end;

function  TVisioContainer.GetNearestNode(x: Double; y: Double; distance: Double): INode;
begin
  Result := DefaultInterface.GetNearestNode(x, y, distance);
end;

function  TVisioContainer.GetNearestConnection(x: Double; y: Double; distance: Double): IConnection;
begin
  Result := DefaultInterface.GetNearestConnection(x, y, distance);
end;

procedure TVisioContainer.SetPageSize(x: Double; y: Double);
begin
  DefaultInterface.SetPageSize(x, y);
end;

procedure TVisioContainer.GetPageSize(out px: Double; out py: Double);
begin
  DefaultInterface.GetPageSize(px, py);
end;

procedure TVisioContainer.StartRecorder;
begin
  DefaultInterface.StartRecorder;
end;

procedure TVisioContainer.AppendRecorder;
begin
  DefaultInterface.AppendRecorder;
end;

procedure TVisioContainer.StopRecorder;
begin
  DefaultInterface.StopRecorder;
end;

procedure TVisioContainer.OverrideRecorder(override: Integer);
begin
  DefaultInterface.OverrideRecorder(override);
end;

function  TVisioContainer.GetRecordedObjects: ILayoutObjectList;
begin
  Result := DefaultInterface.GetRecordedObjects;
end;

procedure TVisioContainer.SetRouteJumpType(Type_: Integer);
begin
  DefaultInterface.SetRouteJumpType(Type_);
end;

procedure TVisioContainer.GetRouteJumpType(out ptype: Integer);
begin
  DefaultInterface.GetRouteJumpType(ptype);
end;

function  TVisioContainer.GetNearestEdge(x: Double; y: Double; distance: Double): IEdge;
begin
  Result := DefaultInterface.GetNearestEdge(x, y, distance);
end;

procedure TVisioContainer.TranslateGraph(dx: Double; dy: Double);
begin
  DefaultInterface.TranslateGraph(dx, dy);
end;

procedure TVisioContainer.OnIdle;
begin
  DefaultInterface.OnIdle;
end;

procedure TVisioContainer.SetGraphSite(const pIGraphSite: IGraphSite);
begin
  DefaultInterface.SetGraphSite(pIGraphSite);
end;

procedure TVisioContainer.SetLineJumpFactor(jumpFactorX: Double; jumpFactorY: Double);
begin
  DefaultInterface.SetLineJumpFactor(jumpFactorX, jumpFactorY);
end;

procedure TVisioContainer.GetLineJumpFactor(out pJumpFactorX: Double; out pJumpFactorY: Double);
begin
  DefaultInterface.GetLineJumpFactor(pJumpFactorX, pJumpFactorY);
end;

procedure TVisioContainer.SetRouteAdjustFrom(adjustCode: VGRouteAdjustCodes);
begin
  DefaultInterface.SetRouteAdjustFrom(adjustCode);
end;

procedure TVisioContainer.GetRouteAdjustFrom(out adjustCode: VGRouteAdjustCodes);
begin
  DefaultInterface.GetRouteAdjustFrom(adjustCode);
end;

procedure TVisioContainer.SetRouteAdjustTo(adjustCode: VGRouteAdjustCodes);
begin
  DefaultInterface.SetRouteAdjustTo(adjustCode);
end;

procedure TVisioContainer.GetRouteAdjustTo(out adjustCode: VGRouteAdjustCodes);
begin
  DefaultInterface.GetRouteAdjustTo(adjustCode);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TVisioContainerProperties.Create(AServer: TVisioContainer);
begin
  inherited Create;
  FServer := AServer;
end;

function TVisioContainerProperties.GetDefaultInterface: IContainer;
begin
  Result := FServer.DefaultInterface;
end;

function  TVisioContainerProperties.Get_Nodes: INodes;
begin
  Result := DefaultInterface.Get_Nodes;
end;

function  TVisioContainerProperties.Get_Edges: IEdges;
begin
  Result := DefaultInterface.Get_Edges;
end;

function  TVisioContainerProperties.Get_Properties: IGraphProps;
begin
  Result := DefaultInterface.Get_Properties;
end;

function  TVisioContainerProperties.Get_BoundingRect: IGraphRect;
begin
  Result := DefaultInterface.Get_BoundingRect;
end;

procedure TVisioContainerProperties.Set_PlacementStyle(pstyle: Integer);
begin
  DefaultInterface.Set_PlacementStyle(pstyle);
end;

function  TVisioContainerProperties.Get_PlacementStyle: Integer;
begin
  Result := DefaultInterface.Get_PlacementStyle;
end;

procedure TVisioContainerProperties.Set_PlacementDepth(pdepth: Integer);
begin
  DefaultInterface.Set_PlacementDepth(pdepth);
end;

function  TVisioContainerProperties.Get_PlacementDepth: Integer;
begin
  Result := DefaultInterface.Get_PlacementDepth;
end;

function  TVisioContainerProperties.Get_PlacementDirection: Integer;
begin
  Result := DefaultInterface.Get_PlacementDirection;
end;

procedure TVisioContainerProperties.Set_RoutingStyle(pstyle: Integer);
begin
  DefaultInterface.Set_RoutingStyle(pstyle);
end;

function  TVisioContainerProperties.Get_RoutingStyle: Integer;
begin
  Result := DefaultInterface.Get_RoutingStyle;
end;

procedure TVisioContainerProperties.Set_Gridding(pflag: Smallint);
begin
  DefaultInterface.Set_Gridding(pflag);
end;

function  TVisioContainerProperties.Get_Gridding: Smallint;
begin
  Result := DefaultInterface.Get_Gridding;
end;

procedure TVisioContainerProperties.Set_Loading(pflag: Smallint);
begin
  DefaultInterface.Set_Loading(pflag);
end;

function  TVisioContainerProperties.Get_Loading: Smallint;
begin
  Result := DefaultInterface.Get_Loading;
end;

procedure TVisioContainerProperties.Set_PageScale(ppageScale: Double);
begin
  DefaultInterface.Set_PageScale(ppageScale);
end;

function  TVisioContainerProperties.Get_PageScale: Double;
begin
  Result := DefaultInterface.Get_PageScale;
end;

{$ENDIF}

class function CoLayoutObject.Create: ILayoutObject;
begin
  Result := CreateComObject(CLASS_LayoutObject) as ILayoutObject;
end;

class function CoLayoutObject.CreateRemote(const MachineName: string): ILayoutObject;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_LayoutObject) as ILayoutObject;
end;

class function CoNode.Create: INode;
begin
  Result := CreateComObject(CLASS_Node) as INode;
end;

class function CoNode.CreateRemote(const MachineName: string): INode;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Node) as INode;
end;

class function CoNodes.Create: INodes;
begin
  Result := CreateComObject(CLASS_Nodes) as INodes;
end;

class function CoNodes.CreateRemote(const MachineName: string): INodes;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Nodes) as INodes;
end;

class function CoEdge.Create: IEdge;
begin
  Result := CreateComObject(CLASS_Edge) as IEdge;
end;

class function CoEdge.CreateRemote(const MachineName: string): IEdge;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Edge) as IEdge;
end;

class function CoEdges.Create: IEdges;
begin
  Result := CreateComObject(CLASS_Edges) as IEdges;
end;

class function CoEdges.CreateRemote(const MachineName: string): IEdges;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Edges) as IEdges;
end;

class function CoConnection.Create: IConnection;
begin
  Result := CreateComObject(CLASS_Connection) as IConnection;
end;

class function CoConnection.CreateRemote(const MachineName: string): IConnection;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Connection) as IConnection;
end;

class function CoConnections.Create: IConnections;
begin
  Result := CreateComObject(CLASS_Connections) as IConnections;
end;

class function CoConnections.CreateRemote(const MachineName: string): IConnections;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Connections) as IConnections;
end;

class function CoLayoutObjectList.Create: ILayoutObjectList;
begin
  Result := CreateComObject(CLASS_LayoutObjectList) as ILayoutObjectList;
end;

class function CoLayoutObjectList.CreateRemote(const MachineName: string): ILayoutObjectList;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_LayoutObjectList) as ILayoutObjectList;
end;

class function CoNodeList.Create: INodeList;
begin
  Result := CreateComObject(CLASS_NodeList) as INodeList;
end;

class function CoNodeList.CreateRemote(const MachineName: string): INodeList;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_NodeList) as INodeList;
end;

class function CoEdgeList.Create: IEdgeList;
begin
  Result := CreateComObject(CLASS_EdgeList) as IEdgeList;
end;

class function CoEdgeList.CreateRemote(const MachineName: string): IEdgeList;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_EdgeList) as IEdgeList;
end;

class function CoGraphRect.Create: IGraphRect;
begin
  Result := CreateComObject(CLASS_GraphRect) as IGraphRect;
end;

class function CoGraphRect.CreateRemote(const MachineName: string): IGraphRect;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_GraphRect) as IGraphRect;
end;

class function CoVisioGraphPoints.Create: IGraphPoints;
begin
  Result := CreateComObject(CLASS_VisioGraphPoints) as IGraphPoints;
end;

class function CoVisioGraphPoints.CreateRemote(const MachineName: string): IGraphPoints;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_VisioGraphPoints) as IGraphPoints;
end;

procedure TVisioGraphPoints.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{000D118D-0000-0000-C000-000000000046}';
    IntfIID:   '{000D114B-0000-0000-C000-000000000046}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TVisioGraphPoints.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IGraphPoints;
  end;
end;

procedure TVisioGraphPoints.ConnectTo(svrIntf: IGraphPoints);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TVisioGraphPoints.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TVisioGraphPoints.GetDefaultInterface: IGraphPoints;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TVisioGraphPoints.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TVisioGraphPointsProperties.Create(Self);
{$ENDIF}
end;

destructor TVisioGraphPoints.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TVisioGraphPoints.GetServerProperties: TVisioGraphPointsProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TVisioGraphPoints.Get_Count: Integer;
begin
  Result := DefaultInterface.Get_Count;
end;

procedure TVisioGraphPoints.Add(x: Double; y: Double);
begin
  DefaultInterface.Add(x, y);
end;

procedure TVisioGraphPoints.Remove(index: Integer);
begin
  DefaultInterface.Remove(index);
end;

procedure TVisioGraphPoints.Put(index: Integer; x: Double; y: Double);
begin
  DefaultInterface.Put(index, x, y);
end;

procedure TVisioGraphPoints.Get(index: Integer; out px: Double; out py: Double);
begin
  DefaultInterface.Get(index, px, py);
end;

procedure TVisioGraphPoints.GetArray(out pArray: PSafeArray);
begin
  DefaultInterface.GetArray(pArray);
end;

procedure TVisioGraphPoints.PutArray(pArray: PSafeArray);
begin
  DefaultInterface.PutArray(pArray);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TVisioGraphPointsProperties.Create(AServer: TVisioGraphPoints);
begin
  inherited Create;
  FServer := AServer;
end;

function TVisioGraphPointsProperties.GetDefaultInterface: IGraphPoints;
begin
  Result := FServer.DefaultInterface;
end;

function  TVisioGraphPointsProperties.Get_Count: Integer;
begin
  Result := DefaultInterface.Get_Count;
end;

{$ENDIF}

class function CoGraphProps.Create: IGraphProps;
begin
  Result := CreateComObject(CLASS_GraphProps) as IGraphProps;
end;

class function CoGraphProps.CreateRemote(const MachineName: string): IGraphProps;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_GraphProps) as IGraphProps;
end;

class function CoVisioGraphPointsEx.Create: IGraphPointsEx;
begin
  Result := CreateComObject(CLASS_VisioGraphPointsEx) as IGraphPointsEx;
end;

class function CoVisioGraphPointsEx.CreateRemote(const MachineName: string): IGraphPointsEx;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_VisioGraphPointsEx) as IGraphPointsEx;
end;

procedure TVisioGraphPointsEx.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{000D118F-0000-0000-C000-000000000046}';
    IntfIID:   '{000D1153-0000-0000-C000-000000000046}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TVisioGraphPointsEx.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IGraphPointsEx;
  end;
end;

procedure TVisioGraphPointsEx.ConnectTo(svrIntf: IGraphPointsEx);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TVisioGraphPointsEx.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TVisioGraphPointsEx.GetDefaultInterface: IGraphPointsEx;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TVisioGraphPointsEx.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TVisioGraphPointsExProperties.Create(Self);
{$ENDIF}
end;

destructor TVisioGraphPointsEx.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TVisioGraphPointsEx.GetServerProperties: TVisioGraphPointsExProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TVisioGraphPointsEx.Get_Count: Integer;
begin
  Result := DefaultInterface.Get_Count;
end;

procedure TVisioGraphPointsEx.Add(x: Double; y: Double; flag: Integer);
begin
  DefaultInterface.Add(x, y, flag);
end;

procedure TVisioGraphPointsEx.Remove(index: Integer);
begin
  DefaultInterface.Remove(index);
end;

procedure TVisioGraphPointsEx.Put(index: Integer; x: Double; y: Double; flag: Integer);
begin
  DefaultInterface.Put(index, x, y, flag);
end;

procedure TVisioGraphPointsEx.Get(index: Integer; out px: Double; out py: Double; out pflag: Integer);
begin
  DefaultInterface.Get(index, px, py, pflag);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TVisioGraphPointsExProperties.Create(AServer: TVisioGraphPointsEx);
begin
  inherited Create;
  FServer := AServer;
end;

function TVisioGraphPointsExProperties.GetDefaultInterface: IGraphPointsEx;
begin
  Result := FServer.DefaultInterface;
end;

function  TVisioGraphPointsExProperties.Get_Count: Integer;
begin
  Result := DefaultInterface.Get_Count;
end;

{$ENDIF}

end.
