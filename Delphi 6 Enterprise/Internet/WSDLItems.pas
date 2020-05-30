
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{       WSDL Items                                      }
{                                                       }
{   Copyright (c) 2001 Borland Software Corporation     }
{                                                       }
{*******************************************************}

unit WSDLItems;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, TypInfo, XMLIntf, XMLDoc,
  xmldom, XmlSchema, MSXMLDOM, WSDLIntf, WSDLBind;

type

{ Helper class to get WSDL Items }
TWSDLItems = class(TWSDLDocument)
  private
    { Helper methods to Import WSDL documents }
    procedure ImportServices(const WSDLDoc: IWSDLDocument; ServiceNames: TWideStrings);
    procedure ImportPortTypes(const WSDLDoc: IWSDLDocument; PortTypeNames: TWideStrings);
    procedure ImportPortsForService(const WSDLDoc: IWSDLDocument; const ServiceName: WideString; PortNames: TWideStrings);
    function  ImportBindingForServicePort(const WSDLDoc: IWSDLDocument; const ServiceName, PortName: WideString): WideString;
    function  ImportSoapAddressForServicePort(const WSDLDoc: IWSDLDocument; const ServiceName, PortName: WideString): WideString;
    function  ImportSoapBodyAttribute(const WSDLDoc: IWSDLDocument; const BindingName,Operation, IOType, Attribute: WideString): WideString;
    function  ImportSoapOperationAttribute(const WSDLDoc: IWSDLDocument; const BindingName,Operation, Attribute: WideString): WideString;
    function  ImportSoapBodyNamespace(const WSDLDoc: IWSDLDocument; const BindingPortType: WideString): WideString;
    procedure ImportPartsForOperation(const WSDLDoc: IWSDLDocument; const PortTypeName, OperationName: WideString; OperationIndex: Integer; PartNames: TWideStrings);

  public
    {Helper methods to get WSDL Items}
    function  GetName: WideString;
    function  GetTargetNamespace: WideString;
    procedure GetServices(ServiceNames: TWideStrings);
    function  GetServiceNode(const ServiceName: WideString): IXMLNode;
    procedure GetMessages(MessageNames: TWideStrings);
    function  GetMessageNode(const MessageName: WideString): IXMLNode;
    procedure GetParts(const MessageName: WideString; PartNames: TWideStrings);
    function  GetPartNode(const MessageName, PartName: WideString): IXMLNode;
    procedure GetPortTypes(PortTypeNames: TWideStrings);
    function  GetPortTypeNode(const PortTypeName: WideString): IXMLNode;
    procedure GetOperations(const PortTypeName: WideString; OperationNames: TWideStrings);
    function  GetOperationNode(const PortTypeName, OperationName: WideString): IXMLNode;
    procedure GetInOutMessagesForOperation(const PortTypeName, OperationName: WideString; OperationIndex: Integer; InOutMessages: TWideStrings);
    procedure GetPortsForService(const ServiceName: WideString; PortNames: TWideStrings);
    function  GetBindingForServicePort(const ServiceName, PortName: WideString): WideString;
    function  GetSoapAddressForServicePort(const ServiceName, PortName: WideString): WideString;
    procedure GetImports(ImportNames: TWideStrings);
    function  GetLocationForImport(const ImportNameSpace: WideString): WideString;
    function  HasTypesNode: Boolean;
    procedure GetSchemas(SchemaNames: TWideStrings);
    function  GetSchemaNode(const SchemaTns: WideString) : IXMLNode;
    procedure GetBindings(BindingNames: TWideStrings);
    function  GetBindingType(const BindingName: WideString): WideString;
    function  GetSoapBindingAttribute(const BindingName: WideString; Attribute: WideString): WideString;
    procedure GetOperationsForBinding(const BindingName: WideString; OperationNames: TWideStrings);
    function  GetSoapOperationAttribute(const BindingName, Operation, Attribute: WideString): WideString;
    function  GetSoapBodyAttribute(const BindingName, Operation, IOType, Attribute: WideString): WideString;
    function  GetSoapBodyNamespace(const BindingPortType: WideString): WideString;
    procedure GetSoapHeaderAttribute(const BindingName, Operation, IOType, Attribute: WideString; SoapHeaderAttrs: TWideStrings);
    procedure GetSoapFaultsForOperation(const BindingName, Operation: WideString; FaultNames: TWideStrings);
    function  GetSoapFaultAttribute(const BindingName, Operation, FaultName, Attribute: WideString): WideString;
    procedure GetPartsForOperation(const PortTypeName, OperationName: WideString; OperationIndex: Integer; PartNames: TWideStrings);

end;

//Helper functions
function HasDefinition(const WSDLDoc: IWSDLDocument): Boolean;


implementation

function HasDefinition(const WSDLDoc: IWSDLDocument): Boolean;
var
  Index: Integer;
begin

  Result := False;
  for Index := 0 to WSDLDoc.ChildNodes.Count -1 do
  begin
    if WSDLDoc.ChildNodes[Index].NodeName = SDefinitions then
      Result := True;
  end;

end;

{ TWSDLItems implementation }

function TWSDLItems.GetName: WideString;
begin
  Result := Definition.Name;
end;


function TWSDLItems.GetTargetNamespace: WideString;
begin
  Result := Definition.GetTargetNamespace;
end;


procedure TWSDLItems.GetServices(ServiceNames: TWideStrings);
var
  Count, Index: Integer;
  Services: IServices;
  Imports: IImports;
  ImportedWSDLDoc: IWSDLDocument;
begin

  Services := Definition.Services;
  if Services <> nil then
  begin
    for Count:= 0 to Services.Count-1 do
      ServiceNames.Add(Services[Count].Name);
  end;

  //Get any imported WSDL
  Imports := Definition.Imports;
  if Imports <> nil then
  begin
    for Index := 0 to Imports.Count -1 do
    begin
      ImportedWSDLDoc := TWSDLDocument.Create(nil);
      ImportedWSDLDoc.FileName := Imports[Index].Location;
      ImportedWSDLDoc.Active := True;
      if HasDefinition(ImportedWSDLDoc) then
        ImportServices(ImportedWSDLDoc, ServiceNames)
    end;
  end;

