unit ClientMain;

{ RDS Client Demo -

  Open and Run RDSServer.DPR before running this project.
  You can switch between using the supplied AppServer and
  the default RDS DataFactory by selecting from the Combobox.
  When using the DataFactory the ConnectionString on the dataset is
  used by the DataFactory.Query method.

  If you have not used the DataFactory before you will need to
  edit the MSDFMAP.INI file in your Windows directory:
  In the [connect default] section change the Access to ReadWrite.
  In the [sql default] section, comment out the SQL=" " line.

}

interface


uses
  Windows, Forms, StdCtrls, ExtCtrls, Classes, Controls, Grids, DB, ADODB,
  DBGrids;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    Employee: TADODataSet;
    DataSource1: TDataSource;
    RDSConnection1: TRDSConnection;
    Panel1: TPanel;
    ServerNameCombo: TComboBox;
    OpenButton: TButton;
    procedure OpenButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.OpenButtonClick(Sender: TObject);
begin
  RDSConnection1.Close;
  RDSConnection1.ServerName := ServerNameCombo.Text;
  Employee.Close;
  Employee.Open;
end;

end.
