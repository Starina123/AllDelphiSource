program PushConsumer;

uses
  Forms,
  PushConsumerMain in 'PushConsumerMain.pas' {Form1},
  PushConsumer_Impl in 'PushConsumer_Impl.pas';

{$R *.RES}


begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
