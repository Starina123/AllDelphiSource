{$A8} {$R-}
{*************************************************************}
{                                                             }
{       Embarcadero Delphi Visual Component Library           }
{       InterBase Express core components                     }
{                                                             }
{       Copyright (c) 1998-2017 Embarcadero Technologies, Inc.}
{              All rights reserved                            }
{                                                             }
{    Additional code created by Jeff Overcash and used        }
{    with permission.                                         }
{*************************************************************}

unit IBX.IBExtract;

interface

uses
  System.Classes, IBX.IBDatabase, IBX.IBDatabaseInfo, IBX.IBSQL, IBX.IBHeader,
  System.Generics.Collections, IBX.IB, IBX.IBExternals;

type
  TExtractObjectTypes =
    (eoDatabase, eoDomain, eoTable, eoView, eoProcedure, eoFunction,
     eoGenerator, eoException, eoBLOBFilter, eoRole, eoTrigger, eoForeign,
     eoIndexes, eoChecks, eoData, eoEUAUser, eoEncryption, eoGrants,
     eoSubscription);

  TExtractType =
    (etDomain, etTable, etRole, etTrigger, etForeign,
     etIndex, etData, etGrant, etCheck, etAlterProc, etEUAUser, etEncryption);

  TExtractTypes = Set of TExtractType;

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBExtract = class(TComponent)
  private
    FBase : TIBBase;
    FMetaData: TStrings;
    FDatabaseInfo: TIBDatabaseInfo;
    FShowSystem: Boolean;
    FIncludeSetTerm: Boolean;
    FDefaultCharSet : Integer;
    FConnectAsOwner: Boolean;
    FOverrideSQLDialect: Integer;
    qryTables, qryConstraints, qryRelConstraints, qryEncryption : TIBSQL;
    { used in subscription stuff }
    sqlMain, sqlTables, sqlColumns : TIBSQL;

    qryProcedures : TIBSQL;
    ODSMajorVersion : Integer;
    DBSQLDialect : Integer;
    FullODS : Extended;
    FIncludeComments: Boolean;
    { Private declarations }
    function GetDatabase: TIBDatabase;
    function GetIndexSegments ( indexname : String) : String;
    function GetTransaction: TIBTransaction;
    procedure SetDatabase(const Value: TIBDatabase);
    procedure SetTransaction(const Value: TIBTransaction);
    function PrintValidation(ToValidate : String;	flag : Boolean) : String;
    procedure ShowGrants(MetaObject: String; Terminator : String);
    procedure ShowGrantRoles(Terminator : String);
    procedure GetProcedureArgs(Proc : String; args : TStrings);
    function GetFieldLength(sql : TIBSQL) : Integer; overload;
    function CreateIBSQL : TIBSQL;
    procedure BuildConnectString;
    function GetDialect : Integer; inline;
    procedure SetOverrideSQLDialect(const Value: Integer);
  protected
    function ExtractDDL(Flag : Boolean; TableName : String) : Boolean;
    function ExtractListTable(RelationName, NewName : String; DomainFlag : Boolean; aQry : TIBSQL = nil) : Boolean;
    procedure ExtractListView (ViewName : String);
    procedure ListData(ObjectName : String);
    procedure ListRoles(ObjectName : String = '');  {do not localize}
    procedure ListGrants; overload;
    procedure ListGrants(ObjectName : string); overload;
    procedure ListProcs(ProcedureName : String = ''; AlterOnly : Boolean = false);  {do not localize}
    procedure ListAllTables(flag : Boolean);
    procedure ListTriggers(ObjectName : String = ''; ExtractType : TExtractType = etTrigger); {do not localize}
    procedure ListCheck(ObjectName : String = ''; ExtractType : TExtractType = etCheck);  {do not localize}
    function PrintSet(var Used : Boolean) : String;
    procedure ListCreateDb(TargetDb : String = ''); {do not localize}
    procedure ListDomains(ObjectName : String = ''; ExtractType : TExtractType = etDomain);  {do not localize}
    procedure ListException(ExceptionName : String = ''); {do not localize}
    procedure ListFilters(FilterName : String = ''); {do not localize}
    procedure ListForeign(ObjectName : String = ''; ExtractType : TExtractType = etForeign); {do not localize}
    procedure ListFunctions(FunctionName : String = ''); {do not localize}
    procedure ListGenerators(GeneratorName : String = '');  {do not localize}
    procedure ListIndex(ObjectName : String = ''; ExtractType : TExtractType = etIndex);  {do not localize}
    procedure ListViews(ViewName : String = '');  {do not localize}
    procedure ListEUAUsers;
    procedure ListEncryptions(EncryptionName : String = '');  {do not localize}
    procedure ListSubscriptions(SubscriptionName : String = ''); { do not localize }
    procedure CheckAssigned;
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function GetArrayField(FieldName : String) : String;
    function GetFieldType(FieldType, FieldSubType, FieldScale, FieldSize,
      FieldPrec, FieldLen : Integer) : String;
    function GetCharacterSets(CharSetId, Collation : Short;	CollateOnly : Boolean) : String;
    procedure ExtractObject(ObjectType : TExtractObjectTypes; ObjectName : String = '';  {do not localize}
      ExtractTypes : TExtractTypes = []);
    property DatabaseInfo : TIBDatabaseInfo read FDatabaseInfo;
    property Items : TStrings read FMetaData;

  published
    { Published declarations }
    property Database : TIBDatabase read GetDatabase write SetDatabase;
    property Transaction : TIBTransaction read GetTransaction write SetTransaction;
    property ShowSystem: Boolean read FShowSystem write FShowSystem default false;
    property IncludeSetTerm : Boolean read FIncludeSetTerm write FIncludeSetTerm Default false;
    property ConnectAsOwner : Boolean read FConnectAsOwner write FConnectAsOwner Default false;
    property OverrideSQLDialect : Integer read FOverrideSQLDialect write SetOverrideSQLDialect;
    [default (True)]
    property IncludeComments : Boolean read FIncludeComments write FIncludeComments;
  end;

  TSQLType = record
    SqlType : Integer;
    TypeName : String;
  end;

  TPrivTypes = record
    PrivFlag : Integer;
    PrivString : String;
  end;

  TSQLTypes = Array[0..14] of TSQLType;

const

  priv_UNKNOWN = 1;
  priv_SELECT = 2;
  priv_INSERT = 4;
  priv_UPDATE = 8;
  priv_DELETE = 16;
  priv_EXECUTE = 32;
  priv_REFERENCES = 64;
  priv_DECRYPT = 128;

 PrivTypes : Array[0..6] of TPrivTypes = (
  (PrivFlag : priv_DELETE; PrivString : 'DELETE' ),  {do not localize}
  (PrivFlag : priv_EXECUTE; PrivString : 'EXECUTE' ), {do not localize}
  (PrivFlag : priv_INSERT; PrivString : 'INSERT' ),   {do not localize}
  (PrivFlag : priv_SELECT; PrivString : 'SELECT' ),    {do not localize}
  (PrivFlag : priv_UPDATE; PrivString : 'UPDATE' ),    {do not localize}
  (PrivFlag : priv_REFERENCES; PrivString : 'REFERENCES'), {do not localize}
  (PrivFlag : priv_DECRYPT; PrivString : 'DECRYPT')); {do not localize}

  SubTypes : Array[0..8] of String = (
    'UNKNOWN',			    {do not localize}
    'TEXT',				 {do not localize}
    'BLR',				  {do not localize}
    'ACL',				  {do not localize}
    'RANGES',			   {do not localize}
    'SUMMARY',			   {do not localize}
    'FORMAT',			   {do not localize}
    'TRANSACTION_DESCRIPTION',	   {do not localize}
    'EXTERNAL_FILE_DESCRIPTION');	 {do not localize}

  TriggerTypes : Array[0..6] of String = (
    '',       {do not localize}
    'BEFORE INSERT', {do not localize}
    'AFTER INSERT',  {do not localize}
    'BEFORE UPDATE',			  {do not localize}
    'AFTER UPDATE',				 {do not localize}
    'BEFORE DELETE',			   {do not localize}
    'AFTER DELETE');			  {do not localize}

  IntegralSubtypes : Array[0..2] of String = (
    'UNKNOWN',   {do not localize}
    'NUMERIC',   {do not localize}
    'DECIMAL');  {do not localize}

  ODS_VERSION6 = 6;	{ on-disk structure as of v3.0 }
  ODS_VERSION7 = 7;	{ new on disk structure for fixing index bug }
  ODS_VERSION8 =	8;	{ new btree structure to support pc semantics }
  ODS_VERSION9 =	9;	{ btree leaf pages are always propogated up }
  ODS_VERSION10 = 10; { V6.0 features. SQL delimited idetifier,
                                        SQLDATE, and 64-bit exact numeric
                                        type }
  ODS_VERSION16 = 16; {XE7 Subscriptions }

  { flags for RDB$FILE_FLAGS }
  FILE_shadow = 1;
  FILE_inactive = 2;
  FILE_manual = 4;
  FILE_cache = 8;
  FILE_conditional = 16;

  { flags for RDB$LOG_FILES }
  LOG_serial = 1;
  LOG_default = 2;
  LOG_raw = 4;
  LOG_overflow = 8;



  MAX_INTSUBTYPES = 2;
  MAXSUBTYPES = 8;     { Top of subtypes array }

{ Object types used in RDB$DEPENDENCIES and RDB$USER_PRIVILEGES }

  obj_relation = 0;
  obj_view = 1;
  obj_trigger = 2;
  obj_computed = 3;
  obj_validation = 4;
  obj_procedure = 5;
  obj_expression_index = 6;
  obj_exception = 7;
  obj_user = 8;
  obj_field = 9;
  obj_index = 10;
  obj_count = 11;
  obj_user_group = 12;
  obj_sql_role = 13;
  obj_subscription = 16;

var
  ColumnTypes : TDictionary<SmallInt, string>;

implementation

uses 
  System.SysUtils, IBX.IBUtils, IBX.IBXConst, System.Character, System.Math;

const
  NEWLINE = #13#10;  {do not localize}
  TERM = ';';   {do not localize}
  ProcTerm = '^';  {do not localize}
  SPassword = 'Enter Password here'; {do not localize}

  CollationSQL =
    'SELECT CST.RDB$CHARACTER_SET_NAME, COL.RDB$COLLATION_NAME, CST.RDB$DEFAULT_COLLATE_NAME ' + {do not localize}
    '  FROM RDB$COLLATIONS COL JOIN RDB$CHARACTER_SETS CST ON ' +   {do not localize}
    '       COL.RDB$CHARACTER_SET_ID = CST.RDB$CHARACTER_SET_ID ' + {do not localize}
    ' WHERE COL.RDB$COLLATION_ID = :COLLATION AND ' +  {do not localize}
    '       CST.RDB$CHARACTER_SET_ID = :CHAR_SET_ID ' +   {do not localize}
    ' ORDER BY COL.RDB$COLLATION_NAME, CST.RDB$CHARACTER_SET_NAME'; {do not localize}

  NonCollationSQL =
    'SELECT CST.RDB$CHARACTER_SET_NAME ' +   {do not localize}
    '  FROM RDB$CHARACTER_SETS CST ' + {do not localize}
    ' WHERE CST.RDB$CHARACTER_SET_ID = :CHARSETID ' +  {do not localize}
    ' ORDER BY CST.RDB$CHARACTER_SET_NAME';   {do not localize}

  PrecisionSQL =
    'SELECT * FROM RDB$FIELDS ' +   {do not localize}
    ' WHERE RDB$FIELD_NAME = :FIELDNAME';  {do not localize}

  ArraySQL =
    'SELECT * FROM RDB$FIELD_DIMENSIONS FDIM ' + {do not localize}
    ' WHERE ' +  {do not localize}
    '  FDIM.RDB$FIELD_NAME = :FIELDNAME ' + {do not localize}
    ' ORDER BY FDIM.RDB$DIMENSION';  {do not localize}

  DefaultCharSetSQL = 'SELECT CST.RDB$CHARACTER_SET_ID ' + {not not localize}
                      '  FROM RDB$CHARACTER_SETS CST JOIN RDB$DATABASE DB ON ' + {do not localize}
                      '       CST.RDB$CHARACTER_SET_NAME = DB.RDB$CHARACTER_SET_NAME '; {do not localize}

{ TIBExtract }

{	                ArrayDimensions
   Functional description
   Retrieves the dimensions of arrays and prints them.

  	Parameters:  fieldname -- the actual name of the array field }

function TIBExtract.GetArrayField(FieldName: String): String;
var
  qryArray : TIBSQL;
begin
  qryArray := CreateIBSQL;
  Result := '[';   {do not localize}
  qryArray.SQL.Add(ArraySQL);
  qryArray.Params.ByName('FieldName').AsTrimString := FieldName;  {do not localize}
  qryArray.ExecQuery;

    {  Format is [lower:upper, lower:upper,..]  }

  while not qryArray.Eof do
  begin
    if (qryArray.FieldByName('RDB$DIMENSION').AsInteger > 0) then  {do not localize}
      Result := Result + ', ';      {do not localize}
    Result := Result + qryArray.FieldByName('RDB$LOWER_BOUND').AsTrimString + ':' +  {do not localize}
           qryArray.FieldByName('RDB$UPPER_BOUND').AsTrimString;   {do not localize}
    qryArray.Next;
  end;

  Result := Result + '] '; {do not localize}
  qryArray.Free;

end;

procedure TIBExtract.CheckAssigned;
begin
  if not Assigned(FBase.Transaction) then
    IBError(ibxeTransactionNotAssigned, []);
  if not Assigned(FBase.Database) then
    IBError(ibxeDatabaseNotAssigned, []);
end;

constructor TIBExtract.Create(AOwner: TComponent);
begin
  inherited;
  FMetaData := TStringList.Create;
  FDatabaseInfo := TIBDatabaseInfo.Create(nil);
  FBase := TIBBase.Create(self);
  if AOwner is TIBDatabase then
    Database := TIBDatabase(AOwner);
  if AOwner is TIBTransaction then
    Transaction := TIBTransaction(AOwner);
  FDatabaseInfo.Database := FBase.Database;
  FIncludeComments := True;
end;

destructor TIBExtract.Destroy;
begin
  FMetaData.Free;
  FDatabasEInfo.Free;
  { All owned by component so do not Free }
  qryTables := nil;
  qryConstraints := nil;
  qryRelConstraints := nil;
  qryEncryption := nil;
  qryProcedures := nil;
  FBase.DisposeOf;
  FBase := nil;
  inherited;
end;

function TIBExtract.ExtractDDL(Flag: Boolean; TableName: String) : Boolean;
var
	DidConnect : Boolean;
	DidStart : Boolean;
begin
  Result := true;
  DidConnect := false;
  DidStart := false;

  if not FBase.Database.Connected then
  begin
    FBase.Database.Connected := true;
    didConnect := true;
  end;

  FMetaData.Add(Format('SET SQL DIALECT %d;', [GetDialect]));  {do not localize}
  FMetaData.Add('');

  if not FBase.Transaction.Active then
  begin
    FBase.Transaction.StartTransaction;
    DidStart := true;
  end;

  if TableName <> '' then
  begin
    if not ExtractListTable(TableName, '', true) then
      Result := false;
  end
  else
  begin
    ListCreateDb;
    ListEUAUsers;
    ListEncryptions;
    if ConnectAsOwner then
      BuildConnectString;
    ListFilters;
    ListFunctions;
    ListDomains;
    ListAllTables(flag);
    ListIndex;
    ListForeign;
    ListGenerators;
    ListSubscriptions;
    ListViews;
    ListCheck;
    ListException;
    ListProcs;
    ListTriggers;
    ListGrants;
  end;

  if DidStart then
    FBase.Transaction.Commit;

  if DidConnect then
    FBase.Database.Connected := false;
end;

{                   ExtractListTable
  Functional description
  	Shows columns, types, info for a given table name
  	and text of views.
  	If a new_name is passed, substitute it for relation_name

  	relation_name -- Name of table to investigate
  	new_name -- Name of a new name for a replacement table
  	domain_flag -- extract needed domains before the table }

function TIBExtract.ExtractListTable(RelationName, NewName: String; DomainFlag: Boolean; aQry: TIBSQL = nil): Boolean;
const
  TableListSQL = 'SELECT * FROM RDB$RELATIONS REL JOIN RDB$RELATION_FIELDS RFR ON ' + { Do Not Localize }
    '  RFR.RDB$RELATION_NAME = REL.RDB$RELATION_NAME JOIN RDB$FIELDS FLD ON ' + { do not localize }
    '  RFR.RDB$FIELD_SOURCE = FLD.RDB$FIELD_NAME ' + { do not localize }
    'WHERE REL.RDB$RELATION_NAME = :RelationName ' + { do not localize }
    'ORDER BY RFR.RDB$FIELD_POSITION, RFR.RDB$FIELD_NAME'; { do not localize }

  ConstraintSQL = 'SELECT RCO.RDB$CONSTRAINT_NAME, RDB$CONSTRAINT_TYPE, RDB$RELATION_NAME, ' + { do not localize }
    'RDB$DEFERRABLE, RDB$INITIALLY_DEFERRED, RDB$INDEX_NAME, RDB$TRIGGER_NAME ' + { do not localize }
    'FROM RDB$RELATION_CONSTRAINTS RCO, RDB$CHECK_CONSTRAINTS CON ' + { do not localize }
    'WHERE ' + { do not localize }
    '  CON.RDB$TRIGGER_NAME = :FIELDNAME AND ' + { do not localize }
    '  CON.RDB$CONSTRAINT_NAME = RCO.RDB$CONSTRAINT_NAME AND ' + { do not localize }
    '  RCO.RDB$CONSTRAINT_TYPE = ''NOT NULL'' AND ' + { do not localize }
    '  RCO.RDB$RELATION_NAME = :RELATIONNAME'; { do not localize }

  RelConstraintsSQL = 'SELECT * FROM RDB$RELATION_CONSTRAINTS RELC ' + { do not localize }
    'WHERE ' + { do not localize }
    '  (RELC.RDB$CONSTRAINT_TYPE = ''PRIMARY KEY'' OR ' + { do not localize }
    '  RELC.RDB$CONSTRAINT_TYPE = ''UNIQUE'') AND ' + { do not localize }
    '  RELC.RDB$RELATION_NAME = :RELATIONNAME ' + { do not localize }
    'ORDER BY RELC.RDB$CONSTRAINT_NAME'; { do not localize }

  ColumnEncrptionSQL = 'SELECT * FROM RDB$ENCRYPTIONS ' + { do not localize }
    'WHERE ' + { do not localize }
    '  RDB$ENCRYPTION_ID = :ENCRYPTION_ID'; { do not localize }

var
  Collation, CharSetId: Short;
  ColList, Column, Constraint, TableBase, OnCommit: String;
  SubType: Short;
  IntChar: Short;
  qryMain: TIBSQL;
  PrecisionKnown, ValidRelation: Boolean;
  FieldScale, FieldType: Integer;

  function FixupDefault(default: string): String;
  var
    i: Integer;
  begin
    if (GetDialect = 1) or (default [high(default)] <> '"') then
      Exit(default);
    i := default.ToUpper.IndexOf('DEFAULT ') + 8;
    while (i <= High(default)) and (default [i] = ' ') do
      Inc(i);
    if default [i] = '"' then
    begin
      default [i] := '''';
      default [High(default)] := '''';
    end;
    Result := default;
  end;

