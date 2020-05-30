{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{       Copyright (c) 1995,99 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit DBReg;

interface

uses
  SysUtils, Classes, DsgnIntf, DSDesign;

type
  TDBStringProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValueList(List: TStrings); virtual;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  TDataFieldProperty = class(TDBStringProperty)
  public
    function GetDataSourcePropName: string; virtual;
    procedure GetValueList(List: TStrings); override;
  end;

  TDataFieldAggProperty = class(TDBStringProperty)
  public
    function GetDataSourcePropName: string; virtual;
    procedure GetValueList(List: TStrings); override;
  end;

  TDataSetEditor = class(TComponentEditor)
  protected
    function GetDSDesignerClass: TDSDesignerClass; virtual;
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  TIndexFieldNamesProperty = class(TDBStringProperty)
  public
    procedure GetValueList(List: TStrings); override;
  end;

  TIndexNameProperty = class(TDBStringProperty)
  public
    procedure GetValueList(List: TStrings); override;
  end;

procedure Register;

implementation

uses
  Windows, Controls, Forms, Mask, TypInfo, DBConsts, DsnDBCst, DB, DBCtrls,
  DBGrids, DBCGrids, FileCtrl, ColnEdit, DBColnEd, FldLinks,
  ActiveX, MaskProp, MaskText, ActnList, DBActns, DbOleCtl, DbOleEdt,
  DBActRes;

{ Utility Functions }

function GetPropertyValue(Instance: TPersistent; const PropName: string): TPersistent;
var
  PropInfo: PPropInfo;
begin
  Result := nil;
  PropInfo := TypInfo.GetPropInfo(Instance.ClassInfo, PropName);
  if (PropInfo <> nil) and (PropInfo^.PropType^.Kind = tkClass) then
    Result := TObject(GetOrdProp(Instance, PropInfo)) as TPersistent;
end;

{ TDataSetEditor }

function TDataSetEditor.GetDSDesignerClass: TDSDesignerClass;
begin
  Result := TDSDesigner;
end;

procedure TDataSetEditor.ExecuteVerb(Index: Integer);
begin
  if Index = 0 then
    ShowFieldsEditor(Designer, TDataSet(Component), GetDSDesignerClass);
end;

function TDataSetEditor.GetVerb(Index: Integer): string;
begin
  Result := SDatasetDesigner;
end;

function TDataSetEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

{ TDataSetProperty }

type
  TDataSetProperty = class(TComponentProperty)
  private
    FCheckProc: TGetStrProc;
    procedure CheckComponent(const Value: string);
  public
    procedure GetValues(Proc: TGetStrProc); override;
  end;

procedure TDataSetProperty.CheckComponent(const Value: string);
var
  J: Integer;
  Dataset: TDataset;
begin
  Dataset := TDataset(Designer.GetComponent(Value));
  for J := 0 to PropCount - 1 do
    if TDataSource(GetComponent(J)).IsLinkedTo(Dataset) then
      Exit;
  FCheckProc(Value);
end;

procedure TDataSetProperty.GetValues(Proc: TGetStrProc);
begin
  FCheckProc := Proc;
  inherited GetValues(CheckComponent);
end;

{ TDataSourceProperty }

type
  TDataSourceProperty = class(TComponentProperty)
  private
    FCheckProc: TGetStrProc;
    procedure CheckComponent(const Value: string);
  public
    procedure GetValues(Proc: TGetStrProc); override;
  end;

procedure TDataSourceProperty.CheckComponent(const Value: string);
var
  J: Integer;
  DataSource: TDataSource;
begin
  DataSource := TDataSource(Designer.GetComponent(Value));
  for J := 0 to PropCount - 1 do
    if TDataSet(GetComponent(J)).IsLinkedTo(DataSource) then
      Exit;
  FCheckProc(Value);
end;

procedure TDataSourceProperty.GetValues(Proc: TGetStrProc);
begin
  FCheckProc := Proc;
  inherited GetValues(CheckComponent);
end;

{ TNestedDataSetProperty }

type
  TNestedDataSetProperty = class(TComponentProperty)
  private
    FCheckProc: TGetStrProc;
    procedure CheckComponent(const Value: string);
  public
    procedure GetValues(Proc: TGetStrProc); override;
  end;

procedure TNestedDataSetProperty.CheckComponent(const Value: string);
var
  DataSet: TDataset;
begin
  DataSet := (GetComponent(0) as TDataSetField).DataSet;
  if TDataset(Designer.GetComponent(Value)) <> DataSet then
    FCheckProc(Value);
end;

procedure TNestedDataSetProperty.GetValues(Proc: TGetStrProc);
begin
  FCheckProc := Proc;
  inherited GetValues(CheckComponent);
end;

{ TDBStringProperty }

function TDBStringProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList, paMultiSelect];
end;

procedure TDBStringProperty.GetValueList(List: TStrings);
begin
end;

procedure TDBStringProperty.GetValues(Proc: TGetStrProc);
var
  I: Integer;
  Values: TStringList;
begin
  Values := TStringList.Create;
  try
    GetValueList(Values);
    for I := 0 to Values.Count - 1 do Proc(Values[I]);
  finally
    Values.Free;
  end;
end;

function GetIndexDefs(Component: TPersistent): TIndexDefs;
var
  DataSet: TDataSet;
begin
  DataSet := Component as TDataSet;
  Result := GetPropertyValue(DataSet, 'IndexDefs') as TIndexDefs;
  if Assigned(Result) then
  begin
    Result.Updated := False;
    Result.Update;
  end;
end;

{ TIndexNameProperty }

procedure TIndexNameProperty.GetValueList(List: TStrings);
begin
  GetIndexDefs(GetComponent(0)).GetItemNames(List);
end;

{ TIndexFieldNamesProperty }

procedure TIndexFieldNamesProperty.GetValueList(List: TStrings);
var
  I: Integer;
  IndexDefs: TIndexDefs;
begin
  IndexDefs := GetIndexDefs(GetComponent(0));
  for I := 0 to IndexDefs.Count - 1 do
    with IndexDefs[I] do
      if (Options * [ixExpression, ixDescending] = []) and (Fields <> '') then
        List.Add(Fields);
end;

{ TDataFieldProperty }

function TDataFieldProperty.GetDataSourcePropName: string;
begin
  Result := 'DataSource';
end;

procedure TDataFieldProperty.GetValueList(List: TStrings);
var
  DataSource: TDataSource;
begin
  DataSource := GetPropertyValue(GetComponent(0), GetDataSourcePropName) as TDataSource;
  if (DataSource <> nil) and (DataSource.DataSet <> nil) then
    DataSource.DataSet.GetFieldNames(List);
end;

{ TDataFieldAggProperty }

function TDataFieldAggProperty.GetDataSourcePropName: string;
begin
  Result := 'DataSource';
end;

procedure TDataFieldAggProperty.GetValueList(List: TStrings);
var
  DataSource: TDataSource;
  AggList: TStringList;
begin
  DataSource := GetPropertyValue(GetComponent(0), GetDataSourcePropName) as TDataSource;
  if (DataSource <> nil) and (DataSource.DataSet <> nil) then
  begin
    DataSource.DataSet.GetFieldNames(List);
    if DataSource.DataSet.AggFields.Count > 0 then
    begin
      AggList := TStringList.Create;
      try
        DataSource.DataSet.AggFields.GetFieldNames(AggList);
        List.AddStrings(AggList);
      finally
        AggList.Free;
      end;
    end;
  end;
end;

{ TLookupSourceProperty }

type
  TLookupSourceProperty = class(TDBStringProperty)
  public
    procedure GetValueList(List: TStrings); override;
  end;

procedure TLookupSourceProperty.GetValueList(List: TStrings);
begin
  with GetComponent(0) as TField do
    if DataSet <> nil then DataSet.GetFieldNames(List);
end;

{ TLookupDestProperty }

type
  TLookupDestProperty = class(TDBStringProperty)
  public
    procedure GetValueList(List: TStrings); override;
  end;

procedure TLookupDestProperty.GetValueList(List: TStrings);
begin
  with GetComponent(0) as TField do
    if LookupDataSet <> nil then LookupDataSet.GetFieldNames(List);
end;

{ TListFieldProperty }

type
  TListFieldProperty = class(TDataFieldProperty)
  public
    function GetDataSourcePropName: string; override;
  end;

function TListFieldProperty.GetDataSourcePropName: string;
begin
  Result := 'ListSource';
end;

{ TLookupFieldProperty }

type
  TLookupFieldProperty = class(TDataFieldProperty)
  public
    function GetDataSourcePropName: string; override;
  end;

function TLookupFieldProperty.GetDataSourcePropName: string;
begin
  Result := 'LookupSource';
end;

{ TLookupIndexProperty }

type
  TLookupIndexProperty = class(TLookupFieldProperty)
  public
    procedure GetValueList(List: TStrings); override;
  end;

procedure TLookupIndexProperty.GetValueList(List: TStrings);
var
  DataSource: TDataSource;
begin
  DataSource := GetPropertyValue(GetComponent(0), GetDataSourcePropName) as TDataSource;
  if (DataSource <> nil) and (DataSource.DataSet <> nil) then
    DataSource.DataSet.GetFieldNames(List);
end;

{ TDBImageEditor }

type
  TDBImageEditor = class(TDefaultEditor)
  public
    procedure Copy; override;
  end;

procedure TDBImageEditor.Copy;
begin
  TDBImage(Component).CopyToClipboard;
end;

type
  TDBGridColumnsProperty = class(TClassProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

procedure TDBGridColumnsProperty.Edit;
begin
  ShowCollectionEditorClass(Designer, TDBGridColumnsEditor,
    GetComponent(0) as TComponent, TDBGridColumns(GetOrdValue), GetName);
end;

function TDBGridColumnsProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly];
end;


{ TDBGridEditor }
type
  TDBGridEditor = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

procedure TDBGridEditor.ExecuteVerb(Index: Integer);
begin
  ShowCollectionEditorClass(Designer, TDBGridColumnsEditor, Component,
    TDBGrid(Component).Columns, 'Columns');
end;

function TDBGridEditor.GetVerb(Index: Integer): string;
begin
  Result := SDBGridColEditor;
end;

function TDBGridEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

{ TColumnDataFieldEditor }

type
  TColumnDataFieldProperty = class(TDBStringProperty)
    procedure GetValueList(List: TStrings); override;
  end;

procedure TColumnDataFieldProperty.GetValueList(List: TStrings);
var
  Grid: TCustomDBGrid;
  DataSource: TDataSource;
begin
  Grid := (GetComponent(0) as DBGrids.TColumn).Grid;
  if (Grid = nil) then Exit;
  DataSource := GetPropertyValue(Grid, 'DataSource') as TDataSource;
  if (DataSource <> nil) and (DataSource.DataSet <> nil) then
    DataSource.DataSet.GetFieldNames(List);
end;

{ Registration }

procedure Register;
begin
  { Database Components are excluded from the STD SKU }
  if GDAL <> LongWord(-16) then
  begin
    RegisterComponents(srDAccess, [TDataSource]);
    RegisterComponents(srDControls, [TDBGrid, TDBNavigator, TDBText,
      TDBEdit, TDBMemo, TDBImage, TDBListBox, TDBComboBox, TDBCheckBox,
      TDBRadioGroup, TDBLookupListBox, TDBLookupComboBox, TDBRichEdit]);
    RegisterNonActiveX([TDataSource, TCustomDBGrid, TDBNavigator, TDBText,
      TDBEdit, TDBMemo, TDBImage, TDBListBox, TDBComboBox, TDBCheckBox,
      TDBRadioGroup, TDBLookupListBox, TDBLookupComboBox, TDBRichEdit,
      TDBLookupControl], axrIncludeDescendants);
    RegisterNonActiveX([TDBCtrlGrid], axrIncludeDescendants);
    RegisterComponents(srDControls, [TDBCtrlGrid]);
    RegisterNoIcon([TField]);
    RegisterFields([TStringField, TIntegerField, TSmallintField, TWordField,
      TFloatField, TCurrencyField, TBCDField, TBooleanField, TDateField,
      TVarBytesField, TBytesField, TTimeField, TDateTimeField,
      TBlobField, TMemoField, TGraphicField, TAutoIncField, TLargeintField,
      TADTField, TArrayField, TDataSetField, TReferenceField, TAggregateField,
      TWideStringField, TVariantField, TGuidField, TInterfaceField, TIDispatchField]);
    RegisterPropertyEditor(TypeInfo(TDataSet), TDataSource, 'DataSet', TDataSetProperty);
    RegisterPropertyEditor(TypeInfo(TDataSet), TDataSetField, 'NestedDataSet', TNestedDataSetProperty);
    RegisterPropertyEditor(TypeInfo(TDataSource), TDataSet, 'MasterSource', TDataSourceProperty);
    RegisterPropertyEditor(TypeInfo(TDataSource), TDataSet, 'DataSource', TDataSourceProperty);
    RegisterPropertyEditor(TypeInfo(string), TField, 'KeyFields', TLookupSourceProperty);
    RegisterPropertyEditor(TypeInfo(string), TField, 'LookupKeyFields', TLookupDestProperty);
    RegisterPropertyEditor(TypeInfo(string), TField, 'LookupResultField', TLookupDestProperty);
    RegisterPropertyEditor(TypeInfo(string), TComponent, 'DataField', TDataFieldProperty);
    RegisterPropertyEditor(TypeInfo(string), TDBLookupControl, 'KeyField', TListFieldProperty);
    RegisterPropertyEditor(TypeInfo(string), TDBLookupControl, 'ListField', TListFieldProperty);
    RegisterPropertyEditor(TypeInfo(string), TWinControl, 'LookupField', TLookupIndexProperty);
    RegisterPropertyEditor(TypeInfo(string), TWinControl, 'LookupDisplay', TLookupFieldProperty);
    RegisterPropertyEditor(TypeInfo(string), TDBEdit, 'EditMask', TMaskProperty);
    RegisterPropertyEditor(TypeInfo(string), TField, 'EditMask', TMaskProperty);
    RegisterPropertyEditor(TypeInfo(string), TColumn, 'FieldName', TColumnDataFieldProperty);
    RegisterPropertyEditor(TypeInfo(TDBGridColumns), TCustomDBGrid, '', TDBGridColumnsProperty);
    RegisterPropertyEditor(TypeInfo(string), TDBText, 'DataField', TDataFieldAggProperty);
    RegisterPropertyEditor(TypeInfo(string), TDBEdit, 'DataField', TDataFieldAggProperty);
    RegisterPropertyEditor(TypeInfo(TDataBindings), TDBOleControl, 'DataBindings', TDataBindProperty);
    RegisterComponentEditor(TDataset, TDataSetEditor);
    RegisterComponentEditor(TDBImage, TDBImageEditor);
    RegisterComponentEditor(TDBGrid, TDBGridEditor);
    RegisterComponentEditor(TDBOleControl, TDataBindEditor);

    { DataSet action registration }
    RegisterActions('Dataset', [TDataSetFirst, TDataSetPrior, TDataSetNext,
      TDataSetLast, TDataSetInsert, TDataSetDelete, TDataSetEdit, TDataSetPost,
      TDataSetCancel, TDataSetRefresh], TStandardDatasetActions);

    { Property Category registration }
    RegisterPropertiesInCategory(TDatabaseCategory,
      ['SQL*', 'Filter*', 'OnFilter*', 'RequestLive',
       TypeInfo(TDataSet), TypeInfo(TDataSource),
       TypeInfo(TParams), TypeInfo(TDBGridColumns),
       TypeInfo(TCheckConstraints), TypeInfo(TDataBindings)]);

    RegisterPropertiesInCategory(TDatabaseCategory, TDataSet,
      ['*Field', '*Fields', 'Index*', 'Lookup*', '*Defs', 'ObjectView', 'Table*',
       'Param*', 'Cache*', 'Lock*', 'Cursor*']);

    RegisterPropertiesInCategory(TDatabaseCategory, TField,
      ['*Field', '*Fields']);

    RegisterPropertiesInCategory(TDatabaseCategory, TWinControl,
      ['LookupField', 'LookupDisplay']);

    RegisterPropertiesInCategory(TDatabaseCategory, TDBLookupControl,
      ['*Field', '*FieldIndex']);

    RegisterPropertyInCategory(TDatabaseCategory, TComponent, 'DataField');
    RegisterPropertyInCategory(TDatabaseCategory, TColumn, 'FieldName');
    
    { Localizable properties }
    RegisterPropertiesInCategory(TLocalizableCategory, TField, 
      ['DisplayFormat', 'DisplayLabel', 'DisplayValues', 'EditFormat', 'ConstraintErrorMessage']); { Do not localize }
    RegisterPropertiesInCategory(TLocalizableCategory, TDBRadioGroup, ['Columns']);  { Do not localize }
    RegisterPropertiesInCategory(TLocalizableCategory, TDBCheckBox, ['ValueChecked', 'ValueUnchecked']); { Do not localize }
    RegisterPropertiesInCategory(TLocalizableCategory, TColumn, ['Picklist']); { Do not localize }
   
    RegisterPropertiesInCategory(TLocalizableCategory, { by TypeInfo }
      [TypeInfo(TCheckConstraints), 
       TypeInfo(TColumnTitle)]);
  end;
end;

end.
