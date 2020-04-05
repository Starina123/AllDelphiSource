{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX.Dialogs;

{$I FMX.Defines.inc}

interface

uses
  System.Classes, System.SysUtils, System.Types, System.UITypes,
  FMX.Types, FMX.Forms, FMX.Printer;

{$SCOPEDENUMS ON}

type

{ TCommonDialog }

  TCommonDialog = class(TFmxObject)
  private
    FHelpContext: THelpContext;
    FOnClose: TNotifyEvent;
    FOnShow: TNotifyEvent;
  protected
    procedure DoClose; dynamic;
    procedure DoShow; dynamic;
    function DoExecute: Boolean; virtual; abstract;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean; overload; virtual;
  published
    property HelpContext: THelpContext read FHelpContext write FHelpContext default 0;
    property OnClose: TNotifyEvent read FOnClose write FOnClose;
    property OnShow: TNotifyEvent read FOnShow write FOnShow;
  end;

{ TOpenDialog }

  TOpenDialog = class(TCommonDialog)
  private
    FHistoryList: TStrings;
    FOptions: TOpenOptions;
    FFilter: string;
    FFilterIndex: Integer;
    FInitialDir: string;
    FTitle: string;
    FDefaultExt: string;
    FFileName: TFileName;
    FFiles: TStrings;
    FOnSelectionChange: TNotifyEvent;
    FOnFolderChange: TNotifyEvent;
    FOnTypeChange: TNotifyEvent;
    FOnCanClose: TCloseQueryEvent;
    function GetFileName: TFileName;
    function GetFiles: TStrings;
    function GetFilterIndex: Integer;
    function GetInitialDir: string;
    function GetTitle: string;
    procedure ReadFileEditStyle(Reader: TReader);
    procedure SetFileName(Value: TFileName);
    procedure SetHistoryList(Value: TStrings);
    procedure SetInitialDir(const Value: string);
    procedure SetTitle(const Value: string);
  protected
    function DoCanClose: Boolean; dynamic;
    procedure DoSelectionChange; dynamic;
    procedure DoFolderChange; dynamic;
    procedure DoTypeChange; dynamic;
    procedure DefineProperties(Filer: TFiler); override;
    function DoExecute: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Files: TStrings read GetFiles;
    property HistoryList: TStrings read FHistoryList write SetHistoryList;
  published
    property DefaultExt: string read FDefaultExt write FDefaultExt;
    property FileName: TFileName read GetFileName write SetFileName;
    property Filter: string read FFilter write FFilter;
    property FilterIndex: Integer read GetFilterIndex write FFilterIndex default 1;
    property InitialDir: string read GetInitialDir write SetInitialDir;
    property Options: TOpenOptions read FOptions write FOptions
      default [TOpenOption.ofHideReadOnly, TOpenOption.ofEnableSizing];
    property Title: string read GetTitle write SetTitle;
    property OnCanClose: TCloseQueryEvent read FOnCanClose write FOnCanClose;
    property OnFolderChange: TNotifyEvent read FOnFolderChange write FOnFolderChange;
    property OnSelectionChange: TNotifyEvent read FOnSelectionChange write FOnSelectionChange;
    property OnTypeChange: TNotifyEvent read FOnTypeChange write FOnTypeChange;
  end;

{ TSaveDialog }

  TSaveDialog = class(TOpenDialog)
    protected
      function DoExecute: Boolean; override;
  end;

{ TPrintDialog }

type

  TPrintDialog = class(TCommonDialog)
  private
    FCollate: Boolean;
    FCopies: Integer;
    FMinPage: Integer;
    FMaxPage: Integer;
    FOptions: TPrintDialogOptions;
    FFromPage: Integer;
    FToPage: Integer;
    FPrintRange: TPrintRange;
    FPrintToFile: Boolean;
    procedure SetNumCopies(Value: Integer);
  protected
    function DoExecute: Boolean; override;
  published
    property Collate: Boolean read FCollate write FCollate default False;
    property Copies: Integer read FCopies write SetNumCopies default 0;
    property FromPage: Integer read FFromPage write FFromPage default 0;
    property MinPage: Integer read FMinPage write FMinPage default 0;
    property MaxPage: Integer read FMaxPage write FMaxPage default 0;
    property Options: TPrintDialogOptions read FOptions write FOptions default [];
    property PrintToFile: Boolean read FPrintToFile write FPrintToFile default False;
    property PrintRange: TPrintRange read FPrintRange write FPrintRange default TPrintRange.prAllPages;
    property ToPage: Integer read FToPage write FToPage default 0;
  end;

{ TPrinterSetupDialog }

  TPrinterSetupDialog = class(TCommonDialog)
  protected
    function DoExecute: Boolean; override;
  end;

{ TPageSetupDialog }

  TPageSetupPaintingEvent = procedure (Sender: TObject; const PaperSize: SmallInt;
    const Orientation: TPrinterOrientation; const PageType: TPageType;
    var DoneDrawing: Boolean) of object;
  TPaintPageEvent = procedure(Sender: TObject; Canvas: TCanvas; PageRect: TRect;
    var DoneDrawing: Boolean) of object;

  TPageSetupDialog = class(TCommonDialog)
  private
    FOptions: TPageSetupDialogOptions;
    FMargin: TRect;
    FMinMargin: TRect;
    FPaperSize: TPointF;
    // FMinMarginLeft: Integer;
    // FMinMarginTop: Integer;
    // FMinMarginRight: Integer;
    // FMinMarginBottom: Integer;
    // FMarginLeft: Integer;
    // FMarginTop: Integer;
    // FMarginRight: Integer;
    // FMarginBottom: Integer;
    // FPageWidth: Integer;
    // FPageHeight: Integer;
    FPainting: TPageSetupPaintingEvent;
    FUnits: TPageMeasureUnits;
    FOnDrawRetAddress: TPaintPageEvent;
    FOnDrawMinMargin: TPaintPageEvent;
    FOnDrawEnvStamp: TPaintPageEvent;
    FOnDrawFullPage: TPaintPageEvent;
    FOnDrawGreekText: TPaintPageEvent;
    FOnDrawMargin: TPaintPageEvent;
    function getMinMarginLeft: Integer;
    function getMinMarginTop: Integer;
    function getMinMarginRight: Integer;
    function getMinMarginBottom: Integer;
    function getMarginLeft: Integer;
    function getMarginTop: Integer;
    function getMarginRight: Integer;
    function getMarginBottom: Integer;
    function getPageWidth: Single;
    function getPageHeight: Single;
    procedure setMinMarginLeft(Value: Integer);
    procedure setMinMarginTop(Value: Integer);
    procedure setMinMarginRight(Value: Integer);
    procedure setMinMarginBottom(Value: Integer);
    procedure setMarginLeft(Value: Integer);
    procedure setMarginTop(Value: Integer);
    procedure setMarginRight(Value: Integer);
    procedure setMarginBottom(Value: Integer);
    procedure setPageWidth(Value: Single);
    procedure setPageHeight(Value: Single);
  protected
    function DoExecute: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property MinMarginLeft: Integer read getMinMarginLeft write setMinMarginLeft;
    property MinMarginTop: Integer read getMinMarginTop write setMinMarginTop;
    property MinMarginRight: Integer read getMinMarginRight write setMinMarginRight;
    property MinMarginBottom: Integer read getMinMarginBottom write setMinMarginBottom;
    property MarginLeft: Integer read getMarginLeft write setMarginLeft;
    property MarginTop: Integer read getMarginTop write setMarginTop;
    property MarginRight: Integer read getMarginRight write setMarginRight;
    property MarginBottom: Integer read getMarginBottom write setMarginBottom;
    property Options: TPageSetupDialogOptions read FOptions write FOptions
      default [TPageSetupDialogOption.psoDefaultMinMargins];
    property PageWidth: Single read getPageWidth write setPageWidth;
    property PageHeight: Single read getPageHeight write setPageHeight;
    property Units: TPageMeasureUnits read FUnits write FUnits default TPageMeasureUnits.pmDefault;
    property Painting: TPageSetupPaintingEvent read FPainting write FPainting;
    property OnDrawFullPage: TPaintPageEvent read FOnDrawFullPage write FOnDrawFullPage;
    property OnDrawMinMargin: TPaintPageEvent read FOnDrawMinMargin write FOnDrawMinMargin;
    property OnDrawMargin: TPaintPageEvent read FOnDrawMargin write FOnDrawMargin;
    property OnDrawGreekText: TPaintPageEvent read FOnDrawGreekText write FOnDrawGreekText;
    property OnDrawEnvStamp: TPaintPageEvent read FOnDrawEnvStamp write FOnDrawEnvStamp;
    property OnDrawRetAddress: TPaintPageEvent read FOnDrawRetAddress write FOnDrawRetAddress;
  end;

const
  mbYesNo = [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo];
  mbYesNoCancel = [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo, TMsgDlgBtn.mbCancel];
  mbYesAllNoAllCancel = [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbYesToAll, TMsgDlgBtn.mbNo,
    TMsgDlgBtn.mbNoToAll, TMsgDlgBtn.mbCancel];
  mbOKCancel = [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel];
  mbAbortRetryIgnore = [TMsgDlgBtn.mbAbort, TMsgDlgBtn.mbRetry, TMsgDlgBtn.mbIgnore];
  mbAbortIgnore = [TMsgDlgBtn.mbAbort, TMsgDlgBtn.mbIgnore];

function CreateMessageDialog(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons): TForm; overload;
function CreateMessageDialog(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; DefaultButton: TMsgDlgBtn): TForm; overload;

function MessageDlg(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint): Integer; overload; inline;
function MessageDlg(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; DefaultButton: TMsgDlgBtn): Integer; overload; inline;

function MessageDlgPos(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer): Integer; overload; inline;
function MessageDlgPos(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  DefaultButton: TMsgDlgBtn): Integer; overload; inline;

function MessageDlgPosHelp(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  const HelpFileName: string): Integer; overload;
function MessageDlgPosHelp(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  const HelpFileName: string; DefaultButton: TMsgDlgBtn): Integer; overload;

procedure ShowMessage(const Msg: string);
procedure ShowMessageFmt(const Msg: string; Params: array of const);
procedure ShowMessagePos(const Msg: string; X, Y: Integer);

{$IFNDEF FPC}
type
  TInputCloseQueryEvent = procedure (Sender: TObject; const Values: array of string; var CanClose: Boolean) of object;
  TInputCloseQueryFunc = reference to function (const Values: array of string): Boolean;

{ Input dialog }

function InputBox(const ACaption, APrompt, ADefault: string): string;
function InputQuery(const ACaption: string; const APrompts: array of string; var AValues: array of string; CloseQueryFunc: TInputCloseQueryFunc = nil): Boolean; overload;
function InputQuery(const ACaption: string; const APrompts: array of string; var AValues: array of string; CloseQueryEvent: TInputCloseQueryEvent; Context: TObject = nil): Boolean; overload;
function InputQuery(const ACaption, APrompt: string; var Value: string): Boolean; overload;
{$ENDIF}

implementation

uses System.Math, FMX.Consts, FMX.Platform, FMX.Controls, FMX.Objects, FMX.Layouts, FMX.Edit;

type
  TMessageForm = class(TForm)
  private
    Message: TLabel;
    procedure HelpButtonClick(Sender: TObject);
  protected
    procedure CustomKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure WriteToClipBoard(const Text: string);
    function GetFormText: string;
//  public
//    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); override;
  end;

//constructor TMessageForm.CreateNew(AOwner: TComponent; Dummy: Integer = 0);
//begin
//  inherited CreateNew(AOwner, Dummy);
//  // Font.Assign(Screen.MessageFont);
//end;

procedure TMessageForm.HelpButtonClick(Sender: TObject);
begin
//  Application.HelpContext(HelpContext);
end;

procedure TMessageForm.CustomKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = Word('C')) then
  begin
    System.SysUtils.Beep;
    WriteToClipBoard(GetFormText);
  end;