begin
  Result := true;
  ColList := ''; { do not localize }
  IntChar := 0;
  ValidRelation := false;

  if DomainFlag then
    ListDomains(RelationName);
  if not Assigned(qryTables) then
  begin
    qryTables := CreateIBSQL;
    qryTables.sql.Add(TableListSQL);
  end;
  if not Assigned(qryConstraints) then
  begin
    qryConstraints := CreateIBSQL;
    qryConstraints.sql.Add(ConstraintSQL);
  end;
  if not Assigned(qryRelConstraints) then
  begin
    qryRelConstraints := CreateIBSQL;
    qryRelConstraints.sql.Add(RelConstraintsSQL);
  end;
  if not Assigned(qryEncryption) then
  begin
    qryEncryption := CreateIBSQL;
    qryEncryption.sql.Add(ColumnEncrptionSQL);
  end;

  if Assigned(aQry) then
    qryMain := aQry
  else
  begin
    qryMain := qryTables;
    qryMain.Params.ByName('RelationName').AsTrimString := RelationName; { do not localize }
    qryMain.ExecQuery;
  end;
  if not qryMain.Eof then
  begin
    if (FullODS > 11.1) then
      case qryMain.FieldByName('RDB$Flags').AsInt64 of
        11:
          OnCommit := ' ON COMMIT DELETE ROWS';
        19:
          OnCommit := ' ON COMMIT PRESERVE ROWS';
      else
        OnCommit := '';
      end
    else
      OnCommit := '';

    ValidRelation := true;
    if (not qryMain.FieldByName('RDB$OWNER_NAME').IsNull) and { do not localize }
      (Trim(qryMain.FieldByName('RDB$OWNER_NAME').AsTrimString) <> '') then { do not localize }
      if IncludeComments then
        FMetaData.Add(Format('%s/* Table: %s, Owner: %s */%s', { do not localize }
          [NEWLINE, RelationName, qryMain.FieldByName('RDB$OWNER_NAME').AsTrimString, NEWLINE])); { do not localize }
    TableBase := 'CREATE TABLE %s ';
    if FullODS > 11.1 then
      if qryMain.FieldByName('RDB$RELATION_TYPE').AsString.Contains('TEMPORARY') then
        TableBase := 'CREATE GLOBAL TEMPORARY TABLE %s';

    if NewName <> '' then { do not localize }
      FMetaData.Add(Format(TableBase, [QuoteIdentifier(GetDialect, NewName)])) { do not localize }
    else
      FMetaData.Add(Format(TableBase, [QuoteIdentifier(GetDialect, RelationName)])); { do not localize }
    if not qryMain.FieldByName('RDB$EXTERNAL_FILE').IsNull then { do not localize }
      FMetaData.Add(Format('EXTERNAL FILE %s ', { do not localize }
        [QuotedStr(qryMain.FieldByName('RDB$EXTERNAL_FILE').AsTrimString)])); { do not localize }
    FMetaData.Add('(');
  end;

  while (not qryMain.Eof) and qryMain.FieldByName('rdb$relation_name').AsString.Trim.Equals(RelationName.Trim) do
  begin
    Column := '  ' + QuoteIdentifier(GetDialect, qryMain.FieldByName('RDB$FIELD_NAME').AsTrimString) + TAB; { do not localize }

    { Check first for computed fields, then domains.
      If this is a known domain, then just print the domain rather than type
      Domains won't have length, array, or blob definitions, but they
      may have not null, default and check overriding their definitions }

    if not qryMain.FieldByName('rdb$computed_blr').IsNull then { do not localize }
    begin
      Column := Column + ' COMPUTED BY '; { do not localize }
      if not qryMain.FieldByName('RDB$COMPUTED_SOURCE').IsNull then { do not localize }
        Column := Column + PrintValidation(qryMain.FieldByName('RDB$COMPUTED_SOURCE').AsTrimString, true); { do not localize }
    end
    else
    begin
      FieldType := qryMain.FieldByName('RDB$FIELD_TYPE').AsInteger; { do not localize }
      FieldScale := qryMain.FieldByName('RDB$FIELD_SCALE').AsInteger; { do not localize }
      if not((qryMain.FieldByName('RDB$FIELD_NAME1').AsString.Trim.StartsWith('RDB$')) and { do not localize }
        qryMain.FieldByName('RDB$FIELD_NAME1').AsTrimString[Low(String) + 4].IsNumber) and { do not localize }
        (qryMain.FieldByName('RDB$SYSTEM_FLAG').AsInteger <> 1) then { do not localize }
      begin
        Column := Column + QuoteIdentifier(GetDialect, qryMain.FieldByName('RDB$FIELD_NAME1').AsTrimString); { do not localize }
        { International character sets }
        if (qryMain.FieldByName('RDB$FIELD_TYPE').AsInteger in [blr_text, blr_varying]) { do not localize }
          and (not qryMain.FieldByName('RDB$COLLATION_ID').IsNull) { do not localize }
          and (qryMain.FieldByName('RDB$COLLATION_ID').AsShort <> 0) then { do not localize }
          IntChar := 1;
      end
      else
      begin
        PrecisionKnown := false;
        if ODSMajorVersion >= ODS_VERSION10 then
        begin
          { Handle Integral subtypes NUMERIC and DECIMAL }
          if qryMain.FieldByName('RDB$FIELD_TYPE').AsShort in { do not localize }
            [blr_short, blr_long, blr_int64] then
          begin
            { We are ODS >= 10 and could be any Dialect }
            if not qryMain.FieldByName('RDB$FIELD_PRECISION').IsNull then { do not localize }
            begin
              { We are Dialect >=3 since FIELD_PRECISION is non-NULL }
              if (qryMain.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger > 0) and { do not localize }
                (qryMain.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger <= MAX_INTSUBTYPES) then { do not localize }
              begin
                Column := Column + Format('%s(%d, %d)', { do not localize }
                  [IntegralSubtypes[qryMain.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger], { do not localize }
                  qryMain.FieldByName('RDB$FIELD_PRECISION').AsInteger, { do not localize }
                  -qryMain.FieldByName('RDB$FIELD_SCALE').AsInteger]); { do not localize }
                PrecisionKnown := true;
              end;
            end;
          end;
        end;

        if PrecisionKnown = false then
        begin
          { Take a stab at numerics and decimals }
          if (FieldType = blr_short) and (FieldScale < 0) then
            Column := Column + Format('NUMERIC(4, %d)', [-FieldScale]) { do not localize }
          else
            if (FieldType = blr_long) and (FieldScale < 0) then
              Column := Column + Format('NUMERIC(9, %d)', [-FieldScale]) { do not localize }
            else
              if (FieldType = blr_double) and (FieldScale < 0) then
                Column := Column + Format('NUMERIC(15, %d)', [-FieldScale]) { do not localize }
              else
                Column := Column + ColumnTypes.Items[qryMain.FieldByName('RDB$FIELD_TYPE').AsShort];
        end;
        if FieldType in [blr_text, blr_varying] then
          Column := Column + Format('(%d)', [GetFieldLength(qryMain)]); { do not localize }

        { Catch arrays after printing the type }

        if not qryMain.FieldByName('RDB$DIMENSIONS').IsNull then { do not localize }
          Column := Column + GetArrayField(qryMain.FieldByName('RDB$FIELD_NAME1').AsTrimString); { do not localize }

        if FieldType = blr_blob then
        begin
          SubType := qryMain.FieldByName('RDB$FIELD_SUB_TYPE').AsShort; { do not localize }
          Column := Column + ' SUB_TYPE '; { do not localize }
          if (SubType > 0) and (SubType <= MAXSUBTYPES) then
            Column := Column + SubTypes[SubType]
          else
            Column := Column + IntToStr(SubType);
          Column := Column + Format(' SEGMENT SIZE %d', { do not localize }
            [qryMain.FieldByName('RDB$SEGMENT_LENGTH').AsInteger]); { do not localize }
        end;

        { International character sets }
        if ((FieldType in [blr_text, blr_varying]) or (FieldType = blr_blob)) and (not qryMain.FieldByName('RDB$CHARACTER_SET_ID').IsNull) and
        { do not localize }
          (qryMain.FieldByName('RDB$CHARACTER_SET_ID').AsInteger <> 0) then { do not localize }
        begin
          { Override rdb$fields id with relation_fields if present }

          CharSetId := 0;
          if not qryMain.FieldByName('RDB$CHARACTER_SET_ID').IsNull then { do not localize }
            CharSetId := qryMain.FieldByName('RDB$CHARACTER_SET_ID').AsInteger; { do not localize }

          Column := Column + GetCharacterSets(CharSetId, 0, false);
          IntChar := 1;
        end;
      end;

      { Handle defaults for columns }
      { Originally This called PrintMetadataTextBlob,
        should no longer need }
      if not qryMain.FieldByName('RDB$DEFAULT_SOURCE').IsNull then { do not localize }
        Column := Column + ' ' + FixupDefault(qryMain.FieldByName('RDB$DEFAULT_SOURCE').AsTrimString); { do not localize }

      { The null flag is either 1 or null (for nullable) .  if there is
        a constraint name, print that too.  Domains cannot have named
        constraints.  The column name is in rdb$trigger_name in
        rdb$check_constraints.  We hope we get at most one row back. }

      if qryMain.FieldByName('RDB$NULL_FLAG').AsInteger = 1 then { do not localize }
      begin
        qryConstraints.Params.ByName('FIELDNAME').AsTrimString := qryMain.FieldByName('RDB$FIELD_NAME').AsTrimString; { do not localize }
        qryConstraints.Params.ByName('RELATIONNAME').AsTrimString := qryMain.FieldByName('RDB$RELATION_NAME').AsTrimString; { do not localize }
        qryConstraints.ExecQuery;

        while not qryConstraints.Eof do
        begin
          if not qryConstraints.FieldByName('RDB$CONSTRAINT_NAME').AsTrimString.StartsWith('INTEG') then { do not localize }
            Column := Column + Format(' CONSTRAINT %s', { do not localize }
              [QuoteIdentifier(GetDialect, qryConstraints.FieldByName('RDB$CONSTRAINT_NAME').AsTrimString)]); { do not localize }
          qryConstraints.Next;
        end;
        qryConstraints.Close;
        Column := Column + ' NOT NULL'; { do not localize }
      end;

      if ((FieldType in [blr_text, blr_varying]) or (FieldType = blr_blob)) and (not qryMain.FieldByName('RDB$CHARACTER_SET_ID').IsNull) and { do not localize }
        (qryMain.FieldByName('RDB$CHARACTER_SET_ID').AsInteger <> 0) and { do not localize }
        (IntChar <> 0) then
      begin
        Collation := 0;
        if not qryMain.FieldByName('RDB$COLLATION_ID1').IsNull then { do not localize }
          Collation := qryMain.FieldByName('RDB$COLLATION_ID1').AsInteger { do not localize }
        else
          if not qryMain.FieldByName('RDB$COLLATION_ID').IsNull then { do not localize }
            Collation := qryMain.FieldByName('RDB$COLLATION_ID').AsInteger; { do not localize }

        CharSetId := 0;
        if not qryMain.FieldByName('RDB$CHARACTER_SET_ID').IsNull then { do not localize }
          CharSetId := qryMain.FieldByName('RDB$CHARACTER_SET_ID').AsInteger; { do not localize }

        if Collation <> 0 then
          Column := Column + GetCharacterSets(CharSetId, Collation, true);
      end;
    end;
    if (FullODS >= 13.0) and (not qryMain.FieldByName('RDB$ENCRYPTION_ID').IsNull) then
    begin
      try
        qryEncryption.Params.ByName('ENCRYPTION_ID').AsInteger := qryMain.FieldByName('RDB$ENCRYPTION_ID').AsInteger; { do not localize }
        qryEncryption.ExecQuery;
        if not qryEncryption.Eof then
        begin
          Column := Column + ' ENCRYPT WITH ' + { do not localize }
            QuoteIdentifier(GetDialect, qryEncryption.FieldByName('RDB$ENCRYPTION_NAME').AsTrimString); { do not localize }
          if not qryMain.FieldByName('RDB$DECRYPT_DEFAULT_SOURCE').IsNull then { do not localize }
            Column := Column + ' ' + qryMain.FieldByName('RDB$DECRYPT_DEFAULT_SOURCE').AsTrimString; { do not localize }
        end;
        qryEncryption.Close;
      except
        // if the user does no have access to the Encryption table to read
        // ignore exception.  This can happen on upgraded databases as the
        // rights are not set correctly in IB 2009
      end;
    end;

    qryMain.Next;
    if not qryMain.Eof and qryMain.FieldByName('rdb$relation_name').AsString.Trim.Equals(RelationName) then
      Column := Column + ','; { do not localize }
    FMetaData.Add(Column);
  end;

  { Do primary and unique keys only. references come later }

  qryRelConstraints.Params.ByName('relationname').AsTrimString := RelationName; { do not localize }
  qryRelConstraints.ExecQuery;
  while not qryRelConstraints.Eof do
  begin
    Constraint := '';
    FMetaData.Strings[FMetaData.Count - 1] := FMetaData.Strings[FMetaData.Count - 1] + ','; { do not localize }
    { If the name of the constraint is not INTEG..., print it }
    if not qryRelConstraints.FieldByName('RDB$CONSTRAINT_NAME').AsTrimString.StartsWith('INTEG') then { do not localize }
      Constraint := Constraint + 'CONSTRAINT ' + { do not localize }
        QuoteIdentifier(GetDialect, qryRelConstraints.FieldByName('RDB$CONSTRAINT_NAME').AsTrimString); { do not localize }

    if qryRelConstraints.FieldByName('RDB$CONSTRAINT_TYPE').AsTrimString.StartsWith('PRIMARY') then { do not localize }
    begin
      FMetaData.Add(Constraint + Format(' PRIMARY KEY (%s)', { do not localize }
        [GetIndexSegments(qryRelConstraints.FieldByName('RDB$INDEX_NAME').AsTrimString)])); { do not localize }
    end
    else
      if qryRelConstraints.FieldByName('RDB$CONSTRAINT_TYPE').AsTrimString.StartsWith('UNIQUE') then { do not localize }
      begin
        FMetaData.Add(Constraint + Format(' UNIQUE (%s)', { do not localize }
          [GetIndexSegments(qryRelConstraints.FieldByName('RDB$INDEX_NAME').AsTrimString)])); { do not localize }
      end;
    qryRelConstraints.Next;
  end;
  if ValidRelation then
    FMetaData.Add(')' + OnCommit + TERM);
  if not Assigned(aQry) then
    qryMain.Close;
  qryConstraints.Close;
  qryRelConstraints.Close;
  qryEncryption.Close;
end;

{	           ExtractListView
  Functional description
   	Show text of the specified view.
   	Use a SQL query to get the info and print it.
 	  Note: This should also contain check option }

procedure TIBExtract.ExtractListView(ViewName: String);
const
  ViewsSQL = 'SELECT * FROM RDB$RELATIONS REL ' +   {do not localize}
             ' WHERE ' +   {do not localize}
             '  (REL.RDB$SYSTEM_FLAG <> 1 OR REL.RDB$SYSTEM_FLAG IS NULL) AND ' +  {do not localize}
             '  NOT REL.RDB$VIEW_BLR IS NULL AND ' +  {do not localize}
             '  REL.RDB$RELATION_NAME = :VIEWNAME AND ' +  {do not localize}
             '  REL.RDB$FLAGS = 1 ' + {do not localize}
             'ORDER BY REL.RDB$RELATION_ID ';  {do not localize}

  ColumnsSQL = 'SELECT * FROM RDB$RELATION_FIELDS RFR ' + {do not localize}
               'WHERE ' +  {do not localize}
               '  RFR.RDB$RELATION_NAME = :RELATIONNAME ' +   {do not localize}
               'ORDER BY RFR.RDB$FIELD_POSITION ';  {do not localize}

var
  qryViews, qryColumns : TIBSQL;
  RelationName, ColList : String;
begin
  qryViews := CreateIBSQL;
  qryColumns := CreateIBSQL;
  try
    qryViews.SQL.Add(ViewsSQL);
    qryViews.Params.ByName('viewname').AsTrimString := ViewName; {do not localize}
    qryViews.ExecQuery;
    while not qryViews.Eof do
    begin
      FMetaData.Add('');
      RelationName := QuoteIdentifier(GetDialect,
          qryViews.FieldByName('RDB$RELATION_NAME').AsTrimString);  {do not localize}
      if IncludeComments then
        FMetaData.Add(Format('%s/* View: %s, Owner: %s */%s', [  {do not localize}
          RelationName,
          Trim(qryViews.FieldByName('RDB$OWNER_NAME').AsTrimString)]));  {do not localize}
      FMetaData.Add('');
      FMetaData.Add(Format('CREATE VIEW %s (', [RelationName]));  {do not localize}

      { Get Column List}
      qryColumns.SQL.Add(ColumnsSQL);
      qryColumns.Params.ByName('relationname').AsTrimString := RelationName;  {do not localize}
      qryColumns.ExecQuery;
      while not qryColumns.Eof do
      begin
        ColList := ColList + QuoteIdentifier(GetDialect,
              qryColumns.FieldByName('RDB$FIELD_NAME').AsTrimString);    {do not localize}
        qryColumns.Next;
        if not qryColumns.Eof then
          ColList := ColList + ', ';     {do not localize}
      end;
      FMetaData.Add(ColList + ') AS');   {do not localize}
      FMetaData.Add(qryViews.FieldByName('RDB$VIEW_SOURCE').AsTrimString + Term);  {do not localize}
      qryViews.Next;
    end;
  finally
    qryViews.Free;
    qryColumns.Free;
  end;
end;

function TIBExtract.GetCharacterSets(CharSetId, Collation: Short;
  CollateOnly: Boolean): String;
var
  CharSetSQL : TIBSQL;
  DidActivate : Boolean;
begin
  if not FBase.Transaction.Active then
  begin
    FBase.Transaction.StartTransaction;
    DidActivate := true;
  end
  else
    DidActivate := false;
  Result := '';
  CharSetSQL := CreateIBSQL;
  try
    if Collation <> 0 then
    begin
      CharSetSQL.SQL.Add(CollationSQL);
      CharSetSQL.Params.ByName('Char_Set_Id').AsInteger := CharSetId;  {do not localize}
      CharSetSQL.Params.ByName('Collation').AsInteger := Collation;  {do not localize}
      CharSetSQL.ExecQuery;

      { Is specified collation the default collation for character set? }
      if (Trim(CharSetSQL.FieldByName('RDB$DEFAULT_COLLATE_NAME').AsTrimString) =  {do not localize}
         Trim(CharSetSQL.FieldByName('RDB$COLLATION_NAME').AsTrimString)) then   {do not localize}
      begin
        if not CollateOnly then
          Result := ' CHARACTER SET ' + Trim(CharSetSQL.FieldByName('RDB$CHARACTER_SET_NAME').AsTrimString); {do not localize}
      end
      else
        if CollateOnly or (CharSetId = FDefaultCharSet) then {do not localize}
          Result := ' COLLATE ' + Trim(CharSetSQL.FieldByName('RDB$COLLATION_NAME').AsTrimString)  {do not localize}
        else
          Result := ' CHARACTER SET ' +  {do not localize}
            Trim(CharSetSQL.FieldByName('RDB$CHARACTER_SET_NAME').AsTrimString) +  {do not localize}
            ' COLLATE ' +     {do not localize}
            Trim(CharSetSQL.FieldByName('RDB$COLLATION_NAME').AsTrimString);  {do not localize}
    end
    else
      if CharSetId <> 0 then
      begin
        CharSetSQL.SQL.Add(NonCollationSQL);
        CharSetSQL.Params.ByName('CharSetId').AsShort := CharSetId; {do not localize}
        CharSetSQL.ExecQuery;
        if (CharSetId <> FDefaultCharSet) then
          Result := ' CHARACTER SET ' + Trim(CharSetSQL.FieldByName('RDB$CHARACTER_SET_NAME').AsTrimString); {do not localize}
      end;
  finally
    CharSetSQL.Free;
  end;
  if DidActivate then
    FBase.Transaction.Commit;
end;

function TIBExtract.GetDatabase: TIBDatabase;
begin
  result := FBase.Database;
end;

function TIBExtract.GetDialect: Integer;
begin
  if FOverrideSQLDialect = 0 then
    Result := FBase.Database.SQLDialect
  else
    Result := FOverrideSQLDialect;
end;

{	          GetIndexSegments
   Functional description
  	returns the list of columns in an index. }

function TIBExtract.GetIndexSegments(IndexName: String): String;
const
  IndexNamesSQL =
    'SELECT * FROM RDB$INDEX_SEGMENTS SEG ' +  {do not localize}
    'WHERE SEG.RDB$INDEX_NAME = :INDEXNAME ' +  {do not localize}
    'ORDER BY SEG.RDB$FIELD_POSITION';   {do not localize}

var
  qryColNames : TIBSQL;
begin
{ Query to get column names }
  Result := '';
  qryColNames := CreateIBSQL;
  try
    qryColNames.SQL.Add(IndexNamesSQL);
    qryColNames.Params.ByName('IndexName').AsTrimString := IndexName;  {do not localize}
    qryColNames.ExecQuery;
    while not qryColNames.Eof do
    begin
      { Place a comma and a blank between each segment column name }

      Result := Result + QuoteIdentifier(GetDialect,
        qryColNames.FieldByName('RDB$FIELD_NAME').AsTrimString);  {do not localize}
      qryColNames.Next;
      if not qryColNames.Eof then
        Result := Result + ', ';   {do not localize}
    end;
  finally
    qryColNames.Free;
  end;
end;

function TIBExtract.GetTransaction: TIBTransaction;
begin
  Result := FBase.Transaction;
end;

{	   ListAllGrants
  Functional description
 	 Print the permissions on all user tables.
 	 Get separate permissions on table/views and then procedures }

procedure TIBExtract.ListGrants;
const
  SecuritySQL = 'SELECT * FROM RDB$RELATIONS ' +   {do not localize}
                'WHERE ' +     {do not localize}
                '  (RDB$SYSTEM_FLAG <> 1 OR RDB$SYSTEM_FLAG IS NULL) AND ' +  {do not localize}
                '  RDB$SECURITY_CLASS STARTING WITH ''SQL$'' ' +   {do not localize}
                'ORDER BY RDB$RELATION_NAME';   {do not localize}

  ProcedureSQL = 'select * from RDB$PROCEDURES ' +   {do not localize}
                 'Order BY RDB$PROCEDURE_NAME'; {do not localize}

  SubscriptionSQL = 'select distinct rdb$subscription_name from RDB$SUBSCRIPTIONS ' +   {do not localize}
                 'Order BY RDB$SUBSCRIPTION_NAME'; {do not localize}

var
  qryRoles : TIBSQL;
  RelationName : String;
begin
  ListRoles;
  qryRoles := CreateIBSQL;
  try
  { This version of cursor gets only sql tables identified by security class
     and misses views, getting only null view_source }

    FMetaData.Add('');   {do not localize}
    if IncludeComments then
      FMetaData.Add('/* Grant permissions for this database */');   {do not localize}
    FMetaData.Add('');   {do not localize}

    try
      qryRoles.SQL.Text := SecuritySQL;
      qryRoles.ExecQuery;
      while not qryRoles.Eof do
      begin
        RelationName := qryRoles.FieldByName('rdb$relation_Name').AsString.Trim;  {do not localize}
        ShowGrants(RelationName, Term);
        qryRoles.Next;
      end;
    finally
     qryRoles.Close;
    end;

    ShowGrantRoles(Term);

    qryRoles.SQL.Text := ProcedureSQL;
    qryRoles.ExecQuery;
    try
      while not qryRoles.Eof do
      begin
        ShowGrants(qryRoles.FieldByName('RDB$PROCEDURE_NAME').AsString.Trim, Term); {do not localize}
        qryRoles.Next;
      end;
    finally
      qryRoles.Close;
    end;
    if ODSMajorVersion >= ODS_VERSION16 then
    begin
      qryRoles.SQL.Text := SubscriptionSQL;
      qryRoles.ExecQuery;
      try
        while not qryRoles.Eof do
        begin
          ShowGrants(qryRoles.FieldByName('RDB$SUBSCRIPTION_NAME').AsString.Trim, Term); {do not localize}
          qryRoles.Next;
        end;
      finally
        qryRoles.Close;
      end;
    end;
  finally
    qryRoles.Free;
  end;
