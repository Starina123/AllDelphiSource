unit DataMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables;

type
  TCacheData = class(TDataModule)
    CacheDS: TDataSource;
    CacheDB: TDatabase;
    CacheQuery: TQuery;
    UpdateSQL: TUpdateSQL;
    CacheQueryUpdateStatus: TStringField;
    CacheQueryPROJ_ID: TStringField;
    CacheQueryPROJ_NAME: TStringField;
    procedure UpdateErrorHandler(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure CacheQueryCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CacheData: TCacheData;

implementation

uses CachedUp, ErrForm;

{$R *.dfm}

{ This event is triggered when an error occurs during the update process
  (such as a key violation).  Here we use another form to show the user
  the error and allow them to decide what to do about it.  See ErrForm.pas
  for more information }

procedure TCacheData.UpdateErrorHandler(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  UpdateAction := UpdateErrorForm.HandleError(DataSet, E, UpdateKind);
end;

{ This event displays the current update status in a calculated field }

procedure TCacheData.CacheQueryCalcFields(DataSet: TDataSet);
const
  UpdateStatusStr: array[TUpdateStatus] of string = ('Unmodified', 'Modified',
   'Inserted', 'Deleted');
begin
  if CacheQuery.CachedUpdates then
    CacheQueryUpdateStatus.Value := UpdateStatusStr[CacheQuery.UpdateStatus];
end;

end.

