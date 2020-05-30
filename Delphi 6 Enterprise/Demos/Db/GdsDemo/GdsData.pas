unit GdsData;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, DB, DBTables, Mask,
  DBCtrls, GdsStd;

type
  TStdDataForm = class(TGDSStdForm)
    StdCtrlPanel: TPanel;
    FilterOnRadioGroup: TRadioGroup;
    Orders: TTable;
    Cust: TTable;
    OrdersSource: TDataSource;
    OrdersOrderNo: TFloatField;
    OrdersCustNo: TFloatField;
    OrdersSaleDate: TDateTimeField;
    OrdersShipDate: TDateTimeField;
    OrdersEmpNo: TIntegerField;
    OrdersShipToContact: TStringField;
    OrdersShipToAddr1: TStringField;
    OrdersShipToAddr2: TStringField;
    OrdersShipToCity: TStringField;
    OrdersShipToState: TStringField;
    OrdersShipToZip: TStringField;
    OrdersShipToCountry: TStringField;
    OrdersShipToPhone: TStringField;
    OrdersShipVIA: TStringField;
    OrdersPO: TStringField;
    OrdersTerms: TStringField;
    OrdersPaymentMethod: TStringField;
    OrdersItemsTotal: TCurrencyField;
    OrdersTaxRate: TFloatField;
    OrdersFreight: TCurrencyField;
    OrdersCustName: TStringField;
    OrdersAmountDue: TCurrencyField;
    OrdersAmountPaid: TCurrencyField;
    GroupBox1: TGroupBox;
    FilterOnLabel: TLabel;
    FilterCriteria: TEdit;
    FilterCheckBox: TCheckBox;
    NextBtn: TButton;
    PriorBtn: TButton;
    OrdersTaxAmount: TCurrencyField;
    procedure FilterOnRadioGroupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OrdersFilterOnDate(DataSet: TDataSet; var Accept: Boolean);
    procedure OrdersFilterOnAmount(DataSet: TDataSet; var Accept: Boolean);
    procedure OrdersCalcFields(DataSet: TDataSet);
    procedure FilterCheckBoxClick(Sender: TObject);
    procedure PriorBtnClick(Sender: TObject);
    procedure NextBtnClick(Sender: TObject);
    procedure FilterCriteriaExit(Sender: TObject);
    procedure FilterCriteriaKeyPress(Sender: TObject; var Key: Char);
  protected
    FLastAmount: Double;
    FLastDate: TDateTime;
    function CalcAmountDue: Double;
    procedure ConvertFilterCriteria;
  end;

var
  StdDataForm: TStdDataForm;

implementation

{$R *.dfm}

procedure TStdDataForm.FilterOnRadioGroupClick(Sender: TObject);
begin
  inherited;
  with FilterOnRadioGroup do
  begin
    FilterOnLabel.Caption := Format('Records where %S >=', [Items[ItemIndex]]);
    case ItemIndex of
      0: begin
           Orders.OnFilterRecord := OrdersFilterOnDate;
           FilterCriteria.Text := DateToStr(FLastDate);
         end;
      1: begin
           Orders.OnFilterRecord := OrdersFilterOnAmount;
           FilterCriteria.Text := FloatToStr(FLastAmount);
         end;
    end;
    ActiveControl := FilterCriteria;
  end;
  if Orders.Filtered then Orders.Refresh;
end;

procedure TStdDataForm.FormCreate(Sender: TObject);
begin
  inherited;
  FLastDate := EncodeDate(1995, 1, 1);
  FLastAmount := 1000;
  FilterOnRadioGroup.ItemIndex := 0;
end;

{ Calculate the value of AmountDue. Used in the OnCalcFields
  and OnFilterRecord event handlers. }

function TStdDataForm.CalcAmountDue: Double;
begin
  Result :=
    OrdersItemsTotal.Value * (1.0 + OrdersTaxRate.Value / 100) +
    OrdersFreight.Value - OrdersAmountPaid.Value;
end;

{ Convert the FilterCriteria text into a Date or Float.  This value
  will be used in the OnFilterRecord callback instead of using the
  FilterCriteria directly, so that the string does not need to be
  converted each time the event is triggered. }

procedure TStdDataForm.ConvertFilterCriteria;
begin
  if FilterCriteria.Text <> '' then
    case FilterOnRadioGroup.ItemIndex of
      0: FLastDate := StrToDate(FilterCriteria.Text);
      1: FLastAmount := StrToFloat(FilterCriteria.Text);
    end;
  if Orders.Filtered then Orders.Refresh;
end;

{ Try to convert the filter criteria whenever the edit control
  looses focus, or the user presses enter }

procedure TStdDataForm.FilterCriteriaExit(Sender: TObject);
begin
  inherited;
  ConvertFilterCriteria;
end;

procedure TStdDataForm.FilterCriteriaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    ConvertFilterCriteria;
    Key := #0
  end;
end;

{ Calculate this order's total on the fly. Include in the dataset
  if its amount is greater than or equal to the specified filter
  criteria. Note that calculated and lookup fields are undefined
  in an OnFilterRecord event handler. }
procedure TStdDataForm.OrdersFilterOnAmount(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept := CalcAmountDue >= FLastAmount;
end;

{ Include this order in the dataset if its date is greater
  than or equal to the specified filter criteria. }
procedure TStdDataForm.OrdersFilterOnDate(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept := OrdersSaleDate.Value >= FLastDate;
end;

procedure TStdDataForm.OrdersCalcFields(DataSet: TDataSet);
begin
  inherited;
  OrdersTaxAmount.Value := OrdersItemsTotal.Value * (OrdersTaxRate.Value / 100);
  OrdersAmountDue.Value := CalcAmountDue;
end;

{ Store contents of filter criteria from edit control }
procedure TStdDataForm.FilterCheckBoxClick(Sender: TObject);
begin
  inherited;
  ConvertFilterCriteria;
  Orders.Filtered := FilterCheckBox.Checked;
  NextBtn.Enabled := not FilterCheckBox.Checked;
  PriorBtn.Enabled := not FilterCheckBox.Checked;
end;

{ Button handlers for new filter-oriented dataset navigation methods }
procedure TStdDataForm.PriorBtnClick(Sender: TObject);
begin
  inherited;
  ConvertFilterCriteria;
  Orders.FindPrior;
end;

procedure TStdDataForm.NextBtnClick(Sender: TObject);
begin
  inherited;
  ConvertFilterCriteria;
  Orders.FindNext;
end;

end.
