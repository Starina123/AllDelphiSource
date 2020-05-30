program Qr2demo;

uses
  Forms,
  Menu in 'MENU.PAS' {MainForm},
  Grplist in 'GRPLIST.PAS' {GrpListForm},
  Md in 'MD.PAS' {MDForm},
  List in 'LIST.PAS' {ListForm},
  Manygrp in 'MANYGRP.PAS' {ManyGrpForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TGrpListForm, GrpListForm);
  Application.CreateForm(TMDForm, MDForm);
  Application.CreateForm(TListForm, ListForm);
  Application.CreateForm(TManyGrpForm, ManyGrpForm);
  Application.Run;
end.
