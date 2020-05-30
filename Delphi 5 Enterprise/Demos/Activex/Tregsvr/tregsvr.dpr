program TRegSvr;

{$APPTYPE CONSOLE}

uses
  SysUtils, Windows, ActiveX, ComObj, RegConst;

type
  TRegType = (rtAxLib, rtTypeLib, rtExeLib);
  TRegAction = (raReg, raUnreg);
  TRegProc = function : HResult; stdcall;
  TUnRegTlbProc = function (const libID: TGUID; wVerMajor, wVerMinor: Word;
    lcid: TLCID; syskind: TSysKind): HResult; stdcall;


const
  ProcName: array[TRegAction] of PChar = (
    'DllRegisterServer', 'DllUnregisterServer');
  ExeFlags: array[TRegAction] of string = (' /regserver', ' /unregserver');

var
  RegType: TRegType = rtAxLib;
  RegAction: TRegAction = raReg;
  QuietMode: Boolean = False;
  FileName: string;
  RegProc: TRegProc;
  LibHandle: THandle;
  OleAutLib: THandle;
  UnRegTlbProc: TUnRegTlbProc;


procedure OutputStr(S: string);
begin
  if not QuietMode then 
  begin
    CharToOEM(PChar(S), PChar(S));
    Writeln(S);
  end;
end;

function DecodeOptions: Boolean;
var
  i: Integer;
  FileStart: Boolean;
  Param, FileExt: string;
begin
  Result := False;
  if ParamCount = 0 then Exit;
  FileName := '';
  for i := 1 to ParamCount do
  begin
    Param := ParamStr(i);
    FileStart := not (Param[1] in ['-', '/']);
    if FileStart then
    begin
      if FileName = '' then FileName := Param
      else FileName := FileName + ' ' + Param;
      // strip open and/or close quote if present
      if (FileName[1] = '"') then
      begin
        if (FileName[Length(FileName)] = '"') then
          FileName := Copy(FileName, 2, Length(FileName) - 2)
        else if FileName[1] = '"' then Delete(FileName, 1, 1);
      end;
    end
    else
    begin
      if Length(Param) < 2 then Exit;
      case Param[2] of
        'U', 'u': RegAction := raUnreg;
        'Q', 'q': QuietMode := True;
        'T', 't': RegType := rtTypeLib;
      end;
    end;
  end;
  FileExt := ExtractFileExt(FileName);
  if FileExt = '' then raise Exception.CreateFmt(SNeedFileExt, [FileName]);
  if RegType <> rtTypeLib then
  begin
    if CompareText(FileExt, '.TLB') = 0 then RegType := rtTypeLib
    else if CompareText(FileExt, '.EXE') = 0 then RegType := rtExeLib
    else RegType := rtAxLib;
  end;
  Result := True;
end;

procedure RegisterAxLib;
begin
  LibHandle := LoadLibrary(PChar(FileName));
  if LibHandle = 0 then raise Exception.CreateFmt(SLoadFail, [FileName]);
  try
    @RegProc := GetProcAddress(LibHandle, ProcName[RegAction]);
    if @RegProc = Nil then
      raise Exception.CreateFmt(SCantFindProc, [ProcName[RegAction],
        FileName]);
    if RegProc <> 0 then
      raise Exception.CreateFmt(SRegFail, [ProcName[RegAction], FileName]);
    OutputStr(Format(SRegSuccessful, [ProcName[RegAction]]))
  finally
    FreeLibrary(LibHandle);
  end;
end;

procedure RegisterTLB;
const
  RegMessage: array[TRegAction] of string = (SRegStr, SUnregStr);
var
  WFileName, DocName: WideString;
  TypeLib: ITypeLib;
  LibAttr: PTLibAttr;
  DirBuffer: array[0..MAX_PATH] of char;
begin
  if ExtractFilePath(FileName) = '' then
  begin
    GetCurrentDirectory(SizeOf(DirBuffer), DirBuffer);
    FileName := '\' + FileName;
    FileName := DirBuffer + FileName;
  end;
  if not FileExists(FileName) then
    raise Exception.CreateFmt(SFileNotFound, [FileName]);
  WFileName := FileName;
  OleCheck(LoadTypeLib(PWideChar(WFileName), TypeLib));
  OutputStr(Format(STlbName, [WFileName]));
  OleCheck(TypeLib.GetLibAttr(LibAttr));
  try
    OutputStr(Format(STlbGuid, [GuidToString(LibAttr^.Guid)]) + #13#10);
    if RegAction = raReg then
    begin
      OleCheck(TypeLib.GetDocumentation(-1, nil, nil, nil, @DocName));
      DocName := ExtractFilePath(DocName);
      OleCheck(RegisterTypeLib(TypeLib, PWideChar(WFileName), PWideChar(DocName)));
    end
    else begin
      OleAutLib := GetModuleHandle('OLEAUT32.DLL');
      if OleAutLib <> 0 then
        @UnRegTlbProc := GetProcAddress(OleAutLib, 'UnRegisterTypeLib');
      if @UnRegTlbProc = nil then raise Exception.Create(SCantUnregTlb);
      with LibAttr^ do
        OleCheck(UnRegTlbProc(Guid, wMajorVerNum, wMinorVerNum, LCID, SysKind));
    end;
  finally
    TypeLib.ReleaseTLibAttr(LibAttr);
  end;
  OutputStr(Format(STlbRegSuccessful, [RegMessage[RegAction]]));
end;

procedure RegisterEXE;
var
  SI: TStartupInfo;
  PI: TProcessInformation;
  RegisterExitCode: BOOL;
begin
  FillChar(SI, SizeOf(SI), 0);
  SI.cb := SizeOf(SI);
  RegisterExitCode := Win32Check(CreateProcess(PChar(FileName), PChar(FileName + ExeFlags[RegAction]),
    nil, nil, True, 0, nil, nil, SI, PI));
  CloseHandle(PI.hThread);
  CloseHandle(PI.hProcess);
  if RegisterExitCode then
    OutputStr(Format(SExeRegSuccessful, [PChar(FileName + ExeFlags[RegAction])]))
  else
    OutputStr(Format(SExeRegUnsuccessful, [PChar(FileName + ExeFlags[RegAction])]));
end;

begin
  try
    if not DecodeOptions then
      raise Exception.Create(SAbout + #13#10 + SUsage);
    OutputStr(SAbout);
    if not FileExists(FileName) then
      raise Exception.CreateFmt(SFileNotFound, [FileName]);
    case RegType of
      rtAxLib: RegisterAxLib;
      rtTypeLib: RegisterTLB;
      rtExeLib: RegisterEXE;
    end;
  except
    on E:Exception do OutputStr(E.Message);
  end;
end.
