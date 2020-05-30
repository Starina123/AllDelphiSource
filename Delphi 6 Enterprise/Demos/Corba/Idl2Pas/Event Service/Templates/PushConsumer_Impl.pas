{*******************************************************}
{                                                       }
{     Borland Visibroker for Delphi Event Service       }
{                                                       }
{             PushConsumer Impl Template                }
{                                                       }
{       Copyright (C) 2000 Inprise Corporation          }
{                                                       }
{*******************************************************}

// Use this template for a PushConsumer implementation.
// Fill in the "Push" method with your code.
// See examples for a sample implementation.

unit PushConsumer_Impl;

interface

uses Corba, COSEvent;

type
  TPushConsumer = class(TInterfacedObject, PushConsumer)
  public
    constructor Create;
    procedure Push(const data : Any);
    procedure disconnect_push_consumer;
  end;


implementation

constructor TPushConsumer.Create;
begin
  inherited;
end;

procedure TPushConsumer.Push(const data : Any);
begin
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
end;

procedure TPushConsumer.disconnect_push_consumer;
begin
  boa.ExitImplReady;
end;


end.
