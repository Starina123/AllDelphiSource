{$A8} {$R-}
{*************************************************************}
{                                                             }
{       Embarcadero Delphi Visual Component Library           }
{       InterBase Express core components                     }
{                                                             }
{       Copyright (c) 1998-2017 Embarcadero Technologies, Inc.}
{              All rights reserved                            }
{                                                             }
{    InterBase Express is based in part on the product        }
{    Free IB Components, written by Gregory H. Deatz for      }
{    Hoagland, Longo, Moran, Dunst & Doukas Company.          }
{    Free IB Components is used under license.                }
{                                                             }
{    Additional code created by Jeff Overcash and used        }
{    with permission.                                         }
{*************************************************************}

unit IBX.IBInputOutput;

interface

uses System.Classes, IBX.IBSQL, System.SysUtils, IBX.IBDatabase, IBX.IBHeader,
     IBX.IBExternals, Data.DB;
  { TIBBatch }

type

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBBatch = class(TComponent)
  private
    FBase: TIBBase;
    FSQL : TStrings;

    function GetDatabase: TIBDatabase;
    function GetTransaction: TIBTransaction;
    procedure SetDatabase(const Value: TIBDatabase);
    procedure SetTransaction(const Value: TIBTransaction);
    function GetSQL: TStrings;
    procedure SetSQL(const Value: TStrings);
  protected
    FFile : TFileStream;
    FFilename: String;
    FColumns: TIBXSQLDA;
    FParams: TIBXSQLDA;
  public
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create; reintroduce; overload;
    destructor Destroy; override;
    procedure ReadyFile; virtual;
    property Columns: TIBXSQLDA read FColumns write FColumns;
    property Params: TIBXSQLDA read FParams write FParams;
    procedure FinalizeFile; virtual;
  published
    property Filename: String read FFilename write FFilename;
    property Database: TIBDatabase read GetDatabase write SetDatabase;
    property Transaction: TIBTransaction read GetTransaction
                                          write SetTransaction;
    property SQL: TStrings read GetSQL write SetSQL;
  end;

  TIBBatchInput = class;

  TIBBatchType = (ibBatch, ibSingle);
  TIBBatchEvent = procedure(Sender : TIBBatchInput; BatchCount, AffectedRows : Integer) of object;

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBBatchInput = class(TIBBatch)
  private
    type
      TIBInputStorage = record
        sqllen : Integer;
        sqldata : TBytes;
        sqlind : Short;
        sqlindnil : Boolean;

        procedure SetData(len: Integer; asqldata : PByte; asqlind: PShort);
        function psqlind : PShort;
      end;
  private
    FBatchSize, FTotalReadCount, BufferIndex : Integer;
    FParamArray, FParamTemplate : Array of TXSQLVar;
    FRowsAffected : Array of UISC_LONG;
    FSQLVarData : Array of Array of TIBInputStorage;
    FHandle : TISC_STMT_HANDLE;
    sqlda : PXSQLDA;
    FBatchType: TIBBatchType;
    FBatchEvent: TIBBatchEvent;
    FRowsAffectedCount: Integer;
    FLastError: String;
    FInitialAttempt : Boolean;

    function xsqlvar_blr_length : Integer; inline;
    function xsqlvar_msg_length : Integer;

  protected
    procedure SetBatchSize(const Value: Integer);
    procedure AddToBatch;
    procedure ProcessBatch(Handle: TISC_STMT_HANDLE);
    procedure CalculateDataArrays;
    procedure PrepareSQL;
    procedure Cleanup;
  public
    function ReadParameters: Boolean; virtual; abstract;
    procedure BatchInput;
    procedure BatchInputFrom(SourceSQL : TIBSQL); overload;
    procedure BatchInputFrom(SourceSQL : TDataset); overload;
    property BatchSize : Integer read FBatchSize;
    property TotalReadCount : Integer read FTotalReadCount;
    property RowsAffected : Integer read FRowsAffectedCount;
    property LastError : String read FLastError;
  published
    constructor Create(AOwner: TComponent); override;
    [default(Ord(ibBatch))]
    property BatchType : TIBBatchType read FBatchType write FBatchType;
    property OnBatch : TIBBatchEvent read FBatchEvent write FBatchEvent;
  end;

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBBatchOutput = class(TIBBatch)
  public
    function WriteColumns: Boolean; virtual; abstract;
    procedure BatchOutput;
  end;

  { TIBOutputDelimitedFile }
  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBOutputDelimitedFile = class(TIBBatchOutput)
  private
    FEncoding: TEncoding;
    function GetEncoding: TEncoding;
  protected
    FOutputTitles: Boolean;
    FColDelimiter,
    FRowDelimiter: string;
  public
    procedure ReadyFile; override;
    function WriteColumns: Boolean; override;
    property Encoding : TEncoding read GetEncoding write FEncoding;
  published
    property ColDelimiter: string read FColDelimiter write FColDelimiter;
    property OutputTitles: Boolean read FOutputTitles
                                   write FOutputTitles;
    property RowDelimiter: string read FRowDelimiter write FRowDelimiter;
  end;

  { TIBInputDelimitedFile
      Note, the file should be generated or follow the generation rules of
        TIBOutpurDelimitedFile output.  Pre Unicode files (Pre D2009) can not be
        used as input due to no BOM information to determine String
        payloads. File should be in Unicode}

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBInputDelimitedFile = class(TIBBatchInput)
  private
    FEncoding: TEncoding;
    FBufferedData: TStringBuilder;
    FNoDataInStream: Boolean;
    FCurrentData : String;
    function GetEncoding: TEncoding;
  protected
    FColDelimiter,
    FRowDelimiter: string;
    FEOF: Boolean;
    FLookAhead: Byte;
    FReadBlanksAsNull: Boolean;
    FSkipTitles: Boolean;
    function ReadLine : String;
    procedure FillBuffer(AnEncoding : TEncoding);
  public
    constructor Create(AOwner : TComponent); overload; override;
    destructor Destroy; override;
    function GetColumn(var Col: String): Integer;
    function ReadParameters: Boolean; override;
    procedure ReadyFile; override;
    property Encoding : TEncoding read GetEncoding write FEncoding;
  published
    property ColDelimiter: string read FColDelimiter write FColDelimiter;
    property ReadBlanksAsNull: Boolean read FReadBlanksAsNull
                                       write FReadBlanksAsNull;
    property RowDelimiter: string read FRowDelimiter write FRowDelimiter;
    property SkipTitles: Boolean read FSkipTitles write FSkipTitles;
  end;

  { TIBOutputRawFile }
  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBOutputRawFile = class(TIBBatchOutput)
  public
    function WriteColumns: Boolean; override;
    procedure ReadyFile; override;
  end;

  { TIBInputRawFile }
  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBInputRawFile = class(TIBBatchInput)
  public
    function ReadParameters: Boolean; override;
    procedure ReadyFile; override;
  end;

  TIBXMLFlag = (xmlAttribute, xmlDisplayNull, xmlNoHeader);
  TIBXMLFlags = set of TIBXMLFlag;

  [ComponentPlatformsAttribute(pidAllPlatforms)]
  TIBOutputXML = class(TComponent)
  private
    FTableTag: String;
    FHeaderTag: String;
    FDatabaseTag: String;
    FFlags: TIBXMLFlags;
    FRowTag: String;
    FStream: TStream;
  public
    procedure WriteXML(SQL : TIBSQL);
    procedure OutputXML(OutputObject : TIBSQL);
    property Stream : TStream read FStream write FStream;
  published
    property HeaderTag : String read FHeaderTag write FHeaderTag;
    property DatabaseTag : String read FDatabaseTag write FDatabaseTag;
    property TableTag : String read FTableTag write FTableTag;
    property RowTag : String read FRowTag write FRowTag;
    property Flags : TIBXMLFlags read FFlags write FFlags;
  end;

  procedure OutputXML(sqlObject : TIBSQL; OutputObject: TIBOutputXML);

