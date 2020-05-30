
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{       Copyright (c) 1995, 1999 Inprise Corporation    }
{                                                       }
{*******************************************************}

unit CDSEdit;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, DB, DBClient, DsgnIntf;

type
  TClientDataForm = class(TForm)
    GroupBox1: TGroupBox;
    DataSetList: TListBox;
    OkBtn: TButton;
    CancelBtn: TButton;
    HelpBtn: TButton;
    procedure FormCreate(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
    procedure HelpBtnClick(Sender: TObject);
    procedure DataSetListDblClick(Sender: TObject);
    procedure DataSetListKeyPress(Sender: TObject; var Key: Char);
  private
    FDataSet: TClientDataSet;
    FDesigner: IFormDesigner;
    procedure CheckComponent(const Value: string);
    function Edit: Boolean;
  end;

function EditClientDataSet(ADataSet: TClientDataSet; ADesigner: IFormDesigner): Boolean;
function LoadFromFile(ADataSet: TClientDataSet): Boolean;
procedure SaveToFile(ADataSet: TClientDataSet);

implementation

uses DsnDBCst, TypInfo, LibHelp, DBConsts, Consts, Provider;

{$R *.DFM}

function EditClientDataSet(ADataSet: TClientDataSet; ADesigner: IFormDesigner): Boolean;
begin
  with TClientDataForm.Create(Application) do
  try
    Caption := Format(SClientDataSetEditor, [ADataSet.Owner.Name, DotSep, ADataSet.Name]);
    FDataSet := ADataSet;
    FDesigner := ADesigner;
    Result := Edit;
  finally
    Free;
  end;
end;

function LoadFromFile(ADataSet: TClientDataSet): Boolean;
begin
  with TOpenDialog.Create(nil) do
  try
    Title := sOpenFileTitle;
    DefaultExt := 'cds';
    Filter := SClientDataFilter;
    Result := Execute;
    if Result then ADataSet.LoadFromFile(FileName);
  finally
    Free;
  end;
end;

procedure SaveToFile(ADataSet: TClientDataSet);
begin
  with TSaveDialog.Create(nil) do
  try
    Options := [ofOverwritePrompt];
    DefaultExt := 'cds';
    Filter := SClientDataFilter;
    if Execute then ADataSet.SaveToFile(FileName);
  finally
    Free;
  end;
end;

procedure TClientDataForm.CheckComponent(const Value: string);
var
  DataSet: TDataSet;
begin
  DataSet := TDataSet(FDesigner.GetComponent(Value));
  if (DataSet.Owner <> FDataSet.Owner) then
    DataSetList.Items.Add(Concat(DataSet.Owner.Name, '.', DataSet.Name))
  else
    if AnsiCompareText(DataSet.Name, FDataSet.Name) <> 0 then
      DataSetList.Items.Add(DataSet.Name);
end;

function TClientDataForm.Edit: Boolean;
begin
  DataSetList.Clear;
  FDesigner.GetComponentNames(GetTypeData(TDataSet.ClassInfo), CheckComponent);
  if DataSetList.Items.Count > 0 then
  begin
    DataSetList.Enabled := True;
    DataSetList.ItemIndex := 0;
    OkBtn.Enabled := True;
    ActiveControl := DataSetList;
  end else
    ActiveControl := CancelBtn;
  Result := ShowModal = mrOK;
end;

procedure TClientDataForm.OkBtnClick(Sender: TObject);
var
  DataSet: TDataSet;
  DSProv: TDataSetProvider;
begin
  try
    if DataSetList.ItemIndex >= 0 then
    begin
      Screen.Cursor := crHourGlass;
      try
        with DataSetList do
          DataSet := FDesigner.GetComponent(Items[ItemIndex]) as TDataSet;
        if (DataSet is TClientDataSet) then
          FDataSet.Data := TClientDataSet(DataSet).Data
        else
        begin
          DSProv := TDataSetProvider.Create(nil);
          try
            DSProv.DataSet := DataSet;
            FDataSet.Data := DSProv.Data
          finally
            DSProv.Free;
          end;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end
    else
      FDataSet.Data := varNull;
  except
    ModalResult := mrNone;
    raise;
  end;
end;

procedure TClientDataForm.FormCreate(Sender: TObject);
begin
  HelpContext := hcDAssignClientData;
end;

procedure TClientDataForm.HelpBtnClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

procedure TClientDataForm.DataSetListDblClick(Sender: TObject);
begin
  if OkBtn.Enabled then OkBtn.Click;
end;

procedure TClientDataForm.DataSetListKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and OkBtn.Enabled then OkBtn.Click;
end;

end.
