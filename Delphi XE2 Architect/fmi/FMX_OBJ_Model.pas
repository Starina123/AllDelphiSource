{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_OBJ_Model;

{$IFDEF FPC}
{$mode delphi}
{$ENDIF}

interface

uses
  SysUtils, Classes, Types, FMX_Types3D, FMX_Types,
  FMX_Objects3D, Math, FMX_Import, UITypes;

type
  TOBJMesh = class
  private
    FName: WideString;
    FSubMeshes: TGEMeshDynArray;
    function ReadUseMaterial(const ALine: WideString; const AVertexSource: TGEVertexSource): TGEMesh;
  public
    property SubMeshes: TGEMeshDynArray read FSubMeshes;
    destructor Destroy(); override;
    constructor Create();
  end;

  TOBJMeshDynArray = array of TOBJMesh;

  TOBJModel = class(TCustomModel)
  private
    FMaterials: TGEMaterials;
    FMeshes: TOBJMeshDynArray;
    FVertexSource: TGEVertexSource;
    FSmoothGroup: Integer;
    function ReadMaterials(const ALine: WideString): WideString;
    procedure ReadSources(const ALine: WideString);
    function ReadGeometry(const ALine: WideString):TOBJMesh;
    procedure ReadSmoothGroup(const ALine: WideString);
    procedure ReadFaces(const AMesh: TGEMesh; const ALine: WideString);
  public
    property Materials: TGEMaterials read FMaterials;
    property Meshes: TOBJMeshDynArray read FMeshes;

    procedure LoadFromFile(const AFileName: WideString);  override;

    constructor Create();
    destructor Destroy(); override;
  end;


implementation
constructor TOBJMesh.Create();
begin
  FSubMeshes := nil;
end;

constructor TOBJModel.Create();
begin
  FVertexSource := TGEVertexSource.Create;
  FMaterials := TGEMaterials.Create(True);
end;

destructor TOBJModel.Destroy();
var
  i : Integer;
begin
  FVertexSource.Free;
  for i := 0 to High(FMeshes) do
    FMeshes[i].Free;

  FMaterials.Free;
end;

destructor TOBJMesh.Destroy();
var
  i : Integer;
begin
  inherited Destroy;
  for i := 0 to High(FSubMeshes) do
    FSubMeshes[i].Free;
end;

procedure TOBJModel.ReadFaces(const AMesh: TGEMesh;  const ALine: WideString);
var
  c: PWideChar;
  LVid, LVal, i: Integer;
  LVert: array of array [0..2] of String;
  LVertex: TGEVertexID;
  LPolygon: TGEPoligonID;
  LSpace: Boolean;
 procedure AddLetter();
 begin
   if LSpace = true then
   begin
     Inc(LVid);
     SetLength(LVert, LVid + 1);
     LVal := 0;
     LVert[LVid][0] := '0';
     LVert[LVid][1] := '0';
     LVert[LVid][2] := '0';
     LSpace := false;
   end;
 end;


begin
  c := @ALine[2];
  LVid := -1;
  LVal := 0;
  LVert := nil;
  LSpace:= true;
  // parse line like 'f 1/1/1 2/2/1 3/3/1'

  while c^ <> #0 do
  begin
      case c^ of
        '0'..'9':
           begin
             AddLetter();
             LVert[LVid][LVal] := LVert[LVid][LVal] + c^;
           end;
        '/':
           begin
             AddLetter();
             Inc(LVal);
           end;
        ' ':
           LSpace := true;
        'f':
           LSpace := true;
    end;
    Inc(c);
  end;

  // copy from LVert to LPolygon
  SetLength(LPolygon, LVid+1);
  for i := 0 to LVid do
  begin
    LVertex.SmoothGroup := FSmoothGroup;
    LVertex.Position := StrToInt(LVert[i][0]) - 1;
    LVertex.Texture0 := StrToInt(LVert[i][1]) - 1;
    LVertex.Normal := StrToInt(LVert[i][2]) - 1;

    LPolygon[i] := LVertex;
  end;
  AMesh.AddPoligon(LPolygon);
end;

function TOBJMesh.ReadUseMaterial(const ALine: WideString; const AVertexSource: TGEVertexSource): TGEMesh;
var
  LName: WideString;
  i: Integer;
begin
                                       
  LName := Trim(Copy(ALine, Length('usemtl')+1, length(ALine)));

  for i := 0 to High(FSubMeshes) do
  begin
    result := FSubMeshes[i];
    if SameText(result.MaterialName, LName) then
       exit;
  end;
  result := TGEMesh.Create(AVertexSource);
  result.MaterialName := LName;
  SetLength(FSubMeshes, Length(FSubMeshes) + 1 );
  FSubMeshes[High(FSubMeshes)] := result;
end;

function TOBJModel.ReadMaterials(const ALine: WideString): WideString;
var
 LName: TStringDynArray;
begin
  LName := StringsToStringDynArray(ALine);
  if not SameText(LName[0], 'mtllib') then exit;
  result := LName[1];
end;

procedure TOBJModel.ReadSmoothGroup(const ALine: WideString);
begin
  FSmoothGroup := StrToInt(Trim(Copy(ALine, 3, Length(ALine))));
end;

procedure TOBJModel.ReadSources(const ALine: WideString);
var
  LSource: WideString;
begin
  LSource := Trim(Copy(ALine, 3, Length(ALine)));
  case ALine[2] of
    ' ' : FVertexSource.AddPositionSource(FloatStringsToSingleDynArray(LSource));
    'n' : FVertexSource.AddNormalSource(FloatStringsToSingleDynArray(LSource));
    't' : FVertexSource.AddTextue0Source(FloatStringsToSingleDynArray(LSource));
  end;
end;

function TOBJModel.ReadGeometry(const ALine: WideString) : TOBJMesh;
var
  LName: WideString;
  i: Integer;
begin
                                       
  LName := Trim(Copy(ALine, 2, length(ALine)));

  for i := 0 to High(FMeshes) do
  begin
    result := FMeshes[i];
    if SameText(result.FName, LName) then
       exit;
  end;
  result := TOBJMesh.Create();
  result.FName := LName;

  SetLength(FMeshes, Length(FMeshes) + 1 );
  FMeshes[High(FMeshes)] := result;
end;


function GetFormatColor(ax,ay,az: WideString):TVector3D;
var
  LFormatSettings: TFormatSettings;
begin
{$IFDEF FPC}
  LFormatSettings := DefaultFormatSettings;
{$ELSE}
  LFormatSettings := TFormatSettings.Create;
{$ENDIF}
  LFormatSettings.DecimalSeparator := '.';

  if (pos(',', ax + ay + az ) > 0) then
    LFormatSettings.DecimalSeparator := ',';

  result := Vector3D(
    StrToFloat(ax,LFormatSettings),
    StrToFloat(ay,LFormatSettings),
    StrToFloat(az,LFormatSettings));
end;

procedure TOBJModel.LoadFromFile(const AFileName: WideString);
var
  LPos: Integer;
  LFile : TextFile;
  LLine : WideString;
  LALine: AnsiString;
  LMesh: TOBJMesh;
  LSubMesh: TGEMesh;
  LName: TStringDynArray;
  LMaterial: TGEMaterial;
  LMaterialsFile: WideString;
begin
  AssignFile(LFile, AFileName);
  Reset(LFile);
  LSubMesh := nil;
  LMesh := nil;
  FSmoothGroup := 0;
  while not(EOF(LFile)) do
  begin
    Readln(LFile, LALine);
    LLine := String(LALine);
    if (LLine <> '') and (LLine[1] <> '#') then
    begin
      case LLine[1] of
        'm' : LMaterialsFile := ReadMaterials(LLine);
        'v' : ReadSources(LLine);
        'g' : LMesh := ReadGeometry(LLine);
        'u' : LSubMesh := LMesh.ReadUseMaterial(LLine, FVertexSource);
        's' : ReadSmoothGroup(LLine);
        'f' :
        begin

       if (LMesh = nil) then
          LMesh := ReadGeometry('g default');

       if (LSubMesh = nil) then
           LSubMesh := LMesh.ReadUseMaterial('usemtl Default', FVertexSource);
         ReadFaces(LSubMesh, Trim(LLine));
        end;
      end;
    end;
  end;

  if not FileExists(LMaterialsFile) then
     LMaterialsFile := ChangeFileExt(AFileName, '.mtl');

 // load material file
  if FileExists(LMaterialsFile) then
  begin
    AssignFile(LFile, LMaterialsFile);
    Reset(LFile);
    LMaterial := nil;
    while not(EOF(LFile)) do
    begin
      Readln(LFile, LALine);
      LLine := String(LALine);

      if (LLine <> '') and (LLine[1] <> '#') then
      begin
        LName := StringsToStringDynArray(LLine);
        if SameText(LName[0], 'newmtl') then
        begin
          LMaterial := FMaterials.Add(TGEMaterial.Create);
          LMaterial.FName := LName[1];
        end else
        if (Assigned(LMaterial)) then
        begin

          if SameText(LName[0], 'map_Kd') then
          begin
{$IFDEF FPCCOMP}
            LPos := Pos(WideString('map_Kd'), LLine) + Length(WideString('map_Kd'));
{$ELSE}
            LPos := Pos('map_Kd', LLine) + Length('map_Kd');
{$ENDIF}
            LMaterial.FDiffuseMap := Copy(LLine, LPos+1, Length(LLine)-LPos);
          end
          else if SameText(LName[0], 'Ka') then
            LMaterial.FAmbient := GetFormatColor(LName[1],LName[2],LName[3])
          else if SameText(LName[0], 'Ks') then
            LMaterial.FSpecular  := GetFormatColor(LName[1],LName[2],LName[3])
          else if SameText(LName[0], 'Kd') then
            LMaterial.FDiffuse  := GetFormatColor(LName[1],LName[2],LName[3])
        end;
      end;
    end;
    Closefile(LFile);
  end;

end;

end.