end;

procedure TWSDLItems.ImportServices(const WSDLDoc: IWSDLDocument; ServiceNames: TWideStrings);
var
  Count, Index: Integer;
  Services: IServices;
  Imports: IImports;
  ImportedWSDLDoc: IWSDLDocument;
begin

  Services := WSDLDoc.Definition.Services;
  if Services <> nil then
  begin
    for Count:= 0 to Services.Count-1 do
      ServiceNames.Add(Services[Count].Name);
  end;

  //Get any imported WSDL
  Imports := WSDLDoc.Definition.Imports;
  if Imports <> nil then
  begin
    for Index := 0 to Imports.Count -1 do
    begin
      ImportedWSDLDoc := TWSDLDocument.Create(nil);
      ImportedWSDLDoc.FileName := Imports[Index].Location;
      ImportedWSDLDoc.Active := True;
      if HasDefinition(ImportedWSDLDoc) then
        ImportServices(ImportedWSDLDoc, ServiceNames)
    end;
  end;

end;


function TWSDLItems.GetServiceNode(const ServiceName: WideString): IXMLNode;
var
  Count: Integer;
  Services: IServices;
  ServiceNode: IXMLNode;
begin

  Services := Definition.Services;
  for Count:= 0 to Services.Count-1 do
    if (ServiceName = Services[Count].Name) then
    begin
      ServiceNode := Services[Count] as IXMLNode;
      break;
    end;

  Result := ServiceNode;
end;



procedure TWSDLItems.GetPortsForService(const ServiceName: WideString; PortNames: TWideStrings);
var
  I,Index,Count: Integer;
  Services: IServices;
  Ports: IPorts;
  Imports: IImports;
  ImportedWSDLDoc: IWSDLDocument;
begin

  Services := Definition.Services;
  if Services <> nil then
  begin
    for Count := 0 to Services.Count -1 do
      if (ServiceName = Services[Count].Name) then
      begin
        Ports := Services[Count].Ports;
        for I := 0 to Ports.Count-1 do
          PortNames.Add(Ports[I].Name);
      end;
  end;

  //Get any imported WSDL
  Imports := Definition.Imports;
  if Imports <> nil then
  begin
    for Index := 0 to Imports.Count -1 do
    begin
      ImportedWSDLDoc := TWSDLDocument.Create(nil);
      ImportedWSDLDoc.FileName := Imports[Index].Location;
      ImportedWSDLDoc.Active := True;
      if HasDefinition(ImportedWSDLDoc) then
        ImportPortsForService(ImportedWSDLDoc, ServiceName, PortNames)
    end;
  end;

end;


procedure TWSDLItems.ImportPortsForService(const WSDLDoc: IWSDLDocument; const ServiceName: WideString; PortNames: TWideStrings);
var
  I, Index, Count: Integer;
  Services: IServices;
  Ports: IPorts;
  Imports: IImports;
  ImportedWSDLDoc: IWSDLDocument;
begin

  Services := WSDLDoc.Definition.Services;
  if Services <> nil then
  begin
    for Count := 0 to Services.Count -1 do
      if (ServiceName = Services[Count].Name) then
      begin
        Ports := Services[Count].Ports;
        for I := 0 to Ports.Count-1 do
          PortNames.Add(Ports[I].Name);
      end;
  end;

  //Get any imported WSDL
  Imports := WSDLDoc.Definition.Imports;
  if Imports <> nil then
  begin
    for Index := 0 to Imports.Count -1 do
    begin
      ImportedWSDLDoc := TWSDLDocument.Create(nil);
      ImportedWSDLDoc.FileName := Imports[Index].Location;
      ImportedWSDLDoc.Active := True;
      if HasDefinition(ImportedWSDLDoc) then
        ImportPortsForService(ImportedWSDLDoc, ServiceName, PortNames)
    end;
  end;

end;


function TWSDLItems.GetBindingForServicePort(const ServiceName, PortName: WideString): WideString;
var
  I, Index, Count: Integer;
  BindingName: WideString;
  Services: IServices;
  Ports: IPorts;
  Imports: IImports;
  ImportedWSDLDoc: IWSDLDocument;
begin

  Result := '';
  BindingName := '';
  Services := Definition.Services;

  if Services <> nil then
    for Count := 0 to Services.Count -1 do
      if (ServiceName = Services[Count].Name) then
      begin
        Ports := Services[Count].Ports;
        for I := 0 to Ports.Count-1 do
          if (PortName = Ports[I].Name) then
          begin
            BindingName := Ports[I].Binding;
            break;
          end;
        break;
      end;

  if BindingName = '' then
  begin
    //Get any imported WSDL
    Imports := Definition.Imports;
    if Imports <> nil then
    begin
      for Index := 0 to Imports.Count -1 do
      begin
        ImportedWSDLDoc := TWSDLDocument.Create(nil);
        ImportedWSDLDoc.FileName := Imports[Index].Location;
        ImportedWSDLDoc.Active := True;
        if HasDefinition(ImportedWSDLDoc) then
          BindingName := ImportBindingForServicePort(ImportedWSDLDoc, ServiceName, PortName);
        if BindingName <> '' then
          break;
      end;
    end;
  end;

  Result := BindingName;
end;

function TWSDLItems.ImportBindingForServicePort(const WSDLDoc: IWSDLDocument; const ServiceName, PortName: WideString): WideString;
var
  I, Index, Count: Integer;
  BindingName: WideString;
  Services: IServices;
  Ports: IPorts;
  Imports: IImports;
  ImportedWSDLDoc: IWSDLDocument;
