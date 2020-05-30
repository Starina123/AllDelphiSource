{***************************************************************}
{                                                               }
{   Borland Delphi Visual Component Library                     }
{                                                               }
{   Copyright (c) 2000-2001 Borland Software Corporation        }
{                                                               }
{***************************************************************}
unit WSDLPub;

interface

uses InvokeRegistry, Classes, HTTPApp, AutoDisp, Masks, Types;

type

  IWSDLPublish = interface(IInvokable)
  ['{ECD820DD-F242-11D4-928A-00C04F990435}']
    procedure GetPortTypeList(var PortTypes: TWideStringDynArray);  stdcall;
    function GetWSDLForPortType(PortType: WideString): WideString;  stdcall;
    procedure GetTypeSystemsList(TypeSystems: TWideStringDynArray); stdcall;
    function GetXSDForTypeSystem(TypeSystem: WideString): WideString;  stdcall;
  end;


  TWSDLPublish = class(TInvokableClass, IWSDLPublish)
  private
    Locations: array of WideString;
    PortNames: array of WideString;
  public
    procedure GetPortTypeEntries(var Entries: TInvRegIntfEntryArray);
    { IWSDLPublish }
    procedure GetPortTypeList(var PortTypes: TWideStringDynArray);    stdcall;
    procedure GetTypeSystemsList(TypeSystems: TWideStringDynArray);    stdcall;
    function GetWSDLForPortType(PortType: WideString): WideString;    stdcall;
    function GetXSDForTypeSystem(TypeSystem: WideString): WideString;   stdcall;
  end;

  TWSDLHTMLPublish =  class(TComponent, IWebDispatch)
  private
    Pub: TWSDLPublish;
    FWebDispatch: TWebDispatch;
    FAdminEnabled: Boolean;
    procedure SetWebDispatch(const Value: TWebDispatch);
  protected
    procedure AddInterfaceList(htmldoc: TStringList; const WSDLBaseURL: String);
    procedure AddPortList(htmldoc: TStringList; const PortType: String);
    procedure UpdatePortList(PortList: TStrings; const PortType, Command: String);
    function GetHostScriptBaseURL(Request: TWebRequest): String;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { IWebDispatch }
    function DispatchEnabled: Boolean;
    function DispatchMask: TMask;
    function DispatchMethodType: TMethodType;
    function DispatchRequest(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse): Boolean;
  published
    property WebDispatch: TWebDispatch read FWebDispatch write SetWebDispatch;
    property AdminEnabled: Boolean read FAdminEnabled write FAdminEnabled;
  end;

  procedure WSDLPubFactory(out obj: TObject);

implementation

uses windows, SysUtils, TypInfo, IntfInfo, XMLSchema, WSDLIntf, WebServExp, WSDLBind,
  WSDLItems, WSDLSoap, IniFiles, OPToSoapDomConv, Controls, ActiveX;

{ TWSDLPublish }

const
  TableStyle = 'border=1  cellspacing=1 cellpadding=1 style=''border-collapse:collapse;border:none''';

var
  AdminIniFile: string;
  ModuleName: array[0..255] of char;

resourcestring
  sWebServiceListing = 'WebService Listing';
  sWebServiceListingAdmin = 'WebService Listing Administrator';
  sPortType = 'Port Type';
  sNameSpaceURI = 'Namespace URI';
  sDocumentation = 'Documentation';
  sWSDL = 'WSDL';
  sPortName = 'PortName';
  sAddress = 'Address';
  sInterfaceNotFound = '<HTML><P>Interface %s not found</P></HTML>';
  sWSDLPortsforPortType = 'WSDL Ports for PortType';
  sWSDLFor  =  'WSDL for ';

procedure AddElem(htmldoc: TStringList; const Elem: string);
begin
  htmldoc.Add('<td>' + Elem + '</td>');
end;

