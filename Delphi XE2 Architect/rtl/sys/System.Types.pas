{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit System.Types;

interface

type
  PLongint = System.PLongint;
  {$EXTERNALSYM PLongint}
  PInteger = System.PInteger;
  {$EXTERNALSYM PInteger}
  PSmallInt = System.PSmallInt;
  {$EXTERNALSYM PSmallInt}
  PDouble = System.PDouble;
  {$EXTERNALSYM PDouble}
  PByte = System.PByte;
  {$EXTERNALSYM PByte}

  TIntegerDynArray      = array of Integer;
  {$EXTERNALSYM TIntegerDynArray '::System::TIntegerDynArray'}
  TCardinalDynArray     = array of Cardinal;
  {$EXTERNALSYM TCardinalDynArray '::System::TCardinalDynArray'}
  TWordDynArray         = array of Word;
  {$EXTERNALSYM TWordDynArray '::System::TWordDynArray'}
  TSmallIntDynArray     = array of SmallInt;
  {$EXTERNALSYM TSmallIntDynArray '::System::TSmallIntDynArray'}
  TByteDynArray         = array of Byte;
  {$EXTERNALSYM TByteDynArray '::System::TByteDynArray'}
  TShortIntDynArray     = array of ShortInt;
  {$EXTERNALSYM TShortIntDynArray '::System::TShortIntDynArray'}
  TInt64DynArray        = array of Int64;
  {$EXTERNALSYM TInt64DynArray '::System::TInt64DynArray'}
  TLongWordDynArray     = array of LongWord;
  {$EXTERNALSYM TLongWordDynArray '::System::TLongWordDynArray'}
  TSingleDynArray       = array of Single;
  {$EXTERNALSYM TSingleDynArray '::System::TSingleDynArray'}
  TDoubleDynArray       = array of Double;
  {$EXTERNALSYM TDoubleDynArray '::System::TDoubleDynArray'}
  TBooleanDynArray      = array of Boolean;
  {$EXTERNALSYM TBooleanDynArray '::System::TBooleanDynArray'}
  TStringDynArray       = array of string;
  {$EXTERNALSYM TStringDynArray '::System::TStringDynArray'}
  TWideStringDynArray   = array of WideString;
  {$EXTERNALSYM TWideStringDynArray '::System::TWideStringDynArray'}

  {$NODEFINE TSize}
  {$NODEFINE PSize}

  PSize = ^TSize;
  TSize = record
    cx: Longint;
    cy: Longint;
  public
    constructor Create(P : TSize); overload;
    constructor Create(const X, Y : Integer); overload;
    // operator overloads
    class operator Equal(const Lhs, Rhs : TSize) : Boolean;
    class operator NotEqual(const Lhs, Rhs : TSize): Boolean;
    class operator Add(const Lhs, Rhs : TSize): TSize;
    class operator Subtract(const Lhs, Rhs : TSize): TSize;

    // methods
    function Add(const Point: TSize): TSize;
    function Distance(const P2 : TSize) : Double;
    function IsZero : Boolean;
    function Subtract(const Point: TSize): TSize;

    // properties
    property Width: Integer read cx write cx;
    property Height: Integer read cy write cy;
  end;

  {$EXTERNALSYM tagSIZE}
  SIZE = TSize;
  tagSize = TSize;

  {$EXTERNALSYM SIZE}

  {$NODEFINE TSmallPoint}
  {$NODEFINE PSmallPoint}

  PSmallPoint = ^TSmallPoint;
  TSmallPoint = record
    x: SmallInt;
    y: SmallInt;
  public
    constructor Create(P : TSmallPoint); overload;
    constructor Create(const X, Y : Word); overload;
    constructor Create(const X, Y : SmallInt); overload;

    // operator overloads
    class operator Equal(const Lhs, Rhs : TSmallPoint) : Boolean;
    class operator NotEqual(const Lhs, Rhs : TSmallPoint): Boolean;
    class operator Add(const Lhs, Rhs : TSmallPoint): TSmallPoint;
    class operator Subtract(const Lhs, Rhs : TSmallPoint): TSmallPoint;

    // methods
    function Add(const Point: TSmallPoint): TSmallPoint;
    function Distance(const P2 : TSmallPoint) : Double;
    function IsZero : Boolean;
    function Subtract(const Point: TSmallPoint): TSmallPoint;
  end;

  PPoint = ^TPoint;
  TPoint = record
    X: Longint;
    Y: Longint;
  public
    constructor Create(P : TPoint); overload;
    constructor Create(const X, Y : Integer); overload;

    //operator overloads
    class operator Equal(const Lhs, Rhs : TPoint) : Boolean;
    class operator NotEqual(const Lhs, Rhs : TPoint): Boolean;
    class operator Add(const Lhs, Rhs : TPoint): TPoint;
    class operator Subtract(const Lhs, Rhs : TPoint): TPoint;
{$IFDEF FALSE}
    class operator Explicit(const Size: TSize): TPoint;
    class operator Explicit(const Point: TPoint): TSize;
    class operator Explicit(const SmallPoint: TSmallPoint): TPoint;
    class operator Explicit(const Point: TPoint): TSmallPoint;
    class operator Implicit(const Size: TSize): TPoint;
    class operator Implicit(const Point: TPoint): TSize;
{$ENDIF}

    class operator Implicit(Value: TSmallPoint): TPoint;
    class operator Explicit(Value: TPoint): TSmallPoint;

    function Distance(const P2 : TPoint) : Double;

    procedure SetLocation(const X, Y : Integer); overload;
    procedure SetLocation(const P : TPoint); overload;
    procedure Offset(const DX, DY : Integer); overload;
    procedure Offset(const Point: TPoint); overload;
    function Add(const Point: TPoint): TPoint;
    function Subtract(const Point: TPoint): TPoint;
    function IsZero : Boolean;
  end;

  {$NODEFINE TPoint}
  tagPOINT = TPoint;
  {$NODEFINE tagPOINT}

type
  TSplitRectType = (
    srLeft,
    srRight,
    srTop,
    srBottom
  );

  PRect = ^TRect;
  TRect = record
  private
    function GetWidth: Integer;
    procedure SetWidth(const Value: Integer);
    function GetHeight: Integer;
    procedure SetHeight(const Value: Integer);
    function GetSize: TSize;
    procedure SetSize(const Value: TSize);
    function GetLocation: TPoint;
  public
    constructor Create(const Origin: TPoint); overload;                              // empty rect at given origin
    constructor Create(const Origin: TPoint; Width, Height: Integer); overload;      // at TPoint of origin with width and height
    constructor Create(const Left, Top, Right, Bottom: Integer); overload;    	     // at x, y with width and height
    constructor Create(const P1, P2: TPoint; Normalize: Boolean = False); overload;  // with corners specified by p1 and p2
    constructor Create(const R: TRect; Normalize: Boolean = False); overload;

    // operator overloads
    class operator Equal(const Lhs, Rhs: TRect): Boolean;
    class operator NotEqual(const Lhs, Rhs: TRect): Boolean;

    // union of two rectangles
    class operator Add(const Lhs, Rhs: TRect): TRect;

    // intersection of two rectangles
    class operator Multiply(const Lhs, Rhs: TRect): TRect;

    class function Empty: TRect; inline; static;

    //utility methods
    //makes sure TopLeft is above and to the left of BottomRight
    procedure NormalizeRect;

    //returns true if left = right or top = bottom
    function IsEmpty: Boolean;

    //returns true if the point is inside the rect
    function Contains(const Pt: TPoint): Boolean; overload;

    // returns true if the rect encloses R completely
    function Contains(const R: TRect): Boolean; overload;

    // returns true if any part of the rect covers R
    function IntersectsWith(const R: TRect): Boolean;

    // computes an intersection of R1 and R2
    class function Intersect(const R1: TRect; const R2: TRect): TRect; overload; static;

    // replaces current rectangle with its intersection with R
    procedure Intersect(const R: TRect); overload;

    // computes a union of R1 and R2
    class function Union(const R1: TRect; const R2: TRect): TRect; overload; static;

    // replaces current rectangle with its union with R
    procedure Union(const R: TRect); overload;

    // creates a minimal rectangle that contains all points from array Points
    class function Union(const Points: Array of TPoint): TRect; overload; static;

    // offsets the rectangle origin relative to current position
    procedure Offset(const DX, DY: Integer); overload;
    procedure Offset(const Point: TPoint); overload;

    // sets new origin
    procedure SetLocation(const X, Y: Integer); overload;
    procedure SetLocation(const Point: TPoint); overload;

    // inflate by DX and DY
    procedure Inflate(const DX, DY: Integer); overload;

    // inflate in all directions
    procedure Inflate(const DL, DT, DR, DB: Integer); overload;

    //returns the center point of the rectangle;
    function CenterPoint: TPoint;

    function SplitRect(SplitType: TSplitRectType; Size: Integer): TRect; overload;
    function SplitRect(SplitType: TSplitRectType; Percent: Double): TRect; overload;

    // changing the width is always relative to Left;
    property Width: Integer read GetWidth write SetWidth;
    // changing the Height is always relative to Top
    property Height: Integer read GetHeight write SetHeight;

    property Size: TSize read GetSize write SetSize;

    property Location: TPoint read GetLocation write SetLocation;

  case Integer of
    0: (Left, Top, Right, Bottom: Longint);
    1: (TopLeft, BottomRight: TPoint);
  end;
  {$NODEFINE TRect}

  PPointF = ^TPointF;
  TPointF = record
    X: Single;
    Y: Single;
  public
    constructor Create(const P: TPointF); overload;
    constructor Create(const X, Y: Single); overload;
    constructor Create(P: TPoint); overload;

    //operator overloads
    class operator Equal(const Lhs, Rhs: TPointF): Boolean;
    class operator NotEqual(const Lhs, Rhs: TPointF): Boolean;
    class operator Add(const Lhs, Rhs: TPointF): TPointF;
    class operator Subtract(const Lhs, Rhs: TPointF): TPointF;

    function Distance(const P2: TPointF): Double;

    procedure SetLocation(const X, Y: Single); overload;
    procedure SetLocation(const P: TPointF); overload;
    procedure SetLocation(const P: TPoint); overload;

    procedure Offset(const DX, DY: Single); overload;
    procedure Offset(const Point: TPointF); overload;
    procedure Offset(const Point: TPoint); overload;

    function Add(const Point: TPointF): TPointF; overload;
    function Add(const Point: TPoint): TPointF; overload;

    function Subtract(const Point: TPointF): TPointF; overload;
    function Subtract(const Point: TPoint): TPointF; overload;
    function IsZero: Boolean;

    function Ceiling: TPoint;
    function Truncate: TPoint;
    function Round: TPoint;
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

  {$NODEFINE TPointF}
  tagPOINTF = TPointF;
  {$NODEFINE tagPOINTF}

  PSizeF = ^TSizeF;
  TSizeF = record
    cx: Single;
    cy: Single;
  public
    constructor Create(P: TSizeF); overload;
    constructor Create(const X, Y: Single); overload;
    // operator overloads
    class operator Equal(const Lhs, Rhs: TSizeF): Boolean;
    class operator NotEqual(const Lhs, Rhs: TSizeF): Boolean;
    class operator Add(const Lhs, Rhs: TSizeF): TSizeF;
    class operator Subtract(const Lhs, Rhs: TSizeF): TSizeF;

    class operator Implicit(const Size: TSizeF): TPointF;
    class operator Implicit(const Point: TPointF): TSizeF;
    class operator Implicit(const Size: TSize): TSizeF;

    function Ceiling: TSize;
    function Truncate: TSize;
    function Round: TSize;

    // metods
    function Add(const Point: TSizeF): TSizeF;
    function Subtract(const Point: TSizeF): TSizeF;
    function Distance(const P2: TSizeF): Double;
    function IsZero: Boolean;
    // properties
    property Width: Single read cx write cx;
    property Height: Single read cy write cy;
  end;

  PRectF = ^TRectF;
  TRectF = record
  private
    function GetWidth: Single;
    procedure SetWidth(const Value: Single);
    function GetHeight: Single;
    procedure SetHeight(const Value: Single);
    function GetSize: TSizeF;
    procedure SetSize(const Value: TSizeF);
    function GetLocation: TPointF;
  public
    constructor Create(const Origin: TPointF); overload;                               // empty rect at given origin
    constructor Create(const Origin: TPointF; const Width, Height: Single); overload; // at TPoint of origin with width and height
    constructor Create(const Left, Top, Right, Bottom: Single); overload;              // at x, y with width and height
    constructor Create(const P1, P2: TPointF; Normalize: Boolean = False); overload;  // with corners specified by p1 and p2
    constructor Create(const R: TRectF; Normalize: Boolean = False); overload;
    constructor Create(const R: TRect; Normalize: Boolean = False); overload;

    // operator overloads
    class operator Equal(const Lhs, Rhs: TRectF): Boolean;
    class operator NotEqual(const Lhs, Rhs: TRectF): Boolean;

    // union of two rectangles
    class operator Add(const Lhs, Rhs: TRectF): TRectF;

    // intersection of two rectangles
    class operator Multiply(const Lhs, Rhs: TRectF): TRectF;

    class function Empty: TRectF; inline; static;

    //utility methods
    //makes sure TopLeft is above and to the left of BottomRight
    procedure NormalizeRect;

    //returns true if left = right or top = bottom
    function IsEmpty: Boolean;

    //returns true if the point is inside the rect
    function Contains(const Pt: TPointF): Boolean; overload;

    // returns true if the rect encloses R completely
    function Contains(const R: TRectF): Boolean; overload;

    // returns true if any part of the rect covers R
    function IntersectsWith(const R: TRectF): Boolean;

    // computes an intersection of R1 and R2
    class function Intersect(const R1: TRectF; const R2: TRectF): TRectF; overload; static;

    // replaces current rectangle with its intersection with R
    procedure Intersect(const R: TRectF); overload;

    // computes a union of R1 and R2
    class function Union(const R1: TRectF; const R2: TRectF): TRectF; overload; static;

    // replaces current rectangle with its union with R
    procedure Union(const R: TRectF); overload;

    // creates a minimal rectangle that contains all points from array Points
    class function Union(const Points: Array of TPointF): TRectF; overload; static;

    // offsets the rectangle origin relative to current position
    procedure Offset(const DX, DY: Single); overload;
    procedure Offset(const Point: TPointF); overload;

    // sets new origin
    procedure SetLocation(const X, Y: Single); overload;
    procedure SetLocation(const Point: TPointF); overload;

    // inflate by DX and DY
    procedure Inflate(const DX, DY: Single); overload;

    // inflate in all directions
    procedure Inflate(const DL, DT, DR, DB: Single); overload;

    //returns the center point of the rectangle;
    function CenterPoint: TPointF;

    function Ceiling: TRect;
    function Truncate: TRect;
    function Round: TRect;

    {
    function SplitRect(SplitType: TSplitRectType; Size: Integer): TRect; overload;
    function SplitRect(SplitType: TSplitRectType; Percent: Double): TRect; overload;
    }

    // changing the width is always relative to Left;
    property Width: Single read GetWidth write SetWidth;
    // changing the Height is always relative to Top
    property Height: Single read GetHeight write SetHeight;

    property Size: TSizeF read GetSize write SetSize;

    property Location: TPointF read GetLocation write SetLocation;

  case Integer of
    0: (Left, Top, Right, Bottom: Single);
    1: (TopLeft, BottomRight: TPointF);
  end;
  {$NODEFINE TPointF}
  {$NODEFINE TRectF}
  {$NODEFINE TSizeF}

  (*$HPPEMIT '#include <math.h>'*)
{$IFDEF MSWINDOWS}
  (*$HPPEMIT '#include <ocidl.h>'*)
{$ENDIF}
  (*$HPPEMIT OPENNAMESPACE*)
  (*$HPPEMIT '  struct TSmallPoint {'*)
  (*$HPPEMIT '    short x;'*)
  (*$HPPEMIT '    short y;'*)
  (*$HPPEMIT '    '*)
  (*$HPPEMIT '    static TSmallPoint Create(const short x, const short y) '*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '        TSmallPoint sp;'*)
  (*$HPPEMIT '        sp.x = x;'*)
  (*$HPPEMIT '        sp.y = y;'*)
  (*$HPPEMIT '        return sp;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TSmallPoint& init(short ix, short iy) '*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '        x = ix;'*)
  (*$HPPEMIT '        y = iy;'*)
  (*$HPPEMIT '        return *this;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool operator ==(const TSmallPoint& sp) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '        return x == sp.x && y == sp.y;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT '    '*)
  (*$HPPEMIT '    bool operator !=(const TSmallPoint& sp) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '        return !(*this == sp );'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT '    '*)
  (*$HPPEMIT '    TSmallPoint operator +(const TSmallPoint& sp) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '        TSmallPoint res;'*)
  (*$HPPEMIT '        return res.init((short)(this->x + sp.x), (short)(this->y + sp.y));'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT '    '*)
  (*$HPPEMIT '    TSmallPoint operator -(const TSmallPoint& sp) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '        TSmallPoint res;'*)
  (*$HPPEMIT '        return res.init((short)(this->x - sp.x), (short)(this->y - sp.y));'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT '    '*)
  (*$HPPEMIT '    TSmallPoint& operator +=(const TSmallPoint& rhs) '*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '        this->x += rhs.x;'*)
  (*$HPPEMIT '        this->y += rhs.y;'*)
  (*$HPPEMIT '        return *this;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT '    '*)
  (*$HPPEMIT '    TSmallPoint& operator -=(const TSmallPoint& rhs) '*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '        this->x -= rhs.x;'*)
  (*$HPPEMIT '        this->y -= rhs.y;'*)
  (*$HPPEMIT '        return *this;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ' '*)
  (*$HPPEMIT '    bool IsZero() const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '        return !x && !y;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT '    '*)
  (*$HPPEMIT '    double Distance(const TSmallPoint& p2) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '        return hypot(p2.x - this->x, p2.y - this->y);'*)
  (*$HPPEMIT '    } '*)
  (*$HPPEMIT '  };'*)
  (*$HPPEMIT '  '*)
  (*$HPPEMIT '  struct TSize: public tagSIZE {'*)
  (*$HPPEMIT '    TSize() {'*)
  (*$HPPEMIT '        this->cx = this->cy = 0;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT '  '*)
  (*$HPPEMIT '    TSize(const tagSIZE& ts) '*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '        this->cx = ts.cx;'*)
  (*$HPPEMIT '        this->cy = ts.cy;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT '    '*)
  (*$HPPEMIT '    TSize(int32_t x, int32_t y) '*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '        this->cx = x;'*)
  (*$HPPEMIT '        this->cy = y;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT '    '*)
  (*$HPPEMIT '    bool operator ==(const TSize& ts) const {'*)
  (*$HPPEMIT '        return this->cx == ts.cx && this->cy == ts.cy;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT '    '*)
  (*$HPPEMIT '    bool operator !=(const TSize& ts) const {'*)
  (*$HPPEMIT '        return !(*this == ts);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT '    '*)
  (*$HPPEMIT '    TSize operator +(const TSize& rhs) const {'*)
  (*$HPPEMIT '        return TSize(this->cx + rhs.cx, this->cy + rhs.cy);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT '    '*)
  (*$HPPEMIT '    TSize operator -(const TSize& rhs) const {'*)
  (*$HPPEMIT '        return TSize(this->cx - rhs.cx, this->cy - rhs.cy);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT '    '*)
  (*$HPPEMIT '    TSize& operator+= (const TSize& rhs) {'*)
  (*$HPPEMIT '        this->cx += rhs.cx;'*)
  (*$HPPEMIT '        this->cy += rhs.cy;'*)
  (*$HPPEMIT '        return *this;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT '    '*)
  (*$HPPEMIT '    TSize& operator-= (const TSize& rhs) {'*)
  (*$HPPEMIT '        this->cx -= rhs.cx;'*)
  (*$HPPEMIT '        this->cy -= rhs.cy;'*)
  (*$HPPEMIT '        return *this;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT '    '*)
  (*$HPPEMIT '    bool IsZero() const {'*)
  (*$HPPEMIT '        return !cx && !cy;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    __property LONG Width =  { read=cx,   write=cx  };'*)
  (*$HPPEMIT '    __property LONG Height = { read=cy,   write=cy  };'*)
  (*$HPPEMIT '  };'*)
  (*$HPPEMIT '  '*)
  (*$HPPEMIT '  typedef TSize* PSize;'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '  struct TPoint: public POINT'*)
  (*$HPPEMIT '  {'*)
  (*$HPPEMIT '    TPoint() { x = y = 0; }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TPoint(int _x, int _y) { x=_x; y=_y; }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TPoint(const POINT& pt)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      x = pt.x;'*)
  (*$HPPEMIT '      y = pt.y;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ' '*)
  (*$HPPEMIT '    bool operator ==(const TPoint& pt) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return (x == pt.x) && (y == pt.y);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool operator !=(const TPoint& pt) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return !(pt == *this);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TPoint operator +(const TPoint& rhs) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return TPoint(rhs.x + this->x, rhs.y + this->y);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TPoint operator -(const TPoint& rhs) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return TPoint(this->x - rhs.x, this->y - rhs.y );'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TPoint& operator +=(const TPoint& rhs)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      this->x += rhs.x;'*)
  (*$HPPEMIT '      this->y += rhs.y;'*)
  (*$HPPEMIT '      return *this;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TPoint& operator -=(const TPoint& rhs)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      this->x -= rhs.x;'*)
  (*$HPPEMIT '      this->y -= rhs.y;'*)
  (*$HPPEMIT '      return *this;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool IsZero() const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return !x && !y;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ' '*)
  (*$HPPEMIT '    /// Left for compatibility'*)
  (*$HPPEMIT '    bool IsEmpty() const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return IsZero();'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ' '*)
  (*$HPPEMIT '    void Offset(int DX, int DY)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      x += DX;'*)
  (*$HPPEMIT '      y += DY;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ' '*)
  (*$HPPEMIT '    void SetLocation(int nX, int nY)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      x = nX;'*)
  (*$HPPEMIT '      y = nY;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void SetLocation(const TPoint& p)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      x = p.x;'*)
  (*$HPPEMIT '      y = p.y;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ' '*)
  (*$HPPEMIT '    double Distance(const TPoint& p2) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return hypot(p2.x - this->x, p2.y - this->y);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ' '*)
  (*$HPPEMIT '    static int __fastcall _sqr(int i) // Helper - private?'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '       return i*i;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool PtInCircle(const TPoint& CircleCenter, int Radius) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return (Radius > 0) && ((_sqr(CircleCenter.x-x)+_sqr(CircleCenter.y-y)) < _sqr(Radius));'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    __property LONG X = { read=x,   write=x  };'*)
  (*$HPPEMIT '    __property LONG Y = { read=y,   write=y  };'*)
  (*$HPPEMIT '  };'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '  typedef TPoint tagPoint;'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '  struct TRect: public RECT'*)
  (*$HPPEMIT '  {'*)
  (*$HPPEMIT '    TRect() { init(0,0,0,0); }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TRect(const TPoint& TL)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      init(TL.x, TL.y, TL.x, TL.y);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TRect(const TPoint& TL, int width, int height)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      init (TL.x, TL.y, TL.x + width, TL.y + height);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT '    TRect(int l, int t, int r, int b)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      init(l, t, r, b);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT '    TRect(const TPoint& TL, const TPoint& BR)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      init(TL.x, TL.y, BR.x, BR.y);'*)
  (*$HPPEMIT '      Normalize();'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TRect(const RECT& r)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      init(r.left, r.top, r.right, r.bottom);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void init(int l, int t, int r, int b)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      left = l; top = t;'*)
  (*$HPPEMIT '      right = r; bottom = b;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TPoint& TopLeft()                 { return *((TPoint* )this); }'*)
  (*$HPPEMIT '    TPoint& BottomRight()             { return *((TPoint* )this+1); }'*)
  (*$HPPEMIT '    const TPoint& TopLeft() const     { return *((TPoint* )this); }'*)
  (*$HPPEMIT '    const TPoint& BottomRight() const { return *((TPoint* )this+1); }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    int Width() const  { return right  - left; }'*)
  (*$HPPEMIT '    int Height() const { return bottom - top ; }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    static TRect Empty() { return TRect(); }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void Normalize()'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      if (top > bottom) {'*)
  (*$HPPEMIT '        top = top ^ bottom;'*)
  (*$HPPEMIT '        bottom = top ^ bottom;'*)
  (*$HPPEMIT '        top = top ^ bottom;'*)
  (*$HPPEMIT '      }'*)
  (*$HPPEMIT '      if (left > right) {'*)
  (*$HPPEMIT '        left = left ^ right;'*)
  (*$HPPEMIT '        right = left ^ right;'*)
  (*$HPPEMIT '        left = left ^ right;'*)
  (*$HPPEMIT '      }'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool operator ==(const TRect& rc) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '       return left ==  rc.left  && top==rc.top &&'*)
  (*$HPPEMIT '              right == rc.right && bottom==rc.bottom;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool operator !=(const TRect& rc) const'*)
  (*$HPPEMIT '    {  return !(rc==*this); }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool IsEmpty() const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return (right == left) || (bottom == top);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool Contains(const TPoint& p) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return ((p.x >= left) && (p.y >= top) && (p.x < right) && (p.y < bottom));'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool PtInRect(const TPoint& p) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return Contains(p);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool Contains(const TRect& r) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return Contains(r.TopLeft()) && Contains(r.BottomRight());'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool Overlaps(const TRect &r) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return IntersectsWith(r);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool Intersects(const TRect &r) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return IntersectsWith(r);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool IntersectsWith(const TRect &r) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return !( (BottomRight().x < r.TopLeft().x) ||'*)
  (*$HPPEMIT '                (BottomRight().y < r.TopLeft().y) ||'*)
  (*$HPPEMIT '                (r.BottomRight().x < TopLeft().x) ||'*)
  (*$HPPEMIT '                (r.BottomRight().y < TopLeft().y) );'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    static TRect Intersect(const TRect &r1, const TRect &r2);'*)
  (*$HPPEMIT '    void Intersect(const TRect &r);'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void Union(const TRect &r);'*)
  (*$HPPEMIT '    static TRect Union(const TRect &r1, const TRect& r2);'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    static TRect Union(const TPoint* points, int npoints) {'*)
  (*$HPPEMIT '      TPoint tl, br;'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '      if (npoints > 0) {'*)
  (*$HPPEMIT '        tl.SetLocation(points[0]);'*)
  (*$HPPEMIT '        br.SetLocation(points[0]);'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '        for (int i = npoints; --i > 0;) {'*)
  (*$HPPEMIT '          if (points[i].x < tl.x)     tl.x = points[i].x;'*)
  (*$HPPEMIT '          if (points[i].x > br.x)     br.x = points[i].x;'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '          if (points[i].y < tl.y)     tl.y = points[i].y;'*)
  (*$HPPEMIT '          if (points[i].y > br.y)     br.y = points[i].y;'*)
  (*$HPPEMIT '        }'*)
  (*$HPPEMIT '      }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '      return TRect(tl, br);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool  IntersectRect(const TRect &R1, const TRect &R2);'*)
  (*$HPPEMIT '    bool  UnionRect(const TRect &R1, const TRect &R2);'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void Offset(int DX, int DY)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      left   += DX;'*)
  (*$HPPEMIT '      right  += DX;'*)
  (*$HPPEMIT '      top    += DY;'*)
  (*$HPPEMIT '      bottom += DY;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void SetLocation(int X, int Y)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '        Offset(X - left, Y - top);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void SetLocation(const TPoint& p)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '        Offset(p.x - left, p.y - top);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void Inflate(int DX, int DY)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      left   -= DX;'*)
  (*$HPPEMIT '      right  += DX;'*)
  (*$HPPEMIT '      top    -= DY;'*)
  (*$HPPEMIT '      bottom += DY;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void Inflate(int l, int t, int r, int b)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      left   -= l;'*)
  (*$HPPEMIT '      right  += r;'*)
  (*$HPPEMIT '      top    -= t;'*)
  (*$HPPEMIT '      bottom += b;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    // NOTE: Several methods (Height, Width, IsEmpty, PtInRect, etc) assume normalized TRects'*)
  (*$HPPEMIT '    //       So use this method first if you have a TRect with (top > bottom) or (left > right).'*)
  (*$HPPEMIT '    void NormalizeRect()'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      int i;'*)
  (*$HPPEMIT '      if (left > right)'*)
  (*$HPPEMIT '      {'*)
  (*$HPPEMIT '        i = left;'*)
  (*$HPPEMIT '        left = right;'*)
  (*$HPPEMIT '        right = i;'*)
  (*$HPPEMIT '      }'*)
  (*$HPPEMIT '      if (top > bottom)'*)
  (*$HPPEMIT '      {'*)
  (*$HPPEMIT '        i = top;'*)
  (*$HPPEMIT '        top = bottom;'*)
  (*$HPPEMIT '        bottom = i;'*)
  (*$HPPEMIT '      }'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TPoint CenterPoint() const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return TPoint((left+right)/2, (top+bottom)/2);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TRect CenteredRect(const TRect &CenteredRect) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      int w = CenteredRect.Width();'*)
  (*$HPPEMIT '      int h = CenteredRect.Height();'*)
  (*$HPPEMIT '      int x = (right + left)/2;'*)
  (*$HPPEMIT '      int y = (top + bottom)/2;'*)
  (*$HPPEMIT '      return TRect(x-w/2, y-h/2, x+(w+1)/2, y+(h+1)/2);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '#if 0'*)
  (*$HPPEMIT '    TRect SplitRect(TSplitRectType SplitType, int Size) const;'*)
  (*$HPPEMIT '    TRect SplitRect(TSplitRectType SplitType, double Percent) const;'*)
  (*$HPPEMIT '#endif'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '#if defined(_Windows)'*)
  (*$HPPEMIT '    bool SubtractRect(const TRect &R1, const TRect &R2)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return ::SubtractRect(this, &R1, &R2) != 0;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT '#endif'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    LONG GetWidth() const {'*)
  (*$HPPEMIT '      return right - left;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void SetWidth(LONG width) {'*)
  (*$HPPEMIT '      right = left + width;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    LONG GetHeight() const {'*)
  (*$HPPEMIT '      return bottom - top;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void SetHeight(LONG height) {'*)
  (*$HPPEMIT '      bottom = top + height;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TSize GetSize() const {'*)
  (*$HPPEMIT '      TSize r;'*)
  (*$HPPEMIT '      r.cx = GetWidth(); '*)
  (*$HPPEMIT '      r.cy = GetHeight();'*)
  (*$HPPEMIT '      return r;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void SetSize(const TSize& newSize) {'*)
  (*$HPPEMIT '      SetWidth(newSize.cx);'*)
  (*$HPPEMIT '      SetHeight(newSize.cy);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TPoint GetLocation() const {'*)
  (*$HPPEMIT '      return TPoint(left, top);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ' '*)
  (*$HPPEMIT '    __property LONG Left    = { read=left,   write=left   }; '*)
  (*$HPPEMIT '    __property LONG Top     = { read=top,    write=top    }; '*)
  (*$HPPEMIT '    __property LONG Right   = { read=right,  write=right  }; '*)
  (*$HPPEMIT '    __property LONG Bottom  = { read=bottom, write=bottom }; '*)
  (*$HPPEMIT '    __property TSize Size   = { read=GetSize, write=SetSize };'*)
  (*$HPPEMIT '    __property TPoint Location = { read=GetLocation, write=SetLocation };'*)
  (*$HPPEMIT '  };'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '  // Floating-point based types: TSizeF, TPointF, TRectF'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '  struct TSizeF'*)
  (*$HPPEMIT '  {'*)
  (*$HPPEMIT '    float cx;'*)
  (*$HPPEMIT '    float cy;'*)
  (*$HPPEMIT '  public:'*)
  (*$HPPEMIT '    TSizeF() {'*)
  (*$HPPEMIT '        cx = cy = 0;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT '    TSizeF(float w, float h) {'*)
  (*$HPPEMIT '        cx = w;'*)
  (*$HPPEMIT '        cy = h;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT '    TSizeF(const TSizeF& sf) {'*)
  (*$HPPEMIT '        cx = sf.cx;'*)
  (*$HPPEMIT '        cy = sf.cy;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT '    TSizeF(const TSize& s) {'*)
  (*$HPPEMIT '        cx = s.cx;'*)
  (*$HPPEMIT '        cy = s.cy;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool operator ==(const TSizeF& sf) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return _sameValue(cx, sf.cx) && _sameValue(cy, sf.cy);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool operator !=(const TSizeF& sf) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return !(sf == *this);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TSizeF operator +(const TSizeF& rhs) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return TSizeF(rhs.cx + this->cx, rhs.cy + this->cy);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TSizeF operator -(const TSizeF& rhs) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return TSizeF(this->cx - rhs.cx, this->cy - rhs.cy);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TSizeF& operator +=(const TSizeF& rhs)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      this->cx += rhs.cx;'*)
  (*$HPPEMIT '      this->cy += rhs.cy;'*)
  (*$HPPEMIT '      return *this;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TSizeF& operator -=(const TSizeF& rhs)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      this->cx -= rhs.cx;'*)
  (*$HPPEMIT '      this->cy -= rhs.cy;'*)
  (*$HPPEMIT '      return *this;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool IsZero() const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return _sameValue(cx, 0.0F) && _sameValue(cy, 0.0F);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    double Distance(const TSizeF& s2) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return hypot(s2.cx - this->cx, s2.cy - this->cy);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TSize Ceiling() const {'*)
  (*$HPPEMIT '      return TSize((int32_t)ceil(this->cx), (int32_t)ceil(this->cy));'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TSize Truncate() const {'*)
  (*$HPPEMIT '      return TSize((int32_t)floor(this->cx), (int32_t)floor(this->cy));'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TSize Round() const {'*)
  (*$HPPEMIT '      return TSize((int32_t)floor(this->cx + 0.5), (int32_t)floor(this->cy + 0.5));'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    static bool __fastcall _sameValue(float a, float b)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      const float SINGLE_RESOLUTION = 1.25E-6f;'*)
  (*$HPPEMIT '      const float SINGLE_ZERO =6.25E-37f;'*)
  (*$HPPEMIT '      float _epsilon = (float) ((fabs(a) > fabs(b)) ? fabs(a): fabs(b)) * SINGLE_RESOLUTION;'*)
  (*$HPPEMIT '      if (_epsilon == 0)'*)
  (*$HPPEMIT '        _epsilon = SINGLE_ZERO; // both a and b are very little, _epsilon was 0 because of normalization'*)
  (*$HPPEMIT '      return (a > b) ? ((a - b) <= _epsilon): ((b - a) <= _epsilon);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    __property float Width =  { read=cx,   write=cx  };'*)
  (*$HPPEMIT '    __property float Height = { read=cy,   write=cy  };'*)
  (*$HPPEMIT '  };'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '  struct TPointF: public POINTF'*)
  (*$HPPEMIT '  {'*)
  (*$HPPEMIT '    TPointF() { x = y = 0; }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TPointF(float _x, float _y) { x=_x; y=_y; }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TPointF(const POINT& pt)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      x = pt.x;'*)
  (*$HPPEMIT '      y = pt.y;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TPointF(const TPointF& pt)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      x = pt.x;'*)
  (*$HPPEMIT '      y = pt.y;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool operator ==(const TPointF& pt) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return _sameValue(x, pt.x) && _sameValue(y, pt.y);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool operator !=(const TPointF& pt) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return !(pt == *this);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TPointF operator +(const TPointF& rhs) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return TPointF(rhs.x + this->x, rhs.y + this->y);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TPointF operator -(const TPointF& rhs) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return TPointF(this->x - rhs.x, this->y - rhs.y);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TPointF& operator +=(const TPointF& rhs)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      this->x += rhs.x;'*)
  (*$HPPEMIT '      this->y += rhs.y;'*)
  (*$HPPEMIT '      return *this;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TPointF& operator -=(const TPointF& rhs)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      this->x -= rhs.x;'*)
  (*$HPPEMIT '      this->y -= rhs.y;'*)
  (*$HPPEMIT '      return *this;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool IsZero() const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return _sameValue(x, 0.0F) && _sameValue(y, 0.0F);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    /// Left for compatibility'*)
  (*$HPPEMIT '    bool IsEmpty() const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return IsZero();'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void Offset(float DX, float DY)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      x += DX;'*)
  (*$HPPEMIT '      y += DY;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void SetLocation(float nX, float nY)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      x = nX;'*)
  (*$HPPEMIT '      y = nY;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void SetLocation(const TPointF& p)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      x = p.x;'*)
  (*$HPPEMIT '      y = p.y;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    double Distance(const TPointF& p2) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return hypot(p2.x - this->x, p2.y - this->y);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TPoint Ceiling() const {'*)
  (*$HPPEMIT '      return TPoint((int32_t)ceil(this->x), (int32_t)ceil(this->y));'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TPoint Truncate() const {'*)
  (*$HPPEMIT '      return TPoint((int32_t)floor(this->x), (int32_t)floor(this->y));'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TPoint Round() const {'*)
  (*$HPPEMIT '      return TPoint((int32_t)floor(this->x + 0.5), (int32_t)floor(this->y + 0.5));'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool PtInCircle(const TPointF& CircleCenter, float Radius) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return (Radius > 0.0F) && ((_sqrf(CircleCenter.x-x)+_sqrf(CircleCenter.y-y)) < _sqrf(Radius));'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    static float __fastcall _sqrf(float i)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return i*i;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    static bool __fastcall _sameValue(float a, float b)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      const float SINGLE_RESOLUTION = 1.25E-6f;'*)
  (*$HPPEMIT '      const float SINGLE_ZERO =6.25E-37f;'*)
  (*$HPPEMIT '      float _epsilon = (float) ((fabs(a) > fabs(b)) ? fabs(a): fabs(b)) * SINGLE_RESOLUTION;'*)
  (*$HPPEMIT '      if (_epsilon == 0)'*)
  (*$HPPEMIT '        _epsilon = SINGLE_ZERO; // both a and b are very little, _epsilon was 0 because of normalization'*)
  (*$HPPEMIT '      return (a > b) ? ((a - b) <= _epsilon): ((b - a) <= _epsilon);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    __property float X = { read=x,   write=x  };'*)
  (*$HPPEMIT '    __property float Y = { read=y,   write=y  };'*)
  (*$HPPEMIT '  };'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '  typedef TPointF tagPointF;'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '  struct TRectF {'*)
  (*$HPPEMIT '    float left;'*)
  (*$HPPEMIT '    float top;'*)
  (*$HPPEMIT '    float right;'*)
  (*$HPPEMIT '    float bottom;'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TRectF() { init(0,0,0,0); }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TRectF(const TPointF& TL)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      init(TL.x, TL.y, TL.x, TL.y);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TRectF(const TPointF& TL, float width, float height)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      init (TL.x, TL.y, TL.x + width, TL.y + height);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TRectF(float l, float t, float r, float b)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      init(l, t, r, b);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TRectF(const TPointF& TL, const TPointF& BR)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      init(TL.x, TL.y, BR.x, BR.y);'*)
  (*$HPPEMIT '      Normalize();'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TRectF(const TRectF& r)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      init(r.left, r.top, r.right, r.bottom);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT '    TRectF(const RECT& r)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      init(r.left, r.top, r.right, r.bottom);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void init(float l, float t, float r, float b)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      left = l; top = t;'*)
  (*$HPPEMIT '      right = r; bottom = b;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TPointF& TopLeft()                 { return *((TPointF* )this); }'*)
  (*$HPPEMIT '    TPointF& BottomRight()             { return *((TPointF* )this+1); }'*)
  (*$HPPEMIT '    const TPointF& TopLeft() const     { return *((TPointF* )this); }'*)
  (*$HPPEMIT '    const TPointF& BottomRight() const { return *((TPointF* )this+1); }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    float Width() const  { return right  - left; }'*)
  (*$HPPEMIT '    float Height() const { return bottom - top ; }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    static TRectF Empty() { return TRectF(); }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void Normalize()'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      if (top > bottom) {'*)
  (*$HPPEMIT '        float temp  = top;'*)
  (*$HPPEMIT '        top = bottom;'*)
  (*$HPPEMIT '        bottom = temp;'*)
  (*$HPPEMIT '      }'*)
  (*$HPPEMIT '      if (left > right) {'*)
  (*$HPPEMIT '        float temp = left;'*)
  (*$HPPEMIT '        left = right;'*)
  (*$HPPEMIT '        right = temp;'*)
  (*$HPPEMIT '      }'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool operator ==(const TRectF& rc) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '       return _sameValue(left, rc.left) && _sameValue(top, rc.top) &&'*)
  (*$HPPEMIT '              _sameValue(right, rc.right) && _sameValue(bottom, rc.bottom);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool operator !=(const TRectF& rc) const'*)
  (*$HPPEMIT '    {  return !(rc == *this); }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool IsEmpty() const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return _sameValue(right, left) || _sameValue(bottom, top); // differs from Delphi version'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool Contains(const TPointF& p) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return ((p.x > left || _sameValue(p.x, left)) && (p.y > top || _sameValue(p.y, top)) && (p.x < right) && (p.y < bottom));'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool PtInRect(const TPointF& p) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return Contains(p);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool Contains(const TRectF& r) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return Contains(r.TopLeft()) && Contains(r.BottomRight());'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool Overlaps(const TRectF &r) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return IntersectsWith(r);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool Intersects(const TRectF &r) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '        return IntersectsWith(r);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    bool IntersectsWith(const TRectF &r) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return !( (BottomRight().x < r.TopLeft().x) ||'*)
  (*$HPPEMIT '                (BottomRight().y < r.TopLeft().y) ||'*)
  (*$HPPEMIT '                (r.BottomRight().x < TopLeft().x) ||'*)
  (*$HPPEMIT '                (r.BottomRight().y < TopLeft().y) );'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    static TRectF Intersect(const TRectF &r1, const TRectF &r2);'*)
  (*$HPPEMIT '    void Intersect(const TRectF &r);'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void Union(const TRectF &r);'*)
  (*$HPPEMIT '    static TRectF Union(const TRectF &r1, const TRectF &r2);'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    static TRectF Union(const TPointF* points, int npoints) {'*)
  (*$HPPEMIT '        TPointF tl, br;'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '        if (npoints > 0) {'*)
  (*$HPPEMIT '            tl.SetLocation(points[0]);'*)
  (*$HPPEMIT '            br.SetLocation(points[0]);'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '            for (int i = npoints; --i > 0;) {'*)
  (*$HPPEMIT '                if (points[i].x < tl.x)     tl.x = points[i].x;'*)
  (*$HPPEMIT '                if (points[i].x > br.x)        br.x = points[i].x;'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '                if (points[i].y < tl.y)        tl.y = points[i].y;'*)
  (*$HPPEMIT '                if (points[i].y > br.y)        br.y = points[i].y;'*)
  (*$HPPEMIT '            }'*)
  (*$HPPEMIT '        }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '        return TRectF(tl, br);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void Offset(float DX, float DY)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      left   += DX;'*)
  (*$HPPEMIT '      right  += DX;'*)
  (*$HPPEMIT '      top    += DY;'*)
  (*$HPPEMIT '      bottom += DY;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void SetLocation(float X, float Y)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '        Offset(X - left, Y - top);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void SetLocation(const TPointF& p)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '        Offset(p.x - left, p.y - top);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void Inflate(float DX, float DY)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      left   -= DX;'*)
  (*$HPPEMIT '      right  += DX;'*)
  (*$HPPEMIT '      top    -= DY;'*)
  (*$HPPEMIT '      bottom += DY;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void Inflate(float l, float t, float r, float b)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      left   -= l;'*)
  (*$HPPEMIT '      right  += r;'*)
  (*$HPPEMIT '      top    -= t;'*)
  (*$HPPEMIT '      bottom += b;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    // NOTE: Several methods (Height, Width, IsEmpty, PtInRect, etc) assume normalized TRects'*)
  (*$HPPEMIT '    //       So use this method first if you have a TRect with (top > bottom) or (left > right).'*)
  (*$HPPEMIT '    void NormalizeRect()'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      float temp;'*)
  (*$HPPEMIT '      if (left > right)'*)
  (*$HPPEMIT '      {'*)
  (*$HPPEMIT '        temp = left;'*)
  (*$HPPEMIT '        left = right;'*)
  (*$HPPEMIT '        right = temp;'*)
  (*$HPPEMIT '      }'*)
  (*$HPPEMIT '      if (top > bottom)'*)
  (*$HPPEMIT '      {'*)
  (*$HPPEMIT '        temp = top;'*)
  (*$HPPEMIT '        top = bottom;'*)
  (*$HPPEMIT '        bottom = temp;'*)
  (*$HPPEMIT '      }'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TPointF CenterPoint() const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return TPointF((left+right)/2.0F, (top+bottom)/2.0F);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TRect Ceiling() const {'*)
  (*$HPPEMIT '      return TRect(TopLeft().Ceiling(), BottomRight().Ceiling());'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TRect Truncate() const {'*)
  (*$HPPEMIT '      return TRect(TopLeft().Truncate(), BottomRight().Truncate());'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TRect Round() const {'*)
  (*$HPPEMIT '      return TRect(TopLeft().Round(), BottomRight().Round());'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TRectF CenteredRect(const TRectF &CenteredRect) const'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      float w = CenteredRect.Width();'*)
  (*$HPPEMIT '      float h = CenteredRect.Height();'*)
  (*$HPPEMIT '      float x = (right + left)/2.0F;'*)
  (*$HPPEMIT '      float y = (top + bottom)/2.0F;'*)
  (*$HPPEMIT '      return TRectF(x-w/2.0F, y-h/2.0F, x+w/2.0F, y+h/2.0F);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    float GetWidth() const {'*)
  (*$HPPEMIT '      return right - left;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void SetWidth(float width) {'*)
  (*$HPPEMIT '      right = left + width;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    float GetHeight() const {'*)
  (*$HPPEMIT '      return bottom - top;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void SetHeight(float height) {'*)
  (*$HPPEMIT '      bottom = top + height;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TSizeF GetSize() const {'*)
  (*$HPPEMIT '      return TSizeF(GetWidth(), GetHeight());'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    void SetSize(const TSizeF& newSize) {'*)
  (*$HPPEMIT '      SetWidth(newSize.cx);'*)
  (*$HPPEMIT '      SetHeight(newSize.cy);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    TPointF GetLocation() const {'*)
  (*$HPPEMIT '      return TPointF(left, top);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    static float __fastcall _sqrf(float i)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      return i*i;'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    static bool __fastcall _sameValue(float a, float b)'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '      const float SINGLE_RESOLUTION = 1.25E-6f;'*)
  (*$HPPEMIT '      const float SINGLE_ZERO =6.25E-37f;'*)
  (*$HPPEMIT '      float _epsilon = (float) ((fabs(a) > fabs(b)) ? fabs(a): fabs(b)) * SINGLE_RESOLUTION;'*)
  (*$HPPEMIT '      if (_epsilon == 0)'*)
  (*$HPPEMIT '        _epsilon = SINGLE_ZERO; // both a and b are very little, _epsilon was 0 because of normalization'*)
  (*$HPPEMIT '      return (a > b) ? ((a - b) <= _epsilon): ((b - a) <= _epsilon);'*)
  (*$HPPEMIT '    }'*)
  (*$HPPEMIT ''*)
  (*$HPPEMIT '    __property float Left    = { read=left,   write=left   };'*)
  (*$HPPEMIT '    __property float Top     = { read=top,    write=top    };'*)
  (*$HPPEMIT '    __property float Right   = { read=right,  write=right  };'*)
  (*$HPPEMIT '    __property float Bottom  = { read=bottom, write=bottom };'*)
  (*$HPPEMIT '    __property TSizeF Size   = { read=GetSize, write=SetSize };'*)
  (*$HPPEMIT '    __property TPointF Location = { read=GetLocation, write=SetLocation };'*)
  (*$HPPEMIT '  };'*)
  (*$HPPEMIT CLOSENAMESPACE*)

  (*$HPPEMIT END OPENNAMESPACE*)
  (*$HPPEMIT END '  inline bool TRect::IntersectRect(const TRect &R1, const TRect &R2)'*)
  (*$HPPEMIT END '  {'*)
  (*$HPPEMIT END '    return Types::IntersectRect(*this, R1, R2) != 0;'*)
  (*$HPPEMIT END '  }'*)
  (*$HPPEMIT END ''*)
  (*$HPPEMIT END '  inline TRect TRect::Intersect(const TRect &r1, const TRect &r2) {'*)
  (*$HPPEMIT END '    TRect result;'*)
  (*$HPPEMIT END '    Types::IntersectRect(result, r1, r2);'*)
  (*$HPPEMIT END '    return result;'*)
  (*$HPPEMIT END '  }'*)
  (*$HPPEMIT END ''*)
  (*$HPPEMIT END '  inline void TRect::Intersect(const TRect &r) {'*)
  (*$HPPEMIT END '    Types::IntersectRect(*this, *this, r);'*)
  (*$HPPEMIT END '  }'*)
  (*$HPPEMIT END ''*)
  (*$HPPEMIT END '  inline bool TRect::UnionRect(const TRect &R1, const TRect &R2)'*)
  (*$HPPEMIT END '  {'*)
  (*$HPPEMIT END '    return Types::UnionRect(*this, R1, R2) != 0;'*)
  (*$HPPEMIT END '  }'*)
  (*$HPPEMIT END ''*)
  (*$HPPEMIT END '  inline TRect TRect::Union(const TRect &r1, const TRect& r2) {'*)
  (*$HPPEMIT END '    TRect result;'*)
  (*$HPPEMIT END '    Types::UnionRect(result, r1, r2);'*)
  (*$HPPEMIT END '    return result;'*)
  (*$HPPEMIT END '  }'*)
  (*$HPPEMIT END ''*)
  (*$HPPEMIT END '  inline void TRect::Union(const TRect &r) {'*)
  (*$HPPEMIT END '    Types::UnionRect(*this, *this, r);'*)
  (*$HPPEMIT END '  }'*)
  (*$HPPEMIT END ''*)
  (*$HPPEMIT END ' #if 0'*)
  (*$HPPEMIT END '  inline TRect SplitRect(TSplitRectType SplitType, int Size) const'*)
  (*$HPPEMIT END '  {'*)
  (*$HPPEMIT END '    return Types::SplitRect(*this, SplitType, Size);'*)
  (*$HPPEMIT END '  }'*)
  (*$HPPEMIT END '  inline TRect SplitRect(TSplitRectType SplitType, double Percent) const'*)
  (*$HPPEMIT END '  {'*)
  (*$HPPEMIT END '    return Types::SplitRect(*this, SplitType, Percent);'*)
  (*$HPPEMIT END '  }'*)
  (*$HPPEMIT END ' #endif'*)
  (*$HPPEMIT END ''*)
  (*$HPPEMIT END '  inline TRectF TRectF::Intersect(const TRectF &r1, const TRectF &r2) {'*)
  (*$HPPEMIT END '    TRectF result;'*)
  (*$HPPEMIT END '    Types::IntersectRectF(result, r1, r2);'*)
  (*$HPPEMIT END '    return result;'*)
  (*$HPPEMIT END '  }'*)
  (*$HPPEMIT END ''*)
  (*$HPPEMIT END '  inline void TRectF::Intersect(const TRectF &r) {'*)
  (*$HPPEMIT END '    Types::IntersectRectF(*this, *this, r);'*)
  (*$HPPEMIT END '  }'*)
  (*$HPPEMIT END ''*)
  (*$HPPEMIT END '  inline TRectF TRectF::Union(const TRectF &r1, const TRectF &r2) {'*)
  (*$HPPEMIT END '    TRectF result;'*)
  (*$HPPEMIT END '    Types::UnionRectF(result, r1, r2);'*)
  (*$HPPEMIT END '    return result;'*)
  (*$HPPEMIT END '  }'*)
  (*$HPPEMIT END ''*)
  (*$HPPEMIT END '  inline void TRectF::Union(const TRectF &r) {'*)
  (*$HPPEMIT END '    Types::UnionRectF(*this, *this, r);'*)
  (*$HPPEMIT END '  }'*)
  (*$HPPEMIT END ''*)
  (*$HPPEMIT END ''*)
  (*$HPPEMIT END CLOSENAMESPACE*)

  DWORD = LongWord;
  {$EXTERNALSYM DWORD}
const
  RT_RCDATA       = PChar(10);
  {$EXTERNALSYM RT_RCDATA}

  NullChar = #0;
  Tabulator = #9;
  Space = #32;
  CarriageReturn = $D;
  LineFeed = #$A;
  VerticalTab = #$B;
  FormFeed = #$C;
  LineSeparator = #$2028;
  ParagraphSeparator = #$2029;

  BOM_LSB_FIRST = #$FEFF;
  BOM_MSB_FIRST = #$FFFE;

  GUID_NULL: TGUID = '{00000000-0000-0000-0000-000000000000}';

  cPI: Single = 3.141592654;
  {$EXTERNALSYM cPI}
  {$HPPEMIT 'extern const ::System::Single cPI /*= 3.141592654*/;'}
  cPIdiv180: Single = 0.017453292;
  {$EXTERNALSYM cPIdiv180}
  {$HPPEMIT 'extern const ::System::Single cPIdiv180 /*= 0.017453292*/;'}
  c180divPI: Single = 57.29577951;
  {$EXTERNALSYM c180divPI}
  {$HPPEMIT 'extern const ::System::Single c180divPI /*= 57.29577951*/;'}
  c2PI: Single = 6.283185307;
  {$EXTERNALSYM c2PI}
  {$HPPEMIT 'extern const ::System::Single c2PI /*= 6.283185307*/;'}
  cPIdiv2: Single = 1.570796326;
  {$EXTERNALSYM cPIdiv2}
  {$HPPEMIT 'extern const ::System::Single cPIdiv2 /*= 1.570796326*/;'}
  cPIdiv4: Single = 0.785398163;
  {$EXTERNALSYM cPIdiv4}
  {$HPPEMIT 'extern const ::System::Single cPIdiv4 /*= 0.785398163*/;'}
  c3PIdiv4: Single = 2.35619449;
  {$EXTERNALSYM c3PIdiv4}
  {$HPPEMIT 'extern const ::System::Single c3PIdiv4 /*= 2.35619449*/;'}
  cInv2PI: Single = 1 / 6.283185307;
  {$EXTERNALSYM cInv2PI}
  {$HPPEMIT 'extern const ::System::Single cInv2PI /*= 1 / 6.283185307*/;'}
  cInv360: Single = 1 / 360;
  {$EXTERNALSYM cInv360}
  {$HPPEMIT 'extern const ::System::Single cInv360 /*= 1 / 360*/;'}
  c180: Single = 180;
  {$EXTERNALSYM c180}
  {$HPPEMIT 'extern const ::System::Single c180 /*= 180*/;'}
  c360: Single = 360;
  {$EXTERNALSYM c360}
  {$HPPEMIT 'extern const ::System::Single c360 /*= 360*/;'}
  cOneHalf: Single = 0.5;
  {$EXTERNALSYM cOneHalf}
  {$HPPEMIT 'extern const ::System::Single cOneHalf /*= 0.5*/;'}

  CurveKappa = 0.5522847498;
  {$EXTERNALSYM CurveKappa}
  {$HPPEMIT 'extern const ::System::Extended CurveKappa /*= 0.5522847498*/;'}
  CurveKappaInv = 1 - CurveKappa;
  {$EXTERNALSYM CurveKappaInv}
  {$HPPEMIT 'extern const ::System::Extended CurveKappaInv /*= 1 - CurveKappa*/;'}

  Epsilon: Single = 1E-40;
  {$EXTERNALSYM Epsilon}
  {$HPPEMIT 'extern const ::System::Single Epsilon /*= 1E-40*/;'}
  Epsilon2: Single = 1E-30;
  {$EXTERNALSYM Epsilon2}
  {$HPPEMIT 'extern const ::System::Single Epsilon2 /*= 1E-40*/;'}

{$IFDEF MSWINDOWS}
  {$EXTERNALSYM GUID_NULL}
{$ENDIF}  
{$IFNDEF MSWINDOWS}
type
  PDisplay = Pointer;
  PEvent = Pointer;
  TXrmOptionDescRec = record end;
  XrmOptionDescRec = TXrmOptionDescRec;
  PXrmOptionDescRec = ^TXrmOptionDescRec;
  Widget = Pointer;
  WidgetClass = Pointer;
  ArgList = Pointer;
  Region = Pointer;
  
 {$IFDEF MACOS}
   EventHandlerCallRef = Pointer;
   EventRef = Pointer;
   CGImageRef = Pointer;
   RgnHandle = Pointer;
   HIShapeRef = Pointer;
   HIMutableShapeRef = Pointer;
   OSMenuRef = Pointer;
 {$ENDIF MACOS}

const
  STGTY_STORAGE   = 1;
  STGTY_STREAM    = 2;
  STGTY_LOCKBYTES = 3;
  STGTY_PROPERTY  = 4;

  STREAM_SEEK_SET = 0;
  STREAM_SEEK_CUR = 1;
  STREAM_SEEK_END = 2;

  LOCK_WRITE     = 1;
  LOCK_EXCLUSIVE = 2;
  LOCK_ONLYONCE  = 4;

  { Unspecified error }
  E_FAIL                      = HRESULT($80004005);

  { Unable to perform requested operation. }
  STG_E_INVALIDFUNCTION       = HRESULT($80030001);

  { %l could not be found. }
  STG_E_FILENOTFOUND          = HRESULT($80030002);

  { The path %l could not be found. }
  STG_E_PATHNOTFOUND          = HRESULT($80030003);

  { There are insufficient resources to open another file. }
  STG_E_TOOMANYOPENFILES      = HRESULT($80030004);

  { Access Denied. }
  STG_E_ACCESSDENIED          = HRESULT($80030005);

  { Attempted an operation on an invalid object. }
  STG_E_INVALIDHANDLE         = HRESULT($80030006);

  { There is insufficient memory available to complete operation. }
  STG_E_INSUFFICIENTMEMORY    = HRESULT($80030008);

  { Invalid pointer error. }
  STG_E_INVALIDPOINTER        = HRESULT($80030009);

  { There are no more entries to return. }
  STG_E_NOMOREFILES           = HRESULT($80030012);

  { Disk is write-protected. }
  STG_E_DISKISWRITEPROTECTED  = HRESULT($80030013);

  { An error occurred during a seek operation. }
  STG_E_SEEKERROR             = HRESULT($80030019);

  { A disk error occurred during a write operation. }
  STG_E_WRITEFAULT            = HRESULT($8003001D);

  { A disk error occurred during a read operation. }
  STG_E_READFAULT             = HRESULT($8003001E);

  { A share violation has occurred. }
  STG_E_SHAREVIOLATION        = HRESULT($80030020);

  { A lock violation has occurred. }
  STG_E_LOCKVIOLATION         = HRESULT($80030021);

  { %l already exists. }
  STG_E_FILEALREADYEXISTS     = HRESULT($80030050);

  { Invalid parameter error. }
  STG_E_INVALIDPARAMETER      = HRESULT($80030057);

  { There is insufficient disk space to complete operation. }
  STG_E_MEDIUMFULL            = HRESULT($80030070);

  { Illegal write of non-simple property to simple property set. }
  STG_E_PROPSETMISMATCHED     = HRESULT($800300F0);

  { An API call exited abnormally. }
  STG_E_ABNORMALAPIEXIT       = HRESULT($800300FA);

  { The file %l is not a valid compound file. }
  STG_E_INVALIDHEADER         = HRESULT($800300FB);

  { The name %l is not valid. }
  STG_E_INVALIDNAME           = HRESULT($800300FC);

  { An unexpected error occurred. }
  STG_E_UNKNOWN               = HRESULT($800300FD);

  { That function is not implemented. }
  STG_E_UNIMPLEMENTEDFUNCTION = HRESULT($800300FE);

  { Invalid flag error. }
  STG_E_INVALIDFLAG           = HRESULT($800300FF);

  { Attempted to use an object that is busy. }
  STG_E_INUSE                 = HRESULT($80030100);

  { The storage has been changed since the last commit. }
  STG_E_NOTCURRENT            = HRESULT($80030101);

  { Attempted to use an object that has ceased to exist. }
  STG_E_REVERTED              = HRESULT($80030102);

  { Can't save. }
  STG_E_CANTSAVE              = HRESULT($80030103);

  { The compound file %l was produced with an incompatible version of storage. }
  STG_E_OLDFORMAT             = HRESULT($80030104);

  { The compound file %l was produced with a newer version of storage. }
  STG_E_OLDDLL                = HRESULT($80030105);

  { Share.exe or equivalent is required for operation. }
  STG_E_SHAREREQUIRED         = HRESULT($80030106);

  { Illegal operation called on non-file based storage. }
  STG_E_NOTFILEBASEDSTORAGE   = HRESULT($80030107);

  { Illegal operation called on object with extant marshallings. }
  STG_E_EXTANTMARSHALLINGS    = HRESULT($80030108);

  { The docfile has been corrupted. }
  STG_E_DOCFILECORRUPT        = HRESULT($80030109);

  { OLE32.DLL has been loaded at the wrong address. }
  STG_E_BADBASEADDRESS        = HRESULT($80030110);

  { The file download was aborted abnormally.  The file is incomplete. }
  STG_E_INCOMPLETE            = HRESULT($80030201);

  { The file download has been terminated. }
  STG_E_TERMINATED            = HRESULT($80030202);

  { The underlying file was converted to compound file format. }
  STG_S_CONVERTED             = HRESULT($00030200);

  { The storage operation should block until more data is available. }
  STG_S_BLOCK                 = HRESULT($00030201);

  { The storage operation should retry immediately. }
  STG_S_RETRYNOW              = HRESULT($00030202);

  { The notified event sink will not influence the storage operation. }
  STG_S_MONITORING            = HRESULT($00030203);


type
  TOleChar = WideChar;
  POleStr = PWideChar;
  PPOleStr = ^POleStr;

  PCLSID = PGUID;
  TCLSID = TGUID;

{ 64-bit large integer }

  Largeint = Int64;
  {$EXTERNALSYM Largeint}

//  DWORD = LongWord;
//  {$EXTERNALSYM DWORD}
  PDWORD = ^DWORD;
  {$EXTERNALSYM PDWORD}

  { File System time stamps are represented with the following structure: }
  PFileTime = ^TFileTime;
  _FILETIME = record
    dwLowDateTime: DWORD;
    dwHighDateTime: DWORD;
  end;
  TFileTime = _FILETIME;
  FILETIME = _FILETIME;

{ IStream interface }

  PStatStg = ^TStatStg;
  tagSTATSTG = record
    pwcsName: POleStr;
    dwType: Longint;
    cbSize: Largeint;
    mtime: TFileTime;
    ctime: TFileTime;
    atime: TFileTime;
    grfMode: Longint;
    grfLocksSupported: Longint;
    clsid: TCLSID;
    grfStateBits: Longint;
    reserved: Longint;
  end;
  TStatStg = tagSTATSTG;
  STATSTG = TStatStg;

  IClassFactory = interface(IUnknown)
    ['{00000001-0000-0000-C000-000000000046}']
    function CreateInstance(const unkOuter: IUnknown; const iid: TGUID;
      out obj): HResult; stdcall;
    function LockServer(fLock: LongBool): HResult; stdcall;
  end;

  ISequentialStream = interface(IUnknown)
    ['{0c733a30-2a1c-11ce-ade5-00aa0044773d}']
    function Read(pv: Pointer; cb: Longint; pcbRead: PLongint): HResult;
      stdcall;
    function Write(pv: Pointer; cb: Longint; pcbWritten: PLongint): HResult;
      stdcall;
  end;

  IStream = interface(ISequentialStream)
    ['{0000000C-0000-0000-C000-000000000046}']
    function Seek(dlibMove: Largeint; dwOrigin: Longint;
      out libNewPosition: Largeint): HResult; stdcall;
    function SetSize(libNewSize: Largeint): HResult; stdcall;
    function CopyTo(stm: IStream; cb: Largeint; out cbRead: Largeint;
      out cbWritten: Largeint): HResult; stdcall;
    function Commit(grfCommitFlags: Longint): HResult; stdcall;
    function Revert: HResult; stdcall;
    function LockRegion(libOffset: Largeint; cb: Largeint;
      dwLockType: Longint): HResult; stdcall;
    function UnlockRegion(libOffset: Largeint; cb: Largeint;
      dwLockType: Longint): HResult; stdcall;
    function Stat(out statstg: TStatStg; grfStatFlag: Longint): HResult;
      stdcall;
    function Clone(out stm: IStream): HResult; stdcall;
  end;
{$ENDIF} { !MSWINDOWS }

function EqualRect(const R1, R2: TRect): Boolean; overload;
function EqualRect(const R1, R2: TRectF): Boolean; overload;
function Rect(Left, Top, Right, Bottom: Integer): TRect;
function RectF(Left, Top, Right, Bottom: Single): TRectF; inline; overload;
function NormalizeRectF(const Pts: array of TPointF): TRectF; overload;
function NormalizeRect(const ARect: TRectF): TRectF; overload;
function RectWidth(const Rect: TRect): Integer; inline; overload;
function RectWidth(const Rect: TRectF): Single; inline; overload;
function RectHeight(const Rect: TRect): Integer; inline; overload;
function RectHeight(const Rect: TRectF): Single; inline; overload;
function RectCenter(var R: TRect; const Bounds: TRect): TRect; overload;
function RectCenter(var R: TRectF; const Bounds: TRectF): TRectF; overload;
{$EXTERNALSYM Rect}
function Bounds(ALeft, ATop, AWidth, AHeight: Integer): TRect;
{$EXTERNALSYM Bounds}
function Point(X, Y: Integer): TPoint; inline; overload;
{$EXTERNALSYM Point}
function PointF(X, Y: Single): TPointF; inline; overload;
function PointF(const V: TVector): TPointF; inline; overload;
function MinPoint(const P1, P2: TPointF): TPointF; overload;
function MinPoint(const P1, P2: TPoint): TPoint; overload;
function ScalePoint(const P: TPointF; dX, dY: Single): TPointF; overload;
function ScalePoint(const P: TPoint; dX, dY: Single): TPoint; overload;
function SmallPoint(X, Y: Integer): TSmallPoint; inline; overload;
function SmallPoint(XY: LongWord): TSmallPoint; overload;
function PtInRect(const Rect: TRect; const P: TPoint): Boolean; overload;
function PtInRect(const Rect: TRectF; const P: TPointF): Boolean; overload;
function PtInCircle(const Point, Center: TPoint; Radius: Integer): Boolean;
function IntersectRect(const Rect1, Rect2: TRect): Boolean; overload;
function IntersectRect(out Rect: TRect; const R1, R2: TRect): Boolean; overload;
function IntersectRect(const Rect1, Rect2: TRectF): Boolean; overload;
function IntersectRect(out Rect: TRectF; const R1, R2: TRectF): Boolean; overload;
function UnionRect(out Rect: TRect; const R1, R2: TRect): Boolean; overload;
function UnionRect(out Rect: TRectF; const R1, R2: TRectF): Boolean; overload;
function UnionRect(const ARect1, ARect2: TRect): TRect; inline; overload;
function UnionRect(const ARect1, ARect2: TRectF): TRectF; inline; overload;
function IsRectEmpty(const Rect: TRect): Boolean; overload;
function IsRectEmpty(const Rect: TRectF): Boolean; overload;
function OffsetRect(var R: TRect; DX, DY: Integer): Boolean; overload;
function OffsetRect(var R: TRectF; DX, DY: Single): Boolean; overload;
procedure MultiplyRect(var R: TRectF; const DX, DY: Single);
procedure InflateRect(var R: TRectF; const DX, DY: Single); overload;
procedure InflateRect(var R: TRect; const DX, DY: Integer); overload;
function CenterPoint(const Rect: TRect): TPoint;
function SplitRect(const Rect: TRect; SplitType: TSplitRectType; Size: Integer): TRect; overload;
function SplitRect(const Rect: TRect; SplitType: TSplitRectType; Percent: Double): TRect; overload;
function CenteredRect(const SourceRect: TRect; const CenteredRect: TRect): TRect;

function IntersectRectF(out Rect: TRectF; const R1, R2: TRectF): Boolean;
function UnionRectF(out Rect: TRectF; const R1, R2: TRectF): Boolean;


type
  TValueRelationship = -1..1;

const
  LessThanValue = Low(TValueRelationship);
  EqualsValue = 0;
  GreaterThanValue = High(TValueRelationship);

implementation

const
  // Single, 4bites:    1-sign,  8-exp, 23-mantissa - 2^23 ~ 1E3*1E3*8 ~ 8E6 (really 8388608),
  //                          relative resolution = 1/(8E6) ~ 1.25E-7 (really 1.19E-7), 
  //                          zero = 1/(2^(2^(8-1)) = 1/2^128 ~ 0.0625E-36 ~ 6.25E-38 (really 3E-39)
  FuzzFactorSingle = 10;
  SingleResolution: Single = 1.25E-7 * FuzzFactorSingle; // this is relative resolution of mantissa
  SingleZero: Single = 6.25E-37; // 6.25E-38 * FuzzFactorSingle;
  // Double, 8bites:    1-sign, 11-exp, 52-mantissa - 2^52 ~ 1E3*1E3*1E3*1E3*1E3*4 = 4E15,
  //                             relative resolution = 2.5*E-16
  // FuzzFactorDouble = 10;
  // DoubleResolution: Double = 2.5E-16 * FuzzFactorDouble;
  // Extended, 10bites: 1-sign, 15-exp, 64-mantissa - relative resolution = 0.0625*E-18
  // Real, 6bites:      1-sign,  7-exp, 40-mantissa - 1.0*E-12 - deprecated

  // Example: for mantissa length=2 (0,xx - binary) resolution in mantissa is the last binary bite 0,01b = 1/4,
  //  for mantissa length=3 (0,xxx - binary) resolution in mantissa is the last binary bite 0,001b = 1/8, etc
  //  really the high digit is assumed to 1 (0,1xx or 0,1xxx) and the precision is 2 times higher

function Max(a, b: Integer): Integer; overload;
begin
  if a > b then Result := a else Result := b;
end;

function Max(a, b: Single): Single; overload;
begin
  if a > b then Result := a else Result := b;
end;

function Min(a, b: Integer): Integer; overload;
begin
  if a < b then Result := a else Result := b;
end;

function Min(a, b: Single): Single; overload;
begin
  if a < b then Result := a else Result := b;
end;

function SameValue(const A, B: Single; Epsilon: Single = 0): Boolean;
begin
  if Epsilon = 0 then
    Epsilon := Max(Abs(A), Abs(B)) * SingleResolution;
  if Epsilon = 0 then
     Epsilon := SingleZero; // both A and B are very little, Epsilon was 0 because of normalization
  if A > B then
    Result := (A - B) <= Epsilon
  else
    Result := (B - A) <= Epsilon;
end;

function Ceil(const X: Single): Integer;
begin
  Result := Integer(Trunc(X));
  if Frac(X) > 0 then
    Inc(Result);
end;

{ TPoint }
class operator TPoint.Equal(const Lhs, Rhs: TPoint): Boolean;
begin
  Result := (Lhs.X = Rhs.X) and (Lhs.Y = Rhs.Y);
end;

class operator TPoint.NotEqual(const Lhs, Rhs: TPoint): Boolean;
begin
  Result := (Lhs.X <> Rhs.X) or (Lhs.Y <> Rhs.Y);
end;

class operator TPoint.Add(const Lhs, Rhs: TPoint): TPoint;
begin
  Result.X := Lhs.X + Rhs.X;
  Result.Y := Lhs.Y + Rhs.Y;
end;

class operator TPoint.Subtract(const Lhs, Rhs: TPoint): TPoint;
begin
  Result.X := Lhs.X - Rhs.X;
  Result.Y := Lhs.Y - Rhs.Y;
end;

{$IFDEF FALSE}
class operator TPoint.Explicit(const Size: TSize): TPoint;
begin
  Result.X := Size.cx;
  Result.Y := Size.cy;
end;

class operator TPoint.Explicit(const Point: TPoint): TSize;
begin
  Result.cx := Point.X;
  Result.cy := Point.Y;
end;

class operator TPoint.Explicit(const SmallPoint: TSmallPoint): TPoint;
begin
  Result.X := SmallPoint.x;
  Result.Y := SmallPoint.y;
end;

class operator TPoint.Explicit(const Point: TPoint): TSmallPoint;
begin
  Result.x := Point.X;
  Result.y := Point.Y;
end;

class operator TPoint.Implicit(const Size: TSize): TPoint;
begin
  Result.X := Size.cx;
  Result.Y := Size.cy;
end;

class operator TPoint.Implicit(const Point: TPoint): TSize;
begin
  Result.cx := Point.X;
  Result.cy := Point.Y;
end;

{$ENDIF}

class operator TPoint.Implicit(Value: TSmallPoint): TPoint;
begin
  Result.x := Value.x;
  Result.y := Value.y;
end;

class operator TPoint.Explicit(Value: TPoint): TSmallPoint;
begin
  if Value.x < Low(SmallInt) then
    Result.x := Low(SmallInt)
  else if Value.x > High(SmallInt) then
    Result.x := High(SmallInt)
  else
    Result.x := SmallInt(Result.x);

  if Value.y < Low(SmallInt) then
    Result.y := Low(SmallInt)
  else if Value.y > High(SmallInt) then
    Result.y := High(SmallInt)
  else
    Result.y := SmallInt(Result.y);
end;



constructor TPoint.Create(P: TPoint);
begin
  Self.X := p.X;
  Self.Y := p.Y;
end;

constructor TPoint.Create(const X, Y: Integer);
begin
  Self.X := X;
  Self.Y := Y;
end;

function TPoint.Distance(const P2: TPoint): Double;
begin
  Result := Sqrt(Sqr(Self.X - P2.X) +  Sqr(Self.Y - P2.Y));
end;

procedure TPoint.SetLocation(const X, Y: Integer);
begin
  Self.X := X;
  Self.Y := Y;
end;

procedure TPoint.SetLocation(const P: TPoint);
begin
  Self := P;
end;

procedure TPoint.Offset(const DX, DY: Integer);
begin
  Inc(Self.X, DX);
  Inc(Self.Y, DY);
end;

procedure TPoint.Offset(const Point: TPoint);
begin
  Self.Offset(Point.X, Point.Y);
end;

function TPoint.Add(const Point: TPoint): TPoint;
begin
  Result.SetLocation(Self.X + Point.X, Self.Y + Point.Y);
end;

function TPoint.Subtract(const Point: TPoint): TPoint;
begin
  Result.SetLocation(Self.X - Point.X, Self.Y - Point.Y);
end;

function TPoint.IsZero: Boolean;
begin
  Result := (X = 0) and (Y = 0);
end;

{ TRect }

class function TRect.Empty: TRect;
begin
  Result := TRect.Create(0,0,0,0);
end;

constructor TRect.Create(const Origin: TPoint);
begin
  Create(Origin.X, Origin.Y, Origin.X, Origin.Y);
end;

constructor TRect.Create(const Origin: TPoint; Width, Height: Integer);
begin
  Create(Origin.X, Origin.Y, Origin.X + Width, Origin.Y + Height);
end;

constructor TRect.Create(const Left, Top, Right, Bottom: Integer);
begin
  Self.Left  := Left;
  Self.Top   := Top;
  Self.Right := Right;
  Self.Bottom:= Bottom;
end;

constructor TRect.Create(const P1, P2: TPoint; Normalize: Boolean);
begin
  Self.TopLeft := P1;
  Self.BottomRight := P2;
  if Normalize then Self.NormalizeRect;
end;

constructor TRect.Create(const R: TRect; Normalize: Boolean);
begin
  Self.TopLeft := R.TopLeft;
  Self.BottomRight := R.BottomRight;
  if Normalize then Self.NormalizeRect;
end;

function TRect.GetLocation: TPoint;
begin
  Result := TopLeft;
end;

procedure TRect.SetWidth(const Value: Integer);
begin
  Self.Right := Self.Left + Value;
end;

function TRect.GetWidth: Integer;
begin
  Result := Self.Right - Self.Left;
end;

procedure TRect.SetHeight(const Value: Integer);
begin
  Self.Bottom := Self.Top + Value;
end;

function TRect.GetHeight: Integer;
begin
  Result := Self.Bottom - Self.Top;
end;

function TRect.GetSize: TSize;
begin
  Result.cx := Width;
  Result.cy := Height;
end;

procedure TRect.SetSize(const Value: TSize);
begin
  Width := Value.cx;
  Height := Value.cy;
end;

class operator TRect.Equal(const Lhs, Rhs: TRect): Boolean;
begin
  Result := (Lhs.Left = Rhs.Left) and (Lhs.Right = Rhs.Right) and
            (Lhs.Top = Rhs.Top) and (Lhs.Bottom = Rhs.Bottom);
end;

class operator TRect.NotEqual(const Lhs, Rhs: TRect): Boolean;
begin
  Result := not(Lhs = Rhs);
end;

class operator TRect.Add(const Lhs, Rhs: TRect): TRect;
begin
  Result := TRect.Union(Lhs, Rhs);
end;

class operator TRect.Multiply(const Lhs, Rhs: TRect): TRect;
begin
  Result := TRect.Intersect(Lhs, Rhs);
end;

procedure TRect.NormalizeRect;
begin
  if Top > Bottom then begin
    Top := Top xor Bottom;
    Bottom := Top xor Bottom;
    Top := Top xor Bottom;
  end;
  if Left > Right then begin
    Left := Left xor Right;
    Right:= Left xor Right;
    Left := Left xor Right;
  end
end;

function TRect.IsEmpty: Boolean;
begin
  Result := IsRectEmpty(Self);
end;

function TRect.Contains(const PT: TPoint): Boolean;
begin
  Result := PtInRect(self, PT);
end;

function TRect.Contains(const R: TRect): Boolean;
begin
  Result := Contains(R.TopLeft) and Contains(R.BottomRight);
end;

function TRect.IntersectsWith(const R: TRect): Boolean;
begin
  Result := not ( (Self.BottomRight.X < R.TopLeft.X) or
                  (Self.BottomRight.Y < R.TopLeft.Y) or
                  (R.BottomRight.X < Self.TopLeft.X) or
                  (R.BottomRight.Y < Self.TopLeft.Y) );
end;
	
class function TRect.Intersect(const R1: TRect; const R2: TRect): TRect;
begin
  IntersectRect(Result, R1, R2);
end;

procedure TRect.Intersect(const R: TRect);
begin
  Self := Intersect(Self, R);
end;

class function TRect.Union(const R1: TRect; const R2: TRect): TRect;
begin
  UnionRect(Result, R1, R2);
end;

procedure TRect.Union(const R: TRect);
begin
  Self := Union(Self, R);
end;

class function TRect.Union(const Points: Array of TPoint): TRect;
var
  i: Integer;
  TLCorner, BRCorner: TPoint;
begin
  if Length(Points) > 0 then
  begin
    TLCorner := Points[Low(Points)];
    BRCorner := Points[Low(Points)];

    if Length(Points) > 1 then
    begin 
      for i := Low(Points) + 1 to High(Points) do
      begin
        if Points[i].X < TLCorner.X then TLCorner.X := Points[i].X;
        if Points[i].X > BRCorner.X then BRCorner.X := Points[i].X;
        if Points[i].Y < TLCorner.Y then TLCorner.Y := Points[i].Y;
        if Points[i].Y > BRCorner.Y then BRCorner.Y := Points[i].Y;
      end;
    end;

    Result := TRect.Create(TLCorner, BRCorner);

  end
  else begin
    Result := TRect.Empty;
  end;
end;


procedure TRect.Offset(const DX, DY: Integer);
begin
  TopLeft.Offset(DX, DY);
  BottomRight.Offset(DX, DY);
end;

procedure TRect.Offset(const Point: TPoint);
begin
  TopLeft.Offset(Point);
  BottomRight.Offset(Point);
end;

// sets new origin
procedure TRect.SetLocation(const X, Y: Integer);
begin
  Offset(X - Left, Y - Top);
end;

procedure TRect.SetLocation(const Point: TPoint);
begin
  Offset(Point.X - Left, Point.Y - Top);
end;

procedure TRect.Inflate(const DX, DY: Integer);
begin
  TopLeft.Offset(-DX, -DY);
  BottomRight.Offset(DX, DY);
end;

procedure TRect.Inflate(const DL, DT, DR, DB: Integer);
begin
  TopLeft.Offset(-DL, -DT);
  BottomRight.Offset(DR, DB);
end;

function TRect.CenterPoint: TPoint;
begin
  Result.X := (Right - Left) div 2 + Left;
  Result.Y := (Bottom - Top) div 2 + Top;
end;

function TRect.SplitRect(SplitType: TSplitRectType; Size: Integer): TRect;
begin
  Result := Self;

  case SplitType of
    srLeft:
      Result.Right := Self.Left + Size;
    srRight:
      Result.Left := Self.Right - Size;
    srTop:
      Result.Bottom := Self.Top + Size;
    srBottom:
      Result.Top := Self.Bottom - Size;
  end;
end;

function TRect.SplitRect(SplitType: TSplitRectType; Percent: Double): TRect;
begin
  Result := Self;
  case SplitType of
    srLeft:
      Result.Right := Self.Left + Trunc(Percent * Self.Width);
    srRight:
      Result.Left := Self.Right - Trunc(Percent * Self.Width);
    srTop:
      Result.Bottom := Self.Top + Trunc(Percent * Self.Height);
    srBottom:
      Result.Top := Self.Bottom - Trunc(Percent * Self.Height);
  end;
end;

{}

function SplitRect(const Rect: TRect; SplitType: TSplitRectType; Size: Integer): TRect;
begin
  Result := Rect;
  case SplitType of
    srLeft:
      Result.Right := Rect.Left + Size;
    srRight:
      Result.Left := Rect.Right - Size;
    srTop:
      Result.Bottom := Rect.Top + Size;
    srBottom:
      Result.Top := Rect.Bottom - Size;
  end;
end;

function SplitRect(const Rect: TRect; SplitType: TSplitRectType; Percent: Double): TRect;
begin
  Result := Rect;
  case SplitType of
    srLeft:
      Result.Right := Rect.Left + Trunc(Percent * RectWidth(Rect));
    srRight:
      Result.Left := Rect.Right - Trunc(Percent * RectWidth(Rect));
    srTop:
      Result.Bottom := Rect.Top + Trunc(Percent * RectHeight(Rect));
    srBottom:
      Result.Top := Rect.Bottom - Trunc(Percent * RectHeight(Rect));
  end;
end;

function CenteredRect(const SourceRect: TRect; const CenteredRect: TRect): TRect;
var
  Width, Height: Integer;
  X, Y: Integer;
begin
  Width := RectWidth(CenteredRect);
  Height := RectHeight(CenteredRect);
  X := (SourceRect.Right + SourceRect.Left) div 2;
  Y := (SourceRect.Top + SourceRect.Bottom) div 2;
  Result := Rect(X - Width div 2, Y - Height div 2, X + (Width + 1) div 2, Y + (Height + 1) div 2);
end;

function MinPoint(const P1, P2: TPointF): TPointF;
begin
  Result := P1;
  if (P2.Y < P1.Y) or ((P2.Y = P1.Y) and (P2.X < P1.X)) then
    Result := P2;
end;

function MinPoint(const P1, P2: TPoint): TPoint;
begin
  Result := P1;
  if (P2.Y < P1.Y) or ((P2.Y = P1.Y) and (P2.X < P1.X)) then
    Result := P2;
end;

procedure MultiplyRect(var R: TRectF; const DX, DY: Single);
begin
  R.Left := R.Left * dX;
  R.Right := R.Right * dX;
  R.Top := R.Top * dY;
  R.Bottom := R.Bottom * dY;
end;

function NormalizeRectF(const Pts: array of TPointF): TRectF;
var
  Pt: TPointF;
begin
  Result.Left := $F000;
  Result.Top := $F000;
  Result.Right := -$F000;
  Result.Bottom := -$F000;
  for Pt in Pts do
  begin
    if Pt.X < Result.Left then
      Result.Left := Pt.X;
    if Pt.Y < Result.Top then
      Result.Top := Pt.Y;
    if Pt.X > Result.Right then
      Result.Right := Pt.X;
    if Pt.Y > Result.Bottom then
      Result.Bottom := Pt.Y;
  end;
end;

function NormalizeRect(const ARect: TRectF): TRectF;
begin
  with ARect do
    Result := NormalizeRectF([TPointF.Create(Left, Top), TPointF.Create(Right, Top),
      TPointF.Create(Right, Bottom), TPointF.Create(Left, Bottom)]);
end;

function ScalePoint(const P: TPointF; dX, dY: Single): TPointF;
begin
  Result.X := P.X * dX;
  Result.Y := P.Y * dY;
end;

function ScalePoint(const P: TPoint; dX, dY: Single): TPoint;
begin
  Result.X := Round(P.X * dX);
  Result.Y := Round(P.Y * dY);
end;

function EqualRect(const R1, R2: TRect): Boolean;
begin
  Result := (R1.Left = R2.Left) and (R1.Right = R2.Right) and
    (R1.Top = R2.Top) and (R1.Bottom = R2.Bottom);
end;

function EqualRect(const R1, R2: TRectF): Boolean;
begin
  Result := (R1.Left = R2.Left) and (R1.Right = R2.Right) and
    (R1.Top = R2.Top) and (R1.Bottom = R2.Bottom);
end;

function Rect(Left, Top, Right, Bottom: Integer): TRect;
begin
  Result.Left := Left;
  Result.Top := Top;
  Result.Bottom := Bottom;
  Result.Right := Right;
end;

function RectF(Left, Top, Right, Bottom: Single): TRectF;
begin
  Result.Left := Left;
  Result.Top := Top;
  Result.Bottom := Bottom;
  Result.Right := Right;
end;

function RectWidth(const Rect: TRect): Integer;
begin
  Result := Rect.Right - Rect.Left;
end;

function RectHeight(const Rect: TRect): Integer;
begin
  Result := Rect.Bottom - Rect.Top;
end; 

function RectWidth(const Rect: TRectF): Single;
begin
  Result := Rect.Right - Rect.Left;
end;

function RectHeight(const Rect: TRectF): Single;
begin
  Result := Rect.Bottom - Rect.Top;
end;

function RectCenter(var R: TRect; const Bounds: TRect): TRect;
begin
  OffsetRect(R, -R.Left, -R.Top);
  OffsetRect(R, (RectWidth(Bounds) - RectWidth(R)) div 2, (RectHeight(Bounds) - RectHeight(R)) div 2);
  OffsetRect(R, Bounds.Left, Bounds.Top);
  Result := R;
end;

function RectCenter(var R: TRectF; const Bounds: TRectF): TRectF;
begin
  OffsetRect(R, -R.Left, -R.Top);
  OffsetRect(R, Round((RectWidth(Bounds) - RectWidth(R)) / 2), Round((RectHeight(Bounds) - RectHeight(R)) / 2));
  OffsetRect(R, Bounds.Left, Bounds.Top);
  Result := R;
end;

function Point(X, Y: Integer): TPoint;
begin
  Result.X := X;
  Result.Y := Y;
end;

function PointF(X, Y: Single): TPointF;
begin
  Result.X := X;
  Result.Y := Y;
end;

function PointF(const V: TVector): TPointF;
begin
  Result.X := V.X;
  Result.Y := V.Y;
end;

function SmallPoint(X, Y: Integer): TSmallPoint;
begin
  Result.X := X;
  Result.Y := Y;
end;

function SmallPoint(XY: LongWord): TSmallPoint;
begin
  Result.X := SmallInt(XY and $0000FFFF);
  Result.Y := SmallInt(XY shr 16);
end;

function PtInRect(const Rect: TRect; const P: TPoint): Boolean;
begin
  Result := (P.X >= Rect.Left) and (P.X < Rect.Right) and (P.Y >= Rect.Top)
    and (P.Y < Rect.Bottom);
end;

function PtInRect(const Rect: TRectF; const P: TPointF): Boolean;
begin
  Result := (P.X >= Rect.Left) and (P.X < Rect.Right) and (P.Y >= Rect.Top)
    and (P.Y < Rect.Bottom);
end;

function PtInCircle(const Point, Center: TPoint; Radius: Integer): Boolean;
begin
  if Radius > 0 then
  begin
    Result := Sqr((Point.X - Center.X) / Radius) +
      Sqr((Point.Y - Center.Y) / Radius) <= 1;
  end
  else
  begin
    Result := False;
  end;
end;

function IntersectRect(const Rect1, Rect2: TRect): Boolean;
begin
  Result := (Rect1.Left <= Rect2.Right) and (Rect1.Right >= Rect2.Left) and (Rect1.Top <= Rect2.Bottom) and
    (Rect1.Bottom >= Rect2.Top);
end;

function IntersectRect(out Rect: TRect; const R1, R2: TRect): Boolean;
begin
  Rect := R1;
  if R2.Left > R1.Left then Rect.Left := R2.Left;
  if R2.Top > R1.Top then Rect.Top := R2.Top;
  if R2.Right < R1.Right then Rect.Right := R2.Right;
  if R2.Bottom < R1.Bottom then Rect.Bottom := R2.Bottom;
  Result := not IsRectEmpty(Rect);
  if not Result then FillChar(Rect, SizeOf(Rect), 0);
end;

function IntersectRect(const Rect1, Rect2: TRectF): Boolean;
begin
  Result := (Rect1.Left <= Rect2.Right) and (Rect1.Right >= Rect2.Left) and (Rect1.Top <= Rect2.Bottom) and
    (Rect1.Bottom >= Rect2.Top);
end;

function IntersectRect(out Rect: TRectF; const R1, R2: TRectF): Boolean;
begin
  Rect := R1;
  if R2.Left > R1.Left then Rect.Left := R2.Left;
  if R2.Top > R1.Top then Rect.Top := R2.Top;
  if R2.Right < R1.Right then Rect.Right := R2.Right;
  if R2.Bottom < R1.Bottom then Rect.Bottom := R2.Bottom;
  Result := not IsRectEmpty(Rect);
  if not Result then FillChar(Rect, SizeOf(Rect), 0);
end;

function UnionRect(out Rect: TRect; const R1, R2: TRect): Boolean;
begin
  Rect := R1;
  if not IsRectEmpty(R2) then
  begin
    if R2.Left < R1.Left then Rect.Left := R2.Left;
    if R2.Top < R1.Top then Rect.Top := R2.Top;
    if R2.Right > R1.Right then Rect.Right := R2.Right;
    if R2.Bottom > R1.Bottom then Rect.Bottom := R2.Bottom;
  end;
  Result := not IsRectEmpty(Rect);
  if not Result then FillChar(Rect, SizeOf(Rect), 0);
end;

function UnionRect(out Rect: TRectF; const R1, R2: TRectF): Boolean;
begin
  Rect := R1;
  if not IsRectEmpty(R2) then
  begin
    if R2.Left < R1.Left then Rect.Left := R2.Left;
    if R2.Top < R1.Top then Rect.Top := R2.Top;
    if R2.Right > R1.Right then Rect.Right := R2.Right;
    if R2.Bottom > R1.Bottom then Rect.Bottom := R2.Bottom;
  end;
  Result := not IsRectEmpty(Rect);
  if not Result then FillChar(Rect, SizeOf(Rect), 0);
end;

function UnionRect(const ARect1, ARect2: TRect): TRect;
begin
  UnionRect(Result, ARect1, ARect2);
end;

function UnionRect(const ARect1, ARect2: TRectF): TRectF;
begin
  UnionRect(Result, ARect1, ARect2);
end;

procedure InflateRect(var R: TRectF; const DX, DY: Single);
begin
  R.Left := R.Left - DX;
  R.Right := R.Right + DX;
  R.Top := R.Top - DY;
  R.Bottom := R.Bottom + DY;
end;

procedure InflateRect(var R: TRect; const DX, DY: Integer);
begin
  R.Left := R.Left - DX;
  R.Right := R.Right + DX;
  R.Top := R.Top - DY;
  R.Bottom := R.Bottom + DY;
end;

function IsRectEmpty(const Rect: TRect): Boolean;
begin
  Result := (Rect.Right <= Rect.Left) or (Rect.Bottom <= Rect.Top);
end;

function IsRectEmpty(const Rect: TRectF): Boolean;
begin
  Result := (Rect.Right <= Rect.Left) or (Rect.Bottom <= Rect.Top);
end;

function OffsetRect(var R: TRect; DX, DY: Integer): Boolean;
begin
  if @R <> nil then // Test to increase compatiblity with Windows
  begin
    Inc(R.Left, DX);
    Inc(R.Right, DX);
    Inc(R.Top, DY);
    Inc(R.Bottom, DY);
    Result := True;
  end
  else
    Result := False;
end;

function OffsetRect(var R: TRectF; DX, DY: Single): Boolean;
begin
  if @R <> nil then // Test to increase compatiblity with Windows
  begin
    R.Left := R.Left + DX;
    R.Right := R.Right + DX;
    R.Top := R.Top + DY;
    R.Bottom := R.Bottom + DY;
    Result := True;
  end
  else
    Result := False;
end;

function Bounds(ALeft, ATop, AWidth, AHeight: Integer): TRect;
begin
  with Result do
  begin
    Left := ALeft;
    Top := ATop;
    Right := ALeft + AWidth;
    Bottom :=  ATop + AHeight;
  end;
end;

function CenterPoint(const Rect: TRect): TPoint;
begin
  with Rect do
  begin
    Result.X := (Right - Left) div 2 + Left;
    Result.Y := (Bottom - Top) div 2 + Top;
  end;
end;

function IntersectRectF(out Rect: TRectF; const R1, R2: TRectF): Boolean;
begin
  Rect := R1;
  if R2.Left > R1.Left then Rect.Left := R2.Left;
  if R2.Top > R1.Top then Rect.Top := R2.Top;
  if R2.Right < R1.Right then Rect.Right := R2.Right;
  if R2.Bottom < R1.Bottom then Rect.Bottom := R2.Bottom;
  Result := not Rect.IsEmpty;
  if not Result then begin
    Rect.Top := 0.0;
    Rect.Bottom := 0.0;
    Rect.Left := 0.0;
    Rect.Right := 0.0;
  end;
end;

function UnionRectF(out Rect: TRectF; const R1, R2: TRectF): Boolean;
begin
  Rect := R1;
  if not R2.IsEmpty then
  begin
    if R2.Left < R1.Left then Rect.Left := R2.Left;
    if R2.Top < R1.Top then Rect.Top := R2.Top;
    if R2.Right > R1.Right then Rect.Right := R2.Right;
    if R2.Bottom > R1.Bottom then Rect.Bottom := R2.Bottom;
  end;
  Result := not Rect.IsEmpty;
  if not Result then begin
    Rect.Top :=0.0;
    Rect.Bottom := 0.0;
    Rect.Left := 0.0;
    Rect.Right := 0.0;
  end;
end;

{ TPointF }
function TPointF.Add(const Point: TPointF): TPointF;
begin
  Result.X := Self.X + Point.X;
  Result.Y := Self.Y + Point.Y;
end;

function TPointF.Add(const Point: TPoint): TPointF;
begin
  Result.X := Self.X + Point.X;
  Result.Y := Self.Y + Point.Y;
end;

class operator TPointF.Add(const Lhs, Rhs: TPointF): TPointF;
begin
  Result.X := Lhs.X + Rhs.X;
  Result.Y := Lhs.Y + Rhs.Y;
end;

constructor TPointF.Create(const P: TPointF);
begin
  Self.X := P.X;
  Self.Y := P.Y;
end;

constructor TPointF.Create(const X, Y: Single);
begin
  Self.X := X;
  Self.Y := Y;
end;

constructor TPointF.Create(P: TPoint);
begin
  Self.X := P.X;
  Self.Y := P.Y;
end;

function TPointF.Distance(const P2: TPointF): Double;
begin
  Result := Sqrt(Sqr(Self.X - P2.X) +  Sqr(Self.Y - P2.Y));
end;

class operator TPointF.Equal(const Lhs, Rhs: TPointF): Boolean;
begin
  Result := SameValue(Lhs.X, Rhs.X) and SameValue(Lhs.Y, Rhs.Y);
end;

class operator TPointF.NotEqual(const Lhs, Rhs: TPointF): Boolean;
begin
  Result := not (Lhs = Rhs);
end;

function TPointF.IsZero: Boolean;
begin
  Result := SameValue(X, 0.0) and SameValue(Y, 0.0);
end;

procedure TPointF.Offset(const Point: TPoint);
begin
  Self.X := Self.X + Point.X;
  Self.Y := Self.Y + Point.Y;
end;

procedure TPointF.Offset(const DX, DY: Single);
begin
  Self.X := Self.X + DX;
  Self.Y := Self.Y + DY;
end;

procedure TPointF.Offset(const Point: TPointF);
begin
  Self.X := Self.X + Point.X;
  Self.Y := Self.Y + Point.Y;
end;

procedure TPointF.SetLocation(const P: TPoint);
begin
  Self.X := P.X;
  Self.Y := P.Y;
end;

procedure TPointF.SetLocation(const P: TPointF);
begin
  Self := P;
end;

procedure TPointF.SetLocation(const X, Y: Single);
begin
  Self.X := X;
  Self.Y := Y;
end;

class operator TPointF.Subtract(const Lhs, Rhs: TPointF): TPointF;
begin
  Result.X := Lhs.X - Rhs.X;
  Result.Y := Lhs.Y - Rhs.Y;
end;

function TPointF.Subtract(const Point: TPointF): TPointF;
begin
  Result.X := Self.X - Point.X;
  Result.Y := Self.Y - Point.Y;
end;

function TPointF.Subtract(const Point: TPoint): TPointF;
begin
  Result.X := Self.X - Point.X;
  Result.Y := Self.Y - Point.Y;
end;

function TPointF.Ceiling: TPoint;
begin
  Result.X := Ceil(X);
  Result.Y := Ceil(Y);
end;

function TPointF.Truncate: TPoint;
begin
  Result.X := Trunc(X);
  Result.Y := Trunc(Y);
end;

function TPointF.Round: TPoint;
begin
  Result.X := System.Round(X);
  Result.Y := System.Round(Y);
end;

{ TRectF }
constructor TRectF.Create(const R: TRectF; Normalize: Boolean);
begin
  Self := R;
  if Normalize then NormalizeRect;
end;

constructor TRectF.Create(const R: TRect; Normalize: Boolean);
begin
  Self.Left := R.Left;
  Self.Top  := R.Top;
  Self.Right := R.Right;
  Self.Bottom := R.Bottom;
  if Normalize then NormalizeRect;
end;


constructor TRectF.Create(const Origin: TPointF);
begin
  TopLeft := Origin;
  BottomRight := Origin;
end;

constructor TRectF.Create(const Left, Top, Right, Bottom: Single);
begin
  Self.Left := Left; Self.Top := Top;
  Self.Right := Right; Self.Bottom := Bottom;
end;

constructor TRectF.Create(const P1, P2: TPointF; Normalize: Boolean);
begin
  Self.TopLeft := P1;
  Self.BottomRight := P2;
  if Normalize then NormalizeRect;
end;

constructor TRectF.Create(const Origin: TPointF; const Width, Height: Single);
begin
  Self.TopLeft := Origin;
  Self.Width := Width;
  Self.Height := Height;
end;

class operator TRectF.Equal(const Lhs, Rhs: TRectF): Boolean;
begin
  Result := (Lhs.TopLeft = Rhs.TopLeft) and
            (Lhs.BottomRight = Rhs.BottomRight);
end;

class operator TRectF.NotEqual(const Lhs, Rhs: TRectF): Boolean;
begin
  Result := not (Lhs = Rhs);
end;

class operator TRectF.Add(const Lhs, Rhs: TRectF): TRectF;
begin
  Result := TRectF.Union(Lhs, Rhs);
end;

class operator TRectF.Multiply(const Lhs, Rhs: TRectF): TRectF;
begin
  Result := TRectF.Intersect(Lhs, Rhs);
end;

function TRectF.CenterPoint: TPointF;
begin
  Result.X := (Right - Left)/2.0 + Left;
  Result.Y := (Bottom - Top)/2.0 + Top;
end;

function TRectF.Contains(const R: TRectF): Boolean;
begin
  Result := Contains(R.TopLeft) and Contains(R.BottomRight);
end;

function TRectF.Contains(const Pt: TPointF): Boolean;
begin
  Result := ((Pt.X > Self.Left) or SameValue(Pt.X, Self.Left)) and
            (Pt.X < Self.Right) and
            ((Pt.Y > Self.Top) or SameValue(Pt.Y, Self.Top)) and
            (Pt.Y < Self.Bottom);
end;

class function TRectF.Empty: TRectF;
begin
  Result := TRectF.Create(0,0,0,0);
end;

function TRectF.GetHeight: Single;
begin
  Result := Self.Bottom - Self.Top;
end;

procedure TRectF.SetHeight(const Value: Single);
begin
  Self.Bottom := Self.Top + Value;
end;

function TRectF.GetWidth: Single;
begin
  Result := Self.Right - Self.Left;
end;

procedure TRectF.SetWidth(const Value: Single);
begin
  Self.Right := Self.Left + Value;
end;

function TRectF.GetSize: TSizeF;
begin
  Result.cx := Width;
  Result.cy := Height;
end;

procedure TRectF.SetSize(const Value: TSizeF);
begin
  Width := Value.cx;
  Height := Value.cy;
end;

procedure TRectF.Inflate(const DX, DY: Single);
begin
  TopLeft.Offset(-DX, -DY);
  BottomRight.Offset(DX, DY);
end;

procedure TRectF.Inflate(const DL, DT, DR, DB: Single);
begin
  TopLeft.Offset(-DL, -DT);
  BottomRight.Offset(DR, DB);
end;

procedure TRectF.Offset(const Point: TPointF);
begin
  TopLeft.Offset(Point);
  BottomRight.Offset(Point);
end;

procedure TRectF.Offset(const DX, DY: Single);
begin
  TopLeft.Offset(DX, DY);
  BottomRight.Offset(DX, DY);
end;

function TRectF.GetLocation: TPointF;
begin
  Result := TopLeft;
end;

procedure TRectF.SetLocation(const Point: TPointF);
begin
  Offset(Point.X - Left, Point.Y - Top);
end;

procedure TRectF.SetLocation(const X, Y: Single);
begin
  Offset(X - Left, Y - Top);
end;

function TRectF.IntersectsWith(const R: TRectF): Boolean;
begin
  Result := not ( (Self.BottomRight.X < R.TopLeft.X) or
                  (Self.BottomRight.Y < R.TopLeft.Y) or
                  (R.BottomRight.X < Self.TopLeft.X) or
                  (R.BottomRight.Y < Self.TopLeft.Y) );
end;

function TRectF.IsEmpty: Boolean;
begin
  Result := (Right < Left) or SameValue(Right, Left)
         or (Bottom < Top) or SameValue(Bottom, Top);
end;

procedure TRectF.NormalizeRect;
var
  temp: Single;
begin
  if Top > Bottom then begin
    temp := Top;
    Top := Bottom;
    Bottom := temp;
  end;
  if Left > Right then begin
    temp := Left;
    Left := Right;
    Right := temp;
  end
end;

function TRectF.Ceiling: TRect;
begin
  Result.TopLeft := TopLeft.Ceiling;
  Result.BottomRight := BottomRight.Ceiling;
end;

function TRectF.Truncate: TRect;
begin
  Result.TopLeft := TopLeft.Truncate;
  Result.BottomRight := BottomRight.Truncate;
end;

function TRectF.Round: TRect;
begin
  Result.TopLeft := TopLeft.Round;
  Result.BottomRight := BottomRight.Round;
end;

class function TRectF.Intersect(const R1, R2: TRectF): TRectF;
begin
  IntersectRectF(Result, R1, R2);
end;

procedure TRectF.Intersect(const R: TRectF);
begin
  Self := Intersect(Self, R);
end;

class function TRectF.Union(const R1, R2: TRectF): TRectF;
begin
  UnionRectF(Result, R1, R2);
end;

procedure TRectF.Union(const R: TRectF);
begin
  Self := TRectF.Union(Self, R);
end;

class function TRectF.Union(const Points: Array of TPointF): TRectF;
var
  I: Integer;
  TLCorner, BRCorner: TPointF;
begin
  if Length(Points) > 0 then
  begin
    TLCorner := Points[Low(Points)];
    BRCorner := Points[Low(Points)];

    if Length(Points) > 1 then
    begin 
      for I := Low(Points) + 1 to High(Points) do
      begin
        if Points[I].X < TLCorner.X then TLCorner.X := Points[I].X;
        if Points[I].X > BRCorner.X then BRCorner.X := Points[I].X;
        if Points[I].Y < TLCorner.Y then TLCorner.Y := Points[I].Y;
        if Points[I].Y > BRCorner.Y then BRCorner.Y := Points[I].Y;
      end;
    end;

    Result := TRectF.Create(TLCorner, BRCorner);
  end
  else begin
    Result := TRectF.Empty;
  end;
end;

{ tagSIZE, TSize }
constructor TSize.Create(P: TSize);
begin
  cx := P.cx;
  cy := P.cy;
end;

constructor TSize.Create(const X, Y: Integer);
begin
  cx := X;
  cy := Y;
end;

class operator TSize.Add(const Lhs, Rhs: TSize): TSize;
begin
  Result.cx := Lhs.cx + Rhs.cx;
  Result.cy := Lhs.cy + Rhs.cy;
end;

function TSize.Add(const Point: TSize): TSize;
begin
  Result.cx := cx + Point.cx;
  Result.cy := cy + Point.cy;
end;

function TSize.Distance(const P2: TSize): Double;
begin
  Result := Sqrt(Sqr(Self.cx - P2.cx) +  Sqr(Self.cy - P2.cy));
end;

function TSize.IsZero: Boolean;
begin
  Result := (cx = 0) and (cy = 0);
end;

class operator TSize.Equal(const Lhs, Rhs: TSize): Boolean;
begin
  Result := (Lhs.cx = Rhs.cx) and (Lhs.cy = Rhs.cy);
end;

class operator TSize.NotEqual(const Lhs, Rhs: TSize): Boolean;
begin
  Result := not (Lhs = Rhs);
end;

class operator TSize.Subtract(const Lhs, Rhs: TSize): TSize;
begin
  Result.cx := Lhs.cx - Rhs.cx;
  Result.cy := Lhs.cy - Rhs.cy;
end;

function TSize.Subtract(const Point: TSize): TSize;
begin
  Result.cx := cx - Point.cx;
  Result.cy := cy - Point.cy;
end;

{ TSizeF }
function TSizeF.Add(const Point: TSizeF): TSizeF;
begin
  Result.cx := cx + Point.cx;
  Result.cy := cy + Point.cy;
end;

class operator TSizeF.Add(const Lhs, Rhs: TSizeF): TSizeF;
begin
  Result.cx := Lhs.cx + Rhs.cx;
  Result.cy := Lhs.cy + Rhs.cy;
end;

constructor TSizeF.Create(const X, Y: Single);
begin
  cx := X;
  cy := Y;
end;

constructor TSizeF.Create(P: TSizeF);
begin
  cx := P.cx;
  cy := P.cy;
end;

function TSizeF.Distance(const P2: TSizeF): Double;
begin
  Result := Sqrt(Sqr(Self.cx - P2.cx) +  Sqr(Self.cy - P2.cy));
end;

class operator TSizeF.Implicit(const Point: TPointF): TSizeF;
begin
  Result.cx := Point.X;
  Result.cy := Point.Y;
end;

class operator TSizeF.Implicit(const Size: TSizeF): TPointF;
begin
  Result.X := Size.cx;
  Result.Y := Size.cy;
end;

function TSizeF.IsZero: Boolean;
begin
  Result := SameValue(cx, 0.0) and SameValue(cy, 0.0);
end;

class operator TSizeF.Equal(const Lhs, Rhs: TSizeF): Boolean;
begin
  Result := (Lhs.cx = Rhs.cx) and (Lhs.cy = Rhs.cy);
end;

class operator TSizeF.NotEqual(const Lhs, Rhs: TSizeF): Boolean;
begin
  Result := not (Lhs = Rhs);
end;

function TSizeF.Subtract(const Point: TSizeF): TSizeF;
begin
  Result.cx := cx - Point.cx;
  Result.cy := cy - Point.cy;
end;

class operator TSizeF.Subtract(const Lhs, Rhs: TSizeF): TSizeF;
begin
  Result.cx := Lhs.cx - Rhs.cx;
  Result.cy := Lhs.cy - Rhs.cy;
end;

function TSizeF.Ceiling: TSize;
begin
  Result.cx := Ceil(cx);
  Result.cy := Ceil(cy);
end;

function TSizeF.Round: TSize;
begin
  Result.cx := Trunc(cx + 0.5);
  Result.cy := Trunc(cy + 0.5);
end;

function TSizeF.Truncate: TSize;
begin
  Result.cx := Trunc(cx);
  Result.cy := Trunc(cy);
end;

class operator TSizeF.Implicit(const Size: TSize): TSizeF;
begin
  Result.cx := Size.cx;
  Result.cy := Size.cy;
end;



{ TSmallPoint }
constructor TSmallPoint.Create(P: TSmallPoint);
begin
  x := P.x;
  y := P.y;
end;

constructor TSmallPoint.Create(const X, Y: Word);
begin
  Self.x := X;
  Self.y := Y;
end;

constructor TSmallPoint.Create(const X, Y: SmallInt);
begin
  Self.x := X;
  Self.y := Y;
end;

function TSmallPoint.Add(const Point: TSmallPoint): TSmallPoint;
begin
  Result.x := x + Point.x;
  Result.y := y + Point.y;
end;

class operator TSmallPoint.Add(const Lhs, Rhs: TSmallPoint): TSmallPoint;
begin
  Result.x := Lhs.x + Rhs.x;
  Result.y := Lhs.y + Rhs.y;
end;

function TSmallPoint.Subtract(const Point: TSmallPoint): TSmallPoint;
begin
  Result.x := x - Point.x;
  Result.y := y - Point.y;
end;

class operator TSmallPoint.Subtract(const Lhs, Rhs: TSmallPoint): TSmallPoint;
begin
  Result.x := Lhs.x - Rhs.x;
  Result.y := Lhs.y - Rhs.y;
end;

function TSmallPoint.Distance(const P2: TSmallPoint): Double;
begin
  Result := Sqrt(Sqr(Self.X - P2.X) +  Sqr(Self.Y - P2.Y));
end;

class operator TSmallPoint.Equal(const Lhs, Rhs: TSmallPoint): Boolean;
begin
  Result := (Lhs.x = Rhs.x) and (Lhs.y = Rhs.y);
end;

class operator TSmallPoint.NotEqual(const Lhs, Rhs: TSmallPoint): Boolean;
begin
  Result := not (Lhs = Rhs);
end;

//class operator TSmallPoint.Implicit(Value: TSmallPoint): Cardinal;
//begin
//  Result := (Value.x shl 16) or Value.y;
//end;

function TSmallPoint.IsZero: Boolean;
begin
  Result := (x = 0) and (y = 0);
end;

end.


