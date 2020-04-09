
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{       Copyright (c) 1998 Inprise Corporation          }
{                                                       }
{*******************************************************}

unit CorbaStd;

interface

uses Classes, ActiveX, StdVcl, Forms, CorbaObj, OrbPas;

type

  { TProviderStub }

  TProviderStub = class(TCORBADispatchStub, IProvider)
  private
    { IProvider }
    function Get_Data: OleVariant; safecall;
    function ApplyUpdates(Delta: OleVariant; MaxErrors: Integer; out ErrorCount: Integer): OleVariant; safecall;
    function GetMetaData: OleVariant; safecall;
    function GetRecords(Count: Integer; out RecsOut: Integer): OleVariant; safecall;
    function DataRequest(Input: OleVariant): OleVariant; safecall;
    function Get_Constraints: WordBool; safecall;
    procedure Set_Constraints(Value: WordBool); safecall;
    procedure Reset(MetaData: WordBool); safecall;
    procedure SetParams(Values: OleVariant); safecall;
  end;

  { TProviderSkeleton }

  TProviderSkeleton = class(TCORBASkeleton)
  private
    FIntf: IProvider;
  public
    constructor Create(const InstanceName: string; const Impl: IObject); override; 
    procedure GetImplementation(out Impl: IObject); override; stdcall;
  published
    procedure Get_Data(const Strm: IMarshalInBuffer; Cookie: Pointer);
    procedure ApplyUpdates(const Strm: IMarshalInBuffer; Cookie: Pointer);
    procedure GetMetaData(const Strm: IMarshalInBuffer; Cookie: Pointer);
    procedure GetRecords(const Strm: IMarshalInBuffer; Cookie: Pointer);
    procedure DataRequest(const Strm: IMarshalInBuffer; Cookie: Pointer);
    procedure Get_Constraints(const Strm: IMarshalInBuffer; Cookie: Pointer);
    procedure Set_Constraints(const Strm: IMarshalInBuffer; Cookie: Pointer);
    procedure Reset(const Strm: IMarshalInBuffer; Cookie: Pointer);
    procedure SetParams(const Strm: IMarshalInBuffer; Cookie: Pointer);
  end;

  { TDataBrokerStub }

  TDataBrokerStub = class(TCORBADispatchStub, IDataBroker)
  protected
    { IDataBroker }
    function GetProviderNames: OleVariant; safecall;
  end;

  { TDataBrokerSkeleton }

  TDataBrokerSkeleton = class(TCORBASkeleton)
  private
    FIntf: IDataBroker;
  public
    constructor Create(const InstanceName: string; const Impl: IUnknown); override;
    procedure GetImplementation(out Impl: IObject); override; stdcall;
  published
    procedure GetProviderNames(const Strm: IMarshalInBuffer; Cookie: Pointer);
  end;


implementation

{ TProviderStub }

function TProviderStub.Get_Data: OleVariant;
var
  OutBuf: IMarshalOutBuffer;
  InBuf: IMarshalInBuffer;
begin
  FStub.CreateRequest('Get_Data', True, OutBuf);
  FStub.Invoke(OutBuf, InBuf);
  Result := UnmarshalAny(InBuf);
end;

function TProviderStub.ApplyUpdates(Delta: OleVariant; MaxErrors: Integer; out ErrorCount: Integer): OleVariant;
var
  OutBuf: IMarshalOutBuffer;
  InBuf: IMarshalInBuffer;
begin
  FStub.CreateRequest('ApplyUpdates', True, OutBuf);
  MarshalAny(OutBuf, Delta);
  OutBuf.PutLong(MaxErrors);
  FStub.Invoke(OutBuf, InBuf);
  Result := UnmarshalAny(InBuf);
  ErrorCount := InBuf.GetLong;
end;

function TProviderStub.GetMetaData: OleVariant;
var
  OutBuf: IMarshalOutBuffer;
  InBuf: IMarshalInBuffer;
begin
  FStub.CreateRequest('GetMetaData', True, OutBuf);
  FStub.Invoke(OutBuf, InBuf);
  Result := UnmarshalAny(InBuf);
end;