begin

  Result := '';
  BindingName := '';
  Services := WSDLDoc.Definition.Services;

  if Services <> nil then
    for Count := 0 to Services.Count -1 do
      if (ServiceName = Services[Count].Name) then
      begin
        Ports := Services[Count].Ports;
        for I := 0 to Ports.Count-1 do
          if (PortName = Ports[I].Name) then
          begin
            BindingName := Ports[I].Binding;
            break;
          end;
        break;
      end;

  if BindingName = '' then
  begin
    //Get any imported WSDL
    Imports := WSDLDoc.Definition.Imports;
    if Imports <> nil then
    begin
      for Index := 0 to Imports.Count -1 do
      begin
        ImportedWSDLDoc := TWSDLDocument.Create(nil);
        ImportedWSDLDoc.FileName := Imports[Index].Location;
        ImportedWSDLDoc.Active := True;
        if HasDefinition(ImportedWSDLDoc) then
          BindingName := ImportBindingForServicePort(ImportedWSDLDoc, ServiceName, PortName);
        if BindingName <> '' then
          break;
      end;
    end;
  end;

  Result := BindingName;
end;



function TWSDLItems.GetSoapAddressForServicePort(const ServiceName, PortName: WideString): WideString;
var
  I, J, Index, Count: Integer;
  SoapAddress: WideString;
  Services: IServices;
  AddressNode: IXMLNode;
  Ports: IPorts;
  Imports: IImports;
  ImportedWSDLDoc: IWSDLDocument;
begin

  Result := '';
  SoapAddress := '';
  Services := Definition.Services;

  if Services <> nil then
    for Count := 0 to Services.Count -1 do
      if (ServiceName = Services[Count].Name) then
      begin
        Ports := Services[Count].Ports;
        for I := 0 to Ports.Count-1 do
          if (PortName = Ports[I].Name) then
          begin
            for J := 0 to Ports[I].ChildNodes.Count -1 do
            begin
              if Ports[I].ChildNodes.Nodes[J].NodeName = SWSDLSoapAddress then
              begin
                AddressNode := Ports[I].ChildNodes.Nodes[J];
                SoapAddress := AddressNode.Attributes[SLocation];
                break;
              end;
            end;
            break;
          end;
        break;
      end;

  if SoapAddress = '' then
  begin
    //Get any imported WSDL
    Imports := Definition.Imports;
    if Imports <> nil then
    begin
      for Index := 0 to Imports.Count -1 do
      begin
        ImportedWSDLDoc := TWSDLDocument.Create(nil);
        ImportedWSDLDoc.FileName := Imports[Index].Location;
        ImportedWSDLDoc.Active := True;
        if HasDefinition(ImportedWSDLDoc) then
          SoapAddress := ImportSoapAddressForServicePort(ImportedWSDLDoc, ServiceName, PortName);
        if SoapAddress <> '' then
          break;
      end;
    end;
  end;

  Result := SoapAddress;

end;


function TWSDLItems.ImportSoapAddressForServicePort(const WSDLDoc: IWSDLDocument; const ServiceName, PortName: WideString): WideString;
var
  I, J, Index, Count: Integer;
  SoapAddress: WideString;
  Services: IServices;
  AddressNode: IXMLNode;
  Ports: IPorts;
  Imports: IImports;
  ImportedWSDLDoc: IWSDLDocument;
begin

  Result := '';
  SoapAddress := '';
  Services := WSDLDoc.Definition.Services;

  if Services <> nil then
    for Count := 0 to Services.Count -1 do
      if (ServiceName = Services[Count].Name) then
      begin
        Ports := Services[Count].Ports;
        for I := 0 to Ports.Count-1 do
          if (PortName = Ports[I].Name) then
          begin
            for J := 0 to Ports[I].ChildNodes.Count -1 do
            begin
              if Ports[I].ChildNodes.Nodes[J].NodeName = SWSDLSoapAddress then
              begin
                AddressNode := Ports[I].ChildNodes.Nodes[J];
                SoapAddress := AddressNode.Attributes[SLocation];
                break;
              end;
            end;
            break;
          end;
        break;
      end;

  if SoapAddress = '' then
  begin
    //Get any imported WSDL
    Imports := WSDLDoc.Definition.Imports;
    if Imports <> nil then
    begin
      for Index := 0 to Imports.Count -1 do
      begin
        ImportedWSDLDoc := TWSDLDocument.Create(nil);
        ImportedWSDLDoc.FileName := Imports[Index].Location;
        ImportedWSDLDoc.Active := True;
        if HasDefinition(ImportedWSDLDoc) then
          SoapAddress := ImportSoapAddressForServicePort(ImportedWSDLDoc, ServiceName, PortName);
        if SoapAddress <> '' then
          break;
      end;
    end;
  end;

  Result := SoapAddress;

end;


procedure TWSDLItems.GetMessages(MessageNames: TWideStrings);
var
  Count: Integer;
  Messages: IMessages;
begin

  Messages := Definition.Messages;
  for Count:= 0 to  Messages.Count-1 do
    MessageNames.Add(Messages[Count].Name);

end;



function TWSDLItems.GetMessageNode(const MessageName: WideString): IXMLNode;
var
 Count: Integer;
 MessageNode: IXMLNode;
 Messages: IMessages;
begin

  Messages := Definition.Messages;

  for Count := 0 to  Messages.Count-1 do
    if (MessageName = Messages[Count].Name) then
    begin
      MessageNode := Messages[Count] as IXMLNode;
      break;
    end;

  Result := MessageNode;
end;


procedure TWSDLItems.GetParts(const MessageName: WideString; PartNames: TWideStrings);
var
  I, Count: Integer;
  UnQMessageName: WideString;
  Messages: IMessages;
  Parts: IParts;
begin

  Messages := Definition.Messages;
  for Count := 0 to  Messages.Count-1 do
  begin
    UnQMessageName := ExtractLocalName(MessageName);
    if( (UnQMessageName = Messages[Count].Name) or
      (MessageName = Messages[Count].Name) ) then
    begin
      Parts := Messages[Count].Parts;
      break;
    end;
  end;

  if Parts <> nil then
    for I := 0 to Parts.Count -1 do
    begin
      {
      if ( Parts[I].Element <> '' ) then
        PartName := Parts[I].Name + ',' + Parts[I].Element;
      if ( Parts[I].Type_ <> '') then
        PartName := Parts[I].Name + ',' + Parts[I].Type_;
      PartNames.Add(PartName);
      }
      PartNames.Add(Parts[I].Name);
    end;