end;

{	  ListAllProcs
  Functional description
  	Shows text of a stored procedure given a name.
  	or lists procedures if no argument.
 	 Since procedures may reference each other, we will create all
  	dummy procedures of the correct name, then alter these to their
  	correct form.
       Add the parameter names when these procedures are created.

 	 procname -- Name of procedure to investigate }

procedure TIBExtract.ListProcs(ProcedureName : String; AlterOnly : Boolean);
const
  CreateProcedureStr1 = 'CREATE PROCEDURE %s ';  {do not localize}
  CreateProcedureStr2 = 'BEGIN EXIT; END %s%s';  {do not localize}
  ProcedureSQL =
    'SELECT PRO.RDB$PROCEDURE_NAME, PRO.RDB$PROCEDURE_SOURCE, RDB$PARAMETER_NAME, RDB$PARAMETER_TYPE, ' +    {do not localize}
    '       RDB$FIELD_TYPE, RDB$FIELD_SCALE, RDB$FIELD_PRECISION, RDB$FIELD_SUB_TYPE, ' + {do not localize}
    '       RDB$SEGMENT_LENGTH, RDB$COLLATION_ID, RDB$CHARACTER_SET_ID, RDB$CHARACTER_LENGTH ' + {do not localize}
    '  FROM RDB$PROCEDURES PRO LEFT OUTER join RDB$PROCEDURE_PARAMETERS PRM ON ' +    {do not localize}
    '       PRO.RDB$PROCEDURE_NAME = PRM.RDB$PROCEDURE_NAME LEFT OUTER JOIN RDB$FIELDS FLD ON ' +    {do not localize}
    '       PRM.RDB$FIELD_SOURCE = FLD.RDB$FIELD_NAME ' +    {do not localize}
    ' ORDER BY PRO.RDB$PROCEDURE_NAME, PRM.RDB$PARAMETER_TYPE, PRM.RDB$PARAMETER_NUMBER';    {do not localize}

  ProcedureNameSQL =
    'SELECT PRO.RDB$PROCEDURE_NAME, PRO.RDB$PROCEDURE_SOURCE, RDB$PARAMETER_NAME, RDB$PARAMETER_TYPE, ' +    {do not localize}
    '       RDB$FIELD_TYPE, RDB$FIELD_SCALE, RDB$FIELD_PRECISION, RDB$FIELD_SUB_TYPE, ' + {do not localize}
    '       RDB$SEGMENT_LENGTH, RDB$COLLATION_ID, RDB$CHARACTER_SET_ID, RDB$CHARACTER_LENGTH ' + {do not localize}
    '  FROM RDB$PROCEDURES PRO LEFT OUTER join RDB$PROCEDURE_PARAMETERS PRM ON ' +    {do not localize}
    '       PRO.RDB$PROCEDURE_NAME = PRM.RDB$PROCEDURE_NAME LEFT OUTER JOIN RDB$FIELDS FLD ON ' +    {do not localize}
    '       PRM.RDB$FIELD_SOURCE = FLD.RDB$FIELD_NAME ' +    {do not localize}
    ' WHERE PRO.RDB$PROCEDURE_NAME = :ProcedureName ' + {do not localize}
    ' ORDER BY PRO.RDB$PROCEDURE_NAME, PRM.RDB$PARAMETER_TYPE, PRM.RDB$PARAMETER_NUMBER';    {do not localize}

var
  ProcName : String;
  SList, sAlter, sCreate, sArgs : TStrings;
  Header : Boolean;
begin

  Header := true;
  if not Assigned(qryProcedures) then
    qryProcedures := CreateIBSQL;
  if ProcedureName = '' then
    qryProcedures.SQL.Text := ProcedureSQL
  else
    qryProcedures.SQL.Text := ProcedureNameSQL;
  SList := TStringList.Create;
  sAlter := TStringList.Create;
  sCreate := TStringList.Create;
  sArgs := TStringList.Create;
  try
{  First the dummy procedures
    create the procedures with their parameters }
    if Header then
    begin
      FMetaData.Add('COMMIT WORK;');  {do not localize}
      if FIncludeSetTerm then
        FMetaData.Add(Format('SET TERM %s %s', [ProcTerm, Term])); {do not localize}
      if IncludeComments then
        FMetaData.Add(Format('%s/* Stored procedures */%s', [NEWLINE, NEWLINE])); {do not localize}
      Header := false;
    end;
    if ProcedureName <> '' then
      qryProcedures.Params.ByName('ProcedureName').AsTrimString := ProcedureName; {do not localize}
    qryProcedures.ExecQuery;
    while not qryProcedures.Eof do
    begin
      ProcName := qryProcedures.FieldByName('RDB$PROCEDURE_NAME').AsString.Trim;  {do not localize}
      SList.Clear;
      if not qryProcedures.FieldByName('RDB$PROCEDURE_SOURCE').IsNull then  {do not localize}
      begin
        SList.Text := qryProcedures.FieldByName('RDB$PROCEDURE_SOURCE').AsString.Trim; {do not localize}
        while (Slist.Count > 0) and (Trim(SList[0]) = '') do  {do not localize}
          SList.Delete(0);
        if IncludeSetTerm then
          SList.Add(' ' + ProcTerm + NEWLINE)
        else
          SList.Add(' ' + Term + NEWLINE);
      sArgs.Clear;
      GetProcedureArgs(ProcName, sArgs);
      if not AlterOnly then
      begin
        sCreate.Add(Format(CreateProcedureStr1, [QuoteIdentifier(GetDialect,
           ProcName)]));
        sCreate.AddStrings(sArgs);
        if IncludeSetTerm then
          sCreate.Add(Format(CreateProcedureStr2, [ProcTerm, NEWLINE]))
        else
          sCreate.Add(Format(CreateProcedureStr2, [Term, NEWLINE]));
      end;
      sAlter.Add('');
      sAlter.Add(Format('ALTER PROCEDURE %s ',  {do not localize}
         [QuoteIdentifier(GetDialect, ProcName)]));
      sAlter.AddStrings(sArgs);
      end;
      sAlter.AddStrings(SList);
    end;

{ This query gets the procedure name and the source.  We then nest a query
   to retrieve the parameters. Alter is used, because the procedures are
   already there}

    FMetaData.AddStrings(sCreate);
    FMetaData.AddStrings(sAlter);
    if not Header then
    begin
      if FIncludeSetTerm then
        FMetaData.Add(Format('SET TERM %s %s', [Term, ProcTerm]));  {do not localize}
      FMetaData.Add('COMMIT WORK;');   {do not localize}
    end;
  finally
    qryProcedures.Close;
    SList.Free;
    sAlter.Free;
    sCreate.Free;
    sArgs.Free;
  end;
end;

{            	  ListAllTables
  Functional description
  	Extract the names of all user tables from
 	 rdb$relations.  Filter SQL tables by
  	security class after we fetch them
  	Parameters:  flag -- 0, get all tables }

procedure TIBExtract.ListAllTables(flag: Boolean);
const
  TableSQL =
       'SELECT * ' +
       '  FROM RDB$RELATIONS REL JOIN RDB$RELATION_FIELDS RFR ON ' + {do not localize}
       '       RFR.RDB$RELATION_NAME = REL.RDB$RELATION_NAME JOIN RDB$FIELDS FLD ON ' + {do not localize}
       '       RFR.RDB$FIELD_SOURCE = FLD.RDB$FIELD_NAME ' + {do not localize}
       ' where (RDB$SYSTEM_FLAG <> 1 OR RDB$SYSTEM_FLAG IS NULL) AND ' + {do not localize}
       '  RDB$VIEW_BLR IS NULL ' +  {do not localize}
       ' ORDER BY RDB$RELATION_NAME, RFR.RDB$FIELD_POSITION, RFR.RDB$FIELD_NAME'; {do not localize}
var
  qryRelations : TIBSQL;
begin
{ This version of cursor gets only sql tables identified by security class
   and misses views, getting only null view_source }

   qryRelations := CreateIBSQL;
   try
     qryRelations.SQL.Text := TableSQL;
     qryRelations.ExecQuery;
     while not qryRelations.Eof do
     begin
       if ((qryRelations.FieldByName('RDB$FLAGS').AsInteger <> 1) and  {do not localize}
           (not Flag)) then
         continue;
       if flag or (not qryRelations.FieldByName('RDB$SECURITY_CLASS').AsTrimString.StartsWith('SQL$')) then {do not localize}
	       ExtractListTable(qryRelations.FieldByName('RDB$RELATION_NAME').AsTrimString, {do not localize}
           '', false, qryRelations);    {do not localize}
     end;
   finally
     qryRelations.Free;
   end;
end;

{	 ListAllTriggers
  Functional description
  	Lists triggers in general on non-system
  	tables with sql source only. }

procedure TIBExtract.ListTriggers(ObjectName : String; ExtractType : TExtractType);
const
{ Query gets the trigger info for non-system triggers with
   source that are not part of an SQL constraint }

  TriggerSQL =
    'SELECT * FROM RDB$TRIGGERS TRG JOIN RDB$RELATIONS REL ON ' +  {do not localize}
    '  TRG.RDB$RELATION_NAME = REL.RDB$RELATION_NAME ' +     {do not localize}
    'WHERE ' +
    ' (REL.RDB$SYSTEM_FLAG <> 1 OR REL.RDB$SYSTEM_FLAG IS NULL) AND ' +  {do not localize}
    '  NOT EXISTS (SELECT * FROM RDB$CHECK_CONSTRAINTS CHK WHERE ' + {do not localize}
    '     TRG.RDB$TRIGGER_NAME = CHK.RDB$TRIGGER_NAME) ' +  {do not localize}
    'ORDER BY TRG.RDB$RELATION_NAME, TRG.RDB$TRIGGER_TYPE, ' +  {do not localize}
    '    TRG.RDB$TRIGGER_SEQUENCE, TRG.RDB$TRIGGER_NAME';  {do not localize}

  TriggerNameSQL =
    'SELECT * FROM RDB$TRIGGERS TRG JOIN RDB$RELATIONS REL ON ' +  {do not localize}
    '  TRG.RDB$RELATION_NAME = REL.RDB$RELATION_NAME ' +   {do not localize}
    'WHERE ' +                                    {do not localize}
    ' REL.RDB$RELATION_NAME = :TableName AND ' +    {do not localize}
    ' (REL.RDB$SYSTEM_FLAG <> 1 OR REL.RDB$SYSTEM_FLAG IS NULL) AND ' +  {do not localize}
    '  NOT EXISTS (SELECT * FROM RDB$CHECK_CONSTRAINTS CHK WHERE ' +  {do not localize}
    '     TRG.RDB$TRIGGER_NAME = CHK.RDB$TRIGGER_NAME) ' +  {do not localize}
    'ORDER BY TRG.RDB$RELATION_NAME, TRG.RDB$TRIGGER_TYPE, ' +    {do not localize}
    '    TRG.RDB$TRIGGER_SEQUENCE, TRG.RDB$TRIGGER_NAME';  {do not localize}

  TriggerByNameSQL =
    'SELECT * FROM RDB$TRIGGERS TRG JOIN RDB$RELATIONS REL ON ' +    {do not localize}
    '  TRG.RDB$RELATION_NAME = REL.RDB$RELATION_NAME ' +     {do not localize}
    'WHERE ' +      {do not localize}
    ' TRG.RDB$TRIGGER_NAME = :TriggerName AND ' +  {do not localize}
    ' (REL.RDB$SYSTEM_FLAG <> 1 OR REL.RDB$SYSTEM_FLAG IS NULL) AND ' +  {do not localize}
    '  NOT EXISTS (SELECT * FROM RDB$CHECK_CONSTRAINTS CHK WHERE ' +  {do not localize}
    '     TRG.RDB$TRIGGER_NAME = CHK.RDB$TRIGGER_NAME) ' +   {do not localize}
    'ORDER BY TRG.RDB$RELATION_NAME, TRG.RDB$TRIGGER_TYPE, ' +  {do not localize}
    '    TRG.RDB$TRIGGER_SEQUENCE, TRG.RDB$TRIGGER_NAME';   {do not localize}

var
  Header : Boolean;
  TriggerName, RelationName, InActive: String;
  qryTriggers : TIBSQL;
  SList : TStrings;
begin
  Header := true;
  SList := TStringList.Create;
  qryTriggers := CreateIBSQL;
  try
    if ObjectName = '' then    {do not localize}
      qryTriggers.SQL.Text := TriggerSQL
    else
    begin
      if ExtractType = etTable then
      begin
        qryTriggers.SQL.Text := TriggerNameSQL;
        qryTriggers.Params.ByName('TableName').AsTrimString := ObjectName;  {do not localize}
      end
      else
      begin
        qryTriggers.SQL.Text := TriggerByNameSQL;
        qryTriggers.Params.ByName('TriggerName').AsTrimString := ObjectName;  {do not localize}
      end;
    end;
    qryTriggers.ExecQuery;
    while not qryTriggers.Eof do
    begin
      SList.Clear;
      if Header then
      begin
        if FIncludeSetTerm then
          FMetaData.Add(Format('SET TERM %s %s%s', [Procterm, Term, NEWLINE]));  {do not localize}
        if IncludeComments then
          FMetaData.Add(Format('%s/* Triggers only will work for SQL triggers */%s', {do not localize}
		         [NEWLINE, NEWLINE]));
        Header := false;
      end;
      TriggerName := qryTriggers.FieldByName('RDB$TRIGGER_NAME').AsTrimString;  {do not localize}
      RelationName := qryTriggers.FieldByName('RDB$RELATION_NAME').AsTrimString; {do not localize}
      if qryTriggers.FieldByName('RDB$TRIGGER_INACTIVE').IsNull then   {do not localize}
        InActive := 'INACTIVE'    {do not localize}
      else
        if qryTriggers.FieldByName('RDB$TRIGGER_INACTIVE').AsInteger = 1 then  {do not localize}
          InActive := 'INACTIVE'  {do not localize}
        else
          InActive := 'ACTIVE';   {do not localize}

      if qryTriggers.FieldByName('RDB$FLAGS').AsInteger <> 1 then  {do not localize}
        SList.Add('/* ');   {do not localize}

      SList.Add(Format('CREATE TRIGGER %s FOR %s %s%s %s POSITION %d',  {do not localize}
	        [QuoteIdentifier(GetDialect, TriggerName),
           QuoteIdentifier(GetDialect, RelationName),
           NEWLINE, InActive,
           TriggerTypes[qryTriggers.FieldByName('RDB$TRIGGER_TYPE').AsInteger], {do not localize}
           qryTriggers.FieldByName('RDB$TRIGGER_SEQUENCE').AsInteger])); {do not localize}
      if not qryTriggers.FieldByName('RDB$TRIGGER_SOURCE').IsNull then   {do not localize}
        SList.Text := SList.Text +
              qryTriggers.FieldByName('RDB$TRIGGER_SOURCE').AsTrimString;  {do not localize}
      if IncludeSetTerm then
        SList.Add(' ' + ProcTerm + NEWLINE)
      else
        SList.Add(' ' + Term + NEWLINE);
      if qryTriggers.FieldByName('RDB$FLAGS').AsInteger <> 1 then  {do not localize}
        SList.Add(' */');         {do not localize}
      FMetaData.AddStrings(SList);
      qryTriggers.Next;
    end;
    if not Header then
    begin
      if IncludeSetTerm then
      begin
        FMetaData.Add('COMMIT WORK ' + ProcTerm);     {do not localize}
        FMetaData.Add('SET TERM ' + Term + ProcTerm);  {do not localize}
      end
      else
        FMetaData.Add('COMMIT WORK ' + Term);     {do not localize}
    end;
  finally
    qryTriggers.Free;
    SList.Free;
  end;
end;

{	               ListCheck
  Functional description
 	  List check constraints for all objects to allow forward references }

procedure TIBExtract.ListCheck(ObjectName : String; ExtractType : TExtractType);
const
{ Query gets the check clauses for triggers stored for check constraints }
  CheckSQL =
    'SELECT * FROM RDB$TRIGGERS TRG JOIN RDB$CHECK_CONSTRAINTS CHK ON ' +   {do not localize}
    '  TRG.RDB$TRIGGER_NAME = CHK.RDB$TRIGGER_NAME ' +   {do not localize}
    'WHERE ' +   {do not localize}
    '  TRG.RDB$TRIGGER_TYPE = 1 AND ' +   {do not localize}
    '  EXISTS (SELECT RDB$CONSTRAINT_NAME FROM RDB$RELATION_CONSTRAINTS RELC WHERE ' +    {do not localize}
    '    CHK.RDB$CONSTRAINT_NAME = RELC.RDB$CONSTRAINT_NAME) ' +    {do not localize}
    'ORDER BY CHK.RDB$CONSTRAINT_NAME';  {do not localize}

  CheckNameSQL =
    'SELECT * FROM RDB$TRIGGERS TRG JOIN RDB$CHECK_CONSTRAINTS CHK ON ' +  {do not localize}
    '  TRG.RDB$TRIGGER_NAME = CHK.RDB$TRIGGER_NAME ' +  {do not localize}
    'WHERE ' +      {do not localize}
    '  TRG.RDB$RELATION_NAME = :TableName AND ' +   {do not localize}
    '  TRG.RDB$TRIGGER_TYPE = 1 AND ' +    {do not localize}
    '  EXISTS (SELECT RDB$CONSTRAINT_NAME FROM RDB$RELATION_CONSTRAINTS RELC WHERE ' +  {do not localize}
    '    CHK.RDB$CONSTRAINT_NAME = RELC.RDB$CONSTRAINT_NAME) ' +  {do not localize}
    'ORDER BY CHK.RDB$CONSTRAINT_NAME';   {do not localize}

  CheckByNameSQL =
    'SELECT * FROM RDB$TRIGGERS TRG JOIN RDB$CHECK_CONSTRAINTS CHK ON ' +  {do not localize}
    '  TRG.RDB$TRIGGER_NAME = CHK.RDB$TRIGGER_NAME ' +   {do not localize}
    'WHERE ' +     {do not localize}
    '  TRG.RDB$TRIGGER_NAME = :TriggerName AND ' +   {do not localize}
    '  TRG.RDB$TRIGGER_TYPE = 1 AND ' +   {do not localize}
    '  EXISTS (SELECT RDB$CONSTRAINT_NAME FROM RDB$RELATION_CONSTRAINTS RELC WHERE ' +  {do not localize}
    '    CHK.RDB$CONSTRAINT_NAME = RELC.RDB$CONSTRAINT_NAME) ' +    {do not localize}
    'ORDER BY CHK.RDB$CONSTRAINT_NAME';    {do not localize}

var
  qryChecks : TIBSQL;
  SList : TStrings;
  RelationName : String;
begin
  qryChecks := CreateIBSQL;
  SList := TStringList.Create;
  try
    if ObjectName = '' then     {do not localize}
      qryChecks.SQL.Text := CheckSQL
    else
      if ExtractType = etTable then
      begin
        qryChecks.SQL.Text := CheckNameSQL;
        qryChecks.Params.ByName('TableName').AsTrimString := ObjectName;   {do not localize}
      end
      else
      begin
        qryChecks.SQL.Text := CheckByNameSQL;
        qryChecks.Params.ByName('TriggerName').AsTrimString := ObjectName; {do not localize}
      end;
    qryChecks.ExecQuery;
    while not qryChecks.Eof do
    begin
      SList.Clear;
      RelationName := qryChecks.FieldByName('RDB$RELATION_NAME').AsTrimString;  {do not localize}
      SList.Add(Format('ALTER TABLE %s ADD ',   {do not localize}
		    [QuoteIdentifier(GetDialect, RelationName)]));
      if not qryChecks.FieldByName('RDB$CONSTRAINT_NAME').AsTrimString.StartsWith('INTEG') then    {do not localize}
        SList.Add(Format('%sCONSTRAINT %s ', [TAB,        {do not localize}
          QuoteIdentifier(GetDialect, qryChecks.FieldByName('RDB$CONSTRAINT_NAME').AsTrimString)]));  {do not localize}

      if not qryChecks.FieldByName('RDB$TRIGGER_SOURCE').IsNull then    {do not localize}
        SList.Text := SList.Text + qryChecks.FieldByName('RDB$TRIGGER_SOURCE').AsTrimString;   {do not localize}

      SList.Strings[SList.Count - 1] := SList.Strings[SList.Count - 1] + (Term) + NEWLINE;
      FMetaData.AddStrings(SList);
      qryChecks.Next;
    end;
  finally
    qryChecks.Free;
    SList.Free;
  end;
end;

{             ListCreateDb
  Functional description
    Print the create database command if requested.  At least put
    the page size in a comment with the extracted db name }

procedure TIBExtract.ListCreateDb(TargetDb : String);
const
  CharInfoSQL =
    'SELECT * FROM RDB$DATABASE DBP ' +   {do not localize}
    'WHERE NOT DBP.RDB$CHARACTER_SET_NAME IS NULL ' +  {do not localize}
    '  AND DBP.RDB$CHARACTER_SET_NAME != '' ''';   {do not localize}

  FilesSQL =
    'select * from RDB$FILES ' +   {do not localize}
    'order BY RDB$SHADOW_NUMBER, RDB$FILE_SEQUENCE'; {do not localize}

  LogsSQL =
    'SELECT * FROM RDB$LOG_FILES ' +  {do not localize}
    'ORDER BY RDB$FILE_FLAGS, RDB$FILE_SEQUENCE';   {do not localize}

var
  NoDb, First, FirstFile, HasWal, SetUsed : Boolean;
  Buffer : String;
  qryDB : TIBSQL;
  FileFlags, FileLength, FileSequence, FileStart : Integer;

