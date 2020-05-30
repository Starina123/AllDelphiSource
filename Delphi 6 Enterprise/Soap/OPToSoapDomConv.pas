{*******************************************************}
{                                                       }
{ Borland Delphi Visual Component Library               }
{                 SOAP Support                          }
{                                                       }
{ Copyright (c) 2001 Borland Software Corporation       }
{                                                       }
{*******************************************************}

{
  converts a SOAP RPC request to/from an internal Delphi format using a DOM
}
unit OPToSoapDomConv;

interface

uses SysUtils,  Variants, TypInfo, Classes, XMLDOM, XMLDoc,  IntfInfo, InvokeRegistry,
     XMLIntf, OPConvert, WSDLNode, SoapEnv, SOAPDomConv;

type

  ESOAPDomConvertError = class(Exception);

  TIntegerDynArray = array of Integer;
  TSOAPArrayElemDesc = record
    MultiDim: Boolean;
    Dims: TIntegerDynArray;
  end;
  TSOAPArrayDesc = array of TSOAPArrayElemDesc;


  TMultiRefNodeMapElem = record
    Instance: Pointer;
    ID: string;
  end;
  TMultiRefNodeMap = array of TMultiRefNodeMapElem;

  TXMLNodeArray  = array of IXMLNode;
  TMultiRefNodeElem = record
    Node: IXMLNode;
    MultiRefChildren: TXMLNodeArray;
  end;
  TMultiRefNodes = array of TMultiRefNodeElem;


  ConvNodeState = (nsClientSend, nsServerReceive, nsServerSend, nsClientReceive);

  TSOAPDomConv = class(TSOAPDOMProcessor)
  private
    FIDs: Integer;
    RefMap: TMultiRefNodeMap;
    MultiRefNodes: TMultiRefNodes;
    FOptions: TSOAPConvertOptions;
    NodeState: ConvNodeState;
    ObjsWriting: array of TObject;
  protected
    function NodeIsNULL(Node: IXMLNode): Boolean;
    function CreateNULLNode(RootNode, ParentNode: IXMLNode; Name: InvString): IXMLNode;
    function GetNewID: string;
    function FindPrefixForURI(RootNode, Node: IXMLNode; URI: InvString; DeclIfNone: Boolean = False): InvString;
    function AddNamespaceDecl(Node: IXMLNode; URI: InvString): InvString;
    function GetElementType(Node: IXMLNode; var TypeURI, TypeName: InvString): Boolean;    function  CreateScalarNodeXS(RootNode, ParentNode: IXMLNode;  NodeName, URI, TypeName: WideString; Value: WideString; GenPre: Boolean = False): IXMLNode;
    function GetTypeBySchemaNS(Node: IXMLNode; URI: InvString): Variant;
    function CreateTypedNode(RootNode, ParentNode: IXMLNode; NodeName, URI, TypeName: WideString; GenPre: Boolean = False): IXMLNode;
    procedure SetNodeType(RootNode, InstNode: IXMLNode; const ElemURI, TypeName: InvString);
    function GetNodeAsText(Node: IXMLNode): InvString;
    function GetDataNode(RootNode, Node: IXMLNode; var ID: InvString): IXMLNode;
    procedure CheckEncodingStyle(Node: IXMLNode);
    { Methods to handle mutli-referenced nodes }
    procedure AddMultiRefNode(ID: string; Instance: Pointer);
    function FindMultiRefNodeByInstance(Instance: Pointer): string;
    function FindMultiRefNodeByID(ID: string): Pointer;
    function  CreateMultiRefNode(RootNode: IXMLNode; Name, ID: InvString): IXMLNode;
    procedure FinalizeMultiRefNodes;
    function FindNodeByHREF(RootNode: IXMLNode; HREF: InvString): IXMLNode;
    procedure AddObjectAsWriting(Instance: TObject);
    procedure RemoveObjectAsWriting(Instance: TObject);
    function IsObjectWriting(Instance: TObject): Boolean;
    procedure ResetMultiRef;
    { Methods to handle Variants }
    procedure ConvertVariantToSoap(RootNode, Node: IXMLNode;
          Name: InvString; Info: PTypeInfo; P: PVarData; NumIndirect: Integer; V: Variant; UseVariant: Boolean);
    procedure ConvertSoapToVariant(Node: IXMLNode; InvData: Pointer);
    procedure WriteVarArray(RootNode, Node: IXMLNode; Name: InvString; V: Variant);
    procedure WriteVariant(RootNode, Node: IXMLNode; Name: InvString; V: Variant);
    procedure ReadVariant(Node: IXMLNode; P: Pointer);
    function ReadVarArrayDim(Node: IXMLNode): Variant;
    procedure WriteVarArrayAsB64(RootNode, Node: IXMLNode; Name: InvString; V: Variant);
    { Methods to handle native delphi array types }
    function MakeArrayNode(RootNode, Node: IXMLNode;  Name, URI,  TypeName: InvString;
            Indices: array of Integer): IXMLNode;
    procedure ConvertNativeArrayToSoap(RootNode, Node: IXMLNode;
      Name: InvString; Info: PTypeInfo; P: Pointer; NumIndirect: Integer);
    procedure  WriteNonRectDynArray(RootNode, Node: IXMLNode; Name: InvString; Info: PTypeInfo; URI, TypeName: InvString; P: Pointer; Dims: Integer);
    function WriteNonRectDynArrayElem(RootNode, Node: IXMLNode;  Info: PTypeInfo; URI, TypeName: InvString; P: Pointer; Dim: Integer): Integer;
    function ConvertSoapToNativeArray(DataP: Pointer;  TypeInfo: PTypeInfo;
      RootNode, Node: IXMLNode): Pointer;
    function  ConvertSoapToNativeArrayElem(ArrayInfo, ElemInfo: PTypeInfo;
       RootNode, Node: IXMLNode; ArrayDesc: TSOAPArrayDesc; Dims, CurDim: Integer; DataP: Pointer): Pointer;
    procedure WriteRectDynArrayElem(RootNode, Node: IXMLNode; Info: PTypeInfo; Size, Dim: Integer; P: Pointer);
    procedure  WriteRectDynArray(RootNode, Node: IXMLNode; Info: PTypeInfo; Dims: Integer; P: Pointer);
    procedure ReadRectDynArray(RootNode, Node: IXMLNode; Info: PTypeInfo; Dims: Integer; P: Pointer; CurElem: Integer);
    procedure ReadRectDynArrayElem(RootNode, Node: IXMLNode; Info: PTypeInfo; Size, Dim: Integer; P: Pointer; var CurElem: Integer);
    procedure ReadRow(RootNode, Node: IXMLNode; var CurElem: Integer; Size: Integer; P: Pointer; Info: PTypeInfo);
    { Enums }
    function ConvertEnumToSoap(Info: PTypeInfo; P: Pointer; NumIndirect: Integer): InvString;
    function ConvertSoapToEnum(Info: PTypeInfo; S: InvString; IsNull: Boolean): Integer;

    { Methods that handle TObjects with RTTI }
    procedure  ConvertObjectToSOAP(Name: InvString; ObjP: Pointer; RootNode, Node: IXMLNOde; NumIndirect: Integer);
    function ConvertSOAPToObject(RootNode, Node: IXMLNode;
       AClass: TClass; URI, TypeName: WideString; ObjP: Pointer; NumIndirect: Integer): TObject;
    function CreateObjectNode(Instance: TObject; RootNode, Node: IXMLNode; Name, URI: InvString): InvString;
    procedure LoadObject(Instance: TObject; RootNode, Node: IXMLNode);
    procedure SetObjectPropFromText(Instance: TObject; PropInfo: PPropInfo; SoapData: WideString);
    function GetObjectPropAsText(Instance: TObject; PropInfo: PPropInfo): WideString;

    function GetOptions: TSOAPConvertOptions;
    procedure SetOptions(Value: TSOAPConvertOptions);
 public
    constructor Create(AOwner: TComponent); override;
    procedure ConvertNativeDataToSoap(RootNode, Node: IXMLNode;
      Name: InvString; Info: PTypeInfo; P: Pointer; NumIndirect: Integer);
    procedure ConvertSoapToNativeData(DataP: Pointer; TypeInfo: PTypeInfo;
      Context: TDataContext; RootNode, Node: IXMLNode; Translate, ByRef: Boolean; NumIndirect: Integer);
  published
    property Options: TSOAPConvertOptions read FOptions write FOptions;
  end;

  TOPToSoapDomConvert = class(TSOAPDomConv, IOPConvert)
  private
    FWSDLView: TWSDLView;
    Envelope: TSoapEnvelope;
    function GetSoapNS(MD: TIntfMetaData): InvString;
    procedure ProcessFault(FaultNode: IXMLNode);
    procedure ProcessSuccess(RespNode: IXMLNode; MD: TIntfMethEntry;
          InvContext: TInvContext);
    function GetPartName(MethMD: TIntfMetaData; ParamName: InvString): InvString;
    procedure CheckWSDL;
    function GetBinding: InvString;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { IOPConvert }
    procedure MsgToInvContext(const Request: InvString; const IntfMD: TIntfMetaData;
               var MethNum: Integer; Context: TInvContext); overload;
    procedure MsgToInvContext(const Request: TStream; const IntfMD: TIntfMetaData;
               var MethNum: Integer; Context: TInvContext); overload;
    function InvContextToMsg(const IntfMD: TIntfMetaData; MethNum: Integer; Con: TInvContext): InvString;
    procedure MakeResponse(const IntfMD: TIntfMetaData; const MethNum: Integer;  Context: TInvContext; Response: TStream);
    function MakeFault(const Ex: Exception): InvString;
    procedure ProcessResponse(const Resp: InvString; const MD: TIntfMethEntry;
          Context: TInvContext);  overload;
    procedure ProcessResponse(const Resp: TStream; const MD: TIntfMethEntry;
          Context: TInvContext);  overload;
  published
    property WSDLView: TWSDLView read FWSDLView write FWSDLView;
  end;

var
  DefArrayElemName: string = 'item';    { do not lcoalize }



implementation

uses  EncdDecd, SoapConst, InvRules,  TypeTrans, OPToSoapDomCustom, VarUtils,
  Types, XSBuiltIns, Controls, WSDLBind, XMLSchema;



procedure ParseDims(DimString: InvString; var Dims: TSOAPArrayDesc);
var
  I, J: Integer;
  CurDim, NumDims, SubDims, SubDim: Integer;
  StrLen: Integer;
  DimSize: InvString;
begin
  CurDim := 0;
  NumDims := 0;
  StrLen := Length(DimString);
  for I := 1 to StrLen do
    if DimString[I] = '[' then      { do not localize }
      Inc(NumDims);
  SetLength(Dims, NumDims);
  I := 1;
  while I < StrLen do
  begin
    if DimString[I] = '[' then       { do not localize }
    begin
      DimSize := '';
      Inc(I);
      SubDims := 1;
      SubDim := 0;
      if DimString[I] = ']' then               { do not localize }
        SetLength(Dims[CurDim].Dims, 1);
      while (DimString[I] <> ']') and (I < StrLen) do     { do not localize }
      begin
        J := I;
        while (DimString[J] <> ']') and (J < StrLen) do       { do not localize }
        begin
          if DimString[J] = ',' then
            Inc(SubDims);
          Inc(J);
        end;
        SetLength(Dims[CurDim].Dims, SubDims);
        if SubDims > 1 then
        begin
          Dims[CurDim].MultiDim := True;
          while (DimString[I] <> ']') and (I < StrLen) do     { do not localize }
          begin
            DimSize := '';
            while (DimString[I] <> ',') and (DimString[I] <> ']') and (I < StrLen) do   { do not localize }
            begin
              DimSize := DimSize + DimString[I];
              Inc(I);
            end;
            if DimString[I] = ',' then
              Inc(I);
            if trim(DimSize) <> '' then
              Dims[CurDim].Dims[SubDim] := StrToInt(trim(DimSize))
            else
              Dims[CurDim].Dims[SubDim] := 0;
            Inc(SubDim);
          end
        end else
        begin
          while (DimString[I] <> ']') and (I < StrLen) do      { do not localize }
          begin
            DimSize := DimSize + DimString[I];
            Inc(I);
          end;
          if trim(DimSize) <> '' then
            Dims[CurDim].Dims[SubDim] := StrToInt(trim(DimSize))
          else
            Dims[CurDim].Dims[SubDim] := 0;
        end;
      end;
      Inc(I);
      Inc(CurDim);
    end else
      Inc(I);
  end;
