{*************************************************************}
{                                                             }
{       Embarcadero Delphi Visual Component Library           }
{       InterBase Express core components                     }
{                                                             }
{       Copyright (c) 1998-2017 Embarcadero Technologies, Inc.}
{              All rights reserved                            }
{                                                             }
{    Code created by Jeff Overcash used with permission.      }
{*************************************************************}

unit IBX.IBSubscription;

interface

uses
  System.Classes, IBX.IBDatabase;

type

  TIBSubscriptions = class;
  TIBSubscriptionItem = class;

  TIBDmlAction = (diInsert, diUpdate, diDelete);

  TIBDmlActions = Set of TIBDmlAction;

  TIBSubscriptionInfo = class(TCollectionItem)
  private
    FForTable : String;
    FColumnList : TStrings;
    FDmlActions : TIBDmlActions;
    procedure SetColumnList(const Value: TStrings);
    function GetDatabase: TIBDataBase;
    function GetTransaction: TIBTransaction;
  protected
    function GetDisplayName: string; override;

  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure AddColumn(AColumn : string);
    procedure AddColumns(Columns : TStrings);
    function CreateSQL : String;
    procedure Clear;
    function GetColumns: String;
    procedure Assign(Source: TPersistent); override;
    property Database : TIBDataBase read GetDatabase;
    property Transaction : TIBTransaction read GetTransaction;

  published
    property ForTable : string read FForTable write FForTable;
    property DmlActions : TIBDmlActions read FDmlActions write FDmlActions;
    property Columns : TStrings read FColumnList write SetColumnList;
  end;

  TIBSubscriptionInfos = class(TOwnedCollection)
  private
    function GetSubscriptionInfos(Index: Integer): TIBSubscriptionInfo;
    procedure SetSubscriptionInfos(Index: Integer; const Value: TIBSubscriptionInfo);
    function GetDatabase: TIBDataBase;
    function GetTransaction: TIBTransaction;

  public
    constructor Create(AOwner: TIBSubscriptionItem);
    function Add: TIBSubscriptionInfo; overload;
    function Add(ForTable : String): TIBSubscriptionInfo; overload;
    procedure DeleteInfo(info : TIBSubscriptionInfo);
    property Database : TIBDataBase read GetDatabase;
    property Transaction : TIBTransaction read GetTransaction;

    property SubscriptionInfos[Index: Integer]: TIBSubscriptionInfo read GetSubscriptionInfos write SetSubscriptionInfos; default;
  end;

  TIBSubscriptionItem = class(TCollectionItem)
  private
    FSubscriptionName : String;
    FSubscriptionInfos: TIBSubscriptionInfos;
    FDescription: String;
    function GetDatabase: TIBDataBase;
    function GetTransaction: TIBTransaction;
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;

    function CreateSQL : String;
    procedure Clear;
    procedure RetriveInfo;
    procedure Assign(Source: TPersistent); override;

    function SubscriptionNames : TStrings;
    property Database : TIBDataBase read GetDatabase;
    property Transaction : TIBTransaction read GetTransaction;

  published
    property SubscriptionInfos : TIBSubscriptionInfos read FSubscriptionInfos write FSubscriptionInfos;
    property SubscriptionName : String read FSubscriptionName write FSubscriptionName;
    property Description : String read FDescription write FDescription;
  end;

  TIBSubscriptionItems = class(TOwnedCollection)
  private
    function GetSubscriptionItems(Index: Integer): TIBSubscriptionItem;
    procedure SetSubscriptionItems(Index: Integer; const Value: TIBSubscriptionItem);
    function GetDatabase: TIBDataBase;
    function GetTransaction: TIBTransaction;

  public
    constructor Create(AOwner: TIBSubscriptions);
    function Add: TIBSubscriptionItem;
    function SubscriptionList : String;

    function SubscriptionNames : TStrings;
    procedure DeleteItem(item : TIBSubscriptionItem);

    property SubscriptionItems[Index: Integer]: TIBSubscriptionItem read GetSubscriptionItems write SetSubscriptionItems; default;
    property Database : TIBDataBase read GetDatabase;
    property Transaction : TIBTransaction read GetTransaction;
  end;

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBSubscriptions = class(TComponent)
  private
    FBase: TIBBase;
    FDestination: String;
    FSubscriptions : TIBSubscriptionItems;
    FActive: Boolean;
    FNameList : TStringList;

    function GetTransaction: TIBTransaction;
    procedure SetDatabase(const Value: TIBDatabase);
    procedure SetTransaction(const Value: TIBTransaction);
    procedure SetActive(const Value: Boolean);

    procedure DoBeforeTransactionEnd(Sender: TObject);
    function GetDatabase: TIBDatabase;
  protected
    procedure ActivateConnection;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;

    procedure CreateSubscriptions;
    function CreateScript : string;
    procedure DropSubscriptions(Cascade : Boolean = False);
    procedure GrantTo(UserName : string);
    procedure RevokeFrom(UserName : string);

    function Add(SubscriptionName : string) : TIBSubscriptionItem;
    function Find(SubscriptionName : string) : TIBSubscriptionItem;
    procedure Delete(SubscriptionName : string);
    procedure RetrieveFullInfo;
    procedure Clear;
    procedure Assign(Source: TPersistent); override;
    function SubscriptionNames : TStrings;

    property Active : Boolean read FActive write SetActive;
    property Destination : String read FDestination write FDestination;
  published
    property SubscriptionItems : TIBSubscriptionItems read FSubscriptions write FSubscriptions;
    property Database : TIBDatabase read GetDatabase write SetDatabase;
    property Transaction : TIBTransaction read GetTransaction write SetTransaction;
  end;

