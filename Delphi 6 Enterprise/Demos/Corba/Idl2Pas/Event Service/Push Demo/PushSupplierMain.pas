unit PushSupplierMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CORBA, CosEvent, PushSupplier_Impl;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    PushSupplier_Skeleton : PushSupplier;
    Event_Channel : EventChannel;
    Supplier_Admin : SupplierAdmin;
    Push_Consumer : ProxyPushConsumer;
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
  PushSupplier_Skeleton := TPushSupplierSkeleton.Create('Jack B Quick', TPushSupplier.Create);
  BOA.SetScope( RegistrationScope(1) );
  BOA.ObjIsReady(PushSupplier_Skeleton as _Object);

  //bind to the event channel and get a Supplier Admin object
  Event_Channel := TEventChannelHelper.bind;
  Supplier_Admin := Event_Channel.for_suppliers;

  //get a push consumer and register the supplier object
  Push_Consumer := Supplier_Admin.obtain_push_consumer;
  Push_Consumer.connect_push_supplier(PushSupplier_Skeleton);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CorbaInit;
  Memo1.Lines.Add('Account object created...');
  Memo1.Lines.Add('Server is ready');
end;

procedure TForm1.Button1Click(Sender: TObject);
var myAny : Any;
begin
  myAny := Edit1.text;
  try
    Push_Consumer.Push(myAny);
  except
    on EDisconnected do ShowMessage('Client Disconnected');
  end;
end;


end.
