unit XMLBuilderWriter;

interface

uses
  SysUtils, Variants, Classes,
  WebAdapt, WebComp, DBAdapt, XMLDoc, XMLIntf, Contnrs, XMLBuilderComp;

type

  TXMLWriter = class(TInterfacedObject, IXMLWriter)
  private
    FXMLDocument: IXMLDocument;
    FXMLNode: IXMLNode;
    FList: TStack;
  protected
    { IXMLWriter }
    procedure PushNode;
    procedure PopNode;
    procedure AddNode(const AName: WideString);
    procedure WritePropertyValue(AName: WideString; AValue: Variant);
    function GetXMLDocument: IXMLDocument;
  public
    property XMLDocument: IXMLDocument read GetXMLDocument;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses SiteComp, WebAuto, AutoAdap, ActiveX, msxmldom;

{ TXMLWriter }

constructor TXMLWriter.Create;
var
  Temp: TXMLDocument;
begin
  Temp := TXMLDocument.Create(nil);
  FXMLDocument := Temp;
  FXMLDocument.Active := True;
  FXMLNode := FXMLDocument.GetDocumentElement;
  FList := TStack.Create;
  inherited;
end;

destructor TXMLWriter.Destroy;
begin
  while FList.Count > 0 do
    PopNode;
  FList.Free;
  inherited;
end;

procedure TXMLWriter.WritePropertyValue(AName: WideString; AValue: Variant);
begin
  if not VarIsClear(AValue) then
    FXMLNode.Attributes[AName] := AValue
  else
    FXMLNode.Attributes[AName] := WideString('');
end;

procedure TXMLWriter.PopNode;
begin
  FXMLNode := IXMLNode(FList.Pop);
  if FXMLNode <> nil then
    FXMLNode._Release;
end;

procedure TXMLWriter.PushNode;
begin
  if FXMLNode <> nil then
    FXMLNode._AddRef;
  FList.Push(Pointer(FXMLNode));
end;

procedure TXMLWriter.AddNode(const AName: WideString);
begin
  if FXMLNode = nil then
    FXMLNode := FXMLDocument.AddChild(AName, WideString(''))
  else
    FXMLNode := FXMLNode.AddChild(AName);
end;

function TXMLWriter.GetXMLDocument: IXMLDocument;
begin
  Result := FXMLDocument;
end;

end.


