unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Db, DBTables, OleServer,
  Word97, clipbrd;

type
  TMainForm = class(TForm)
    DataSource: TDataSource;
    DBGrid: TDBGrid;
    DBNavigator: TDBNavigator;
    WordDocument: TWordDocument;
    DBImgFishImg: TDBImage;
    Table: TTable;
    BtnInsertRecord: TButton;
    WordApplication: TWordApplication;
    WordFont: TWordFont;
    ChkBoxNewDoc: TCheckBox;
    GroupBox: TGroupBox;
    lblFont: TLabel;
    Fonttype: TListBox;
    ChkBoxEmboss: TCheckBox;
    ChkBoxItalic: TCheckBox;
    ChkBoxBold: TCheckBox;
    ChkBoxUnderline: TCheckBox;
    ChkBoxEngrave: TCheckBox;
    ChkBoxShadow: TCheckBox;
    ChkBoxDoublestrike: TCheckBox;
    ChkBoxStrike: TCheckBox;
    Size: TEdit;
    lblFontSize: TLabel;
    btnCloseWord: TButton;
    BtnPrint: TButton;
    BtnPreview: TButton;
    GroupBox2: TGroupBox;
    lbDocs: TListBox;
    procedure BtnInsertRecordClick(Sender: TObject);
    procedure Form1Close(Sender: TObject; var Action: TCloseAction);
    procedure Form1Create(Sender: TObject);
    procedure Form1Activate(Sender: TObject);
    procedure btnCloseWordClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnPreviewClick(Sender: TObject);
    procedure WordApplicationDocumentChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses Variants;

{$R *.dfm}

procedure TMainForm.BtnInsertRecordClick(Sender: TObject);
var Template,NewTemplate,ItemIndex:OleVariant;

    procedure setfont;
    begin
      WordFont.ConnectTo(WordDocument.Sentences.Get_Last.Font);
      if ChkBoxUnderline.checked then WordFont.Underline := 2;
      if ChkBoxBold.checked then WordFont.Bold := 1;
      if ChkBoxItalic.Checked then WordFont.Italic := 1;
      if ChkBoxEmboss.Checked then WordFont.Emboss := 1;
      if ChkBoxEngrave.checked then WordFont.Engrave := 1;
      if ChkBoxShadow.checked then WordFont.shadow := 1;
      if ChkBoxDoublestrike.checked then WordFont.DoubleStrikeThrough := 1;
      if ChkBoxStrike.checked then WordFont.StrikeThrough := 1;
      WordFont.Size := StrToInt(Size.text);
      if Fonttype.Itemindex >= 0 then
         WordFont.Name := FontType.Items[FontType.Itemindex];
    end;

begin
  try
    Template := EmptyParam;
    NewTemplate := True;
    ItemIndex := 1;
    try
      Wordapplication.Connect;
    except
      MessageDlg('Word may not be installed', mtError, [mbOk], 0);
      Abort;
    end;
    Wordapplication.Visible := True;
    WordApplication.Caption := 'Delphi automation';
    {Create new document}
    Template := EmptyParam;
    NewTemplate := False;
    if ChkBoxNewDoc.Checked then
    begin
      WordApplication.Documents.Add(Template, NewTemplate);
      {Assign WordDocument component}
      WordDocument.ConnectTo(WordApplication.Documents.Item(ItemIndex));
    end;
    {Turn Spell checking of because it takes a long time if enabled and slows down Winword}
    WordApplication.Options.CheckSpellingAsYouType := False;
    WordApplication.Options.CheckGrammarAsYouType := False;
    {Insert data}
    DBImgFishImg.CopyToClipboard;
    WordDocument.Sentences.Last.Paste;
    WordDocument.Range.InsertAfter('Common Name: ' + Table.Fields.Fields[2].AsString + #13);
    SetFont;
    WordDocument.Range.InsertAfter('Species Name:' + Table.Fields.Fields[3].AsString + #13);
    WordDocument.Range.InsertAfter('Length: ' + Table.Fields.Fields[4].AsString + #13);
    WordDocument.Range.InsertAfter(' ' + #13);
    WordDocument.Range.InsertAfter(' ' + #13);
    WordDocument.Range.InsertAfter(' ' + #13);
    BtnCloseWord.Enabled := True;
    BtnPrint.Enabled := True;
    BtnPreview.Enabled := True;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      WordApplication.Disconnect;
    end;
  end;
end;

procedure TMainForm.Form1Close(Sender: TObject; var Action: TCloseAction);
begin
  Table.Close;
end;

procedure TMainForm.Form1Create(Sender: TObject);
begin
  Fonttype.Items := Screen.Fonts;
end;

procedure TMainForm.Form1Activate(Sender: TObject);
begin
  Table.Open;
end;

procedure TMainForm.btnCloseWordClick(Sender: TObject);
var
  SaveChanges,
  OriginalFormat,
  RouteDocument: OleVariant;
  
begin
  SaveChanges := WdDoNotSaveChanges;
  OriginalFormat := UnAssigned;
  RouteDocument := UnAssigned;
  try
    WordApplication.Quit(SaveChanges, OriginalFormat, RouteDocument);
    WordApplication.Disconnect;
    BtnCloseWord.Enabled := False;
    BtnPrint.Enabled := False;
    BtnPreview.Enabled := False;
  except
    on E: Exception do
    begin
      Showmessage(E.Message);
      WordApplication.Disconnect;
    end;
  end;
end;

procedure TMainForm.BtnPrintClick(Sender: TObject);
begin
  WordDocument.PrintOut;
end;

procedure TMainForm.BtnPreviewClick(Sender: TObject);
begin
  WordDocument.PrintPreview;
end;

procedure TMainForm.WordApplicationDocumentChange(Sender: TObject);
begin
  lbDocs.items.add(WordDocument.Name);
end;

end.
