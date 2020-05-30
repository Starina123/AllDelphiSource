unit PullConsumer_Impl;

interface

uses Corba, COSEvent;

type
  TPullConsumer = class(TInterfacedObject, PullConsumer)
  public
    constructor Create;
    procedure disconnect_pull_consumer;
  end;


implementation

constructor TPullConsumer.Create;
begin
  inherited;
end;

procedure TPullConsumer.disconnect_pull_consumer;
begin
  boa.ExitImplReady;
end;

end.
