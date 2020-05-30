unit ConnectionFormU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ActnList, StdCtrls, ComCtrls, ClientDataModuleU;

type
  TConnectionForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ActionList1: TActionList;
    GroupBox1: TGroupBox;
    RadioButton3: TRadioButton;
    BriefCaseAction: TAction;
    Label1: TLabel;
    EditEmpNo: TEdit;
    procedure BriefcaseActionExecute(Sender: TObject);
    procedure BriefcaseActionUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  protected
    FBriefcase: Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    property Briefcase: Boolean read FBriefcase write FBriefcase;
  end;


implementation

uses Menus;

{$R *.DFM}


procedure TConnectionForm.BriefcaseActionExecute(Sender: TObject);
begin
  FBriefcase := not FBriefcase;
end;

procedure TConnectionForm.BriefcaseActionUpdate(Sender: TObject);
begin
  BriefcaseAction.Checked := Briefcase = True;
end;

procedure TConnectionForm.FormShow(Sender: TObject);
begin
  FBriefcase := ClientDataModule.Briefcase;
end;

end.