end;

{ TOPToSoapDomConvert }

type
  PTObject = ^TObject;


{ Server Recieve Message }
procedure TOPToSoapDomConvert.MsgToInvContext(const Request: InvString;
  const IntfMD: TIntfMetaData; var MethNum: Integer; Context: TInvContext);
var
  Stream: TStream;
begin
  Stream := TMemoryStream.Create;
  try
    Stream.Write(Request[1], Length(Request) * 2);
    Stream.Position := 0;
    MsgToInvContext(Stream, IntfMD, MethNum, Context);
  finally
    Stream.Free;
  end;
end;

procedure TOPToSoapDomConvert.MsgToInvContext(const Request: TStream;
  const IntfMD: TIntfMetaData; var MethNum: Integer; Context: TInvContext);
var
  XmlDoc: IXMLDocument;
  I, J, K: Integer;
  MethodName, InternalMethodName, ExtParamName: InvString;
  EnvNode, MethNode, Node: IXMLNode;
  ProcessedBody: Boolean;
  MD: TIntfMethEntry;
  HeaderProcessor:   IDOMHeaderProcessor;
  HeaderHandled, AbortRequest: Boolean;
  Translate: Boolean;
begin
  XmlDoc := NewXMLDocument;
  Request.Position := 0;
  XmlDoc.LoadFromStream(Request);
  EnvNode := XmlDoc.DocumentElement;
  if EnvNode = nil then
    raise ESOAPDomConvertError.Create(SInvalidSOAPRequest);
  if (EnvNode.LocalName <> SSoapEnvelope) or (EnvNode.NamespaceURI <> SSoapNameSpace) then
    raise ESOAPDomConvertError.Create(SInvalidSOAPRequest);

  ProcessedBody := False;
  try
    if EnvNode.hasChildNodes then
    begin
      for I := 0 to EnvNode.childNodes.Count -1 do
      begin
        Node := EnvNode.childNodes[I];
        if Node.LocalName = SSoapHeader then
        begin
           AbortRequest := False;
           HeaderProcessor := FindHeaderProcessor(Node.NameSpaceURI, Node.LocalName, ''); 
           if HeaderProcessor = nil then
             HeaderProcessor.ProcessHeader(Node, HeaderHandled, AbortRequest)
           else
             DefaultProcessHeader(Node, HeaderHandled, AbortRequest);
           if AbortRequest then
             raise ESOAPDomConvertError.CreateFmt(SHeaderError, [Node.LocalName]);
        end
        else if Node.LocalName = SSoapBody then
        begin
          if ProcessedBody then
            raise ESOAPDomConvertError.Create(SMultiBodyNotSupported);
          CheckEncodingStyle(EnvNode);
          ProcessedBody := True;
          if Node.ChildNodes.Count > 0 then
          begin
            MethNode := Node.childNodes[0];  
            CheckEncodingStyle(MethNode);
            MethodName := MethNode.LocalName;
            InternalMethodName := InvRegistry.GetMethInternalName(IntfMD.Info, MethodName);
            MethNum := GetMethNum(IntfMD, InternalMethodName);
            if MethNum = -1 then
                raise ESOAPDomConvertError.CreateFmt(SNoSuchMethod, [MethodName]);
            MD := IntfMD.MDA[MethNum];
            Context.SetMethodInfo(MD);
            Context.AllocServerData(MD);
            for K := 0 to Length(MD.Params) - 1 do
            begin
              ExtParamName := InvRegistry.GetParamExternalName(IntfMD.Info, InternalMethodName, MD.Params[K].Name);
              for J := 0 to MethNode.childNodes.Count -1 do
              begin
                if SameText(ExtParamName, MethNode.childNodes[J].LocalName) then
                begin
                  CheckEncodingStyle(MethNode.childNodes[J]);
                  Translate := (pfVar in MD.Params[K].Flags)
                    or (pfConst in  MD.Params[K].Flags)
                    or ([] =  MD.Params[K].Flags)
                    or ((pfReference in MD.Params[K].Flags) and (MD.Params[K].Info.Kind = tkVariant))
                    or ((pfReference in MD.Params[K].Flags) and (MD.Params[K].Info.Kind = tkString));
                  ConvertSoapToNativeData(Context.GetParamPointer(K), MD.Params[K].Info, Context, MethNode,
                    MethNode.childNodes[J], Translate, False,  1);
                  break;
                end;
              end;
            end;
          end;
        end;
      end;
    end else
      raise ESOAPDomConvertError.Create(SInvalidSOAPRequest);
  finally
    ResetMultiRef;
  end;
end;


procedure TOPToSoapDomConvert.MakeResponse(const IntfMD: TIntfMetaData; const MethNum: Integer;  Context: TInvContext; Response: TStream);
var
  I: Integer;
  XmlDoc: IXMLDocument;
  EnvNode, BodyNode, MethNode: IXMLNode;
  MD: TIntfMethEntry;
  SoapNS: InvString;
  ArgName: InvString;
  P: Pointer;
  Hdr, WResp: WideString;
begin
  MD := IntfMD.MDA[MethNum];
  XMLDoc := NewXMLDocument('');
  EnvNode := Envelope.MakeEnvelope(XMLDoc);
  XmlDoc.DocumentElement := EnvNode;
  BodyNode := Envelope.MakeBody(EnvNode);
  SoapNS := GetSoapNS(IntfMD);
  MethNode := BodyNode.AddChild(MD.Name + SSoapResponseSuff, SoapNS, True);
  MethNode.Attributes[FindPrefixForURI(EnvNode, BodyNode, SSoapNameSpace) + ':' + SSoapEncodingAttr] := SSoap11EncodingS5;   { do not localize }
  FIDS := 1;
  try
    if MD.ResultInfo <> nil  then
    begin
      ArgName := GetPartName(IntfMD, '');
      ConvertNativeDataToSoap(MethNode, MethNode, ArgName, MD.ResultInfo, Context.GetResultPointer, 1);
    end;
    for I := 0 to MD.ParamCount - 1  do
    begin
      if (pfVar in MD.Params[I].Flags) or (pfOut in MD.Params[I].Flags)
      then
      begin
        P := Context.GetParamPointer(I);
        ConvertNativeDataToSoap(MethNode, MethNode, MD.Params[I].Name, MD.Params[I].Info, P, 1);
      end;
    end;
  finally
    FinalizeMultiRefNodes;
    ResetMultiRef;
  end;
  XmlDoc.SaveToXML(WResp);
  Response.Position := 0;
  Hdr := SSoapXMLHeader;
  Response.Write(Hdr[1], Length(Hdr) * 2);
  WResp := Trim(WResp);
  Response.Write(WResp[1], Length(WResp) * 2);
  Response.Position := 0;
end;

function TOPToSoapDomConvert.GetSoapNS(MD: TIntfMetaData): InvString;
var
  ExtName: WideString;
begin
  if Assigned(WSDLView) then
  begin
    ExtName :=  InvRegistry.GetMethExternalName(MD.Info, WSDLVIew.Operation);
    Result := WSDLView.WSDL.GetSoapBodyAttribute(GetBinding, ExtName, WSDLBind.SInput, WSDLBind.SNameSpace)
  end else
    Result := InvRegistry.GetNamespaceByGUID(MD.IID);
end;

function TOPToSoapDomConvert.MakeFault(const Ex: Exception): InvString;
var
  XmlDoc: IXMLDocument;
  EnvNode, BodyNode, FaultNode, FC, FS, FD: IXMLNode;
  I, Count: Integer;
  PropList: PPropList;
  URI, TypeName: WideString;
  IsScalar: Boolean;
begin
  Result := '';
  XMLDoc := NewXMLDocument('');
  EnvNode := Envelope.MakeEnvelope(XMLDoc);
  BodyNode := Envelope.MakeBody(EnvNode);
  FaultNode := Envelope.MakeFault(BodyNode);
  FC := FaultNode.AddChild(SSoapFaultCode);
  FC.Text := 'SOAP-ENV:Server'; // todo          { do not localize }
  FS := FaultNode.AddChild(SSoapFaultString);
  FS.Text := Ex.Message;
  if Ex.InheritsFrom(ERemotableException) then
  begin
    RemClassRegistry.ClassToURI(Ex.ClassType, URI, TypeName, IsScalar);
    FD := FaultNode.AddChild(SSoapFaultDetails, URI, True);
    FD.Attributes[FindPrefixForURI(EnvNode, BodyNode, XMLSchemaInstNameSpace)  + ':' + SSoapType] := FD.Prefix + ':' + TypeName;   { do not localize }
    Count := GetTypeData(Ex.ClassInfo)^.PropCount;
    if Count > 0 then
    begin
      GetMem(PropList, Count * SizeOf(Pointer));
      try
        GetPropInfos(Ex.ClassInfo, PropList);
        for I := 0 to Count - 1 do
        begin
          if not RemTypeRegistry.TypeInfoToXSD( (PropList[I].PropType)^, URI, TypeName) then
            raise ESOAPDomConvertError.CreateFmt(SRemTypeNotRegistered, [(PropList[I].PropType)^.Name]);
          CreateScalarNodeXS(FaultNode, FD, PropList[I].Name, URI, TypeName, GetObjectPropAsText(Ex, PropList[I]));
        end;
      finally
        FreeMem(PropList, Count * SizeOf(Pointer));
      end;
    end;
  end;

  XmlDoc.SaveToXML(Result);
  Result := SSOAPXMLHeader + Trim(Result);
end;

function TOPToSoapDomConvert.InvContextToMsg(const IntfMD: TIntfMetaData; MethNum: Integer; Con: TInvContext): InvString;
var
  XMLDoc: IXMLDocument;
  EnvNode, BodyNode, MethNode: IXMLNode;
  I: Integer;
  SoapMethNS: InvString;
  MethMD: TIntfMethEntry;
  P: Pointer;
  Indir: Integer;
  ExtMethName, ExtParamName: InvString;
