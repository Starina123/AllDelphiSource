
unit Dlg;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, ToolIntf, ComCtrls;

type

  { These are the set of flags which determine the type of dialog to create }
  TDlgAttr = (daNothing, daMultPg, daBtnsH, daBtnsV);
  TDlgAttrs = set of TDlgAttr;

  TDlgExpert = class(TForm)
    Sample: TPaintBox;
    CancelBtn: TButton;
    PrevButton: TButton;
    NextButton: TButton;
    PageControl: TPageControl;
    Style: TTabSheet;
    Label1: TLabel;
    rbSinglePage: TRadioButton;
    rbMultPg: TRadioButton;
    Pages: TTabSheet;
    Label3: TLabel;
    PageNames: TMemo;
    Buttons: TTabSheet;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    rbBtnsV: TRadioButton;
    rbBtnsH: TRadioButton;
    procedure SamplePaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure StyleClick(Sender: TObject);
    procedure BtnClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure PrevClick(Sender: TObject);
    procedure NextClick(Sender: TObject);
  private
    { Private declarations }
    Definition: TDlgAttrs;
    DrawBitmap: TBitmap;
    SourceBuffer: PChar;
    procedure RefreshButtons;
    procedure FmtWrite(Stream: TStream; Fmt: PChar; const Args: array of const);
    function DoFormCreation(const FormIdent: string): TForm;
    function CreateSource(const UnitIdent, FormIdent: string): TMemoryStream;
    function CreateForm(const FormIdent: string): TMemoryStream;
  public
    { Public declarations }
  end;

procedure DialogExpert(ToolServices: TIToolServices);
var
  DlgExpert: TDlgExpert;

implementation

uses Proxies, VirtIntf, IStreams, ExConst;

{$R *.DFM}

const
  { page numbers }
  pgStyle       = 0;  { multi vs. single page dialog }
  pgPages       = 1;  { page names }
  pgButtons     = 2;  { button layouts }

  SourceBufferSize = 1024;


{ TDlgExpert }

{ Paint the sample pane based on the currently selected options }
procedure TDlgExpert.SamplePaint(Sender: TObject);
var
  X, Y: Integer;
begin
  { always paint the background dialog }
  DrawBitmap.Handle := CreateGrayMappedRes(HInstance, 'DIALOG');
  Sample.Canvas.Draw(0, 0, DrawBitmap);

  if daMultPg in Definition then
  begin
    DrawBitmap.Handle := CreateGrayMappedRes(HInstance, 'MULTPG');
    Sample.Canvas.Draw(4, 16, DrawBitmap);
  end;

  if daBtnsV in Definition then
  begin
    DrawBitmap.Handle := CreateGrayMappedRes(HInstance, 'BTNSV');
    X := 75;
    Y := 22;

    if daMultPg in Definition then
    begin
      Dec(X, 2);
      Inc(Y, 4);
    end;

    Sample.Canvas.Draw(X, Y, DrawBitmap);
  end;

  if daBtnsH in Definition then
  begin
    DrawBitmap.Handle := CreateGrayMappedRes(HInstance, 'BTNSH');
    X := 50;
    Y := 55;

    if daMultPg in Definition then Dec(Y, 4);

    Sample.Canvas.Draw(X, Y, DrawBitmap);
  end;
end;

procedure TDlgExpert.FormCreate(Sender: TObject);
begin
  DrawBitmap := TBitmap.Create;
  PrevClick(Self);
  RefreshButtons;
end;

procedure TDlgExpert.FormDestroy(Sender: TObject);
begin
  DrawBitmap.Free;
end;

procedure TDlgExpert.StyleClick(Sender: TObject);
begin
  if rbMultPg.Checked then Include(Definition, daMultPg)
  else Exclude(Definition, daMultPg);
  SamplePaint(Self);
end;

procedure TDlgExpert.BtnClick(Sender: TObject);
begin
  if rbBtnsV.Checked then Include(Definition, daBtnsV)
  else Exclude(Definition, daBtnsV);
  if rbBtnsH.Checked then Include(Definition, daBtnsH)
  else Exclude(Definition, daBtnsH);
  SamplePaint(Self);
end;