end;


function TWSDLItems.GetPartNode(const MessageName, PartName: WideString): IXMLNode;
var
  I, Count: Integer;
  Messages: IMessages;
  Parts: IParts;
  PartNode: IXMLNode;

begin
  Messages := Definition.Messages;

  for Count := 0 to Messages.Count-1 do
    if (MessageName = Messages[Count].Name) then
    begin
      Parts := Messages[Count].Parts;
      break;
    end;

  for I := 0 to Parts.Count -1 do
    if (PartName = Parts[I].Name) then
    begin
      PartNode := Parts[I] as IXMLNode;
      break;
    end;

  Result := PartNode;
end;


procedure TWSDLItems.GetPortTypes (PortTypeNames: TWideStrings);
var
  Count, Index: Integer;
  PortTypes: IPortTypes;
  Imports: IImports;
  ImportedWSDLDoc: IWSDLDocument;
begin

  PortTypes := Definition.PortTypes;
  for Count:= 0 to PortTypes.Count-1 do
    PortTypeNames.Add(PortTypes[Count].Name);

  //Get any imported WSDL
  Imports := Definition.Imports;
  if Imports <> nil then
  begin
    for Index := 0 to Imports.Count -1 do
    begin
      ImportedWSDLDoc := TWSDLDocument.Create(nil);
      ImportedWSDLDoc.FileName := Imports[Index].Location;
      ImportedWSDLDoc.Active := True;
      if HasDefinition(ImportedWSDLDoc) then
        ImportPortTypes(ImportedWSDLDoc, PortTypeNames)
    end;
  end;

end;


procedure TWSDLItems.ImportPortTypes (const WSDLDoc: IWSDLDocument; PortTypeNames: TWideStrings);
var
  Count, Index: Integer;
  PortTypes: IPortTypes;
  Imports: IImports;
  ImportedWSDLDoc: IWSDLDocument;
begin

  PortTypes := WSDLDoc.Definition.PortTypes;
  for Count:= 0 to PortTypes.Count-1 do
    PortTypeNames.Add(PortTypes[Count].Name);

  //Get any imported WSDL
  Imports := WSDLDoc.Definition.Imports;
  if Imports <> nil then
  begin
    for Index := 0 to Imports.Count -1 do
    begin
      ImportedWSDLDoc := TWSDLDocument.Create(nil);
      ImportedWSDLDoc.FileName := Imports[Index].Location;
      ImportedWSDLDoc.Active := True;
      if HasDefinition(ImportedWSDLDoc) then
        ImportPortTypes(ImportedWSDLDoc, PortTypeNames)
    end;
  end;

end;



function TWSDLItems.GetPortTypeNode(const PortTypeName: WideString): IXMLNode;
var
  Count: Integer;
  PortTypeNode: IXMLNode;
  PortTypes: IPortTypes;
begin

  PortTypes := Definition.PortTypes;

  for Count:= 0 to PortTypes.Count-1 do
    if (PortTypeName = PortTypes[Count].Name) then
    begin
      PortTypeNode := PortTypes[Count] as IXMLNode;
      break;
    end;

  Result := PortTypeNode;
end;


procedure TWSDLItems.GetOperations(const PortTypeName: WideString; OperationNames: TWideStrings);
var
  I, Count: Integer;
  PortTypes: IPortTypes;
  Operations: IOperations;
begin

  PortTypes := Definition.PortTypes;

  for Count:= 0 to PortTypes.Count-1 do
    if (PortTypeName = PortTypes[Count].Name) then
    begin
      Operations := PortTypes[Count].Operations;
      break;
    end;

  if Operations <> nil then
    for I:=0 to Operations.Count -1 do
      OperationNames.Add(Operations[I].Name);

end;



function TWSDLItems.GetOperationNode(const PortTypeName, OperationName: WideString): IXMLNode;
var
  I, Count: Integer;
  PortTypes: IPortTypes;
  Operations: IOperations;
  OperationNode : IXMLNode;
begin

  PortTypes := Definition.PortTypes;

  for Count:= 0 to PortTypes.Count-1 do
    if (PortTypeName = PortTypes[Count].Name) then
    begin
      Operations := PortTypes[Count].Operations;
      break;
    end;

  for I:=0 to Operations.Count -1 do
    if (OperationName = Operations[I].Name) then
    begin
      OperationNode := Operations[I] as IXMLNode;
      break;
    end;

  Result := OperationNode;
end;


procedure TWSDLItems.GetInOutMessagesForOperation(const PortTypeName, OperationName: WideString; OperationIndex: Integer; InOutMessages: TWideStrings);
var
  I, Count: Integer;
  InOutMessageName: WideString;
  PortTypes: IPortTypes;
  Operations: IOperations;
begin

  PortTypes := Definition.PortTypes;

  for Count:= 0 to PortTypes.Count-1 do
    if (PortTypeName = PortTypes[Count].Name) then
    begin
      Operations := PortTypes[Count].Operations;
      break;
    end;

  for I:=0 to Operations.Count -1 do
    if ((OperationName = Operations[I].Name) and (OperationIndex = I)) then
    begin
      if (Operations[I].Input.Message <> '') then
      begin
        InOutMessageName := SInput + ', ' + Operations[I].Input.Message;
        InOutMessages.Add(InOutMessageName);
      end;
      if (Operations[I].Output.Message <> '') then
      begin
        InOutMessageName := SOutput + ', ' + Operations[I].Output.Message;
        InOutMessages.Add(InOutMessageName);
      end;
    end;

end;


procedure TWSDLItems.GetPartsForOperation(const PortTypeName, OperationName: WideString; OperationIndex: Integer; PartNames: TWideStrings);
var
  I,Index,Count: Integer;
  PortTypes: IPortTypes;
  Operations: IOperations;
  Imports: IImports;
  ImportedWSDLDoc: IWSDLDocument;