begin
  MethMD := IntfMD.MDA[MethNum];
  if Assigned(WSDLView) then
  begin
    WSDLView.Operation := MethMD.Name;
    WSDLView.IntfInfo := IntfMD.Info;
  end;
  XMLDoc := NewXMLDocument('');
  EnvNode := Envelope.MakeEnvelope(XMLDoc);
  BodyNode := Envelope.MakeBody(EnvNode);

  // Add Method node with appropriate namespace
  SoapMethNS := GetSoapNS(IntfMD);
  ExtMethName := InvRegistry.GetMethExternalName(IntfMD.Info, MethMD.Name);
  MethNode := BodyNode.AddChild(ExtMethName, SoapMethNS, True);

  // Use encoding style defined by SOAP 1.1 section 5
  MethNode.Attributes[FindPrefixForURI(EnvNode, BodyNode, SSoapNameSpace) + ':' + SSoapEncodingAttr] := SSoap11EncodingS5;  { do not localize }

  FIDS := 1;
  try
    // Add each parameter to the method node
    for I := 0 to MethMD.ParamCount - 1  do
    begin
      if not (pfOut in MethMD.Params[I].Flags) then
      begin
        ExtParamName := InvRegistry.GetParamExternalName(IntfMD.Info, MethMD.Name, MethMD.Params[I].Name);
        P := Con.GetParamPointer(I);
        Indir := 1;
        if IsParamByRef(MethMd.Params[I].Flags, MethMD.Params[I].Info, MethMD.CC) then
          Inc(Indir);
        ConvertNativeDataToSoap(MethNode, MethNode, ExtParamName, MethMD.Params[I].Info, P, Indir);
      end;
    end;
    FinalizeMultiRefNodes;
  finally
    ResetMultiRef;
  end;
  XMLDoc.SaveToXML(Result);
  Result := SSoapXMLHeader + trim(Result);
end;

procedure TOPToSoapDomConvert.ProcessSuccess(RespNode: IXMLNode; MD: TIntfMethEntry;
          InvContext: TInvContext);
var
  I, J: Integer;
  InvData: Pointer;
  Node: IXMLNode;
  ByRef: Boolean;
  Indir: Integer;
  ParamProcessed: TBooleanDynArray;
  ReturnProcessed: Boolean;
begin
  SetLength(ParamProcessed, MD.ParamCount);
  ReturnProcessed := False;
  for J := 0 to Length(ParamProcessed) - 1 do
    ParamProcessed[J] := False;
  for I := 0 to RespNode.childNodes.Count - 1 do
  begin
    Node := RespNode.childNodes[I];
    if (CompareText(Node.LocalName, SDefaultReturnName) = 0) or
       (CompareText(Node.LocalName, SDefaultResultName) = 0) then
    begin
      if ReturnProcessed then
        continue;
      ReturnProcessed := True;
      if (MD.ResultInfo <> nil) and (I <> 0) then
        raise ESOAPDomConvertError.CreateFmt(SMissingSoapReturn, [Node.LocalName]);
      InvData := InvContext.GetResultPointer;
      ByRef := IsParamByRef([pfOut], MD.ResultInfo, MD.CC);
      ConvertSoapToNativeData(InvData, MD.ResultInfo, InvContext, RespNode, Node, True, ByRef,  1);
    end
    else
    begin
      J := 0;
      while J < MD.ParamCount do
      begin
        if MD.Params[J].Name = Node.LocalName then
          break;
        Inc(J);
      end;
      if (J < MD.ParamCount) and not ParamProcessed[J]  then
      begin
        ParamProcessed[J] := True;
        InvData := InvContext.GetParamPointer(J);
        ByRef := IsParamByRef(MD.Params[J].Flags, MD.Params[J].Info, MD.CC);
        Indir := 1;
        if IsParamByRef(MD.Params[J].Flags, MD.Params[J].Info, MD.CC) then
          Inc(Indir);
        ConvertSoapToNativeData(InvData, MD.Params[J].Info, InvContext, RespNode, Node, True, ByRef,  Indir);
      end;
    end;
  end;
end;


procedure TOPToSoapDomConvert.ProcessFault(FaultNode: IXMLNode);
var
  FC, FS, FD: IXMLNode;
  I, J: Integer;
  Message: WideString;
  AClass: TClass;
  URI, TypeName: WideString;
  IsNull, IsScalar: Boolean;
  Count: Integer;
  PropList: PPropList;
  Ex: Exception;
begin
  FS := nil;
  FC := nil;
  FD := nil;
  Ex := nil;
  for I := 0 to FaultNode.ChildNodes.Count - 1 do
    if SameText(FaultNode.ChildNodes[I].LocalName, SSoapFaultCode) then
    begin
       FC := FaultNode.ChildNodes[I];
       break;
    end;
  for I := 0 to FaultNode.ChildNodes.Count - 1 do
    if SameText(FaultNode.ChildNodes[I].LocalName, SSoapFaultString) then
      begin
        FS := FaultNode.ChildNodes[I];
        break;
      end;
  for I := 0 to FaultNode.ChildNodes.Count - 1 do
    if SameText(FaultNode.ChildNodes[I].LocalName, SSoapFaultDetails) then
      begin
        FD := FaultNode.ChildNodes[I];
        break;
      end;
  if FS <> nil then
    Message := FS.Text;
  if FD <> nil then
  begin
    GetElementType(FD, URI, TypeName);
    AClass := RemClassRegistry.URIToClass(URI, TypeName, IsScalar);
    if AClass <> nil then
    begin
      if AClass.InheritsFrom(ERemotableException) then
      begin
        Ex := ERemotableExceptionClass(AClass).Create(Message);
        Count := GetTypeData(Ex.ClassInfo)^.PropCount;
        if (Count > 0) and Assigned(FD.ChildNodes) then
        begin
          GetMem(PropList, Count * SizeOf(Pointer));
          try
            GetPropInfos(Ex.ClassInfo, PropList);
            for I := 0 to Count - 1 do
            begin
              for J := 0 to FD.ChildNodes.Count - 1 do
                if FD.ChildNodes[J].LocalName = PropList[I].Name then
                 SetObjectPropFromText(Ex, PropList[I], FD.ChildNodes[J].Text);
            end;
          finally
            FreeMem(PropList, Count * SizeOf(Pointer));
          end;
        end;
      end;
    end;
  end;
  if Ex = nil then
    Ex := Exception.Create(Message);
  raise Ex;
end;


procedure TOPToSoapDomConvert.ProcessResponse(const Resp: InvString;
  const MD: TIntfMethEntry; Context: TInvContext);
var
 Stream: TMemoryStream;
begin
   Stream := TMemoryStream.Create;
  try
    Stream.Write(Resp[1], Length(Resp));
    ProcessResponse(Stream, MD, Context);
  finally
    Stream.Free;
  end
end;

procedure TOPToSoapDomConvert.ProcessResponse(const Resp: TStream;
  const MD: TIntfMethEntry; Context: TInvContext);
var
  XmlDoc: IXMLDocument;
  I: Integer;
  EnvNode, RespNode, Node: IXMLNode;
  ProcessedHeader, ProcessedBody: Boolean;
  HeaderProcessor:   IDOMHeaderProcessor;
  HeaderHandled, AbortRequest: Boolean;
begin
  XmlDoc := NewXMLDocument;
  Resp.Position := 0;
  XmlDoc.LoadFromStream(Resp);
  EnvNode := XmlDoc.DocumentElement;
  if EnvNode = nil then
    raise ESOAPDomConvertError.Create(SInvalidResponse); 
  if (EnvNode.LocalName <> SSoapEnvelope) or (EnvNode.NamespaceURI <>  SSoapNameSpace) then
    raise ESOAPDomConvertError.CreateFmt(SWrongDocElem, [SSoapNameSpace, SSoapEnvelope, EnvNode.NamespaceURI, EnvNode.LocalName]);

  ProcessedHeader := False;
  ProcessedBody := False;

  if EnvNode.hasChildNodes then
  begin
    for I := 0 to EnvNode.childNodes.Count -1 do
    begin
      Node := EnvNode.childNodes[I];
      if Node.LocalName = SSoapHeader then
      begin
        if ProcessedHeader then
          raise ESOAPDomConvertError.Create(SInvalidSOAPRequest);
        ProcessedHeader := True;
        HeaderProcessor := FindHeaderProcessor(Node.NameSpaceURI, Node.LocalName, '');
        if HeaderProcessor <> nil then
          HeaderProcessor.ProcessHeader(Node, HeaderHandled, AbortRequest)
        else
          DefaultProcessHeader(Node, HeaderHandled, AbortRequest);

      end
      else if Node.LocalName = SSoapBody then
      begin
        if ProcessedBody then
          raise ESOAPDomConvertError.Create(SInvalidSOAPRequest);
        ProcessedBody := True;
        RespNode := Node.childNodes[0];
        try
          if RespNode.LocalName = SSoapFault then
            ProcessFault(RespNode)
          else
            ProcessSuccess(RespNode, MD, Context);
        finally
          ResetMultiRef;
        end;
      end;
    end
  end else
    raise ESOAPDomConvertError.Create(SInvalidSOAPRequest);
end;

constructor TOPToSoapDomConvert.Create(AOwner: TComponent);
begin
  inherited;
  Envelope := TSoapEnvelope.Create;
  FIDs := 1;
  Options := Options + [soSendMultiRefObj, soTryAllSchema];
end;

destructor TOPToSoapDomConvert.Destroy;
begin
  Envelope.Free;
  inherited;
end;

procedure  TOPToSoapDomConvert.CheckWSDL;
begin
  if Assigned(WSDLView.WSDL) then
  begin
    if not WSDLView.WSDL.Active then
      WSDLView.WSDL.Active := True;
  end
  else
    raise ESOAPDomConvertError.Create(SNoWSDL);
end;

function  TOPToSoapDomConvert.GetBinding: InvString;
var
  I: Integer;
begin
  CheckWSDL;
  Result := WSDLView.WSDL.GetBindingForServicePort(WSDLView.Service, WSDLView.Port);
  I := Pos(':', Result);    { do not localize }
  if I  > 0 then
    Result := Copy(Result, I + 1, High(Integer));
end;

// ParamName = '' implies function return value
function TOPToSoapDomConvert.GetPartName(MethMD: TIntfMetaData; ParamName: InvString): InvString;
begin
  if ParamName = '' then
    Result := SDefaultReturnName
  else
    Result := InvRegistry.GetNamespaceByGUID(MethMD.IID);
end;




{ TSOAPDomConv }
constructor TSOAPDomConv.Create(AOwner: TComponent);
begin
  inherited;
end;


procedure TSOAPDomConv.ConvertVariantToSoap(RootNode, Node: IXMLNode;
  Name: InvString; Info: PTypeInfo; P: PVarData; NumIndirect: Integer; V: Variant; UseVariant: Boolean);
var
  DataP: Pointer;
begin
  if UseVariant then
  begin
    if VarIsNull(V) then
      CreateNULLNode(RootNode, Node, Name)
    else
      WriteVariant(RootNode, Node, Name, V);
  end else
  begin
    DataP := P;
    if NumIndirect > 1 then
      DataP := Pointer(PInteger(DataP)^);
    if (DataP = nil) or VarIsNull(Variant(DataP^)) then
      CreateNULLNode(RootNode,Node, Name)
    else
      WriteVariant(RootNode, Node, Name, Variant(DataP^));
  end;
end;




procedure TSOAPDomConv.WriteVariant(RootNode, Node: IXMLNode; Name: InvString; V: Variant);
var
  S, URI, TypeName: InvString;
  Info: PTypeInfo;
  AClass: TClass;
  IsScalar: Boolean;
  DT: TXSDateTime;
begin
  if VarIsArray(V) then
  begin
    if VarType(V) and varTypeMask = varByte then
    begin
      WriteVarArrayAsB64(RootNode, Node, Name, V);
    end
    else
    WriteVarArray(RootNode, Node, Name, V);
  end
  else
  begin
    if VarIsNull(V) or VarIsEmpty(V) then
       CreateNULLNode(RootNode,Node, Name)
    else
    begin
      Info :=  RemTypeRegistry.VariantToInfo(V, soTryAllSchema in Options);
      if Info = nil then
         raise ESOAPDomConvertError.Create(SUnsupportedVariant);
      RemTypeRegistry.InfoToURI(Info, URI, TypeName, IsScalar);
      if Info.Kind = tkClass then
      begin
        AClass := GetTypeData(Info).ClassType;
        if not AClass.InheritsFrom(TRemotableXS) then
          raise ESOAPDomConvertError.Create(SUnsupportedVariant);
        DT := DateTimeToXSDateTime(V);
        S := DT.NativeToXS;
        DT.Free;
      end else
        S := V;
      CreateScalarNodeXS(RootNode, Node, Name, URI, TypeName, S);
    end;
  end;
