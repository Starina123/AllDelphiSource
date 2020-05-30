unit cfg_form;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IBInstallBindings, Menus, ExtCtrls;

type

  TForm1 = class(TForm)
    ListOptions: TListBox;
    btNext: TButton;
    MainMenu1: TMainMenu;
    btPrev: TButton;
    Label6: TLabel;
    btAddStuff: TButton;
    ListCommit: TListBox;
    edInstallPath: TEdit;
    lbStep: TLabel;
    lbInstall: TLabel;
    Bevel1: TBevel;
    btDone: TButton;
    edCFG: TEdit;
    Label1: TLabel;
    Shape1: TShape;
    btAddAll: TButton;
    btRmStuff: TButton;
    btRmAll: TButton;
    memInstruct: TMemo;
    Typical1: TMenuItem;
    ClientwithTools1: TMenuItem;
    client1: TMenuItem;
    ClientwoTools1: TMenuItem;
    procedure btNextClick(Sender: TObject);
    procedure btPrevClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btAddStuffClick(Sender: TObject);
    procedure Version1Click(Sender: TObject);
    procedure btDoneClick(Sender: TObject);
    procedure btAddAllClick(Sender: TObject);
    procedure btRmAllClick(Sender: TObject);
    procedure btRmStuffClick(Sender: TObject);
    procedure ClientwithTools1Click(Sender: TObject);
    procedure client1Click(Sender: TObject);
    procedure ClientwoTools1Click(Sender: TObject);
  private
    FState: Integer;              //Keep track of the state of the form...
    FItemsWritten: Integer;
    FFileName: String;
    FMemoPad: TStringList;        //used to store options that will be written to txt file
    FPrevCount: TList;            //Used for Prev ability... pop a prev count
                                  //out of list and remove that many entries from
                                  //the string list...

    //Clears ListOptions and writes the appropiate
    procedure StepOne;
    procedure DisplayState;
    procedure AddToMemoPad;    //Add lines from ListCommit to memo...
    procedure FinalizeForm;    //Sets form to finalize state...(hides some stuff)
    procedure UndoFilnalize;
    procedure DisableTypical;
  public
   // constructor Create(AOwner: TComponent); override;
    property State: Integer read FState write FState;
    property FileName: String read FFileName write FFileName;
    property ItemsWritten: Integer read FItemsWritten write FItemsWritten;

    procedure AddMainComponents;
    procedure AddCmmandTools;
    procedure AddExamples;
    procedure AddDrivers;
    procedure WriteConfig;
  end;


// Arrays of string to load into the ListBox
const
  // List of binaries available to install
  MainComp : Array[0..3] of String = ('IB_SERVER',
                                      'IB_CLIENT',
                                      'IB_DEV',
                                      'IB_DOC');


  //Shipped examples..
  Example : Array[0..2] of String = ('IB_EXAMPLES','IB_EXAMPLE_DB', 'IB_EXAMPLE_API');

  //List of command line tools
  CommandLineTool : Array[0..1] of String = ('IB_CMD_TOOLS',
                                             'IB_GUI_TOOLS');



var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.AddCmmandTools;
var
  itor : Integer;
begin
  with lbStep do
  begin
    Caption := 'Step 3...';
    Font.Color := clNavy;
  end;
  with memInstruct.Lines do
  begin
    Clear;
    Add('Select the command line tools you would like to install...');
  end;

  for itor := 0 to High(CommandLineTool) do
    ListOptions.Items.Add( CommandLineTool[ itor ] );
  
end;

procedure TForm1.AddDrivers;
begin
{  with lbStep do
  begin
    Caption := 'Step 5...';
    Font.Color := clpurple;
  end;
  with memInstruct.Lines do
  begin
    Clear;
    Add('Select the client drivers to install...');
  end;
  for itor := 0 to High(ClientDiver) do
    ListOptions.Items.Add( ClientDiver[ itor ] );
}
end;

procedure TForm1.AddExamples;
var
  itor: Integer;
