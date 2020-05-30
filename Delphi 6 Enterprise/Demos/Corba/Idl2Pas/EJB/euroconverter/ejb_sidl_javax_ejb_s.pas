unit ejb_sidl_javax_ejb_s;

{This file was generated on 28 Feb 2001 10:06:55 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file sidl.idl.           }

{Delphi Pascal unit      : ejb_sidl_javax_ejb_s                               }
{derived from IDL module : ejb                                                }



interface

uses
  CORBA,
  ejb_sidl_javax_ejb_i,
  ejb_sidl_javax_ejb_c;

type
  TEJBHomeSkeleton = class;
  TEJBObjectSkeleton = class;

  TEJBHomeSkeleton = class(CORBA.TCorbaObject, ejb_sidl_javax_ejb_i.EJBHome)
  private
    FImplementation : EJBHome;
  public
    constructor Create(const InstanceName: string; const Impl: EJBHome);
    destructor Destroy; override;
    function GetImplementation : EJBHome;
    function  getEJBMetaData : ejb_sidl_javax_ejb_i.EJBMetaData;
    procedure remove ( const primaryKey : ANY);
    function  getSimplifiedIDL : AnsiString;
  published
    procedure _getEJBMetaData(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _remove(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _getSimplifiedIDL(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;

  TEJBObjectSkeleton = class(CORBA.TCorbaObject, ejb_sidl_javax_ejb_i.EJBObject)
  private
    FImplementation : EJBObject;
  public
    constructor Create(const InstanceName: string; const Impl: EJBObject);
    destructor Destroy; override;
    function GetImplementation : EJBObject;
    function  getEJBHome : ejb_sidl_javax_ejb_i.EJBHome;
    function  getPrimaryKey : ANY;
    procedure remove ;
  published
    procedure _getEJBHome(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _getPrimaryKey(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _remove(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;


implementation

constructor TEJBHomeSkeleton.Create(const InstanceName : string; const Impl : ejb_sidl_javax_ejb_i.EJBHome);
begin
  inherited;
  inherited CreateSkeleton(InstanceName, 'EJBHome', 'IDL:borland.com/sidl/javax/ejb/EJBHome:1.0');
  FImplementation := Impl;
end;

destructor TEJBHomeSkeleton.Destroy;
begin
  FImplementation := nil;
  inherited;
end;

function TEJBHomeSkeleton.GetImplementation : ejb_sidl_javax_ejb_i.EJBHome;
begin
  result := FImplementation as ejb_sidl_javax_ejb_i.EJBHome;
end;

function  TEJBHomeSkeleton.getEJBMetaData : ejb_sidl_javax_ejb_i.EJBMetaData;
begin
  Result := FImplementation.getEJBMetaData;
end;

procedure TEJBHomeSkeleton.remove ( const primaryKey : ANY);
begin
  FImplementation.remove( primaryKey);
end;

function  TEJBHomeSkeleton.getSimplifiedIDL : AnsiString;
begin
  Result := FImplementation.getSimplifiedIDL;
end;

procedure TEJBHomeSkeleton._getEJBMetaData(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : ejb_sidl_javax_ejb_i.EJBMetaData;
begin
  _Result := getEJBMetaData;
  GetReplyBuffer(_Cookie, _Output);
  ejb_sidl_javax_ejb_c.TEJBMetaDataHelper.Write(_Output, _Result);
end;

procedure TEJBHomeSkeleton._remove(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _primaryKey : ANY;
begin
  _Input.ReadAny(_primaryKey);
  try
    remove( _primaryKey);
  except on E: UserException do
    begin
      GetExceptionReplyBuffer(_Cookie, _Output);
      E.WriteExceptionInfo(_Output);
      exit
    end;
  end;
  GetReplyBuffer(_Cookie, _Output);
end;

procedure TEJBHomeSkeleton._getSimplifiedIDL(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : AnsiString;
begin
  _Result := getSimplifiedIDL;
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteString(_Result);
end;

constructor TEJBObjectSkeleton.Create(const InstanceName : string; const Impl : ejb_sidl_javax_ejb_i.EJBObject);
begin
  inherited;
  inherited CreateSkeleton(InstanceName, 'EJBObject', 'IDL:borland.com/sidl/javax/ejb/EJBObject:1.0');
  FImplementation := Impl;
end;

destructor TEJBObjectSkeleton.Destroy;
begin
  FImplementation := nil;
  inherited;
end;

function TEJBObjectSkeleton.GetImplementation : ejb_sidl_javax_ejb_i.EJBObject;
begin
  result := FImplementation as ejb_sidl_javax_ejb_i.EJBObject;
end;

function  TEJBObjectSkeleton.getEJBHome : ejb_sidl_javax_ejb_i.EJBHome;
begin
  Result := FImplementation.getEJBHome;
end;

function  TEJBObjectSkeleton.getPrimaryKey : ANY;
begin
  Result := FImplementation.getPrimaryKey;
end;

procedure TEJBObjectSkeleton.remove ;
begin
  FImplementation.remove;
end;

procedure TEJBObjectSkeleton._getEJBHome(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : ejb_sidl_javax_ejb_i.EJBHome;
begin
  _Result := getEJBHome;
  GetReplyBuffer(_Cookie, _Output);
  ejb_sidl_javax_ejb_c.TEJBHomeHelper.Write(_Output, _Result);
end;

procedure TEJBObjectSkeleton._getPrimaryKey(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : ANY;
begin
  _Result := getPrimaryKey;
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteAny(_Result);
end;

procedure TEJBObjectSkeleton._remove(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
begin
  try
    remove;
  except on E: UserException do
    begin
      GetExceptionReplyBuffer(_Cookie, _Output);
      E.WriteExceptionInfo(_Output);
      exit
    end;
  end;
  GetReplyBuffer(_Cookie, _Output);
end;


initialization


end.