procedure TWSDLHTMLPublish.AddInterfaceList(htmldoc: TStringList; const WSDLBaseURL: String);
var
  I: Integer;
  Entries: TInvRegIntfEntryArray;
begin
  htmldoc.Add('<table ' + TableStyle + '>');
  htmldoc.Add('<tr>');
  AddElem(htmldoc, sPortType);
  AddElem(htmldoc, sNamespaceURI);
  AddElem(htmldoc, sDocumentation);
  AddElem(htmldoc, sWSDL);
  htmldoc.Add('</tr>');
  Pub.GetPortTypeEntries(Entries);
  for I := 0 to Length(Entries) - 1 do
  with Entries[I] do
  begin
    htmldoc.Add('<tr>');
    AddElem(htmldoc, Name);
    AddElem(htmldoc, Namespace);
    AddElem(htmldoc, Documentation);
    AddElem(htmldoc, '<a href="' + WSDLBaseURL + '/' + Name + '">' + sWSDLFor + Name + '</a>');
    htmldoc.Add('</tr>');
  end;
  htmldoc.Add('</table>');
end;

procedure TWSDLHTMLPublish.AddPortList(htmldoc: TStringList; const PortType: string);
var
  I: Integer;
  IniFile: TMemIniFile;
  PortList: TStringList;
begin
  IniFile := TMemIniFile.Create(AdminIniFile);
  try
    htmldoc.Add('<table ' + TableStyle + '>');
    htmldoc.Add('<tr>');
    AddElem(htmldoc, sPortName);
    AddElem(htmldoc, sAddress);
    htmldoc.Add('</tr>');
    if IniFile.SectionExists(PortType) then
    begin
      PortList := TStringList.Create;
      try
        IniFile.ReadSectionValues(PortType, PortList);
        for I := 0 to PortList.Count - 1 do
        begin
          htmldoc.Add('<tr>');
          AddElem(htmldoc, PortList.Names[I]);
          AddElem(htmldoc, PortList.Values[PortList.Names[I]]);
          htmldoc.Add('</tr>');
        end;
      finally
        PortList.Free;
      end;
    end;
    htmldoc.Add('</table>');
  finally
    IniFile.Free;
  end;
end;

procedure TWSDLHTMLPublish.UpdatePortList(PortList: TStrings; const PortType, Command: String);
var
  IniFile: TMemIniFile;
begin
  if PortList.Count > 0 then
  begin
    IniFile := TMemIniFile.Create(AdminIniFile);
    try
      if PortList.Values['PortName'] <> '' then
        if UpperCase(Command) = 'ADD' then
          IniFile.WriteString(PortType, PortList.Values[sPortName], PortList.Values[sAddress])
        else if UpperCase(Command) = 'REMOVE' then
          IniFile.DeleteKey(PortType, PortList.Values[sPortName]);
      IniFile.UpdateFile;
    finally
      IniFile.Free;
    end;
  end;
end;

function TWSDLHTMLPublish.GetHostScriptBaseURL(Request: TWebRequest): String;
begin
  Result := 'http://' + Request.Host + Request.InternalScriptName;        { do not localize }
end;

procedure TWSDLPublish.GetPortTypeList(var PortTypes: TWideStringDynArray);
var
  I, Count: Integer;
  IntfEntry: InvRegIntfEntry;
begin
 // use invrg to list all the interfaces registered, add new method if necessary
  Count := InvRegistry.GetInterfaceCount;
  SetLength(PortTypes, Count);
  for I:= 0 to Count -1 do
  begin
    IntfEntry := InvRegistry.GetInterface(I);
    PortTypes[I] := IntfEntry.Name;
  end;
end;


procedure TWSDLPublish.GetTypeSystemsList(TypeSystems: TWideStringDynArray);
var
  I, Count: Integer;
  URIMap: TRemRegEntry;
  TypeSystemList: TStringList;