implementation

uses
  IBX.IBUtils, IBX.IBXConst, System.Types, IBX.IBXMLHeader, IBX.IB, System.Math;

{ TIBBatch }

constructor TIBBatch.Create;
begin
  Create(nil);
end;

constructor TIBBatch.Create(AOwner: TComponent);
begin
  inherited;
  FBase := TIBBase.Create(self);
  FSQL := TStringList.Create;
end;

destructor TIBBatch.Destroy;
begin
  FBase.Free;
  FFile.Free;
  FSQL.Free;
  inherited;
end;

procedure TIBBatch.FinalizeFile;
begin
  FreeAndNil(FFile);
end;

function TIBBatch.GetDatabase: TIBDatabase;
begin
  result := FBase.Database;
end;

function TIBBatch.GetSQL: TStrings;
begin
  Result := FSQL;
end;

function TIBBatch.GetTransaction: TIBTransaction;
begin
  Result := FBase.Transaction;
end;

procedure TIBBatch.ReadyFile;
begin
  if FFile <> nil then
    FFile.Free;
end;

procedure TIBBatch.SetDatabase(const Value: TIBDatabase);
begin
  if (FBase.Database <> Value) then
    FBase.Database := Value;
end;

procedure TIBBatch.SetSQL(const Value: TStrings);
begin
  FSQL.Assign(Value);
end;

procedure TIBBatch.SetTransaction(const Value: TIBTransaction);
begin
  if (FBase.Transaction <> Value) then
    FBase.Transaction := Value;
end;

{ TIBOutputDelimitedFile }

function TIBOutputDelimitedFile.GetEncoding: TEncoding;
begin
  if Assigned(FEncoding) then
    Result := FEncoding
  else
    Result := TEncoding.Unicode;
end;

procedure TIBOutputDelimitedFile.ReadyFile;
var
  i: Integer;
  st: String;
  bt : TBytes;

begin
  inherited;
  FFile := TFileStream.Create(FFilename, fmCreate or fmShareDenyWrite);
  if FColDelimiter = '' then
    FColDelimiter := TAB;
  if FRowDelimiter = '' then
    FRowDelimiter := CRLF;
  if FOutputTitles then
  begin
    for i := 0 to Columns.Count - 1 do
      if i = 0 then
        st := String(Columns[i].Data.aliasname)
      else
        st := st + FColDelimiter + String(Columns[i].Data.aliasname);
    st := st + FRowDelimiter;
    bt := Encoding.GetBytes(st);
    FFile.Write(bt[0], Length(bt));
  end;
end;

function TIBOutputDelimitedFile.WriteColumns: Boolean;
var
  i: Integer;
  BytesWritten: DWORD;
  st: TStringBuilder;
  bt : TBytes;
begin
  st := TStringBuilder.Create;
  try
    result := False;
    if Assigned(FFile) then
    begin
      for i := 0 to Columns.Count - 1 do
      begin
        if i > 0 then
          st.Append(FColDelimiter);
        st.Append(Columns[i].AsString);
      end;
      st.Append(FRowDelimiter);
      bt := Encoding.GetBytes(st.ToString);
      BytesWritten := FFile.Write(bt[0], Length(bt));
      if BytesWritten = DWORD(Length(bt)) then
        result := True;
    end;
  finally
    st.Free;
  end;
end;

 { TIBInputDelimitedFile }

constructor TIBInputDelimitedFile.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBufferedData := TStringBuilder.Create;
end;

destructor TIBInputDelimitedFile.Destroy;
begin
  FBufferedData.Free;
  inherited;
end;

procedure TIBInputDelimitedFile.FillBuffer(AnEncoding : TEncoding);
const
  BufferPadding = 4;
var
  LString: string;
  LBuffer: TBytes;
  BytesRead: Integer;
  StartIndex: Integer;
  ByteCount: Integer;
  ByteBufLen: Integer;
  ExtraByteCount: Integer;

  procedure AdjustEndOfBuffer(const LBuffer: TBytes; Offset: Integer);
  var
    Pos, Size: Integer;
    Rewind: Integer;
  begin
    Dec(Offset);
    for Pos := Offset downto 0 do
    begin
      for Size := Offset - Pos + 1 downto 1 do
      begin
        if AnEncoding.GetCharCount(LBuffer, Pos, Size) > 0 then
        begin
          Rewind := Offset - (Pos + Size - 1);
          FFile.Position := FFile.Position - Rewind;
          BytesRead := BytesRead - Rewind;
          Exit;
        end;
      end;
    end;
  end;