end;

procedure TMessageForm.WriteToClipBoard(const Text: string);
begin
  Platform.SetClipboard(Text);
end;

function TMessageForm.GetFormText: string;
var
  DividerLine, ButtonCaptions: string;
  I: Integer;
begin
  DividerLine := StringOfChar('-', 27) + sLineBreak;
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TButton then
      ButtonCaptions := ButtonCaptions + TButton(Components[I]).Text +
        StringOfChar(' ', 3);
  ButtonCaptions := StringReplace(ButtonCaptions,'&','', [rfReplaceAll]);
  Result := Format('%s%s%s%s%s%s%s%s%s%s', [DividerLine, Caption, sLineBreak,
    DividerLine, Message.Text, sLineBreak, DividerLine, ButtonCaptions,
    sLineBreak, DividerLine]);
end;

function MulDiv(nNumber, nNumerator, nDenominator: Single): Single; overload; inline;
begin
  Result := (nNumber * nNumerator) / nDenominator;
end;

function MulDiv(nNumber, nNumerator, nDenominator: Double): Double; overload; inline;
begin
  Result := (nNumber * nNumerator) / nDenominator;
end;

function GetAveCharSize(Canvas: TCanvas): TPointF;
var
  I: Integer;
  Buffer: string;
begin
  SetLength(Buffer, 52);
  for I := 1 to 26 do
    Buffer[I] := Chr((I - 1) + Ord('A'));
  for I := 27 to 52 do
    Buffer[I] := Chr((I - 27) + Ord('a'));
  Result := PointF(Canvas.TextWidth(Buffer), Canvas.TextHeight(Buffer));
  Result.X := Result.X / 52;