end;

function TSOAPDomConv.MakeArrayNode(RootNode, Node: IXMLNode;  Name, URI, TypeName: InvString;
  Indices: array of Integer): IXMLNode;
var
  ArraySpec, Dims: InvString;
  I: Integer;
  First: Boolean;
  SoapPre, Pre: InvString;
  ID: string;
  MultiRefNode: IXMLNode;
begin
  if (URI = '') or (TypeName = '') then  // assume we have a variant type and don't create an array node
  begin
    Result := Node.AddChild(Name);
  end else
  begin

    if soSendMultiRefArray in Options then
    begin
      ID := GetNewID;
      Pre := FindPrefixForURI(RootNode, Node,  URI, True);
      Result :=  Node.AddChild(Pre + ':' + Name);  { do not localize }
      Result.Attributes[SXMLHREF] := SHREFPre + ID;
      Pre := FindPrefixForURI(RootNode, Node, SSoap11EncodingS5, True);
      MultiRefNode := CreateMultiRefNode(RootNode, Pre + ':' + SSoapEncodingArray, ID);   { do not localize }
      Result := MultiRefNode;
    end else
    begin
       MultiRefNode := nil;
       Result := CreateTypedNode(RootNode, Node, Name, SSoap11EncodingS5, SSoapEncodingArray);
    end;
    begin
      I := 0;
      if Indices[I] = 0 then
      begin
        while (I < Length(Indices) - 1) and (Indices[I] = 0) do
        begin
          Dims := Dims + '[]';    { do not localize }
          Inc(I);
        end;
      end;


      First := True;
      if I < Length(Indices)  then
      begin
        Dims := Dims + '[';          { do not localize }
        while I < Length(Indices)  do
        begin
          if not First then
          begin
            Dims := Dims + ',';      { do not localize }
          end;
          First := False;
          if Indices[I] <> 0 then
            Dims := Dims + IntToStr(Indices[I]);
          Inc(I);
        end;
        Dims := Dims +  ']';       { do not localize }
      end;
    end;
    SoapPre := FindPrefixForURI(RootNode, Node, SSoap11EncodingS5, True);
    Pre := FindPrefixForURI(RootNode, Node, URI, True);
    if not (soSendUntyped in Options) then
    begin
      ArraySpec := Pre + ':' + TypeName + Dims;     { do not localize }
      Result.Attributes[SoapPre + ':' + SSoapEncodingArrayType] := ArraySpec;    { do not localize }
    end;
  end;
end;

procedure TSOAPDomConv.WriteVarArrayAsB64(RootNode, Node: IXMLNode; Name: InvString; V: Variant);
var
  I, DimCount, VSize: Integer;
  LoDim, HiDim: array of integer;
  P: Pointer;
  S, Encd: String;
  ElemNode: IXMLNode;
begin
  DimCount := VarArrayDimCount(V);
  SetLength(LoDim, DimCount);
  SetLength(HiDim, DimCount);
  for I := 1 to DimCount do
  begin
    LoDim[I - 1] := VarArrayLowBound(V, I);
    HiDim[I - 1] := VarArrayHighBound(V, I);
  end;
  VSize := 0;
  for i := 0 to DimCount - 1 do
    VSize := (HiDim[i] - LoDim[i] + 1);
  P := VarArrayLock(V);
  try
    SetString(S, PChar(P), VSize);
  finally
    VarArrayUnlock(V);
  end;
  Encd :=  EncodeString(S);
  ElemNode := CreateScalarNodeXS(RootNode, Node, Name, XMLSchemaNamespace, 'base64Binary', Encd);   { do not localize }
end;

procedure TSOAPDomConv.WriteVarArray(RootNode, Node: IXMLNode; Name: InvString; V: Variant);
var
  I, DimCount: Integer;
  LoDim, HiDim, Indices: array of integer;
  V1: Variant;
  ElemNode: IXMLNode;
begin
  if  not VarIsArray(V) then
  begin
    WriteVariant(RootNode, Node, Name, V);
  end
  else
  begin
    ElemNode := Node.AddChild(Name);
    DimCount := VarArrayDimCount(V);
    SetLength(LoDim, DimCount);
    SetLength(HiDim, DimCount);
    for I := 1 to DimCount do
    begin
      LoDim[I - 1] := VarArrayLowBound(V, I);
      HiDim[I - 1] := VarArrayHighBound(V, I);
    end;
    SetLength(Indices, DimCount);
    for I := 0 to DimCount - 1 do
      Indices[I] := LoDim[I];
    while True do
    begin
      V1 := VarArrayGet(V, Indices);
      if VarIsArray(V1) then
        WriteVarArray(RootNode, ElemNode, SDefVariantElemName, V1)
      else
        WriteVariant(RootNode, ElemNode, SDefVariantElemName, V1);

      Inc(Indices[DimCount - 1]);
      if Indices[DimCount - 1] > HiDim[DimCount - 1] then
        for i := DimCount - 1 downto 0 do
          if Indices[i] > HiDim[i] then
          begin
            if i = 0 then Exit;
            Inc(Indices[i - 1]);
            Indices[i] := LoDim[i];
          end;
    end;
  end;
end;



function  TSOAPDomConv.ReadVarArrayDim(Node: IXMLNode): Variant;
var
  I: Integer;
  SoapTypeInfo: PTypeInfo;
  ChildNode: IXMLNode;
  TypeURI, TypeName: InvString;
  IsNull: Boolean;
  DT: TXSDateTime;
begin
  if Node.ChildNodes.Count = 0 then
  begin
    Result := NULL;
    Exit;
  end;

  IsNull := NodeIsNull(Node.ChildNodes[0]);
  if not IsNull then
  begin
    Result := VarArrayCreate([0, Node.ChildNodes.Count-1], VarVariant);
    for I := 0 to Node.ChildNodes.Count -1 do
    begin
      ChildNode := Node.ChildNodes[I];
      if ChildNode.ChildNodes.Count > 1 then
      begin
        Result[I] := ReadVarArrayDim(ChildNode);
      end else
      begin
        if not NodeIsNULL(ChildNode) then
        begin
          GetElementType(ChildNode, TypeURI, TypeName);
          SoapTypeInfo := RemTypeRegistry.XSDToTypeInfo(TypeURI, TypeName);
          if SoapTypeInfo = nil then
            SoapTypeInfo := TypeInfo(System.WideString);
          if (SoapTypeInfo.Kind = tkClass) and (GetTypeData(SoapTypeInfo).ClassType = TXSDateTime) then
          begin
            DT := TXSDateTime.Create;
            DT.XSToNative(ChildNode.Text);
            Result[I] := DT.AsDateTime;
            DT.Free;
          end else
          Result[I] := TypeTranslator.CastSoapToVariant(SoapTypeInfo, ChildNode.Text);
        end else
          Result[I] := NULL;
      end;
    end;
  end else
    Result := NULL;
end;

procedure TSOAPDomConv.ConvertSoapToVariant(Node: IXMLNode; InvData: Pointer);
var
  Info: PTypeInfo;
  TypeURI, TypeName: InvString;
  DT: TXSDateTime;
begin
  if not Assigned(Node.ChildNodes) then
    Exit;
  if Node.ChildNodes.Count = 0 then
    Variant(PVarData(InvData)^) := NULL;
  if (Node.ChildNodes.Count > 1) or Node.ChildNodes[0].IsTextElement then
    Variant(PVarData(InvData)^) := ReadVarArrayDim(Node)
  else
  begin
    GetElementType(Node, TypeURI, TypeName);
    Info := RemTypeRegistry.XSDToTypeInfo(TypeURI, TypeName);
    if Info = nil then
      Info := TypeInfo(System.WideString);
    if (Info.Kind = tkClass) and (GetTypeData(Info).ClassType = TXSDateTime) then
    begin
      DT := TXSDateTime.Create;
      DT.XSToNative(Node.Text);
      Variant(PVarData(InvData)^) := DT.AsDateTime;
      DT.Free;
    end else
      TypeTranslator.CastSoapToVariant(Info, GetNodeAsText(Node), InvData);
  end;
end;


function TSOAPDomConv.FindNodeByHREF(RootNode: IXMLNode; HREF: InvString): IXMLNode;
var
  I: Integer;
  V: Variant;
begin
  Result := nil;
  for I := 0 to RootNode.ChildNodes.Count -1 do
  begin
    V := RootNode.ChildNodes[I].Attributes[SXMLID];
    if not VarIsNull(V) and (SHREFPre + V = HREF) then
    begin
      Result := RootNode.ChildNodes[I];
      Exit;
    end;
  end;
end;


function GetDynArrayLength(P: Pointer): Integer;
begin
  asm
    MOV  EAX, DWORD PTR P
    CALL System.@DynArrayLength
    MOV DWORD PTR [Result], EAX
  end;
end;

function RecurseArray(P: Pointer; var Dims: Integer): Boolean;
var
  I, Len, Size: Integer;
  ElemDataP: Pointer;
  Size2: Integer;
begin
  Result := True;
  if Dims > 1 then
  begin
    Len := GetDynArrayLength(P);
    ElemDataP := Pointer(PInteger(P)^);
    Size := GetDynArrayLength(ElemDataP);
    for i := 0 to Len - 1 do
    begin
      Size2 :=  GetDynArrayLength(ElemDataP);
      if Size <> Size2 { GetDynArrayLength(ElemDataP) } then
      begin
        Result := False;
        Exit;
      end;
      if Dims > 1 then
      begin
        Dec(Dims);
        Result := RecurseArray(ElemDataP, Dims);
        if not Result then
          Exit;
      end;
      ElemDataP := Pointer(PInteger(Pointer(Integer(P) + 4))^);
    end;
  end;
end;

function IsArrayRect(P: Pointer; Dims: Integer): Boolean;
var
  D: Integer;
begin
  D := Dims;
  Result := RecurseArray(P, D);
end;



procedure GetDims(ArrP: Pointer; DimAr: TIntegerDynArray; Dims: Integer);
var
  I: Integer;
begin
  for I := 0 to Dims - 1 do
  begin
    DimAr[I] := GetDynArrayLength(ArrP);
    if I < Dims - 1 then
      ArrP := Pointer(PInteger(ArrP)^);
  end;
end;

procedure TSOAPDomConv.WriteRectDynArrayElem(RootNode, Node: IXMLNode; Info: PTypeInfo; Size, Dim: Integer; P: Pointer);
var
  I: Integer;
  S: InvString;
  IsNull: Boolean;
  ArNode: IXMLNode;
  ElemSize: Integer;