begin
  TypeSystemList := TStringList.Create; // can this handle widestrings ?
  try
    // use xsdclasses to list all the unique URIs registered, add new implementation if necessary
    Count := RemClassRegistry.GetURICount;
    for I := 0 to Count -1 do
    begin
      URIMap := RemClassRegistry.GetURIMap(I);
      if TypeSystemList.IndexOf(URIMap.URI) = -1 then
        TypeSystemList.Add(URIMap.URI)
    end;
    SetLength(TypeSystems, Count);
    for I := 0 to Count -1 do
      TypeSystems[I] := TypeSystemList[I];
  finally
    TypeSystemList.Free;
  end;
end;

function TWSDLPublish.GetWSDLForPortType(PortType: WideString): WideString;
var
  IID: TGUID;
  Info: PTypeInfo;
  WSDLDoc: IWSDLDocument;
  WebServExp: TWebServExp;

begin
  try
    // use invrg to get typeinfo for porttype name ( interface name )
    // convert to WSDL fragement
    InvRegistry.GetInterfaceInfoFromName ('', PortType, Info, IID);

    //Need to throw an exception if interface is not registered.
    if Info <> nil then
    begin
      WSDLDoc := TWSDLDocument.Create(nil);
      WSDLDoc.Active := True;
      WebServExp := TWebServExp.Create;
      try
        WSDLDoc.Encoding := 'utf-8';
        WebServExp.BindingType := btSoap;
        WebServExp.WSDLElements :=  WebServExp.WSDLElements + [weService];
        WebServExp.GetWSDLForInterface(Info, WSDLDoc, PortNames, Locations);
        WSDLDoc.SaveToXML(Result);
      finally
        WebServExp.Free;
      end;
    end;
  finally
  end;
end;

function TWSDLPublish.GetXSDForTypeSystem(TypeSystem: WideString): WideString;
var
  I, Count: Integer;
  URIMap: TRemRegEntry;
  WebServExp: TWebServExp;
  XMLDoc: IXMLSchemaDoc;
begin
  // use xsdclasses to get list of all classes registered with same URI and
  // create XML schema doc for this.
  Count := RemClassRegistry.GetURICount;
  for I := 0 to Count -1 do
  begin
    URIMap := RemClassRegistry.GetURIMap(I);
    if TypeSystem = URIMap.URI then
    begin
      WebServExp := TWebServExp.Create;
      try
        XMLDoc := NewXmlSchema;
        WebServExp.GenerateXMLSchema(XMLDoc, PTypeInfo(URIMap.ClassType.ClassInfo), nil, '');
        XMLDoc.SaveToXML(Result);
      finally
        WebServExp.Free;
      end;
    end;
  end;
end;

procedure WSDLPubFactory(out obj: TObject);
begin
  obj := TWSDLPublish.Create;
end;


procedure TWSDLPublish.GetPortTypeEntries(var Entries: TInvRegIntfEntryArray);
var
  I, Count: Integer;
//  IntfEntry: InvRegIntfEntry;
begin
  Count := InvRegistry.GetInterfaceCount;
  SetLength(Entries, Count);
  for I:= 0 to Count -1 do
  begin
    Entries[I] := InvRegistry.GetInterface(I);
  end;
end;

{ TWSDLHTMLPublish }

constructor TWSDLHTMLPublish.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FWebDispatch := TWebDispatch.Create(Self);
  FWebDispatch.PathInfo := 'wsdl*';
  FWebDispatch.MethodType := mtAny;
end;

destructor TWSDLHTMLPublish.Destroy;
begin
  inherited Destroy;
  FWebDispatch.Free;
end;


function TWSDLHTMLPublish.DispatchEnabled: Boolean;
begin
  Result := True;
end;

function TWSDLHTMLPublish.DispatchMask: TMask;
begin
    Result := FWebDispatch.Mask;
end;

function TWSDLHTMLPublish.DispatchMethodType: TMethodType;
begin
   Result := FWebDispatch.MethodType;
