unit ExtendedAdapterObj;

interface

uses Classes, Sample_TLB, SiteComp, HTTPProd, WebAdapt, DBAdapt, AutoAdap;

type

  IGetSampleValue = interface
  ['{88139B17-B93F-4CF2-9C5D-23A4B39C0F77}']
    function GetSampleValue: string;
  end;

  TExtendedAdapter = class(TAdapter, IGetSampleValue)
  private
    FSampleValue: string;
  protected
    { IGetSampleValue }
    function GetSampleValue: string;
    { IGetScriptObject }
    function ImplGetScriptObject: IDispatch; override;
  published
    property SampleValue: string read FSampleValue write FSampleValue;
  end;

  TExtendedDataSetAdapter = class(TDataSetAdapter, IGetSampleValue)
  private
    FSampleValue: string;
  protected
    { IGetSampleValue }
    function GetSampleValue: string;
    { IGetScriptObject }
    function ImplGetScriptObject: IDispatch; override;
  published
    property SampleValue: string read FSampleValue write FSampleValue;
  end;

  TExtendedAdapterWrapper = class(TAdapterWrapper, IExtendedAdapterWrapper)
  protected
    { IExtendedAdapterWrapper }
    function  Get_SampleValue: WideString; safecall;
  end;

implementation

uses WebAuto, ActiveX, SysUtils, SimpleScriptObj;


{ TExtendedAdapter }

function TExtendedAdapter.GetSampleValue: string;
begin
  Result := FSampleValue;
end;

function TExtendedAdapter.ImplGetScriptObject: IDispatch;
begin
  Result := TExtendedAdapterWrapper.Create(Self);
end;

{ TExtendedDataSetAdapter }

function TExtendedDataSetAdapter.GetSampleValue: string;
begin
  Result := FSampleValue;
end;

function TExtendedDataSetAdapter.ImplGetScriptObject: IDispatch;
begin
  Result := TExtendedAdapterWrapper.Create(Self);
end;

{ TExtendedAdapterWrapper }

function TExtendedAdapterWrapper.Get_SampleValue: WideString;
var
  Intf: IGetSampleValue;
begin
  if Supports(Obj, IGetSampleValue, Intf) then
    Result := Intf.GetSampleValue
  else
    Result := '';
end;

initialization
  SampleComServer.RegisterScriptClass(TExtendedAdapterWrapper, Class_ExtendedAdapterWrapper);
end.
