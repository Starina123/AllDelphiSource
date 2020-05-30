
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{       Web services description language (WSDL)        }
{       generation from RTTI                            }
{                                                       }
{   Copyright (c) 2001 Borland Software Corporation     }
{                                                       }
{*******************************************************}

unit WebServExp;

interface

uses
  SysUtils, Classes, Variants, ActiveX, IntfInfo, TypInfo, XMLIntf, XMLDoc, xmldom, XmlSchema,
  WSDLIntf, WSDLBind, XMLSchemaTags;

type

  ArgumentType = (argIn, argOut, argInOut, argReturn);

  TSchemaType = record
    TypeName: WideString;
    NameSpace: WideString;
    TypeInfo: PTypeinfo;
    NSPrefix: WideString;
    XSGenerated: Boolean;
  end;

  TSchemaTypeArray = array of TSchemaType;


  TWebServExp = class
  private
    Definition: IDefinition;
    ComplexTypeList: TStringList;
    bHasComplexTypes: Boolean;
    FServiceAddress: WideString;
    FNameSpace: WideString;
    FBindingType: TBindingType;
    FWSDLElements: TWSDLElements;
    FImportNames: TWideStrings;
    FImportLocation: TWideStrings;
    FArrayAsComplexContent: Boolean;
    SchemaArray: TSchemaTypeArray;

    procedure GenerateWSDL(const IntfMD: TIntfMetaData; WSDLDoc: IWSDLDocument;  PortNames, Locations: array of WideString);
    procedure GenerateNestedArraySchema(RootNode: IXMLSchemaDoc; ComplexType: IXMLComplexTypeDef; const ObjectTypeInfo: PTypeinfo; var Dimension: Integer; Namespace: WideString);
    procedure AddImports(const IntfMD: TIntfMetaData; WSDLDoc: IWSDLDocument);
    procedure AddTypes(const IntfMD: TIntfMetaData; WSDLDoc: IWSDLDocument);
    procedure AddMessages(const IntfMD: TIntfMetaData; WSDLDoc: IWSDLDocument);
    procedure AddPortTypes(const IntfMD: TIntfMetaData; WSDLDoc: IWSDLDocument);
    procedure AddBinding(const IntfMD: TIntfMetaData; WSDLDoc: IWSDLDocument);
    procedure AddServices(const IntfMD: TIntfMetaData; WSDLDoc: IWSDLDocument; PortNames: array of WideString; Locations: array of WideString);
    function  GetXMLSchemaType(const ParamTypeInfo: PTypeInfo): string;
    function  IsComplexType(const ParamType: TTypeKind ):Boolean;
    procedure SetBindingType(const Value: TBindingType);
    procedure SetServiceAddress(const Value: WideString);
    function  GetImportNamespace(const Index: Integer): WideString;
    procedure SetImportNamespace(const Index: Integer; const Value: WideString);
    function  GetImportLocation(const Index: Integer): WideString;
    procedure SetImportLocation(const Index: Integer; const Value: WideString);
    procedure SetArrayType(const Value: Boolean);
    function  GetPrefixForURI(RootNode: IXMLSchemaDoc; URI: WideString): WideString; overload;
    function  GetPrefixForURI(Def: IDefinition; URI: WideString): WideString; overload;
    function  GetPrefixForTypeInfo(const ObjectTypeInfo: PTypeinfo): WideString; overload;
    function  AddNamespaceURI(RootNode: IXMLNode; URI: WideString): WideString;
    function  GetNodeNameForURI(RootNode: IXMLSchemaDoc; URI: WideString): WideString;
    procedure GenerateArraySchema(RootNode: IXMLSchemaDoc; const ObjectTypeInfo: PTypeinfo; Namespace: WideString);
    procedure GenerateEnumSchema(RootNode: IXMLSchemaDoc; const ObjectTypeInfo: PTypeinfo; Namespace: WideString);
    procedure GenerateClassSchema(RootNode: IXMLSchemaDoc; const ObjectTypeInfo, ParentInfo: PTypeinfo; Namespace: WideString);
    procedure GenerateDerivedClassSchema(RootNode: IXMLSchemaDoc; const ParentTypeInfo: PTypeinfo; Namespace: WideString);
    procedure GetAllSchemaTypes(const IntfMD: TIntfMetaData);
    procedure GetSchemaTypes(const ObjectTypeInfo, ParentInfo: PTypeinfo);
    function  FindSchema(const ObjectTypeInfo: PTypeinfo; const TnsURI: string): Boolean;
    procedure GetClassSchema(const ObjectTypeInfo, ParentInfo: PTypeinfo);
    procedure GetDerivedClassSchema(const ParentTypeInfo: PTypeinfo);
    function  IsSchemaGenerated(const ObjectTypeInfo: PTypeinfo; const TnsURI: WideString): Boolean;
    procedure GetArraySchema(const ObjectTypeInfo: PTypeinfo);

  public
    constructor Create;
    destructor Destroy; override;
    procedure GetWSDLForInterface(const IntfTypeInfo: Pointer; WSDLDoc: IWSDLDocument; PortNames, Locations: array of WideString);
    procedure GenerateXMLSchema(RootNode: IXMLSchemaDoc; const ObjectTypeInfo, ParentInfo: PTypeinfo; Namespace: WideString);
    property ImportNames [const Index: Integer]: WideString read GetImportNamespace write SetImportNamespace;
    property ImportLocations[const Index: Integer]: WideString read GetImportLocation write SetImportLocation;

  published
    property ArrayAsComplexContent: Boolean read FArrayAsComplexContent write SetArrayType;
    property BindingType: TBindingType read FBindingType write SetBindingType;
    property ServiceAddress: WideString read FServiceAddress write SetServiceAddress;
    property WSDLElements: TWSDLElements read FWSDLElements write FWSDLElements default [weServiceIntf];

  end;


