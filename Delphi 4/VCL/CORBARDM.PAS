
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{       CORBA Remote Data Module                        }
{                                                       }
{       Copyright (c) 1998 Inprise Corporation          }
{                                                       }
{*******************************************************}

unit CorbaRdm;

interface

uses Classes, ActiveX, StdVcl, Forms, DataBkr, CorbaObj, CorbaStd;

type

  { TCorbaDataModule }

  TCorbaDataModule = class(TRemoteDataModule, IUnknown)
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses sysutils, Windows, ComObj;

constructor TCorbaDataModule.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  CoInitialize(nil);
end;

destructor TCorbaDataModule.Destroy;
begin
  CoUninitialize;
  inherited;
end;

end.