function TProviderStub.GetRecords(Count: Integer; out RecsOut: Integer): OleVariant;
var
  OutBuf: IMarshalOutBuffer;
  InBuf: IMarshalInBuffer;
begin
  FStub.CreateRequest('GetRecords', True, OutBuf);
  OutBuf.PutLong(Count);
  FStub.Invoke(OutBuf, InBuf);
  Result := UnmarshalAny(InBuf);
  RecsOut := InBuf.GetLong;
end;

function TProviderStub.DataRequest(Input: OleVariant): OleVariant;
var
  OutBuf: IMarshalOutBuffer;
  InBuf: IMarshalInBuffer;
begin
  FStub.CreateRequest('DataRequest', True, OutBuf);
  MarshalAny(OutBuf, Input);
  FStub.Invoke(OutBuf, InBuf);
  Result := UnmarshalAny(InBuf);
end;

function TProviderStub.Get_Constraints: WordBool;
var
  OutBuf: IMarshalOutBuffer;
  InBuf: IMarshalInBuffer;
begin
  FStub.CreateRequest('Get_Constraints', True, OutBuf);
  FStub.Invoke(OutBuf, InBuf);
  Result := UnmarshalWordBool(Inbuf);
end;

procedure TProviderStub.Set_Constraints(Value: WordBool);
var
  OutBuf: IMarshalOutBuffer;
  InBuf: IMarshalInBuffer;
begin
  FStub.CreateRequest('Set_Constraints', True, OutBuf);
  MarshalWordBool(OutBuf, Value);
  FStub.Invoke(OutBuf, InBuf);
end;

procedure TProviderStub.Reset(MetaData: WordBool);
var
  OutBuf: IMarshalOutBuffer;
  InBuf: IMarshalInBuffer;
begin
  FStub.CreateRequest('Reset', True, OutBuf);
  MarshalWordBool(OutBuf, MetaData);
  FStub.Invoke(OutBuf, InBuf);
end;

procedure TProviderStub.SetParams(Values: OleVariant); safecall;
var
  OutBuf: IMarshalOutBuffer;
  InBuf: IMarshalInBuffer;
begin
  FStub.CreateRequest('SetParams', True, OutBuf);
  MarshalAny(OutBuf, Values);
  FStub.Invoke(OutBuf, InBuf);
end;

{ TProviderSkeleton }

constructor TProviderSkeleton.Create(const InstanceName: string;
  const Impl: IUnknown);
begin
  inherited InitSkeleton('IProvider', InstanceName, '', tmMultiThreaded, True);
  FIntf := Impl as IProvider;
end;

procedure TProviderSkeleton.GetImplementation(out Impl: IObject);
begin
  impl := FIntf;
end;

procedure TProviderSkeleton.ApplyUpdates(const Strm: IMarshalInBuffer;
  Cookie: Pointer);
var
  OutBuf: IMarshalOutBuffer;
  MaxErrors: Integer;
  Delta: OleVariant;
  Retval: OleVariant;
  ErrorCount: Integer;
begin
  Delta := UnmarshalAny(Strm);
  MaxErrors := Strm.GetLong;
  CoInitialize(nil);
  Retval := FIntf.ApplyUpdates(Delta, MaxErrors, ErrorCount);
  CoUninitialize;
  FSkeleton.GetReplyBuffer(Cookie, OutBuf);
  MarshalAny(OutBuf, Retval);
  OutBuf.PutLong(ErrorCount);
end;

procedure TProviderSkeleton.DataRequest(const Strm: IMarshalInBuffer;
  Cookie: Pointer);
var
  OutBuf: IMarshalOutBuffer;
  Params: OleVariant;
  Retval: OleVariant;
begin
  Params := UnmarshalAny(Strm);
  Retval := FIntf.DataRequest(Params);
  FSkeleton.GetReplyBuffer(Cookie, OutBuf);
  MarshalAny(OutBuf, Retval);
end;

procedure TProviderSkeleton.Get_Constraints(const Strm: IMarshalInBuffer;
  Cookie: Pointer);
var
  OutBuf: IMarshalOutBuffer;
  Constraints: WordBool;