implementation

uses InvokeRegistry, SOAPConst;

{ WebServExp Implementation }
constructor TWebServExp.Create;
begin
  ComplexTypeList := TStringList.Create;
  FWSDLElements := [weServiceIntf];
  FImportNames := TWideStrings.Create;
  FImportLocation := TWideStrings.Create;
  FArrayAsComplexContent := True;
end;

destructor TWebServExp.Destroy;
begin
  ComplexTypeList.Free;
  FImportNames.Free;
  FImportLocation.Free;
  inherited Destroy;
end;

procedure TWebServExp.SetArrayType(const Value: Boolean);
begin
  FArrayAsComplexContent := Value;
end;

procedure TWebServExp.SetBindingType(const Value: TBindingType);
begin
  FBindingType := Value;
end;

procedure TWebServExp.SetServiceAddress(const Value: WideString);
begin
  FServiceAddress := Value;
end;

function  TWebServExp.GetImportNamespace(const Index: Integer): WideString;
begin
  if FImportNames.Count > Index  then
    Result := FImportNames.Strings[Index]
  else
    Result := '';
end;

function  TWebServExp.GetImportLocation(const Index: Integer): WideString;
begin
  if FImportLocation.Count > Index  then
    Result := FImportLocation.Strings[Index]
  else
    Result := '';
end;

procedure TWebServExp.SetImportNamespace(const Index: Integer; const Value: WideString);
begin
  FImportNames.Insert(Index, Value);
end;

procedure TWebServExp.SetImportLocation(const Index: Integer; const Value: WideString);
begin
  FImportLocation.Insert(Index, Value);
end;


procedure TWebServExp.GetWSDLForInterface(const IntfTypeInfo: Pointer; WSDLDoc: IWSDLDocument; PortNames,  Locations: array of WideString);
var
  IntfMD: TIntfMetaData;
begin

  bHasComplexTypes := False;
  GetIntfMetaData(IntfTypeInfo, IntfMD);
  GenerateWSDL(IntfMD, WSDLDoc, PortNames,  Locations);

end;


procedure TWebServExp.GenerateWSDL(const IntfMD: TIntfMetaData; WSDLDoc: IWSDLDocument; PortNames, Locations: array of WideString);
var
  //Definition: IDefinition;
  Encoding: WideString;
begin

  if IntfMD.Name <> '' then
  begin
    //Add WSDL:Definitions and its attributes
    Definition := WSDLDoc.Definition;
    Definition.Attributes[Sname] := IntfMD.Name+SService;
    Definition.Attributes[Stns]  := tns;
    //Definition.Attributes['xmlns:xsd'] := Xsdns;  //Need to auto generate Namespace prefix
    Definition.Attributes['xmlns:soap'] := Soapns;
    Definition.Attributes['xmlns:soapenc'] := SSoap11EncodingS5;

    //Add Encoding
    if WSDLDoc.Encoding = '' then
    begin
      Encoding := InvRegistry.GetWSDLEncoding(IntfMD.Info, '', IntfMD.Name);
      if Encoding <> '' then
        WSDLDoc.Encoding := Encoding
      else
        WSDLDoc.Encoding := 'utf-8';
    end;

    //Set the Namespace prefix
    (WSDLDoc as IXMLDocumentAccess).DocumentObject.NSPrefixBase := SNsPrefix;

    //Add WSDL Types
    if (WeTypes in FWSDLElements) or (WeServiceIntf in FWSDLElements) then
      AddTypes(IntfMD, WSDLDoc);
    //Add Imports
    if (WeImport in FWSDLElements) or (WeServiceImpl in FWSDLElements) then
      if (FImportNames.Count = FImportLocation.Count) then
        AddImports(IntfMD, WSDLDoc);
    //Add WSDL Message and its parts
    if ((weMessage in FWSDLElements) or (weServiceIntf in FWSDLElements) ) then
      AddMessages(IntfMD, WSDLDoc);
    //Add WSDL PortType and its Operations
    if ((wePortType in FWSDLElements) or (weServiceIntf in FWSDLElements) ) then
      AddPortTypes(IntfMD, WSDLDoc);
    //Add WSDL Binding for operations
    if (WeBinding in FWSDLElements) or (weServiceIntf in FWSDLElements) then
      AddBinding(IntfMD, WSDLDoc);
    //Add WSDL Service and its port
    if (WeService in FWSDLElements) or (WeServiceImpl in FWSDLElements) then
      AddServices(IntfMD, WSDLDoc, PortNames, Locations);
  end;

end;

procedure TWebServExp.AddImports(const IntfMD: TIntfMetaData; WSDLDoc: IWSDLDocument);
var
  Imports: IImports;
  Index: Integer;
begin

  Imports := WSDLDoc.Definition.Imports;

  for Index := 0 to FImportNames.Count -1 do
    Imports.Add(FImportNames.Strings[Index], FImportLocation.Strings[Index]);
end;


procedure TWebServExp.AddMessages(const IntfMD: TIntfMetaData; WSDLDoc: IWSDLDocument);
var
  IntfMethArray: TIntfMethEntryArray;
  ParamArray: TIntfParamEntryArray;
  Methods, Params, NoOfMethods, NoOfParams: Integer;
  ParamType: string;
  Messages: IMessages;
  NewMessage: IMessage;
  Parts: IParts;
  MethodExtName, ParamExtName: WideString;
