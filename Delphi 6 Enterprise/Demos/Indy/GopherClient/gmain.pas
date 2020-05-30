{***************************************************************
 *
 * Project  : GopherClient
 * Unit Name: gmain
 * Purpose  :
 * Version  : 1.0
 * Date  : Wed 25 Apr 2001  -  01:16:22
 * Author  : <unknown>
 * History  :
 * Tested  : Wed 25 Apr 2001  // Allen O'Neill <allen_oneill@hotmail.com>
 *
 ****************************************************************}

unit gmain;

interface

uses
  {$IFDEF Linux}
  QGraphics, QControls, QForms, QDialogs, QComCtrls, QStdCtrls, QExtCtrls,
  {$ELSE}
  windows, messages, graphics, controls, forms, dialogs, comctrls, extctrls, stdctrls,
  {$ENDIF}
  SysUtils, Classes, IdComponent, IdTCPConnection, IdTCPClient, IdGopher,
  IdBaseComponent;

type
  TfrmGopher = class(TForm)
  idDemoGopher: TIdGopher;
  lvGopherMenu: TListView;
  Panel1: TPanel;
  lblGopherServer: TLabel;
  lblSelector: TLabel;
  edtGopherServer: TEdit;
  edtSelector: TEdit;
  Button1: TButton;
  procedure lvGopherMenuDblClick(Sender: TObject);
  procedure Button1Click(Sender: TObject);
  private
  procedure GetMenu(Selector : String);
  procedure GetTextFile(Selector : String);
  {This procedure get's the item as appropriate}
  procedure GetItem (Selector : String; ItemType : Char );
  procedure AddMenuItem( item : TIdGopherMenuItem );
  public
  end;

var
  frmGopher: TfrmGopher;

implementation
{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

uses
  IdGopherConsts, textview;

procedure TfrmGopher.AddMenuItem(item: TIdGopherMenuItem);
var ListItem : TListItem;
begin
  ListItem := lvGopherMenu.Items.Add;
  {Gopher Title}
  ListItem.Caption := item.Title;
  {Item Type}
  {SubItems[0]}
  case item.ItemType of
  IdGopherItem_Document : ListItem.SubItems.Add ('Text File');
  IdGopherItem_Directory : ListItem.SubItems.Add ('Gopher Menu');
  IdGopherItem_CSO : ListItem.SubItems.Add ( 'Phone Book' );
  IdGopherItem_Error : ListItem.SubItems.Add ('Error' );
  IdGopherItem_BinHex : ListItem.SubItems.Add ( 'BinHex file' );
  IdGopherItem_BinDOS : ListItem.SubItems.Add ( 'DOS Binary' );
  IdGopherItem_UUE : ListItem.SubItems.Add ( 'UUEncoded File' );
  IdGopherItem_Search : ListItem.SubItems.Add ( 'Gopher Search' );
  IdGopherItem_Telnet : ListItem.SubItems.Add ( 'Te;met Session' );
  IdGopherItem_Binary : ListItem.SubItems.Add ( 'Binary File' );
  IdGopherItem_Redundant : ListItem.SubItems.Add ('Redundant File ');
  IdGopherItem_TN3270 : ListItem.SubItems.Add ( 'TN3270 session ');
  IdGopherItem_GIF : ListItem.SubItems.Add ( 'GIF File' );
  {Image file can be reported as ":" or "I"}
  IdGopherItem_Image,
  IdGopherItem_Image2 : ListItem.SubItems.Add ( 'Image' );
  IdGopherItem_Sound : ListItem.SubItems.Add ( 'Sound' );
  IdGopherItem_Movie : ListItem.SubItems.Add ( 'Movie' );
  IdGopherItem_HTML : ListItem.SubItems.Add ( 'World-Wide-Web link' );
  IdGopherItem_MIME : ListItem.SubItems.Add ( 'Mime encoded file' );
  IdGopherItem_Information : ListItem.SubItems.Add ( 'Information' );
  else
  ListItem.SubItems.Add(' Type "'+ item.ItemType +'" not regnized');
  end;
  {we put the ItemType here for storage as it is important when we retreive it
  or process it.  This is not displayed}
  {SubItems[1] - ItemType}
  ListItem.SubItems.Add ( item.ItemType );
  {SubItems[2] - Host}
  ListItem.SUbItems.Add ( item.Server );
  {SubItems[3] - Selector}
  ListItem.SubItems.Add ( item.Selector );
  {SubItems[4] - Port}
  ListItem.SubItems.Add ( IntToStr ( item.Port ) );
end;

procedure TfrmGopher.GetItem (Selector : String; ItemType : Char );

begin
  case ItemType of
  IdGopherItem_Document : GetTextFile(Selector);
  IdGopherItem_Directory : GetMenu(Selector);
{
For IdGopherItem_Search, prompt the user for a search string and set the
TIdGopher property Querry and use the TIdGopher.Search method to get a Gopher
menu of results.

For these, just download the File with the GetFile method
  IdGopherItem_BinHex,
  IdGopherItem_BinDOS,
  IdGopherItem_UUE,
  IdGopherItem_Binary,
  IdGopherItem_GIF,
  IdGopherItem_Image,
  IdGopherItem_Sound,
  IdGopherItem_Movie,
  IdGopherItem_MIME

For this one, I suggest, just launching a URL composed of
  http:// TGopherItem.Host + ':' + TGopherItem.Port + '/'+TGopherItem.Selector
  IdGopherItem_HTML

For IdGopherItem_TN3270 and IdGopherItem_Telnet, just lunch the appropriate
  application with a URL such as TGopherMenuItem.Host + ':' + TGopherItem.Port
  but display a hint to the user which is in TGopherItem.Selector

For IdGopherItem_CSO, there is no support here and I doubt that there is a user
has such a program.


  }

  end;
end;

procedure TfrmGopher.GetMenu(Selector : String);
var Mnu : TIdGopherMenu;
  idx : Integer;
begin
  { We HAVE to free Mnu which is created by idDemoGopher }
  Mnu := idDemoGopher.GetMenu(Selector);
  try
  {update Gopher Menu}
  lvGopherMenu.Items.Clear;
  idx := 0;
  while idx < Mnu.Count do
  begin
  AddMenuItem ( Mnu [ idx ] );
  Inc ( idx );
  end; //while idx < Mnu.Count do
  edtGopherServer.Text := idDemoGopher.Host;
  edtSelector.Text := Selector;
  finally
  FreeAndNil ( mnu );
  end; //try..finally
end;

procedure TfrmGopher.GetTextFile;
var FileStream : TMemoryStream;
  Dia : TfrmTextView;
begin
  FileStream := TMemoryStream.Create;
  try
  {This gets the file }
  idDemoGopher.GetTextFile(Selector, FileStream);
  dia := TfrmTextView.Create ( Application );
  try
  FileStream.Seek(0,0);
  dia.mmoTextFile.Lines.LoadFromStream ( FileStream );
  dia.ShowModal;
  finally
  FreeAndNil ( dia );
  end;
  finally
  {We have to fee the stream we create}
  FreeAndNil ( FileStream );
  {it's a good idea to set an object reference to nil when the object is freed}
  end;
end;

procedure TfrmGopher.lvGopherMenuDblClick(Sender: TObject);
begin
  if lvGopherMenu.Selected <> nil then
  begin
  {SubItems[2]= host}
  idDemoGopher.Host := lvGopherMenu.Selected.SubItems[ 2 ];
  {SubItems[4] - Port}
  idDemoGopher.Port := StrToInt ( lvGopherMenu.Selected.SubItems[ 4 ] );
  { SubItems[3] - Selector }
  { SubItems[1] - ItemType }
  GetItem ( lvGopherMenu.Selected.SubItems[3],lvGopherMenu.Selected.SubItems[1][1] );
  end;  //if Selected <> nil then
end;

procedure TfrmGopher.Button1Click(Sender: TObject);
begin
  idDemoGopher.Host := edtGopherServer.Text;
  {we'll asume that it's a menu when a user types it in}
  GetItem ( edtSelector.Text, IdGopherItem_Directory );
end;

end.
