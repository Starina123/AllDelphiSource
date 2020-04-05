{*******************************************************}
{                                                       }
{             Delphi LiveBindings Framework             }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit BindCompProperties;


interface

uses
  System.SysUtils, System.Classes,   Data.Bind.Components,
  System.Rtti, System.Generics.Collections, System.TypInfo;

type
  TEnumeratePropertyProc = function(LProperty: TRttiProperty; AParentType: TRttiType; AParentProperties: TList<TRttiProperty>;
    var AEnumChildren: Boolean): Boolean of object;

  TDataBindingComponentPropertyNames = class
  private
    FList: TList<string>;
    FHasProperties: Boolean;
    FComponent: TObject;
    procedure UpdatePropertyNames;
    function ListEnumeratePropertyCallback(AProperty: TRttiProperty;
      AParentType: TRttiType; AParentProperties: TList<TRttiProperty>;
        var LEnumChildren: Boolean): Boolean;
    function HasEnumeratePropertyCallback(AProperty: TRttiProperty;
      AParentType: TRttiType; AParentProperties: TList<TRttiProperty>;
        var LEnumChildren: Boolean): Boolean;
    function GetPropertyNames: TArray<string>;
    function FilterProperty(AProperty: TRttiProperty): Boolean;
    function GetHasProperties: Boolean;
  public
    constructor Create(AComponent: TObject);
    destructor Destroy; override;
    property PropertyNames: TArray<string> read GetPropertyNames;
    property HasProperties: Boolean read GetHasProperties;
  end;

procedure EnumeratePropertyNames(AType: TRttiType; AProc: TEnumeratePropertyProc); overload; forward;
procedure EnumeratePropertyNames(AObject: TObject; AProc: TEnumeratePropertyProc); overload; forward;


implementation

procedure EnumeratePropertyNames(AType: TRttiType; AParentProperty: TRttiProperty; AParentTypes: TList<TRttiType>;
  AParentProperties: TList<TRttiProperty>;
  AProc: TEnumeratePropertyProc); overload;
var
  LProperties: TArray<TRttiProperty>;
  LField: TRttiProperty;
  LParentTypes: TList<TRttiType>;
  LParentProperties: TList<TRttiProperty>;
  LEnumChildren: Boolean;
begin
  LProperties := AType.GetProperties;
  if Length(LProperties) > 0 then
  begin
    if AParentTypes.Contains(AType) then
    begin
      // Recursive
      Exit;
    end;
    if AParentProperty <> nil then
      AParentProperties.Add(AParentProperty);
    AParentTypes.Add(AType);
    for LField in LProperties do
    begin
      LParentTypes := TList<TRttiType>.Create(AParentTypes);
      LParentProperties := TList<TRttiProperty>.Create(AParentProperties);
      try
        LEnumChildren := True;
        if not AProc(LField, LParentTypes[0], LParentProperties, LEnumChildren) then
          break;
                                                            
        if LEnumChildren then
          EnumeratePropertyNames(LField.PropertyType, LField, LParentTypes, LParentProperties, AProc);
      finally
        LParentTypes.Free;
        LParentProperties.Free;
      end;
    end;
  end;
end;

procedure EnumeratePropertyNames(AType: TRttiType; AProc: TEnumeratePropertyProc); overload;
var
  LParentTypes: TList<TRttiType>;
  LParentProperties: TList<TRttiProperty>;
begin
  LParentTypes := TList<TRttiType>.Create;
  LParentProperties := TList<TRttiProperty>.Create;
  try
    EnumeratePropertyNames(AType, nil, LParentTypes, LParentProperties, AProc);
  finally
    LParentTypes.Free;
    LParentProperties.Free;
  end;
end;

procedure EnumeratePropertyNames(AObject: TObject; AProc: TEnumeratePropertyProc); overload;
var
  LContext: TRttiContext;
  LType: TRttiInstanceType;
begin
  LType := LContext.GetType(AObject.ClassType) as TRttiInstanceType;
  EnumeratePropertyNames(LType, AProc);
end;

constructor TDataBindingComponentPropertyNames.Create(AComponent: TObject);
begin
  Assert(AComponent <> nil);
  FComponent := AComponent;
end;

destructor TDataBindingComponentPropertyNames.Destroy;
begin
  FList.Free;
  inherited;
end;

function TDataBindingComponentPropertyNames.FilterProperty(AProperty: TRttiProperty): Boolean;
begin
  Result := False;
  if not AProperty.IsWritable then
    Exit;
  if AProperty.Visibility = TMemberVisibility.mvPrivate then
    Exit;
  if AProperty.Visibility = TMemberVisibility.mvProtected then
    Exit;
  Result := False;
  case AProperty.PropertyType.TypeKind of
    tkUnknown: ;
    tkInteger:  Result := True;
    tkChar:      Result := True;
    tkEnumeration:  Result := True;
    tkFloat:   Result := True;
    tkString:  Result := True;
    tkSet:   Result := True;
    tkClass: ;
    tkMethod: ;
    tkWChar:   Result := True;
    tkLString:  Result := True;
    tkWString:  Result := True;
    tkVariant:  Result := True;
    tkArray:   ;
    tkRecord:  ;
    tkInterface: ;
    tkInt64:     Result := True;
    tkDynArray:  ;
    tkUString:    Result := True;
    tkClassRef:  ;
    tkPointer:   ;
    tkProcedure:  ;
  end;
end;


function TDataBindingComponentPropertyNames.HasEnumeratePropertyCallback(
  AProperty: TRttiProperty; AParentType: TRttiType;
  AParentProperties: TList<TRttiProperty>; var LEnumChildren: Boolean): Boolean;
begin
  LEnumChildren := False;
  if not FilterProperty(AProperty) then
    Exit(True);
  FHasProperties := True;
  Exit(False);
end;

function TDataBindingComponentPropertyNames.ListEnumeratePropertyCallback(AProperty: TRttiProperty; AParentType: TRttiType; AParentProperties: TList<TRttiProperty>;
        var LEnumChildren: Boolean): Boolean;
var
  LName: string;
  LParentProperty: TRttiProperty;
begin
  LEnumChildren := False;
  if not FilterProperty(AProperty) then
    Exit(True);
  try
    for LParentProperty in AParentProperties do
      if LName <> '' then
        LName := LName + '.' + LParentProperty.Name
      else
        LName := LParentProperty.Name;
    if LName <> '' then
      LName := LName + '.' + AProperty.Name
    else
      LName := AProperty.Name;
  except
    LName := AProperty.Name;
  end;
  if not FList.Contains(LName) then
    FList.Add(LName);
  Result := True;
end;

function TDataBindingComponentPropertyNames.GetHasProperties: Boolean;
begin
  FHasProperties := False;
  EnumeratePropertyNames(FComponent, HasEnumeratePropertyCallback);
  Result := FHasProperties;
end;

function TDataBindingComponentPropertyNames.GetPropertyNames: TArray<string>;
begin
  if FList = nil then
  begin
    FList := TList<string>.Create;
    UpdatePropertyNames;
  end;
  Result := FList.ToArray;
end;


procedure TDataBindingComponentPropertyNames.UpdatePropertyNames;
begin
  FList.Clear;
  EnumeratePropertyNames(FComponent, ListEnumeratePropertyCallback);
end;

end.