begin
	NoDb := FALSE;
  First := TRUE;
  FirstFile := TRUE;
  HasWal := FALSE;
  SetUsed := FALSE;
  Buffer := '';  {do not localize}
  if TargetDb = '' then   {do not localize}
  begin
    Buffer := '/* '; {do not localize}
    TargetDb := FBase.Database.DatabaseName;
    NoDb := true;
  end;
  Buffer := Buffer + 'CREATE DATABASE ' + QuotedStr(TargetDb) + ' USER ' + {do not localize}
    QuotedStr(FBase.Database.Params.Values['user_name']) + ' password ' + QuotedStr(SPassword) + {do not localize}
    ' PAGE_SIZE ' + IntToStr(FDatabaseInfo.PageSize); {do not localize}
  FMetaData.Add(Buffer);
  Buffer := '';

  qryDB := CreateIBSQL;
  try
    qryDB.SQL.Text := CharInfoSQL;
    qryDB.ExecQuery;

    Buffer := Format(' DEFAULT CHARACTER SET %s',   {do not localize}
      [qryDB.FieldByName('RDB$CHARACTER_SET_NAME').AsTrimString]);  {do not localize}
    if FDatabaseInfo.EUAActive then
      FMetaData.Add(' WITH ADMIN OPTION'); {do not localize}
    if NoDB then
      Buffer := Buffer + ' */'  {do not localize}
    else
      Buffer := Buffer + Term;
    FMetaData.Add(Buffer);
    qryDB.Close;
    {List secondary files and shadows as
      alter db and create shadow in comment}
    qryDB.SQL.Text := FilesSQL;
    qryDB.ExecQuery;
    while not qryDB.Eof do
    begin
      if First then
      begin
        FMetaData.Add(NEWLINE + '/* Add secondary files in comments ');  {do not localize}
        First := false;
      end; //end_if

      if qryDB.FieldByName('RDB$FILE_FLAGS').IsNull then  {do not localize}
        FileFlags := 0
      else
        FileFlags := qryDB.FieldByName('RDB$FILE_FLAGS').AsInteger; {do not localize}
      if qryDB.FieldByName('RDB$FILE_LENGTH').IsNull then   {do not localize}
        FileLength := 0
      else
        FileLength := qryDB.FieldByName('RDB$FILE_LENGTH').AsInteger; {do not localize}
      if qryDB.FieldByName('RDB$FILE_SEQUENCE').IsNull then     {do not localize}
        FileSequence := 0
      else
        FileSequence := qryDB.FieldByName('RDB$FILE_SEQUENCE').AsInteger; {do not localize}
      if qryDB.FieldByName('RDB$FILE_START').IsNull then   {do not localize}
        FileStart := 0
      else
        FileStart := qryDB.FieldByName('RDB$FILE_START').AsInteger; {do not localize}

      { Pure secondary files }
      if FileFlags = 0 then
      begin
        Buffer := Format('%sALTER DATABASE ADD FILE ''%s''',  {do not localize}
          [NEWLINE, qryDB.FieldByName('RDB$FILE_NAME').AsTrimString]);  {do not localize}
        if FileStart <> 0 then
          Buffer := Buffer + Format(' STARTING %d', [FileStart]);  {do not localize}
        if FileLength <> 0 then
          Buffer := Buffer + Format(' LENGTH %d', [FileLength]);  {do not localize}
        FMetaData.Add(Buffer);
      end; //end_if
      if (FileFlags and FILE_cache) <> 0 then
        FMetaData.Add(Format('%sALTER DATABASE ADD CACHE ''%s'' LENGTH %d',  {do not localize}
          [NEWLINE, qryDB.FieldByName('RDB$FILE_NAME').AsTrimString, FileLength]));  {do not localize}

      Buffer := '';
      if (FileFlags and FILE_shadow) <> 0 then
      begin
        if FileSequence <> 0 then
          Buffer := Format('%sFILE ''%s''',    {do not localize}
            [TAB, qryDB.FieldByName('RDB$FILE_NAME').AsTrimString]) {do not localize}
        else
        begin
          Buffer := Format('%sCREATE SHADOW %d ''%s'' ',  {do not localize}
            [NEWLINE, qryDB.FieldByName('RDB$SHADOW_NUMBER').AsInteger,  {do not localize}
             qryDB.FieldByName('RDB$FILE_NAME').AsTrimString]);  {do not localize}
          if (FileFlags and FILE_inactive) <> 0 then
            Buffer := Buffer + 'INACTIVE ';         {do not localize}
          if (FileFlags and FILE_manual) <> 0 then
            Buffer := Buffer + 'MANUAL '       {do not localize}
          else
            Buffer := Buffer + 'AUTO ';           {do not localize}
          if (FileFlags and FILE_conditional) <> 0 then
            Buffer := Buffer + 'CONDITIONAL ';     {do not localize}
        end; //end_else
        if FileLength <> 0 then
          Buffer := Buffer + Format('LENGTH %d ', [FileLength]);   {do not localize}
        if FileStart <> 0 then
          Buffer := Buffer + Format('STARTING %d ', [FileStart]);   {do not localize}
        FMetaData.Add(Buffer);
      end; //end_if
      qryDB.Next;
    end;
    qryDB.Close;

    qryDB.SQL.Text := LogsSQL;
    qryDB.ExecQuery;
    while not qryDB.Eof do
    begin

      if qryDB.FieldByName('RDB$FILE_FLAGS').IsNull then  {do not localize}
        FileFlags := 0
      else
        FileFlags := qryDB.FieldByName('RDB$FILE_FLAGS').AsInteger; {do not localize}
      if qryDB.FieldByName('RDB$FILE_LENGTH').IsNull then     {do not localize}
        FileLength := 0
      else
        FileLength := qryDB.FieldByName('RDB$FILE_LENGTH').AsInteger;  {do not localize}

      Buffer := '';
      HasWal := true;
      if First then
      begin
        if NoDB then
          Buffer := '/* ';  {do not localize}
        Buffer := Buffer + NEWLINE + 'ALTER DATABASE ADD ';   {do not localize}
        First := false;
      end; //end_if
      if FirstFile then
        Buffer := Buffer + 'LOGFILE '; {do not localize}
      { Overflow files also have the serial bit set }
      if (FileFlags and LOG_default) = 0 then
      begin
        if (FileFlags and LOG_overflow) <> 0 then
          Buffer := Buffer + Format(')%s   OVERFLOW ''%s''',  {do not localize}
            [NEWLINE, qryDB.FieldByName('RDB$FILE_NAME').AsTrimString]) {do not localize}
        else
          if (FileFlags and LOG_serial) <> 0 then
            Buffer := Buffer + Format('%s  BASE_NAME ''%s''',     {do not localize}
              [NEWLINE, qryDB.FieldByName('RDB$FILE_NAME').AsTrimString])  {do not localize}
          { Since we are fetching order by FILE_FLAGS, the LOG_0verflow will
             be last.  It will only appear if there were named round robin,
             so we must close the parens first }

          { We have round robin and overflow file specifications }
          else
          begin
            if FirstFile then
              Buffer := Buffer + '('       {do not localize}
            else
              Buffer := Buffer + Format(',%s  ', [NEWLINE]);  {do not localize}
            FirstFile := false;

            Buffer := Buffer + Format('''%s''', [qryDB.FieldByName('RDB$FILE_NAME').AsTrimString]);  {do not localize}
          end; //end_else
      end;
      { Any file can have a length }
      if FileLength <> 0 then
        Buffer := Buffer + Format(' SIZE %d ', [FileLength]);    {do not localize}
      FMetaData.Add(Buffer);
      qryDB.Next;
    end;
    qryDB.Close;
    Buffer := '';
    if HasWal then
    begin
      Buffer := Buffer + PrintSet(SetUsed);
      Buffer := Buffer + Format('NUM_LOG_BUFFERS = %d',  {do not localize}
          [FDatabaseInfo.GetLongDatabaseInfo(isc_info_num_wal_buffers)]);
      Buffer := Buffer + PrintSet(SetUsed);
      Buffer := Buffer + Format('LOG_BUFFER_SIZE = %d',    {do not localize}
          [FDatabaseInfo.GetLongDatabaseInfo(isc_info_wal_buffer_size)]);
      Buffer := Buffer + PrintSet(SetUsed);
      Buffer := Buffer + Format('GROUP_COMMIT_WAIT_TIME = %d',   {do not localize}
          [FDatabaseInfo.GetLongDatabaseInfo(isc_info_wal_ckpt_interval)]);
      Buffer := Buffer + PrintSet(SetUsed);
      Buffer := Buffer + Format('CHECK_POINT_LENGTH = %d',  {do not localize}
          [FDatabaseInfo.GetLongDatabaseInfo(isc_info_wal_ckpt_length)]);
      FMetaData.Add(Buffer);

    end;
    if not First then
    begin
      if NoDB then
        FMetaData.Add(Format('%s */%s', [NEWLINE, NEWLINE]))  {do not localize}
      else
        FMetaData.Add(Format('%s%s%s', [Term, NEWLINE, NEWLINE]));   {do not localize}
    end;
    FMetaData.Add('COMMIT;'); {do not localize}
  finally
    qryDB.Free;
  end;
end;

{	             ListDomainTable
  Functional description
  	List domains as identified by fields with any constraints on them
  	for the named table

  	Parameters:  table_name == only extract domains for this table }

procedure TIBExtract.ListDomains(ObjectName: String; ExtractType : TExtractType);
const
  DomainSQL =
    'SELECT distinct fld.* FROM RDB$FIELDS FLD JOIN RDB$RELATION_FIELDS RFR ON ' +  {do not localize}
    '  RFR.RDB$FIELD_SOURCE = FLD.RDB$FIELD_NAME ' +   {do not localize}
    'WHERE RFR.RDB$RELATION_NAME = :TABLE_NAME ' +     {do not localize}
    'ORDER BY FLD.RDB$FIELD_NAME';                  {do not localize}

  DomainByNameSQL =
    'SELECT * FROM RDB$FIELDS FLD ' +   {do not localize}
    'WHERE FLD.RDB$FIELD_NAME = :DomainName ' +   {do not localize}
    'ORDER BY FLD.RDB$FIELD_NAME';  {do not localize}

  AllDomainSQL =
    'select * from RDB$FIELDS ' +   {do not localize}
    'where RDB$SYSTEM_FLAG <> 1 ' +   {do not localize}
    'order BY RDB$FIELD_NAME';    {do not localize}

var
  First : Boolean;
  qryDomains : TIBSQL;
  FieldName, Line : String;

  function FormatDomainStr : String;
  var
    SubType : Integer;
    PrecisionKnown : Boolean;
  begin
    Result := '';  {do not localize}
//    for i := Low(ColumnTypes) to High(ColumnTypes) do
//    if qryDomains.FieldByName('RDB$FIELD_TYPE').AsInteger = ColumnTypes[i].SQLType then    {do not localize}
//    begin
        PrecisionKnown := FALSE;
    if ODSMajorVersion >= ODS_VERSION10 then
        begin
          if qryDomains.FieldByName('RDB$FIELD_TYPE').AsInteger in [blr_short, blr_long, blr_int64] then  {do not localize}
          begin
            { We are ODS >= 10 and could be any Dialect }
        if (DBSQLDialect >= 3) and
               (not qryDomains.FieldByName('RDB$FIELD_PRECISION').IsNull) and  {do not localize}
               (qryDomains.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger > 0) and  {do not localize}
               (qryDomains.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger <= MAX_INTSUBTYPES) then  {do not localize}
            begin
              Result := Result + Format('%s(%d, %d)', [  {do not localize}
                IntegralSubtypes [qryDomains.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger],  {do not localize}
                qryDomains.FieldByName('RDB$FIELD_PRECISION').AsInteger, {do not localize}
                -1 * qryDomains.FieldByName('RDB$FIELD_SCALE').AsInteger]);  {do not localize}
              PrecisionKnown := true;
            end;
          end;
        end;
        if PrecisionKnown = false then
        begin
          { Take a stab at numerics and decimals }
          if (qryDomains.FieldByName('RDB$FIELD_TYPE').AsInteger = blr_short) and  {do not localize}
              (qryDomains.FieldByName('RDB$FIELD_SCALE').AsInteger < 0) then {do not localize}
            Result := Result + Format('NUMERIC(4, %d)',     {do not localize}
              [-qryDomains.FieldByName('RDB$FIELD_SCALE').AsInteger] )  {do not localize}
          else
            if (qryDomains.FieldByName('RDB$FIELD_TYPE').AsInteger = blr_long) and {do not localize}
                (qryDomains.FieldByName('RDB$FIELD_SCALE').AsInteger < 0) then  {do not localize}
              Result := Result + Format('NUMERIC(9, %d)',                   {do not localize}
                [-qryDomains.FieldByName('RDB$FIELD_SCALE').AsInteger] )    {do not localize}
            else
              if (qryDomains.FieldByName('RDB$FIELD_TYPE').AsInteger = blr_double) and    {do not localize}
                  (qryDomains.FieldByName('RDB$FIELD_SCALE').AsInteger  < 0) then  {do not localize}
                Result := Result + Format('NUMERIC(15, %d)',             {do not localize}
                  [-qryDomains.FieldByName('RDB$FIELD_SCALE').AsInteger] ) {do not localize}
              else
            Result := Result + ColumnTypes.Items[qryDomains.FieldByName('RDB$FIELD_TYPE').AsInteger];
      end;