begin

  IntfMethArray := nil;
  ParamArray    := nil;
  IntfMethArray := IntfMD.MDA;
  NoOfMethods   := Length(IntfMethArray);

  //Add WSDL Message and its parts
  Messages := WSDLDoc.Definition.Messages;

  for Methods := 0 to NoOfMethods -1 do
  begin
    ParamArray := IntfMD.MDA[Methods].Params;
    NoOfParams := Length(ParamArray);

    //Add InOut parts
    MethodExtName := InvRegistry.GetMethExternalName(IntfMD.Info, IntfMD.MDA[Methods].Name);
    NewMessage := Messages.Add(MethodExtName + SRequest);
    Parts := NewMessage.Parts;
    for Params := 0 to NoOfParams -2 do
    begin
      if not (pfOut in ParamArray[Params].Flags) then
      begin
        ParamType := GetXMLSchemaType(ParamArray[Params].Info);
        ParamExtName := InvRegistry.GetParamExternalName(IntfMD.Info, MethodExtName, ParamArray[Params].Name);
        Parts.Add(ParamExtName,'',ParamType);
      end;
    end;

    //Add Out parts
    NewMessage := Messages.Add(MethodExtName + SResponse);
    Parts := NewMessage.Parts;
    for Params := 0 to NoOfParams -2 do
      begin
        if ( (pfOut in ParamArray[Params].Flags) or (pfVar in ParamArray[Params].Flags) ) then
        begin
          ParamType := GetXMLSchemaType(ParamArray[Params].Info);
          ParamExtName := InvRegistry.GetParamExternalName(IntfMD.Info, MethodExtName, ParamArray[Params].Name);
          Parts.Add(ParamExtName,'',ParamType);
        end;
      end;

    //For Functions creat a response
    if IntfMD.MDA[Methods].ResultInfo <> nil then
    begin
      ParamType := GetXMLSchemaType(IntfMD.MDA[Methods].ResultInfo);
      Parts.Add(SReturn,'',ParamType);
    end;
  end;

end;


procedure TWebServExp.AddPortTypes(const IntfMD: TIntfMetaData; WSDLDoc: IWSDLDocument);
var
  IntfMethArray: TIntfMethEntryArray;
  ParamArray: TIntfParamEntryArray;
  Methods, Params, NoOfMethods, NoOfParams: Integer;
  PortTypes: IPortTypes;
  PortType: IPortType;
  Operations: IOperations;
  PortExtName, MethodExtName: WideString;
  HasOut: Boolean;
begin

  //Add WSDL PortType and its Operations
  IntfMethArray := nil;
  ParamArray    := nil;
  IntfMethArray := IntfMD.MDA;
  NoOfMethods   := Length(IntfMethArray);

  PortTypes := WSDLDoc.Definition.PortTypes;
  PortExtName := InvRegistry.GetInterfaceExternalName(IntfMD.Info,'',IntfMD.Name);
  PortType := PortTypes.Add(PortExtName);

  for Methods := 0 to NoOfMethods -1 do
  begin
    Operations := PortType.Operations;

    HasOut := False;
    ParamArray := IntfMD.MDA[Methods].Params;
    NoOfParams := Length(ParamArray);

    for Params := 0 to NoOfParams -2 do
    begin
      if ((pfOut in ParamArray[Params].Flags) or (pfVar in ParamArray[Params].Flags)) then
        HasOut := True;
    end;

    if ( (IntfMD.MDA[Methods].ResultInfo <> nil) or HasOut ) then
    begin
      MethodExtName := InvRegistry.GetMethExternalName(IntfMD.Info, IntfMD.MDA[Methods].Name);
      Operations.Add(MethodExtName, MethodExtName+ SRequest, '', MethodExtName+ SResponse);
    end
    else
    begin
      MethodExtName := InvRegistry.GetMethExternalName(IntfMD.Info, IntfMD.MDA[Methods].Name);
      Operations.Add(MethodExtName,MethodExtName+ SRequest, '', '');
    end;

  end;

end;


procedure TWebServExp.AddBinding(const IntfMD: TIntfMetaData; WSDLDoc: IWSDLDocument);
var
  IntfMethArray: TIntfMethEntryArray;
  Methods, NoOfMethods: Integer;
  Bindings: IBindings;
  Binding: IBinding;
  BindOperations: IBindingOperations;
  NewBindOperation: IBindingOperation;
  NewNode, SoapBodyNode: IXMLNode;
  PortExtName, MethodExtName: WideString;
begin

  //Add WSDL Binding and its Operations
  IntfMethArray := nil;
  IntfMethArray := IntfMD.MDA;
  NoOfMethods   := Length(IntfMethArray);

  Bindings := WSDLDoc.Definition.Bindings;
  PortExtName := InvRegistry.GetInterfaceExternalName(IntfMD.Info,'',IntfMD.Name);
  Binding := Bindings.Add(PortExtName+SBinding,PortExtName);

  //Add Binding specific elements
  if FBindingType = btSoap then
  begin
    //Add soap:binding
    NewNode := Binding.AddChild(SWSDLSoapBinding);
    NewNode.Attributes[SStyle] := 'rpc';
    NewNode.Attributes[STransport] := SSoapHTTPTransport;
  end;


  for Methods := 0 to NoOfMethods -1 do
  begin
    BindOperations := Binding.BindingOperations;
    MethodExtName := InvRegistry.GetMethExternalName(IntfMD.Info, IntfMD.MDA[Methods].Name);
    NewBindOperation := BindOperations.Add(MethodExtName);

    if FBindingType = btSoap then
    begin
      //Add soap:operation
      NewNode := NewBindOperation.AddChild(SWSDLSoapOperation);
      NewNode.Attributes[SSoapAction] := InvRegistry.GetNamespaceByGUID(IntfMD.IID) + '#' + MethodExtName;
      //NewNode.Attributes[SStyle] := 'rpc';
    end;

    //Add input/output
    NewNode := NewBindOperation.AddChild(SInput);
    if FBindingType = btSoap then
    begin
      SoapBodyNode := NewNode.AddChild(SWSDLSoapBody);
      //SoapBodyNode.Attributes[SParts] := '';
      SoapBodyNode.Attributes[SUse] := SSoapBodyUseEncoded;
      SoapBodyNode.Attributes[SEncodingStyle] := SSoap11EncodingS5;
      SoapBodyNode.Attributes[SNameSpace] := InvRegistry.GetNamespaceByGUID(IntfMD.IID);

      if IntfMD.MDA[Methods].ResultInfo <> nil  then
      begin
        NewNode := NewBindOperation.AddChild(SOutput);
        SoapBodyNode := NewNode.AddChild(SWSDLSoapBody);
        //SoapBodyNode.Attributes[SParts] := '';
        SoapBodyNode.Attributes[SUse] :=  SSoapBodyUseEncoded;
        SoapBodyNode.Attributes[SEncodingStyle] :=  SSoap11EncodingS5;
        SoapBodyNode.Attributes[SNameSpace] := InvRegistry.GetNamespaceByGUID(IntfMD.IID);
      end;
    end;

    //Add soap:body
    //Add soap:Header
    //Add soap:Fault

  end;

