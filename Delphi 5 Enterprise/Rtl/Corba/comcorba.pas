
{*******************************************************}
{                                                       }
{       Borland Delphi Runtime Library                  }
{                                                       }
{       Copyright (C) 1999 Inprise Corporation          }
{                                                       }
{*******************************************************}

unit ComCorba;

interface

uses SysUtils, ORBPAS, ComObj, CorbaObj;

type
  TCorbaComObjectFactory = class(TCorbaFactory)
  private
    FImplementationClass: TComClass;
  protected
    function CreateInterface(const InstanceName: string): IObject; override;
  public
    constructor Create(const InterfaceName, InstanceName, RepositoryId: string;
      const ImplGUID: TGUID; ImplementationClass: TComClass;
      Instancing: TCorbaInstancing = iMultiInstance;
      ThreadModel: TCorbaThreadModel = tmSingleThread);
    property ImplementationClass: TComClass read FImplementationClass;
  end;

implementation

uses ActiveX;

{ TCorbaComOjectFactory }

constructor TCorbaComObjectFactory.Create(const InterfaceName, InstanceName,
  RepositoryId: string; const ImplGUID: TGUID;
  ImplementationClass: TComClass;
  Instancing: TCorbaInstancing; ThreadModel: TCorbaThreadModel);
begin
  inherited Create(InterfaceName, InstanceName, RepositoryID, ImplGUID,
    Instancing, ThreadModel);
  FImplementationClass := ImplementationClass;
end;

function TCorbaComObjectFactory.CreateInterface(const InstanceName: string): IObject;
begin
  Result := FImplementationClass.Create;
end;

initialization
  CoInitialize(nil);
  
end.
