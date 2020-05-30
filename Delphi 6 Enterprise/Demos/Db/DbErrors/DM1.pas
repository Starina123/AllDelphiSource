(*
  This example represents a sampling of the way that you might
  approach trapping a number of database errors.


  A complete listing of the database errorcodes is found in the
  DBIErrs.Int file in the Delphi/Doc directory or in the IDAPI.h
  file in the Borland Database Engine.

  Database errors are defined by category and code. Here's a sample:

{ ERRCAT_INTEGRITY }

  ERRCODE_KEYVIOL               = 1;  { Key violation }
  ERRCODE_MINVALERR             = 2;  { Min val check failed }
  ERRCODE_MAXVALERR             = 3;  { Max val check failed }
  ERRCODE_REQDERR               = 4;  { Field value required }
  ERRCODE_FORIEGNKEYERR         = 5;  { Master record missing }
  ERRCODE_DETAILRECORDSEXIST    = 6;  { Cannot MODIFY or DELETE this Master record }
  ERRCODE_MASTERTBLLEVEL        = 7;  { Master Table Level is incorrect }
  ERRCODE_LOOKUPTABLEERR        = 8;  { Field value out of lookup tbl range }
  ERRCODE_LOOKUPTBLOPENERR      = 9;  { Lookup Table Open failed }
  ERRCODE_DETAILTBLOPENERR      = 10; { 0x0a Detail Table Open failed }
  ERRCODE_MASTERTBLOPENERR      = 11; { 0x0b Master Table Open failed }
  ERRCODE_FIELDISBLANK          = 12; { 0x0c Field is blank }


  The constant for the base category is added to these constants to represent
  a unique DBI errorcode;

  DBIERR_KEYVIOL  = (ERRBASE_INTEGRITY + ERRCODE_KEYVIOL);
  DBIERR_REQDERR = (ERRBASE_INTEGRITY + ERRCODE_REQDERR);
  DBIERR_DETAILRECORDSEXIST = (ERRBASE_INTEGRITY + ERRCODE_DETAILRECORDSEXIST);
  DBIERR_FORIEGNKEYERR = (ERRBASE_INTEGRITY + ERRCODE_FORIEGNKEYERR);

  The ERRBASE_INTEGRITY value is $2600 (Hex 2600) or 9728 decimal.
  Thus, for example, the errorcode for keyviol is 9729
                                   for master with details is 9734.

  *)

unit DM1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, DB;

type
  TDM = class(TDataModule)
    Customer: TTable;
    CustomerCustNo: TFloatField;
    CustomerCompany: TStringField;
    CustomerSource: TDataSource;
    Orders: TTable;
    OrdersSource: TDataSource;
    Items: TTable;
    ItemsOrderNo: TFloatField;
    ItemsItemNo: TFloatField;
    ItemsPartNo: TFloatField;
    ItemsQty: TIntegerField;
    ItemsDiscount: TFloatField;
    ItemsSource: TDataSource;
    OrdersOrderNo: TFloatField;
    OrdersCustNo: TFloatField;
    OrdersSaleDate: TDateTimeField;
    OrdersShipDate: TDateTimeField;
    OrdersEmpNo: TIntegerField;
    procedure CustomerPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure CustomerDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ItemsPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure OrdersPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure OrdersDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

const
  {Declare constants we're interested in}
  eKeyViol = 9729;
  eRequiredFieldMissing = 9732;
  eForeignKey = 9733;
  eDetailsExist = 9734;


implementation

{$R *.dfm}

procedure TDM.CustomerPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  if (E is EDBEngineError) then
    if (E as EDBEngineError).Errors[0].Errorcode = eKeyViol then
    begin
      MessageDlg('Unable to post: Duplicate Customer ID.', mtWarning, [mbOK], 0);
      Abort;
    end;
 end;

procedure TDM.CustomerDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  if (E is EDBEngineError) then
    if (E as EDBEngineError).Errors[0].Errorcode = eDetailsExist then
    {the customer record has dependent details in the Orders table.}
    begin
      MessageDlg('To delete this record, first delete related orders and items.',
        mtWarning, [mbOK], 0);
      Abort;
    end;
end;

procedure TDM.ItemsPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  {This error will occur when a part number is specified that
   is not in the parts table.}
  if (E as EDBEngineError).Errors[0].Errorcode = eForeignKey then
  begin
    MessageDlg('Part number is invalid', mtWarning,[mbOK],0);
    Abort;
  end;
end;

procedure TDM.OrdersPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
var
  iDBIError: Integer;
begin
  if (E is EDBEngineError) then
  begin
    iDBIError := (E as EDBEngineError).Errors[0].Errorcode;
    case iDBIError of
      eRequiredFieldMissing:
        {The EmpNo field is defined as being required.}
        begin
          MessageDlg('Please provide an Employee ID', mtWarning, [mbOK], 0);
          Abort;
        end;
      eKeyViol:
        {The primary key is OrderNo}
        begin
          MessageDlg('Unable to post. Duplicate Order Number', mtWarning,
            [mbOK], 0);
          Abort;
        end;
    end;
  end;
end;

procedure TDM.OrdersDeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  if E is EDBEngineError then
    if (E as EDBEngineError).Errors[0].Errorcode = eDetailsExist then
    begin
      if MessageDlg('Delete this order and related items?', mtConfirmation,
        [mbYes, mbNo], 0) = mrYes then
      begin
        {Delete related records in linked 'items' table}
        while Items.RecordCount > 0 do
          Items.delete;
        {Finally,delete this record}
        Action := daRetry;
      end else Abort;
    end;
end;

end.
