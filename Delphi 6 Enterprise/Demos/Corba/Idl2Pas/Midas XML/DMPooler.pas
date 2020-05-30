{*******************************************************}
{                                                       }
{      Copyright (C) 1999-2000 Inprise Corporation      }
{                                                       }
{*******************************************************}
unit DMPooler;

interface

uses SysUtils, Classes, Forms, SyncObjs, Windows;

type

  TDataModuleClass = class of TDataModule; // "class" reference

  TPooledModule = record
    Module: TDataModule; // Point to a TDataModule descendant instance
    InUse: Boolean;      // Indicates, whether Module is in use or not
  end;

  TModulePooler = class
  private
    FCSect: TCriticalSection;       // Enables thread safe changes to FModules
    FModuleClass: TDataModuleClass; // "class" for TDataModule to pool
    FModules: array of TPooledModule; // array of pooled TDataModules
    FSemaphore: THandle;            // Limits the number of simultaneous
  public                            // pool users.
    property ModuleClass: TDataModuleClass read FModuleClass write FModuleClass;
    constructor Create;
    destructor Destroy; override;
    function GetModule: TDataModule;     // Get TDataModule from the pool
    procedure FreeModule(DataModule: TDataModule); // Return TDataModule back
  end;                                             // to the pool

const
  PoolSize = 5;    //Number of DM's in pool. Might want to pass this from command-line

var
  ModulePooler: TModulePooler = nil;

implementation

uses Dialogs;

{ TModulePool }

constructor TModulePooler.Create;
begin
  IsMultiThread := True;
  FCSect := TCriticalSection.Create;
  FSemaphore := CreateSemaphore(nil, PoolSize, PoolSize, nil);
//  ShowMessage('Pool created!');
end;

destructor TModulePooler.Destroy;
begin
  FCSect.Free;
  CloseHandle(FSemaphore);
end;

//Loop through array of Datamodules and free each one.
procedure TModulePooler.FreeModule(DataModule: TDataModule);
var
  I: Integer;
begin
  FCSect.Enter;
  try
    for I := 0 to Length(FModules) - 1 do
      if FModules[I].Module = DataModule then
        FModules[I].InUse := False;
    ReleaseSemaphore(FSemaphore, 1, nil);
  finally
    FCSect.Leave;
  end;
end;

function TModulePooler.GetModule: TDataModule;
var
  I: Integer;
begin
  Result := nil;
  if WaitForSingleObject(FSemaphore, 5000) = WAIT_TIMEOUT then
    raise Exception.Create('Server too busy'); 
  FCSect.Enter;
  try
    if Length(FModules) = 0 then
    begin
      SetLength(FModules, PoolSize);
      for I := 0 to PoolSize - 1 do
        begin
          FModules[I].InUse := False;
          FModules[I].Module := FModuleClass.Create(Application);
        end;
    end;
    for I := 0 to Length(FModules) - 1 do
      if not FModules[I].InUse then
      begin
        FModules[I].InUse := True;
        Result := FModules[I].Module;
        Break;
      end;
  finally
    FCSect.Leave;
  end;
  //Check if we ran out of connections
  if not Assigned(Result) then
    raise Exception.Create('Pool is out of capacity');
end;

initialization
  ModulePooler := TModulePooler.Create;

finalization
  ModulePooler.Free;

end.
