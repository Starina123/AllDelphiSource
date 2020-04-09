
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{       Copyright (c) 1995,98 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit ToolsAPI;

interface

uses Windows, SysUtils, Classes, ActiveX, TypInfo, DsgnIntf, Menus, ActnList,
  Graphics, ImgList, ComCtrls;

{ OTA Prefix - Open Tools API
  Accessing these interfaces only requires that the user use the Borlndmm.dll via
  sharemem. }
{ NTA Prefix - Native Tools API
  Access these interfaces requires that the user compile requiring vclxx.bpl
  since actual objects are passed among the interfaces. }

const
  utForm          = 0;
  utDataModule    = 1;
  utProjUnit      = 2;
  utUnit          = 3;
  utRc            = 4;
  utAsm           = 5;
  utDef           = 6;
  utObj           = 7;
  utRes           = 8;
  utLib           = 9;
  utTypeLib       = 10;
  utPackageImport = 11;
  utFormResource  = 12;
  utNoMake        = 13;

  atWhiteSpace     = 0;
  atComment        = 1;
  atReservedWord   = 2;
  atIdentifier     = 3;
  atSymbol         = 4;
  atString         = 5;
  atNumber         = 6;
  atFloat          = 7; // not used in Pascal tokenizer
  atOctal          = 8; // not used in Pascal tokenizer
  atHex            = 9; // not used in Pascal tokenizer
  atCharacter      = 10; // not used in Pascal tokenizer
  atPreproc        = 11; // not used in Pascal tokenizer
  atIllegal        = 12; // not used in Pascal tokenizer
  atAssembler      = 13;
  SyntaxOff        = 14;

  MarkedBlock      = 15;
  SearchMatch      = 16;

  lfCurrentEIP          = $0001;
  lfBreakpointEnabled   = $0002;
  lfBreakpointDisabled  = $0004;
  lfBreakpointInvalid   = $0008;
  lfErrorLine           = $0010;
  lfBreakpointVerified  = $0020;
  lfBackgroundBkpt      = $0040; // Breakpoint only valid in a non-active process
  lfBackgroupEIP        = $0080; // Execution point only valid in a non-active process

  WizardEntryPoint = 'INITWIZARD0001';
  isWizards = 'Wizards';

  { IDE's Toolbar names }
  sCustomToolBar = 'CustomToolBar';
  sStandardToolBar = 'StandardToolBar';
  sDebugToolBar = 'DebugToolBar';
  sViewToolBar = 'ViewToolBar';

  { Default IDE application/project types }
  sApplication = 'Application';
  sLibrary = 'Library';
  sConsole = 'Console';
  sPackage = 'Package';

  { Default IDE Module/Unit types }
  sUnit = 'Unit'; // Raw no form designer unit/C++ module and skeleton code
  sForm = 'Form'; // Unit/C++ module with a form designer
  sText = 'Text'; // Raw single file module with no skeleton code

type
  {
    cmOTAMake - Normal make
    cmOTABuild - Builds all modules that have source.
    cmOTACheck - Normal make without final link
    cmOTAMakeUnit - Valid only on an IOTAModule and in C++Builder
  }

  TOTACompileMode = (cmOTAMake, cmOTABuild, cmOTACheck, cmOTAMakeUnit);

  TOTAModuleType = type Integer;
  TOTAHandle = Pointer;

  { Editor position expressed as column/line after tabs are expanded to spaces
    and include the "virtual" editor space (columns beyond the end of lines) }
  TOTAEditPos = packed record
    Col: SmallInt; { Col is one-based }
    Line: Longint; { Line is one-based }
  end;

  { Editor position expressed as character index/line before tabs are expanded
    and does not include the indecies beyond the end of a line }
  TOTACharPos = packed record
    CharIndex: SmallInt; { CharIndex is zero-based }
    Line: Longint; { Line is one-based }
  end;

  { Available option name expressed as a name and a type }
  TOTAOptionName = record
    Name: string;
    Kind: TTypeKind;
  end;

  { Dynamic array of option names }
  TOTAOptionNameArray = array of TOTAOptionName;

  IOTAProject = interface;
  IOTAModule = interface;
  IOTANotifier = interface;
  IOTAEditView = interface;
  IOTAFormEditor = interface;
  IOTAComponent = interface;
  IBorlandIDEServices = interface;

  IOTANotifier = interface(IUnknown)
    ['{F17A7BCF-E07D-11D1-AB0B-00C04FB16FB3}']
    { This procedure is called immediately after the item is successfully saved.
      This is not called for IOTAWizards }
    procedure AfterSave; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { This function is called immediately before the item is saved. This is not
      called for IOTAWizard }
    procedure BeforeSave; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { The associated item is being destroyed so all references should be dropped.
      Exceptions are ignored. }
    procedure Destroyed; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { This associated item was modified in some way. This is not called for
      IOTAWizards }
    procedure Modified; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  IOTAEditorNotifier = interface(IOTANotifier)
    ['{0E3B9D7B-E119-11D1-AB0C-00C04FB16FB3}']
    { Called when a new edit view is created(opInsert) or destroyed(opRemove) }
    procedure ViewNotification(const View: IOTAEditView; Operation: TOperation); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Called when a view is activated }
    procedure ViewActivated(const View: IOTAEditView); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  IOTAFormNotifier = interface(IOTANotifier)
    ['{0E3B9D7C-E119-11D1-AB0C-00C04FB16FB3}']
    { Called when the given form is activated }
    procedure FormActivated; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { This is called immediately prior to the form being streamed out.  This
      may be called without first getting a BeforeSave as in the case of
      the project being compiled. }
    procedure FormSaving; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Called when a component on this form was renamed }
    procedure ComponentRenamed(ComponentHandle: TOTAHandle;
      const OldName, NewName: string); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  IOTAEditor = interface(IUnknown)
    ['{F17A7BD0-E07D-11D1-AB0B-00C04FB16FB3}']
    { Call this to register an IOTANotifier. The result is the index to be
      used when calling RemoveNotifier. If <0 then an error occured. }
    function AddNotifier(const ANotifier: IOTANotifier): Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the actual filename of this module editor. Rename through
      IOTAModule}
    function GetFileName: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the editor specific modified status }
    function GetModified: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the associated IOTAModule }
    function GetModule: IOTAModule; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Mark this editor modified.  The associeted module will also be modified }
    function MarkModified: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Call with the index obtained from AddNotifier }
    procedure RemoveNotifier(Index: Integer); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Show this editor.  If no views are active, at least one will be created }
    procedure Show; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property FileName: string read GetFileName;
    property Modified: Boolean read GetModified;
    property Module: IOTAModule read GetModule;
  end;

  { Use the IOTAEditReader class to gain read access to an editor buffer:

    NOTES:
      The buffer is accessed as a linear "file" with line breaks included.
      This reader interface could be accessed through a custom read-only
      TStream descendant.

    WARNING!!!
     o A IOTAEditReader should never be active at the same time as an IOTAEditWriter.
  }

  IOTAEditReader = interface(IUnknown)
    ['{26EB0E4F-F97B-11D1-AB27-00C04FB16FB3}']
    function GetText(Position: Longint; Buffer: PChar; Count: Longint): Longint; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  { Use the IOTAEditWriter class to gain write access to an editor buffer:

    NOTES:
     o As with the reader, the buffer is accessed as a linear "file" with
       line breaks included.  The writer uses a "copy in place" metaphor for
       modifying the editor buffer.  In other words, the writer can be thought
       of as simply copying from one buffer to another.  All positions (Pos)
       passed to the function are positions relative to the orginal file.  Due
       to the "copy" metaphor of the writer it does not support moving backward
       in the editor buffer. It is recomended that all modifications that must
       be performed should be done from the start to the finish.
     o After the TIEditWriter is freed(released), the undo-buffer of the editor
       is flushed unless CreateUndoableWriter was called to obtain the
       TIEditWriter.

    WARNING!!!
     o A IOTAEditWriter should never be active at the same time as an IOTAEditReader.
  }

  IOTAEditWriter = interface(IUnknown)
    ['{26EB0E50-F97B-11D1-AB27-00C04FB16FB3}']
    procedure CopyTo(Pos: Longint); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    procedure DeleteTo(Pos: Longint); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    procedure Insert(Text: PChar); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function Position: Longint; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function GetCurrentPos: TOTACharPos; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property CurrentPos: TOTACharPos read GetCurrentPos;
  end;

  IOTAEditView = interface(IUnknown)
    ['{0E3B9D78-E119-11D1-AB0C-00C04FB16FB3}']
    { Return the Current cursor position }
    function GetCursorPos: TOTAEditPos; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Set the current Cursor position }
    procedure SetCursorPos(const Value: TOTAEditPos); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the Current top visible position }
    function GetTopPos: TOTAEditPos; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Set the current top visible position }
    procedure SetTopPos(const Value: TOTAEditPos); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Get size of the visible portion of the view in character cells }
    function GetViewSize: TSize; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Converts a linear buffer offset position to a CharPos }
    function PosToCharPos(Pos: Longint): TOTACharPos; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Convert a CharPos to a linear buffer offset }
    function CharPosToPos(CharPos: TOTACharPos): Longint; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Convert between a EdPos and a CharPos }
    procedure ConvertPos(CharPosToEdPos: Boolean; var EditPos: TOTAEditPos;
      var CharPos: TOTACharPos); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the token attributes at the given EdPos. If IncludeMargin is true,
      the attribute at the right margin line is the margin line attribute, else
      it returns the actual char attribute }
    procedure GetAttributeAtPos(const EdPos: TOTAEditPos; IncludeMargin: Boolean;
      var Element, LineFlag: Integer); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns true if this interface instance is connected to the same
      underlying view as the indicated instance.  You must use this method
      in order to test for equality between views since several interface
      instances may share a single view.  You should also not hold onto
      these view interfaces for any length of time, unless a notifier is
      registered with the IOTASourceEditor so you can determine when the
      underlying implementation is vanishing. }
    function SameView(EditView: IOTAEditView): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property CursorPos: TOTAEditPos read GetCursorPos write SetCursorPos;
    property TopPos: TOTAEditPos read GetTopPos write SetTopPos;
    property ViewSize: TSize read GetViewSize;
  end;

  TOTASyntaxHighlighter = (shNone, shPascal, shC, shSQL, shQuery);
  TOTABlockType = (btInclusive, btLine, btColumn, btNonInclusive, btUnknown);

  IOTASourceEditor = interface(IOTAEditor)
    ['{F17A7BD1-E07D-11D1-AB0B-00C04FB16FB3}']
    { Create and return an IOTAEditReader }
    function CreateReader: IOTAEditReader; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Create and return an IOTAEditWriter. Changes are not undoable }
    function CreateWriter: IOTAEditWriter; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Create and return an IOTAEditWriter. Changes are undoable }
    function CreateUndoableWriter: IOTAEditWriter; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the number of active views on this editor }
    function GetEditViewCount: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the Indexed view }
    function GetEditView(Index: Integer): IOTAEditView; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the total number of lines in this source editor }
    function GetLinesInBuffer: Longint; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Change the syntax highlighter for this buffer or if shQuery is set,
      simply return the currently set highlighter }
    function SetSyntaxHighlighter(SyntaxHighlighter: TOTASyntaxHighlighter): TOTASyntaxHighlighter; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { These functions will affect all views on this buffer. }
    function GetBlockAfter: TOTACharPos; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function GetBlockStart: TOTACharPos; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function GetBlockType: TOTABlockType; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function GetBlockVisible: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    procedure SetBlockAfter(const Value: TOTACharPos); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    procedure SetBlockStart(const Value: TOTACharPos); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    procedure SetBlockType(Value: TOTABlockType); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    procedure SetBlockVisible(Value: Boolean); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property BlockStart: TOTACharPos read GetBlockStart write SetBlockStart;
    property BlockAfter: TOTACharPos read GetBlockAfter write SetBlockAfter;
    property BlockType: TOTABlockType read GetBlockType write SetBlockType;
    property BlockVisible: Boolean read GetBlockVisible write SetBlockVisible;
    property EditViewCount: Integer read GetEditViewCount;
    property EditViews[Index: Integer]: IOTAEditView read GetEditView;
  end;

  { IOTAResourceEntry is a raw interface to a resource entry in the project's
    resource file (<projectname>.RES).

    This interface is a very raw.  No implication on what is contained within
    a particular entry is made.  Is if up to the add-in developer to interpret
    the data accessed through this interface.  NOTE: The 'MAINICON' entry and
    related entries should not be modified as these are maintained by Delphi/
    C++Builder. }

  TOTAResHeaderValue = (hvFlags, hvLanguage, hvDataVersion, hvVersion,
    hvCharacteristics);

  IOTAResourceEntry = interface(IUnknown)
    ['{26EB0E51-F97B-11D1-AB27-00C04FB16FB3}']
    { Gets the resource type of this entry.  Follows Windows standard of
      specifying a type by name or value.  If the high-word is 0, then the
      low-word is the resource type value, otherwise it is a pointer to a null
      terminated ANSI (byte per char) string. Most predefined types are by
      value. }
    function GetResourceType: PChar; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Gets the resource name of this entry.  Follows Windows standard of
      specifying a type by name or value. If the high-word is 0, then the
      low-word is the resource type value, otherwise it is a pointer to a null
      terminated ANSI (byte per char) string. }
    function GetResourceName: PChar; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Changes the Type and name of this resource entry }
    function Change(NewType, NewName: PChar): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Gets and sets various resource header values.  Pass in one of the \
      TResHeaderValues enums to indicate which value to get/set.  Although
      some values are 16bits (Word) these functions operation only on
      32bits (Integer). }
    function GetHeaderValue(HeaderValue: TOTAResHeaderValue;
      var Value: Integer): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { See GetHeaderValue }
    function SetHeaderValue(HeaderValue: TOTAResHeaderValue;
      Value: Integer): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns a raw pointer to the actual resource data buffer. }
    function GetData: Pointer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the current size of the data buffer. }
    function GetDataSize: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Resizes the current data buffer.  If the size is smaller than the
      current size, the data is simply truncated without regard to its
      current contents. }
    procedure SetDataSize(NewSize: Integer); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns a unique handle value identifying the resource entry. }
    function GetEntryHandle: TOTAHandle; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property DataSize: Integer read GetDataSize write SetDataSize;
  end;

  { The IOTAProjectResource is an interface on the project's resource file
    (<projectname>.RES). }

  IOTAProjectResource = interface(IOTAEditor)
    ['{26EB0E52-F97B-11D1-AB27-00C04FB16FB3}']
    { Returns the number of Resource entries. }
    function GetEntryCount: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Given an index, returns a IOTAResourceEntry of the index'th entry. }
    function GetEntry(Index: Integer): IOTAResourceEntry; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Given an entry handle, return the IOTAResourceEntry }
    function GetEntryFromHandle(EntryHandle: TOTAHandle): IOTAResourceEntry; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Given a Resource type and name, return a IOTAResourceEntry or nil
      if not found. }
    function FindEntry(ResType, Name: PChar): IOTAResourceEntry; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Given an entry handle, delete the given resource entry. }
    procedure DeleteEntry(EntryHandle: TOTAHandle); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Creates a new resource entry of the given type and name and returns a
      IOTAResourceEntry.  Returns nil if the entry already exists or any other
      error occurs. }
    function CreateEntry(ResType, Name: PChar; Flags, LanguageId: Word;
      DataVersion, Version, Characteristics: Integer): IOTAResourceEntry; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  TOTAGetChildCallback = procedure (Param: Pointer; Component: IOTAComponent;
    var Result: Boolean) of object;

  { INTAComponent - This is the native component interface }

  INTAComponent = interface(IUnknown)
    ['{34B2E2D1-E36F-11D1-AB0E-00C04FB16FB3}']
    { Returns the actual TComponent/TPersistent }
    function GetPersistent: TPersistent; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the TComponent if this interface is a TComponent else nil }
    function GetComponent: TComponent; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  { The IOTAComponent is the base interface for a component living
    on a form/data module.  Never hold this interface for very long, since
    the component may be deleted at any time. }

  IOTAComponent = interface(IUnknown)
    ['{34B2E2D0-E36F-11D1-AB0E-00C04FB16FB3}']
    { Returns a string representing the type of the component. }
    function GetComponentType: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns a unique Handle to the TComponent/TPersistent }
    function GetComponentHandle: TOTAHandle; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the interface corresponding to the parent control if a TControl,
      otherwise returns the owner of the control.  If a TPersistent or the
      root object then it returns nil. }
    function GetParent: IOTAComponent; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns True if component is a TControl descendant }
    function IsTControl: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the number of published properties on this component. }
    function GetPropCount: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Given the index, returns the property name. }
    function GetPropName(Index: Integer): string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Given the index, returns the property type. }
    function GetPropType(Index: Integer): TTypeKind; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Given the name, returns the property type. }
    function GetPropTypeByName(const Name: string): TTypeKind; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Given the index or name, returns the property value. The untyped var
      must be large enough to hold the returned value.  If the property is
      a descendant of TPersistent, the return value is a IOTAComponent. For
      properties of any other object type, the return value is nil. }
    function GetPropValue(Index: Integer; var Value): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function GetPropValueByName(const Name: string; var Value): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Given the index or name, sets the property value. }
    function SetProp(Index: Integer; const Value): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function SetPropByName(const Name: string; const Value): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Enumerate the child controls just like TComponent.GetChildren }
    function GetChildren(Param: Pointer; Proc: TOTAGetChildCallback): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the number of child controls (if a TWinControl descendant, else
      returns 0). }
    function GetControlCount: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Given the index, returns an interface to the child control. }
    function GetControl(Index: Integer): IOTAComponent; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the number of child components (if a TComponent descendant,
      else returns 0). }
    function GetComponentCount: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Given the index, returns an interface to the child component. }
    function GetComponent(Index: Integer): IOTAComponent; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Selects the component and updates the Object Inspector. If AddToSelection
      if true, then the current selection is not cleared, and the components are
      multi-selected }
    function Select(AddToSelection: Boolean): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Same as Select except it brings the form to front with the component
      selected.  If this interface is a Form/Data Module, then Focus only
      brings the form to front. See Select for description of AddToSelection}
    function Focus(AddToSelection: Boolean): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Deletes the component from the form.  Following this call, this interface
      will now be invalid and must be release. }
    function Delete: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the IPersistent interface }
    function GetIPersistent: IPersistent; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the IComponent interface if instance is a TComponent else nil }
    function GetIComponent: IComponent; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  INTAFormEditor = interface(IUnknown)
    ['{34B2E2CF-E36F-11D1-AB0E-00C04FB16FB3}']
    { Return the instance of the TFormDesigner on this editor }
    function GetFormDesigner: IFormDesigner; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    procedure GetFormResource(Stream: TStream); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property FormDesigner: IFormDesigner read GetFormDesigner;
  end;

  IOTAFormEditor = interface(IOTAEditor)
    ['{F17A7BD2-E07D-11D1-AB0B-00C04FB16FB3}']
    { Return the form editor root component }
    function GetRootComponent: IOTAComponent; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function FindComponent(const Name: string): IOTAComponent; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function GetComponentFromHandle(ComponentHandle: TOTAHandle): IOTAComponent; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function GetSelCount: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function GetSelComponent(Index: Integer): IOTAComponent; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function GetCreateParent: IOTAComponent; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function CreateComponent(const Container: IOTAComponent;
      const TypeName: string; X, Y, W, H: Integer): IOTAComponent; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    procedure GetFormResource(const Stream: IStream); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  IOTATypeLibEditor = interface(IOTAEditor)
    ['{F17A7BD3-E07D-11D1-AB0B-00C04FB16FB3}']
  end;

  { Interface implemented by a client to receive notifications
    on a specific module }
  IOTAModuleNotifier = interface(IOTANotifier)
    ['{F17A7BCE-E07D-11D1-AB0B-00C04FB16FB3}']
    { CheckOverwrite is called during a SaveAs operation to determine if any
      files associated with this module will overwrite any other files.
      Return True to allow the overwrite or no overwrite will occur }
    function CheckOverwrite: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { User has renamed the module }
    procedure ModuleRenamed(const NewName: string); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  IOTAModuleInfo = interface(IUnknown)
    ['{F17A7BD6-E07D-11D1-AB0B-00C04FB16FB3}']
    { Returns the type of this module }
    function GetModuleType: TOTAModuleType; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the Module Name }
    function GetName: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the Module File name }
    function GetFileName: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the Form Name }
    function GetFormName: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the Design class }
    function GetDesignClass: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Fills the TStrings class with the CoClasses }
    procedure GetCoClasses(CoClasses: TStrings); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Opens and returns the IOTAModule associated with this IOTAModuleInfo }
    function OpenModule: IOTAModule; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property ModuleType: TOTAModuleType read GetModuleType;
    property Name: string read GetName;
    property FileName: string read GetFileName;
    property FormName: string read GetFormName;
    property DesignClass: string read GetDesignClass;
  end;

  IOTAModule = interface(IUnknown)
    ['{F17A7BCC-E07D-11D1-AB0B-00C04FB16FB3}']
    { Call this to register an IOTANotifier. The result is the index to be
      used when calling RemoveNotifier. If <0 then an error occured. }
    function AddNotifier(const ANotifier: IOTAModuleNotifier): Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { This invokes the Add To Interface dialog in Delphi }
    procedure AddToInterface; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Attempt to close this module. True was successful and all references to
      this module must be released. False if this module was not closed. }
    function Close: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the filename associated with this module.  This is only the base
      name used by the IDE.  Header source and forms are obtained other ways.}
    function GetFileName: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the currently assigned file system }
    function GetFileSystem: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the number of associated files (eg. Unit1.Pas and Unit1.dfm) }
    function GetModuleFileCount: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the associated file editor.  Use QueryInterface to determine if
      this is an IOTASourceEditor or IOTAFormEditor }
    function GetModuleFileEditor(Index: Integer): IOTAEditor; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the number of open projects than own this module }
    function GetOwnerCount: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the Indexed Project that owns this module }
    function GetOwner(Index: Integer): IOTAProject; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns True if this modules has CoClasses.  Can be used to determine if
      AddToInterface can be called }
    function HasCoClasses: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Call with the index obtained from AddNotifier }
    procedure RemoveNotifier(Index: Integer); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Save the module. ChangeName invokes the SaveAs logic.  ForceSave will not
      ask to save if the module it is modified. Returns False if canceled
      or an error }
    function Save(ChangeName, ForceSave: Boolean): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Sets the module filename.  Header source and forms will use the base
      filename. }
    procedure SetFileName(const AFileName: string); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Sets the associated file system }
    procedure SetFileSystem(const AFileSystem: string); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property OwnerCount: Integer read GetOwnerCount;
    property Owners[Index: Integer]: IOTAProject read GetOwner;
    property FileName: string read GetFileName write SetFileName;
    property FileSystem: string read GetFileSystem write SetFileSystem;
  end;

  IOTATypeLibModule = interface(IOTAModule)
    ['{0BBAEEA0-EF74-11D1-AB1C-00C04FB16FB3}']
  end;

  IOTAOptions = interface(IUnknown)
    ['{9C0E91FC-FA5A-11D1-AB28-00C04FB16FB3}']
    { Opens the options dialog }
    procedure EditOptions; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Get the value of the named option. }
    function GetOptionValue(const ValueName: string): Variant; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Set the value of the named option. }
    procedure SetOptionValue(const ValueName: string; const Value: Variant); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Get the list of available options for this option structure }
    function GetOptionNames: TOTAOptionNameArray; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property Values[const ValueName: string]: Variant read GetOptionValue write SetOptionValue;
  end;

  IOTAProjectOptions = interface(IOTAOptions)
    ['{F17A7BD4-E07D-11D1-AB0B-00C04FB16FB3}']
  end;

  IOTAProjectBuilder = interface(IUnknown)
   ['{F17A7BD5-E07D-11D1-AB0B-00C04FB16FB3}']
   { True if the project is out of date and needs to be built }
   function GetShouldBuild: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
   { True if successfully built.  If Wait then the compile progress dialog
     waits for the user press OK.  If False, it does not wait if successful. }
   function BuildProject(CompileMode: TOTACompileMode; Wait: Boolean): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

   property ShouldBuild: Boolean read GetShouldBuild;
  end;

  IOTAProject = interface(IOTAModule)
    ['{F17A7BCA-E07D-11D1-AB0B-00C04FB16FB3}']
    { Return the number of owned modules }
    function GetModuleCount: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the Indexed owned Module Info }
    function GetModule(Index: Integer): IOTAModuleInfo; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the Project options }
    function GetProjectOptions: IOTAProjectOptions; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the Project Builder }
    function GetProjectBuilder: IOTAProjectBuilder; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property ProjectOptions: IOTAProjectOptions read GetProjectOptions;
    property ProjectBuilder: IOTAProjectBuilder read GetProjectBuilder;
  end;

  IOTAProjectGroup = interface(IOTAModule)
    ['{F17A7BCB-E07D-11D1-AB0B-00C04FB16FB3}']
    { Invoke the Add New Project Dialog }
    procedure AddNewProject; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Invoke the Open New Project Dialog }
    procedure AddExistingProject; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the currently active project }
    function GetActiveProject: IOTAProject; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Number of Projects in this project group }
    function GetProjectCount: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the Project interface }
    function GetProject(Index: Integer): IOTAProject; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Remove the given project from the project group }
    procedure RemoveProject(const AProject: IOTAProject); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Set the active project }
    procedure SetActiveProject(const AProject: IOTAProject); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property ActiveProject: IOTAProject read GetActiveProject write SetActiveProject;
    property ProjectCount: Integer read GetProjectCount;
    property Projects[Index: Integer]: IOTAProject read GetProject;
  end;

  IOTAActionServices = interface(IUnknown)
    ['{F17A7BC9-E07D-11D1-AB0B-00C04FB16FB3}']
    { Action interfaces }
    function CloseFile(const FileName: string): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function OpenFile(const FileName: string): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function OpenProject(const ProjName: string; NewProjGroup: Boolean): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function ReloadFile(const FileName: string): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function SaveFile(const FileName: string): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  IOTAFileSystem = interface(IUnknown)
    ['{A9D1389D-F4B0-11D1-AB22-00C04FB16FB3}']
    function GetFileStream(const FileName: string; Mode: Integer): IStream; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function FileAge(const FileName: string): Longint; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function RenameFile(const OldName, NewName: string): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function IsReadonly(const FileName: string): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function IsFileBased: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function DeleteFile(const FileName: string): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function FileExists(const FileName: string): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function GetTempFileName(const FileName: string): string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function GetBackupFileName(const FileName: string): string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function GetIDString: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  IOTAFile = interface(IUnknown)
    ['{6E2AD9B0-F7F0-11D1-AB26-00C04FB16FB3}']
    { Return the actual source code }
    function GetSource: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the age of the file. -1 if new }
    function GetAge: TDateTime; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property Source: string read GetSource;
    property Age: TDateTime read GetAge;
  end;

  IOTACreator = interface(IUnknown)
    ['{6EDB9B9E-F57A-11D1-AB23-00C04FB16FB3}']
    { Return a string representing the default creator type in which to augment.
      See the definitions of sApplication, sConsole, sLibrary and
      sPackage, etc.. above.  Return an empty string indicating that this
      creator will provide *all* information }
    function GetCreatorType: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return False if this is a new module }
    function GetExisting: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the File system IDString that this module uses for reading/writing }
    function GetFileSystem: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the Owning module, if one exists (for a project module, this would
      be a project; for a project this is a project group) }
    function GetOwner: IOTAModule; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return true, if this item is to be marked as un-named.  This will force the
      save as dialog to appear the first time the user saves. }
    function GetUnnamed: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property CreatorType: string read GetCreatorType;
    property Existing: Boolean read GetExisting;
    property FileSystem: string read GetFileSystem;
    property Owner: IOTAModule read GetOwner;
    property Unnamed: Boolean read GetUnnamed;
  end;

  IOTAModuleCreator = interface(IOTACreator)
    ['{6EDB9B9A-F57A-11D1-AB23-00C04FB16FB3}']
    { Return the Ancestor form name }
    function GetAncestorName: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the implementation filename, or blank to have the IDE create a new
      unique one. (C++ .cpp file or Delphi unit) }
    function GetImplFileName: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the interface filename, or blank to have the IDE create a new
      unique one.  (C++ header) }
    function GetIntfFileName: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the form name }
    function GetFormName: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return True to Make this module the main form of the given Owner/Project }
    function GetMainForm: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return True to show the form }
    function GetShowForm: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return True to show the source }
    function GetShowSource: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Create and return the Form resource for this new module if applicable }
    function NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Create and return the Implementation source for this module. (C++ .cpp
      file or Delphi unit) }
    function NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Create and return the Interface (C++ header) source for this module }
    function NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Called when the new form/datamodule/custom module is created }
    procedure FormCreated(const FormEditor: IOTAFormEditor); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property AncestorName: string read GetAncestorName;
    property FormName: string read GetFormName;
    property ImplFileName: string read GetImplFileName;
    property IntfFileName: string read GetIntfFileName;
    property MainForm: Boolean read GetMainForm;
    property ShowForm: Boolean read GetShowForm;
    property ShowSource: Boolean read GetShowSource;
  end;

  IOTAProjectCreator = interface(IOTACreator)
    ['{6EDB9B9D-F57A-11D1-AB23-00C04FB16FB3}']
    { Return the project filename }
    function GetFileName: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the option file name (C++ .bpr, .bpk, etc...) }
    function GetOptionFileName: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return True to show the source }
    function GetShowSource: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Called to create a new default module for this project }
    procedure NewDefaultModule; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Create and return the project option source. (C++) }
    function NewOptionSource(const ProjectName: string): IOTAFile; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Called to indicate when to create/modify the project resource file }
    procedure NewProjectResource(const Project: IOTAProject); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Create and return the Project source file }
    function NewProjectSource(const ProjectName: string): IOTAFile; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property FileName: string read GetFileName;
    property OptionFileName: string read GetOptionFileName;
    property ShowSource: Boolean read GetShowSource;
  end;

  IOTAProjectGroupCreator = interface(IOTACreator)
    ['{6EDB9B9F-F57A-11D1-AB23-00C04FB16FB3}']
    { Return the project group file name }
    function GetFileName: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return True to show the source }
    function GetShowSource: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Create and return the project group source }
    function NewProjectGroupSource(const ProjectGroupName: string): IOTAFile; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property FileName: string read GetFileName;
    property ShowSource: Boolean read GetShowSource;
  end;

  IOTAModuleServices = interface(IUnknown)
    ['{F17A7BCD-E07D-11D1-AB0B-00C04FB16FB3}']
    { Registers a new file system }
    function AddFileSystem(FileSystem: IOTAFileSystem): Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Close all open modules including the Project Group }
    function CloseAll: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Given the Creator, create a new module of the implied type }
    function CreateModule(const Creator: IOTACreator): IOTAModule; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the currently active module }
    function CurrentModule: IOTAModule; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Lookup the given file system }
    function FindFileSystem(const Name: string): IOTAFileSystem; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Lookup the given module by form name }
    function FindFormModule(const FormName: string): IOTAModule; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Lookup the given module by file name }
    function FindModule(const FileName: string): IOTAModule; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the number of currently open modules }
    function GetModuleCount: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return an interface on the module at index }
    function GetModule(Index: Integer): IOTAModule; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Given the Prefix, create a new unique Module name and class name }
    procedure GetNewModuleAndClassName(const Prefix: string; var UnitIdent,
      ClassName, FileName: string); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Open the File|New dialog }
    function NewModule: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Remove's the index'd file system from the installed file system list }
    procedure RemoveFileSystem(Index: Integer); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Save all modules. Same as File|Save All }
    function SaveAll: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property ModuleCount: Integer read GetModuleCount;
    property Modules[Index: Integer]: IOTAModule read GetModule;
  end;

  IOTAProcess = interface;
  IOTAThread = interface;

  TOTATriggerResult = (trStop, trContinue, trDefault);
  TOTAAccessType = (atRead, atWrite, atExecute);
  TOTARunMode = (ormRun, ormRunToEntry, ormRunToMain, ormRunToCursor,
    ormStmtStepInto, ormStmtStepOver, ormInstStepInto, ormInstStepOver,
    ormStmtStepToSource, ormReserved1, rmReserved2, rmReserved3);

  IOTABreakpointNotifier = interface(IOTANotifier)
    ['{34B2E2D5-E36F-11D1-AB0E-00C04FB16FB3}']
    { Called when IDE attempts to edit this breakpoint. Return False to allow
      the default edit dialogs to function. AllowKeyChanges is True if all
      Breakpoint parameters are allowed to be changed, False if only certain
      items should be allowed to change. For example; when the user selects
      "Breakpoint properties..." from the right-click menu in the editor, the
      filename and line number fields are read-only.  AllowKeyChanges will be
      False in this case. }
    function Edit(AllowKeyChanges: Boolean): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Called when this breakpoint is triggered. Return trStop to stop,
      trContinue to continue or trDefault to do the default processing. }
    function Trigger: TOTATriggerResult; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Called when the breakpoint is verified }
    procedure Verified(Enabled, Valid: Boolean); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  IOTABreakpoint = interface(IUnknown)
    ['{34B2E2D4-E36F-11D1-AB0E-00C04FB16FB3}']
    { Add a callback notifier.  Returns the index of this notifier in the
      breakpoint's list of notifiers.  Retain this value to be used when
      calling RemoveNotifier }
    function AddNotifier(const Notifier: IOTABreakpointNotifier): Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Call this to destroy the object }
    procedure Destruct; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Processes default Trigger actions. Returns True to indicate stop.
      This should only be called within the IOTABreakpointNotifier.Trigger
      callback. }
    function DefaultTrigger: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Decrement the CurPassCount if > 0.  Return True if it goes to 0 or is 0 }
    function DecPassCount: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Invokes the normal edit processing }
    procedure Edit(AllowKeyChanges: Boolean); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Evaluates the expression associated with this breakpoint }
    function EvaluateExpression: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the Enabled status of this BP. }
    function GetEnabled: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Retrieves the Expression associated }
    function GetExpression: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the Source file name in-which this Breakpoint is set }
    function GetFileName: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the line number on which this breakpoint is set }
    function GetLineNumber: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Retrieves the current Pass Count if PassCount is set }
    function GetCurPassCount: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Retrieves the associated Pass count }
    function GetPassCount: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Removes the index'th notifier from the breakpoint's list }
    procedure RemoveNotifier(Index: Integer); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Resets the CurPassCount back to PassCount }
    procedure ResetPassCount; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Sets the filename }
    procedure SetFileName(const Value: string); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Sets the Line Number }
    procedure SetLineNumber(Value: Integer); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Sets the Enabled status of this breakpoint }
    procedure SetEnabled(Value: Boolean); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Sets the Expression associated with this breakpoint }
    procedure SetExpression(const Value: string); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Sets the Pass count associated with this breakpoint. Calling this will
      clear the CurPassCount. }
    procedure SetPassCount(Value: Integer); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns whether this Breakpoint is valid in the currently selected
      process }
    function ValidInCurrentProcess: Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns wheter this brekapoint is valid in the given process }
    function ValidInProcess(Process: IOTAProcess): Boolean; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property CurPassCount: Integer read GetCurPassCount;
    property Enabled: Boolean read GetEnabled write SetEnabled;
    property Expression: string read GetExpression write SetExpression;
    property FileName: string read GetFileName write SetFileName;
    property LineNumber: Integer read GetLineNumber write SetLineNumber;
    property PassCount: Integer read GetPassCount write SetPassCount;
  end;

  IOTASourceBreakpoint = interface(IOTABreakpoint)
    ['{09063877-E43A-11D1-AB0F-00C04FB16FB3}']
  end;

  IOTAAddressBreakpoint = interface(IOTABreakpoint)
    ['{09063878-E43A-11D1-AB0F-00C04FB16FB3}']
    { Returns the start address of this breakpoint in the current process,
      0 if not valid in the current process }
    function Address: LongWord; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the start address of this breakpoint in the given process,
      0 if not valid in the given process }
    function AddressInProcess(Process: IOTAProcess): LongWord; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the Access type Write or Execute }
    function GetAccessType: TOTAAccessType; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the Data Expression if this is a DW Breakpoint, empty string if
      not }
    function GetDataExpr: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the Size of the line if this address breakpoint was mapped to
      a source line }
    function GetLineSize: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the Offset in the line if this address breakpoint was mapped to
      a source line }
    function GetLineOffset: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the Process Module this BP will stop on the entry of if a Module
      LoadBP.  If this is a Data Watch BP, this is the Exe module name that
      this breakpoint is valid for. }
    function GetModuleName: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property AccessType: TOTAAccessType read GetAccessType;
    property DataExpr: string read GetDataExpr;
    property ModuleName: string read GetModuleName;
    property LineSize: Integer read GetLineSize;
    property LineOffset: Integer read GetLineOffset;
  end;

  TOTANotifyReason = (nrOther, nrRunning, nrStopped, nrException, nrFault);

  IOTAThreadNotifier = interface(IOTANotifier)
    ['{34B2E2D7-E36F-11D1-AB0E-00C04FB16FB3}']
    { This is called when the process state changes for this thread }
    procedure ThreadNotify(Reason: TOTANotifyReason); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { This is called when an evaluate that returned erDeferred completes.
      ReturnCode <> 0 if error }
    procedure EvaluteComplete(const ExprStr, ResultStr: string; CanModify: Boolean;
      ResultAddress, ResultSize: LongWord; ReturnCode: Integer); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { This is called when a modify that returned erDeferred completes.
      ReturnCode <> 0 if error }
    procedure ModifyComplete(const ExprStr, ResultStr: string; ReturnCode: Integer); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  TOTAEvaluateResult = (erOK, erError, erDeferred);
  TOTAThreadState = (tsStopped, tsRunnable, tsBlocked, tsNone);

  IOTAThread = interface(IUnknown)
    ['{34B2E2D3-E36F-11D1-AB0E-00C04FB16FB3}']
    { Add an IOTAThreadNotifiter }
    function AddNotifier(const Notifier: IOTAThreadNotifier): Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Evaluate the given expression.
      CanModify -        will be set to true if the expression can be modified.
      AllowSideEffects - indicates whether the evaluator is allowed to perform
                         any function calls in the running process in order to
                         complete the evaluation. This includes property access
                         methods.
      FormatSpecifiers - String indicating format overides. See IDE help for
                         definition
      ResultAddr       - Will be set if the expression evaluates to an address
                         within the process
      ResultSize       - Size of the expression. (ie. SizeOf(<sometype>)

      Function result will be erDeferred if the evaluator had to make a
      function call in the running process in order to finish the evaluation.
      The results are undefined in this case.  See the EvaluateComplete method
      on the IOTAThreadNotifier.  If the result is erError, the ResultStr may
      contain an error message. }
    function Evaluate(const ExprStr: string; ResultStr: PChar; ResultStrSize: LongWord;
      out CanModify: Boolean; AllowSideEffects: Boolean; FormatSpecifiers: PChar;
      out ResultAddr: LongWord; out ResultSize, ResultVal: LongWord): TOTAEvaluateResult; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Modify the last evaluated expression.
      ResultStr and ResultVal will be set the to the evaluated ValueStr values.
      Like Evalute, the result could be erDeferred. See the ModifyComplete
      method on the IOTAThreadNotifier.  If the result is erError then ResultStr
      may contain an error message. }
    function Modify(const ValueStr: string; ResultStr: PChar; ResultSize: LongWord;
      out ResultVal: Integer): TOTAEvaluateResult; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the number of Items on the call stack }
    function GetCallCount: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the evaluator generated string for the given stack index }
    function GetCallHeader(Index: Integer): string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the source file name and line number of the given stack index }
    procedure GetCallPos(Index: Integer; out FileName: string; out LineNum: Integer); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { If the process is stopped, return which file the process is stopped on in
      this thread.  The return string will be blank if no debug info is found at
      this location }
    function GetCurrentFile: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { If the process is stopped, return the line number in the above file at
      which this process is stopped }
    function GetCurrentLine: LongWord; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the Current Thread context }
    function GetContext: TContext; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the OS Thread Handle }
    function GetHandle: THandle; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the OS Thread ID }
    function GetOSThreadID: LongWord; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the current thread State }
    function GetState: TOTAThreadState; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Remove the Index'd notifier }
    procedure RemoveNotifier(Index: Integer); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property CallCount: Integer read GetCallCount;
    property CallHeaders[Index: Integer]: string read GetCallHeader;
    property CurrentFile: string read GetCurrentFile;
    property CurrentLine: LongWord read GetCurrentLine;
    property Context: TContext read GetContext;
    property Handle: THandle read GetHandle;
    property State: TOTAThreadState read GetState;
  end;

  IOTAProcessModNotifier = interface(IOTANotifier)
    ['{0906387A-E43A-11D1-AB0F-00C04FB16FB3}']
    { Modified is called as evaluator symbols for this module are loaded }
  end;

  IOTAProcessModule = interface(IUnknown)
    ['{09063879-E43A-11D1-AB0F-00C04FB16FB3}']
    { Adds an IOTAProcessModNotifier }
    function AddNotifier(const Notifier: IOTAProcessModNotifier): Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the number of Compilation Units that comprise this Process Module }
    function GetCompUnitCount: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the index'd Compilation Unit Name }
    function GetCompUnit(Index: Integer): string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the number of files used to create the index'd compilation unit }
    function GetCompUnitFileCount(Index: Integer): Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the index'd filename of the index'd compilation unit }
    function GetCompUnitFileName(CompIndex, FileIndex: Integer): string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the address of the first code instruction for this module }
    function GetEntryPoint: LongWord; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the Base Load address of the module }
    function GetBaseAddress: LongWord; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the number of associated source files in this process module }
    function GetFileCount: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the index'd file }
    function GetFileName(Index: Integer): string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the number of entry points (procedure/functions/exports) in this
      Process Module }
    function GetModuleEntryPointCount: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the index'd module entry point name }
    function GetModuleEntryPoint(Index: Integer): string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the index'd module entry point address }
    function GetModuleEntryPointAddress(Index: Integer): LongWord; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { FileName of the Exe/Dll/Bpl, etc.. }
    function GetModuleFileName: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { ModuleName of the Exe/Dll/Bpl, etc }
    function GetModuleName: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Removed the index's IOTAProcessModNotifier }
    procedure RemoveNotifier(Index: Integer); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property CompUnitCount: Integer read GetCompUnitCount;
    property CompUnit[Index: Integer]: string read GetCompUnit;
    property CompUnitFileCount[Index: Integer]: Integer read GetCompUnitFileCount;
    property CompUnitFileName[CompIndex, FileIndex: Integer]: string read GetCompUnitFileName;
    property FileCount: Integer read GetFileCount;
    property FileNames[Index: Integer]: string read GetFileName;
    property ModuleEntryPointCount: Integer read GetModuleEntryPointCount;
    property ModuleEntryPoint[Index: Integer]: string read GetModuleEntryPoint;
    property ModuleEntryPointAddress[Index: Integer]: LongWord read GetModuleEntryPointAddress;
  end;

  IOTAProcessNotifier = interface(IOTANotifier)
    ['{34B2E2D6-E36F-11D1-AB0E-00C04FB16FB3}']
    { Called when a Thread is created }
    procedure ThreadCreated(Thread: IOTAThread); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Called when a Thread is Destroyed }
    procedure ThreadDestroyed(Thread: IOTAThread); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Called when a Process module is added }
    procedure ProcessModuleCreated(ProcessModule: IOTAProcessModule); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Called when a Process module is deleted }
    procedure ProcessModuleDestroyed(ProcessModule: IOTAProcessModule); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  IOTAProcess = interface(IUnknown)
    ['{34B2E2D2-E36F-11D1-AB0E-00C04FB16FB3}']
    { Adds an IOTAProcessNotifier }
    function AddNotifier(const Notifier: IOTAProcessNotifier): Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the currently active thread }
    function GetCurrentThread: IOTAThread; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the number of Thread in this process }
    function GetThreadCount: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return the index'd Thread }
    function GetThread(Index: Integer): IOTAThread; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Get the OS process ID }
    function GetProcessId: LongWord; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Stop/Pause the process }
    procedure Pause; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Read the process memory at the given addres }
    function ReadProcessMemory(Address: LongWord; Count: Integer; var Buffer): Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Removed the index's IOTAProcessNotifier }
    procedure RemoveNotifier(Index: Integer); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Run the process give the run mode }
    procedure Run(RunMode: TOTARunMode); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Set a new current thread }
    procedure SetCurrentThread(Value: IOTAThread); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Reset/Terminate the process }
    procedure Terminate; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Write to the process memory at the given address }
    function WriteProcessMemory(Address: LongWord; Count: Integer; var Buffer): Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property CurrentThread: IOTAThread read GetCurrentThread write SetCurrentThread;
    property ProcessId: LongWord read GetProcessId;
    property ThreadCount: Integer read GetThreadCount;
    property Threads[Index: Integer]: IOTAThread read GetThread;
  end;

  IOTADebuggerNotifier = interface(IOTANotifier)
    ['{34B2E2D8-E36F-11D1-AB0E-00C04FB16FB3}']
    { Called when a process is created }
    procedure ProcessCreated(Process: IOTAProcess); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Called when a process is Destroyed }
    procedure ProcessDestroyed(Process: IOTAProcess); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Called when a Breakpoint is Added }
    procedure BreakpointAdded(Breakpoint: IOTABreakpoint); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Called when a breakpoint is Deleted }
    procedure BreakpointDeleted(Breakpoint: IOTABreakpoint); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  TEnumerateProcessesCallback = procedure (Pid: LongWord; const ProcessName: string; Param: Pointer);

  IOTADebuggerServices = interface(IUnknown)
    ['{0E3B9D7A-E119-11D1-AB0C-00C04FB16FB3}']
    { Adds an IOTADebuggerNotifier }
    function AddNotifier(const Notifier: IOTADebuggerNotifier): Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Attaches to an existing process }
    procedure AttachProcess(Pid: Integer; const RemoteHost: string = ''); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Creates a new process }
    procedure CreateProcess(const ExeName, Args: string; const RemoteHost: string = ''); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Enumerates all the current running processes on the local machine or remote
      machine }
    procedure EnumerateRunningProcesses(Callback: TEnumerateProcessesCallback;
      Param: Pointer; const HostName: string = ''); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the count of address breakpoints }
    function GetAddressBkptCount: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the index'd Address Breakpoint }
    function GetAddressBkpt(Index: Integer): IOTAAddressBreakpoint; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the currently active process. This is set whenever a debug
      event occurs }
    function GetCurrentProcess: IOTAProcess; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the number of active processes }
    function GetProcessCount: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the Index'd process }
    function GetProcess(Index: Integer): IOTAProcess; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the count of source breakpoints }
    function GetSourceBkptCount: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the index'd source Breakpoint }
    function GetSourceBkpt(Index: Integer): IOTASourceBreakpoint; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Log event string to Event log window if present. }
    procedure LogString(const LogStr: string); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Creates a new Address breakpoint, will create a source BP if the
      address given is on a line boundary }
    function NewAddressBreakpoint(Address, Length: LongWord; AccessType: TOTAAccessType;
      AProcess: IOTAProcess = nil): IOTABreakpoint; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Creates a new Module load Breakpoint }
    function NewModuleBreakpoint(const ModuleName: string;
      AProcess: IOTAProcess): IOTABreakpoint; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Creates a new Source Breakpoint }
    function NewSourceBreakpoint(const FileName: string; LineNumber: Integer;
      AProcess: IOTAProcess): IOTABreakpoint; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Removed the index's IOTADebuggerNotifier }
    procedure RemoveNotifier(Index: Integer); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Sets the current process }
    procedure SetCurrentProcess(Process: IOTAProcess); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property AddressBkptCount: Integer read GetAddressBkptCount;
    property AddressBkpts[Index: Integer]: IOTAAddressBreakpoint read GetAddressBkpt;
    property CurrentProcess: IOTAProcess read GetCurrentProcess write SetCurrentProcess;
    property ProcessCount: Integer read GetProcessCount;
    property Processes[Index: Integer]: IOTAProcess read GetProcess;
    property SourceBkptCount: Integer read GetSourceBkptCount;
    property SourceBkpts[Index: Integer]: IOTASourceBreakpoint read GetSourceBkpt;
  end;

  TOTAFileNotification = (ofnFileOpening, ofnFileOpened, ofnFileClosing,
    ofnDefaultDesktopLoad, ofnDefaultDesktopSave, ofnProjectDesktopLoad,
    ofnProjectDesktopSave, ofnPackageInstalled, ofnPackageUninstalled);

  IOTAIDENotifier = interface(IOTANotifier)
    ['{E052204F-ECE9-11D1-AB19-00C04FB16FB3}']
    { This procedure is called for many various file operations within the
      IDE }
    procedure FileNotification(NotifyCode: TOTAFileNotification;
      const FileName: string; var Cancel: Boolean); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { This function is called immediatately before the compiler is invoked.
      Set Cancel to True to cancel the compile }
    procedure BeforeCompile(const Project: IOTAProject; var Cancel: Boolean); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { This procedure is called immediately following a compile.  Succeeded
      will be true if the compile was successful }
    procedure AfterCompile(Succeeded: Boolean); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  TWizardState = set of (wsEnabled, wsChecked);

  IOTAWizard = interface(IOTANotifier)
    ['{B75C0CE0-EEA6-11D1-9504-00608CCBF153}']
    { Expert UI strings }
    function GetIDString: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function GetName: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function GetState: TWizardState; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    { Launch the AddIn }
    procedure Execute; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  IOTARepositoryWizard = interface(IOTAWizard)
    ['{B75C0CE1-EEA6-11D1-9504-00608CCBF153}']
    function GetAuthor: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function GetComment: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function GetPage: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function GetGlyph: HICON; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  IOTAFormWizard = interface(IOTARepositoryWizard)
    ['{36C8BF35-EFFE-11D1-AB1D-00C04FB16FB3}']
  end;

  IOTAProjectWizard = interface(IOTARepositoryWizard)
    ['{36C8BF36-EFFE-11D1-AB1D-00C04FB16FB3}']
  end;

  IOTAMenuWizard = interface(IOTAWizard)
    ['{B75C0CE2-EEA6-11D1-9504-00608CCBF153}']
    function GetMenuText: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  TWizardRegisterProc = function(const Wizard: IOTAWizard): Boolean;
  TWizardTerminateProc = procedure;
  TWizardInitProc = function(const BorlandIDEServices: IBorlandIDEServices;
    RegisterProc: TWizardRegisterProc;
    var Terminate: TWizardTerminateProc): Boolean stdcall;

  IOTAWizardServices = interface(IUnknown)
    ['{B75C0CE3-EEA6-11D1-9504-00608CCBF153}']
    { Call this to register an IOTAWizard interface }
    function AddWizard(const AWizard: IOTAWizard): Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Remove the index'd Wizard }
    procedure RemoveWizard(Index: Integer); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  IOTAPackageServices = interface(IUnknown)
    ['{26EB0E4D-F97B-11D1-AB27-00C04FB16FB3}']
    { Returns the number of loaded packages }
    function GetPackageCount: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the named of the loaded package }
    function GetPackageName(Index: Integer): string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the number of components registered by this package index }
    function GetComponentCount(PkgIndex: Integer): Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the component name of the package index }
    function GetComponentName(PkgIndex, CompIndex: Integer): string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property PackageCount: Integer read GetPackageCount;
    property PackageNames[Index: Integer]: string read GetPackageName;
    property ComponentCount[PkgIndex: Integer]: Integer read GetComponentCount;
    property ComponentNames[PkgIndex, CompIndex: Integer]: string read GetComponentName;
  end;

  IOTACustomMessage = interface(IUnknown)
    ['{589BBDA1-F995-11D1-AB27-00C04FB16FB3}']
    { Returns the Line number of the above file if the above file is given }
    function GetColumnNumber: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns a Fully qualified filename if this message line can navigate to a
      file line }
    function GetFileName: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the Line number of the above file if the above file is given }
    function GetLineNumber: Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the Raw line text }
    function GetLineText: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { F1 pressed on this line }
    procedure ShowHelp; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property ColumnNumber: Integer read GetColumnNumber;
    property FileName: string read GetFilename;
    property LineNumber: Integer read GetLineNumber;
    property LineText: string read GetLineText;
  end;

  INTACustomDrawMessage = interface(IOTACustomMessage)
    ['{589BBDA2-F995-11D1-AB27-00C04FB16FB3}']
    procedure Draw(Canvas: TCanvas; const Rect: TRect; Wrap: Boolean); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function CalcRect(Canvas: TCanvas; MaxWidth: Integer; Wrap: Boolean): TRect; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  IOTAMessageServices = interface(IUnknown)
    ['{26EB0E4E-F97B-11D1-AB27-00C04FB16FB3}']
    { This method allows the external tool to handle all painting of the
      message in a fashion similar to the "Find in files" messages.  If the
      INTACustomDrawMessage is implemented then all painting is deferred to that
      interface, otherwise the painting is handled internally }
    procedure AddCustomMessage(const CustomMsg: IOTACustomMessage); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { This method adds a simple title message that simply displays in the
      message view with no other behavior }
    procedure AddTitleMessage(const MessageStr: string); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { This method adds a line to the message buffer that behaves similar to the
      compiler error message lines.  It allows all the painting and other
      processing to be handled by the IDE.
      PrefixStr is usually a short string that indicates from which tool this
      message originates, for ex. 'Grep tool', which would display as
      '[Grep tool]' }
    procedure AddToolMessage(const FileName, MessageStr, PrefixStr: string;
      LineNumber, ColumnNumber: Integer); {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Clears all messages from the message buffer }
    procedure ClearAllMessages; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Clears all "compiler/linker" messages }
    procedure ClearCompilerMessages; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Clears all "Find in files" messages }
    procedure ClearSearchMessages; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Clears all the externally defined messages }
    procedure ClearToolMessages; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  IOTAEnvironmentOptions = interface(IOTAOptions)
    ['{9C0E91FB-FA5A-11D1-AB28-00C04FB16FB3}']
  end;

  INTAServices = interface(IUnknown)
    ['{3C7F3267-F0BF-11D1-AB1E-00C04FB16FB3}']
    { Adds an image to the IDE's main image list.  Use the return value as an
      image index for an action item added to the IDE's main action list }
    function AddMasked(Image: TBitmap; MaskColor: TColor): Integer; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the IDE's Main ActionList component }
    function GetActionList: TCustomActionList; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the IDE's Main ImageList component }
    function GetImageList: TCustomImageList; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the IDE's Main Menu component }
    function GetMainMenu: TMainMenu; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the named Toolbar }
    function GetToolBar(const ToolBarName: string): TToolBar; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}

    property ActionList: TCustomActionList read GetActionList;
    property ImageList: TCustomImageList read GetImageList;
    property MainMenu: TMainMenu read GetMainMenu;
    property ToolBar[const ToolBarName: string]: TToolBar read GetToolBar;
  end;

  IOTAServices = interface(IUnknown)
    ['{7FD1CE91-E053-11D1-AB0B-00C04FB16FB3}']
    { General IDE event notifications }
    function AddNotifier(const Notifier: IOTAIDENotifier): Integer;
    { Remove the index'd notifier } {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    procedure RemoveNotifier(Index: Integer);
    { Configuration Access } {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    function GetBaseRegistryKey: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Returns the product Identifier, 'C++ Builder' or 'Delphi' }
    function GetProductIdentifier: string; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Main appliction handle }
    function GetParentHandle: HWND; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
    { Return an interface to the IDE environment options }
    function GetEnvironmentOptions: IOTAEnvironmentOptions; {$IFDEF BCBHEADER} virtual; abstract; {$ENDIF}
  end;

  IBorlandIDEServices = interface(IUnknown)
    ['{7FD1CE92-E053-11D1-AB0B-00C04FB16FB3}']
  end;

var
  BorlandIDEServices: IBorlandIDEServices;
  LibraryWizardProc: TWizardRegisterProc = nil;

procedure RegisterPackageWizard(const Wizard: IOTAWizard);

implementation

procedure RegisterPackageWizard(const Wizard: IOTAWizard);
begin
  if Assigned(LibraryWizardProc) then
    LibraryWizardProc(Wizard);
end;

end.