implementation

{ TIBSubscription }

uses
  IBX.IBXConst, System.SysUtils, IBX.IB, IBX.IBSQL, IBX.IBUtils;

procedure TIBSubscriptions.ActivateConnection;
begin
  if not Assigned(Database) then
    IBError(ibxeDatabaseNotAssigned, [nil]);
  if not Assigned(Transaction) then
    IBError(ibxeTransactionNotAssigned, [nil]);
  if not Database.Connected then Database.Open;
end;

function TIBSubscriptions.Add(SubscriptionName: string): TIBSubscriptionItem;
begin
  Result := FSubscriptions.Add;
  Result.SubscriptionName := SubscriptionName;
end;

procedure TIBSubscriptions.Assign(Source: TPersistent);
begin
  if Source is TIBSubscriptions then
  begin
    Database := TIBSubscriptions(Source).Database;
    Transaction := TIBSubscriptions(Source).Transaction;
    SubscriptionItems.Assign(TIBSubscriptions(Source).SubscriptionItems);
  end
  else
    inherited;
end;

procedure TIBSubscriptions.Clear;
begin
  FSubscriptions.Clear;
end;

constructor TIBSubscriptions.Create(AOwner: TComponent);
begin
  inherited;
  FBase := TIBBase.Create(Self);
  FBase.BeforeTransactionEnd := DoBeforeTransactionEnd;
  if AOwner is TIBDatabase then
    Database := TIBDatabase(AOwner)
  else
    if AOwner is TIBTransaction then
      Transaction := TIBTransaction(AOwner);
  FSubscriptions := TIBSubscriptionItems.Create(Self);
  FNameList := TStringList.Create;
end;

function TIBSubscriptions.CreateScript: string;
var
  MyElem : TCollectionItem;
begin
  for MyElem in FSubscriptions do
  begin
    if Result <> '' then
      Result := Result + CRLF + CRLF;
    Result := Result + (MyElem as TIBSubscriptionItem).CreateSQL + ';';
  end;
end;

procedure TIBSubscriptions.CreateSubscriptions;
var
  MyElem : TCollectionItem;
  SQL : string;
