program ThrdDemo;

uses
  Forms,
  ThSort in 'ThSort.pas' {ThreadSortForm},
  SortThds in 'SortThds.pas';

{$R *.RES}

begin
  Application.CreateForm(TThreadSortForm, ThreadSortForm);
  Application.Run;
end.