//      break;
//    end;

    if qryDomains.FieldByName('RDB$FIELD_TYPE').AsInteger = blr_blob then {do not localize}
    begin
      subtype := qryDomains.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger;  {do not localize}
      Result := Result + ' SUB_TYPE ';   {do not localize}
      if (subtype > 0) and (subtype <= MAXSUBTYPES) then
        Result := Result + SubTypes[subtype]
      else
        Result := Result + Format('%d', [subtype]);  {do not localize}
      Result := Result + Format(' SEGMENT SIZE %d', [qryDomains.FieldByName('RDB$SEGMENT_LENGTH').AsInteger]);  {do not localize}
    end //end_if
    else
      if qryDomains.FieldByName('RDB$FIELD_TYPE').AsInteger in [blr_text, blr_varying] then   {do not localize}
        Result := Result + Format('(%d)', [GetFieldLength(qryDomains)]);  {do not localize}

    { since the character set is part of the field type, display that
     information now. }
    if not qryDomains.FieldByName('RDB$CHARACTER_SET_ID').IsNull then  {do not localize}
      Result := Result + GetCharacterSets(qryDomains.FieldByName('RDB$CHARACTER_SET_ID').AsInteger, {do not localize}
         0, FALSE);
    if not qryDomains.FieldByName('RDB$DIMENSIONS').IsNull then {do not localize}
      Result := Result + GetArrayField(FieldName);

    if not qryDomains.FieldByName('RDB$DEFAULT_SOURCE').IsNull then   {do not localize}
      Result := Result + Format('%s%s %s', [NEWLINE, TAB,           {do not localize}
         qryDomains.FieldByName('RDB$DEFAULT_SOURCE').AsTrimString]);  {do not localize}

    if not qryDomains.FieldByName('RDB$VALIDATION_SOURCE').IsNull then   {do not localize}
      if qryDomains.FieldByName('RDB$VALIDATION_SOURCE').AsTrimString.ToUpper.StartsWith('CHECK') then {do not localize}
        Result := Result + Format('%s%s %s', [NEWLINE, TAB,   {do not localize}
           qryDomains.FieldByName('RDB$VALIDATION_SOURCE').AsTrimString])  {do not localize}
      else
        Result := Result + Format('%s%s /* %s */', [NEWLINE, TAB,   {do not localize}
           qryDomains.FieldByName('RDB$VALIDATION_SOURCE').AsTrimString]);  {do not localize}

    if qryDomains.FieldByName('RDB$NULL_FLAG').AsInteger = 1 then   {do not localize}
      Result := Result + ' NOT NULL';       {do not localize}

    { Show the collation order if one has been specified.  If the collation
       order is the default for the character set being used, then no collation
       order will be shown ( because it isn't needed ).

       If the collation id is 0, then the default for the character set is
       being used so there is no need to retrieve the collation information.}

    if (not qryDomains.FieldByName('RDB$COLLATION_ID').IsNull) and  {do not localize}
       (qryDomains.FieldByName('RDB$COLLATION_ID').AsInteger <> 0) then   {do not localize}
      Result := Result + GetCharacterSets(qryDomains.FieldByName('RDB$CHARACTER_SET_ID').AsInteger,  {do not localize}
        qryDomains.FieldByName('RDB$COLLATION_ID').AsInteger, true);  {do not localize}
  end;

begin
  First := true;
  qryDomains := CreateIBSQL;
  try
    if ObjectName <> '' then    {do not localize}
    begin
      if ExtractType = etTable then
      begin
        qryDomains.SQL.Text := DomainSQL;
        qryDomains.Params.ByName('table_name').AsTrimString := ObjectName;  {do not localize}
      end
      else
      begin
        qryDomains.SQL.Text := DomainByNameSQL;
        qryDomains.Params.ByName('DomainName').AsTrimString := ObjectName;  {do not localize}
      end;
    end
    else
      qryDomains.SQL.Text := AllDomainSQL;

    qryDomains.ExecQuery;
    while not qryDomains.Eof do
    begin
      FieldName := qryDomains.FieldByName('RDB$FIELD_NAME').AsTrimString; {do not localize}
      { Skip over artifical domains }
      if FieldName.StartsWith('RDB$') and   {do not localize}
         FieldName[Low(String) + 4].IsNumber and  {do not localize}
         (qryDomains.FieldByName('RDB$SYSTEM_FLAG').AsInteger <> 1) then  {do not localize}
      begin
        qryDomains.Next;
        continue;
      end;

      if First then
      begin
        if IncludeComments then
          FMetaData.Add('/* Domain definitions */');  {do not localize}
        First := false;
      end;

      Line := Format('CREATE DOMAIN %s AS ', [QuoteIdentifier(GetDialect, FieldName)]);  {do not localize}
      Line := Line + FormatDomainStr + Term;
      FMetaData.Add(Line);
      qryDomains.Next;
    end;
  finally
    qryDomains.Free;
  end;
end;

{          ListException
 Functional description
   List all exceptions defined in the database

   Parameters:  none }

procedure TIBExtract.ListException(ExceptionName : String = '');
const
  ExceptionSQL =
    'select * from RDB$EXCEPTIONS ' +  {do not localize}
    'ORDER BY RDB$EXCEPTION_NAME';   {do not localize}

  ExceptionNameSQL =
    'select * from RDB$EXCEPTIONS ' +  {do not localize}
    'WHERE RDB$EXCEPTION_NAME = :ExceptionName ' + {do not localize}
    'ORDER BY RDB$EXCEPTION_NAME'; {do not localize}

var
  First : Boolean;
  qryException : TIBSQL;
begin
  First := true;
  qryException := CreateIBSQL;
  try
    if ExceptionName = '' then  {do not localize}
      qryException.SQL.Text := ExceptionSQL
    else
    begin
      qryException.SQL.Text := ExceptionNameSQL;
      qryException.Params.ByName('ExceptionName').AsTrimString := ExceptionName; {do not localize}
    end;

    qryException.ExecQuery;
    while not qryException.Eof do
    begin
      if First then
      begin
        FMetaData.Add('');     {do not localize}
        if IncludeComments then
          FMetaData.Add('/*  Exceptions */');    {do not localize}
        FMetaData.Add('');    {do not localize}
        First := false;
      end; //end_if

      FMetaData.Add(Format('CREATE EXCEPTION %s %s%s',  {do not localize}
        [QuoteIdentifier(GetDialect, qryException.FieldByName('RDB$EXCEPTION_NAME').AsTrimString), {do not localize}
        QuotedStr(qryException.FieldByName('RDB$MESSAGE').AsTrimString), Term]));  {do not localize}
      qryException.Next;
    end;
  finally
    qryException.Free;
  end;
end;

{              ListFilters

 Functional description
  List all blob filters

  Parameters:  none
  Results in
  DECLARE FILTER <fname> INPUT_TYPE <blob_sub_type> OUTPUT_TYPE <blob_subtype>
      ENTRY_POINT <string> MODULE_NAME <string> }

procedure TIBExtract.ListFilters(FilterName : String = '');
const
  FiltersSQL =
    'SELECT * FROM RDB$FILTERS ' +   {do not localize}
    'ORDER BY RDB$FUNCTION_NAME';   {do not localize}
  FilterNameSQL =
    'SELECT * FROM RDB$FILTERS ' +   {do not localize}
    'WHERE RDB$FUNCTION_NAME = :FunctionName ' +   {do not localize}
    'ORDER BY RDB$FUNCTION_NAME';   {do not localize}

var
  First : Boolean;
  qryFilters : TIBSQL;
begin
  First := true;
  qryFilters := CreateIBSQL;
  try
    if FilterName = '' then   {do not localize}
      qryFilters.SQL.Text := FiltersSQL
    else
    begin
      qryFilters.SQL.Text := FilterNameSQL;
      qryFilters.Params.ByName('FunctionName').AsTrimString := FilterName;  {do not localize}
    end;
    qryFilters.ExecQuery;
    while not qryFilters.Eof do
    begin
      if First then
      begin
        FMetaData.Add('');     {do not localize}
        if IncludeComments then
          FMetaData.Add('/*  BLOB Filter declarations */');   {do not localize}
        FMetaData.Add('');    {do not localize}
        First := false;
      end; //end_if

      FMetaData.Add(Format('DECLARE FILTER %s INPUT_TYPE %d OUTPUT_TYPE %d', {do not localize}
        [qryFilters.FieldByName('RDB$FUNCTION_NAME').AsTrimString,     {do not localize}
         qryFilters.FieldByName('RDB$INPUT_SUB_TYPE').AsInteger,       {do not localize}
         qryFilters.FieldByName('RDB$OUTPUT_SUB_TYPE').AsInteger]));     {do not localize}
      FMetaData.Add(Format('%sENTRY_POINT ''%s'' MODULE_NAME ''%s''%s%',   {do not localize}
        [TAB, qryFilters.FieldByName('RDB$ENTRYPOINT').AsTrimString,      {do not localize}
         qryFilters.FieldByName('RDB$MODULE_NAME').AsTrimString, Term])); {do not localize}
      FMetaData.Add('');                 {do not localize}

      qryFilters.Next;
    end;

  finally
    qryFilters.Free;
  end;
end;

{            ListForeign
  Functional description
   List all foreign key constraints and alter the tables }

procedure TIBExtract.ListForeign(ObjectName : String; ExtractType : TExtractType);
const
  { Static queries for obtaining foreign constraints, where RELC1 is the
    foreign key constraints, RELC2 is the primary key lookup and REFC
    is the join table }
  ForeignSQL =
    'SELECT REFC.RDB$UPDATE_RULE REFC_UPDATE_RULE, REFC.RDB$DELETE_RULE REFC_DELETE_RULE, ' +   {do not localize}
    '  RELC1.RDB$RELATION_NAME RELC1_RELATION_NAME, RELC2.RDB$RELATION_NAME RELC2_RELATION_NAME, ' + {do not localize}
    '  RELC1.RDB$INDEX_NAME RELC1_INDEX_NAME, RELC1.RDB$CONSTRAINT_NAME RELC1_CONSTRAINT_NAME, ' +  {do not localize}
    '  RELC2.RDB$INDEX_NAME RELC2_INDEX_NAME ' +  {do not localize}
    'FROM RDB$REF_CONSTRAINTS REFC, RDB$RELATION_CONSTRAINTS RELC1, ' +   {do not localize}
    '     RDB$RELATION_CONSTRAINTS RELC2 ' + {do not localize}
    'WHERE ' +  {do not localize}
    '  RELC1.RDB$CONSTRAINT_TYPE = ''FOREIGN KEY'' AND ' +  {do not localize}
    '  REFC.RDB$CONST_NAME_UQ = RELC2.RDB$CONSTRAINT_NAME AND ' +   {do not localize}
    '  REFC.RDB$CONSTRAINT_NAME = RELC1.RDB$CONSTRAINT_NAME AND ' +  {do not localize}
    '  (RELC2.RDB$CONSTRAINT_TYPE = ''UNIQUE'' OR ' +  {do not localize}
    '    RELC2.RDB$CONSTRAINT_TYPE = ''PRIMARY KEY'') ' +   {do not localize}
    'ORDER BY RELC1.RDB$RELATION_NAME, RELC1.RDB$CONSTRAINT_NAME';   {do not localize}

  ForeignNameSQL =
    'SELECT REFC.RDB$UPDATE_RULE REFC_UPDATE_RULE, REFC.RDB$DELETE_RULE REFC_DELETE_RULE, ' +  {do not localize}
    '  RELC1.RDB$RELATION_NAME RELC1_RELATION_NAME, RELC2.RDB$RELATION_NAME RELC2_RELATION_NAME, ' +   {do not localize}
    '  RELC1.RDB$INDEX_NAME RELC1_INDEX_NAME, RELC1.RDB$CONSTRAINT_NAME RELC1_CONSTRAINT_NAME, ' +  {do not localize}
    '  RELC2.RDB$INDEX_NAME RELC2_INDEX_NAME ' + {do not localize}
    'FROM RDB$REF_CONSTRAINTS REFC, RDB$RELATION_CONSTRAINTS RELC1, ' +  {do not localize}
    '     RDB$RELATION_CONSTRAINTS RELC2 ' + {do not localize}
    'WHERE ' +  {do not localize}
    '  RELC1.RDB$RELATION_NAME = :TableName AND ' + {do not localize}
    '  RELC1.RDB$CONSTRAINT_TYPE = ''FOREIGN KEY'' AND ' +   {do not localize}
    '  REFC.RDB$CONST_NAME_UQ = RELC2.RDB$CONSTRAINT_NAME AND ' +   {do not localize}
    '  REFC.RDB$CONSTRAINT_NAME = RELC1.RDB$CONSTRAINT_NAME AND ' +  {do not localize}
    '  (RELC2.RDB$CONSTRAINT_TYPE = ''UNIQUE'' OR ' +  {do not localize}
    '    RELC2.RDB$CONSTRAINT_TYPE = ''PRIMARY KEY'') ' +   {do not localize}
    'ORDER BY RELC1.RDB$RELATION_NAME, RELC1.RDB$CONSTRAINT_NAME';  {do not localize}

  ForeignByNameSQL =
    'SELECT REFC.RDB$UPDATE_RULE REFC_UPDATE_RULE, REFC.RDB$DELETE_RULE REFC_DELETE_RULE, ' +   {do not localize}
    '  RELC1.RDB$RELATION_NAME RELC1_RELATION_NAME, RELC2.RDB$RELATION_NAME RELC2_RELATION_NAME, ' +  {do not localize}
    '  RELC1.RDB$INDEX_NAME RELC1_INDEX_NAME, RELC1.RDB$CONSTRAINT_NAME RELC1_CONSTRAINT_NAME, ' +   {do not localize}
    '  RELC2.RDB$INDEX_NAME RELC2_INDEX_NAME ' +   {do not localize}
    'FROM RDB$REF_CONSTRAINTS REFC, RDB$RELATION_CONSTRAINTS RELC1, ' +  {do not localize}
    '     RDB$RELATION_CONSTRAINTS RELC2 ' +  {do not localize}
    'WHERE ' +   {do not localize}
    '  RELC1.RDB$CONSTRAINT_NAME = :ConstraintName AND ' +   {do not localize}
    '  RELC1.RDB$CONSTRAINT_TYPE = ''FOREIGN KEY'' AND ' +   {do not localize}
    '  REFC.RDB$CONST_NAME_UQ = RELC2.RDB$CONSTRAINT_NAME AND ' + {do not localize}
    '  REFC.RDB$CONSTRAINT_NAME = RELC1.RDB$CONSTRAINT_NAME AND ' +   {do not localize}
    '  (RELC2.RDB$CONSTRAINT_TYPE = ''UNIQUE'' OR ' +   {do not localize}
    '    RELC2.RDB$CONSTRAINT_TYPE = ''PRIMARY KEY'') ' +   {do not localize}
    'ORDER BY RELC1.RDB$RELATION_NAME, RELC1.RDB$CONSTRAINT_NAME';  {do not localize}

var
  qryForeign : TIBSQL;
  Line : String;

begin
  qryForeign := CreateIBSQL;
  try
    if ObjectName = '' then   {do not localize}
      qryForeign.SQL.Text := ForeignSQL
    else
    begin
      if ExtractType = etTable then
      begin
        qryForeign.SQL.Text := ForeignNameSQL;
        qryForeign.Params.ByName('TableName').AsTrimString := ObjectName;   {do not localize}
      end
      else
      begin
        qryForeign.SQL.Text := ForeignByNameSQL;
        qryForeign.Params.ByName('ConstraintName').AsTrimString := ObjectName;  {do not localize}
      end;
    end;
    qryForeign.ExecQuery;
    while not qryForeign.Eof do
    begin
      Line := Format('ALTER TABLE %s ADD ', [QuoteIdentifier(GetDialect, {do not localize}
        qryForeign.FieldByName('RELC1_RELATION_NAME').AsTrimString)]);  {do not localize}

      { If the name of the constraint is not INTEG..., print it.
         INTEG... are internally generated names. }
      if (not qryForeign.FieldByName('RELC1_CONSTRAINT_NAME').IsNull) and   {do not localize}
         (not qryForeign.FieldByName('RELC1_CONSTRAINT_NAME').AsTrimString.StartsWith('INTEG')) then   {do not localize}
        Line := Line + Format('CONSTRAINT %s ', [QuoteIdentifier(GetDialect,  {do not localize}
          Trim(qryForeign.FieldByName('RELC1_CONSTRAINT_NAME').AsTrimString))]);  {do not localize}

      Line := Line + Format('FOREIGN KEY (%s) REFERENCES %s ', [    {do not localize}
        GetIndexSegments(qryForeign.FieldByName('RELC1_INDEX_NAME').AsTrimString),   {do not localize}
        QuoteIdentifier(GetDialect, Trim(qryForeign.FieldByName('RELC2_RELATION_NAME').AsTrimString))]);  {do not localize}

      Line := Line + Format('(%s)',   {do not localize}
        [GetIndexSegments(qryForeign.FieldByName('RELC2_INDEX_NAME').AsTrimString)]);   {do not localize}

      { Add the referential actions, if any }
      if (not qryForeign.FieldByName('REFC_UPDATE_RULE').IsNull) and  {do not localize}
         (Trim(qryForeign.FieldByName('REFC_UPDATE_RULE').AsTrimString) <> 'RESTRICT') then   {do not localize}
        Line := Line + Format(' ON UPDATE %s',   {do not localize}
           [Trim(qryForeign.FieldByName('REFC_UPDATE_RULE').AsTrimString)]);  {do not localize}

      if (not qryForeign.FieldByName('REFC_DELETE_RULE').IsNull) and    {do not localize}
         (Trim(qryForeign.FieldByName('REFC_DELETE_RULE').AsTrimString) <> 'RESTRICT') then  {do not localize}
        Line := Line + Format(' ON DELETE %s',    {do not localize}
           [Trim(qryForeign.FieldByName('REFC_DELETE_RULE').AsTrimString)]);  {do not localize}

      Line := Line + Term;
      FMetaData.Add(Line);
      qryForeign.Next;
    end;
  finally
    qryForeign.Free;
  end;
end;

{    ListFunctions

 Functional description
   List all external functions

   Parameters:  none
  Results in
  DECLARE EXTERNAL FUNCTION function_name
                CHAR [256] , INTEGER, ....
                RETURNS INTEGER BY VALUE
                ENTRY_POINT entrypoint MODULE_NAME module; }

procedure TIBExtract.ListFunctions(FunctionName : String = '');
const
  FunctionSQL =
    'SELECT * FROM RDB$FUNCTIONS ' +  {do not localize}
    'ORDER BY RDB$FUNCTION_NAME';   {do not localize}

  FunctionNameSQL =
    'SELECT * FROM RDB$FUNCTIONS ' +   {do not localize}
    'WHERE RDB$FUNCTION_NAME = :FunctionName ' +    {do not localize}
    'ORDER BY RDB$FUNCTION_NAME';   {do not localize}

  FunctionArgsSQL =
    'SELECT * FROM RDB$FUNCTION_ARGUMENTS ' +  {do not localize}
    'WHERE ' +    {do not localize}
    '  :FUNCTION_NAME = RDB$FUNCTION_NAME ' +  {do not localize}
    'ORDER BY RDB$ARGUMENT_POSITION';  {do not localize}

  FuncArgsPosSQL =
    'SELECT * FROM RDB$FUNCTION_ARGUMENTS ' +   {do not localize}
    'WHERE ' +  {do not localize}
    '  RDB$FUNCTION_NAME = :RDB$FUNCTION_NAME AND ' +  {do not localize}
    '  RDB$ARGUMENT_POSITION = :RDB$ARGUMENT_POSITION';  {do not localize}

  CharSetSQL =
    'SELECT * FROM RDB$CHARACTER_SETS ' +   {do not localize}
    'WHERE ' +  {do not localize}
    '  RDB$CHARACTER_SET_ID = :CHARACTER_SET_ID'; {do not localize}

var
  qryFunctions, qryFuncArgs, qryCharSets, qryFuncPos : TIBSQL;
  First, FirstArg, DidCharset, PrecisionKnown : Boolean;
  ReturnBuffer, TypeBuffer, Line : String;
  FieldType : Integer;
  AddParam : Boolean;
begin
  First := true;
  qryFunctions := CreateIBSQL;
  qryFuncArgs := CreateIBSQL;
  qryFuncPos := CreateIBSQL;
  qryCharSets := CreateIBSQL;
  try
    if FunctionName = '' then   {do not localize}
      qryFunctions.SQL.Text := FunctionSQL
    else
    begin
      qryFunctions.SQL.Text := FunctionNameSQL;
      qryFunctions.Params.ByName('FunctionName').AsTrimString := FunctionName;  {do not localize}
    end;
    qryFuncArgs.SQL.Text := FunctionArgsSQL;
    qryFuncPos.SQL.Text := FuncArgsPosSQL;
    qryCharSets.SQL.Text := CharSetSQL;
    qryFunctions.ExecQuery;
    while not qryFunctions.Eof do
    begin
      if First then
      begin
        if IncludeComments then
          FMEtaData.Add(Format('%s/*  External Function declarations */%s', {do not localize}
            [NEWLINE, NEWLINE]));
        First := false;
      end; //end_if
      { Start new function declaration }
      FMetaData.Add(Format('DECLARE EXTERNAL FUNCTION %s', {do not localize}
        [qryFunctions.FieldByName('RDB$FUNCTION_NAME').AsTrimString]));  {do not localize}
      Line := '';  {do not localize}

      FirstArg := true;
      qryFuncArgs.Params.ByName('FUNCTION_NAME').AsTrimString :=   {do not localize}
         qryFunctions.FieldByName('RDB$FUNCTION_NAME').AsTrimString;   {do not localize}

      qryFuncArgs.ExecQuery;
      while not qryFuncArgs.Eof do
      begin
        { Find parameter type }
        FieldType := qryFuncArgs.FieldByName('RDB$FIELD_TYPE').AsInteger;  {do not localize}

        { Print length where appropriate }
        if FieldType in [ blr_text, blr_varying, blr_cstring] then
        begin
          DidCharset := false;

          qryCharSets.Params.ByName('CHARACTER_SET_ID').AsInteger :=   {do not localize}
             qryFuncArgs.FieldByName('RDB$CHARACTER_SET_ID').AsInteger;  {do not localize}
          qryCharSets.ExecQuery;
          while not qryCharSets.Eof do
          begin
            DidCharset := true;
            TypeBuffer := Format('%s(%d) CHARACTER SET %s',  {do not localize}
              [ColumnTypes.Items[FieldType],
               qryFuncArgs.FieldByName('RDB$FIELD_LENGTH').AsInteger div   {do not localize}
               Max(1,qryCharSets.FieldByName('RDB$BYTES_PER_CHARACTER').AsInteger), {do not localize}
               qryCharSets.FieldByName('RDB$CHARACTER_SET_NAME').AsTrimString]); {do not localize}
            qryCharSets.Next;
          end;
          qryCharSets.Close;
          if not DidCharset then
            TypeBuffer := Format('%s(%d)', [ColumnTypes.Items[FieldType],   {do not localize}
              qryFuncArgs.FieldByName('RDB$FIELD_LENGTH').AsInteger]);  {do not localize}
        end //end_if
        else
        begin
          PrecisionKnown := false;
          if (ODSMajorVersion >= ODS_VERSION10) and
              (FieldType in [blr_short, blr_long, blr_int64]) then
          begin
            qryFuncPos.Params.ByName('RDB$FUNCTION_NAME').AsTrimString :=   {do not localize}
              qryFuncArgs.FieldByName('RDB$FUNCTION_NAME').AsTrimString;   {do not localize}
            qryFuncPos.Params.ByName('RDB$ARGUMENT_POSITION').AsInteger :=  {do not localize}
              qryFuncArgs.FieldByName('RDB$ARGUMENT_POSITION').AsInteger;   {do not localize}

            qryFuncPos.ExecQuery;
            while not qryFuncPos.Eof do
            begin
              { We are ODS >= 10 and could be any Dialect }
              if not qryFuncPos.FieldByName('RDB$FIELD_PRECISION').IsNull then {do not localize}
              begin
                { We are Dialect >=3 since FIELD_PRECISION is non-NULL }
                if (qryFuncPos.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger > 0) and   {do not localize}
                    (qryFuncPos.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger <= MAX_INTSUBTYPES) then  {do not localize}
                begin
                  TypeBuffer := Format('%s(%d, %d)',    {do not localize}
                    [IntegralSubtypes[qryFuncPos.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger],  {do not localize}
                     qryFuncPos.FieldByName('RDB$FIELD_PRECISION').AsInteger,  {do not localize}
                     -qryFuncPos.FieldByName('RDB$FIELD_SCALE').AsInteger] ); {do not localize}
                  PrecisionKnown := true;
                end; //end_if
              end; { if field_precision is not null }
              qryFuncPos.Next;
            end;
            qryFuncPos.Close;
          end; { if major_ods >= ods_version10 && }
          if not PrecisionKnown then
          begin
            { Take a stab at numerics and decimals }
            if (FieldType = blr_short) and
                (qryFuncArgs.FieldByName('RDB$FIELD_SCALE').AsInteger < 0) then   {do not localize}
              TypeBuffer := Format('NUMERIC(4, %d)', {do not localize}
                [-qryFuncArgs.FieldByName('RDB$FIELD_SCALE').AsInteger])   {do not localize}
            else
              if (FieldType = blr_long) and
                  (qryFuncArgs.FieldByName('RDB$FIELD_SCALE').AsInteger < 0) then {do not localize}
                TypeBuffer := Format('NUMERIC(9, %d)',     {do not localize}
                  [-qryFuncArgs.FieldByName('RDB$FIELD_SCALE').AsInteger])  {do not localize}
              else
                if (FieldType = blr_double) and
                    (qryFuncArgs.FieldByName('RDB$FIELD_SCALE').AsInteger < 0) then {do not localize}
                  TypeBuffer := Format('NUMERIC(15, %d)',   {do not localize}
                      [-qryFuncArgs.FieldByName('RDB$FIELD_SCALE').AsInteger])  {do not localize}
                else
                  TypeBuffer := ColumnTypes.Items[FieldType];
          end; { if  not PrecisionKnown  }
        end; { if FCHAR or VARCHAR or CSTRING ... else }

        AddParam := true;

        if qryFunctions.FieldByName('RDB$RETURN_ARGUMENT').AsInteger =  {do not localize}
               qryFuncArgs.FieldByName('RDB$ARGUMENT_POSITION').AsInteger then  {do not localize}
        begin
          if qryFunctions.FieldByName('RDB$RETURN_ARGUMENT').AsInteger = 0 then  {do not localize}
          begin
            ReturnBuffer := 'RETURNS ' + TypeBuffer;  {do not localize}
            AddParam:=False;
          end
          else
            ReturnBuffer := 'RETURNS PARAMETER ' + IntToStr(qryFunctions.FieldByName('RDB$RETURN_ARGUMENT').AsInteger);   {do not localize}
          if qryFuncArgs.FieldByName('RDB$MECHANISM').AsInteger = 0 then  {do not localize}
            ReturnBuffer := ReturnBuffer + ' BY VALUE ';  {do not localize}
          if qryFuncArgs.FieldByName('RDB$MECHANISM').AsInteger < 0 then  {do not localize}
            ReturnBuffer := ReturnBuffer + ' FREE_IT';   {do not localize}
        end;
        if AddParam then
        begin
          { First arg needs no comma }
          if FirstArg then
          begin
            Line := Line + TypeBuffer;
            FirstArg := false;
          end
          else
            Line := Line + ', ' + TypeBuffer;
        end; //end_else
        qryFuncArgs.Next;
      end;
      qryFuncArgs.Close;

      FMetaData.Add(Line);
      FMetaData.Add(ReturnBuffer);
      FMetaData.Add(Format('ENTRY_POINT ''%s'' MODULE_NAME ''%s''%s%s%s',  {do not localize}
        [qryFunctions.FieldByName('RDB$ENTRYPOINT').AsTrimString,  {do not localize}
         qryFunctions.FieldByName('RDB$MODULE_NAME').AsTrimString,  {do not localize}
         Term, NEWLINE, NEWLINE]));

      qryFunctions.Next;
    end;
  finally
    qryFunctions.Free;
    qryFuncArgs.Free;
    qryCharSets.Free;
    qryFuncPos.Free;
  end;
end;

{  ListGenerators
 Functional description
   Re create all non-system generators }

procedure TIBExtract.ListGenerators(GeneratorName : String = '');   {do not localize}
const
  GeneratorSQL =
    'SELECT RDB$GENERATOR_NAME ' +    {do not localize}
    'FROM RDB$GENERATORS ' +     {do not localize}
    'WHERE ' +                 {do not localize}
    '  (RDB$SYSTEM_FLAG IS NULL OR RDB$SYSTEM_FLAG <> 1) ' +    {do not localize}
    'ORDER BY RDB$GENERATOR_NAME';   {do not localize}

  GeneratorNameSQL =
    'SELECT RDB$GENERATOR_NAME ' +   {do not localize}
    'FROM RDB$GENERATORS ' +     {do not localize}
    'WHERE RDB$GENERATOR_NAME = :GeneratorName AND ' +    {do not localize}
    '  (RDB$SYSTEM_FLAG IS NULL OR RDB$SYSTEM_FLAG <> 1) ' +   {do not localize}
    'ORDER BY RDB$GENERATOR_NAME';  {do not localize}

var
  qryGenerator : TIBSQL;
  GenName : String;
begin
  qryGenerator := CreateIBSQL;
  try
    if GeneratorName = '' then     {do not localize}
      qryGenerator.SQL.Text := GeneratorSQL
    else
    begin
      qryGenerator.SQL.Text := GeneratorNameSQL;
      qryGenerator.Params.ByName('GeneratorName').AsTrimString := GeneratorName;  {do not localize}
    end;
    qryGenerator.ExecQuery;
    FMetaData.Add('');  {do not localize}
    while not qryGenerator.Eof do
    begin
      GenName := qryGenerator.FieldByName('RDB$GENERATOR_NAME').AsTrimString; {do not localize}
      if (GenName.StartsWith('RDB$') and    {do not localize}
           GenName[Low(String) + 4].IsNumber) or    {do not localize}
         (GenName.StartsWith('SQL$') and    {do not localize}
           GenName[Low(String) + 4].IsNumber) then  {do not localize}
      begin
        qryGenerator.Next;
        continue;
      end;
      FMetaData.Add(Format('CREATE GENERATOR %s%s',   {do not localize}
        [QuoteIdentifier(GetDialect, GenName), Term]));
      qryGenerator.Next;
    end;
  finally
    qryGenerator.Free;
  end;
end;

procedure TIBExtract.ListGrants(ObjectName: string);
begin
  if ObjectName = '' then
    ListGrants
  else
    ShowGrants(ObjectName, Term);
end;

{       ListIndex
 Functional description
   Define all non-constraint indices
   Use a static SQL query to get the info and print it.

   Uses get_index_segment to provide a key list for each index }

procedure TIBExtract.ListIndex(ObjectName : String; ExtractType : TExtractType);
const
  IndexSQL =
    'SELECT IDX.RDB$RELATION_NAME, IDX.RDB$INDEX_NAME, IDX.RDB$UNIQUE_FLAG, ' +  {do not localize}
    '       IDX.RDB$INDEX_TYPE, RDB$INDEX_INACTIVE ' +     {do not localize}
    'FROM RDB$INDICES IDX JOIN RDB$RELATIONS RELC ON ' +   {do not localize}
    '  IDX.RDB$RELATION_NAME = RELC.RDB$RELATION_NAME ' +  {do not localize}
    'WHERE (RELC.RDB$SYSTEM_FLAG <> 1 OR RELC.RDB$SYSTEM_FLAG IS NULL) AND ' + {do not localize}
    '  NOT EXISTS (SELECT * FROM RDB$RELATION_CONSTRAINTS RC ' +   {do not localize}
    '    WHERE RC.RDB$INDEX_NAME = IDX.RDB$INDEX_NAME) ' +  {do not localize}
    'ORDER BY IDX.RDB$RELATION_NAME, IDX.RDB$INDEX_NAME';  {do not localize}

  IndexNameSQL =
    'SELECT IDX.RDB$RELATION_NAME, IDX.RDB$INDEX_NAME, IDX.RDB$UNIQUE_FLAG, ' + {do not localize}
    '       IDX.RDB$INDEX_TYPE, RDB$INDEX_INACTIVE ' +   {do not localize}
    'FROM RDB$INDICES IDX JOIN RDB$RELATIONS RELC ON ' +  {do not localize}
    '  IDX.RDB$RELATION_NAME = RELC.RDB$RELATION_NAME ' +   {do not localize}
    'WHERE (RELC.RDB$SYSTEM_FLAG <> 1 OR RELC.RDB$SYSTEM_FLAG IS NULL) AND ' +  {do not localize}
    '  RELC.RDB$RELATION_NAME = :RelationName AND ' +  {do not localize}
    '  NOT EXISTS (SELECT * FROM RDB$RELATION_CONSTRAINTS RC ' +   {do not localize}
    '    WHERE RC.RDB$INDEX_NAME = IDX.RDB$INDEX_NAME) ' + {do not localize}
    'ORDER BY IDX.RDB$RELATION_NAME, IDX.RDB$INDEX_NAME'; {do not localize}

  IndexByNameSQL =
    'SELECT IDX.RDB$RELATION_NAME, IDX.RDB$INDEX_NAME, IDX.RDB$UNIQUE_FLAG, ' +  {do not localize}
    '       IDX.RDB$INDEX_TYPE, RDB$INDEX_INACTIVE ' +  {do not localize}
    'FROM RDB$INDICES IDX JOIN RDB$RELATIONS RELC ON ' +   {do not localize}
    '  IDX.RDB$RELATION_NAME = RELC.RDB$RELATION_NAME ' +   {do not localize}
    'WHERE (RELC.RDB$SYSTEM_FLAG <> 1 OR RELC.RDB$SYSTEM_FLAG IS NULL) AND ' +   {do not localize}
    '  IDX.RDB$INDEX_NAME = :IndexName AND ' +   {do not localize}
    '  NOT EXISTS (SELECT * FROM RDB$RELATION_CONSTRAINTS RC ' + {do not localize}
    '    WHERE RC.RDB$INDEX_NAME = IDX.RDB$INDEX_NAME) ' +  {do not localize}
    'ORDER BY IDX.RDB$RELATION_NAME, IDX.RDB$INDEX_NAME';  {do not localize}

var
  qryIndex : TIBSQL;
  First : Boolean;
  Unique, IdxType, Line : String;
begin
  First := true;
  qryIndex := CreateIBSQL;
  try
    if ObjectName = '' then  {do not localize}
      qryIndex.SQL.Text := IndexSQL
    else
    begin
      if ExtractType = etTable then
      begin
        qryIndex.SQL.Text := IndexNameSQL;
        qryIndex.Params.ByName('RelationName').AsTrimString := ObjectName;  {do not localize}
      end
      else
      begin
        qryIndex.SQL.Text := IndexByNameSQL;
        qryIndex.Params.ByName('IndexName').AsTrimString := ObjectName;  {do not localize}
      end;
    end;
    qryIndex.ExecQuery;
    while not qryIndex.Eof do
    begin
      if First then
      begin
        if IncludeComments then
        begin
          if ObjectName = '' then     {do not localize}
            FMetaData.Add(NEWLINE + '/*  Index definitions for all user tables */' + NEWLINE)   {do not localize}
          else
            FMetaData.Add(NEWLINE + '/*  Index definitions for ' + ObjectName + ' */');  {do not localize}
        end;
        First := false;
      end; //end_if

      if qryIndex.FieldByName('RDB$UNIQUE_FLAG').AsInteger = 1 then  {do not localize}
        Unique := ' UNIQUE'  {do not localize}
      else
        Unique := '';    {do not localize}

      if qryIndex.FieldByName('RDB$INDEX_TYPE').AsInteger = 1 then   {do not localize}
        IdxType := ' DESCENDING'   {do not localize}
      else
        IdxType := '';   {do not localize}

      Line := Format('CREATE%s%s INDEX %s ON %s(', [Unique, IdxType, {do not localize}
        QuoteIdentifier(GetDialect,
            qryIndex.FieldByName('RDB$INDEX_NAME').AsTrimString),   {do not localize}
        QuoteIdentifier(GetDialect,
            qryIndex.FieldByName('RDB$RELATION_NAME').AsTrimString)]);   {do not localize}

      Line := Line + GetIndexSegments(qryIndex.FieldByName('RDB$INDEX_NAME').AsTrimString) +   {do not localize}
          ')' + Term;  {do not localize}

      FMetaData.Add(Line);

      if qryIndex.FieldByName('RDB$INDEX_INACTIVE').AsInteger = 1  then   {do not localize}
      begin
        Line := Format('ALTER INDEX %S INACTIVE;', [QuoteIdentifier(GetDialect,  {do not localize}
            qryIndex.FieldByName('RDB$INDEX_NAME').AsTrimString)]); {do not localize}
        FMetaData.Add(Line);
      end;
      qryIndex.Next;
    end;
  finally
    qryIndex.Free;
  end;
end;

{    ListViews
 Functional description
   Show text of views.
   Use a SQL query to get the info and print it.
   Note: This should also contain check option }

procedure TIBExtract.ListViews(ViewName : String);
const
  ViewSQL =
    'SELECT RDB$RELATION_NAME, RDB$OWNER_NAME, RDB$VIEW_SOURCE ' +  {do not localize}
    'FROM RDB$RELATIONS ' +   {do not localize}
    'WHERE ' +       {do not localize}
    '  (RDB$SYSTEM_FLAG <> 1 OR RDB$SYSTEM_FLAG IS NULL) AND ' +  {do not localize}
    '  NOT RDB$VIEW_BLR IS NULL AND ' +   {do not localize}
    '  RDB$FLAGS = 1 ' +    {do not localize}
    'ORDER BY RDB$RELATION_ID';  {do not localize}

  ViewNameSQL =
    'SELECT RDB$RELATION_NAME, RDB$OWNER_NAME, RDB$VIEW_SOURCE ' + {do not localize}
    'FROM RDB$RELATIONS ' +   {do not localize}
    'WHERE ' +  {do not localize}
    '  (RDB$SYSTEM_FLAG <> 1 OR RDB$SYSTEM_FLAG IS NULL) AND ' +   {do not localize}
    '  NOT RDB$VIEW_BLR IS NULL AND ' +  {do not localize}
    '  RDB$FLAGS = 1 AND ' +   {do not localize}
    '  RDB$RELATION_NAME = :ViewName ' +   {do not localize}
    'ORDER BY RDB$RELATION_ID';   {do not localize}

  ColumnSQL =
    'SELECT RDB$FIELD_NAME FROM RDB$RELATION_FIELDS ' +    {do not localize}
    'WHERE ' +  {do not localize}
    '  RDB$RELATION_NAME = :RELATION_NAME ' +    {do not localize}
    'ORDER BY RDB$FIELD_POSITION'; {do not localize}

var
  qryView, qryColumns : TIBSQL;
  SList : TStrings;
begin
  qryView := CreateIBSQL;
  qryColumns := CreateIBSQL;
  SList := TStringList.Create;
  try
    if ViewName = '' then  {do not localize}
      qryView.SQL.Text := ViewSQL
    else
    begin
      qryView.SQL.Text := ViewNameSQL;
      qryView.Params.ByName('ViewName').AsTrimString := ViewName;  {do not localize}
    end;
    qryColumns.SQL.Text := ColumnSQL;
    qryView.ExecQuery;
    while not qryView.Eof do
    begin
      if IncludeComments then
        SList.Add(Format('%s/* View: %s, Owner: %s */%s',  {do not localize}
           [NEWLINE, qryView.FieldByName('RDB$RELATION_NAME').AsTrimString,   {do not localize}
            qryView.FieldByName('RDB$OWNER_NAME').AsTrimString, NEWLINE])); {do not localize}

      SList.Add(Format('CREATE VIEW %s (', [QuoteIdentifier(GetDialect, {do not localize}
        qryView.FieldByName('RDB$RELATION_NAME').AsTrimString)])); {do not localize}

      qryColumns.Params.ByName('RELATION_NAME').AsTrimString :=  {do not localize}
          qryView.FieldByName('RDB$RELATION_NAME').AsTrimString;  {do not localize}
      qryColumns.ExecQuery;
      while not qryColumns.Eof do
      begin
        SList.Add('  ' + QuoteIdentifier(GetDialect,    {do not localize}
           qryColumns.FieldByName('RDB$FIELD_NAME').AsTrimString));  {do not localize}
        qryColumns.Next;
        if not qryColumns.Eof then
          SList.Strings[SList.Count - 1] := SList.Strings[SList.Count - 1] + ', ';  {do not localize}
      end;
      qryColumns.Close;
      SList.Text := SList.Text + Format(') %0:sAS%0:s', [NEWLINE]);  {do not localize}
      if not qryView.FieldByName('RDB$VIEW_SOURCE').IsNull then    {do not localize}
        SList.Text := SList.Text + qryView.FieldByName('RDB$VIEW_SOURCE').AsString.Trim;   {do not localize}
      SList.Text := SList.Text + Format('%s%s', [Term, NEWLINE]);   {do not localize}
      FMetaData.AddStrings(SList);
      SList.Clear;
      qryView.Next;
    end;
  finally
    qryView.Free;
    qryColumns.Free;
    SList.Free;
  end;
end;

{    PrintSet
  Functional description
     print (using ISQL_printf) the word "SET"
     if the first line of the ALTER DATABASE
     settings options. Also, add trailing
     comma for end of prior line if needed.

  uses Print_buffer, a global }

function TIBExtract.PrintSet(var Used: Boolean) : String;
begin
  if not Used then
  begin
    Result := '  SET ';  {do not localize}
    Used := true;
  end
  else
    Result := Format(', %s      ', [NEWLINE]); {do not localize}
end;

{
           PrintValidation
  Functional description
    This does some minor syntax adjustmet for extracting
    validation blobs and computed fields.
    if it does not start with the word CHECK
    if this is a computed field blob,look for () or insert them.
    if flag = false, this is a validation clause,
    if flag = true, this is a computed field }

function TIBExtract.PrintValidation(ToValidate: String;
  flag: Boolean): String;
var
  IsSQL : Boolean;
begin
  IsSql := false;

  Result := '';     {do not localize}
  ToValidate := Trim(ToValidate);

  if flag then
  begin
    if ToValidate[Low(ToValidate)] = '(' then     {do not localize}
      IsSQL := true;
  end
  else
    if 'check'.StartsWith(ToValidate.ToLower) then   {do not localize}
      IsSQL := TRUE;

  if not IsSQL then
  begin
    if Flag then
      Result := Result + '/* ' + ToValidate + ' */'  {do not localize}
    else
      Result := Result + '(' + ToValidate + ')';   {do not localize}
  end
  else
    Result := ToValidate;
end;

procedure TIBExtract.SetDatabase(const Value: TIBDatabase);
begin
  FBase.Database := Value;
  FDatabaseInfo.Database := Value;
end;

procedure TIBExtract.SetOverrideSQLDialect(const Value: Integer);
begin
  if not (value in [0, 1, 3]) then
    Exception.Create(SInvalidSQLOverride);
  FOverrideSQLDialect := Value;
end;

procedure TIBExtract.SetTransaction(const Value: TIBTransaction);
begin
  if FBase.Transaction <> Value then
  begin
    FBase.Transaction := Value;
    if (not Assigned(FBase.Database)) and (FBase.Transaction <> nil) then
      Database := FBase.Transaction.DefaultDatabase;
  end;
end;

procedure TIBExtract.ExtractObject(ObjectType : TExtractObjectTypes;
      ObjectName : String = ''; ExtractTypes : TExtractTypes = []);
var
  DidActivate : Boolean;
  DefaultCharSet : TIBSQL;
begin
  DidActivate := false;
  CheckAssigned;
  if not FBase.Transaction.Active then
  begin
    FBase.Transaction.StartTransaction;
    DidActivate := true;
  end;
  FMetaData.Clear;
  DefaultCharSet := TIBSQL.Create(FBase.Transaction);
  try
    DefaultCharSet.SQL.Text := DefaultCharSetSQL;
    DefaultCharSet.ExecQuery;
    if not DefaultCharSet.Eof then
      FDefaultCharSet := DefaultCharSet.Fields[0].AsInteger
    else
      FDefaultCharSet := -1;
  finally
    DefaultCharSet.Free;
  end;
  ODSMajorVersion := FDatabaseInfo.ODSMajorVersion;
  DBSQLDialect := FDatabaseInfo.DBSQLDialect;
  FullODS := FDatabaseInfo.FullODS;
  case ObjectType of
    eoDatabase : ExtractDDL(true, '');
    eoDomain :
      if etTable in ExtractTypes then
        ListDomains(ObjectName, etTable)
      else
        ListDomains(ObjectName);
    eoTable :
    begin
      if ObjectName <> '' then
      begin
        if etDomain in ExtractTypes then
          ListDomains(ObjectName, etTable);
        ExtractListTable(ObjectName, '', false);
        if etIndex in ExtractTypes then
          ListIndex(ObjectName, etTable);
        if etForeign in ExtractTypes then
          ListForeign(ObjectName, etTable);
        if etCheck in ExtractTypes then
          ListCheck(ObjectName, etTable);
        if etTrigger in ExtractTypes then
          ListTriggers(ObjectName, etTable);
        if etGrant in ExtractTypes then
          ShowGrants(ObjectName, Term);
        if etData in ExtractTypes then
          ListData(ObjectName);
        if etEUAUser in ExtractTypes then
          ListEUAUsers;
        if etEncryption in ExtractTypes then
          ListEncryptions(ObjectName);
      end
      else
        ListAllTables(true);
    end;
    eoSubscription : ListSubscriptions(ObjectName);
    eoView :
    begin
      ListViews(ObjectName);
      if etTrigger in ExtractTypes then
        ListTriggers(ObjectName, etTable);
      if etGrant in ExtractTypes then
      begin
        FMetaData.Add('');
        ShowGrants(ObjectName, Term);
      end;
    end;
    eoProcedure : ListProcs(ObjectName, (etAlterProc in ExtractTypes));
    eoFunction : ListFunctions(ObjectName);
    eoGenerator : ListGenerators(ObjectName);
    eoException : ListException(ObjectName);
    eoBLOBFilter : ListFilters(ObjectName);
    eoRole : ListRoles(ObjectName);
    eoTrigger :
      if etTable in ExtractTypes then
        ListTriggers(ObjectName, etTable)
      else
        ListTriggers(ObjectName);
    eoForeign :
      if etTable in ExtractTypes then
        ListForeign(ObjectName, etTable)
      else
        ListForeign(ObjectName);
    eoIndexes :
      if etTable in ExtractTypes then
        ListIndex(ObjectName, etTable)
      else
        ListIndex(ObjectName);
    eoChecks :
      if etTable in ExtractTypes then
        ListCheck(ObjectName, etTable)
      else
        ListCheck(ObjectName);
    eoData : ListData(ObjectName);
    eoEUAUser : ListEUAUsers;
    eoEncryption : ListEncryptions(ObjectName);
    eoGrants : ListGrants(ObjectName);
  end;
  if DidActivate then
    FBase.Transaction.Commit;
end;

function TIBExtract.GetFieldType(FieldType, FieldSubType, FieldScale,
  FieldSize, FieldPrec, FieldLen: Integer): String;
var
  PrecisionKnown : Boolean;
begin
  Result := '';
      PrecisionKnown := FALSE;
  if ODSMajorVersion >= ODS_VERSION10 then
      begin
        if FieldType in [blr_short, blr_long, blr_int64] then
        begin
          { We are ODS >= 10 and could be any Dialect }
          if (FieldPrec <> 0) and
             (FieldSubType > 0) and
             (FieldSubType <= MAX_INTSUBTYPES) then
          begin
            Result := Result + Format('%s(%d, %d)', [   {do not localize}
              IntegralSubtypes [FieldSubType],
              FieldPrec,
              -1 * FieldScale]);
            PrecisionKnown := true;
          end;
        end;
      end;
      if PrecisionKnown = false then
      begin
        { Take a stab at numerics and decimals }
        if (FieldType = blr_short) and
            (FieldScale < 0) then
          Result := Result + Format('NUMERIC(4, %d)',  {do not localize}
            [-FieldScale] )
        else
          if (FieldType = blr_long) and
              (FieldScale < 0) then
            Result := Result + Format('NUMERIC(9, %d)',  {do not localize}
              [-FieldScale] )
          else
            if (FieldType = blr_double) and
                (FieldScale  < 0) then
              Result := Result + Format('NUMERIC(15, %d)',  {do not localize}
                [-FieldScale] )
            else
          Result := Result + ColumnTypes.Items[FieldType];
    end;
  if (FieldType in [blr_text, blr_varying]) and
     (FieldSize <> 0) then
    Result := Result + Format('(%d)', [FieldSize]);  {do not localize}
end;

{  S H O W _ g r a n t s
 Functional description
   Show grants for given object name
   This function is also called by extract for privileges.
     It must extract granted privileges on tables/views to users,
     - these may be compound, so put them on the same line.
   Grant execute privilege on procedures to users
   Grant various privilegs to procedures.
   All privileges may have the with_grant option set. }

procedure TIBExtract.ShowGrants(MetaObject, Terminator: String);
const
  { This query only finds tables, eliminating owner privileges }
  OwnerPrivSQL =
    'SELECT PRV.RDB$USER, PRV.RDB$GRANT_OPTION, PRV.RDB$FIELD_NAME, ' +  {do not localize}
    '       PRV.RDB$USER_TYPE, PRV.RDB$PRIVILEGE ' + {do not localize}
    'FROM RDB$USER_PRIVILEGES PRV, RDB$RELATIONS REL ' +  {do not localize}
    'WHERE ' + {do not localize}
    '  PRV.RDB$RELATION_NAME = :METAOBJECT AND ' +   {do not localize}
    '  REL.RDB$RELATION_NAME = :METAOBJECT AND ' +  {do not localize}
    '  PRV.RDB$PRIVILEGE <> ''M'' AND ' +    {do not localize}
    '  REL.RDB$OWNER_NAME <> PRV.RDB$USER ' +   {do not localize}
    'ORDER BY  PRV.RDB$USER, PRV.RDB$FIELD_NAME, PRV.RDB$GRANT_OPTION'; {do not localize}

  ProcPrivSQL =
    'SELECT PRV.RDB$USER, PRV.RDB$GRANT_OPTION, PRV.RDB$FIELD_NAME, ' +  {do not localize}
    '       PRV.RDB$USER_TYPE, PRV.RDB$PRIVILEGE, PRV.RDB$RELATION_NAME ' +  {do not localize}
    'FROM RDB$USER_PRIVILEGES PRV, RDB$PROCEDURES PRC ' +   {do not localize}
    'where ' +  {do not localize}
    '  PRV.RDB$OBJECT_TYPE = 5 AND ' +  {do not localize}
    '  PRV.RDB$RELATION_NAME = :METAOBJECT AND ' +   {do not localize}
    '  PRC.RDB$PROCEDURE_NAME = :METAOBJECT AND ' +   {do not localize}
    '  PRV.RDB$PRIVILEGE = ''X'' AND ' +   {do not localize}
    '  PRC.RDB$OWNER_NAME <> PRV.RDB$USER ' +   {do not localize}
    'ORDER BY PRV.RDB$USER, PRV.RDB$FIELD_NAME, PRV.RDB$GRANT_OPTION';  {do not localize}

  RolePrivSQL =
    'SELECT * FROM RDB$USER_PRIVILEGES ' +   {do not localize}
    'WHERE ' +   {do not localize}
    '  RDB$OBJECT_TYPE = 13 AND ' +   {do not localize}
    '  RDB$USER_TYPE = 8  AND ' +  {do not localize}
    '  RDB$RELATION_NAME = :METAOBJECT AND ' +   {do not localize}
    '  RDB$PRIVILEGE = ''M'' ' +   {do not localize}
    'ORDER BY RDB$USER';    {do not localize}

  SubscriptionSQL =
    'SELECT distinct UP.* ' +   {do not localize}
    '  FROM RDB$USER_PRIVILEGES UP JOIN RDB$SUBSCRIPTIONS s on ' +   {do not localize}
    '       UP.RDB$RELATION_NAME = s.RDB$SUBSCRIPTION_NAME ' +   {do not localize}
    '    WHERE ' +   {do not localize}
    '      UP.RDB$OBJECT_TYPE = 16 AND ' +   {do not localize}
    '      UP.RDB$USER_TYPE = 8  AND ' +   {do not localize}
    '      UP.RDB$RELATION_NAME = :METAOBJECT AND ' +   {do not localize}
    '      UP.RDB$PRIVILEGE = ''B'' and ' +   {do not localize}
    '      UP.RDB$USER <> S.RDB$OWNER_NAME ' +   {do not localize}
    '    ORDER BY RDB$USER';   {do not localize}

var
  PrevUser, PrevField,  WithOption,
  PrivString, ColString, UserString,
  FieldName, User : String;
  c : Char;
  PrevOption, PrivFlags, GrantOption : Integer;
  First, PrevFieldNull : Boolean;
  qryOwnerPriv : TIBSQL;

    {  Given a bit-vector of privileges, turn it into a
       string list. }
  function MakePrivString(cflags : Integer) : String;
  var
    i : Integer;
  begin
    Result := '';
    for i := Low(PrivTypes) to High(PrivTypes) do
    begin
      if (cflags and PrivTypes[i].PrivFlag) <> 0 then
      begin
        if Result <> '' then      {do not localize}
          Result := Result + ', ';    {do not localize}
        Result := Result + PrivTypes[i].PrivString;
      end; //end_if
    end; //end_for
  end; //end_fcn MakePrivDtring

begin
  if MetaObject = '' then
    exit;

  First := true;
  PrevOption := -1;
  PrevUser := '';
  PrivString := '';
  ColString := '';
  WithOption := '';
  PrivFlags := 0;
  PrevFieldNull := false;
  PrevField := '';

  qryOwnerPriv := CreateIBSQL;
  try
    qryOwnerPriv.SQL.Text := OwnerPrivSQL;
    qryOwnerPriv.Params.ByName('metaobject').AsTrimString := MetaObject;   {do not localize}
    qryOwnerPriv.ExecQuery;
    while not qryOwnerPriv.Eof do
    begin
      { Sometimes grant options are null, sometimes 0.  Both same }
      if qryOwnerPriv.FieldByName('RDB$GRANT_OPTION').IsNull then   {do not localize}
        GrantOption := 0
      else
        GrantOption := qryOwnerPriv.FieldByName('RDB$GRANT_OPTION').AsInteger; {do not localize}

      if qryOwnerPriv.FieldByName('RDB$FIELD_NAME').IsNull then  {do not localize}
        FieldName := ''
      else
        FieldName := qryOwnerPriv.FieldByName('RDB$FIELD_NAME').AsTrimString; {do not localize}

      User := Trim(qryOwnerPriv.FieldByName('RDB$USER').AsTrimString);  {do not localize}
      { Print a new grant statement for each new user or change of option }

      if ((PrevUser <> '') and (PrevUser <> User)) or
          ((Not First) and
           ((PrevFieldNull <> qryOwnerPriv.FieldByName('RDB$FIELD_NAME').IsNull) or  {do not localize}
           ((not PrevFieldNull) and (PrevField <> FieldName)) or
           ((PrevOption <> -1) and (PrevOption <> GrantOption)))) then
      begin
        PrivString := MakePrivString(PrivFlags);

        First := false;
        FMetaData.Add(Format('GRANT %s%s ON %s TO %s%s%s', [PrivString, {do not localize}
          ColString, QuoteIdentifier(GetDialect, MetaObject),
          UserString, WithOption, Terminator]));
        { re-initialize strings }

        PrivString := '';
        WithOption := '';
        ColString := '';
        PrivFlags := 0;
      end; //end_if

      PrevUser := User;
      PrevOption := GrantOption;
      PrevFieldNull := qryOwnerPriv.FieldByName('RDB$FIELD_NAME').IsNull;  {do not localize}
      PrevField := FieldName;

      case qryOwnerPriv.FieldByName('RDB$USER_TYPE').AsInteger of  {do not localize}
        obj_relation,
        obj_view,
        obj_trigger,
        obj_procedure,
        obj_sql_role:
          UserString := QuoteIdentifier(GetDialect, User);
        else
          UserString := User;
      end; //end_case

      case qryOwnerPriv.FieldByName('RDB$USER_TYPE').AsInteger of  {do not localize}
        obj_view :
          UserString := 'VIEW ' + UserString; {do not localize}
        obj_trigger :
          UserString := 'TRIGGER '+ UserString;  {do not localize}
        obj_procedure :
          UserString := 'PROCEDURE ' + UserString;  {do not localize}
      end; //end_case

      c := qryOwnerPriv.FieldByName('RDB$PRIVILEGE').AsTrimString[Low(String)]; {do not localize}

      case c of
        'S' : PrivFlags := PrivFlags or priv_SELECT;   {do not localize}
        'I' : PrivFlags := PrivFlags or priv_INSERT;   {do not localize}
        'U' : PrivFlags := PrivFlags or priv_UPDATE;    {do not localize}
        'D' : PrivFlags := PrivFlags or priv_DELETE;     {do not localize}
        'R' : PrivFlags := PrivFlags or priv_REFERENCES;  {do not localize}
        'T' : PrivFlags := PrivFlags or priv_DECRYPT; {do not localize}
        'X' : ;                                                 {do not localize}
          { Execute should not be here -- special handling below }
        'E' : ; {do not localize}
          {Special handling in ListEncryptions}
        else
          PrivFlags := PrivFlags or priv_UNKNOWN;
      end; //end_switch

      { Column level privileges for update only }

      if FieldName = '' then
        ColString := ''
      else
        ColString := Format(' (%s)', [QuoteIdentifier(GetDialect, FieldName)]); {do not localize}

      if GrantOption <> 0 then
        WithOption := ' WITH GRANT OPTION';       {do not localize}

      qryOwnerPriv.Next;
    end;
    { Print last case if there was anything to print }
    if PrevOption <> -1 then
    begin
      PrivString := MakePrivString(PrivFlags);
      First := false;
      FMetaData.Add(Format('GRANT %s%s ON %s TO %s%s%s', [PrivString,  {do not localize}
        ColString, QuoteIdentifier(GetDialect, MetaObject),
        UserString, WithOption, Terminator]));
      { re-initialize strings }
    end; //end_if
    qryOwnerPriv.Close;

    if First then
    begin
     { Part two is for stored procedures only }
      qryOwnerPriv.SQL.Text := ProcPrivSQL;
      qryOwnerPriv.Params.ByName('metaobject').AsTrimString := MetaObject;   {do not localize}
      qryOwnerPriv.ExecQuery;
      while not qryOwnerPriv.Eof do
      begin
        First := false;
        User := Trim(qryOwnerPriv.FieldByName('RDB$USER').AsTrimString); {do not localize}

        case qryOwnerPriv.FieldByName('RDB$USER_TYPE').AsInteger of  {do not localize}
          obj_relation,
          obj_view,
          obj_trigger,
          obj_procedure,
          obj_sql_role:
            UserString := QuoteIdentifier(GetDialect, User);
          else
            UserString := User;
        end; //end_case
        case qryOwnerPriv.FieldByName('RDB$USER_TYPE').AsInteger of   {do not localize}
          obj_view :
            UserString := 'VIEW ' + UserString;   {do not localize}
          obj_trigger :
            UserString := 'TRIGGER '+ UserString;   {do not localize}
          obj_procedure :
            UserString := 'PROCEDURE ' + UserString;    {do not localize}
        end; //end_case

        if qryOwnerPriv.FieldByName('RDB$GRANT_OPTION').AsInteger = 1 then   {do not localize}
          WithOption := ' WITH GRANT OPTION'       {do not localize}
        else
          WithOption := '';

        FMetaData.Add(Format('GRANT EXECUTE ON PROCEDURE %s TO %s%s%s',  {do not localize}
          [QuoteIdentifier(GetDialect, MetaObject), UserString,
           WithOption, terminator]));

        qryOwnerPriv.Next;
      end;
      qryOwnerPriv.Close;
    end;
    if First then
    begin
      qryOwnerPriv.SQL.Text := RolePrivSQL;
      qryOwnerPriv.Params.ByName('metaobject').AsTrimString := MetaObject; {do not localize}
      qryOwnerPriv.ExecQuery;
      while not qryOwnerPriv.Eof do
      begin
        First := false;
        if qryOwnerPriv.FieldByName('RDB$GRANT_OPTION').AsInteger = 1 then  {do not localize}
          WithOption := ' WITH ADMIN OPTION'     {do not localize}
        else
          WithOption := '';

        FMetaData.Add(Format('GRANT %s TO %s%s%s',      {do not localize}
          [QuoteIdentifier(GetDialect, qryOwnerPriv.FieldByName('RDB$RELATION_NAME').AsTrimString),  {do not localize}
           qryOwnerPriv.FieldByName('RDB$USER_NAME').AsTrimString,     {do not localize}
           WithOption, terminator]));

        qryOwnerPriv.Next;
      end;
      qryOwnerPriv.Close;
    end;

    if First and (ODSMajorVersion >= ODS_VERSION16) then
    begin
      qryOwnerPriv.SQL.Text := SubscriptionSQL;
      qryOwnerPriv.Params.ByName('metaobject').AsTrimString := MetaObject; {do not localize}
      qryOwnerPriv.ExecQuery;
      while not qryOwnerPriv.Eof do
      begin
        if qryOwnerPriv.FieldByName('RDB$GRANT_OPTION').AsInteger = 1 then  {do not localize}
          WithOption := ' WITH ADMIN OPTION'     {do not localize}
        else
          WithOption := '';

        FMetaData.Add(Format('GRANT SUBSCRIBE ON SUBSCRIPTION %s to %s%s%s',      {do not localize}
          [QuoteIdentifier(GetDialect, qryOwnerPriv.FieldByName('RDB$RELATION_NAME').AsTrimString),  {do not localize}
           qryOwnerPriv.FieldByName('RDB$USER').AsTrimString,     {do not localize}
           WithOption, terminator]));

        qryOwnerPriv.Next;
      end;
      qryOwnerPriv.Close;
    end;
  finally
    qryOwnerPriv.Free;
  end;
end;

{	  ShowGrantRoles
  Functional description
   	Show grants for given role name
   	This function is also called by extract for privileges.
   	All membership privilege may have the with_admin option set. }

procedure TIBExtract.ShowGrantRoles(Terminator: String);
const
  RoleSQL =
    'SELECT RDB$USER, RDB$GRANT_OPTION, RDB$RELATION_NAME ' +  {do not localize}
    'FROM RDB$USER_PRIVILEGES ' +    {do not localize}
    'WHERE ' +   {do not localize}
    '  RDB$OBJECT_TYPE = %d AND ' +   {do not localize}
    '  RDB$USER_TYPE = %d AND ' +  {do not localize}
    '  RDB$PRIVILEGE = ''M'' ' +   {do not localize}
    'ORDER BY  RDB$RELATION_NAME, RDB$USER'; {do not localize}

var
  WithOption, UserString : String;
  qryRole : TIBSQL;

begin
  qryRole := CreateIBSQL;
  try
    qryRole.SQL.Text := Format(RoleSQL, [obj_sql_role, obj_user]);
    qryRole.ExecQuery;
    while not qryRole.Eof do
    begin
      UserString := Trim(qryRole.FieldByName('RDB$USER').AsTrimString); {do not localize}

      if (not qryRole.FieldByName('RDB$GRANT_OPTION').IsNull) and    {do not localize}
         (qryRole.FieldByName('RDB$GRANT_OPTION').AsInteger = 1) then  {do not localize}
        WithOption := ' WITH ADMIN OPTION'    {do not localize}
      else
        WithOption := '';
      FMetaData.Add(Format('GRANT %s TO %s%s%s%s',    {do not localize}
        [ QuoteIdentifier(GetDialect, qryRole.FieldByName('RDB$RELATION_NAME').AsTrimString),  {do not localize}
         UserString, WithOption, Terminator, NEWLINE]));

      qryRole.Next;
    end;
  finally
    qryRole.Free;
  end;
end;

{	            GetProcedureArgs
  Functional description
 	 This function extract the procedure parameters and adds it to the
 	 extract file }

procedure TIBExtract.GetProcedureArgs(Proc: String; args : TStrings);
const
{ query to retrieve the input parameters. }
  ProcHeaderSQL =
    'SELECT * ' +  {do not localize}
    ' FROM RDB$PROCEDURE_PARAMETERS PRM JOIN RDB$FIELDS FLD ON ' +   {do not localize}
    ' PRM.RDB$FIELD_SOURCE = FLD.RDB$FIELD_NAME ' +   {do not localize}
    'WHERE ' +  {do not localize}
    '    PRM.RDB$PROCEDURE_NAME = :PROCNAME ' +   {do not localize}
    'ORDER BY PRM.RDB$PARAMETER_TYPE, PRM.RDB$PARAMETER_NUMBER'; {do not localize}

var
  FirstTime, PrecisionKnown : Boolean;
  Line : String;

  function FormatParamStr : String;
  var
    CollationID, CharSetID, subtype : Integer;
    FieldType, FieldScale : Integer;
      begin
    Result := Format('  %s ', [QuoteIdentifier(GetDialect, qryProcedures.FieldByName('RDB$PARAMETER_NAME').AsString.Trim)]); {do not localize}
        PrecisionKnown := FALSE;
    FieldType := qryProcedures.FieldByName('RDB$FIELD_TYPE').AsInteger;
    FieldScale := qryProcedures.FieldByName('RDB$FIELD_SCALE').AsInteger;
    if ODSMajorVersion >= ODS_VERSION10 then
        begin
      if FieldType in [blr_short, blr_long, blr_int64] then  {do not localize}
          begin
            { We are ODS >= 10 and could be any Dialect }
        if (DBSQLDialect >= 3) and
           (not qryProcedures.FieldByName('RDB$FIELD_PRECISION').IsNull) and    {do not localize}
           (qryProcedures.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger > 0) and   {do not localize}
           (qryProcedures.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger <= MAX_INTSUBTYPES) then   {do not localize}
            begin
              Result := Result + Format('%s(%d, %d)', [                             {do not localize}
            IntegralSubtypes [qryProcedures.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger],  {do not localize}
            qryProcedures.FieldByName('RDB$FIELD_PRECISION').AsInteger,              {do not localize}
            -1 * FieldScale]);           {do not localize}
              PrecisionKnown := true;
            end;
          end;
        end;
        if PrecisionKnown = false then
        begin
          { Take a stab at numerics and decimals }
      if (FieldType = blr_short) and    {do not localize}
          (FieldScale < 0) then        {do not localize}
            Result := Result + Format('NUMERIC(4, %d)',                           {do not localize}
          [-FieldScale] )             {do not localize}
          else
        if (FieldType = blr_long) and  {do not localize}
            (FieldScale < 0) then      {do not localize}
              Result := Result + Format('NUMERIC(9, %d)',                          {do not localize}
            [-FieldScale] )            {do not localize}
            else
          if (FieldType = blr_double) and   {do not localize}
              (FieldScale  < 0) then      {do not localize}
                Result := Result + Format('NUMERIC(15, %d)',                         {do not localize}
              [-FieldScale] )            {do not localize}
              else
            Result := Result + ColumnTypes.Items[FieldType];
      end;
    if FieldType in [blr_text, blr_varying] then {do not localize}
      Result := Result + Format('(%d)', [GetFieldLength(qryProcedures)]); {do not localize}

    if FieldType = blr_blob then
    begin
      subtype := qryProcedures.Current.ByName('RDB$FIELD_SUB_TYPE').AsShort; {do not localize}
      Result := Result + ' SUB_TYPE ';    {do not localize}
      if (subtype > 0) and (subtype <= MAXSUBTYPES) then
        Result := Result + SubTypes[subtype]
      else
        Result := Result + IntToStr(subtype);
      Result := Result + Format(' SEGMENT SIZE %d',  {do not localize}
          [qryProcedures.FieldByName('RDB$SEGMENT_LENGTH').AsInteger]); {do not localize}
    end;
    { Show international character sets and collations }

    if (not qryProcedures.FieldByName('RDB$COLLATION_ID').IsNull) or  {do not localize}
       (not qryProcedures.FieldByName('RDB$CHARACTER_SET_ID').IsNull) then {do not localize}
    begin
      if qryProcedures.FieldByName('RDB$COLLATION_ID').IsNull then {do not localize}
        CollationId := 0
      else
        CollationId := qryProcedures.FieldByName('RDB$COLLATION_ID').AsInteger; {do not localize}

      if qryProcedures.FieldByName('RDB$CHARACTER_SET_ID').IsNull then {do not localize}
        CharSetId := 0
      else
        CharSetId := qryProcedures.FieldByName('RDB$CHARACTER_SET_ID').AsInteger; {do not localize}

      Result := Result + GetCharacterSets(CharSetId, CollationId, false);
    end;
  end;

begin
  FirstTime := true;

  if not qryProcedures.FieldByName('RDB$PARAMETER_NAME').IsNull then
  begin
    while (not qryProcedures.Eof) and
          (qryProcedures.FieldByName('RDB$PROCEDURE_NAME').AsString.Trim = Proc) and
          (qryProcedures.FieldByName('RDB$PARAMETER_TYPE').AsInteger = 0) do
    begin
      if FirstTime then
      begin
        FirstTime := false;
        args.Add('(');  {do not localize}
      end;

      Line := FormatParamStr;

      qryProcedures.Next;
      if not qryProcedures.Eof and
          (qryProcedures.FieldByName('RDB$PROCEDURE_NAME').AsString.Trim = Proc) and
          (qryProcedures.FieldByName('RDB$PARAMETER_TYPE').AsInteger = 0) then
        Line := Line + ',';  {do not localize}
      args.Add(Line);
    end;

    { If there was at least one param, close parens }
    if not FirstTime then
    begin
      args.Add( ')');  {do not localize}
    end;

    FirstTime := true;

    while (not qryProcedures.Eof) and
          (qryProcedures.FieldByName('RDB$PROCEDURE_NAME').AsString.Trim = Proc) do
    begin
      if FirstTime then
      begin
        FirstTime := false;
        args.Add('RETURNS' + NEWLINE + '(');  {do not localize}
      end;

      Line := FormatParamStr;

      qryProcedures.Next;
      if (not qryProcedures.Eof) and
         (qryProcedures.FieldByName('RDB$PROCEDURE_NAME').AsString.Trim = Proc) then
        Line := Line + ','; {do not localize}
      args.Add(Line);
    end;

    { If there was at least one param, close parens }
    if not FirstTime then
    begin
      args.Add( ')'); {do not localize}
    end;
  end
  else
    qryProcedures.Next;

  args.Add('AS'); {do not localize}
end;

procedure TIBExtract.BuildConnectString;
const
  OwnerSQL = 'SELECT RDB$OWNER_NAME FROM RDB$RELATIONS WHERE RDB$RELATION_NAME=''RDB$DATABASE'''; {do not localize}
var
  qryOwner : TIBSQL;
begin
  qryOwner := CreateIBSQL;
  try
    qryOwner.SQL.Text := OwnerSQL;
    qryOwner.ExecQuery;
    FMetaData.Add('/* CONNECT ' + QuotedStr(FBase.Database.DatabaseName) + {do not localize}
      ' USER ' + QuotedStr(QryOwner.FieldByName('RDB$OWNER_NAME').AsTrimString) + {do not localize}
      ' PASSWORD ' + QuotedStr(SPassword) + '*/'); {do not localize}
    qryOwner.Close;
  finally
    qryOwner.Free;
  end;

end;

procedure TIBExtract.ListData(ObjectName: String);
const
  SelectSQL = 'SELECT * FROM %s';  {do not localize}
var
  qrySelect : TIBSQL;
  Line, FieldName, Fields, Values, DateStr : String;
  i : Integer;
  AFormatSettings : TFormatSettings;
begin
  qrySelect := CreateIBSQL;
  AFormatSettings.DateSeparator := '/';  {do not localize}
  AFormatSettings.TimeSeparator := ':';  {do not localize}
  try
    qrySelect.SQL.Text := Format(SelectSQL,
      [QuoteIdentifier(GetDialect, ObjectName)]);
    qrySelect.ExecQuery;
    Fields := '';
    for i := 0 to qrySelect.Current.Count - 1 do
      if (qrySelect.Fields[i].SQLType <> SQL_ARRAY) and
         (not ((qrySelect.Fields[i].SQLType = SQL_BLOB) and
               (qrySelect.Fields[i].Data.SqlSubtype <> 1))) and
         (not Database.Has_COMPUTED_BLR(ObjectName, qrySelect.Fields[i].Name)) then
      begin
        FieldName := String(qrySelect.Fields[i].SQLVAR.sqlname);
        if Fields <> '' then
          Fields := Fields + ', '; {do not localize}
        Fields := Fields + QuoteIdentifier(GetDialect, FieldName);
      end;
    while not qrySelect.Eof do
    begin
      Line := 'INSERT INTO ' + QuoteIdentifier(GetDialect, ObjectName) + ' (';  {do not localize}

      Line := Line + Fields + ') VALUES (';  {do not localize}
      Values := '';
      for i := 0 to qrySelect.Current.Count - 1 do
      begin
        if Database.Has_COMPUTED_BLR(ObjectName, qrySelect.Fields[i].Name) then
          Continue;
        if (Values <> '') and (qrySelect.Fields[i].SQLType <> SQL_ARRAY) and
           (not ((qrySelect.Fields[i].SQLType = SQL_BLOB) and
                 (qrySelect.Fields[i].Data.SqlSubtype <> 1))) then
          Values := Values + ', ';
        if qrySelect.Fields[i].IsNull and
           (qrySelect.Fields[i].SQLType <> SQL_ARRAY) and
           (not ((qrySelect.Fields[i].SQLType = SQL_BLOB) and
                 (qrySelect.Fields[i].Data.SqlSubtype <> 1)))  then
        begin
          Values := Values + 'NULL'; {do not localize}
        end
        else
        case qrySelect.Fields[i].SQLType of
          SQL_TEXT, SQL_VARYING, SQL_BLOB :
            if not ((qrySelect.Fields[i].SQLType = SQL_BLOB) and
               (qrySelect.Fields[i].Data.SqlSubtype <> 1)) then
              Values := Values + QuotedStr(qrySelect.Fields[i].AsString);
          SQL_TYPE_DATE :
          begin
            DateTimeToString(DateStr, 'mm/dd/yyyy', qrySelect.Fields[i].AsDate, AFormatSettings); {do not localize}
            Values := Values + QuotedStr(DateStr);
          end;
          SQL_TYPE_TIME :
          begin
            DateTimeToString(DateStr, 'hh:mm:ssss', qrySelect.Fields[i].AsTime, AFormatSettings); {do not localize}
            Values := Values + QuotedStr(DateStr);
          end;
          SQL_TIMESTAMP :
          begin
            DateTimeToString(DateStr, 'mm/dd/yyyy hh:mm:ssss', qrySelect.Fields[i].AsDateTime, AFormatSettings); {do not localize}
            Values := Values + QuotedStr(DateStr);
          end;
          SQL_SHORT, SQL_LONG, SQL_INT64,
          SQL_DOUBLE, SQL_FLOAT, SQL_D_FLOAT, SQL_BOOLEAN:
            Values := Values + qrySelect.Fields[i].AsTrimString;
          SQL_ARRAY : ;
          else
            IBError(ibxeInvalidDataConversion, [nil]);
        end;
      end;
      Line := Line + Values + ')' + Term;   {do not localize}
      FMetaData.Add(Line);
      qrySelect.Next;
    end;
  finally
    qrySelect.Free;
  end;
end;

procedure TIBExtract.ListRoles(ObjectName: String);
const
  RolesSQL =
    'select * from RDB$ROLES ' +   {do not localize}
    'order by RDB$ROLE_NAME';    {do not localize}

  RolesByNameSQL =
    'select * from RDB$ROLES ' +  {do not localize}
    'WHERE RDB$ROLE_NAME = :RoleName ' +  {do not localize}
    'order by RDB$ROLE_NAME';   {do not localize}

var
  qryRoles : TIBSQL;
  PrevOwner, RoleName, OwnerName : String;
begin
  {Process GRANT roles}
  qryRoles := CreateIBSQL;
  try
    if ODSMajorVersion >= ODS_VERSION9 then
    begin
      PrevOwner := '';
      FMetaData.Add('');
      if IncludeComments then
        FMetaData.Add('/* Grant Roles for this database */');  {do not localize}
      FMetaData.Add('');

      if ObjectName = '' then
        qryRoles.SQL.Text := RolesSQL
      else
      begin
        qryRoles.SQL.Text := RolesByNameSQL;
        qryRoles.Params.ByName('RoleName').AsTrimString := ObjectName;  {do not localize}
      end;
      qryRoles.ExecQuery;
      try
        while not qryRoles.Eof do
        begin
          RoleName := QuoteIdentifier(GetDialect,
              qryRoles.FieldByName('rdb$Role_Name').AsTrimString);  {do not localize}
          OwnerName := Trim(qryRoles.FieldByName('rdb$Owner_Name').AsTrimString); {do not localize}
          if PrevOwner <> OwnerName then
          begin
            FMetaData.Add('');
            if IncludeComments then
              FMetaData.Add(Format('/* Role: %s, Owner: %s */', [RoleName, OwnerName]));  {do not localize}
            FMetaData.Add('');
            PrevOwner := OwnerName;
          end;
          FMetaData.Add('CREATE ROLE ' + RoleName + Term);  {do not localize}
          qryRoles.Next;
        end;
      finally
        qryRoles.Close;
      end;
    end;
  finally
    qryRoles.Free;
  end;
end;

procedure TIBExtract.ListSubscriptions(SubscriptionName: String);
const
  SNamedSubscription = 'select SBS.RDB$SUBSCRIPTION_NAME, SBS.RDB$OWNER_NAME, SBS.RDB$DESCRIPTION ' +  {do not localize}
                       '  from RDB$SUBSCRIPTIONS SBS ' + {do not localize}
                       ' where SBS.RDB$RELATION_NAME IS NULL AND ' + {do not localize}
                       '       SBS.RDB$SUBSCRIPTION_NAME = :subscription_name'; {do not localize}

  SAllSubscription = 'select SBS.RDB$SUBSCRIPTION_NAME, SBS.RDB$OWNER_NAME, SBS.RDB$DESCRIPTION ' +  {do not localize}
                       '  from RDB$SUBSCRIPTIONS SBS ' + {do not localize}
                       ' where SBS.RDB$RELATION_NAME IS NULL ' + {do not localize }
                       ' order by RDB$SUBSCRIPTION_NAME'; {do not localize}

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
  SLine, SDelim : String;
  FColumn : Boolean;
begin
  if ODSMajorVersion < ODS_VERSION16 then
    Exit;
  if not Assigned(sqlMain) then
    sqlMain := CreateIBSQL;
  if SubscriptionName <> '' then
  begin
    { stops from unnecessarily re prepaing this }
    if sqlMain.SQL.Text <> SNamedSubscription then
      sqlMain.SQL.Text := SNamedSubscription;
    sqlMain.ParamByName('subscription_name').AsString := SubscriptionName;
  end
  else
    if sqlMain.SQL.Text <> SAllSubscription then
      sqlMain.SQL.Text := SAllSubscription;

  if not Assigned(sqlTables) then
  begin
    sqlTables := CreateIBSQL;
    sqlTables.SQL.Text := STables;
  end;

  if not Assigned(sqlColumns) then
  begin
    sqlColumns := CreateIBSQL;
    sqlColumns.SQL.Text := SColumns;
  end;

  if IncludeComments then
    FMetaData.Add('/* Subscriptions */'); { do not localize }

  sqlMain.ExecQuery;
  try
    while not sqlMain.Eof do
    begin
      if IncludeComments then
      begin
        FMetaData.Add('/* SubScription Name: ' + sqlMain.FieldByName('RDB$SUBSCRIPTION_NAME').AsString.Trim); { do not localize }
        FMetaData.Add('   Owner: ' + sqlMain.FieldByName('rdb$owner_name').AsString.Trim);  { do not localize }
        FMetaData.Add('   Description: ' + sqlMain.FieldByName('RDB$DESCRIPTION').AsString.Trim + ' */');  { do not localize }
      end;

      FMetaData.Add('');  { do not localize }
      FMetaData.Add('CREATE SUBSCRIPTION ' + QuoteIdentifier(GetDialect, sqlMain.FieldByName('RDB$SUBSCRIPTION_NAME').AsString.Trim) + ' ON '); {do not localize }

      sqlTables.ParamByName('subscription_name').AsString := sqlMain.FieldByName('RDB$SUBSCRIPTION_NAME').AsString; {do not localize }
      sqlTables.ExecQuery;
      while not sqlTables.Eof do
      begin
        if SLine <> '' then {do not localize}
        begin
          SLine := SLine + ','; {do not localize}
          FMetaData.Add(SLine);
        end;

        SLine := '    ' + QuoteIdentifier(GetDialect, sqlTables.FieldByName('RDB$RELATION_NAME').AsString.Trim); {do not localize }

        sqlColumns.ParamByName('subscription_name').AsString := sqlMain.FieldByName('RDB$SUBSCRIPTION_NAME').AsString; {do not localize}
        sqlColumns.ParamByName('relation_counter').AsInteger := sqlTables.FieldByName('RDB$RELATION_COUNTER').AsInteger; {do not localize }
        sqlColumns.ExecQuery;
        FColumn := True;
        while not sqlColumns.Eof do
        begin
          if FColumn then
          begin
            SLine := SLine + ' (' + QuoteIdentifier(GetDialect, sqlColumns.FieldByName('RDB$FIELD_NAME').AsString.Trim); {do not localize }
            FColumn := False;
          end
          else
            SLine := SLine + ', ' + QuoteIdentifier(GetDialect, sqlColumns.FieldByName('RDB$FIELD_NAME').AsString.Trim); {do not localize }
          sqlColumns.Next;
        end;
        if not (sqlColumns.IsEmpty) then
          SLine := SLine + ') '; {do not localize }
        sqlColumns.Close;

        SDelim := '';
        if not sqlTables.FieldByName('RDB$CHANGE').AsBoolean then  {do not localize}
        begin
          SLine := SLine + ' FOR ROW (';   {do not localize}
          if sqlTables.FieldByName('RDB$INSERT').AsBoolean then {do not localize}
          begin
            SLine := SLine + 'INSERT'; {do not localize}
            SDelim := ', '; {do not localize}
          end;

          if sqlTables.FieldByName('RDB$UPDATE').AsBoolean then {do not localize}
          begin
            SLine := SLine + SDelim + 'UPDATE'; {do not localize}
            SDelim := ', '; {do not localize}
          end;
          if sqlTables.FieldByName('RDB$DELETE').AsBoolean then {do not localize}
          begin
            SLine := SLine + SDelim + 'DELETE'; {do not localize}
            SDelim := ', '; {do not localize}
          end;
          SLine := SLine + ')'; {do not localize}
        end;
        sqlTables.Next;
      end;
      FMetaData.Add(SLine);
      sqlTables.Close;
      if not sqlMain.FieldByName('RDB$DESCRIPTION').IsNull then {do not localize}
        FMetaData.Add('DESCRIPTION ' + QuotedStr(sqlMain.FieldByName('RDB$DESCRIPTION').AsString.Trim)); {do not localize}

      FMetaData[FMetaData.Count - 1] := FMetaData[FMetaData.Count - 1] + TERM; {do not localize}
      FMetaData.Add(''); {do not localize}

      sqlMain.Next;
    end;
  finally
    sqlMain.Close;
  end;

end;

Procedure TIBExtract.ListEUAUsers;
const
  UserSQL = 'SELECT * FROM RDB$USERS ' +   {do not localize}
    'WHERE RDB$USER_NAME NOT IN '+   {do not localize}
    '    (SELECT RDB$OWNER_NAME FROM RDB$RELATIONS ' + {do not localize}
    '      WHERE RDB$RELATION_NAME=''RDB$DATABASE'')'; {do not localize}
var
  qryUsers : TIBSQL;

  function BuildAddSQL : String;
  begin
    Result := '/* CREATE USER ' + qryUsers.FieldByName('RDB$USER_NAME').AsTrimString +  {do not localize}
       ' SET PASSWORD /* Password needed */ ';   {do not localize}
    if qryUsers.FieldByName('RDB$DEFAULT_ROLE').AsTrimString <> '' then  {do not localize}
      Result := Result + ' DEFAULT ROLE ' +    {do not localize}
         QuotedStr(qryUsers.FieldByName('RDB$DEFAULT_ROLE').AsTrimString);   {do not localize}
    if qryUsers.FieldByName('RDB$SYSTEM_USER_NAME').AsTrimString <> '' then {do not localize}
      Result := Result + ' SYSTEM USER NAME ' +    {do not localize}
        QuotedStr(qryUsers.FieldByName('RDB$SYSTEM_USER_NAME').AsTrimString);  {do not localize}
    if qryUsers.FieldByName('RDB$GROUP_NAME').AsTrimString <> '' then    {do not localize}
      Result := Result + ' GROUP NAME ' +  {do not localize}
        QuotedStr(qryUsers.FieldByName('RDB$GROUP_NAME').AsTrimString);   {do not localize}
    if qryUsers.FieldByName('RDB$UID').AsInteger > 0 then    {do not localize}
      Result := Result + ' UID ' + IntToStr(qryUsers.FieldByName('RDB$UID').AsInteger);  {do not localize}
    if qryUsers.FieldByName('RDB$GID').AsInteger > 0 then    {do not localize}
      Result := Result + ' GID ' + IntToStr(qryUsers.FieldByName('RDB$GID').AsInteger);  {do not localize}
    if qryUsers.FieldByName('RDB$DESCRIPTION').AsTrimString <> '' then  {do not localize}
      Result := Result + ' DESCRIPTION ' +    {do not localize}
        QuotedStr(qryUsers.FieldByName('RDB$DESCRIPTION').AsTrimString);   {do not localize}
    if qryUsers.FieldByName('RDB$FIRST_NAME').AsTrimString <> '' then {do not localize}
      Result := Result + ' FIRST NAME ' + {do not localize}
        QuotedStr(qryUsers.FieldByName('RDB$FIRST_NAME').AsTrimString);   {do not localize}
    if qryUsers.FieldByName('RDB$MIDDLE_NAME').AsTrimString <> '' then   {do not localize}
      Result := Result + ' MIDDLE NAME ' +   {do not localize}
        QuotedStr(qryUsers.FieldByName('RDB$MIDDLE_NAME').AsTrimString);  {do not localize}
    if qryUsers.FieldByName('RDB$LAST_NAME').AsTrimString <> '' then
      Result := Result + ' LAST NAME ' +  {do not localize}
        QuotedStr(qryUsers.FieldByName('RDB$LAST_NAME').AsTrimString);  {do not localize}
    Result := Result + TERM + '*/';   {do not localize}
  end;

begin
  if (FDatabaseInfo.EUAActive) then
  begin
    qryUsers:= CreateIBSQL;
    try
      qryUsers.SQL.Text := UserSQL;
      qryUsers.ExecQuery;
      try
        if not qryUsers.eof then
          FMetaData.Add('/* Users in Database (passwords need to be added)*/'); {do not localize}
        while not qryUsers.eof do
        begin
          FMetaData.Add(BuildAddSQL);
          if qryUsers.FieldByName('RDB$USER_ACTIVE').AsTrimString <> 'Y' then  {do not localize}
            FMetaData.Add('/*ALTER USER ' + qryUsers.FieldByName('RDB$USER_NAME').AsTrimString +  {do not localize}
              ' SET INACTIVE */');   {do not localize}
          qryUsers.Next;
        end;
      finally
        qryUsers.Close;
      end;
    finally
      qryUsers.Free;
    end;
  end;
end;

Procedure TIBExtract.ListEncryptions(EncryptionName : String);
const
  EncryptionsByNameSQL =
      'SELECT * FROM RDB$ENCRYPTIONS ' + {do not localize}
      'WHERE RDB$ENCRYPTION_NAME = :ENCRYPTION_NAME'; {do not localize}

  EncryptionsSQL =
      'SELECT * FROM RDB$ENCRYPTIONS;'; {do not localize}

   GrantsSQL =
      'SELECT RDB$USER, RDB$RELATION_NAME FROM RDB$USER_PRIVILEGES A INNER JOIN ' +  {do not localize}
      'RDB$ENCRYPTIONS B ON A.RDB$RELATION_NAME = B.RDB$ENCRYPTION_NAME ' + {do not localize}
      'WHERE A.RDB$USER <> ''SYSDSO'' AND A.RDB$PRIVILEGE=''E''';  {do not localize}

var
  qryEncryptions, qryGrants : TIBSQL;
  Buffer : String;
begin
  if (FullODS >= 13.0) then
  begin
    qryEncryptions := CreateIBSQL;
    qryGrants := CreateIBSQL;
    try
      if EncryptionName = '' then
        qryEncryptions.SQL.Text := EncryptionsSQL
      else
      begin
        qryEncryptions.SQL.Text := EncryptionsByNameSQL;
        qryEncryptions.Params.ByName('ENCRYPTION_NAME').AsTrimString := EncryptionName; {do not localize}
      end;
      FMetaData.Add('/*CONNECT ' + QuotedStr(FBase.Database.DatabaseName) +  {do not localize}
         ' USER ''SYSDSO'' PASSWORD ' + QuotedStr(SPassword) + '*/'); {do not localize}
      FMetaData.Add('/* ALTER DATABASE SET SYSTEM ENCRYPTION PASSWORD ' +  {do not localize}
         QuotedStr(SEncryptionPassword) + TERM + '*/');  {do not localize}
      try
      qryEncryptions.ExecQuery;
      except
        // Exceptions will be because of no permissions ot read, jsut drop out if
        //    this happens and continue on
        Exit;
      end;
      while not qryEncryptions.eof do
      begin
        Buffer := 'CREATE ENCRYPTION ' +  {do not localize}
          qryEncryptions.FieldByName('RDB$ENCRYPTION_NAME').AsTrimString + {do not localize}
            ' FOR ' + {do not localize}
            qryEncryptions.FieldByName('RDB$ENCRYPTION_CIPHER').AsTrimString + {do not localize}
            ' WITH LENGTH ' +  {do not localize}
            qryEncryptions.FieldByName('RDB$ENCRYPTION_LENGTH').AsString + {do not localize}
            ' BITS INIT_VECTOR '; {do not localize}
        if qryEncryptions.FieldByName('RDB$ENCRYPTION_INIT_VECTOR').IsNull then {do not localize}
          Buffer := Buffer + ' NULL'    {do not localize}
        else
          Buffer := Buffer + ' RANDOM';   {do not localize}
        Buffer := Buffer + ' PAD ';    {do not localize}
        if qryEncryptions.FieldByName('RDB$ENCRYPTION_PAD').IsNull then   {do not localize}
          Buffer := Buffer + ' NULL'  {do not localize}
        else
          Buffer := Buffer + ' RANDOM';      {do not localize}
        if not qryEncryptions.FieldByName('RDB$DESCRIPTION').isnull then  {do not localize}
          Buffer := Buffer + ' DESCRIPTION ' +   {do not localize}
            QuotedStr(qryEncryptions.FieldByName('RDB$DESCRIPTION').AsTrimString);  {do not localize}
        if not qryEncryptions.FieldByName('RDB$PASSWORD2').isnull then {do not localize}
          Buffer := '/* ' + Buffer + ' PASSWORD ' + QuotedStr(SEncryptionPassword); {do not localize}
        Buffer := Buffer + TERM;
        if not qryEncryptions.FieldByName('RDB$PASSWORD2').isnull then {do not localize}
          Buffer := Buffer + '*/';    {do not localize}
        FMetaData.Add(Buffer);
        qryEncryptions.Next;
      end;
      qryEncryptions.Close;
      qryGrants.SQL.Text := GrantsSQL;
      qryGrants.ExecQuery;
      while not qryGrants.eof do
      begin
        FMetaData.Add('GRANT ENCRYPT ON ENCRYPTION ' +  {do not localize}
              qryGrants.FieldByName('RDB$RELATION_NAME').AsTrimString +  {do not localize}
              ' TO ' + qryGrants.FieldByName('RDB$USER').AsTrimString +  {do not localize}
              TERM);
        qryGrants.Next;
      end;
      qryGrants.Close;
      FMetaData.Add('COMMIT' + TERM); {do not localize}

    finally
      qryEncryptions.Free;
      qryGrants.Free;
    end;
  end;
end;

function TIBExtract.GetFieldLength(sql: TIBSQL): Integer;
begin
  if sql.FieldByName('RDB$CHARACTER_LENGTH').IsNull then   {do not localize}
    Result := sql.FieldByName('RDB$FIELD_LENGTH').AsInteger   {do not localize}
  else
    Result := sql.FieldByName('RDB$CHARACTER_LENGTH').AsInteger; {do not localize}
end;

function TIBExtract.CreateIBSQL: TIBSQL;
begin
  Result := TIBSQL.Create(Self);
  Result.Database := FBase.Database;
  if FBase.Transaction <> FBase.Database.DefaultTransaction then
    Result.Transaction := FBase.Transaction;
end;

procedure SetupTypes;
begin
  ColumnTypes := TDictionary<SmallInt, string>.Create(15);
  ColumnTypes.Add(blr_short,	'SMALLINT');		 {do not localize}
  ColumnTypes.Add(blr_long, 'INTEGER');		   {do not localize}
  ColumnTypes.Add(blr_quad, 'QUAD');		   {do not localize}
  ColumnTypes.Add(blr_float, 'FLOAT');		    {do not localize}
  ColumnTypes.Add(blr_text, 'CHAR');		    {do not localize}
  ColumnTypes.Add(blr_double, 'DOUBLE PRECISION');	  {do not localize}
  ColumnTypes.Add(blr_varying, 'VARCHAR');		  {do not localize}
  ColumnTypes.Add(blr_cstring, 'CSTRING');		  {do not localize}
  ColumnTypes.Add(blr_blob_id, 'BLOB_ID');		  {do not localize}
  ColumnTypes.Add(blr_blob, 'BLOB');		  {do not localize}
  ColumnTypes.Add(blr_sql_time, 'TIME');		 {do not localize}
  ColumnTypes.Add(blr_sql_date, 'DATE');		 {do not localize}
  ColumnTypes.Add(blr_timestamp, 'TIMESTAMP');		  {do not localize}
  ColumnTypes.Add(blr_int64, 'INT64');       {do not localize}
  ColumnTypes.Add(blr_boolean_dtype, 'BOOLEAN');  {do not localize}
end;

initialization
  SetupTypes;
finalization
  ColumnTypes.Free;
end.