begin

  PortTypes := Definition.PortTypes;

  for Count:= 0 to PortTypes.Count-1 do
    if (PortTypeName = PortTypes[Count].Name) then
    begin
      Operations := PortTypes[Count].Operations;
      break;
    end;

  if ((Operations <> nil) and (Operations.Count > 0)) then
  begin
    for I:=0 to Operations.Count -1 do
      if ((OperationName = Operations[I].Name) and (OperationIndex = I)) then
      begin
        if (Operations[I].Input.Message <> '') then
          GetParts(Operations[I].Input.Message, PartNames);
      end;
  end
  else
  begin
    //Get any imported WSDL
    Imports := Definition.Imports;
    if Imports <> nil then
    begin
      for Index := 0 to Imports.Count -1 do
      begin
        ImportedWSDLDoc := TWSDLDocument.Create(nil);
        ImportedWSDLDoc.FileName := Imports[Index].Location;
        ImportedWSDLDoc.Active := True;
        if HasDefinition(ImportedWSDLDoc) then
          ImportPartsForOperation(ImportedWSDLDoc, PortTypeName, OperationName, OperationIndex, PartNames)
      end;
    end;
  end;

end;



procedure TWSDLItems.ImportPartsForOperation(const WSDLDoc: IWSDLDocument; const PortTypeName, OperationName: WideString; OperationIndex: Integer; PartNames: TWideStrings);
var
  I, Index, Count: Integer;
  PortTypes: IPortTypes;
  Operations: IOperations;
  Imports: IImports;
  ImportedWSDLDoc: IWSDLDocument;
begin

  PortTypes := WSDLDoc.Definition.PortTypes;

  for Count:= 0 to PortTypes.Count-1 do
    if (PortTypeName = PortTypes[Count].Name) then
    begin
      Operations := PortTypes[Count].Operations;
      break;
    end;

  if ((Operations <> nil) and (Operations.Count > 0) ) then
  begin
    for I:=0 to Operations.Count -1 do
      if ((OperationName = Operations[I].Name) and (OperationIndex = I)) then
      begin
        if (Operations[I].Input.Message <> '') then
          GetParts(Operations[I].Input.Message, PartNames);
      end;
  end
  else
  begin
    //Get any imported WSDL
    Imports := WSDLDoc.Definition.Imports;
    if Imports <> nil then
    begin
      for Index := 0 to Imports.Count -1 do
      begin
        ImportedWSDLDoc := TWSDLDocument.Create(nil);
        ImportedWSDLDoc.FileName := Imports[Index].Location;
        ImportedWSDLDoc.Active := True;
        if HasDefinition(ImportedWSDLDoc) then
          ImportPartsForOperation(ImportedWSDLDoc, PortTypeName, OperationName, OperationIndex, PartNames);
      end;
    end;
  end;

end;


procedure TWSDLItems.GetImports(ImportNames: TWideStrings);
var
  Count: Integer;
  Imports: IImports;
begin

  Imports := Definition.Imports;
  for Count := 0 to Imports.Count -1 do
    ImportNames.Add(Imports[Count].Namespace);

end;


function TWSDLItems.GetLocationForImport(const ImportNameSpace: WideString): WideString;
var
  Count: Integer;
  Location: WideString;
  Imports: IImports;
begin

  Imports := Definition.Imports;
  for Count := 0 to Imports.Count -1 do
    if (ImportNameSpace = Imports[Count].Namespace) then
    begin
      Location := Imports[Count].Location;
      break;
    end;

  Result := Location;
end;


procedure TWSDLItems.GetBindings(BindingNames: TWideStrings);
var
  Count: Integer;
  Bindings: IBindings;
begin

  Bindings := Definition.Bindings;
  for Count := 0 to Bindings.Count -1 do
    BindingNames.Add(Bindings[Count].Name);

end;


function TWSDLItems.GetBindingType(const BindingName: WideString): WideString;
var
  Count: Integer;
  BindingTypeName: WideString;
  Bindings: IBindings;
begin

  Bindings := Definition.Bindings;
  for Count := 0 to Bindings.Count -1 do
    if (BindingName = Bindings[Count].Name) then
    begin
      BindingTypeName := Bindings[Count].Type_;
      break;
    end;

  Result := BindingTypeName;
end;


function TWSDLItems.GetSoapBindingAttribute(const BindingName: WideString; Attribute: WideString): WideString;
var
  I,Count: Integer;
  BindingAttribute: WideString;
  Bindings: IBindings;
  SoapBinding: IXMLNode;
begin

  Bindings := Definition.Bindings;
  for Count := 0 to Bindings.Count -1 do
    if (BindingName = Bindings[Count].Name) then
    begin
      for I := 0 to Bindings[Count].ChildNodes.Count -1 do
        if Bindings[Count].ChildNodes.Nodes[I].NodeName = SWSDLSoapBinding then
        begin
          SoapBinding := Bindings[Count].ChildNodes.Nodes[I];
          if (SoapBinding.GetAttribute(Attribute) <> Null ) then
            BindingAttribute := SoapBinding.GetAttribute(Attribute);
        end;
      break;
    end;

  Result := BindingAttribute;
end;


procedure TWSDLItems.GetOperationsForBinding(const BindingName: WideString; OperationNames: TWideStrings);
var
  I,Count: Integer;
  Bindings: IBindings;
  BindOperations: IBindingOperations;
begin

  Bindings := Definition.Bindings;

  for Count := 0 to Bindings.Count -1 do
    if (BindingName = Bindings[Count].Name) then
    begin
      BindOperations := Bindings[Count].BindingOperations;
      for I := 0 to BindOperations.Count -1 do
        OperationNames.Add(BindOperations[I].Name);
      break;
    end;

end;


function TWSDLItems.GetSoapOperationAttribute(const BindingName,Operation, Attribute: WideString): WideString;
var
  I,J,Index,Count: Integer;
  Bindings: IBindings;
  BindOperations: IBindingOperations;
  SoapOperationNode: IXMLNode;
  SoapOperationAttr: WideString;
  Imports: IImports;
  ImportedWSDLDoc: IWSDLDocument;
