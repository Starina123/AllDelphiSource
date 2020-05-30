unit PackBriefFormU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, StdCtrls, Grids, DBGrids, ComCtrls, ActnList;

type
  TPackBriefForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBGridNotPacked: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    NotPackedDataSet: TClientDataSet;
    DataSource1: TDataSource;
    PackedDataSet: TClientDataSet;
    DataSource2: TDataSource;
    DBGridPacked: TDBGrid;
    FilterDataSet: TClientDataSet;
    ActionList1: TActionList;
    PackAction: TAction;
    PackAllAction: TAction;
    NotPackedAction: TAction;
    NotPackedAllAction: TAction;
    Button5: TButton;
    Button6: TButton;
    OKAction: TAction;
    CustomerTreeDataSet: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure NotPackedDataSetFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure PackedDataSetFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure PackActionExecute(Sender: TObject);
    procedure NotPackedActionExecute(Sender: TObject);
    procedure Resync;
    procedure PackAllActionExecute(Sender: TObject);
    procedure NotPackedAllActionExecute(Sender: TObject);
    procedure PackActionUpdate(Sender: TObject);
    procedure NotPackedActionUpdate(Sender: TObject);
    procedure PackRecord;
    procedure NotPackRecord;
    procedure OKActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PackBriefForm: TPackBriefForm;

implementation

uses ClientDataModuleU;

{$R *.DFM}

procedure TPackBriefForm.FormCreate(Sender: TObject);
begin
  ClientDataModule.GetCustomersList;
  PackedDataSet.CloneCursor(ClientDataModule.CustomerListDataSet, False, True);
  NotPackedDataSet.CloneCursor(ClientDataModule.CustomerListDataSet, False, True);
  FilterDataSet.FieldDefs.Assign(ClientDataModule.CustomerListDataSet.FieldDefs);
  FilterDataSet.CreateDataSet;
  //FilterDataSet.EmptyDataSet;
  //FilterDataSet.Active := True;
  try
    CustomerTreeDataSet.LoadFromFile('custtree');
    with CustomerTreeDataSet do
    begin
      First;
      while not EOF do
      begin
        FilterDataSet.AppendRecord([FieldByName('CustNo').AsInteger,
          FieldByName('Company').AsString]);
         Next;
      end;
    end;
  except
  end;
  PackedDataSet.OnFilterRecord := PackedDataSetFilterRecord;
  PackedDataSet.Active := True;
  PackedDataSet.Filtered := True;
  NotPackedDataSet.OnFilterRecord := NotPackedDataSetFilterRecord;
  NotPackedDataSet.Active := True;
  NotPackedDataSet.Filtered := True;
end;

procedure TPackBriefForm.NotPackedDataSetFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := not FilterDataSet.Active or not FilterDataSet.Locate('CustNo', DataSet.FieldByName('CustNo').AsInteger, []);
end;

procedure TPackBriefForm.PackedDataSetFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := FilterDataSet.Active and FilterDataSet.Locate('CustNo', DataSet.FieldByName('CustNo').AsInteger, []);
end;

procedure TPackBriefForm.PackActionExecute(Sender: TObject);
var
  i: Integer;
begin
  with NotPackedDataSet do
  begin
    if DBGridNotPacked.SelectedRows.Count = 0 then
      PackRecord
    else
      for i := 0 to DBGridNotPacked.SelectedRows.Count - 1 do
      begin
        Bookmark := DBGridNotPacked.SelectedRows.Items[i];
        PackRecord;
      end;
  end;
  Resync;
end;

procedure TPackBriefForm.NotPackedActionExecute(Sender: TObject);
var
  i: Integer;
begin
  with PackedDataSet do
  begin
    if DBGridPacked.SelectedRows.Count = 0 then
      NotPackRecord
    else
      for i := 0 to DBGridPacked.SelectedRows.Count - 1 do
      begin
        Bookmark := DBGridPacked.SelectedRows.Items[i];
        NotPackRecord;
      end;
  end;
  Resync;
end;

procedure TPackBriefForm.Resync;

  procedure ResyncDataSet(DS: TClientDataSet);
  var
    R: Integer;
  begin
    with DS do
    begin
      R := RecNo;
      Filtered := False;
      Filtered := True;
      if R <= RecordCount then
        RecNo := R
      else
        Last;
    end;
  end;
begin
  ResyncDataSet(PackedDataSet);
  DBGridNotPacked.SelectedRows.Clear;
  ResyncDataSet(NotpackedDataSet);
  DBGridPacked.SelectedRows.Clear;
end;

procedure TPackBriefForm.PackAllActionExecute(Sender: TObject);
begin
  with NotPackedDataSet do
  begin
    First;
    while not EOF do
    begin
      PackRecord;
      Next;
    end;
  end;
  Resync;
end;

procedure TPackBriefForm.NotPackedAllActionExecute(Sender: TObject);
begin
  with PackedDataSet do
  begin
    First;
    while not EOF do
    begin
      NotPackRecord;
      Next;
    end;
  end;
  Resync;
end;

procedure TPackBriefForm.PackActionUpdate(Sender: TObject);
begin
  PackAction.Enabled := NotPackedDataSet.RecordCount > 0;
end;

procedure TPackBriefForm.NotPackedActionUpdate(Sender: TObject);
begin
  NotPackedAction.Enabled := PackedDataSet.RecordCount > 0;
end;

procedure TPackBriefForm.PackRecord;
begin
  with NotPackedDataSet do
    if not FilterDataSet.Locate('CustNo', FieldByName('CustNo').AsInteger, []) then
      FilterDataSet.AppendRecord([FieldByName('CustNo').AsInteger,
          FieldByName('Company').AsString]);
end;

procedure TPackBriefForm.NotPackRecord;
begin
  with PackedDataSet do
    if FilterDataSet.Locate('CustNo', FieldByName('CustNo').AsInteger, []) then
      FilterDataSet.Delete;

end;

procedure TPackBriefForm.OKActionExecute(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try

    with CustomerTreeDataSet do
    begin
      Close;
    end;
    
    with PackedDataSet do
    begin
      First;
      while not EOF do
      begin
        ClientDataModule.AddCustomerToBriefcase(CustomerTreeDataSet,
          FieldByName('CustNo').AsInteger);
        Next;
      end;
    end;
    CustomerTreeDataSet.SaveToFile('custtree');
    ClientDataModule.GetPartsList;
    ClientDataModule.PartsListDataSet.SaveToFile('partlist');
  finally
    Screen.Cursor := crDefault;
  end;
  ModalResult := mrOk;
end;

end.
 