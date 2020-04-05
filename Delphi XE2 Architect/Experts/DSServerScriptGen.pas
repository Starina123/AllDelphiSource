{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit DSServerScriptGen;

interface

uses
  Windows, DSCreators, DSServerFeatures, ToolsAPI;

/// <summary>Returns the absolute path to the active project.</summary>
function CurrentProjectPath: String;

/// <summary>Adds JavaScript REST related files to the active project's directory.</summary>
procedure AddScriptFiles(const APersonality: string; const IncludeBasicProxy: Boolean = true);

/// <summary>Adds JavaScript REST sample files to the active project's directory.</summary>
procedure AddSampleScriptFiles(const APersonality: string);

/// <summary>Adds DataSnap Connector related files to the given directory or active project.</summary>
/// <remarks>If set, APath specifies the directory to copy the files to. Otherwise, the
///     root directory of the active project is used.
/// </remarks>
procedure AddConnectorFiles(const APersonality: string; const APath: String = '');

/// <summary>Sets the current project's post-build script, if required for active features.</summary>
procedure SetCurrentProjectBuildScript(const Features: TDSServerFeatures);

// Utilities
procedure CopyDirExcludingSVN(const SourceDir, TargetDir: String);
procedure AddSourceAsFile(AProject: IOTAProject; const ATemplateFileName: string; const ADestPath: string;
  IsUnit: Boolean = False; AddFileAfterCopy: Boolean = True); overload;
procedure AddResourceAsFile(AProject: IOTAProject; ALibHandle: THandle; const AResourceName: string; const ADestPath: string);

implementation

uses
  SysUtils, IOUtils, Classes, Controls, StrUtils,  DSServerReg, DSSource,
  DCCStrs, CommonOptionStrs, Types;

procedure CopyDirExcludingSVN(const SourceDir, TargetDir: String);
var
  FilePredicate, DirPredicate: TDirectory.TFilterPredicate;
  LTargetPath, LSourcePath: String;
begin
  LSourcePath := IncludeTrailingPathDelimiter(SourceDir);
  LTargetPath := IncludeTrailingPathDelimiter(TargetDir);

  //predicate which uses recursion to get and copy all files
  FilePredicate :=
     function(const Path: string; const SearchRec: TSearchRec): Boolean
     begin
	     Result := False;

       System.SysUtils.ForceDirectories(TargetDir);
       TFile.Copy(LSourcePath + SearchRec.Name, LTargetPath + SearchRec.Name);
     end;

  //predicate which uses recursion to get and copy all files
  DirPredicate :=
     function(const Path: string; const SearchRec: TSearchRec): Boolean
     begin
	     Result := False;

       //recursively call into CopyDirExcludingSVN
       if (not AnsiSameStr(SearchRec.Name, '.svn')) then
         CopyDirExcludingSVN(LSourcePath + SearchRec.Name, LTargetPath + SearchRec.Name);
     end;

  //copy this directory's files
  TDirectory.GetFiles(SourceDir, FilePredicate);
  //recursively get all directories
  TDirectory.GetDirectories(SourceDir, DirPredicate);
end;

function CurrentProjectPath: String;
var
  LProject: IOTAProject;
begin
  LProject := GetActiveProject;
  Result := ExtractFilePath(LProject.FileName);
end;

procedure AddSourceAsFile(AProject: IOTAProject; const ATemplateFileName: string; const ADestPath: string;
  IsUnit: Boolean = False; AddFileAfterCopy: Boolean = True); overload;
var
  LSource: string;
  LStreamWriter: TStreamWriter;
  LFileStream: TStream;
  LEncoding: TEncoding;
begin
  ForceDirectories(ExtractFilePath(ADestPath));
  LEncoding := DSSource.GetTemplateFileEncoding(ATemplateFileName);
  LSource := DSSource.GetSourceFromTemplateFile(ATemplateFileName);
  LFileStream := TFileStream.Create(ADestPath, fmCreate);
  try
    LStreamWriter := TStreamWriter.Create(LFileStream, LEncoding);
    try
      LStreamWriter.Write(LSource);
    finally
      LStreamWriter.Free;
    end;
  finally
    LFileStream.Free;
  end;

  if AddFileAfterCopy then
    AProject.AddFile(ADestPath, IsUnit);
end;

procedure AddResourceAsFile(AProject: IOTAProject; ALibHandle: THandle; const AResourceName: string; const ADestPath: string);
var
  DescrResInfo: HRSRC;
  DescrResData: HGLOBAL;
  LBytes: PByte;
  LLength: Integer;
  LFileStream: TStream;
begin
  DescrResInfo := FindResource(ALibHandle, PChar(AResourceName), RT_RCDATA);
  if DescrResInfo <> 0 then
  begin
    DescrResData := LoadResource(ALibHandle, DescrResInfo);
    if DescrResData <> 0 then
    begin
      LBytes := LockResource(DescrResData);
      LLength := SizeofResource(ALibHandle, DescrResInfo);
      ForceDirectories(ExtractFilePath(ADestPath));
      LFileStream := TFileStream.Create(ADestPath, fmCreate);
      try
        LFileStream.Write(LBytes[0], LLength)
      finally
        LFileStream.Free;
      end;
      AProject.AddFile(ADestPath, False);
    end;
  end;
end;

procedure AddSampleScriptFiles(const APersonality: string);
var
  LProject: IOTAProject;
  LPath: string;
begin
  LProject := GetActiveProject;
  LPath := CurrentProjectPath;
  AddSourceAsFile(LProject, 'dsrest\connection.js', LPath + 'js\connection.js');
  AddSourceAsFile(LProject, 'dsrest\ServerFunctionInvoker.js', LPath + 'js\ServerFunctionInvoker.js');
  AddSourceAsFile(LProject, 'dsrest\main.css', LPath + 'css\main.css');
  AddSourceAsFile(LProject, 'dsrest\ServerFunctionInvoker.css', LPath + 'css\ServerFunctionInvoker.css');
  AddSourceAsFile(LProject, 'dsrest\ReverseString.html', LPath + 'templates\ReverseString.html');
  AddSourceAsFile(LProject, 'dsrest\ServerFunctionInvoker.html', LPath + 'templates\ServerFunctionInvoker.html');
  AddResourceAsFile(LProject, hinstance, 'COLLAPSEJPG', LPath + 'images\collapse.png');
  AddResourceAsFile(LProject, hinstance, 'EXPANDJPG', LPath + 'images\expand.png');
end;

procedure AddScriptFiles(const APersonality: string; const IncludeBasicProxy: Boolean);
var
  LProject: IOTAProject;
  LPath: string;
begin
  LProject := GetActiveProject;
  LPath := CurrentProjectPath;
  AddSourceAsFile(LProject, 'dsrest\base64.js', LPath + 'js\base64.js');
  AddSourceAsFile(LProject, 'dsrest\ServerFunctionExecutor.js', LPath + 'js\ServerFunctionExecutor.js');
  AddSourceAsFile(LProject, 'dsrest\json2.js', LPath + 'js\json2.js');
  AddSourceAsFile(LProject, 'dsrest\callbackframework.js', LPath + 'js\CallbackFramework.js');

  //optionally include the basic proxy (which assumes TServerMethods1 is the class, with the sample methods)
  if IncludeBasicProxy then
    AddSourceAsFile(LProject, 'dsrest\ServerFunctions.js', LPath + 'js\ServerFunctions.js');

  //add the -min version of JS framework files
  AddSourceAsFile(LProject, 'dsrest\base64-min.js', LPath + 'js\base64-min.js');
  AddSourceAsFile(LProject, 'dsrest\json2-min.js', LPath + 'js\json2-min.js');
  AddSourceAsFile(LProject, 'dsrest\ServerFunctionExecutor-min.js', LPath + 'js\ServerFunctionExecutor-min.js');
  AddSourceAsFile(LProject, 'dsrest\callbackframework-min.js', LPath + 'js\CallbackFramework-min.js');

  // Set directory so that save dialog will default to project directory
  SetCurrentDir(LPath);
end;

procedure AddConnectorFiles(const APersonality, APath: string);
var
  LPath, LProxyDir, LTemplateDirectory, LConnectorDir: string;
begin
  if Trim(APath) = EmptyStr then
    LPath := CurrentProjectPath
  else
    LPath := IncludeTrailingPathDelimiter(APath);
  LProxyDir := LPath + 'proxy';

  LTemplateDirectory := (BorlandIDEServices as IOTAServices).GetTemplateDirectory;
  LConnectorDir := SysUtils.GetLocaleDirectory(LTemplateDirectory + 'dsrest\connectors');

  //delete the proxy directory in the project folder if it already existed.
  if TDirectory.Exists(LProxyDir) then
    TDirectory.Delete(LProxyDir, True);

  //add the connector static proxy source files to the project
  CopyDirExcludingSVN(LConnectorDir, LProxyDir);

  // Set directory so that save dialog will default to project directory
  SetCurrentDir(LPath);
end;

procedure SetCurrentProjectBuildScript(const Features: TDSServerFeatures);
const
  cOutputDir = 'OutputDir';
  cFinalOutputDir = 'FinalOutputDir';
var
  LProject: IOTAProject;
  BEP: IOTABuildEventProvider;
  BuildEvent: ToolsAPI.IOTABuildEvent;
begin
  //If dsConnectors enabled, or if including Web Files, then add the post-build command to copy files
  if (dsWebFiles in Features) or (dsConnectors in Features) then
  begin
    LProject := GetActiveProject;
    if Supports(LProject, IOTABuildEventProvider, BEP) then
    begin
      BuildEvent := BEP.GetBuildEvent(betOTAPostCompile, sBaseConfigurationKey, '', True);

      //Cerify batch file exists, then execute it. The batch file will do the file copying
      BuildEvent.Commands := 'if exist "$(BDS)\ObjRepos\en\dsrest\dsPostBuild.bat" (' +
        ' call "$(BDS)\ObjRepos\en\dsrest\dsPostBuild.bat" "$(PROJECTDIR)" "$(OUTPUTDIR)" )';
    end;
  end;
end;

end.