end;

var
  Captions: array[TMsgDlgType] of Pointer = (@SMsgDlgWarning, @SMsgDlgError,
    @SMsgDlgInformation, @SMsgDlgConfirm, nil);
  IconIDs: array[TMsgDlgType] of String = ('iconwarning', 'iconerror',
    'iconinformation', 'iconconfirmation', ''); // do not localize it is style
  ButtonCaptions: array[TMsgDlgBtn] of Pointer = (
    @SMsgDlgYes, @SMsgDlgNo, @SMsgDlgOK, @SMsgDlgCancel, @SMsgDlgAbort,
    @SMsgDlgRetry, @SMsgDlgIgnore, @SMsgDlgAll, @SMsgDlgNoToAll, @SMsgDlgYesToAll,
    @SMsgDlgHelp, @SMsgDlgClose);
  ButtonNames: array[TMsgDlgBtn] of string = (
    'Yes', 'No', 'OK', 'Cancel', 'Abort', 'Retry', 'Ignore', 'All', 'NoToAll',
    'YesToAll', 'Help', 'Close');
  ModalResults: array[TMsgDlgBtn] of Integer = (
    mrYes, mrNo, mrOk, mrCancel, mrAbort, mrRetry, mrIgnore, mrAll, mrNoToAll,
    mrYesToAll, 0, mrClose);
  ButtonWidths : array[TMsgDlgBtn] of single;  // initialized to zero

function StripHotKey(const AText: String): String;
begin
  Result := AText;
  if Pos('&', AText) <>0 then
    Delete(Result, Pos('&', Result), 1);
end;

function CreateMessageDialog(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; DefaultButton: TMsgDlgBtn): TForm;
const
  mcHorzMargin = 8;
  mcVertMargin = 8;
  mcHorzSpacing = 10;
  mcVertSpacing = 10;
  mcButtonWidth = 50;
  mcButtonHeight = 14;
  mcButtonSpacing = 4;