procedure TDlgExpert.CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TDlgExpert.PrevClick(Sender: TObject);
begin
  case PageControl.ActivePage.PageIndex of
    pgStyle: Exit;
    pgPages: PageControl.ActivePage := PageControl.Pages[pgStyle];
    pgButtons: if (daMultPg in Definition) then
      PageControl.ActivePage := PageControl.Pages[pgPages]
      else PageControl.ActivePage := PageControl.Pages[pgStyle];
  end;
  RefreshButtons;
end;

procedure TDlgExpert.NextClick(Sender: TObject);
begin
  case PageControl.ActivePage.PageIndex of
    pgStyle: if (daMultPg in Definition) then
      PageControl.ActivePage := PageControl.Pages[pgPages]
      else PageControl.ActivePage := PageControl.Pages[pgButtons];
    pgPages: PageControl.ActivePage := PageControl.Pages[pgButtons];
    pgButtons:
      begin
        ModalResult := mrOK;
        Exit;
      end;
  end;
  RefreshButtons;
end;

procedure TDlgExpert.RefreshButtons;
begin
  PrevButton.Enabled := PageControl.ActivePage.PageIndex > 0;
  if PageControl.ActivePage.PageIndex = pgButtons then
    NextButton.Caption := LoadStr(sFinish)
  else
    NextButton.Caption := LoadStr(sNext);
end;

{ Create the dialog defined by the user }
function TDlgExpert.DoFormCreation(const FormIdent: string): TForm;
var
  BtnPos: TPoint;
  PgCtrl: TPageControl;
  I: Integer;
begin
  Result := TForm.Create(nil);
  Proxies.CreateSubClass(Result, 'T' + FormIdent, TForm);
  with Result do
  begin
    BorderStyle := bsDialog;
    Width := 400;
    Height := 250;
    Position := poScreenCenter;
    Name := FormIdent;
    Caption := FormIdent;

    { create controls }
    if daMultPg in Definition then
    begin
      PgCtrl := TPageControl.Create(Result);
      with PgCtrl do
      begin
        Parent := Result;
        Name := 'PageControl1';
        Align := alClient;
      end;

      if PageNames.Lines.Count > 0 then
        for I := 0 to PageNames.Lines.Count - 1 do
          with TTabSheet.Create(Result) do
          begin
            PageControl := PgCtrl;
            Caption := PageNames.Lines[I];
            Name := Format('TabSheet%d', [I + 1]);
          end;
    end;

    if (daBtnsH in Definition) or (daBtnsV in Definition) then
    begin

      { get the starting point for the buttons }
      if daBtnsH in Definition then
        BtnPos := Point(ClientWidth - (77 * 3) - (5 * 3),
          ClientHeight - 27 - 5)
      else
        BtnPos := Point(ClientWidth - 77 - 5, 30);

      { finalize positions }
      if daMultPg in Definition then
      begin
        Dec(BtnPos.X, 5);
        if daBtnsV in Definition then Inc(BtnPos.Y, 5)
        else Dec(BtnPos.Y, 5);
      end;

      { OK }
      with TButton.Create(Result) do
      begin
        Parent := Result;
        Left := BtnPos.X;
        Top := BtnPos.Y;
        Height := 25;
        Width := 75;
        Caption := LoadStr(sOKButton);
        Name := 'Button1';
        Default := True;
        ModalResult := mrOk;
      end;

      { move the next button position }
      if daBtnsH in Definition then Inc(BtnPos.X, 75 + 5)
      else Inc(BtnPos.Y, 25 + 5);

      { Cancel }
      with TButton.Create(Result) do
      begin
        Parent := Result;
        Left := BtnPos.X;
        Top := BtnPos.Y;
        Height := 25;
        Width := 75;
        Name := 'Button2';
        Caption := LoadStr(sCancelButton);
        Cancel := True;
        ModalResult := mrCancel;
      end;

      { move the next button position }
      if daBtnsH in Definition then Inc(BtnPos.X, 75 + 5)
      else Inc(BtnPos.Y, 25 + 5);

      { Help }
      with TButton.Create(Result) do
      begin
        Parent := Result;
        Left := BtnPos.X;
        Top := BtnPos.Y;
        Height := 25;
        Width := 75;
        Name := 'Button3';
        Caption := LoadStr(sHelpButton);
      end;
    end;
  end;