begin
  SetLength(LBuffer, 4000 + BufferPadding);

  // Read data from stream
  BytesRead := FFile.Read(LBuffer[0], 4000);
  FNoDataInStream := BytesRead < 4000;

  // Adjust the end of the buffer to be sure we have a valid encoding
  if not FNoDataInStream then
    AdjustEndOfBuffer(LBuffer, BytesRead);

  StartIndex := 0;

  // Convert to string and calc byte count for the string
  ByteBufLen := BytesRead - StartIndex;
  LString := AnEncoding.GetString(LBuffer, StartIndex, ByteBufLen);
  ByteCount := AnEncoding.GetByteCount(LString);

  // If byte count <> number of bytes read from the stream
  // the buffer boundary is mid-character and additional bytes
  // need to be read from the stream to complete the character
  ExtraByteCount := 0;
  while (ByteCount <> ByteBufLen) and (ExtraByteCount < AnEncoding.GetMaxByteCount(1)) do
  begin
    // Expand buffer if padding is used
    if (StartIndex + ByteBufLen) = Length(LBuffer) then
      SetLength(LBuffer, Length(LBuffer) + BufferPadding);

    // Read one more byte from the stream into the
    // buffer padding and convert to string again
    BytesRead := FFile.Read(LBuffer[StartIndex + ByteBufLen], 1);
    if BytesRead = 0 then
      // End of stream, append what's been read and discard remaining bytes
      Break;

    Inc(ExtraByteCount);

    Inc(ByteBufLen);
    LString := AnEncoding.GetString(LBuffer, StartIndex, ByteBufLen);
    ByteCount := AnEncoding.GetByteCount(LString);
  end;

  // Add string to character data buffer
  FBufferedData.Append(LString);
end;

function TIBInputDelimitedFile.GetColumn(var Col: String): Integer;
var
  idx : Integer;

begin
  Result := 1;
  if FCurrentData = '' then
    Exit(2);
  // find the index of the col delimiter
  idx := FCurrentData.IndexOf(FColDelimiter);

  // Negative Index means we are on the last column for this line
  if idx < 0 then
  begin
    Col := FCurrentData.Substring(0, Length(FCurrentData));
    FCurrentData := '';
    Result := 2;
  end
  else
  begin
    Col := FCurrentData.Substring(0, idx);
    FCurrentData := FCurrentData.Substring(idx + FColDelimiter.Length);
  end;
end;

function TIBInputDelimitedFile.GetEncoding: TEncoding;
begin
  if Assigned(FEncoding) then
    Result := FEncoding
  else
    Result := TEncoding.Unicode;
end;

//  Variation of the TStreamReader function.  We need ot handle custom
//     EOL

function TIBInputDelimitedFile.ReadLine: String;
var
  NewLineIndex, RowDelCount, idx : Integer;
  PostNewLineIndex: Integer;
  NewLine : Boolean;
begin
  Result := '';
  if FBufferedData = nil then
    Exit;
  NewLineIndex := 0;
  PostNewLineIndex := 0;

  while True do
  begin
    if (NewLineIndex + 2 > FBufferedData.Length) and (not FNoDataInStream) then
      FillBuffer(Encoding);

    if NewLineIndex >= FBufferedData.Length then
    begin
      if FNoDataInStream then
      begin
        PostNewLineIndex := NewLineIndex;
        Break;
      end
      else
      begin
        FillBuffer(Encoding);
        if FBufferedData.Length = 0 then
          Break;
      end;
    end;
    // custom EOL detection
    RowDelCount := FRowDelimiter.Length;
    NewLine := NewLineIndex + RowDelCount <= FBufferedData.Length;

    idx := 0;
    while NewLine and (idx < RowDelCount) do
    begin
      NewLine := FRowDelimiter.Chars[idx] = FBufferedData[NewLineIndex + idx];
      Inc(idx);
    end;

    if NewLine then
    begin
      PostNewLineIndex := NewLineIndex + RowDelCount;
      Break;
    end;

    Inc(NewLineIndex);
  end;

  Result := FBufferedData.ToString;
  SetLength(Result, NewLineIndex);
  FBufferedData.Remove(0, PostNewLineIndex);
  if Result.IsEmpty then
    FEOF := true;
end;

function TIBInputDelimitedFile.ReadParameters: Boolean;
var
  i, curcol: Integer;
  Col: String;
begin
  result := False;
  if FCurrentData = '' then
    FCurrentData := ReadLine;
  if not FEOF then
  begin
    curcol := 0;
    repeat
      i := GetColumn(Col);
      if (i = 0) then
        FEOF := True;
      if (curcol < Params.Count) then
      begin
        try
          if (Length(Col) = 0) and
             (ReadBlanksAsNull) then
            Params[curcol].IsNull := True
          else
            Params[curcol].AsString := col;
          Inc(curcol);
        except
          on E: Exception do
          begin
            if not (FEOF and (curcol = Params.Count)) then
              raise;
          end;
        end;
      end;
    until (FEOF) or (i = 2);
    result := ((FEOF) and (curcol = Params.Count)) or
              (not FEOF);
  end;
end;

procedure TIBInputDelimitedFile.ReadyFile;
var
  col : String;
  curcol : Integer;
begin
  inherited;
  FFile := TFileStream.Create(FFilename, fmOpenRead or fmShareDenyWrite);
  if FColDelimiter = '' then
    FColDelimiter := TAB;
  if FRowDelimiter = '' then
    FRowDelimiter := CRLF;
  FLookAhead := Byte(NULL_TERMINATOR);
  FEOF := False;
  if FSkipTitles then
  begin
    curcol := 0;
    while curcol < Params.Count do
    begin
      GetColumn(Col);
      Inc(CurCol)
    end;
  end;
end;

{ TIBOutputRawFile }

procedure TIBOutputRawFile.ReadyFile;
begin
  inherited;
  FFile := TFileStream.Create(FFilename, fmCreate or fmShareDenyWrite);
end;

function TIBOutputRawFile.WriteColumns: Boolean;
var
  i: Integer;
  BytesWritten, BytesToWrite : LongInt;
  SQLVar : TSQLVAR;
  bs : TMemoryStream;
  sqlind : Short;