end;

function TWSDLHTMLPublish.DispatchRequest(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse): Boolean;
var
  Resp: TStringList;
  Pub: TWSDLPublish;
  Path: string;
  LastName, PreName: string;
  WSDL: string;
  WSDLBaseURL: String;

  procedure AddAdmin(const URL: string);
  begin
    Resp.Add('<FORM NAME="admin" METHOD="GET" ACTION=' + '"' + URL + '"' + '>'); { do not localize }
    Resp.Add('<INPUT TYPE="SUBMIT" VALUE="Administrator">'); { do not localize }
    Resp.Add('</FORM>');                                     { do not localize }
  end;

  procedure CreateDefaultEntries;
  var
    I: Integer;
    Entries: TInvRegIntfEntryArray;
    IniFile: TMemIniFile;
  begin
    if not FileExists(AdminIniFile) then
    begin
      IniFile := TMemIniFile.Create(AdminIniFile);
      try
        Pub.GetPortTypeEntries(Entries);
        for I := 0 to Length(Entries) - 1 do
        with Entries[I] do
        IniFile.WriteString(Name, Name + 'Port', GetHostScriptBaseURL(Request) + '/soap/' + Name);  { do not localize }
        IniFile.UpdateFile;
      finally
        IniFile.Free;
      end;
    end;
  end;

  procedure NewServicePortForm;
  begin
    Resp.Add('<FORM NAME="admin" METHOD="GET" ACTION=' + '"' + { do not localize }
             GetHostScriptBaseURL(Request) + Request.InternalPathInfo + '"' + '>');
    Resp.Add('<table>');                                     { do not localize }
    Resp.Add('<tr>');                                        { do not localize }
    AddElem(Resp, sPortName);
    AddElem(Resp, sAddress);
    Resp.Add('</tr>');                                       { do not localize }
    Resp.Add('<tr>');                                        { do not localize }
    AddElem(Resp, '<INPUT TYPE="TEXT" NAME="' + sPortName + '" SIZE="20" VALUE="" MAXLENGTH="4096">'); { do not localize }
    AddElem(Resp, '<INPUT TYPE="TEXT" NAME="' + sAddress + '" SIZE="40" VALUE="" MAXLENGTH="4096">'); { do not localize }
    Resp.Add('</tr>');                                       { do not localize }
    Resp.Add('</table>');                                    { do not localize }
    Resp.Add('<p>');                                         { do not localize }
    Resp.Add('<INPUT TYPE="SUBMIT" VALUE="Add" NAME="COMMAND">'); { do not localize }
    Resp.Add('<INPUT TYPE="SUBMIT" VALUE="Remove" NAME="COMMAND">'); { do not localize }
    Resp.Add('</FORM>');                                     { do not localize }
  end;

  procedure GetServicePorts(PortType: string);
  var
    I: Integer;
    IniFile: TMemIniFile;
    PortList: TStringList;
  begin
    IniFile := TMemIniFile.Create(AdminIniFile);
    try
      if IniFile.SectionExists(PortType) then
      begin
        PortList := TStringList.Create;
        try
          IniFile.ReadSectionValues(PortType, PortList);
          Pub.PortNames := nil;
          Pub.Locations := nil;
          SetLength(Pub.PortNames, PortList.Count);
          SetLength(Pub.Locations, PortList.Count);
          for I := 0 to PortList.Count - 1 do
          begin
            Pub.PortNames[I] := PortList.Names[I];
            Pub.Locations[I] := PortList.Values[PortList.Names[I]];
          end;
        finally
          PortList.Free;
        end;
      end;
    finally
      IniFile.Free;
    end;
  end;