var
  DialogUnits: TPointF;
  HorzMargin, VertMargin, HorzSpacing, VertSpacing, ButtonWidth,
  ButtonHeight, ButtonSpacing, ButtonGroupWidth,
  IconTextWidth, IconTextHeight, X, ALeft: Single;
  ButtonCount: Integer;
  B, CancelButton: TMsgDlgBtn;
  TextRect: TRectF;
  LButton: TButton;
  IconStyle: String;
  S: TFmxObject;
  NewMsg: string;
  lblMessage: TLabel;
  function CreateLabel(Form: TForm; Msg: string): TLabel;
  begin
    Result := TLabel.Create(Form);
    with Result do
    begin
      Name := 'Message';
      Parent := Form;
      WordWrap := True;
      TextAlign := TTextAlign.taLeading;
      VertTextAlign := TTextAlign.taLeading;
      Text := Msg;
      //BiDiMode := Form.BiDiMode;
      if (Application.DefaultStyles <> nil) and (Application.DefaultStyles.FindStyleResource('messagelabelstyle') <> nil) then
        StyleLookup := 'messagelabelstyle';
    end;
  end;
begin
  Result := TMessageForm.CreateNew(Application);
  with Result do
  begin
    if Application.DefaultStyles <> nil then
    begin
      S := Application.DefaultStyles.FindStyleResource('messagestyle');
      if S <> nil then
      begin
        with TStyledControl.Create(Result) do
        begin
          Parent := Result;
          StyleLookup := 'messagestyle';
          Align := TAlignLayout.alContents;
        end;
        Result.Transparency := True;
      end;
    end;

    BeginUpdate;
    try
      BiDiMode := Application.BiDiMode;
      BorderStyle := TFmxFormBorderStyle.bsSingle;
      BorderIcons := [TBorderIcon.biSystemMenu];
//    OnKeyDown := TMessageForm(Result).CustomKeyDown;
      Position := TFormPosition.poDesigned;
      DialogUnits := GetAveCharSize(Canvas);
      HorzMargin := mcHorzMargin * DialogUnits.X / 4;
      VertMargin := mcVertMargin * DialogUnits.Y / 8;
      HorzSpacing := mcHorzSpacing * DialogUnits.X / 4;
      VertSpacing := mcVertSpacing * DialogUnits.Y / 8;
      ButtonWidth := mcButtonWidth * DialogUnits.X / 4;
    finally
      EndUpdate;
    end;
    for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
    begin
      if B in Buttons then
      begin
        if ButtonWidths[B] = 0 then
        begin
          TextRect := RectF(0, 0, 0, 0);
          Canvas.MeasureText(TextRect, LoadResString(ButtonCaptions[B]), False, [],
            TTextAlign.taLeading, TTextAlign.taLeading);
          ButtonWidths[B] := TextRect.Right - TextRect.Left + 8;
        end;
        if ButtonWidths[B] > ButtonWidth then
          ButtonWidth := ButtonWidths[B];
      end;
    end;
    ButtonHeight := mcButtonHeight * DialogUnits.Y / 8;
    ButtonSpacing := mcButtonSpacing * DialogUnits.X / 4;

    NewMsg := Translate(Msg);
    lblMessage := CreateLabel(Result, NewMsg);
    TMessageForm(Result).Message := lblMessage;
    Canvas.Font.Assign(lblMessage.Font);
    if NewMsg <> '' then
    begin
      TextRect := RectF(0, 0, Platform.GetScreenSize.X / 2, 0);
      Canvas.MeasureText(TextRect, NewMsg, True, [], TTextAlign.taLeading, TTextAlign.taLeading);
    end
    else
      TextRect := RectF(0, 0, 0, 0);
    TextRect.Right := TextRect.Right + 1; // add some extra space to disble text wrapping
    IconTextWidth := TextRect.Right + 8;
    IconTextHeight := TextRect.Bottom;
    IconStyle := IconIDs[DlgType];
    if (Application.DefaultStyles <> nil) and (Application.DefaultStyles.FindStyleResource(IconStyle) <> nil) then
    begin
      IconTextWidth := IconTextWidth + 64 + HorzSpacing;
      if IconTextHeight < 64 then IconTextHeight := 64;
    end;
    ALeft := IconTextWidth - TextRect.Right + HorzMargin;
    lblMessage.SetBounds(ALeft, VertMargin, TextRect.Right + 3, TextRect.Bottom);

    ButtonCount := 0;
    for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
      if B in Buttons then Inc(ButtonCount);
    ButtonGroupWidth := 0;
    if ButtonCount <> 0 then
      ButtonGroupWidth := ButtonWidth * ButtonCount +
        ButtonSpacing * (ButtonCount - 1);
    ClientWidth := Round(Max(IconTextWidth, ButtonGroupWidth) + HorzMargin * 2);
    ClientHeight := Round(IconTextHeight + ButtonHeight + VertSpacing + VertMargin * 2);
    Left := round((Platform.GetScreenSize.X / 2) - (Width div 2));
    Top := round((Platform.GetScreenSize.Y / 2) - (Height div 2));
    if DlgType <> TMsgDlgType.mtCustom then
      Caption := LoadResString(Captions[DlgType]) else
      Caption := Application.Title;
    if (Application.DefaultStyles <> nil) and (Application.DefaultStyles.FindStyleResource(IconStyle) <> nil) then
      with TStyledControl.Create(Result) do
      begin
        Name := 'Image';
        Parent := Result;
        StyleLookup := IconStyle;
        SetBounds(HorzMargin, VertMargin, 64, 64);
      end;
    if TMsgDlgBtn.mbCancel in Buttons then CancelButton := TMsgDlgBtn.mbCancel else
      if TMsgDlgBtn.mbNo in Buttons then CancelButton := TMsgDlgBtn.mbNo else
        CancelButton := TMsgDlgBtn.mbOk;
    X := (ClientWidth - ButtonGroupWidth) / 2;
    for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
      if B in Buttons then
      begin
        LButton := TButton.Create(Result);
        with LButton do
        begin
          Name := ButtonNames[B];
          Parent := Result;
          Text := StripHotKey(LoadResString(ButtonCaptions[B]));
          ModalResult := ModalResults[B];
          if B = DefaultButton then
          begin
            Default := True;
            ActiveControl := LButton;
          end;
          if B = CancelButton then
            Cancel := True;
          SetBounds(X, IconTextHeight + VertMargin + VertSpacing,
            ButtonWidth, ButtonHeight);
          X := X + ButtonWidth + ButtonSpacing;
          if B = TMsgDlgBtn.mbHelp then
            OnClick := TMessageForm(Result).HelpButtonClick;
        end;
      end;
  end;
