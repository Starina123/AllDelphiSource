unit Rates_Impl;

interface

uses
  SysUtils,
  CORBA,
  Bank_i,
  Bank_c;

type
  TRates = class(TInterfacedObject, Bank_i.Rates)
  protected
    _interest_rate : Single;
  public
    constructor Create;
    function  get_interest_rate : Single;
  end;

implementation

constructor TRates.Create;
begin
  inherited;
  _interest_rate := Random * 10;
end;

function  TRates.get_interest_rate : Single;
begin
  Result := _interest_rate;
end;

initialization
  randomize;
end.