begin

  Result := '';
  SoapOperationAttr := '';
  Bindings := Definition.Bindings;

  for Count := 0 to Bindings.Count -1 do
    if (BindingName = Bindings[Count].Name) then
    begin
      BindOperations := Bindings[Count].BindingOperations;
      for I := 0 to BindOperations.Count -1 do
      begin
        if (Operation = BindOperations[I].Name) then
        begin
          for J := 0 to BindOperations[I].ChildNodes.Count -1 do
            if (BindOperations[I].ChildNodes.Nodes[J].NodeName = SWSDLSoapOperation ) then
            begin
              SoapOperationNode := BindOperations[I].ChildNodes.Nodes[J];
              if (SoapOperationNode.Attributes[Attribute] <> Null) then
                SoapOperationAttr := SoapOperationNode.Attributes[Attribute];
              break;
            end;
          break;
        end;
      end;
      break;
    end;

  if SoapOperationAttr = '' then
  begin
    //Get any imported WSDL
    Imports := Definition.Imports;
    if Imports <> nil then
    begin
      for Index := 0 to Imports.Count -1 do
      begin
        ImportedWSDLDoc := TWSDLDocument.Create(nil);
        ImportedWSDLDoc.FileName := Imports[Index].Location;
        ImportedWSDLDoc.Active := True;
        if HasDefinition(ImportedWSDLDoc) then
          SoapOperationAttr := ImportSoapOperationAttribute(ImportedWSDLDoc, BindingName, Operation, Attribute);
        if SoapOperationAttr <> '' then
          break;
      end;
    end;
  end;

  Result := SoapOperationAttr;

end;

function TWSDLItems.ImportSoapOperationAttribute(const WSDLDoc: IWSDLDocument; const BindingName,Operation, Attribute: WideString): WideString;
var
  I,J,Index,Count: Integer;
  Bindings: IBindings;
  BindOperations: IBindingOperations;
  SoapOperationNode: IXMLNode;
  SoapOperationAttr: WideString;
  Imports: IImports;
  ImportedWSDLDoc: IWSDLDocument;
begin

  Result := '';
  SoapOperationAttr := '';
  Bindings := WSDLDoc.Definition.Bindings;

  for Count := 0 to Bindings.Count -1 do
    if (BindingName = Bindings[Count].Name) then
    begin
      BindOperations := Bindings[Count].BindingOperations;
      for I := 0 to BindOperations.Count -1 do
      begin
        if (Operation = BindOperations[I].Name) then
        begin
          for J := 0 to BindOperations[I].ChildNodes.Count -1 do
            if (BindOperations[I].ChildNodes.Nodes[J].NodeName = SWSDLSoapOperation ) then
            begin
              SoapOperationNode := BindOperations[I].ChildNodes.Nodes[J];
              if (SoapOperationNode.Attributes[Attribute] <> Null) then
                SoapOperationAttr := SoapOperationNode.Attributes[Attribute];
              break;
            end;
          break;
        end;
      end;
      break;
    end;

  if SoapOperationAttr = '' then
  begin
    //Get any imported WSDL
    Imports := WSDLDoc.Definition.Imports;
    if Imports <> nil then
    begin
      for Index := 0 to Imports.Count -1 do
      begin
        ImportedWSDLDoc := TWSDLDocument.Create(nil);
        ImportedWSDLDoc.FileName := Imports[Index].Location;
        ImportedWSDLDoc.Active := True;
        if HasDefinition(ImportedWSDLDoc) then
          SoapOperationAttr := ImportSoapOperationAttribute(ImportedWSDLDoc, BindingName, Operation, Attribute);
        if SoapOperationAttr <> '' then
          break;
      end;
    end;
  end;

  Result := SoapOperationAttr;

end;



function TWSDLItems.GetSoapBodyAttribute(const BindingName,Operation, IOType, Attribute: WideString): WideString;
var
  I,J,K,Index,Count: Integer;
  Bindings: IBindings;
  BindOperations: IBindingOperations;
  IONode, SoapBodyNode: IXMLNode;
  Attr: WideString;
  Imports: IImports;
  ImportedWSDLDoc: IWSDLDocument;
begin

  Result := '';
  Attr := '';
  Bindings := Definition.Bindings;

  for Count := 0 to Bindings.Count -1 do
    if (BindingName = Bindings[Count].Name) then
    begin
      BindOperations := Bindings[Count].BindingOperations;
      for I := 0 to BindOperations.Count -1 do
      begin
        if (Operation = BindOperations[I].Name) then
          for J := 0 to BindOperations[I].ChildNodes.Count -1 do
            if (BindOperations[I].ChildNodes.Nodes[J].NodeName = IOType) then
            begin
              IONode := BindOperations[I].ChildNodes.Nodes[J];
              for K := 0 to IONode.ChildNodes.Count -1 do
                if (IONode.ChildNodes.Nodes[K].NodeName = SWSDLSoapBody) then
                begin
                  SoapBodyNode := IONode.ChildNodes[K];
                  if (SoapBodyNode.Attributes[Attribute] <> Null) then
                    Attr := SoapBodyNode.Attributes[Attribute];
                  break;
                end;
              break;
            end;
      end;
      break;
    end;

  if Attr = '' then
  begin
    //Get any imported WSDL
    Imports := Definition.Imports;
    if Imports <> nil then
    begin
      for Index := 0 to Imports.Count -1 do
      begin
        ImportedWSDLDoc := TWSDLDocument.Create(nil);
        ImportedWSDLDoc.FileName := Imports[Index].Location;
        ImportedWSDLDoc.Active := True;
        if HasDefinition(ImportedWSDLDoc) then
          Attr := ImportSoapBodyAttribute(ImportedWSDLDoc, BindingName, Operation, IOType, Attribute);
        if Attr <> '' then
          break;
      end;
    end;
  end;

  Result := Attr;
end;