begin
  for MyElem in FSubscriptions do
  begin
    SQL := TIBSubscriptionItem(MyElem).CreateSQL;
    Database.ExecuteImmediate(SQL);
  end;
end;

procedure TIBSubscriptions.Delete(SubscriptionName: string);
var
  i : Integer;
begin
  for i := FSubscriptions.Count - 1 downto 0 do
  begin
    if FSubscriptions[i].SubscriptionName = SubscriptionName then
      FSubscriptions.Delete(I);
  end;
end;

destructor TIBSubscriptions.Destroy;
begin
  FBase.DisposeOf;
  FNameList.Free;
  inherited;
end;

procedure TIBSubscriptions.DoBeforeTransactionEnd(Sender: TObject);
begin
  FActive := False;
end;

procedure TIBSubscriptions.DropSubscriptions(Cascade : Boolean);
var
  MyElem : TCollectionItem;
  SQL : string;
begin
  for MyElem in FSubscriptions do
  begin
    SQL := 'DROP SUBSCRIPTION ' +  TIBSubscriptionItem(MyElem).SubscriptionName; { do not localize }
    if Cascade then
      SQL := SQL + ' CASCADE';
    Database.ExecuteImmediate(SQL);
  end;
end;

function TIBSubscriptions.Find(SubscriptionName: string): TIBSubscriptionItem;
var
  i : Integer;
begin
  i := 0;
  Result := nil;
  while not Assigned(Result) and (i < FSubscriptions.Count) do
  begin
    if FSubscriptions[i].SubscriptionName = SubscriptionName then
      Result := FSubscriptions[i];
  end;
end;

function TIBSubscriptions.GetDatabase: TIBDatabase;
begin
  result := FBase.Database;
end;

function TIBSubscriptions.GetTransaction: TIBTransaction;
begin
  result := FBase.Transaction;
end;

procedure TIBSubscriptions.GrantTo(UserName: string);
var
  MyElem : TCollectionItem;
  SQL : string;
begin
  for MyElem in FSubscriptions do
  begin
    SQL := 'GRANT SUBSCRIBE ON SUBSCRIPTION ' +  TIBSubscriptionItem(MyElem).SubscriptionName + { do not localize }
           ' TO ' + UserName; { do not localize }
    Database.ExecuteImmediate(SQL);
  end;
end;

procedure TIBSubscriptions.RetrieveFullInfo;
var
  MyElem : TCollectionItem;
begin
  ActivateConnection;
  for MyElem in FSubscriptions do
    (MyElem as TIBSubscriptionItem).RetriveInfo;
end;

procedure TIBSubscriptions.RevokeFrom(UserName: string);
var
  MyElem : TCollectionItem;
  SQL : string;
begin
  for MyElem in FSubscriptions do
  begin
    SQL := 'REVOKE SUBSCRIBE ON SUBSCRIPTION ' +  TIBSubscriptionItem(MyElem).SubscriptionName + { do not localize }
           ' FROM ' + UserName; { do not localize }
    Database.ExecuteImmediate(SQL);
  end;
end;

procedure TIBSubscriptions.SetActive(const Value: Boolean);
var
  SQL : string;
begin
  if Value <> FActive then
  begin
    SQL := 'SET SUBSCRIPTION '; {do not localize }
    SQL := SQL + FSubscriptions.SubscriptionList;

    if Destination <> '' then
      SQL := SQL + ' AT ' + QuotedStr(Destination); {do not localize }
    if Value then
      SQL := SQL + ' ACTIVE'  {do not localize }
    else
      SQL := SQL + ' INACTIVE'; {do not localize }
    Database.ExecuteImmediate(SQL, Transaction);
    FActive := Value;
  end;
end;

procedure TIBSubscriptions.SetDatabase(const Value: TIBDatabase);
begin
  if (FBase.Database <> Value) then
    FBase.Database := Value;
end;

