
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{       Generic SQL Property Editor                     }
{                                                       }
{       Copyright (c) 1999 Inprise Corporation          }
{                                                       }
{*******************************************************}

unit SQLEdit;

interface

uses Windows, Messages, ActiveX, SysUtils, Forms, Classes, Controls, Graphics,
  StdCtrls, ExtCtrls;

type

  TExecuteEvent = procedure of Object;

  TPopulateThread = class(TThread)
  private
    FExecuteEvent: TExecuteEvent;
  public
    constructor Create(ExecuteEvent: TExecuteEvent);
    procedure Execute; override;
  end;

  TGetTableNamesProc = procedure(List: TStrings; SystemTables: Boolean) of object;
  TGetFieldNamesProc = procedure(const TableName: string; List: TStrings) of Object;

  TSQLEditForm = class(TForm)
    OkButton: TButton;
    HelpButton: TButton;
    CancelButton: TButton;
    AddFieldButton: TButton;
    AddTableButton: TButton;
    SQLLabel: TLabel;
    FieldListLabel: TLabel;
    TableListLabel: TLabel;
    TopPanel: TPanel;
    ButtonPanel: TPanel;
    FieldsPanel: TPanel;
    MetaInfoPanel: TPanel;
    TableListPanel: TPanel;
    TableFieldsSplitter: TSplitter;
    MetaInfoSQLSplitter: TSplitter;
    SQLMemo: TMemo;
    Image1: TImage;
    TableList: TListBox;
    FieldList: TListBox;
    procedure FormShow(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
    procedure TableFieldsSplitterCanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure MetaInfoSQLSplitterCanResize(Sender: TObject;
      var NewSize: Integer; var Accept: Boolean);
    procedure MetaInfoSQLSplitterMoved(Sender: TObject);
    procedure TableListClick(Sender: TObject);
    procedure AddTableButtonClick(Sender: TObject);
    procedure AddFieldButtonClick(Sender: TObject);
    procedure SQLMemoExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SQLMemoEnter(Sender: TObject);
  private
    CharHeight: Integer;
    FPopulateThread: TPopulateThread;
    GetTableNames: TGetTableNamesProc;
    GetFieldNames: TGetFieldNamesProc;
    SQLCanvas: TControlCanvas;
    procedure InsertText(Text: string; AddComma: Boolean = True);
    procedure DrawCaretPosIndicator;
    procedure PopulateTableList;
    procedure PopulateFieldList;
  end;

function EditSQL(var SQL: string; AGetTableNames: TGetTableNamesProc;
  AGetFieldNames: TGetFieldNamesProc): Boolean; overload;

function EditSQL(SQL: TStrings; AGetTableNames: TGetTableNamesProc;
  AGetFieldNames: TGetFieldNamesProc): Boolean; overload;


implementation

{$R *.DFM}

uses LibHelp;

const
  SSelect = 'select'; { Do not localize }
  SFrom = 'from'; { Do not localize }

function EditSQL(var SQL: string; AGetTableNames: TGetTableNamesProc;
  AGetFieldNames: TGetFieldNamesProc): Boolean;
begin
  with TSQLEditForm.Create(nil) do
  try
    GetTableNames := AGetTableNames;
    GetFieldNames := AGetFieldNames;
    SQLMemo.Lines.Text := SQL;
    Result := ShowModal = mrOK;
    if Result then
      SQL := SQLMemo.Lines.Text;
  finally
    Free;
  end;
end;

function EditSQL(SQL: TStrings; AGetTableNames: TGetTableNamesProc;
  AGetFieldNames: TGetFieldNamesProc): Boolean; overload;
var
  SQLText: string;
begin
  SQLText := SQL.Text;
  Result := EditSQL(SQLText, AGetTableNames, AGetFieldNames);
  if Result then
    SQL.Text := SQLText;
end;


procedure TSQLEditForm.FormShow(Sender: TObject);
begin
  HelpContext := hcDADOSQLEdit;
  SQLCanvas := TControlCanvas.Create;
  SQLCanvas.Control := SQLMemo;
  CharHeight := SQLCanvas.TextHeight('0');
  FPopulateThread := TPopulateThread.Create(PopulateTableList);
end;

procedure TSQLEditForm.FormDestroy(Sender: TObject);
begin
  if Assigned(FPopulateThread) then
  begin
    FPopulateThread.Terminate;
    FPopulateThread.WaitFor;
    FPopulateThread.Free;
  end;
  SQLCanvas.Free;
end;

procedure TSQLEditForm.HelpButtonClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

procedure TSQLEditForm.PopulateTableList;
begin
  if @GetTableNames = nil then Exit;
  try
    GetTableNames(TableList.Items, False);
    if FPopulateThread.Terminated then Exit;
    if TableList.Items.Count > 0 then
    begin
      TableList.ItemIndex := 0;
      TableListClick(nil);
    end;
  except
  end;
end;

procedure TSQLEditForm.TableFieldsSplitterCanResize(Sender: TObject;
  var NewSize: Integer; var Accept: Boolean);
begin
  Accept := (NewSize > 44) and (NewSize < (MetaInfoPanel.Height - 65));
end;

procedure TSQLEditForm.MetaInfoSQLSplitterCanResize(Sender: TObject;
  var NewSize: Integer; var Accept: Boolean);
begin
  Accept := (NewSize > 100) and (NewSize < (ClientWidth - 100));
end;

procedure TSQLEditForm.MetaInfoSQLSplitterMoved(Sender: TObject);
begin
  SQLLabel.Left := SQLMemo.Left;
end;

procedure TSQLEditForm.PopulateFieldList;
begin
  if @GetFieldNames = nil then Exit;
  try
    GetFieldNames(TableList.Items[TableList.ItemIndex], FieldList.Items);
    FieldList.Items.Insert(0, '*');
  except
  end;
end;

procedure TSQLEditForm.TableListClick(Sender: TObject);
begin
  PopulateFieldList;
end;

procedure TSQLEditForm.InsertText(Text: string; AddComma: Boolean = True);
var
  StartSave: Integer;
  S: string;
begin
  S := SQLMemo.Text;
  StartSave := SQLMemo.SelStart;
  if (S <> '') and (StartSave > 0) and not (S[StartSave] in [' ','(']) and
    not (Text[1] = ' ') then
  begin
    if AddComma and (S[StartSave] <> ',') then
      Text := ', '+Text else
      Text := ' ' + Text;
  end;
  System.Insert(Text, S, StartSave+1);
  SQLMemo.Text := S;
  SQLMemo.SelStart := StartSave + Length(Text);
  SQLMemo.Update;
  DrawCaretPosIndicator;
end;

procedure TSQLEditForm.AddTableButtonClick(Sender: TObject);
var
  TableName,
  SQLText: string;
  Blank: Boolean;
begin
  if TableList.ItemIndex > -1 then
  begin
    SQLText := SQLMemo.Text;
    TableName := TableList.Items[TableList.ItemIndex];
    Blank := SQLText = '';
    if Blank or (Copy(SQLText, 1, 6) = SSelect) then
      InsertText(Format(' %s %s', [SFrom, TableName]), False)
    else
      InsertText(TableName, False);
    if Blank then
    begin
      SQLMemo.SelStart := 0;
      SQLMemo.Update;
      InsertText(SSelect+' ', False);
    end;
  end;
end;

procedure TSQLEditForm.AddFieldButtonClick(Sender: TObject);
var
  I: Integer;
begin
  if FieldList.ItemIndex > -1 then
  begin
    { Help the user and assume this is a select if starting with nothing }
    if SQLMemo.Text = '' then
    begin
      SQLMemo.Text := SSelect;
      SQLMemo.SelStart := Length(SQLMemo.Text);
    end;
    for I := 0 to FieldList.Items.Count - 1 do
      if FieldList.Selected[I] then
        InsertText(FieldList.Items[I], (SQLMemo.Text <> SSelect) and (FieldList.Items[I] <> '*'));
  end;
end;

procedure TSQLEditForm.SQLMemoExit(Sender: TObject);
begin
  DrawCaretPosIndicator;
end;

procedure TSQLEditForm.SQLMemoEnter(Sender: TObject);
begin
  { Erase the CaretPos indicator }
  SQLMemo.Invalidate;
end;

procedure TSQLEditForm.DrawCaretPosIndicator;
var
  XPos, YPos: Integer;
begin
  with SQLMemo.CaretPos do
  begin
    YPos := (Y+1)*CharHeight;
    XPos := SQLCanvas.TextWidth(Copy(SQLMemo.Lines[Y], 1, X)) - 3 ;
    SQLCanvas.Draw(XPos ,YPos, Image1.Picture.Graphic);
  end;
end;

{ TPopulateThread }

constructor TPopulateThread.Create(ExecuteEvent: TExecuteEvent);
begin
  FExecuteEvent := ExecuteEvent;
  inherited Create(False);
end;

procedure TPopulateThread.Execute;
begin
  CoInitialize(nil);
  try
    FExecuteEvent;
  except
  end;
  CoUninitialize;
end;

end.
