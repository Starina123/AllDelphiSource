unit Financials_MutualFund_s;

{This file was generated on 11 Aug 2000 20:14:44 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file account.idl.        }

{Delphi Pascal unit      : Financials_MutualFund_s                            }
{derived from IDL module : MutualFund                                         }



interface

uses
  CORBA,
  Financials_MutualFund_i,
  Financials_MutualFund_c;

type
  TAssetSkeleton = class;

  TAssetSkeleton = class(CORBA.TCorbaObject, Financials_MutualFund_i.Asset)
  private
    FImplementation : Asset;
  public
    constructor Create(const InstanceName: string; const Impl: Asset);
    destructor Destroy; override;
    function GetImplementation : Asset;
    function  nav : Single;
  published
    procedure _nav(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;


implementation

constructor TAssetSkeleton.Create(const InstanceName : string; const Impl : Financials_MutualFund_i.Asset);
begin
  inherited;
  inherited CreateSkeleton(InstanceName, 'Asset', 'IDL:Financials/MutualFund/Asset:1.0');
  FImplementation := Impl;
end;

destructor TAssetSkeleton.Destroy;
begin
  FImplementation := nil;
  inherited;
end;

function TAssetSkeleton.GetImplementation : Financials_MutualFund_i.Asset;
begin
  result := FImplementation as Financials_MutualFund_i.Asset;
end;

function  TAssetSkeleton.nav : Single;
begin
  Result := FImplementation.nav;
end;

procedure TAssetSkeleton._nav(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : Single;
begin
  _Result := nav;
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteFloat(_Result);
end;


initialization


end.