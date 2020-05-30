unit AppActionsU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ImgList;

type
  TAppActions = class(TForm)
    ActionList1: TActionList;
    NextCustomerAction: TAction;
    PriorCustomerAction: TAction;
    ApplyCustomerChangesAction: TAction;
    CancelCustomerChangesAction: TAction;
    GotoCustomerAction: TAction;
    procedure ApplyCustomerChangesActionExecute(
  Sender: TObject);
    procedure GotoCustomerActionExecute(Sender: TObject);
    procedure ApplyCustomerChangesActionUpdate(Sender: TObject);
    procedure CancelCustomerChangesActionUpdate(Sender: TObject);
    procedure CancelCustomerChangesActionExecute(Sender: TObject);
  private
    { Private declarations }
    function GetCustomerDialog(var ACustNo: Integer): Boolean;
  public
    function GetPartDialog(var APartNo: Integer): Boolean;
    { Public declarations }
  end;

var
  AppActions: TAppActions;

implementation

uses ClientDataModuleU, CustListFormU, PartsListFormU, Db;

{$R *.DFM}

procedure TAppActions.ApplyCustomerChangesActionExecute(
  Sender: TObject);
begin
  ClientDataModule.ApplyCustomerChanges;
end;

procedure TAppActions.GotoCustomerActionExecute(Sender: TObject);
var
  CustNo: Integer;
begin
  if GetCustomerDialog(CustNo) then
  begin
    ClientDataModule.CustomerListDataSet.Locate('CustNo', CustNo, []);
  end;
end;



function TAppActions.GetCustomerDialog(var ACustNo: Integer): Boolean;
begin
  with TCustListForm.Create(Self) do
    try
      Result := ShowModal = mrOk;
      if Result then
        ACustNo := CustNo;
    finally
      Free;
    end;
end;

function TAppActions.GetPartDialog(var APartNo: Integer): Boolean;
begin
  with TPartsListForm.Create(Self) do
    try
      Result := ShowModal = mrOk;
      if Result then
        APartNo := PartNo;
    finally
      Free;
    end;
end;

procedure TAppActions.ApplyCustomerChangesActionUpdate(Sender: TObject);
begin
  ApplyCustomerChangesAction.Enabled :=
    Assigned(ClientDataModule.AppServer) and (
    ClientDataModule.CustomerTreeDataSet.ChangeCount <> 0);
end;

procedure TAppActions.CancelCustomerChangesActionUpdate(Sender: TObject);
begin
  CancelCustomerChangesAction.Enabled :=
    Assigned(ClientDataModule.AppServer) and (
    ClientDataModule.CustomerTreeDataSet.ChangeCount <> 0);

end;

procedure TAppActions.CancelCustomerChangesActionExecute(Sender: TObject);
begin
  ClientDataModule.DiscardCustomerChanges;
end;

end.
