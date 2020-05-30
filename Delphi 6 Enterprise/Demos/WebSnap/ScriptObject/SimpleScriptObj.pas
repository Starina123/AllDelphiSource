unit SimpleScriptObj;

interface

uses Classes, Sample_TLB, SiteComp, HTTPProd, WebAuto;

type
  TSimpleScriptObject = class(TComponent, IGetScriptObject, IWebVariableName)
  private
    FSampleValue: string;
  protected
    { IWebVariableName }
    function GetVariableName: string;
    { IGetScriptObject }
    function GetScriptObject: IDispatch;
  published
    property SampleValue: string read FSampleValue write FSampleValue;
  end;

  TSimpleScriptObjectWrapper = class(TScriptObject, ISimpleScriptObjectWrapper)
  private
    FSimpleScriptObject: TSimpleScriptObject;
  protected
    { ISimpleScriptObjectWrapper }
    function  Get_SampleValue: WideString; safecall;
  public
    constructor Create(ASimpleScriptObject: TSimpleScriptObject);
  end;

var
  SampleComServer: TAbstractScriptComServerObject;

implementation

uses ActiveX, SysUtils;

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

function TSimpleScriptObjectWrapper.Get_SampleValue: WideString;
begin
  Result := FSimpleScriptObject.SampleValue;
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
