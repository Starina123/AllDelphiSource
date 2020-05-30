unit App;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ToolIntf, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TMoveDirection = (mdPrevious, mdNext, mdNoMove);

  TAppExpert = class(TForm)
    Sample: TPaintBox;
    CancelBtn: TButton;
    PrevButton: TButton;
    NextButton: TButton;
    PageControl: TPageControl;
    Menus: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cbFileMenu: TCheckBox;
    cbEditMenu: TCheckBox;
    cbWindowMenu: TCheckBox;
    cbHelpMenu: TCheckBox;
    Extensions: TTabSheet;
    Label6: TLabel;
    Panel1: TPanel;
    ExtHeader: THeader;
    ExtListBox: TListBox;
    AddButton: TButton;
    EditButton: TButton;
    DeleteButton: TButton;
    UpButton: TButton;
    DownButton: TButton;
    Speedbtns: TTabSheet;
    Label7: TLabel;
    Speedbar: TPaintBox;
    Label8: TLabel;
    Label9: TLabel;
    MenuList: TListBox;
    MenuItemList: TListBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    AppInfo: TTabSheet;
    Label13: TLabel;
    Label10: TLabel;
    Label15: TLabel;
    GroupBox1: TGroupBox;
    cbMDIApp: TCheckBox;
    cbStatusLine: TCheckBox;
    cbHints: TCheckBox;
    AppPath: TEdit;
    PathBrowse: TButton;
    AppName: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure NextPrevClick(Sender: TObject);
    procedure DrawExtension(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure AddClick(Sender: TObject);
    procedure HeaderSized(Sender: TObject; ASection, AWidth: Integer);
    procedure EditClick(Sender: TObject);
    procedure DeleteClick(Sender: TObject);
    procedure MoveClick(Sender: TObject);
    procedure SpeedbarPaint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuListClick(Sender: TObject);
    procedure DrawMenuItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure InsertClick(Sender: TObject);
    procedure SpaceClick(Sender: TObject);
    procedure SpeedMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RemoveClick(Sender: TObject);
    procedure BrowseClick(Sender: TObject);
    procedure SamplePaint(Sender: TObject);
    procedure MenuClicked(Sender: TObject);
  private
    { Private declarations }
    SpeedList: TList;
    ButtonList: TList;
    FSpeedIndex: Integer;
    SpeedPointer: TBitmap;
    Offscreen: TBitmap;
    SampleBmp: TBitmap;
    procedure RefreshButtons;
    function NextPage(Direction: TMoveDirection): Integer;
    function SpeedButtonRect(Index: Integer): TRect;
    function SpeedButtonAtPos(Pos: TPoint): Integer;
    function GetSpeedButtonCount: Integer;
    function GetSpeedButtonID(Value: Integer): Integer;
    function ValidateInfo: Boolean;
  public
    { Public declarations }
    function HasMenus: Boolean;
    property SpeedButtonCount: Integer read GetSpeedButtonCount;
    property SpeedButtonID[Value: Integer]: Integer read GetSpeedButtonID;
  end;
var
  AppExpert: TAppExpert;

procedure ApplicationExpert(ToolServices: TIToolServices);

implementation

uses ExConst, Filters, FileCtrl;

{$R *.DFM}

const
  { page numbers }
  pgMenus   = 0;
  pgExtensions = 1;
  pgSpeedbar = 2;
  pgAppInfo = 3;

  FirstPage = pgMenus;
  LastPage = pgAppInfo;

  DefaultButtonSize: TPoint = (X: 24; Y: 24);
  DefaultButtonSpace: Integer = 6;

  MenuItemCount = 18;

type
  TMainItems = (mmFile, mmEdit, mmWindow, mmHelp);

const
  MenuItemCounts: array[TMainItems] of Integer = (7, 4, 3, 4);
  MenuItemOffsets: array[TMainItems] of Integer = (0, 7, 11, 14);
  SampleBitmaps: array[FirstPage..LastPage] of PChar = (
    'MENUDSGN', 'EXTDSGN', 'SPEEDDSGN', 'INFODSGN');

{ TButtonImage - draws the image of a TSpeedButton }
type
  TButtonImage = class(TObject)
  private
    FBitmapID: Word;
    FBitmap: TBitmap;
    FNumGlyphs: Integer;
    procedure SetBitmapID(Value: Word);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Draw(Canvas: TCanvas; X, Y: Integer);
    property BitmapID: Word read FBitmapID write SetBitmapID;
    property NumGlyphs: Integer read FNumGlyphs write FNumGlyphs;
  end;

{ Code generation support }
type
  TCodeSnipet = (csProgram, csMainIntf, csMainImpl, csFormCreateProc,
    csShowHelpProc, csFileNewProc, csFileOpenProc, csFileSaveProc,
    csFileSaveAsProc, csFilePrintProc, csFilePrintSetupProc, csFileExitProc,
    csEditUndoProc, csEditCutProc, csEditCopyProc, csEditPasteProc,
    csWindowTileProc, csWindowCascadeProc, csWindowArrangeProc,
    csHelpContentsProc, csHelpSearchProc, csHelpHowToUseProc,
    csHelpAboutProc, csForm, csFormMenu, csFormMDI, csHints, csCreateMethod,   
    csMenuObject, csFileMenuObject, csEditMenuObject, csWindowMenuObject,
    csHelpMenuObject, csOpenDialogObject, csSaveDialogObject,
    csPrintDialogObject, csPrintSetupDialogObject, csStatusLineObject,
    csSpeedbarObject, csSpeedButtonObject);

const
  SourceBufferSize = 1024;

var
  CodeSnipets: array[TCodeSnipet] of PChar;
  CodeResource: THandle;
  SourceBuffer: PChar;
  ResourceBuffer: PChar;

procedure InitCodeGeneration;
var
  ResourceSize: Integer;
  ResourcePtr, Text: PChar;
  SnipetIndex: TCodeSnipet;
begin
  SourceBuffer := StrAlloc(SourceBufferSize);

  ResourceSize := SizeofResource(HInstance,
    FindResource(HInstance, 'SNIPETS', RT_RCDATA));
  CodeResource := LoadResource(HInstance,
    FindResource(HInstance, 'SNIPETS', RT_RCDATA));
  ResourcePtr := LockResource(CodeResource);
  ResourceBuffer := StrAlloc(ResourceSize);
  Move(ResourcePtr^, ResourceBuffer^, ResourceSize);
  Text := ResourceBuffer;
  for SnipetIndex := Low(TCodeSnipet) to High(TCodeSnipet) do
  begin
    CodeSnipets[SnipetIndex] := Text;
    Text := AnsiStrScan(Text, '|');
    while Text^ <> '|' do 
      if Text^ in LeadBytes then Inc(Text, 2) else Inc(Text);
    Text^ := #0;
    Inc(Text);
  end;
end;

procedure DoneCodeGeneration;
begin
  StrDispose(SourceBuffer);
  UnlockResource(CodeResource);
  FreeResource(CodeResource);
  StrDispose(ResourceBuffer);
end;

procedure BinToHex(Binary, Text: PChar; Count: Integer);
const
  HexChars: array[0..15] of Char = '0123456789ABCDEF';
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
  begin
    Text^ := HexChars[(Byte(Binary[I]) and $F0) SHR 4];
    Inc(Text);
    Text^ := HexChars[(Byte(Binary[I]) and $0F)];
    Inc(Text);
  end;
end;

procedure WriteBinaryAsText(Input: TStream; Output: TStream);
const
  BytesPerLine = 32;
  NewLine: PChar = #13#10;
var
  MultiLine: Boolean;
  I: Integer;
  Count: Longint;
  Buffer: array[0..BytesPerLine - 1] of Char;
  Text: array[0..BytesPerLine * 2 - 1] of Char;
begin
  Count := Input.Size;
  MultiLine := Count > BytesPerLine;
  BinToHex(@Count, Text, 4);
  Output.Write(Text, 4 * 2);

  while Count > 0 do
  begin
    if MultiLine then Output.Write(NewLine[0], 2);
    if Count >= BytesPerLine then I := BytesPerLine else I := Count;
    Input.Read(Buffer, I);
    BinToHex(Buffer, Text, I);
    Output.Write(Text, I * 2);
    Dec(Count, I);
  end;
end;

procedure FmtWrite(Stream: TStream; Fmt: PChar; const Args: array of const);
begin
  StrLFmt(SourceBuffer, SourceBufferSize, Fmt, Args);
  Stream.Write(SourceBuffer[0], StrLen(SourceBuffer));
end;

procedure WriteSnipet(Stream: TStream; Snipet: TCodeSnipet);
begin
  Stream.Write(CodeSnipets[Snipet][0], StrLen(CodeSnipets[Snipet]));
end;

procedure WriteIdent(Stream: TStream; ResID: Word; const VarType: string);
begin
  StrPCopy(SourceBuffer, Format('    %s: %s;'#13#10, [LoadStr(ResID), VarType]));
  Stream.Write(SourceBuffer[0], StrLen(SourceBuffer));
end;

procedure WriteMenuItems(Stream: TStream; MenuIndex: TMainItems);
var
  I: Integer;
begin
  for I := 0 to MenuItemCounts[MenuIndex] - 1 do
    WriteIdent(Stream, sMenuItemNameBase + MenuItemOffsets[MenuIndex] + I,
      'TMenuItem');
end;

procedure WriteMethodDecl(Stream: TStream; ResID: Word);
begin
  StrPCopy(SourceBuffer, Format('    procedure %s(Sender: TObject);'#13#10,
    [LoadStr(ResID)]));
  Stream.Write(SourceBuffer[0], StrLen(SourceBuffer));
end;

procedure WriteMethodHeader(Stream: TStream; ResID: Word);
begin
  StrPCopy(SourceBuffer, Format('procedure T%s.%s(Sender: TObject);'#13#10,
    [LoadStr(sMainForm), LoadStr(ResID)]));
  Stream.Write(SourceBuffer[0], StrLen(SourceBuffer));
end;

procedure WriteMenuMethodDecls(Stream: TStream; MenuIndex: TMainItems);
var
  I: Integer;
begin
  for I := 0 to MenuItemCounts[MenuIndex] - 1 do
    WriteMethodDecl(Stream, sMenuProcNames + MenuItemOffsets[MenuIndex] + I);
end;

procedure WriteMenuMethods(Stream: TStream; MenuIndex: TMainItems;
  BaseSnipet: TCodeSnipet);
var
  ID, I: Integer;
  Snipet: TCodeSnipet;
begin
  ID := sMenuProcNames + MenuItemOffsets[MenuIndex];
  for I := 0 to MenuItemCounts[MenuIndex] - 1 do
  begin
    WriteMethodHeader(Stream, ID + I);
    Snipet := TCodeSnipet( I + Ord(BaseSnipet) );
    WriteSnipet(Stream, Snipet);
  end;
end;

procedure WriteGlyphData(Stream: TStream; BitmapID: Word);
var
  Bitmap: TBitmap;
  Memory: TMemoryStream;
begin
  Bitmap := TBitmap.Create;
  try
    Bitmap.Handle := LoadBitmap(HInstance, PChar(BitmapID));

    { stream the bitmap to a memory stream, and the write that stream as text }
    Memory := TMemoryStream.Create;
    try
      Bitmap.SaveToStream(Memory);
      Memory.Position := 0;
      WriteBinaryAsText(Memory, Stream);
    finally
      Memory.Free;
    end;

  finally
    Bitmap.Free;
  end;
  FmtWrite(Stream, '}'#13#10'end'#13#10, [nil]);
end;

function GenerateProjectSource(AppExpert: TAppExpert): TFileName;
var
  ProjectFile: TFileStream;
begin
  Result := AppExpert.AppPath.Text;
  if (Result > '') and not (AnsiLastChar(Result)^ in [':', '\']) then
    Result := Result + '\';
  Result := Result + AppExpert.AppName.Text + '.DPR';

  ProjectFile := TFileStream.Create(Result, fmCreate);
  try
    StrFmt(SourceBuffer, CodeSnipets[csProgram], [AppExpert.AppName.Text]);
    ProjectFile.Write(SourceBuffer[0], StrLen(SourceBuffer));
  finally
    ProjectFile.Free;
  end;
end;

procedure GenerateMainSourceFile(AppExpert: TAppExpert);
var
  Stream: TFileStream;
  FileName: TFileName;
  ButtonName: string[80];
  ButtonText: string[30];
  ButtonID: Integer;
  I: Integer;
begin
  FileName := AppExpert.AppPath.Text;
  if (FileName > '') and not (AnsiLastChar(FileName)^ in [':', '\']) then
    FileName := FileName + '\';
  FileName := FileName + LoadStr(sMainSourceFile);

  Stream := TFileStream.Create(FileName, fmCreate);
  try
    WriteSnipet(Stream, csMainIntf);

    SourceBuffer[0] := #0;

    { create the menu declarations }
    if AppExpert.HasMenus then
    begin
      WriteIdent(Stream, sMainMenu, 'TMainMenu');
      if AppExpert.cbFileMenu.Checked then WriteMenuItems(Stream, mmFile);
      if AppExpert.cbEditMenu.Checked then WriteMenuItems(Stream, mmEdit);
      if AppExpert.cbWindowMenu.Checked then WriteMenuItems(Stream, mmWindow);
      if AppExpert.cbHelpMenu.Checked then WriteMenuItems(Stream, mmHelp);
     end;

    { create any variable declarations }
    if AppExpert.cbStatusLine.Checked then
      WriteIdent(Stream, sStatusLine, 'TStatusBar');

    if AppExpert.cbFileMenu.Checked then
    begin
      WriteIdent(Stream, sOpenDialog, 'TOpenDialog');
      WriteIdent(Stream, sSaveDialog, 'TSaveDialog');
      WriteIdent(Stream, sPrintDialog, 'TPrintDialog');
      WriteIdent(Stream, sPrintSetupDialog, 'TPrinterSetupDialog');
    end;

    { create speedbuttons }
    if AppExpert.SpeedButtonCount > 0 then
    begin
      WriteIdent(Stream, sSpeedBar, 'TPanel');

      ButtonName := '    ' + LoadStr(sSpeedButton) +
        ': TSpeedButton;  { %s }'#13#10;

      ButtonID := 1;
      for I := 0 to AppExpert.SpeedButtonCount - 1 do
      begin
        if AppExpert.SpeedButtonID[I] > -1 then
        begin
          ButtonText := LoadStr(AppExpert.SpeedButtonID[I]);
          StrPCopy(SourceBuffer, Format(ButtonName, [ButtonID, ButtonText]));
          Stream.Write(SourceBuffer[0], StrLen(SourceBuffer));
          Inc(ButtonID);
        end;
      end;
    end;

    { generate method declarations }
    if AppExpert.cbStatusLine.Checked and AppExpert.cbHints.Checked then
    begin
      WriteMethodDecl(Stream, sFormCreateProc);
      WriteMethodDecl(Stream, sShowHelpProc);
    end;

    if AppExpert.cbFileMenu.Checked then WriteMenuMethodDecls(Stream, mmFile);
    if AppExpert.cbEditMenu.Checked then WriteMenuMethodDecls(Stream, mmEdit);
    if AppExpert.cbWindowMenu.Checked then WriteMenuMethodDecls(Stream, mmWindow);
    if AppExpert.cbHelpMenu.Checked then WriteMenuMethodDecls(Stream, mmHelp);

    WriteSnipet(Stream, csMainImpl);

    { write code implementations }
    if AppExpert.cbStatusLine.Checked and AppExpert.cbHints.Checked then
    begin
      WriteMethodHeader(Stream, sFormCreateProc);
      WriteSnipet(Stream, csFormCreateProc);
      WriteMethodHeader(Stream, sShowHelpProc);
      WriteSnipet(Stream, csShowHelpProc);
    end;

    if AppExpert.cbFileMenu.Checked then
      WriteMenuMethods(Stream, mmFile, csFileNewProc);

    if AppExpert.cbEditMenu.Checked then
      WriteMenuMethods(Stream, mmEdit, csEditUndoProc);

    if AppExpert.cbWindowMenu.Checked then
      WriteMenuMethods(Stream, mmWindow, csWindowTileProc);

    if AppExpert.cbHelpMenu.Checked then
      WriteMenuMethods(Stream, mmHelp, csHelpContentsProc);

    FmtWrite(Stream, 'end.'#13#10, [nil]);

  finally
    Stream.Free;
  end;
end;

procedure GenerateMainFormFile(AppExpert: TAppExpert);
const
  ButtonWidth = 25;
  SpaceWidth = 4;
var
  TextStream: TFileStream;
  FormStream: TFileStream;
  TextName: TFileName;
  FormName: TFileName;
  Filter: string;
  ButtonNumber: Integer;
  ButtonID: Integer;
  ButtonMethod: string;
  ButtonHint: string;
  ButtonX: Integer;
  I: Integer;
begin
  TextName := AppExpert.AppPath.Text;
  if (TextName > '') and not (AnsiLastChar(TextName)^ in [':', '\']) then
    TextName := TextName + '\';
  FormName := TextName + LoadStr(sMainFormFile);
  TextName := TextName + LoadStr(sMainFormText);

  TextStream := TFileStream.Create(TextName, fmCreate);
  try
    WriteSnipet(TextStream, csForm);
    if AppExpert.cbMDIApp.Checked then WriteSnipet(TextStream, csFormMDI);
    if AppExpert.HasMenus then WriteSnipet(TextStream, csFormMenu);
    if AppExpert.cbHints.Checked then
    begin
      WriteSnipet(TextStream, csHints);
      if AppExpert.cbStatusLine.Checked then
        WriteSnipet(TextStream, csCreateMethod);
    end;

    { write menus }
    if AppExpert.HasMenus then
    begin
      WriteSnipet(TextStream, csMenuObject);

      if AppExpert.cbFileMenu.Checked then
        WriteSnipet(TextStream, csFileMenuObject);
      if AppExpert.cbEditMenu.Checked then
        WriteSnipet(TextStream, csEditMenuObject);
      if AppExpert.cbWindowMenu.Checked then
        WriteSnipet(TextStream, csWindowMenuObject);
      if AppExpert.cbHelpMenu.Checked then
        WriteSnipet(TextStream, csHelpMenuObject);

      FmtWrite(TextStream, '  end'#13#10, [nil]);

      if AppExpert.cbFileMenu.Checked then
      begin
        { create the dialog objects }
        Filter := '';
        for I := 0 to AppExpert.ExtListBox.Items.Count - 1 do
          Filter := Filter + AppExpert.ExtListBox.Items[I] + '|';
        if (AnsiLastChar(Filter) <> nil) and (AnsiLastChar(Filter) = '|') then
          Delete(Filter, Length(Filter), 1);

        FmtWrite(TextStream, CodeSnipets[csOpenDialogObject], [Filter]);
        FmtWrite(TextStream, CodeSnipets[csSaveDialogObject], [Filter]);
        WriteSnipet(TextStream, csPrintDialogObject);
        WriteSnipet(TextStream, csPrintSetupDialogObject);
      end;

    end;

    if AppExpert.cbStatusLine.Checked then
      WriteSnipet(TextStream, csStatusLineObject);

    { create speedbuttons }
    if AppExpert.SpeedButtonCount > 0 then
    begin
      WriteSnipet(TextStream, csSpeedbarObject);

      ButtonNumber := 0;
      ButtonX := 8;

      for I := 0 to AppExpert.SpeedButtonCount - 1 do
      begin
        if AppExpert.SpeedButtonID[I] > -1 then
        begin
          Inc(ButtonNumber);
          ButtonID := AppExpert.SpeedButtonID[I] - sMenuItemTextBase;
          ButtonMethod := LoadStr(ButtonID + sMenuProcNames);
          ButtonHint := LoadStr(ButtonID + sHintBase);
          FmtWrite(TextStream, CodeSnipets[csSpeedButtonObject],
            [ButtonNumber, ButtonX, ButtonMethod, ButtonHint]);
          WriteGlyphData(TextStream, ButtonID + 11100);
          Inc(ButtonX, ButtonWidth - 1);
        end
        else Inc(ButtonX, SpaceWidth);
      end;

      FmtWrite(TextStream, '  end'#13#10, [nil]);
    end;

    FmtWrite(TextStream, 'end'#13#10, [nil]);

    { reset the text stream for conversion }
    TextStream.Position := 0;

    FormStream := TFileStream.Create(FormName, fmCreate);
    try
      ObjectTextToResource(TextStream, FormStream);
    finally
      FormStream.Free;
    end;

  finally
    TextStream.Free;
  end;
end;

{ interface procedure }
procedure ApplicationExpert(ToolServices: TIToolServices);
var
  D: TAppExpert;
  ProjectName: TFileName;
begin
  D := TAppExpert.Create(Application);
  try
    if D.ShowModal = mrOK then
    begin

      InitCodeGeneration;
      try
        ProjectName := ExpandFileName(GenerateProjectSource(D));
        GenerateMainSourceFile(D);
        GenerateMainFormFile(D);
      finally
        DoneCodeGeneration;
      end;

      { open the new project }
      if (ToolServices <> nil) and ToolServices.CloseProject then
        ToolServices.OpenProject(ProjectName);
    end;
  finally
    D.Free;
  end;
end;

function EditFilterInfo(var Filter: string): Boolean;
var
  D: TFilterDlg;
begin
  D := TFilterDlg.Create(Application);
  try
    D.Filter := Filter;
    Result := D.ShowModal = mrOK;
    if Result then Filter := D.Filter;
  finally
    D.Free;
  end;
end;

procedure ClearButtonImages(List: TList);
var
  I: Integer;
begin
  for I := 0 to List.Count - 1 do
    TButtonImage(List[I]).Free;
  List.Clear;
end;

{ TButtonImage }
constructor TButtonImage.Create;
begin
  FBitmap := TBitmap.Create;
  FNumGlyphs := 1;
end;

destructor TButtonImage.Destroy;
begin
  FBitmap.Free;
  inherited Destroy;
end;

procedure TButtonImage.SetBitmapID(Value: Word);
begin
  if FBitmapID <> Value then
  begin
    FBitmapID := Value;
    FBitmap.Handle := LoadBitmap(HInstance, PChar(FBitmapID));
  end;
end;

procedure TButtonImage.Draw(Canvas: TCanvas; X, Y: Integer);
var
  BX: Integer;
  Target: TRect;
  Source: TRect;
  SavePen, SaveBrush: TColor;
begin
  with Canvas do
  begin
    SavePen := Canvas.Pen.Color;
    SaveBrush := Canvas.Brush.Color;

    Target := DrawButtonFace(Canvas, Bounds(X, Y, DefaultButtonSize.X,
      DefaultButtonSize.Y), 1, bsWin31, False, False, False);

    { draw bitmap }
    BX := FBitmap.Width div FNumGlyphs;
    if BX > 0 then
    begin
      Target := Bounds(X, Y, BX, FBitmap.Height);
      OffsetRect(Target, (DefaultButtonSize.X div 2) - (BX div 2),
        (DefaultButtonSize.Y div 2) - (FBitmap.Height div 2));
      Source := Bounds(0, 0, BX, FBitmap.Height);
      BrushCopy(Target, FBitmap, Source,
        FBitmap.Canvas.Pixels[0, FBitmap.Height - 1]);
    end;

    Canvas.Pen.Color := SavePen;
    Canvas.Brush.Color := SaveBrush;
  end;
end;


{ TAppExpert }
procedure TAppExpert.FormCreate(Sender: TObject);
var
  ID: Word;
  ButtonImage: TButtonImage;
begin
  SpeedList := TList.Create;
  ButtonList := TList.Create;
  SpeedPointer := TBitmap.Create;
  SpeedPointer.Handle := LoadBitmap(HInstance, 'SPEEDPOINTER');
  Offscreen := TBitmap.Create;
  Offscreen.Width := SpeedBar.Width;
  Offscreen.Height := SpeedBar.Height;

  SampleBmp := TBitmap.Create;

  { fill the MenuItemList with the speedbuttons }
  for ID := sMenuItemTextBase to sMenuItemTextBase + MenuItemCount - 1 do
  begin
    ButtonImage := TButtonImage.Create;
    ButtonImage.NumGlyphs := 2;
    ButtonImage.BitmapID := ID;
    ButtonList.Add(ButtonImage);
  end;

  { This is required to prevent the speedbar from erasing its background
    each time it paints.  This dramatically reduces (eliminates) any
    flicker when painting. (Try commenting out this line to see the
    difference) }
  SpeedBar.ControlStyle := [csOpaque];

  PageControl.ActivePage := PageControl.Pages[FirstPage];
  SampleBmp.Handle := LoadBitmap(HInstance, SampleBitmaps[FirstPage]);

  RefreshButtons;
end;

procedure TAppExpert.FormDestroy(Sender: TObject);
begin
  ClearButtonImages(ButtonList);
  ButtonList.Free;
  SpeedList.Free;
  SpeedPointer.Free;
  Offscreen.Free;
  SampleBmp.Free;
end;

function TAppExpert.HasMenus: Boolean;
begin
  Result := (cbFileMenu.Checked) or (cbEditMenu.Checked) or
    (cbWindowMenu.Checked) or (cbHelpMenu.Checked);
end;

{ calculate which page is next based on current page and settings.
  -1 = last page
  -2 = cannot move in requested direction }
function TAppExpert.NextPage(Direction: TMoveDirection): Integer;
var
  CurPage: Integer;
begin
  Result := -2;
  CurPage := PageControl.ActivePage.PageIndex;

  case Direction of

    mdNoMove: if CurPage = LastPage then Result := -1
      else Result := 0;

    mdPrevious:
      begin
        case CurPage of
          pgMenus: begin { do nothing } end;
          pgExtensions: Result := pgMenus;
          pgSpeedbar: if cbFileMenu.Checked then Result := pgExtensions
            else Result := pgMenus;
          pgAppInfo: if HasMenus then Result := pgSpeedbar
            else Result := pgMenus;
        end;
      end;

    mdNext:
      begin
        case CurPage of
          pgMenus:
            if cbFileMenu.Checked then Result := pgExtensions
            else if HasMenus then Result := pgSpeedbar
            else Result := pgAppInfo;
          pgExtensions: Result := pgSpeedbar;
          pgSpeedbar: Result := pgAppInfo;
          pgAppInfo: Result := -1;
        end;
      end;
  end;
end;

procedure TAppExpert.RefreshButtons;
begin
  case NextPage(mdNoMove) of
   -1: NextButton.Caption := LoadStr(sFinish);
    0: NextButton.Caption := LoadStr(sNext);
  end;
  case NextPage(mdPrevious) of
    -2: PrevButton.Enabled := False;
    else PrevButton.Enabled := True;
  end;
end;

procedure RemoveItems(List: TList; MenuIndex: TMainItems);
var
  StartID: Integer;
  EndID: Integer;
  I: Integer;
  ButtonImage: TButtonImage;
begin
  StartID := sMenuItemTextBase + MenuItemOffsets[MenuIndex];
  EndID := StartID + MenuItemCounts[MenuIndex];

  I := 0;

  while I < List.Count do
  begin
    ButtonImage := TButtonImage(List[I]);
    if (ButtonImage <> nil) and (ButtonImage.BitmapID < EndID) and
      (ButtonImage.BitmapID >= StartID) then
      List.Delete(I)
    else Inc(I);
  end;
end;

procedure TAppExpert.MenuClicked(Sender: TObject);
var
  MenuIndex: TMainItems;
  MenuOn: Boolean;
begin
  { a menu category has been turned on/off }
  for MenuIndex := Low(TMainItems) to High(TMainItems) do
  begin
    case MenuIndex of
      mmFile: MenuOn := cbFileMenu.Checked;
      mmEdit: MenuOn := cbEditMenu.Checked;
      mmWindow: MenuOn := cbWindowMenu.Checked;
      mmHelp: MenuOn := cbHelpMenu.Checked;
    else
      MenuOn := False;
    end;
    if not MenuOn then
    begin
      RemoveItems(SpeedList, MenuIndex);
      FSpeedIndex := 0;
    end;
    if MenuList.ItemIndex = Ord(MenuIndex) then
      MenuListClick(Self);
  end;
end;

function TAppExpert.ValidateInfo: Boolean;
begin
  Result := False;
  if AppName.Text = '' then
  begin
    MessageDlg(LoadStr(sAppNameRequired), mtError, [mbOK], 0);
    Exit;
  end;
  if not IsValidIdent(AppName.Text) then
  begin
    MessageDlg(LoadStr(sInvalidAppName), mtError, [mbOK], 0);
    Exit;
  end;
  if not DirectoryExists(AppPath.Text) then
  begin
    MessageDlg(LoadStr(sInvalidPath), mtError, [mbOK], 0);
    Exit;
  end;
  Result := True;
end;

procedure TAppExpert.NextPrevClick(Sender: TObject);
var
  NewPage: Integer;
begin
  if Sender = PrevButton then NewPage := NextPage(mdPrevious)
  else NewPage := NextPage(mdNext);

  case NewPage of
   -1: if ValidateInfo then ModalResult := mrOK;
   -2: begin { do nothing } end;
    else
    begin
      if SampleBitmaps[NewPage] <> nil then
      begin
        SampleBmp.Handle := LoadBitmap(HInstance, SampleBitmaps[NewPage]);
        Sample.Invalidate;
      end;
      PageControl.ActivePage := PageControl.Pages[NewPage];
    end;
  end;
  RefreshButtons;
end;

{ draw the file extension list box }
procedure TAppExpert.DrawExtension(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  P: Integer;
  R: TRect;
  C: array[0..255] of Char;
  S: string;
begin
  { find the separator in the string }
  P := AnsiPos('|', ExtListBox.Items[Index]);

  { adjust the rectangle so we draw only the left "column" }
  R := Rect;

  { draw the filter description }
  S := Copy(ExtListBox.Items[Index], 1, P - 1);
  R.Right := R.Left + ExtHeader.SectionWidth[0];
  ExtTextOut(ExtListBox.Canvas.Handle, R.Left, R.Top, ETO_CLIPPED or
    ETO_OPAQUE, @R, StrPCopy(C, S), Length(S), nil);

  { move the rectangle to the next column }
  R.Left := R.Right;
  R.Right := Rect.Right;
  S := Copy(ExtListBox.Items[Index], P + 1, 255);
  ExtTextOut(ExtListBox.Canvas.Handle, R.Left, R.Top, ETO_CLIPPED or
    ETO_OPAQUE, @R, StrPCopy(C, S), Length(S), nil);
end;

procedure TAppExpert.HeaderSized(Sender: TObject; ASection,
  AWidth: Integer);
begin
  ExtListBox.Invalidate;
end;

procedure TAppExpert.AddClick(Sender: TObject);
var
  Filter: string;
begin
  Filter := '';
  if EditFilterInfo(Filter) then
    ExtListBox.Items.Add(Filter);
end;

procedure TAppExpert.EditClick(Sender: TObject);
var
  Filter: string;
begin
  if ExtListBox.ItemIndex > -1 then
  begin
    Filter := ExtListBox.Items[ExtListBox.ItemIndex];
    if EditFilterInfo(Filter) then
      ExtListBox.Items[ExtListBox.ItemIndex] := Filter;
  end;
end;

procedure TAppExpert.DeleteClick(Sender: TObject);
begin
  if ExtListBox.ItemIndex > -1 then
    ExtListBox.Items.Delete(ExtListBox.ItemIndex);
end;

procedure TAppExpert.MoveClick(Sender: TObject);
var
  Delta: Integer;
  NewPos: Integer;
begin
  if ExtListBox.ItemIndex <> -1 then
  begin
    if Sender = UpButton then Delta := -1
    else if Sender = DownButton then Delta := 1
    else Delta := 0;

    if Delta <> 0 then
    begin
      NewPos := ExtListBox.ItemIndex + Delta;
      if (NewPos >= 0) and (NewPos < ExtListBox.Items.Count) then
      begin
        ExtListBox.Items.Move(ExtListBox.ItemIndex, NewPos);
        ExtListBox.ItemIndex := NewPos;
      end;
    end;
  end;
end;

{ return the rectangle of the specified speedbutton or space }
function TAppExpert.SpeedButtonRect(Index: Integer): TRect;
var
  I: Integer;
  X: Integer;
begin
  X := 10;  { first usable position }

  for I := 0 to Index - 1 do
    if SpeedList[I] = nil then Inc(X, DefaultButtonSpace)
    else Inc(X, DefaultButtonSize.X - 1);

  Result := Bounds(X, 5, DefaultButtonSize.X, DefaultButtonSize.Y);
  if (Index < SpeedList.Count) and (SpeedList[Index] = nil) then
    Result.Right := Result.Left + DefaultButtonSpace;
end;

{ return an index into SpeedList from the TPoint }
function TAppExpert.SpeedButtonAtPos(Pos: TPoint): Integer;
var
  R: TRect;
  I: Integer;
begin
  for I := 0 to SpeedList.Count - 1 do
  begin
    R := SpeedButtonRect(I);
    if PtInRect(R, Pos) then
    begin
      Result := I;
      Exit;
    end;
  end;
  Result := -1;
end;

function TAppExpert.GetSpeedButtonCount: Integer;
begin
  Result := SpeedList.Count;
end;

function TAppExpert.GetSpeedButtonID(Value: Integer): Integer;
var
  ButtonImage: TButtonImage;
begin
  ButtonImage := TButtonImage(SpeedList[Value]);
  if ButtonImage <> nil then Result := ButtonImage.BitmapID
  else Result := -1;
end;

procedure TAppExpert.SpeedbarPaint(Sender: TObject);
var
  I: Integer;
  ButtonImage: TButtonImage;
  X: Integer;
  R: TRect;
begin
  with Offscreen.Canvas do
  begin
    Pen.Color := clWindowFrame;
    Brush.Style := bsClear;
    Brush.Color := SpeedBar.Color;

    Rectangle(1, 1, SpeedBar.Width - 1, SpeedBar.Height - 1);
    Pen.Color := clBtnShadow;
    PolyLine([Point(0, Speedbar.Height - 1), Point(0, 0),
      Point(SpeedBar.Width - 1, 0)]);
    Pen.Color := clBtnHighlight;
    PolyLine([ Point(SpeedBar.Width - 1, 0),
      Point(SpeedBar.Width - 1, SpeedBar.Height)]);
  end;

  { Draw the buttons in the list }
  X := 10;
  for I := 0 to SpeedList.Count - 1 do
  begin
    ButtonImage := TButtonImage(SpeedList[I]);
    if ButtonImage = nil then
    begin
      Offscreen.Canvas.Brush.Style := bsSolid;
      Offscreen.Canvas.Brush.Color := clBtnShadow;
      R := Bounds(X + 2, 5, DefaultButtonSpace - 3, DefaultButtonSize.Y - 2);
      Offscreen.Canvas.FillRect(R);
      Inc(X, DefaultButtonSpace);
    end
    else
    begin
      Offscreen.Canvas.Brush.Style := bsSolid;
      ButtonImage.Draw(Offscreen.Canvas, X, 4);
      Inc(X, DefaultButtonSize.X - 1);
    end;

    if X + (DefaultButtonSize.X * 2) > SpeedBar.Width then Break;

    { draw the insertion point }
    R := SpeedButtonRect(FSpeedIndex);
    OffsetRect(R, -5, 0);
    R.Top := R.Bottom + 2;
    R.Bottom := R.Top + SpeedPointer.Height;
    R.Right := R.Left + SpeedPointer.Width;
    Offscreen.Canvas.Brush.Color := SpeedBar.Color;
    Offscreen.Canvas.BrushCopy(R, SpeedPointer, Rect(0, 0, SpeedPointer.Width,
      SpeedPointer.Height), clWhite);
  end;
  SpeedBar.Canvas.Draw(0, 0, Offscreen);
end;

{ The list of menus was clicked }
procedure TAppExpert.MenuListClick(Sender: TObject);
var
  ID: Word;
  I: Integer;
  ButtonIndex: Integer;
  MenuOn: Boolean;
begin
  if MenuList.ItemIndex > -1 then
  begin
    ID := sMenuItemTextBase + MenuItemOffsets[ TMainItems(MenuList.ItemIndex) ];

    MenuItemList.Items.BeginUpdate;

    try
      MenuItemList.Clear;

      case MenuList.ItemIndex of
        0: MenuOn := cbFileMenu.Checked;
        1: MenuOn := cbEditMenu.Checked;
        2: MenuOn := cbWindowMenu.Checked;
        3: MenuOn := cbHelpMenu.Checked;
      else
        MenuOn := False;
      end;

      if MenuOn then
      begin
        { load the list box with the buttons and text }
        for I := 0 to MenuItemCounts[ TMainItems(MenuList.ItemIndex) ] - 1 do
        begin
          ButtonIndex := I + MenuItemOffsets[ TMainItems(MenuList.ItemIndex) ];
          MenuItemList.Items.AddObject(LoadStr(ID + I), ButtonList[ButtonIndex]);
        end;
      end;

    finally
      MenuItemList.Items.EndUpdate;
    end;
  end;
end;

procedure TAppExpert.DrawMenuItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  ButtonImage: TButtonImage;
  R: TRect;
  C: array[0..255] of Char;
begin
  ExtTextOut(MenuItemList.Canvas.Handle, R.Left, R.Top, ETO_OPAQUE,
    @Rect, nil, 0, nil);
  ButtonImage := TButtonImage(MenuItemList.Items.Objects[Index]);
  ButtonImage.Draw(MenuItemList.Canvas, Rect.Left + 2, Rect.Top + 1);

  R := Rect;
  Inc(R.Left, DefaultButtonSize.X + 2 + 4);
  DrawText(MenuItemList.Canvas.Handle,
    StrPCopy(C, MenuItemList.Items[Index]), -1, R, DT_VCENTER or DT_SINGLELINE);
end;

{ Insert the current button into the speedbar }
procedure TAppExpert.InsertClick(Sender: TObject);
var
  ButtonImage: TButtonImage;
begin
  if MenuItemList.ItemIndex > -1 then
  begin
    with MenuItemList do
      ButtonImage := TButtonImage(Items.Objects[ItemIndex]);
    if FSpeedIndex < SpeedList.Count then
      SpeedList.Insert(FSpeedIndex, ButtonImage)
    else
      SpeedList.Add(ButtonImage);
    Inc(FSpeedIndex);
    SpeedBar.Invalidate;
  end;
end;

procedure TAppExpert.SpaceClick(Sender: TObject);
begin
  if FSpeedIndex < SpeedList.Count then
    SpeedList.Insert(FSpeedIndex, nil)
  else
    SpeedList.Add(nil);
  Inc(FSpeedIndex);
  SpeedBar.Invalidate;
end;

procedure TAppExpert.RemoveClick(Sender: TObject);
begin
  if FSpeedIndex < SpeedList.Count then
  begin
    SpeedList.Delete(FSpeedIndex);
    if FSpeedIndex > SpeedList.Count then
      FSpeedIndex := SpeedList.Count;
    SpeedBar.Invalidate;
  end;
end;

{ The mouse was clicked in the speedbar area }
procedure TAppExpert.SpeedMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Index: Integer;
begin
  Index := SpeedButtonAtPos(Point(X, Y));
  if Index <> -1 then FSpeedIndex := Index
  else FSpeedIndex := SpeedList.Count;
  Speedbar.Invalidate;
end;

procedure TAppExpert.BrowseClick(Sender: TObject);
var
  D: string;
begin
  D := AppPath.Text;
  if SelectDirectory(D, [sdAllowCreate, sdPrompt, sdPerformCreate], 0) then
    AppPath.Text := D;
end;

procedure TAppExpert.SamplePaint(Sender: TObject);
var
  R: TRect;
begin
  if SampleBmp <> nil then
  begin
    R := Rect(0, 0, SampleBmp.Width, SampleBmp.Height);
    Sample.Canvas.BrushCopy(R, SampleBmp, R, SampleBmp.TransparentColor);
  end;
end;

end.