end;

procedure TDlgExpert.FmtWrite(Stream: TStream; Fmt: PChar;
  const Args: array of const);
begin
  if (Stream <> nil) and (SourceBuffer <> nil) then
  begin
    StrLFmt(SourceBuffer, SourceBufferSize, Fmt, Args);
    Stream.Write(SourceBuffer[0], StrLen(SourceBuffer));
  end;
end;

function TDlgExpert.CreateSource(const UnitIdent, FormIdent: string): TMemoryStream;
const
  CRLF = #13#10;
var
  I: Integer;
begin
  SourceBuffer := StrAlloc(SourceBufferSize);
  try
    Result := TMemoryStream.Create;
    try

      { unit header and uses clause }
      FmtWrite(Result,
        'unit %s;' + CRLF + CRLF +
        'interface' + CRLF + CRLF +
        'uses'#13#10 +
        '  SysUtils, Windows, Messages, Classes, Graphics, Controls,'#13#10 +
        '  StdCtrls, ExtCtrls, Forms', [UnitIdent]);

      { additional units that may be needed }
      if daMultPg in Definition then FmtWrite(Result, ', ComCtrls', [nil]);

      FmtWrite(Result, ';' + CRLF + CRLF, [nil]);

      { begin the class declaration }
      FmtWrite(Result,
        'type'#13#10 +
        '  T%s = class(TForm)'#13#10, [FormIdent]);

      { add variable declarations }
      if (daBtnsH in Definition) or (daBtnsV in Definition) then
      begin
        FmtWrite(Result,
          '    Button1: TButton;' + CRLF +
          '    Button2: TButton;' + CRLF +
          '    Button3: TButton;' + CRLF, [nil]);
       end;

      if daMultPg in Definition then
      begin
        FmtWrite(Result, '    PageControl1: TPageControl;' + CRLF, [nil]);
        if PageNames.Lines.Count > 0 then
          for I := 0 to PageNames.Lines.Count - 1 do
            FmtWrite(Result, '    TabSheet%d: TTabSheet;'#13#10, [I + 1]);
      end;

      FmtWrite(Result,
        '  end;' + CRLF + CRLF +
        'var' + CRLF +
        '  %s: T%s;' + CRLF + CRLF +
        'implementation' + CRLF + CRLF +
        '{$R *.DFM}' + CRLF + CRLF, [FormIdent, FormIdent]);

      FmtWrite(Result, 'end.' + CRLF, [nil]);
      Result.Position := 0;

    except
      Result.Free;
      raise;
    end;

  finally
    StrDispose(SourceBuffer);
  end;
end;

function TDlgExpert.CreateForm(const FormIdent: string): TMemoryStream;
var
  DlgForm: TForm;
begin
  DlgForm := DoFormCreation(FormIdent);
  try
    Result := TMemoryStream.Create;
    Result.WriteComponentRes(FormIdent, DlgForm);
    Result.Position := 0;
  finally
    DlgForm.Free;
  end;
end;

procedure DialogExpert(ToolServices: TIToolServices);
var
  D: TDlgExpert;
  SourceStream, FormStream: TIMemoryStream;
  UnitIdent, FormIdent: string;
  FileName: string;
begin
  if ToolServices = nil then Exit;
  if ToolServices.GetNewModuleName(UnitIdent, FileName) then
  begin
    D := TDlgExpert.Create(Application);
    try
      if D.ShowModal = mrOK then
      begin
        UnitIdent := AnsiLowerCase(UnitIdent);
        UnitIdent[1] := Upcase(UnitIdent[1]);
        FormIdent := 'Form' + Copy(UnitIdent, 5, 255);
        FormStream := TIMemoryStream.Create(D.CreateForm(FormIdent));
        SourceStream := TIMemoryStream.Create(D.CreateSource(UnitIdent,
          FormIdent));
        ToolServices.CreateModule(FileName, SourceStream, FormStream,
          [cmAddToProject, cmShowSource, cmShowForm, cmUnNamed,
          cmMarkModified]);
      end;
    finally
      D.Free;
    end;
  end;
end;

end.

