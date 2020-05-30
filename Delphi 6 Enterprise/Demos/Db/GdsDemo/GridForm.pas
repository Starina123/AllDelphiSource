unit GridForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DB, DBTables, ExtCtrls, StdCtrls, Buttons, GdsData;

type
  TGridViewForm = class(TStdDataForm)
    DBGrid1: TDBGrid;
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GridViewForm: TGridViewForm;

implementation

uses RecForm;

{$R *.dfm}

procedure TGridViewForm.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  RecViewForm.Show;
end;

end.
