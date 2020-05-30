program MemoEdit;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {MainForm},
  EditFrm in 'EditFrm.pas' {EditForm},
  Memo_TLB in 'Memo_TLB.pas',
  MemoAuto in 'MemoAuto.pas' {MemoApp: CoClass};

{$R *.RES}

{$R *.TLB}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
