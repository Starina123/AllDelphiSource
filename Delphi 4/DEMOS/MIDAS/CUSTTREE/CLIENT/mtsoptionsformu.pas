unit MTSOptionsFormU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ActnList, StdCtrls, ComCtrls;

type
  TMTSOptionsForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ActionList1: TActionList;
    OK: TAction;
    AllUsersEditCustomer: TAction;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    EditCustomerFieldsCheckBox: TCheckBox;
    EditCustomerEdit: TEdit;
    procedure OKExecute(Sender: TObject);
    procedure EditCustomerEditChange(Sender: TObject);
    procedure AllUsersEditCustomerExecute(Sender: TObject);
  private
    function GetEditCustomerRole: string;
    { Private declarations }
  public
    { Public declarations }
    property EditCustomerRole: string read GetEditCustomerRole;
  end;

var
  MTSOptionsForm: TMTSOptionsForm;

implementation

uses ClientDataModuleU;

{$R *.DFM}

procedure TMTSOptionsForm.OKExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TMTSOptionsForm.EditCustomerEditChange(Sender: TObject);
begin
  AllUsersEditCustomer.Checked := EditCustomerEdit.Text = '';
end;

procedure TMTSOptionsForm.AllUsersEditCustomerExecute(Sender: TObject);
begin
  if EditCustomerEdit.Text <> '' then
    AllUsersEditCustomer.Checked := not AllUsersEditCustomer.Checked
  else
  begin
    // Ignore the command and do not check the check box.
    AllUsersEditCustomer.Checked := not AllUsersEditCustomer.Checked;
    AllUsersEditCustomer.Checked := not AllUsersEditCustomer.Checked;
  end;
end;

function TMTSOptionsForm.GetEditCustomerRole: string;
begin
  if AllUsersEditCustomer.Checked then
    Result := ''
  else
    Result := EditCustomerEdit.Text;
end;

initialization
finalization
  MTSOptionsForm.Free;
end.
