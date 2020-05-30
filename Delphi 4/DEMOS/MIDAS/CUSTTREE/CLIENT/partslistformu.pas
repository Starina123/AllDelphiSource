unit PartsListFormU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids;

type
  TPartsListForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
  private
    function GetPartNo: Integer;
    { Private declarations }
  public
    { Public declarations }
    property PartNo: Integer read GetPartNo;
  end;

var
  PartsListForm: TPartsListForm;

implementation

uses ClientDataModuleU;

{$R *.DFM}

{ TForm1 }


function TPartsListForm.GetPartNo: Integer;
begin
  Result := ClientDataModule.PartsListDataSet.FieldByName('PartNo').AsInteger;
end;

procedure TPartsListForm.FormShow(Sender: TObject);
begin
  if not ClientDataModule.PartsListDataSet.Active then
  begin
    ClientDataModule.GetPartsList;
  end;
end;

end.
