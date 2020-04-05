{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_OBJ_Importer;

{$IFDEF FPC}
{$mode delphi}
{$ENDIF}

interface

uses
  Classes, SysUtils, FMX_Types3D, FMX_Import, FMX_Objects3D;

type
  TOBJModelImporter = class(TModelImporter)
  public
    function GetDescription: WideString; override;
    function GetExt: WideString; override;

    function LoadFromFile(const AFileName: WideString;
      out AMesh: TMeshDynArray; AOwner: TComponent): boolean; override;
  end;

implementation

uses
  FMX_OBJ_Model;

{ TOBJModelImporter }

function TOBJModelImporter.GetDescription: WideString;
begin
  Result := 'Wavefront object';
end;

function TOBJModelImporter.GetExt: WideString;
begin
  Result := 'OBJ';
end;

function TOBJModelImporter.LoadFromFile(const AFileName: WideString;
  out AMesh: TMeshDynArray; AOwner: TComponent): Boolean;
var
  i, j, idx : Integer;
  LOBJMesh : TOBJMesh;
  LOBJModel : TOBJModel;
begin
  LOBJModel := TOBJModel.Create();
  LOBJModel.LoadFromFile(AFileName);

  LOBJModel.Materials.LoadImages(ExtractFilePath(AFileName));

  AMesh := nil;
  idx := 0;

  for i := 0 to High(LOBJModel.Meshes) do
  begin
    LOBJMesh := LOBJModel.Meshes[i];

    SetLength(AMesh, Length(AMesh) + Length(LOBJMesh.SubMeshes));
    for j := 0 to High(LOBJMesh.SubMeshes) do
    begin
      AMesh[idx] := LOBJMesh.SubMeshes[j].CreateMesh(AOwner, IdentityMatrix3D,
        LOBJModel.Materials.Materials);
      Inc(idx);
    end;
  end;
  LOBJModel.Free;

  Result := True;
end;

var
  OBJImporterId: Integer;
initialization
  OBJImporterId := TModelImportServices.RegisterImporter(TOBJModelImporter.Create);
finalization
  TModelImportServices.UnregisterImporter(OBJImporterId);
end.