procedure TIBSubscriptions.SetTransaction(const Value: TIBTransaction);
begin
  if (FBase.Transaction <> Value) then
    FBase.Transaction := Value;
end;

function TIBSubscriptions.SubscriptionNames: TStrings;
var
  Query : TIBSQL;
begin
  FNameList.clear;
  if not (csReading in ComponentState) then
  begin
    ActivateConnection;
    Query := TIBSQL.Create(self);
    Database.InternalTransaction.StartTransaction;
    try
      Query.GoToFirstRecordOnExecute := False;
      Query.Database := DataBase;
      Query.Transaction := Database.InternalTransaction;
      Query.SQL.Text := 'Select distinct RDB$SUBSCRIPTION_NAME from RDB$SUBSCRIPTIONS'; {do not localize}
      Query.Prepare;
      Query.ExecQuery;
      while (not Query.EOF) and (Query.Next <> nil) do
        FNameList.Add(TrimRight(Query.Current.ByName('RDB$SUBSCRIPTION_NAME').AsString)); {do not localize}
    finally
      Query.Free;
      Database.InternalTransaction.Commit;
    end;
  end;
  Result := FNameList;
end;

{ TIBSubscription }

procedure TIBSubscriptionItem.Assign(Source: TPersistent);
begin
  if Source is TIBSubscriptionItem then
  begin
    FSubscriptionName := TIBSubscriptionItem(Source).SubscriptionName;
    FDescription := TIBSubscriptionItem(Source).Description;
    FSubscriptionInfos.Assign(TIBSubscriptionItem(Source).SubscriptionInfos);
  end
  else
    inherited;
end;

procedure TIBSubscriptionItem.Clear;
var
  MyElem : TCollectionItem;
begin
  FSubscriptionName := '';     {do not localize }
  FDescription := '';          {do not localize }
  for MyElem in FSubscriptionInfos do
    TIBSubscriptionInfo(MyElem).Clear;
end;

constructor TIBSubscriptionItem.Create(Collection: TCollection);
begin
  inherited;
  FSubscriptionInfos := TIBSubscriptionInfos.Create(Self);
end;

function TIBSubscriptionItem.CreateSQL: String;
var
  First : Boolean;
  MyElem : TCollectionItem;