end;

function CreateMessageDialog(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons): TForm;
var
  DefaultButton: TMsgDlgBtn;
begin
  if TMsgDlgBtn.mbOk in Buttons then DefaultButton := TMsgDlgBtn.mbOk else
    if TMsgDlgBtn.mbYes in Buttons then DefaultButton := TMsgDlgBtn.mbYes else
      DefaultButton := TMsgDlgBtn.mbRetry;
    Result := CreateMessageDialog(Msg, DlgType, Buttons, DefaultButton);
end;

function MessageDlg(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint): Integer;
begin
  Result := MessageDlgPosHelp(Msg, DlgType, Buttons, HelpCtx, -1, -1, '');
end;

function MessageDlg(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; DefaultButton: TMsgDlgBtn): Integer; overload;
begin
  Result := MessageDlgPosHelp(Msg, DlgType, Buttons, HelpCtx, -1, -1, '', DefaultButton);
end;

function DoMessageDlgPosHelp(MessageDialog: TForm; HelpCtx: Longint; X, Y: Integer;
  const HelpFileName: string): Integer;
begin
  try
//      HelpContext := HelpCtx;
//      HelpFile := HelpFileName;
    if X >= 0 then
      MessageDialog.Left := X;
    if Y >= 0 then
      MessageDialog.Top := Y;
    if (Y < 0) and (X < 0) then
      MessageDialog.Position := TFormPosition.poScreenCenter;
    Result := MessageDialog.ShowModal;
  finally
    MessageDialog.Free;
  end;
end;

function MessageDlgPos(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer): Integer;
begin
  Result := MessageDlgPosHelp(Msg, DlgType, Buttons, HelpCtx, X, Y, '');
end;

function MessageDlgPos(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  DefaultButton: TMsgDlgBtn): Integer; overload;
begin
  Result := MessageDlgPosHelp(Msg, DlgType, Buttons, HelpCtx, X, Y, '', DefaultButton);
end;

function MessageDlgPosHelp(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  const HelpFileName: string): Integer;
begin
  Result := DoMessageDlgPosHelp(CreateMessageDialog(Msg, DlgType, Buttons),
    HelpCtx, X, Y, HelpFileName);
end;

function MessageDlgPosHelp(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  const HelpFileName: string; DefaultButton: TMsgDlgBtn): Integer; overload;
begin
  Result := DoMessageDlgPosHelp(CreateMessageDialog(Msg, DlgType, Buttons, DefaultButton),
    HelpCtx, X, Y, HelpFileName);
end;

procedure ShowMessage(const Msg: string);
begin
  ShowMessagePos(Msg, -1, -1);
end;

procedure ShowMessageFmt(const Msg: string; Params: array of const);
begin
  ShowMessage(Format(Msg, Params));
end;

procedure ShowMessagePos(const Msg: string; X, Y: Integer);
begin
  MessageDlgPos(Msg, TMsgDlgType.mtCustom, [TMsgDlgBtn.mbOK], 0, X, Y);
end;

{ TCommonDialog }

constructor TCommonDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TCommonDialog.Destroy;
begin
  inherited Destroy;
end;

procedure TCommonDialog.DoClose;
begin
  if Assigned(FOnClose) then FOnClose(Self);
end;

procedure TCommonDialog.DoShow;
begin
  if Assigned(FOnShow) then FOnShow(Self);
end;

function TCommonDialog.Execute: Boolean;
begin
  DoShow;
  Result := DoExecute;
  DoClose;
end;

{ TOpenDialog }

constructor TOpenDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FHistoryList := TStringList.Create;
  FOptions := [TOpenOption.ofHideReadOnly, TOpenOption.ofEnableSizing];
  FFiles := TStringList.Create;
  FFilterIndex := 1;
end;

destructor TOpenDialog.Destroy;
begin
  FFiles.Free;
  FHistoryList.Free;
  inherited Destroy;
end;