end;


procedure TWebServExp.AddServices(const IntfMD: TIntfMetaData; WSDLDoc: IWSDLDocument; PortNames: array of WideString; Locations: array of WideString);
var
  Services: IServices;
  NewService: IService;
  NewPort: IPort;
  NewNode: IXMLNode;
  I: Integer;
  PortExtName: WideString;
begin

  Services := WSDLDoc.Definition.Services;
  PortExtName := InvRegistry.GetInterfaceExternalName(IntfMD.Info,'',IntfMD.Name);
  NewService := Services.Add(PortExtName + SService);
  for I := 0 to Length(Locations) - 1 do
  begin
    NewPort := NewService.Ports.Add(PortNames[I], PortExtName+SBinding);
    NewNode := NewPort.AddChild(SWSDLSoapAddress);
    NewNode.Attributes[SLocation] := Locations[I];
  end;
end;


procedure TWebServExp.AddTypes(const IntfMD: TIntfMetaData; WSDLDoc: IWSDLDocument);
var
  NewNode: IXMLNode;
  Xsd: IXMLSchemaDoc;
  Index, Count: Integer;
  UniqueURI: TWideStrings;
begin

  //Collect all schema types to be generated
  GetAllSchemaTypes(IntfMD);
  if  Length(SchemaArray) > 0 then
  begin
    UniqueURI := TWideStrings.Create;
    try
      //Get Unique URI's and namespace prefix
      for Index := 0 to Length(SchemaArray) -1 do
      begin
        if ( UniqueURI.IndexOf(SchemaArray[Index].NameSpace)= -1 ) then
          UniqueURI.Add(SchemaArray[Index].NameSpace);
        SchemaArray[Index].NSPrefix := GetPrefixForURI(Definition, SchemaArray[Index].NameSpace);
      end;

      NewNode := WSDLDoc.Definition.AddChild(STypes);
      //Add seperate schema nodes for each unique URI
      for Count := 0 to UniqueURI.Count -1  do
      begin
        Xsd := NewXmlSchema;
        Xsd.SchemaDef.Attributes[STns] := UniqueURI.Strings[Count];
        for Index := 0 to Length(SchemaArray) -1 do
          GenerateXMLSchema(Xsd, SchemaArray[Index].TypeInfo, nil, UniqueURI.Strings[Count]);
        NewNode.ChildNodes.Add(Xsd.DocumentElement.CloneNode(True));
      end;
    finally
      UniqueURI.Free;
    end;
  end;

end;


// Consider TOrdType and TFloatType subtypes of tkInteger and tkFloat...
// share with TypeTrans.pas ??
function TWebServExp.GetXMLSchemaType(const ParamTypeInfo: PTypeInfo ):string;
var
  TypeName, URI, Prefix: WideString;
begin

  Prefix := '';
  case ParamTypeInfo^.Kind of
  tkClass, tkDynArray, tkEnumeration, tkSet:
    begin
      URI := SXMLSchemaURI_2000_10;
      RemTypeRegistry.TypeInfoToXSD(ParamTypeInfo, URI , TypeName);
      if TypeName = '' then
      begin
        URI := SXMLSchemaURI_1999;
        RemTypeRegistry.TypeInfoToXSD(ParamTypeInfo, URI , TypeName);
      end;

      if ((URI <> SXMLSchemaURI_2000_10) and (URI <> SXMLSchemaURI_1999) and (URI <> SXMLSchemaURI_2001))  then
      begin
        Prefix := GetPrefixForTypeInfo(ParamTypeInfo);
        if Prefix <> '' then
          //Result := FNameSpace + ParamTypeInfo^.Name;
          Result := Prefix + ':' + ParamTypeInfo^.Name
        else
          Result := ParamTypeInfo^.Name;
      end
      else
      begin
        //Always get the prefix for 2001 XMLSchema
        URI := SXMLSchemaURI_2001;
        Prefix := GetPrefixForURI(Definition, URI);
        if Prefix <> '' then
          Result := Prefix + ':' + TypeName
        else
          Result := TypeName;
      end;

      bHasComplexTypes := True;
    end;
  tkVariant:
  begin
    //Always get the prefix for 2001 XMLSchema
    URI := SXMLSchemaURI_2001;
    Prefix := GetPrefixForURI(Definition, URI);
    if Prefix <> '' then
      Result := Prefix + ':' + SAnySimpleType
    else
      Result := SAnySimpleType;
  end
  else
    //Scalar types
    URI := SXMLSchemaURI_2000_10;
    RemTypeRegistry.TypeInfoToXSD(ParamTypeInfo, URI , TypeName);
    if TypeName = '' then
    begin
      URI := SXMLSchemaURI_1999;
      RemTypeRegistry.TypeInfoToXSD(ParamTypeInfo, URI , TypeName);
    end;

    //Always get the prefix for 2001 XMLSchema
    URI := SXMLSchemaURI_2001;
    if TypeName <> '' then
    begin
      Prefix := GetPrefixForURI(Definition, URI);
      if Prefix <> '' then
        Result := Prefix + ':' + TypeName
      else
        Result := TypeName;
    end
    else
      Result := SUnknown;

  end;

