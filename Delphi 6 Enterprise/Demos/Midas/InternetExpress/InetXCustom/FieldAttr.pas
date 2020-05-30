unit FieldAttr;

interface

uses Classes, HTTPApp, Db, DbClient, Midas,
  XMLBrokr, WebComp, PagItems, MidItems;

type
  TFieldTextAttr = class(TFieldText)
  private
    FRequired: Boolean;
    FDecimals: Integer;
    FMaxValue: string;
    FMinValue: string;
    FFixedDecimals: Integer;
    FCurrencySymbol: string;
  protected
    function ImplGetRowSetFieldAttributes(const FieldVarName: string): string; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Required: Boolean read FRequired write FRequired;
    property Decimals: Integer read FDecimals write FDecimals default -1;
    property FixedDecimals: Integer read FFixedDecimals write FFixedDecimals default -1;
    property MinValue: string read FMinValue write FMinValue;
    property MaxValue: string read FMaxValue write FMaxValue;
    property CurrencySymbol: string read FCurrencySymbol write FCurrencySymbol;
  end;

  TTextColumnAttr = class(TTextColumn)
  private
    FRequired: Boolean;
    FDecimals: Integer;
    FMaxValue: string;
    FMinValue: string;
    FFixedDecimals: Integer;
    FCurrencySymbol: string;
  protected
    function ImplGetRowSetFieldAttributes(const FieldVarName: string): string; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Required: Boolean read FRequired write FRequired;
    property Decimals: Integer read FDecimals write FDecimals default -1;
    property FixedDecimals: Integer read FFixedDecimals write FFixedDecimals default -1;
    property MinValue: string read FMinValue write FMinValue;
    property MaxValue: string read FMaxValue write FMaxValue;
    property CurrencySymbol: string read FCurrencySymbol write FCurrencySymbol;
  end;

  procedure Register;

implementation

uses sysutils;

function FormatRowSetFieldAttributes(
  const FieldVarName: string;
  Required: Boolean; Decimals, FixedDecimals: Integer;
  const MinValue, MaxValue, CurrencySymbol: string): string;
const
  FalseTrue: array[Boolean] of string = ('false','true');
begin
  Result := '';
  Result := Format('%s%s.required = %s;'#13#10,
    [Result, FieldVarName, FalseTrue[Required]]);
  if Decimals >= 0 then
    Result := Format('%s%s.decimals = %d;'#13#10,
      [Result, FieldVarName, Decimals]);
  if FixedDecimals >= 0 then
    Result := Format('%s%s.fixeddec = %d;'#13#10,
      [Result, FieldVarName, FixedDecimals]);
  if MinValue <> '' then
    Result := Format('%0:s%1:s.minval = %1:s.frdisp("%2:s");'#13#10,
      [Result, FieldVarName, MinValue]);
  if MaxValue <> '' then
    Result := Format('%0:s%1:s.maxval = %1:s.frdisp("%2:s");'#13#10,
      [Result, FieldVarName, MaxValue]);
  if CurrencySymbol <> '' then
    Result := Format('%s%s.currencySymbol = "%s";'#13#10,
      [Result, FieldVarName, CurrencySymbol]);
end;

{ TFieldTextAttr }

constructor TFieldTextAttr.Create(AOwner: TComponent);
begin
  inherited;
  FDecimals := -1;
  FFixedDecimals := -1;
end;

function TFieldTextAttr.ImplGetRowSetFieldAttributes(
  const FieldVarName: string): string;
begin
  Result := inherited ImplGetRowSetFieldAttributes(FieldVarName) +
    FormatRowSetFieldAttributes(
     FieldVarName,
     Required, Decimals, FixedDecimals,
     MinValue, MaxValue, CurrencySymbol);
end;

procedure Register;
begin
  RegisterWebComponents([TFieldTextAttr, TTextColumnAttr]);
end;

{ TTextColumnAttr }

constructor TTextColumnAttr.Create(AOwner: TComponent);
begin
  inherited;
  FDecimals := -1;
  FFixedDecimals := -1;
end;

function TTextColumnAttr.ImplGetRowSetFieldAttributes(
  const FieldVarName: string): string;
begin
  Result := inherited ImplGetRowSetFieldAttributes(FieldVarName) +
    FormatRowSetFieldAttributes(
     FieldVarName,
     Required, Decimals, FixedDecimals,
     MinValue, MaxValue, CurrencySymbol);
end;

end.
