library Exptdemo;

uses 
  ShareMem,
  Forms,
  Windows,
  ExptIntf,
  ToolIntf,
  VirtIntf,
  SysUtils,
  Dlg in 'DLG.PAS' {DlgExpert},
  Exconst in 'EXCONST.PAS',
  App in 'APP.PAS' {AppExpert};

type
  TDialogExpert = class(TIExpert)
    function GetName: string; override;
    function GetComment: string; override;
    function GetGlyph: HICON; override;
    function GetStyle: TExpertStyle; override;
    function GetState: TExpertState; override;
    function GetIDString: string; override;
    function GetAuthor: string; override;
    function GetPage: string; override;
    function GetMenuText: string; override;
    procedure Execute; override;
  end;

  TApplicationExpert = class(TIExpert)
    function GetName: string; override;
    function GetComment: string; override;
    function GetGlyph: HICON; override;
    function GetStyle: TExpertStyle; override;
    function GetState: TExpertState; override;
    function GetIDString: string; override;
    function GetAuthor: string; override;
    function GetPage: string; override;
    function GetMenuText: string; override;
    procedure Execute; override;
  end;

{$R EXPTBMPS.RES}
{$R STRINGS.RES}

procedure HandleException;
begin
  ToolServices.RaiseException(ReleaseException);
end;

{ TDialogExpert }
function TDialogExpert.GetName: string;
begin
  try
    Result := LoadStr(sDlgExpertName);
  except
    HandleException;
  end;
end;

function TDialogExpert.GetComment: string;
begin
  try
    Result := LoadStr(sDlgExpertDesc);
  except
    HandleException;
  end;
end;

function TDialogExpert.GetGlyph: HICON;
begin
  try
    Result := LoadIcon(HInstance, 'DLGEXPT'); 
  except
    HandleException;
    Result := 0;
  end;
end;

function TDialogExpert.GetStyle: TExpertStyle;
begin
  try
    Result := esForm;
  except
    HandleException;
    Result := esForm;
  end;
end;

function TDialogExpert.GetState: TExpertState;
begin
  try
    Result := [esEnabled];
  except
    HandleException;
    Result := [];
  end;
end;

function TDialogExpert.GetIDString: string;
begin
  try
    Result := 'Borland.DlgExpertDemo';
  except
    HandleException;
    Result := '';
  end;
end;

function TDialogExpert.GetAuthor: string;
begin
  try
    Result := 'Borland';
  except
    HandleException;
    Result := '';
  end;
end;

function TDialogExpert.GetPage: string;
begin
  try
    Result := LoadStr(sDialogsPage);
  except
    HandleException;
    Result := '';
  end;
end;

function TDialogExpert.GetMenuText: string;
begin
  Result := '';
end;

procedure TDialogExpert.Execute;
begin
  try
    DialogExpert(ToolServices);
  except
    HandleException;
  end;
end;

{ TApplicationExpert }
function TApplicationExpert.GetName: string;
begin
  try
    Result := LoadStr(sAppExpertName);
  except
    HandleException;
  end;
end;

function TApplicationExpert.GetComment: string;
begin
  try
    Result := LoadStr(sAppExpertDesc);
  except
    HandleException;
  end;
end;

function TApplicationExpert.GetGlyph: HICON;
begin
  try
    Result := LoadIcon(HInstance, 'APPEXPT'); 
  except
    HandleException;
    Result := 0;
  end;
end;

function TApplicationExpert.GetStyle: TExpertStyle;
begin
  try
    Result := esProject;
  except
    HandleException;
    Result := esProject;
  end;
end;

function TApplicationExpert.GetState: TExpertState;
begin
  try
    Result := [esEnabled];
  except
    HandleException;
    Result := [];
  end;
end;

function TApplicationExpert.GetIDString: string;
begin
  try
    Result := 'Borland.AppExpertDemo';
  except
    HandleException;
    Result := '';
  end;
end;

function TApplicationExpert.GetAuthor: string;
begin
  try
    Result := 'Borland';
  except
    HandleException;
    Result := '';
  end;
end;

function TApplicationExpert.GetPage: string;
begin
  try
    Result := LoadStr(sProjectsPage);
  except
    HandleException;
    Result := '';
  end;
end;

function TApplicationExpert.GetMenuText: string;
begin
  Result := '';
end;

procedure TApplicationExpert.Execute;
begin
  try
    ApplicationExpert(ToolServices);
  except
    HandleException;
  end;
end;

procedure DoneExpert; export;
begin
  { Put any general destruction code here.  Note that the Delphi IDE
    will destroy any experts which have been registered. }
end;

function InitExpert(ToolServices: TIToolServices;
  RegisterProc: TExpertRegisterProc;
  var Terminate: TExpertTerminateProc): Boolean; export; stdcall;
begin
  if ExptIntf.ToolServices = nil then
  begin
    ExptIntf.ToolServices := ToolServices;
    if ToolServices <> nil then
      Application.Handle := ToolServices.GetParentHandle;
  end;

  Terminate := DoneExpert;

  { register the experts }
  Result := RegisterProc(TDialogExpert.Create) and
    RegisterProc(TApplicationExpert.Create);
end;

exports
  InitExpert name ExpertEntryPoint resident;

begin
end.
