program Resolver;

uses
  Forms,
  ResolverTest in 'ResolverTest.pas' {ResolverForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TResolverForm, ResolverForm);
  Application.Run;
end.

