{*******************************************************}
{                                                       }
{     Borland Visibroker for Delphi Event Service       }
{                                                       }
{             PushSupplier Impl Template                }
{                                                       }
{       Copyright (C) 2000 Inprise Corporation          }
{                                                       }
{*******************************************************}

//You shouldn't have to modify this file... just include it in your project

unit PushSupplier_Impl;

interface

uses
  SysUtils, Corba, CosEvent;

type
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