begin
  if Assigned(Database) then
    Result := 'CREATE SUBSCRIPTION ' + QuoteIdentifier(Database.SQLDialect, SubscriptionName) + ' ON ' + CRLF {do not localize }
  else
    Result := 'CREATE SUBSCRIPTION ' + QuoteIdentifier(3, SubscriptionName) + ' ON ' + CRLF; {do not localize }
  First := true;
  for MyElem in FSubscriptionInfos do
  begin
    if First then
    begin
      Result := Result + TIBSubscriptionInfo(MyElem).CreateSQL;
      First := false;
    end
    else
      Result := Result + ',' + CRLF + TIBSubscriptionInfo(MyElem).CreateSQL;   {do not localize }
  end;
  if FDescription <> '' then   {do not localize }
    Result := Result + CRLF + 'DESCRIPTION ''' + FDescription + '''';     {do not localize }
end;

destructor TIBSubscriptionItem.Destroy;
begin
  inherited;
end;

function TIBSubscriptionItem.GetDatabase: TIBDataBase;
begin
  Result := (GetOwner as TIBSubscriptionItems).Database;
end;

function TIBSubscriptionItem.GetDisplayName: string;
begin
  Result := FSubscriptionName;
end;

function TIBSubscriptionItem.GetTransaction: TIBTransaction;
begin
  Result := (GetOwner as TIBSubscriptionItems).Transaction;
end;

function TIBSubscriptionItem.SubscriptionNames: TStrings;
begin
  Result := (GetOwner as TIBSubscriptionItems).SubscriptionNames;
end;

procedure TIBSubscriptionItem.RetriveInfo;
const
  SNamedSubscription = 'select SBS.RDB$SUBSCRIPTION_NAME, SBS.RDB$OWNER_NAME, SBS.RDB$DESCRIPTION ' +  {do not localize}
                       '  from RDB$SUBSCRIPTIONS SBS ' + {do not localize}
                       ' where SBS.RDB$RELATION_NAME IS NULL AND ' + {do not localize}
                       '       SBS.RDB$SUBSCRIPTION_NAME = :subscription_name'; {do not localize}

  STables = 'select RDB$RELATION_NAME, RDB$RELATION_COUNTER, RDB$CHANGE, RDB$INSERT, ' +  {do not localize}
            '       RDB$UPDATE, RDB$DELETE ' + {do not localize}
            '  from RDB$SUBSCRIPTIONS SBS2 ' + {do not localize}
            ' where SBS2.RDB$SUBSCRIPTION_NAME = :subscription_name AND ' + {do not localize}
            '       SBS2.RDB$RELATION_NAME is not NULL AND ' + {do not localize}
            '       SBS2.RDB$FIELD_NAME is NULL ' + {do not localize}
            ' ORDER BY SBS2.RDB$SUBSCRIPTION_NAME, SBS2.RDB$RELATION_COUNTER, SBS2.RDB$FLAGS '; {do not localize}

  SColumns = 'select * ' +  {do not localize}
             '  from RDB$SUBSCRIPTIONS SBS3 ' +  {do not localize}
             ' where SBS3.RDB$SUBSCRIPTION_NAME = :subscription_name AND ' +  {do not localize}
             '       SBS3.RDB$RELATION_COUNTER = :RELATION_COUNTER AND ' +  {do not localize}
             '       SBS3.RDB$FIELD_NAME is not NULL AND ' +  {do not localize}
             '       SBS3.RDB$FLAGS = 0 ' +  {do not localize}
             ' ORDER BY SBS3.RDB$SUBSCRIPTION_NAME, SBS3.RDB$RELATION_COUNTER ';  {do not localize}

var
  sql, sqlCol : TIBSQL;
  Item : TIBSubscriptionInfo;
begin
  SubscriptionInfos.Clear;
  sql := TIBSQL.Create(nil);
  sqlCol := TIBSQL.Create(nil);
  try
    sql.Database := Database;
    sql.Transaction := Database.InternalTransaction;
    sql.Transaction.StartTransaction;
    sqlCol.Database := Database;
    sqlCol.Transaction := Database.InternalTransaction;
    sqlCol.SQL.Text := SColumns;

    sql.SQL.Text := SNamedSubscription;
    sql.ParamByName('subscription_name').AsString := SubscriptionName;   {do not localize}
    sql.ExecQuery;
    Description := sql.FieldByName('RDB$DESCRIPTION').AsString;  {do not localize}
    sql.Close;

    sql.SQL.Text := STables;
    sql.ParamByName('subscription_name').AsString := SubscriptionName;   {do not localize}
    sql.ExecQuery;
    while not sql.Eof do
    begin
      Item := SubscriptionInfos.Add(sql.FieldByName('RDB$RELATION_NAME').AsString.Trim); {do not localize}
      if sql.FieldByName('RDB$INSERT').AsBoolean then     {do not localize}
        Item.DmlActions := Item.DmlActions + [diInsert];
      if sql.FieldByName('RDB$UPDATE').AsBoolean then         {do not localize}
        Item.DmlActions := Item.DmlActions + [diUpdate];
      if sql.FieldByName('RDB$DELETE').AsBoolean then     {do not localize}
        Item.DmlActions := Item.DmlActions + [diDelete];
      sqlCol.ParamByName('subscription_name').AsString := SubscriptionName;   {do not localize}
      sqlCol.ParamByName('relation_counter').AsInteger := sql.FieldByName('RDB$RELATION_COUNTER').AsInteger;  {do not localize}
      try
        sqlCol.ExecQuery;
        while not sqlCol.Eof do
        begin
          Item.AddColumn(sqlCol.FieldByName('RDB$FIELD_NAME').AsString.Trim);  {do not localize}
          sqlCol.Next;
        end;
      finally
        sqlCol.Close;
      end;
      sql.Next;
    end;
  finally
    sql.Transaction.Commit;
    sql.Free;
    sqlCol.Free;
  end;
end;

{ TIBSubscriptionCollection }

function TIBSubscriptionItems.Add: TIBSubscriptionItem;
begin
  Result := TIBSubscriptionItem(inherited Add);
end;

constructor TIBSubscriptionItems.Create(AOwner: TIBSubscriptions);
begin
  inherited Create(AOwner, TIBSubscriptionItem);
end;

procedure TIBSubscriptionItems.DeleteItem(item: TIBSubscriptionItem);
var
  i : Integer;
begin
  i := 0;
  while i < Count do
    if Items[i] = item then
    begin
      Delete(i);
      Exit;
    end
    else
      Inc(i);
end;

function TIBSubscriptionItems.GetDatabase: TIBDataBase;
begin
  Result := (GetOwner as TIBSubscriptions).Database;
end;

function TIBSubscriptionItems.GetSubscriptionItems(Index: Integer): TIBSubscriptionItem;
begin
  Result := TIBSubscriptionItem(inherited GetItem(Index));
end;

function TIBSubscriptionItems.GetTransaction: TIBTransaction;
begin
  Result := (GetOwner as TIBSubscriptions).Transaction;
end;

procedure TIBSubscriptionItems.SetSubscriptionItems(Index: Integer;
  const Value: TIBSubscriptionItem);
begin
  inherited SetItem(Index, Value);
end;

function TIBSubscriptionItems.SubscriptionList: String;
var
  MyEnum : TCollectionEnumerator;
  First : Boolean;
begin
  First := True;
  MyEnum := GetEnumerator;
  while MyEnum.MoveNext do
  begin
    if First then
    begin
      Result := TIBSubscriptionItem(MyEnum.Current).SubscriptionName;
      First := False;
    end
    else
      Result := Result + ', ' + TIBSubscriptionItem(MyEnum.Current).SubscriptionName;  {do not localize }
  end;
  MyEnum.Free;
end;

function TIBSubscriptionItems.SubscriptionNames: TStrings;
begin
  Result := (GetOwner as TIBSubscriptions).SubscriptionNames;
end;

{ TIBSubscriptionInfoCollection }

function TIBSubscriptionInfos.Add: TIBSubscriptionInfo;
begin
  Result := TIBSubscriptionInfo(inherited Add);
end;

function TIBSubscriptionInfos.Add(
  ForTable: String): TIBSubscriptionInfo;
begin
  Result := Add;
  Result.ForTable := ForTable;
end;

constructor TIBSubscriptionInfos.Create(AOwner: TIBSubscriptionItem);
begin
  inherited Create(AOwner, TIBSubscriptionInfo);
end;


procedure TIBSubscriptionInfos.DeleteInfo(info: TIBSubscriptionInfo);
var
  i : Integer;
begin
  i := 0;
  while i < Count do
    if Items[i] = info then
    begin
      Delete(i);
      Exit;
    end
    else
      Inc(i);
end;

function TIBSubscriptionInfos.GetDatabase: TIBDataBase;
begin
  Result := (Owner as TIBSubscriptionItem).Database;
end;

function TIBSubscriptionInfos.GetSubscriptionInfos(Index: Integer): TIBSubscriptionInfo;
begin
  Result := TIBSubscriptionInfo(inherited GetItem(Index));
end;

function TIBSubscriptionInfos.GetTransaction: TIBTransaction;
begin
  Result := (Owner as TIBSubscriptionItem).Transaction;
end;

procedure TIBSubscriptionInfos.SetSubscriptionInfos(Index: Integer;
  const Value: TIBSubscriptionInfo);
begin
  inherited SetItem(Index, Value);
end;

{ TIBSubscriptionInfoItem }

procedure TIBSubscriptionInfo.AddColumn(AColumn: string);
begin
  if FColumnList.IndexOf(AColumn) < 0 then
    FColumnList.Add(AColumn);
end;

procedure TIBSubscriptionInfo.AddColumns(Columns: TStrings);
begin
  FColumnList.CommaText := Columns.CommaText;
end;

procedure TIBSubscriptionInfo.Assign(Source: TPersistent);
begin
  if Source is TIBSubscriptionInfo then
  begin
    FForTable := TIBSubscriptionInfo(Source).ForTable;
    FColumnList.Assign(TIBSubscriptionInfo(Source).Columns);
    FDmlActions := TIBSubscriptionInfo(Source).DmlActions;
  end
  else
    inherited;
end;

procedure TIBSubscriptionInfo.Clear;
begin
  FForTable := '';             {do not localize }
  FColumnList.Clear;
  FDmlActions := [];
end;

constructor TIBSubscriptionInfo.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FColumnList := TStringList.Create;
end;

function TIBSubscriptionInfo.CreateSQL: String;
var
  IntroString : String;
begin
  if Assigned(Database) then
    Result := '    ' + QuoteIdentifier(Database.SQLDialect, ForTable) + GetColumns {do not localize }
  else
    Result := '    ' + QuoteIdentifier(3, ForTable) + GetColumns; {do not localize }
  if FDmlActions <> [] then
    Result := Result + ' FOR ROW '; {do not localize }

  IntroString := '';
  if diInsert in FDmlActions then
    if IntroString.Length = 0 then
      IntroString := '(INSERT'           {do not localize }
    else
      IntroString := IntroString + ', INSERT';   {do not localize }

  if diUpdate in FDmlActions then
    if IntroString.Length = 0 then
      IntroString := '(UPDATE'     {do not localize }
    else
      IntroString := IntroString + ', UPDATE';   {do not localize }

  if diDelete in FDmlActions then
    if IntroString.Length = 0 then
      IntroString := '(DELETE' {do not localize }
    else
      IntroString := IntroString + ', DELETE';  {do not localize }

  if IntroString.Length > 0 then
    Result := Result + IntroString + ')'; {do not localize }
end;

destructor TIBSubscriptionInfo.Destroy;
begin
  FColumnList.Free;
  inherited;
end;

function TIBSubscriptionInfo.GetColumns: String;
var
  tmpList : TStringList;
  i : Integer;
  SQLDialect : Integer;
begin
  if FColumnList.Count > 0 then
  begin
    if Assigned(Database) then
      SQLDialect := Database.SQLDialect
    else
      SQLDialect := 3;
    tmpList := TStringList.Create;
    try
      tmpList.Assign(FColumnList);
      tmpList.QuoteChar := #0;
      for i := 0 to tmpList.Count - 1 do
        tmpList[i] := QuoteIdentifier(SQLDialect, tmpList[i]);
      Result := tmpList.DelimitedText;
      Result := ' (' + StringReplace(Result, ',', ', ', [rfReplaceAll]) + ')'; {do not localize }
    finally
      tmpList.Free;
    end;
  end
  else
    Result := ''; {do not localize }
end;

function TIBSubscriptionInfo.GetDatabase: TIBDataBase;
begin
  Result := (Collection as TIBSubscriptionInfos).Database;
end;

function TIBSubscriptionInfo.GetDisplayName: string;
begin
  Result := FForTable;
end;

function TIBSubscriptionInfo.GetTransaction: TIBTransaction;
begin
  Result := (Collection as TIBSubscriptionInfos).Transaction;
end;

procedure TIBSubscriptionInfo.SetColumnList(const Value: TStrings);
begin
  FColumnList.CommaText := Value.CommaText;
end;

initialization
  RegisterClasses([TIBSubscriptionInfos, TIBSubscriptionInfo,
        TIBSubscriptionItems, TIBSubscriptionItem]);

end.
