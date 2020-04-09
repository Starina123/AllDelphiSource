
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{       MTS Remote Data Module                          }
{                                                       }
{       Copyright (c) 1998 Inprise Corporation          }
{                                                       }
{*******************************************************}

unit MtsRdm;

interface

uses Windows, Classes, Forms, DataBkr, Mtx;

type
  { TMtsDataModule }

  TMtsDataModule = class(TRemoteDataModule, IObjectControl)
  private
    FOnActivate: TNotifyEvent;
    FOnDeActivate: TNotifyEvent;
    FObjectContext: IObjectContext;
  protected
    { IObjectControl }
    procedure Activate; safecall;
    procedure Deactivate; stdcall;
    function CanBePooled: Bool; stdcall;

    property ObjectContext: IObjectContext read FObjectContext;
  public
    procedure SetComplete;
    procedure SetAbort;
    procedure EnableCommit;
    procedure DisableCommit;
    function IsInTransaction: Bool;
    function IsSecurityEnabled: Bool;
    function IsCallerInRole(const Role: WideString): Bool;
  published
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
  end;

implementation

uses ComObj;

procedure TMtsDataModule.Activate;
begin
  FObjectContext := GetObjectContext;
  if Assigned(FOnActivate) then FOnActivate(Self);
end;

procedure TMtsDataModule.Deactivate;
begin
  if Assigned(FOnDeactivate) then FOnDeactivate(Self);
  FObjectContext := nil;
end;

function TMtsDataModule.CanBePooled: Bool;
begin
  Result := False;
end;

procedure TMtsDataModule.SetComplete;
begin
  if Assigned(FObjectContext) then FObjectContext.SetComplete;
end;

procedure TMtsDataModule.SetAbort;
begin
  if Assigned(FObjectContext) then FObjectContext.SetAbort;
end;

procedure TMtsDataModule.EnableCommit;
begin
  if Assigned(FObjectContext) then FObjectContext.EnableCommit;
end;

procedure TMtsDataModule.DisableCommit;
begin
  if Assigned(FObjectContext) then FObjectContext.DisableCommit;
end;

function TMtsDataModule.IsInTransaction: Bool;
begin
  if Assigned(FObjectContext) then Result := FObjectContext.IsInTransaction
  else Result := False;
end;

function TMtsDataModule.IsSecurityEnabled: Bool;
begin
  if Assigned(FObjectContext) then Result := FObjectContext.IsSecurityEnabled
  else Result := False;
end;

function TMtsDataModule.IsCallerInRole(const Role: WideString): Bool;
begin
  if Assigned(FObjectContext) then Result := FObjectContext.IsCallerInRole(Role)
  else Result := False;
end;

end.
