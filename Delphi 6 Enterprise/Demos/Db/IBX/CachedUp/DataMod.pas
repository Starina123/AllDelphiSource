unit DataMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBDatabase, IBCustomDataSet, IBUpdateSQL, IBQuery, Db, IBTable;

type
  TCacheData = class(TDataModule)
    CacheDS: TDataSource;
    IBDatabase1: TIBDatabase;
    IBCacheQuery: TIBQuery;
    IBUpdateSQL: TIBUpdateSQL;
    IBTransaction1: TIBTransaction;
    IBCacheQueryPROJ_ID: TStringField;
    IBCacheQueryPROJ_NAME: TStringField;
    IBCacheQueryUpdateStatus: TStringField;
    IBCachedDataSet: TIBDataSet;
    IBCachedTable: TIBTable;
    IBCachedDataSetPROJ_ID: TStringField;
    IBCachedDataSetPROJ_NAME: TStringField;
    IBCachedDataSetUpdateStatus: TStringField;
    IBCachedTablePROJ_ID: TStringField;
    IBCachedTablePROJ_NAME: TStringField;
    IBCachedTableUpdateStatus: TStringField;
    procedure CacheQueryCalcFields(DataSet: TDataSet);
    procedure IBCacheQueryUpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TIBUpdateAction);
    procedure IBCachedDataSetCalcFields(DataSet: TDataSet);
    procedure IBCachedTableCalcFields(DataSet: TDataSet);
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

{ This event displays the current update status in a calculated field }
const
  UpdateStatusStr: array[TUpdateStatus] of string = ('Unmodified', 'Modified',
   'Inserted', 'Deleted');

procedure TCacheData.CacheQueryCalcFields(DataSet: TDataSet);
begin
  IBCacheQueryUpdateStatus.Value := UpdateStatusStr[IBCacheQuery.UpdateStatus];
end;

{ This event is triggered when an error occurs during the update process
  (such as a key violation).  Here we use another form to show the user
  the error and allow them to decide what to do about it.  See ErrForm.pas
  for more information }

procedure TCacheData.IBCacheQueryUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TIBUpdateAction);
begin
  UpdateAction := UpdateErrorForm.HandleError(DataSet, E, UpdateKind);
end;

procedure TCacheData.IBCachedDataSetCalcFields(DataSet: TDataSet);
begin
  IBCachedDataSetUpdateStatus.Value := UpdateStatusStr[IBCachedDataset.UpdateStatus];
end;

procedure TCacheData.IBCachedTableCalcFields(DataSet: TDataSet);
begin
  IBCachedTableUpdateStatus.Value := UpdateStatusStr[IBCachedTable.UpdateStatus];
end;

end.