end;


function TWebServExp.IsComplexType(const ParamType: TTypeKind ):Boolean;
begin
  case ParamType of
    tkClass, tkDynArray, tkEnumeration, tkSet: Result := True;
  else
    Result := False;
  end;

end;


function TWebServExp.GetPrefixForURI(Def: IDefinition; URI: WideString): WideString;
var
  NameSpaceNode: IXMLNode;
begin

  Result := '';
  if Definition <> nil then
  begin
    NamespaceNode := Def.FindNamespaceDecl(URI);
    if NamespaceNode <> nil then
    begin
      Result := NamespaceNode.LocalName;
      exit;
    end;
    Result := AddNamespaceURI(Def as IXMLNode, URI);
  end;

end;


function TWebServExp.GetPrefixForURI(RootNode: IXMLSchemaDoc; URI: WideString): WideString;
var
  NameSpaceNode: IXMLNode;
begin

  Result := '';
  //Check if the XMLSchema root has it
  NamespaceNode := RootNode.SchemaDef.FindNamespaceDecl(URI);
  if NamespaceNode <> nil then
  begin
    Result := NamespaceNode.LocalName;
    exit;
  end
  else
  begin
    //Check if its a WSDL and if the root has it
    if Definition <> nil then
    begin
      NamespaceNode := Definition.FindNamespaceDecl(URI);
      if NamespaceNode <> nil then
      begin
        Result := NamespaceNode.LocalName;
        exit;
      end
      else
        Result := AddNamespaceURI(Definition as IXMLNode, URI);
    end
    else
      Result := AddNamespaceURI(RootNode.SchemaDef as IXMLNode, URI);
  end;

end;


function TWebServExp.AddNamespaceURI(RootNode: IXMLNode; URI: WideString): WideString;
begin
  Result := RootNode.OwnerDocument.GeneratePrefix(RootNode);
  RootNode.DeclareNamespace(Result, URI);
end;


function TWebServExp.GetNodeNameForURI(RootNode: IXMLSchemaDoc; URI: WideString): WideString;
var
  NameSpaceNode: IXMLNode;
begin

  Result := '';
  //Check if the XMLSchema root has it
  NamespaceNode := RootNode.SchemaDef.FindNamespaceDecl(URI);
  if NamespaceNode <> nil then
  begin
    Result := NamespaceNode.NodeName;
    exit;
  end
  else
  begin
    //Check if its a WSDL and if the root has it
    if Definition <> nil then
    begin
      NamespaceNode := Definition.FindNamespaceDecl(URI);
      if NamespaceNode <> nil then
        Result := NamespaceNode.NodeName;
    end;
  end;

end;


procedure TWebServExp.GenerateDerivedClassSchema(RootNode: IXMLSchemaDoc; const ParentTypeInfo: PTypeinfo; Namespace:WideString);
var
  Count, Index: Integer;
  RegEntry: TRemRegEntry;
begin

  Count := RemClassRegistry.GetURICount;
  for Index := 0 to Count -1 do
  begin
    RegEntry := RemClassRegistry.GetURIMap(Index);
    if RegEntry.ClassType <> nil then
    begin
      if RegEntry.ClassType.InheritsFrom(GetTypeData(ParentTypeInfo).ClassType)
       and (RegEntry.ClassType <> GetTypeData(ParentTypeInfo).ClassType) then
      begin
        GenerateXMLSchema(RootNode, RegEntry.Info, ParentTypeInfo, Namespace);
      end;
    end;
  end;

end;


procedure GetPropInfosInternal(TypeInfo: PTypeInfo; PropList: PPropList); assembler;
asm
        { ->    EAX Pointer to type info        }
        {       EDX Pointer to prop list        }
        { <-    nothing                         }

        PUSH    EBX
        PUSH    ESI
        PUSH    EDI

        XOR     ECX,ECX
        MOV     ESI,EAX
        MOV     CL,[EAX].TTypeInfo.Name.Byte[0]
        MOV     EDI,EDX
        XOR     EAX,EAX
        MOVZX   ECX,[ESI].TTypeInfo.Name[ECX+1].TTypeData.PropCount
        REP     STOSD

@outerLoop:
        MOV     CL,[ESI].TTypeInfo.Name.Byte[0]
        LEA     ESI,[ESI].TTypeInfo.Name[ECX+1]
        MOV     CL,[ESI].TTypeData.UnitName.Byte[0]
        MOVZX   EAX,[ESI].TTypeData.UnitName[ECX+1].TPropData.PropCount
        TEST    EAX,EAX
        JE      @parent
        LEA     EDI,[ESI].TTypeData.UnitName[ECX+1].TPropData.PropList

@innerLoop:

        MOVZX   EBX,[EDI].TPropInfo.NameIndex
        MOV     CL,[EDI].TPropInfo.Name.Byte[0]
        CMP     dword ptr [EDX+EBX*4],0
        JNE     @alreadySet
        MOV     [EDX+EBX*4],EDI