begin
  Result := False;
  try
    Path := Request.InternalPathInfo;
    LastName := Copy(Path, LastDelimiter('/', Path) + 1, High(Integer));
    PreName := Copy(Path, 1, LastDelimiter('/', Path) - 1);
    PreName :=  Copy(PreName, LastDelimiter('/', PreName) + 1, High(Integer));
    WSDLBaseURL := GetHostScriptBaseURL(Request) + Path;
    Resp := nil;
    Pub := nil;
    CoInitialize(nil);
    try
      Resp := TStringList.Create;
      Pub :=  TWSDLPublish.Create;
      CreateDefaultEntries;
      if LastName = 'wsdl' then                              { do not localize }
      begin
        Resp.Add('<html><body>');                            { do not localize }
        Resp.Add('<title>' +  sWebServiceListing + '</title>'); { do not localize }
        Resp.Add('<h1>' + sWebServiceListing + '</h1><p>');  { do not localize }
        AddInterfaceList(Resp, WSDLBaseURL);
        if AdminEnabled then
          AddAdmin(WSDLBaseURL + '/' + 'admin');             { do not localize }
        Resp.Add('</html></body>');
        Response.Content := Resp.Text;
        Response.ContentType := 'text/html';                 { do not localize }
        Result := True;
      end
      else if LastName = 'admin' then                        { do not localize }
      begin
        Resp.Add('<html><body>');                            { do not localize }
        Resp.Add('<title>' +  sWebServiceListingAdmin + '</title>'); { do not localize }
        Resp.Add('<h1>' +  sWebServiceListingAdmin + '</h1><p>'); { do not localize }
        AddInterfaceList(Resp, WSDLBaseURL);
        Resp.Add('</html></body>');                          { do not localize }
        Response.Content := Resp.Text;
        Response.ContentType := 'text/html';                 { do not localize }
        Result := True;
      end
      else
      begin
        if PreName = 'wsdl' then                             { do not localize }
        begin
          GetServicePorts(LastName);
          WSDL := Pub.GetWSDLForPortType(LastName);
          if WSDL <> '' then
          begin
            Response.Content := UTF8Encode(WSDL);
            Response.ContentType := 'text/xml';              { do not localize }
            Result := True;
          end
          else
          begin
            //interface not found...
            Response.Content := Format(sInterfaceNotFound, [LastName]);
            Response.ContentType := 'text/html';            { do not localize }
            Result := True;
          end;
        end
        else if PreName = 'admin' then                       { do not localize }
        begin
          UpdatePortList(Request.QueryFields, LastName, Request.QueryFields.Values['COMMAND']);  { do not localize }
          Resp.Add('<html><body>');                          { do not localize }
          Resp.Add('<title>' +  sWSDLPortsforPortType + ' ' + LastName + '</title>'); { do not localize }
          Resp.Add('<h1>' + sWSDLPortsforPortType + ' ' + LastName + '</h1><p>'); { do not localize }
          AddPortList(Resp, LastName);
          Resp.Add('<p>');
          NewServicePortForm;                                { do not localize }
          Resp.Add('</html></body>');                        { do not localize }
          Response.Content := Resp.Text;
          Response.ContentType := 'text/html';               { do not localize }
          Result := True;
        end;
      end;
    finally
      CoUnInitialize;
      Pub.Free;
      Resp.Free;
    end;
  except
    Result := False;
  end;
end;


procedure TWSDLHTMLPublish.SetWebDispatch(const Value: TWebDispatch);
begin
 FWebDispatch.Assign(Value);
end;


initialization
  GroupDescendentsWith(TWSDLHTMLPublish, Controls.TControl);
  InvRegistry.RegisterInterface(TypeInfo(IWSDLPublish), '', 'Lists all the PortTypes published by this URL'); 
  InvRegistry.RegisterInvokableClass(TWSDLPublish);
  GetModuleFileName(HInstance, ModuleName, SizeOf(ModuleName));
  AdminIniFile := Copy(ModuleName, 1, StrLen(ModuleName) - Length(ExtractFileExt(ModuleName))) + '_WSDLADMIN.INI';  { do not localize }
end.
