{*******************************************************}
{                                                       }
{             Delphi LiveBindings Framework             }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit Data.Bind.Editors;

interface

uses
  System.Classes, System.Bindings.EvalProtocol, Data.Bind.Components, System.Bindings.ObjEval;

type
  TBindListEditor = class(TInterfacedObject, IBindListEditor)
  protected
    procedure BeginUpdate; virtual; abstract;
    procedure EndUpdate; virtual; abstract;
    function AddItem(Select: Boolean = False): IScope; virtual; abstract;
    function CanInsertItem: Boolean; virtual; abstract;
    function InsertItem(Select: Boolean = False): IScope; virtual; abstract;
    function MoveNext: Boolean; virtual; abstract;
    function CurrentItem: IScope; virtual; abstract;
    function GetRowCount: Integer; virtual; abstract;
    procedure DeleteToEnd; virtual; abstract;
    function UpdateNeeded(ARecordEnumerator: IScopeRecordEnumerator): Boolean; virtual;
    procedure UpdateList(ARecordEnumerator: IScopeRecordEnumerator; AFormatProc: TFormatCallback); virtual;
    procedure FillList(ARecordEnumerator: IScopeRecordEnumerator; AFormatProc: TFormatCallback); virtual;
    procedure ClearList; virtual; abstract;
    function GetSelectedItem: TObject; virtual;
    function GetSelectedText: string; virtual; abstract;
    procedure SetSelectedText(const AValue: string); virtual; abstract;
  end;

  TBindCheckBoxEditor = class(TInterfacedObject, IBindCheckBoxEditor)
  protected
    function GetState: TBindCheckBoxState; virtual; abstract;
    procedure SetState(Value: TBindCheckBoxState); virtual; abstract;
    function GetAllowGrayed: Boolean; virtual; abstract;
    procedure SetAllowGrayed(Value: Boolean); virtual; abstract;
  end;

  TBindGridEditor = class(TBindListEditor, IBindGridEditor)
  protected
    procedure GetColumnNames(AList: TStrings); virtual; abstract;
    procedure GetColumnIndices(AList: TStrings); virtual; abstract;
  end;

implementation

uses System.SysUtils;

{ TBindListEditor }

procedure TBindListEditor.FillList(ARecordEnumerator: IScopeRecordEnumerator;
  AFormatProc: TFormatCallback);
var
  LEditor: IBindListEditor;
  LEnumerator: IScopeRecordEnumerator;
  LEditorScope: IScope;
begin
  LEditor := Self;
  LEditor.BeginUpdate;
  try
    LEnumerator := ARecordEnumerator;
    LEnumerator.First;
    LEditor.ClearList;
    if LEnumerator <> nil then
    begin
      while LEnumerator.MoveNext do
      begin
        LEditorScope := LEditor.AddItem;
        Assert(LEditorScope <> nil);
        if LEditorScope <> nil then
        begin
          AFormatProc(LEnumerator.Current, LEditorScope);
        end;
      end;
    end
    else
      Assert(False);
  finally
    LEditor.EndUpdate;
  end;

end;

function TBindListEditor.GetSelectedItem: TObject;
begin
  Result := nil;
end;

procedure TBindListEditor.UpdateList(ARecordEnumerator: IScopeRecordEnumerator;
  AFormatProc: TFormatCallback);
var
  LEditor: IBindListEditor;
  LEditorScope: IScope;
begin
  LEditor := Self;

  LEditor.BeginUpdate;
  try
    if ARecordEnumerator <> nil then
    begin
      // Update existing items
      while LEditor.MoveNext do
      begin
        if ARecordEnumerator.MoveNext then
        begin
          LEditorScope := LEditor.CurrentItem;
          Assert(LEditorScope <> nil);
          if LEditorScope <> nil then
          begin
            AFormatProc(ARecordEnumerator.Current, LEditorScope);
          end;
        end
        else
        begin
          Assert(True); //Debugging
          break;
        end;
      end;
      // Delete remaining items, if any
      LEditor.DeleteToEnd;
      // Add new items
      // do not call ARecordEnumerator.First 
      while ARecordEnumerator.MoveNext do
      begin
        LEditorScope := LEditor.AddItem;
        Assert(LEditorScope <> nil);
        if LEditorScope <> nil then
        begin
          AFormatProc(ARecordEnumerator.Current, LEditorScope);
        end;
      end;
    end
    else
      Assert(False);
  finally
    LEditor.EndUpdate;
  end;
end;

function TBindListEditor.UpdateNeeded(
  ARecordEnumerator: IScopeRecordEnumerator): Boolean;
var
  LEditor: IBindListEditor;
  LIntf: IScopeRecordEnumeratorCount;
begin
  LEditor := Self;
  if ARecordEnumerator <> nil then
    if Supports(ARecordEnumerator, IScopeRecordEnumeratorCount, LIntf) then

      if LEditor.RowCount = LIntf.RecordCount then
        // Only need to do something if records added or deleted
        Exit(False);
  Result := True;
end;

end.
