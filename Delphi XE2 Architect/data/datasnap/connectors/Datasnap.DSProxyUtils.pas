{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Datasnap.DSProxyUtils;

interface

uses
  System.SysUtils;

type
  EDSProxyException = class(Exception)

  end;

  TDSProxyUtils = class sealed
    class function CompressDirectory(const DirectoryName: String; OutputFileName: String): boolean;
    class function IsValidZipFile(FileName: String): boolean;
  end;

implementation

uses
  System.Zip;

{ TDSProxyUtils }

class function TDSProxyUtils.CompressDirectory(const DirectoryName: String;
  OutputFileName: String): boolean;
begin
  TZipFile.ZipDirectoryContents(OutputFileName, DirectoryName);
  Result := True;
end;

class function TDSProxyUtils.IsValidZipFile(FileName: String): boolean;
begin
  Result := TZipFile.IsValid(FileName);
end;

end.
