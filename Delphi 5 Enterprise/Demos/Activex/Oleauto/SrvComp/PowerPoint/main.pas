unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, msppt8, OleServer, DBCtrls, ExtCtrls, Grids, DBGrids, Db,
  DBTables, office97, ComCtrls, ToolWin;

type
  TForm1 = class(TForm)
    PowerPointApplication1: TPowerPointApplication;
    PowerPointSlide1: TPowerPointSlide;
    PowerPointPresentation1: TPowerPointPresentation;
    Table1: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBImage1: TDBImage;
    ToolBar1: TToolBar;
    RunSlideShow: TToolButton;
    AddPresentation: TToolButton;
    ClosePPoint: TToolButton;
    StartPPoint: TToolButton;
    TV1: TTreeView;
    Label1: TLabel;
    AddSlide: TToolButton;
    procedure Form1Activate(Sender: TObject);
    procedure Form1Close(Sender: TObject; var Action: TCloseAction);
    procedure RunSlideShowClick(Sender: TObject);
    procedure AddPresentationClick(Sender: TObject);
    procedure ClosePPointClick(Sender: TObject);
    procedure StartPPointClick(Sender: TObject);
    procedure AddSlideClick(Sender: TObject);
  private
    SWindow:SlideShowWindow;
    TN:TTreeNode;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Form1Activate(Sender: TObject);
begin
  Table1.Open;
  TN := nil;
end;

procedure TForm1.Form1Close(Sender: TObject; var Action: TCloseAction);
begin
  Table1.Close;
end;

procedure TForm1.RunSlideShowClick(Sender: TObject);
var
  i: Integer;
  Found: Boolean;
  
begin
  Found := False;
  if (PowerPointApplication1.Presentations.Count > 0) and (TN <> nil) then
  begin
    for i := 1 to PowerPointApplication1.Presentations.Count do
    begin
      TN := TV1.Selected;
      {Get Parent node to find Presentation name in case a slide is selected}
      if TN.GetPrev <> nil then
        TN := TN.Parent;

      if PowerPointApplication1.Presentations.Item(i).Name = TN.Text then
      begin
        Found := True;
        Break;
      end;
    end;
    if Found then
    begin
      PowerPointPresentation1.ConnectTo(PowerPointApplication1.Presentations.Item(i));
      with PowerPointPresentation1 do
      begin
        SlideShowSettings.AdvanceMode := ppSlideShowUseSlideTimings;
        SlideShowSettings.LoopUntilStopped := msoTrue;
        SWindow := SlideShowSettings.Run;
        Form1.SetFocus;
      end;
    end
    else
      ShowMessage('Presentation ' + TN.Text + ' not found');
  end
  else
    Showmessage('No Presentations available');
end;

procedure TForm1.AddPresentationClick(Sender: TObject);
begin
  try
    AddSlide.Enabled := True;
    PowerPointPresentation1.ConnectTo(PowerPointApplication1.Presentations.Add(1));
    TN := TV1.Items.Insert(TN, PowerPointPresentation1.Name);
    TN.Selected := True;
    TV1.SetFocus;
  except
    on E: Exception do
      begin
        Showmessage(E.Message);
      end;
  end;
end;


procedure TForm1.ClosePPointClick(Sender: TObject);
begin
  PowerPointApplication1.Quit;
  PowerPointApplication1.Disconnect;
end;

procedure TForm1.StartPPointClick(Sender: TObject);
begin
  try
    try
      PowerPointApplication1.Connect;
    except on E: Exception do
      begin
        E.Message := 'PowerPoint does not appear to be installed';
        raise;
      end;
    end;
    PowerPointApplication1.Visible := 1;
    AddPresentation.Enabled := True;
    ClosePPoint.Enabled := True;
    Form1.SetFocus;
  except
    on E: Exception do
      begin
        Showmessage(E.Message);
        PowerPointApplication1.Disconnect;
      end;
  end;
end;

procedure TForm1.AddSlideClick(Sender: TObject);
begin
  PowerPointSlide1.ConnectTo(PowerPointPresentation1.Slides.Add(PowerPointPresentation1.Slides.Count + 1, 1));

  with PowerPointSlide1 do
  begin
    RunSlideShow.Enabled := True;
    {Select layout where a bitmap is in the left corner}
    Layout := 10;
    {Set background}
    FollowMasterBackground := 0;
    Background.Fill.PresetGradient(2, 2, 10);
    {Set text}
    Shapes.Item(1).TextFrame.TextRange.InsertAfter(Table1.Fieldbyname('Common_Name').AsString);
    Shapes.Item(2).TextFrame.TextRange.Font.Name := 'Arial';
    Shapes.Item(2).TextFrame.TextRange.InsertAfter('Category    : ' + Table1.FieldByName('Category').AsString + #13 +
                                                   'Species Name: ' + Table1.FieldByName('Species Name').AsString);
    {Add Image}
    DbImage1.CopyToClipboard;
    Shapes.Item(3).Delete;
    Shapes.Paste;
    Shapes.Item(3).Left := 100;
    Shapes.Item(3).Top := 180;
    Shapes.Item(3).Width := 150;
    Shapes.Item(3).Height := 150;
    {Set time displayed for each slide}
    SlideShowTransition.AdvanceOnTime := 1;
    SlideShowTransition.AdvanceTime := 2;
    Name := Table1.FieldByName('Common_Name').AsString + (IntToStr(PowerPointPresentation1.Slides.Count));
    TV1.Items.AddChild(TN, Name);
    TN.Selected;
    TV1.SetFocus;
  end;
end;

end.