begin
  if Dim > 1 then
  begin
    Dec(Dim);
    for I := 0 to Size - 1 do
    begin
      ElemSize := GetDynArrayLength(Pointer(PInteger(P)^));
      WriteRectDynArrayElem(RootNode, Node, Info, ElemSize, Dim, Pointer(PInteger(P)^));
      P := Pointer(Integer(P) + sizeof(Pointer));
    end;
  end
  else
  begin
    for I := 0 to Size - 1 do
    begin
      if Info.Kind = tkClass then
      begin
        ConvertObjectToSOAP(DefArrayElemName, P, RootNode,  Node, 1);
      end else
      if Info.Kind = tkVariant then
      begin
        ConvertVariantToSoap(RootNode, Node, DefArrayElemName, Info, P, 1, NULL, False);
      end else
      begin
        if Info.Kind = tkEnumeration then
          S := ConvertEnumToSoap(Info, P, 1)
        else
          TypeTranslator.CastNativeToSoap(Info, S, P, IsNull);
        ArNode := Node.AddChild(DefArrayElemName);
        ArNode.Text := S;
      end;
      P := Pointer( Integer(P) + GetTypeSize(Info));
    end;
  end;
end;

procedure  TSOAPDomConv.WriteRectDynArray(RootNode, Node: IXMLNode; Info: PTypeInfo; Dims: Integer; P: Pointer);
begin
  WriteRectDynArrayElem(RootNode, Node, Info, GetDynArrayLength(P), Dims, P);
end;

function TSOAPDomConv.WriteNonRectDynArrayElem(RootNode, Node: IXMLNode;  Info: PTypeInfo; URI, TypeName: InvString; P: Pointer; Dim: Integer): Integer;
var
  I, Len: Integer;
  IsNull: Boolean;
  ElemNode, DataNode: IXMLNode;
  ArrayDims: TIntegerDynArray;
  ID: Integer;
  S: InvString;
begin
  Len := GetDynArrayLength(P);
  if Dim > 1 then
  begin
    SetLength(ArrayDims, Dim);
    for I := 0 to Dim - 2 do
      ArrayDims[I] := 0;
    ArrayDims[Dim-1] := Len;
    Dec(Dim);
    ElemNode := MakeArrayNode(RootNode, RootNode,  DefArrayElemName, URI, TypeName, ArrayDims);
    Result := FIDs;
    ElemNode.Attributes[SXMLID] := SArrayIDPre + IntToStr(Result);
    Inc(FIDs);
    for I := 0 to Len - 1 do
    begin
      ID := WriteNonRectDynArrayElem(RootNode, ElemNode, Info, URI, TypeName, Pointer( PInteger(P)^), Dim);
      if ID <> 0 then
      begin
        DataNode := ElemNode.AddChild(DefArrayElemName);
        DataNode.Attributes[SXMLHREF] := SHREFPre + SArrayIDPre + IntToStr(ID);
      end;
      P := Pointer(Integer(P) + sizeof(Pointer));
    end;
  end
  else
  begin
    SetLength(ArrayDims, 1);
    ArrayDims[0] := Len;
    ElemNode := MakeArrayNode(RootNode, RootNode, DefArrayElemName, URI, TypeName, ArrayDims);

    Result := FIDs;
    Inc(FIDs);
    ElemNode.Attributes[SXMLID] :=  SArrayIDPre + IntToStr(Result);

    for I := 0 to Len - 1 do
    begin
      TypeTranslator.CastNativeToSoap(Info, S, P, IsNull);
      DataNode := ElemNode.AddChild(DefArrayElemName);
      DataNode.Text := S;
      P := Pointer( Integer(P) + GetTypeSize(Info));
    end;
  end;
end;

procedure TSOAPDomConv.ReadVariant(Node: IXMLNode; P: Pointer);
var
  SoapTypeInfo: PTypeInfo;
  DT: TXSDateTime;
  URI, TypeName: InvString;
begin
  Variant(PVarData(P)^) := NULL;
  if  Node.ChildNodes.Count > 1 then
    Variant(PVarData(P)^) := ReadVarArrayDim(Node)
  else
  begin
    GetElementType(Node, URI, TypeName);
    SoapTypeInfo := RemTypeRegistry.XSDToTypeInfo(URI, TypeName);
    if SoapTypeInfo = nil then
      SoapTypeInfo := TypeInfo(System.WideString);
   if (SoapTypeInfo.Kind = tkClass) and (GetTypeData(SoapTypeInfo).ClassType = TXSDateTime) then 
   begin
     DT := TXSDateTime.Create;
     DT.XSToNative(Node.Text);
     Variant(PVarData(P)^) := DT.AsDateTime;
     DT.Free;
   end else
     Variant(PVarData(P)^) :=  TypeTranslator.CastSoapToVariant(SoapTypeInfo, GetNodeAsText(Node));
 end;
end;

procedure TSOAPDomConv.ReadRow(RootNode, Node: IXMLNode; var CurElem: Integer; Size: Integer; P: Pointer; Info: PTypeInfo);
var
  I: Integer;
  URI, TypeName: InvString;
  IsNull, IsScalar: Boolean;
begin
  if CurElem > Node.ChildNodes.Count -1 then
     raise ESOAPDomConvertError.Create(SArrayTooManyElem);
   if Info.Kind = tkClass then
   begin
     for I := 0 to Size - 1 do
     begin
       RemClassRegistry.ClassToURI(GetTypeData(Info).ClassType, URI, TypeName, IsScalar);
       PTObject(P)^ := ConvertSOAPToObject(RootNode, Node.ChildNodes[CurElem],
                          GetTypeData(Info).ClassType, URI, TypeName, P, 1);
       P := Pointer(Integer(P) + sizeof(Pointer));
       Inc(CurElem);
     end;
   end else if Info.Kind = tkVariant then
   begin
     for I := 0 to Size - 1 do
     begin
       ReadVariant(Node.ChildNodes[CurElem], P);
       P := Pointer(Integer(P) + GetTypeSize(Info));
       Inc(CurElem);
     end;
   end else
   begin
     IsNull := False;
     for I := 0 to Size - 1 do
     begin
      TypeTranslator.CastSoapToNative(Info,  Node.ChildNodes[CurElem].Text, P, IsNull);
      P := Pointer(Integer(P) + GetTypeSize(Info));
      Inc(CurElem);
     end;
  end;
end;


procedure TSOAPDomConv.ReadRectDynArrayElem(RootNode, Node: IXMLNode; Info: PTypeInfo; Size, Dim: Integer; P: Pointer;
  var CurElem: Integer);
var
  I: Integer;
  ElemSize: Integer;
  ID: InvString;
begin
  Node := GetDataNode(RootNode, Node, ID);
  if Dim > 1 then
  begin
    Dec(Dim);
    for I := 0 to Size - 1 do
    begin
      ElemSize := GetDynArrayLength(Pointer(PInteger(P)^));
      ReadRectDynArrayElem(RootNode, Node, Info, ElemSize, Dim, Pointer(PInteger(P)^), CurElem);
      P := Pointer(Integer(P) + sizeof(Pointer));
    end;
  end
  else
  begin
     if CurElem > Node.ChildNodes.Count -1 then
       raise ESOAPDomConvertError.Create(SArrayTooManyElem);

     ReadRow(RootNode, Node, CurElem, Size, P, Info);
  end;
end;

procedure TSOAPDomConv.ReadRectDynArray(RootNode, Node: IXMLNode; Info: PTypeInfo; Dims: Integer; P: Pointer; CurElem: Integer);
begin
  ReadRectDynArrayElem(RootNode, Node, Info, GetDynArrayLength(P), Dims, P, CurElem);
end;

function TSOAPDomConv.ConvertSoapToNativeArrayElem(ArrayInfo, ElemInfo: PTypeInfo;
  RootNode, Node: IXMLNode; ArrayDesc: TSOAPArrayDesc; Dims, CurDim: Integer; DataP: Pointer): Pointer;
var
  PElem, ChildP, DynP: Pointer;
  Size, I: Integer;
  ID: InvString;
  ChildNode: IXMLNode;
  NodeOffset: Integer;
  CurElem: Integer;
  IntVec: TIntegerDynArray;
  DimCnt: Integer;
begin
  Result := nil;
  Node := GetDataNode(RootNode, Node, ID);
  if Dims > 1 then
  begin
    if (Length(ArrayDesc) > 0 ) and ArrayDesc[CurDim].MultiDim then
    begin
      DynP := Pointer(PInteger(DataP)^);
      DynArraySetLength(DynP, ArrayInfo, Length(ArrayDesc[CurDim].Dims), PLongInt(ArrayDesc[CurDim].Dims));
      Result := DynP;
      Size :=  Length(ArrayDesc[CurDim].Dims);
      NodeOffset := 0;
      ReadRectDynArray(RootNode,  Node, ElemInfo, Size, DynP, NodeOffset);
    end else
    begin
      Size := Node.ChildNodes.Count;
      DynP := Pointer(PInteger(DataP)^);
      if Length(ArrayDesc) = 0 then
      begin
        SetLength(IntVec, 1);
        DimCnt := 1;
      end else
      begin
        SetLength(IntVec, Length(ArrayDesc[CurDim].Dims));
        DimCnt := Length(ArrayDesc[CurDim].Dims);
      end;
      for I := 0 to Length(IntVec) -1 do
        IntVec[I] := Size;
      DynArraySetLength(DynP, ArrayInfo, DimCnt, PLongInt(IntVec));
      PElem := DynP;
      Result := DynP;
      Dec(Dims);
      Inc(CurDim);
      for I := 0 to Size - 1 do
      begin
        ChildNode := GetDataNode(RootNode, Node.ChildNodes[I], ID);
        ChildP :=  ConvertSoapToNativeArrayElem(GetDynArrayNextInfo(ArrayInfo), ElemInfo, RootNode,
                     ChildNode, ArrayDesc, Dims, CurDim, PElem);
        PInteger(PElem)^ := Integer(ChildP);
        PElem := Pointer(Integer(PElem) + sizeof(Pointer));
      end;
    end;
  end else if Dims = 1 then
  begin
    begin
      Size := Node.ChildNodes.Count;
      if DataP <> nil then
      begin
        DynP := Pointer(PInteger(DataP)^);
        if Length(ArrayDesc) = 0 then
        begin
          SetLength(IntVec, 1);
          DimCnt := 1;
        end else
        begin
          SetLength(IntVec, Length(ArrayDesc[CurDim].Dims));
          DimCnt := Length(ArrayDesc[CurDim].Dims);
        end;
        for I := 0 to Length(IntVec) -1 do
          IntVec[I] := Size;
        DynArraySetLength(DynP, ArrayInfo, DimCnt,  PLongInt(IntVec) );
        PElem := DynP;
        Result := DynP;
        CurElem := 0;
        if Size > 0 then
          ReadRow(RootNode, Node, CurElem,  Size, PElem, ElemInfo);
      end;
    end;
  end;
end;

function TSOAPDomConv.ConvertSoapToNativeArray(DataP: Pointer;  TypeInfo: PTypeInfo;
  RootNode, Node: IXMLNode): Pointer;
var
  Dims: Integer;
  ElemInfo: PTypeInfo;
  ArrayDesc: TSOAPArrayDesc;
  ArrayType: InvString;
  V : Variant;
begin
  V := Node.GetAttributeNS(SSoapEncodingArrayType, SSoap11EncodingS5);
  if not VarIsNull(V) then
  begin
    ArrayType := V;
    ArrayType := Copy(ArrayType, Pos('[',ArrayType), High(Integer));     { do not localize }
  end;
  GetDynArrayElTypeInfo(TypeInfo, ElemInfo, Dims);
  if ElemInfo = nil then
    raise  ESOAPDomConvertError.CreateFmt(SNoArrayElemRTTI, [TypeInfo.Name]);
  if ElemInfo.Kind = tkVariant then
  begin
    SetLength(ArrayDesc, 1);
    SetLength(ArrayDesc[0].Dims, 1);
  end else
  begin
    ParseDims(ArrayType, ArrayDesc);
  end;
  Result := ConvertSoapToNativeArrayElem(TypeInfo, ElemInfo, RootNode, Node, ArrayDesc, Dims, 0, DataP);
