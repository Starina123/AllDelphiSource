{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2016-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Platform.SaveState.Android;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes, FMX.Platform;

type

  /// <summary>Implements <c>IFMXSaveStateService</c> for Android</summary>
  TAndroidSaveStateService = class(TInterfacedObject, IFMXSaveStateService)
  private
    FSaveStateStoragePath: string;
  protected
    procedure RegisterService; virtual;
    procedure UnregisterService; virtual;
  public
    constructor Create;
    destructor Destroy; override;
    { IFMXSaveStateService }
    function GetBlock(const ABlockName: string; const ABlockData: TStream): Boolean;
    function SetBlock(const ABlockName: string; const ABlockData: TStream): Boolean;
    function GetStoragePath: string;
    procedure SetStoragePath(const ANewPath: string);
    function GetNotifications: Boolean;
  end;

implementation

uses
  System.SysUtils, System.IOUtils, Posix.StdLib, Androidapi.AppGlue;

{ TAndroidSaveStateService }

constructor TAndroidSaveStateService.Create;
begin
  inherited;
  RegisterService;
end;

destructor TAndroidSaveStateService.Destroy;
begin
  UnregisterService;
  inherited;
end;

function TAndroidSaveStateService.GetBlock(const ABlockName: string; const ABlockData: TStream): Boolean;

  procedure SeekAndReadBlock(const AStream: TStream);
  var
    R: TBinaryReader;
    LBlockSize: Integer;
    LBlockName: string;
  begin
    R := TBinaryReader.Create(AStream);
    try
      AStream.Seek(0, TSeekOrigin.soBeginning);
      while AStream.Position < AStream.Size do
      begin
        LBlockSize := R.ReadInteger;
        LBlockName := R.ReadString;
        if SameText(LBlockName, ABlockName) then
        begin
          ABlockData.CopyFrom(AStream, LBlockSize);
          Break;
        end
        else
          AStream.Seek(LBlockSize, TSeekOrigin.soCurrent);
      end;
    finally
      R.Free;
    end;
  end;

  procedure ReadPersistent(const AFileName: string);
  var
    S: TFileStream;
  begin
    S := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyWrite);
    try
      ABlockData.CopyFrom(S, S.Size);
    finally
      S.Free;
    end;
  end;

var
  LStream: TMemoryStream;
  LFileName: string;
  AndroidApp: TAndroidApplicationGlue;
begin
  if ABlockName.IsEmpty or (ABlockData = nil) then
    Exit(False);
  if FSaveStateStoragePath.Length > 0 then
  begin
    // Persistent state is read from fixed storage.
    LFileName := FSaveStateStoragePath + ABlockName;
    if not TFile.Exists(LFileName) then
      Exit(False);
    try
      ReadPersistent(LFileName);
    except
      Exit(False);
    end;
  end
  else
  begin
    AndroidApp := TAndroidApplicationGlue.Current;
    // Transient state is read from native activity.
    if (AndroidApp.SavedState = nil) or (AndroidApp.SavedStateSize < 1) then
      Exit(False);
    LStream := TMemoryStream.Create;
    try
      try
        LStream.Size := AndroidApp.savedStateSize;
        LStream.WriteBuffer(AndroidApp.SavedState^, AndroidApp.SavedStateSize);
        SeekAndReadBlock(LStream);
      except
        Exit(False);
      end;
    finally
      LStream.Free;
    end;
  end;
  Result := True;
end;

function TAndroidSaveStateService.GetNotifications: Boolean;
begin
  Result := True;
end;

function TAndroidSaveStateService.GetStoragePath: string;
begin
  Result := FSaveStateStoragePath;
end;

procedure TAndroidSaveStateService.RegisterService;
begin
  if not TPlatformServices.Current.SupportsPlatformService(IFMXSaveStateService) then
    TPlatformServices.Current.AddPlatformService(IFMXSaveStateService, Self);
end;

function TAndroidSaveStateService.SetBlock(const ABlockName: string; const ABlockData: TStream): Boolean;

  procedure WriteBlockToEnd(const AStream: TStream);
  var
    W: TBinaryWriter;
  begin
    W := TBinaryWriter.Create(AStream);
    try
      W.Write(Integer(ABlockData.Size));
      W.Write(ABlockName);
    finally
      W.Free;
    end;
    ABlockData.Seek(0, TSeekOrigin.soBeginning);
    AStream.CopyFrom(ABlockData, ABlockData.Size);
  end;

  procedure WritePersistent(const AFileName: string);
  var
    S: TFileStream;
  begin
    S := TFileStream.Create(AFileName, fmCreate or fmShareExclusive);
    try
      ABlockData.Seek(0, TSeekOrigin.soBeginning);
      S.CopyFrom(ABlockData, ABlockData.Size);
    finally
      S.Free;
    end;
  end;

var
  LStream: TMemoryStream;
  LFileName: string;
  AndroidApp: TAndroidApplicationGlue;
begin
  if ABlockName.IsEmpty then
    Exit(False);
  if not FSaveStateStoragePath.IsEmpty then
  begin
    // Persistent state is written to fixed storage.
    LFileName := FSaveStateStoragePath + ABlockName;
    if (ABlockData = nil) or (ABlockData.Size < 1) then
    begin
      if TFile.Exists(LFileName) then
        TFile.Delete(LFileName);
    end
    else
      try
        WritePersistent(LFileName);
      except
        Exit(False);
      end;
  end
  else
  begin
    // Transient state is saved to native activity.
    if (ABlockData = nil) or (ABlockData.Size < 1) then
      Exit(True);
    LStream := TMemoryStream.Create;
    AndroidApp := TAndroidApplicationGlue.Current;
    try
      try
        if (AndroidApp.savedState <> nil) and (AndroidApp.savedStateSize > 0) then
          LStream.WriteBuffer(AndroidApp.savedState^, AndroidApp.savedStateSize);
        WriteBlockToEnd(LStream);
      except
        Exit(False);
      end;
      if AndroidApp.savedState <> nil then
        Posix.StdLib.free(AndroidApp.savedState);
      AndroidApp.savedStateSize := LStream.Size;
      AndroidApp.savedState := Posix.StdLib.__malloc(AndroidApp.savedStateSize);
      try
        LStream.Seek(0, TSeekOrigin.soBeginning);
        LStream.ReadBuffer(AndroidApp.savedState^, AndroidApp.savedStateSize);
      except
        Exit(False);
      end;
    finally
      LStream.Free;
    end;
  end;
  Result := True;
end;

procedure TAndroidSaveStateService.SetStoragePath(const ANewPath: string);
begin
  if not ANewPath.IsEmpty then
    FSaveStateStoragePath := IncludeTrailingPathDelimiter(ANewPath)
  else
    FSaveStateStoragePath := '';
end;

procedure TAndroidSaveStateService.UnregisterService;
begin
  TPlatformServices.Current.RemovePlatformService(IFMXSaveStateService);
end;

end.
