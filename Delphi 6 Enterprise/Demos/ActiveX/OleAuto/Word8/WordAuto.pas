unit WordAuto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    LaunchButton: TButton;
    CloseButton: TButton;
    Memo1: TMemo;
    NewDocButton: TButton;
    TypeTextButton: TButton;
    WordText: TEdit;
    Label1: TLabel;
    procedure LaunchButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure NewDocButtonClick(Sender: TObject);
    procedure TypeTextButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private Declarations }
    procedure AppQuit(Sender: TObject);
    procedure AppDocumentChange(Sender: TObject);
    procedure DocNew(Sender: TObject);
    procedure DocOpen(Sender: TObject);
    procedure DocClose(Sender: TObject);
  public
    { Public Declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  AutoImpl;

var
  WordObject : TWordObject;

procedure TForm1.LaunchButtonClick(Sender: TObject);
begin
  if not Assigned(WordObject) then begin
    WordObject := TWordObject.Create;
    with WordObject do begin
      Caption := 'Delphi is RAD!';
      Visible := True;
      OnQuit := AppQuit;
      OnDocumentChange := AppDocumentChange;
      OnNewDocument := DocNew;
      OnOpenDocument := DocOpen;
      OnCloseDocument := DocClose;
    end;
    LaunchButton.Enabled := False;
    CloseButton.Enabled := True;
    NewDocButton.Enabled := True;
  end;
end;

procedure TForm1.CloseButtonClick(Sender: TObject);
begin
  if Assigned(WordObject) then begin
    LaunchButton.Enabled := True;
    CloseButton.Enabled := False;
    NewDocButton.Enabled := False;
    TypeTextButton.Enabled := False;
    WordObject.Free;
    WordObject := nil;
  end;
end;

procedure TForm1.AppDocumentChange(Sender: TObject);
begin
  Memo1.Lines.Add('Document changed');
  TypeTextButton.Enabled := WordObject.Application.Documents.Count > 0;
end;

procedure TForm1.AppQuit(Sender: TObject);
begin
  Memo1.Lines.Add('Quitting Word');
  WordObject.Free;
  WordObject := nil;
  LaunchButton.Enabled := True;
  CloseButton.Enabled := False;
  NewDocButton.Enabled := False;
  TypeTextButton.Enabled := False;
end;

procedure TForm1.DocNew(Sender: TObject);
begin
  Memo1.Lines.Add('New document');
end;

procedure TForm1.DocOpen(Sender: TObject);
begin
  Memo1.Lines.Add('Document opened');
end;

procedure TForm1.DocClose(Sender: TObject);
begin
  Memo1.Lines.Add('Document closed');
end;

procedure TForm1.NewDocButtonClick(Sender: TObject);
begin
  try
    WordObject.NewDoc('');
  except
    ShowMessage('It seems like somebody killed Word and didn''t tell me about it...');
    if Assigned(WordObject) then begin
      LaunchButton.Enabled := True;
      CloseButton.Enabled := False;
      NewDocButton.Enabled := False;
      TypeTextButton.Enabled := False;
      WordObject.Free;
      WordObject := nil;
    end;
  end;
end;

procedure TForm1.TypeTextButtonClick(Sender: TObject);
begin
  WordObject.InsertText(WordText.Text);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(WordObject) then begin
    WordObject.Free;
    WordObject := nil;
  end;
end;

end.

