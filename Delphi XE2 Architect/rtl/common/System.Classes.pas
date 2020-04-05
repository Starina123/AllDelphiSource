{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit System.Classes;

{$R-,T-,X+,H+,B-}
{$WARN WIDECHAR_REDUCED OFF}
{$WARN SYMBOL_PLATFORM OFF}
{$WARN SYMBOL_DEPRECATED OFF}

{$IFDEF MSWINDOWS}
{ ACTIVEX.HPP is not required by CLASSES.HPP }
(*$NOINCLUDE Winapi.ActiveX*)
{$ENDIF}

{$IFDEF CPUX86}
  {$DEFINE X86ASM}
{$ELSE !CPUX86}
  {$DEFINE PUREPASCAL}
{$ENDIF !CPUX86}


interface

uses
{$IFDEF MSWINDOWS}
  Winapi.Windows, Winapi.Messages, Winapi.ActiveX,
{$ENDIF MSWINDOWS}
{$IFDEF POSIX}
  System.Types, Posix.SysTypes, Posix.UniStd, Posix.Signal,
{$ENDIF POSIX}
{$IFDEF MACOS}
  Macapi.CoreServices,
{$ENDIF MACOS}
  System.SysUtils, System.Variants, System.TypInfo;

const
  MaxListSize = MaxInt div 16 deprecated;

{ TStream seek origins }

  soFromBeginning = 0;
  soFromCurrent = 1;
  soFromEnd = 2;

type
{ TStream seek origins }
  TSeekOrigin = (soBeginning, soCurrent, soEnd);

  TPlatformIds = Word;

const
{ TFileStream create mode }

  fmCreate = $FF00;

{ TParser special tokens }

  toEOF     = Char(0);
  toSymbol  = Char(1);
  toString  = Char(2);
  toInteger = Char(3);
  toFloat   = Char(4);
  toWString = Char(5);

  {+ ! Moved here from menus.pas !!}
  { TShortCut special values }
  scCommand = $1000;
  scShift = $2000;
  scCtrl = $4000;
  scAlt = $8000;
  scNone = 0;

  { Platform identifiers }
  pidWin32 = $0001;
  pidWin64 = $0002;
  pidOSX32 = $0004;

type

{ Text alignment types }

  TAlignment = (taLeftJustify, taRightJustify, taCenter);
  TLeftRight = TAlignment.taLeftJustify..TAlignment.taRightJustify;
  TBiDiMode = (bdLeftToRight, bdRightToLeft, bdRightToLeftNoAlign,
    bdRightToLeftReadingOnly);
  TVerticalAlignment = (taAlignTop, taAlignBottom, taVerticalCenter);
  TTopBottom = TVerticalAlignment.taAlignTop..TVerticalAlignment.taAlignBottom;

{ Types used by standard events }

  // Controls.TCMMouseWheel relies on TShiftState not exceeding 2 bytes in size
  TShiftState = set of (ssShift, ssAlt, ssCtrl,
    ssLeft, ssRight, ssMiddle, ssDouble, ssTouch, ssPen, ssCommand);

  THelpContext = -MaxLongint..MaxLongint;
  THelpType = (htKeyword, htContext);

  {+ ! Moved here from menus.pas !!}
  TShortCut = Low(Word)..High(Word);

{ Standard events }

  TNotifyEvent = procedure(Sender: TObject) of object;
  TGetStrProc = procedure(const S: string) of object;

{ Exception classes }

  EStreamError = class(Exception);
  EFileStreamError = class(EStreamError)
    constructor Create(ResStringRec: PResStringRec; const FileName: string);
  end;
  EFCreateError = class(EFileStreamError);
  EFOpenError = class(EFileStreamError);
  EFilerError = class(EStreamError);
  EReadError = class(EFilerError);
  EWriteError = class(EFilerError);
  EClassNotFound = class(EFilerError);
  EMethodNotFound = class(EFilerError);
  EInvalidImage = class(EFilerError);
  EResNotFound = class(Exception);
  EListError = class(Exception);
  EBitsError = class(Exception);
  EStringListError = class(Exception);
  EComponentError = class(Exception);
  EParserError = class(Exception);
  EOutOfResources = class(EOutOfMemory);
  EInvalidOperation = class(Exception);

{ Duplicate management }

  TDuplicates = (dupIgnore, dupAccept, dupError);

{ Forward class declarations }

  TStream = class;
  TFiler = class;
  TReader = class;
  TWriter = class;
  TComponent = class;

{ TList class }

  PPointerList = ^TPointerList;
  TPointerList = array of Pointer;
  TListSortCompare = function (Item1, Item2: Pointer): Integer;
  TListSortCompareFunc = reference to function (Item1, Item2: Pointer): Integer;
  TListNotification = (lnAdded, lnExtracted, lnDeleted);

  // these operators are used in Assign and go beyond simply copying
  //   laCopy = dest becomes a copy of the source
  //   laAnd  = intersection of the two lists
  //   laOr   = union of the two lists
  //   laXor  = only those not in both lists
  // the last two operators can actually be thought of as binary operators but
  // their implementation has been optimized over their binary equivalent.
  //   laSrcUnique  = only those unique to source (same as laAnd followed by laXor)
  //   laDestUnique = only those unique to dest   (same as laOr followed by laXor)
  TListAssignOp = (laCopy, laAnd, laOr, laXor, laSrcUnique, laDestUnique);

  TList = class;

  TListEnumerator = class
  private
    FIndex: Integer;
    FList: TList;
  public
    constructor Create(AList: TList);
    function GetCurrent: Pointer; inline;
    function MoveNext: Boolean;
    property Current: Pointer read GetCurrent;
  end;

  TList = class(TObject)
  private
    FList: TPointerList;
    FCount: Integer;
    FCapacity: Integer;
  protected
    function Get(Index: Integer): Pointer;
    procedure Grow; virtual;
    procedure Put(Index: Integer; Item: Pointer);
    procedure Notify(Ptr: Pointer; Action: TListNotification); virtual;
    procedure SetCapacity(NewCapacity: Integer);
    procedure SetCount(NewCount: Integer);
  public
    type
      TDirection = (FromBeginning, FromEnd);

    destructor Destroy; override;
    function Add(Item: Pointer): Integer;
    procedure Clear; virtual;
    procedure Delete(Index: Integer);
    class procedure Error(const Msg: string; Data: NativeInt); overload; virtual;
    class procedure Error(Msg: PResStringRec; Data: NativeInt); overload;
    procedure Exchange(Index1, Index2: Integer);
    function Expand: TList;
    function Extract(Item: Pointer): Pointer; inline;
    function ExtractItem(Item: Pointer; Direction: TDirection): Pointer;
    function First: Pointer; inline;
    function GetEnumerator: TListEnumerator;
    function IndexOf(Item: Pointer): Integer;
    function IndexOfItem(Item: Pointer; Direction: TDirection): Integer;
    procedure Insert(Index: Integer; Item: Pointer);
    function Last: Pointer;
    procedure Move(CurIndex, NewIndex: Integer);
    function Remove(Item: Pointer): Integer; inline;
    function RemoveItem(Item: Pointer; Direction: TDirection): Integer;
    procedure Pack;
    procedure Sort(Compare: TListSortCompare);
    procedure SortList(const Compare: TListSortCompareFunc);
    procedure Assign(ListA: TList; AOperator: TListAssignOp = laCopy; ListB: TList = nil);
    property Capacity: Integer read FCapacity write SetCapacity;
    property Count: Integer read FCount write SetCount;
    property Items[Index: Integer]: Pointer read Get write Put; default;
    property List: TPointerList read FList;
  end;

{ TThreadList class }

  TThreadList = class
  private
    FList: TList;
    FLock: TObject;
    FDuplicates: TDuplicates;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(Item: Pointer);
    procedure Clear;
    function LockList: TList;
    procedure Remove(Item: Pointer); inline;
    procedure RemoveItem(Item: Pointer; Direction: TList.TDirection);
    procedure UnlockList; inline;
    property Duplicates: TDuplicates read FDuplicates write FDuplicates;
  end;

{ IInterfaceList interface }

  IInterfaceList = interface
  ['{285DEA8A-B865-11D1-AAA7-00C04FB17A72}']
    function Get(Index: Integer): IInterface;
    function GetCapacity: Integer;
    function GetCount: Integer;
    procedure Put(Index: Integer; const Item: IInterface);
    procedure SetCapacity(NewCapacity: Integer);
    procedure SetCount(NewCount: Integer);

    procedure Clear;
    procedure Delete(Index: Integer);
    procedure Exchange(Index1, Index2: Integer);
    function First: IInterface;
    function IndexOf(const Item: IInterface): Integer;
    function Add(const Item: IInterface): Integer;
    procedure Insert(Index: Integer; const Item: IInterface);
    function Last: IInterface;
    function Remove(const Item: IInterface): Integer;
    procedure Lock;
    procedure Unlock;
    property Capacity: Integer read GetCapacity write SetCapacity;
    property Count: Integer read GetCount write SetCount;
    property Items[Index: Integer]: IInterface read Get write Put; default;
  end;

{ EXTERNALSYM IInterfaceList}

{ IInterfaceListEx interface }

  TInterfaceListEnumerator = class;

  IInterfaceListEx = interface(IInterfaceList)
    ['{FDB39D70-65B9-4995-9436-6084ACA05DB3}']
    function GetEnumerator: TInterfaceListEnumerator;
  end;

  { EXTERNALSYM IInterfaceListEx}

{ TInterfaceList class }

  TInterfaceList = class;

  TInterfaceListEnumerator = class
  private
    FIndex: Integer;
    FInterfaceList: TInterfaceList;
  public
    constructor Create(AInterfaceList: TInterfaceList);
    function GetCurrent: IInterface; inline;
    function MoveNext: Boolean;
    property Current: IInterface read GetCurrent;
  end;

  TInterfaceList = class(TInterfacedObject, IInterfaceList, IInterfaceListEx)
  private
    FList: TThreadList;
  protected
    { IInterfaceList }
    function Get(Index: Integer): IInterface;
    function GetCapacity: Integer;
    function GetCount: Integer;
    procedure Put(Index: Integer; const Item: IInterface);
    procedure SetCapacity(NewCapacity: Integer);
    procedure SetCount(NewCount: Integer);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure Delete(Index: Integer);
    procedure Exchange(Index1, Index2: Integer);
    function Expand: TInterfaceList;
    function First: IInterface;
    function IndexOf(const Item: IInterface): Integer;
    function IndexOfItem(const Item: IInterface; Direction: TList.TDirection): Integer;
    function Add(const Item: IInterface): Integer;
    procedure Insert(Index: Integer; const Item: IInterface);
    function Last: IInterface;
    function Remove(const Item: IInterface): Integer;
    function RemoveItem(const Item: IInterface; Direction: TList.TDirection): Integer;
    procedure Lock;
    procedure Unlock;
    { IInterfaceListEx }
    function GetEnumerator: TInterfaceListEnumerator;

    property Capacity: Integer read GetCapacity write SetCapacity;
    property Count: Integer read GetCount write SetCount;
    property Items[Index: Integer]: IInterface read Get write Put; default;
  end;

{ EXTERNALSYM TInterfaceList}

{ TBits class }

  TBits = class
  private
    FSize: Integer;
    FBits: Pointer;
    procedure Error;
    procedure SetSize(Value: Integer);
    procedure SetBit(Index: Integer; Value: Boolean);
    function GetBit(Index: Integer): Boolean;
  public
    destructor Destroy; override;
    function OpenBit: Integer;
    property Bits[Index: Integer]: Boolean read GetBit write SetBit; default;
    property Size: Integer read FSize write SetSize;
  end;

{ TPersistent abstract class }

{$M+}

  TPersistent = class(TObject)
  private
    procedure AssignError(Source: TPersistent);
  protected
    procedure AssignTo(Dest: TPersistent); virtual;
    procedure DefineProperties(Filer: TFiler); virtual;
    function GetOwner: TPersistent; dynamic;
  public
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); virtual;
    function GetNamePath: string; dynamic;
  end;

{$M-}

{ TPersistent class reference type }

  TPersistentClass = class of TPersistent;

{ TInterfaced Persistent }

  TInterfacedPersistent = class(TPersistent, IInterface)
  private
    FOwnerInterface: IInterface;
  protected
    { IInterface }
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  public
    function QueryInterface(const IID: TGUID; out Obj): HResult; virtual; stdcall;
    procedure AfterConstruction; override;
  end;

{ TRecall class }

  TRecall = class(TObject)
  private
    FStorage, FReference: TPersistent;
  public
    constructor Create(AStorage, AReference: TPersistent);
    destructor Destroy; override;
    procedure Store;
    procedure Forget;
    property Reference: TPersistent read FReference;
  end;

{ TCollection class }

  TCollection = class;

  TCollectionItem = class(TPersistent)
  private
    FCollection: TCollection;
    FID: Integer;
    function GetIndex: Integer;
  protected
    procedure Changed(AllItems: Boolean);
    function GetOwner: TPersistent; override;
    function GetDisplayName: string; virtual;
    procedure SetCollection(Value: TCollection); virtual;
    procedure SetIndex(Value: Integer); virtual;
    procedure SetDisplayName(const Value: string); virtual;
  public
    constructor Create(Collection: TCollection); virtual;
    destructor Destroy; override;
    function GetNamePath: string; override;
    property Collection: TCollection read FCollection write SetCollection;
    property ID: Integer read FID;
    property Index: Integer read GetIndex write SetIndex;
    property DisplayName: string read GetDisplayName write SetDisplayName;
  end;

  TCollectionItemClass = class of TCollectionItem;
  TCollectionNotification = (cnAdded, cnExtracting, cnDeleting);

  TCollectionEnumerator = class
  private
    FIndex: Integer;
    FCollection: TCollection;
  public
    constructor Create(ACollection: TCollection);
    function GetCurrent: TCollectionItem; inline;
    function MoveNext: Boolean;
    property Current: TCollectionItem read GetCurrent;
  end;

  TCollection = class(TPersistent)
  private
    FItemClass: TCollectionItemClass;
    FItems: TList;
    FUpdateCount: Integer;
    FNextID: Integer;
    FPropName: string;
    function GetCapacity: Integer;
    function GetCount: Integer; inline;
    function GetPropName: string;
    procedure InsertItem(Item: TCollectionItem);
    procedure RemoveItem(Item: TCollectionItem);
    procedure SetCapacity(Value: Integer);
  protected
    procedure Added(var Item: TCollectionItem); virtual; deprecated;
    procedure Deleting(Item: TCollectionItem); virtual; deprecated;
    property NextID: Integer read FNextID;
    procedure Notify(Item: TCollectionItem; Action: TCollectionNotification); virtual;
    { Design-time editor support }
    function GetAttrCount: Integer; dynamic;
    function GetAttr(Index: Integer): string; dynamic;
    function GetItemAttr(Index, ItemIndex: Integer): string; dynamic;
    procedure Changed;
    function GetItem(Index: Integer): TCollectionItem;
    procedure SetItem(Index: Integer; Value: TCollectionItem);
    procedure SetItemName(Item: TCollectionItem); virtual;
    procedure Update(Item: TCollectionItem); virtual;
    property PropName: string read GetPropName write FPropName;
    property UpdateCount: Integer read FUpdateCount;
  public
    constructor Create(ItemClass: TCollectionItemClass);
    destructor Destroy; override;
    function Owner: TPersistent;
    function Add: TCollectionItem;
    procedure Assign(Source: TPersistent); override;
    procedure BeginUpdate; virtual;
    procedure Clear;
    procedure Delete(Index: Integer);
    procedure EndUpdate; virtual;
    function FindItemID(ID: Integer): TCollectionItem;
    function GetEnumerator: TCollectionEnumerator;
    function GetNamePath: string; override;
    function Insert(Index: Integer): TCollectionItem;
    property Capacity: Integer read GetCapacity write SetCapacity;
    property Count: Integer read GetCount;
    property ItemClass: TCollectionItemClass read FItemClass;
    property Items[Index: Integer]: TCollectionItem read GetItem write SetItem;
  end;

{ Collection class that maintains an "Owner" in order to obtain property
  path information at design-time }

  TOwnedCollection = class(TCollection)
  private
    FOwner: TPersistent;
  protected
    function GetOwner: TPersistent; override;
  public
    constructor Create(AOwner: TPersistent; ItemClass: TCollectionItemClass);
  end;

  TStrings = class;

{ TGetModuleProc }
{ Used in the TFormDesigner class to allow component/property editors access
  to project specific information }

  TGetModuleProc = procedure(const FileName, UnitName, FormName,
    DesignClass: string; CoClasses: TStrings) of object;

{ IStringsAdapter interface }
{ Maintains link between TStrings and IStrings implementations }

  IStringsAdapter = interface
    ['{739C2F34-52EC-11D0-9EA6-0020AF3D82DA}']
    procedure ReferenceStrings(S: TStrings);
    procedure ReleaseStrings;
  end;

{ TStrings class }

  TStringsDefined = set of (sdDelimiter, sdQuoteChar, sdNameValueSeparator,
    sdLineBreak, sdStrictDelimiter);

  TStringsEnumerator = class
  private
    FIndex: Integer;
    FStrings: TStrings;
  public
    constructor Create(AStrings: TStrings);
    function GetCurrent: string; inline;
    function MoveNext: Boolean;
    property Current: string read GetCurrent;
  end;

  TStrings = class(TPersistent)
  private
    FEncoding: TEncoding;
    FDefined: TStringsDefined;
    FDefaultEncoding: TEncoding;
    FDelimiter: Char;
    FLineBreak: string;
    FQuoteChar: Char;
    FNameValueSeparator: Char;
    FStrictDelimiter: Boolean;
    FUpdateCount: Integer;
    FAdapter: IStringsAdapter;
    FWriteBOM: Boolean;
    function GetCommaText: string;
    function GetDelimitedText: string;
    function GetName(Index: Integer): string;
    function GetValue(const Name: string): string;
    procedure ReadData(Reader: TReader);
    procedure SetCommaText(const Value: string);
    procedure SetDelimitedText(const Value: string);
    procedure SetStringsAdapter(const Value: IStringsAdapter);
    procedure SetValue(const Name, Value: string);
    procedure WriteData(Writer: TWriter);
    function GetDelimiter: Char;
    procedure SetDelimiter(const Value: Char);
    function GetLineBreak: string;
    procedure SetLineBreak(const Value: string);
    function GetQuoteChar: Char;
    procedure SetQuoteChar(const Value: Char);
    function GetNameValueSeparator: Char;
    procedure SetNameValueSeparator(const Value: Char);
    function GetStrictDelimiter: Boolean;
    procedure SetStrictDelimiter(const Value: Boolean);
    function GetValueFromIndex(Index: Integer): string;
    procedure SetValueFromIndex(Index: Integer; const Value: string);
    procedure SetDefaultEncoding(const Value: TEncoding);
  protected
    procedure DefineProperties(Filer: TFiler); override;
    procedure Error(const Msg: string; Data: Integer); overload;
    procedure Error(Msg: PResStringRec; Data: Integer); overload;
    function ExtractName(const S: string): string;
    function Get(Index: Integer): string; virtual; abstract;
    function GetCapacity: Integer; virtual;
    function GetCount: Integer; virtual; abstract;
    function GetObject(Index: Integer): TObject; virtual;
    function GetTextStr: string; virtual;
    procedure Put(Index: Integer; const S: string); virtual;
    procedure PutObject(Index: Integer; AObject: TObject); virtual;
    procedure SetCapacity(NewCapacity: Integer); virtual;
    procedure SetEncoding(const Value: TEncoding);
    procedure SetTextStr(const Value: string); virtual;
    procedure SetUpdateState(Updating: Boolean); virtual;
    property UpdateCount: Integer read FUpdateCount;
    function CompareStrings(const S1, S2: string): Integer; virtual;
  public
    constructor Create;
    destructor Destroy; override;
    function Add(const S: string): Integer; virtual;
    function AddObject(const S: string; AObject: TObject): Integer; virtual;
    procedure Append(const S: string);
    procedure AddStrings(Strings: TStrings); overload; virtual;
    procedure AddStrings(const Strings: TArray<string>); overload;
    procedure AddStrings(const Strings: TArray<string>; const Objects: TArray<TObject>); overload;
    procedure Assign(Source: TPersistent); override;
    procedure BeginUpdate;
    procedure Clear; virtual; abstract;
    procedure Delete(Index: Integer); virtual; abstract;
    procedure EndUpdate;
    function Equals(Strings: TStrings): Boolean; reintroduce;
    procedure Exchange(Index1, Index2: Integer); virtual;
    function GetEnumerator: TStringsEnumerator;
    function GetText: PChar; virtual;
    function IndexOf(const S: string): Integer; virtual;
    function IndexOfName(const Name: string): Integer; virtual;
    function IndexOfObject(AObject: TObject): Integer; virtual;
    procedure Insert(Index: Integer; const S: string); virtual; abstract;
    procedure InsertObject(Index: Integer; const S: string;
      AObject: TObject); virtual;
    procedure LoadFromFile(const FileName: string); overload; virtual;
    procedure LoadFromFile(const FileName: string; Encoding: TEncoding); overload; virtual;
    procedure LoadFromStream(Stream: TStream); overload; virtual;
    procedure LoadFromStream(Stream: TStream; Encoding: TEncoding); overload; virtual;
    procedure Move(CurIndex, NewIndex: Integer); virtual;
    procedure SaveToFile(const FileName: string); overload; virtual;
    procedure SaveToFile(const FileName: string; Encoding: TEncoding); overload; virtual;
    procedure SaveToStream(Stream: TStream); overload; virtual;
    procedure SaveToStream(Stream: TStream; Encoding: TEncoding); overload; virtual;
    procedure SetText(Text: PChar); virtual;
    function ToStringArray: TArray<string>;
    function ToObjectArray: TArray<TObject>;
    property Capacity: Integer read GetCapacity write SetCapacity;
    property CommaText: string read GetCommaText write SetCommaText;
    property Count: Integer read GetCount;
    property DefaultEncoding: TEncoding read FDefaultEncoding write SetDefaultEncoding;
    property Delimiter: Char read GetDelimiter write SetDelimiter;
    property DelimitedText: string read GetDelimitedText write SetDelimitedText;
    property Encoding: TEncoding read FEncoding;
    property LineBreak: string read GetLineBreak write SetLineBreak;
    property Names[Index: Integer]: string read GetName;
    property Objects[Index: Integer]: TObject read GetObject write PutObject;
    property QuoteChar: Char read GetQuoteChar write SetQuoteChar;
    property Values[const Name: string]: string read GetValue write SetValue;
    property ValueFromIndex[Index: Integer]: string read GetValueFromIndex write SetValueFromIndex;
    property NameValueSeparator: Char read GetNameValueSeparator write SetNameValueSeparator;
    property StrictDelimiter: Boolean read GetStrictDelimiter write SetStrictDelimiter;
    property Strings[Index: Integer]: string read Get write Put; default;
    property Text: string read GetTextStr write SetTextStr;
    property StringsAdapter: IStringsAdapter read FAdapter write SetStringsAdapter;
    property WriteBOM: Boolean read FWriteBOM write FWriteBOM;
  end;

{ TStringList class }

  TStringList = class;

  PStringItem = ^TStringItem;
  TStringItem = record
    FString: string;
    FObject: TObject;
  end;

  PStringItemList = ^TStringItemList;
  TStringItemList = array of TStringItem;
  TStringListSortCompare = function(List: TStringList; Index1, Index2: Integer): Integer;

  TStringList = class(TStrings)
  private
    FList: TStringItemList;
    FCount: Integer;
    FCapacity: Integer;
    FSorted: Boolean;
    FDuplicates: TDuplicates;
    FCaseSensitive: Boolean;
    FOnChange: TNotifyEvent;
    FOnChanging: TNotifyEvent;
    FOwnsObject: Boolean;
    procedure ExchangeItems(Index1, Index2: Integer);
    procedure Grow;
    procedure QuickSort(L, R: Integer; SCompare: TStringListSortCompare);
    procedure SetSorted(Value: Boolean);
    procedure SetCaseSensitive(const Value: Boolean);
  protected
    procedure Changed; virtual;
    procedure Changing; virtual;
    function Get(Index: Integer): string; override;
    function GetCapacity: Integer; override;
    function GetCount: Integer; override;
    function GetObject(Index: Integer): TObject; override;
    procedure Put(Index: Integer; const S: string); override;
    procedure PutObject(Index: Integer; AObject: TObject); override;
    procedure SetCapacity(NewCapacity: Integer); override;
    procedure SetUpdateState(Updating: Boolean); override;
    function CompareStrings(const S1, S2: string): Integer; override;
    procedure InsertItem(Index: Integer; const S: string; AObject: TObject); virtual;
  public
    constructor Create; overload;
    constructor Create(OwnsObjects: Boolean); overload;
    destructor Destroy; override;
    function Add(const S: string): Integer; override;
    function AddObject(const S: string; AObject: TObject): Integer; override;
    procedure Assign(Source: TPersistent); override;
    procedure Clear; override;
    procedure Delete(Index: Integer); override;
    procedure Exchange(Index1, Index2: Integer); override;
    function Find(const S: string; var Index: Integer): Boolean; virtual;
    function IndexOf(const S: string): Integer; override;
    procedure Insert(Index: Integer; const S: string); override;
    procedure InsertObject(Index: Integer; const S: string;
      AObject: TObject); override;
    procedure Sort; virtual;
    procedure CustomSort(Compare: TStringListSortCompare); virtual;
    property Duplicates: TDuplicates read FDuplicates write FDuplicates;
    property Sorted: Boolean read FSorted write SetSorted;
    property CaseSensitive: Boolean read FCaseSensitive write SetCaseSensitive;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnChanging: TNotifyEvent read FOnChanging write FOnChanging;
    property OwnsObjects: Boolean read FOwnsObject write FOwnsObject;
  end;

{ TStream abstract class }

  TStream = class(TObject)
  private
    function GetPosition: Int64;
    procedure SetPosition(const Pos: Int64);
    procedure SetSize64(const NewSize: Int64);
  protected
    function GetSize: Int64; virtual;
    procedure SetSize(NewSize: Longint); overload; virtual;
    procedure SetSize(const NewSize: Int64); overload; virtual;
  public
    function Read(var Buffer; Count: Longint): Longint; virtual; abstract;
    function Write(const Buffer; Count: Longint): Longint; virtual; abstract;
    function Seek(Offset: Longint; Origin: Word): Longint; overload; virtual;
    function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; overload; virtual;
    procedure ReadBuffer(var Buffer; Count: Longint);
    procedure WriteBuffer(const Buffer; Count: Longint);
    function CopyFrom(Source: TStream; Count: Int64): Int64;
    function ReadComponent(Instance: TComponent): TComponent;
    function ReadComponentRes(Instance: TComponent): TComponent;
    procedure WriteComponent(Instance: TComponent);
    procedure WriteComponentRes(const ResName: string; Instance: TComponent);
    procedure WriteDescendent(Instance, Ancestor: TComponent);
    procedure WriteDescendentRes(const ResName: string; Instance, Ancestor: TComponent);
    procedure WriteResourceHeader(const ResName: string; out FixupInfo: Integer);
    procedure FixupResourceHeader(FixupInfo: Integer);
    procedure ReadResHeader;
    property Position: Int64 read GetPosition write SetPosition;
    property Size: Int64 read GetSize write SetSize64;
  end;

  IStreamPersist = interface
    ['{B8CD12A3-267A-11D4-83DA-00C04F60B2DD}']
    procedure LoadFromStream(Stream: TStream);
    procedure SaveToStream(Stream: TStream);
  end;

{ THandleStream class }

  THandleStream = class(TStream)
  protected
    FHandle: THandle;
    procedure SetSize(NewSize: Longint); override;
    procedure SetSize(const NewSize: Int64); override;
  public
    constructor Create(AHandle: THandle);
    function Read(var Buffer; Count: Longint): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; override;
    property Handle: THandle read FHandle;
  end;

{ TFileStream class }

  TFileStream = class(THandleStream)
  strict private
    FFileName: string;
  public
    constructor Create(const AFileName: string; Mode: Word); overload;
    constructor Create(const AFileName: string; Mode: Word; Rights: Cardinal); overload;
    destructor Destroy; override;
    property FileName: string read FFileName;
  end;

{ TCustomMemoryStream abstract class }

  TCustomMemoryStream = class(TStream)
  private
    FMemory: Pointer;
    FSize, FPosition: NativeInt;
  protected
    procedure SetPointer(Ptr: Pointer; const Size: NativeInt);
  public
    function Read(var Buffer; Count: Longint): Longint; override;
    function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; override;
    procedure SaveToStream(Stream: TStream); virtual;
    procedure SaveToFile(const FileName: string);
    property Memory: Pointer read FMemory;
  end;

{ TMemoryStream }

  TMemoryStream = class(TCustomMemoryStream)
  private
    FCapacity: Longint;
    procedure SetCapacity(NewCapacity: Longint);
  protected
    function Realloc(var NewCapacity: Longint): Pointer; virtual;
    property Capacity: Longint read FCapacity write SetCapacity;
  public
    destructor Destroy; override;
    procedure Clear;
    procedure LoadFromStream(Stream: TStream);
    procedure LoadFromFile(const FileName: string);
    procedure SetSize(NewSize: Longint); override;
    function Write(const Buffer; Count: Longint): Longint; override;
  end;

{ TBytesStream }

  TBytesStream = class(TMemoryStream)
  private
    FBytes: TBytes;
  protected
    function Realloc(var NewCapacity: Longint): Pointer; override;
  public
    constructor Create(const ABytes: TBytes); overload;
    property Bytes: TBytes read FBytes;
  end;

{ TStringStream }

{$IFDEF UNICODE}
  TStringStream = class(TBytesStream)
  private
    FEncoding: TEncoding;
    FOwnsEncoding: Boolean;
    function GetDataString: string;
  public
    constructor Create; overload;
    constructor Create(const AString: string); overload;
    constructor Create(const AString: RawByteString); overload;
    constructor Create(const AString: string; AEncoding: TEncoding; AOwnsEncoding: Boolean = True); overload;
    constructor Create(const AString: string; ACodePage: Integer); overload;
    constructor Create(const ABytes: TBytes); overload;
    destructor Destroy; override;
    function ReadString(Count: Longint): string;
    procedure WriteString(const AString: string);
    property DataString: string read GetDataString;
    property Encoding: TEncoding read FEncoding;
{$ELSE}
  TStringStream = class(TStream)
  private
    FDataString: string;
    FPosition: Integer;
  protected
    procedure SetSize(NewSize: Longint); override;
  public
    constructor Create(const AString: string);
    function Read(var Buffer; Count: Longint): Longint; override;
    function ReadString(Count: Longint): string;
    function Seek(Offset: Longint; Origin: Word): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    procedure WriteString(const AString: string);
    property DataString: string read FDataString;
{$ENDIF}
  end;

{ TResourceStream }

  TResourceStream = class(TCustomMemoryStream)
  private
    HResInfo: THandle;
    HGlobal: THandle;
    procedure Initialize(Instance: THandle; Name, ResType: PChar; FromID: Boolean);
  public
    constructor Create(Instance: THandle; const ResName: string; ResType: PChar);
    constructor CreateFromID(Instance: THandle; ResID: Integer; ResType: PChar);
    destructor Destroy; override;
    function Write(const Buffer; Count: Longint): Longint; override;
  end;

{ TStreamAdapter }
{ Implements OLE IStream on VCL TStream }

  TStreamOwnership = (soReference, soOwned);

  TStreamAdapter = class(TInterfacedObject, IStream)
  private
    FStream: TStream;
    FOwnership: TStreamOwnership;
  public
    constructor Create(Stream: TStream; Ownership: TStreamOwnership = soReference);
    destructor Destroy; override;
    function Read(pv: Pointer; cb: Longint;
      pcbRead: PLongint): HResult; virtual; stdcall;
    function Write(pv: Pointer; cb: Longint;
      pcbWritten: PLongint): HResult; virtual; stdcall;
    function Seek(dlibMove: Largeint; dwOrigin: Longint;
      out libNewPosition: Largeint): HResult; virtual; stdcall;
    function SetSize(libNewSize: Largeint): HResult; virtual; stdcall;
    function CopyTo(stm: IStream; cb: Largeint; out cbRead: Largeint;
      out cbWritten: Largeint): HResult; virtual; stdcall;
    function Commit(grfCommitFlags: Longint): HResult; virtual; stdcall;
    function Revert: HResult; virtual; stdcall;
    function LockRegion(libOffset: Largeint; cb: Largeint;
      dwLockType: Longint): HResult; virtual; stdcall;
    function UnlockRegion(libOffset: Largeint; cb: Largeint;
      dwLockType: Longint): HResult; virtual; stdcall;
    function Stat(out statstg: TStatStg;
      grfStatFlag: Longint): HResult; virtual; stdcall;
    function Clone(out stm: IStream): HResult; virtual; stdcall;
    property Stream: TStream read FStream;
    property StreamOwnership: TStreamOwnership read FOwnership write FOwnership;
  end;

{ TClassFinder }

  TGetClass = procedure (AClass: TPersistentClass) of object;

  TClassFinder = class
  private
    FGroups: TList;
    FClass: TPersistentClass;
  public
    constructor Create(AClass: TPersistentClass = nil;
      AIncludeActiveGroups: Boolean = False);
    destructor Destroy; override;
    function GetClass(const AClassName: string): TPersistentClass;
    procedure GetClasses(Proc: TGetClass);

    property FinderClass: TPersistentClass read FClass;
  end;

{ TFiler }

  TValueType = (vaNull, vaList, vaInt8, vaInt16, vaInt32, vaExtended,
    vaString, vaIdent, vaFalse, vaTrue, vaBinary, vaSet, vaLString,
    vaNil, vaCollection, vaSingle, vaCurrency, vaDate, vaWString,
    vaInt64, vaUTF8String, vaDouble);

  TFilerFlag = (ffInherited, ffChildPos, ffInline);
  TFilerFlags = set of TFilerFlag;

  TReaderProc = procedure(Reader: TReader) of object;
  TWriterProc = procedure(Writer: TWriter) of object;
  TStreamProc = procedure(Stream: TStream) of object;

  IInterfaceComponentReference = interface
    ['{E28B1858-EC86-4559-8FCD-6B4F824151ED}']
    function GetComponent: TComponent;
  end;

  TFiler = class(TObject)
  private
    FStream: TStream;
    FBuffer: Pointer;
    FBufSize: Integer;
    FBufPos: Integer;
    FBufEnd: Integer;
    FRoot: TComponent;
    FLookupRoot: TComponent;
    FAncestor: TPersistent;
    FIgnoreChildren: Boolean;
  protected
    procedure SetRoot(Value: TComponent); virtual;
  public
    constructor Create(Stream: TStream; BufSize: Integer);
    destructor Destroy; override;
    procedure DefineProperty(const Name: string;
      ReadData: TReaderProc; WriteData: TWriterProc;
      HasData: Boolean); virtual; abstract;
    procedure DefineBinaryProperty(const Name: string;
      ReadData, WriteData: TStreamProc;
      HasData: Boolean); virtual; abstract;
    procedure FlushBuffer; virtual; abstract;
    property Root: TComponent read FRoot write SetRoot;
    property LookupRoot: TComponent read FLookupRoot;
    property Ancestor: TPersistent read FAncestor write FAncestor;
    property IgnoreChildren: Boolean read FIgnoreChildren write FIgnoreChildren;
  end;

{ TComponent class reference type }

  TComponentClass = class of TComponent;

{ Custom variant stream support }

  IVarStreamable = interface
    ['{D60BA026-5E42-4C2A-BB01-3F1C8F30A28E}']
    procedure StreamIn(var Dest: TVarData; const Stream: TStream);
    procedure StreamOut(const Source: TVarData; const Stream: TStream);
  end;

{ TReader }

  TFindMethodEvent = procedure (Reader: TReader; const MethodName: string;
    var Address: Pointer; var Error: Boolean) of object;
  TSetNameEvent = procedure (Reader: TReader; Component: TComponent;
    var Name: string) of object;
  TReferenceNameEvent = procedure (Reader: TReader; var Name: string) of object;
  TAncestorNotFoundEvent = procedure (Reader: TReader; const ComponentName: string;
    ComponentClass: TPersistentClass; var Component: TComponent) of object;
  TReadComponentsProc = procedure (Component: TComponent) of object;
  TReaderError = procedure (Reader: TReader; const Message: string; var Handled: Boolean) of object;
  TFindComponentClassEvent = procedure (Reader: TReader; const ClassName: string;
    var ComponentClass: TComponentClass) of object;
  TCreateComponentEvent = procedure (Reader: TReader;
    ComponentClass: TComponentClass; var Component: TComponent) of object;
  TFindMethodInstanceEvent = procedure (Reader: TReader; const MethodName: string;
    var AMethod: TMethod; var Error: Boolean) of object;
  TFindComponentInstanceEvent = procedure (Reader: TReader; const Name: string;
    var Instance: Pointer) of object;

  TReader = class(TFiler)
  private
    FOwner: TComponent;
    FParent: TComponent;
    FFixups: TList;
    FLoaded: TList;
    FOnFindMethod: TFindMethodEvent;
    FOnFindMethodInstance: TFindMethodInstanceEvent;
    FOnSetName: TSetNameEvent;
    FOnReferenceName: TReferenceNameEvent;
    FOnAncestorNotFound: TAncestorNotFoundEvent;
    FOnError: TReaderError;
    FOnFindComponentClass: TFindComponentClassEvent;
    FOnCreateComponent: TCreateComponentEvent;
    FOnFindComponentInstance: TFindComponentInstanceEvent;
    FPropName: string;
    FFinder: TClassFinder;
    FCanHandleExcepts: Boolean;
    procedure DoFixupReferences;
    procedure FreeFixups;
    function GetFieldClass(Instance: TObject; const ClassName: string): TPersistentClass;
    function GetPosition: Longint;
    procedure ReadBuffer;
    procedure ReadDataInner(Instance: TComponent);
    function FindComponentClass(const ClassName: string): TComponentClass;
  protected
    function Error(const Message: string): Boolean; virtual;
    function FindAncestorComponent(const Name: string;
      ComponentClass: TPersistentClass): TComponent; virtual;
    function FindMethodInstance(Root: TComponent; const MethodName: string): TMethod; virtual;
    function FindMethod(Root: TComponent; const MethodName: string): Pointer; virtual;
    procedure SetName(Component: TComponent; var Name: string); virtual;
    procedure ReadProperty(AInstance: TPersistent);
    procedure ReadPropValue(Instance: TPersistent; PropInfo: Pointer);
    procedure ReferenceName(var Name: string); virtual;
    procedure PropertyError(const Name: string);
    procedure ReadData(Instance: TComponent);
    function ReadSet(SetType: Pointer): Integer;
    procedure SetPosition(Value: Longint);
    procedure SkipBytes(Count: Integer);
    procedure SkipSetBody;
    procedure SkipProperty;
    procedure SkipComponent(SkipHeader: Boolean);
    property PropName: string read FPropName;
    property CanHandleExceptions: Boolean read FCanHandleExcepts;
  public
    destructor Destroy; override;
    procedure BeginReferences;
    procedure CheckValue(Value: TValueType);
    procedure DefineProperty(const Name: string;
      ReadData: TReaderProc; WriteData: TWriterProc;
      HasData: Boolean); override;
    procedure DefineBinaryProperty(const Name: string;
      ReadData, WriteData: TStreamProc;
      HasData: Boolean); override;
    function EndOfList: Boolean;
    procedure EndReferences;
    procedure FixupReferences;
    procedure FlushBuffer; override;
    function NextValue: TValueType;
    procedure Read(var Buf; Count: Longint);
    function ReadBoolean: Boolean;
    function ReadChar: Char;
    function ReadWideChar: WideChar;
    procedure ReadCollection(Collection: TCollection);
    function ReadComponent(Component: TComponent): TComponent;
    procedure ReadComponents(AOwner, AParent: TComponent;
      Proc: TReadComponentsProc);
    function ReadFloat: Extended;
    function ReadSingle: Single;
    function ReadDouble: Double;
    function ReadCurrency: Currency;
    function ReadDate: TDateTime;
    function ReadIdent: string;
    function ReadInteger: Longint;
    function ReadInt64: Int64;
    procedure ReadListBegin; inline;
    procedure ReadListEnd; inline;
    procedure ReadPrefix(var Flags: TFilerFlags; var AChildPos: Integer); virtual;
    function ReadRootComponent(Root: TComponent): TComponent;
    procedure ReadSignature;
    function ReadStr: string;
    function ReadString: string;
    function ReadWideString: WideString;
    function ReadValue: TValueType;
    function ReadVariant: Variant;
    procedure CopyValue(Writer: TWriter);
    procedure SkipValue;
    property Owner: TComponent read FOwner write FOwner;
    property Parent: TComponent read FParent write FParent;
    property Position: Longint read GetPosition write SetPosition;
    property OnError: TReaderError read FOnError write FOnError;
    property OnFindMethod: TFindMethodEvent read FOnFindMethod write FOnFindMethod;
    property OnFindMethodInstance: TFindMethodInstanceEvent read FOnFindMethodInstance write FOnFindMethodInstance;
    property OnSetName: TSetNameEvent read FOnSetName write FOnSetName;
    property OnReferenceName: TReferenceNameEvent read FOnReferenceName write FOnReferenceName;
    property OnAncestorNotFound: TAncestorNotFoundEvent read FOnAncestorNotFound write FOnAncestorNotFound;
    property OnCreateComponent: TCreateComponentEvent read FOnCreateComponent write FOnCreateComponent;
    property OnFindComponentClass: TFindComponentClassEvent read FOnFindComponentClass write FOnFindComponentClass;
    property OnFindComponentInstance: TFindComponentInstanceEvent read FOnFindComponentInstance write FOnFindComponentInstance;
  end;

{ TWriter }

  TFindAncestorEvent = procedure (Writer: TWriter; Component: TComponent;
    const Name: string; var Ancestor, RootAncestor: TComponent) of object;
  TFindMethodNameEvent = procedure (Writer: TWriter; AMethod: TMethod;
    var MethodName: string) of object;
  TGetLookupInfoEvent = procedure(var Ancestor: TPersistent;
    var Root, LookupRoot, RootAncestor: TComponent) of object;

  TWriter = class(TFiler)
  private
    FRootAncestor: TComponent;
    FPropPath: string;
    FAncestorList: TList;
    FAncestorPos: Integer;
    FChildPos: Integer;
    FOnFindAncestor: TFindAncestorEvent;
    FOnFindMethodName: TFindMethodNameEvent;
    FUseQualifiedNames: Boolean;
    procedure AddAncestor(Component: TComponent);
    function GetPosition: Longint;
    procedure SetPosition(Value: Longint);
    procedure WriteBuffer;
    procedure WriteData(Instance: TComponent); virtual; // linker optimization
    procedure WriteMinStr(const Value: UTF8String);
    procedure GetLookupInfo(var Ancestor: TPersistent;
      var Root, LookupRoot, RootAncestor: TComponent);
  protected
    function FindMethodName(AMethod: TMethod): string; virtual;
    procedure SetRoot(Value: TComponent); override;
    procedure WriteBinary(WriteData: TStreamProc);
    procedure WritePrefix(Flags: TFilerFlags; AChildPos: Integer);
    procedure WriteProperty(Instance: TPersistent; PropInfo: PPropInfo);
    procedure WritePropName(const PropName: string);
    procedure WriteValue(Value: TValueType);
  public
    destructor Destroy; override;
    procedure DefineProperty(const Name: string;
      ReadData: TReaderProc; WriteData: TWriterProc;
      HasData: Boolean); override;
    procedure DefineBinaryProperty(const Name: string;
      ReadData, WriteData: TStreamProc;
      HasData: Boolean); override;
    procedure FlushBuffer; override;
    procedure Write(const Buf; Count: Longint);
    procedure WriteBoolean(Value: Boolean);
    procedure WriteCollection(Value: TCollection);
    procedure WriteComponent(Component: TComponent);
    procedure WriteChar(Value: Char);
    procedure WriteWideChar(Value: WideChar);
    procedure WriteDescendent(Root: TComponent; AAncestor: TComponent);
    procedure WriteFloat(const Value: Extended);
    procedure WriteSingle(const Value: Single);
    procedure WriteDouble(const Value: Double);
    procedure WriteCurrency(const Value: Currency);
    procedure WriteDate(const Value: TDateTime);
    procedure WriteIdent(const Ident: string);
    procedure WriteInteger(Value: Longint); overload;
    procedure WriteInteger(Value: Int64); overload;
    procedure WriteListBegin; inline;
    procedure WriteListEnd; inline;
    procedure WriteProperties(Instance: TPersistent);
    procedure WriteRootComponent(Root: TComponent);
    procedure WriteSignature;
    procedure WriteStr(const Value: AnsiString);
    procedure WriteUTF8Str(const Value: string); inline;
    procedure WriteString(const Value: UnicodeString);
    procedure WriteWideString(const Value: UnicodeString);
    procedure WriteVariant(const Value: Variant);
    property Position: Longint read GetPosition write SetPosition;
    property RootAncestor: TComponent read FRootAncestor write FRootAncestor;
    property OnFindAncestor: TFindAncestorEvent read FOnFindAncestor write FOnFindAncestor;
    property OnFindMethodName: TFindMethodNameEvent read FOnFindMethodName write FOnFindMethodName;
    property UseQualifiedNames: Boolean read FUseQualifiedNames write FUseQualifiedNames;
  end;

{ TParser }

  TParserErrorEvent = procedure (Sender: TObject; const Message: string; var Handled: Boolean) of object;

  TParser = class(TObject)
  private type
    TCharType = (ctOther, ctLetterStart, ctLetterNumber, ctNumber, ctHash, ctQuote, ctDollar, ctDash);
  private
    FStream: TStream;
    FOrigin: Longint;
    FBuffer: TBytes;
    FBufPtr: Integer;
    FBufEnd: Integer;
    FSourcePtr: Integer;
    FSourceEnd: Integer;
    FTokenPtr: Integer;
    FStringPtr: Integer;
    FSourceLine: Integer;
    FSaveChar: Byte;
    FToken: Char;
    FFloatType: Char;
    FWideStr: UnicodeString;
    FOnError: TParserErrorEvent;
    FEncoding: TEncoding;
    FFormatSettings: TFormatSettings;
    procedure ReadBuffer;
    procedure SkipBlanks;
    function CharType(var ABufPos: Integer): TCharType;
  protected
    function GetLinePos: Integer;
  public
    constructor Create(Stream: TStream; AOnError: TParserErrorEvent = nil); overload;
    constructor Create(Stream: TStream; const FormatSettings: TFormatSettings; AOnError: TParserErrorEvent = nil); overload;
    destructor Destroy; override;
    procedure CheckToken(T: Char);
    procedure CheckTokenSymbol(const S: string);
    procedure Error(const Ident: string);
    procedure ErrorFmt(const Ident: string; const Args: array of const);
    procedure ErrorStr(const Message: string);
    procedure HexToBinary(Stream: TStream);
    function NextToken: Char;
    function SourcePos: Longint;
    function TokenComponentIdent: string;
    function TokenFloat: Extended;
    function TokenInt: Int64;
    function TokenString: string;
    function TokenWideString: UnicodeString;
    function TokenSymbolIs(const S: string): Boolean;
    property FloatType: Char read FFloatType;
    property SourceLine: Integer read FSourceLine;
    property LinePos: Integer read GetLinePos;
    property Token: Char read FToken;
    property OnError: TParserErrorEvent read FOnError write FOnError;
  end;

{ TThread }

  EThread = class(Exception);
  EThreadExternalException = class(EThread);

  TThreadMethod = procedure of object;
  TThreadProcedure = reference to procedure;

{$IFDEF MSWINDOWS}
  TThreadPriority = (tpIdle, tpLowest, tpLower, tpNormal, tpHigher, tpHighest,
    tpTimeCritical) platform;
{$ENDIF}

(*$HPPEMIT '#if defined(Yield)'*)
(*$HPPEMIT '#undef Yield'*)
(*$HPPEMIT '#endif'*)

  TThread = class
  private type
    PSynchronizeRecord = ^TSynchronizeRecord;
    TSynchronizeRecord = record
      FThread: TObject;
      FMethod: TThreadMethod;
      FProcedure: TThreadProcedure;
      FSynchronizeException: TObject;
    end;
  private class var
    FProcessorCount: Integer;
  private
{$IFDEF MSWINDOWS}
    FHandle: THandle platform;
{$ENDIF}
    FThreadID: TThreadID;
{$IFDEF POSIX}
{$IFDEF LINUX}
    FCreateSuspendedSem: TSemaphore;
{$ENDIF}
{$IFDEF MACOS}
    FCreateSuspendedEvent: MPEventID;
{$ENDIF}
    FInitialSuspendDone: Boolean;
{$ENDIF}
    FCreateSuspended: Boolean;
    FTerminated: Boolean;
    FSuspended: Boolean;
    FFreeOnTerminate: Boolean;
    FFinished: Boolean;
    FReturnValue: Integer;
    FOnTerminate: TNotifyEvent;
    FSynchronize: TSynchronizeRecord;
    FFatalException: TObject;
    FExternalThread: Boolean;
    class constructor Create;
    class destructor Destroy;
    procedure CallOnTerminate;
    class procedure Synchronize(ASyncRec: PSynchronizeRecord; QueueEvent: Boolean = False); overload;
    class function GetCurrentThread: TThread; static;
    class function GetIsSingleProcessor: Boolean; static; inline;
    procedure InternalStart(Force: Boolean);
{$IFDEF MSWINDOWS}
    function GetPriority: TThreadPriority; platform;
    procedure SetPriority(Value: TThreadPriority); platform;
{$ENDIF}
{$IFDEF POSIX}
    // ** Priority is an Integer value in Linux
    function GetPriority: Integer; platform;
    procedure SetPriority(Value: Integer); platform;
    function GetPolicy: Integer; platform;
    procedure SetPolicy(Value: Integer); platform;
{$ENDIF}
    procedure SetSuspended(Value: Boolean);
  private class threadvar
    FCurrentThread: TThread;
  protected
    procedure CheckThreadError(ErrCode: Integer); overload;
    procedure CheckThreadError(Success: Boolean); overload;
    procedure DoTerminate; virtual;
    procedure TerminatedSet; virtual;
    procedure Execute; virtual; abstract;
    procedure Queue(AMethod: TThreadMethod); overload;
    procedure Synchronize(AMethod: TThreadMethod); overload;
    procedure Queue(AThreadProc: TThreadProcedure); overload;
    procedure Synchronize(AThreadProc: TThreadProcedure); overload;
    property ReturnValue: Integer read FReturnValue write FReturnValue;
    property Terminated: Boolean read FTerminated;
  public
    constructor Create; overload;
    constructor Create(CreateSuspended: Boolean); overload;
    destructor Destroy; override;
    // CreateAnonymousThread will create an instance of an internally derived TThread that simply will call the
    // anonymous method of type TProc. This thread is created as suspended, so you should call the Start method
    // to make the thread run. The thread is also marked as FreeOnTerminate, so you should not touch the returned
    // instance after calling Start as it could have run and is then freed before another external calls or
    // operations on the instance are attempted.
    class function CreateAnonymousThread(const ThreadProc: TProc): TThread; static;
    procedure AfterConstruction; override;
    // This function is not intended to be used for thread synchronization.
    procedure Resume; deprecated;
    // Use Start after creating a suspended thread.
    procedure Start;
    // This function is not intended to be used for thread synchronization.
    procedure Suspend; deprecated;
    procedure Terminate;
    function WaitFor: LongWord;
    // NOTE: You can only call CheckTerminated and SetReturnValue on an internally created thread.
    // Calling this from an externally created thread will raise an exception
    // Use TThread.CheckTerminated to check if the Terminated flag has been set on the current thread
    class function CheckTerminated: Boolean; static;
    // Use TThread.SetReturnValue to set the current thread's return value from code that doesn't have
    // direct access to the current thread
    class procedure SetReturnValue(Value: Integer); static;
    class procedure Queue(AThread: TThread; AMethod: TThreadMethod); overload; static;
    class procedure RemoveQueuedEvents(AThread: TThread; AMethod: TThreadMethod); overload; static;
    class procedure StaticQueue(AThread: TThread; AMethod: TThreadMethod); static; deprecated 'From C++ just use Queue now that it is just a static method';
    class procedure Synchronize(AThread: TThread; AMethod: TThreadMethod); overload; static;
    class procedure StaticSynchronize(AThread: TThread; AMethod: TThreadMethod); static; deprecated 'From C++ just use Synchronize now that it is just a static method';
    class procedure Queue(AThread: TThread; AThreadProc: TThreadProcedure); overload; static;
    class procedure Synchronize(AThread: TThread; AThreadProc: TThreadProcedure); overload; static;
    class procedure RemoveQueuedEvents(AThread: TThread); overload; static;
    class procedure RemoveQueuedEvents(AMethod: TThreadMethod); overload; static;
    class procedure NameThreadForDebugging(AThreadName: AnsiString; AThreadID: TThreadID = TThreadID(-1)); static;
    class procedure SpinWait(Iterations: Integer); static;
    class procedure Sleep(Timeout: Integer); static;
    class procedure Yield; static;
    property ExternalThread: Boolean read FExternalThread;
    property FatalException: TObject read FFatalException;
    property FreeOnTerminate: Boolean read FFreeOnTerminate write FFreeOnTerminate;
    property Finished: Boolean read FFinished;
{$IFDEF MSWINDOWS}
    property Handle: THandle read FHandle;
    property Priority: TThreadPriority read GetPriority write SetPriority;
{$ENDIF}
{$IFDEF POSIX}
    // ** Priority is an Integer **
    property Priority: Integer read GetPriority write SetPriority;
    property Policy: Integer read GetPolicy write SetPolicy;
{$ENDIF}
    property Suspended: Boolean read FSuspended write SetSuspended;
    property ThreadID: TThreadID read FThreadID;
    property OnTerminate: TNotifyEvent read FOnTerminate write FOnTerminate;
    class property CurrentThread: TThread read GetCurrentThread;
    class property ProcessorCount: Integer read FProcessorCount;
    class property IsSingleProcessor: Boolean read GetIsSingleProcessor;
  end;

{ TComponentEnumerator }

  TComponentEnumerator = class
  private
    FIndex: Integer;
    FComponent: TComponent;
  public
    constructor Create(AComponent: TComponent);
    function GetCurrent: TComponent; inline;
    function MoveNext: Boolean;
    property Current: TComponent read GetCurrent;
  end;

{ TComponent class }

  TOperation = (opInsert, opRemove);
  TComponentState = set of (csLoading, csReading, csWriting, csDestroying,
    csDesigning, csAncestor, csUpdating, csFixups, csFreeNotification,
    csInline, csDesignInstance);
  TComponentStyle = set of (csInheritable, csCheckPropAvail, csSubComponent,
    csTransient);
  TGetChildProc = procedure (Child: TComponent) of object;

  TComponentName = type string;

  IVCLComObject = interface
    ['{E07892A0-F52F-11CF-BD2F-0020AF0E5B81}']
    function GetTypeInfoCount(out Count: Integer): HResult; stdcall;
    function GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult; stdcall;
    function GetIDsOfNames(const IID: TGUID; Names: Pointer;
      NameCount, LocaleID: Integer; DispIDs: Pointer): HResult; stdcall;
    function Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer;
      Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult; stdcall;
    function SafeCallException(ExceptObject: TObject;
      ExceptAddr: Pointer): HResult;
    procedure FreeOnRelease;
  end;

  IDesignerNotify = interface
    ['{B971E807-E3A6-11D1-AAB1-00C04FB16FBC}']
    procedure Modified;
    procedure Notification(AnObject: TPersistent; Operation: TOperation);
  end;

  TBasicAction = class;

  ComponentPlatformsAttribute = class(TCustomAttribute)
  private
    FPlatforms: TPlatformIds;
  public
    constructor Create(const Platforms: TPlatformIds);
    property Platforms: TPlatformIds read FPlatforms write FPlatforms;
  end;

  IObserver = interface;
  TObserverToggleEvent = reference to procedure(const AObserver: IObserver; const Value: Boolean);
  IObserver = interface
    ['{B03253D8-7720-4B68-B10A-E3E79B91ECD3}']
    procedure Removed;
    function GetActive: Boolean;
    procedure SetActive(Value: Boolean);
    function GetOnObserverToggle: TObserverToggleEvent;
    procedure SetOnObserverToggle(AEvent: TObserverToggleEvent);
    property OnObserverToggle: TObserverToggleEvent read GetOnObserverToggle write SetOnObserverToggle;
    property Active: Boolean read GetActive write SetActive;
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
    function IsModified: Boolean;
    function IsValidChar(AKey: Char): Boolean;
    function IsRequired: Boolean;
    function GetIsReadOnly: Boolean;
    procedure SetIsReadOnly(Value: Boolean);
    property IsReadOnly: Boolean read GetIsReadOnly write SetIsReadOnly;
    function GetIsEditing: Boolean;
    property IsEditing: Boolean read GetIsEditing;
    procedure BeginUpdate;
    procedure EndUpdate;
    function GetUpdating: Boolean;
    property Updating: Boolean read GetUpdating;
  end;

  TObserverGetCurrentEvent = reference to function: TVarRec;
  IEditGridLinkObserver = interface(IEditLinkObserver)
    ['{A911B648-E1E5-4EEC-9FEE-D8E62FFA0E71}']
    function GetCurrent: TVarRec;
    property Current: TVarRec read GetCurrent;
    function GetOnObserverCurrent: TObserverGetCurrentEvent;
    procedure SetOnObserverCurrent(AEvent: TObserverGetCurrentEvent);
    property OnObserverCurrent: TObserverGetCurrentEvent read GetOnObserverCurrent write SetOnObserverCurrent;
  end;

  IPositionLinkObserver = interface
    ['{FA45CF0C-E8DB-4F9E-B53F-E072C94659F6}']
    procedure PosChanged;
  end;
  
  TObservers = class
  public type
    TCanObserveEvent = reference to function(const ID: Integer): Boolean;
    TObserverAddedEvent = reference to procedure(const ID: Integer; const Observer: IObserver);
  private
    FObservers: TStringList; //Dictionary of ID (integer key) and IInterfaceList (value)
    FInterfaces: IInterfaceList;
    FCanObserve: TCanObserveEvent;
    FObserverAdded: TObserverAddedEvent;
  protected
  public
    constructor Create;
    destructor Destroy; override;
    property OnCanObserve: TCanObserveEvent read FCanObserve write FCanObserve;
    property OnObserverAdded: TObserverAddedEvent read FObserverAdded write FObserverAdded;

    function CanObserve(const ID: Integer): Boolean; overload; virtual;
    procedure AddObserver(const ID: Integer; const AIntf: IInterface); overload; virtual;
    procedure AddObserver(const IDs: Array of Integer; const AIntf: IInterface); overload; virtual;
    procedure RemoveObserver(const ID: Integer; const AIntf: IInterface); overload; virtual;
    procedure RemoveObserver(const IDs: Array of Integer; const AIntf: IInterface); overload; virtual;
    function IsObserving(const ID: Integer): Boolean; overload; virtual;
    function TryIsObserving(const ID: Integer; out AIntf: IInterface): Boolean; virtual;
    function GetSingleCastObserver(const ID: Integer): IInterface;
    function GetMultiCastObserver(const ID: Integer): IInterfaceList;
  end;

  TLinkObservers = class
  public
    class function GetEditGridLink(AObservers: TObservers): IEditGridLinkObserver; static;
    class function GetEditLink(AObservers: TObservers): IEditLinkObserver; static;
    class procedure EditLinkUpdate(AObservers: TObservers); static; inline;
    class procedure EditLinkReset(AObservers: TObservers); static; inline;
    class procedure EditLinkModified(AObservers: TObservers); static; inline;
    class function EditLinkIsModified(AObservers: TObservers): Boolean; static; inline;
    class function EditLinkIsValidChar(AObservers: TObservers; AKey: Char): Boolean; static; inline;
    class function EditLinkIsEditing(AObservers: TObservers): Boolean; static; inline;
    class function EditLinkEdit(AObservers: TObservers): Boolean; static; inline;
    class procedure EditLinkSetIsReadOnly(AObservers: TObservers; AValue: Boolean); static; inline;
    class function EditLinkIsReadOnly(AObservers: TObservers): Boolean; static; inline;

    class procedure EditGridLinkUpdate(AObservers: TObservers); static; inline;
    class procedure EditGridLinkReset(AObservers: TObservers); static; inline;
    class procedure EditGridLinkModified(AObservers: TObservers); static; inline;
    class function EditGridLinkIsModified(AObservers: TObservers): Boolean; static; inline;
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
  private
    FMappings: TStringList;
    class var
      FInstance: TObserverMapping;
  protected
    class function Instance: TObserverMapping;
  public
    constructor Create;
    destructor Destroy; override;
    class destructor Destroy;
    class function GetObserverID(const Key: string): Integer;
  end;

  EObserverException = class(Exception);

  TComponent = class(TPersistent, IInterface, IInterfaceComponentReference)
  private
    FOwner: TComponent;
    FName: TComponentName;
    FTag: NativeInt;
    FComponents: TList;
    FFreeNotifies: TList;
    FDesignInfo: Longint;
    FComponentState: TComponentState;
    FVCLComObject: Pointer;
    FObservers: TObservers;
    function GetComObject: IUnknown;
    function GetComponent(AIndex: Integer): TComponent;
    function GetComponentCount: Integer;
    function GetComponentIndex: Integer;
    procedure Insert(AComponent: TComponent);
    procedure ReadLeft(Reader: TReader);
    procedure ReadTop(Reader: TReader);
    procedure Remove(AComponent: TComponent);
    procedure RemoveNotification(AComponent: TComponent);
    procedure SetComponentIndex(Value: Integer);
    procedure SetReference(Enable: Boolean);
    procedure WriteLeft(Writer: TWriter);
    procedure WriteTop(Writer: TWriter);
    { IInterfaceComponentReference }
    function IInterfaceComponentReference.GetComponent = IntfGetComponent;
    function IntfGetComponent: TComponent;
  protected
    FComponentStyle: TComponentStyle;
  private
    FSortedComponents: TList;
    function FindSortedComponent(const AName: string; var Index: Integer): TComponent;
    procedure AddSortedComponent(AComponent: TComponent);
    procedure RemoveSortedComponent(AComponent: TComponent); inline;
  protected
    procedure ChangeName(const NewName: TComponentName);
    procedure DefineProperties(Filer: TFiler); override;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); dynamic;
    function GetChildOwner: TComponent; dynamic;
    function GetChildParent: TComponent; dynamic;
    function GetOwner: TPersistent; override;
    procedure Loaded; virtual;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); virtual;
    procedure PaletteCreated; dynamic;
    procedure ReadState(Reader: TReader); virtual;
    function CanObserve(const ID: Integer): Boolean; virtual;
    procedure ObserverAdded(const ID: Integer; const Observer: IObserver); virtual;
    function GetObservers: TObservers; virtual;
    procedure SetAncestor(Value: Boolean);
    procedure SetDesigning(Value: Boolean; SetChildren: Boolean = True);
    procedure SetInline(Value: Boolean);
    procedure SetDesignInstance(Value: Boolean);
    procedure SetName(const NewName: TComponentName); virtual;
    procedure SetChildOrder(Child: TComponent; Order: Integer); dynamic;
    procedure SetParentComponent(Value: TComponent); dynamic;
    procedure Updating; dynamic;
    procedure Updated; dynamic;
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); virtual;
    procedure ValidateRename(AComponent: TComponent;
      const CurName, NewName: string); virtual;
    procedure ValidateContainer(AComponent: TComponent); dynamic;
    procedure ValidateInsert(AComponent: TComponent); dynamic;
    procedure WriteState(Writer: TWriter); virtual;
    procedure RemoveFreeNotifications;
    { IInterface }
    function QueryInterface(const IID: TGUID; out Obj): HResult; virtual; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    { IDispatch }
    function GetTypeInfoCount(out Count: Integer): HResult; stdcall;
    function GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult; stdcall;
    function GetIDsOfNames(const IID: TGUID; Names: Pointer;
      NameCount, LocaleID: Integer; DispIDs: Pointer): HResult; stdcall;
    function Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer;
      Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult; stdcall;
  public
    constructor Create(AOwner: TComponent); virtual;
    destructor Destroy; override;
    procedure BeforeDestruction; override;
    procedure DestroyComponents;
    procedure Destroying;
    function ExecuteAction(Action: TBasicAction): Boolean; dynamic;
    function FindComponent(const AName: string): TComponent;
    procedure FreeNotification(AComponent: TComponent);
    procedure RemoveFreeNotification(AComponent: TComponent);
    procedure FreeOnRelease;
    function GetEnumerator: TComponentEnumerator;
    function GetParentComponent: TComponent; dynamic;
    function GetNamePath: string; override;
    function HasParent: Boolean; dynamic;
    procedure InsertComponent(AComponent: TComponent);
    procedure RemoveComponent(AComponent: TComponent);
    procedure SetSubComponent(IsSubComponent: Boolean);
    function SafeCallException(ExceptObject: TObject;
      ExceptAddr: Pointer): HResult; override;
    function UpdateAction(Action: TBasicAction): Boolean; virtual;
    function IsImplementorOf(const I: IInterface): Boolean;
    function ReferenceInterface(const I: IInterface; Operation: TOperation): Boolean;
    property ComObject: IUnknown read GetComObject;
    property Components[Index: Integer]: TComponent read GetComponent;
    property ComponentCount: Integer read GetComponentCount;
    property ComponentIndex: Integer read GetComponentIndex write SetComponentIndex;
    property ComponentState: TComponentState read FComponentState;
    property ComponentStyle: TComponentStyle read FComponentStyle;
    property DesignInfo: Longint read FDesignInfo write FDesignInfo;
    property Owner: TComponent read FOwner;
    property VCLComObject: Pointer read FVCLComObject write FVCLComObject;
    property Observers: TObservers read GetObservers;
  published
    property Name: TComponentName read FName write SetName stored False;
    property Tag: NativeInt read FTag write FTag default 0;
  end;

{ TBasicActionLink }

  TBasicActionLink = class(TObject)
  private
    FOnChange: TNotifyEvent;
  protected
    FAction: TBasicAction;
    procedure AssignClient(AClient: TObject); virtual;
    procedure Change; virtual;
    function IsOnExecuteLinked: Boolean; virtual;
    procedure SetAction(Value: TBasicAction); virtual;
    procedure SetOnExecute(Value: TNotifyEvent); virtual;
  public
    constructor Create(AClient: TObject); virtual;
    destructor Destroy; override;
    function Execute(AComponent: TComponent = nil): Boolean; virtual;
    function Update: Boolean; virtual;
    property Action: TBasicAction read FAction write SetAction;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

  TBasicActionLinkClass = class of TBasicActionLink;

{ TBasicAction }

  TBasicAction = class(TComponent)
  private
    FActionComponent: TComponent;
    FOnChange: TNotifyEvent;
    FOnExecute: TNotifyEvent;
    FOnUpdate: TNotifyEvent;
    procedure SetActionComponent(const Value: TComponent);
  protected
    FClients: TList;
    procedure Change; virtual;
    procedure SetOnExecute(Value: TNotifyEvent); virtual;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    property Clients: TList read FClients write FClients;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function HandlesTarget(Target: TObject): Boolean; virtual;
    procedure UpdateTarget(Target: TObject); virtual;
    procedure ExecuteTarget(Target: TObject); virtual;
    function Execute: Boolean; dynamic;
    procedure RegisterChanges(Value: TBasicActionLink);
    procedure UnRegisterChanges(Value: TBasicActionLink);
    function Update: Boolean; virtual;
    property ActionComponent: TComponent read FActionComponent write SetActionComponent;
    property OnExecute: TNotifyEvent read FOnExecute write SetOnExecute;
    property OnUpdate: TNotifyEvent read FOnUpdate write FOnUpdate;
  end;

{ TBasicAction class reference type }

  TBasicActionClass = class of TBasicAction;

{ TDataModule }

  TDataModule = class(TComponent)
  private
    FDesignSize: TPoint;
    FDesignOffset: TPoint;
    FOnCreate: TNotifyEvent;
    FOnDestroy: TNotifyEvent;
    FOldCreateOrder: Boolean;
    procedure ReadHeight(Reader: TReader);
    procedure ReadHorizontalOffset(Reader: TReader);
    procedure ReadVerticalOffset(Reader: TReader);
    procedure ReadWidth(Reader: TReader);
    procedure WriteWidth(Writer: TWriter);
    procedure WriteHorizontalOffset(Writer: TWriter);
    procedure WriteVerticalOffset(Writer: TWriter);
    procedure WriteHeight(Writer: TWriter);
  protected
    procedure DoCreate; virtual;
    procedure DoDestroy; virtual;
    procedure DefineProperties(Filer: TFiler); override;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    function HandleCreateException: Boolean; dynamic;
    procedure ReadState(Reader: TReader); override;
  public
    constructor Create(AOwner: TComponent); override;
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); virtual;
    destructor Destroy; override;
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    property DesignOffset: TPoint read FDesignOffset write FDesignOffset;
    property DesignSize: TPoint read FDesignSize write FDesignSize;
  published
    property OldCreateOrder: Boolean read FOldCreateOrder write FOldCreateOrder;
    property OnCreate: TNotifyEvent read FOnCreate write FOnCreate;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
  end;

var
  AddDataModule: procedure (DataModule: TDataModule) of object = nil;
  RemoveDataModule: procedure (DataModule: TDataModule) of object = nil;
  ApplicationHandleException: procedure (Sender: TObject) of object = nil;
  ApplicationShowException: procedure (E: Exception) of object = nil;

{ Component registration handlers }

  RegisterComponentsProc: procedure(const Page: string;
    const ComponentClasses: array of TComponentClass) = nil;
  RegisterNoIconProc: procedure(const ComponentClasses: array of TComponentClass) = nil;
  CurrentGroup: Integer = -1; { Current design group }

{$IFDEF MSWINDOWS}
type
  TActiveXRegType = (axrComponentOnly, axrIncludeDescendants);

var
  RegisterNonActiveXProc: procedure(const ComponentClasses: array of TComponentClass;
    AxRegType: TActiveXRegType) = nil;
{$ENDIF}

  CreateVCLComObjectProc: procedure(Component: TComponent) = nil;

{ Point and rectangle constructors }

function Point(AX, AY: Integer): TPoint; inline;
function SmallPoint(AX, AY: SmallInt): TSmallPoint; inline;
function PointsEqual(const P1, P2: TPoint): Boolean; overload;
function PointsEqual(const P1, P2: TSmallPoint): Boolean; overload;
function InvalidPoint(X, Y: Integer): Boolean; overload;
function InvalidPoint(const At: TPoint): Boolean; overload;
function InvalidPoint(const At: TSmallPoint): Boolean; overload;

function Rect(ALeft, ATop, ARight, ABottom: Integer): TRect; overload;
function Rect(const ATopLeft, ABottomRight: TPoint): TRect; overload;
function Bounds(ALeft, ATop, AWidth, AHeight: Integer): TRect;

{ Class registration routines }

procedure RegisterClass(AClass: TPersistentClass);
procedure RegisterClasses(AClasses: array of TPersistentClass);
procedure RegisterClassAlias(AClass: TPersistentClass; const Alias: string);
procedure UnRegisterClass(AClass: TPersistentClass);
procedure UnRegisterClasses(AClasses: array of TPersistentClass);
procedure UnRegisterModuleClasses(Module: HMODULE);
function FindClass(const ClassName: string): TPersistentClass;
function GetClass(const AClassName: string): TPersistentClass;
procedure StartClassGroup(AClass: TPersistentClass);
procedure GroupDescendentsWith(AClass, AClassGroup: TPersistentClass);
function ActivateClassGroup(AClass: TPersistentClass): TPersistentClass;
function ActiveClassGroup: TPersistentClass;
function ClassGroupOf(AClass: TPersistentClass): TPersistentClass; overload;
function ClassGroupOf(Instance: TPersistent): TPersistentClass; overload;

procedure ReportClassGroups(Report: TStrings);

{ Component registration routines }

procedure RegisterComponents(const Page: string;
  ComponentClasses: array of TComponentClass);
//  const ComponentClasses: array of TComponentClass);
procedure RegisterNoIcon(const ComponentClasses: array of TComponentClass);
{$IFDEF MSWINDOWS}
procedure RegisterNonActiveX(const ComponentClasses: array of TComponentClass;
  AxRegType: TActiveXRegType);
{$ENDIF}

var
  GlobalNameSpace: IReadWriteSync;

{ Object filing routines }

type
  TIdentMapEntry = record
    Value: Integer;
    Name: String;
  end;

  TIdentToInt = function(const Ident: string; var Int: Longint): Boolean;
  TIntToIdent = function(Int: Longint; var Ident: string): Boolean;
  TFindGlobalComponent = function(const Name: string): TComponent;
  TIsUniqueGlobalComponentName = function(const Name: string): Boolean;

var
  IsUniqueGlobalComponentNameProc: TIsUniqueGlobalComponentName;

procedure RegisterIntegerConsts(AIntegerType: Pointer; AIdentToInt: TIdentToInt;
  AIntToIdent: TIntToIdent);
procedure UnregisterIntegerConsts(AIntegerType: Pointer; AIdentToInt: TIdentToInt;
  AIntToIdent: TIntToIdent);
procedure RegisterFindGlobalComponentProc(AFindGlobalComponent: TFindGlobalComponent);
procedure UnregisterFindGlobalComponentProc(AFindGlobalComponent: TFindGlobalComponent);
function FindGlobalComponent(const Name: string): TComponent;
function IsUniqueGlobalComponentName(const Name: string): Boolean;
function IdentToInt(const Ident: string; var Int: Longint; const Map: array of TIdentMapEntry): Boolean;
function IntToIdent(Int: Longint; var Ident: string; const Map: array of TIdentMapEntry): Boolean;
function FindIntToIdent(AIntegerType: Pointer): TIntToIdent;
function FindIdentToInt(AIntegerType: Pointer): TIdentToInt;

function InitInheritedComponent(Instance: TComponent; RootAncestor: TClass): Boolean;
function InitComponentRes(const ResName: string; Instance: TComponent): Boolean;
function ReadComponentRes(const ResName: string; Instance: TComponent): TComponent;
function ReadComponentResEx(HInstance: THandle; const ResName: string): TComponent;
function ReadComponentResFile(const FileName: string; Instance: TComponent): TComponent;
procedure WriteComponentResFile(const FileName: string; Instance: TComponent);

procedure GlobalFixupReferences;
procedure GetFixupReferenceNames(Root: TComponent; Names: TStrings);
procedure GetFixupInstanceNames(Root: TComponent;
  const ReferenceRootName: string; Names: TStrings);
procedure RedirectFixupReferences(Root: TComponent; const OldRootName,
  NewRootName: string);
procedure RemoveFixupReferences(Root: TComponent; const RootName: string);
procedure RemoveFixups(Instance: TPersistent);
function FindNestedComponent(Root: TComponent; const NamePath: string): TComponent;

procedure BeginGlobalLoading;
procedure NotifyGlobalLoading;
procedure EndGlobalLoading;

function CollectionsEqual(C1, C2: TCollection; Owner1, Owner2: TComponent): Boolean;

{ find the ultimate owner of a collection or item (or persistent for that matter) }
function GetUltimateOwner(ACollectionItem: TCollectionItem): TPersistent; overload;
function GetUltimateOwner(ACollection: TCollection): TPersistent; overload;
function GetUltimateOwner(APersistent: TPersistent): TPersistent; overload;

{ Object conversion routines }

type
  TStreamOriginalFormat = (sofUnknown, sofBinary, sofText, sofUTF8Text);

procedure ObjectBinaryToText(Input, Output: TStream); overload;
procedure ObjectBinaryToText(Input, Output: TStream;
  var OriginalFormat: TStreamOriginalFormat); overload;
procedure ObjectTextToBinary(Input, Output: TStream); overload;
procedure ObjectTextToBinary(Input, Output: TStream;
  var OriginalFormat: TStreamOriginalFormat); overload;

procedure ObjectResourceToText(Input, Output: TStream); overload;
procedure ObjectResourceToText(Input, Output: TStream;
  var OriginalFormat: TStreamOriginalFormat); overload;
procedure ObjectTextToResource(Input, Output: TStream); overload;
procedure ObjectTextToResource(Input, Output: TStream;
  var OriginalFormat: TStreamOriginalFormat); overload;

function TestStreamFormat(Stream: TStream): TStreamOriginalFormat;

{ Windows resource header writer routines.  Used by ObjectTextToResource. }

function GetResourceName(ObjStream: TStream; var AName: string): Boolean;
procedure WriteObjectResourceHeader(ObjStream, Output: TStream);
procedure Write16bitResourceHeader(const AName: TBytes; DataSize: Integer; Output: TStream);
procedure Write32bitResourceHeader(const AName: TBytes; DataSize: Integer; Output: TStream);

{ Utility routines }

function LineStart(Buffer, BufPos: PAnsiChar): PAnsiChar; overload;
function LineStart(Buffer, BufPos: PWideChar): PWideChar; overload;
function LineStart(const Buffer: TBytes; BufPos: NativeInt): NativeInt; overload;

function ExtractStrings(Separators, WhiteSpace: TSysCharSet; Content: PChar;
  Strings: TStrings): Integer;

procedure BinToHex(Buffer: PAnsiChar; Text: PWideChar; BufSize: Integer); overload;
procedure BinToHex(Buffer: PAnsiChar; Text: PAnsiChar; BufSize: Integer); overload;
procedure BinToHex(var Buffer; Text: PWideChar; BufSize: Integer); overload; inline;
procedure BinToHex(var Buffer; Text: PAnsiChar; BufSize: Integer); overload; inline;
procedure BinToHex(Buffer: Pointer; Text: PWideChar; BufSize: Integer); overload; inline;
procedure BinToHex(Buffer: Pointer; Text: PAnsiChar; BufSize: Integer); overload; inline;

function HexToBin(Text: PWideChar; Buffer: PAnsiChar; BufSize: Integer): Integer; overload;
function HexToBin(Text: PAnsiChar; Buffer: PAnsiChar; BufSize: Integer): Integer; overload;
function HexToBin(Text: PWideChar; var Buffer; BufSize: Integer): Integer; overload; inline;
function HexToBin(Text: PAnsiChar; var Buffer; BufSize: Integer): Integer; overload; inline;
function HexToBin(Text: PWideChar; Buffer: Pointer; BufSize: Integer): Integer; overload; inline;
function HexToBin(Text: PAnsiChar; Buffer: Pointer; BufSize: Integer): Integer; overload; inline;

function FindRootDesigner(Obj: TPersistent): IDesignerNotify;

{ CountGenerations:  Use this helper function to calculate the distance
  between two related classes.  Returns -1 if Descendent is not a descendent of
  Ancestor. }

function CountGenerations(Ancestor, Descendent: TClass): Integer;

{  Call CheckSynchronize periodically within the main thread in order for
   background threads to synchronize execution with the main thread.  This
   is mainly for applications that have an event driven UI such as Windows
   or XWindows (Qt/CLX).  The best place this can be called is during Idle
   processing.  This guarantees that the main thread is in a known "good"
   state so that method calls can be safely made.  Returns True if a method
   was synchronized.  Returns False if there was nothing done.
}
function CheckSynchronize(Timeout: Integer = 0): Boolean;

{ Assign a method to WakeMainThread in order to properly force an event into
  the GUI thread's queue.  This will make sure that non-GUI threads can quickly
  synchronize with the GUI thread even if no events are being processed due to
  an idle state }
var
  WakeMainThread: TNotifyEvent = nil;
{$IF Defined(MSWINDOWS)}
{ SyncEvent is an Event handle that is signaled every time a thread wishes to
  synchronize with the main thread or is terminating.  This handle us suitable
  for use with WaitForMultipleObjects.  When this object is signaled,
  CheckSynchronize *must* be called in order to reset the event.  Do not call
  ResetEvent on this handle, or background threads may hang waiting for
  Synchronize to return.
}
  SyncEvent: THandle;
{$ELSEIF Defined(POSIX)}
{ SyncEvent is a set of file descriptors representing a pipe.  The ReadDes field
  is suitable for use within a select or poll call.  When this file descriptor
  is signaled, a background thread wishes to synchronize with the main thread
  or is terminating.  When the ReadDes file descriptor is signaled,
  CheckSynchronize *must* be called to reset the file descriptor.  Do *not*
  actually call __read (or any other "read" function) with this file descriptor
  as that may cause a background thread to hang waiting for Synchronize to return.
}
  SyncEvent: TPipeDescriptors;
{$IFEND}


type
{$IFDEF MSWINDOWS}
  TWndMethod = procedure(var Message: TMessage) of object;
{$ENDIF}

  TTextReader = class
  public
    procedure Close; virtual; abstract;
    function Peek: Integer; virtual; abstract;
    function Read: Integer; overload; virtual; abstract;
    function Read(const Buffer: TCharArray; Index, Count: Integer): Integer; overload; virtual; abstract;
    function ReadBlock(const Buffer: TCharArray; Index, Count: Integer): Integer; virtual; abstract;
    function ReadLine: string; virtual; abstract;
    function ReadToEnd: string; virtual; abstract;
  end;

  TTextWriter = class
  public
    procedure Close; virtual; abstract;
    procedure Flush; virtual; abstract;
    procedure Write(Value: Boolean); overload; virtual; abstract;
    procedure Write(Value: Char); overload; virtual; abstract;
    procedure Write(const Value: TCharArray); overload; virtual; abstract;
    procedure Write(Value: Double); overload; virtual; abstract;
    procedure Write(Value: Integer); overload; virtual; abstract;
    procedure Write(Value: Int64); overload; virtual; abstract;
    procedure Write(Value: TObject); overload; virtual; abstract;
    procedure Write(Value: Single); overload; virtual; abstract;
    procedure Write(const Value: string); overload; virtual; abstract;
    procedure Write(Value: Cardinal); overload; virtual; abstract;
    procedure Write(Value: UInt64); overload; virtual; abstract;
    procedure Write(const Format: string; Args: array of const); overload; virtual; abstract;
    procedure Write(const Value: TCharArray; Index, Count: Integer); overload; virtual; abstract;
    procedure WriteLine; overload; virtual; abstract;
    procedure WriteLine(Value: Boolean); overload; virtual; abstract;
    procedure WriteLine(Value: Char); overload; virtual; abstract;
    procedure WriteLine(const Value: TCharArray); overload; virtual; abstract;
    procedure WriteLine(Value: Double); overload; virtual; abstract;
    procedure WriteLine(Value: Integer); overload; virtual; abstract;
    procedure WriteLine(Value: Int64); overload; virtual; abstract;
    procedure WriteLine(Value: TObject); overload; virtual; abstract;
    procedure WriteLine(Value: Single); overload; virtual; abstract;
    procedure WriteLine(const Value: string); overload; virtual; abstract;
    procedure WriteLine(Value: Cardinal); overload; virtual; abstract;
    procedure WriteLine(Value: UInt64); overload; virtual; abstract;
    procedure WriteLine(const Format: string; Args: array of const); overload; virtual; abstract;
    procedure WriteLine(const Value: TCharArray; Index, Count: Integer); overload; virtual; abstract;
  end;

  TBinaryReader = class
  strict private
    FStream: TStream;
    FEncoding: TEncoding;
    FOwnsStream: Boolean;
    FTwoBytesPerChar: Boolean;
    FCharBytes: TBytes;
    FOneChar: TCharArray;
    FMaxCharsSize: Integer;
    function InternalReadChar: Integer;
    function InternalReadChars(const Chars: TCharArray; Index, Count: Integer): Integer;
  protected
    function GetBaseStream: TStream; virtual;
    function Read7BitEncodedInt: Integer; virtual;
  public
    constructor Create(Stream: TStream; AEncoding: TEncoding = nil); overload;
    constructor Create(Stream: TStream; AEncoding: TEncoding; AOwnsStream: Boolean = False); overload;
    constructor Create(const Filename: string; Encoding: TEncoding = nil); overload;
    destructor Destroy; override;
    procedure Close; virtual;
    function PeekChar: Integer; virtual;
    function Read: Integer; overload; virtual;
    function Read(const Buffer: TCharArray; Index, Count: Integer): Integer; overload; virtual;
    function Read(const Buffer: TBytes; Index, Count: Integer): Integer; overload; virtual;
    function ReadBoolean: Boolean; virtual;
    function ReadByte: Byte; virtual;
    function ReadBytes(Count: Integer): TBytes; virtual;
    function ReadChar: Char; virtual;
    function ReadChars(Count: Integer): TCharArray; virtual;
    function ReadDouble: Double; virtual;
    function ReadShortInt: ShortInt; virtual;
    function ReadInt16: ShortInt; inline;
    function ReadInteger: Integer; virtual;
    function ReadInt32: Integer; inline;
    function ReadInt64: Int64; virtual;
    function ReadSmallInt: SmallInt; virtual;
    function ReadSByte: SmallInt; inline;
    function ReadSingle: Single; virtual;
    function ReadString: string; virtual;
    function ReadWord: Word; virtual;
    function ReadUInt16: Word; inline;
    function ReadCardinal: Cardinal; virtual;
    function ReadUInt32: Cardinal; inline;
    function ReadUInt64: UInt64; virtual;
    property BaseStream: TStream read GetBaseStream;
  end;

  TBinaryWriter = class
  strict private
    FStream: TStream;
    FOwnsStream: Boolean;
    FEncoding: TEncoding;
    class var FNull: TBinaryWriter;
    class destructor Destroy;
    class function GetNull: TBinaryWriter; static;
  protected
    function GetBaseStream: TStream; virtual;
    procedure Write7BitEncodedInt(Value: Integer); virtual;
    constructor Create; overload;
  public
    constructor Create(Stream: TStream); overload;
    constructor Create(Stream: TStream; Encoding: TEncoding); overload;
    constructor Create(Stream: TStream; Encoding: TEncoding; AOwnsStream: Boolean); overload;
    constructor Create(const Filename: string; Append: Boolean = False); overload;
    constructor Create(const Filename: string; Append: Boolean; Encoding: TEncoding); overload;
    destructor Destroy; override;
    procedure Close; virtual;
    function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; virtual;
    procedure Write(Value: Byte); overload; virtual;
    procedure Write(Value: Boolean); overload; virtual;
    procedure Write(Value: Char); overload; virtual;
    procedure Write(const Value: TCharArray); overload; virtual;
    procedure Write(const Value: TBytes); overload; virtual;
    procedure Write(Value: Double); overload; virtual;
    procedure Write(Value: Integer); overload; virtual;
    procedure Write(Value: SmallInt); overload; virtual;
    procedure Write(Value: ShortInt); overload; virtual;
    procedure Write(Value: Word); overload; virtual;
    procedure Write(Value: Cardinal); overload; virtual;
    procedure Write(Value: Int64); overload; virtual;
    procedure Write(Value: Single); overload; virtual;
    procedure Write(const Value: string); overload; virtual;
    procedure Write(Value: UInt64); overload; virtual;
    procedure Write(const Value: TCharArray; Index, Count: Integer); overload; virtual;
    procedure Write(const Value: TBytes; Index, Count: Integer); overload; virtual;
    property BaseStream: TStream read GetBaseStream;
    class property Null: TBinaryWriter read GetNull;
  end;

  TStringReader = class(TTextReader)
  private
    FData: string;   //String Data being read
    FIndex: Integer; //Next character index to be read
  public
    constructor Create(S: string);
    procedure Close; override;
    function Peek: Integer; override;
    function Read: Integer; overload; override;
    function Read(const Buffer: TCharArray; Index, Count: Integer): Integer; overload; override;
    function ReadBlock(const Buffer: TCharArray; Index, Count: Integer): Integer; override;
    function ReadLine: string; override;
    function ReadToEnd: string; override;
  end;

  TStringWriter = class(TTextWriter)
  private
    FBuilder: TStringBuilder;
    FOwnsBuilder: Boolean;
  public
    constructor Create; overload;
    constructor Create(Builder: TStringBuilder); overload;
    destructor Destroy; override;
    procedure Close; override;
    procedure Flush; override;
    procedure Write(Value: Boolean); override;
    procedure Write(Value: Char); override;
    procedure Write(const Value: TCharArray); override;
    procedure Write(Value: Double); override;
    procedure Write(Value: Integer); override;
    procedure Write(Value: Int64); override;
    procedure Write(Value: TObject); override;
    procedure Write(Value: Single); override;
    procedure Write(const Value: string); override;
    procedure Write(Value: Cardinal); override;
    procedure Write(Value: UInt64); override;
    procedure Write(const Format: string; Args: array of const); override;
    procedure Write(const Value: TCharArray; Index, Count: Integer); override;
    procedure WriteLine; override;
    procedure WriteLine(Value: Boolean); override;
    procedure WriteLine(Value: Char); override;
    procedure WriteLine(const Value: TCharArray); override;
    procedure WriteLine(Value: Double); override;
    procedure WriteLine(Value: Integer); override;
    procedure WriteLine(Value: Int64); override;
    procedure WriteLine(Value: TObject); override;
    procedure WriteLine(Value: Single); override;
    procedure WriteLine(const Value: string); override;
    procedure WriteLine(Value: Cardinal); override;
    procedure WriteLine(Value: UInt64); override;
    procedure WriteLine(const Format: string; Args: array of const); override;
    procedure WriteLine(const Value: TCharArray; Index, Count: Integer); override;
    function ToString: string; override;
  end;

  TStreamWriter = class(TTextWriter)
  private
    FStream: TStream;
    FEncoding: TEncoding;
    FNewLine: string;
    FAutoFlush: Boolean;
    FOwnsStream: Boolean;
    FBufferIndex: Integer;
    FBuffer: TBytes;
    procedure WriteBytes(Bytes: TBytes);
  public
    constructor Create(Stream: TStream); overload;
    constructor Create(Stream: TStream; Encoding: TEncoding; BufferSize: Integer = 1024); overload;
    constructor Create(const Filename: string; Append: Boolean = False); overload;
    constructor Create(const Filename: string; Append: Boolean; Encoding: TEncoding; BufferSize: Integer = 1024); overload;
    destructor Destroy; override;
    procedure Close; override;
    procedure Flush; override;
    procedure OwnStream; inline;
    procedure Write(Value: Boolean); override;
    procedure Write(Value: Char); override;
    procedure Write(const Value: TCharArray); override;
    procedure Write(Value: Double); override;
    procedure Write(Value: Integer); override;
    procedure Write(Value: Int64); override;
    procedure Write(Value: TObject); override;
    procedure Write(Value: Single); override;
    procedure Write(const Value: string); override;
    procedure Write(Value: Cardinal); override;
    procedure Write(Value: UInt64); override;
    procedure Write(const Format: string; Args: array of const); override;
    procedure Write(const Value: TCharArray; Index, Count: Integer); override;
    procedure WriteLine; override;
    procedure WriteLine(Value: Boolean); override;
    procedure WriteLine(Value: Char); override;
    procedure WriteLine(const Value: TCharArray); override;
    procedure WriteLine(Value: Double); override;
    procedure WriteLine(Value: Integer); override;
    procedure WriteLine(Value: Int64); override;
    procedure WriteLine(Value: TObject); override;
    procedure WriteLine(Value: Single); override;
    procedure WriteLine(const Value: string); override;
    procedure WriteLine(Value: Cardinal); override;
    procedure WriteLine(Value: UInt64); override;
    procedure WriteLine(const Format: string; Args: array of const); override;
    procedure WriteLine(const Value: TCharArray; Index, Count: Integer); override;
    property AutoFlush: Boolean read FAutoFlush write FAutoFlush;
    property NewLine: string read FNewLine write FNewLine;
    property Encoding: TEncoding read FEncoding;
    property BaseStream: TStream read FStream;
  end;

  TStreamReader = class(TTextReader)
  private
    FBufferedData: TStringBuilder;
    FBufferSize: Integer;
    FDetectBOM: Boolean;
    FEncoding: TEncoding;
    FNoDataInStream: Boolean;
    FOwnsStream: Boolean;
    FSkipPreamble: Boolean;
    FStream: TStream;
    function DetectBOM(var Encoding: TEncoding; Buffer: TBytes): Integer;
    procedure FillBuffer(var Encoding: TEncoding);
    function GetEndOfStream: Boolean;
    function SkipPreamble(Encoding: TEncoding; Buffer: TBytes): Integer;
  public
    constructor Create(Stream: TStream); overload;
    constructor Create(Stream: TStream; DetectBOM: Boolean); overload;
    constructor Create(Stream: TStream; Encoding: TEncoding;
      DetectBOM: Boolean = False; BufferSize: Integer = 1024); overload;
    constructor Create(const Filename: string); overload;
    constructor Create(const Filename: string; DetectBOM: Boolean); overload;
    constructor Create(const Filename: string; Encoding: TEncoding;
      DetectBOM: Boolean = False; BufferSize: Integer = 1024); overload;
    destructor Destroy; override;
    procedure Close; override;
    procedure DiscardBufferedData;
    procedure OwnStream; inline;
    function Peek: Integer; override;
    function Read: Integer; overload; override;
    function Read(const Buffer: TCharArray; Index, Count: Integer): Integer; overload; override;
    function ReadBlock(const Buffer: TCharArray; Index, Count: Integer): Integer; override;
    function ReadLine: string; override;
    function ReadToEnd: string; override;
    property BaseStream: TStream read FStream;
    property CurrentEncoding: TEncoding read FEncoding;
    property EndOfStream: Boolean read GetEndOfStream;
  end;

  ELoginCredendialError = class(Exception);

  TLoginCredentialService = class sealed
  public const
    Default = '';
    DefaultUsrPw = 'DefaultUsrPw'; // do not localize
    DefaultUsrPwDm = 'DefaultUsrPwDm'; //do not localize
  public type
    TLoginFunc = reference to function (const Username, Password, Domain: string): Boolean;
    TLoginEvent = procedure (Sender: TObject; const Username, Password, Domain: string; var Handled: Boolean) of object;
    TLoginCredentialEvent = procedure (Sender: TObject; Callback: TLoginEvent; var Success: Boolean) of object;
  strict private type
    PLoginCredentialEventRec = ^TLoginCredentialEventRec;
    TLoginCredentialEventRec = record
      Handler: TLoginCredentialEvent;
    end;
    TLoginFuncProxy = class
    private
      FLoginFunc: TLoginFunc;
      procedure LoginEvent(Sender: TObject; const Username, Password, Domain: string; var Handled: Boolean);
    public
      constructor Create(const ALoginFunc: TLoginFunc);
    end;
  strict private class var
    FLoginHandlers: TStringList;
  strict private
    class constructor Create;
    class destructor Destroy;
    class function IndexOfHandler(const Context: TLoginCredentialEvent): Integer;
  public
    class procedure RegisterLoginHandler(const Context: string; const HandlerEvent: TLoginCredentialEvent); static;
    class procedure UnregisterLoginHandler(const Context: string; const HandlerEvent: TLoginCredentialEvent); static;

    class function GetLoginCredentialEvent(const Context: string): TLoginCredentialEvent; static;
    class function GetLoginCredentials(const Context: string; Sender: TObject; const Callback: TLoginEvent): Boolean; overload; static;
    class function GetLoginCredentials(const Context: string; const Callback: TLoginFunc): Boolean; overload; static;
    class function GetLoginCredentials(const Context: string; var Username, Password: string): Boolean; overload; static;
    class function GetLoginCredentials(const Context: string; var Username, Password, Domain: string): Boolean; overload; static;
  end;

{$IFDEF MSWINDOWS}

function MakeObjectInstance(AMethod: TWndMethod): Pointer;
procedure FreeObjectInstance(ObjectInstance: Pointer);

function AllocateHWnd(AMethod: TWndMethod): HWND;
procedure DeallocateHWnd(Wnd: HWND);

{$ENDIF}

function AncestorIsValid(Ancestor: TPersistent; Root,
  RootAncestor: TComponent): Boolean;
function IsDefaultPropertyValue(Instance: TObject; PropInfo: PPropInfo;
  OnGetLookupInfo: TGetLookupInfoEvent; Writer: TWriter = nil;
  OnFindMethodName: TFindMethodNameEvent = nil): Boolean;

implementation

uses
{$IFDEF MSWINDOWS}
  System.Types,
{$ENDIF}
{$IFDEF POSIX}
  Posix.String_, Posix.Sched, Posix.Pthread, Posix.Stdlib,
{$ENDIF}
{$IFDEF LINUX}
  KernelIoctl,
{$ENDIF}
{$IFDEF MACOS}
  Macapi.Mach,
{$ENDIF}
  System.Character, System.RTLConsts, System.SysConst;

// Interlocked APIs come from Winapi.Windows.pas for MSWINDOWS.
{$IFNDEF MSWINDOWS}
{$I ..\sys\InterlockedAPIs.inc}
{$ENDIF MSWINDOWS}

const
  FilerSignature: array[1..4] of AnsiChar = AnsiString('TPF0');

{$IFDEF MACOS}
type
  EThreadNameException = class(Exception);
{$ENDIF}

var
  IntConstList: TThreadList;

{ Point and rectangle constructors }

function Point(AX, AY: Integer): TPoint;
begin
  Result.X := AX;
  Result.Y := AY;
end;

function SmallPoint(AX, AY: SmallInt): TSmallPoint;
begin
  with Result do
  begin
    X := AX;
    Y := AY;
  end;
end;

function PointsEqual(const P1, P2: TPoint): Boolean;
begin
  Result := (P1.X = P2.X) and (P1.Y = P2.Y);
end;

function PointsEqual(const P1, P2: TSmallPoint): Boolean;
begin
  Result := (P1.X = P2.X) and (P1.Y = P2.Y);
end;

function Rect(ALeft, ATop, ARight, ABottom: Integer): TRect;
begin
  Result.Left := ALeft;
  Result.Top := ATop;
  Result.Right := ARight;
  Result.Bottom := ABottom;
end;

function Rect(const ATopLeft, ABottomRight: TPoint): TRect;
begin
  Result.Left := ATopLeft.X;
  Result.Top := ATopLeft.Y;
  Result.Right := ABottomRight.X;
  Result.Bottom := ABottomRight.Y;
end;

function Bounds(ALeft, ATop, AWidth, AHeight: Integer): TRect;
begin
  Result := System.Types.Bounds(ALeft, ATop, AWidth, AHeight);
end;

function InvalidPoint(X, Y: Integer): Boolean;
begin
  Result := (X = -1) and (Y = -1);
end;

function InvalidPoint(const At: TPoint): Boolean;
begin
  Result := (At.X = -1) and (At.Y = -1);
end;

function InvalidPoint(const At: TSmallPoint): Boolean;
begin
  Result := (At.X = -1) and (At.Y = -1);
end;

function NextChar(P: PChar): PChar;
begin
  Result := P;
  if (Result <> nil) and (Result^ <> #0) then
  begin
    Inc(Result);
    if TCharacter.IsLowSurrogate(Result^) then
      Inc(Result);
    while TCharacter.GetUnicodeCategory(Result^) = TUnicodeCategory.ucNonSpacingMark do
      Inc(Result);
  end;
end;

{ Class registration groups }

type
  TRegGroup = class
  private
    FClassList: TStringList;
    FAliasList: TStringList;
    FGroupClasses: TList;
    FActive: Boolean;
    function BestClass(AClass: TPersistentClass): TPersistentClass;
    function IndexOfClass(AClass: TPersistentClass): Integer;
  public
    constructor Create(AClass: TPersistentClass);
    destructor Destroy; override;
    class function BestGroup(Group1, Group2: TRegGroup; AClass: TPersistentClass): TRegGroup;
    procedure AddClass(AClass: TPersistentClass);
    function GetClass(const AClassName: string): TPersistentClass;
    procedure GetClasses(Proc: TGetClass);
    function InGroup(AClass: TPersistentClass): Boolean;
    procedure RegisterClass(AClass: TPersistentClass);
    procedure RegisterClassAlias(AClass: TPersistentClass; const Alias: string);
    function Registered(AClass: TPersistentClass): Boolean;
    procedure UnregisterClass(AClass: TPersistentClass);
    procedure UnregisterModuleClasses(Module: HMODULE);
    property Active: Boolean read FActive write FActive;
  end;

  TRegGroups = class
  private
    FGroups: TList;
    FActiveClass: TPersistentClass;
    function FindGroup(AClass: TPersistentClass): TRegGroup;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Activate(AClass: TPersistentClass);
    procedure AddClass(ID: Integer; AClass: TPersistentClass);
    function GetClass(const AClassName: string): TPersistentClass;
    function GroupedWith(AClass: TPersistentClass): TPersistentClass;
    procedure GroupWith(AClass, AGroupClass: TPersistentClass);
    procedure Lock; inline;
    procedure RegisterClass(AClass: TPersistentClass);
    procedure RegisterClassAlias(AClass: TPersistentClass; const Alias: string);
    function Registered(AClass: TPersistentClass): Boolean;
    procedure StartGroup(AClass: TPersistentClass);
    procedure Unlock; inline;
    procedure UnregisterClass(AClass: TPersistentClass);
    procedure UnregisterModuleClasses(Module: HMODULE);
    property ActiveClass: TPersistentClass read FActiveClass;
  end;

var
  RegGroups: TRegGroups;

{ TRegGroup }

procedure TRegGroup.AddClass(AClass: TPersistentClass);
begin
  FGroupClasses.Add(AClass);
end;

function TRegGroup.BestClass(AClass: TPersistentClass): TPersistentClass;
var
  I: Integer;
  Current: TPersistentClass;
begin
  Result := nil;
  for I := 0 to FGroupClasses.Count - 1 do
  begin
    Current := FGroupClasses[I];
    if AClass.InheritsFrom(Current) then
      if (Result = nil) or Current.InheritsFrom(Result) then
        Result := Current;
  end;
end;

class function TRegGroup.BestGroup(Group1, Group2: TRegGroup;
  AClass: TPersistentClass): TRegGroup;
var
  Group1Class: TPersistentClass;
  Group2Class: TPersistentClass;
begin
  if Group1 <> nil then
    Group1Class := Group1.BestClass(AClass) else
    Group1Class := nil;
  if Group2 <> nil then
    Group2Class := Group2.BestClass(AClass) else
    Group2Class := nil;
  if Group1Class = nil then
    if Group2Class = nil then
      // AClass is not in either group, no best group
      Result := nil
    else
      // AClass is in Group2 but not Group1, Group2 is best
      Result := Group2
  else
    if Group2Class = nil then
      // AClass is in Group1 but not Group2, Group1 is best
      Result := Group1
    else
      // AClass is in both groups, select the group with the closest ancestor
      if Group1Class.InheritsFrom(Group2Class) then
        Result := Group1
      else
        Result := Group2;
end;

constructor TRegGroup.Create(AClass: TPersistentClass);
begin
  inherited Create;
  FGroupClasses := TList.Create;
  FGroupClasses.Add(AClass);
end;

destructor TRegGroup.Destroy;
begin
  inherited Destroy;
  FClassList.Free;
  FAliasList.Free;
  FGroupClasses.Free;
end;

function TRegGroup.GetClass(const AClassName: string): TPersistentClass;
var
  I: Integer;
begin
  if FClassList <> nil then
    begin
    I := FClassList.IndexOf(AClassName);
    if I >= 0 then
    begin
      Result := TPersistentClass(FClassList.Objects[I]);
      Exit;
    end;
    end;
  if FAliasList <> nil then
  begin
    I := FAliasList.IndexOf(AClassName);
    if I >= 0 then
    begin
      Result := TPersistentClass(FAliasList.Objects[I]);
      Exit;
    end;
  end;
  Result := nil;
end;

procedure TRegGroup.GetClasses(Proc: TGetClass);
var
  I: Integer;
begin
  if FClassList <> nil then
    for I := 0 to FClassList.Count - 1 do
      Proc(TPersistentClass(FClassList.Objects[I]));
end;

function TRegGroup.IndexOfClass(AClass: TPersistentClass): Integer;
begin
  if FClassList <> nil then
  begin
    Result := FClassList.IndexOf(AClass.ClassName);
    if (Result >= 0) and (TPersistentClass(FClassList.Objects[Result]) <> AClass) then
      Result := -1;
  end
  else
    Result := -1;
end;

function TRegGroup.InGroup(AClass: TPersistentClass): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 0 to FGroupClasses.Count - 1 do
    if AClass.InheritsFrom(TPersistentClass(FGroupClasses[I])) then Exit;
  Result := False;
end;

procedure TRegGroup.RegisterClass(AClass: TPersistentClass);
var
  LClassName: string;
  LClass: TPersistentClass;
begin
  LClassName := AClass.ClassName;
  LClass := GetClass(LClassName);
  if (LClass <> nil) and (LClass <> AClass) then
    raise EFilerError.CreateResFmt(@SDuplicateClass, [LClassName]);
  if FClassList = nil then
  begin
    FClassList := TStringList.Create;
    FClassList.Sorted := True;
  end;
  FClassList.AddObject(LClassName, TObject(AClass));
end;

procedure TRegGroup.RegisterClassAlias(AClass: TPersistentClass;
  const Alias: string);
begin
  RegisterClass(AClass);
  if FAliasList = nil then
    FAliasList := TStringList.Create;
  FAliasList.AddObject(Alias, TObject(AClass));
end;

function TRegGroup.Registered(AClass: TPersistentClass): Boolean;
begin
  Result := IndexOfClass(AClass) >= 0;
end;

procedure TRegGroup.UnregisterClass(AClass: TPersistentClass);
var
  Index, I: Integer;
begin
  if FClassList <> nil then
  begin
    Index := IndexOfClass(AClass);
    if Index <> -1 then
      FClassList.Delete(Index);
  end;
  if FAliasList <> nil then
    for I := FAliasList.Count - 1 downto 0 do
      if FAliasList.Objects[I] = TObject(AClass) then
        FAliasList.Delete(I);
end;

{$IFDEF MSWINDOWS}
function PointerInModule(Ptr: Pointer; ModuleStartAddr, ModuleStopAddr: Pointer): Boolean; inline;
begin
  Result := (UIntPtr(Ptr) >= UIntPtr(ModuleStartAddr)) and (UIntPtr(Ptr) < UIntPtr(ModuleStopAddr));
end;
{$ENDIF MSWINDOWS}
{$IFDEF POSIX}
function PointerInModule(Ptr: Pointer; Module: HMODULE): Boolean;
begin
  Result := (Module = 0) or (FindHInstance(Ptr) = Module);
end;
{$ENDIF POSIX}

procedure TRegGroup.UnregisterModuleClasses(Module: HMODULE);
var
  I: Integer;
  {$IFDEF MSWINDOWS}
  Deleted: Boolean;
  ModuleStartAddr, ModuleStopAddr: Pointer;
  MemInfo: TMemoryBasicInformation;
  CurProcess: THandle;
  {$ENDIF MSWINDOWS}
begin
  // Even though the group criterion changes we do not need to recalculate the
  // groups because the groups are based on ancestry. If an ancestor of a class
  // is removed because its module was unloaded we can safely assume that all
  // descendents have also been unloaded or are being unloaded as well. This
  // means that any classes left in the registry are not descendents of the
  // classes being removed and, therefore, will not be affected by the change
  // to the FGroupClasses list.

  if Module <> 0 then
  begin
    {$IFDEF MSWINDOWS}
    { Find all allocated memory pages for the module. This is faster than
      calling VirtualQuery for every class in the list. }
    ModuleStartAddr := Pointer(Module);
    ModuleStopAddr := ModuleStartAddr;
    CurProcess := GetCurrentProcess;
    while (VirtualQueryEx(CurProcess, ModuleStopAddr, MemInfo, SizeOf(MemInfo)) = SizeOf(MemInfo)) and
          (MemInfo.AllocationBase = ModuleStartAddr) do
        ModuleStopAddr := Pointer(Cardinal(ModuleStopAddr) + MemInfo.RegionSize);

    { FGroupClasses }
    Deleted := False;
    for I := FGroupClasses.Count - 1 downto 0 do
    begin
      if PointerInModule(FGroupClasses[I], ModuleStartAddr, ModuleStopAddr) then
      begin
        FGroupClasses[I] := nil;
        Deleted := True;
      end;
    end;
    if Deleted then
      FGroupClasses.Pack;

    if FClassList <> nil then
      for I := FClassList.Count - 1 downto 0 do
        if PointerInModule(FClassList.Objects[I], ModuleStartAddr, ModuleStopAddr) then
          FClassList.Delete(I);
    if FAliasList <> nil then
      for I := FAliasList.Count - 1 downto 0 do
        if PointerInModule(FAliasList.Objects[I], ModuleStartAddr, ModuleStopAddr) then
          FAliasList.Delete(I);
    {$ENDIF MSWINDOWS}
                                                                                                                
    {$IFDEF POSIX}
    for I := FGroupClasses.Count - 1 downto 0 do
      if PointerInModule(FGroupClasses[I], Module) then
        FGroupClasses.Delete(I);
    if FClassList <> nil then
      for I := FClassList.Count - 1 downto 0 do
        if PointerInModule(FClassList.Objects[I], Module) then
          FClassList.Delete(I);
    if FAliasList <> nil then
      for I := FAliasList.Count - 1 downto 0 do
        if PointerInModule(FAliasList.Objects[I], Module) then
          FAliasList.Delete(I);
    {$ENDIF POSIX}
  end
  else
  begin
    FGroupClasses.Clear;
    if FClassList <> nil then
      FClassList.Clear;
    if FAliasList <> nil then
      FAliasList.Clear;
  end;
end;

{ TRegGroups }

procedure TRegGroups.Activate(AClass: TPersistentClass);
var
  I: Integer;
begin
  if FActiveClass <> AClass then
  begin
    FActiveClass := AClass;
    for I := 0 to FGroups.Count - 1 do
      with TRegGroup(FGroups[I]) do
        Active := InGroup(AClass);
  end;
end;

procedure TRegGroups.AddClass(ID: Integer; AClass: TPersistentClass);
begin
  TRegGroup(FGroups[ID]).AddClass(AClass);
end;

constructor TRegGroups.Create;
var
  Group: TRegGroup;
begin
  inherited Create;
  FGroups := TList.Create;
  // Initialize default group
  Group := TRegGroup.Create(TPersistent);
  FGroups.Add(Group);
  Group.Active := True;
end;

destructor TRegGroups.Destroy;
var
  I: Integer;
begin
  if Assigned(FGroups) then
    for I := 0 to FGroups.Count - 1 do
      TRegGroup(FGroups[I]).Free;
  FGroups.Free;
  inherited;
end;

function TRegGroups.FindGroup(AClass: TPersistentClass): TRegGroup;
var
  I: Integer;
  Current: TRegGroup;
begin
  Result := nil;
  for I := 0 to FGroups.Count - 1 do
  begin
    Current := FGroups[I];
    Result := TRegGroup.BestGroup(Current, Result, AClass);
  end;
end;

function TRegGroups.GetClass(const AClassName: string): TPersistentClass;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to FGroups.Count - 1 do
    with TRegGroup(FGroups[I]) do
    begin
      if Active then Result := GetClass(AClassName);
      if Result <> nil then Exit;
    end;
end;

function TRegGroups.GroupedWith(AClass: TPersistentClass): TPersistentClass;
var
  Group: TRegGroup;
begin
  Result := nil;
  Group := FindGroup(AClass);
  if Group <> nil then
    Result := TPersistentClass(Group.FGroupClasses[0]);
end;

procedure TRegGroups.GroupWith(AClass, AGroupClass: TPersistentClass);

  procedure Error;
  begin
    raise EFilerError.CreateFmt(SUnknownGroup, [AGroupClass.ClassName]);
  end;

var
  Group: TRegGroup;
  CurrentGroup: TRegGroup;
  CurrentClass: TPersistentClass;
  I, J: Integer;
begin
  Group := FindGroup(AGroupClass);
  if Group = nil then Error;
  Group.AddClass(AClass);

  // The group criterion has changed. We need to recalculate which groups the
  // classes that have already been registered belong to. We can skip
  // Group since we would just be moving a class to a group it already belongs
  // to. We also only need to find the new group of classes that descend from
  // AClass since that is the only criterion being changed. In other words,
  // we only need to move classes that descend from AClass to Group if they
  // are in another group.
  for I := 0 to FGroups.Count - 1 do
  begin
    CurrentGroup := FGroups[I];
    if CurrentGroup <> Group then
    begin
      if CurrentGroup.FClassList <> nil then
      begin
        for J := CurrentGroup.FClassList.Count - 1 downto 0 do
        begin
          CurrentClass := TPersistentClass(CurrentGroup.FClassList.Objects[J]);
          if CurrentClass.InheritsFrom(AClass) then
            // Check CurrentClass should be put into Group based on the new
            // criterion. Their might be a descendent of AClass registered that
            // overrides Group's criterion.
            if FindGroup(CurrentClass) = Group then
            begin
              CurrentGroup.FClassList.Delete(J);
              Group.RegisterClass(CurrentClass);
            end;
          end;
        end;
      end;
  end;
end;

procedure TRegGroups.Lock;
begin
  MonitorEnter(Self);
end;

procedure TRegGroups.RegisterClass(AClass: TPersistentClass);
var
  Group: TRegGroup;
begin
  Group := FindGroup(AClass);
  if Group <> nil then Group.RegisterClass(AClass);
end;

procedure TRegGroups.RegisterClassAlias(AClass: TPersistentClass;
  const Alias: string);
var
  Group: TRegGroup;
begin
  Group := FindGroup(AClass);
  if Group <> nil then Group.RegisterClassAlias(AClass, Alias);
end;

function TRegGroups.Registered(AClass: TPersistentClass): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 0 to FGroups.Count - 1 do
    if TRegGroup(FGroups[I]).Registered(AClass) then Exit;
  Result := False;
end;

procedure TRegGroups.StartGroup(AClass: TPersistentClass);
var
  I: Integer;
begin
  // Do not start a group that already exists
  for I := 0 to FGroups.Count - 1 do
    if TRegGroup(FGroups[I]).FGroupClasses.IndexOf(AClass) >= 0 then
      Exit;
  // Create the group
  FGroups.Add(TRegGroup.Create(AClass));
end;

procedure TRegGroups.Unlock;
begin
  MonitorExit(Self);
end;

procedure TRegGroups.UnregisterClass(AClass: TPersistentClass);
var
  I: Integer;
begin
  for I := 0 to FGroups.Count - 1 do
    TRegGroup(FGroups[I]).UnregisterClass(AClass);
end;

procedure TRegGroups.UnregisterModuleClasses(Module: HMODULE);
var
  I: Integer;
  Group: TRegGroup;
begin
  for I := FGroups.Count - 1 downto 0 do
  begin
    Group := TRegGroup(FGroups[I]);
    Group.UnregisterModuleClasses(Module);
    if Group.FGroupClasses.Count = 0 then
    begin
      Group.Free;
      FGroups.Delete(I);
    end;
  end;
end;

{ TClassFinder }

constructor TClassFinder.Create(AClass: TPersistentClass;
  AIncludeActiveGroups: Boolean);
var
  I: Integer;
  Group: TRegGroup;
begin
  inherited Create;
  FGroups := TList.Create;
  RegGroups.Lock;
  try
    if AClass = nil then AClass := RegGroups.ActiveClass;
    for I := 0 to RegGroups.FGroups.Count - 1 do
    begin
      Group := RegGroups.FGroups[I];
      if Group.InGroup(AClass) then
        FGroups.Add(Group);
    end;
    if AIncludeActiveGroups then
      for I := 0 to RegGroups.FGroups.Count - 1 do
      begin
        Group := RegGroups.FGroups[I];
        if Group.Active then
          FGroups.Add(Group);
      end;
    FClass := AClass;
  finally
    RegGroups.Unlock;
  end;
end;

destructor TClassFinder.Destroy;
begin
  FGroups.Free;
  inherited;
end;

function TClassFinder.GetClass(const AClassName: string): TPersistentClass;
var
  I: Integer;
begin
  Result := nil;
  RegGroups.Lock;
  try
    for I := 0 to FGroups.Count - 1 do
      with TRegGroup(FGroups[I]) do
      begin
        Result := GetClass(AClassName);
        if Result <> nil then Exit;
      end;
  finally
    RegGroups.Unlock;
  end;
end;

procedure TClassFinder.GetClasses(Proc: TGetClass);
var
  I: Integer;
begin
  RegGroups.Lock;
  try
    for I := 0 to FGroups.Count - 1 do
      TRegGroup(FGroups[I]).GetClasses(Proc);
  finally
    RegGroups.Unlock;
  end;
end;

{ Class registration routines }

type
  PFieldClassTable = ^TFieldClassTable;
  TFieldClassTable = packed record
    Count: Smallint;
    Classes: array[0..8191] of ^TPersistentClass;
  end;

                                                                                                       
function GetFieldClassTable(AClass: TClass): PFieldClassTable;
{$IFDEF PUREPASCAL}
var
  LFieldTablePtr: IntPtr;
begin
  LFieldTablePtr := IntPtr(PPointer(PByte(AClass) + vmtFieldTable)^);
  if LFieldTablePtr <> 0 then
    Result := PPointer(LFieldTablePtr + 2)^
  else
    Result := nil;
end;
{$ELSE !PUREPASCAL}
{$IFDEF X86ASM}
asm
        MOV     EAX,[EAX].vmtFieldTable
        OR      EAX,EAX
        JE      @@1
        MOV     EAX,[EAX+2].Integer
@@1:
end;
{$ENDIF X86ASM}
{$ENDIF !PUREPASCAL}

procedure ClassNotFound(const ClassName: string);
begin
  raise EClassNotFound.CreateFmt(SClassNotFound, [ClassName]);
end;

function GetClass(const AClassName: string): TPersistentClass;
begin
  RegGroups.Lock;
  try
    Result := RegGroups.GetClass(AClassName);
  finally
    RegGroups.Unlock;
  end;
end;

function FindClass(const ClassName: string): TPersistentClass;
begin
  Result := GetClass(ClassName);
  if Result = nil then ClassNotFound(ClassName);
end;

procedure RegisterClass(AClass: TPersistentClass);
begin
  RegGroups.Lock;
  try
    while not RegGroups.Registered(AClass) do
    begin
      RegGroups.RegisterClass(AClass);
      if AClass = TPersistent then Break;
      AClass := TPersistentClass(AClass.ClassParent);
    end;
  finally
    RegGroups.Unlock;
  end;
end;

procedure RegisterClasses(AClasses: array of TPersistentClass);
var
  I: Integer;
begin
  for I := Low(AClasses) to High(AClasses) do RegisterClass(AClasses[I]);
end;

procedure RegisterClassAlias(AClass: TPersistentClass; const Alias: string);
begin
  RegGroups.Lock;
  try
    RegGroups.RegisterClassAlias(AClass, Alias);
  finally
    RegGroups.Unlock;
  end;
end;

procedure UnRegisterClass(AClass: TPersistentClass);
begin
  RegGroups.Lock;
  try
    RegGroups.UnregisterClass(AClass);
  finally
    RegGroups.Unlock;
  end;
end;

procedure UnRegisterClasses(AClasses: array of TPersistentClass);
var
  I: Integer;
begin
  for I := Low(AClasses) to High(AClasses) do UnRegisterClass(AClasses[I]);
end;

procedure UnRegisterModuleClasses(Module: HMODULE);
begin
  RegGroups.Lock;
  try
    RegGroups.UnregisterModuleClasses(Module);
  finally
    RegGroups.Unlock;
  end;
end;

procedure StartClassGroup(AClass: TPersistentClass);
begin
  RegGroups.Lock;
  try
    RegGroups.StartGroup(AClass);
  finally
    RegGroups.Unlock;
  end;
end;

procedure GroupDescendentsWith(AClass, AClassGroup: TPersistentClass);
begin
  RegGroups.Lock;
  try
    RegGroups.GroupWith(AClass, AClassGroup);
  finally
    RegGroups.Unlock;
  end;
end;

function ActivateClassGroup(AClass: TPersistentClass): TPersistentClass;
begin
  RegGroups.Lock;
  try
    Result := RegGroups.ActiveClass;
    RegGroups.Activate(AClass);
  finally
    RegGroups.Unlock;
  end;
end;

function ActiveClassGroup: TPersistentClass;
begin
  RegGroups.Lock;
  try
    Result := RegGroups.ActiveClass;
  finally
    RegGroups.Unlock;
  end;
end;

function ClassGroupOf(AClass: TPersistentClass): TPersistentClass;
begin
  RegGroups.Lock;
  try
    Result := RegGroups.GroupedWith(AClass);
  finally
    RegGroups.Unlock;
  end;
end;

function ClassGroupOf(Instance: TPersistent): TPersistentClass;
begin
  RegGroups.Lock;
  try
    Result := nil;
    while Instance <> nil do
    begin
      Result := RegGroups.GroupedWith(TPersistentClass(Instance.ClassType));
      if Result <> nil then
        Exit
      else
        Instance := Instance.GetOwner;
    end;
  finally
    RegGroups.Unlock;
  end;
end;

procedure ReportClassGroups(Report: TStrings);
var
  I, J: Integer;
  Group: TRegGroup;
  ClassGroupHeader, GroupClassesHeader, ClassListHeader, ClassAliasesHeader: string;
begin
  Report.BeginUpdate;
  try
    Report.Clear;
    ClassGroupHeader := sClassGroupHeader;
    GroupClassesHeader := sGroupClassesHeader;
    ClassListHeader := sClassListHeader;
    ClassAliasesHeader := sClassAliasesHeader;
    for I := 0 to RegGroups.FGroups.Count - 1 do
    begin
      Group := TRegGroup(RegGroups.FGroups[I]);
      Report.Add(Format(ClassGroupHeader, [I, BoolToStr(Group.Active, True)]));
      Report.Add(GroupClassesHeader);
      for J := 0 to Group.FGroupClasses.Count - 1 do
        Report.Add(Format('    %s', [TPersistentClass(Group.FGroupClasses[J]).QualifiedClassName])); // do not localize
      Report.Add(ClassListHeader);
      for J := 0 to Group.FClassList.Count - 1 do
        Report.Add(Format('    %s = %s', [Group.FClassList[J], TPersistentClass(Group.FClassList.Objects[J]).QualifiedClassName])); // do not localilze
      if (Group.FAliasList <> nil) and (Group.FAliasList.Count > 0) then
      begin
        Report.Add(ClassAliasesHeader);
        for J := 0 to Group.FAliasList.Count - 1 do
          Report.Add(Format('    %s = %s', [Group.FAliasList[J], TPersistentClass(Group.FAliasList.Objects[J]).QualifiedClassName])); // do not localize
      end;
    end;
  finally
    Report.EndUpdate;
  end;
end;

{ Component registration routines }

procedure RegisterComponents(const Page: string;
  ComponentClasses: array of TComponentClass);
//  const ComponentClasses: array of TComponentClass);
begin
  if Assigned(RegisterComponentsProc) then
    RegisterComponentsProc(Page, ComponentClasses)
  else
    raise EComponentError.CreateRes(@SRegisterError);
end;

procedure RegisterNoIcon(const ComponentClasses: array of TComponentClass);
begin
  if Assigned(RegisterNoIconProc) then
    RegisterNoIconProc(ComponentClasses)
  else
    raise EComponentError.CreateRes(@SRegisterError);
end;

{$IFDEF MSWINDOWS}
procedure RegisterNonActiveX(const ComponentClasses: array of TComponentClass;
  AxRegType: TActiveXRegType);
begin
  if not Assigned(RegisterNonActiveXProc) then
    raise EComponentError.CreateRes(@SRegisterError);
  RegisterNonActiveXProc(ComponentClasses, AxRegType)
end;
{$ENDIF}

{ Component filing }

type
  TIntConst = class
    IntegerType: PTypeInfo;
    IdentToInt: TIdentToInt;
    IntToIdent: TIntToIdent;
    constructor Create(AIntegerType: PTypeInfo; AIdentToInt: TIdentToInt;
      AIntToIdent: TIntToIdent);
  end;

constructor TIntConst.Create(AIntegerType: PTypeInfo; AIdentToInt: TIdentToInt;
  AIntToIdent: TIntToIdent);
begin
  IntegerType := AIntegerType;
  IdentToInt := AIdentToInt;
  IntToIdent := AIntToIdent;
end;

procedure RegisterIntegerConsts(AIntegerType: Pointer; AIdentToInt: TIdentToInt;
  AIntToIdent: TIntToIdent);
begin
  IntConstList.Add(TIntConst.Create(AIntegerType, AIdentToInt, AIntToIdent));
end;

procedure UnregisterIntegerConsts(AIntegerType: Pointer; AIdentToInt: TIdentToInt;
  AIntToIdent: TIntToIdent);
var
  I: Integer;
begin
  with IntConstList.LockList do
  try
    for I := Count-1 downto 0 do
      with TIntConst(Items[I]) do
        if (IntegerType = AIntegerType) and
           (@IntToIdent = @AIntToIdent) and
           (@IdentToInt = @AIdentToInt) then
        begin
          TIntConst(Items[I]).Free;
          Delete(I);
        end;
  finally
    IntConstList.UnlockList;
  end;
end;

function FindIntToIdent(AIntegerType: Pointer): TIntToIdent;
var
  I: Integer;
begin
  Result := nil;
  with IntConstList.LockList do
  try
    for I := Count - 1 downto 0 do
      with TIntConst(Items[I]) do
        if AIntegerType = IntegerType then
        begin
          Result := @IntToIdent;
          Exit;
        end;
  finally
    IntConstList.UnlockList;
  end;
end;

function FindIdentToInt(AIntegerType: Pointer): TIdentToInt;
var
  I: Integer;
begin
  Result := nil;
  with IntConstList.LockList do
  try
    for I := Count - 1 downto 0 do
      with TIntConst(Items[I]) do
        if AIntegerType = IntegerType then
        begin
          Result := @IdentToInt;
          Exit;
        end;
  finally
    IntConstList.UnlockList;
  end;
end;

function IdentToInt(const Ident: string; var Int: Longint; const Map: array of TIdentMapEntry): Boolean;
var
  I: Integer;
begin
  for I := Low(Map) to High(Map) do
    if SameText(Map[I].Name, Ident) then
    begin
      Result := True;
      Int := Map[I].Value;
      Exit;
    end;
  Result := False;
end;

function IntToIdent(Int: Longint; var Ident: string; const Map: array of TIdentMapEntry): Boolean;
var
  I: Integer;
begin
  for I := Low(Map) to High(Map) do
    if Map[I].Value = Int then
    begin
      Result := True;
      Ident := Map[I].Name;
      Exit;
    end;
  Result := False;
end;

var
  FindGlobalComponentProcs: TList;

procedure RegisterFindGlobalComponentProc(AFindGlobalComponent: TFindGlobalComponent);
begin
  if FindGlobalComponentProcs = nil then
    FindGlobalComponentProcs := TList.Create;
  if FindGlobalComponentProcs.IndexOf(@AFindGlobalComponent) < 0 then
    FindGlobalComponentProcs.Add(@AFindGlobalComponent);
end;

procedure UnregisterFindGlobalComponentProc(AFindGlobalComponent: TFindGlobalComponent);
begin
  if FindGlobalComponentProcs <> nil then
    FindGlobalComponentProcs.Remove(@AFindGlobalComponent);
end;

function FindGlobalComponent(const Name: string): TComponent;
var
  I: Integer;
begin
  Result := nil;
  if FindGlobalComponentProcs <> nil then
  begin
    for I := FindGlobalComponentProcs.Count - 1 downto 0 do
    begin
      Result := TFindGlobalComponent(FindGlobalComponentProcs[I])(Name);
      if Result <> nil then Exit;
    end;
  end;
end;

function IsUniqueGlobalComponentName(const Name: string): Boolean;
begin
  if Assigned(IsUniqueGlobalComponentNameProc) then
    Result := IsUniqueGlobalComponentNameProc(Name)
  else Result := FindGlobalComponent(Name) = nil;
end;

                                                                                                                                                                      
function InternalReadComponentRes(const ResName: string; HInst: THandle; var Instance: TComponent): Boolean; overload;
var
  HRsrc: THandle;
begin                   { avoid possible EResNotFound exception }
  if HInst = 0 then HInst := HInstance;
  HRsrc := FindResource(HInst, PChar(ResName), PChar(RT_RCDATA));
  Result := HRsrc <> 0;
  if not Result then Exit;
  with TResourceStream.Create(HInst, ResName, RT_RCDATA) do
  try
    Instance := ReadComponent(Instance);
  finally
    Free;
  end;
  Result := True;
end;

threadvar
  GlobalLoaded: TList;
  GlobalLists: TList;

procedure BeginGlobalLoading;
var
  G: TList;
begin
  G := GlobalLists;
  if G = nil then
  begin
    G := TList.Create;
    GlobalLists := G;
  end;
  G.Add(GlobalLoaded);
  GlobalLoaded := TList.Create;
end;

procedure NotifyGlobalLoading;
var
  I: Integer;
  G: TList;
begin
  G := GlobalLoaded;  // performance:  eliminate repeated trips through TLS lookup
  for I := 0 to G.Count - 1 do
    TComponent(G[I]).Loaded;
end;

procedure EndGlobalLoading;
var
  G: TList;
begin
  GlobalLoaded.Free;
  G := GlobalLists;
  GlobalLoaded := G.Last;
  G.Delete(G.Count - 1);
  if G.Count = 0 then
  begin
    GlobalLists := nil;
    G.Free;
  end;
end;

function InitInheritedComponent(Instance: TComponent; RootAncestor: TClass): Boolean;

  function InitComponent(ClassType: TClass): Boolean;
  begin
    Result := False;
    if (ClassType = TComponent) or (ClassType = RootAncestor) then Exit;
    Result := InitComponent(ClassType.ClassParent);
    Result := InternalReadComponentRes(ClassType.ClassName,
      FindResourceHInstance(FindClassHInstance(ClassType)), Instance) or Result;
  end;

var
  LocalizeLoading: Boolean;
begin
  GlobalNameSpace.BeginWrite;  // hold lock across all ancestor loads (performance)
  try
    LocalizeLoading := (Instance.ComponentState * [csInline, csLoading]) = [];
    if LocalizeLoading then BeginGlobalLoading;  // push new loadlist onto stack
    try
      Result := InitComponent(Instance.ClassType);
      if LocalizeLoading then NotifyGlobalLoading;  // call Loaded
    finally
      if LocalizeLoading then EndGlobalLoading;  // pop loadlist off stack
    end;
  finally
    GlobalNameSpace.EndWrite;
  end;
end;

function InitComponentRes(const ResName: string; Instance: TComponent): Boolean;
begin
  Result := InternalReadComponentRes(ResName, FindResourceHInstance(
    FindClassHInstance(Instance.ClassType)), Instance);
end;

function ReadComponentRes(const ResName: string; Instance: TComponent): TComponent;
var
  HInstance: THandle;
begin
  if Instance <> nil then
    HInstance := FindResourceHInstance(FindClassHInstance(Instance.ClassType))
  else HInstance := 0;
  if InternalReadComponentRes(ResName, HInstance, Instance) then
    Result := Instance else
    raise EResNotFound.CreateFmt(SResNotFound, [ResName]);
end;

function ReadComponentResEx(HInstance: THandle; const ResName: string): TComponent;
var
  Instance: TComponent;
begin
  Instance := nil;
  if InternalReadComponentRes(ResName, HInstance, Instance) then
    Result := Instance else
    raise EResNotFound.CreateFmt(SResNotFound, [ResName]);
end;

function ReadComponentResFile(const FileName: string; Instance: TComponent): TComponent;
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    Result := Stream.ReadComponentRes(Instance);
  finally
    Stream.Free;
  end;
end;

procedure WriteComponentResFile(const FileName: string; Instance: TComponent);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    Stream.WriteComponentRes(Instance.ClassName, Instance);
  finally
    Stream.Free;
  end;
end;

function CollectionsEqual(C1, C2: TCollection; Owner1, Owner2: TComponent): Boolean;
var
  S1, S2: TMemoryStream;

  procedure WriteCollection(Stream: TStream; Collection: TCollection; CollectionOwner: TComponent);
  var
    Writer: TWriter;
  begin
    Writer := TWriter.Create(Stream, 1024);
    Writer.Root := CollectionOwner;
    Writer.FLookupRoot := CollectionOwner;
    try
      Writer.WriteCollection(Collection);
    finally
      Writer.Free;
    end;
  end;

begin
  Result := False;
  if C1.ClassType <> C2.ClassType then Exit;
  if C1.Count <> C2.Count then Exit;
  S1 := TMemoryStream.Create;
  try
    WriteCollection(S1, C1, Owner1);
    S2 := TMemoryStream.Create;
    try
      WriteCollection(S2, C2, Owner2);
      Result := (S1.Size = S2.Size) and CompareMem(S1.Memory, S2.Memory, S1.Size);
    finally
      S2.Free;
    end;
  finally
    S1.Free;
  end;
end;

{ Utility routines }
function LineStart(Buffer, BufPos: PAnsiChar): PAnsiChar;
{$IFDEF PUREPASCAL}
var
  C: NativeInt;
begin
  Result := Buffer;
  C := (BufPos - Buffer) - 1;
  while (C > 0) and (Buffer[C] <> #10) do
    Dec(C);

  if C > 0 then
    Result := @Buffer[C + 1];
end;
{$ELSE !PUREPASCAL}
{$IFDEF X86ASM}
asm // StackAlignSafe
        PUSH    EDI
        MOV     EDI,EDX
        MOV     ECX,EDX
        SUB     ECX,EAX
        SUB     ECX,1
        JBE     @@1
        MOV     EDX,EAX
        DEC     EDI
        MOV     AL,0AH
        STD
        REPNE   SCASB
        CLD
        MOV     EAX,EDX
        JNE     @@1
        LEA     EAX,[EDI+2]
@@1:    POP     EDI
end;
{$ENDIF X86ASM}
{$ENDIF !PUREPASCAL}

function LineStart(Buffer, BufPos: PWideChar): PWideChar;
{$IFDEF PUREPASCAL}
var
  C: NativeInt;
begin
  Result := Buffer;
  C := (BufPos - Buffer) - 1;
  while (C > 0) and (Buffer[C] <> #10) do
    Dec(C);

  if C > 0 then
    Result := @Buffer[C + 1];
end;
{$ELSE !PUREPASCAL}
{$IFDEF X86ASM}
asm // StackAlignSafe
        PUSH    EDI
        MOV     EDI,EDX
        MOV     ECX,EDX
        SUB     ECX,EAX
        SHR     ECX,1
        SUB     ECX,2
        JBE     @@1
        MOV     EDX,EAX
        DEC     EDI
        DEC     EDI
        MOV     AX,0AH
        STD
        REPNE   SCASW
        CLD
        MOV     EAX,EDX
        JNE     @@1
        LEA     EAX,[EDI+4]                                              
@@1:    POP     EDI
end;
{$ENDIF X86ASM}
{$ENDIF !PUREPASCAL}

function LineStart(const Buffer: TBytes; BufPos: NativeInt): NativeInt;
begin
  while (BufPos > 0) and (Buffer[BufPos] <> 10) do
    Dec(BufPos);

  if Buffer[BufPos] = 10 then
    Inc(BufPos);

  Result := BufPos;
end;

function ExtractStrings(Separators, WhiteSpace: TSysCharSet; Content: PChar;
  Strings: TStrings): Integer;
var
  Head, Tail: PChar;
  EOS, InQuote: Boolean;
  QuoteChar: Char;
  Item: string;
begin
  Result := 0;
  if (Content = nil) or (Content^ = #0) or (Strings = nil) then
    Exit;
  Tail := Content;
  InQuote := False;
  QuoteChar := #0;
  Strings.BeginUpdate;
  try
    Include(WhiteSpace, #13);
    Include(WhiteSpace, #10);

    Include(Separators, #0);
    Include(Separators, #13);
    Include(Separators, #10);
    Include(Separators, '''');
    Include(Separators, '"');
    repeat
      while (Tail^ in WhiteSpace) do
        Inc(Tail);
      Head := Tail;
      while True do
      begin
        while (InQuote and not ((Tail^ = #0) or (Tail^ = QuoteChar))) or
          not (Tail^ in Separators) do
            Inc(Tail);
        if (Tail^ in ['''', '"']) then
        begin
          if (QuoteChar <> #0) and (QuoteChar = Tail^) then
            QuoteChar := #0
          else if QuoteChar = #0 then
            QuoteChar := Tail^;
          InQuote := QuoteChar <> #0;
          Inc(Tail);
        end else Break;
      end;
      EOS := Tail^ = #0;
      if (Head <> Tail) and (Head^ <> #0) then
      begin
        if Strings <> nil then
        begin
          SetString(Item, Head, Tail - Head);
          Strings.Add(Item);
        end;
        Inc(Result);
      end;
      Inc(Tail);
    until EOS;
  finally
    Strings.EndUpdate;
  end;
end;

{ TListEnumerator }

constructor TListEnumerator.Create(AList: TList);
begin
  inherited Create;
  FIndex := -1;
  FList := AList;
end;

function TListEnumerator.GetCurrent: Pointer;
begin
  Result := FList[FIndex];
end;

function TListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TList }

destructor TList.Destroy;
begin
  Clear;
end;

function TList.Add(Item: Pointer): Integer;
begin
  Result := FCount;
  if Result = FCapacity then
    Grow;
  FList[Result] := Item;
  Inc(FCount);
  if (Item <> nil) and (ClassType <> TList) then
    Notify(Item, lnAdded);
end;

procedure TList.Clear;
begin
  SetCount(0);
  SetCapacity(0);
end;

procedure TList.Delete(Index: Integer);
var
  Temp: Pointer;
begin
  if (Index < 0) or (Index >= FCount) then
    Error(@SListIndexError, Index);
  Temp := FList[Index];
  Dec(FCount);
  if Index < FCount then
    System.Move(FList[Index + 1], FList[Index],
      (FCount - Index) * SizeOf(Pointer));
  if (Temp <> nil) and (ClassType <> TList) then
    Notify(Temp, lnDeleted);
end;

class procedure TList.Error(const Msg: string; Data: NativeInt);
begin
  raise EListError.CreateFmt(Msg, [Data]) at ReturnAddress;
end;

class procedure TList.Error(Msg: PResStringRec; Data: NativeInt);
begin
  raise EListError.CreateFmt(LoadResString(Msg), [Data]) at ReturnAddress;
end;

procedure TList.Exchange(Index1, Index2: Integer);
var
  Item: Pointer;
begin
  if (Index1 < 0) or (Index1 >= FCount) then
    Error(@SListIndexError, Index1);
  if (Index2 < 0) or (Index2 >= FCount) then
    Error(@SListIndexError, Index2);
  Item := FList[Index1];
  FList[Index1] := FList[Index2];
  FList[Index2] := Item;
end;

function TList.Expand: TList;
begin
  if FCount = FCapacity then
    Grow;
  Result := Self;
end;

function TList.First: Pointer;
begin
  Result := Get(0);
end;

function TList.Get(Index: Integer): Pointer;
begin
  if Cardinal(Index) >= Cardinal(FCount) then
    Error(@SListIndexError, Index);
  Result := FList[Index];
end;

function TList.GetEnumerator: TListEnumerator;
begin
  Result := TListEnumerator.Create(Self);
end;

procedure TList.Grow;
var
  Delta: Integer;
begin
  if FCapacity > 64 then
    Delta := FCapacity div 4
  else
    if FCapacity > 8 then
      Delta := 16
    else
      Delta := 4;
  SetCapacity(FCapacity + Delta);
end;

function TList.IndexOf(Item: Pointer): Integer;
var
  P: PPointer;
begin
  P := Pointer(FList);
  for Result := 0 to FCount - 1 do
  begin
    if P^ = Item then
      Exit;
    Inc(P);
  end;
  Result := -1;
end;

function TList.IndexOfItem(Item: Pointer; Direction: TDirection): Integer;
var
  P: PPointer;
begin
  if Direction = FromBeginning then
    Result := IndexOf(Item)
  else
  begin
    if FCount > 0 then
    begin
      P := Pointer(@List[FCount - 1]);
      for Result := FCount - 1 downto 0 do
      begin
        if P^ = Item then
          Exit;
        Dec(P);
      end;
    end;
    Result := -1;
  end;
end;

procedure TList.Insert(Index: Integer; Item: Pointer);
begin
  if (Index < 0) or (Index > FCount) then
    Error(@SListIndexError, Index);
  if FCount = FCapacity then
    Grow;
  if Index < FCount then
    System.Move(FList[Index], FList[Index + 1],
      (FCount - Index) * SizeOf(Pointer));
  FList[Index] := Item;
  Inc(FCount);
  if (Item <> nil) and (ClassType <> TList) then
    Notify(Item, lnAdded);
end;

function TList.Last: Pointer;
begin
  if FCount > 0 then
    Result := FList[Count - 1]
  else
  begin
    Error(@SListIndexError, 0);
    Result := nil;
  end;
end;

procedure TList.Move(CurIndex, NewIndex: Integer);
var
  Item: Pointer;
begin
  if CurIndex <> NewIndex then
  begin
    if (NewIndex < 0) or (NewIndex >= FCount) then
      Error(@SListIndexError, NewIndex);
    Item := Get(CurIndex);
    FList[CurIndex] := nil;
    Delete(CurIndex);
    Insert(NewIndex, nil);
    FList[NewIndex] := Item;
  end;
end;

procedure TList.Put(Index: Integer; Item: Pointer);
var
  Temp: Pointer;
begin
  if (Index < 0) or (Index >= FCount) then
    Error(@SListIndexError, Index);
  if Item <> FList[Index] then
  begin
    Temp := FList[Index];
    FList[Index] := Item;
    if ClassType <> TList then
    begin
      if Temp <> nil then
        Notify(Temp, lnDeleted);
      if Item <> nil then
        Notify(Item, lnAdded);
    end;
  end;
end;

function TList.Remove(Item: Pointer): Integer;
begin
  Result := RemoveItem(Item, TList.TDirection.FromBeginning);
end;

function TList.RemoveItem(Item: Pointer; Direction: TDirection): Integer;
begin
  Result := IndexOfItem(Item, Direction);
  if Result >= 0 then
    Delete(Result);
end;

procedure TList.Pack;
var
  PackedCount : Integer;
  StartIndex : Integer;
  EndIndex : Integer;
begin
  if FCount = 0 then
    Exit;

  PackedCount := 0;
  StartIndex := 0;
  repeat
    // Locate the first/next non-nil element in the list
    while (StartIndex < FCount) and (FList[StartIndex] = nil) do
      Inc(StartIndex);

    if StartIndex < FCount then // There is nothing more to do
    begin
      // Locate the next nil pointer
      EndIndex := StartIndex;
      while (EndIndex < FCount) and (FList[EndIndex] <> nil) do
        Inc(EndIndex);
      Dec(EndIndex);

      // Move this block of non-null items to the index recorded in PackedToCount:
      // If this is a contiguous non-nil block at the start of the list then
      // StartIndex and PackedToCount will be equal (and 0) so don't bother with the move.
      if StartIndex > PackedCount then
        System.Move(FList[StartIndex],
                    FList[PackedCount],
                    (EndIndex - StartIndex + 1) * SizeOf(Pointer));

      // Set the PackedToCount to reflect the number of items in the list
      // that have now been packed.
      Inc(PackedCount, EndIndex - StartIndex + 1);

      // Reset StartIndex to the element following EndIndex
      StartIndex := EndIndex + 1;
    end;
  until StartIndex >= FCount;

  // Set Count so that the 'free' item
  FCount := PackedCount;
end;

procedure TList.SetCapacity(NewCapacity: Integer);
begin
  if NewCapacity < FCount then
    Error(@SListCapacityError, NewCapacity);
  if NewCapacity <> FCapacity then
  begin
    SetLength(FList, NewCapacity);
    FCapacity := NewCapacity;
  end;
end;

procedure TList.SetCount(NewCount: Integer);
var
  I: Integer;
  Temp: Pointer;
begin
  if NewCount < 0 then
    Error(@SListCountError, NewCount);
  if NewCount <> FCount then
  begin
    if NewCount > FCapacity then
      SetCapacity(NewCount);
    if NewCount > FCount then
      FillChar(FList[FCount], (NewCount - FCount) * SizeOf(Pointer), 0)
    else
    if ClassType <> TList then
    begin
      for I := FCount - 1 downto NewCount do
      begin
        Dec(FCount);
        Temp := List[I];
        if Temp <> nil then
          Notify(Temp, lnDeleted);
      end;
    end;
    FCount := NewCount;
  end;
end;

procedure QuickSort(SortList: TPointerList; L, R: Integer;
  SCompare: TListSortCompareFunc);
var
  I, J: Integer;
  P, T: Pointer;
begin
  repeat
    I := L;
    J := R;
    P := SortList[(L + R) shr 1];
    repeat
      while SCompare(SortList[I], P) < 0 do
        Inc(I);
      while SCompare(SortList[J], P) > 0 do
        Dec(J);
      if I <= J then
      begin
        if I <> J then
        begin
          T := SortList[I];
          SortList[I] := SortList[J];
          SortList[J] := T;
        end;
        Inc(I);
        Dec(J);
      end;
    until I > J;
    if L < J then
      QuickSort(SortList, L, J, SCompare);
    L := I;
  until I >= R;
end;

procedure TList.Sort(Compare: TListSortCompare);
begin
  if Count > 1 then
    QuickSort(FList, 0, Count - 1,
      function(Item1, Item2: Pointer): Integer
      begin
        Result := Compare(Item1, Item2);
      end);
end;

procedure TList.SortList(const Compare: TListSortCompareFunc);
begin
  if Count > 1 then
    QuickSort(FList, 0, Count - 1, Compare);
end;

function TList.Extract(Item: Pointer): Pointer;
begin
  Result := ExtractItem(Item, TDirection.FromBeginning);
end;

function TList.ExtractItem(Item: Pointer; Direction: TDirection): Pointer;
var
  I: Integer;
begin
  Result := nil;
  I := IndexOfItem(Item, Direction);
  if I >= 0 then
  begin
    Result := Item;
    FList[I] := nil;
    Delete(I);
    if ClassType <> TList then
      Notify(Result, lnExtracted);
  end;
end;

procedure TList.Notify(Ptr: Pointer; Action: TListNotification);
begin
end;

procedure TList.Assign(ListA: TList; AOperator: TListAssignOp; ListB: TList);
var
  I: Integer;
  LTemp, LSource: TList;
begin
  // ListB given?
  if ListB <> nil then
  begin
    LSource := ListB;
    Assign(ListA);
  end
  else
    LSource := ListA;

  // on with the show
  case AOperator of

    // 12345, 346 = 346 : only those in the new list
    laCopy:
      begin
        Clear;
        Capacity := LSource.Capacity;
        for I := 0 to LSource.Count - 1 do
          Add(LSource[I]);
      end;

    // 12345, 346 = 34 : intersection of the two lists
    laAnd:
      for I := Count - 1 downto 0 do
        if LSource.IndexOf(Items[I]) = -1 then
          Delete(I);

    // 12345, 346 = 123456 : union of the two lists
    laOr:
      for I := 0 to LSource.Count - 1 do
        if IndexOf(LSource[I]) = -1 then
          Add(LSource[I]);

    // 12345, 346 = 1256 : only those not in both lists
    laXor:
      begin
        LTemp := TList.Create; // Temp holder of 4 byte values
        try
          LTemp.Capacity := LSource.Count;
          for I := 0 to LSource.Count - 1 do
            if IndexOf(LSource[I]) = -1 then
              LTemp.Add(LSource[I]);
          for I := Count - 1 downto 0 do
            if LSource.IndexOf(Items[I]) <> -1 then
              Delete(I);
          I := Count + LTemp.Count;
          if Capacity < I then
            Capacity := I;
          for I := 0 to LTemp.Count - 1 do
            Add(LTemp[I]);
        finally
          LTemp.Free;
        end;
      end;

    // 12345, 346 = 125 : only those unique to source
    laSrcUnique:
      for I := Count - 1 downto 0 do
        if LSource.IndexOf(Items[I]) <> -1 then
          Delete(I);

    // 12345, 346 = 6 : only those unique to dest
    laDestUnique:
      begin
        LTemp := TList.Create;
        try
          LTemp.Capacity := LSource.Count;
          for I := LSource.Count - 1 downto 0 do
            if IndexOf(LSource[I]) = -1 then
              LTemp.Add(LSource[I]);
          Assign(LTemp);
        finally
          LTemp.Free;
        end;
      end;
  end;
end;

{ TThreadList }

constructor TThreadList.Create;
begin
  inherited Create;
  FLock := TObject.Create;
  FList := TList.Create;
  FDuplicates := dupIgnore;
end;

destructor TThreadList.Destroy;
begin
  LockList;    // Make sure nobody else is inside the list.
  try
    FList.Free;
    inherited Destroy;
  finally
    UnlockList;
    FLock.Free;
  end;
end;

procedure TThreadList.Add(Item: Pointer);
begin
  LockList;
  try
    if (Duplicates = dupAccept) or
       (FList.IndexOf(Item) = -1) then
      FList.Add(Item)
    else if Duplicates = dupError then
      FList.Error(@SDuplicateItem, IntPtr(Item));
  finally
    UnlockList;
  end;
end;

procedure TThreadList.Clear;
begin
  LockList;
  try
    FList.Clear;
  finally
    UnlockList;
  end;
end;

function  TThreadList.LockList: TList;
begin
  TMonitor.Enter(FLock);
  Result := FList;
end;

procedure TThreadList.Remove(Item: Pointer);
begin
  RemoveItem(Item, TList.TDirection.FromBeginning);
end;

procedure TThreadList.RemoveItem(Item: Pointer; Direction: TList.TDirection);
begin
  LockList;
  try
    FList.RemoveItem(Item, Direction);
  finally
    UnlockList;
  end;
end;

procedure TThreadList.UnlockList;
begin
  TMonitor.Exit(FLock);
end;

{ TInterfaceListEnumerator }

constructor TInterfaceListEnumerator.Create(AInterfaceList: TInterfaceList);
begin
  inherited Create;
  FIndex := -1;
  FInterfaceList := AInterfaceList;
end;

function TInterfaceListEnumerator.GetCurrent: IInterface;
begin
  Result := FInterfaceList[FIndex];
end;

function TInterfaceListEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FInterfaceList.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TInterfaceList }

constructor TInterfaceList.Create;
begin
  inherited Create;
  FList := TThreadList.Create;
end;

destructor TInterfaceList.Destroy;
begin
  Clear;
  FreeAndNil(FList);
  inherited Destroy;
end;

procedure TInterfaceList.Clear;
var
  I: Integer;
begin
  if FList <> nil then
  begin
    with FList.LockList do
    try
      for I := 0 to Count - 1 do
        IInterface(List[I]) := nil;
      Clear;
    finally
      Self.FList.UnlockList;
    end;
  end;
end;

procedure TInterfaceList.Delete(Index: Integer);
begin
  with FList.LockList do
  try
    Self.Put(Index, nil);
    Delete(Index);
  finally
    Self.FList.UnlockList;
  end;
end;

function TInterfaceList.Expand: TInterfaceList;
begin
  with FList.LockList do
  try
    Expand;
    Result := Self;
  finally
    Self.FList.Unlocklist;
  end;
end;

function TInterfaceList.First: IInterface;
begin
  Result := Get(0);
end;

function TInterfaceList.Get(Index: Integer): IInterface;
begin
  with FList.LockList do
  try
    if (Index < 0) or (Index >= Count) then
      Error(@SListIndexError, Index);
    Result := IInterface(List[Index]);
  finally
    Self.FList.UnlockList;
  end;
end;

function TInterfaceList.GetCapacity: Integer;
begin
  with FList.LockList do
  try
    Result := Capacity;
  finally
    Self.FList.UnlockList;
  end;
end;

function TInterfaceList.GetCount: Integer;
begin
  with FList.LockList do
  try
    Result := Count;
  finally
    Self.FList.UnlockList;
  end;
end;

function TInterfaceList.GetEnumerator: TInterfaceListEnumerator;
begin
  Result := TInterfaceListEnumerator.Create(Self);
end;

function TInterfaceList.IndexOf(const Item: IInterface): Integer;
begin
  Result := IndexOfItem(Item, TList.TDirection.FromBeginning);
end;

function TInterfaceList.IndexOfItem(const Item: IInterface; Direction: TList.TDirection): Integer;
begin
  with FList.LockList do
  try
    Result := IndexOfItem(Pointer(Item), Direction);
  finally
    Self.FList.UnlockList;
  end;
end;

function TInterfaceList.Add(const Item: IInterface): Integer;
begin
  with FList.LockList do
  try
    Result := Add(nil);
    IInterface(List[Result]) := Item;
  finally
    Self.FList.UnlockList;
  end;
end;

procedure TInterfaceList.Insert(Index: Integer; const Item: IInterface);
begin
  with FList.LockList do
  try
    Insert(Index, nil);
    IInterface(List[Index]) := Item;
  finally
    Self.FList.UnlockList;
  end;
end;

function TInterfaceList.Last: IInterface;
begin
  with FList.LockList do
  try
    Result := Self.Get(Count - 1);
  finally
    Self.FList.UnlockList;
  end;
end;

procedure TInterfaceList.Put(Index: Integer; const Item: IInterface);
begin
  with FList.LockList do
  try
    if (Index < 0) or (Index >= Count) then Error(@SListIndexError, Index);
    IInterface(List[Index]) := Item;
  finally
    Self.FList.UnlockList;
  end;
end;

function TInterfaceList.Remove(const Item: IInterface): Integer;
begin
  Result := RemoveItem(Item, TList.TDirection.FromBeginning);
end;

function TInterfaceList.RemoveItem(const Item: IInterface; Direction: TList.TDirection): Integer;
begin
  with FList.LockList do
  try
    Result := IndexOfItem(Pointer(Item), Direction);
    if Result > -1 then
    begin
      IInterface(List[Result]) := nil;
      Delete(Result);
    end;
  finally
    Self.FList.UnlockList;
  end;
end;

procedure TInterfaceList.SetCapacity(NewCapacity: Integer);
begin
  with FList.LockList do
  try
    Capacity := NewCapacity;
  finally
    Self.FList.UnlockList;
  end;
end;

procedure TInterfaceList.SetCount(NewCount: Integer);
begin
  with FList.LockList do
  try
    Count := NewCount;
  finally
    Self.FList.UnlockList;
  end;
end;

procedure TInterfaceList.Exchange(Index1, Index2: Integer);
begin
  with FList.LockList do
  try
    Exchange(Index1, Index2);
  finally
    Self.FList.UnlockList;
  end;
end;

procedure TInterfaceList.Lock;
begin
  FList.LockList;
end;

procedure TInterfaceList.Unlock;
begin
  FList.UnlockList;
end;

{ TBits }

const
  BitsPerInt = SizeOf(Integer) * 8;

type
  TBitEnum = 0..BitsPerInt - 1;
  TBitSet = set of TBitEnum;
  PBitArray = ^TBitArray;
  TBitArray = array[0..4096] of TBitSet;

destructor TBits.Destroy;
begin
  SetSize(0);
  inherited Destroy;
end;

procedure TBits.Error;
begin
  raise EBitsError.CreateRes(@SBitsIndexError);
end;

procedure TBits.SetSize(Value: Integer);
var
  NewMem: Pointer;
  NewMemSize: Integer;
  OldMemSize: Integer;

  function Min(X, Y: Integer): Integer;
  begin
    Result := X;
    if X > Y then Result := Y;
  end;

begin
  if Value <> Size then
  begin
    if Value < 0 then Error;
    NewMemSize := ((Value + BitsPerInt - 1) div BitsPerInt) * SizeOf(Integer);
    OldMemSize := ((Size + BitsPerInt - 1) div BitsPerInt) * SizeOf(Integer);
    if NewMemSize <> OldMemSize then
    begin
      NewMem := nil;
      if NewMemSize <> 0 then
      begin
        GetMem(NewMem, NewMemSize);
        FillChar(NewMem^, NewMemSize, 0);
      end;
      if OldMemSize <> 0 then
      begin
        if NewMem <> nil then
          Move(FBits^, NewMem^, Min(OldMemSize, NewMemSize));
        FreeMem(FBits, OldMemSize);
      end;
      FBits := NewMem;
    end;
    FSize := Value;
  end;
end;

procedure TBits.SetBit(Index: Integer; Value: Boolean);
{$IFDEF PUREPASCAL}
var
  LRelInt: PInteger;
  LMask: Integer;
begin
  if (Index >= FSize) or (Index < 0) then
    SetSize(Index + 1);

  { Calculate the address of the related integer }
  LRelInt := FBits;
  Inc(LRelInt, Index div BitsPerInt);

  { Generate the mask }
  LMask := (1 shl (Index mod BitsPerInt));

  { Update the integer }
  if Value then
    LRelInt^ := LRelInt^ or LMask
  else
    LRelInt^ := LRelInt^ and not LMask;
end;
{$ELSE !PUREPASCAL}
{$IFDEF X86ASM}
asm
        CMP     Index,[EAX].FSize
        JAE     @@Size

@@1:    MOV     EAX,[EAX].FBits
        OR      Value,Value
        JZ      @@2
        BTS     [EAX],Index
        RET

@@2:    BTR     [EAX],Index
        RET

@@Size: CMP     Index,0
        JL      TBits.Error
        PUSH    Self
        PUSH    Index
        PUSH    ECX {Value}
        INC     Index
        CALL    TBits.SetSize
        POP     ECX {Value}
        POP     Index
        POP     Self
        JMP     @@1
end;
{$ENDIF X86ASM}
{$ENDIF !PUREPASCAL}

function TBits.GetBit(Index: Integer): Boolean;
{$IFDEF PUREPASCAL}
var
  LRelInt: PInteger;
  LMask: Integer;
begin
  if (Index >= FSize) or (Index < 0) then
    Error;

  { Calculate the address of the related integer }
  LRelInt := FBits;
  Inc(LRelInt, Index div BitsPerInt);

  { Generate the mask }
  LMask := (1 shl (Index mod BitsPerInt));
  Result := (LRelInt^ and LMask) <> 0;
end;
{$ELSE !PUREPASCAL}
{$IFDEF X86ASM}
asm
        CMP     Index,[EAX].FSize
        JAE     TBits.Error
        MOV     EAX,[EAX].FBits
        BT      [EAX],Index
        SBB     EAX,EAX
        AND     EAX,1
end;
{$ENDIF X86ASM}
{$ENDIF !PUREPASCAL}

function TBits.OpenBit: Integer;
var
  I: Integer;
  B: TBitSet;
  J: TBitEnum;
  E: Integer;
begin
  E := (Size + BitsPerInt - 1) div BitsPerInt - 1;
  for I := 0 to E do
    if PBitArray(FBits)^[I] <> [0..BitsPerInt - 1] then
    begin
      B := PBitArray(FBits)^[I];
      for J := Low(J) to High(J) do
      begin
        if not (J in B) then
        begin
          Result := I * BitsPerInt + J;
          if Result >= Size then Result := Size;
          Exit;
        end;
      end;
    end;
  Result := Size;
end;

{ TPersistent }

destructor TPersistent.Destroy;
begin
  RemoveFixups(Self);
  inherited Destroy;
end;

procedure TPersistent.Assign(Source: TPersistent);
begin
  if Source <> nil then Source.AssignTo(Self) else AssignError(nil);
end;

procedure TPersistent.AssignError(Source: TPersistent);
var
  SourceName: string;
begin
  if Source <> nil then
    SourceName := Source.ClassName else
    SourceName := 'nil';
  raise EConvertError.CreateResFmt(@SAssignError, [SourceName, ClassName]);
end;

procedure TPersistent.AssignTo(Dest: TPersistent);
begin
  Dest.AssignError(Self);
end;

procedure TPersistent.DefineProperties(Filer: TFiler);
begin
end;

function TPersistent.GetNamePath: string;
var
  S: string;
begin
  Result := ClassName;
  if (GetOwner <> nil) then
  begin
    S := GetOwner.GetNamePath;
    if S <> '' then
      Result := S + '.' + Result;
  end;
end;

function TPersistent.GetOwner: TPersistent;
begin
  Result := nil;
end;

{ TInterfacedPersistent }

procedure TInterfacedPersistent.AfterConstruction;
begin
  inherited;
  if GetOwner <> nil then
    GetOwner.GetInterface(IInterface, FOwnerInterface);
end;

function TInterfacedPersistent._AddRef: Integer;
begin
  if FOwnerInterface <> nil then
    Result := FOwnerInterface._AddRef else
    Result := -1;
end;

function TInterfacedPersistent._Release: Integer;
begin
  if FOwnerInterface <> nil then
    Result := FOwnerInterface._Release else
    Result := -1;
end;

function TInterfacedPersistent.QueryInterface(const IID: TGUID;
  out Obj): HResult;
const
  E_NOINTERFACE = HResult($80004002);
begin
  if GetInterface(IID, Obj) then Result := 0 else Result := E_NOINTERFACE;
end;

// Out param is more code efficient for interfaces than function result
procedure GetDesigner(Obj: TPersistent; out Result: IDesignerNotify);
var
  Temp: TPersistent;
begin
  Result := nil;
  if Obj = nil then Exit;
  Temp := Obj.GetOwner;
  if Temp = nil then
  begin
    if (Obj is TComponent) and (csDesigning in TComponent(Obj).ComponentState) then
      TComponent(Obj).QueryInterface(IDesignerNotify, Result);
  end
  else
  begin
    if (Obj is TComponent) and
      not (csDesigning in TComponent(Obj).ComponentState) then Exit;
    GetDesigner(Temp, Result);
  end;
end;

function FindRootDesigner(Obj: TPersistent): IDesignerNotify;
begin
  GetDesigner(Obj, Result);
end;

function CountGenerations(Ancestor, Descendent: TClass): Integer;
var
  R: Integer;
begin
  R := 0;
  while Ancestor <> Descendent do
  begin
    if Descendent = nil then
    begin
      // Descendent wasn't a descendent of Ancestor.
      Result := -1;
      Exit;
    end;
    Descendent := Descendent.ClassParent;
    Inc(R);
  end;
  Result := R;
end;

procedure NotifyDesigner(Self, Item: TPersistent; Operation: TOperation);
var
  Designer: IDesignerNotify;
begin
  GetDesigner(Self, Designer);
  if Designer <> nil then
    Designer.Notification(Item, Operation);
end;

{ TRecall }

constructor TRecall.Create(AStorage, AReference: TPersistent);
begin
  inherited Create;
  FStorage := AStorage;
  FReference := AReference;
  Store;
end;

destructor TRecall.Destroy;
begin
  if Assigned(FReference) then
    FReference.Assign(FStorage);
  Forget;
  inherited;
end;

procedure TRecall.Forget;
begin
  FReference := nil;
  FreeAndNil(FStorage);
end;

procedure TRecall.Store;
begin
  if Assigned(FReference) then
    FStorage.Assign(FReference);
end;

{ TCollectionItem }

constructor TCollectionItem.Create(Collection: TCollection);
begin
  SetCollection(Collection);
end;

destructor TCollectionItem.Destroy;
begin
  SetCollection(nil);
  inherited Destroy;
end;

procedure TCollectionItem.Changed(AllItems: Boolean);
var
  Item: TCollectionItem;
begin
  if (FCollection <> nil) and (FCollection.FUpdateCount = 0) then
  begin
    if AllItems then Item := nil else Item := Self;
    FCollection.Update(Item);
  end;
end;

function TCollectionItem.GetIndex: Integer;
begin
  if FCollection <> nil then
    Result := FCollection.FItems.IndexOf(Self) else
    Result := -1;
end;

function TCollectionItem.GetDisplayName: string;
begin
  Result := ClassName;
end;

function TCollectionItem.GetNamePath: string;
begin
  if FCollection <> nil then
    Result := Format('%s[%d]',[FCollection.GetNamePath, Index])
  else
    Result := ClassName;
end;

function TCollectionItem.GetOwner: TPersistent;
begin
  Result := FCollection;
end;

procedure TCollectionItem.SetCollection(Value: TCollection);
begin
  if FCollection <> Value then
  begin
    if FCollection <> nil then FCollection.RemoveItem(Self);
    if Value <> nil then Value.InsertItem(Self);
  end;
end;

procedure TCollectionItem.SetDisplayName(const Value: string);
begin
  Changed(False);
end;

procedure TCollectionItem.SetIndex(Value: Integer);
var
  CurIndex: Integer;
begin
  CurIndex := GetIndex;
  if (CurIndex >= 0) and (CurIndex <> Value) then
  begin
    FCollection.FItems.Move(CurIndex, Value);
    Changed(True);
  end;
end;

{ TCollectionEnumerator }

constructor TCollectionEnumerator.Create(ACollection: TCollection);
begin
  inherited Create;
  FIndex := -1;
  FCollection := ACollection;
end;

function TCollectionEnumerator.GetCurrent: TCollectionItem;
begin
  Result := FCollection.Items[FIndex];
end;

function TCollectionEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FCollection.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TCollection }

constructor TCollection.Create(ItemClass: TCollectionItemClass);
begin
  FItemClass := ItemClass;
  FItems := TList.Create;
  NotifyDesigner(Self, Self, opInsert);
end;

destructor TCollection.Destroy;
begin
  FUpdateCount := 1;
  if FItems <> nil then
    Clear;
  NotifyDesigner(Self, Self, opRemove);
  FItems.Free;
  inherited Destroy;
end;

function TCollection.Add: TCollectionItem;
begin
  Result := FItemClass.Create(Self);
  Added(Result);
end;

procedure TCollection.Assign(Source: TPersistent);
var
  I: Integer;
begin
  if Source is TCollection then
  begin
    BeginUpdate;
    try
      // Replaces call to Clear to avoid BeginUpdate/try/finally/EndUpdate block
      while FItems.Count > 0 do
        TCollectionItem(FItems.List[FItems.Count - 1]).Free;

      for I := 0 to TCollection(Source).FItems.Count - 1 do
        Add.Assign(TCollection(Source).FItems[I]);
    finally
      EndUpdate;
    end;
    Exit;
  end;
  inherited Assign(Source);
end;

procedure TCollection.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TCollection.Changed;
begin
  if FUpdateCount = 0 then Update(nil);
end;

procedure TCollection.Clear;
begin
  if FItems.Count > 0 then
  begin
    BeginUpdate;
    try
      while FItems.Count > 0 do
        TCollectionItem(FItems.List[FItems.Count - 1]).Free;
    finally
      EndUpdate;
    end;
  end;
end;

procedure TCollection.EndUpdate;
begin
  Dec(FUpdateCount);
  Changed;
end;

function TCollection.FindItemID(ID: Integer): TCollectionItem;
var
  I: Integer;
begin
  for I := 0 to FItems.Count-1 do
  begin
    Result := TCollectionItem(FItems[I]);
    if Result.ID = ID then Exit;
  end;
  Result := nil;
end;

function TCollection.GetAttrCount: Integer;
begin
  Result := 0;
end;

function TCollection.GetAttr(Index: Integer): string;
begin
  Result := '';
end;

function TCollection.GetEnumerator: TCollectionEnumerator;
begin
  Result := TCollectionEnumerator.Create(Self);
end;

function TCollection.GetCapacity: Integer;
begin
  Result := FItems.Capacity;
end;

function TCollection.GetItemAttr(Index, ItemIndex: Integer): string;
begin
  Result := Items[ItemIndex].DisplayName;
end;

function TCollection.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TCollection.GetItem(Index: Integer): TCollectionItem;
begin
  Result := FItems[Index];
end;

function TCollection.GetNamePath: string;
var
  S, P: string;
begin
  Result := ClassName;
  if GetOwner = nil then Exit;
  S := GetOwner.GetNamePath;
  if S = '' then Exit;
  P := PropName;
  if P = '' then Exit;
  Result := S + '.' + P;
end;

function TCollection.GetPropName: string;
var
  I: Integer;
  Props: PPropList;
  TypeData: PTypeData;
  Owner: TPersistent;
begin
  Result := FPropName;
  Owner := GetOwner;
  if (Result <> '') or (Owner = nil) or (Owner.ClassInfo = nil) then Exit;
  TypeData := GetTypeData(Owner.ClassInfo);
  if (TypeData = nil) or (TypeData^.PropCount = 0) then Exit;
  GetMem(Props, TypeData^.PropCount * sizeof(Pointer));
  try
    GetPropInfos(Owner.ClassInfo, Props);
    for I := 0 to TypeData^.PropCount-1 do
    begin
      with Props^[I]^ do
        if (PropType^^.Kind = tkClass) and
          (GetOrdProp(Owner, Props^[I]) = IntPtr(Self)) then
          FPropName := System.TypInfo.GetPropName(Props^[I]);
    end;
  finally
    Freemem(Props);
  end;
  Result := FPropName;
end;

function TCollection.Insert(Index: Integer): TCollectionItem;
begin
  Result := Add;
  Result.Index := Index;
end;

procedure TCollection.InsertItem(Item: TCollectionItem);
begin
  if not (Item is FItemClass) then TList.Error(@SInvalidProperty, 0);
  FItems.Add(Item);
  Item.FCollection := Self;
  Item.FID := FNextID;
  Inc(FNextID);
  SetItemName(Item);
  Notify(Item, cnAdded);
  Changed;
  NotifyDesigner(Self, Item, opInsert);
end;

procedure TCollection.RemoveItem(Item: TCollectionItem);
begin
  Notify(Item, cnExtracting);
  if Item = FItems.Last then
    FItems.Delete(FItems.Count - 1)
  else
    FItems.Remove(Item);
  Item.FCollection := nil;
  NotifyDesigner(Self, Item, opRemove);
  Changed;
end;

procedure TCollection.SetCapacity(Value: Integer);
begin
  if (Value <> FItems.Capacity) then
    FItems.Capacity := Value;
end;

procedure TCollection.SetItem(Index: Integer; Value: TCollectionItem);
begin
  TCollectionItem(FItems[Index]).Assign(Value);
end;

procedure TCollection.SetItemName(Item: TCollectionItem);
begin
end;

procedure TCollection.Update(Item: TCollectionItem);
begin
end;

procedure TCollection.Delete(Index: Integer);
begin
  Notify(TCollectionItem(FItems[Index]), cnDeleting);
  TCollectionItem(FItems[Index]).Free;
end;

function TCollection.Owner: TPersistent;
begin
  Result := GetOwner;
end;

procedure TCollection.Added(var Item: TCollectionItem);
begin
end;

procedure TCollection.Deleting(Item: TCollectionItem);
begin
end;

procedure TCollection.Notify(Item: TCollectionItem;
  Action: TCollectionNotification);
begin
  case Action of
    cnAdded: Added(Item);
    cnDeleting: Deleting(Item);
  end;
end;

{ TOwnedCollection }

constructor TOwnedCollection.Create(AOwner: TPersistent;
  ItemClass: TCollectionItemClass);
begin
  FOwner := AOwner;
  inherited Create(ItemClass);
end;

function TOwnedCollection.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

{ find the ultimate owner of a collection or item (or persistent for that matter) }

function GetUltimateOwner(ACollectionItem: TCollectionItem): TPersistent;
begin
  Result := ACollectionItem.GetOwner;
  if Result <> nil then
    Result := GetUltimateOwner(TCollection(Result));
end;

function GetUltimateOwner(ACollection: TCollection): TPersistent;
begin
  Result := ACollection.GetOwner;
  if Result <> nil then
    Result := GetUltimateOwner(Result);
end;

function GetUltimateOwner(APersistent: TPersistent): TPersistent;
begin
  Result := APersistent.GetOwner;
end;

{ TStringsEnumerator }

constructor TStringsEnumerator.Create(AStrings: TStrings);
begin
  inherited Create;
  FIndex := -1;
  FStrings := AStrings;
end;

function TStringsEnumerator.GetCurrent: string;
begin
  Result := FStrings[FIndex];
end;

function TStringsEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FStrings.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TStrings }

constructor TStrings.Create;
begin
  inherited Create;
  FDefaultEncoding := TEncoding.Default;
  FEncoding := nil;
  FWriteBOM := True;
end;

destructor TStrings.Destroy;
begin
  if (FEncoding <> nil) and not TEncoding.IsStandardEncoding(FEncoding) then
    FreeAndNil(FEncoding);
  if not TEncoding.IsStandardEncoding(FDefaultEncoding) then
    FreeAndNil(FDefaultEncoding);
  StringsAdapter := nil;
  inherited Destroy;
end;

function TStrings.Add(const S: string): Integer;
begin
  Result := GetCount;
  Insert(Result, S);
end;

function TStrings.AddObject(const S: string; AObject: TObject): Integer;
begin
  Result := Add(S);
  PutObject(Result, AObject);
end;

procedure TStrings.Append(const S: string);
begin
  Add(S);
end;

procedure TStrings.AddStrings(Strings: TStrings);
var
  I: Integer;
begin
  BeginUpdate;
  try
    for I := 0 to Strings.Count - 1 do
      AddObject(Strings[I], Strings.Objects[I]);
  finally
    EndUpdate;
  end;
end;

procedure TStrings.AddStrings(const Strings: TArray<string>);
var
  I: Integer;
begin
  BeginUpdate;
  try
    for I := Low(Strings) to High(Strings) do
      Add(Strings[I]);
  finally
    EndUpdate;
  end;
end;

procedure TStrings.AddStrings(const Strings: TArray<string>; const Objects: TArray<TObject>);
var
  I: Integer;
begin
  if Length(Strings) <> Length(Objects) then
    raise EArgumentOutOfRangeException.CreateRes(@System.RTLConsts.sInvalidStringAndObjectArrays);
  BeginUpdate;
  try
    for I := Low(Strings) to High(Strings) do
      AddObject(Strings[I], Objects[I]);
  finally
    EndUpdate;
  end;
end;

procedure TStrings.Assign(Source: TPersistent);
begin
  if Source is TStrings then
  begin
    BeginUpdate;
    try
      Clear;
      // Must use property setter for DefaultEncoding
      DefaultEncoding := TStrings(Source).FDefaultEncoding;
      FDefined := TStrings(Source).FDefined;
      // Must use internal property setter for Encoding
      SetEncoding(TStrings(Source).FEncoding);
      FNameValueSeparator := TStrings(Source).FNameValueSeparator;
      FQuoteChar := TStrings(Source).FQuoteChar;
      FDelimiter := TStrings(Source).FDelimiter;
      FLineBreak := TStrings(Source).FLineBreak;
      FStrictDelimiter := TStrings(Source).FStrictDelimiter;
      FWriteBOM := TStrings(Source).FWriteBOM;
      AddStrings(TStrings(Source));
    finally
      EndUpdate;
    end;
    Exit;
  end;
  inherited Assign(Source);
end;

procedure TStrings.BeginUpdate;
begin
  if FUpdateCount = 0 then SetUpdateState(True);
  Inc(FUpdateCount);
end;

procedure TStrings.DefineProperties(Filer: TFiler);

  function DoWrite: Boolean;
  begin
    if Filer.Ancestor <> nil then
    begin
      Result := True;
      if Filer.Ancestor is TStrings then
        Result := not Equals(TStrings(Filer.Ancestor))
    end
    else Result := Count > 0;
  end;

begin
  Filer.DefineProperty('Strings', ReadData, WriteData, DoWrite);
end;

procedure TStrings.EndUpdate;
begin
  Dec(FUpdateCount);
  if FUpdateCount = 0 then SetUpdateState(False);
end;

function TStrings.Equals(Strings: TStrings): Boolean;
var
  I, Count: Integer;
begin
  Result := False;
  Count := GetCount;
  if Count <> Strings.GetCount then Exit;
  for I := 0 to Count - 1 do if Get(I) <> Strings.Get(I) then Exit;
  Result := True;
end;

                                                                      
{$IFOPT O+}
  // Turn off optimizations to force creating a EBP stack frame and
  // place params on the stack.
  {$DEFINE OPTIMIZATIONSON}
  {$O-}
{$ENDIF}
procedure TStrings.Error(const Msg: string; Data: Integer);
begin
  raise EStringListError.CreateFmt(Msg, [Data]) at 
    PPointer(PByte(@Msg) + SizeOf(Msg) + SizeOf(Self) + SizeOf(Pointer))^;
end;

procedure TStrings.Error(Msg: PResStringRec; Data: Integer);
begin
  raise EStringListError.CreateFmt(LoadResString(Msg), [Data]) at 
    PPointer(PByte(@Msg) + SizeOf(Msg) + SizeOf(Self) + SizeOf(Pointer))^;
end;
{$IFDEF OPTIMIZATIONSON}
  {$UNDEF OPTIMIZATIONSON}
  {$O+}
{$ENDIF}

procedure TStrings.Exchange(Index1, Index2: Integer);
var
  TempObject: TObject;
  TempString: string;
begin
  BeginUpdate;
  try
    TempString := Strings[Index1];
    TempObject := Objects[Index1];
    Strings[Index1] := Strings[Index2];
    Objects[Index1] := Objects[Index2];
    Strings[Index2] := TempString;
    Objects[Index2] := TempObject;
  finally
    EndUpdate;
  end;
end;

function TStrings.ExtractName(const S: string): string;
var
  P: Integer;
begin
  Result := S;
  P := AnsiPos(NameValueSeparator, Result);
  if P <> 0 then
    SetLength(Result, P-1) else
    SetLength(Result, 0);
end;

function TStrings.GetCapacity: Integer;
begin  // descendents may optionally override/replace this default implementation
  Result := Count;
end;

function TStrings.GetCommaText: string;
var
  LOldDefined: TStringsDefined;
  LOldDelimiter: Char;
  LOldQuoteChar: Char;
begin
  LOldDefined := FDefined;
  LOldDelimiter := FDelimiter;
  LOldQuoteChar := FQuoteChar;
  Delimiter := ',';
  QuoteChar := '"';
  try
    Result := GetDelimitedText;
  finally
    FDelimiter := LOldDelimiter;
    FQuoteChar := LOldQuoteChar;
    FDefined := LOldDefined;
  end;
end;

function TStrings.GetDelimitedText: string;
var
  S: string;
  P: PChar;
  I, Count: Integer;
  LDelimiters: TSysCharSet;
begin
  Count := GetCount;
  if (Count = 1) and (Get(0) = '') then
    Result := QuoteChar + QuoteChar
  else
  begin
    Result := '';
    LDelimiters := [AnsiChar(#0), AnsiChar(QuoteChar), AnsiChar(Delimiter)];
    if not StrictDelimiter then
      LDelimiters := LDelimiters + [AnsiChar(#1)..AnsiChar(' ')];
    for I := 0 to Count - 1 do
    begin
      S := Get(I);
      P := PChar(S);
      while not (P^ in LDelimiters) do
        P := NextChar(P);
      if (P^ <> #0) then S := AnsiQuotedStr(S, QuoteChar);
      Result := Result + S + Delimiter;
    end;
    System.Delete(Result, Length(Result), 1);
  end;
end;

function TStrings.GetEnumerator: TStringsEnumerator;
begin
  Result := TStringsEnumerator.Create(Self);
end;

function TStrings.GetName(Index: Integer): string;
begin
  Result := ExtractName(Get(Index));
end;

function TStrings.GetObject(Index: Integer): TObject;
begin
  Result := nil;
end;

function TStrings.GetText: PChar;
begin
  Result := StrNew(PChar(GetTextStr));
end;

function TStrings.GetTextStr: string;
var
  I, L, Size, Count: Integer;
  P: PChar;
  S, LB: string;
begin
  Count := GetCount;
  Size := 0;
  LB := LineBreak;
  for I := 0 to Count - 1 do Inc(Size, Length(Get(I)) + Length(LB));
  SetString(Result, nil, Size);
  P := Pointer(Result);
  for I := 0 to Count - 1 do
  begin
    S := Get(I);
    L := Length(S);
    if L <> 0 then
    begin
      System.Move(Pointer(S)^, P^, L * SizeOf(Char));
      Inc(P, L);
    end;
    L := Length(LB);
    if L <> 0 then
    begin
      System.Move(Pointer(LB)^, P^, L * SizeOf(Char));
      Inc(P, L);
    end;
  end;
end;

function TStrings.GetValue(const Name: string): string;
var
  I: Integer;
begin
  I := IndexOfName(Name);
  if I >= 0 then
    Result := Copy(Get(I), Length(Name) + 2, MaxInt) else
    Result := '';
end;

function TStrings.IndexOf(const S: string): Integer;
begin
  for Result := 0 to GetCount - 1 do
    if CompareStrings(Get(Result), S) = 0 then Exit;
  Result := -1;
end;

function TStrings.IndexOfName(const Name: string): Integer;
var
  P: Integer;
  S: string;
begin
  for Result := 0 to GetCount - 1 do
  begin
    S := Get(Result);
    P := AnsiPos(NameValueSeparator, S);
    if (P <> 0) and (CompareStrings(Copy(S, 1, P - 1), Name) = 0) then Exit;
  end;
  Result := -1;
end;

function TStrings.IndexOfObject(AObject: TObject): Integer;
begin
  for Result := 0 to GetCount - 1 do
    if GetObject(Result) = AObject then Exit;
  Result := -1;
end;

procedure TStrings.InsertObject(Index: Integer; const S: string; AObject: TObject);
begin
  Insert(Index, S);
  PutObject(Index, AObject);
end;

procedure TStrings.LoadFromFile(const FileName: string);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TStrings.LoadFromFile(const FileName: string; Encoding: TEncoding);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    LoadFromStream(Stream, Encoding);
  finally
    Stream.Free;
  end;
end;

procedure TStrings.LoadFromStream(Stream: TStream);
begin
  LoadFromStream(Stream, nil);
end;

procedure TStrings.LoadFromStream(Stream: TStream; Encoding: TEncoding);
var
  Size: Integer;
  Buffer: TBytes;
begin
  BeginUpdate;
  try
    Size := Stream.Size - Stream.Position;
    SetLength(Buffer, Size);
    Stream.Read(Buffer[0], Size);
    Size := TEncoding.GetBufferEncoding(Buffer, Encoding, FDefaultEncoding);
    SetEncoding(Encoding); // Keep Encoding in case the stream is saved
    SetTextStr(Encoding.GetString(Buffer, Size, Length(Buffer) - Size));
  finally
    EndUpdate;
  end;
end;

procedure TStrings.Move(CurIndex, NewIndex: Integer);
var
  TempObject: TObject;
  TempString: string;
begin
  if CurIndex <> NewIndex then
  begin
    BeginUpdate;
    try
      TempString := Get(CurIndex);
      TempObject := GetObject(CurIndex);
      PutObject(CurIndex, nil);
      Delete(CurIndex);
      InsertObject(NewIndex, TempString, TempObject);
    finally
      EndUpdate;
    end;
  end;
end;

procedure TStrings.Put(Index: Integer; const S: string);
var
  TempObject: TObject;
begin
  TempObject := GetObject(Index);
  Delete(Index);
  InsertObject(Index, S, TempObject);
end;

procedure TStrings.PutObject(Index: Integer; AObject: TObject);
begin
end;

procedure TStrings.ReadData(Reader: TReader);
begin
  Reader.ReadListBegin;
  BeginUpdate;
  try
    Clear;
    while not Reader.EndOfList do Add(Reader.ReadString);
  finally
    EndUpdate;
  end;
  Reader.ReadListEnd;
end;

procedure TStrings.SaveToFile(const FileName: string);
begin
  SaveToFile(FileName, FEncoding);
end;

procedure TStrings.SaveToFile(const FileName: string; Encoding: TEncoding);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    SaveToStream(Stream, Encoding);
  finally
    Stream.Free;
  end;
end;

procedure TStrings.SaveToStream(Stream: TStream);
begin
  SaveToStream(Stream, FEncoding);
end;

procedure TStrings.SaveToStream(Stream: TStream; Encoding: TEncoding);
var
  Buffer, Preamble: TBytes;
begin
  if Encoding = nil then
    Encoding := FDefaultEncoding;
  Buffer := Encoding.GetBytes(GetTextStr);
  if FWriteBOM then
  begin
    Preamble := Encoding.GetPreamble;
    if Length(Preamble) > 0 then
      Stream.WriteBuffer(Preamble[0], Length(Preamble));
  end;
  Stream.WriteBuffer(Buffer[0], Length(Buffer));
end;

procedure TStrings.SetCapacity(NewCapacity: Integer);
begin
  // do nothing - descendents may optionally implement this method
end;

procedure TStrings.SetCommaText(const Value: string);
var
  LOldDefined: TStringsDefined;
  LOldDelimiter: Char;
  LOldQuoteChar: Char;
begin
  LOldDefined := FDefined;
  LOldDelimiter := FDelimiter;
  LOldQuoteChar := FQuoteChar;
  Delimiter := ',';
  QuoteChar := '"';
  try
    SetDelimitedText(Value);
  finally
    FDelimiter := LOldDelimiter;
    FQuoteChar := LOldQuoteChar;
    FDefined := LOldDefined;
  end;
end;

procedure TStrings.SetStringsAdapter(const Value: IStringsAdapter);
begin
  if FAdapter <> nil then
    FAdapter.ReleaseStrings;
  FAdapter := Value;
  if FAdapter <> nil then
    FAdapter.ReferenceStrings(Self);
end;

procedure TStrings.SetText(Text: PChar);
begin
  SetTextStr(Text);
end;

procedure TStrings.SetTextStr(const Value: string);
var
  P, Start, LB: PChar;
  S: string;
  LineBreakLen: Integer;
begin
  BeginUpdate;
  try
    Clear;
    P := Pointer(Value);
    if P <> nil then
      if CompareStr(LineBreak, sLineBreak) = 0 then
      begin
        // This is a lot faster than using StrPos/AnsiStrPos when
        // LineBreak is the default (#13#10)
        while P^ <> #0 do
        begin
          Start := P;
          while not (P^ in [#0, #10, #13]) do Inc(P);
          SetString(S, Start, P - Start);
          Add(S);
          if P^ = #13 then Inc(P);
          if P^ = #10 then Inc(P);
        end;
      end
      else
      begin
        LineBreakLen := Length(LineBreak);
        while P^ <> #0 do
        begin
          Start := P;
          LB := AnsiStrPos(P, PChar(LineBreak));
          while (P^ <> #0) and (P <> LB) do Inc(P);
          SetString(S, Start, P - Start);
          Add(S);
          if P = LB then
            Inc(P, LineBreakLen);
        end;
      end;
  finally
    EndUpdate;
  end;
end;

procedure TStrings.SetUpdateState(Updating: Boolean);
begin
end;

procedure TStrings.SetValue(const Name, Value: string);
var
  I: Integer;
begin
  I := IndexOfName(Name);
  if Value <> '' then
  begin
    if I < 0 then I := Add('');
    Put(I, Name + NameValueSeparator + Value);
  end else
  begin
    if I >= 0 then Delete(I);
  end;
end;

procedure TStrings.WriteData(Writer: TWriter);
var
  I: Integer;
begin
  Writer.WriteListBegin;
  for I := 0 to Count - 1 do Writer.WriteString(Get(I));
  Writer.WriteListEnd;
end;

procedure TStrings.SetDelimitedText(const Value: string);
var
  P, P1: PChar;
  S: string;
begin
  BeginUpdate;
  try
    Clear;
    P := PChar(Value);
    if not StrictDelimiter then
      while (P^ in [#1..' ']) do
        P := NextChar(P);
    while P^ <> #0 do
    begin
      if P^ = QuoteChar then
        S := AnsiExtractQuotedStr(P, QuoteChar)
      else
      begin
        P1 := P;
        while ((not FStrictDelimiter and (P^ > ' ')) or
              (FStrictDelimiter and (P^ <> #0))) and (P^ <> Delimiter) do
          P := NextChar(P);
        SetString(S, P1, P - P1);
      end;
      Add(S);
      if not FStrictDelimiter then
        while (P^ in [#1..' ']) do
          P := NextChar(P);

      if P^ = Delimiter then
      begin
        P1 := P;
        if NextChar(P1)^ = #0 then
          Add('');
        repeat
          P := NextChar(P);
        until not (not FStrictDelimiter and (P^ in [#1..' ']));
      end;
    end;
  finally
    EndUpdate;
  end;
end;

function TStrings.GetDelimiter: Char;
begin
  if not (sdDelimiter in FDefined) then
    Delimiter := ',';
  Result := FDelimiter;
end;

function TStrings.GetLineBreak: string;
begin
  if not (sdLineBreak in FDefined) then
    LineBreak := sLineBreak;
  Result := FLineBreak;
end;

function TStrings.GetQuoteChar: Char;
begin
  if not (sdQuoteChar in FDefined) then
    QuoteChar := '"';
  Result := FQuoteChar;
end;

function TStrings.GetStrictDelimiter: Boolean;
begin
  if not (sdStrictDelimiter in FDefined) then
    StrictDelimiter := False;
  Result := FStrictDelimiter;
end;

procedure TStrings.SetDefaultEncoding(const Value: TEncoding);
begin
  if not TEncoding.IsStandardEncoding(FDefaultEncoding) then
    FDefaultEncoding.Free;
  if TEncoding.IsStandardEncoding(Value) then
    FDefaultEncoding := Value
  else if Value <> nil then
    FDefaultEncoding := Value.Clone
  else
    FDefaultEncoding := TEncoding.Default;
end;

procedure TStrings.SetDelimiter(const Value: Char);
begin
  if (FDelimiter <> Value) or not (sdDelimiter in FDefined) then
  begin
    Include(FDefined, sdDelimiter);
    FDelimiter := Value;
  end
end;

procedure TStrings.SetEncoding(const Value: TEncoding);
begin
  if not TEncoding.IsStandardEncoding(FEncoding) then
    FEncoding.Free;
  if TEncoding.IsStandardEncoding(Value) then
    FEncoding := Value
  else if Value <> nil then
    FEncoding := Value.Clone
  else
    FEncoding := TEncoding.Default;
end;

procedure TStrings.SetLineBreak(const Value: string);
begin
  if (FLineBreak <> Value) or not (sdLineBreak in FDefined) then
  begin
    Include(FDefined, sdLineBreak);
    FLineBreak := Value;
  end
end;

procedure TStrings.SetQuoteChar(const Value: Char);
begin
  if (FQuoteChar <> Value) or not (sdQuoteChar in FDefined) then
  begin
    Include(FDefined, sdQuoteChar);
    FQuoteChar := Value;
  end
end;

procedure TStrings.SetStrictDelimiter(const Value: Boolean);
begin
  if (FStrictDelimiter <> Value) or not (sdStrictDelimiter in FDefined) then
  begin
    Include(FDefined, sdStrictDelimiter);
    FStrictDelimiter := Value;
  end
end;

function TStrings.CompareStrings(const S1, S2: string): Integer;
begin
  Result := AnsiCompareText(S1, S2);
end;

function TStrings.GetNameValueSeparator: Char;
begin
  if not (sdNameValueSeparator in FDefined) then
    NameValueSeparator := '=';
  Result := FNameValueSeparator;
end;

procedure TStrings.SetNameValueSeparator(const Value: Char);
begin
  if (FNameValueSeparator <> Value) or not (sdNameValueSeparator in FDefined) then
  begin
    Include(FDefined, sdNameValueSeparator);
    FNameValueSeparator := Value;
  end
end;

function TStrings.GetValueFromIndex(Index: Integer): string;
var
  SepPos: Integer;
begin
  if Index >= 0 then
  begin
    Result := Get(Index);
    SepPos := AnsiPos(NameValueSeparator, Result);
    if (SepPos > 0) then
      System.Delete(Result, 1, SepPos)
    else
      Result := '';
  end
  else
    Result := '';
end;

procedure TStrings.SetValueFromIndex(Index: Integer; const Value: string);
begin
  if Value <> '' then
  begin
    if Index < 0 then Index := Add('');
    Put(Index, Names[Index] + NameValueSeparator + Value);
  end
  else
    if Index >= 0 then Delete(Index);
end;

function TStrings.ToStringArray: TArray<string>;
var
  I: Integer;
begin
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
    Result[I] := Strings[I];
end;

function TStrings.ToObjectArray: TArray<TObject>;
var
  I: Integer;
begin
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
    Result[I] := Objects[I];
end;

{ TStringList }

destructor TStringList.Destroy;
var
  I: Integer;
  Temp: TArray<TObject>;
begin
  FOnChange := nil;
  FOnChanging := nil;

  // If the list owns the Objects gather them and free after the list is disposed
  if OwnsObjects then
  begin
    SetLength(Temp, FCount);
    for I := 0 to FCount - 1 do
      Temp[I] := FList[I].FObject;
  end;

  inherited Destroy;
  FCount := 0;
  SetCapacity(0);

  // Free the objects that were owned by the list
  if Length(Temp) > 0 then
    for I := 0 to Length(Temp) - 1 do
      Temp[I].Free;
end;

function TStringList.Add(const S: string): Integer;
begin
  Result := AddObject(S, nil);
end;

function TStringList.AddObject(const S: string; AObject: TObject): Integer;
begin
  if not Sorted then
    Result := FCount
  else
    if Find(S, Result) then
      case Duplicates of
        dupIgnore: Exit;
        dupError: Error(@SDuplicateString, 0);
      end;
  InsertItem(Result, S, AObject);
end;

procedure TStringList.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if Source is TStringList then
  begin
    FCaseSensitive := TStringList(Source).FCaseSensitive;
    FDuplicates := TStringList(Source).FDuplicates;
    FSorted := TStringList(Source).FSorted;
  end;
end;

procedure TStringList.Changed;
begin
  if (FUpdateCount = 0) and Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TStringList.Changing;
begin
  if (FUpdateCount = 0) and Assigned(FOnChanging) then
    FOnChanging(Self);
end;

procedure TStringList.Clear;
var
  I: Integer;
  Temp: TArray<TObject>;
begin
  if FCount <> 0 then
  begin
    Changing;

    // If the list owns the Objects gather them and free after the list is disposed
    if OwnsObjects then
    begin
      SetLength(Temp, FCount);
      for I := 0 to FCount - 1 do
        Temp[I] := FList[I].FObject;
    end;

    FCount := 0;
    SetCapacity(0);

    // Free the objects that were owned by the list
    if Length(Temp) > 0 then
      for I := 0 to Length(Temp) - 1 do
        Temp[I].Free;

    Changed;
  end;
end;

procedure TStringList.Delete(Index: Integer);
var
  Obj: TObject;
begin
  if (Index < 0) or (Index >= FCount) then Error(@SListIndexError, Index);
  Changing;
  // If this list owns its objects then free the associated TObject with this index
  if OwnsObjects then
    Obj := FList[Index].FObject
  else
    Obj := nil;

  // Direct memory writing to managed array follows
  //  see http://dn.embarcadero.com/article/33423
  // Explicitly finalize the element we about to stomp on with move
  Finalize(FList[Index]);
  Dec(FCount);
  if Index < FCount then
  begin
    System.Move(FList[Index + 1], FList[Index],
      (FCount - Index) * SizeOf(TStringItem));
    // Make sure there is no danglng pointer in the last (now unused) element
    PPointer(@FList[FCount])^ := nil;
  end;
  if Obj <> nil then
    Obj.Free;
  Changed;
end;

procedure TStringList.Exchange(Index1, Index2: Integer);
begin
  if (Index1 < 0) or (Index1 >= FCount) then Error(@SListIndexError, Index1);
  if (Index2 < 0) or (Index2 >= FCount) then Error(@SListIndexError, Index2);
  Changing;
  ExchangeItems(Index1, Index2);
  Changed;
end;

procedure TStringList.ExchangeItems(Index1, Index2: Integer);
var
  Temp: Pointer;
  Item1, Item2: PStringItem;
begin
  Item1 := @FList[Index1];
  Item2 := @FList[Index2];
  Temp := Pointer(Item1^.FString);
  Pointer(Item1^.FString) := Pointer(Item2^.FString);
  Pointer(Item2^.FString) := Temp;
  Temp := Item1^.FObject;
  Item1^.FObject := Item2^.FObject;
  Item2^.FObject := Temp;
end;

function TStringList.Find(const S: string; var Index: Integer): Boolean;
var
  L, H, I, C: Integer;
begin
  Result := False;
  L := 0;
  H := FCount - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    C := CompareStrings(FList[I].FString, S);
    if C < 0 then L := I + 1 else
    begin
      H := I - 1;
      if C = 0 then
      begin
        Result := True;
        if Duplicates <> dupAccept then L := I;
      end;
    end;
  end;
  Index := L;
end;

function TStringList.Get(Index: Integer): string;
begin
  if Cardinal(Index) >= Cardinal(FCount) then
    Error(@SListIndexError, Index);
  Result := FList[Index].FString;
end;

function TStringList.GetCapacity: Integer;
begin
  Result := FCapacity;
end;

function TStringList.GetCount: Integer;
begin
  Result := FCount;
end;

function TStringList.GetObject(Index: Integer): TObject;
begin
  if Cardinal(Index) >= Cardinal(FCount) then
    Error(@SListIndexError, Index);
  Result := FList[Index].FObject;
end;

procedure TStringList.Grow;
var
  Delta: Integer;
begin
  if FCapacity > 64 then Delta := FCapacity div 4 else
    if FCapacity > 8 then Delta := 16 else
      Delta := 4;
  SetCapacity(FCapacity + Delta);
end;

function TStringList.IndexOf(const S: string): Integer;
begin
  if not Sorted then Result := inherited IndexOf(S) else
    if not Find(S, Result) then Result := -1;
end;

procedure TStringList.Insert(Index: Integer; const S: string);
begin
  InsertObject(Index, S, nil);
end;

procedure TStringList.InsertObject(Index: Integer; const S: string;
  AObject: TObject);
begin
  if Sorted then Error(@SSortedListError, 0);
  if (Index < 0) or (Index > FCount) then Error(@SListIndexError, Index);
  InsertItem(Index, S, AObject);
end;

procedure TStringList.InsertItem(Index: Integer; const S: string; AObject: TObject);
begin
  Changing;
  if FCount = FCapacity then Grow;
  if Index < FCount then
    System.Move(FList[Index], FList[Index + 1],
      (FCount - Index) * SizeOf(TStringItem));
  with FList[Index] do
  begin
    Pointer(FString) := nil;
    FObject := AObject;
    FString := S;
  end;
  Inc(FCount);
  Changed;
end;

procedure TStringList.Put(Index: Integer; const S: string);
begin
  if Sorted then Error(@SSortedListError, 0);
  if Cardinal(Index) >= Cardinal(FCount) then
    Error(@SListIndexError, Index);
  Changing;
  FList[Index].FString := S;
  Changed;
end;

procedure TStringList.PutObject(Index: Integer; AObject: TObject);
begin
  if Cardinal(Index) >= Cardinal(FCount) then
    Error(@SListIndexError, Index);
  Changing;
  FList[Index].FObject := AObject;
  Changed;
end;

procedure TStringList.QuickSort(L, R: Integer; SCompare: TStringListSortCompare);
var
  I, J, P: Integer;
begin
  repeat
    I := L;
    J := R;
    P := (L + R) shr 1;
    repeat
      while SCompare(Self, I, P) < 0 do Inc(I);
      while SCompare(Self, J, P) > 0 do Dec(J);
      if I <= J then
      begin
        if I <> J then
          ExchangeItems(I, J);
        if P = I then
          P := J
        else if P = J then
          P := I;
        Inc(I);
        Dec(J);
      end;
    until I > J;
    if L < J then QuickSort(L, J, SCompare);
    L := I;
  until I >= R;
end;

procedure TStringList.SetCapacity(NewCapacity: Integer);
begin
  if NewCapacity < FCount then
    Error(@SListCapacityError, NewCapacity);
  if NewCapacity <> FCapacity then
  begin
    SetLength(FList, NewCapacity);
    FCapacity := NewCapacity;
  end;
end;

procedure TStringList.SetSorted(Value: Boolean);
begin
  if FSorted <> Value then
  begin
    if Value then Sort;
    FSorted := Value;
  end;
end;

procedure TStringList.SetUpdateState(Updating: Boolean);
begin
  if Updating then Changing else Changed;
end;

function StringListCompareStrings(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result := List.CompareStrings(List.FList[Index1].FString,
                                List.FList[Index2].FString);
end;

procedure TStringList.Sort;
begin
  CustomSort(StringListCompareStrings);
end;

procedure TStringList.CustomSort(Compare: TStringListSortCompare);
begin
  if not Sorted and (FCount > 1) then
  begin
    Changing;
    QuickSort(0, FCount - 1, Compare);
    Changed;
  end;
end;

function TStringList.CompareStrings(const S1, S2: string): Integer;
begin
  if CaseSensitive then
    Result := AnsiCompareStr(S1, S2)
  else
    Result := AnsiCompareText(S1, S2);
end;

constructor TStringList.Create;
begin
  inherited Create;
end;

constructor TStringList.Create(OwnsObjects: Boolean);
begin
  inherited Create;
  FOwnsObject := OwnsObjects;
end;

procedure TStringList.SetCaseSensitive(const Value: Boolean);
begin
  if Value <> FCaseSensitive then
  begin
    FCaseSensitive := Value;
    if Sorted then
    begin
      // Calling Sort won't sort the list because CustomSort will
      // only sort the list if it's not already sorted
      Sorted := False;
      Sorted := True;
    end;
  end;
end;

const
  Dummy32bitResHeader: array[0..31] of Byte = (
    $00, $00, $00, $00, $20, $00, $00, $00, $FF, $FF, $00, $00, $FF, $FF, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00);

{ TStream }

function TStream.GetPosition: Int64;
begin
  Result := Seek(0, soCurrent);
end;

procedure TStream.SetPosition(const Pos: Int64);
begin
  Seek(Pos, soBeginning);
end;

function TStream.GetSize: Int64;
var
  Pos: Int64;
begin
  Pos := Seek(0, soCurrent);
  Result := Seek(0, soEnd);
  Seek(Pos, soBeginning);
end;

procedure TStream.SetSize(NewSize: Longint);
begin
  // default = do nothing  (read-only streams, etc)
  // descendents should implement this method to call the Int64 sibling
end;

procedure TStream.SetSize64(const NewSize: Int64);
begin
  SetSize(NewSize);
end;

procedure TStream.SetSize(const NewSize: Int64);
begin
{ For compatibility with old stream implementations, this new 64 bit SetSize
  calls the old 32 bit SetSize.  Descendent classes that override this
  64 bit SetSize MUST NOT call inherited. Descendent classes that implement
  64 bit SetSize should reimplement their 32 bit SetSize to call their 64 bit
  version.}
  if (NewSize < Low(Longint)) or (NewSize > High(Longint)) then
    raise ERangeError.CreateRes(@SRangeError);
  SetSize(Longint(NewSize));
end;

function TStream.Seek(Offset: Longint; Origin: Word): Longint;

  procedure RaiseException;
  begin
    raise EStreamError.CreateResFmt(@sSeekNotImplemented, [Classname]);
  end;

type
  TSeek64 = function (const Offset: Int64; Origin: TSeekOrigin): Int64 of object;
var
  Impl: TSeek64;
  Base: TSeek64;
  ClassTStream: TClass;
begin
{ Deflect 32 seek requests to the 64 bit seek, if 64 bit is implemented.
  No existing TStream classes should call this method, since it was originally
  abstract.  Descendent classes MUST implement at least one of either
  the 32 bit or the 64 bit version, and must not call the inherited
  default implementation. }
  Impl := Seek;
  ClassTStream := Self.ClassType;
  while (ClassTStream <> nil) and (ClassTStream <> TStream) do
    ClassTStream := ClassTStream.ClassParent;
  if ClassTStream = nil then RaiseException;
  Base := TStream(@ClassTStream).Seek;
  if TMethod(Impl).Code = TMethod(Base).Code then
    RaiseException;
  Result := Seek(Int64(Offset), TSeekOrigin(Origin));
end;

function TStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
{ Default implementation of 64 bit seek is to deflect to existing 32 bit seek.
  Descendents that override 64 bit seek must not call this default implementation. }
  if (Offset < Low(Longint)) or (Offset > High(Longint)) then
    raise ERangeError.CreateRes(@SRangeError);
  Result := Seek(Longint(Offset), Ord(Origin));
end;

procedure TStream.ReadBuffer(var Buffer; Count: Longint);
var
  LTotalCount,
  LReadCount: Longint;
begin
  { Perform a read directly. Most of the time this will succeed
    without the need to go into the WHILE loop. }
  LTotalCount := Read(Buffer, Count);

  while (LTotalCount < Count) do
  begin
    { Try to read a contiguous block of <Count> size }
    LReadCount := Read(PByte(PByte(@Buffer) + LTotalCount)^,
      (Count - LTotalCount));

    { Check if we read something and decrease the number of bytes left to read }
    if LReadCount <= 0 then
      raise EReadError.CreateRes(@SReadError)
    else
      Inc(LTotalCount, LReadCount);
  end
end;

procedure TStream.WriteBuffer(const Buffer; Count: Longint);
var
  LTotalCount,
    LWrittenCount: Longint;
begin
  { Perform a write directly. Most of the time this will succeed
    without the need to go into the WHILE loop. }
  LTotalCount := Write(Buffer, Count);

  while (LTotalCount < Count) do
  begin
    { Try to read a contiguous block of <Count> size }
    LWrittenCount := Write(PByte(PByte(@Buffer) + LTotalCount)^,
      (Count - LTotalCount));

    { Check if we written something and decrease the number of bytes left to read }
    if LWrittenCount <= 0 then
      raise EWriteError.CreateRes(@SReadError)
    else
      Inc(LTotalCount, LWrittenCount);
  end
end;

function TStream.CopyFrom(Source: TStream; Count: Int64): Int64;
const
  MaxBufSize = $F000;
var
  BufSize, N: Integer;
  Buffer: PByte;
begin
  if Count = 0 then
  begin
    Source.Position := 0;
    Count := Source.Size;
  end;
  Result := Count;
  if Count > MaxBufSize then BufSize := MaxBufSize else BufSize := Count;
  GetMem(Buffer, BufSize);
  try
    while Count <> 0 do
    begin
      if Count > BufSize then N := BufSize else N := Count;
      Source.ReadBuffer(Buffer^, N);
      WriteBuffer(Buffer^, N);
      Dec(Count, N);
    end;
  finally
    FreeMem(Buffer, BufSize);
  end;
end;

function TStream.ReadComponent(Instance: TComponent): TComponent;
var
  Reader: TReader;
begin
  Reader := TReader.Create(Self, 4096);
  try
    Result := Reader.ReadRootComponent(Instance);
  finally
    Reader.Free;
  end;
end;

procedure TStream.WriteComponent(Instance: TComponent);
begin
  WriteDescendent(Instance, nil);
end;

procedure TStream.WriteDescendent(Instance, Ancestor: TComponent);
var
  Writer: TWriter;
begin
  Writer := TWriter.Create(Self, 4096);
  try
    Writer.WriteDescendent(Instance, Ancestor);
  finally
    Writer.Free;
  end;
end;

function TStream.ReadComponentRes(Instance: TComponent): TComponent;
begin
  ReadResHeader;
  Result := ReadComponent(Instance);
end;

procedure TStream.WriteComponentRes(const ResName: string; Instance: TComponent);
begin
  WriteDescendentRes(ResName, Instance, nil);
end;

procedure TStream.WriteResourceHeader(const ResName: string; out FixupInfo: Integer);
var
  L, HeaderSize: Integer;
  NameBytes: TBytes;
  Header: array[0..255] of Byte;
begin
  NameBytes := TEncoding.UTF8.GetBytes(UpperCase(ResName));
  if Length(NameBytes) > Length(ResName) then
  begin
    NameBytes := TEncoding.Unicode.GetBytes(UpperCase(ResName));
    L := Length(NameBytes);
    if L div 2 > 63 then
      L := 63 * 2;
    SetLength(NameBytes, L + 2);
    PWord(@NameBytes[L])^ := 0;
    WriteBuffer(Dummy32bitResHeader, Length(Dummy32bitResHeader));
    FixupInfo := -(Position + 4);
    PInteger(@Header[0])^ := 0;
    PInteger(@Header[4])^ := 12 + L + 2 + 16;
    PInteger(@Header[8])^ := $000AFFFF;
    L := 12 + Length(NameBytes);
    Move(NameBytes[0], Header[12], Length(NameBytes));
    PInteger(@Header[L])^      := 0; // Data Version
    PWord(@Header[L + 4])^     := 0; // MemoryFlags
    PWord(@Header[L + 6])^     := $0409; // LangID - for now just use US as the language ID
    PInteger(@Header[L + 8])^  := 0; // Version
    PInteger(@Header[L + 12])^ := 0; // Characteristics
    WriteBuffer(Header, L + 16);
  end else
  begin
    Header[0] := $FF;
    Word((@Header[1])^) := 10;
    L := Length(NameBytes);
    if L > 63 then
      L := 64;
    SetLength(NameBytes, L + 1);
    NameBytes[L] := 0;
    Move(NameBytes[0], Header[3], Length(NameBytes));
    HeaderSize := Length(NameBytes) + 9;
    Word((@Header[HeaderSize - 6])^) := $1030;
    Longint((@Header[HeaderSize - 4])^) := 0;
    WriteBuffer(Header, HeaderSize);
    FixupInfo := Position;
  end;
end;

procedure TStream.FixupResourceHeader(FixupInfo: Integer);
var
  ImageSize, HeaderSize: Integer;
begin
  if FixupInfo < 0 then
  begin
    ImageSize := Position - (-FixupInfo);
    Position := -FixupInfo;
    ReadBuffer(HeaderSize, SizeOf(HeaderSize));
    ImageSize := ImageSize - HeaderSize + 4;
    Position := -FixupInfo - 4;
    WriteBuffer(ImageSize, SizeOf(ImageSize));
    Position := -FixupInfo + ImageSize + HeaderSize - 4;
  end else
  begin
    ImageSize := Position - FixupInfo;
    Position := FixupInfo - 4;
    WriteBuffer(ImageSize, SizeOf(Longint));
    Position := FixupInfo + ImageSize;
  end;
end;

procedure TStream.WriteDescendentRes(const ResName: string; Instance,
  Ancestor: TComponent);
var
  FixupInfo: Integer;
begin
  WriteResourceHeader(ResName, FixupInfo);
  WriteDescendent(Instance, Ancestor);
  FixupResourceHeader(FixupInfo);
end;

procedure TStream.ReadResHeader;
var
  ReadCount: Cardinal;
  Header: array[0..255] of AnsiChar;
begin
  FillChar(Header, SizeOf(Header), 0);
  ReadCount := Read(Header, SizeOf(Header) - 1);
  if (Integer(ReadCount) > Length(Dummy32bitResHeader)) and
    CompareMem(@Dummy32bitResHeader, @Header, Length(Dummy32bitResHeader)) then
  begin
    Seek(Length(Dummy32bitResHeader), soFromBeginning);
    ReadCount := Read(Header, SizeOf(Header) - 1);
    if Longint((@Header[8])^) = $000AFFFF then
      Seek(Cardinal((@Header[4])^) - ReadCount, soFromCurrent)
    else
      raise EInvalidImage.CreateRes(@SInvalidImage);
  end
  else if (Byte((@Header[0])^) = $FF) and (Word((@Header[1])^) = 10) then
    Seek(StrLen(Header + 3) + 10 - ReadCount, soFromCurrent)
  else
    raise EInvalidImage.CreateRes(@SInvalidImage);
end;

{ THandleStream }

constructor THandleStream.Create(AHandle: THandle);
begin
  inherited Create;
  FHandle := AHandle;
end;

function THandleStream.Read(var Buffer; Count: Longint): Longint;
begin
  Result := FileRead(FHandle, Buffer, Count);
  if Result = -1 then Result := 0;
end;

function THandleStream.Write(const Buffer; Count: Longint): Longint;
begin
  Result := FileWrite(FHandle, Buffer, Count);
  if Result = -1 then Result := 0;
end;

function THandleStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
  Result := FileSeek(FHandle, Offset, Ord(Origin));
end;

procedure THandleStream.SetSize(NewSize: Longint);
begin
  SetSize(Int64(NewSize));
end;

procedure THandleStream.SetSize(const NewSize: Int64);
begin
  Seek(NewSize, soBeginning);
{$IFDEF MSWINDOWS}
  Win32Check(SetEndOfFile(FHandle));
{$ENDIF}
{$IFDEF POSIX}
  if ftruncate(FHandle, Position) = -1 then
    raise EStreamError(sStreamSetSize);
{$ENDIF}
end;

{ TFileStream }

constructor TFileStream.Create(const AFileName: string; Mode: Word);
begin
{$IFDEF MSWINDOWS}
  Create(AFilename, Mode, 0);
{$ENDIF}
{$IFDEF POSIX}
  Create(AFilename, Mode, FileAccessRights);
{$ENDIF}
end;

constructor TFileStream.Create(const AFileName: string; Mode: Word; Rights: Cardinal);
var
  LShareMode: Word;
begin
  if (Mode and fmCreate = fmCreate) then
  begin
    LShareMode := Mode and $FF;
    if LShareMode = $FF then
      LShareMode := fmShareExclusive; // For compat in case $FFFF passed as Mode
    inherited Create(FileCreate(AFileName, LShareMode, Rights));
    if FHandle = INVALID_HANDLE_VALUE then
      raise EFCreateError.CreateResFmt(@SFCreateErrorEx, [ExpandFileName(AFileName), SysErrorMessage(GetLastError)]);
  end
  else
  begin
    inherited Create(FileOpen(AFileName, Mode));
    if FHandle = INVALID_HANDLE_VALUE then
      raise EFOpenError.CreateResFmt(@SFOpenErrorEx, [ExpandFileName(AFileName), SysErrorMessage(GetLastError)]);
  end;
  FFileName := AFileName;
end;

destructor TFileStream.Destroy;
begin
  if FHandle <> INVALID_HANDLE_VALUE then
    FileClose(FHandle);
  inherited Destroy;
end;

{ TCustomMemoryStream }

procedure TCustomMemoryStream.SetPointer(Ptr: Pointer; const Size: NativeInt);
begin
  FMemory := Ptr;
  FSize := Size;
end;

function TCustomMemoryStream.Read(var Buffer; Count: Longint): Longint;
begin
  if (FPosition >= 0) and (Count >= 0) then
  begin
    Result := FSize - FPosition;
    if Result > 0 then
    begin
      if Result > Count then Result := Count;
      Move((PByte(FMemory) + FPosition)^, Buffer, Result);
      Inc(FPosition, Result);
      Exit;
    end;
  end;
  Result := 0;
end;

function TCustomMemoryStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
  case Origin of
    soBeginning: FPosition := Offset;
    soCurrent: Inc(FPosition, Offset);
    soEnd: FPosition := FSize + Offset;
  end;
  Result := FPosition;
end;

procedure TCustomMemoryStream.SaveToStream(Stream: TStream);
begin
  if FSize <> 0 then Stream.WriteBuffer(FMemory^, FSize);
end;

procedure TCustomMemoryStream.SaveToFile(const FileName: string);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    SaveToStream(Stream);
  finally
    Stream.Free;
  end;
end;

{ TMemoryStream }

const
  MemoryDelta = $2000; { Must be a power of 2 }

destructor TMemoryStream.Destroy;
begin
  Clear;
  inherited Destroy;
end;

procedure TMemoryStream.Clear;
begin
  SetCapacity(0);
  FSize := 0;
  FPosition := 0;
end;

procedure TMemoryStream.LoadFromStream(Stream: TStream);
var
  Count: Longint;
begin
  Stream.Position := 0;
  Count := Stream.Size;
  SetSize(Count);
  if Count <> 0 then Stream.ReadBuffer(FMemory^, Count);
end;

procedure TMemoryStream.LoadFromFile(const FileName: string);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TMemoryStream.SetCapacity(NewCapacity: Longint);
begin
  SetPointer(Realloc(NewCapacity), FSize);
  FCapacity := NewCapacity;
end;

procedure TMemoryStream.SetSize(NewSize: Longint);
var
  OldPosition: Longint;
begin
  OldPosition := FPosition;
  SetCapacity(NewSize);
  FSize := NewSize;
  if OldPosition > NewSize then Seek(0, soFromEnd);
end;

function TMemoryStream.Realloc(var NewCapacity: Longint): Pointer;
begin
  if (NewCapacity > 0) and (NewCapacity <> FSize) then
    NewCapacity := (NewCapacity + (MemoryDelta - 1)) and not (MemoryDelta - 1);
  Result := Memory;
  if NewCapacity <> FCapacity then
  begin
    if NewCapacity = 0 then
    begin
      FreeMem(Memory);
      Result := nil;
    end else
    begin
      if Capacity = 0 then
        GetMem(Result, NewCapacity)
      else
        ReallocMem(Result, NewCapacity);
      if Result = nil then raise EStreamError.CreateRes(@SMemoryStreamError);
    end;
  end;
end;

function TMemoryStream.Write(const Buffer; Count: Longint): Longint;
var
  Pos: Longint;
begin
  if (FPosition >= 0) and (Count >= 0) then
  begin
    Pos := FPosition + Count;
    if Pos > 0 then
    begin
      if Pos > FSize then
      begin
        if Pos > FCapacity then
          SetCapacity(Pos);
        FSize := Pos;
      end;
      System.Move(Buffer, (PByte(FMemory) + FPosition)^, Count);
      FPosition := Pos;
      Result := Count;
      Exit;
    end;
  end;
  Result := 0;
end;

{ TBytesStream }

constructor TBytesStream.Create(const ABytes: TBytes);
begin
  inherited Create;
  FBytes := ABytes;
  SetPointer(Pointer(FBytes), Length(FBytes));
  FCapacity := FSize;
end;

function TBytesStream.Realloc(var NewCapacity: Integer): Pointer;
begin
  if (NewCapacity > 0) and (NewCapacity <> FSize) then
    NewCapacity := (NewCapacity + (MemoryDelta - 1)) and not (MemoryDelta - 1);
  Result := Pointer(FBytes);
  if NewCapacity <> FCapacity then
  begin
    SetLength(FBytes, NewCapacity);
    Result := Pointer(FBytes);
    if NewCapacity = 0 then
      Exit;
    if Result = nil then raise EStreamError.CreateRes(@SMemoryStreamError);
  end;
end;

{$IFDEF UNICODE}

{ TStringStream }

constructor TStringStream.Create(const AString: string);
begin
  Create(AString, TEncoding.Default, False);
end;

constructor TStringStream.Create(const AString: string; AEncoding: TEncoding;
  AOwnsEncoding: Boolean);
begin
  FEncoding := AEncoding;
  FOwnsEncoding := AOwnsEncoding and not TEncoding.IsStandardEncoding(AEncoding);
  inherited Create(FEncoding.GetBytes(AString));
end;

constructor TStringStream.Create(const AString: string; ACodePage: Integer);
begin
  Create(AString, TEncoding.GetEncoding(ACodePage));
end;

constructor TStringStream.Create(const ABytes: TBytes);
begin
  inherited;

  FEncoding := nil;
  TEncoding.GetBufferEncoding(ABytes, FEncoding);
end;

constructor TStringStream.Create;
begin
  Create('', TEncoding.Default, False);
end;

constructor TStringStream.Create(const AString: RawByteString);
var
  LCodePage: Cardinal;
begin
  LCodePage := StringCodePage(AString);
  if (LCodePage = CP_ACP) or (LCodePage = TEncoding.Default.CodePage) then
    FEncoding := TEncoding.Default
  else
  begin
    FEncoding := TEncoding.GetEncoding(LCodePage);
    FOwnsEncoding := True;
  end;
  inherited Create(BytesOf(AString));
end;

destructor TStringStream.Destroy;
begin
  if FOwnsEncoding then
    FEncoding.Free;
  inherited;
end;

function TStringStream.GetDataString: string;
begin
  Result := FEncoding.GetString(Bytes, 0, Size);
end;

function TStringStream.ReadString(Count: Integer): string;
begin
  if Count > Size - Position then
    Count := Size - Position;
  Result := FEncoding.GetString(Bytes, Position, Count);
  Position := Position + Count;
end;

procedure TStringStream.WriteString(const AString: string);
var
  LBytes: TBytes;
begin
  LBytes := FEncoding.GetBytes(AString);
  Write(LBytes[0], Length(LBytes));
end;

{$ELSE}

{ TStringStream }

constructor TStringStream.Create(const AString: string);
begin
  inherited Create;
  FDataString := AString;
end;

function TStringStream.Read(var Buffer; Count: Longint): Longint;
begin
  Result := Length(FDataString) - FPosition;
  if Result > Count then Result := Count;
  Move(PChar(@FDataString[FPosition + SizeOf(Char)])^, Buffer, Result * SizeOf(Char));
  Inc(FPosition, Result);
end;

function TStringStream.Write(const Buffer; Count: Longint): Longint;
begin
  Result := Count;
  SetLength(FDataString, (FPosition + Result));
  Move(Buffer, PChar(@FDataString[FPosition + SizeOf(Char)])^, Result * SizeOf(Char));
  Inc(FPosition, Result);
end;

function TStringStream.Seek(Offset: Longint; Origin: Word): Longint;
begin
  case Origin of
    soFromBeginning: FPosition := Offset;
    soFromCurrent: FPosition := FPosition + Offset;
    soFromEnd: FPosition := Length(FDataString) - Offset;
  end;
  if FPosition > Length(FDataString) then
    FPosition := Length(FDataString)
  else if FPosition < 0 then FPosition := 0;
  Result := FPosition;
end;

function TStringStream.ReadString(Count: Longint): string;
var
  Len: Integer;
begin
  Len := Length(FDataString) - FPosition;
  if Len > Count then Len := Count;
  SetString(Result, PChar(@FDataString[FPosition + SizeOf(Char)]), Len);
  Inc(FPosition, Len);
end;

procedure TStringStream.WriteString(const AString: string);
begin
  Write(PChar(AString)^, Length(AString));
end;

procedure TStringStream.SetSize(NewSize: Longint);
begin
  SetLength(FDataString, NewSize);
  if FPosition > NewSize then FPosition := NewSize;
end;

{$ENDIF}

{ TResourceStream }

constructor TResourceStream.Create(Instance: THandle; const ResName: string;
  ResType: PChar);
begin
  inherited Create;
  Initialize(Instance, PChar(ResName), ResType, False);
end;

constructor TResourceStream.CreateFromID(Instance: THandle; ResID: Integer;
  ResType: PChar);
begin
  inherited Create;
  Initialize(Instance, PChar(ResID), ResType, True);
end;

procedure TResourceStream.Initialize(Instance: THandle; Name, ResType: PChar;
  FromID: Boolean);

  procedure Error;
  var
    S: string;
  begin
    if FromID then
      S := IntToStr(IntPtr(Name))
    else
      S := Name;
    raise EResNotFound.CreateFmt(SResNotFound, [S]);
  end;

begin
  HResInfo := FindResource(Instance, Name, ResType);
  if HResInfo = 0 then Error;
  HGlobal := LoadResource(Instance, HResInfo);
  if HGlobal = 0 then Error;
  SetPointer(LockResource(HGlobal), SizeOfResource(Instance, HResInfo));
end;

destructor TResourceStream.Destroy;
begin
  UnlockResource(HGlobal);
  FreeResource(HGlobal);
  inherited Destroy;
end;

function TResourceStream.Write(const Buffer; Count: Longint): Longint;
begin
  raise EStreamError.CreateRes(@SCantWriteResourceStreamError);
end;

{ TFiler }

constructor TFiler.Create(Stream: TStream; BufSize: Integer);
begin
  FStream := Stream;
  GetMem(FBuffer, BufSize);
  FBufSize := BufSize;
end;

destructor TFiler.Destroy;
begin
  if FBuffer <> nil then FreeMem(FBuffer, FBufSize);
end;

procedure TFiler.SetRoot(Value: TComponent);
begin
  FRoot := Value;
end;

{ TPropFixup }

type
  TPropFixup = class
    FInstance: TPersistent;
    FInstanceRoot: TComponent;
    FPropInfo: PPropInfo;
    FRootName: string;
    FName: string;
    constructor Create(Instance: TPersistent; InstanceRoot: TComponent;
      PropInfo: PPropInfo; const RootName, Name: string);
    function MakeGlobalReference: Boolean;
    procedure ResolveReference(Reference: Pointer); virtual;
  end;

  TPropIntfFixup = class(TPropFixup)
    procedure ResolveReference(Reference: Pointer); override;
  end;

var
  GlobalFixupList: TThreadList;

constructor TPropFixup.Create(Instance: TPersistent; InstanceRoot: TComponent;
  PropInfo: PPropInfo; const RootName, Name: string);
begin
  FInstance := Instance;
  FInstanceRoot := InstanceRoot;
  FPropInfo := PropInfo;
  FRootName := RootName;
  FName := Name;
end;

function TPropFixup.MakeGlobalReference: Boolean;
var
  S: PChar;
  P: PChar;
begin
  Result := False;
  S := PChar(FName);
  P := S;
  while not (P^ in ['.', #0]) do Inc(P);
  if P^ = #0 then Exit;
  SetString(FRootName, S, P - S);
  Delete(FName, 1, P - S + 1);
  Result := True;
end;

procedure TPropFixup.ResolveReference(Reference: Pointer);
begin
  SetOrdProp(FInstance, FPropInfo, IntPtr(Reference));
end;

procedure TPropIntfFixup.ResolveReference(Reference: Pointer);
var
  Intf: IInterface;
begin
  Intf := nil;
  if Reference <> nil then
    if not Supports(TObject(Reference), GetTypeData(FPropInfo^.PropType^)^.Guid, Intf) then
      Intf := nil;
  SetInterfaceProp(FInstance, FPropInfo, Intf);
end;

function FindNestedComponent(Root: TComponent; const NamePath: string): TComponent;
var
  Current, Found: TComponent;
  S, P: PChar;
  Name: string;
begin
  Result := nil;
  if NamePath = '' then Exit;
  Current := Root;
  P := PChar(NamePath);
  while P^ <> #0 do
  begin
    S := P;
    while not (P^ in ['.', '-', #0]) do Inc(P);
    SetString(Name, S, P - S);
    Found := Current.FindComponent(Name);
    if (Found = nil) and SameText(Name, 'Owner') then                           { Do not translate }
      Found := Current;
    if Found = nil then Exit;
    if P^ = '.' then Inc(P);
    if P^ = '-' then Inc(P);
    if P^ = '>' then Inc(P);
    Current := Found;
  end;
  Result := Current;
end;

procedure GlobalFixupReferences;
var
  FinishedList: TList;
  NotFinishedList: TList;
  GlobalList: TList;
  I: Integer;
  Root: TComponent;
  Instance: TPersistent;
  Reference: Pointer;

  procedure AddFinished(Instance: TPersistent);
  begin
    if (FinishedList.IndexOf(Instance) < 0) and
      (NotFinishedList.IndexOf(Instance) >= 0) then
      FinishedList.Add(Instance);
  end;

  procedure AddNotFinished(Instance: TPersistent);
  var
    Index: Integer;
  begin
    Index := FinishedList.IndexOf(Instance);
    if Index <> -1 then FinishedList.Delete(Index);
    if NotFinishedList.IndexOf(Instance) < 0 then
      NotFinishedList.Add(Instance);
  end;

begin
  // Fixup resolution requires a stable component / name space
  // Block construction and destruction of forms / datamodules during fixups
  GlobalNameSpace.BeginWrite;
  try
    GlobalList := GlobalFixupList.LockList;
    try
      if GlobalList.Count > 0 then
      begin
         FinishedList := TList.Create;
        try
          NotFinishedList := TList.Create;
          try
            I := 0;
            while I < GlobalList.Count do
              with TPropFixup(GlobalList[I]) do
              begin
                Root := FindGlobalComponent(FRootName);
                if (Root <> nil) or (GetOrdProp(FInstance, FPropInfo) <> 0) then
                begin
                  if Root <> nil then
                    if not (csReading in Root.ComponentState) then
                    begin
                      Reference := FindNestedComponent(Root, FName);
                      ResolveReference(Reference);
                    end
                    else
                    begin
                      AddNotFinished(FInstance);
                      Inc(I);
                      Continue;
                    end;
                  AddFinished(FInstance);
                  GlobalList.Delete(I);
                  Free;
                end else
                begin
                  AddNotFinished(FInstance);
                  Inc(I);
                end;
              end;
          finally
            NotFinishedList.Free;
          end;
          for I := 0 to FinishedList.Count - 1 do
          begin
            Instance := FinishedList[I];
            if Instance is TComponent then
              Exclude(TComponent(Instance).FComponentState, csFixups);
          end;
        finally
          FinishedList.Free;
        end;
      end;
    finally
      GlobalFixupList.UnlockList;
    end;
  finally
    GlobalNameSpace.EndWrite;
  end;
end;

function NameInStrings(Strings: TStrings; const Name: string): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 0 to Strings.Count - 1 do
    if SameText(Name, Strings[I]) then Exit;
  Result := False;
end;

procedure GetFixupReferenceNames(Root: TComponent; Names: TStrings);
var
  I: Integer;
  Fixup: TPropFixup;
begin
  with GlobalFixupList.LockList do
  try
    for I := 0 to Count - 1 do
    begin
      Fixup := Items[I];
      if ((Root = nil) or (Fixup.FInstanceRoot = Root)) and
        not NameInStrings(Names, Fixup.FRootName) then
        Names.Add(Fixup.FRootName);
    end;
  finally
    GlobalFixupList.UnlockList;
  end;
end;

procedure RedirectFixupReferences(Root: TComponent; const OldRootName,
  NewRootName: string);
var
  I: Integer;
  Fixup: TPropFixup;
begin
  with GlobalFixupList.LockList do
  try
    for I := 0 to Count - 1 do
    begin
      Fixup := Items[I];
      if ((Root = nil) or (Fixup.FInstanceRoot = Root)) and
        SameText(OldRootName, Fixup.FRootName) then
        Fixup.FRootName := NewRootName;
    end;
    GlobalFixupReferences;
  finally
    GlobalFixupList.Unlocklist;
  end;
end;

procedure RemoveFixupReferences(Root: TComponent; const RootName: string);
var
  I: Integer;
  Fixup: TPropFixup;
begin
  if GlobalFixupList = nil then Exit;
  with GlobalFixupList.LockList do
  try
    for I := Count - 1 downto 0 do
    begin
      Fixup := Items[I];
      if ((Root = nil) or (Fixup.FInstanceRoot = Root)) and
        ((RootName = '') or SameText(RootName, Fixup.FRootName)) then
      begin
        Delete(I);
        Fixup.Free;
      end;
    end;
  finally
    GlobalFixupList.UnlockList;
  end;
end;

procedure RemoveFixups(Instance: TPersistent);
var
  I: Integer;
  Fixup: TPropFixup;
begin
  if GlobalFixupList = nil then Exit;
  with GlobalFixupList.LockList do
  try
    for I := Count - 1 downto 0 do
    begin
      Fixup := Items[I];
      if (Fixup.FInstance = Instance) then
      begin
        Delete(I);
        Fixup.Free;
      end;
    end;
  finally
    GlobalFixupList.UnlockList;
  end;
end;

procedure GetFixupInstanceNames(Root: TComponent;
  const ReferenceRootName: string; Names: TStrings);
var
  I: Integer;
  Fixup: TPropFixup;
begin
  with GlobalFixupList.LockList do
  try
    for I := 0 to Count - 1 do
    begin
      Fixup := Items[I];
      if (Fixup.FInstanceRoot = Root) and
        SameText(ReferenceRootName, Fixup.FRootName) and
        not NameInStrings(Names, Fixup.FName) then
        Names.Add(Fixup.FName);
    end;
  finally
    GlobalFixupList.UnlockList;
  end;
end;

{ TReader }

procedure ReadError(Ident: PResStringRec);
begin
  raise EReadError.CreateRes(Ident);
end;

procedure PropValueError;
begin
  ReadError(@SInvalidPropertyValue);
end;

procedure PropertyNotFound(const Name: string);
begin
  raise EReadError.CreateResFmt(@SUnknownProperty, [Name]);
end;

function EnumValue(EnumType: PTypeInfo; const EnumName: string): Integer;
begin
  Result := GetEnumValue(EnumType, EnumName);
  if Result = -1 then PropValueError;
end;

function SetElementValue(EnumType: PTypeInfo; const EnumName: string): Integer;
begin
  Result := GetSetElementValue(EnumType, EnumName);
  if Result = -1 then PropValueError;
end;

destructor TReader.Destroy;
begin
  FStream.Seek(Integer(FBufPos) - Integer(FBufEnd), 1);
  inherited Destroy;
end;

procedure TReader.BeginReferences;
begin
  FLoaded := TList.Create;
  try
    FFixups := TList.Create;
  except
    FLoaded.Free;
    raise;
  end;
end;

procedure TReader.CheckValue(Value: TValueType);
begin
  if ReadValue <> Value then
  begin
    Dec(FBufPos);
    SkipValue;
    PropValueError;
  end;
end;

procedure TReader.DefineProperty(const Name: string;
  ReadData: TReaderProc; WriteData: TWriterProc; HasData: Boolean);
begin
  if SameText(Name, FPropName) and Assigned(ReadData) then
  begin
    ReadData(Self);
    FPropName := '';
  end;
end;

procedure TReader.DefineBinaryProperty(const Name: string;
  ReadData, WriteData: TStreamProc; HasData: Boolean);
var
  Stream: TMemoryStream;
  Count: Longint;
begin
  if SameText(Name, FPropName) and Assigned(ReadData) then
  begin
    if ReadValue <> vaBinary then
    begin
      Dec(FBufPos);
      SkipValue;
      FCanHandleExcepts := True;
      PropValueError;
    end;
    Stream := TMemoryStream.Create;
    try
      Read(Count, SizeOf(Count));
      Stream.SetSize(Count);
      Read(Stream.Memory^, Count);
      FCanHandleExcepts := True;
      ReadData(Stream);
    finally
      Stream.Free;
    end;
    FPropName := '';
  end;
end;

function TReader.EndOfList: Boolean;
begin
  Result := ReadValue = vaNull;
  Dec(FBufPos);
end;

procedure TReader.EndReferences;
begin
  FreeFixups;
  FLoaded.Free;
  FLoaded := nil;
end;

function TReader.Error(const Message: string): Boolean;
begin
  Result := False;
  if Assigned(FOnError) then FOnError(Self, Message, Result);
end;

function TReader.FindMethodInstance(Root: TComponent; const MethodName: string): TMethod;
var
  Error: Boolean;
begin
  if Assigned(FOnFindMethodInstance) then
  begin
    Result.Code := Root.MethodAddress(MethodName);
    Result.Data := Root;
    Error := Result.Code = nil;
    FOnFindMethodInstance(Self, MethodName, Result, Error);
  end else
    Error := True;
  if Error then
  begin
    Result.Data := Root;
    Result.Code := FindMethod(Root, MethodName);
  end;
end;

function TReader.FindMethod(Root: TComponent;
  const MethodName: string): Pointer;
var
  Error: Boolean;
begin
  Result := Root.MethodAddress(MethodName);
  Error := Result = nil;
  if Assigned(FOnFindMethod) then FOnFindMethod(Self, MethodName, Result, Error);
  if Error then PropValueError;
end;

procedure RemoveGlobalFixup(Fixup: TPropFixup);
var
  I: Integer;
begin
  with GlobalFixupList.LockList do
  try
    for I := Count-1 downto 0 do
      with TPropFixup(Items[I]) do
        if (FInstance = Fixup.FInstance) and (FPropInfo = Fixup.FPropInfo) then
        begin
          Free;
          Delete(I);
        end;
  finally
    GlobalFixupList.UnlockList;
  end;
end;

procedure TReader.DoFixupReferences;
var
  I: Integer;
  CompName: string;
  Reference: Pointer;
begin
  if FFixups <> nil then
    try
      for I := 0 to FFixups.Count - 1 do
        with TPropFixup(FFixups[I]) do
        begin
          CompName := FName;
          ReferenceName(CompName);
          Reference := FindNestedComponent(FInstanceRoot, CompName);
          if (Reference = nil) and Assigned(FOnFindComponentInstance) then
            FOnFindComponentInstance(Self, CompName, Reference);
          { Free any preexisting global fixups for this instance/property.
            Last fixup added is the only one that counts.
            In particular, fixups created when streaming inherited forms/frames
            must be destroyed when overriding references are found later
            in the stream.  }
          RemoveGlobalFixup(FFixups[I]);
          if (Reference = nil) and MakeGlobalReference then
          begin
            GlobalFixupList.Add(FFixups[I]);
            FFixups[I] := nil;
          end
          else
            ResolveReference(Reference);
        end;
    finally
      FreeFixups;
    end;
end;

procedure TReader.FixupReferences;
var
  I: Integer;
begin
  DoFixupReferences;
  GlobalFixupReferences;
  for I := 0 to FLoaded.Count - 1 do TComponent(FLoaded[I]).Loaded;
end;

procedure TReader.FlushBuffer;
begin
  FStream.Position := Position;
  FBufPos := 0;
  FBufEnd := 0;
end;

procedure TReader.FreeFixups;
var
  I: Integer;
begin
  if FFixups <> nil then
  begin
    for I := 0 to FFixups.Count - 1 do TPropFixup(FFixups[I]).Free;
    FFixups.Free;
    FFixups := nil;
  end;
end;

function TReader.GetFieldClass(Instance: TObject; const ClassName: string): TPersistentClass;
var
  I: Integer;
  ClassTable: PFieldClassTable;
  ClassType: TClass;
begin
  ClassType := Instance.ClassType;
  while ClassType <> TPersistent do
  begin
    ClassTable := GetFieldClassTable(ClassType);
    if ClassTable <> nil then
      for I := 0 to ClassTable^.Count - 1 do
      begin
        Result := ClassTable^.Classes[I]^;
        if Result.ClassNameIs(ClassName) then Exit;
      end;
    ClassType := ClassType.ClassParent;
  end;
  if FFinder <> nil then
    Result := FFinder.GetClass(ClassName)
  else
    Result := GetClass(ClassName);
end;

function TReader.GetPosition: Longint;
begin
  Result := FStream.Position - (FBufEnd - FBufPos);
end;

function TReader.NextValue: TValueType;
begin
  Result := ReadValue;
  Dec(FBufPos);
end;

procedure TReader.PropertyError(const Name: string);
begin
  SkipValue;
  PropertyNotFound(Name);
end;

procedure TReader.Read(var Buf; Count: Longint);
{$IFDEF PUREPASCAL}
var
  LShouldRead: Longint;
  BufOffset: LongInt;
begin
  BufOffset := 0;
  while Count > 0 do
  begin
    { Calculate the amount of data left in the internal buffer. Read more if necessary }
    LShouldRead := FBufEnd - FBufPos;
    if LShouldRead = 0 then
    begin
      ReadBuffer();
      LShouldRead := FBufEnd;
    end;

    { Check how much we can read in one go }
    if (Count <= LShouldRead) then
      LShouldRead := Count;

    { Copy the data and update internal pointers. }
    Move(Pointer(PByte(FBuffer) + FBufPos)^, Pointer(PByte(@Buf) + BufOffset)^, LShouldRead);
    Inc(FBufPos, LShouldRead);
    Inc(BufOffset, LShouldRead);

    { Update the count to reflect the read data }
    Dec(Count, LShouldRead);
  end;
end;
{$ELSE !PUREPASCAL}
{$IFDEF X86ASM}
asm
        PUSH    ESI
        PUSH    EDI
        PUSH    EBX
        MOV     EDI,EDX
        MOV     EBX,ECX
        MOV     ESI,EAX
        JMP     @@6
@@1:    MOV     ECX,[ESI].TReader.FBufEnd
        SUB     ECX,[ESI].TReader.FBufPos
        JA      @@2
        MOV     EAX,ESI
        CALL    TReader.ReadBuffer
        MOV     ECX,[ESI].TReader.FBufEnd
@@2:    CMP     ECX,EBX
        JB      @@3
        MOV     ECX,EBX
@@3:    PUSH    ESI
        SUB     EBX,ECX
        MOV     EAX,[ESI].TReader.FBuffer
        ADD     EAX,[ESI].TReader.FBufPos
        ADD     [ESI].TReader.FBufPos,ECX
        MOV     ESI,EAX
        MOV     EDX,ECX
        SHR     ECX,2
        CLD
        REP     MOVSD
        MOV     ECX,EDX
        AND     ECX,3
        REP     MOVSB
        POP     ESI
@@6:    OR      EBX,EBX
        JNE     @@1
        POP     EBX
        POP     EDI
        POP     ESI
end;
{$ENDIF X86ASM}
{$ENDIF !PUREPASCAL}

procedure TReader.ReadBuffer;
begin
  FBufEnd := FStream.Read(FBuffer^, FBufSize);
  if FBufEnd = 0 then raise EReadError.CreateRes(@SReadError);
  FBufPos := 0;
end;

function TReader.ReadBoolean: Boolean;
var
  Value: TValueType;
begin
  Value := ReadValue;

  if Value in [vaTrue, vaFalse] then
    Result := Value = vaTrue
  else
  begin
    ReadError(@SInvalidPropertyValue);
    Result := False;
  end;
end;

function TReader.ReadChar: Char;
var
  Temp: string;
begin
  Temp := ReadString;
  if Length(Temp) > 1 then
    PropValueError;
  Result := Temp[1];
end;

function TReader.ReadWideChar: WideChar;
var
  Temp: WideString;
begin
  Temp := ReadWideString;
  if Length(Temp) > 1 then
    PropValueError;
  Result := Temp[1];
end;

procedure TReader.ReadCollection(Collection: TCollection);
var
  Item: TPersistent;
begin
  Collection.BeginUpdate;
  try
    if not EndOfList then Collection.Clear;
    while not EndOfList do
    begin
      if NextValue in [vaInt8, vaInt16, vaInt32] then ReadInteger;
      Item := Collection.Add;
      ReadListBegin;
      while not EndOfList do ReadProperty(Item);
      ReadListEnd;
    end;
    ReadListEnd;
  finally
    Collection.EndUpdate;
  end;
end;

function TReader.ReadComponent(Component: TComponent): TComponent;
var
  CompClass, CompName: string;
  Flags: TFilerFlags;
  Position: Integer;
  OldParent, OldLookupRoot: TComponent;
  SubComponents: array of TComponent;

  procedure AddSubComponentsToLoaded(Component: TComponent);
  var
    I: Integer;
  begin
    for I := 0 to Length(SubComponents) - 1 do
      FLoaded.Add(SubComponents[I]);
  end;

  procedure CheckSubComponents(Component: TComponent);
  var
    I: Integer;
  begin
    for I := 0 to Component.ComponentCount - 1 do
      if csSubComponent in Component.Components[I].FComponentStyle then
      begin
        SetLength(SubComponents, Length(SubComponents) + 1);
        SubComponents[Length(SubComponents) - 1] := Component.Components[I];
      end;
  end;

  procedure SetSubComponentState(State: TComponentState; Add: Boolean = True);
  var
    I: Integer;
  begin
    for I := 0 to Length(SubComponents) - 1 do
      if Add then
        SubComponents[I].FComponentState := SubComponents[I].FComponentState + State
      else
        SubComponents[I].FComponentState := SubComponents[I].FComponentState - State;
  end;

  function ComponentCreated: Boolean;
  begin
    Result := not (ffInherited in Flags) and (Component = nil);
  end;

  function Recover(var Component: TComponent): Boolean;
  begin
    Result := False;
    if not (ExceptObject is Exception) then Exit;
    if ComponentCreated then Component.Free;
    Component := nil;
    SkipComponent(False);
    Result := Error(Exception(ExceptObject).Message);
  end;

  procedure CreateComponent;
  var
    ComponentClass: TComponentClass;
  begin
    try
      ComponentClass := FindComponentClass(CompClass);
      Result := nil;
      if Assigned(FOnCreateComponent) then
        FOnCreateComponent(Self, ComponentClass, Result);
      if Result = nil then
      begin
        Result := TComponent(ComponentClass.NewInstance);
        if ffInline in Flags then
        begin
          Include(Result.FComponentState, csLoading);
          Include(Result.FComponentState, csInline);
        end;
        try
          Result.Create(Owner);
        except
          Result := nil;
          raise;
        end;
      end;
      Include(Result.FComponentState, csLoading);
    except
      if not Recover(Result) then raise;
    end;
  end;

  procedure SetCompName;
  begin
    try
      Result.SetParentComponent(Parent);
      SetName(Result, CompName);
      if (csDesigning in Result.ComponentState) and (FindGlobalComponent(CompName) = Result) then
        Include(Result.FComponentState, csInline);
    except
      if not Recover(Result) then raise;
    end;
  end;

  procedure FindExistingComponent;
  begin
    try
      Result := FindAncestorComponent(CompName, FindComponentClass(CompClass));
      Parent := Result.GetParentComponent;
      if Parent = nil then Parent := Root;
    except
      if not Recover(Result) then raise;
    end;
  end;

begin
  ReadPrefix(Flags, Position);
  CompClass := ReadStr;
  CompName := ReadStr;
  OldParent := Parent;
  OldLookupRoot := FLookupRoot;
  try
    Result := Component;
    if Result = nil then
      if ffInherited in Flags then
        FindExistingComponent else
        CreateComponent;
    if Result <> nil then
      try
        CheckSubComponents(Result);
        Include(Result.FComponentState, csLoading);
        SetSubComponentState([csLoading]);
        if not (ffInherited in Flags) then SetCompName;
        if Result = nil then Exit;
        if csInline in Result.ComponentState then
          FLookupRoot := Result;
        Include(Result.FComponentState, csReading);
        SetSubComponentState([csReading]);
        Result.ReadState(Self);
        Exclude(Result.FComponentState, csReading);
        SetSubComponentState([csReading], False);
        if ffChildPos in Flags then Parent.SetChildOrder(Result, Position);
        if (ffInherited in Flags) or (csInline in Result.ComponentState) then
        begin
          if FLoaded.IndexOf(Result) < 0 then
          begin
            AddSubComponentsToLoaded(Result);
            FLoaded.Add(Result);
          end;
        end
        else
        begin
          AddSubComponentsToLoaded(Result);
          FLoaded.Add(Result);
        end;
      except
        if ComponentCreated then Result.Free;
        raise;
      end;
  finally
    Parent := OldParent;
    FLookupRoot := OldLookupRoot;
  end;
end;

procedure TReader.ReadData(Instance: TComponent);
begin
  if FFixups = nil then
  begin
    FFixups := TList.Create;
    try
      ReadDataInner(Instance);
      DoFixupReferences;
    finally
      FreeFixups;
    end;
  end else
    ReadDataInner(Instance);
end;

procedure TReader.ReadDataInner(Instance: TComponent);
var
  OldParent, OldOwner: TComponent;
begin
  while not EndOfList do ReadProperty(Instance);
  ReadListEnd;
  OldParent := Parent;
  OldOwner := Owner;
  Parent := Instance.GetChildParent;
  try
    Owner := Instance.GetChildOwner;
    if not Assigned(Owner) then Owner := Root;
    while not EndOfList do ReadComponent(nil);
    ReadListEnd;
  finally
    Parent := OldParent;
    Owner := OldOwner;
  end;
end;

function TReader.ReadFloat: Extended;
{$IFDEF CPUX86}
begin
  if ReadValue = vaExtended then
    Read(Result, SizeOf(Result))
  else
  begin
    Dec(FBufPos);
    Result := ReadDouble;
  end;
end;
{$ELSE}
var
  E: TExtended80Rec;
begin
  if ReadValue = vaExtended then
  begin
    Read(E, SizeOf(E));
    Result := Extended(E);
  end
  else
  begin
    Dec(FBufPos);
    Result := ReadDouble;
  end;
end;
{$ENDIF}

function TReader.ReadDouble: Double;
begin
  if ReadValue = vaDouble then
    Read(Result, SizeOf(Result))
  else
  begin
    Dec(FBufPos);
    Result := ReadInt64;
  end;
end;

function TReader.ReadSingle: Single;
begin
  if ReadValue = vaSingle then Read(Result, SizeOf(Result)) else
  begin
    Dec(FBufPos);
    Result := ReadInt64;
  end;
end;

function TReader.ReadCurrency: Currency;
begin
  if ReadValue = vaCurrency then Read(Result, SizeOf(Result)) else
  begin
    Dec(FBufPos);
    Result := ReadInt64;
  end;
end;

function TReader.ReadDate: TDateTime;
begin
  if ReadValue = vaDate then Read(Result, SizeOf(Result)) else
  begin
    Dec(FBufPos);
    Result := ReadInt64;
  end;
end;

function TReader.ReadIdent: string;
var
  L: Byte;
  LResult: AnsiString;
begin
  case ReadValue of
    vaIdent:
      begin
        Read(L, SizeOf(Byte));
        SetString(LResult, PAnsiChar(nil), L);
        Read(LResult[1], L);
        Result := UTF8ToString(LResult);
      end;
    vaFalse:
      Result := 'False';
    vaTrue:
      Result := 'True';
    vaNil:
      Result := 'nil';
    vaNull:
      Result := 'Null';
  else
    PropValueError;
  end;
end;

function TReader.ReadInteger: Longint;
var
  S: Shortint;
  I: Smallint;
begin
  case ReadValue of
    vaInt8:
      begin
        Read(S, SizeOf(S));
        Result := S;
      end;
    vaInt16:
      begin
        Read(I, SizeOf(I));
        Result := I;
      end;
    vaInt32:
      Read(Result, SizeOf(Result));
  else
    PropValueError;
  end;
end;

function TReader.ReadInt64: Int64;
begin
  if NextValue = vaInt64 then
  begin
    ReadValue;
    Read(Result, SizeOf(Result));
  end
  else
    Result := ReadInteger;
end;

procedure TReader.ReadListBegin;
begin
  CheckValue(vaList);
end;

procedure TReader.ReadListEnd;
begin
  CheckValue(vaNull);
end;

procedure TReader.ReadPrefix(var Flags: TFilerFlags; var AChildPos: Integer);
var
  Prefix: Byte;
begin
  Flags := [];
  if Byte(NextValue) and $F0 = $F0 then
  begin
    Prefix := Byte(ReadValue);
    Byte(Flags) := Prefix and $0F;
    if ffChildPos in Flags then AChildPos := ReadInteger;
  end;
end;

procedure TReader.ReadProperty(AInstance: TPersistent);
var
  I, J, L: Integer;
  Instance: TPersistent;
  PropInfo: PPropInfo;
  PropValue: TObject;
  PropPath: string;

  procedure HandleException(E: Exception);
  var
    Name: string;
  begin
    Name := '';
    if AInstance is TComponent then
      Name := TComponent(AInstance).Name;
    if Name = '' then Name := AInstance.ClassName;
    raise EReadError.CreateResFmt(@SPropertyException, [Name, DotSep, PropPath, E.Message]);
  end;

  procedure PropPathError;
  begin
    SkipValue;
    ReadError(@SInvalidPropertyPath);
  end;

begin
  try
    PropPath := ReadStr;
    try
      I := 1;
      L := Length(PropPath);
      Instance := AInstance;
      FCanHandleExcepts := True;
      while True do
      begin
        J := I;
        while (I <= L) and (PropPath[I] <> '.') do Inc(I);
        FPropName := Copy(PropPath, J, I - J);
        if I > L then Break;
        PropInfo := GetPropInfo(Instance.ClassInfo, FPropName);
        if PropInfo = nil then
        begin
          // Call DefineProperties with the entire PropPath
          // to allow defining properties such as "Prop.SubProp"
          FPropName := PropPath;
          { Cannot reliably recover from an error in a defined property }
          FCanHandleExcepts := False;
          Instance.DefineProperties(Self);
          FCanHandleExcepts := True;
          if FPropName <> '' then
            PropertyError(FPropName);
          Exit;
        end;
        PropValue := nil;
        if PropInfo^.PropType^.Kind = tkClass then
          PropValue := TObject(GetOrdProp(Instance, PropInfo));
        if not (PropValue is TPersistent) then PropPathError;
        Instance := TPersistent(PropValue);
        Inc(I);
      end;
      PropInfo := GetPropInfo(Instance.ClassInfo, FPropName);
      if PropInfo <> nil then
        ReadPropValue(Instance, PropInfo)
      else
      begin
        { Cannot reliably recover from an error in a defined property }
        FCanHandleExcepts := False;
        Instance.DefineProperties(Self);
        FCanHandleExcepts := True;
        if FPropName <> '' then
          PropertyError(FPropName);
      end;
    except
      on E: Exception do HandleException(E);
    end;
  except
    on E: Exception do
      if not FCanHandleExcepts or not Error(E.Message) then raise;
  end;
end;

procedure TReader.ReadPropValue(Instance: TPersistent; PropInfo: Pointer);
const
  NilMethod: TMethod = (Code: nil; Data: nil);
var
  PropType: PTypeInfo;
  LMethod: TMethod;
  EnumValue: Integer;

  procedure SetIntIdent(Instance: TPersistent; PropInfo: Pointer;
    const Ident: string);
  var
    V: Longint;
    IdentToInt: TIdentToInt;
  begin
    IdentToInt := FindIdentToInt(PPropInfo(PropInfo)^.PropType^);
    if Assigned(IdentToInt) and IdentToInt(Ident, V) then
      SetOrdProp(Instance, PropInfo, V)
    else
      PropValueError;
  end;

  procedure SetObjectIdent(Instance: TPersistent; PropInfo: Pointer;
    const Ident: string);
  begin
    FFixups.Add(TPropFixup.Create(Instance, Root, PropInfo, '', Ident));
  end;

  // This is isolated into a local to help reduce transient VarClears
  procedure SetVariantReference;
  begin
    SetVariantProp(Instance, PropInfo, ReadVariant);
  end;

  procedure SetInterfaceReference;
  var
    Intf: IInterface;
  begin
    if NextValue = vaNil then
    begin
      ReadValue;
      Intf := nil;
      SetInterfaceProp(Instance, PropInfo, Intf);
    end
    else
      FFixups.Add(TPropIntfFixup.Create(Instance, Root, PropInfo, '', ReadIdent));
  end;

begin
  if PPropInfo(PropInfo)^.SetProc = nil then
    if not ((PPropInfo(PropInfo)^.PropType^.Kind = tkClass) and
       (TObject(GetOrdProp(Instance, PropInfo)) is TComponent) and
       (csSubComponent in TComponent(GetOrdProp(Instance, PropInfo)).ComponentStyle)) then
      ReadError(@SReadOnlyProperty);
  PropType := PPropInfo(PropInfo)^.PropType^;
  case PropType^.Kind of
    tkInteger:
      if NextValue = vaIdent then
        SetIntIdent(Instance, PropInfo, ReadIdent)
      else
        SetOrdProp(Instance, PropInfo, ReadInteger);
    tkChar:
      SetOrdProp(Instance, PropInfo, Ord(ReadChar));
    tkWChar:
      SetOrdProp(Instance, PropInfo, Ord(ReadWideChar));
    tkEnumeration:
      begin
        EnumValue := GetEnumValue(PropType, ReadIdent);

        if EnumValue <> -1 then
          SetOrdProp(Instance, PropInfo, EnumValue)
        else
          ReadError(@SInvalidPropertyValue);
      end;
    tkFloat:
      SetFloatProp(Instance, PropInfo, ReadFloat);
    tkString, tkLString:
      SetStrProp(Instance, PropInfo, ReadString);
    tkWString:
      SetWideStrProp(Instance, PropInfo, ReadWideString);
    tkUString:
      SetUnicodeStrProp(Instance, PropInfo, ReadWideString);
    tkSet:
      SetOrdProp(Instance, PropInfo, ReadSet(PropType));
    tkClass:
      case NextValue of
        vaNil:
          begin
            ReadValue;
            SetOrdProp(Instance, PropInfo, 0);
          end;
        vaCollection:
          begin
            ReadValue;
            ReadCollection(TCollection(GetOrdProp(Instance, PropInfo)));
          end
      else
        SetObjectIdent(Instance, PropInfo, ReadIdent);
      end;
    tkMethod:
      if NextValue = vaNil then
      begin
        ReadValue;
        SetMethodProp(Instance, PropInfo, NilMethod);
      end
      else
      begin
        LMethod := FindMethodInstance(Root, ReadIdent);
        if LMethod.Code <> nil then SetMethodProp(Instance, PropInfo, LMethod);
      end;
    tkVariant:
      SetVariantReference;
    tkInt64:
      SetInt64Prop(Instance, PropInfo, ReadInt64);
    tkInterface:
      SetInterfaceReference;
  end;
end;

function TReader.ReadRootComponent(Root: TComponent): TComponent;

  function FindUniqueName(const Name: string): string;
  var
    I: Integer;
  begin
    I := 0;
    Result := Name;
    while not IsUniqueGlobalComponentName(Result) do
    begin
      Inc(I);
      Result := Format('%s_%d', [Name, I]);
    end;
  end;

var
  I: Integer;
  Flags: TFilerFlags;
  G: TList;
begin
  ReadSignature;
  Result := nil;
  GlobalNameSpace.BeginWrite;  // Loading from stream adds to name space
  try
    try
      ReadPrefix(Flags, I);
      if Root = nil then
      begin
        Result := TComponentClass(FindClass(ReadStr)).Create(nil);
        Result.Name := ReadStr;
      end else
      begin
        Result := Root;
        ReadStr; { Ignore class name }
        if csDesigning in Result.ComponentState then
          ReadStr else
        begin
          Include(Result.FComponentState, csLoading);
          Include(Result.FComponentState, csReading);
          Result.Name := FindUniqueName(ReadStr);
        end;
      end;
      FRoot := Result;
      FFinder := TClassFinder.Create(TPersistentClass(Result.ClassType), True);
      try
        FLookupRoot := Result;
        G := GlobalLoaded;
        if G <> nil then
          FLoaded := G else
          FLoaded := TList.Create;
        try
          if FLoaded.IndexOf(FRoot) < 0 then
            FLoaded.Add(FRoot);
          FOwner := FRoot;
          Include(FRoot.FComponentState, csLoading);
          Include(FRoot.FComponentState, csReading);
          FRoot.ReadState(Self);
          Exclude(FRoot.FComponentState, csReading);
          if G = nil then
            for I := 0 to FLoaded.Count - 1 do TComponent(FLoaded[I]).Loaded;
        finally
          if G = nil then FLoaded.Free;
          FLoaded := nil;
        end;
      finally
        FFinder.Free;
      end;
      while True do
      try
        // Try to fix up all references until no exceptions or the exception
        // itself terminates the loop. This will loop if the error is ignored
        // in, for example, the form designer.
        GlobalFixupReferences;
        Break;
      except
        if not Error(Exception(ExceptObject).Message) then raise;
      end;
    except
      RemoveFixupReferences(Root, '');
      if Root = nil then Result.Free;
      raise;
    end;
  finally
    GlobalNameSpace.EndWrite;
  end;
end;

procedure TReader.ReadComponents(AOwner, AParent: TComponent;
  Proc: TReadComponentsProc);
var
  Component: TComponent;
begin
  Root := AOwner;
  Owner := AOwner;
  Parent := AParent;
  BeginReferences;
  try
    FFinder := TClassFinder.Create(TPersistentClass(AOwner.ClassType), True);
    try
      while not EndOfList do
      begin
        ReadSignature;
        Component := ReadComponent(nil);
        if Assigned(Proc) then Proc(Component);
      end;
      ReadListEnd;
      FixupReferences;
    finally
      FFinder.Free;
    end;
  finally
    EndReferences;
  end;
end;

function TReader.ReadSet(SetType: Pointer): Integer;
var
  EnumType: PTypeInfo;
  EnumName: string;
begin
  try
    if ReadValue <> vaSet then PropValueError;
    EnumType := GetTypeData(SetType)^.CompType^;
    Result := 0;
    while True do
    begin
      EnumName := ReadStr;
      if EnumName = '' then Break;
      Include(TIntegerSet(Result), SetElementValue(EnumType, EnumName));
    end;
  except
    SkipSetBody;
    raise;
  end;
end;

procedure TReader.ReadSignature;
var
  Signature: Longint;
begin
  Read(Signature, SizeOf(Signature));
  if Signature <> Longint(FilerSignature) then ReadError(@SInvalidImage);
end;

function TReader.ReadStr: string;
var
  L: Byte;
  B: TBytes;
begin
  Read(L, SizeOf(Byte));
  SetLength(B, L);
  Read(B[0], L);
  Result := TEncoding.UTF8.GetString(B);
end;

function TReader.ReadString: string;
var
  L: Integer;
  LResult: TBytes;
begin
  if NextValue in [vaWString, vaUTF8String] then
    Result := ReadWideString
  else
  begin
    L := 0;
    case ReadValue of
      vaString:
        Read(L, SizeOf(Byte));
      vaLString:
        Read(L, SizeOf(Integer));
    else
      PropValueError;
    end;
    SetLength(LResult, L);
    Read(LResult[0], L);
    Result := TEncoding.Default.GetString(LResult);
  end;
end;

function TReader.ReadWideString: WideString;
var
  L: Integer;
  Temp: TBytes;
begin
  if NextValue in [vaString, vaLString] then
    Result := ReadString
  else
  begin
    case ReadValue of
      vaWString:
        begin
          Read(L, SizeOf(Integer));
          SetLength(Temp, L * 2);
          Read(Temp[0], L * 2);
          Result := TEncoding.Unicode.GetString(Temp);
        end;
      vaUTF8String:
        begin
          Read(L, SizeOf(Integer));
          SetLength(Temp, L);
          Read(Temp[0], L);
          Result := TEncoding.UTF8.GetString(Temp);
        end;
    else
      PropValueError;
    end;
  end;
end;

function TReader.ReadValue: TValueType;
begin
  Read(Result, SizeOf(Result));
end;

procedure TReader.SetPosition(Value: Longint);
begin
  FStream.Position := Value;
  FBufPos := 0;
  FBufEnd := 0;
end;

procedure TReader.SkipSetBody;
begin
  while ReadStr <> '' do begin end;
end;

procedure TReader.SkipValue;

  procedure SkipList;
  begin
    while not EndOfList do SkipValue;
    ReadListEnd;
  end;

  procedure SkipBinary(BytesPerUnit: Integer);
  var
    Count: Longint;
  begin
    Read(Count, SizeOf(Count));
    SkipBytes(Count * BytesPerUnit);
  end;

  procedure SkipCollection;
  begin
    while not EndOfList do
    begin
      if NextValue in [vaInt8, vaInt16, vaInt32] then SkipValue;
      SkipBytes(1);
      while not EndOfList do SkipProperty;
      ReadListEnd;
    end;
    ReadListEnd;
  end;

begin
  case ReadValue of
    vaNull: { no value field, just an identifier };
    vaList: SkipList;
    vaInt8: SkipBytes(SizeOf(Byte));
    vaInt16: SkipBytes(SizeOf(Word));
    vaInt32: SkipBytes(SizeOf(LongInt));
{$IFDEF CPUX86}
    vaExtended: SkipBytes(SizeOf(Extended));
{$ELSE}
    vaExtended: SkipBytes(SizeOf(TExtended80Rec));
{$ENDIF}
    vaString, vaIdent: ReadStr;
    vaFalse, vaTrue: { no value field, just an identifier };
    vaBinary: SkipBinary(1);
    vaSet: SkipSetBody;
    vaLString: SkipBinary(1);
    vaCollection: SkipCollection;
    vaSingle: SkipBytes(Sizeof(Single));
    vaCurrency: SkipBytes(SizeOf(Currency));
    vaDate: SkipBytes(Sizeof(TDateTime));
    vaWString: SkipBinary(Sizeof(WideChar));
    vaInt64: SkipBytes(Sizeof(Int64));
    vaUTF8String: SkipBinary(1);
    vaDouble: SkipBytes(SizeOf(Double));
  end;
end;

procedure TReader.CopyValue(Writer: TWriter);

  procedure CopySetBody;
  var
    s: AnsiString;
  begin
    Writer.WriteValue(ReadValue);
    repeat
      s := AnsiString(ReadStr);
      Writer.WriteStr(s);
    until s = '';
  end;

  procedure CopyList;
  begin
    Writer.WriteValue(ReadValue);
    while not EndOfList do
      CopyValue(Writer);
    ReadListEnd;
    Writer.WriteListEnd;
  end;

  procedure CopyBytes(Count: Longint);
  var
    Bytes: array[0..8191] of Char;
  begin
    while Count > SizeOf(Bytes) do
    begin
      Read(Bytes, SizeOf(Bytes));
      Writer.Write(Bytes, SizeOf(Bytes));
      Dec(Count, SizeOf(Bytes));
    end;
    if Count > 0 then
    begin
      Read(Bytes, Count);
      Writer.Write(Bytes, Count);
    end;
  end;

  procedure CopyBinary(BytesPerUnit: Integer);
  var
    Count: Longint;
  begin
    Writer.WriteValue(ReadValue);
    Read(Count, SizeOf(Count));
    Writer.Write(Count, SizeOf(Count));
    CopyBytes(Count * BytesPerUnit);
  end;

begin
  case NextValue of
    vaNull, vaFalse, vaTrue, vaNil:
      Writer.WriteValue(ReadValue);
    vaList, vaCollection:
      CopyList;
    vaInt8, vaInt16, vaInt32:
      Writer.WriteInteger(ReadInteger);
    vaExtended:
      Writer.WriteFloat(ReadFloat);
    vaString:
      Writer.WriteString(ReadString);
    vaIdent:
      Writer.WriteIdent(ReadIdent);
    vaBinary, vaLString, vaUTF8String:
      CopyBinary(1);
    vaWString:
      CopyBinary(Sizeof(WideChar));
    vaSet:
      CopySetBody;
    vaSingle:
      Writer.WriteSingle(ReadSingle);
    vaCurrency:
      Writer.WriteCurrency(ReadCurrency);
    vaDate:
      Writer.WriteDate(ReadDate);
    vaInt64:
      Writer.WriteInteger(ReadInt64);
    vaDouble:
      Writer.WriteDouble(ReadDouble);
  end;
end;

procedure TReader.SkipProperty;
begin
  ReadStr; { Skips property name }
  SkipValue;
end;

procedure TReader.SkipComponent(SkipHeader: Boolean);
var
  Flags: TFilerFlags;
  Position: Integer;
begin
  if SkipHeader then
  begin
    ReadPrefix(Flags, Position);
    ReadStr;
    ReadStr;
  end;
  while not EndOfList do SkipProperty;
  ReadListEnd;
  while not EndOfList do SkipComponent(True);
  ReadListEnd;
end;

function TReader.FindAncestorComponent(const Name: string;
  ComponentClass: TPersistentClass): TComponent;
var
  CompName: string;
begin
  CompName := Name;
  Result := nil;
  if FLookupRoot <> nil then
    Result := FLookupRoot.FindComponent(CompName);
  if Result = nil then
  begin
    if Assigned(FOnAncestorNotFound) then
      FOnAncestorNotFound(Self, CompName, ComponentClass, Result);
    if Result = nil then
      raise EReadError.CreateResFmt(@SAncestorNotFound, [CompName]);
  end;
end;

procedure TReader.ReferenceName(var Name: string);
begin
  if Assigned(FOnReferenceName) then FOnReferenceName(Self, Name);
end;

procedure TReader.SetName(Component: TComponent; var Name: string);
begin
  if Assigned(FOnSetName) then FOnSetName(Self, Component, Name);
  Component.Name := Name;
end;

function TReader.FindComponentClass(const ClassName: string): TComponentClass;
begin
  TPersistentClass(Result) := GetFieldClass(Root, ClassName);
  if not Assigned(Result) and Assigned(FLookupRoot) and (FLookupRoot <> Root) then
    TPersistentClass(Result) := GetFieldClass(FLookupRoot, ClassName);
  if Assigned(FOnFindComponentClass) then
    FOnFindComponentClass(Self, ClassName, Result);
  if (Result = nil) or not Result.InheritsFrom(TComponent) then
    ClassNotFound(ClassName);
end;

procedure TReader.SkipBytes(Count: Integer);
var
  Bytes: array[0..255] of Char;
begin
  while Count > 0 do
    if Count > SizeOf(Bytes) then
    begin
      Read(Bytes, SizeOf(Bytes));
      Dec(Count, SizeOf(Bytes));
    end
    else
    begin
      Read(Bytes, Count);
      Count := 0;
    end;
end;

function TReader.ReadVariant: Variant;

  function ReadCustomVariant: Variant;
  var
    OuterStream, InnerStream: TMemoryStream;
    OuterReader: TReader;
    StreamSize: Integer;
    CustomType: TCustomVariantType;
    CustomTypeClassName: string;
    VarStreamer: IVarStreamable;
  begin
    CheckValue(vaBinary);

    InnerStream := nil;
    OuterStream := TMemoryStream.Create;
    try
      InnerStream := TMemoryStream.Create;

      Read(StreamSize, SizeOf(StreamSize));
      OuterStream.Size := StreamSize;
      Read(OuterStream.Memory^, StreamSize);

      OuterReader := TReader.Create(OuterStream, 1024);
      try
        CustomTypeClassName := OuterReader.ReadString;
        OuterReader.Read(StreamSize, SizeOf(StreamSize));
        InnerStream.Size := StreamSize;
        OuterReader.Read(InnerStream.Memory^, StreamSize);

        if not FindCustomVariantType(CustomTypeClassName, CustomType) or
           not Supports(CustomType, IVarStreamable, VarStreamer) then
          raise EReadError.CreateRes(@SReadError);
        TVarData(Result).VType := CustomType.VarType;
        VarStreamer.StreamIn(TVarData(Result), InnerStream);
      finally
        OuterReader.Free;
      end;
    finally
      InnerStream.Free;
      OuterStream.Free;
    end;
  end;

begin
  VarClear(Result);
  case NextValue of
    vaNil, vaNull:       if ReadValue <> vaNil then
                           Result := System.Variants.Null;
    vaInt8:              Result := Shortint(ReadInteger);
    vaInt16:             Result := Smallint(ReadInteger);
    vaInt32:             Result := ReadInteger;
    vaExtended:          Result := ReadFloat;
    vaSingle:            Result := ReadSingle;
    vaDouble:            Result := ReadDouble;
    vaCurrency:          Result := ReadCurrency;
    vaDate:              Result := ReadDate;
    vaString, vaLString: Result := ReadString;
    vaWString,
    vaUTF8String:        Result := ReadWideString;
    vaFalse, vaTrue:     Result := (ReadValue = vaTrue);
    vaBinary:            Result := ReadCustomVariant;
    vaInt64:             Result := ReadInt64;
  else
    raise EReadError.CreateRes(@SReadError);
  end;
end;

{ TWriter }

destructor TWriter.Destroy;
begin
  WriteBuffer;
  inherited Destroy;
end;

procedure TWriter.AddAncestor(Component: TComponent);
begin
  FAncestorList.Add(Component);
end;

procedure TWriter.DefineProperty(const Name: string;
  ReadData: TReaderProc; WriteData: TWriterProc; HasData: Boolean);
begin
  if HasData and Assigned(WriteData) then
  begin
    WritePropName(Name);
    WriteData(Self);
  end;
end;

procedure TWriter.DefineBinaryProperty(const Name: string;
  ReadData, WriteData: TStreamProc; HasData: Boolean);
begin
  if HasData and Assigned(WriteData) then
  begin
    WritePropName(Name);
    WriteBinary(WriteData);
  end;
end;

function TWriter.GetPosition: Longint;
begin
  Result := FStream.Position + FBufPos;
end;

function TWriter.FindMethodName(AMethod: TMethod): string;
begin
  Result := '';
  if Assigned(FOnFindMethodName) then
    FOnFindMethodName(Self, AMethod, Result);
  if Result = '' then
    Result := FLookupRoot.MethodName(AMethod.Code);
end;

procedure TWriter.FlushBuffer;
begin
  WriteBuffer;
end;

procedure TWriter.SetPosition(Value: Longint);
var
  StreamPosition: Longint;
begin
  StreamPosition := FStream.Position;
  { Only flush the buffer if the repostion is outside the buffer range }
  if (Value < StreamPosition) or (Value > StreamPosition + FBufPos) then
  begin
    WriteBuffer;
    FStream.Position := Value;
  end
  else
    FBufPos := Value - StreamPosition;
end;

procedure TWriter.SetRoot(Value: TComponent);
begin
  inherited SetRoot(Value);
  FLookupRoot := Value;
end;

procedure TWriter.Write(const Buf; Count: Longint);
{$IFDEF PUREPASCAL}
var
  LShouldWrite: Longint;
  BufOffset: LongInt;
begin
  BufOffset := 0;
  while Count > 0 do
  begin
    { Check the size of the output buffer and flush it if its full }
    LShouldWrite := FBufSize - FBufPos;
    if LShouldWrite = 0 then
    begin
      WriteBuffer();
      LShouldWrite := FBufSize;
    end;

    { Update write size }
    if LShouldWrite >= Count then
      LShouldWrite := Count;

    { Move the data in and update buffer pointer }
    Move(Pointer(PByte(@Buf) + BufOffset)^, Pointer(PByte(FBuffer) + FBufPos)^, LShouldWrite);
    Inc(FBufPos, LShouldWrite);
    Inc(BufOffset, LShouldWrite);

    { Update left count }
    Dec(Count, LShouldWrite);
  end;
end;
{$ELSE !PUREPASCAL}
{$IFDEF X86ASM}
asm
        PUSH    ESI
        PUSH    EDI
        PUSH    EBX
        MOV     ESI,EDX
        MOV     EBX,ECX
        MOV     EDI,EAX
        JMP     @@6
@@1:    MOV     ECX,[EDI].TWriter.FBufSize
        SUB     ECX,[EDI].TWriter.FBufPos
        JA      @@2
        MOV     EAX,EDI
        CALL    TWriter.WriteBuffer
        MOV     ECX,[EDI].TWriter.FBufSize
@@2:    CMP     ECX,EBX
        JB      @@3
        MOV     ECX,EBX
@@3:    SUB     EBX,ECX
        PUSH    EDI
        MOV     EAX,[EDI].TWriter.FBuffer
        ADD     EAX,[EDI].TWriter.FBufPos
        ADD     [EDI].TWriter.FBufPos,ECX
@@5:    MOV     EDI,EAX
        MOV     EDX,ECX
        SHR     ECX,2
        CLD
        REP     MOVSD
        MOV     ECX,EDX
        AND     ECX,3
        REP     MOVSB
        POP     EDI
@@6:    OR      EBX,EBX
        JNE     @@1
        POP     EBX
        POP     EDI
        POP     ESI
end;
{$ENDIF X86ASM}
{$ENDIF !PUREPASCAL}

procedure TWriter.WriteBinary(WriteData: TStreamProc);
var
  Stream: TMemoryStream;
  Count: Longint;
begin
  Stream := TMemoryStream.Create;
  try
    WriteData(Stream);
    WriteValue(vaBinary);
    Count := Stream.Size;
    Write(Count, SizeOf(Count));
    Write(Stream.Memory^, Count);
  finally
    Stream.Free;
  end;
end;

procedure TWriter.WriteBuffer;
begin
  FStream.WriteBuffer(FBuffer^, FBufPos);
  FBufPos := 0;
end;

procedure TWriter.WriteBoolean(Value: Boolean);
begin
  if Value then
    WriteValue(vaTrue)
  else
    WriteValue(vaFalse);
end;

procedure TWriter.WriteChar(Value: Char);
begin
  WriteString(Value);
end;

procedure TWriter.WriteWideChar(Value: WideChar);
begin
  WriteWideString(Value);
end;

procedure TWriter.WriteCollection(Value: TCollection);
var
  I: Integer;
  OldAncestor: TPersistent;
begin
  OldAncestor := Ancestor;
  Ancestor := nil;
  try
    WriteValue(vaCollection);
    if Value <> nil then
      for I := 0 to Value.Count - 1 do
      begin
        WriteListBegin;
        WriteProperties(Value.Items[I]);
        WriteListEnd;
      end;
    WriteListEnd;
  finally
    Ancestor := OldAncestor;
  end;
end;

procedure TWriter.WriteComponent(Component: TComponent);

  function FindAncestor(const Name: string): TComponent;
  var
    I: Integer;
  begin
    for I := 0 to FAncestorList.Count - 1 do
    begin
      Result := FAncestorList[I];
      if SameText(Result.Name, Name) then Exit;
    end;
    Result := nil;
  end;

var
  OldAncestor: TPersistent;
  OldRootAncestor: TComponent;
  AncestorComponent: TComponent;
  I: Integer;
begin
  OldAncestor := Ancestor;
  OldRootAncestor := RootAncestor;
  try
    Include(Component.FComponentState, csWriting);
    for I := 0 to Component.ComponentCount - 1 do
      if csSubComponent in Component.Components[I].ComponentStyle then
        Include(Component.Components[I].FComponentState, csWriting);
    if Assigned(FAncestorList) then
      Ancestor := FindAncestor(Component.Name);
    if Assigned(FOnFindAncestor) and ((Ancestor = nil) or
    (Ancestor is TComponent)) then
    begin
      AncestorComponent := TComponent(Ancestor);
      FOnFindAncestor(Self, Component, Component.Name, AncestorComponent,
        FRootAncestor);
      Ancestor := AncestorComponent;
    end;
    Component.WriteState(Self);
    Exclude(Component.FComponentState, csWriting);
    for I := 0 to Component.ComponentCount - 1 do
      if csSubComponent in Component.Components[I].ComponentStyle then
        Exclude(Component.Components[I].FComponentState, csWriting);
  finally
    Ancestor := OldAncestor;
    FRootAncestor := OldRootAncestor;
  end;
end;

procedure TWriter.WriteData(Instance: TComponent);
var
  PreviousPosition, PropertiesPosition: Longint;
  OldAncestorList: TList;
  OldAncestorPos, OldChildPos: Integer;
  OldRoot, OldRootAncestor: TComponent;
  Flags: TFilerFlags;
begin
  if FBufSize - FBufPos < Length(Instance.ClassName) +
    Length(Instance.Name) + 1+5+3 then WriteBuffer;
     { Prefix + vaInt + integer + 2 end lists }
  PreviousPosition := Position;
  Flags := [];
  if csInline in Instance.ComponentState then
    if (Ancestor <> nil) and (csAncestor in Instance.ComponentState) and (FAncestorList <> nil) then
      // If the AncestorList is not nil, this really came from an ancestor form
      Include(Flags, ffInherited)
    else
      // otherwise the Ancestor is the original frame
      Include(Flags, ffInline)
  else if Ancestor <> nil then
    Include(Flags, ffInherited);
  if (FAncestorList <> nil) and (FAncestorPos < FAncestorList.Count) and
    ((Ancestor = nil) or (FAncestorList[FAncestorPos] <> Ancestor)) then
    Include(Flags, ffChildPos);
  WritePrefix(Flags, FChildPos);
  if UseQualifiedNames then
    WriteUTF8Str(Instance.ClassType.UnitName + '.' + Instance.ClassName)
  else
    WriteUTF8Str(Instance.ClassName);
  WriteUTF8Str(Instance.Name);
  PropertiesPosition := Position;
  if (FAncestorList <> nil) and (FAncestorPos < FAncestorList.Count) then
  begin
    if Ancestor <> nil then Inc(FAncestorPos);
    Inc(FChildPos);
  end;
  WriteProperties(Instance);
  WriteListEnd;
  OldAncestorList := FAncestorList;
  OldAncestorPos := FAncestorPos;
  OldChildPos := FChildPos;
  OldRoot := FRoot;
  OldRootAncestor := FRootAncestor;
  try
    FAncestorList := nil;
    FAncestorPos := 0;
    FChildPos := 0;
    if not IgnoreChildren then
      try
        if (FAncestor <> nil) and (FAncestor is TComponent) then
        begin
          if (FAncestor is TComponent) and (csInline in TComponent(FAncestor).ComponentState) then
            FRootAncestor := TComponent(FAncestor);
          FAncestorList := TList.Create;
          TComponent(FAncestor).GetChildren(AddAncestor, FRootAncestor);
        end;
        if csInline in Instance.ComponentState then
          FRoot := Instance;
        Instance.GetChildren(WriteComponent, FRoot);
      finally
        FAncestorList.Free;
      end;
  finally
    FAncestorList := OldAncestorList;
    FAncestorPos := OldAncestorPos;
    FChildPos := OldChildPos;
    FRoot := OldRoot;
    FRootAncestor := OldRootAncestor;
  end;
  WriteListEnd;
  if (Instance <> Root) and (Flags = [ffInherited]) and
    (Position = PropertiesPosition + (1 + 1)) then { (1 + 1) is two end lists }
    Position := PreviousPosition;
end;

procedure TWriter.WriteDescendent(Root: TComponent; AAncestor: TComponent);
begin
  FRootAncestor := AAncestor;
  FAncestor := AAncestor;
  FRoot := Root;
  FLookupRoot := Root;
  WriteSignature;
  WriteComponent(Root);
end;

procedure TWriter.WriteFloat(const Value: Extended);
{$IFDEF CPUX86}
begin
  WriteValue(vaExtended);
  Write(Value, SizeOf(Extended));
end;
{$ELSE}
var
  E: TExtended80Rec;
begin
  WriteValue(vaExtended);
  E := TExtended80Rec(Value);
  Write(E, SizeOf(E));
end;
{$ENDIF}

procedure TWriter.WriteSingle(const Value: Single);
begin
  WriteValue(vaSingle);
  Write(Value, SizeOf(Single));
end;

procedure TWriter.WriteDouble(const Value: Double);
begin
  WriteValue(vaDouble);
  Write(Value, SizeOf(Double));
end;

procedure TWriter.WriteCurrency(const Value: Currency);
begin
  WriteValue(vaCurrency);
  Write(Value, SizeOf(Currency));
end;

procedure TWriter.WriteDate(const Value: TDateTime);
begin
  WriteValue(vaDate);
  Write(Value, SizeOf(TDateTime));
end;

procedure TWriter.WriteIdent(const Ident: string);
begin
  if SameText(Ident, 'False') then WriteValue(vaFalse) else
  if SameText(Ident ,'True') then WriteValue(vaTrue) else
  if SameText(Ident ,'Null') then WriteValue(vaNull) else
  if SameText(Ident, 'nil') then WriteValue(vaNil) else
  begin
    WriteValue(vaIdent);
    WriteUTF8Str(Ident);
  end;
end;

procedure TWriter.WriteInteger(Value: Longint);
begin
  if (Value >= Low(ShortInt)) and (Value <= High(ShortInt)) then
  begin
    WriteValue(vaInt8);
    Write(Value, SizeOf(Shortint));
  end else
  if (Value >= Low(SmallInt)) and (Value <= High(SmallInt)) then
  begin
    WriteValue(vaInt16);
    Write(Value, SizeOf(Smallint));
  end
  else
  begin
    WriteValue(vaInt32);
    Write(Value, SizeOf(Integer));
  end;
end;

procedure TWriter.WriteInteger(Value: Int64);
begin
  if (Value >= Low(Integer)) and (Value <= High(Integer)) then
    WriteInteger(Longint(Value))
  else
  begin
    WriteValue(vaInt64);
    Write(Value, Sizeof(Int64));
  end;
end;

procedure TWriter.WriteListBegin;
begin
  WriteValue(vaList);
end;

procedure TWriter.WriteListEnd;
begin
  WriteValue(vaNull);
end;

procedure TWriter.WritePrefix(Flags: TFilerFlags; AChildPos: Integer);
var
  Prefix: Byte;
begin
  if Flags <> [] then
  begin
    Prefix := $F0 or Byte(Flags);
    Write(Prefix, SizeOf(Prefix));
    if ffChildPos in Flags then WriteInteger(AChildPos);
  end;
end;

procedure TWriter.WriteProperties(Instance: TPersistent);
var
  I, Count: Integer;
  PropInfo: PPropInfo;
  PropList: PPropList;
begin
  Count := GetTypeData(Instance.ClassInfo)^.PropCount;
  if Count > 0 then
  begin
    GetMem(PropList, Count * SizeOf(Pointer));
    try
      GetPropInfos(Instance.ClassInfo, PropList);
      for I := 0 to Count - 1 do
      begin
        PropInfo := PropList^[I];
        if PropInfo = nil then
          Break;
        if IsStoredProp(Instance, PropInfo) then
          WriteProperty(Instance, PropInfo);
      end;
    finally
      FreeMem(PropList, Count * SizeOf(Pointer));
    end;
  end;
  Instance.DefineProperties(Self);
end;

function AncestorIsValid(Ancestor: TPersistent; Root, RootAncestor: TComponent): Boolean;
begin
  Result := (Ancestor <> nil) and (RootAncestor <> nil) and
            Root.InheritsFrom(RootAncestor.ClassType);
end;

function IsDefaultPropertyValue(Instance: TObject; PropInfo: PPropInfo;
  OnGetLookupInfo: TGetLookupInfoEvent; Writer: TWriter = nil;
  OnFindMethodName: TFindMethodNameEvent = nil): Boolean;
var
  PropType: PTypeInfo;
  Ancestor: TPersistent;
  LookupRoot: TComponent;
  RootAncestor: TComponent;
  Root: TComponent;
  AncestorValid: Boolean;

  function IsDefaultOrdProp: Boolean;
  var
    Value: Longint;
    Default: LongInt;
  begin
    Value := GetOrdProp(Instance, PropInfo);
    if AncestorValid then
      Result := Value = GetOrdProp(Ancestor, PropInfo)
    else
    begin
      Default := PPropInfo(PropInfo)^.Default;
      Result :=  (Default <> LongInt($80000000)) and (Value = Default);
    end;
  end;
  
  function IsDefaultFloatProp: Boolean;
  var
    Value: Extended;
  begin
    Value := GetFloatProp(Instance, PropInfo);
    if AncestorValid then
      Result := Value = GetFloatProp(Ancestor, PropInfo)
    else
      Result := Value = 0;
  end;

  function IsDefaultInt64Prop: Boolean;
  var
    Value: Int64;
  begin
    Value := GetInt64Prop(Instance, PropInfo);
    if AncestorValid then
      Result := Value = GetInt64Prop(Ancestor, PropInfo)
      else
    Result := Value = 0;
  end;

  function IsDefaultStrProp: Boolean;
  var
    Value: WideString;
  begin
    Value := GetWideStrProp(Instance, PropInfo);
    if AncestorValid then
      Result := Value = GetWideStrProp(Ancestor, PropInfo)
    else
      Result := Value = '';
  end;

  function ObjectAncestorMatch(AncestorValue, Value: TComponent): Boolean;
  begin
    Result := (AncestorValue <> nil) and (AncestorValue.Owner = RootAncestor) and
      (Value <> nil) and (Value.Owner = Root) and
      SameText(AncestorValue.Name, Value.Name);
  end;

  function IsDefaultObjectProp: Boolean;
  var
    Value: TObject;

    function IsDefault: Boolean;
    var
      AncestorValue: TObject;
    begin
      AncestorValue := nil;
      if AncestorValid then
      begin
        AncestorValue := TObject(GetOrdProp(Ancestor, PropInfo));
        if ObjectAncestorMatch(TComponent(AncestorValue), TComponent(Value)) then
          AncestorValue := Value;
      end;
      Result := Value = AncestorValue;
    end;

  begin
    Result := True;
    Value := TObject(GetOrdProp(Instance, PropInfo));
    if (Value = nil) and not IsDefault then
    begin
      Result := False; // nil wasn't the "default" value
    end
    else if Value is TPersistent then
    begin
      if (Value is TComponent) and
        not (csSubComponent in TComponent(Value).ComponentStyle) then
      begin
        if not IsDefault then
        begin
          // A non sub-component TComponent is only non-default if
          // it actually has a name (that way, it can be streamed out -
          // it can't be streamed without a name).
          if TComponent(Value).Name <> '' then
            Result := False;
        end
      end else
      begin
        Result := False; // The TPersistent should be checked for default's by the caller
      end;
    end;
  end;

  function IsDefaultInterfaceProp: Boolean;
  var
    Intf: IInterface;
    Value: TComponent;

    function IsDefaultValue: Boolean;
    var
      AncestorIntf: IInterface;
      ASR: IInterfaceComponentReference;
    begin
      Result := Intf = nil;
      if AncestorValid then
      begin
        AncestorIntf := GetInterfaceProp(Ancestor, PropInfo);
        Result := Intf = AncestorIntf;
        if not Result then
        begin
          if Supports(AncestorIntf, IInterfaceComponentReference, ASR) then
            Result := ObjectAncestorMatch(ASR.GetComponent, Value);
        end;
      end;
    end;

  var
    SR: IInterfaceComponentReference;
  begin
    Result := True;
    Intf := GetInterfaceProp(Instance, PropInfo);
    if (Intf = nil) or (not Supports(Intf, IInterfaceComponentReference, SR)) then
    begin
      if AncestorValid and (GetInterfaceProp(Ancestor, PropInfo) <> nil) then
        Result := False;
    end
    else
    begin
      Value := SR.GetComponent;
      if not IsDefaultValue then
      begin
        // We can only stream out components (ie: non-default ones)
        // if they actually have a name
        if Value.Name <> '' then
          Result := False;
      end;
    end;
  end;

  function FindMethodName(AMethod: TMethod): string;
  begin
    Result := '';
    if Assigned(OnFindMethodName) then
      OnFindMethodName(Writer, AMethod, Result);
    if Result = '' then
      Result := LookupRoot.MethodName(AMethod.Code);
  end;

  function IsDefaultMethodProp: Boolean;
  var
    Value: TMethod;
    DefaultCode: Pointer;
  begin
    Value := GetMethodProp(Instance, PropInfo);
    DefaultCode := nil;
    if AncestorValid then
      DefaultCode := GetMethodProp(Ancestor, PropInfo).Code;
    Result := (Value.Code = DefaultCode) or
      ((Value.Code <> nil) and (FindMethodName(Value) = ''));
  end;

  function IsDefaultVariantProp: Boolean;
  var
    Value: Variant;
  begin
    Value := GetVariantProp(Instance, PropInfo);
    if AncestorValid then
      Result := VarSameValue(Value, GetVariantProp(Ancestor, PropInfo))
    else
      Result := VarIsClear(Value);
  end;

begin
  Ancestor := nil;
  Root := nil;
  LookupRoot := nil;
  RootAncestor := nil;

  if Assigned(OnGetLookupInfo) then
    OnGetLookupInfo(Ancestor, Root, LookupRoot, RootAncestor);

  AncestorValid := AncestorIsValid(Ancestor, Root, RootAncestor);

  Result := True;
  if (PropInfo^.GetProc <> nil) and
     ((PropInfo^.SetProc <> nil) or
     ((PropInfo^.PropType^.Kind = tkClass) and
      (TObject(GetOrdProp(Instance, PropInfo)) is TComponent) and
      (csSubComponent in TComponent(GetOrdProp(Instance, PropInfo)).ComponentStyle))) then
  begin
    PropType := PropInfo^.PropType^;
    case PropType^.Kind of
      tkInteger, tkChar, tkWChar, tkEnumeration, tkSet:
        Result := IsDefaultOrdProp;
      tkFloat:
        Result := IsDefaultFloatProp;
      tkString, tkLString, tkWString, tkUString:
        Result := IsDefaultStrProp;
      tkClass:
        Result := IsDefaultObjectProp;
      tkMethod:
        Result := IsDefaultMethodProp;
      tkVariant:
        Result := IsDefaultVariantProp;
      tkInt64:
        Result := IsDefaultInt64Prop;
      tkInterface:
        Result := IsDefaultInterfaceProp;
    end;
  end;
end;

procedure TWriter.WriteProperty(Instance: TPersistent; PropInfo: PPropInfo);
var
  PropType: PTypeInfo;
  AncestorValid: Boolean;

  procedure WritePropPath;
  begin
    WritePropName(UTF8ToString(PPropInfo(PropInfo)^.Name));
  end;

  procedure WriteSet(Value: Longint);
  var
    I: Integer;
    BaseType: PTypeInfo;
  begin
    BaseType := GetTypeData(PropType)^.CompType^;
    WriteValue(vaSet);
    for I := 0 to SizeOf(TIntegerSet) * 8 - 1 do
      if I in TIntegerSet(Value) then
        WriteUTF8Str(GetSetElementName(BaseType, I));
    WriteStr('');
  end;

  procedure WriteIntProp(IntType: PTypeInfo; Value: Longint);
  var
    Ident: string;
    IntToIdent: TIntToIdent;
  begin
    IntToIdent := FindIntToIdent(IntType);
    if Assigned(IntToIdent) and IntToIdent(Value, Ident) then
      WriteIdent(Ident)
    else
      WriteInteger(Value);
  end;

  procedure WriteCollectionProp(Collection: TCollection);
  var
    SavePropPath: string;
  begin
    WritePropPath;
    SavePropPath := FPropPath;
    try
      FPropPath := '';
      WriteCollection(Collection);
    finally
      FPropPath := SavePropPath;
    end;
  end;

  procedure WriteOrdProp;
  var
    Value: Longint;
  begin
    Value := GetOrdProp(Instance, PropInfo);
    WritePropPath;
    case PropType^.Kind of
      tkInteger:
        WriteIntProp(PPropInfo(PropInfo)^.PropType^, Value);
      tkChar:
        WriteChar(Chr(Value));
      tkWChar:
        WriteWideChar(WideChar(Value));
      tkSet:
        WriteSet(Value);
      tkEnumeration:
        WriteIdent(GetEnumName(PropType, Value));
    end;
  end;

  procedure WriteFloatProp;
  var
    Value: Extended;
  begin
    Value := GetFloatProp(Instance, PropInfo);
    WritePropPath;
    WriteFloat(Value);
  end;

  procedure WriteInt64Prop;
  var
    Value: Int64;
  begin
    Value := GetInt64Prop(Instance, PropInfo);
    WritePropPath;
    WriteInteger(Value);
  end;

  procedure WriteStrProp;
  var
    Value: WideString;
  begin
    Value := GetWideStrProp(Instance, PropInfo);
    WritePropPath;
    WriteWideString(Value);
  end;

  function OwnedBy(Component, Owner: TComponent): Boolean;
  begin
    Result := True;
    while Component <> nil do
      if Component = Owner then
        Exit
      else
        Component := Component.Owner;
    Result := False;
  end;  

  function GetComponentValue(Component: TComponent): string;
  begin
    if Component.Owner = LookupRoot then
      Result := Component.Name
    else if Component = LookupRoot then
      Result := 'Owner'                                                       { Do not translate }
    else if (Component.Owner <> nil) and (Component.Owner.Name <> '') and
      (Component.Name <> '') then
      if OwnedBy(Component.Owner, LookupRoot) then
        Result := GetComponentValue(Component.Owner) + '.' + Component.Name
      else
        Result := Component.Owner.Name + '.' + Component.Name
    else if Component.Name <> '' then
      Result := Component.Name + '.Owner'                                     { Do not translate }
    else Result := '';
  end;

  procedure WriteObjectProp;
  var
    Value: TObject;
    OldAncestor: TPersistent;
    SavePropPath, ComponentValue: string;
  begin
    Value := TObject(GetOrdProp(Instance, PropInfo));
    if Value = nil then
    begin
      WritePropPath;
      WriteValue(vaNil);
    end
    else if Value is TPersistent then
      if (Value is TComponent) and
        not (csSubComponent in TComponent(Value).ComponentStyle) then
      begin
        ComponentValue := GetComponentValue(TComponent(Value));
        // ComponentValue will never be '' since we are to always
        // write out the value (in other words: it is not the default)
        // but it doesn't hurt to check
        if ComponentValue <> '' then
        begin
          WritePropPath;
          WriteIdent(ComponentValue);
        end;
      end else
      begin
        OldAncestor := Ancestor;
        SavePropPath := FPropPath;
        try
          FPropPath := FPropPath + UTF8ToString(PropInfo^.Name) + '.';
          if AncestorValid then
            Ancestor := TPersistent(GetOrdProp(Ancestor, PropInfo));
          WriteProperties(TPersistent(Value));
        finally
          Ancestor := OldAncestor;
          FPropPath := SavePropPath;
        end;
        if Value is TCollection then
        begin
          if not AncestorValid or
            not CollectionsEqual(TCollection(Value),
              TCollection(GetOrdProp(Ancestor, PropInfo)), FLookupRoot, FRootAncestor) then
              WriteCollectionProp(TCollection(Value));
        end;
      end;
  end;

  procedure WriteInterfaceProp;
  var
    Intf: IInterface;
    Value: TComponent;
  var
    SR: IInterfaceComponentReference;
    RefStr: String;
  begin
    Intf := GetInterfaceProp(Instance, PropInfo);
    if Intf = nil then
    begin
      WritePropPath;
      WriteValue(vaNil);
    end
    else if Supports(Intf, IInterfaceComponentReference, SR) then
    begin
      Value := SR.GetComponent;
      RefStr := GetComponentValue(Value);
      Assert(RefStr <> '', 'Component reference name should always be non blank'); 
      WritePropPath;
      WriteIdent(RefStr);
    end;
    // The else case will not happen because we are to always write out the
    // property at this point, so it will be nil, or support the reference
  end;

  procedure WriteMethodProp;
  var
    Value: TMethod;
  begin
    Value := GetMethodProp(Instance, PropInfo);
    WritePropPath;
    if Value.Code = nil then
      WriteValue(vaNil)
    else
      WriteIdent(FindMethodName(Value));
  end;

  procedure WriteVariantProp;
  var
    Value: Variant;
  begin
    Value := GetVariantProp(Instance, PropInfo);
    WritePropPath;
    WriteVariant(Value);
  end;

begin
  // Using IsDefaultPropertyValue will tell us if we should write out
  // a given property because it was different from the default or
  // different from the Ancestor (if applicable).
  if (PropInfo^.GetProc <> nil) and
     ((PropInfo^.SetProc <> nil) or
     ((PropInfo^.PropType^.Kind = tkClass) and
      (TObject(GetOrdProp(Instance, PropInfo)) is TComponent) and
      (csSubComponent in TComponent(GetOrdProp(Instance, PropInfo)).ComponentStyle))) then
  begin
    if not IsDefaultPropertyValue(Instance, PropInfo, GetLookupInfo, Self, FOnFindMethodName) then
    begin
      AncestorValid := AncestorIsValid(Ancestor, Root, RootAncestor);
      PropType := PropInfo^.PropType^;
      case PropType^.Kind of
        tkInteger, tkChar, tkWChar, tkEnumeration, tkSet:
          WriteOrdProp;
        tkFloat:
          WriteFloatProp;
        tkString, tkLString, tkWString, tkUString:
          WriteStrProp;
        tkClass:
          WriteObjectProp;
        tkMethod:
          WriteMethodProp;
        tkVariant:
          WriteVariantProp;
        tkInt64:
          WriteInt64Prop;
        tkInterface:
          WriteInterfaceProp;
      end;
    end;
  end;
end;

procedure TWriter.WriteVariant(const Value: Variant);
var
  CustomType: TCustomVariantType;
  OuterStream, InnerStream: TMemoryStream;
  OuterWriter: TWriter;
  StreamSize: Integer;
  VarStreamer: IVarStreamable;
  LInt64: Int64;
begin
  if VarIsArray(Value) then
    raise EWriteError.CreateRes(@SWriteError);
  case VarType(Value) and varTypeMask of
    varEmpty:
      WriteValue(vaNil);
    varNull:
      WriteValue(vaNull);
    varOleStr:
      WriteWideString(Value);
    varString:
      WriteString(Value);
    varByte, varShortInt, varWord, varSmallInt, varInteger:
      WriteInteger(Value);
    varSingle:
      WriteSingle(Value);
    varDouble:
      WriteFloat(Value);
    varCurrency:
      WriteCurrency(Value);
    varDate:
      WriteDate(Value);
    varBoolean:
      if Value then
        WriteValue(vaTrue)
      else
        WriteValue(vaFalse);
    varLongWord, varInt64:
      begin
        LInt64 := Value;
        WriteInteger(LInt64);
      end;
  else
    try
      if not FindCustomVariantType(TVarData(Value).VType, CustomType) or
         not Supports(Value, IVarStreamable, VarStreamer) then
        WriteString(Value)
      else
      begin
        InnerStream := nil;
        OuterStream := TMemoryStream.Create;
        try
          InnerStream := TMemoryStream.Create;
          OuterWriter := TWriter.Create(OuterStream, 1024);
          try
            VarStreamer.StreamOut(TVarData(Value), InnerStream);
            StreamSize := InnerStream.Size;

            OuterWriter.WriteString(CustomType.ClassName);
            OuterWriter.Write(StreamSize, SizeOf(StreamSize));
            OuterWriter.Write(InnerStream.Memory^, StreamSize);
          finally
            OuterWriter.Free;
          end;
          StreamSize := OuterStream.Size;
          WriteValue(vaBinary);
          Write(StreamSize, SizeOf(StreamSize));
          Write(OuterStream.Memory^, StreamSize);
        finally
          InnerStream.Free;
          OuterStream.Free;
        end;
      end;
    except
      raise EWriteError.CreateRes(@SWriteError);
    end;
  end;
end;

procedure TWriter.WritePropName(const PropName: string);
begin
  WriteUTF8Str(FPropPath + PropName);
end;

procedure TWriter.WriteRootComponent(Root: TComponent);
begin
  WriteDescendent(Root, nil);
end;

procedure TWriter.WriteSignature;
begin
  Write(FilerSignature, SizeOf(FilerSignature));
end;

procedure TWriter.WriteStr(const Value: AnsiString);
var
  L: Integer;
begin
  L := Length(Value);
  if L > 255 then L := 255;
  Write(L, SizeOf(Byte));
  Write(Value[1], L);
end;

procedure TWriter.WriteMinStr(const Value: UTF8String);
var
  L: Integer;
  Utf8Str: Boolean;
begin
  Utf8Str := False;
  for L := 1 to Length(Value) do
    if Value[L] > #127 then
    begin
      Utf8Str := True;
      Break;
    end;

  L := Length(Value);
  if Utf8Str then
  begin
    WriteValue(vaUtf8String);
    Write(L, SizeOf(Integer));
    Write(Pointer(Value)^, L);
  end
  else
  begin
    if L <= 255 then
    begin
      WriteValue(vaString);
      Write(L, SizeOf(Byte));
    end else
    begin
      WriteValue(vaLString);
      Write(L, SizeOf(Integer));
    end;
    Write(Pointer(Value)^, L);
  end;
end;

procedure TWriter.WriteString(const Value: UnicodeString);
var
  L: Integer;
  Utf8Str: UTF8String;
begin
  Utf8Str := UTF8String(Value);
  if Length(Utf8Str) < (Length(Value) * SizeOf(WideChar)) then
    WriteMinStr(Utf8Str)
  else
  begin
    WriteValue(vaWString);
    L := Length(Value);
    Write(L, SizeOf(Integer));
    Write(Pointer(Value)^, L * 2);
  end;
end;

procedure TWriter.WriteUTF8Str(const Value: string);
var
  U: UTF8String;
  L: Integer;
begin
  U := UTF8String(Value);
  L := Length(U);
  if L > 255 then L := 255;
  Write(L, SizeOf(Byte));
  Write(U[1], L);
end;

procedure TWriter.WriteWideString(const Value: UnicodeString);
begin
  WriteString(Value);
end;

procedure TWriter.WriteValue(Value: TValueType);
begin
  Write(Value, SizeOf(Value));
end;

procedure TWriter.GetLookupInfo(var Ancestor: TPersistent; var Root,
  LookupRoot, RootAncestor: TComponent);
begin
  Ancestor := Self.Ancestor;
  Root := Self.Root;
  LookupRoot := Self.LookupRoot;
  RootAncestor := Self.RootAncestor;
end;

{ TParser }

const
  ParseBufSize = 4096;

procedure BinToHex(Buffer: PAnsiChar; Text: PAnsiChar; BufSize: Integer);
const
  Convert: array[0..15] of AnsiChar = AnsiString('0123456789ABCDEF');
var
  I: Integer;
begin
  for I := 0 to BufSize - 1 do
  begin
    Text[0] := Convert[Byte(Buffer[I]) shr 4];
    Text[1] := Convert[Byte(Buffer[I]) and $F];
    Inc(Text, 2);
  end;
end;

procedure BinToHex(Buffer: PAnsiChar; Text: PWideChar; BufSize: Integer);
const
  Convert: array[0..15] of WideChar = '0123456789ABCDEF';
var
  I: Integer;
begin
  for I := 0 to BufSize - 1 do
  begin
    Text[0] := Convert[Byte(Buffer[I]) shr 4];
    Text[1] := Convert[Byte(Buffer[I]) and $F];
    Inc(Text, 2);
  end;
end;

procedure BinToHex(var Buffer; Text: PWideChar; BufSize: Integer);
begin
  BinToHex(@Buffer, Text, BufSize);
end;

procedure BinToHex(var Buffer; Text: PAnsiChar; BufSize: Integer);
begin
  BinToHex(@Buffer, Text, BufSize);
end;

procedure BinToHex(Buffer: Pointer; Text: PWideChar; BufSize: Integer);
begin
  BinToHex(PAnsiChar(Buffer), Text, BufSize);
end;

procedure BinToHex(Buffer: Pointer; Text: PAnsiChar; BufSize: Integer);
begin
  BinToHex(PAnsiChar(Buffer), Text, BufSize);
end;

function HexToBin(Text : PWideChar; Buffer: PAnsiChar; BufSize: Integer): Integer;
const
  Convert: array['0'..'f'] of SmallInt =
    ( 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,-1,-1,-1,-1,-1,-1,
     -1,10,11,12,13,14,15,-1,-1,-1,-1,-1,-1,-1,-1,-1,
     -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
     -1,10,11,12,13,14,15);
var
  I: Integer;
begin
  I := BufSize;
  while I > 0 do
  begin
    if ((Text[0] in [':'..'@']) or (Text[0] in ['G'..#96])) or
       ((Text[1] in [':'..'@']) or (Text[1] in ['G'..#96])) then
       Break;
    if not (Text[0] in ['0'..'f']) or not (Text[1] in ['0'..'f']) then Break;
    Buffer[0] := AnsiChar((Convert[AnsiChar(Text[0])] shl 4) + Convert[AnsiChar(Text[1])]);
    Inc(Buffer);
    Inc(Text, 2);
    Dec(I);
  end;
  Result := BufSize - I;
end;

function HexToBin(Text : PAnsiChar; Buffer: PAnsiChar; BufSize: Integer): Integer;
const
  Convert: array['0'..'f'] of SmallInt =
    ( 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,-1,-1,-1,-1,-1,-1,
     -1,10,11,12,13,14,15,-1,-1,-1,-1,-1,-1,-1,-1,-1,
     -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
     -1,10,11,12,13,14,15);
var
  I: Integer;
begin
  I := BufSize;
  while I > 0 do
  begin
    if not (Text[0] in ['0'..'f']) or not (Text[1] in ['0'..'f']) then Break;
    Buffer[0] := AnsiChar((Convert[Text[0]] shl 4) + Convert[Text[1]]);
    Inc(Buffer);
    Inc(Text, 2);
    Dec(I);
  end;
  Result := BufSize - I;
end;

function HexToBin(Text: PWideChar; var Buffer; BufSize: Integer): Integer;
begin
  Result := HexToBin(Text, PAnsiChar(@Buffer), BufSize);
end;

function HexToBin(Text: PAnsiChar; var Buffer; BufSize: Integer): Integer;
begin
  Result := HexToBin(Text, PAnsiChar(@Buffer), BufSize);
end;

function HexToBin(Text: PWideChar; Buffer: Pointer; BufSize: Integer): Integer;
begin
  Result := HexToBin(Text, PAnsiChar(Buffer), BufSize);
end;

function HexToBin(Text: PAnsiChar; Buffer: Pointer; BufSize: Integer): Integer;
begin
  Result := HexToBin(Text, PAnsiChar(Buffer), BufSize);
end;

constructor TParser.Create(Stream: TStream; AOnError: TParserErrorEvent = nil);
begin
  { Call the other constructor. Use default format settings. }
  Create(Stream, FormatSettings, AOnError);
end;

constructor TParser.Create(Stream: TStream; const FormatSettings: TFormatSettings; AOnError: TParserErrorEvent = nil);
begin
  inherited Create;
  FFormatSettings := FormatSettings;
  FStream := Stream;
  SetLength(FBuffer, ParseBufSize);
  FBuffer[0] := 0;
  FBufPtr := 0;
  FBufEnd := ParseBufSize - 1;
  FSourcePtr := 0;
  FSourceEnd := 0;
  FTokenPtr := 0;
  FSourceLine := 1;
  FOnError := AOnError;
  ReadBuffer;
  FSourcePtr := FSourcePtr + TEncoding.GetBufferEncoding(FBuffer, FEncoding);
  if (FEncoding = nil) or ((FEncoding <> TEncoding.ASCII) and (FEncoding <> TEncoding.ANSI) and (FEncoding <> TEncoding.UTF8)) then
    Error(SAnsiUTF8Expected);
  NextToken;
end;

destructor TParser.Destroy;
begin
  if Length(FBuffer) > 0 then
    FStream.Seek(Int64(FTokenPtr) - Int64(FBufPtr), TSeekOrigin.soCurrent);
  inherited Destroy;
end;

function UTF8Len(B: Byte): Integer; inline;
begin
  case B of
    $00..$7F: Result := 1; //
    $C2..$DF: Result := 2; // 110x xxxx C0 - DF
    $E0..$EF: Result := 3; // 1110 xxxx E0 - EF
    $F0..$F7: Result := 4; // 1111 0xxx F0 - F7 // outside traditional UNICODE
  else
    Result := 0; // Illegal leading character.
  end;
end;

function UTF8ToCategory(const ABuffer: TBytes; var ABufPos: Integer): TUnicodeCategory;
var
  CharSize: Integer;
  C: UCS4Char;
begin
  CharSize := UTF8Len(ABuffer[ABufPos]);
  Assert((CharSize > 0) and (CharSize + ABufPos < Length(ABuffer)), 'Invalid UTF8 Character'); // do not localize
  case CharSize of
    1: C := UCS4Char(ABuffer[ABufPos]);
    2: C := UCS4Char(((ABuffer[ABufPos] and $1F) shl 6 ) or (ABuffer[ABufPos + 1] and $3F));
    3: C := UCS4Char(((ABuffer[ABufPos] and $0F) shl 12) or ((ABuffer[ABufPos + 1] and $3F) shl 6 ) or (ABuffer[ABufPos + 2] and $3F));
    4: C := UCS4Char(((ABuffer[ABufPos] and $07) shl 18) or ((ABuffer[ABufPos + 1] and $3F) shl 12) or ((ABuffer[ABufPos + 2] and $3F) shl 6) or (ABuffer[ABufPos + 2] and $3F));
  else
    C := 0;
  end;
  Inc(ABufPos, CharSize);
  if C > $0000FFFF then
    Result := TCharacter.GetUnicodeCategory(TCharacter.ConvertFromUtf32(C), 1)
  else
    Result := TCharacter.GetUnicodeCategory(Char(C));
end;

function TParser.CharType(var ABufPos: Integer): TCharType;
begin
  Inc(ABufPos);
  case Char(FBuffer[ABufPos - 1]) of
    'A'..'Z', 'a'..'z', '_': Result := ctLetterStart;
    '0'..'9': Result := ctNumber;
    '#': Result := ctHash;
    '-': Result := ctDash;
    '$': Result := ctDollar;
    '''': Result := ctQuote;
  else
    if (FEncoding = TEncoding.UTF8) and (FBuffer[ABufPos - 1] > 127) then
    begin
      Dec(ABufPos);
      case UTF8ToCategory(FBuffer, ABufPos) of
        TUnicodeCategory.ucLowercaseLetter,
        TUnicodeCategory.ucModifierLetter,
        TUnicodeCategory.ucOtherLetter,
        TUnicodeCategory.ucTitlecaseLetter,
        TUnicodeCategory.ucUppercaseLetter,
        TUnicodeCategory.ucLetterNumber:
          Result := ctLetterStart;

        TUnicodeCategory.ucCombiningMark,
        TUnicodeCategory.ucNonSpacingMark,
        TUnicodeCategory.ucConnectPunctuation,
        TUnicodeCategory.ucFormat,
        TUnicodeCategory.ucDecimalNumber:
          Result := ctLetterNumber;
      else
        Result := ctOther;
      end;
    end else
      Result := ctOther;
  end;
end;

procedure TParser.CheckToken(T: Char);
begin
  if Token <> T then
    case T of
      toSymbol:
        Error(SIdentifierExpected);
      System.Classes.toString, toWString:
        Error(SStringExpected);
      toInteger, toFloat:
        Error(SNumberExpected);
    else
      ErrorFmt(SCharExpected, [T]);
    end;
end;

procedure TParser.CheckTokenSymbol(const S: string);
begin
  if not TokenSymbolIs(S) then
    ErrorFmt(SSymbolExpected, [S]);
end;

procedure TParser.Error(const Ident: string);
begin
  ErrorStr(Ident);
end;

procedure TParser.ErrorFmt(const Ident: string; const Args: array of const);
begin
  ErrorStr(Format(Ident, Args));
end;

procedure TParser.ErrorStr(const Message: string);
var
  Handled: Boolean;
begin
  Handled := False;
  if Assigned(FOnError) then
    FOnError(Self, Message, Handled);
  if not Handled then
    raise EParserError.CreateResFmt(@SParseError, [Message, FSourceLine]);
end;

function TParser.GetLinePos: Integer;
begin
  Result := FTokenPtr - LineStart(FBuffer, FTokenPtr);
end;

procedure TParser.HexToBinary(Stream: TStream);
var
  Count: Integer;
  Buffer: array[0..255] of Byte;
begin
  SkipBlanks;
  while Char(FBuffer[FSourcePtr]) <> '}' do
  begin
    Count := HexToBin(PAnsiChar(@FBuffer[FSourcePtr]), Buffer, SizeOf(Buffer));
    if Count = 0 then
    begin
      Error(SInvalidBinary);
      Exit;
    end;
    Stream.Write(Buffer, Count);
    Inc(FSourcePtr, Count * 2);
    SkipBlanks;
  end;
  NextToken;
end;

function TParser.NextToken: Char;
var
  I, J: Integer;
  IsWideStr: Boolean;
  P, Q, S: Integer;
begin
  SkipBlanks;
  P := FSourcePtr;
  FTokenPtr := P;
  Q := P;
  case CharType(Q) of
    ctLetterStart:
      begin
        P := Q;
        while CharType(Q) in [ctLetterStart, ctLetterNumber, ctNumber] do
          P := Q;
        Result := toSymbol;
      end;
    ctHash, ctQuote:
      begin
        IsWideStr := False;
        J := 0;
        S := P;
        while True do
          case Char(FBuffer[P]) of
            '#':
              begin
                Inc(P);
                I := 0;
                while AnsiChar(FBuffer[P]) in ['0'..'9'] do
                begin
                  I := I * 10 + (FBuffer[P] - Ord('0'));
                  Inc(P);
                end;
                if (I > 127) then
                  IsWideStr := True;
                Inc(J);
              end;
            '''':
              begin
                Inc(P);
                while True do
                begin
                  case AnsiChar(FBuffer[P]) of
                    #0, #10, #13:
                      begin
                        Error(SInvalidString);
                        Break;
                      end;
                    '''':
                      begin
                        Inc(P);
                        if Char(FBuffer[P]) <> '''' then
                          Break;
                      end;
                  end;
                  Inc(J);
                  Inc(P);
                end;
              end;
          else
            Break;
          end;
        P := S;
        if IsWideStr then
          SetLength(FWideStr, J);
        J := 1;
        while True do
          case Char(FBuffer[P]) of
            '#':
              begin
                Inc(P);
                I := 0;
                while AnsiChar(FBuffer[P]) in ['0'..'9'] do
                begin
                  I := I * 10 + (FBuffer[P] - Ord('0'));
                  Inc(P);
                end;
                if IsWideStr then
                begin
                  FWideStr[J] := WideChar(SmallInt(I));
                  Inc(J);
                end else
                begin
                  FBuffer[S] := I;
                  Inc(S);
                end;
              end;
            '''':
              begin
                Inc(P);
                while True do
                begin
                  case FBuffer[P] of
                    0, 10, 13:
                      begin
                        Error(SInvalidString);
                        Break;
                      end;
                    Ord(''''):
                      begin
                        Inc(P);
                        if FBuffer[P] <> Ord('''') then
                          Break;
                      end;
                  end;
                  if IsWideStr then
                  begin
                    FWideStr[J] := WideChar(FBuffer[P]);
                    Inc(J);
                  end else
                  begin
                    FBuffer[S] := FBuffer[P];
                    Inc(S);
                  end;
                  Inc(P);
                end;
              end;
          else
            Break;
          end;
        FStringPtr := S;
        if IsWideStr then
          Result := toWString
        else
          Result := System.Classes.toString;
      end;
    ctDollar:
      begin
        Inc(P);
        while AnsiChar(FBuffer[P]) in ['0'..'9', 'A'..'F', 'a'..'f'] do
          Inc(P);
        Result := toInteger;
      end;
    ctDash, ctNumber:
      begin
        Inc(P);
        while AnsiChar(FBuffer[P]) in ['0'..'9'] do
          Inc(P);
        Result := toInteger;
        while AnsiChar(FBuffer[P]) in ['0'..'9', '.', 'e', 'E', '+', '-'] do
        begin
          Inc(P);
          Result := toFloat;
        end;
        if AnsiChar(FBuffer[P]) in ['c', 'C', 'd', 'D', 's', 'S', 'f', 'F'] then
        begin
          Result := toFloat;
          FFloatType := Char(FBuffer[P]);
          Inc(P);
        end else
          FFloatType := #0;
      end;
  else
    Result := Char(FBuffer[P]);
    if Result <> toEOF then
      Inc(P);
  end;
  FSourcePtr := P;
  FToken := Result;
end;

procedure TParser.ReadBuffer;
var
  Count: Integer;
begin
  Inc(FOrigin, FSourcePtr);
  FBuffer[FSourceEnd] := FSaveChar;
  Count := FBufPtr - FSourcePtr;
  if Count <> 0 then
    Move(FBuffer[FSourcePtr], FBuffer[0], Count);
  FBufPtr := Count;
  Inc(FBufPtr, FStream.Read(FBuffer[FBufPtr], FBufEnd - FBufPtr));
  FSourcePtr := 0;
  FSourceEnd := FBufPtr;
  if FSourceEnd = FBufEnd then
  begin
    FSourceEnd := LineStart(FBuffer, FSourceEnd - 1);
    if FSourceEnd = 0 then
      Error(SLineTooLong);
  end;
  FSaveChar := FBuffer[FSourceEnd];
  FBuffer[FSourceEnd] := 0;
end;

procedure TParser.SkipBlanks;
begin
  while True do
  begin
    case FBuffer[FSourcePtr] of
      0:
        begin
          ReadBuffer;
          if FBuffer[FSourcePtr] = 0 then
            Exit;
          Continue;
        end;
      10:
        Inc(FSourceLine);
      33..255:
        Exit;
    end;
    Inc(FSourcePtr);
  end;
end;

function TParser.SourcePos: Longint;
begin
  Result := FOrigin + FTokenPtr;
end;

function TParser.TokenFloat: Extended;
begin
  if FFloatType <> #0 then
    Dec(FSourcePtr);
  Result := StrToFloat(TokenString, FFormatSettings);
  if FFloatType <> #0 then
    Inc(FSourcePtr);
end;

function TParser.TokenInt: Int64;
begin
  Result := StrToInt64(TokenString);
end;

function TParser.TokenString: string;
var
  L: Integer;
begin
  if FToken = System.Classes.toString then
    L := FStringPtr - FTokenPtr
  else
    L := FSourcePtr - FTokenPtr;
  Result := FEncoding.GetString(FBuffer, FTokenPtr, L);
end;

function TParser.TokenWideString: UnicodeString;
begin
  if FToken = System.Classes.toString then
    Result := TokenString
  else
    Result := FWideStr;
end;

function TParser.TokenSymbolIs(const S: string): Boolean;
begin
  Result := (Token = toSymbol) and SameText(S, TokenString);
end;

function TParser.TokenComponentIdent: string;
var
  P, Q: Integer;
begin
  CheckToken(toSymbol);
  P := FSourcePtr;
  while FBuffer[P] = Ord('.') do
  begin
    Inc(P);
    Q := P;
    if CharType(Q) <> ctLetterStart then
      Error(SIdentifierExpected);
    repeat
      P := Q;
    until not (CharType(Q) in [ctLetterStart, ctLetterNumber, ctNumber]);
  end;
  FSourcePtr := P;
  Result := TokenString;
end;

{ Binary to text conversion }

procedure ObjectBinaryToText(Input, Output: TStream);
var
  NestingLevel: Integer;
  Reader: TReader;
  Writer: TWriter;
  ObjectName, PropName: string;
  UTF8Idents: Boolean;
  MemoryStream: TMemoryStream;
  LFormatSettings: TFormatSettings;

  procedure WriteIndent;
  const
    Blanks: array[0..1] of AnsiChar = (#32, #32); //'  ';
  var
    I: Integer;
  begin
    for I := 1 to NestingLevel do Writer.Write(Blanks, SizeOf(Blanks));
  end;

  procedure WriteStr(const S: RawByteString); overload;
  begin
    Writer.Write(S[1], Length(S));
  end;

  procedure WriteStr(const S: UnicodeString); overload; inline;
  begin
    WriteStr(AnsiString(S));
  end;

  procedure WriteUTF8Str(const S: string);
  var
    Ident: UTF8String;
  begin
    Ident := UTF8Encode(S);
    if not UTF8Idents and (Length(Ident) > Length(S)) then
      UTF8Idents := True;
    WriteStr(Ident);
  end;

  procedure NewLine;
  begin
    WriteStr(sLineBreak);
    WriteIndent;
  end;

  procedure ConvertValue; forward;

  procedure ConvertHeader;
  var
    ClassName: string;
    Flags: TFilerFlags;
    Position: Integer;
  begin
    Reader.ReadPrefix(Flags, Position);
    ClassName := Reader.ReadStr;
    ObjectName := Reader.ReadStr;
    WriteIndent;
    if ffInherited in Flags then
      WriteStr('inherited ')
    else if ffInline in Flags then
      WriteStr('inline ')
    else
      WriteStr('object ');
    if ObjectName <> '' then
    begin
      WriteUTF8Str(ObjectName);
      WriteStr(': ');
    end;
    WriteUTF8Str(ClassName);
    if ffChildPos in Flags then
    begin
      WriteStr(' [');
      WriteStr(IntToStr(Position));
      WriteStr(']');
    end;

    if ObjectName = '' then
      ObjectName := ClassName;  // save for error reporting

    WriteStr(sLineBreak);
  end;

  procedure ConvertBinary;
  const
    BytesPerLine = 32;
  var
    MultiLine: Boolean;
    I: Integer;
    Count: Longint;
    Buffer: array[0..BytesPerLine - 1] of AnsiChar;
    Text: array[0..BytesPerLine * 2 - 1] of AnsiChar;
  begin
    Reader.ReadValue;
    WriteStr('{');
    Inc(NestingLevel);
    Reader.Read(Count, SizeOf(Count));
    MultiLine := Count >= BytesPerLine;
    while Count > 0 do
    begin
      if MultiLine then NewLine;
      if Count >= 32 then I := 32 else I := Count;
      Reader.Read(Buffer, I);
      BinToHex(Buffer, Text, I);
      Writer.Write(Text, I * 2);
      Dec(Count, I);
    end;
    Dec(NestingLevel);
    WriteStr('}');
  end;

  procedure ConvertProperty; forward;

  procedure ConvertValue;
  const
    LineLength = 64;
  var
    I, J, K, L: Integer;
    S: AnsiString;
    W: UnicodeString;
    LineBreak: Boolean;
  begin
    case Reader.NextValue of
      vaList:
        begin
          Reader.ReadValue;
          WriteStr('(');
          Inc(NestingLevel);
          while not Reader.EndOfList do
          begin
            NewLine;
            ConvertValue;
          end;
          Reader.ReadListEnd;
          Dec(NestingLevel);
          WriteStr(')');
        end;
      vaInt8, vaInt16, vaInt32:
        WriteStr(IntToStr(Reader.ReadInteger));
      vaExtended, vaDouble:
        WriteStr(FloatToStrF(Reader.ReadFloat, ffFixed, 16, 18, LFormatSettings));
      vaSingle:
        WriteStr(FloatToStr(Reader.ReadSingle, LFormatSettings) + 's');
      vaCurrency:
        WriteStr(FloatToStr(Reader.ReadCurrency * 10000, LFormatSettings) + 'c');
      vaDate:
        WriteStr(FloatToStr(Reader.ReadDate, LFormatSettings) + 'd');
      vaWString, vaUTF8String:
        begin
          W := Reader.ReadWideString;
          L := Length(W);
          if L = 0 then WriteStr('''''') else
          begin
            I := 1;
            Inc(NestingLevel);
            try
              if L > LineLength then NewLine;
              K := I;
              repeat
                LineBreak := False;
                if (W[I] >= ' ') and (W[I] <> '''') and (Ord(W[i]) <= 127) then
                begin
                  J := I;
                  repeat
                    Inc(I)
                  until (I > L) or (W[I] < ' ') or (W[I] = '''') or
                    ((I - K) >= LineLength) or (Ord(W[i]) > 127);
                  if ((I - K) >= LineLength) then LineBreak := True;
                  WriteStr('''');
                  while J < I do
                  begin
                    WriteStr(AnsiChar(W[J]));
                    Inc(J);
                  end;
                  WriteStr('''');
                end else
                begin
                  WriteStr('#');
                  WriteStr(IntToStr(Ord(W[I])));
                  Inc(I);
                  if ((I - K) >= LineLength) then LineBreak := True;
                end;
                if LineBreak and (I <= L) then
                begin
                  WriteStr(' +');
                  NewLine;
                  K := I;
                end;
              until I > L;
            finally
              Dec(NestingLevel);
            end;
          end;
        end;
      vaString, vaLString:
        begin
          S := AnsiString(Reader.ReadString);
          L := Length(S);
          if L = 0 then WriteStr('''''') else
          begin
            I := 1;
            Inc(NestingLevel);
            try
              if L > LineLength then NewLine;
              K := I;
              repeat
                LineBreak := False;
                if (S[I] >= ' ') and (S[I] <> '''') then
                begin
                  J := I;
                  repeat
                    Inc(I)
                  until (I > L) or (S[I] < ' ') or (S[I] = '''') or
                    ((I - K) >= LineLength);
                  if ((I - K) >= LineLength) then
                  begin
                    LIneBreak := True;
                    if ByteType(S, I) = mbTrailByte then Dec(I);
                  end;
                  WriteStr('''');
                  Writer.Write(S[J], I - J);
                  WriteStr('''');
                end else
                begin
                  WriteStr('#');
                  WriteStr(IntToStr(Ord(S[I])));
                  Inc(I);
                  if ((I - K) >= LineLength) then LineBreak := True;
                end;
                if LineBreak and (I <= L) then
                begin
                  WriteStr(' +');
                  NewLine;
                  K := I;
                end;
              until I > L;
            finally
              Dec(NestingLevel);
            end;
          end;
        end;
      vaIdent, vaFalse, vaTrue, vaNil, vaNull:
        WriteUTF8Str(Reader.ReadIdent);
      vaBinary:
        ConvertBinary;
      vaSet:
        begin
          Reader.ReadValue;
          WriteStr('[');
          I := 0;
          while True do
          begin
            S := AnsiString(Reader.ReadStr);
            if S = '' then Break;
            if I > 0 then WriteStr(', ');
            WriteStr(S);
            Inc(I);
          end;
          WriteStr(']');
        end;
      vaCollection:
        begin
          Reader.ReadValue;
          WriteStr('<');
          Inc(NestingLevel);
          while not Reader.EndOfList do
          begin
            NewLine;
            WriteStr('item');
            if Reader.NextValue in [vaInt8, vaInt16, vaInt32] then
            begin
              WriteStr(' [');
              ConvertValue;
              WriteStr(']');
            end;
            WriteStr(sLineBreak);
            Reader.CheckValue(vaList);
            Inc(NestingLevel);
            while not Reader.EndOfList do
              ConvertProperty;
            Reader.ReadListEnd;
            Dec(NestingLevel);
            WriteIndent;
            WriteStr('end');
          end;
          Reader.ReadListEnd;
          Dec(NestingLevel);
          WriteStr('>');
        end;
      vaInt64:
        WriteStr(IntToStr(Reader.ReadInt64));
    else
      raise EReadError.CreateResFmt(@sPropertyException,
        [ObjectName, DotSep, PropName, IntToStr(Ord(Reader.NextValue))]);
    end;
  end;

  procedure ConvertProperty;
  begin
    WriteIndent;
    PropName := Reader.ReadStr;  // save for error reporting
    WriteUTF8Str(PropName);
    WriteStr(' = ');
    ConvertValue;
    WriteStr(sLineBreak);
  end;

  procedure ConvertObject;
  begin
    ConvertHeader;
    Inc(NestingLevel);
    while not Reader.EndOfList do
      ConvertProperty;
    Reader.ReadListEnd;
    while not Reader.EndOfList do
      ConvertObject;
    Reader.ReadListEnd;
    Dec(NestingLevel);
    WriteIndent;
    WriteStr('end' + sLineBreak);
  end;

begin
  NestingLevel := 0;
  UTF8Idents := False;
  Reader := TReader.Create(Input, 4096);
  LFormatSettings := TFormatSettings.Create('en-US'); // do not localize
  LFormatSettings.DecimalSeparator := AnsiChar('.');
  try
    MemoryStream := TMemoryStream.Create;
    try
      Writer := TWriter.Create(MemoryStream, 4096);
      try
        Reader.ReadSignature;
        ConvertObject;
      finally
        Writer.Free;
      end;
      if UTF8Idents then
        Output.Write(TEncoding.UTF8.GetPreamble[0], 3);
      Output.Write(MemoryStream.Memory^, MemoryStream.Size);
    finally
      MemoryStream.Free;
    end;
  finally
    Reader.Free;
  end;
end;

type
  TObjectTextConvertProc = procedure (Input, Output: TStream);
  TBinarySignature = record
    BinarySignature: Integer;
    SignatureLength: Integer;
  end;

function Min(I1, I2: Integer): Integer; inline;
begin
  if I1 < I2 then
    Result := I1
  else
    Result := I2;
end;

function IsBinary(Input: TStream; const Signatures: array of TBinarySignature): Boolean;
var
  I: Integer;
  Signature: Integer;
  Pos: Integer;
begin
  Pos := Input.Position;
  for I := Low(Signatures) to High(Signatures) do
  begin
    Signature := 0;
    Input.Read(Signature, Min(Signatures[I].SignatureLength, SizeOf(Signature)));
    Input.Position := Pos;
    if Signature = Signatures[I].BinarySignature then
      Exit(True);
  end;
  Result := False;
end;

procedure InternalBinaryToText(Input, Output: TStream;
  var OriginalFormat: TStreamOriginalFormat;
  ConvertProc: TObjectTextConvertProc; const Signatures: array of TBinarySignature);
var
  Pos: Integer;
  Signature: Integer;
begin
  Pos := Input.Position;
  if IsBinary(Input, Signatures) then
  begin     // definitely binary format
    if OriginalFormat = sofBinary then
      Output.CopyFrom(Input, Input.Size - Input.Position)
    else
    begin
      if OriginalFormat = sofUnknown then
        Originalformat := sofBinary;
      ConvertProc(Input, Output);
    end;
  end else  // might be text format
  begin
    Input.Read(Signature, SizeOf(Signature));
    Input.Position := Pos;
    if OriginalFormat = sofBinary then
      ConvertProc(Input, Output)
    else
    begin
      if OriginalFormat = sofUnknown then
      begin   // text format may begin with "object", "inherited", or whitespace
        if AnsiChar(Signature) in ['o','O','i','I',' ',#13,#11,#9] then
          OriginalFormat := sofText
        else if (Signature and $00FFFFFF) = $00BFBBEF then
          OriginalFormat := sofUTF8Text
        else    // not binary, not text... let it raise the exception
        begin
          ConvertProc(Input, Output);
          Exit;
        end;
      end;
      if OriginalFormat in [sofText, sofUTF8Text] then
        Output.CopyFrom(Input, Input.Size - Input.Position);
    end;
  end;
end;

procedure InternalTextToBinary(Input, Output: TStream;
  var OriginalFormat: TStreamOriginalFormat;
  ConvertProc: TObjectTextConvertProc; const Signatures: array of TBinarySignature);
var
  Pos: Integer;
  Signature: Integer;
begin
  Pos := Input.Position;
  if IsBinary(Input, Signatures) then
  begin     // definitely binary format
    if OriginalFormat = sofUnknown then
      Originalformat := sofBinary;
    if OriginalFormat = sofBinary then
      Output.CopyFrom(Input, Input.Size - Input.Position)
    else    // let it raise the exception
      ConvertProc(Input, Output);
  end else  // might be text format
  begin
    Input.Read(Signature, SizeOf(Signature));
    Input.Position := Pos;
    case OriginalFormat of
      sofUnknown:
        begin  // text format may begin with "object", "inherited", or whitespace
          if AnsiChar(Signature) in ['o','O','i','I',' ',#13,#11,#9] then
            OriginalFormat := sofText
          else if (Signature and $00FFFFFF) = $00BFBBEF then
            OriginalFormat := sofUTF8Text;
          // if its not binary, not text... let it raise the exception
          ConvertProc(Input, Output);
        end;
      sofBinary:   ConvertProc(Input, Output);
      sofText,
      sofUTF8Text: Output.CopyFrom(Input, Input.Size - Input.Position);
    end;
  end;
end;

const
  FilerSignatures: array[0..0] of TBinarySignature = (
   (BinarySignature: Integer(Ord('0') shl 24 + Ord('F') shl 16 + Ord('P') shl 8 + Ord('T'));
    SignatureLength: SizeOf(Integer)));

procedure ObjectBinaryToText(Input, Output: TStream;
  var OriginalFormat: TStreamOriginalFormat);
begin
  InternalBinaryToText(Input, Output, OriginalFormat, ObjectBinaryToText, FilerSignatures);
end;

{ Text to binary conversion }

procedure ObjectTextToBinary(Input, Output: TStream);
var
  Parser: TParser;
  Writer: TWriter;
  FFmtSettings: TFormatSettings;
  TokenStr: AnsiString;

  function ConvertOrderModifier: Integer;
  begin
    Result := -1;
    if Parser.Token = '[' then
    begin
      Parser.NextToken;
      Parser.CheckToken(toInteger);
      Result := Parser.TokenInt;
      Parser.NextToken;
      Parser.CheckToken(']');
      Parser.NextToken;
    end;
  end;

  procedure ConvertHeader(IsInherited, IsInline: Boolean);
  var
    ClassName, ObjectName: string;
    Flags: TFilerFlags;
    Position: Integer;
  begin
    Parser.CheckToken(toSymbol);
    ClassName := Parser.TokenString;
    ObjectName := '';
    if Parser.NextToken = ':' then
    begin
      Parser.NextToken;
      Parser.CheckToken(toSymbol);
      ObjectName := ClassName;
      ClassName := Parser.TokenString;
      Parser.NextToken;
    end;
    Flags := [];
    Position := ConvertOrderModifier;
    if IsInherited then
      Include(Flags, ffInherited);
    if IsInline then
      Include(Flags, ffInline);
    if Position >= 0 then
      Include(Flags, ffChildPos);
    Writer.WritePrefix(Flags, Position);
    Writer.WriteUTF8Str(ClassName);
    Writer.WriteUTF8Str(ObjectName);
  end;

  procedure ConvertProperty; forward;

  procedure ConvertValue;
  var
    Order: Integer;

    function CombineWideString: WideString;
    begin
      Result := Parser.TokenWideString;
      while Parser.NextToken = '+' do
      begin
        Parser.NextToken;
        if not (Parser.Token in [System.Classes.toString, toWString]) then
          Parser.CheckToken(System.Classes.toString);
        Result := Result + Parser.TokenWideString;
      end;
    end;

  begin
    if Parser.Token in [System.Classes.toString, toWString] then
      Writer.WriteWideString(CombineWideString)
    else
    begin
      case Parser.Token of
        toSymbol:
          Writer.WriteIdent(Parser.TokenComponentIdent);
        toInteger:
          Writer.WriteInteger(Parser.TokenInt);
        toFloat:
          begin
            case Parser.FloatType of
              's', 'S': Writer.WriteSingle(Parser.TokenFloat);
              'c', 'C': Writer.WriteCurrency(Parser.TokenFloat / 10000);
              'd', 'D': Writer.WriteDate(Parser.TokenFloat);
            else
              Writer.WriteFloat(Parser.TokenFloat);
            end;
          end;
        '[':
          begin
            Parser.NextToken;
            Writer.WriteValue(vaSet);
            if Parser.Token <> ']' then
              while True do
              begin
                TokenStr := AnsiString(Parser.TokenString);
                case Parser.Token of
                  toInteger: begin end;
                  System.Classes.toString,toWString: TokenStr := AnsiString('#' + IntToStr(Ord(TokenStr[1])));
                else
                  Parser.CheckToken(toSymbol);
                end;
                Writer.WriteStr(TokenStr);
                if Parser.NextToken = ']' then Break;
                Parser.CheckToken(',');
                Parser.NextToken;
              end;
            Writer.WriteStr('');
          end;
        '(':
          begin
            Parser.NextToken;
            Writer.WriteListBegin;
            while Parser.Token <> ')' do ConvertValue;
            Writer.WriteListEnd;
          end;
        '{':
          Writer.WriteBinary(Parser.HexToBinary);
        '<':
          begin
            Parser.NextToken;
            Writer.WriteValue(vaCollection);
            while Parser.Token <> '>' do
            begin
              Parser.CheckTokenSymbol('item');
              Parser.NextToken;
              Order := ConvertOrderModifier;
              if Order <> -1 then Writer.WriteInteger(Order);
              Writer.WriteListBegin;
              while not Parser.TokenSymbolIs('end') do ConvertProperty;
              Writer.WriteListEnd;
              Parser.NextToken;
            end;
            Writer.WriteListEnd;
          end;
      else
        Parser.Error(SInvalidProperty);
      end;
      Parser.NextToken;
    end;
  end;

  procedure ConvertProperty;
  var
    PropName: string;
  begin
    Parser.CheckToken(toSymbol);
    PropName := Parser.TokenString;
    Parser.NextToken;
    while Parser.Token = '.' do
    begin
      Parser.NextToken;
      Parser.CheckToken(toSymbol);
      PropName := PropName + '.' + Parser.TokenString;
      Parser.NextToken;
    end;
    Writer.WriteUTF8Str(PropName);
    Parser.CheckToken('=');
    Parser.NextToken;
    ConvertValue;
  end;

  procedure ConvertObject;
  var
    InheritedObject: Boolean;
    InlineObject: Boolean;
  begin
    InheritedObject := False;
    InlineObject := False;
    if Parser.TokenSymbolIs('INHERITED') then
      InheritedObject := True
    else if Parser.TokenSymbolIs('INLINE') then
      InlineObject := True
    else
      Parser.CheckTokenSymbol('OBJECT');
    Parser.NextToken;
    ConvertHeader(InheritedObject, InlineObject);
    while not Parser.TokenSymbolIs('END') and
      not Parser.TokenSymbolIs('OBJECT') and
      not Parser.TokenSymbolIs('INHERITED') and
      not Parser.TokenSymbolIs('INLINE') do
      ConvertProperty;
    Writer.WriteListEnd;
    while not Parser.TokenSymbolIs('END') do ConvertObject;
    Writer.WriteListEnd;
    Parser.NextToken;
  end;
begin
  { Initialize a new TFormatSettings block }
  FFmtSettings := FormatSettings;
  FFmtSettings.DecimalSeparator := '.';

  { Create the parser instance }
  Parser := TParser.Create(Input, FFmtSettings);
  try
    Writer := TWriter.Create(Output, 4096);
    try
      Writer.WriteSignature;
      ConvertObject;
    finally
      Writer.Free;
    end;
  finally
    Parser.Free;
  end;
end;

procedure ObjectTextToBinary(Input, Output: TStream;
  var OriginalFormat: TStreamOriginalFormat);
begin
  InternalTextToBinary(Input, Output, OriginalFormat, ObjectTextToBinary, FilerSignatures)
end;

{ Resource to text conversion }

const
  ResourceSignatures: array[0..1] of TBinarySignature = (
   (BinarySignature: $FF;
    SignatureLength: SizeOf(Byte)),
   (BinarySignature: 0;
    SignatureLength: SizeOf(Integer)));

procedure ObjectResourceToText(Input, Output: TStream);
begin
  Input.ReadResHeader;
  ObjectBinaryToText(Input, Output);
end;

procedure ObjectResourceToText(Input, Output: TStream;
  var OriginalFormat: TStreamOriginalFormat);
begin
  InternalBinaryToText(Input, Output, OriginalFormat, ObjectResourceToText, ResourceSignatures);
end;

{ Text to resource conversion }

procedure ObjectTextToResource(Input, Output: TStream);
var
  MemoryStream: TMemoryStream;
  MemorySize: Longint;
begin
  MemoryStream := TMemoryStream.Create;
  try
    ObjectTextToBinary(Input, MemoryStream);
    WriteObjectResourceHeader(MemoryStream, Output);
    MemorySize := MemoryStream.Size;
    Output.Write(MemoryStream.Memory^, MemorySize);
  finally
    MemoryStream.Free;
  end;
end;

procedure ObjectTextToResource(Input, Output: TStream;
  var OriginalFormat: TStreamOriginalFormat);
begin
  InternalTextToBinary(Input, Output, OriginalFormat, ObjectTextToResource, ResourceSignatures);
end;

function TestStreamFormat(Stream: TStream): TStreamOriginalFormat;
var
  Pos: Integer;
  Signature: Integer;
begin
  Pos := Stream.Position;
  Signature := 0;
  Stream.Read(Signature, SizeOf(Signature));
  Stream.Position := Pos;
  if (Byte(Signature) = $FF) or (Signature = Integer(FilerSignature)) or (Signature = 0) then
    Result := sofBinary
    // text format may begin with "object", "inherited", or whitespace
  else if AnsiChar(Signature) in ['o','O','i','I',' ',#13,#11,#9] then
    Result := sofText
  else if (Signature and $00FFFFFF) = $00BFBBEF then
    Result := sofUTF8Text
  else
    Result := sofUnknown;
end;

function GetResourceName(ObjStream: TStream; var AName: string): Boolean;
var
  LPos: Int64;
  LName: TBytes;
  I: Integer;
  Len: Byte;
begin
  Result := False;
  LPos := ObjStream.Position;
  try
    ObjStream.Position := SizeOf(Longint); { Skip header }
    ObjStream.Read(Len, 1);

    { Skip over object prefix if it is present }
    if Len and $F0 = $F0 then
    begin
      if ffChildPos in TFilerFlags((Len and $F0)) then
      begin
        ObjStream.Read(Len, 1);
        case TValueType(Len) of
          vaInt8: Len := 1;
          vaInt16: Len := 2;
          vaInt32: Len := 4;
        end;
        ObjStream.Read(I, Len);
      end;
      ObjStream.Read(Len, 1);
    end;

    SetLength(LName, Len);
    ObjStream.Read(LName[0], Len);
    // See if there are any UTF8 chars in the name
    for I := Low(LName) to High(LName) do
      if LName[I] and $80 <> 0 then
      begin
        AName := UpperCase(TEncoding.UTF8.GetString(LName));
        Result := True;
        Exit;
      end;
    AName := UpperCase(TEncoding.Default.GetString(LName));
  finally
    ObjStream.Position := LPos;
  end;
end;

procedure WriteObjectResourceHeader(ObjStream, Output: TStream);
var
  Is32bit: Boolean;
  ResName: string;
  Size: Integer;

  procedure NameLengthError(const S: string); inline;
  begin
    raise EParserError.CreateResFmt(@sComponentNameTooLong, [S]);
  end;

begin
  Size := ObjStream.Size;
  Is32Bit := GetResourceName(ObjStream, ResName);
  if Length(ResName) > 70 then
    NameLengthError(ResName);
  if Is32Bit then
    Write32bitResourceHeader(TEncoding.Unicode.GetBytes(ResName), Size, Output)
  else
    Write16bitResourceHeader(TEncoding.Default.GetBytes(ResName), Size, Output);
end;

procedure Write16bitResourceHeader(const AName: TBytes; DataSize: Integer; Output: TStream);
var
  Data: Word;
  NameSize: Integer;
begin
  NameSize := Length(AName) + 1;
  // Write the resource type
  Data := $FF;
  Output.Write(Data, SizeOf(Byte));
  Data := 10;
  Output.Write(Data, SizeOf(Data));
  // Write the resource name
  Output.WriteBuffer(AName[0], NameSize - 1);
  Data := 0;
  Output.Write(Data, SizeOf(AnsiChar));
  // Write the resource flags
  Data := $1030;
  Output.Write(Data, SizeOf(Data));
  // Write the data size
  Output.Write(DataSize, SizeOf(DataSize));
end;

procedure Write32bitResourceHeader(const AName: TBytes; DataSize: Integer; Output: TStream);
var
  Data: Integer;
  NameSize: Integer;
begin
  Output.Write(Dummy32bitResHeader, Length(Dummy32bitResHeader));
  // Write the data size
  Output.Write(DataSize, SizeOf(DataSize));
  // Write the header size
  NameSize := Length(AName) + 2;
  Data := 8 + 4{TypeSize} + NameSize + 16;
  Output.Write(Data, SizeOf(Data));
  // Write the resource type (RT_RCDATA)
  Data := $000AFFFF;
  Output.Write(Data, SizeOf(Data));
  // Now write the resource name
  Output.WriteBuffer(AName[0], NameSize - 2);
  Data := 0;
  Output.Write(Data, SizeOf(WideChar));
  // Finish off by writing the final 16 bytes which contain Version, LangID, and other fields
  Data := 0;
  Output.Write(Data, SizeOf(Data)); // DataVersion
  Output.Write(Data, SizeOf(Word)); // MemoryFlags
  Data := $0409;                    // For right now use US as the LandID since it is converted to this anyway
  Output.Write(Data, SizeOf(Word)); // LangID
  Data := 0;
  Output.Write(Data, SizeOf(Data)); // Version
  Output.Write(Data, SizeOf(Data)); // Characteristics
end;

type
  TSyncProc = record
    SyncRec: TThread.PSynchronizeRecord;
    Queued: Boolean;
    Signal: TObject;
  end;
  PSyncProc = ^TSyncProc;

  TExternalThread = class(TThread)
  protected
    procedure Execute; override; // This never runs.
  public
    constructor Create;
  end;

  TAnonymousThread = class(TThread)
  private
    FProc: TProc;
  protected
    procedure Execute; override;
  public
    constructor Create(const AProc: TProc);
  end;

{ TExternalThread }

constructor TExternalThread.Create;
begin
  FExternalThread := True;
  inherited Create(False);
end;

procedure TExternalThread.Execute;
begin
  // nothing happening here.
end;

{ TAnonymousThread }

constructor TAnonymousThread.Create(const AProc: TProc);
begin
  inherited Create(True);
  FreeOnTerminate := True;
  FProc := AProc;
end;

procedure TAnonymousThread.Execute;
begin
  FProc();
end;

var
  SyncList: TList = nil;
  ThreadLock: TObject;
  ExternalThreads: TThreadList;

procedure InitThreadSynchronization;
begin
  ThreadLock := TObject.Create;
{$IF Defined(MSWINDOWS)}
  SyncEvent := CreateEvent(nil, True, False, '');
  if SyncEvent = 0 then
    RaiseLastOSError;
{$ELSEIF DEFINED(POSIX)}
  if pipe(SyncEvent) < 0 then
    RaiseLastOSError;
{$IFEND}
end;

procedure DoneThreadSynchronization;
begin
  ThreadLock.Free;
{$IF Defined(MSWINDOWS)}
  CloseHandle(SyncEvent);
{$ELSEIF Defined(POSIX)}
  __close(SyncEvent.ReadDes);
  __close(SyncEvent.WriteDes);
{$IFEND}
end;

                                                                       
procedure FreeExternalThreads;
var
  I: Integer;
  LExternalThreads: TThreadList;
begin
  LExternalThreads := InterlockedExchangePointer(Pointer(ExternalThreads), nil);
  if LExternalThreads <> nil then
    with LExternalThreads.LockList do
    try
      for I := 0 to Count - 1 do
        TObject(Items[I]).Free;
    finally
      LExternalThreads.UnlockList;
    end;
  LExternalThreads.Free;
end;

procedure ResetSyncEvent;
{$IF Defined(LINUX)}
var
  nRead: Integer;
  Dummy: Byte;
{$IFEND}
begin
{$IF Defined(MSWINDOWS)}
  ResetEvent(SyncEvent);
{$ELSEIF Defined(LINUX)}
  if (ioctl(SyncEvent.ReadDes, FIONREAD, @nRead) = 0) and (nRead > 0) then
    __read(SyncEvent.ReadDes, @Dummy, SizeOf(Dummy));
{$IFEND}
end;

procedure WaitForSyncEvent(Timeout: Integer);
{$IF Defined(LINUX)}
var
  EventFds: TFDSet;
  Tm: TTimeVal;
{$IFEND}
begin
{$IF Defined(MSWINDOWS)}
  if WaitForSingleObject(SyncEvent, Timeout) = WAIT_OBJECT_0 then
    ResetSyncEvent;
{$ELSEIF Defined(LINUX)}
  FD_ZERO(EventFds);
  FD_SET(SyncEvent.ReadDes, EventFds);
  Tm.tv_sec := Timeout div 1000;
  Tm.tv_usec := (Timeout mod 1000) * 1000;
  if select(SyncEvent.ReadDes + 1, @EventFds, nil, nil, @Tm) > 0 then
    ResetSyncEvent;
{$IFEND}
end;

procedure SignalSyncEvent;
{$IF Defined(LINUX)}
const
  Dummy: Byte = 0;
var
  nRead: Integer;
{$IFEND}
begin
{$IF Defined(MSWINDOWS)}
  SetEvent(SyncEvent);
{$ELSEIF Defined(LINUX)}
  if (ioctl(SyncEvent.ReadDes, FIONREAD, @nRead) = 0) and (nRead = 0) then
    __write(SyncEvent.WriteDes, Dummy, SizeOf(Dummy));
{$IFEND}
end;

function CheckSynchronize(Timeout: Integer = 0): Boolean;
var
  SyncProc: PSyncProc;
  LocalSyncList: TList;
begin
{$IFDEF MSWINDOWS}
  if SyncEvent = 0 then
    Exit(False);
{$ENDIF}
{$IFDEF POSIX}
  if (SyncEvent.ReadDes = 0) or (SyncEvent.WriteDes = 0) then
    Exit(False);
{$ENDIF}
  if TThread.CurrentThread.ThreadID <> MainThreadID then
    raise EThread.CreateResFmt(@SCheckSynchronizeError, [TThread.CurrentThread.ThreadID]);
  if Timeout > 0 then
    WaitForSyncEvent(Timeout)
  else
    ResetSyncEvent;
  LocalSyncList := nil;
  TMonitor.Enter(ThreadLock);
  try
    Pointer(LocalSyncList) := InterlockedExchangePointer(Pointer(SyncList), Pointer(LocalSyncList));
    try
      Result := (LocalSyncList <> nil) and (LocalSyncList.Count > 0);
      if Result then
      begin
        while LocalSyncList.Count > 0 do
        begin
          SyncProc := LocalSyncList[0];
          LocalSyncList.Delete(0);
          TMonitor.Exit(ThreadLock);
          try
            try
              if Assigned(SyncProc.SyncRec.FMethod) then
                SyncProc.SyncRec.FMethod()
              else if Assigned(SyncProc.SyncRec.FProcedure) then
                SyncProc.SyncRec.FProcedure();
            except
              if not SyncProc.Queued then
                SyncProc.SyncRec.FSynchronizeException := AcquireExceptionObject
              else
                raise;
            end;
          finally
            TMonitor.Enter(ThreadLock);
          end;
          if not SyncProc.Queued then
            TMonitor.Pulse(SyncProc.Signal)
          else
          begin
            Dispose(SyncProc.SyncRec);
            Dispose(SyncProc);
          end;
        end;
      end;
    finally
      LocalSyncList.Free;
    end;
  finally
    TMonitor.Exit(ThreadLock);
  end;
end;

function ThreadProc(Thread: TThread): Integer;
var
  FreeThread: Boolean;
{$IFDEF MACOS}
  Flags: MPEventFlags;
{$ENDIF}
begin
  TThread.FCurrentThread := Thread;
{$IFDEF LINUX}
  if Thread.FSuspended then sem_wait(Thread.FCreateSuspendedSem);
{$ENDIF}
{$IFDEF MACOS}
  if Thread.FSuspended then MPWaitForEvent(Thread.FCreateSuspendedEvent, Flags, kDurationForever);
{$ENDIF}
  try
    if not Thread.Terminated then
    try
      Thread.Execute;
    except
      Thread.FFatalException := AcquireExceptionObject;
    end;
  finally
    Result := Thread.FReturnValue;
    FreeThread := Thread.FFreeOnTerminate;
    Thread.DoTerminate;
    Thread.FFinished := True;
    SignalSyncEvent;
    if FreeThread then Thread.Free;
{$IFDEF MSWINDOWS}
    EndThread(Result);
{$ENDIF}
{$IFDEF POSIX}
    // Directly call pthread_exit since EndThread will detach the thread causing
    // the pthread_join in TThread.WaitFor to fail.  Also, make sure the EndThreadProc
    // is called just like EndThread would do. EndThreadProc should not return
    // and call pthread_exit itself.
    if Assigned(EndThreadProc) then
      EndThreadProc(Result);
    pthread_exit(Result);
{$ENDIF}
  end;
end;

constructor TThread.Create;
begin
  Create(False);
end;

constructor TThread.Create(CreateSuspended: Boolean);
{$IFDEF POSIX}
var
  ErrCode: Integer;
{$ENDIF}
begin
  inherited Create;
  FSuspended := not FExternalThread;
  FCreateSuspended := CreateSuspended and not FExternalThread;
  if not FExternalThread then
  begin
{$IFDEF MSWINDOWS}
    FHandle := BeginThread(nil, 0, @ThreadProc, Pointer(Self), CREATE_SUSPENDED, FThreadID);
    if FHandle = 0 then
      raise EThread.CreateResFmt(@SThreadCreateError, [SysErrorMessage(GetLastError)]);
{$ENDIF}
{$IFDEF POSIX}
{$IFDEF LINUX}
    sem_init(FCreateSuspendedSem, False, 0);
{$ELSE}
    MPCreateEvent(FCreateSuspendedEvent);
{$ENDIF}
    ErrCode := BeginThread(nil, @ThreadProc, Pointer(Self), FThreadID);
    if ErrCode <> 0 then
      raise EThread.CreateResFmt(@SThreadCreateError, [SysErrorMessage(ErrCode)]);
{$ENDIF}
  end else
  begin
{$IFDEF MSWINDOWS}
    FHandle := Winapi.Windows.GetCurrentThread;
{$ENDIF}
    FThreadId := GetCurrentThreadId;
  end;
end;

class constructor TThread.Create;
begin
  InitThreadSynchronization;
  FProcessorCount := System.CPUCount;
end;

class function TThread.CreateAnonymousThread(const ThreadProc: TProc): TThread;
begin
  Result := TAnonymousThread.Create(ThreadProc);
end;

destructor TThread.Destroy;
begin
  if (FThreadID <> 0) and not FFinished and not FExternalThread then
  begin
    Terminate;
    if FCreateSuspended or FSuspended then
      Resume;
    WaitFor;
  end;
  RemoveQueuedEvents(Self);
{$IFDEF MSWINDOWS}
  if (FHandle <> 0) and not FExternalThread then CloseHandle(FHandle);
{$ENDIF}
{$IFDEF POSIX}
  // This final check is to ensure that even if the thread was never waited on
  // its resources will be freed.
  if (FThreadID <> 0) and not FExternalThread then pthread_detach(pthread_t(FThreadID));
{$IFDEF LINUX}
  sem_destroy(FCreateSuspendedSem);
{$ELSE}
  MPDeleteEvent(FCreateSuspendedEvent);
{$ENDIF}
{$ENDIF}
  inherited Destroy;
  FFatalException.Free;
end;

class destructor TThread.Destroy;
begin
  FreeAndNil(SyncList);
  FreeExternalThreads;
  DoneThreadSynchronization;
end;

procedure TThread.AfterConstruction;
begin
  if not FCreateSuspended and not FExternalThread then
    InternalStart(True);
end;

class function TThread.CheckTerminated: Boolean;
var
  Thread: TThread;
begin
  Thread := CurrentThread;
  if Thread is TExternalThread then
    raise EThreadExternalException.CreateRes(@SThreadExternalCheckTerminated);
  Result := Thread.Terminated;
end;

procedure TThread.CheckThreadError(ErrCode: Integer);
begin
  if ErrCode <> 0 then
    raise EThread.CreateResFmt(@SThreadError, [SysErrorMessage(ErrCode), ErrCode]);
end;

procedure TThread.CheckThreadError(Success: Boolean);
begin
  if not Success then
    CheckThreadError(GetLastError);
end;

procedure TThread.CallOnTerminate;
begin
  if Assigned(FOnTerminate) then FOnTerminate(Self);
end;

procedure TThread.DoTerminate;
begin
  if Assigned(FOnTerminate) then Synchronize(CallOnTerminate);
end;

procedure TThread.TerminatedSet;
begin
end;

class function TThread.GetCurrentThread: TThread;
var
  ExternalThread: TThread;
  LExternalThreads: TThreadList;
begin
  if FCurrentThread = nil then
  begin
    ExternalThread := TExternalThread.Create;
    if ExternalThreads = nil then
    begin
      LExternalThreads := TThreadList.Create;
      if InterlockedCompareExchangePointer(Pointer(ExternalThreads), LExternalThreads, nil) <> nil then
        LExternalThreads.Free;
    end;
    ExternalThreads.Add(ExternalThread);
    FCurrentThread := ExternalThread;
  end;
  Result := FCurrentThread;
end;

class function TThread.GetIsSingleProcessor: Boolean;
begin
  Result := FProcessorCount < 2;
end;

procedure TThread.InternalStart(Force: Boolean);
begin
  if (FCreateSuspended or Force) and not FFinished and not FExternalThread then
  begin
    FSuspended := False;
    FCreateSuspended := False;
{$IFDEF MSWINDOWS}
    if ResumeThread(FHandle) <> 1 then
      raise EThread.Create(SThreadStartError);
{$ENDIF}
{$IFDEF LINUX}
    sem_post(FCreateSuspendSem);
{$ENDIF}
{$IFDEF MACOS}
    MPSetEvent(FCreateSuspendedEvent, 1);
{$ENDIF}
  end else
    raise EThread.Create(SThreadStartError);
end;

{$IFDEF MSWINDOWS}
const
  Priorities: array [TThreadPriority] of Integer =
   (THREAD_PRIORITY_IDLE, THREAD_PRIORITY_LOWEST, THREAD_PRIORITY_BELOW_NORMAL,
    THREAD_PRIORITY_NORMAL, THREAD_PRIORITY_ABOVE_NORMAL,
    THREAD_PRIORITY_HIGHEST, THREAD_PRIORITY_TIME_CRITICAL);

function TThread.GetPriority: TThreadPriority;
var
  P: Integer;
  I: TThreadPriority;
begin
  P := GetThreadPriority(FHandle);
  CheckThreadError(P <> THREAD_PRIORITY_ERROR_RETURN);
  Result := tpNormal;
  for I := Low(TThreadPriority) to High(TThreadPriority) do
    if Priorities[I] = P then Result := I;
end;

procedure TThread.SetPriority(Value: TThreadPriority);
begin
  CheckThreadError(SetThreadPriority(FHandle, Priorities[Value]));
end;
{$ENDIF}
{$IFDEF POSIX}
function TThread.GetPriority: Integer;
var
  P: Integer;
  J: sched_param;
begin
  {
    Posix Priority is based on the Schedule policy.
    There are 3 different kinds of policy.  See SetPolicy.

        Policy          Type         Priority
      ----------      --------       --------
      SCHED_RR        RealTime         1-99
      SCHED_FIFO      RealTime         1-99
      SCHED_OTHER     Regular           0

    SCHED_RR and SCHED_FIFO can only be set by root.
  }
  CheckThreadError(pthread_getschedparam(pthread_t(FThreadID), P, J));
  Result := J.sched_priority;
end;

{
  Note that to fully utilize Posix Scheduling, see SetPolicy.
}
procedure TThread.SetPriority(Value: Integer);
var
  P: sched_param;
begin
  if Value <> Priority then
  begin
    P.sched_priority := Value;
    CheckThreadError(pthread_setschedparam(pthread_t(FThreadID), Policy, P));
  end;
end;

function TThread.GetPolicy: Integer;
var
  J: sched_param;
begin
  CheckThreadError(pthread_getschedparam(pthread_t(FThreadID), Result, J));
end;

{
  Note that to fully utilize Posix Scheduling, SetPolicy needs to
  be used as well.  See SetPriority for the relationship between these
  methods.
}
procedure TThread.SetPolicy(Value: Integer);
var
  P: sched_param;
begin
  if Value <> Policy then
  begin
    P.sched_priority := GetPriority;
    CheckThreadError(pthread_setschedparam(pthread_t(FThreadID), Value, P));
  end;
end;
{$ENDIF}

procedure TThread.Queue(AMethod: TThreadMethod);
var
  LSynchronize: PSynchronizeRecord;
begin
  New(LSynchronize);
  try
    LSynchronize.FThread := Self;
    LSynchronize.FSynchronizeException := nil;
    LSynchronize.FMethod := AMethod;
    Synchronize(LSynchronize, True);
  finally
    if MainThreadID = CurrentThread.ThreadID then
      Dispose(LSynchronize);
  end;
end;

procedure TThread.Queue(AThreadProc: TThreadProcedure);
var
  LSynchronize: PSynchronizeRecord;
begin
  New(LSynchronize);
  try
    LSynchronize.FThread := Self;
    LSynchronize.FSynchronizeException := nil;
    LSynchronize.FMethod := nil;
    LSynchronize.FProcedure := AThreadProc;
    Synchronize(LSynchronize, True);
  finally
    if MainThreadID = CurrentThread.ThreadID then
      Dispose(LSynchronize);
  end;
end;

class procedure TThread.Queue(AThread: TThread; AMethod: TThreadMethod);
var
  LSynchronize: PSynchronizeRecord;
begin
  if AThread <> nil then
    AThread.Queue(AMethod)
  else
  begin
    New(LSynchronize);
    try
      LSynchronize.FThread := nil;
      LSynchronize.FSynchronizeException := nil;
      LSynchronize.FMethod := AMethod;
      Synchronize(LSynchronize, True);
    finally
      if MainThreadID = CurrentThread.ThreadID then
        Dispose(LSynchronize);
    end;
  end;
end;

class procedure TThread.RemoveQueuedEvents(AThread: TThread; AMethod: TThreadMethod);
var
  I: Integer;
  SyncProc: PSyncProc;
begin
  TMonitor.Enter(ThreadLock);
  try
    if SyncList <> nil then
      for I := SyncList.Count - 1 downto 0 do
      begin
        SyncProc := SyncList[I];
        if (SyncProc.Signal = nil) and
          (((AThread <> nil) and (SyncProc.SyncRec.FThread = AThread)) or
            (Assigned(AMethod) and (TMethod(SyncProc.SyncRec.FMethod).Code = TMethod(AMethod).Code) and
             (TMethod(SyncProc.SyncRec.FMethod).Data = TMethod(AMethod).Data))) then
        begin
          SyncList.Delete(I);
          Dispose(SyncProc.SyncRec);
          Dispose(SyncProc);
        end;
      end;
  finally
    TMonitor.Exit(ThreadLock);
  end;
end;

class procedure TThread.SetReturnValue(Value: Integer);
var
  Thread: TThread;
begin
  Thread := CurrentThread;
  if Thread is TExternalThread then
    raise EThreadExternalException.CreateRes(@SThreadExternalSetReturnValue);
  Thread.ReturnValue := Value;
end;

class procedure TThread.StaticQueue(AThread: TThread; AMethod: TThreadMethod);
begin
  Queue(AThread, AMethod);
end;

class procedure TThread.Synchronize(ASyncRec: PSynchronizeRecord; QueueEvent: Boolean = False);
var
  SyncProc: TSyncProc;
  SyncProcPtr: PSyncProc;
begin
  if CurrentThread.ThreadID = MainThreadID then
  begin
    if Assigned(ASyncRec.FMethod) then
      ASyncRec.FMethod()
    else if Assigned(ASyncRec.FProcedure) then
      ASyncRec.FProcedure();
  end else
  begin
    if QueueEvent then
      New(SyncProcPtr)
    else
      SyncProcPtr := @SyncProc;
    if not QueueEvent then
      SyncProcPtr.Signal := TObject.Create
    else
      SyncProcPtr.Signal := nil;
    try
      TMonitor.Enter(ThreadLock);
      try
        SyncProcPtr.Queued := QueueEvent;
        if SyncList = nil then
          SyncList := TList.Create;
        SyncProcPtr.SyncRec := ASyncRec;
        SyncList.Add(SyncProcPtr);
        SignalSyncEvent;
        if Assigned(WakeMainThread) then
          WakeMainThread(SyncProcPtr.SyncRec.FThread);
        if not QueueEvent then
          TMonitor.Wait(SyncProcPtr.Signal, ThreadLock, INFINITE)
      finally
        TMonitor.Exit(ThreadLock);
      end;
    finally
      if not QueueEvent then
        SyncProcPtr.Signal.Free;
    end;
    if not QueueEvent and Assigned(ASyncRec.FSynchronizeException) then
      raise ASyncRec.FSynchronizeException;
  end;
end;

procedure TThread.Synchronize(AMethod: TThreadMethod);
begin
  FSynchronize.FThread := Self;
  FSynchronize.FSynchronizeException := nil;
  FSynchronize.FMethod := AMethod;
  FSynchronize.FProcedure := nil;
  Synchronize(@FSynchronize);
end;

procedure TThread.Synchronize(AThreadProc: TThreadProcedure);
begin
  FSynchronize.FThread := Self;
  FSynchronize.FSynchronizeException := nil;
  FSynchronize.FMethod := nil;
  FSynchronize.FProcedure := AThreadProc;
  Synchronize(@FSynchronize);
end;

class procedure TThread.Synchronize(AThread: TThread; AMethod: TThreadMethod);
var
  SyncRec: TSynchronizeRecord;
begin
  if AThread <> nil then
    AThread.Synchronize(AMethod)
  else
  begin
    SyncRec.FThread := nil;
    SyncRec.FSynchronizeException := nil;
    SyncRec.FMethod := AMethod;
    SyncRec.FProcedure := nil;
    TThread.Synchronize(@SyncRec);
  end;
end;

class procedure TThread.Queue(AThread: TThread; AThreadProc: TThreadProcedure);
var
  LSynchronize: PSynchronizeRecord;
begin
  if AThread <> nil then
    AThread.Queue(AThreadProc)
  else
  begin
    New(LSynchronize);
    try
      LSynchronize.FThread := nil;
      LSynchronize.FSynchronizeException := nil;
      LSynchronize.FMethod := nil;
      LSynchronize.FProcedure := AThreadProc;
      Synchronize(LSynchronize, True);
    finally
      if MainThreadID = CurrentThread.ThreadID then
        Dispose(LSynchronize);
    end;
  end;
end;

class procedure TThread.Synchronize(AThread: TThread; AThreadProc: TThreadProcedure);
var
  SyncRec: TSynchronizeRecord;
begin
  if AThread <> nil then
    AThread.Synchronize(AThreadProc)
  else
  begin
    SyncRec.FThread := nil;
    SyncRec.FSynchronizeException := nil;
    SyncRec.FMethod := nil;
    SyncRec.FProcedure := AThreadProc;
    TThread.Synchronize(@SyncRec);
  end;
end;

class procedure TThread.StaticSynchronize(AThread: TThread; AMethod: TThreadMethod);
begin
  Synchronize(AThread, AMethod);
end;

class procedure TThread.RemoveQueuedEvents(AThread: TThread);
var
  I: Integer;
  SyncProc: PSyncProc;
begin
  TMonitor.Enter(ThreadLock);
  try
    if SyncList <> nil then
      for I := SyncList.Count - 1 downto 0 do
      begin
        SyncProc := SyncList[I];
        if (SyncProc.Signal = nil) and
          ((AThread <> nil) and (SyncProc.SyncRec.FThread = AThread)) then
        begin
          SyncList.Delete(I);
          Dispose(SyncProc.SyncRec);
          Dispose(SyncProc);
        end;
      end;
  finally
    TMonitor.Exit(ThreadLock);
  end;
end;

class procedure TThread.RemoveQueuedEvents(AMethod: TThreadMethod);
begin
  RemoveQueuedEvents(nil, AMethod);
end;

procedure TThread.SetSuspended(Value: Boolean);
begin
  if Value <> FSuspended then
    if Value then
      Suspend
    else
      Resume;
end;

class procedure TThread.SpinWait(Iterations: Integer);
{$IF defined(X86ASM) or defined(X64ASM)}
asm
    CMP  Iterations, 0
    JNG  @Done
@Loop:
    PAUSE
    DEC  Iterations
    CMP  Iterations, 0
    JG   @Loop
@Done:
end;
{$ELSE}
begin
  while Iterations > 0 do
  begin
    System.YieldProcessor;
    Dec(Iterations);
  end;
end;
{$IFEND}

class procedure TThread.Sleep(Timeout: Integer);
begin
{$IFDEF POSIX}
  usleep(Timeout * 1000);
{$ENDIF}
{$IFDEF MSWINDOWS}
  Winapi.Windows.Sleep(Timeout);
{$ENDIF}
end;

class procedure TThread.Yield;
begin
{$IFDEF POSIX}
  sched_yield;
{$ENDIF}
{$IFDEF MSWINDOWS}
  SwitchToThread;
{$ENDIF}
end;

procedure TThread.Start;
begin
  InternalStart(False);
end;

procedure TThread.Suspend;
var
  OldSuspend: Boolean;
begin
  OldSuspend := FSuspended;
  try
    FSuspended := True;
{$IFDEF MSWINDOWS}
    CheckThreadError(Integer(SuspendThread(FHandle)) >= 0);
{$ENDIF}
{$IFDEF LINUX}
    CheckThreadError(pthread_kill(pthread_t(FThreadID), SIGSTOP));
{$ENDIF}
{$IFDEF MACOS}
    CheckThreadError(thread_suspend(pthread_mach_thread_np(pthread_t(FThreadID))));
{$ENDIF MACOS}
  except
    FSuspended := OldSuspend;
    raise;
  end;
end;

{$IFDEF MSWINDOWS}
procedure TThread.Resume;
var
  SuspendCount: Integer;
begin
  SuspendCount := ResumeThread(FHandle);
  CheckThreadError(SuspendCount >= 0);
  if SuspendCount = 1 then
    FSuspended := False;
end;
{$ENDIF}
                                                                                                                                                                                       
{$IFDEF LINUX}
{
  About Suspend and Resume. POSIX does not support suspending/resuming a thread.
  Suspending a thread is considerd dangerous since it is not guaranteed where the
  thread would be suspend. It might be holding a lock, mutex or it might be inside
  a critical section.  In order to simulate it in Linux we've used signals. To
  suspend, a thread SIGSTOP is sent and to resume, SIGCONT is sent. Note that this
  is Linux only i.e. according to POSIX if a thread receives SIGSTOP then the
  entire process is stopped. However Linux doesn't entirely exhibit the POSIX-mandated
  behaviour. If and when it fully complies with the POSIX standard then suspend
  and resume won't work.
}
procedure TThread.Resume;
begin
  if not FInitialSuspendDone then
  begin
    FInitialSuspendDone := True;
    sem_post(FCreateSuspendedSem);
  end else
    CheckThreadError(pthread_kill(pthread_t(FThreadID), SIGCONT));
  FSuspended := False;
end;
{$ENDIF}
                                                                                                                                
{$IFDEF MACOS}
procedure TThread.Resume;
begin
  if not FInitialSuspendDone then
  begin
    FInitialSuspendDone := True;
    MPSetEvent(FCreateSuspendedEvent, 1);
  end else
    CheckThreadError(thread_resume(pthread_mach_thread_np(pthread_t(FThreadID))));
  FSuspended := False;
end;
{$ENDIF}

procedure TThread.Terminate;
begin
  if FExternalThread then
    raise EThread.CreateRes(@SThreadExternalTerminate);
  FTerminated := True;
  TerminatedSet;
end;

function TThread.WaitFor: LongWord;
{$IFDEF MSWINDOWS}
var
  H: array[0..1] of THandle;
  WaitResult: Cardinal;
  Msg: TMsg;
begin
  if FExternalThread then
    raise EThread.CreateRes(@SThreadExternalWait);
  H[0] := FHandle;
  if CurrentThread.ThreadID = MainThreadID then
  begin
    WaitResult := 0;
    H[1] := SyncEvent;
    repeat
      { This prevents a potential deadlock if the background thread
        does a SendMessage to the foreground thread }
      if WaitResult = WAIT_OBJECT_0 + 2 then
        PeekMessage(Msg, 0, 0, 0, PM_NOREMOVE);
      WaitResult := MsgWaitForMultipleObjects(2, H, False, 1000, QS_SENDMESSAGE);
      CheckThreadError(WaitResult <> WAIT_FAILED);
      if WaitResult = WAIT_OBJECT_0 + 1 then
        CheckSynchronize;
    until WaitResult = WAIT_OBJECT_0;
  end else WaitForSingleObject(H[0], INFINITE);
  CheckThreadError(GetExitCodeThread(H[0], Result));
end;
{$ENDIF}
{$IFDEF POSIX}
var
  X: Pointer;
  ID: pthread_t;
begin
  if FExternalThread then
    raise EThread.CreateRes(@SThreadExternalWait);
  ID := pthread_t(FThreadID);
  if CurrentThread.ThreadID = MainThreadID then
    while not FFinished do
      CheckSynchronize(1000);
  FThreadID := 0;
  X := @Result;
  CheckThreadError(pthread_join(ID, X));
end;
{$ENDIF}

class procedure TThread.NameThreadForDebugging(AThreadName: AnsiString;
  AThreadID: TThreadID);
{$IFDEF MSWINDOWS}
type
  TThreadNameInfo = record
    FType: LongWord;     // must be 0x1000
    FName: PAnsiChar;    // pointer to name (in user address space)
    FThreadID: LongWord; // thread ID (-1 indicates caller thread)
    FFlags: LongWord;    // reserved for future use, must be zero
  end;
var
  ThreadNameInfo: TThreadNameInfo;
begin
  if IsDebuggerPresent then
  begin
    ThreadNameInfo.FType := $1000;
    ThreadNameInfo.FName := PAnsiChar(AThreadName);
    ThreadNameInfo.FThreadID := AThreadID;
    ThreadNameInfo.FFlags := 0;

    try
      RaiseException($406D1388, 0, sizeof(ThreadNameInfo) div sizeof(LongWord), @ThreadNameInfo);
    except
    end;
  end;
end;
{$ENDIF}
                                                                                                                                                                                                                          
                                                                                                                              
{$IFDEF LINUX}
begin
end;
{$ENDIF}
{$IFDEF MACOS}
const
  cExceptionMessage = 'Type=$1000,Name=%s,ThreadID=%d,Flags=0';
begin
  if getenv('EMB_MACOSX_DBK_PRESENT') <> nil then
  begin  
    try
      raise EThreadNameException.Create(Format(cExceptionMessage, [String(AThreadName), AThreadID]));
    except
    end;
  end;
end;
{$ENDIF}

{ TComponentEnumerator }

constructor TComponentEnumerator.Create(AComponent: TComponent);
begin
  inherited Create;
  FIndex := -1;
  FComponent := AComponent;
end;

function TComponentEnumerator.GetCurrent: TComponent;
begin
  Result := FComponent.Components[FIndex];
end;

function TComponentEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FComponent.ComponentCount - 1;
  if Result then
    Inc(FIndex);
end;

{ TComponent }

constructor TComponent.Create(AOwner: TComponent);
begin
  FComponentStyle := [csInheritable];
  if AOwner <> nil then AOwner.InsertComponent(Self);
end;

destructor TComponent.Destroy;
begin
  Destroying;
  RemoveFreeNotifications;
  DestroyComponents;
  if FOwner <> nil then FOwner.RemoveComponent(Self);
  FObservers.Free;
  inherited Destroy;
end;

procedure TComponent.BeforeDestruction;
begin
  if not (csDestroying in ComponentState) then
    Destroying;
end;

procedure TComponent.RemoveFreeNotifications;
begin
  if FFreeNotifies <> nil then
  begin
    while Assigned(FFreeNotifies) and (FFreeNotifies.Count > 0) do
      TComponent(FFreeNotifies[FFreeNotifies.Count - 1]).Notification(Self, opRemove);
    FreeAndNil(FFreeNotifies);
  end;
end;

procedure TComponent.FreeNotification(AComponent: TComponent);
begin
  if (Owner = nil) or (AComponent.Owner <> Owner) then
  begin
    // Never acquire a reference to a component that is being deleted.
    Assert(not (csDestroying in (ComponentState + AComponent.ComponentState)),
      'Component already destroyed: '+ Name + ' ClassName: ' + ClassName);  // do not localize
    if not Assigned(FFreeNotifies) then FFreeNotifies := TList.Create;
    if FFreeNotifies.IndexOf(AComponent) < 0 then
    begin
      FFreeNotifies.Add(AComponent);
      AComponent.FreeNotification(Self);
    end;
  end;
  Include(FComponentState, csFreeNotification);
end;

procedure TComponent.ReadLeft(Reader: TReader);
begin
  LongRec(FDesignInfo).Lo := Reader.ReadInteger;
end;

procedure TComponent.ReadTop(Reader: TReader);
begin
  LongRec(FDesignInfo).Hi := Reader.ReadInteger;
end;

procedure TComponent.WriteLeft(Writer: TWriter);
begin
  Writer.WriteInteger(LongRec(FDesignInfo).Lo);
end;

procedure TComponent.WriteTop(Writer: TWriter);
begin
  Writer.WriteInteger(LongRec(FDesignInfo).Hi);
end;

procedure TComponent.Insert(AComponent: TComponent);
begin
  if FComponents = nil then FComponents := TList.Create;
  FComponents.Add(AComponent);
  if FSortedComponents <> nil then
    AddSortedComponent(AComponent);
  AComponent.FOwner := Self;
end;

procedure TComponent.Remove(AComponent: TComponent);
var
  Count: Integer;
begin
  AComponent.FOwner := nil;
  Count := FComponents.Count;
  if Count > 0 then
  begin
    { On destruction usually the last item is deleted first }
    if FComponents[Count - 1] = AComponent then
      FComponents.Delete(Count - 1)
    else
      FComponents.Remove(AComponent);

    if FSortedComponents <> nil then
      FSortedComponents.Remove(AComponent);
  end;
  if FComponents.Count = 0 then
  begin
    FSortedComponents.Free;
    FSortedComponents := nil;
    FComponents.Free;
    FComponents := nil;
  end;
end;

procedure TComponent.InsertComponent(AComponent: TComponent);
begin
  AComponent.ValidateContainer(Self);
  if AComponent.FOwner <> nil then
    AComponent.FOwner.RemoveComponent(AComponent);
  ValidateRename(AComponent, '', AComponent.FName);
  Insert(AComponent);
  AComponent.SetReference(True);
  if csDesigning in ComponentState then
    AComponent.SetDesigning(True);
  Notification(AComponent, opInsert);
end;

procedure TComponent.RemoveComponent(AComponent: TComponent);
begin
  ValidateRename(AComponent, AComponent.FName, '');
  Notification(AComponent, opRemove);
  AComponent.SetReference(False);
  Remove(AComponent);
end;

procedure TComponent.DestroyComponents;
var
  Instance: TComponent;
begin
  FreeAndNil(FSortedComponents);
  while FComponents <> nil do
  begin
    Instance := FComponents.Last;
    if (csFreeNotification in Instance.FComponentState)
      or (FComponentState * [csDesigning, csInline] = [csDesigning, csInline]) then
      RemoveComponent(Instance)
    else
      Remove(Instance);
    Instance.Destroy;
  end;
end;

procedure TComponent.Destroying;
var
  I: Integer;
begin
  if not (csDestroying in FComponentState) then
  begin
    Include(FComponentState, csDestroying);
    if FComponents <> nil then
      for I := 0 to FComponents.Count - 1 do
        TComponent(FComponents[I]).Destroying;
  end;
end;

procedure TComponent.RemoveNotification(AComponent: TComponent);
var
  Count: Integer;
begin
  if FFreeNotifies <> nil then
  begin
    Count := FFreeNotifies.Count;
    if Count > 0 then
    begin
      { On destruction usually the last item is deleted first }
      if FFreeNotifies[Count - 1] = AComponent then
        FFreeNotifies.Delete(Count - 1)
      else
        FFreeNotifies.Remove(AComponent);
    end;
    if FFreeNotifies.Count = 0 then
    begin
      FFreeNotifies.Free;
      FFreeNotifies := nil;
    end;
  end;
end;

procedure TComponent.RemoveFreeNotification(AComponent: TComponent);
begin
  RemoveNotification(AComponent);
  AComponent.RemoveNotification(Self);
end;

procedure TComponent.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  I: Integer;
begin
  if (Operation = opRemove) and (AComponent <> nil) then
    RemoveFreeNotification(AComponent);
  if FComponents <> nil then
  begin
    I := FComponents.Count - 1;
    while I >= 0 do
    begin
      TComponent(FComponents[I]).Notification(AComponent, Operation);
      Dec(I);
      if I >= FComponents.Count then
        I := FComponents.Count - 1;
    end;
  end;
end;

procedure TComponent.DefineProperties(Filer: TFiler);
var
  Ancestor: TComponent;
  Info: Longint;
begin
  Info := 0;
  Ancestor := TComponent(Filer.Ancestor);
  if Ancestor <> nil then Info := Ancestor.FDesignInfo;
  Filer.DefineProperty('Left', ReadLeft, WriteLeft,
    LongRec(FDesignInfo).Lo <> LongRec(Info).Lo);
  Filer.DefineProperty('Top', ReadTop, WriteTop,
    LongRec(FDesignInfo).Hi <> LongRec(Info).Hi);
end;

function TComponent.HasParent: Boolean;
begin
  Result := False;
end;

procedure TComponent.GetChildren(Proc: TGetChildProc; Root: TComponent);
begin
end;

function TComponent.GetChildOwner: TComponent;
begin
  Result := nil;
end;

function TComponent.GetChildParent: TComponent;
begin
  Result := Self;
end;

function TComponent.GetEnumerator: TComponentEnumerator;
begin
  Result := TComponentEnumerator.Create(Self);
end;

function TComponent.GetNamePath: string;
begin
  Result := FName;
end;

function TComponent.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

procedure TComponent.SetChildOrder(Child: TComponent; Order: Integer);
begin
end;

function TComponent.GetParentComponent: TComponent;
begin
  Result := nil;
end;

procedure TComponent.SetParentComponent(Value: TComponent);
begin
end;

procedure TComponent.Updating;
begin
  Include(FComponentState, csUpdating);
end;

procedure TComponent.Updated;
begin
  Exclude(FComponentState, csUpdating);
end;

procedure TComponent.Loaded;
begin
  Exclude(FComponentState, csLoading);
end;

procedure TComponent.PaletteCreated;
begin
  // Notification
end;

procedure TComponent.ReadState(Reader: TReader);
begin
  Reader.ReadData(Self);
end;

procedure TComponent.WriteState(Writer: TWriter);
begin
  Writer.WriteData(Self);
end;

procedure TComponent.ValidateRename(AComponent: TComponent;
  const CurName, NewName: string);
begin
  if (AComponent <> nil) and not SameText(CurName, NewName) and
    (AComponent.Owner = Self) and (FindComponent(NewName) <> nil) then
    raise EComponentError.CreateResFmt(@SDuplicateName, [NewName]);
  if (csDesigning in ComponentState) and (Owner <> nil) then
    Owner.ValidateRename(AComponent, CurName, NewName);
end;

procedure TComponent.ValidateContainer(AComponent: TComponent);
begin
  AComponent.ValidateInsert(Self);
end;

procedure TComponent.ValidateInsert(AComponent: TComponent);
begin
end;

function TComponent.FindComponent(const AName: string): TComponent;
var
  I: Integer;
begin
  Result := nil;
  if (AName <> '') and (FComponents <> nil) then
  begin
    if FSortedComponents = nil then
    begin
      { Fill the sorted list (and sort it) }
      FSortedComponents := TList.Create;
      FSortedComponents.Count := FComponents.Count;
      for I := 0 to FComponents.Count - 1 do
        FSortedComponents[I] := FComponents[I];

      FSortedComponents.SortList(
        function(Item1, Item2: Pointer): Integer
        begin
          Result := CompareText(TComponent(Item1).Name, TComponent(Item2).Name);
        end);
    end;
    Result := FindSortedComponent(AName, I);
  end;
end;

function TComponent.FindSortedComponent(const AName: string; var Index: Integer): TComponent;
var
  L, H, I, C: Integer;
begin
  L := 0;
  H := FSortedComponents.Count - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    Result := TComponent(FSortedComponents.List[I]);
    C := CompareText(Result.Name, AName);
    if C < 0 then
      L := I + 1
    else
    begin
      H := I - 1;
      if C = 0 then
      begin
        Index := I;
        Exit;
      end;
    end;
  end;
  Index := L;
  Result := nil;
end;

procedure TComponent.AddSortedComponent(AComponent: TComponent);
var
  Index: Integer;
begin
  FindSortedComponent(AComponent.Name, Index);
  FSortedComponents.Insert(Index, AComponent);
end;

procedure TComponent.RemoveSortedComponent(AComponent: TComponent);
begin
  FSortedComponents.Remove(AComponent);
end;

procedure TComponent.SetName(const NewName: TComponentName);
begin
  if FName <> NewName then
  begin
    if (NewName <> '') and not IsValidIdent(NewName) then
      raise EComponentError.CreateResFmt(@SInvalidName, [NewName]);
    if FOwner <> nil then
      FOwner.ValidateRename(Self, FName, NewName) else
      ValidateRename(nil, FName, NewName);
    SetReference(False);
    ChangeName(NewName);
    SetReference(True);
  end;
end;

procedure TComponent.ChangeName(const NewName: TComponentName);
begin
  FName := NewName;
  if (FOwner <> nil) and (FOwner.FSortedComponents <> nil) then
  begin
    FOwner.RemoveSortedComponent(Self);
    FOwner.AddSortedComponent(Self);
  end;
end;

function TComponent.GetComponentIndex: Integer;
begin
  if (FOwner <> nil) and (FOwner.FComponents <> nil) then
    Result := FOwner.FComponents.IndexOf(Self) else
    Result := -1;
end;

function TComponent.GetComponent(AIndex: Integer): TComponent;
begin
  if FComponents = nil then TList.Error(@SListIndexError, AIndex);
  Result := FComponents[AIndex];
end;

function TComponent.GetComponentCount: Integer;
begin
  if FComponents <> nil then
    Result := FComponents.Count else
    Result := 0;
end;

procedure TComponent.SetComponentIndex(Value: Integer);
var
  I, Count: Integer;
begin
  if FOwner <> nil then
  begin
    I := FOwner.FComponents.IndexOf(Self);
    if I >= 0 then
    begin
      Count := FOwner.FComponents.Count;
      if Value < 0 then Value := 0;
      if Value >= Count then Value := Count - 1;
      if Value <> I then
      begin
        FOwner.FComponents.Delete(I);
        FOwner.FComponents.Insert(Value, Self);
      end;
    end;
  end;
end;

function TComponent.GetObservers: TObservers;
begin
  if FObservers = nil then
  begin
    FObservers := TObservers.Create;
    FObservers.OnCanObserve := CanObserve;
    FObservers.OnObserverAdded := ObserverAdded;
  end;
  Result := FObservers as TObservers;
end;

procedure TComponent.SetAncestor(Value: Boolean);
var
  I: Integer;
begin
  if Value then
    Include(FComponentState, csAncestor) else
    Exclude(FComponentState, csAncestor);
  for I := 0 to ComponentCount - 1 do
    Components[I].SetAncestor(Value);
end;

procedure TComponent.SetDesigning(Value, SetChildren: Boolean);
var
  I: Integer;
begin
  if Value then
    Include(FComponentState, csDesigning) else
    Exclude(FComponentState, csDesigning);
  if SetChildren then
    for I := 0 to ComponentCount - 1 do Components[I].SetDesigning(Value);
end;

procedure TComponent.SetInline(Value: Boolean);
begin
  if Value then
    Include(FComponentState, csInline) else
    Exclude(FComponentState, csInline);
end;

procedure TComponent.SetDesignInstance(Value: Boolean);
begin
  if Value then
    Include(FComponentState, csDesignInstance) else
    Exclude(FComponentState, csDesignInstance);
end;

procedure TComponent.SetReference(Enable: Boolean);
var
  Field: ^TComponent;
begin
  if (FOwner <> nil) then
  begin
    Field := FOwner.FieldAddress(FName);
    if Field <> nil then
      if Enable then Field^ := Self else Field^ := nil;
  end;
end;

function TComponent.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := Action.HandlesTarget(Self);
  if Result then
    Action.ExecuteTarget(Self);
end;

function TComponent.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := Action.HandlesTarget(Self);
  if Result then
    Action.UpdateTarget(Self);
end;

procedure TComponent.SetSubComponent(IsSubComponent: Boolean);
begin
  if IsSubComponent then
    Include(FComponentStyle, csSubComponent)
  else
    Exclude(FComponentStyle, csSubComponent);
end;

function TComponent.CanObserve(const ID: Integer): Boolean;
begin
  Result := False;
end;

procedure TComponent.ObserverAdded(const ID: Integer; const Observer: IObserver);
begin

end;

function TComponent.GetComObject: IUnknown;
begin
  if FVCLComObject = nil then
  begin
    if Assigned(CreateVCLComObjectProc) then CreateVCLComObjectProc(Self);
    if FVCLComObject = nil then
      raise EComponentError.CreateResFmt(@SNoComSupport, [ClassName]);
  end;
  IVCLComObject(FVCLComObject).QueryInterface(IUnknown, Result);
end;

function TComponent.SafeCallException(ExceptObject: TObject;
  ExceptAddr: Pointer): HResult;
begin
  if FVCLComObject <> nil then
    Result := IVCLComObject(FVCLComObject).SafeCallException(
      ExceptObject, ExceptAddr)
{$IFDEF POSIX}
  else if ExceptObject is Exception then
  begin
    SetSafeCallExceptionMsg(Exception(ExceptObject).Message);
    SetSafeCallExceptionAddr(ExceptAddr);
    Result := HResult($8000FFFF);
  end
{$ENDIF}
  else
    Result := inherited SafeCallException(ExceptObject, ExceptAddr);
end;

procedure TComponent.FreeOnRelease;
begin
  if FVCLComObject <> nil then IVCLComObject(FVCLComObject).FreeOnRelease;
end;

class procedure TComponent.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
end;

{ TComponent.IInterface }

function TComponent.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if FVCLComObject = nil then
  begin
    if GetInterface(IID, Obj) then Result := S_OK
    else Result := E_NOINTERFACE
  end
  else
    Result := IVCLComObject(FVCLComObject).QueryInterface(IID, Obj);
end;

function TComponent._AddRef: Integer;
begin
  if FVCLComObject = nil then
    Result := -1   // -1 indicates no reference counting is taking place
  else
    Result := IVCLComObject(FVCLComObject)._AddRef;
end;

function TComponent._Release: Integer;
begin
  if FVCLComObject = nil then
    Result := -1   // -1 indicates no reference counting is taking place
  else
    Result := IVCLComObject(FVCLComObject)._Release;
end;

{ TComponent.IDispatch }

function TComponent.GetTypeInfoCount(out Count: Integer): HResult;
begin
  if FVCLComObject = nil then
    Result := E_NOTIMPL
  else
    Result := IVCLComObject(FVCLComObject).GetTypeInfoCount(Count);
end;

function TComponent.GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult;
begin
  if FVCLComObject = nil then
    Result := E_NOTIMPL
  else
    Result := IVCLComObject(FVCLComObject).GetTypeInfo(
      Index, LocaleID, TypeInfo);
end;

function TComponent.GetIDsOfNames(const IID: TGUID; Names: Pointer;
  NameCount, LocaleID: Integer; DispIDs: Pointer): HResult;
begin
  if FVCLComObject = nil then
    Result := E_NOTIMPL
  else
    Result := IVCLComObject(FVCLComObject).GetIDsOfNames(IID, Names,
      NameCount, LocaleID, DispIDs);
end;

function TComponent.Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer;
  Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult;
begin
  if FVCLComObject = nil then
    Result := E_NOTIMPL
  else
    Result := IVCLComObject(FVCLComObject).Invoke(DispID, IID, LocaleID,
      Flags, Params, VarResult, ExcepInfo, ArgErr);
end;

{ TComponent.IInterfaceComponentReference.GetComponent
  Return a reference to the component that can be queried at load time to
  obtain an interface.  The name of the reference component will be written to
  the stream (same as a normal component reference) so that it can be located
  again at load time.
  In the case of aggregation, the reference component for an interface might
  not be the same as the class that implements the interface itself.
  Aggregate implementation classes should not implement
  IInterfaceComponentReference, but should defer requests for that interface
  to the controlling component.
}

function TComponent.IntfGetComponent: TComponent;
begin
  Result := Self;
end;

function TComponent.IsImplementorOf(const I: IInterface): Boolean;
var
  ICR: IInterfaceComponentReference;
begin
  Result := (I <> nil) and Supports(I, IInterfaceComponentReference, ICR)
    and (ICR.GetComponent = Self);
end;

{ TComponent.ReferenceInterface
  Establishes (opInsert) or removes (opRemove) internal links that
  notify us when the component that implements the given interface is
  destroyed.  The function result indicates whether the function was able
  to establish/remove a notification link or not.  A result of False
  doesn't necessarily indicate an error, but it does mean that the
  interface's implementor does not participate in the interfaced component
  reference model.  This could mean that the given interface employs true
  reference counting, independent of component lifetimes.  That doesn't
  affect the use of interface properties at runtime, but non-component
  interfaces cannot be stored by the property streaming system.

  When implementing components with interface-type properties, implement
  setter methods for the interface-type properties like this:

  procedure TMyComponent.SetMyIntfProp(const Value: IMyInterface);
  begin
    ReferenceInterface(FIntfField, opRemove);
    FIntfField := Value;
    ReferenceInterface(FIntfField, opInsert);
  end;

  Also override Notification to do the following for each interface property
  in your component:

  procedure TMyComponent.Notification(AComponent: TComponent; Operation: TOperation);
  begin
    inherited;
    if Assigned(MyIntfProp) and AComponent.IsImplementorOf(MyIntfProp) then
      MyIntfProp := nil;
    ... repeat for other interface properties ...
  end;

  Note that the Notification code assigns nil to the *property*, not to the
  private field, so that the property setter will call
  ReferenceInterface(FIntfField, opRemove to undo any links established by
  a previous opInsert operation.  All assignments to the interface property
  *must* be made through the property setter.

  TComponent.ReferenceInterface hides the details of how links are
  established between the implementor and the holder of an interface.
  The implementation details may change in the future.  Code that relies
  on those implementation details (instead of using ReferenceInterface)
  will not be supported.  In particular, avoid the temptation to use
  IInterfaceComponentReference in your own code, as this interface may
  not be available in the future.
}

function TComponent.ReferenceInterface(const I: IInterface; Operation: TOperation): Boolean;
var
  ICR: IInterfaceComponentReference;
begin
  Result := (I <> nil) and Supports(I, IInterfaceComponentReference, ICR);
  if Result then
    if Operation = opInsert then
      ICR.GetComponent.FreeNotification(Self)
    else
      ICR.GetComponent.RemoveFreeNotification(Self);
end;

{ TBasicActionLink }

constructor TBasicActionLink.Create(AClient: TObject);
begin
  inherited Create;
  AssignClient(AClient);
end;

procedure TBasicActionLink.AssignClient(AClient: TObject);
begin
end;

destructor TBasicActionLink.Destroy;
begin
  if FAction <> nil then FAction.UnRegisterChanges(Self);
  inherited Destroy;
end;

procedure TBasicActionLink.Change;
begin
  if Assigned(OnChange) then OnChange(FAction);
end;

function TBasicActionLink.Execute(AComponent: TComponent): Boolean;
begin
  FAction.ActionComponent := AComponent;
  Result := FAction.Execute;
end;

procedure TBasicActionLink.SetAction(Value: TBasicAction);
begin
  if Value <> FAction then
  begin
    if FAction <> nil then FAction.UnRegisterChanges(Self);
    FAction := Value;
    if Value <> nil then Value.RegisterChanges(Self);
  end;
end;

function TBasicActionLink.IsOnExecuteLinked: Boolean;
begin
  Result := True;
end;

procedure TBasicActionLink.SetOnExecute(Value: TNotifyEvent);
begin
end;

function TBasicActionLink.Update: Boolean;
begin
  Result := FAction.Update;
end;

{ TBasicAction }

constructor TBasicAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FClients := TList.Create;
end;

destructor TBasicAction.Destroy;
begin
  inherited Destroy;
  if Assigned(ActionComponent) then
    ActionComponent.RemoveFreeNotification(Self);
  if Assigned(FClients) then
    while FClients.Count > 0 do
      UnRegisterChanges(TBasicActionLink(FClients.Last));
  FreeAndNil(FClients);
end; 

function TBasicAction.HandlesTarget(Target: TObject): Boolean;
begin
  Result := False;
end;

procedure TBasicAction.ExecuteTarget(Target: TObject);
begin
end;

procedure TBasicAction.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = ActionComponent) then
    FActionComponent := nil;
end;

procedure TBasicAction.UpdateTarget(Target: TObject);
begin
end;

function TBasicAction.Execute: Boolean;
begin
  if Assigned(FOnExecute) then
  begin
    FOnExecute(Self);
    Result := True;
  end
  else Result := False;
end;

function TBasicAction.Update: Boolean;
begin
  if Assigned(FOnUpdate) then
  begin
    FOnUpdate(Self);
    Result := True;
  end
  else Result := False;
end;

procedure TBasicAction.SetOnExecute(Value: TNotifyEvent);
var
  I: Integer;
begin
  if (TMethod(Value).Code <> TMethod(OnExecute).Code) or
     (TMethod(Value).Data <> TMethod(OnExecute).Data) then
  begin
    for I := 0 to FClients.Count - 1 do
      TBasicActionLink(FClients[I]).SetOnExecute(Value);
    FOnExecute := Value;
    Change;
  end;
end;

procedure TBasicAction.Change;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TBasicAction.RegisterChanges(Value: TBasicActionLink);
begin
  Value.FAction := Self;
  FClients.Add(Value);
end;

procedure TBasicAction.UnRegisterChanges(Value: TBasicActionLink);
var
  I: Integer;
begin
  for I := 0 to FClients.Count - 1 do
    if FClients[I] = Value then
    begin
      Value.FAction := nil;
      FClients.Delete(I);
      Break;
    end;
end;

procedure TBasicAction.SetActionComponent(const Value: TComponent);
begin
  if FActionComponent <> Value then
  begin
    if Assigned(FActionComponent) then
      FActionComponent.RemoveFreeNotification(Self);
    FActionComponent := Value;
    if Assigned(FActionComponent) then
      FActionComponent.FreeNotification(Self);
  end;
end;

{ TStreamAdapter }

constructor TStreamAdapter.Create(Stream: TStream;
  Ownership: TStreamOwnership);
begin
  inherited Create;
  FStream := Stream;
  FOwnership := Ownership;
end;

destructor TStreamAdapter.Destroy;
begin
  if FOwnership = soOwned then
  begin
    FStream.Free;
    FStream := nil;
  end;
  inherited Destroy;
end;

function TStreamAdapter.Read(pv: Pointer; cb: Longint; pcbRead: PLongint): HResult;
var
  NumRead: Longint;
begin
  try
    if pv = Nil then
    begin
      Result := STG_E_INVALIDPOINTER;
      Exit;
    end;
    NumRead := FStream.Read(pv^, cb);
    if pcbRead <> Nil then pcbRead^ := NumRead;
    Result := S_OK;
  except
    Result := S_FALSE;
  end;
end;

function TStreamAdapter.Write(pv: Pointer; cb: Longint; pcbWritten: PLongint): HResult;
var
  NumWritten: Longint;
begin
  try
    if pv = Nil then
    begin
      Result := STG_E_INVALIDPOINTER;
      Exit;
    end;
    NumWritten := FStream.Write(pv^, cb);
    if pcbWritten <> Nil then pcbWritten^ := NumWritten;
    Result := S_OK;
  except
    Result := STG_E_CANTSAVE;
  end;
end;

function TStreamAdapter.Seek(dlibMove: Largeint; dwOrigin: Longint;
  out libNewPosition: Largeint): HResult;
var
  NewPos: LargeInt;
begin
  try
    if (dwOrigin < STREAM_SEEK_SET) or (dwOrigin > STREAM_SEEK_END) then
    begin
      Result := STG_E_INVALIDFUNCTION;
      Exit;
    end;
    NewPos := FStream.Seek(dlibMove, dwOrigin);
    if @libNewPosition <> nil then libNewPosition := NewPos;
    Result := S_OK;
  except
    Result := STG_E_INVALIDPOINTER;
  end;
end;

function TStreamAdapter.SetSize(libNewSize: Largeint): HResult;
begin
  try
    FStream.Size := libNewSize;
    if libNewSize <> FStream.Size then
      Result := E_FAIL
    else
      Result := S_OK;
  except
    Result := E_UNEXPECTED;
  end;
end;

function TStreamAdapter.CopyTo(stm: IStream; cb: Largeint; out cbRead: Largeint;
  out cbWritten: Largeint): HResult;
const
  MaxBufSize = 1024 * 1024;  // 1mb
var
  Buffer: Pointer;
  BufSize, N, I, R: Integer;
  BytesRead, BytesWritten, W: LargeInt;
begin
  Result := S_OK;
  BytesRead := 0;
  BytesWritten := 0;
  try
    if cb > MaxBufSize then
      BufSize := MaxBufSize
    else
      BufSize := Integer(cb);
    GetMem(Buffer, BufSize);
    try
      while cb > 0 do
      begin
        if cb > MaxInt then
          I := MaxInt
        else
          I := cb;
        while I > 0 do
        begin
          if I > BufSize then N := BufSize else N := I;
          R := FStream.Read(Buffer^, N);
          if R = 0 then Exit; // The end of the stream was hit.
          Inc(BytesRead, R);
          W := 0;
          Result := stm.Write(Buffer, R, @W);
          Inc(BytesWritten, W);
          if (Result = S_OK) and (Integer(W) <> R) then Result := E_FAIL;
          if Result <> S_OK then Exit;
          Dec(I, R);
          Dec(cb, R);
        end;
      end;
    finally
      FreeMem(Buffer);
      if (@cbWritten <> nil) then cbWritten := BytesWritten;
      if (@cbRead <> nil) then cbRead := BytesRead;
    end;
  except
    Result := E_UNEXPECTED;
  end;
end;

function TStreamAdapter.Commit(grfCommitFlags: Longint): HResult;
begin
  Result := S_OK;
end;

function TStreamAdapter.Revert: HResult;
begin
  Result := STG_E_REVERTED;
end;

function TStreamAdapter.LockRegion(libOffset: Largeint; cb: Largeint;
  dwLockType: Longint): HResult;
begin
  Result := STG_E_INVALIDFUNCTION;
end;

function TStreamAdapter.UnlockRegion(libOffset: Largeint; cb: Largeint;
  dwLockType: Longint): HResult;
begin
  Result := STG_E_INVALIDFUNCTION;
end;

function TStreamAdapter.Stat(out statstg: TStatStg; grfStatFlag: Longint): HResult;
begin
  Result := S_OK;
  try
    if (@statstg <> nil) then
      with statstg do
      begin
        dwType := STGTY_STREAM;
        cbSize := FStream.Size;
        mTime.dwLowDateTime := 0;
        mTime.dwHighDateTime := 0;
        cTime.dwLowDateTime := 0;
        cTime.dwHighDateTime := 0;
        aTime.dwLowDateTime := 0;
        aTime.dwHighDateTime := 0;
        grfLocksSupported := LOCK_WRITE;
      end;
  except
    Result := E_UNEXPECTED;
  end;
end;

function TStreamAdapter.Clone(out stm: IStream): HResult;
begin
  Result := E_NOTIMPL;
end;

procedure FreeIntConstList;
var
  I: Integer;
begin
  with IntConstList.LockList do
  try
    for I := 0 to Count - 1 do
      TIntConst(Items[I]).Free;
  finally
    IntConstList.UnlockList;
  end;
  IntConstList.Free;
end;

procedure ModuleUnload(Instance: IntPtr);
begin
  UnregisterModuleClasses(HMODULE(Instance));
end;

{ TDataModule }

constructor TDataModule.Create(AOwner: TComponent);
begin
  GlobalNameSpace.BeginWrite;
  try
    CreateNew(AOwner);
    if (ClassType <> TDataModule) and not (csDesigning in ComponentState) then
    begin
      if not InitInheritedComponent(Self, TDataModule) then
        raise EResNotFound.CreateFmt(SResNotFound, [ClassName]);
      if OldCreateOrder then DoCreate;
    end;
  finally
    GlobalNameSpace.EndWrite;
  end;
end;

procedure TDataModule.AfterConstruction;
begin
  if not OldCreateOrder then DoCreate;
end;

constructor TDataModule.CreateNew(AOwner: TComponent; Dummy: Integer);
begin
  inherited Create(AOwner);

  if Assigned(AddDataModule) and (Dummy >= 0) then
    AddDataModule(Self);
end;

procedure TDataModule.BeforeDestruction;
begin
  GlobalNameSpace.BeginWrite;
  Destroying;
  RemoveFixupReferences(Self, '');
  if not OldCreateOrder then DoDestroy;
end;

destructor TDataModule.Destroy;
begin
  if not (csDestroying in ComponentState) then GlobalNameSpace.BeginWrite;
  try
    if OldCreateOrder then DoDestroy;
    if Assigned(RemoveDataModule) then
      RemoveDataModule(Self);
    inherited Destroy;
  finally
    GlobalNameSpace.EndWrite;
  end;
end;

procedure TDataModule.DoCreate;
begin
  if Assigned(FOnCreate) then
  try
    FOnCreate(Self);
  except
    if not HandleCreateException then
      raise;
  end;
end;

procedure TDataModule.DoDestroy;
begin
  if Assigned(FOnDestroy) then
  try
    FOnDestroy(Self);
  except
    if Assigned(ApplicationHandleException) then
      ApplicationHandleException(Self);
  end;
end;

procedure TDataModule.DefineProperties(Filer: TFiler);
var
  Ancestor: TDataModule;

  function DoWriteWidth: Boolean;
  begin
    Result := True;
    if Ancestor <> nil then Result := FDesignSize.X <> Ancestor.FDesignSize.X;
  end;

  function DoWriteHorizontalOffset: Boolean;
  begin
    if Ancestor <> nil then
      Result := FDesignOffset.X <> Ancestor.FDesignOffset.X else
      Result := FDesignOffset.X <> 0;
  end;

  function DoWriteVerticalOffset: Boolean;
  begin
    if Ancestor <> nil then
      Result := FDesignOffset.Y <> Ancestor.FDesignOffset.Y else
      Result := FDesignOffset.Y <> 0;
  end;

  function DoWriteHeight: Boolean;
  begin
    Result := True;
    if Ancestor <> nil then Result := FDesignSize.Y <> Ancestor.FDesignSize.Y;
  end;

begin
  inherited DefineProperties(Filer);
  Ancestor := TDataModule(Filer.Ancestor);
  Filer.DefineProperty('Height', ReadHeight, WriteHeight, DoWriteHeight);
  Filer.DefineProperty('HorizontalOffset', ReadHorizontalOffset,
    WriteHorizontalOffset, DoWriteHorizontalOffset);
  Filer.DefineProperty('VerticalOffset', ReadVerticalOffset,
    WriteVerticalOffset, DoWriteVerticalOffset);
  Filer.DefineProperty('Width', ReadWidth, WriteWidth, DoWriteWidth);
end;

procedure TDataModule.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I: Integer;
  OwnedComponent: TComponent;
begin
  inherited GetChildren(Proc, Root);
  if Root = Self then
    for I := 0 to ComponentCount - 1 do
    begin
      OwnedComponent := Components[I];
      if not OwnedComponent.HasParent then Proc(OwnedComponent);
    end;
end;

function TDataModule.HandleCreateException: Boolean;
begin
  if Assigned(ApplicationHandleException) then
  begin
    ApplicationHandleException(Self);
    Result := True;
  end
  else
    Result := False;
end;

procedure TDataModule.ReadState(Reader: TReader);
begin
  FOldCreateOrder := not ModuleIsCPP;
  inherited ReadState(Reader);
end;

procedure TDataModule.ReadWidth(Reader: TReader);
begin
  FDesignSize.X := Reader.ReadInteger;
end;

procedure TDataModule.ReadHorizontalOffset(Reader: TReader);
begin
  FDesignOffset.X := Reader.ReadInteger;
end;

procedure TDataModule.ReadVerticalOffset(Reader: TReader);
begin
  FDesignOffset.Y := Reader.ReadInteger;
end;

procedure TDataModule.ReadHeight(Reader: TReader);
begin
  FDesignSize.Y := Reader.ReadInteger;
end;

procedure TDataModule.WriteWidth(Writer: TWriter);
begin
  Writer.WriteInteger(FDesignSize.X);
end;

procedure TDataModule.WriteHorizontalOffset(Writer: TWriter);
begin
  Writer.WriteInteger(FDesignOffset.X);
end;

procedure TDataModule.WriteVerticalOffset(Writer: TWriter);
begin
  Writer.WriteInteger(FDesignOffset.Y);
end;

procedure TDataModule.WriteHeight(Writer: TWriter);
begin
  Writer.WriteInteger(FDesignSize.Y);
end;

{$IFDEF MSWINDOWS}

{ Object instance management }

type
  PObjectInstance = ^TObjectInstance;
  TObjectInstance = packed record
    Code: Byte;
    Offset: Integer;
    case Integer of
      0: (Next: PObjectInstance);
      1: (FMethod: TWndMethod);
  end;

const
{$IF Defined(CPUX86)}
  CodeBytes = 2;
{$ELSEIF Defined(CPUX64)}
  CodeBytes = 8;
{$IFEND}
  InstanceCount = (4096 - SizeOf(Pointer) * 2 - CodeBytes) div SizeOf(TObjectInstance) - 1;

type
  PInstanceBlock = ^TInstanceBlock;
  TInstanceBlock = packed record
    Next: PInstanceBlock;
    Code: array[1..CodeBytes] of Byte;
    WndProcPtr: Pointer;
    Instances: array[0..InstanceCount] of TObjectInstance;
  end;

var
  InstBlockList: PInstanceBlock;
  InstFreeList: PObjectInstance;

{ Standard window procedure }
function StdWndProc(Window: HWND; Message: UINT; WParam: WPARAM; LParam: WPARAM): LRESULT; stdcall;
{$IF Defined(CPUX86)}
{ In    ECX = Address of method pointer }
{ Out   EAX = Result }
asm
        XOR     EAX,EAX
        PUSH    EAX
        PUSH    LParam
        PUSH    WParam
        PUSH    Message
        MOV     EDX,ESP
        MOV     EAX,[ECX].Longint[4]
        CALL    [ECX].Pointer
        ADD     ESP,12
        POP     EAX
end;
{$ELSEIF Defined(CPUX64)}
{ In    R11 = Address of method pointer }
{ Out   RAX = Result }
var
  Msg: TMessage;
asm
        .PARAMS 2
        MOV     Msg.Msg,Message
        MOV     Msg.WParam,WParam
        MOV     Msg.LParam,LParam
        MOV     Msg.Result,0
        LEA     RDX,Msg
        MOV     RCX,[R11].TMethod.Data
        CALL    [R11].TMethod.Code
        MOV     RAX,Msg.Result
end;
{$IFEND}

{ Allocate an object instance }

function CalcJmpOffset(Src, Dest: Pointer): Longint;
begin
  Result := IntPtr(Dest) - (IntPtr(Src) + 5);
end;

function MakeObjectInstance(AMethod: TWndMethod): Pointer;
const
  BlockCode: array[1..CodeBytes] of Byte = (
{$IF Defined(CPUX86)}
    $59,                       { POP ECX }
    $E9);                      { JMP StdWndProc }
{$ELSEIF Defined(CPUX64)}
    $41,$5b,                   { POP R11 }
    $FF,$25,$00,$00,$00,$00);  { JMP [RIP+0] }
{$IFEND}
  PageSize = 4096;
var
  Block: PInstanceBlock;
  Instance: PObjectInstance;
begin
  if InstFreeList = nil then
  begin
    Block := VirtualAlloc(nil, PageSize, MEM_COMMIT, PAGE_EXECUTE_READWRITE);
    Block^.Next := InstBlockList;
    Move(BlockCode, Block^.Code, SizeOf(BlockCode));
{$IF Defined(CPUX86)}
    Block^.WndProcPtr := Pointer(CalcJmpOffset(@Block^.Code[2], @StdWndProc));
{$ELSEIF Defined(CPUX64)}
    Block^.WndProcPtr := @StdWndProc;
{$IFEND}
    Instance := @Block^.Instances;
    repeat
      Instance^.Code := $E8;  { CALL NEAR PTR Offset }
      Instance^.Offset := CalcJmpOffset(Instance, @Block^.Code);
      Instance^.Next := InstFreeList;
      InstFreeList := Instance;
      Inc(PByte(Instance), SizeOf(TObjectInstance));
    until IntPtr(Instance) - IntPtr(Block) >= SizeOf(TInstanceBlock);
    InstBlockList := Block;
  end;
  Result := InstFreeList;
  Instance := InstFreeList;
  InstFreeList := Instance^.Next;
  Instance^.FMethod := AMethod;
end;

{ Free an object instance }

procedure FreeObjectInstance(ObjectInstance: Pointer);
begin
  if ObjectInstance <> nil then
  begin
    PObjectInstance(ObjectInstance)^.Next := InstFreeList;
    InstFreeList := ObjectInstance;
  end;
end;

procedure CleanupInstFreeList(BlockStart, BlockEnd: PByte);
var
  Prev, Next, Item: PObjectInstance;
begin
  Prev := nil;
  Item := InstFreeList;
  while Item <> nil do
  begin
    Next := Item.Next;
    if (PByte(Item) >= BlockStart) and (PByte(Item) <= BlockEnd) then
    begin
      Item := Prev;
      if Prev = nil then
        InstFreeList := Next
      else
        Prev.Next := Next;
    end;
    Prev := Item;
    Item := Next;
  end;
end;

function GetFreeInstBlockItemCount(Item: PObjectInstance; Block: PInstanceBlock): Integer;
var
  I: Integer;
begin
  Result := 0;
  while Item <> nil do
  begin
    for I := High(Block.Instances) downto 0 do
    begin
      if @Block.Instances[I] = Item then
      begin
        Inc(Result);
        Break;
      end;
    end;
    Item := Item.Next;
  end;
end;

procedure ReleaseObjectInstanceBlocks;
var
  NextBlock, Block, PrevBlock: PInstanceBlock;
  UnusedCount: Integer;
begin
  Block := InstBlockList;
  PrevBlock := nil;
  while Block <> nil do
  begin
    NextBlock := Block.Next;

    { Obtain the number of free items in the InstanceBlock }
    UnusedCount := GetFreeInstBlockItemCount(InstFreeList, Block);

    { Release memory if the InstanceBlock contains only "free" items }
    if UnusedCount = Length(Block.Instances) then
    begin
      { Remove all InstFreeList items that refer to the InstanceBlock }
      CleanupInstFreeList(PByte(Block), PByte(Block) + SizeOf(TInstanceBlock) - 1);

      VirtualFree(Block, 0, MEM_RELEASE);

      Block := PrevBlock;
      if PrevBlock = nil then
        InstBlockList := NextBlock
      else
        PrevBlock.Next := NextBlock;
    end;

    { Next InstanceBlock }
    PrevBlock := Block;
    Block := NextBlock;
  end;
end;


var
  UtilWindowClass: TWndClass = (
    style: 0;
    lpfnWndProc: @DefWindowProc;
    cbClsExtra: 0;
    cbWndExtra: 0;
    hInstance: 0;
    hIcon: 0;
    hCursor: 0;
    hbrBackground: 0;
    lpszMenuName: nil;
    lpszClassName: 'TPUtilWindow');

function AllocateHWnd(AMethod: TWndMethod): HWND;
var
  TempClass: TWndClass;
  ClassRegistered: Boolean;
begin
  UtilWindowClass.hInstance := HInstance;
{$IFDEF PIC}
  UtilWindowClass.lpfnWndProc := @DefWindowProc;
{$ENDIF}
  ClassRegistered := GetClassInfo(HInstance, UtilWindowClass.lpszClassName,
    TempClass);
  if not ClassRegistered or (TempClass.lpfnWndProc <> @DefWindowProc) then
  begin
    if ClassRegistered then
      Winapi.Windows.UnregisterClass(UtilWindowClass.lpszClassName, HInstance);
    Winapi.Windows.RegisterClass(UtilWindowClass);
  end;
  Result := CreateWindowEx(WS_EX_TOOLWINDOW, UtilWindowClass.lpszClassName,
    '', WS_POPUP {+ 0}, 0, 0, 0, 0, 0, 0, HInstance, nil);
  if Assigned(AMethod) then
    SetWindowLongPtr(Result, GWL_WNDPROC, IntPtr(MakeObjectInstance(AMethod)));
end;

procedure DeallocateHWnd(Wnd: HWND);
var
  Instance: Pointer;
begin
  Instance := Pointer(GetWindowLongPtr(Wnd, GWL_WNDPROC));
  DestroyWindow(Wnd);
  if Instance <> @DefWindowProc then FreeObjectInstance(Instance);
end;

{$ENDIF}

{ EFileStreamError }

constructor EFileStreamError.Create(ResStringRec: PResStringRec;
  const FileName: string);
begin
  inherited CreateResFmt(ResStringRec, [ExpandFileName(FileName), SysErrorMessage(GetLastError)]);
end;

{ TStringReader }

procedure TStringReader.Close;
begin
  FData := '';
  FIndex := -1;
end;

constructor TStringReader.Create(S: string);
begin
  inherited Create;

  FIndex := 1;
  FData := S;
end;

function TStringReader.Peek: Integer;
begin
  Result := -1;
  if (FIndex > 0) and (FIndex <= Length(FData)) then
    Result := Integer(FData[FIndex]);
end;

function TStringReader.Read: Integer;
begin
  Result := -1;
  if (FIndex > 0) and (FIndex <= Length(FData)) then
  begin
    Result := Integer(FData[FIndex]);
    Inc(FIndex);
    if FIndex > Length(FData) then
      FIndex := -1;
  end;
end;

function TStringReader.Read(const Buffer: TCharArray; Index,
  Count: Integer): Integer;
begin
  Result := -1;

  if FIndex = -1 then
    Exit;

  if Length(Buffer) < Index + Count then
    raise EArgumentOutOfRangeException.Create(SInsufficientReadBuffer);

  if Count > Length(FData) - FIndex + 1 then
    Count := Length(FData) - FIndex + 1;
  Result := Count;

  Move(FData[FIndex], Buffer[Index], Count * SizeOf(Char));

  Inc(FIndex, Count);
  if FIndex > Length(FData) then
    FIndex := -1;
end;

function TStringReader.ReadBlock(const Buffer: TCharArray; Index,
  Count: Integer): Integer;
begin
  Result := Read(Buffer, Index, Count);
end;

function TStringReader.ReadLine: string;
var
  StartIndex: Integer;
  EndIndex: Integer;
begin
  Result := '';

  if FIndex = -1 then
    Exit;

  StartIndex := FIndex;
  EndIndex := FIndex;

  while True do
  begin
    if EndIndex > Length(FData) then
    begin
      FIndex := EndIndex;
      Break;
    end;
    if FData[EndIndex] = #10 then
    begin
      FIndex := EndIndex + 1;
      Break;
    end
    else
    if (FData[EndIndex] = #13) and (EndIndex + 1 <= Length(FData)) and (FData[EndIndex + 1] = #10) then
    begin
      FIndex := EndIndex + 2;
      Break;
    end
    else
    if FData[EndIndex] = #13 then
    begin
      FIndex := EndIndex + 1;
      Break;
    end;

    Inc(EndIndex);
  end;

  SetLength(Result, EndIndex - StartIndex);
  Move(FData[StartIndex], Result[1], (EndIndex - StartIndex) * SizeOf(Char));

  if FIndex > Length(FData) then
    FIndex := -1;
end;

function TStringReader.ReadToEnd: string;
begin
  Result := '';

  if FIndex = -1 then
    Exit;

  SetLength(Result, Length(FData) - FIndex + 1);
  Move(FData[FIndex], Result[1], (Length(FData) - FIndex + 1) * SizeOf(Char));
  FIndex := -1;
end;

{ TStringWriter }

procedure TStringWriter.Close;
begin

end;

constructor TStringWriter.Create;
begin
  inherited Create;

  FOwnsBuilder := True;
  FBuilder := TStringBuilder.Create;
end;

constructor TStringWriter.Create(Builder: TStringBuilder);
begin
  inherited Create;

  if not Assigned(Builder) then
    raise EArgumentException.CreateResFmt(@SParamIsNil, ['Builder']); // DO NOT LOCALIZE

  FOwnsBuilder := False;
  FBuilder := Builder;
end;

destructor TStringWriter.Destroy;
begin
  if FOwnsBuilder then
  begin
    FBuilder.Free;
    FBuilder := nil;
  end;
  inherited;
end;

procedure TStringWriter.Flush;
begin

end;

function TStringWriter.ToString: string;
begin
  Result := FBuilder.ToString;
end;

procedure TStringWriter.Write(Value: Cardinal);
begin
  FBuilder.Append(Value);
end;

procedure TStringWriter.Write(Value: Boolean);
begin
  FBuilder.Append(Value);
end;

procedure TStringWriter.Write(Value: Char);
begin
  FBuilder.Append(Value);
end;

procedure TStringWriter.Write(const Value: TCharArray; Index, Count: Integer);
begin
  FBuilder.Append(Value, Index, Count);
end;

procedure TStringWriter.Write(const Format: string; Args: array of const);
begin
  FBuilder.AppendFormat(Format, Args);
end;

procedure TStringWriter.Write(Value: UInt64);
begin
  FBuilder.Append(Value);
end;

procedure TStringWriter.Write(Value: TObject);
begin
  FBuilder.Append(Value);
end;

procedure TStringWriter.Write(Value: Single);
begin
  FBuilder.Append(Value);
end;

procedure TStringWriter.Write(const Value: string);
begin
  FBuilder.Append(Value);
end;

procedure TStringWriter.Write(Value: Int64);
begin
  FBuilder.Append(Value);
end;

procedure TStringWriter.Write(const Value: TCharArray);
begin
  FBuilder.Append(Value);
end;

procedure TStringWriter.Write(Value: Double);
begin
  FBuilder.Append(Value);
end;

procedure TStringWriter.Write(Value: Integer);
begin
  FBuilder.Append(Value);
end;

procedure TStringWriter.WriteLine(const Value: TCharArray);
begin
  FBuilder.Append(Value);
  FBuilder.AppendLine;
end;

procedure TStringWriter.WriteLine(Value: Double);
begin
  FBuilder.Append(Value);
  FBuilder.AppendLine;
end;

procedure TStringWriter.WriteLine(Value: Integer);
begin
  FBuilder.Append(Value);
  FBuilder.AppendLine;
end;

procedure TStringWriter.WriteLine;
begin
  FBuilder.AppendLine;
end;

procedure TStringWriter.WriteLine(Value: Boolean);
begin
  FBuilder.Append(Value);
  FBuilder.AppendLine;
end;

procedure TStringWriter.WriteLine(Value: Char);
begin
  FBuilder.Append(Value);
  FBuilder.AppendLine;
end;

procedure TStringWriter.WriteLine(Value: Int64);
begin
  FBuilder.Append(Value);
  FBuilder.AppendLine;
end;

procedure TStringWriter.WriteLine(Value: UInt64);
begin
  FBuilder.Append(Value);
  FBuilder.AppendLine;
end;

procedure TStringWriter.WriteLine(const Format: string; Args: array of const);
begin
  FBuilder.AppendFormat(Format, Args);
  FBuilder.AppendLine;
end;

procedure TStringWriter.WriteLine(const Value: TCharArray; Index, Count: Integer);
begin
  FBuilder.Append(Value, Index, Count);
  FBuilder.AppendLine;
end;

procedure TStringWriter.WriteLine(Value: Cardinal);
begin
  FBuilder.Append(Value);
  FBuilder.AppendLine;
end;

procedure TStringWriter.WriteLine(Value: TObject);
begin
  FBuilder.Append(Value);
  FBuilder.AppendLine;
end;

procedure TStringWriter.WriteLine(Value: Single);
begin
  FBuilder.Append(Value);
  FBuilder.AppendLine;
end;

procedure TStringWriter.WriteLine(const Value: string);
begin
  FBuilder.Append(Value);
  FBuilder.AppendLine;
end;

{ TStreamWriter }

procedure TStreamWriter.Close;
begin
  Flush;
  if FOwnsStream  then
    FreeAndNil(FStream);
end;

constructor TStreamWriter.Create(Stream: TStream);
begin
  inherited Create;
  FOwnsStream := False;
  FStream := Stream;
  FEncoding := TEncoding.UTF8;
  SetLength(FBuffer, 1024);
  FBufferIndex := 0;
  FNewLine := sLineBreak;
  FAutoFlush := True;
end;

constructor TStreamWriter.Create(Stream: TStream; Encoding: TEncoding; BufferSize: Integer);
begin
  inherited Create;
  FOwnsStream := False;
  FStream := Stream;
  FEncoding := Encoding;
  if BufferSize >= 128 then
    SetLength(FBuffer, BufferSize)
  else
    SetLength(FBuffer, 128);
  FBufferIndex := 0;
  FNewLine := sLineBreak;
  FAutoFlush := True;
  if Stream.Position = 0 then
    WriteBytes(FEncoding.GetPreamble);
end;

constructor TStreamWriter.Create(const Filename: string; Append: Boolean);
begin
  if (not FileExists(Filename)) or (not Append) then
    FStream := TFileStream.Create(Filename, fmCreate)
  else
  begin
    FStream := TFileStream.Create(Filename, fmOpenWrite);
    FStream.Seek(0, soEnd);
  end;
  Create(FStream);
  FOwnsStream := True;
end;

constructor TStreamWriter.Create(const Filename: string; Append: Boolean;
  Encoding: TEncoding; BufferSize: Integer);
begin
  if (not FileExists(Filename)) or (not Append) then
    FStream := TFileStream.Create(Filename, fmCreate)
  else
  begin
    FStream := TFileStream.Create(Filename, fmOpenWrite);
    FStream.Seek(0, soEnd);
  end;
  Create(FStream, Encoding, BufferSize);
  FOwnsStream := True;
end;

destructor TStreamWriter.Destroy;
begin
  Close;
  SetLength(FBuffer, 0);
  inherited;
end;

procedure TStreamWriter.Flush;
begin
  if FBufferIndex = 0 then
    Exit;
  if FStream = nil then
    Exit;

  FStream.Write(FBuffer[0], FBufferIndex);
  FBufferIndex := 0;
end;

procedure TStreamWriter.OwnStream;
begin
  FOwnsStream := True;
end;

procedure TStreamWriter.Write(Value: Cardinal);
begin
  WriteBytes(FEncoding.GetBytes(UIntToStr(Value)));
end;

procedure TStreamWriter.Write(const Value: string);
begin
  WriteBytes(FEncoding.GetBytes(Value));
end;

procedure TStreamWriter.Write(Value: UInt64);
begin
  WriteBytes(FEncoding.GetBytes(UIntToStr(Value)));
end;

procedure TStreamWriter.Write(const Value: TCharArray; Index, Count: Integer);
var
  Bytes: TBytes;
begin
  SetLength(Bytes, Count * 4);
  SetLength(Bytes, FEncoding.GetBytes(Value, Index, Count, Bytes, 0));
  WriteBytes(Bytes);
end;

procedure TStreamWriter.WriteBytes(Bytes: TBytes);
var
  ByteIndex: Integer;
  WriteLen: Integer;
begin
  ByteIndex := 0;

  while ByteIndex < Length(Bytes) do
  begin
    WriteLen := Length(Bytes) - ByteIndex;
    if WriteLen > Length(FBuffer) - FBufferIndex then
      WriteLen := Length(FBuffer) - FBufferIndex;

    Move(Bytes[ByteIndex], FBuffer[FBufferIndex], WriteLen);

    Inc(FBufferIndex, WriteLen);
    Inc(ByteIndex, WriteLen);

    if FBufferIndex >= Length(FBuffer) then
      Flush;
  end;

  if FAutoFlush then
    Flush;
end;

procedure TStreamWriter.Write(const Format: string; Args: array of const);
begin
  WriteBytes(FEncoding.GetBytes(System.SysUtils.Format(Format, Args)));
end;

procedure TStreamWriter.Write(Value: Single);
begin
  WriteBytes(FEncoding.GetBytes(FloatToStr(Value)));
end;

procedure TStreamWriter.Write(const Value: TCharArray);
begin
  WriteBytes(FEncoding.GetBytes(Value));
end;

procedure TStreamWriter.Write(Value: Double);
begin
  WriteBytes(FEncoding.GetBytes(FloatToStr(Value)));
end;

procedure TStreamWriter.Write(Value: Integer);
begin
  WriteBytes(FEncoding.GetBytes(IntToStr(Value)));
end;

procedure TStreamWriter.Write(Value: Char);
begin
  WriteBytes(FEncoding.GetBytes(Value));
end;

procedure TStreamWriter.Write(Value: TObject);
begin
  WriteBytes(FEncoding.GetBytes(Value.ToString));
end;

procedure TStreamWriter.Write(Value: Int64);
begin
  WriteBytes(FEncoding.GetBytes(IntToStr(Value)));
end;

procedure TStreamWriter.Write(Value: Boolean);
begin
  WriteBytes(FEncoding.GetBytes(BoolToStr(Value, True)));
end;

procedure TStreamWriter.WriteLine(const Value: TCharArray);
begin
  WriteBytes(FEncoding.GetBytes(Value));
  WriteBytes(FEncoding.GetBytes(FNewLine));
end;

procedure TStreamWriter.WriteLine(Value: Double);
begin
  WriteBytes(FEncoding.GetBytes(FloatToStr(Value) + FNewLine));
end;

procedure TStreamWriter.WriteLine(Value: Integer);
begin
  WriteBytes(FEncoding.GetBytes(IntToStr(Value) + FNewLine));
end;

procedure TStreamWriter.WriteLine;
begin
  WriteBytes(FEncoding.GetBytes(FNewLine));
end;

procedure TStreamWriter.WriteLine(Value: Boolean);
begin
  WriteBytes(FEncoding.GetBytes(BoolToStr(Value, True) + FNewLine));
end;

procedure TStreamWriter.WriteLine(Value: Char);
begin
  WriteBytes(FEncoding.GetBytes(Value));
  WriteBytes(FEncoding.GetBytes(FNewLine));
end;

procedure TStreamWriter.WriteLine(Value: Int64);
begin
  WriteBytes(FEncoding.GetBytes(IntToStr(Value) + FNewLine));
end;

procedure TStreamWriter.WriteLine(Value: UInt64);
begin
  WriteBytes(FEncoding.GetBytes(UIntToStr(Value) + FNewLine));
end;

procedure TStreamWriter.WriteLine(const Format: string; Args: array of const);
begin
  WriteBytes(FEncoding.GetBytes(System.SysUtils.Format(Format, Args) + FNewLine));
end;

procedure TStreamWriter.WriteLine(const Value: TCharArray; Index, Count: Integer);
var
  Bytes: TBytes;
begin
  SetLength(Bytes, Count * 4);
  SetLength(Bytes, FEncoding.GetBytes(Value, Index, Count, Bytes, 0));
  WriteBytes(Bytes);
  WriteBytes(FEncoding.GetBytes(FNewLine));
end;

procedure TStreamWriter.WriteLine(Value: Cardinal);
begin
  WriteBytes(FEncoding.GetBytes(UIntToStr(Value) + FNewLine));
end;

procedure TStreamWriter.WriteLine(Value: TObject);
begin
  WriteBytes(FEncoding.GetBytes(Value.ToString + FNewLine));
end;

procedure TStreamWriter.WriteLine(Value: Single);
begin
  WriteBytes(FEncoding.GetBytes(FloatToStr(Value) + FNewLine));
end;

procedure TStreamWriter.WriteLine(const Value: string);
begin
  WriteBytes(FEncoding.GetBytes(Value + FNewLine));
end;

{ TStreamReader }

constructor TStreamReader.Create(Stream: TStream);
begin
  Create(Stream, TEncoding.UTF8, True);
end;

constructor TStreamReader.Create(Stream: TStream; DetectBOM: Boolean);
begin
  Create(Stream, TEncoding.UTF8, DetectBOM);
end;

constructor TStreamReader.Create(Stream: TStream; Encoding: TEncoding;
  DetectBOM: Boolean = False; BufferSize: Integer = 1024);
begin
  inherited Create;

  if not Assigned(Stream) then
    raise EArgumentException.CreateResFmt(@SParamIsNil, ['Stream']); // DO NOT LOCALIZE
  if not Assigned(Encoding) then
    raise EArgumentException.CreateResFmt(@SParamIsNil, ['Encoding']); // DO NOT LOCALIZE

  FBufferedData := TStringBuilder.Create;
  FEncoding := Encoding;
  FBufferSize := BufferSize;
  if FBufferSize < 128 then
    FBufferSize := 128;
  FNoDataInStream := False;
  FStream := Stream;
  FOwnsStream := False;
  FDetectBOM := DetectBOM;
  FSkipPreamble := not FDetectBOM;
end;

constructor TStreamReader.Create(const Filename: string; Encoding: TEncoding;
  DetectBOM: Boolean = False; BufferSize: Integer = 1024);
begin
  Create(TFileStream.Create(Filename, fmOpenRead), Encoding, DetectBOM, BufferSize);
  FOwnsStream := True;
end;

constructor TStreamReader.Create(const Filename: string; DetectBOM: Boolean);
begin
  Create(TFileStream.Create(Filename, fmOpenRead), DetectBOM);
  FOwnsStream := True;
end;

constructor TStreamReader.Create(const Filename: string);
begin
  Create(TFileStream.Create(Filename, fmOpenRead));
  FOwnsStream := True;
end;

destructor TStreamReader.Destroy;
begin
  Close;
  inherited;
end;

procedure TStreamReader.Close;
begin
  if (FStream <> nil) and FOwnsStream then
  begin
    FStream.Free;
    FStream := nil;
  end;

  if FBufferedData <> nil then
  begin
    FBufferedData.Free;
    FBufferedData := nil;
  end;
end;

procedure TStreamReader.DiscardBufferedData;
begin
  if FBufferedData <> nil then
  begin
    FBufferedData.Remove(0, FBufferedData.Length);
    FNoDataInStream := False;
  end;
end;

function TStreamReader.DetectBOM(var Encoding: TEncoding; Buffer: TBytes): Integer;
var
  LEncoding: TEncoding;
begin
  // try to automatically detect the buffer encoding
  LEncoding := nil;
  Result := TEncoding.GetBufferEncoding(Buffer, LEncoding);

  // detected encoding points to Default and param Encoding requests some other
  // type of Encoding; set the Encoding param to UTF8 as it can also read ANSI (Default)
  if (LEncoding = TEncoding.Default) and (Encoding <> TEncoding.Default) then
    Encoding := TEncoding.UTF8
  else
    Encoding := LEncoding;

  FDetectBOM := False;
end;

procedure TStreamReader.FillBuffer(var Encoding: TEncoding);
const
  BufferPadding = 4;
var
  LString: string;
  LBuffer: TBytes;
  BytesRead: Integer;
  StartIndex: Integer;
  ByteCount: Integer;
  ByteBufLen: Integer;
  ExtraByteCount: Integer;
begin
  SetLength(LBuffer, FBufferSize + BufferPadding);

  // Read data from stream
  BytesRead := FStream.Read(LBuffer[0], FBufferSize);
  FNoDataInStream := BytesRead < FBufferSize;

  // Check for byte order mark and calc start index for character data
  if FDetectBOM then
    StartIndex := DetectBOM(Encoding, LBuffer)
  else if FSkipPreamble then
    StartIndex := SkipPreamble(Encoding, LBuffer)
  else
    StartIndex := 0;

  // Convert to string and calc byte count for the string
  ByteBufLen := BytesRead - StartIndex;
  LString := FEncoding.GetString(LBuffer, StartIndex, ByteBufLen);
  ByteCount := FEncoding.GetByteCount(LString);

  // If byte count <> number of bytes read from the stream
  // the buffer boundary is mid-character and additional bytes
  // need to be read from the stream to complete the character
  ExtraByteCount := 0;
  while (ByteCount <> ByteBufLen) and (ExtraByteCount < FEncoding.GetMaxByteCount(1)) do
  begin
    // Expand buffer if padding is used
    if (StartIndex + ByteBufLen) = Length(LBuffer) then
      SetLength(LBuffer, Length(LBuffer) + BufferPadding);

    // Read one more byte from the stream into the
    // buffer padding and convert to string again
    BytesRead := FStream.Read(LBuffer[StartIndex + ByteBufLen], 1);
    if BytesRead = 0 then
      // End of stream, append what's been read and discard remaining bytes
      Break;

    Inc(ExtraByteCount);

    Inc(ByteBufLen);
    LString := FEncoding.GetString(LBuffer, StartIndex, ByteBufLen);
    ByteCount := FEncoding.GetByteCount(LString);
  end;

  // Add string to character data buffer
  FBufferedData.Append(LString);
end;

function TStreamReader.GetEndOfStream: Boolean;
begin
  if not FNoDataInStream and (FBufferedData <> nil) and (FBufferedData.Length < 1) then
    FillBuffer(FEncoding);
  Result := FNoDataInStream and ((FBufferedData = nil) or (FBufferedData.Length = 0));
end;

procedure TStreamReader.OwnStream;
begin
  FOwnsStream := True;
end;

function TStreamReader.Peek: Integer;
begin
  Result := -1;
  if (FBufferedData <> nil) and (not EndOfStream) then
  begin
    if FBufferedData.Length < 1 then
      FillBuffer(FEncoding);
    Result := Integer(FBufferedData.Chars[0]);
  end;
end;

function TStreamReader.Read(const Buffer: TCharArray; Index,
  Count: Integer): Integer;
begin
  Result := -1;
  if (FBufferedData <> nil) and (not EndOfStream) then
  begin
    while (FBufferedData.Length < Count) and (not EndOfStream) and (not FNoDataInStream) do
      FillBuffer(FEncoding);

    if FBufferedData.Length > Count then
      Result := Count
    else
      Result := FBufferedData.Length;

    FBufferedData.CopyTo(0, Buffer, Index, Result);
    FBufferedData.Remove(0, Result);
  end;
end;

function TStreamReader.ReadBlock(const Buffer: TCharArray; Index,
  Count: Integer): Integer;
begin
  Result := Read(Buffer, Index, Count);
end;

function TStreamReader.Read: Integer;
begin
  Result := -1;
  if (FBufferedData <> nil) and (not EndOfStream) then
  begin
    if FBufferedData.Length < 1 then
      FillBuffer(FEncoding);
    Result := Integer(FBufferedData.Chars[0]);
    FBufferedData.Remove(0, 1);
  end;
end;

function TStreamReader.ReadLine: string;
var
  NewLineIndex: Integer;
  PostNewLineIndex: Integer;
begin
  Result := '';
  if FBufferedData = nil then
    Exit;
  NewLineIndex := 0;
  PostNewLineIndex := 0;

  while True do
  begin
    if (NewLineIndex + 2 > FBufferedData.Length) and (not FNoDataInStream) then
      FillBuffer(FEncoding);

    if NewLineIndex >= FBufferedData.Length then
    begin
      if FNoDataInStream then
      begin
        PostNewLineIndex := NewLineIndex;
        Break;
      end
      else
      begin
        FillBuffer(FEncoding);
        if FBufferedData.Length = 0 then
          Break;
      end;
    end;
    if FBufferedData[NewLineIndex] = #10 then
    begin
      PostNewLineIndex := NewLineIndex + 1;
      Break;
    end
    else
    if (FBufferedData[NewLineIndex] = #13) and (NewLineIndex + 1 < FBufferedData.Length) and (FBufferedData[NewLineIndex + 1] = #10) then
    begin
      PostNewLineIndex := NewLineIndex + 2;
      Break;
    end
    else
    if FBufferedData[NewLineIndex] = #13 then
    begin
      PostNewLineIndex := NewLineIndex + 1;
      Break;
    end;

    Inc(NewLineIndex);
  end;

  Result := FBufferedData.ToString;
  SetLength(Result, NewLineIndex);
  FBufferedData.Remove(0, PostNewLineIndex);
end;

function TStreamReader.ReadToEnd: string;
begin
  Result := '';
  if (FBufferedData <> nil) and (not EndOfStream) then
  begin
    repeat
      FillBuffer(FEncoding);
    until FNoDataInStream;
    Result := FBufferedData.ToString;
    FBufferedData.Remove(0, FBufferedData.Length);
  end;
end;

function TStreamReader.SkipPreamble(Encoding: TEncoding; Buffer: TBytes): Integer;
var
  I: Integer;
  LPreamble: TBytes;
  BOMPresent: Boolean;
begin
  Result := 0;
  LPreamble := Encoding.GetPreamble;
  if (Length(LPreamble) > 0) then
  begin
    if Length(Buffer) >= Length(LPreamble) then
    begin
      BOMPresent := True;
      for I := 0 to Length(LPreamble) - 1 do
        if LPreamble[I] <> Buffer[I] then
        begin
          BOMPresent := False;
          Break;
        end;
      if BOMPresent then
        Result := Length(LPreamble);
    end;
  end;
  FSkipPreamble := False;
end;

{ TBinaryReader }

procedure TBinaryReader.Close;
begin
  if FOwnsStream then
    FreeAndNil(FStream);
end;

constructor TBinaryReader.Create(Stream: TStream; AEncoding: TEncoding; AOwnsStream: Boolean);
begin
  inherited Create;
  if Stream = nil then
    raise EArgumentNilException.CreateRes(@SArgumentNil);
  FStream := Stream;
  if AEncoding = nil then
    FEncoding := TEncoding.UTF8
  else
    FEncoding := AEncoding;
  FOwnsStream := AOwnsStream;
  FTwoBytesPerChar := FEncoding is TUnicodeEncoding;
  FMaxCharsSize := FEncoding.GetMaxByteCount($80);
end;

constructor TBinaryReader.Create(Stream: TStream; AEncoding: TEncoding);
begin
  Create(Stream, AEncoding, False);
end;

constructor TBinaryReader.Create(const Filename: string; Encoding: TEncoding);
begin
  Create(TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite), Encoding, True);
end;

destructor TBinaryReader.Destroy;
begin
  if not TEncoding.IsStandardEncoding(FEncoding) then
    FEncoding.Free;
  if FOwnsStream then
    FStream.Free;
  inherited;
end;

function TBinaryReader.GetBaseStream: TStream;
begin
  Result := FStream;
end;

function TBinaryReader.InternalReadChar: Integer;
var
  CharCount: Integer;
  ByteCount: Integer;
  Index: Integer;
  Position: Int64;
  CharByte: Byte;
begin
  if FCharBytes = nil then
    SetLength(FCharBytes, $80);
  if FOneChar = nil then
    SetLength(FOneChar, 1);
  Index := 0;
  Position := FStream.Position;
  try
    CharCount := 0;
    if FTwoBytesPerChar then
      ByteCount := 2
    else
      ByteCount := 1;
    while (CharCount = 0) and (Index < Length(FCharBytes)) do
    begin
      if FStream.Read(CharByte, SizeOf(CharByte)) = 0 then
        ByteCount := 0;
      FCharBytes[Index] := CharByte;
      Inc(Index);
      if ByteCount = 2 then
      begin
        if FStream.Read(CharByte, SizeOf(CharByte)) = 0 then
          ByteCount := 1;
        FCharBytes[Index] := CharByte;
        Inc(Index);
      end;
      if ByteCount = 0 then
        Exit(-1);
      CharCount := FEncoding.GetChars(FCharBytes, 0, Index + 1, FOneChar, 0);
    end;
  except
    FStream.Position := Position;
    raise;
  end;
  if CharCount > 0 then
    Result := Integer(FOneChar[0])
  else
    Result := -1;
end;

function TBinaryReader.InternalReadChars(const Chars: TCharArray; Index, Count: Integer): Integer;
var
  BytesToRead, RemainingChars, CharCount: Integer;
begin
  if FCharBytes = nil then
    SetLength(FCharBytes, $80);
  RemainingChars := Count;
  while RemainingChars > 0 do
  begin
    BytesToRead := RemainingChars;
    if FTwoBytesPerChar then
      BytesToRead := BytesToRead shl 1;
    if BytesToRead > Length(FCharBytes) then
      BytesToRead := Length(FCharBytes);
    BytesToRead := FStream.Read(FCharBytes[0], BytesToRead);
    if BytesToRead = 0 then
      Break;
    CharCount := FEncoding.GetChars(FCharBytes, 0, BytesToRead, Chars, Index);
    Dec(RemainingChars, CharCount);
    Inc(Index, CharCount);
  end;
  Result := Count - RemainingChars;
end;

function TBinaryReader.PeekChar: Integer;
var
  Position: Int64;
begin
  Position := FStream.Position;
  try
    Result := InternalReadChar;
  finally
    FStream.Position := Position;
  end;
end;

function TBinaryReader.Read(const Buffer: TCharArray; Index, Count: Integer): Integer;
begin
  if Index < 0 then
    raise EArgumentOutOfRangeException.CreateResFmt(@sArgumentOutOfRange_NeedNonNegValue, ['Index']); // do not localize
  if Count < 0 then
    raise EArgumentOutOfRangeException.CreateResFmt(@sArgumentOutOfRange_NeedNonNegValue, ['Count']); // do not localize
  if Length(Buffer) - Index < Count  then
    raise EArgumentOutOfRangeException.CreateRes(@sArgumentOutOfRange_OffLenInvalid);
  Result := InternalReadChars(Buffer, Index, Count);
end;

function TBinaryReader.Read: Integer;
begin
  Result := InternalReadChar;
end;

function TBinaryReader.Read(const Buffer: TBytes; Index, Count: Integer): Integer;
begin
  if Index < 0 then
    raise EArgumentOutOfRangeException.CreateResFmt(@sArgumentOutOfRange_NeedNonNegValue, ['Index']); // do not localize
  if Count < 0 then
    raise EArgumentOutOfRangeException.CreateResFmt(@sArgumentOutOfRange_NeedNonNegValue, ['Count']); // do not localize
  if Length(Buffer) - Index < Count  then
    raise EArgumentOutOfRangeException.CreateRes(@sArgumentOutOfRange_OffLenInvalid);
  Result := FStream.Read(Buffer[Index], Count);
end;

function TBinaryReader.Read7BitEncodedInt: Integer;
var
  Shift: Integer;
  Value: Integer;
begin
  Shift := 0;
  Result := 0;
  repeat
    if Shift = 35 then
      raise EStreamError.CreateRes(@SInvalid7BitEncodedInteger);
    Value := ReadByte;
    Result := Result or ((Value and $7F) shl Shift);
    Inc(Shift, 7);
  until Value and $80 = 0;
end;

function TBinaryReader.ReadBoolean: Boolean;
begin
  FStream.ReadBuffer(Result, SizeOf(Result));
end;

function TBinaryReader.ReadByte: Byte;
begin
  FStream.ReadBuffer(Result, SizeOf(Result));
end;

function TBinaryReader.ReadBytes(Count: Integer): TBytes;
var
  BytesRead: Integer;
begin
  if Count < 0 then
    raise EArgumentOutOfRangeException.CreateResFmt(@sArgumentOutOfRange_NeedNonNegValue, ['Count']); // do not localize
  SetLength(Result, Count);
  BytesRead := FStream.Read(Result[0], Count);
  if BytesRead <> Count then
    SetLength(Result, BytesRead);
end;

function TBinaryReader.ReadCardinal: Cardinal;
begin
  FStream.ReadBuffer(Result, SizeOf(Result));
end;

function TBinaryReader.ReadChar: Char;
var
  Value: Integer;
begin
  Value := Read;
  if Value = -1 then
    raise EStreamError.CreateRes(@SReadPastEndOfStream);
  Result := Char(Value);
end;

function TBinaryReader.ReadChars(Count: Integer): TCharArray;
var
  CharsRead: Integer;
begin
  if Count < 0 then
    raise EArgumentOutOfRangeException.CreateResFmt(@sArgumentOutOfRange_NeedNonNegValue, ['Count']); // do not localize
  SetLength(Result, Count);
  CharsRead := InternalReadChars(Result, 0, Count);
  if CharsRead <> Count then
    SetLength(Result, CharsRead);
end;

function TBinaryReader.ReadDouble: Double;
begin
  FStream.ReadBuffer(Result, SizeOf(Result));
end;

function TBinaryReader.ReadInt64: Int64;
begin
  FStream.ReadBuffer(Result, SizeOf(Result));
end;

function TBinaryReader.ReadInteger: Integer;
begin
  FStream.ReadBuffer(Result, SizeOf(Result));
end;

function TBinaryReader.ReadInt32: Integer;
begin
  Result := ReadInteger;
end;

function TBinaryReader.ReadShortInt: ShortInt;
begin
  FStream.ReadBuffer(Result, SizeOf(Result));
end;

function TBinaryReader.ReadInt16: ShortInt;
begin
  Result := ReadShortInt;
end;

function TBinaryReader.ReadSingle: Single;
begin
  FStream.ReadBuffer(Result, SizeOf(Result));
end;

function TBinaryReader.ReadSmallInt: SmallInt;
begin
  FStream.ReadBuffer(Result, SizeOf(Result));
end;

function TBinaryReader.ReadSByte: SmallInt;
begin
  Result := ReadSmallInt;
end;

function TBinaryReader.ReadString: string;
var
  Bytes: TBytes;
  ByteCount, BytesRead: Integer;
begin
  ByteCount := Read7BitEncodedInt;
  if ByteCount < 0 then
    raise EStreamError.CreateRes(@SInvalidStringLength);
  if ByteCount > 0 then
  begin
    SetLength(Bytes, ByteCount);
    BytesRead := FStream.Read(Bytes[0], ByteCount);
    if BytesRead <> ByteCount then
      raise EStreamError.CreateRes(@SReadPastEndOfStream);
    Result := FEncoding.GetString(Bytes);
  end else
    Result := '';
end;

function TBinaryReader.ReadUInt32: Cardinal;
begin
  Result := ReadCardinal;
end;

function TBinaryReader.ReadUInt64: UInt64;
begin
  FStream.ReadBuffer(Result, SizeOf(Result));
end;

function TBinaryReader.ReadWord: Word;
begin
  FStream.ReadBuffer(Result, SizeOf(Result));
end;

function TBinaryReader.ReadUInt16: Word;
begin
  Result := ReadWord;
end;

{ TNullStream }

type
  TNullStream = class(TStream)
  public
    function Read(var Buffer; Count: Longint): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; overload; override;
  end;

function TNullStream.Read(var Buffer; Count: Longint): Longint;
begin
  Result := 0;
end;

function TNullStream.Write(const Buffer; Count: Longint): Longint;
begin
  Result := 0;
end;

function TNullStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
  Result := 0;
end;

{ TBinaryWriter }

constructor TBinaryWriter.Create(Stream: TStream; Encoding: TEncoding);
begin
  Create(Stream, Encoding, False);
end;

constructor TBinaryWriter.Create(Stream: TStream);
begin
  Create(Stream, nil, False);
end;

constructor TBinaryWriter.Create(Stream: TStream; Encoding: TEncoding; AOwnsStream: Boolean);
begin
  inherited Create;
  if Stream = nil then
    raise EArgumentNilException.CreateRes(@SArgumentNil);
  FStream := Stream;
  if Encoding = nil then
    FEncoding := TEncoding.UTF8
  else
    FEncoding := Encoding;
  FOwnsStream := AOwnsStream;
end;

procedure TBinaryWriter.Close;
begin
  if FOwnsStream then
    FreeAndNil(FStream);
end;

constructor TBinaryWriter.Create(const Filename: string; Append: Boolean; Encoding: TEncoding);
begin
  if (not FileExists(Filename)) or (not Append) then
    FStream := TFileStream.Create(Filename, fmCreate)
  else
  begin
    FStream := TFileStream.Create(Filename, fmOpenWrite);
    FStream.Seek(0, soEnd);
  end;
  Create(FStream, Encoding, True);
end;

constructor TBinaryWriter.Create(const Filename: string; Append: Boolean);
begin
  Create(Filename, Append, nil);
end;

constructor TBinaryWriter.Create;
begin
  Create(TNullStream.Create, nil, True);
end;

destructor TBinaryWriter.Destroy;
begin
  if not TEncoding.IsStandardEncoding(FEncoding) then
    FEncoding.Free;
  if FOwnsStream then
    FStream.Free;
  inherited;
end;

class destructor TBinaryWriter.Destroy;
begin
  FNull.Free;
end;

class function TBinaryWriter.GetNull: TBinaryWriter;
var
  Writer: TBinaryWriter;
begin
  if FNull = nil then
  begin
    Writer := TBinaryWriter.Create;
    Writer := InterlockedCompareExchangePointer(Pointer(FNull), Writer, nil);
    Writer.Free;
  end;
  Result := FNull;
end;

function TBinaryWriter.GetBaseStream: TStream;
begin
  Result := FStream;
end;

function TBinaryWriter.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
  Result := FStream.Seek(Offset, Origin);
end;

procedure TBinaryWriter.Write(Value: Char);
var
  Bytes: TBytes;
begin
  if TCharacter.IsSurrogate(Value) then
    raise EArgumentException.CreateRes(@SNoSurrogates);
  Bytes := FEncoding.GetBytes(Value);
  FStream.WriteBuffer(Bytes[0], Length(Bytes));
end;

procedure TBinaryWriter.Write(Value: Byte);
begin
  FStream.Write(Value, SizeOf(Value));
end;

procedure TBinaryWriter.Write(Value: Boolean);
begin
  FStream.Write(Value, SizeOf(Value));
end;

procedure TBinaryWriter.Write(const Value: TCharArray);
var
  Bytes: TBytes;
begin
  Bytes := FEncoding.GetBytes(Value);
  FStream.WriteBuffer(Bytes[0], Length(Bytes));
end;

procedure TBinaryWriter.Write(const Value: string);
var
  Bytes: TBytes;
begin
  Bytes := FEncoding.GetBytes(Value);
  Write7BitEncodedInt(Length(Bytes));
  FStream.WriteBuffer(Bytes[0], Length(Bytes));
end;

procedure TBinaryWriter.Write(Value: Single);
begin
  FStream.Write(Value, SizeOf(Value));
end;

procedure TBinaryWriter.Write(Value: Int64);
begin
  FStream.Write(Value, SizeOf(Value));
end;

procedure TBinaryWriter.Write(const Value: TBytes; Index, Count: Integer);
begin
  if Index < 0 then
    raise EArgumentOutOfRangeException.CreateResFmt(@sArgumentOutOfRange_NeedNonNegValue, ['Index']); // do not localize
  if Count < 0 then
    raise EArgumentOutOfRangeException.CreateResFmt(@sArgumentOutOfRange_NeedNonNegValue, ['Count']); // do not localize
  if Length(Value) - Index < Count  then
    raise EArgumentOutOfRangeException.CreateRes(@sArgumentOutOfRange_OffLenInvalid);
  FStream.WriteBuffer(Value[Index], Count);
end;

procedure TBinaryWriter.Write(const Value: TBytes);
begin
  FStream.WriteBuffer(Value[0], Length(Value));
end;

procedure TBinaryWriter.Write(const Value: TCharArray; Index, Count: Integer);
var
  Bytes: TBytes;
begin
  Bytes := FEncoding.GetBytes(Value, Index, Count);
  FStream.WriteBuffer(Bytes, Length(Bytes));
end;

procedure TBinaryWriter.Write(Value: UInt64);
begin
  FStream.Write(Value, SizeOf(Value));
end;

procedure TBinaryWriter.Write(Value: Double);
begin
  FStream.Write(Value, SizeOf(Value));
end;

procedure TBinaryWriter.Write(Value: SmallInt);
begin
  FStream.Write(Value, SizeOf(Value));
end;

procedure TBinaryWriter.Write(Value: Integer);
begin
  FStream.Write(Value, SizeOf(Value));
end;

procedure TBinaryWriter.Write(Value: Cardinal);
begin
  FStream.Write(Value, SizeOf(Value));
end;

procedure TBinaryWriter.Write(Value: Word);
begin
  FStream.Write(Value, SizeOf(Value));
end;

procedure TBinaryWriter.Write(Value: ShortInt);
begin
  FStream.Write(Value, SizeOf(Value));
end;

procedure TBinaryWriter.Write7BitEncodedInt(Value: Integer);
begin
  repeat
    if Value > $7f then
      Write(Byte((Value and $7f) or $80))
    else
      Write(Byte(Value));
    Value := Value shr 7;
  until Value = 0;
end;

{ ComponentPlatforms }

constructor ComponentPlatformsAttribute.Create(const Platforms: TPlatformIds);
begin
  FPlatforms := Platforms;
end;

{ TLoginCredentialService }

class constructor TLoginCredentialService.Create;
begin
  FLoginHandlers := TStringList.Create;
end;

class destructor TLoginCredentialService.Destroy;
var
  I: Integer;
begin
  if FLoginHandlers <> nil then
  begin
    for I := 0 to FLoginHandlers.Count - 1 do
      Dispose(PLoginCredentialEventRec(FLoginHandlers.Objects[I]));
    FLoginHandlers.Destroy;
  end;
end;

class function TLoginCredentialService.IndexOfHandler(const Context: TLoginCredentialEvent): Integer;
var
  Method: TMethod;
begin
  for Result := FLoginHandlers.Count - 1 downto 0 do
  begin
    Method := TMethod(PLoginCredentialEventRec(FLoginHandlers.Objects[Result])^.Handler);
    if (Method.Code = TMethod(Context).Code) and (Method.Data = TMethod(Context).Data) then
      Exit;
  end;
  Result := -1;
end;

class procedure TLoginCredentialService.RegisterLoginHandler(const Context: string; const HandlerEvent: TLoginCredentialEvent);
var
  Index: Integer;
  Event: PLoginCredentialEventRec;
begin
  Index := IndexOfHandler(HandlerEvent);
  if (Index < 0) or not SameText(Context, FLoginHandlers[Index]) then
  begin
    New(Event);
    try
      Event^.Handler := HandlerEvent;
      FLoginHandlers.AddObject(Context, TObject(Event));
    except
      Dispose(Event);
      raise;
    end;
  end;
end;

class procedure TLoginCredentialService.UnregisterLoginHandler(const Context: string; const HandlerEvent: TLoginCredentialEvent);
var
  I: Integer;
  Method: TMethod;
begin
  for I := FLoginHandlers.Count - 1 downto 0 do
  begin
    Method := TMethod(PLoginCredentialEventRec(FLoginHandlers.Objects[I])^.Handler);
    if SameText(FLoginHandlers[I], Context) and (Method.Code = TMethod(HandlerEvent).Code) and (Method.Data = TMethod(HandlerEvent).Data) then
    begin
      Dispose(PLoginCredentialEventRec(FLoginHandlers.Objects[I]));
      FLoginHandlers.Delete(I);
      Break;
    end;
  end;
end;

class function TLoginCredentialService.GetLoginCredentialEvent(const Context: string): TLoginCredentialEvent;
var
  I: Integer;
begin
  for I := FLoginHandlers.Count - 1 downto 0 do
    if SameText(Context, FLoginHandlers[I]) then
    begin
      Result := PLoginCredentialEventRec(FLoginHandlers.Objects[I])^.Handler;
      Exit;
    end;
  for I := FLoginHandlers.Count - 1 downto 0 do
    if FLoginHandlers[I] = '' then
    begin
      Result := PLoginCredentialEventRec(FLoginHandlers.Objects[I])^.Handler;
      Exit;
    end;
  Result := nil;
end;

class function TLoginCredentialService.GetLoginCredentials(const Context: string; Sender: TObject; const Callback: TLoginEvent): Boolean;
var
  Handler: TLoginCredentialEvent;
begin
  Result := True;
  Handler := GetLoginCredentialEvent(Context);
  if Assigned(Handler) then
    Handler(Sender, Callback, Result)
  else
    raise ELoginCredendialError.CreateRes(@SServiceNotFound);
end;

class function TLoginCredentialService.GetLoginCredentials(const Context: string; const Callback: TLoginFunc): Boolean;
var
  Proxy: TLoginFuncProxy;
begin
  Proxy := TLoginFuncProxy.Create(Callback);
  try
    Result := GetLoginCredentials(Context, Proxy, Proxy.LoginEvent);
  finally
    Proxy.Free;
  end;
end;

class function TLoginCredentialService.GetLoginCredentials(const Context: string; var Username, Password: string): Boolean;
var
  Domain: string;
begin
  Result := GetLoginCredentials(Context, Username, Password, Domain);
end;

class function TLoginCredentialService.GetLoginCredentials(const Context: string; var Username, Password, Domain: string): Boolean;
var
  LUsername, LPassword, LDomain: string;
begin
  Result := GetLoginCredentials(Context,
    function (const AUsername, APassword, ADomain: string): Boolean
    begin
      Result := True;
      LUsername := AUsername;
      LPassword := APassword;
      LDomain := ADomain;
    end);
  if Result then
  begin
    Username := LUsername;
    Password := LPassword;
    Domain := LDomain;
  end;
end;

{ TLoginCredentialService.TLoginFuncProxy }

constructor TLoginCredentialService.TLoginFuncProxy.Create(const ALoginFunc: TLoginFunc);
begin
  inherited Create;
  FLoginFunc := ALoginFunc;
end;

procedure TLoginCredentialService.TLoginFuncProxy.LoginEvent(Sender: TObject; const Username, Password, Domain: string; var Handled: Boolean);
begin
  Handled := FLoginFunc(Username, Password, Domain);
end;

{ TObserverMapping }

constructor TObserverMapping.Create;
begin
  FMappings := TStringList.Create;
end;

class destructor TObserverMapping.Destroy;
begin
  FreeAndNil(TObserverMapping.FInstance);
  inherited;
end;

destructor TObserverMapping.Destroy;
begin
  FMappings.Free;
  inherited;
end;

class function TObserverMapping.GetObserverID(const Key: string): Integer;
begin
  Result := Instance.FMappings.IndexOf(Key);
  if Result = -1 then
  begin
    Instance.FMappings.Add(Key);
    Result := Instance.FMappings.Count;
  end
  else
    Inc(Result);

  //Offset ID by reserved ones
  Result := Result + TObserverMapping.MappedID;
end;

class function TObserverMapping.Instance: TObserverMapping;
begin
  if FInstance = nil then
    FInstance := TObserverMapping.Create;
  Result := FInstance;
end;

{ TObservers }

constructor TObservers.Create;
begin
  FCanObserve := nil;
  FObservers := TStringList.Create;
  FObservers.OwnsObjects := False;
  FInterfaces := TInterfaceList.Create;
end;

destructor TObservers.Destroy;
begin
  FreeAndNil(FObservers);
  inherited;
end;

function TObservers.CanObserve(const ID: Integer): Boolean;
begin
  Result := False;
  if Assigned(FCanObserve) then
    Result := FCanObserve(ID);
end;

procedure TObservers.AddObserver(const IDs: array of Integer;
  const AIntf: IInterface);
var
  LList: IInterfaceList;
  LID: string;
  LIndex: Integer;
  LObserver: IObserver;
  I: Integer;
begin
  if not Supports(AIntf, IObserver, LObserver) then
    raise EObserverException.Create(sObserverNoInterface);
  for I := 0 to Length(IDs) - 1 do
  begin
    if not CanObserve(IDs[I]) then
      raise EObserverException.Create(sObserverUnsupported);
    LID := IntToStr(IDs[I]);
    LIndex := FObservers.IndexOf(LID);
    if LIndex <> -1 then
    begin
      //make sure the interface is not isinglecastobserver, since there cannot be more than one!
      if Supports(AIntf, ISingleCastObserver) then
        raise EObserverException.Create(sObserverMultipleSingleCast);
      Supports(FObservers.Objects[LIndex], IInterfaceList, LList);
    end
    else
    begin
      LList := TInterfaceList.Create;
      FInterfaces.Add(LList);
      FObservers.AddObject(LID, LList as TObject);
    end;
    LList.Add(AIntf);
    if Assigned(FObserverAdded) then
      FObserverAdded(IDs[I], LObserver);
  end;
end;

procedure TObservers.AddObserver(const ID: Integer; const AIntf: IInterface);
begin
  AddObserver([ID], AIntf);
end;

function TObservers.GetMultiCastObserver(const ID: Integer): IInterfaceList;
var
  LID: string;
  LIndex: Integer;
  LList: IInterfaceList;
  LObserver: IObserver;
  I: Integer;
begin
  Result := TInterfaceList.Create;;
  LID := IntToStr(ID);
  LIndex := FObservers.IndexOf(LID);
  if LIndex <> -1 then
  begin
    if Supports(FObservers.Objects[LIndex], IInterfaceList, LList) then
      for I := 0 to LList.Count - 1 do
      begin
        if Supports(LList[I], IMultiCastObserver, LObserver) then
          if LObserver.Active then
            Result.Add(LList[I]);
      end;
  end;
  if Result.Count = 0 then
    raise EObserverException.Create(Format(sObserverNoMulticastFound, [LID]));
end;

function TObservers.GetSingleCastObserver(const ID: Integer): IInterface;
var
  LID: string;
  LIndex: Integer;
  LList: IInterfaceList;
  LObserver: IObserver;
begin
  Result := nil;
  LID := IntToStr(ID);
  LIndex := FObservers.IndexOf(LID);
  if LIndex <> -1 then
  begin
    if Supports(FObservers.Objects[LIndex], IInterfaceList, LList) then
      //There should never be more than one single cast observer per ID
      if Supports(LList.Items[0], ISingleCastObserver, LObserver) then
        if LObserver.Active then
          Exit(LObserver);
  end;
  raise EObserverException.Create(Format(sObserverNoSinglecastFound, [LID]));
end;

function TObservers.IsObserving(const ID: Integer): Boolean;
var
  I: Integer;
  LObserver: IObserver;
  LIndex: Integer;
  LList: IInterfaceList;
  LObj: TObject;
begin
  Result := False;
  LIndex := FObservers.IndexOf(IntToStr(ID));
  if LIndex <> -1 then
  begin
    LObj := FObservers.Objects[LIndex];
    //make sure at least one the observers with this ID is active
    if Supports(LObj, IInterfaceList, LList) then
      for I := 0 to LList.Count - 1 do
      begin
        if Supports(LList[I], IObserver, LObserver) then
          if LObserver.Active then
            Exit(True);
      end;
  end;
end;

function TObservers.TryIsObserving(const ID: Integer; out AIntf: IInterface): Boolean;
var
  I: Integer;
  LObserver: IObserver;
  LIndex: Integer;
  LList: IInterfaceList;
begin
  Result := False;
  LIndex := FObservers.IndexOf(IntToStr(ID));
  if LIndex <> -1 then
  begin
    //make sure at least one the observers with this ID is active
    if Supports(FObservers.Objects[LIndex], IInterfaceList, LList) then
      for I := 0 to LList.Count - 1 do
      begin
        if Supports(LList[I], IObserver, LObserver) then
          if LObserver.Active then
          begin
            AIntf := LObserver;
            Exit(True);
          end;
      end;
  end;
end;

procedure TObservers.RemoveObserver(const ID: Integer;
  const AIntf: IInterface);
begin
  RemoveObserver([ID], AIntf);
end;

procedure TObservers.RemoveObserver(const IDs: array of Integer;
  const AIntf: IInterface);
var
  LID: string;
  LObsIndex, LIndex: Integer;
  LList: IInterfaceList;
  I: Integer;
begin
  for I := 0 to Length(IDs) - 1 do
  begin
    LID := IntToStr(IDs[I]);
    LObsIndex := FObservers.IndexOf(LID);
    if LObsIndex <> -1 then
    begin
      if Supports(FObservers.Objects[LObsIndex], IInterfaceList, LList) then
      begin
        LIndex := LList.IndexOf(AIntf);
        if LIndex <> -1 then
          LList.Delete(LIndex);
        if LList.Count = 0 then
        begin
          FObservers.Delete(LObsIndex);
          FInterfaces.Remove(LList);
          LList := nil;
        end;
      end;
    end;
  end;
end;

{ TLinkObservers }

class function TLinkObservers.GetEditGridLink(AObservers: TObservers): IEditGridLinkObserver;
var
  LID: Integer;
begin
  LID := TObserverMapping.EditGridLinkID;
  if AObservers.IsObserving(LID) then
    Result := AObservers.GetSingleCastObserver(LID) as IEditGridLinkObserver
  else
    raise EObserverException.Create(sObserverNotAvailable);
end;

class function TLinkObservers.GetEditLink(AObservers: TObservers): IEditLinkObserver;
var
  LID: Integer;
begin
  LID := TObserverMapping.EditLinkID;
  if AObservers.IsObserving(LID) then
    Result := AObservers.GetSingleCastObserver(LID) as IEditLinkObserver
  else
    raise EObserverException.Create(sObserverNotAvailable);
end;

class procedure TLinkObservers.EditLinkUpdate(AObservers: TObservers);
begin
  GetEditLink(AObservers).Update;
end;

class procedure TLinkObservers.EditLinkReset(AObservers: TObservers);
begin
  GetEditLink(AObservers).Reset;
end;

class function TLinkObservers.EditLinkIsReadOnly(AObservers: TObservers): Boolean;
begin
  Result := GetEditLink(AObservers).IsReadOnly;
end;

class procedure TLinkObservers.EditLinkSetIsReadOnly(AObservers: TObservers; AValue: Boolean);
begin
  GetEditLink(AObservers).IsReadOnly := AValue;
end;

class procedure TLinkObservers.EditLinkModified(AObservers: TObservers);
begin
  GetEditLink(AObservers).Modified;
end;

class function TLinkObservers.EditLinkEdit(AObservers: TObservers): Boolean;
begin
  Result := GetEditLink(AObservers).Edit;
end;

class function TLinkObservers.EditLinkIsEditing(AObservers: TObservers): Boolean;
begin
  Result := GetEditLink(AObservers).IsEditing;
end;

class function TLinkObservers.EditLinkIsModified(AObservers: TObservers): Boolean;
begin
  Result := GetEditLink(AObservers).IsModified;
end;

class function TLinkObservers.EditLinkIsValidChar(AObservers: TObservers; AKey: Char): Boolean;
begin
  Result := GetEditLink(AObservers).IsValidChar(AKey);
end;

class procedure TLinkObservers.EditGridLinkUpdate(AObservers: TObservers);
begin
  GetEditGridLink(AObservers).Update;
end;

class procedure TLinkObservers.EditGridLinkReset(AObservers: TObservers);
begin
  GetEditGridLink(AObservers).Reset;
end;

class function TLinkObservers.EditGridLinkIsReadOnly(AObservers: TObservers): Boolean;
begin
  Result := GetEditGridLink(AObservers).IsReadOnly;
end;

class procedure TLinkObservers.EditGridLinkSetIsReadOnly(AObservers: TObservers; AValue: Boolean);
begin
  GetEditGridLink(AObservers).IsReadOnly := AValue;
end;

class procedure TLinkObservers.EditGridLinkModified(AObservers: TObservers);
begin
  GetEditGridLink(AObservers).Modified;
end;

class function TLinkObservers.EditGridLinkEdit(AObservers: TObservers): Boolean;
begin
  Result := GetEditGridLink(AObservers).Edit;
end;

class function TLinkObservers.EditGridLinkIsEditing(AObservers: TObservers): Boolean;
begin
  Result := GetEditGridLink(AObservers).IsEditing;
end;

class function TLinkObservers.EditGridLinkIsModified(AObservers: TObservers): Boolean;
begin
  Result := GetEditGridLink(AObservers).IsModified;
end;

class function TLinkObservers.EditGridLinkIsValidChar(AObservers: TObservers; AKey: Char): Boolean;
begin
  Result := GetEditGridLink(AObservers).IsValidChar(AKey);
end;

class procedure TLinkObservers.PositionLinkPosChanged(AObservers: TObservers);
var
  LList: IInterfaceList;
  LPositionObserver: IPositionLinkObserver;
  I: Integer;
begin
  LList := AObservers.GetMultiCastObserver(TObserverMapping.PositionLinkID);
  for I := 0 to LList.Count - 1 do
  begin
    if Supports(LList[I], IPositionLinkObserver, LPositionObserver) then
      LPositionObserver.PosChanged;
  end;
end;

class procedure TLinkObservers.ListSelectionChanged(AObservers: TObservers);
begin
  if AObservers.IsObserving(TObserverMapping.EditLinkID) then
  begin
    if TLinkObservers.EditLinkIsEditing(AObservers) then
    begin
      TLinkObservers.EditLinkModified(AObservers);
      if AObservers.IsObserving(TObserverMapping.PositionLinkID) then
        TLinkObservers.PositionLinkPosChanged(AObservers);
    end
    else
      TLinkObservers.EditLinkReset(AObservers);
  end
  else if AObservers.IsObserving(TObserverMapping.PositionLinkID) then
    TLinkObservers.PositionLinkPosChanged(AObservers);
end;


initialization
  AddModuleUnloadProc(ModuleUnload);
{$IFDEF MSWINDOWS}
  GlobalNameSpace := TMultiReadExclusiveWriteSynchronizer.Create;
{$ENDIF}
{$IFDEF POSIX}
  GlobalNameSpace := TSimpleRWSync.Create;
{$ENDIF}
  RegGroups := TRegGroups.Create;
  IntConstList := TThreadList.Create;
  GlobalFixupList := TThreadList.Create;

finalization
  UnRegisterModuleClasses(HInstance);
  GlobalNameSpace.BeginWrite;
  FreeIntConstList;
  RemoveFixupReferences(nil, '');
  FreeAndNil(GlobalFixupList);
  FreeAndNil(GlobalLists);
  FreeAndNil(RegGroups);
  GlobalNameSpace := nil;
  RemoveModuleUnloadProc(ModuleUnload);
  FreeAndNil(FindGlobalComponentProcs);
{$IFDEF MSWINDOWS}
  ReleaseObjectInstanceBlocks;
{$ENDIF}
end.
