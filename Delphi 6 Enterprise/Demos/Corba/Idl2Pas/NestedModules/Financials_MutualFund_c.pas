unit Financials_MutualFund_c;

{This file was generated on 11 Aug 2000 20:14:44 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file account.idl.        }

{Delphi Pascal unit      : Financials_MutualFund_c                            }
{derived from IDL module : MutualFund                                         }



interface

uses
  CORBA,
  Financials_MutualFund_i;

type
  TAssetHelper = class;
  TAssetStub = class;

  TAssetHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : Financials_MutualFund_i.Asset);
    class function  Extract(var _A: CORBA.Any) : Financials_MutualFund_i.Asset;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : Financials_MutualFund_i.Asset;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : Financials_MutualFund_i.Asset);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : Financials_MutualFund_i.Asset;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : Financials_MutualFund_i.Asset; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : Financials_MutualFund_i.Asset; overload;
  end;

  TAssetStub = class(CORBA.TCORBAObject, Financials_MutualFund_i.Asset)
  public
    function  nav : Single; virtual;
  end;


implementation

class procedure TAssetHelper.Insert(var _A : CORBA.Any; const _Value : Financials_MutualFund_i.Asset);
begin
  _A := Orb.MakeObjectRef( TAssetHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TAssetHelper.Extract(var _A : CORBA.Any): Financials_MutualFund_i.Asset;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TAssetHelper.Narrow(_obj, True);
end;

class function TAssetHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'Asset');
end;

class function TAssetHelper.RepositoryId : string;
begin
  Result := 'IDL:Financials/MutualFund/Asset:1.0';
end;

class function TAssetHelper.Read(const _Input : CORBA.InputStream) : Financials_MutualFund_i.Asset;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TAssetHelper.Write(const _Output : CORBA.OutputStream; const _Value : Financials_MutualFund_i.Asset);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TAssetHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : Financials_MutualFund_i.Asset;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(Financials_MutualFund_i.Asset, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TAssetStub.Create(_Obj);
end;

class function TAssetHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : Financials_MutualFund_i.Asset;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TAssetHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : Financials_MutualFund_i.Asset;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TAssetStub.nav : Single;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('nav',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadFloat(Result);
end;


initialization


end.