end;

function TSOAPDomConv.GetNewID: string;
begin
  Result := IntToStr(FIDs);
  Inc(FIDs);
end;

function TSOAPDomConv.CreateMultiRefNode(RootNode: IXMLNode; Name, ID: InvString): IXMLNode;
var
  I, J: Integer;
begin
  Result := RootNode.OwnerDocument.CreateNode(Name);
  Result.Attributes[SXMLID] := ID;
  I := 0;
  while I < Length(MultiRefNodes) do
  begin
    if MultiRefNodes[I].Node = RootNode then
      break;
    Inc(I);
  end;
  if I = Length(MultiRefNodes) then
  begin
    SetLength(MultiRefNodes, I + 1);
    MultiRefNodes[I].Node := RootNode;
  end;
  J := Length(MultiRefNodes[I].MultiRefChildren);
  SetLength(MultiRefNodes[I].MultiRefChildren, J + 1);
  MultiRefNodes[I].MultiRefChildren[J] := Result;
end;

procedure TSOAPDomConv.FinalizeMultiRefNodes;
var
  I, J: Integer;
begin
  for I := 0 to Length(MultiRefNodes) - 1 do
  begin
    for J := 0 to Length(MultiRefNodes[I].MultiRefChildren) - 1 do
      MultiRefNodes[I].Node.ChildNodes.Add(MultiRefNodes[I].MultiRefChildren[J]);
  end;
  for I := 0 to Length(MultiRefNodes) - 1 do
  begin
    SetLength(MultiRefNodes[I].MultiRefChildren, 0);
  end;
  SetLength(MultiRefNodes, 0);
end;

function TSOAPDomConv.CreateObjectNode(Instance: TObject; RootNode, Node: IXMLNode; Name,  URI: InvString): InvString;
var
  ID, Pre: InvString;
  I, Count: Integer;
  PropList: PPropList;
  Kind: TTypeKind;
  V: Variant;
  Obj: TObject;
  NodeURI, ElemURI, TypeName: InvString;
  IsScalar: Boolean;
  InstNode, ElemNode: IXMLNode;
  P: Pointer;
  MultiRefOpt: TObjMultiOptions;
  ExtPropName: InvString;
begin
  Result := GetNewID;
  Pre := FindPrefixForURI(RootNode, Node,  URI, True);
  MultiRefOpt :=  RemTypeRegistry.ClassOptions(Instance.ClassType);

  if not (soSendMultiRefObj in FOptions) or (ocNoMultiRef = MultiRefOpt) then
    InstNode :=  Node.AddChild(Pre + ':' + Name)         { do not localize }
  else
    InstNode := CreateMultiRefNode(RootNode, Pre + ':' + Name, Result);   { do not localize }

  RemClassRegistry.ClassToURI(Instance.ClassType, NodeURI, TypeName, IsScalar);
  SetNodeType(RootNode, InstNode, NodeURI, TypeName);
  if (soSendMultiRefObj in FOptions) or not (ocNoMultiRef = MultiRefOpt)  then
    AddMultiRefNode(Result, Instance);
  Count := GetTypeData(Instance.ClassInfo)^.PropCount;
  if Count > 0 then
  begin
    GetMem(PropList, Count * SizeOf(Pointer));
    try
      GetPropInfos(Instance.ClassInfo, PropList);
      for I := 0 to Count - 1 do
      begin
        ExtPropName := RemTypeRegistry.GetExternalPropName(Instance.ClassInfo, PropList[I].Name);
        Kind := (PropList[I].PropType)^.Kind;
        if Kind = tkClass then
        begin
          Obj := GetObjectProp(Instance, PropList[I]);
          if Obj = nil then
            CreateNULLNode(RootNode, InstNode, ExtPropName)
          else
          begin
            RemClassRegistry.ClassToURI(GetTypeData((PropList[I].PropType)^).ClassType, ElemURI, TypeName, IsScalar);

            if IsScalar then 
            begin
              ElemNode := InstNode.AddChild(ExtPropName);
              if not RemTypeRegistry.TypeInfoToXSD((PropList[I].PropType)^, ElemURI, TypeName) then
                raise ESOAPDomConvertError.CreateFmt(SRemTypeNotRegistered,[GetTypeData((PropList[I].PropType)^).ClassType.ClassName]);
              if not GetTypeData((PropList[I].PropType)^).ClassType.InheritsFrom(TRemotable) then
                raise ESOAPDomConvertError.CreateFmt(SScalarFromTRemotableS, [GetTypeData((PropList[I].PropType)^).ClassType.ClassName]);
              ElemNode.Attributes[FindPrefixForURI(RootNode, Node, XMLSchemaInstNameSpace)  + ':' + SSoapType] := TypeName;   { do not localize }
              ElemNode.Text := TRemotableXS(Obj).NativeToXS;
            end
            else
            begin
              if not (soSendMultiRefObj in FOptions) or (ocNoMultiRef = MultiRefOpt) then
              begin
                if IsObjectWriting(Obj) then
                  raise ESOAPDomConvertError.Create(SNoSerializeGraphs);
                AddObjectAsWriting(Instance);
                CreateObjectNode(Obj, RootNode, InstNode, ExtPropName, ElemURI);
                RemoveObjectAsWriting(Obj);
              end else
              begin
                ElemNode := InstNode.AddChild(ExtPropName);
                ID := FindMultiRefNodeByInstance(Obj);
                if ID = '' then
                  ID := CreateObjectNode(Obj, RootNode, InstNode, ExtPropName, ElemURI);
                ElemNode.Attributes[SXMLHREF] := SHREFPre + ID;
              end;
            end;
          end;
        end else if Kind = tkDynArray then
        begin
          P := Pointer(GetOrdProp(Instance, PropList[I]));
          ConvertNativeArrayToSoap(RootNode, InstNode, ExtPropName, (PropList[I].PropType)^, P, 0);
        end else if Kind = tkVariant then
        begin
           V := GetVariantProp(Instance, PropList[I]);
           ConvertVariantToSoap(RootNode, InstNode, ExtPropName, nil, nil, 0, V, True);
        end else
        begin
          if not RemTypeRegistry.TypeInfoToXSD((PropList[I].PropType)^, ElemURI, TypeName) then
            raise ESOAPDomConvertError.CreateFmt(SRemTypeNotRegistered, [(PropList[I].PropType)^.Name]);
          ElemNode := CreateScalarNodeXS(RootNode, InstNode, ExtPropName, ElemURI, TypeName, GetObjectPropAsText(Instance, PropList[I]));
        end;
      end;
    finally
      FreeMem(PropList, Count * SizeOf(Pointer));
    end;
  end;
end;
procedure TSOAPDomConv.ConvertObjectToSOAP(Name: InvString;
  ObjP: Pointer; RootNode, Node: IXMLNOde; NumIndirect: Integer);
var
  ElemNode: IXMLNOde;
  I: Integer;
  ID: string;
  URI, TypeName: WideString;
  IsScalar: Boolean;
  P: Pointer;
  Instance: TObject;
  MultiRefOpt: TObjMultiOptions;
begin
  P := ObjP;
  for I := 0 to NumIndirect - 1 do
    P := Pointer(PInteger(P)^);
  Instance := P;

  if Assigned(Instance) and not Instance.InheritsFrom(TRemotable) then
    raise ESOAPDomConvertError.CreateFmt(SUnsuportedClassType, [Instance.ClassName]);

  if not Assigned(Instance) then
    CreateNULLNode(RootNode, Node, Name)
  else
  begin
    if not RemClassRegistry.ClassToURI(Instance.ClassType, URI, TypeName, IsScalar) then
      raise ESOAPDomConvertError.CreateFmt(SRemTypeNotRegistered, [Instance.ClassName]);
    if IsScalar then
    begin
      if not Instance.ClassType.InheritsFrom(TRemotableXS) then
        raise ESOAPDomConvertError.CreateFmt(SScalarFromTRemotableS, [Instance.ClassType.ClassName]);

      ElemNode := CreateScalarNodeXS(RootNode, Node, Name, URI, TypeName, TRemotableXS(Instance).NativeToXS, True);
    end else
    begin
      MultiRefOpt :=  RemTypeRegistry.ClassOptions(Instance.ClassType);
      if not (soSendMultiRefObj in FOptions) or  (ocNoMultiRef = MultiRefOpt) then
      begin
        if IsObjectWriting(Instance) then
          raise ESOAPDomConvertError.Create(SNoSerializeGraphs);
        AddObjectAsWriting(Instance);
        CreateObjectNode(Instance, RootNode, Node, Name, URI);
        RemoveObjectAsWriting(Instance);
      end
      else
      begin
        ID := FindMultiRefNodeByInstance(Instance);
        if ID = '' then
          ID := CreateObjectNode(Instance, RootNode, ElemNode, Name, URI);
        ElemNode := Node.AddChild(Name);
        ElemNode.Attributes[SXMLHREF] := SHREFPre + ID;
      end;

    end;
  end;
end;


function TSOAPDomConv.GetObjectPropAsText(Instance: TObject;
  PropInfo: PPropInfo): WideString;
var
 I: LongInt;
 E: Extended;
 I64: Int64;
begin
  case (PropInfo.PropType)^.Kind of
    tkInteger:
      begin
        I := GetOrdProp(Instance, PropInfo);
        Result := IntToStr(I);
      end;
    tkFloat:
      begin
        E := GetFloatProp(Instance, PropInfo);
        Result := FloatToStr(E);
      end;
    tkWString:
      Result := GetWideStrProp(Instance, PropInfo);
    tkString,
    tkLString:
      Result := GetStrProp(Instance, PropInfo);
    tkInt64:
      begin
        I64 := GetInt64Prop(Instance, PropInfo);
        Result := IntToStr(I64);
      end;
    tkEnumeration:
      Result := GetEnumProp(Instance, PropInfo);
    tkChar:
      begin
        I := GetOrdProp(Instance, PropInfo);
        Result :=  InvString(Char(I));
      end;
    tkWChar:
      begin
        I := GetOrdProp(Instance, PropInfo);
        Result :=  InvString(WideChar(I));
      end;
    tkClass:
      ;
    tkSet,
    tkMethod,

    tkArray,
    tkRecord,
    tkInterface,


    tkDynArray,
    tkVariant:
      raise ESOAPDomConvertError.CreateFmt(SUnexpectedDataType, [KindNameArray[(PropInfo.PropType)^.Kind]]); 

  end;

end;

function TSOAPDomConv.GetTypeBySchemaNS(Node: IXMLNode; URI: InvString): Variant;
var
  I: Integer;
begin
  Result := Node.GetAttributeNS(SSoapType, URI);
  if VarIsNull(Result) and (soTryAllSchema in Options) then
  begin
    for I := Low(XMLSchemaInstNamepspaces) to High(XMLSchemaInstNamepspaces) do
    begin
      Result := Node.GetAttributeNS(SSoapType, XMLSchemaInstNamepspaces[I]);
      if not VarIsNull(Result) then
        break;
    end;
  end;
end;

function TSOAPDomConv.GetElementType(Node: IXMLNode; var TypeURI, TypeName: InvString): Boolean;
var
  Idx: Integer;
  S : InvString;
  V: Variant;
  Pre: InvString;
