unit CustListFormU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids;

type
  TCustListForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DBGrid2: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    FSaveSync: Boolean;
    function GetCustNo: Integer;
    { Private declarations }
  public
    { Public declarations }
    property CustNo: Integer read GetCustNo;
  end;

implementation

uses ClientDataModuleU;

{$R *.DFM}

{ TForm1 }


function TCustListForm.GetCustNo: Integer;
begin
  Result := ClientDataModule.CustomerListDataSet.FieldByName('CustNo').AsInteger;
end;

procedure TCustListForm.FormShow(Sender: TObject);
begin
  FSaveSync := ClientDataModule.SyncToCustomerNumber;
  ClientDataModule.SyncToCustomerNumber := False;
end;

procedure TCustListForm.FormHide(Sender: TObject);
begin
  ClientDataModule.SyncToCustomerNumber := FSaveSync;

end;

end.
