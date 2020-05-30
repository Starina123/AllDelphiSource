unit CustomerFormViewU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  BaseFormViewU, StdCtrls, Mask, DBCtrls, ComCtrls, ToolWin, ExtCtrls;

type
  TCustomerFormView = class(TBaseFormView)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    procedure DBNavigator2BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomerFormView: TCustomerFormView;

implementation

uses ClientDataModuleU, db;

{$R *.DFM}

procedure TCustomerFormView.DBNavigator2BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  if Button = nbRefresh then
  begin
    // Do our own refresh when we don't use providers.
    ClientDataModule.CustomerTreeDataSet.CheckBrowseMode;
    if ClientDataModule.CustomerTreeDataSet.UpdateStatus <> usUnmodified then
    begin
      if MessageDlg('Discard changes?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         ClientDataModule.DiscardCustomerChanges;
    end
    else
      ClientDataModule.DiscardCustomerChanges;
    Abort;    // Cancel default processing
  end;
end;

end.
