unit Filter1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DB;

type
  TfmFilterFrm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Label3: TLabel;
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    cbCaseSensitive: TCheckBox;
    cbNoPartialCompare: TCheckBox;
    ComboBox1: TComboBox;
    Label4: TLabel;
    BtnApplyFilter: TButton;
    BtnClear: TButton;
    BtnClose: TButton;
    procedure AddFieldName(Sender: TObject);
    procedure ListBox2DblClick(Sender: TObject);
    procedure ApplyFilter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure cbCaseSensitiveClick(Sender: TObject);
    procedure cbNoPartialCompareClick(Sender: TObject);
    procedure SBtnClearClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SBtnCloseClick(Sender: TObject);
  end;

var
  fmFilterFrm: TfmFilterFrm;

implementation

uses DM, CustView;

{$R *.dfm}

{ Adds current listbox field name to memo. }
procedure TfmFilterFrm.AddFieldName(Sender: TObject);
begin
  if Memo1.Text <> '' then
    Memo1.Text := Memo1.Text + ' ';
  Memo1.Text := Memo1.Text + ListBox1.Items[ListBox1.ItemIndex];
end;

{ Adds current Filter operator to memo. }
procedure TfmFilterFrm.ListBox2DblClick(Sender: TObject);
begin
  if Memo1.Text <> '' then
    Memo1.Text := Memo1.Text + ' '+ ListBox2.Items[ListBox2.ItemIndex];
end;

procedure TfmFilterFrm.ApplyFilter(Sender: TObject);
begin
  with DM1.CustomerSource.Dataset do
  begin
    if ComboBox1.Text <> '' then
    begin
      Filter := ComboBox1.Text;
      Filtered := True;
      fmCustView.Caption := 'Customers - Filtered';
    end
    else begin
      Filter := '';
      Filtered := False;
      fmCustView.Caption := 'Customers - Unfiltered'
    end;
  end;
end;

{ Populate the ListBox1 with available fields from the Customer Dataset. }
procedure TfmFilterFrm.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to DM1.CustomerSource.Dataset.FieldCount - 1 do
    ListBox1.Items.Add(DM1.Customer.Fields[I].FieldName);

  { Add date dependent Query ComboBox1. }
  ComboBox1.Items.Add('LastInvoiceDate >= ''' +
    DateToStr(EncodeDate(1994, 09, 30)) + '''');
  ComboBox1.Items.Add('Country = ''US'' and LastInvoiceDate > ''' +
    DateToStr(EncodeDate(1994, 06, 30)) + '''');
end;

{ Since the Filter property is a TStrings and the Memo field
  is a TMemo, convert the Memo's wrapped text to a string,
  which is then used when the user presses Apply. }
procedure TfmFilterFrm.Memo1Change(Sender: TObject);
var
 I: Integer;
begin
  ComboBox1.Text := Memo1.Lines[0];
  for I := 1 to Memo1.Lines.Count - 1 do
    ComboBox1.Text := ComboBox1.Text + ' ' + Memo1.Lines[I];
end;

{ Set the Customer's Dataset Case Sensitive Filter Option. }
procedure TfmFilterFrm.cbCaseSensitiveClick(Sender: TObject);
begin
  with DM1.CustomerSource.Dataset do
    if cbCaseSensitive.checked then
      FilterOptions := FilterOptions - [foCaseInSensitive]
    else
      FilterOptions := FilterOptions + [foCaseInsensitive];
end;

{ Set the Customer Partial Compare Filter Option. }
procedure TfmFilterFrm.cbNoPartialCompareClick(Sender: TObject);
begin
  with DM1.CustomerSource.Dataset do
    if cbNoPartialCompare.checked then
      FilterOptions := FilterOptions + [foNoPartialCompare]
    else
      FilterOptions := FilterOptions - [foNoPartialCompare];
end;

{ Add User-Entered filters into list box at runtime. }
procedure TfmFilterFrm.SBtnClearClick(Sender: TObject);
var
  st: string;
begin
  Memo1.Lines.Clear;
  st := ComboBox1.Text;
  ComboBox1.Text := '';
  if ComboBox1.Items.IndexOf(st) = -1 then
    ComboBox1.Items.Add(st);
end;

{ Reset the Memo field when the Filter ComboBox changes. }
procedure TfmFilterFrm.ComboBox1Change(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add(ComboBox1.Text);
end;

{ Close the Filter Form. }
procedure TfmFilterFrm.SBtnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
