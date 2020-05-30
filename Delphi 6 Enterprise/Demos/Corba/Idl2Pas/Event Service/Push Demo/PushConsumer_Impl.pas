unit PushConsumer_Impl;

interface

uses Corba, COSEvent;

type

  TPushConsumer = class(TInterfacedObject, PushConsumer)
  public
    constructor Create;
    procedure push(const data : Any);
    procedure disconnect_push_consumer;
  end;

implementation

uses PushConsumerMain;

constructor TPushConsumer.Create;
begin
  inherited;
end;

procedure TPushConsumer.push(const data : Any);
var st : String;
begin
  { *************************** }
  { *** User code goes here *** }
  { *************************** }
  st := data;
  Form1.Memo1.Lines.Add(st);
end;

procedure TPushConsumer.disconnect_push_consumer;
begin
  boa.ExitImplReady;
end;


end.
