unit SampleObj;

interface

uses Classes, Sample_TLB, SiteComp, HTTPProd;

type
  TSimpleScriptObject = class(TComponent, IGetScriptObject, IWebVariableName)
  private
    FText: string;
  protected
    { IWebVariableName }
    function GetVariableName: string;
    { IGetScriptObject }
    function GetScriptObject: IDispatch;
  published
    property Text: string read FText write FText;
  end;

  TSimpleScriptObjectWrapper = class(TScriptObject, ISimpleScriptObjectWrapper)
  private
    FSimpleScriptObject: TSimpleScriptObject;
  protected
    { ISimpleScriptObjectWrapper }
    function  Get_Text: WideString; safecall;
  public
    constructor Create(ASimpleScriptObject: TSimpleScriptObject);
  end;

implementation

uses WebAuto, ActiveX, SysUtils;

var
  SampleComServer: TAbstractScriptComServerObject;

type
  TSampleComServer = class(TAbstractScriptComServerObject)
  protected
    function ImplGetTypeLib: ITypeLib; override;
  end;

function TSampleComServer.ImplGetTypeLib: ITypeLib;
begin
  if LoadRegTypeLib(LIBID_Sample, 1, 0, 0, Result) <> S_OK then
    Result := nil;
end;

{ TSimpleScriptObjectWrapper }

constructor TSimpleScriptObjectWrapper.Create(ASimpleScriptObject: TSimpleScriptObject);
begin
  inherited Create;
  FSimpleScriptObject := ASimpleScriptObject;
end;

function TSimpleScriptObjectWrapper.Get_Text: WideString;
begin
  Result := FSimpleScriptObject.Text;
end;

{ TSimpleScriptObject }

function TSimpleScriptObject.GetScriptObject: IDispatch;
begin
  Result := TSimpleScriptObjectWrapper.Create(Self);
end;

function TSimpleScriptObject.GetVariableName: string;
begin
  Result := Self.Name;
end;

initialization
  SampleComServer := TSampleComServer.Create;
  SampleComServer.RegisterScriptClass(TSimpleScriptObjectWrapper, Class_SimpleScriptObjectWrapper);
finalization
  FreeAndNil(SampleComServer);
end.
