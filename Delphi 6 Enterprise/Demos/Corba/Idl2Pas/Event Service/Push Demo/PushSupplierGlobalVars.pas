unit PushSupplierGlobalVars;

interface

uses Corba, CosEvent;

var
  PushSupplier_Skeleton : TPushSupplierSkeleton;
  Event_Channel : EventChannel;
  Supplier_Admin : SupplierAdmin;
  Push_Consumer : ProxyPushConsumer;

implementation

end.