begin
  TypeURI := '';
  TypeName := '';
  Result := False;
  if (Node.NamespaceURI = SSoap11EncodingS5) and (Node.LocalName = SSoapEncodingArray) then
  begin
    TypeURI := SSoap11EncodingS5;
    TypeName := SSoapEncodingArray;
    Result := True;
  end else
  begin
    V := GetTypeBySchemaNS(Node, XMLSchemaInstNameSpace);
    if VarIsNull(V) then
      V := Node.GetAttribute(SSoapType);
    if not VarIsNull(V) then
    begin
      S := V;
      Idx := Pos(':', S);  { do not localize }
      if Idx <> 0 then
      begin
        TypeName := Copy(S, Idx + 1, High(Integer));
        Pre := Copy(S, 1, Idx - 1);
        TypeURI := Node.FindNamespaceURI(Pre);
      end
      else
      begin
        TypeName := S;
        TypeURI := ''; 
      end;
      Result := True;
    end;
  end
end;

procedure TSOAPDomConv.SetObjectPropFromText(Instance: TObject; PropInfo: PPropInfo; SoapData: WideString);
var
 I: LongInt;
 E: Extended;
 I64: Int64;
begin
  case (PropInfo.PropType)^.Kind of
    tkInteger:
      begin
        I := StrToInt(SoapData);
        SetOrdProp(Instance, PropInfo, I);
      end;
    tkFloat:
      begin
        E := StrToFloat(SoapData);
        SetFloatProp(Instance, PropInfo, E);
      end;
    tkWString:
      SetWideStrProp(Instance, PropInfo, SoapData);
    tkString,
    tkLString:
       SetStrProp(Instance, PropInfo, SoapData);

    tkInt64:
      begin
        I64 := StrToInt64(SoapData);
        SetInt64Prop(Instance, PropInfo, I64);
      end;
    tkEnumeration:
      SetEnumProp(Instance, PropInfo, SoapData);
    tkChar,
    tkWChar:
      if SoapData <> '' then
        SetOrdProp(Instance, PropInfo, Integer(SoapData[1]));
    tkClass:
      ;
    tkSet,
    tkMethod,
    tkArray,
    tkRecord,
    tkInterface,
    tkDynArray,
    tkVariant:
      raise ESOAPDomConvertError.CreateFmt(SUnexpectedDataType, [KindNameArray[(PropInfo.PropType)^.Kind]]); 

  end;
end;

procedure TSOAPDomConv.LoadObject(Instance: TObject; RootNode, Node: IXMLNode);
var
  PropList: PPropList;
  Count: Integer;
  Kind: TTypeKind;
  I, K: Integer;
  Obj: TObject;
  IsNull: Boolean;
  URI, TypeName: InvString;
  ArrayPtr: Pointer;
  V: Variant;
  SoapTypeInfo: PTypeInfo;
  DT: TXSDateTime;
  InternalName: string;
begin
  Count := GetTypeData(Instance.ClassInfo)^.PropCount;
  if Count > 0 then
  begin
    GetMem(PropList, Count * SizeOf(Pointer));
    try
      GetPropInfos(Instance.ClassInfo, PropList);
      for I := 0 to Count - 1 do
      begin
        K := 0;
        while K < Node.ChildNodes.Count do
        begin
          InternalName := RemTypeRegistry.GetInternalPropName(Instance.ClassInfo,Node.ChildNodes[K].LocalName);
          if SameText(InternalName, PropList[I].Name) then
            break;
          Inc(K);
        end;
        if K >= Node.ChildNodes.Count then
          continue;

        Kind := (PropList[I].PropType)^.Kind;
        if Kind = tkClass then
        begin
          Obj := ConvertSOAPToObject(RootNode, Node.ChildNodes[K], GetTypeData((PropList[I].PropType)^).ClassType,
            '', '', nil, 0);
          if Obj <> nil then
            SetObjectProp(Instance, PropList[I], Obj);
        end else if Kind = tkDynArray then
        begin
          IsNull := NodeIsNull(Node.ChildNodes[K]);
          if not IsNull then
          begin
            GetElementType( Node.ChildNodes[K], URI, TypeName);
            ArrayPtr := nil;
            ArrayPtr := ConvertSoapToNativeArray(@ArrayPtr, (PropList[I].PropType)^, RootNode,  Node.ChildNodes[K]);
            SetOrdProp(Instance, PropList[I], Integer(ArrayPtr));
          end;
        end else if Kind = tkVariant then
        begin
          if Node.ChildNodes[K].ChildNodes.Count > 1 then
            V := ReadVarArrayDim(Node.ChildNodes[K])
          else
          begin
            if NodeIsNull(Node.ChildNodes[K]) then
              V := NULL
            else
            begin
              GetElementType(Node.ChildNodes[K], URI, TypeName);  
              SoapTypeInfo := RemTypeRegistry.XSDToTypeInfo(URI, TypeName);
              if SoapTypeInfo = nil then
                SoapTypeInfo := TypeInfo(System.WideString);
              if (SoapTypeInfo.Kind = tkClass) and (GetTypeData(SoapTypeInfo).ClassType = TXSDateTime) then 
              begin
                DT := TXSDateTime.Create;
                DT.XSToNative(Node.ChildNodes[K].Text);
                V := DT.AsDateTime;
                DT.Free;
              end else
                V := TypeTranslator.CastSoapToVariant(SoapTypeInfo, Node.ChildNodes[K].Text);
            end;
          end;
          SetVariantProp(Instance, PropList[I], V);
        end else
          SetObjectPropFromText(Instance, PropList[I], Node.ChildNodes[K].Text);

      end;
    finally
      FreeMem(PropList, Count * SizeOf(Pointer));
    end;
  end;
end;

function  TSOAPDomConv.ConvertSOAPToObject(RootNode, Node: IXMLNode; AClass: TClass;
  URI, TypeName: WideString; ObjP: Pointer; NumIndirect: Integer): TObject;
var
  ID: InvString;
  ObjNode: IXMLNode;
  IsScalar: Boolean;
  Obj, LoadedObj: TObject;
  P: Pointer;
  I: Integer;
  NodeClass: TClass;
  NodeURI, NodeTypeName: InvString;
  LegalRef: Boolean;
  S: string; // todo
begin
  if NodeIsNULL(Node) then
  begin
    Result := nil;
    Exit;
  end;

  P := ObjP;
  for I := 0 to NumIndirect - 1 do
    P := Pointer(PInteger(P)^);
  Obj := TObject(P);


  IsScalar := RemClassRegistry.IsClassScalar(AClass);
  if IsScalar then
  begin
    if not AClass.InheritsFrom(TRemotableXS) then
        raise ESOAPDomConvertError.CreateFmt(SScalarFromTRemotableS, [AClass.ClassName]);
      Obj := TRemotableXSClass(AClass).Create;
      Result := Obj;
    TRemotableXS(Obj).XSToNative(Node.Text);
  end else
  begin
    S := Node.LocalName;
    ObjNode := GetDataNode(RootNode, Node, ID);
    if ID <> '' then
      LoadedObj :=  FindMultiRefNodeByID(ID)
    else
      LoadedObj := nil;

    if Assigned(LoadedObj) then
      Result := LoadedObj
    else
    begin
      GetElementType(ObjNode, NodeURI, NodeTypeName);
      NodeClass := RemTypeRegistry.URIToClass(NodeURI, NodeTypeName, IsScalar);
      LegalRef := True;
      if Assigned(Obj) then
      begin
        try
          if Obj.ClassType <> nil then
            LegalRef := True;
        except
          LegalRef := False;
        end;
      end;
      if Assigned(Obj) and  LegalRef then
      begin
        if (NodeClass <> nil) and (NodeClass <> Obj.ClassType) then
          Obj := NodeClass.Create;
      end else
      begin
        if (NodeClass <> nil) and NodeClass.InheritsFrom(AClass) then
          Obj := TRemotableClass(NodeClass).Create
        else
          Obj := TRemotableClass(AClass).Create;
      end;
      Result := Obj;
      AddMultiRefNode(ID, Obj);
      LoadObject(Obj, RootNode, ObjNode);
    end;
  end;
end;

procedure  TSOAPDomConv.WriteNonRectDynArray(RootNode, Node: IXMLNode; Name: InvString; Info: PTypeInfo; URI,  TypeName: InvString; P: Pointer; Dims: Integer);
var
  I, Len: Integer;
  ArrayDims: TIntegerDynArray;
  ElemNode, DataNode: IXMLNode;
  ID: Integer;
begin
  Len := GetDynArrayLength(P);
  SetLength(ArrayDims, Dims);
  for I := 0 to Dims -2 do
    ArrayDims[I] := 0;
  ArrayDims[Dims-1] := Len;
  ElemNode := MakeArrayNode(Node, Node,   Name, URI, TypeName, ArrayDims);

  for I := 0 to Len - 1 do
  begin
    ID := WriteNonRectDynArrayElem(Node, ElemNode, Info, URI, TypeName, Pointer( PInteger(P)^),  Dims-1);
    if ID <> 0 then
    begin
      DataNode := ElemNode.AddChild(DefArrayElemName, '');
      DataNode.Attributes[SXMLHREF] := SHREFPre + SArrayIDPre + IntToStr(ID); 
    end;
    P := Pointer(Integer(P) + sizeof(Pointer));
  end;
end;

procedure TSOAPDomConv.ConvertNativeArrayToSoap(RootNode,
  Node: IXMLNode; Name: InvString; Info: PTypeInfo; P: Pointer; NumIndirect: Integer);
var
  ElemInfoP: PTypeInfo;
  Dims, I: Integer;
  DimAr: TIntegerDynArray;
  URI, TypeName: InvString;
  ElemNode: IXMLNode;
begin
  for I := 0 to NumIndirect - 1 do
    P := Pointer(PInteger(P)^);
  Dims := 0;
  GetDynArrayElTypeInfo(Info, ElemInfoP, Dims);
    if (ElemInfoP.Kind <> tkVariant) and not RemTypeRegistry.TypeInfoToXSD(ElemInfoP, URI, TypeName) then
        raise ESOAPDomConvertError.CreateFmt(SRemTypeNotRegistered, [ElemInfoP.Name]);
    if not Assigned(P) or IsArrayRect(P, Dims) then
    begin
      SetLength(DimAr, Dims);
      if Assigned(P) then
        GetDims(P, DimAr, Dims);
      ElemNode := MakeArrayNode(RootNode, Node,  Name, URI, TypeName, DimAr);
      WriteRectDynArray(RootNode, ElemNode, ElemInfoP, Dims, P);
    end else
    begin
      WriteNonRectDynArray(RootNode, Node, Name, ElemInfoP, URI, TypeName, P, Dims);
    end;
end;

procedure TSOAPDomConv.ConvertNativeDataToSoap(
  RootNode, Node: IXMLNode; Name: InvString; Info: PTypeInfo; P: Pointer; NumIndirect: Integer);
var
  ElemNode: IXMLNode;
  TypeName: InvString;
  URI, S: InvString;
  IsNull: Boolean;
  I: Integer;
  IsScalar: Boolean;