function TOpenDialog.DoCanClose: Boolean;
begin
  Result := True;
  if Assigned(FOnCanClose) then FOnCanClose(Self, Result);
end;

procedure TOpenDialog.DoSelectionChange;
begin
  if Assigned(FOnSelectionChange) then FOnSelectionChange(Self);
end;

procedure TOpenDialog.DoFolderChange;
begin
  if Assigned(FOnFolderChange) then FOnFolderChange(Self);
end;

procedure TOpenDialog.DoTypeChange;
begin
  if Assigned(FOnTypeChange) then FOnTypeChange(Self);
end;

procedure TOpenDialog.ReadFileEditStyle(Reader: TReader);
begin
  { Ignore FileEditStyle }
  Reader.ReadIdent;
end;

procedure TOpenDialog.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('FileEditStyle', ReadFileEditStyle, nil, False);
end;

function TOpenDialog.GetFiles: TStrings;
begin
  Result := FFiles;
end;

function TOpenDialog.GetFileName: TFileName;
begin
  Result := FFileName;
end;

function TOpenDialog.GetFilterIndex: Integer;
begin
  Result := FFilterIndex;
end;

function TOpenDialog.GetInitialDir: string;
begin
  Result := FInitialDir;
end;

function TOpenDialog.GetTitle: string;
begin
  Result := FTitle;
end;

procedure TOpenDialog.SetFileName(Value: TFileName);
begin
  if Value <> FFileName then
    FFileName := Value;
end;

procedure TOpenDialog.SetHistoryList(Value: TStrings);
begin
  FHistoryList.Assign(Value);
end;

procedure TOpenDialog.SetInitialDir(const Value: string);
var
  L: Integer;
begin
  L := Length(Value);
  if (L > 1) and IsPathDelimiter(Value, L)
    and not IsDelimiter(':', Value, L - 1) then Dec(L);
  FInitialDir := Copy(Value, 1, L);
end;

procedure TOpenDialog.SetTitle(const Value: string);
begin
  if Value <> FTitle then
    FTitle := Value;
end;

function TOpenDialog.DoExecute: Boolean;
begin
  Result := Platform.DialogOpenFiles(FFileName, FInitialDir, FDefaultExt, FFilter, FTitle, FFilterIndex, FFiles, FOptions);
end;

{ TSaveDialog }

function TSaveDialog.DoExecute: Boolean;
begin
  Result := Platform.DialogSaveFiles(FFileName, FInitialDir, FDefaultExt, FFilter, FTitle, FFilterIndex, FFiles, FOptions);
end;

{ TPrintDialog }

function TPrintDialog.DoExecute: Boolean;
begin
  Result := Platform.DialogPrint(FCollate, FPrintToFile, FFromPage, FToPage, FCopies,
    FMinPage, FMaxPage, FPrintRange, FOptions);
end;

procedure TPrintDialog.SetNumCopies(Value: Integer);
begin
  FCopies := Value;
  Printer.Copies := Value;
end;

{ TPageSetupDialog }

constructor TPageSetupDialog.Create(AOwner: TComponent);
begin
  inherited;
  Options := [TPageSetupDialogOption.psoDefaultMinMargins];
  Platform.PageSetupGetDefaults(FMargin, FMinMargin, FPaperSize, FUnits, FOptions);
end;

function TPageSetupDialog.DoExecute: Boolean;
begin
  Result := Platform.DialogPageSetup(FMargin, FMinMargin, FPaperSize, FUnits, FOptions);
end;

function TPageSetupDialog.getMarginBottom: Integer;
begin
  Result := FMargin.Bottom;
end;

function TPageSetupDialog.getMarginLeft: Integer;
begin
  Result := FMargin.Left;
end;

function TPageSetupDialog.getMarginRight: Integer;
begin
  Result := FMargin.Right;
end;

function TPageSetupDialog.getMarginTop: Integer;
begin
  Result := FMargin.Top;
end;

function TPageSetupDialog.getMinMarginBottom: Integer;
begin
  Result := FMinMargin.Bottom;
end;

function TPageSetupDialog.getMinMarginLeft: Integer;
begin
  Result := FMinMargin.Left;
end;

function TPageSetupDialog.getMinMarginRight: Integer;
begin
  Result := FMinMargin.Right;
end;

function TPageSetupDialog.getMinMarginTop: Integer;
begin
  Result := FMinMargin.Top;
end;

function TPageSetupDialog.getPageHeight: Single;
begin
  Result := FPaperSize.Y;
end;

function TPageSetupDialog.getPageWidth: Single;
begin
  Result := FPaperSize.X;
end;

procedure TPageSetupDialog.setMarginBottom(Value: Integer);
begin
  if Value <> FMargin.Bottom then
    if Value >= 0 then
      FMargin.Bottom := Value;
end;

procedure TPageSetupDialog.setMarginLeft(Value: Integer);
begin
  if Value <> FMargin.Left then
    if Value >= 0 then
      FMargin.Left := Value;
end;

procedure TPageSetupDialog.setMarginRight(Value: Integer);
begin
  if Value <> FMargin.Right then
    if Value >= 0 then
      FMargin.Right := Value;
end;

procedure TPageSetupDialog.setMarginTop(Value: Integer);
begin
  if Value <> FMargin.Top then
    if Value >= 0 then
      FMargin.Top := Value;