@alreadySet:
        LEA     EDI,[EDI].TPropInfo.Name[ECX+1]
        DEC     EAX
        JNE     @innerLoop

@parent:
@exit:
        POP     EDI
        POP     ESI
        POP     EBX
end;


function GetPropListInternal(TypeInfo: PTypeInfo; out PropList: PPropList): Integer;
begin
  Result := GetTypeData(TypeInfo)^.PropCount;
  if Result > 0 then
  begin
    GetMem(PropList, Result * SizeOf(Pointer));
    FillChar(PropList^, Result * SizeOf(Pointer), 0);
    GetPropInfosInternal(TypeInfo, PropList);
  end;
end;


procedure TWebServExp.GenerateClassSchema(RootNode: IXMLSchemaDoc; const ObjectTypeInfo, ParentInfo: PTypeinfo; Namespace: WideString);
var
  Size, Props: integer;
  PropList: PPropList;
  ComplexType: IXMLComplexTypeDef;
  ElementType: IXMLElementDef;
  ParamType: string;
  BaseName, Pre: WideString;
begin

  Size := GetPropListInternal(ObjectTypeInfo, PropList);
  if Size > 0 then
  begin
    try
      if ParentInfo <> nil then
      begin
        Pre := GetPrefixForTypeInfo(ParentInfo);
        if Pre <> '' then
          BaseName := Pre + ':' +  ParentInfo.Name
        else
          BaseName := ParentInfo.Name;
        ComplexType := RootNode.SchemaDef.ComplexTypes.Add(ObjectTypeInfo.Name, BaseName)
      end else
        ComplexType := RootNode.SchemaDef.ComplexTypes.Add(ObjectTypeInfo.Name);

      for Props := 0 to Size -1 do
      begin
        if PropList[Props] <> nil then
        begin
          ParamType := GetXMLSchemaType(PropList[Props].PropType^);
          ElementType := ComplexType.ElementDefs.Add(PropList[Props].Name, ParamType);
          if IsComplexType(PropList[Props].PropType^.Kind) then
            GenerateXMLSchema(RootNode, PropList[Props].PropType^, nil, Namespace);
        end;
      end;
    finally
      FreeMem(PropList);
    end;
  end; //Size > 0

end;


procedure TWebServExp.GenerateEnumSchema(RootNode: IXMLSchemaDoc; const ObjectTypeInfo: PTypeinfo; Namespace: WideString);
var
  SimpleType: IXMLSimpleTypeDef;
  TypeData: PTypeData;
  Index: Integer;
  Value: string;
begin

  TypeData := GetTypeData(ObjectTypeInfo);
  if TypeData <> nil then
  begin
    SimpleType := RootNode.SchemaDef.SimpleTypes.Add(ObjectTypeInfo.Name, 'string');
    for Index := 0 to TypeData.MaxValue do
    begin
      Value := GetEnumName(ObjectTypeInfo, Index );
      SimpleType.Enumerations.Add(Value);
    end;
  end;

end;


procedure TWebServExp.GenerateArraySchema(RootNode: IXMLSchemaDoc; const ObjectTypeInfo: PTypeinfo; Namespace: WideString);
var
  ComplexType: IXMLComplexTypeDef;
  ElementType: IXMLElementDef;
  ElementTypeInfo: PTypeinfo;
  I, Dimensions: integer;
  ParamType, ArrayElementName: string;
  ArrayType: string;
  Prefix, SoapEncPrefix: WideString;
  AttrDef: IXMLAttributeDef;
  DimString, ArrayName, TempName: string;
begin

  if FArrayAsComplexContent then
  begin
    ElementTypeInfo := GetDynArrayNextInfo2(ObjectTypeInfo, ArrayName);
    Dimensions := 1;
    while (ElementTypeInfo <> nil) and  (ElementTypeInfo.Kind = tkDynArray ) and (ElementTypeInfo.Name[1] = '.') do
    begin
      Inc(Dimensions);
      ElementTypeInfo := GetDynArrayNextInfo2(ElementTypeInfo, TempName);
    end;
    if (ElementTypeInfo = nil) or (ElementTypeInfo.Name[1] = '.') then
      GetDynArrayElTypeInfo(ObjectTypeInfo, ElementTypeInfo, Dimensions);
    {
    if (ElementTypeInfo.Kind = tkDynArray) and (ArrayName <> '') and (ArrayName[1] <> '.') then
      GenerateArraySchema(RootNode, ElementTypeInfo, Namespace);
    if (ElementTypeInfo.Kind = tkClass) or (ElementTypeInfo.Kind = tkEnumeration) then
      GenerateXMLSchema(RootNode, ElementTypeInfo, nil, Namespace);
    }
    ParamType := GetXMLSchemaType(ElementTypeInfo);
    ArrayType := SArrayOf + ParamType;
    //Get Soap Encoding prefix
    SoapEncPrefix := GetPrefixForURI(RootNode,  SSoap11EncodingS5);
    ComplexType := RootNode.SchemaDef.ComplexTypes.Add(ObjectTypeInfo.Name, SoapEncPrefix + ':' + SSoapEncodingArray, dmComplexRestriction);
    AttrDef:= ComplexType.AttributeDefs.Add(SoapEncPrefix + ':'+ SArrayType);
    //Get WSDL URI prefix
    Prefix := GetNodeNameForURI(RootNode, Wsdlns);
    for I := 0 to Dimensions -1 do
      DimString := DimString + '[]';
    AttrDef.Attributes['n1'+':'+SArrayType] := ParamType + DimString;
    AttrDef.Attributes[Prefix+':'+'n1'] := Wsdlns;
  end
  else
  begin
    GetDynArrayElTypeInfo(ObjectTypeInfo, ElementTypeInfo, Dimensions);
    ParamType := GetXMLSchemaType(ElementTypeInfo);
    ArrayType := SArrayOf + ParamType;
    ElementType := RootNode.SchemaDef.ElementDefs.Add(ObjectTypeInfo.Name, True, SSoapArray);
    ComplexType := ElementType.DataType as IXMLComplexTypeDef;
    ComplexType.Attributes[SName] := ArrayType;

    if Dimensions > 1  then
      GenerateNestedArraySchema(RootNode, ComplexType, ElementTypeInfo, Dimensions, Namespace)
    else
    begin
      ArrayElementName := 'Dimension' + IntToStr(Dimensions);
      ParamType := GetXMLSchemaType(ElementTypeInfo);
      ElementType := ComplexType.ElementDefs.Add(ArrayElementName, ParamType);
      ElementType.Attributes[SMaxOccurs] := SUnbounded;

      if IsComplexType(ElementTypeInfo.Kind) then
        GenerateXMLSchema(RootNode, ElementTypeInfo, nil, Namespace);
    end;
  end;