begin
  case Info.Kind of
    tkClass:
      ConvertObjectToSOAP(Name, P, RootNode, Node, NumIndirect);
    tkDynArray:
      ConvertNativeArrayToSoap(RootNode, Node, Name, Info, P, NumIndirect);
    tkSet,
    tkMethod,
    tkArray,
    tkRecord,
    tkInterface:
      raise ESOAPDomConvertError.CreateFmt(SDataTypeNotSupported, [KindNameArray[Info.Kind]]);

    tkVariant:
    begin
      ConvertVariantToSoap(RootNode, Node, Name, Info, P, NumIndirect, NULL, False);
    end;
    else
    begin
      if Info.Kind = tkEnumeration then
      begin
        if not RemClassRegistry.InfoToURI(Info, URI, TypeName, IsScalar) then
          raise ESOAPDomConvertError.CreateFmt(SRemTypeNotRegistered, [Info.Name]);
        S := ConvertEnumToSoap(Info, P, NumIndirect);
        ElemNode := CreateScalarNodeXS(RootNode, Node, Name, URI, TypeName, S);
      end else
      begin
        if NumIndirect > 1 then
          for I := 0 to NumIndirect - 2 do
            P := Pointer(PInteger(P)^);
        TypeTranslator.CastNativeToSoap(Info, S, P, IsNull);
        if IsNull then
          CreateNULLNode(RootNode,ElemNode, Name)
        else
        begin
          if not RemTypeRegistry.TypeInfoToXSD(Info, URI, TypeName) then
            raise ESOAPDomConvertError.CreateFmt(SRemTypeNotRegistered, [Info.Name]);
          ElemNode := CreateScalarNodeXS(RootNode, Node, Name, URI, TypeName, S);
        end;
      end
    end;
  end;
end;


procedure TSOAPDomConv.AddMultiRefNode(ID: string; Instance: Pointer);
var
  I: Integer;
begin
  for I := 0 to Length(RefMap) -1  do
    if (RefMap[I].ID = ID) and ( RefMap[I].Instance = Instance) then
      Exit;
  I := Length(RefMap);
  SetLength(RefMap, I + 1);
  RefMap[I].ID := ID;
  RefMap[I].Instance :=Instance;
end;

function  TSOAPDomConv.FindMultiRefNodeByInstance(Instance: Pointer): string;
var
  I: Integer;
begin
  for I := 0 to Length(RefMap) - 1 do
    if RefMap[I].Instance = Instance then
      Result := RefMap[I].ID;
end;

function  TSOAPDomConv.FindMultiRefNodeByID(ID: string): Pointer;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Length(RefMap) - 1 do
    if RefMap[I].ID = ID then
    begin
      Result := RefMap[I].Instance;
      break;
    end;
end;

procedure TSOAPDomConv.ConvertSoapToNativeData(DataP: Pointer; TypeInfo: PTypeInfo;
  Context: TDataContext; RootNode, Node: IXMLNode; Translate, ByRef: Boolean;
  NumIndirect: Integer);
var
  TypeUri, TypeName: InvString;
  IsNull: Boolean;
  Obj: TObject;
  P: Pointer;
  I: Integer;
  ID: InvString;
begin
  Node := GetDataNode(RootNode, Node, ID);
  IsNull := NodeIsNull(Node);
  if TypeInfo.Kind = tkVariant then
  begin
    if NumIndirect > 1 then
      DataP := Pointer(PInteger(DataP)^);
    if IsNull then
    begin
      Variant(PVarData(DataP)^) := NULL;
    end else
      ConvertSoapToVariant(Node, DataP);
  end else
  if TypeInfo.Kind = tkDynArray then
  begin
    P := DataP;
    for I := 0 to NumIndirect - 2 do
      P := Pointer(PInteger(P)^);
    P := ConvertSoapToNativeArray(P, TypeInfo, RootNode, Node);
    if NumIndirect = 1 then 
      PInteger(DataP)^ := Integer(P)
    else if NumIndirect = 2 then
    begin
      DataP := Pointer(PInteger(DataP)^);
      PInteger(DataP)^ := Integer(P);
    end;
  end else
  if TypeInfo.Kind = tkClass then
  begin
    Obj := ConvertSOAPToObject(RootNode, Node, GetTypeData(TypeInfo).ClassType, TypeURI, TypeName, DataP, NumIndirect);
    if NumIndirect = 1 then
      PTObject(DataP)^ := Obj
    else if NumIndirect = 2 then
    begin
      DataP := Pointer(PInteger(DataP)^);
      PTObject(DataP)^ := Obj;
    end;
  end else
  begin
    if Translate then
    begin
      if NumIndirect > 1 then
        DataP := Pointer(PInteger(DataP)^);
      if not TypeTranslator.CastSoapToNative(TypeInfo, GetNodeAsText(Node), DataP, IsNull) then
        raise ESOAPDomConvertError.CreateFmt(STypeMismatchInParam, [node.nodeName]);
    end;
  end;
end;


function TSOAPDomConv.ConvertEnumToSoap(Info: PTypeInfo;
  P: Pointer; NumIndirect: Integer): InvString;
var
  Value: Pointer;
  I: Integer;
begin
  Value := P;
  for I := 0 to NumIndirect - 2 do
    Value := Pointer(PInteger(Value)^);
  if NumIndirect = 0 then
    Result := GetEnumName(Info, Byte(Value))
  else
    Result := GetEnumName(Info, PByte(Value)^);
end;

function TSOAPDomConv.ConvertSoapToEnum(Info: PTypeInfo; S: InvString;
  IsNull: Boolean): Integer;
begin
  Result := GetEnumValue(Info, S);
end;

function TSOAPDomConv.CreateNULLNode(RootNode, ParentNode: IXMLNode; Name: InvString): IXMLNode;
begin
  Result := ParentNode.AddChild(Name);
  Result.Attributes[FindPrefixForURI(RootNode, ParentNode,XMLSchemaInstNameSpace) + ':' + SSoapNULL] := 'True';  { do not lcoalize } 
end;

function TSOAPDomConv.NodeIsNULL(Node: IXMLNode): Boolean;
var
  V: Variant;
begin
  Result := False;
  V := Node.GetAttributeNS(SSoapNull, XMLSchemaInstNameSpace);
  if not VarIsNull(V) and ((V = '1') or SameText(V,'True')) then   { do not lcoalize }
    Result := True;
  if Node.ChildNodes.Count = 0 then
  begin
    V := Node.Attributes[SXMLHREF];
    if  VarIsNull(V) then
      Result := True;
  end;
end;

function TSOAPDomConv.FindPrefixForURI(RootNode, Node: IXMLNode; URI: InvString; DeclIfNone: Boolean = False): InvString;
var
  DeclNode: IXMLNode;
begin
  DeclNode := RootNode.FindNamespaceDecl(URI);
  if DeclNode <> nil then
    Result := DeclNode.LocalName;
  if (Result = '') and DeclIfNone then
    Result := AddNamespaceDecl(RootNode, URI);
end;

function TSOAPDomConv.AddNamespaceDecl(Node: IXMLNode; URI: InvString): InvString;
begin
  Result := Node.OwnerDocument.GeneratePrefix(Node);
  Node.DeclareNamespace(Result, URI);
end;

function TSOAPDomConv.CreateTypedNode(RootNode, ParentNode: IXMLNode;
   NodeName, URI, TypeName: WideString; GenPre: Boolean = False): IXMLNode;
var
  AttNodePre, AttValPre: InvString;
  DeclNode: IXMLNode;
begin

  AttNodePre := FindPrefixForURI(RootNode, ParentNode, XMLSchemaInstNamespace);
  if GenPre then
    Result := ParentNode.AddChild(NodeName, URI, True)
  else
    Result := ParentNode.AddChild(NodeName);

  DeclNode := ParentNode.FindNamespaceDecl(URI);
  if DeclNode = nil then
    DeclNode := RootNode.FindNamespaceDecl(URI);
  if DeclNode <> nil then
    AttValPre := DeclNode.LocalName;
  if AttValPre = '' then
  begin
    AttValPre := Result.OwnerDocument.GeneratePrefix(Result);
    Result.DeclareNamespace(AttValPre, URI);
  end;

  if not (soSendUntyped in Options) then
  begin
    TypeName := AttValPre + ':' +  TypeName;  { do not lcoalize }
    Result.Attributes[AttNodePre + ':' + SSoapType] := TypeName;   { do not lcoalize }
  end;
end;

function TSOAPDomConv.CreateScalarNodeXS(RootNode, ParentNode: IXMLNode;
   NodeName, URI, TypeName: WideString; Value: WideString; GenPre: Boolean = False): IXMLNode;
begin
  Result := CreateTypedNode(RootNode, ParentNode, NodeName, URI, TypeName);
  Result.Text := Value;
end;

procedure TSOAPDomConv.SetNodeType(RootNode, InstNode: IXMLNode; const ElemURI,
  TypeName: InvString);
var
  Pre, AttNodePre: InvString;
begin
  Pre := FindPrefixForURI(RootNode, InstNode, ElemURI, True);
  AttNodePre := FindPrefixForURI(RootNode, InstNode, XMLSchemaInstNamespace);
  InstNode.Attributes[AttNodePre + ':' + SSoapType] := Pre + ':' + TypeName;   { do not lcoalize } 
end;

function TSOAPDomConv.GetOptions: TSOAPConvertOptions;
begin
  Result := FOptions;
end;

procedure TSOAPDomConv.SetOptions(Value: TSOAPConvertOptions);
begin
  FOptions := Value;
end;

function TSOAPDomConv.GetNodeAsText(Node: IXMLNode): InvString;
var
  I: Integer;
begin
  Result := '';
  if Node.IsTextElement then
    Result := Node.Text
  else
    for I := 0 to Node.ChildNodes.Count - 1 do
      Result := Result + Node.ChildNodes[I].XML;
end;

function TSOAPDomConv.GetDataNode(RootNode, Node: IXMLNode; var ID: InvString): IXMLNode;
var
  V: Variant;
  REF: InvString;
begin
  ID := '';
  Result := Node;
  V := Node.Attributes[SXMLHREF];
  if not VarIsNull(V) then
  begin
    REF := V;
    if REF <> '' then
    begin
      Result := FindNodeByHREF(RootNode, REF);
      if not Assigned(Result) and Assigned(RootNode.ParentNode) then
        Result := GetDataNode(RootNode.ParentNode, Node, REF);
      ID := Copy(REF, 2, High(Integer));
    end;
  end else
  begin
    V := Node.Attributes[SXMLID];
    if not VarIsNull(V) then
      ID := V;
  end;
end;

procedure TSOAPDomConv.CheckEncodingStyle(Node: IXMLNode);
var
  V: Variant;
begin
  V := Node.GetAttributeNS(SSoapEncodingAttr, SSoapNameSpace);
  if not VarIsNull(V) then
  begin
    if V <> SSoap11EncodingS5 then
      raise ESOAPDomConvertError.CreateFmt(SUnsupportedEncodingSyle, [V]);
  end;
end;

procedure TSOAPDomConv.AddObjectAsWriting(Instance: TObject);
var
  I: Integer;
begin
{
  for I := 0 to Length(ObjsWriting) - 1 do
    if ObjsWriting[I] = Instance then
      Exit;
}
  I :=  Length(ObjsWriting);
  SetLength(ObjsWriting, I + 1);
  ObjsWriting[I] := Instance;
end;

function TSOAPDomConv.IsObjectWriting(Instance: TObject): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to Length(ObjsWriting) -1 do
    if ObjsWriting[I] = Instance then
    begin
      Result := True;
      break;
    end;
end;

procedure TSOAPDomConv.RemoveObjectAsWriting(Instance: TObject);
var
  I, J: Integer;
begin
  I := 0;
  while I < Length(ObjsWriting) do
  begin
    if ObjsWriting[I] = Instance then
      break;
    Inc(I);
  end;
  if I <  Length(ObjsWriting) then
  begin
    for J := I to Length(ObjsWriting)  - 2 do
      ObjsWriting[J] := ObjsWriting[J+1];
    SetLength(ObjsWriting, Length(ObjsWriting) -1);
  end;
end;

procedure TSOAPDomConv.ResetMultiRef;
begin
  SetLength(RefMap, 0);
  SetLength(ObjsWriting, 0);
end;

initialization
  GroupDescendentsWith(TOPToSoapDomConvert, Controls.TControl);

end.