end;

procedure TPageSetupDialog.setMinMarginBottom(Value: Integer);
begin
  if Value <> FMinMargin.Bottom then
    if Value >= 0 then
      FMinMargin.Bottom := Value;
end;

procedure TPageSetupDialog.setMinMarginLeft(Value: Integer);
begin
  if Value <> FMinMargin.Left then
    if Value >= 0 then
      FMinMargin.Left := Value;
end;

procedure TPageSetupDialog.setMinMarginRight(Value: Integer);
begin
  if Value <> FMinMargin.Right then
    if Value >= 0 then
      FMinMargin.Right := Value;
end;

procedure TPageSetupDialog.setMinMarginTop(Value: Integer);
begin
  if Value <> FMinMargin.Top then
    if Value >= 0 then
      FMinMargin.Top := Value;
end;

procedure TPageSetupDialog.setPageHeight(Value: Single);
begin
  if Value <> FPaperSize.Y then
    if Value >= 0 then
      FPaperSize.Y := Value;
end;

procedure TPageSetupDialog.setPageWidth(Value: Single);
begin
  if Value <> FPaperSize.X then
    if Value >= 0 then
      FPaperSize.X := Value;
end;

{ TPrinterSetupDialog }

function TPrinterSetupDialog.DoExecute: Boolean;
begin
  Result := Platform.DialogPrinterSetup;
end;

{$IFNDEF FPC}
type
  TInputQueryForm = class(TForm)
  public
    FCloseQueryFunc: TFunc<Boolean>;
    function CloseQuery: Boolean; override;
  end;

function TInputQueryForm.CloseQuery: Boolean;
begin
  Result := (ModalResult = mrCancel) or (not Assigned(FCloseQueryFunc)) or FCloseQueryFunc();
end;

{ Input dialog }

function InputBox(const ACaption, APrompt, ADefault: string): string;
begin
  Result := ADefault;
  InputQuery(ACaption, APrompt, Result);
end;