begin
  result := False;
  sqlind := 0;
  if Assigned(FFile) then
  begin
    for i := 0 to Columns.Count - 1 do
    begin
      SQLVar := Columns[i].Data;
      case SQLVar.SqlDef of
        SQL_VARYING:
        begin
          BytesToWrite := SQLVar.sqllen + 2;
          BytesWritten := FFile.Write(SQLVar.sqldata^, BytesToWrite);
          if (BytesWritten <> BytesToWrite) then
            exit;
        end;
        //  Three scenarios here
        //    1) len > 0 data - <data len><data><sqlind>
        //    2) Empty String/data - <data len><sqlind> <0><0>
        //    3) NULL - <data len><sqlind> <0><-1>
        SQL_BLOB:
        begin
          bs := TMemoryStream.Create;
          try
            Columns[i].SaveToStream(bs);
            BytesToWrite := bs.Size;
            FFile.Write(BytesToWrite, sizeof(BytesToWrite));
            // Only set to -1 (NULL) if no bytes to write and there
            //    is a SQLIND with a value < 0 or SqlInd is nil
            //    values >= 0 will mean an empty string text blob
            //    so do not set it to -1 then
            if (BytesToWrite = 0) and
               ((Assigned(SQLVar.SqlInd) and (SQLVar.SqlInd^ < 0)) or
                (not Assigned(SQLVar.SqlInd))) then
              SQLVar.SqlInd^ := -1
            else
              if BytesToWrite > 0 then
              begin
                BytesWritten := FFile.CopyFrom(bs, 0);
                if BytesWritten <> BytesToWrite then
                begin
                  FreeAndNil(bs);
                  exit;
                end;
              end;
          finally
            bs.Free;
          end;
        end;
        else
        begin
          BytesWritten := FFile.Write(SQLVar.sqldata^, SQLVar.sqllen);
          if BytesWritten <> SQLVar.sqllen then
            exit;
        end;
      end;
      // Have to write out the nil indicator according to QC 49570
      //   Sometimes the SQLInd is nil.  No reproducible case but if it is
      //   assume not null and write 0
      if Assigned(SQLVar.SqlInd) then
      begin
        // Reset values < 0 to -1 to correct for Subscriptions NULL definitions
        if SQLVar.sqlind^ < 0 then
          SQLVar.sqlind^ := -1;
        FFile.Write(SQLVar.sqlind^, sizeof(SQLVar.SqlInd^));
      end
      else
        FFile.Write(sqlind, sizeof(sqlind));
    end;
    result := True;
  end;
end;

{ TIBInputRawFile }

function TIBInputRawFile.ReadParameters: Boolean;
var
  i: Integer;
  BytesRead, BytesToRead : LongInt;
  SQLVar : TSQLVAR;
  bs: TMemoryStream;
  sqlInd : Short;
begin
  result := False;
  if Assigned(FFile) then
  begin
    for i := 0 to Params.Count - 1 do
    begin
      SQLVar := Params[i].Data;

      case SQLVar.SqlDef of
        SQL_VARYING:
        begin
          BytesToRead := SQLVar.sqllen + 2;
          BytesRead := FFile.Read(SQLVar.sqldata^, BytesToRead);
          if BytesRead <> BytesToRead then
            Exit;
        end;
        SQL_BLOB:
        begin
          bs := TMemoryStream.Create;
          try
            FFile.Read(BytesToRead, sizeof(BytesToRead));
            if BytesToRead > 0 then
            begin
              BytesRead := bs.CopyFrom(FFile, BytesToRead);
              if BytesRead <> BytesToRead then
              begin
                FreeAndNil(bs);
                Exit;
              end;
              bs.Position := 0;
              Params[i].LoadFromStream(bs);
            end
            else
              Params[i].AsString := '';
          finally
            bs.Free;
          end;
        end;
        else
        begin
          BytesRead := FFile.Read(SQLVar.sqldata^, SQLVar.sqllen);
          if BytesRead <> SQLVar.sqllen then
            exit;
        end;
      end;
      // Have to read in the nil indicator
      FFile.Read(sqlind, sizeof(SqlInd));
      if (SqlInd < 0) then
        Params[i].Clear;
    end;
    result := True;
  end;
end;

procedure TIBInputRawFile.ReadyFile;
begin
  inherited;
  FFile := TFileStream.Create(FFilename, fmOpenRead or fmShareDenyWrite);
end;

{ TIBOutputXML }

procedure TIBOutputXML.OutputXML(OutputObject: TIBSQL);
var
  OldGotoValue : Boolean;
begin
  OutputObject.CheckClosed;
  if not OutputObject.Prepared then
    OutputObject.Prepare;
  if OutputObject.SQLType = SQLSelect then
  begin
    OldGotoValue := OutputObject.GoToFirstRecordOnExecute;
    OutputObject.GoToFirstRecordOnExecute := false;
    OutputObject.ExecQuery;
    try
      WriteXML(OutputObject);
    finally
      OutputObject.Close;
      OutputObject.GoToFirstRecordOnExecute := OldGotoValue;
    end;
  end;
end;

procedure TIBOutputXML.WriteXML(SQL : TIBSQL);
var
  xmlda : Tib_xmlda;
  buffer : PByte;
  buffer_size, size : Integer;
  done : Boolean;
