unit MemoAuto;

{ This unit implements TMemoApp, the Application automation object class for
  the MemoEdit application. TMemoApp is registered as a Single Instance
  automation class, thus causing a new copy of the application to be run each
  time an OLE Automation controller asks for an instance of the "Memo.MemoApp"
  OLE class name. TMemoApp implements the following automated methods and properties:

  function NewMemo: OleVariant;
    Creates a new editor window and returns the window's automation object.

  function OpenMemo(const FileName: WideString): OleVariant;
    Loads an existing file into a new editor window and returns the window's
    automation object.

  procedure TileWindows;
    Tiles all open editor windows.

  procedure CascadeWindows;
    Cascades all open editor windows.

  property MemoCount: Integer;
    Number of open editor windows.

  property Memos[Index: Integer]: OleVariant;
    Array of automation objects for the currently open editor windows. }

interface

uses
  ComObj, Memo_TLB;

type
  TMemoApp = class(TAutoObject, IMemoApp)
  protected
    function Get_MemoCount: Integer; safecall;
    function Get_Memos(MemoIndex: Integer): OleVariant; safecall;
    function NewMemo: OleVariant; safecall;
    function OpenMemo(const MemoFileName: WideString): OleVariant; safecall;
    procedure CascadeWindows; safecall;
    procedure TileWindows; safecall;
  end;

implementation

uses ComServ, MainFrm, EditFrm;

function TMemoApp.Get_MemoCount: Integer;
begin
  Result := MainForm.MDIChildCount;
end;

function TMemoApp.Get_Memos(MemoIndex: Integer): OleVariant;
begin
  Result := TEditForm(MainForm.MDIChildren[MemoIndex]).OleObject;
end;

function TMemoApp.NewMemo: OleVariant;
begin
  Result := MainForm.CreateMemo('').OleObject;
end;

function TMemoApp.OpenMemo(const MemoFileName: WideString): OleVariant;
begin
  Result := MainForm.CreateMemo(MemoFileName).OleObject;
end;

procedure TMemoApp.CascadeWindows;
begin
  MainForm.Cascade;
end;

procedure TMemoApp.TileWindows;
begin
  MainForm.Tile;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TMemoApp, Class_MemoApp, ciSingleInstance);
end.
