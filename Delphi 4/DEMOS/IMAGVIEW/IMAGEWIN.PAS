unit ImageWin;

interface

uses Windows, Classes, Graphics, Forms, Controls,
  FileCtrl, StdCtrls, ExtCtrls, Buttons, Spin, ComCtrls;

type
  TImageForm = class(TForm)
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    FileEdit: TEdit;
    UpDownGroup: TGroupBox;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    DisabledGrp: TGroupBox;
    SpeedButton2: TSpeedButton;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Image1: TImage;
    FileListBox1: TFileListBox;
    Label2: TLabel;
    ViewBtn: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    FilterComboBox1: TFilterComboBox;
    GlyphCheck: TCheckBox;
    StretchCheck: TCheckBox;
    UpDownEdit: TEdit;
    UpDown1: TUpDown;
    procedure FileListBox1Click(Sender: TObject);
    procedure ViewBtnClick(Sender: TObject);
    procedure ViewAsGlyph(const FileExt: string);
    procedure GlyphCheckClick(Sender: TObject);
    procedure StretchCheckClick(Sender: TObject);
    procedure FileEditKeyPress(Sender: TObject; var Key: Char);
    procedure UpDownEditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FormCaption: string;    
  end;

var
  ImageForm: TImageForm;

implementation

uses ViewWin, SysUtils;

{$R *.DFM}

procedure TImageForm.FileListBox1Click(Sender: TObject);
var
  FileExt: string[4];
begin
  FileExt := AnsiUpperCase(ExtractFileExt(FileListBox1.Filename));
  if (FileExt = '.BMP') or (FileExt = '.ICO') or (FileExt = '.WMF') or
    (FileExt = '.EMF') then
  begin
    Image1.Picture.LoadFromFile(FileListBox1.Filename);
    Caption := FormCaption + ExtractFilename(FileListBox1.Filename);
    if (FileExt = '.BMP') then
    begin
      Caption := Caption + 
        Format(' (%d x %d)', [Image1.Picture.Width, Image1.Picture.Height]);
      ViewForm.Image1.Picture := Image1.Picture;
      ViewForm.Caption := Caption;
      if GlyphCheck.Checked then ViewAsGlyph(FileExt);
    end
    else
      GlyphCheck.Checked := False;
    if FileExt = '.ICO' then Icon := Image1.Picture.Icon;
    if (FileExt = '.WMF') or (FileExt = '.EMF') then 
      ViewForm.Image1.Picture.Metafile := Image1.Picture.Metafile;
  end;
end;

procedure TImageForm.GlyphCheckClick(Sender: TObject);
begin
  ViewAsGlyph(AnsiUpperCase(ExtractFileExt(FileListBox1.Filename)));
end;

procedure TImageForm.ViewAsGlyph(const FileExt: string);
begin
  if GlyphCheck.Checked and (FileExt = '.BMP') then 
  begin
    SpeedButton1.Glyph := Image1.Picture.Bitmap;
    SpeedButton2.Glyph := Image1.Picture.Bitmap;
    UpDown1.Position := SpeedButton1.NumGlyphs;
    BitBtn1.Glyph := Image1.Picture.Bitmap;
    BitBtn2.Glyph := Image1.Picture.Bitmap;
    UpDown1.Enabled := True;
    UpDownEdit.Enabled := True;
    Label2.Enabled := True;
  end
  else begin
    SpeedButton1.Glyph := nil;
    SpeedButton2.Glyph := nil;
    BitBtn1.Glyph := nil;
    BitBtn2.Glyph := nil;
    UpDown1.Enabled := False;
    UpDownEdit.Enabled := False;
    Label2.Enabled := False;
  end;
end;

procedure TImageForm.ViewBtnClick(Sender: TObject);
begin
  ViewForm.HorzScrollBar.Range := Image1.Picture.Width;
  ViewForm.VertScrollBar.Range := Image1.Picture.Height;
  ViewForm.Caption := Caption;
  ViewForm.Show;
  ViewForm.WindowState := wsNormal;
end;

procedure TImageForm.UpDownEditChange(Sender: TObject);
begin
  SpeedButton1.NumGlyphs := UpDown1.Position;
  SpeedButton2.NumGlyphs := UpDown1.Position;
end;

procedure TImageForm.StretchCheckClick(Sender: TObject);
begin
  Image1.Stretch := StretchCheck.Checked;
end;

procedure TImageForm.FileEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then 
  begin
    FileListBox1.ApplyFilePath(FileEdit.Text);
    Key := #0;
  end;
end;

procedure TImageForm.FormCreate(Sender: TObject);
begin
  FormCaption := Caption + ' - ';
end;

end.
