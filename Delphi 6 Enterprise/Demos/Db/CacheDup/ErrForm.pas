unit ErrForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DB, DBTables;

type
  TUpdateErrorForm = class(TForm)
    ErrorText: TLabel;
    UpdateType: TLabel;
    UpdateData: TStringGrid;
    SkipButton: TButton;
    RetryButton: TButton;
    AbortButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure UpdateDataSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
  private
    FDataFields: TStringList;
    procedure GetFieldValues(DataSet: TDataSet);
    procedure SetFieldValues(DataSet: TDataSet);
  public
    function HandleError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind): TUpdateAction;
  end;

var
  UpdateErrorForm: TUpdateErrorForm;

implementation

{$R *.dfm}

uses Variants;

{ Public and Private Methods }

{ This method handles the error by displaying a dialog with information about
  the error and then allowing the user to decide what course of action to take }

function TUpdateErrorForm.HandleError(DataSet: TDataSet; E: EDatabaseError;
  UpdateKind: TUpdateKind): TUpdateAction;
const
  UpdateKindStr: array[TUpdateKind] of string = ('Modified', 'Inserted',
    'Deleted');
begin
  { Put the error context information into the labels on the form }
  UpdateType.Caption := UpdateKindStr[UpdateKind];
  ErrorText.Caption := E.Message;
  { Fill the string grid with the update field values }
  GetFieldValues(DataSet);
  ShowModal;
  case ModalResult of
    mrRetry:
      begin
        { If user wants to retry, then put any changed values from the
          string grid back into the associated field's NewValue property }
        SetFieldValues(DataSet);
        Result := uaRetry;
      end;
    mrIgnore:
      Result := uaSkip;
    else
      Result := uaAbort;
  end;
end;

{ This fills in the string grid with data from the record being updated }

procedure TUpdateErrorForm.GetFieldValues(DataSet: TDataSet);
var
  I: Integer;
  F: TField;
begin
  { Create a list of the data fields in the dataset, and store them in
    a stringlist which we can use to determine which values the user
    has edited }

  FDataFields.Clear;
  for I := 0 to DataSet.FieldCount - 1 do
    with Dataset.Fields[I] do
      if (FieldKind = fkData) then
        FDataFields.AddObject('', DataSet.Fields[I]);

  { Now fill up the string grid with the Old and New values of each field.
    OldValue and NewValue are public properties of TDataSet which are used
    from within the OnUpdateError event handler to determine what data a
    user has updated.  We use the VarToStr RTL function to ensure that null
    fields are displayed as blank strings }

  UpdateData.RowCount := FDataFields.Count + 1;
  for I := 0 to FDataFields.Count - 1 do
  begin
    F := TField(FDataFields.Objects[I]);
    UpdateData.Cells[0, I + 1] := VarToStr(F.NewValue);
    UpdateData.Cells[1, I + 1] := VarToStr(F.OldValue);
  end;
end;

procedure TUpdateErrorForm.SetFieldValues(DataSet: TDataSet);
var
  I: Integer;
  F: TField;
begin
  for I := 0 to FDataFields.Count - 1 do
    { We set the string in the data field list to '*' for any fields the
      user edited in the string grid.  Those are the only fields we need
      to write back into the associated TField's NewValue property }
    if FDataFields[I] = '*' then
    begin
      F := TField(FDataFields.Objects[I]);
      F.NewValue := UpdateData.Cells[0, I + 1];
    end;
end;

{ Event handlers }

procedure TUpdateErrorForm.FormCreate(Sender: TObject);
begin
  FDataFields := TStringList.Create;
  { Fill in the titles of the string grid }
  UpdateData.Cells[0,0] := 'New Value';
  UpdateData.Cells[1,0] := 'Old Value';
end;

procedure TUpdateErrorForm.FormDestroy(Sender: TObject);
begin
  FDataFields.Free;
end;

procedure TUpdateErrorForm.UpdateDataSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: string);
begin
  { Set a flag in the list of datafields indicating that this value
    was changed. }
  FDataFields[ARow - 1] := '*';
end;

end.
