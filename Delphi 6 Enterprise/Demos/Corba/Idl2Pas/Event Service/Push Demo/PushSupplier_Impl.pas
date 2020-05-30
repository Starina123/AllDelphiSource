unit PushSupplier_Impl;

interface

uses
  SysUtils, Corba, CosEvent;

type
  TPushSupplier = class;

  TPushSupplier = class(TInterfacedObject, PushSupplier)
  public
    constructor Create;
    procedure disconnect_push_supplier;
  end;


implementation

constructor TPushSupplier.Create;
begin
  inherited;
end;

procedure TPushSupplier.disconnect_push_supplier;
begin
  BOA.ExitImplReady;
end;


end.