begin
  with lbStep do
  begin
    Caption := 'Step 4...';
    Font.Color := clMaroon;
  end;
  with memInstruct.Lines do
  begin
    Clear;
    Add('Select the examples you would like to install...');
  end;
  for itor := 0 to High(Example) do
    ListOptions.Items.Add( Example[ itor ] );

end;

procedure TForm1.AddMainComponents;
var
  itor: Integer;
begin
  with lbStep do
  begin
    Caption := 'Step 2...';
    Font.Color := clOlive;
  end;
  with memInstruct.Lines do
  begin
    Clear;
    Add('Choose the main components you want to be installed...');
  end;
  for itor := 0 to High(MainComp) do
    ListOptions.Items.Add( MainComp[ itor ] );

end;

procedure TForm1.btNextClick(Sender: TObject);
begin
  State := State + 1;
  ItemsWritten := ListCommit.Items.Count;  //record number of entries to record
  FPrevCount.Add( Pointer(ItemsWritten) );
  AddToMemoPad;
  ListOptions.Items.Clear;
  ListCommit.Items.Clear;
  if not btPrev.Enabled then btPrev.Enabled := true;
  DisplayState;                           //change form content....
end;

procedure TForm1.btPrevClick(Sender: TObject);
var
  itor: Integer;
begin
  ListOptions.Clear;
  ListCommit.Clear;
  State := State - 1;
  if State <= 0 then
    btPrev.Enabled := false;

  if State = 3 then
    UndoFilnalize;

  with FPrevCount do begin
    // Remove itor number of entries from memo pad...
      for itor := 1 to Integer(Last) do
      begin
        if FMemoPad.Count > 0 then
          FMemoPad.Delete( FMemoPad.Count - 1 );
      end;
    //Pop off count record....
    FPrevCount.Delete( Count - 1 );
  end;
  DisplayState;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  State := 0;     //Set the intial state of the form to 0.
  FMemoPad := TStringList.Create;
  //Used to maintain state in the form...
  FPrevCount :=  TList.Create;
  with FMemoPad do
  begin
    Parent := Self;
    Visible := False;
    Add('[OPTIONS]');
  end;

  FileName := GetCurrentDir + '\ib_slnt.cfg';
  edCFG.Text := FileName;
  ItemsWritten := 0;
  StepOne;
end;

procedure TForm1.btAddStuffClick(Sender: TObject);
var
  itor: Integer;
begin
  with ListOptions do
  begin
    for itor := 0 to Items.Count - 1 do
      if Selected[itor] then
        ListCommit.Items.Add( Items[itor] );
    for itor := Items.Count - 1 downto 0 do
      if Selected[itor] then
        TStringList(Items).Delete( Itor );
  end;
end;

procedure TForm1.Version1Click(Sender: TObject);
begin
  ShowMessage('I did this...');
end;

procedure TForm1.btDoneClick(Sender: TObject);
begin
  if btDone.Caption = 'Cancel' then
    Close
  else
    WriteConfig;
end;

procedure TForm1.WriteConfig;
begin
  with FMemoPad do
  begin
    Add('[INPATH]');
    Add( edInstallPath.Text );
    SaveToFile( FileName );
  end;
  Close;
end;

procedure TForm1.AddToMemoPad;
var
  itor: Integer;
begin
  // Store items in ListCommit to string list...
  for itor := 0 to ItemsWritten - 1 do
    FMemoPad.Add( ListCommit.Items[ itor ] );
end;



procedure TForm1.FinalizeForm;
begin
    btAddStuff.Visible := false;
    btAddAll.Visible := false;
    btRmStuff.Visible := false;
    btRmAll.Visible := false;
    btNext.Enabled := false;
    btDone.Font.Style := [fsBold];
    Label6.Visible := false;

    ListOptions.Visible := false;
    ListCommit.Visible := false;
    btDone.Caption := 'Finish';
    lbStep.Caption := 'Seems cool...';
    lbStep.Font.Color := clRed;
    memInstruct.Lines.clear;
    memInstruct.Lines.Add('Click on Finish to write the configuration file.');