end;


procedure TWebServExp.GenerateNestedArraySchema(RootNode: IXMLSchemaDoc; ComplexType: IXMLComplexTypeDef; const ObjectTypeInfo: PTypeinfo; var Dimension: Integer; Namespace: WideString);
var
  ParamType: string;
  ArrayElementName: String;
  ElementType: IXMLElementDef;
  NestedType: IXMLComplexTypeDef;
begin

  while Dimension <> 0 do
  begin
    if Dimension > 1  then
    begin
      ArrayElementName := 'Dimension' + IntToStr(Dimension);
      ElementType := ComplexType.ElementDefs.Add(ArrayElementName, True);
      ElementType.Attributes[SMaxOccurs] := SUnbounded;
      NestedType := ElementType.DataType as IXMLComplexTypeDef;
      Dimension := Dimension -1;
      GenerateNestedArraySchema(RootNode, NestedType, ObjectTypeInfo, Dimension, Namespace);
    end
    else
    begin
      ArrayElementName := 'Dimension' + IntToStr(Dimension);
      ParamType := GetXMLSchemaType(ObjectTypeInfo);
      ElementType := ComplexType.ElementDefs.Add(ArrayElementName, ParamType);
      ElementType.Attributes[SMaxOccurs] := SUnbounded;
      Dimension := Dimension -1;

      if IsComplexType(ObjectTypeInfo.Kind) then
        GenerateXMLSchema(RootNode, ObjectTypeInfo, nil, Namespace);
    end;
  end; //while

end;


procedure TWebServExp.GenerateXMLSchema(RootNode: IXMLSchemaDoc; const ObjectTypeInfo, ParentInfo: PTypeinfo; Namespace: WideString);
var
  TempURI, TempName: WideString;
  AncInfo: PTypeInfo;
begin

  if  IsComplexType(ObjectTypeInfo.Kind) then
  begin
    if (not IsSchemaGenerated(ObjectTypeInfo, Namespace)) then
    begin
      case ObjectTypeInfo.Kind  of
        tkDynArray:   GenerateArraySchema(RootNode,ObjectTypeInfo, NameSpace);
        tkEnumeration:  GenerateEnumSchema(RootNode,ObjectTypeInfo, NameSpace);
        tkClass:
          begin
            if (ParentInfo = nil) and ( (GetTypeData(ObjectTypeInfo).ParentInfo)^ <> nil) then
            begin
              AncInfo := (GetTypeData(ObjectTypeInfo).ParentInfo)^;
              if (AncInfo <> nil) and not RemTypeRegistry.TypeInfoToXSD(AncInfo, TempURI , TempName) then
                AncInfo := nil;
              if (AncInfo <> nil) and (GetTypeData(AncInfo).ClassType = TRemotable) then
                AncInfo := nil;
            end else
              AncInfo := ParentInfo;

            GenerateClassSchema(RootNode,ObjectTypeInfo, AncInfo, Namespace);
            //Generate XML Schema for registered derived classes
            GenerateDerivedClassSchema(RootNode, ObjectTypeInfo, Namespace);
          end;
      end;
    end;
  end;

end;


procedure TWebServExp.GetAllSchemaTypes(const IntfMD: TIntfMetaData);
var
  Methods, Params, NoOfMethods, NoOfParams: Integer;
  IntfMethArray: TIntfMethEntryArray;
  ParamArray: TIntfParamEntryArray;
begin

  IntfMethArray := nil;
  ParamArray    := nil;
  IntfMethArray := IntfMD.MDA;
  NoOfMethods   := Length(IntfMethArray);

  for Methods := 0 to NoOfMethods -1 do
  begin
    ParamArray := IntfMD.MDA[Methods].Params;
    NoOfParams := Length(ParamArray);

    for Params := 0 to NoOfParams -2 do
    begin
      if IsComplexType(ParamArray[Params].Info.Kind) then
        GetSchemaTypes(ParamArray[Params].Info, nil);
    end;

    //For Function return type
    if IntfMD.MDA[Methods].ResultInfo <> nil  then
    begin
      //If the return type is an object
      if IsComplexType(IntfMD.MDA[Methods].ResultInfo.Kind) then
        GetSchemaTypes(IntfMD.MDA[Methods].ResultInfo, nil);
    end;
  end;

end;


procedure TWebServExp.GetDerivedClassSchema(const ParentTypeInfo: PTypeinfo);
var
  Count, Index: Integer;
  RegEntry: TRemRegEntry;
begin

  Count := RemClassRegistry.GetURICount;
  for Index := 0 to Count -1 do
  begin
    RegEntry := RemClassRegistry.GetURIMap(Index);
    if RegEntry.ClassType <> nil then
    begin
      if RegEntry.ClassType.InheritsFrom(GetTypeData(ParentTypeInfo).ClassType) then
        GetSchemaTypes(RegEntry.Info, ParentTypeInfo);
    end;
  end;

