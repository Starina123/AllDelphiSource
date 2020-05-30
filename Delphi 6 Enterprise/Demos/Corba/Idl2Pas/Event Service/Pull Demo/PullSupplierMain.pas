unit PullSupplierMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Corba, CosEvent, PullSupplier_Impl;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Pull_Supplier_Skeleton : PullSupplier;
    Event_Channel : EventChannel;
    Pull_Consumer : ProxyPullConsumer;
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
  Pull_Supplier_Skeleton := TPullSupplierSkeleton.Create('Jack B Quick', TPullSupplier.Create);
  BOA.SetScope( RegistrationScope(1) );
  BOA.ObjIsReady(Pull_Supplier_Skeleton as _Object);

  //bind to the event channel and get a PullConsumerProxy object
  Event_Channel := TEventChannelHelper.bind;
  Pull_Consumer := Event_Channel.for_suppliers.obtain_pull_consumer;

  //connect the Skeleton to the Event Service
  Pull_Consumer.connect_pull_supplier(Pull_Supplier_Skeleton);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CorbaInit;
end;

end.
