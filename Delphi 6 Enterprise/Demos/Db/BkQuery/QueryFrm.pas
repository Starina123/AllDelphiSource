{ Demostrates how to execute a query in a background thread.  This
  files contains the main user interface for this program.  The background
  query code is in ResltFrm }

unit QueryFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IniFiles, ExtCtrls, DBTables;

type
  TAdhocForm = class(TForm)
    AliasCombo: TComboBox;
    Label1: TLabel;
    QueryEdit: TMemo;
    Label2: TLabel;
    NameEdit: TEdit;
    PasswordEdit: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    ExecuteBtn: TButton;
    CloseBtn: TButton;
    SavedQueryCombo: TComboBox;
    Label5: TLabel;
    SaveBtn: TButton;
    SaveAsBtn: TButton;
    NewBtn: TButton;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure ExecuteBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure NewBtnClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure SaveAsBtnClick(Sender: TObject);
    procedure SavedQueryComboChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    QueryName, OldAlias: string;
    SavedQueries: TIniFile;
    Unnamed: Boolean;
    function IsModified: Boolean;
    function CheckModified: Boolean;
    procedure Unmodify;
    procedure ReadQuery;
    procedure SaveQuery;
    procedure SaveQueryAs;
  public
    { Public declarations }
  end;

var
  AdhocForm: TAdhocForm;

implementation

uses DB, ResltFrm, SaveQAs;

{$R *.dfm}

function StrToIniStr(const Str: string): string;
var
  Buffer: array[0..4095] of Char;
  B, S: PChar;