end;


function TWebServExp.FindSchema(const ObjectTypeInfo: PTypeinfo; const TnsURI: string): Boolean;
var
  Index: Integer;
begin

  Result := False;

  //Do not register Empty TnsURI or tkSet or any predefined type from XMLSchema
  if ((TnsURI = '') or (ObjectTypeInfo.Kind = tkSet) or (TnsURI = SXMLSchemaURI_1999) or  (TnsURI = SXMLSchemaURI_2000_10) or
    (TnsURI = SXMLSchemaURI_2001))  then
  begin
    Result := True;
    Exit;
  end;

  for Index := 0 to Length(SchemaArray) -1 do
  begin
    if SchemaArray[Index].TypeInfo = ObjectTypeInfo then
    begin
      Result := True;
      Exit;
    end;
  end;

  //Add new type
  Index := Length(SchemaArray);
  SetLength(SchemaArray, Index+1);
  SchemaArray[Index].TypeName := ObjectTypeInfo.Name;
  SchemaArray[Index].NameSpace := TnsURI;
  SchemaArray[Index].TypeInfo := ObjectTypeInfo;
  SchemaArray[Index].XSGenerated := False;
end;


function TWebServExp.IsSchemaGenerated(const ObjectTypeInfo: PTypeinfo; const TnsURI: WideString): Boolean;
var
  Index: Integer;
begin

  Result := True;
  for Index := 0 to Length(SchemaArray) -1 do
  begin
    if ((SchemaArray[Index].TypeInfo = ObjectTypeInfo) and
      (SchemaArray[Index].NameSpace = TnsURI) ) then
    begin
      if  SchemaArray[Index].XSGenerated = False then
      begin
        Result := False;
        SchemaArray[Index].XSGenerated := True;
      end
      else
        Result := True;
      Exit;
    end;
  end;

end;


function  TWebServExp.GetPrefixForTypeInfo(const ObjectTypeInfo: PTypeinfo): WideString;
var
  Index: Integer;
begin

  Result := '';
  for Index := 0 to Length(SchemaArray) -1 do
  begin
    if (SchemaArray[Index].TypeInfo = ObjectTypeInfo) then
    begin
      Result := SchemaArray[Index].NSPrefix;
      exit;
    end;
  end;

end;


procedure TWebServExp.GetSchemaTypes(const ObjectTypeInfo, ParentInfo: PTypeinfo);
var
  URI, Name: WideString;
  IsScalar: Boolean;
begin

  if  IsComplexType(ObjectTypeInfo.Kind) then
  begin
    RemClassRegistry.InfoToURI(ObjectTypeInfo, URI, Name, IsScalar);
    //Add to the SchemaArray to keep track of what complex type has
    //already been encountered
    if (not FindSchema(ObjectTypeInfo, URI)) then
    begin
      case ObjectTypeInfo.Kind  of
        tkDynArray:  GetArraySchema(ObjectTypeInfo);
        //tkEnumeration:  GenerateEnumSchema(RootNode,ObjectTypeInfo);
        tkClass:
          begin
            GetClassSchema(ObjectTypeInfo, ParentInfo);
            //Get all the registered derived classes
            GetDerivedClassSchema(ObjectTypeInfo);
          end;
      end;
    end;
  end;

end;


procedure TWebServExp.GetClassSchema(const ObjectTypeInfo, ParentInfo: PTypeinfo);
var
  Size, Props: integer;
  PropList: PPropList;
begin

  Size := GetPropList(ObjectTypeInfo, [tkUnknown..tkDynArray], nil);
  if Size > 0 then
  begin
    PropList := AllocMem(sizeof(TPropInfo) * Size);
    try
      Size := GetPropList(ObjectTypeInfo, PropList);
      for Props := 0 to Size -1 do
      begin
        if IsComplexType(PropList[Props].PropType^.Kind) then
          GetSchemaTypes(PropList[Props].PropType^, nil);
      end;
    finally
      FreeMem(PropList);
    end;
  end; //Size > 0

end;


procedure TWebServExp.GetArraySchema(const ObjectTypeInfo: PTypeinfo);
var
  ElementTypeInfo: PTypeInfo;
  Dimensions: Integer;
  ArrayName, TempName: String;
begin

  ElementTypeInfo := GetDynArrayNextInfo2(ObjectTypeInfo, ArrayName);
  Dimensions := 1;
  while (ElementTypeInfo <> nil) and  (ElementTypeInfo.Kind = tkDynArray ) and (ElementTypeInfo.Name[1] = '.') do
  begin
    Inc(Dimensions);
    ElementTypeInfo := GetDynArrayNextInfo2(ElementTypeInfo, TempName);
  end;
  if (ElementTypeInfo = nil) or (ElementTypeInfo.Name[1] = '.') then
    GetDynArrayElTypeInfo(ObjectTypeInfo, ElementTypeInfo, Dimensions);

  if (ElementTypeInfo.Kind = tkDynArray) and (ArrayName <> '') and (ArrayName[1] <> '.') then
    GetSchemaTypes(ElementTypeInfo, nil);
  if (ElementTypeInfo.Kind = tkClass) or (ElementTypeInfo.Kind = tkEnumeration) then
    GetSchemaTypes(ElementTypeInfo, nil);
  {
  GetDynArrayElTypeInfo(ObjectTypeInfo, ElementTypeInfo, Dim);
  if ElementTypeInfo <> nil then
    GetSchemaTypes(ElementTypeInfo, nil);
  }
end;

initialization

finalization
end.
