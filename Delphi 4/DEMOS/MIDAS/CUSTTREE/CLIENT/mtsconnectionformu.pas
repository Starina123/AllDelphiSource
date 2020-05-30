unit MtsConnectionFormU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ConnectionFormU, ActnList, StdCtrls, DBClient, MConnect;

type
  TMTSConnectionForm = class(TConnectionForm)
    Button3: TButton;
    MTSAction: TAction;
    RadioButton1: TRadioButton;
    MTSOptionsAction: TAction;
    OKAction: TAction;
    procedure MTSOptionsActionExecute(Sender: TObject);
    procedure OKActionExecute(Sender: TObject);
    procedure MTSActionUpdate(Sender: TObject);
    procedure MTSActionExecute(Sender: TObject);
  private
    { Private declarations }
    FEditCustomerRole: string;
  public
    { Public declarations }
    property EditCustomerRole: string read FEditCustomerRole;
  end;

var
  MTSConnectionForm: TMTSConnectionForm;

implementation

uses ClientDataModuleU, MTSOptionsFormU;

{$R *.DFM}

procedure TMtsConnectionForm.OKActionExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TMTSConnectionForm.MTSOptionsActionExecute(Sender: TObject);
begin
  if not Assigned(MTSOptionsForm) then
    MTSOptionsForm := TMTSOptionsForm.Create(Self);
  with MTSOptionsForm do
    if ShowModal = mrOk then
      Self.FEditCustomerRole := EditCustomerRole;

end;

procedure TMTSConnectionForm.MTSActionUpdate(Sender: TObject);
begin
  MTSAction.Checked := not Briefcase;

end;

procedure TMTSConnectionForm.MTSActionExecute(Sender: TObject);
begin
  Briefcase := False;
end;

initialization
finalization
  MtsConnectionForm.Free;

end.