function InputQuery(const ACaption: string; const APrompts: array of string; var AValues: array of string; CloseQueryFunc: TInputCloseQueryFunc = nil): Boolean;
var
  I, J: Integer;
  Form: TInputQueryForm;
  Prompt: TLabel;
  Edit: TEdit;
  DialogUnits: TPointF;
  PromptCount: Integer;
  MaxPromptWidth, CurPrompt: Single;
  ButtonTop, ButtonWidth, ButtonHeight: Single;

  function GetPromptCaption(const ACaption: string): string;
  begin
    if (Length(ACaption) > 1) and (ACaption[1] < #32) then
      Result := Copy(ACaption, 2, MaxInt)
    else
      Result := ACaption;
  end;

  function GetMaxPromptWidth(Canvas: TCanvas): Single;
  var
    I: Integer;
  begin
    Result := 0;
    for I := 0 to PromptCount - 1 do
      Result := Max(Result, Canvas.TextWidth(GetPromptCaption(APrompts[I])) + DialogUnits.X);
  end;

  function GetPasswordChar(const ACaption: string): WideChar;
  begin
    if (Length(ACaption) > 1) and (ACaption[1] < #32) then
      Result := '*'
    else
      Result := #0;
  end;

begin
  if Length(AValues) < Length(APrompts) then
    raise EInvalidOperation.CreateRes(@SPromptArrayTooShort);
  PromptCount := Length(APrompts);
  if PromptCount < 1 then
    raise EInvalidOperation.CreateRes(@SPromptArrayEmpty);
  Result := False;
  Form := TInputQueryForm.CreateNew(Application);
  with Form do
    try
      FCloseQueryFunc :=
        function: Boolean
        var
          I, J: Integer;
          LValues: array of string;
          Control: TFmxObject;
        begin
          Result := True;
          if Assigned(CloseQueryFunc) then
          begin
            SetLength(LValues, PromptCount);
            J := 0;
            for I := 0 to Form.ChildrenCount - 1 do
            begin
              Control := Form.Children[I];
              if Control is TEdit then
              begin
                LValues[J] := TEdit(Control).Text;
                Inc(J);
              end;
            end;
            Result := CloseQueryFunc(LValues);
          end;
        end;
//      Canvas.Font.As := Font;
      DialogUnits := GetAveCharSize(Canvas);
      MaxPromptWidth := GetMaxPromptWidth(Canvas);
      BorderStyle := TFmxFormBorderStyle.bsSingle;
      BorderIcons := [TBorderIcon.biSystemMenu];
      Caption := ACaption;
      ClientWidth := Trunc(MulDiv(180.0 + MaxPromptWidth, DialogUnits.X, 4.0));
//      PopupMode := pmAuto;
      Position := TFormPosition.poScreenCenter;
      CurPrompt := MulDiv(8.0, DialogUnits.Y, 8.0);
      Edit := nil;
      for I := 0 to PromptCount - 1 do
      begin
        Prompt := TLabel.Create(Form);
        with Prompt do
        begin
          Parent := Form;
          Text := GetPromptCaption(APrompts[I]);
          TextAlign := TTextAlign.taLeading;
          VertTextAlign := TTextAlign.taLeading;
          Position.X := MulDiv(8.0, DialogUnits.X, 4.0);
          Position.Y := CurPrompt;
//          Constraints.MaxWidth := MaxPromptWidth;
          WordWrap := True;
        end;
        Edit := TEdit.Create(Form);
        with Edit do
        begin
          Parent := Form;
          Password := GetPasswordChar(APrompts[I]) <> #0;
          ApplyStyleLookup;
          Position.X := Prompt.Position.X + MaxPromptWidth;
          Position.Y := Prompt.Position.Y - ContentRect.TopLeft.Y;
          Width := Form.ClientWidth - Position.X - MulDiv(8.0, DialogUnits.X, 4.0);
          MaxLength := 255;
          Text := AValues[I];
          SelectAll;
//          Prompt.FocusControl := Edit;
        end;
        CurPrompt := Prompt.Position.Y + Edit.Height + 5;
      end;
      ButtonTop := Edit.Position.Y + Edit.Height + 15;
      ButtonWidth := MulDiv(50.0, DialogUnits.X, 4.0);
      ButtonHeight := MulDiv(14.0, DialogUnits.Y, 8.0);
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Text := SMsgDlgOK;
        ModalResult := mrOk;
        Default := True;
        SetBounds(Form.ClientWidth - (ButtonWidth + MulDiv(8.0, DialogUnits.X, 4.0)) * 2.0, ButtonTop, ButtonWidth, ButtonHeight);
      end;
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Text := SMsgDlgCancel;
        ModalResult := mrCancel;
        Cancel := True;
        SetBounds(Form.ClientWidth - (ButtonWidth + MulDiv(8.0, DialogUnits.X, 4.0)), ButtonTop, ButtonWidth, ButtonHeight);
        Form.ClientHeight := Trunc(Position.Y + Height + 13);
      end;
      if ShowModal = mrOk then
      begin
        J := 0;
        for I := 0 to ChildrenCount - 1 do
          if Children[I] is TEdit then
          begin
            Edit := TEdit(Children[I]);
            AValues[J] := Edit.Text;
            Inc(J);
          end;
        Result := True;
      end;
    finally
      Form.Free;
    end;
end;

function InputQuery(const ACaption: string; const APrompts: array of string; var AValues: array of string; CloseQueryEvent: TInputCloseQueryEvent; Context: TObject = nil): Boolean;
begin
  Result := InputQuery(ACaption, APrompts, AValues,
    function (const Values: array of string): Boolean
    begin
      Result := True;
      CloseQueryEvent(Context, Values, Result);
    end)
end;

function InputQuery(const ACaption, APrompt: string; var Value: string): Boolean;
var
  Values: array[0..0] of string;
begin
  Values[0] := Value;
  Result := InputQuery(ACaption, [APrompt], Values);
  if Result then
    Value := Values[0];
end;

type
  TDefaultLoginCredentials = class sealed
    class procedure LoginEvent(Sender: TObject; Callback: TLoginCredentialService.TLoginEvent; var Success: Boolean);
    class procedure LoginEventUsrPw(Sender: TObject; Callback: TLoginCredentialService.TLoginEvent; var Success: Boolean);
  end;

class procedure TDefaultLoginCredentials.LoginEvent(Sender: TObject; Callback: TLoginCredentialService.TLoginEvent; var Success: Boolean);
var
  Values: TArray<string>;
begin
  SetLength(Values, 3);
  Success := InputQuery(SLogin, [SUsername, #31 + SPassword, SDomain], Values,
    function (const Values: array of string): Boolean
    begin
      Result := True;
      Callback(Sender, Values[0], Values[1], Values[2], Result);
    end);
end;

class procedure TDefaultLoginCredentials.LoginEventUsrPw(Sender: TObject; Callback: TLoginCredentialService.TLoginEvent; var Success: Boolean);
var
  Values: TArray<string>;
begin
  SetLength(Values, 2);
  Success := InputQuery(SLogin, [SUsername, #31 + SPassword], Values,
    function (const Values: array of string): Boolean
    begin
      Result := True;
      Callback(Sender, Values[0], Values[1], '', Result);
    end);
end;
{$ENDIF}

initialization
  StartClassGroup(TFmxObject);
  ActivateClassGroup(TFmxObject);
  GroupDescendentsWith(TCommonDialog, TFmxObject);
{$IFNDEF FPC}
  TLoginCredentialService.RegisterLoginHandler(TLoginCredentialService.Default, TDefaultLoginCredentials.LoginEventUsrPw);
  TLoginCredentialService.RegisterLoginHandler(TLoginCredentialService.DefaultUsrPwDm, TDefaultLoginCredentials.LoginEvent);
  TLoginCredentialService.RegisterLoginHandler(TLoginCredentialService.DefaultUsrPw, TDefaultLoginCredentials.LoginEventUsrPw);
{$ENDIF}
finalization
{$IFNDEF FPC}
  TLoginCredentialService.UnregisterLoginHandler(TLoginCredentialService.DefaultUsrPw, TDefaultLoginCredentials.LoginEventUsrPw);
  TLoginCredentialService.UnregisterLoginHandler(TLoginCredentialService.DefaultUsrPwDm, TDefaultLoginCredentials.LoginEvent);
  TLoginCredentialService.UnregisterLoginHandler(TLoginCredentialService.Default, TDefaultLoginCredentials.LoginEventUsrPw);
{$ENDIF}
end.
