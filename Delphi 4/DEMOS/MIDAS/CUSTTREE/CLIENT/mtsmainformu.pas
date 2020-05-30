unit MtsMainFormU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MainFormU, Menus, StdActns, ActnList, Db, DBClient, StdCtrls, DBCtrls,
  ExtCtrls, MConnect, ImgList;

type
  TMTSMainForm = class(TMainForm)
    DCOMConnection: TDCOMConnection;
  private
    { Private declarations }
  public
    { Public declarations }
    function ConnectDialog: Boolean; override;
    procedure Connect(AEmpNo: Integer); override;
  end;

var
  MTSMainForm: TMTSMainForm;

implementation

uses MTSConnectionFormU, ClientDataModuleU, MtsCustomerTreeProject_tlb;

{$R *.DFM}

procedure TMTSMainForm.Connect(AEmpNo: Integer);
begin
  DCOMConnection.Connected := True;
  // Use DispInterface so that the client does not need a registered
  // typelib--as is needed for a dual interface.
  ClientDataModule.AppServer := IDispatch(DCOMConnection.AppServer) as IMtsCustomerTreeDisp;
  ClientDataModule.EmpNo := AEmpNo;
end;

function TMTSMainForm.ConnectDialog: Boolean;
begin
  if MtsConnectionForm = nil then
    MtsConnectionForm := TMtsConnectionForm.Create(nil);
  with MtsConnectionForm do
  begin
    Result := ShowModal = mrOk;
    if Result then
    begin
      Screen.Cursor := crHourGlass;
      try
        if Briefcase then
        begin
          ClientDataModule.Briefcase := True;
          ClientDataModule.EmpNo := StrToInt(EditEmpNo.Text);
        end
        else
        begin
          Connect(StrToInt(EditEmpNo.Text));
          ClientDataModule.SetMTSOptions(EditCustomerRole);
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

end.