function TWSDLItems.ImportSoapBodyAttribute(const WSDLDoc: IWSDLDocument; const BindingName,Operation, IOType, Attribute: WideString): WideString;
var
  I,J,K,Index,Count: Integer;
  Bindings: IBindings;
  BindOperations: IBindingOperations;
  IONode, SoapBodyNode: IXMLNode;
  Attr: WideString;
  Imports: IImports;
  ImportedWSDLDoc: IWSDLDocument;
begin

  Result := '';
  Attr := '';
  Bindings := WSDLDoc.Definition.Bindings;

  if Bindings <> nil then
  begin
    for Count := 0 to Bindings.Count -1 do
      if (BindingName = Bindings[Count].Name) then
      begin
        BindOperations := Bindings[Count].BindingOperations;
        for I := 0 to BindOperations.Count -1 do
        begin
          if (Operation = BindOperations[I].Name) then
            for J := 0 to BindOperations[I].ChildNodes.Count -1 do
              if (BindOperations[I].ChildNodes.Nodes[J].NodeName = IOType) then
              begin
                IONode := BindOperations[I].ChildNodes.Nodes[J];
                for K := 0 to IONode.ChildNodes.Count -1 do
                  if (IONode.ChildNodes.Nodes[K].NodeName = SWSDLSoapBody) then
                  begin
                    SoapBodyNode := IONode.ChildNodes[K];
                    if (SoapBodyNode.Attributes[Attribute] <> Null) then
                      Attr := SoapBodyNode.Attributes[Attribute];
                    break;
                  end;
                break;
              end;
        end;
        break;
      end;
  end;

  if Attr = '' then
  begin
    //Get any imported WSDL
    Imports := WSDLDoc.Definition.Imports;
    if Imports <> nil then
    begin
      for Index := 0 to Imports.Count -1 do
      begin
        ImportedWSDLDoc := TWSDLDocument.Create(nil);
        ImportedWSDLDoc.FileName := Imports[Index].Location;
        ImportedWSDLDoc.Active := True;
        if HasDefinition(ImportedWSDLDoc) then
          Attr := ImportSoapBodyAttribute(ImportedWSDLDoc, BindingName, Operation, IOType, Attribute);
        if Attr <> '' then
          break;
      end;
    end;
  end;

  Result := Attr;
end;


function TWSDLItems.GetSoapBodyNamespace(const BindingPortType: WideString): WideString;
var
  I,J,K,Index,Count: Integer;
  Bindings: IBindings;
  BindOperations: IBindingOperations;
  IONode, SoapBodyNode: IXMLNode;
  Attr: WideString;
  Imports: IImports;
  ImportedWSDLDoc: IWSDLDocument;
begin

  Result := '';
  Attr := '';
  Bindings := Definition.Bindings;

  for Count := 0 to Bindings.Count -1 do
    if (BindingPortType = Bindings[Count].Type_) then
    begin
      BindOperations := Bindings[Count].BindingOperations;
      for I := 0 to BindOperations.Count -1 do
      begin
        for J := 0 to BindOperations[I].ChildNodes.Count -1 do
          if ((BindOperations[I].ChildNodes.Nodes[J].NodeName = SInput) or
          (BindOperations[I].ChildNodes.Nodes[J].NodeName = SOutput))then
          begin
            IONode := BindOperations[I].ChildNodes.Nodes[J];
            for K := 0 to IONode.ChildNodes.Count -1 do
              if (IONode.ChildNodes.Nodes[K].NodeName = SWSDLSoapBody) then
              begin
                SoapBodyNode := IONode.ChildNodes[K];
                if (SoapBodyNode.Attributes[SNamespace] <> Null) then
                  Attr := SoapBodyNode.Attributes[SNamespace];
                break;
              end;
            break;
          end;
      end;
      break;
    end;

  if Attr = '' then
  begin
    //Get any imported WSDL
    Imports := Definition.Imports;
    if Imports <> nil then
    begin
      for Index := 0 to Imports.Count -1 do
      begin
        ImportedWSDLDoc := TWSDLDocument.Create(nil);
        ImportedWSDLDoc.FileName := Imports[Index].Location;
        ImportedWSDLDoc.Active := True;
        if HasDefinition(ImportedWSDLDoc) then
          Attr := ImportSoapBodyNamespace(ImportedWSDLDoc, BindingPortType);
        if Attr <> '' then
          break;
      end;
    end;
  end;

  Result := Attr;
end;


function TWSDLItems.ImportSoapBodyNamespace(const WSDLDoc: IWSDLDocument; const BindingPortType: WideString): WideString;
var
  I,J,K,Index,Count: Integer;
  Bindings: IBindings;
  BindOperations: IBindingOperations;
  IONode, SoapBodyNode: IXMLNode;
  Attr: WideString;
  Imports: IImports;
  ImportedWSDLDoc: IWSDLDocument;
begin

  Result := '';
  Attr := '';
  Bindings := WSDLDoc.Definition.Bindings;

  for Count := 0 to Bindings.Count -1 do
    if (BindingPortType = Bindings[Count].Type_) then
    begin
      BindOperations := Bindings[Count].BindingOperations;
      for I := 0 to BindOperations.Count -1 do
      begin
        for J := 0 to BindOperations[I].ChildNodes.Count -1 do
          if ((BindOperations[I].ChildNodes.Nodes[J].NodeName = SInput) or
          (BindOperations[I].ChildNodes.Nodes[J].NodeName = SOutput))then
          begin
            IONode := BindOperations[I].ChildNodes.Nodes[J];
            for K := 0 to IONode.ChildNodes.Count -1 do
              if (IONode.ChildNodes.Nodes[K].NodeName = SWSDLSoapBody) then
              begin
                SoapBodyNode := IONode.ChildNodes[K];
                if (SoapBodyNode.Attributes[SNamespace] <> Null) then
                  Attr := SoapBodyNode.Attributes[SNamespace];
                break;
              end;
            break;
          end;
      end;
      break;
    end;

  if Attr = '' then
  begin
    //Get any imported WSDL
    Imports := WSDLDoc.Definition.Imports;
    if Imports <> nil then
    begin
      for Index := 0 to Imports.Count -1 do
      begin
        ImportedWSDLDoc := TWSDLDocument.Create(nil);
        ImportedWSDLDoc.FileName := Imports[Index].Location;
        ImportedWSDLDoc.Active := True;
        if HasDefinition(ImportedWSDLDoc) then
          Attr := ImportSoapBodyNamespace(ImportedWSDLDoc, BindingPortType);
        if Attr <> '' then
          break;
      end;
    end;
  end;

  Result := Attr;
