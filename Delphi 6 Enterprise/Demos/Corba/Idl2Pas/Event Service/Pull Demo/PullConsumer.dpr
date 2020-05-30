program PullConsumer;

uses
  Forms,
  Corba,
  COSEvent,
  PullConsumerMain in 'PullConsumerMain.pas' {Form1},
  PullConsumerGlobalVars in 'PullConsumerGlobalVars.pas',
  PullConsumer_Impl in 'PullConsumer_Impl.pas';

{$R *.RES}

begin
  Application.Initialize;

  CorbaInitialize;

  // Create the skeleton and register it with the boa
  PullConsumer_Skeleton := TPullConsumerSkeleton.Create('Jack B Quick', TPullConsumer.Create);
  BOA.SetScope( RegistrationScope(1) );
  BOA.ObjIsReady(PullConsumer_Skeleton as _Object);

  //bind to the event channel and get a Pull Supplier object
  Event_Channel := TEventChannelHelper.bind;
  Pull_Supplier := Event_Channel.for_consumers.obtain_pull_supplier;

  Pull_Supplier.connect_pull_consumer(PullConsumer_Skeleton);

  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