begin
  Constraints := FIntf.Get_Constraints;
  FSkeleton.GetReplyBuffer(Cookie, OutBuf);
  MarshalWordBool(OutBuf, Constraints);
end;

procedure TProviderSkeleton.Get_Data(const Strm: IMarshalInBuffer;
  Cookie: Pointer);
var
  OutBuf: IMarshalOutBuffer;
  Data: OleVariant;
begin
  Data := FIntf.Get_Data;
  FSkeleton.GetReplyBuffer(Cookie, OutBuf);
  MarshalAny(OutBuf, Data);
end;

procedure TProviderSkeleton.GetMetaData(const Strm: IMarshalInBuffer;
  Cookie: Pointer);
var
  OutBuf: IMarshalOutBuffer;
  MetaData: OleVariant;
begin
  MetaData := FIntf.GetMetaData;
  FSkeleton.GetReplyBuffer(Cookie, OutBuf);
  MarshalAny(OutBuf, MetaData);
end;

procedure TProviderSkeleton.GetRecords(const Strm: IMarshalInBuffer;
  Cookie: Pointer);
var
  OutBuf: IMarshalOutBuffer;
  Count: Integer;
  RecsOut: Integer;
  Data: OleVariant;
begin
  Count := Strm.GetLong;
  CoInitialize(nil);
  Data := FIntf.GetRecords(Count, RecsOut);
  CoUninitialize;
  FSkeleton.GetReplyBuffer(Cookie, OutBuf);
  MarshalAny(OutBuf, Data);
  OutBuf.PutLong(RecsOut);
end;

procedure TProviderSkeleton.Reset(const Strm: IMarshalInBuffer;
  Cookie: Pointer);
var
  OutBuf: IMarshalOutBuffer;
  MetaData: WordBool;
begin
  MetaData := UnmarshalWordBool(Strm);
  FSkeleton.GetReplyBuffer(Cookie, OutBuf);
  FIntf.Reset(MetaData);
end;

procedure TProviderSkeleton.Set_Constraints(const Strm: IMarshalInBuffer;
  Cookie: Pointer);
var
  Constraints: WordBool;
begin
  Constraints := UnmarshalWordBool(Strm);
  FIntf.Set_Constraints(Constraints);
end;

procedure TProviderSkeleton.SetParams(const Strm: IMarshalInBuffer;
  Cookie: Pointer);
var
  OutBuf: IMarshalOutBuffer;
  Params: OleVariant;
begin
  Params := UnmarshalAny(Strm);
  FIntf.SetParams(Params);
  FSkeleton.GetReplyBuffer(Cookie, OutBuf);
end;

{ TDataBrokerSkeleton }

constructor TDataBrokerSkeleton.Create(const InstanceName: string; const Impl: IObject);
begin
  FIntf := Impl as IDataBroker;
end;

procedure TDataBrokerSkeleton.GetImplementation(out Impl: IObject);
begin
  Impl := FIntf;
end;

procedure TDataBrokerSkeleton.GetProviderNames(
  const Strm: IMarshalInBuffer; Cookie: Pointer);
var
  Data: OleVariant;
  OutBuf: IMarshalOutBuffer;
begin
  Data := FIntf.GetProviderNames;
  FSkeleton.GetReplyBuffer(cookie, OutBuf);
  MarshalAny(OutBuf, Data);
end;

{ TDataBrokerStub }

function TDataBrokerStub.GetProviderNames: OleVariant;
var
  OutBuf: IMarshalOutBuffer;
  InBuf: IMarshalInBuffer;
begin
  FStub.CreateRequest('GetProviderNames', True, OutBuf);
  FStub.Invoke(OutBuf, InBuf);
  Result := UnmarshalAny(InBuf);
end;

initialization
  CORBASkeletonManager.RegisterSkeleton(IProvider, TProviderSkeleton);
  CORBAStubManager.RegisterStub(IProvider, TProviderStub);
  CORBASkeletonManager.RegisterSkeleton(IDataBroker, TDataBrokerSkeleton);
  CORBAStubManager.RegisterStub(IDataBroker, TDataBrokerStub);

end.