end;


procedure TWSDLItems.GetSoapHeaderAttribute(const BindingName, Operation, IOType, Attribute: WideString; SoapHeaderAttrs: TWideStrings);
var
  I,J,K,Count: Integer;
  Bindings: IBindings;
  BindOperations: IBindingOperations;
  IONode, SoapHeaderNode: IXMLNode;
begin

  Bindings := Definition.Bindings;

  for Count := 0 to Bindings.Count -1 do
    if (BindingName = Bindings[Count].Name) then
    begin
      BindOperations := Bindings[Count].BindingOperations;
      for I := 0 to BindOperations.Count -1 do
      begin
        if (Operation = BindOperations[I].Name) then
          for J := 0 to BindOperations[I].ChildNodes.Count -1 do
            if (BindOperations[I].ChildNodes.Nodes[J].NodeName = IOType) then
            begin
              IONode := BindOperations[I].ChildNodes.Nodes[J];
              for K := 0 to IONode.ChildNodes.Count -1 do
                if (IONode.ChildNodes.Nodes[K].NodeName = SWSDLSoapHeader) then
                begin
                  SoapHeaderNode := IONode.ChildNodes[K];
                  if (SoapHeaderNode.Attributes[Attribute] <> Null) then
                    SoapHeaderAttrs.Add(SoapHeaderNode.Attributes[Attribute]);
                end;
              break;
            end;
      end;
      break;
    end;

end;


procedure TWSDLItems.GetSoapFaultsForOperation(const BindingName, Operation: WideString; FaultNames: TWideStrings);
var
  I,J,K,Count: Integer;
  Bindings: IBindings;
  BindOperations: IBindingOperations;
  FaultNode, SoapFaultNode: IXMLNode;
begin

  Bindings := Definition.Bindings;

  for Count := 0 to Bindings.Count -1 do
    if (BindingName = Bindings[Count].Name) then
    begin
      BindOperations := Bindings[Count].BindingOperations;
      for I := 0 to BindOperations.Count -1 do
        if (Operation = BindOperations[I].Name) then
        begin
          for J := 0 to BindOperations[I].ChildNodes.Count -1 do
            if (BindOperations[I].ChildNodes.Nodes[J].NodeName = SFault) then
            begin
              FaultNode := BindOperations[I].ChildNodes.Nodes[J];
              for K := 0 to FaultNode.ChildNodes.Count -1 do
                if (FaultNode.ChildNodes.Nodes[K].NodeName = SWSDLSoapFault) then
                begin
                  SoapFaultNode := FaultNode.ChildNodes[K];
                  if (SoapFaultNode.Attributes[SName] <> Null) then
                    FaultNames.Add(SoapFaultNode.Attributes[SName]);
                end;
            end;
          break;
        end; //end if operation
      break;
    end; //end if BindingName

end;


function TWSDLItems.GetSoapFaultAttribute(const BindingName, Operation, FaultName, Attribute: WideString): WideString;
var
  I,J,K,Count: Integer;
  Bindings: IBindings;
  BindOperations: IBindingOperations;
  FaultNode, SoapFaultNode: IXMLNode;
  Attr: WideString;
begin

  Bindings := Definition.Bindings;

  for Count := 0 to Bindings.Count -1 do
    if (BindingName = Bindings[Count].Name) then
    begin
      BindOperations := Bindings[Count].BindingOperations;
      for I := 0 to BindOperations.Count -1 do
        if (Operation = BindOperations[I].Name) then
        begin
          for J := 0 to BindOperations[I].ChildNodes.Count -1 do
            if (BindOperations[I].ChildNodes.Nodes[J].NodeName = SFault) then
            begin
              FaultNode := BindOperations[I].ChildNodes.Nodes[J];
              for K := 0 to FaultNode.ChildNodes.Count -1 do
                if (FaultNode.ChildNodes.Nodes[K].NodeName = SWSDLSoapFault) then
                begin
                  SoapFaultNode := FaultNode.ChildNodes[K];
                  if (SoapFaultNode.Attributes[SName] <> Null) then
                    if (FaultName = SoapFaultNode.Attributes[SName]) then
                      if (SoapFaultNode.Attributes[Attribute] <> Null) then
                         Attr := SoapFaultNode.Attributes[Attribute];
                end;
            end;
          break;
        end; //end if operation
      break;
    end; //end if BindingName

  Result := Attr;
end;



function TWSDLItems.HasTypesNode: Boolean;
begin
  Result := False;
  if (Definition.Types <> nil) then
    Result := True;
end;


procedure TWSDLItems.GetSchemas(SchemaNames: TWideStrings);
var
  Types: ITypes;
  Tns: WideString;
  Index: Integer;
begin

  Types := Definition.Types;

  if (Types <> nil) and (Types.SchemaDefs.Count > 0) then
  begin
    for Index := 0 to Types.SchemaDefs.Count - 1 do
    begin
      Tns := Types.SchemaDefs[Index].Attributes[sTns];
      SchemaNames.Add(Tns);
    end;
  end;

end;


function TWSDLItems.GetSchemaNode(const SchemaTns: WideString) : IXMLNode;
var
  Index: Integer;
  Types: ITypes;
  SchemaRootNode: IXMLNode;
begin

  Types := Definition.Types;
  if (Types <> nil) and (Types.SchemaDefs.Count > 0) then
  begin
    for Index := 0 to Types.SchemaDefs.Count - 1 do
    begin
      if ( SchemaTns = Types.SchemaDefs[Index].Attributes[sTns] ) then
      begin
        SchemaRootNode := Types.SchemaDefs[Index] as IXMLNode;
        break;
      end;
    end;
  end;

  Result := SchemaRootNode;

end;


end.