end;

procedure TForm1.btAddAllClick(Sender: TObject);
var
  itor: Integer;
begin
  with ListOptions do
  begin
    for itor := 0 to Items.Count - 1 do
      ListCommit.Items.Add( Items[itor] );
    Clear;
  end;
end;

procedure TForm1.btRmAllClick(Sender: TObject);
var
  itor: Integer;
begin
  with ListCommit do
  begin
    for itor := 0 to Items.Count - 1 do
      ListOptions.Items.Add( Items[itor] );
    Clear;
  end;
end;

procedure TForm1.btRmStuffClick(Sender: TObject);
var
  itor: Integer;
begin
  with ListCommit do
  begin
    for itor := 0 to Items.Count - 1 do
      if Selected[itor] then
        ListOptions.Items.Add( Items[itor] );
    for itor := Items.Count - 1 downto 0 do
      if Selected[itor] then
        TStringList(Items).Delete( Itor );
  end;
end;

procedure TForm1.DisplayState;
begin
  //different states to be in...
  case State of
    0:  StepOne;
    1:  AddMainComponents;
    2:  AddCmmandTools;
    3:  AddExamples;
    4:  FinalizeForm;
  else
    ShowMessage('ZOINKS!!! This shouldn''t make it here');
  end;
end;

procedure TForm1.StepOne;
begin
  lbStep.Caption := 'Step 1...';
  with memInstruct.Lines do
  begin
    Clear;
    Add('Edit installation directory for Interbase and location for config'
        + ' file.');
    Add('Default is set to C:\Program Files\Interbase\Bin');
  end;
  ListOptions.Items.Clear;
  btPrev.Enabled := false;
end;

procedure TForm1.UndoFilnalize;
begin
    btAddStuff.Visible := True;
    btAddAll.Visible := True;
    btRmStuff.Visible := True;
    btRmAll.Visible := True;
    btNext.Enabled := True;
    btDone.Font.Style := [];
    Label6.Visible := True;
    ListOptions.Visible := True;
    ListCommit.Visible := True;
    btDone.Caption := 'Cancel';
    memInstruct.Lines.clear;
end;

procedure TForm1.ClientwithTools1Click(Sender: TObject);
begin
  with FMemoPad do
  begin
    Clear;
    Add( '[OPTIONS]' );
    Add( 'IB_SERVER' );
    Add( 'IB_CLIENT' );
    Add( 'IB_DEV' );
    Add( 'IB_CMD_TOOLS' );
    Add( 'IB_GUI_TOOLS' );
    Add( 'IB_DOC' );
    Add( 'IB_EXAMPLES' );
  end;
  State := 4;
  ItemsWritten := 7;
  FPrevCount.Add( Pointer(ItemsWritten) );
  DisableTypical;
  DisplayState;
end;

procedure TForm1.client1Click(Sender: TObject);
begin
  with FMemopad do
  begin
    Clear;
    Add( '[OPTIONS]');
    Add( 'IB_CLIENT');
    Add( 'IB_CMD_TOOLS' );
    Add( 'IB_GUI_TOOLS' );
  end;
  State := 4;
  ItemsWritten := 1;
  FPrevCount.Add( Pointer(ItemsWritten) );
  DisableTypical;
  DisplayState;
end;

procedure TForm1.ClientwoTools1Click(Sender: TObject);
begin
  with FMemopad do
  begin
    Clear;
    Add('[OPTIONS]');
    Add('IB_CLIENT');
  end;
  State := 4;
  ItemsWritten := 1;
  FPrevCount.Add( Pointer(ItemsWritten) );
  DisableTypical;
  DisplayState;
end;

procedure TForm1.DisableTypical;
var
  itor: Integer;
begin
  with MainMenu1.Items[0] do
    for itor := 0 to Count - 1 do
      Items[itor].Enabled := false;
end;

end.
