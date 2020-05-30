unit PullSupplier_Impl;

interface

uses CORBA, COSEvent;

type
  TPullSupplier = class(TInterfacedObject, PullSupplier)
  public
    constructor Create;
    function  pull : Any;
    function  try_pull(out has_event : Boolean): Any;
    procedure disconnect_pull_supplier;
  end;

implementation

uses SysUtils, PullSupplierMain;

constructor TPullSupplier.Create;
begin
  inherited;
end;

function  TPullSupplier.pull : Any;
begin
  if (Form1 <> nil) and (Form1.Edit1.Text <> '') then
    result := Form1.Edit1.Text
  else result := 'No Value yet';
end;

function  TPullSupplier.try_pull(out has_event : Boolean): Any;
begin
  has_event := False;
  result := 'No Data Yet';
  if (Form1 <> nil) and (Form1.Edit1.Text <> '' ) then
  begin
    has_event := True;
    result := pull;
  end;
end;

procedure TPullSupplier.disconnect_pull_supplier;
begin
  boa.ExitImplReady;
end;

end.