begin
  if Length(Str) > SizeOf(Buffer) then
    raise Exception.Create('String to large to save in INI file');
  S := PChar(Str);
  B := Buffer;
  while S^ <> #0 do
    case S^ of
      #13, #10:
        begin
          if (S^ = #13) and (S[1] = #10) then Inc(S)
          else if (S^ = #10) and (S[1] = #13) then Inc(S);
          B^ := '\';
          Inc(B);
          B^ := 'n';
          Inc(B);
          Inc(S);
        end;
    else
      B^ := S^;
      Inc(B);
      Inc(S);
    end;
  B^ := #0;
  Result := Buffer;
end;

function IniStrToStr(const Str: string): string;
var
  Buffer: array[0..4095] of Char;
  B, S: PChar;
begin
  if Length(Str) > SizeOf(Buffer) then
    raise Exception.Create('String to read from an INI file');
  S := PChar(Str);
  B := Buffer;
  while S^ <> #0 do
    if (S[0] = '\') and (S[1] = 'n') then
    begin
      B^ := #13;
      Inc(B);
      B^ := #10;
      Inc(B);
      Inc(S);
      Inc(S);
    end
    else
    begin
      B^ := S^;
      Inc(B);
      Inc(S);
    end;
  B^ := #0;
  Result := Buffer;
end;

function TAdhocForm.IsModified: Boolean;
begin
  Result := (AliasCombo.Text <> OldAlias) or NameEdit.Modified or
    QueryEdit.Modified;
end;

function TAdhocForm.CheckModified: Boolean;
begin
  Result := True;
  if IsModified then
    case MessageDlg(Format('Query %s modified, save?', [QueryName]),
      mtConfirmation, mbYesNoCancel, 0) of
      mrYes: SaveQuery;
      mrCancel: Result := False;
    end;
end;

procedure TAdhocForm.Unmodify;
begin
  OldAlias := AliasCombo.Text;
  NameEdit.Modified := False;
  QueryEdit.Modified := False;
end;

procedure TAdhocForm.ReadQuery;
begin
  if not CheckModified then Exit;
  with SavedQueries do
  begin
    QueryName := SavedQueryCombo.Items[SavedQueryCombo.ItemIndex];
    QueryEdit.Text := IniStrToStr(ReadString(QueryName, 'Query', ''));
    AliasCombo.Text := ReadString(QueryName, 'Alias', '');
    NameEdit.Text := ReadString(QueryName, 'Name', '');
  end;
  Unmodify;
  if Showing then
    if NameEdit.Text <> '' then
      PasswordEdit.SetFocus else
      QueryEdit.SetFocus;
end;

procedure TAdhocForm.SaveQueryAs;
begin
  if GetNewName(QueryName) then
  begin
    Unnamed := False;
    SaveQuery;
    with SavedQueryCombo, Items do
    begin
      if IndexOf(QueryName) < 0 then Add(QueryName);
      ItemIndex := IndexOf(QueryName);
    end;
  end;
end;

procedure TAdhocForm.SaveQuery;
begin
  if Unnamed then
    SaveQueryAs
  else
    with SavedQueries do
    begin
      WriteString(QueryName, 'Query', StrToIniStr(QueryEdit.Text));
      WriteString(QueryName, 'Alias', AliasCombo.Text);
      WriteString(QueryName, 'Name', NameEdit.Text);
      Unmodify;
    end;
end;

procedure TAdhocForm.FormCreate(Sender: TObject);
  procedure CreateInitialIni;
  const
    VeryInefficientName = 'IB: Very Inefficient Query';
    VeryInefficientQuery =
      'select EMP_NO, Avg(Salary) as Salary\n'+
      '  from employee, employee, employee\n' +
      '  group by EMP_NO';
    AmountDueName = 'DB: Amount Due By Customer';
    AmountDueByCustomer =
      'select Company, Sum(ItemsTotal) - Sum(AmountPaid) as AmountDue\n' +
      '  from customer, orders\n' +
      '  where Customer.CustNo = Orders.CustNo\n' +
      '  group by Company';
  begin
    { Create initial INI file when one doesn't already exisit }
    with SavedQueries do
    begin
      WriteString(VeryInefficientName, 'Query', VeryInefficientQuery);
      WriteString(VeryInefficientName, 'Alias', 'IBLOCAL');
      WriteString(VeryInefficientName, 'Name', 'SYSDBA');
      SavedQueryCombo.Items.Add(VeryInefficientName);
      WriteString(AmountDueName, 'Query', AmountDueByCustomer);
      WriteString(AmountDueName, 'Alias', 'DBDEMOS');
      WriteString(AmountDueName, 'Name', '');
      SavedQueryCombo.Items.Add(AmountDueName);
    end;
  end;


begin
  { Grab session aliases }
  Session.GetAliasNames(AliasCombo.Items);

  { Load in saved queries }
  SavedQueries := TIniFile.Create('BKQUERY.INI');
  SavedQueries.ReadSections(SavedQueryCombo.Items);
  if SavedQueryCombo.Items.Count <= 0 then CreateInitialIni;
  SavedQueryCombo.ItemIndex := 0;
  QueryName := SavedQueryCombo.Items[0];
  Unmodify;
  ReadQuery;
end;

procedure TAdhocForm.FormDestroy(Sender: TObject);
begin
  SavedQueries.Free;
end;

procedure TAdhocForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TAdhocForm.ExecuteBtnClick(Sender: TObject);
begin
  BackgroundQuery(QueryName, AliasCombo.Text, NameEdit.Text, PasswordEdit.Text,
    QueryEdit.Text);
  BringToFront;
end;

procedure TAdhocForm.NewBtnClick(Sender: TObject);

  function UniqueName: string;
  var
    I: Integer;
  begin
    I := 1;
    repeat
      Result := Format('Query%d', [I]);
      Inc(I);
    until SavedQueryCombo.Items.IndexOf(Result) < 0;
  end;

begin
  AliasCombo.Text := 'DBDEMOS';
  NameEdit.Text := '';
  PasswordEdit.Text := '';
  QueryEdit.Text := '';
  QueryEdit.SetFocus;
  QueryName := UniqueName;
  SavedQueryCombo.ItemIndex := -1;
  Unnamed := True;
end;

procedure TAdhocForm.SaveBtnClick(Sender: TObject);
begin
  SaveQuery;
end;

procedure TAdhocForm.SaveAsBtnClick(Sender: TObject);
begin
  SaveQueryAs;
end;

procedure TAdhocForm.SavedQueryComboChange(Sender: TObject);
begin
  ReadQuery;
end;

procedure TAdhocForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := CheckModified;
end;

end.
