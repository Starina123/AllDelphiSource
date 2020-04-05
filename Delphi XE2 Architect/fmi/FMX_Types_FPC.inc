{**************************************************************************************************}
{                                                                                                  }
{ Project JEDI Code Library (JCL)                                                                  }
{                                                                                                  }
{ The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); }
{ you may not use this file except in compliance with the License. You may obtain a copy of the    }
{ License at http://www.mozilla.org/MPL/                                                           }
{                                                                                                  }
{ Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF   }
{ ANY KIND, either express or implied. See the License for the specific language governing rights  }
{ and limitations under the License.                                                               }
{                                                                                                  }
{ The Original Code is JclUnicode.pas.                                                             }
{                                                                                                  }
{ The Initial Developer of the Original Code is Mike Lischke (public att lischke-online dott de).  }
{ Portions created by Mike Lischke are Copyright (C) 1999-2000 Mike Lischke. All Rights Reserved.  }
{                                                                                                  }
{ Contributor(s):                                                                                  }
{   Marcel van Brakel                                                                              }
{   Andreas Hausladen (ahuser)                                                                     }
{   Mike Lischke                                                                                   }
{   Flier Lu (flier)                                                                               }
{   Robert Marquardt (marquardt)                                                                   }
{   Robert Rossmair (rrossmair)                                                                    }
{   Olivier Sannier (obones)                                                                       }
{   Matthias Thoma (mthoma)                                                                        }
{   Petr Vones (pvones)                                                                            }
{   Peter Schraut (http://www.console-dev.de)                                                      }
{   Florent Ouchet (outchy)                                                                        }
{   glchapman                                                                                      }
{                                                                              			   }
{  Modified by Eugene Kryukov                                       	                           }
{                                                                  	                           }
{  Latest change can be found at:                                  	                           }
{    http://www.ksdev.com/mplfiles/                                 	                           }
{                                                                  	                           }
{**************************************************************************************************}

{$IFDEF FPC}
type

  TWideStrings = class(TPersistent)
  private
    FUpdateCount: Integer;
    FCaseSensitive: Boolean;
    FSorted: Boolean;
    function GetCommaText: WideString;
    function GetName(Index: Integer): WideString;
    function GetValue(const Name: WideString): WideString;
    procedure ReadData(Reader: TReader);
    procedure SetCommaText(const Value: WideString);
    procedure SetValue(const Name, Value: WideString);
    procedure WriteData(Writer: TWriter);
    function GetValueFromIndex(Index: Integer): WideString;
    procedure SetValueFromIndex(Index: Integer; const Value: WideString);
    procedure SetCaseSensitive(const Value: Boolean);
    procedure SetSorted(const Value: Boolean);
  protected
    procedure DefineProperties(Filer: TFiler); override;
    procedure Error(const Msg: WideString; Data: Integer);
    function CompareStrings(const S1, S2: WideString): Integer; virtual;
    function Get(Index: Integer): WideString; virtual; abstract;
    function GetCapacity: Integer; virtual;
    function GetCount: Integer; virtual; abstract;
    function GetObject(Index: Integer): TObject; virtual;
    function GetTextStr: WideString; virtual;
    procedure Put(Index: Integer; const S: WideString); virtual;
    procedure PutObject(Index: Integer; AObject: TObject); virtual;
    procedure SetCapacity(NewCapacity: Integer); virtual;
    procedure SetTextStr(const Value: WideString); virtual;
    procedure SetUpdateState(Updating: Boolean); virtual;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure BeginUpdate;
    procedure EndUpdate;
    function AddObject(const S: WideString; AObject: TObject): Integer; virtual;
    procedure Append(const S: WideString);
    procedure AddStrings(Strings: TStrings); overload; virtual;
    procedure AddStrings(Strings: TWideStrings); overload; virtual;
    procedure Assign(Source: TPersistent); override;
    procedure AssignTo(Dest: TPersistent); override;
    function Equals(Strings: TWideStrings): Boolean;
    procedure Exchange(Index1, Index2: Integer); virtual;
    function IndexOf(const S: WideString): Integer; virtual;
    function IndexOfName(const Name: WideString): Integer; virtual;
    function IndexOfValue(const Name: WideString): Integer; virtual;
    function IndexOfObject(AObject: TObject): Integer;
    procedure Insert(Index: Integer; const S: WideString); virtual; abstract;
    procedure InsertObject(Index: Integer; const S: WideString; AObject: TObject);
    procedure LoadFromFile(const FileName: WideString); virtual;
    procedure LoadFromStream(Stream: TStream); virtual;
    procedure Move(CurIndex, NewIndex: Integer); virtual;
    procedure SaveToFile(const FileName: WideString); virtual;
    procedure SaveToAnsiFile(const FileName: WideString); virtual;
    procedure SaveToStream(Stream: TStream); virtual;
    procedure SetText(Text: PWideChar); virtual;
    procedure Sort; virtual;
    property Capacity: Integer read GetCapacity write SetCapacity;
    property Names[Index: Integer]: WideString read GetName;
    property Objects[Index: Integer]: TObject read GetObject write PutObject;
    property Values[const Name: WideString]: WideString read GetValue write SetValue;
    property ValueFromIndex[Index: Integer]: WideString read GetValueFromIndex write SetValueFromIndex;
    property Strings[Index: Integer]: WideString read Get write Put; default;
    property Text: WideString read GetTextStr write SetTextStr stored true;
    function Items(AIndex: integer): WideString;
    procedure SetItem(index: integer; AText: wideString);
    function Add(const S: WideString): Integer; virtual;
    procedure Delete(Index: Integer); virtual;
    procedure Clear; virtual;
    property Count: Integer read GetCount;
    property CommaText: WideString read GetCommaText write SetCommaText stored false;
    property CaseSensitive: Boolean read FCaseSensitive write SetCaseSensitive stored false;
    property Sorted: Boolean read FSorted write SetSorted stored false;
  published
  end;

  PWideStringItem = ^TWideStringItem;
  TWideStringItem = record
    FString: WideString;
    FObject: TObject;
  end;

  PWideStringItemList = ^TWideStringItemList;
  TWideStringItemList = array of TWideStringItem;

  TWideStringList = class(TWideStrings)
  private
    FList: TWideStringItemList;
    FCount: Integer;
    FCapacity: integer;
    FDuplicates: TDuplicates;
    FOnChange: TNotifyEvent;
    FOnChanging: TNotifyEvent;
    FSortByObject: boolean;
    procedure ExchangeItems(Index1, Index2: Integer);
    procedure Grow;
    procedure QuickSort(L, R: Integer);
    procedure QuickSortByObject(L, R: Integer);
    procedure InsertItem(Index: Integer; const S: WideString);
  protected
    procedure Changed; virtual;
    procedure Changing; virtual;
    function CompareStrings(const S1, S2: WideString): Integer; override;
    function Get(Index: Integer): WideString; override;
    function GetCapacity: Integer; override;
    function GetCount: Integer; override;
    function GetObject(Index: Integer): TObject; override;
    procedure Put(Index: Integer; const S: WideString); override;
    procedure PutObject(Index: Integer; AObject: TObject); override;
    procedure SetCapacity(NewCapacity: Integer); override;
    procedure SetUpdateState(Updating: Boolean); override;
  public
    destructor Destroy; override;
    procedure Delete(Index: Integer); override;
    procedure Exchange(Index1, Index2: Integer); override;
    function Find(const S: WideString; var Index: Integer): Boolean; virtual;
    function FindByObject(const S: TObject; var Index: Integer): Boolean; virtual;
    function IndexOf(const S: WideString): Integer; override;
    procedure Insert(Index: Integer; const S: WideString); override;
    procedure Sort; override;
    property Duplicates: TDuplicates read FDuplicates write FDuplicates;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnChanging: TNotifyEvent read FOnChanging write FOnChanging;
    function Add(const S: WideString): Integer; override;
    procedure Clear; override;
    property SortByObject: boolean read FSortByObject write FSortByObject default false;
  published
  end;

  TStrings = TWideStrings;
  TStringList = TWideStringList;


  PSizeF = ^TSizeF;
  TSizeF = record
    cx : Single;
    cy : Single;
  public
    function Create(P : TSizeF): TSizeF; overload;
    function Create(const X, Y : Single): TSizeF; overload;
    function Ceiling : TSize;
    function Truncate : TSize;
    function Round : TSize;
    // metods
    function Add(const Point: TSizeF): TSizeF;
    function Subtract(const Point: TSizeF): TSizeF;
    function Distance(const P2 : TSizeF) : Double;
    function IsZero : Boolean;
    // properties
    property Width: Single read cx write cx;
    property Height: Single read cy write cy;
  end;

  PPointF = ^TPointF;
  TPointF = record
    X: Single;
    Y: Single;
  public
    function Create(const P : TPointF): TPointF; overload;
    function Create(const X, Y : Single): TPointF; overload;
    function Create(P : TPoint): TPointF; overload;

    function Distance(const P2 : TPointF) : Double;

    procedure SetLocation(const X, Y : Single); overload;
    procedure SetLocation(const P : TPointF); overload;
    procedure SetLocation(const P : TPoint); overload;

    procedure Offset(const DX, DY : Single); overload;
    procedure Offset(const Point: TPointF); overload;
    procedure Offset(const Point: TPoint); overload;

    function Add(const Point: TPointF): TPointF; overload;
    function Add(const Point: TPoint): TPointF; overload;

    function Subtract(const Point: TPointF): TPointF; overload;
    function Subtract(const Point: TPoint): TPointF; overload;
    function IsZero : Boolean;

    function Ceiling : TPoint;
    function Truncate : TPoint;
    function Round : TPoint;
  end;

  PRectF = ^TRectF;
  TRectF = record
    Left, Top, Right, Bottom: Single;
  public
    function GetWidth : Single;
    procedure SetWidth(const Value: Single);
    function GetHeight : Single;
    procedure SetHeight(const Value : Single);
    function GetSize : TSizeF;
    procedure SetSize(const Value: TSizeF);
    function GetLocation : TPointF;
    function GetBottomRight: TPointF;
    procedure SetBottomRight(const Value: TPointF);
    function GetTopLeft: TPointF;
    procedure SetTopLeft(const Value: TPointF);
  public
    function Create(const Origin : TPointF): TRectF; overload;                               // empty rect at given origin
    function Create(const Origin : TPointF; const Width, Height : Single): TRectF; overload; // at TPoint of origin with width and height
    function Create(const Left, Top, Right, Bottom : Single): TRectF; overload;              // at x, y with width and height
    function Create(const P1, P2 : TPointF; Normalize : Boolean = False): TRectF; overload;  // with corners specified by p1 and p2
    function Create(const R : TRectF; Normalize : Boolean = False): TRectF; overload;
    function Create(const R : TRect; Normalize : Boolean = False): TRectF; overload;

    function Empty : TRectF; static;

    //utility methods
    //makes sure TopLeft is above and to the left of BottomRight
    procedure NormalizeRect;

    //returns true if left = right or top = bottom
    function IsEmpty : Boolean;

    //returns true if the point is inside the rect
    function Contains(const Pt : TPointF): Boolean; overload;

    // returns true if the rect encloses R completely
    function Contains(const R : TRectF): Boolean; overload;

    // returns true if any part of the rect covers R
    function IntersectsWith(const R : TRectF): Boolean;

    // computes an intersection of R1 and R2
    function Intersect(const R1 : TRectF; const R2 : TRectF): TRectF; overload; static;

    // replaces current rectangle with its intersection with R
    procedure Intersect(const R : TRectF); overload;

    // computes a union of R1 and R2
    function Union(const R1 : TRectF; const R2 : TRectF): TRectF; overload; static;

    // replaces current rectangle with its union with R
    procedure Union(const R: TRectF); overload;

    // creates a minimal rectangle that contains all points from array Points
    function Union(const Points : Array of TPointF) : TRectF; overload; static;

    // offsets the rectangle origin relative to current position
    procedure Offset(const DX, DY : Single); overload;
    procedure Offset(const Point : TPointF); overload;

    // sets new origin
    procedure SetLocation(const X, Y : Single); overload;
    procedure SetLocation(const Point : TPointF); overload;

    // inflate by DX and DY
    procedure Inflate(const DX, DY : Single); overload;

    // inflate in all directions
    procedure Inflate(const DL, DT, DR, DB : Single); overload;

    //returns the center point of the rectangle;
    function CenterPoint : TPointF;

    function Ceiling : TRect;
    function Truncate : TRect;
    function Round : TRect;

    {
    function SplitRect(SplitType : TSplitRectType; Size : Integer): TRect; overload;
    function SplitRect(SplitType : TSplitRectType; Percent : Double): TRect; overload;
    }

    // changing the width is always relative to Left;
    property Width : Single read GetWidth write SetWidth;
    // changing the Height is always relative to Top
    property Height : Single read GetHeight write SetHeight;

    property Size: TSizeF read GetSize write SetSize;

    property Location: TPointF read GetLocation write SetLocation;
    property TopLeft: TPointF read GetTopLeft write SetTopLeft;
    property BottomRight: TPointF read GetBottomRight write SetBottomRight;
  end;

  TPolygon = array of TPointF;

  TCubicBezier = array [0..3] of TPointF;

  TVectorArray = array [0..2] of Single;

  TVector = record
    case Integer of
      0: (V: TVectorArray;);
      1: (X: Single;
          Y: Single;
          W: Single;);
  end;

  TMatrixArray = array [0..2] of TVector;

  TMatrix = record
    case Integer of
      0: (M: TMatrixArray;);
      1: (m11, m12, m13: Single;
          m21, m22, m23: Single;
          m31, m32, m33: Single);
  end;

///////////////////////////////////////////
// START Observers
///////////////////////////////////////////

{$SCOPEDENUMS OFF}

  IObserver = interface;
  TObserverToggleEvent = procedure(const AObserver: IObserver; const Value: Boolean) of object;
  IObserver = interface
    ['{B03253D8-7720-4B68-B10A-E3E79B91ECD3}']
//    procedure Removed;
//    function GetActive: Boolean;
//    procedure SetActive(Value: Boolean);
    function GetOnObserverToggle: TObserverToggleEvent;
    procedure SetOnObserverToggle(AEvent: TObserverToggleEvent);
    property OnObserverToggle: TObserverToggleEvent read GetOnObserverToggle write SetOnObserverToggle;
//    property Active: Boolean read GetActive write SetActive;
  end;

  ISingleCastObserver = interface(IObserver)
    ['{D0395F17-52AA-4515-93A5-5B292F03AA7B}']
  end;

  IMultiCastObserver = interface(IObserver)
    ['{C19CB01E-1233-4405-8A30-7987DF2C3690}']
  end;

  IEditLinkObserver = interface(ISingleCastObserver)
    ['{E88C2705-7C5A-4E66-9B81-447D05D5E640}']
    procedure Update;
    function Edit: Boolean;
    procedure Reset;
    procedure Modified;
//    function IsModified: Boolean;
    function IsValidChar(AKey: Char): Boolean;
//    function IsRequired: Boolean;
    function GetIsReadOnly: Boolean;
    procedure SetIsReadOnly(Value: Boolean);
    property IsReadOnly: Boolean read GetIsReadOnly write SetIsReadOnly;
    function GetIsEditing: Boolean;
    property IsEditing: Boolean read GetIsEditing;
  end;

  TObserverGetCurrentEvent = function: TVarRec of object;
  IEditGridLinkObserver = interface(IEditLinkObserver)
    ['{A911B648-E1E5-4EEC-9FEE-D8E62FFA0E71}']
//    function GetCurrent: TVarRec;
//    property Current: TVarRec read GetCurrent;
    function GetOnObserverCurrent: TObserverGetCurrentEvent;
    procedure SetOnObserverCurrent(AEvent: TObserverGetCurrentEvent);
    property OnObserverCurrent: TObserverGetCurrentEvent read GetOnObserverCurrent write SetOnObserverCurrent;
  end;

  IPositionLinkObserver = interface
    ['{FA45CF0C-E8DB-4F9E-B53F-E072C94659F6}']
    procedure PosChanged;
  end;

  TObservers = class
//  public type
//    TCanObserveEvent = reference to function(const ID: Integer): Boolean;
//    TObserverAddedEvent = reference to procedure(const ID: Integer; const Observer: IObserver);
//  private
//    FObservers: TStringList; //Dictionary of ID (integer key) and IInterfaceList (value)
//    FInterfaces: IInterfaceList;
//    FCanObserve: TCanObserveEvent;
//    FObserverAdded: TObserverAddedEvent;
//  protected
//  public
//    constructor Create;
//    destructor Destroy; override;
//    property OnCanObserve: TCanObserveEvent read FCanObserve write FCanObserve;
//    property OnObserverAdded: TObserverAddedEvent read FObserverAdded write FObserverAdded;
//
//    function CanObserve(const ID: Integer): Boolean; overload; virtual;
//    procedure AddObserver(const ID: Integer; const AIntf: IInterface); overload; virtual;
//    procedure AddObserver(const IDs: Array of Integer; const AIntf: IInterface); overload; virtual;
//    procedure RemoveObserver(const ID: Integer; const AIntf: IInterface); overload; virtual;
//    procedure RemoveObserver(const IDs: Array of Integer; const AIntf: IInterface); overload; virtual;
    function IsObserving(const ID: Integer): Boolean; overload; virtual;
//    function TryIsObserving(const ID: Integer; out AIntf: IInterface): Boolean; virtual;
//    function GetSingleCastObserver(const ID: Integer): IInterface;
    function GetMultiCastObserver(const ID: Integer): IInterfaceList;
  end;

  TLinkObserverTypes = (EditLinkObserver, EditGridLinkObserver, LookupLinkObserver);

  TLinkObservers = class
  public
//    class function GetEditGridLink(AObservers: TObservers): IEditGridLinkObserver; static;
    class function GetEditLink(AObservers: TObservers): IEditLinkObserver; static;
    class procedure EditLinkUpdate(AObservers: TObservers); static; inline;
    class procedure EditLinkReset(AObservers: TObservers); static; inline;
    class procedure EditLinkModified(AObservers: TObservers); static; inline;
//    class function EditLinkIsModified(AObservers: TObservers): Boolean; static; inline;
    class function EditLinkIsValidChar(AObservers: TObservers; AKey: Char): Boolean; static; inline;
    class function EditLinkIsEditing(AObservers: TObservers): Boolean; static; inline;
    class function EditLinkEdit(AObservers: TObservers): Boolean; static; inline;
    class procedure EditLinkSetIsReadOnly(AObservers: TObservers; AValue: Boolean); static; inline;
    class function EditLinkIsReadOnly(AObservers: TObservers): Boolean; static; inline;
//
    class procedure EditGridLinkUpdate(AObservers: TObservers); static; inline;
    class procedure EditGridLinkReset(AObservers: TObservers); static; inline;
    class procedure EditGridLinkModified(AObservers: TObservers); static; inline;
//    class function EditGridLinkIsModified(AObservers: TObservers): Boolean; static; inline;
    class function EditGridLinkIsValidChar(AObservers: TObservers; AKey: Char): Boolean; static; inline;
    class function EditGridLinkIsEditing(AObservers: TObservers): Boolean; static; inline;
    class function EditGridLinkEdit(AObservers: TObservers): Boolean; static; inline;
    class function EditGridLinkIsReadOnly(AObservers: TObservers): Boolean; static; inline;
    class procedure EditGridLinkSetIsReadOnly(AObservers: TObservers; AValue: Boolean); static; inline;

    class procedure PositionLinkPosChanged(AObservers: TObservers); static;
    class procedure ListSelectionChanged(AObservers: TObservers); static;

  end;

  TObserverMapping = class
  public const
    EditLinkID = 1;
    EditGridLinkID = 2;
    PositionLinkID = 3;
    MappedID = 100;
//  private
//    FMappings: TStringList;
//    class var
//      FInstance: TObserverMapping;
//  protected
//    class function Instance: TObserverMapping;
//  public
//    constructor Create;
//    destructor Destroy; override;
//    class destructor Destroy;
//    class function GetObserverID(const Key: string): Integer;
  end;

  EObserverException = class(Exception);

{$SCOPEDENUMS ON}


///////////////////////////////////////////
// END Observers
///////////////////////////////////////////

function PointF(X, Y: Single): TPointF; inline; overload;
procedure InflateRect(var R: TRectF; const DX, DY: Single); overload;
function OffsetRect(var R: TRectF; DX, DY: Single): Boolean; overload;
function RectF(Left, Top, Right, Bottom: Single): TRectF; inline; overload;
function RectHeight(const Rect: TRectF): Single; inline; overload;
function RectWidth(const Rect: TRectF): Single; inline; overload;
function PointF(const V: TVector): TPointF; inline; overload;
function UnionRect(out Rect: TRectF; const R1, R2: TRectF): Boolean; overload;
function UnionRect(const ARect1, ARect2: TRectF): TRectF; inline; overload;
function IntersectRect(out Rect: TRectF; const R1, R2: TRectF): Boolean; overload;
function IntersectRect(const Rect1, Rect2: TRectF): Boolean; overload;
function EqualRect(const R1, R2: TRectF): Boolean; overload;
function RectCenter(var R: TRectF; const Bounds: TRectF): TRectF; overload;
procedure MultiplyRect(var R: TRectF; const DX, DY: Single);
function NormalizeRectF(const Pts: array of TPointF): TRectF; overload;

const
  cPI: Single = 3.141592654;
  cPIdiv180: Single = 0.017453292;
  c180divPI: Single = 57.29577951;
  c2PI: Single = 6.283185307;
  cPIdiv2: Single = 1.570796326;
  cPIdiv4: Single = 0.785398163;
  c3PIdiv4: Single = 2.35619449;
  cInv2PI: Single = 1 / 6.283185307;
  cInv360: Single = 1 / 360;
  c180: Single = 180;
  c360: Single = 360;
  cOneHalf: Single = 0.5;

  CurveKappa = 0.5522847498;
  CurveKappaInv = 1 - CurveKappa;

  Epsilon: Single = 1E-40;
  Epsilon2: Single = 1E-30;

  Space = #32;
  BOM_LSB_FIRST = #$FEFF;
  BOM_MSB_FIRST = #$FFFE;

resourcestring
  sObserverUnsupported = 'Observer is not supported';
  sObserverNoInterface = 'The object does not implement the observer interface';
  sObserverNoSinglecastFound = 'No single cast observer with guid %s was added to the observer factory';
  sObserverNoMulticastFound = 'No multi cast observer with guid %s was added to the observer factory';
  sObserverNotAvailable = 'Observer is not available';


{$ENDIF}

