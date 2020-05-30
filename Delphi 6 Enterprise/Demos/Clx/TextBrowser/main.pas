unit main;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QComCtrls, QStdCtrls, QExtCtrls, QButtons;

type
  TTextBrowserForm = class(TForm)
    HomeBtn: TButton;
    BackBtn: TButton;
    ForwardBtn: TButton;
    TextBrowser: TTextBrowser;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label1: TLabel;
    LinkSourceEdit: TEdit;
    ReloadBtn: TButton;
    GroupBox2: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioGroup1: TRadioGroup;
    UnderlineCheckbox: TCheckBox;
    StatusBar: TStatusBar;
    SpeedButton1: TSpeedButton;
    procedure HomeBtnClick(Sender: TObject);
    procedure TextBrowserTextChanged(Sender: TObject);
    procedure BackBtnClick(Sender: TObject);
    procedure ForwardBtnClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure LinkSourceEditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ReloadBtnClick(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure UnderlineCheckboxClick(Sender: TObject);
    procedure TextBrowserHighlightText(Sender: TObject;
      const HighlightedText: WideString);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    PathList: TStrings;
  public
    { Public declarations }
  end;

var
  TextBrowserForm: TTextBrowserForm;

implementation

{$R *.xfm}

const
  DefaultDocName = 'index.html';
  FormCaption = 'TTextBrowser Demo Application - ';

procedure TTextBrowserForm.FormCreate(Sender: TObject);
begin
  PathList := TStringList.Create;
  LinkSourceEdit.Text := ExtractFilePath(Application.ExeName);
  TextBrowser.FileName := LinkSourceEdit.Text + DefaultDocName;
  UnderlineCheckbox.Checked := not TextBrowser.UnderlineLink;
end;

procedure TTextBrowserForm.HomeBtnClick(Sender: TObject);
begin
  TextBrowser.Home;
end;

procedure TTextBrowserForm.TextBrowserTextChanged(Sender: TObject);
begin
  BackBtn.Enabled := TextBrowser.CanGoBackward;
  ForwardBtn.Enabled := TextBrowser.CanGoForward;
  Caption := FormCaption + TextBrowser.DocumentTitle;
end;

procedure TTextBrowserForm.BackBtnClick(Sender: TObject);
begin
  TextBrowser.Backward;
end;

procedure TTextBrowserForm.ForwardBtnClick(Sender: TObject);
begin
  TextBrowser.Forward;
end;

procedure TTextBrowserForm.RadioButton1Click(Sender: TObject);
begin
  TextBrowser.LinkColor := clBlue;
end;

procedure TTextBrowserForm.RadioButton2Click(Sender: TObject);
begin
  TextBrowser.LinkColor := clRed;
end;

procedure TTextBrowserForm.LinkSourceEditChange(Sender: TObject);
begin
  PathList.Add(LinkSourceEdit.Text);
  TextBrowser.Factory.FilePath := PathList;
end;


procedure TTextBrowserForm.FormDestroy(Sender: TObject);
begin
  PathList.Free;
end;

procedure TTextBrowserForm.ReloadBtnClick(Sender: TObject);
begin
  TextBrowser.LoadFromFile(TextBrowser.FileName);
end;

procedure TTextBrowserForm.RadioButton3Click(Sender: TObject);
begin
  TextBrowser.TextColor := clBlack;
end;

procedure TTextBrowserForm.RadioButton4Click(Sender: TObject);
begin
  TextBrowser.TextColor := clGreen;
end;

procedure TTextBrowserForm.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0: TextBrowser.TextFormat := tfText;
    1: TextBrowser.TextFormat := tfPlainText;
  end;
end;

procedure TTextBrowserForm.UnderlineCheckboxClick(Sender: TObject);
begin
  TextBrowser.UnderlineLink := not TextBrowser.UnderlineLink;
end;

procedure TTextBrowserForm.TextBrowserHighlightText(Sender: TObject;
  const HighlightedText: WideString);
begin
  StatusBar.SimpleText := 'Link To: ' + HighlightedText;
end;

procedure TTextBrowserForm.SpeedButton1Click(Sender: TObject);
var
  NewDir: string;
begin
  if SelectDirectory('Select a Directory', '', NewDir) then
    LinkSourceEdit.Text := NewDir;
end;

end.

