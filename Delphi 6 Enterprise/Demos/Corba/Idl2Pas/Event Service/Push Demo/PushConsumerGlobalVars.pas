unit PushConsumerGlobalVars;

interface

uses Corba, CosEvent;

var
  PushConsumer_Skeleton : TPushConsumerSkeleton;
  Event_Channel : EventChannel;
  Consumer_Admin : ConsumerAdmin;
  Push_Supplier : ProxyPushSupplier;

implementation

end.
