unit DM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, DB;

type
  TDM1 = class(TDataModule)
    tblMaster: TTable;
    tblMasterSYMBOL: TStringField;
    tblMasterCO_NAME: TStringField;
    tblMasterEXCHANGE: TStringField;
    tblMasterIndustryLongName: TStringField;
    tblMasterCUR_PRICE: TFloatField;
    tblMasterYRL_HIGH: TFloatField;
    tblMasterYRL_LOW: TFloatField;
    tblMasterP_E_RATIO: TFloatField;
    tblMasterPROJ_GRTH: TFloatField;
    tblMasterINDUSTRY: TSmallintField;
    tblMasterPRICE_CHG: TSmallintField;
    tblMasterRATING: TStringField;
    tblMasterRANK: TFloatField;
    tblMasterOUTLOOK: TSmallintField;
    tblMasterRCMNDATION: TStringField;
    tblMasterRISK: TStringField;
    dsMaster: TDataSource;
    tblIndustry: TTable;
    tblIndustryIND_CODE: TSmallintField;
    tblIndustryIND_NAME: TStringField;
    tblIndustryLONG_NAME: TStringField;
    dsIndustry: TDataSource;
    tblHoldings: TTable;
    tblHoldingsACCT_NBR: TFloatField;
    tblHoldingsSHARES: TFloatField;
    tblHoldingsPUR_PRICE: TFloatField;
    tblHoldingsPUR_DATE: TDateField;
    tblHoldingsSYMBOL: TStringField;
    tblHoldingsPUR_COST: TCurrencyField;
    dsHoldings: TDataSource;
    procedure tblHoldingsCalcFields(DataSet: TDataSet);
    procedure tblHoldingsAfterPost(DataSet: TDataSet);
    procedure CalculateTotals(Sender: TObject; Field: TField);
    procedure tblHoldingsAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM1: TDM1;

implementation

uses CtrlForm;

{$R *.dfm}

procedure TDM1.tblHoldingsCalcFields(DataSet: TDataSet);
begin
  tblHoldingsPUR_COST.AsFloat :=
    tblHoldingsPUR_PRICE.AsFloat * tblHoldingsSHARES.AsFloat;
end;

procedure TDM1.CalculateTotals(Sender: TObject; Field: TField);
var
  flTotalCost,            { Holds total share cost }
  flTotalShares,          { Holds total share count }
  flTotalValue,           { Holds total share value }
  flDifference: Real;     { Holds difference between cost and value }
  strFormatSpec: string;  { The Display Format specification }
begin

  { Update the count of stock transactions }
  FmCtrlGrid.lPurchase.Caption := IntToStr( tblHoldings.RecordCount );

  { See whether or not its necessary to total the holdings and
    (if so) do so and update the result displays; otherwise,
    clear the result displays. }
  if tblHoldings.recordCount = 0 then
  begin
    { Clear the result displays }
    FmCtrlGrid.lTotalCost.Caption   := '';
    FmCtrlGrid.lTotalShares.Caption := '';
    FmCtrlGrid.lDifference.Caption  := '';
  end
  else
  begin
    { let the user know something's going on }
    Screen.Cursor := crHourglass;

    { Initialize the holder variables }
    flTotalCost := 0.0;
    flTotalShares := 0.0;

    { Calculate the total cost of these holdings. }
    tblHoldings.disableControls;  { hide this process from the user }
    tblHoldings.first;
    while not tblHoldings.eof do
    begin
      flTotalCost := flTotalCost + tblHoldingsPUR_COST.AsFloat;
      flTotalShares := flTotalShares + tblHoldingsSHARES.AsFloat;
      tblHoldings.next;
    end;
    tblHoldings.first;
    tblHoldings.enableControls;  { restore the display of holdings }

    { Calculate the current value of the shares (by multiplying
      the current holdings by the current share price) and the
      difference between the cost and the value. }

    flTotalValue := flTotalShares * tblMasterCUR_PRICE.AsFloat;
    flDifference := flTotalValue - flTotalCost;

    { Use the same format specification as that being used to
      display the Current Price field value so it can be used
      to display the results }

    strFormatSpec := tblMasterCUR_PRICE.DisplayFormat;

    { Update the result displays }

    FmCtrlGrid.lTotalCost.Caption :=
       FormatFloat( strFormatSpec, flTotalCost );
    FmCtrlGrid.lTotalShares.Caption :=
       FormatFloat( strFormatSpec, flTotalValue );
    FmCtrlGrid.lDifference.Caption :=
       FormatFloat( strFormatSpec, flDifference );

    { Update the Font Color of the Diference to
      indicate the quality of the investment }
    if flDifference > 0 then
      FmCtrlGrid.lDifference.Font.Color := clGreen
    else
      FmCtrlGrid.lDifference.Font.Color := clRed;
    FmCtrlGrid.lDifference.update;

    { let the user know that we're finished }
    Screen.Cursor := crDefault;
  end;
end;


procedure TDM1.tblHoldingsAfterPost(DataSet: TDataSet);
var
  bmCurrent : TBookmark;  { Holds the current position }
begin
  with tblHoldings do
  begin
    bmCurrent := getBookmark;       { save position }
    try
      CalculateTotals(nil, nil);  { recalc totals }
      gotoBookmark(bmCurrent);     { restore position }
    finally;
      freeBookmark(bmCurrent);     { free memory }
    end;
  end;
end;

procedure TDM1.tblHoldingsAfterOpen(DataSet: TDataSet);
begin
  {Don't want this calculation to occur until both master & detail are open}
  dsMaster.OnDataChange := CalculateTotals;
end;

end.
