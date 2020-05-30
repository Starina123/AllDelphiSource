{*******************************************************}
{                                                       }
{ Borland Delphi Visual Component Library               }
{                SOAP Support                           }
{                                                       }
{ Copyright (c) 2001 Borland Software Corporation       }
{                                                       }
{*******************************************************}

unit SOAPPasInv;

interface
uses
  Invoker, TypInfo, Classes, OPConvert, OPToSoapDomConv;

type
  TSoapPascalInvoker = class(TComponent)
  private
    procedure  SetDomConverter(Value: TOPToSoapDomConvert);
  protected
    FConverter: IOPConvert;
    FDomConverter:  TOPToSoapDomConvert;  // hard coded to DOM converter
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Invoke(AClass: TClass; IntfInfo: PTypeInfo; MethName: string; const Request: TStream;
       Response: TStream); virtual;
  published
    property Converter: TOPToSoapDomConvert read FDomConverter write SetDomConverter;
  end;

implementation

uses   SoapConst, InvokeRegistry, SysUtils, InvConst, IntfInfo,  ActiveX;

constructor TSoapPascalInvoker.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDomConverter := TOPToSoapDomConvert.Create(Self);
  FDomConverter.Name := 'Converter1'; { do not localize }
  FDomConverter.SetSubComponent(True);
  FConverter := FDomConverter as IOPConvert;
end;

destructor  TSoapPascalInvoker.Destroy;
begin
  if Assigned(FConverter) then
    FConverter := nil;
  if Assigned(FDOMConverter) and (FDomConverter.Owner = Self) then
    FDomConverter.Free;
  inherited;
end;


procedure TSoapPascalInvoker.Invoke(AClass: TClass; IntfInfo: PTypeInfo; MethName: string; const Request: TStream;
   Response: TStream);
var
  Inv: TInterfaceInvoker;
  Obj: TObject;
  InvContext: TInvContext;
  IntfMD: TIntfMetaData;
  MethNum: Integer;
  ExMsg: WideString;
begin
  try
    CoInitialize(nil);  // assumes we are using com dependent stuff (like the MSXML DOM)
    try
      MethNum := -1;
      GetIntfMetaData(IntfInfo, IntfMD, True);
      InvContext := TInvContext.Create;
      SetRemotableDataContext(InvContext);
      try
        if MethName <> '' then
          MethNum := GetMethNum(IntfMD, MethName);
        FConverter.MsgToInvContext(Request, IntfMD, MethNum, InvContext);
        try
          Obj :=  InvRegistry.GetInvokableObjectFromClass(AClass);
          if Obj = nil then
            raise Exception.CreateFmt(SNoClassRegistered, [IntfMD.Name]);
          Inv := TInterfaceInvoker.Create;
          try
            Inv.Invoke(Obj, IntfMD, MethNum, InvContext);
          finally
            Inv.Free;
          end;
          FConverter.MakeResponse(IntfMD, MethNum, InvContext, Response);
        except
          on E: Exception do
          begin
            ExMsg := FConverter.MakeFault(E);
            Response.Write(ExMsg[1], Length(ExMsg) * 2);
          end;
        end;
      finally
        InvContext.Free;
        SetRemotableDataContext(nil);
      end;
    except
      on E: Exception do
      begin
        FConverter := TOPToSoapDomConvert.Create(nil) as IOPConvert;
        ExMsg := FConverter.MakeFault(E);
        Response.Write(ExMsg[1], Length(ExMsg) * 2);
      end;
    end;
  finally
    CoUnInitialize;
  end;
end;

procedure TSoapPascalInvoker.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FDomConverter) then
  begin
    FConverter := nil;
    FDomConverter := nil;
  end;
end;

procedure  TSoapPascalInvoker.SetDomConverter(Value: TOPToSoapDomConvert);
begin
  if Assigned(FDOMConverter) and (FDomConverter.Owner = Self) then
  begin
    FConverter := nil;
    FDomConverter.Free;
  end;
  FDomConverter := Value;
  if Value <> nil then
  begin
    FConverter := Value;
    Value.FreeNotification(Self);
  end;
end;

end.


