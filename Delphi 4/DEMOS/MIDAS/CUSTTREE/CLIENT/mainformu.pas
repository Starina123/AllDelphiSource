unit MainFormU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Mask, ActnList,
  Db, DBTables, StdActns, Menus, ImgList, DBClient;

type
  TViews = (vwCustomersList, vwCustomerForm, vwOrdersList, vwOrderForm, vwItemsList);

  TMainForm = class(TForm)
    ActionList1: TActionList;
    ConnectAction: TAction;
    ViewOrdersListAction: TAction;
    ViewItemsListAction: TAction;
    ViewCustomerFormAction: TAction;
    ViewOrderFormAction: TAction;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    View1: TMenuItem;
    CustomerForm1: TMenuItem;
    OrderForm1: TMenuItem;
    OrdersList1: TMenuItem;
    ItemsList1: TMenuItem;
    Edit1: TMenuItem;
    CopyAction: TEditCopy;
    CutAction: TEditCut;
    PasteAction: TEditPaste;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Search1: TMenuItem;
    GotoCustomer1: TMenuItem;
    ExitAction: TAction;
    Exit1: TMenuItem;
    PackBriefcaseAction: TAction;
    PackBriefcase1: TMenuItem;
    Server1: TMenuItem;
    Connect1: TMenuItem;
    ViewAvailableCustomersAction: TAction;
    ViewCustomersListAction: TAction;
    CustomersList1: TMenuItem;
    ApplyChanges1: TMenuItem;
    CancelChanges1: TMenuItem;
    ImageList1: TImageList;
    N1: TMenuItem;
    N2: TMenuItem;
    AvailableCustomers1: TMenuItem;
    CustomerEdits1: TMenuItem;
    Panel9: TPanel;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    DBText1: TDBText;
    Panel6: TPanel;
    Panel2: TPanel;
    Splitter2: TSplitter;
    Panel4: TPanel;
    DBText2: TDBText;
    Panel7: TPanel;
    Panel5: TPanel;
    DBText3: TDBText;
    Panel8: TPanel;
    Panel10: TPanel;
    DBText4: TDBText;
    Panel11: TPanel;
    Splitter3: TSplitter;
    ViewStatusLogAction: TAction;
    procedure FormCreate(Sender: TObject);
    procedure ConnectActionExecute(Sender: TObject);
    procedure ShowViewActionExecute(Sender: TObject);
    procedure ShowViewActionUpdate(Sender: TObject);
    procedure ExitActionExecute(Sender: TObject);
    procedure PackBriefcaseActionExecute(Sender: TObject);
    procedure ViewStatusLogActionExecute(Sender: TObject);
    procedure ViewStatusLogActionUpdate(Sender: TObject);
  private
    { Private declarations }
    procedure PackBriefcaseDialog;
  protected
    procedure Connect(AEmpNo: Integer); virtual; abstract;
    function ConnectDialog: Boolean; virtual; abstract;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses ClientDataModuleU, 
  OrdersListViewU, ItemsListViewU, CustomerFormViewU, OrderFormViewU,
  BaseViewU, AppActionsU, CustomerListViewU, PackBriefFormU,
  PageControlFormU;

{$R *.DFM}

var
  Views: array[TViews] of TBaseView =
  (nil, nil, nil, nil, nil);


procedure TMainForm.FormCreate(Sender: TObject);

  function GetCmdLineArg(const Switch: string): string;
  const
    SwitchChars = ['-', '/'];
  var
    I: Integer;
    S: string;
  begin
    I := 1;
    while I <= ParamCount do
    begin
      S := ParamStr(I);
      if (SwitchChars = []) or (S[1] in SwitchChars) then
        if (AnsiCompareText(Copy(S, 2, Maxint), Switch) = 0) then
        begin
          Inc(I);
          if I <= ParamCount then
          begin
            Result := ParamStr(I);
            Exit;
          end;
        end;
      Inc(I);
    end;
    Result := '';
  end;
var
  SEmpNo: string;
  V: TViews;
begin
  SEmpNo := GetCmdLineArg('E');
  if SEmpNo <> '' then
  begin
    Connect(StrToInt(SEmpNo));
  end
  else if not ConnectDialog then
  begin
    Application.ShowMainForm := False;
    Application.Terminate;
    Exit;
  end;

  ViewOrdersListAction.Tag := Integer(vwOrdersList);
  ViewOrderFormAction.Tag := Integer(vwOrderForm);
  ViewCustomerFormAction.Tag := Integer(vwCustomerForm);
  ViewItemsListAction.Tag := Integer(vwItemsList);
  ViewCustomersListAction.Tag := Integer(vwCustomersList);
  Views[vwOrdersList] := TOrdersListView.Create(Self);
  Views[vwOrderForm] := TOrderFormView.Create(Self);
  Views[vwItemsList] := TItemsListView.Create(Self);
  Views[vwCustomerForm] := TCustomerFormView.Create(Self);
  Views[vwCustomersList] := TCustomersListView.Create(Self);
  with TPageControlForm.Create(Self) do
  begin
    ManualDock(Panel9, nil, alTop);
    for V := Low(TViews) to High(TViews) do
    begin
      if V <> vwCustomersList then
      begin
        Views[V].ManualDock(ViewPageControl, nil, alTop);
        Views[V].Visible := True;
      end;
    end;
    ViewPageControl.ActivePage := ViewPageControl.Pages[0];
  end;
end;


procedure TMainForm.ConnectActionExecute(Sender: TObject);
begin
  ConnectDialog;
end;

procedure TMainForm.ShowViewActionExecute(Sender: TObject);
var
  View: TBaseView;
  Action: TAction;
begin
  if Sender is TWinControl then
    Sender := TWinControl(Sender).Action
  else if Sender is TMenuItem then
    Sender := TMenuItem(Sender).Action;
  Action := Sender as TAction;
  View := Views[TViews(Action.Tag)];
  Action.Checked := not Action.Checked;
  View.Visible := Action.Checked;
end;

procedure TMainForm.ShowViewActionUpdate(Sender: TObject);
var
  View: TBaseView;
  Action: TAction;
begin
  Action := Sender as TAction;
  View := Views[TViews(Action.Tag)];
  Action.Checked := View.Visible;
end;

procedure TMainForm.ExitActionExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMainForm.PackBriefcaseDialog;
begin
  with TPackBriefForm.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;


procedure TMainForm.PackBriefcaseActionExecute(Sender: TObject);
begin
  ClientDataModule.CustomerTreeDataSet.CheckBrowseMode;
  PackBriefcaseDialog;
end;


procedure TMainForm.ViewStatusLogActionExecute(Sender: TObject);
begin
   with ClientDataModule.CustomerTreeDataSet do
   begin
     if StatusFilter = [] then
       StatusFilter := [usModified, usInserted, usDeleted]
     else
       StatusFilter := [];
   end;
end;

procedure TMainForm.ViewStatusLogActionUpdate(Sender: TObject);
begin
   with ClientDataModule.CustomerTreeDataSet do
     ViewStatusLogAction.Checked := StatusFilter <> [];

end;

end.
 