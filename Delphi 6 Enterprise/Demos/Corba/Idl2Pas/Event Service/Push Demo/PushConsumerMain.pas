unit PushConsumerMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CORBA, CosEvent, PushConsumer_Impl;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    PushConsumer_Skeleton : PushConsumer;
    Event_Channel : EventChannel;
    Consumer_Admin : ConsumerAdmin;
    Push_Supplier : ProxyPushSupplier;
    procedure CorbaInit;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.CorbaInit;
begin
  CorbaInitialize;

  // Create the skeleton and register it with the boa
  PushConsumer_Skeleton := TPushConsumerSkeleton.Create('Jack B Quick', TPushConsumer.Create);
  BOA.SetScope( RegistrationScope(1) );
  BOA.ObjIsReady(PushConsumer_Skeleton as _Object);

  //bind to the event channel and get a Supplier Admin object
  Event_Channel := TEventChannelHelper.bind;
  Consumer_Admin := Event_Channel.for_consumers;

  //get a push consumer and register the supplier object
  Push_Supplier := Consumer_Admin.obtain_push_supplier;
  Push_Supplier.connect_push_consumer(PushConsumer_Skeleton);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CorbaInit;
end;

end.