begin
  xmlda.xmlda_status := 0;
  xmlda.xmlda_version := 1;
  if FHeaderTag <> '' then
    xmlda.xmlda_header_tag := PByte(TEncoding.ANSI.GetBytes(FHeaderTag))
  else
    xmlda.xmlda_header_tag := PByte(TEncoding.ANSI.GetBytes(
            '<?xml version = "1.0"?>' + #10#13 + '<!-- XML from IB -->' + #10#13)); {do not localize}
  xmlda.xmlda_database_tag := PByte(TEncoding.ANSI.GetBytes(FDatabaseTag));
  xmlda.xmlda_table_tag := PByte(TEncoding.ANSI.GetBytes(FTableTag));
  xmlda.xmlda_row_tag := PByte(TEncoding.ANSI.GetBytes(FRowTag));
  xmlda.xmlda_flags := 0;

  if xmlAttribute in FFlags then
    xmlda.xmlda_flags := (xmlda.xmlda_flags or XMLDA_ATTRIBUTE_FLAG);
  if xmlDisplayNull in FFlags then
    xmlda.xmlda_flags := (xmlda.xmlda_flags or XMLDA_DISPLAY_NULL_FLAG);
  if xmlNoHeader in FFlags then
    xmlda.xmlda_flags := (xmlda.xmlda_flags or XMLDA_NO_HEADER_FLAG);


  buffer_size := 1024;
  GetMem(buffer, buffer_size);
  xmlda.xmlda_file_name := PByte(TEncoding.ANSI.GetBytes(''));

  try
    done := false;
    while not done do
    begin
      size := SQL.Call(isc_dsql_xml_buffer_fetch(StatusVector,
        @SQL.Handle, buffer, buffer_size, 1, SQL.Current.AsXSQLDA, @xmlda), false);
      case size of
        ERR_BUFFERSIZE_NOT_ENOUGH :
        begin
          Inc(buffer_size, 1024);
          if Assigned(Buffer) then
            ReallocMem(buffer, buffer_size)
          else
            GetMem(buffer, buffer_size);
        end;
        ERR_NOT_ENOUGH_MEMORY :
          raise EIBClientError.Create(0, SIBMemoryError);
        else
        begin
          FStream.WriteBuffer(Buffer^, Size);
          Done := xmlda.xmlda_more_data = 0;
        end;
      end;
    end;
  finally
    FreeMem(buffer, buffer_size);
  end;
end;

procedure OutputXML(sqlObject : TIBSQL; OutputObject: TIBOutputXML);
var
  OldGotoValue : Boolean;
begin
  sqlObject.CheckClosed;
  if not sqlObject.Prepared then
    sqlObject.Prepare;
  if sqlObject.SQLType = SQLSelect then
  begin
    OldGotoValue := sqlObject.GoToFirstRecordOnExecute;
    sqlObject.GoToFirstRecordOnExecute := false;
    sqlObject.ExecQuery;
    try
      OutputObject.WriteXML(sqlObject);
    finally
      sqlObject.Close;
      sqlObject.GoToFirstRecordOnExecute := OldGotoValue;
    end;
  end;
end;

{ TIBBatchInput.TIBInputStorage }

function TIBBatchInput.TIBInputStorage.psqlind: PShort;
begin
  if sqlindnil then
    Result := nil
  else
    Result := @sqlind;
end;

procedure TIBBatchInput.TIBInputStorage.SetData(len: Integer; asqldata: PByte;
  asqlind: PShort);
begin
  sqllen := len;
  SetLength(sqldata, len + 1);
  FillChar(sqldata[0], Length(sqldata), 0);
  move(asqldata[0], sqldata[0], len);
  if Assigned(asqlind) then
  begin
  sqlind := Short(asqlind^);
    sqlindnil := False;
  end
  else
    sqlindnil := true;
end;

{ TIBBatchInput }

procedure TIBBatchInput.AddToBatch;
var
  I, Base: Integer;
begin
  Base := BufferIndex * Params.Count;
  for I := 0 to Params.Count - 1 do
  begin
    FParamArray[Base + i].sqltype := TXSQLVar(Params[i].SqlVar.XSqlVar^).sqltype;
    FParamArray[Base + i].sqllen := TXSQLVar(Params[i].SqlVar.XSqlVar^).sqllen;
    // Need to make physical copies of the sqldata and sqlind into their arrays
    FSQLVarData[BufferIndex, i].SetData(TXSQLVar(Params[i].SqlVar.XSqlVar^).sqllen,
                                 Params[i].SqlVar.SqlData, Params[i].SqlVar.SqlInd);
    FParamArray[Base + i].sqldata := @FSQLVarData[BufferIndex, i].SQLData[0];
    FParamArray[Base + i].sqlind := FSQLVarData[BufferIndex, i].psqlind;
  end;
  Inc(FTotalReadCount);
  Inc(BufferIndex);
end;

procedure TIBBatchInput.BatchInput;
var
  ASQL : TIBSQL;
begin
  FInitialAttempt := True;
  FTotalReadCount := 0;
  FRowsAffectedCount := 0;
  ASQL := TIBSQL.Create(Database);
  try
    ASQL.Transaction := Transaction;
    ASQL.SQL := FSQL;

    Params := ASQL.Params;
    if BatchType = ibBatch then
      CalculateDataArrays;
    ReadyFile;
    if ASQL.SQLType in [SQLInsert, SQLUpdate, SQLDelete, SQLExecProcedure] then
    begin
      while ReadParameters do
        case FBatchType of
          ibBatch:
        begin
          AddToBatch;
            if BufferIndex = FBatchSize then
              ProcessBatch(ASQL.Handle);
        end;
          ibSingle:
          begin
            ASQL.ExecQuery;
            Inc(FTotalReadCount);
            Inc(FRowsAffectedCount, ASQL.RowsAffected);
            if Assigned(FBatchEvent) then
              FBatchEvent(Self, 1, ASQL.RowsAffected);
          end;
        end;
      if (FBatchType = ibBatch) and
         (BufferIndex > 0) then
        ProcessBatch(ASQL.Handle);
    end;
    FinalizeFile;
  finally
    Cleanup;
    ASQL.Free;
  end;
end;

procedure TIBBatchInput.BatchInputFrom(SourceSQL: TDataset);
var
  ASQL : TIBSQL;
  i : Integer;
  f : TField;

begin
  FInitialAttempt := True;
  FTotalReadCount := 0;
  BufferIndex := 0;
  FRowsAffectedCount := 0;
  FLastError := '';
  ASQL := TIBSQL.Create(Database);
  try
    ASQL.Transaction := Transaction;
    ASQL.SQL := FSQL;

    Params := ASQL.Params;
    for i := 0 to Params.Count - 1 do
      if not Assigned(SourceSQL.FindField(Params[i].Name)) then
         raise Exception.Create(SBatchParamFieldMisMatch);
    CalculateDataArrays;
    if ASQL.SQLType in [SQLInsert, SQLUpdate, SQLDelete, SQLExecProcedure] then
    begin
      while not SourceSQL.Eof do
      begin
        for i := 0 to Params.Count - 1 do
        begin
          f := SourceSQL.FieldByName(Params[I].Name);
          if f.IsNull then
            Params[i].IsNull := true
          else
            case Params[i].SQLtype of
              SQL_VARYING, SQL_TEXT:
                Params[i].AsString := f.AsString;
              SQL_BOOLEAN:
                Params[i].AsBoolean := f.AsBoolean;
              SQL_DOUBLE:
                Params[i].AsDouble := f.AsFloat;
              SQL_FLOAT, SQL_D_FLOAT:
                Params[i].AsFloat := f.AsFloat;
              SQL_TYPE_DATE, SQL_TYPE_TIME, SQL_TIMESTAMP:
                Params[i].AsDate := f.AsDateTime;
              SQL_BLOB:
                Params[i].AsBytes := f.AsBytes;
              SQL_ARRAY:
                Params[i].AsBytes := f.AsBytes;
              SQL_LONG:
                Params[i].AsBcd := f.AsBcd;
              SQL_SHORT:
                Params[i].AsBcd := f.AsBcd;
              SQL_INT64:
                Params[i].AsBcd := f.AsLargeInt;
              else
                Params[i].Value := f.Value;
            end;
        end;
        case FBatchType of
          ibBatch:
          begin
            AddToBatch;
            if BufferIndex = BatchSize then
              ProcessBatch(ASQL.Handle);
          end;
          ibSingle:
          begin
            ASQL.ExecQuery;
            Inc(FTotalReadCount);
            Inc(FRowsAffectedCount, ASQL.RowsAffected);
            if Assigned(FBatchEvent) then
              FBatchEvent(Self, 1, ASQL.RowsAffected);
          end;
        end;
        SourceSQL.Next;
      end;
      if (BatchType = ibBatch) and
         (BufferIndex > 0) then
        ProcessBatch(ASQL.Handle);
    end;
  finally
    Cleanup;
    ASQL.Free;
  end;
end;

procedure TIBBatchInput.BatchInputFrom(SourceSQL: TIBSQL);
var
  ASQL : TIBSQL;
  i : Integer;
  f : TIBXSQLVAR;

begin
  FInitialAttempt := True;
  FTotalReadCount := 0;
  BufferIndex := 0;
  FRowsAffectedCount := 0;
  FLastError := '';
  ASQL := TIBSQL.Create(Database);
  try
    ASQL.Transaction := Transaction;
    ASQL.SQL := FSQL;

    Params := ASQL.Params;
    for i := 0 to Params.Count - 1 do
      if not Assigned(SourceSQL.FindField(Params[i].Name)) then
         raise Exception.Create(SBatchParamFieldMisMatch);
    CalculateDataArrays;
    if ASQL.SQLType in [SQLInsert, SQLUpdate, SQLDelete, SQLExecProcedure] then
    begin
      while not SourceSQL.Eof do
      begin
        for i := 0 to Params.Count - 1 do
        begin
          f := SourceSQL.FieldByName(Params[I].Name);
          if f.IsNull then
            Params[i].IsNull := true
          else
            case Params[i].SQLtype of
              SQL_VARYING, SQL_TEXT:
                Params[i].AsString := f.AsString;
              SQL_BOOLEAN:
                Params[i].AsBoolean := f.AsBoolean;
              SQL_DOUBLE:
                Params[i].AsDouble := f.AsDouble;
              SQL_FLOAT, SQL_D_FLOAT:
                Params[i].AsFloat := f.AsFloat;
              SQL_TYPE_DATE:
                Params[i].AsDate := f.AsDate;
              SQL_TYPE_TIME:
                Params[i].AsTime := f.AsTime;
              SQL_TIMESTAMP:
                Params[i].AsDateTime := f.AsDateTime;
              SQL_BLOB:
                Params[i].AsBytes := f.AsBytes;
              SQL_ARRAY:
                Params[i].AsBytes := f.AsBytes;
              SQL_SHORT, SQL_LONG:
                if f.SqlVar.sqlscale = 0 then
                  Params[i].AsInt64 := f.AsLong
                else
                Params[i].Value := f.Value;
              SQL_INT64:
                if f.SqlVar.sqlscale = 0 then
                  Params[i].AsInt64 := f.AsInt64
                else
                  Params[i].Value := f.Value;
              SQL_QUAD:
                Params[i].AsQuad := f.AsQuad;
            else
              Params[i].Value := f.Value;
        end;
        end;
        case FBatchType of
          ibBatch:
          begin
            AddToBatch;
            if BufferIndex = BatchSize then
              ProcessBatch(ASQL.Handle);
          end;
          ibSingle:
          begin
            ASQL.ExecQuery;
            Inc(FTotalReadCount);
            Inc(FRowsAffectedCount, ASQL.RowsAffected);
            if Assigned(FBatchEvent) then
              FBatchEvent(Self, 1, ASQL.RowsAffected);
          end;
        end;
        SourceSQL.Next;
      end;
      if (BatchType = ibBatch) and
         (BufferIndex > 0) then
        ProcessBatch(ASQL.Handle);
    end;
  finally
    Cleanup;
    ASQL.Free;
  end;
end;

procedure TIBBatchInput.CalculateDataArrays;
begin
  Cleanup;
  PrepareSQL;
  SetLength(FParamArray, BatchSize * Params.Count);
  SetLength(FSQLVarData, BatchSize, Params.Count);
  SetLength(FRowsAffected, BatchSize);
end;

procedure TIBBatchInput.Cleanup;
begin
  FParamArray := nil;
  SetLength(FSQLVarData, 0, 0);
  FRowsAffected := nil;
  if Assigned(sqlda) then
  begin
    FreeMem(sqlda);
    sqlda := nil;
  end;
  if Assigned(FHandle) then
    Database.GDSLibrary.isc_dsql_free_statement(StatusVector, @FHandle, DSQL_drop);
end;

constructor TIBBatchInput.Create(AOwner: TComponent);
begin
  inherited;
  FBatchType := ibBatch;
  sqlda := nil;
  FHandle := nil;
end;

procedure TIBBatchInput.PrepareSQL;
var
  bt : TBytes;
  s1 : String;
  p : PXSQLVAR;
  i : Integer;

  function GetMaximumBatchSize: LongWord;
  var
    BlrLen, MsgLen, brow, mrow : Integer;

  begin
    BlrLen := xsqlvar_blr_length;
    MsgLen := xsqlvar_msg_length;

    brow := Min(65535 div BlrLen, 16381);
    mrow := ((65535 - MsgLen) div (MsgLen + 2)) + 1;
    Result := min(brow, mrow);
  end;

begin
  FHandle := nil;
  sqlda := nil;
  Transaction.Call(Database.GDSLibrary.isc_dsql_alloc_statement2(StatusVector, @Database.Handle,
                                  @FHandle), True);
  s1 := PreprocessSQL(FSQL.Text);
  bt := Database.Encoding.GetBytes(s1);
  try
    Transaction.Call(Database.GDSLibrary.isc_dsql_prepare(StatusVector, @Transaction.Handle, @FHandle, 0,
               PByte(bt), Database.SQLDialect, nil), true);
  except
    SetLength(bt, 0);
    raise;
  end;

  IBAlloc(sqlda, 0, XSQLDA_LENGTH(1, Database.GDSLibrary.GetIBClientVersion));

  sqlda^.version := SQLDA_CURRENT_VERSION;
  sqlda^.sqln := 1;

  Transaction.Call(Database.GDSLibrary.isc_dsql_describe_bind(StatusVector, @FHandle, 3, sqlda), true);
  if sqlda^.sqld > sqlda^.sqln then
  begin
    IBAlloc(sqlda, XSQLDA_LENGTH(1, Database.GDSLibrary.GetIBClientVersion),
                   XSQLDA_LENGTH(sqlda^.sqld, Database.GDSLibrary.GetIBClientVersion));
    sqlda^.sqln := sqlda^.sqld;
    Transaction.Call(Database.GDSLibrary.isc_dsql_describe_bind(StatusVector, @FHandle, 1, sqlda), true);
  end;
  SetLength(FParamTemplate, sqlda^.sqld);
  p := @sqlda^.sqlvar[0];
  for i := 0 to sqlda^.sqld - 1 do
  begin
    FParamTemplate[i] := p^;
    p := Pointer(PByte(p) + sizeof(TXSQLVAR));
  end;
  // Adjust the BatchSize down if too large
  FBatchSize := GetMaximumBatchSize;

  // This record is too large to be batched.
  if BatchSize <= 0 then
  begin
    BatchType := ibSingle;
    FBatchSize := 0;
  end
end;

procedure TIBBatchInput.ProcessBatch(Handle : TISC_STMT_HANDLE);
var
  Count, RowCount, i : Integer;
  isc_res: ISC_STATUS;

  procedure RetryInitial(InitialDecrement : Boolean);
  var
    Success, FirstPass : Boolean;
    NewSize, i, j, Base, Offset : Integer;
  begin
    Success := False;
    FirstPass := True;
    Base := 0;
    NewSize := BatchSize;
    repeat
      if FirstPass then
      begin
        if InitialDecrement then
      Dec(NewSize);
      end
      else
        Dec(NewSize);

      FirstPass := False;
      if NewSize < 2 then
        raise Exception.Create('Record size too large to use the batch API, please run in signle mode');

      try
        isc_res := Transaction.Call(Database.GDSLibrary.isc_dsql_batch_execute(StatusVector,
            @Transaction.Handle, @FHandle, Database.SQLDialect, sqlda, NewSize,
            PXSQLVar(@FParamArray[0]), PULong(@FRowsAffected[0])), false);
        if isc_res = 335544569 then
          Continue
        else
          if isc_res > 0 then
            IBDatabaseError(Database.GDSLibrary);
        BufferIndex := 0;
      except
        on e : EIBError do
          if (e.SQLCode = -804) and
             (e.IBErrorCode = 335544569) then
            Continue
          else
            FLastError := E.Message;
      end;
      Success := True;
      RowCount := 0;
      for i := 0 to NewSize - 1 do
        if Long(FRowsAffected[i]) > 0 then
          Inc(RowCount, FRowsAffected[i]);
        // -1 should indicate an error on that row
      Inc(FRowsAffectedCount, RowCount);
      if Assigned(FBatchEvent) then
        FBatchEvent(Self, NewSize, RowCount);

      // Now copy the partial that is there at the end to the front of the array
      Base := 0;
      Offset := 0;
      for i := NewSize to BatchSize - 1 do
      begin
        for J := 0 to Length(FParamTemplate) - 1 do
        begin
          FParamArray[j + Offset].sqltype := FParamArray[j + (i * Length(FParamTemplate))].sqltype;
          FParamArray[j + Offset].sqllen := FParamArray[j + (i * Length(FParamTemplate))].sqllen;

          FSQLVarData[Base, j].SetData(FSQLVarData[i, j].sqllen,
                                       @(FSQLVarData[i,j].SQLData[0]), FSQLVarData[i, j].psqlind);
          FParamArray[j + Offset].sqldata := @FSQLVarData[Base,j].SQLData[0];
          FParamArray[j + Offset].sqlind := FSQLVarData[Base,j].psqlind;
        end;
        Inc(Base);
        Inc(Offset, Length(FParamTemplate));
      end;
    until Success;
    // shrink the batch size to the correct batchsize
    BufferIndex := Base;
    FBatchSize := NewSize;
  end;

begin
  Count := BufferIndex;
  if Count = 0 then
    Count := BatchSize;

  try
    isc_res := Transaction.Call(Database.GDSLibrary.isc_dsql_batch_execute(StatusVector,
      @Transaction.Handle, @FHandle, Database.SQLDialect, sqlda, Count,
      PXSQLVar(@FParamArray[0]), PULong(@FRowsAffected[0])), false);
    if isc_res = 335544569 then
    begin
      RetryInitial(True);
      while BufferIndex >= FBatchSize do
        RetryInitial(false);
      exit;
    end
    else
      if isc_res > 0 then
        IBDatabaseError(Database.GDSLibrary);
    BufferIndex := 0;
  except
    // Treat SQLDA errors special.  The true algorythm
    //   for how big a record structure can be pass is not really known
    //   for the most part we get close, at times though it will be too
    //   large.  In that case work backwards til we've found the correct size
    //   then split the first run into two batches, a full at the new size and
    //   move the remaining cached data to the front.  After this the SQLDA errors
    //   should not happen on the rest of the batch, although occasionally does
    on e : EIBError do
      if (e.SQLCode = -804) and
         (e.IBErrorCode = 335544569) then
      begin
        RetryInitial(True);
        while BufferIndex >= FBatchSize do
          RetryInitial(false);
        exit;
      end
      else
        FLastError := E.Message;
  end;

  RowCount := 0;
  for i := 0 to Count - 1 do
    if Long(FRowsAffected[i]) > 0 then
      Inc(RowCount, FRowsAffected[i]);
    // -1 should indicate an error on that row
  Inc(FRowsAffectedCount, RowCount);
  if Assigned(FBatchEvent) then
    FBatchEvent(Self, Count, RowCount);
  FInitialAttempt := false;
  BufferIndex := 0;
end;

procedure TIBBatchInput.SetBatchSize(const Value: Integer);
begin
  FBatchSize := Value;
end;

function TIBBatchInput.xsqlvar_blr_length : Integer;
var
  BlrLen, i : Integer;
  dtype : USHORT;
begin
	BlrLen := 0; {* return value *}
	for i := 0 to  Length(FParamTemplate) - 1 do
	begin
		dtype := FParamTemplate[i].sqltype and (not 1);
    case dtype of
      SQL_VARYING, SQL_TEXT :
        Inc(BlrLen, 3);
      SQL_SHORT, SQL_LONG, SQL_INT64, SQL_BOOLEAN, SQL_QUAD, SQL_BLOB,
      SQL_ARRAY :
        Inc(BlrLen, 2);
      SQL_TIMESTAMP :
        Inc(BlrLen, 10);
      SQL_DOUBLE, SQL_TYPE_TIME, SQL_TYPE_DATE :
        Inc(BlrLen, 8);
      else
        Inc(BlrLen);
    end;
		Inc(BlrLen, 2);
  end;
	Exit(BlrLen);
end;

function TIBBatchInput.xsqlvar_msg_length: Integer;
const
  dtype_null	  =	0;
  dtype_text		=	1;
  dtype_cstring	=	2;
  dtype_varying	=	3;

  dtype_packed	=	6;
  dtype_byte		=	7;
  dtype_short		=	8;
  dtype_long		=	9;
  dtype_quad		=	10;
  dtype_real		=	11;
  dtype_double	=	12;
  dtype_d_float	=	13;
  dtype_sql_date	=	14;
  dtype_sql_time	=	15;
  dtype_timestamp	=	16;
  dtype_blob	= 17;
  dtype_array		=	18;
  dtype_int64     =	19;
  dtype_boolean   =	20;

  DTYPE_TYPE_MAX  =	20;
  DOUBLE_ALIGN    =	16;

  type_alignments : Array[0..DTYPE_TYPE_MAX] of UShort =
  (
    0,
    0, 						{ dtype_text }
    0,  					{ dtype_cstring }
    sizeof(short),			{ dtype_varying }
    0,  					{ unused }
    0,  					{ unused }
    sizeof(char),			{ dtype_packed }
    sizeof(char),			{ dtype_byte }
    4, //SizeOf(Short),			{ dtype_short }
    sizeof(long),			{ dtype_long }
    sizeof(TISC_QUAD),		{ dtype_quad }
    sizeof(float),			{ dtype_real }
    DOUBLE_ALIGN,			{ dtype_double }
    DOUBLE_ALIGN,			{ dtype_d_float }
    sizeof(ISC_DATE),		{ dtype_sql_date }
    sizeof(ISC_TIME),		{ dtype_sql_time }
    sizeof(TISC_TIMESTAMP),		{ dtype_timestamp }
    sizeof(ISC_STATUS),		{ dtype_blob }
    sizeof(ISC_STATUS),		{ dtype_array }
    sizeof(ISC_INT64),      { dtype_int64 }
    sizeof(ISC_BOOLEAN)     { dtype_boolean }
  );

var
  i, MsgLen, dtype, len, align : Integer;

  function GetDType(sqlType : Short)  : Integer;
  begin
    case SqlType of
      SQL_VARYING:
      begin
        Result := dtype_varying;
        Inc(len, sizeof(short));
      end;
      SQL_TEXT:
        Result := dtype_text;
      SQL_BOOLEAN:
        Result := dtype_boolean;
      SQL_DOUBLE:
        Result := dtype_double;
      SQL_FLOAT:
        Result := dtype_real;
      SQL_D_FLOAT:
        Result := dtype_d_float;
      SQL_TYPE_DATE:
      begin
        if Database.SQLDialect = 3 then
          Result := dtype_sql_date
        else
          Result := dtype_timestamp;
      end;
      SQL_TYPE_TIME:
        Result := dtype_sql_time;
      SQL_TIMESTAMP:
        Result := dtype_timestamp;
      SQL_BLOB:
        Result := dtype_blob;
      SQL_ARRAY:
        Result := dtype_array;
      SQL_LONG:
        Result := dtype_long;
      SQL_SHORT:
        Result := dtype_short;
      SQL_INT64:
        Result := dtype_int64;
      SQL_QUAD:
        Result := dtype_quad;
      else
        Result := dtype_null;
    end;
  end;

begin
	MsgLen := 0;
  for i := 0 to Length(FParamTemplate) - 1 do
  begin
		len := FParamTemplate[i].sqllen;
    dtype := GetDType(FParamTemplate[i].sqltype and (not 1));

		align := type_alignments[dtype];
		if (align <> 0) then
			MsgLen := ((MsgLen + align - 1) and (not (align - 1)));
		Inc(MsgLen, len);
		align := type_alignments[dtype_short];
		if (align <> 0) then
			MsgLen := ((MsgLen + align - 1) and (not (align - 1)));
		Inc(MsgLen, sizeof(short));
  end;
  Result := MsgLen;
end;

{ TIBBatchOutput }

procedure TIBBatchOutput.BatchOutput;
var
  ASQL : TIBSQL;
begin
  ASQL := TIBSQL.Create(Database);
  try
    ASQL.Transaction := Transaction;
    ASQL.SQL := FSQL;
    ASQL.Prepare;
    if ASQL.SQLType = SQLSelect then
    begin
      try
        ASQL.ExecQuery;
        Columns := ASQL.Current;
        ReadyFile;
        while (not ASQL.Eof) and (WriteColumns) do
          ASQL.Next;
        FinalizeFile;
      finally
        ASQL.Close;
      end;
    end;
  finally
    ASQL.Free;
  end;
end;

end.
