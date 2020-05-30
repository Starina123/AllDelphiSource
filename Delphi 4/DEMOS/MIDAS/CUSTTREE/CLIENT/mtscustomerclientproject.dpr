program MtsCustomerClientProject;

{
  Running the sample
  ------------------

  Before running the sample, install the MtsCustomerTreeProject
  server into MTS.  See MTS Installation instructions in the Server project

  1) Open the Client\MtsCustomerClientProject project
  2) Run/Run
  3) Click OK in the connection dialog
  4) The client application has tabs to represent the master
  and detail records.  To view master and detail records
  concurrently, drag one of the tabs toward the bottom of the
  main window to dock.  Hold the control key down to create a
  floating window.
}

uses
  Forms,
  ClientDataModuleU in 'ClientDataModuleU.pas' {ClientDataModule: TDataModule},
  MainFormU in 'MainFormU.pas' {MainForm},
  MTSOptionsFormU in 'MTSOptionsFormU.pas' {MTSOptionsForm},
  PartsListFormU in 'PartsListFormU.pas' {PartsListForm},
  CustListFormU in 'CustListFormU.pas' {CustListForm},
  BaseViewU in 'BaseViewU.pas' {BaseView},
  BaseListViewU in 'BaseListViewU.pas' {BaseListView},
  OrdersListViewU in 'OrdersListViewU.pas' {OrdersListView},
  ItemsListViewU in 'ItemsListViewU.pas' {ItemsListView},
  BaseFormViewU in 'BaseFormViewU.pas' {BaseFormView},
  CustomerFormViewU in 'CustomerFormViewU.pas' {CustomerFormView},
  OrderFormViewU in 'OrderFormViewU.pas' {OrderFormView},
  AppActionsU in 'AppActionsU.pas' {AppActions},
  CustomerListViewU in 'CustomerListViewU.pas' {CustomersListView},
  PackBriefFormU in 'PackBriefFormU.pas' {PackBriefForm},
  ConnectionFormU in 'ConnectionFormU.pas' {ConnectionForm},
  PageControlFormU in 'PageControlFormU.pas' {PageControlForm},
  MtsConnectionFormU in 'MtsConnectionFormU.pas' {MTSConnectionForm},
  MtsMainFormU in 'MtsMainFormU.pas' {MTSMainForm},
  MtsCustomerTreeProject_TLB in 'MtsCustomerTreeProject_TLB.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TClientDataModule, ClientDataModule);
  Application.CreateForm(TMTSMainForm, MTSMainForm);
  Application.CreateForm(TAppActions, AppActions);
  Application.Run;
end.
