unit AddNewTable;

interface

uses
  SysUtils, Types, Classes, Variants, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, DB, DBClient, QButtons, QComCtrls, QGrids, QDBGrids;

type
  TForm2 = class(TForm)
    ComboDataType: TComboBox;
    ClientDataSet1: TClientDataSet;
    EditFieldName: TEdit;
    EditFieldSize: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ButtonAddField: TButton;
    ButtonCreateTable: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    SaveDialog1: TSaveDialog;
    ButtonCancel: TButton;
    procedure ButtonAddFieldClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonCreateTableClick(Sender: TObject);
    procedure ComboDataTypeChange(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  FieldNum: Integer;

implementation

uses MyBaseExpMain;

{$R *.xfm}

procedure TForm2.ButtonAddFieldClick(Sender: TObject);
begin
  try
    FieldNum:=FieldNum+1;
    ClientDataSet1.Active:=False;
    with ClientDataSet1.FieldDefs.AddFieldDef do begin
      Name:=EditFieldName.Text;
      case ComboDataType.ItemIndex of
        0:begin
          DataType:=ftString;
          Size:=StrToInt(EditFieldSize.Text);
          end;
        1:DataType:=ftInteger;
      end;

    end;
    ClientDataSet1.CreateDataSet;
    EditFieldName.Text:='Field'+IntToStr(FieldNum);
    ComboDataType.ItemIndex:=0;
  finally
    ClientDataSet1.Active:=True;
  end;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  FieldNum:=1;
  EditFieldName.Text:='Field1';
  ClientDataSet1.Active:=False;
  ClientDataSet1.FieldDefs.Clear;
end;

procedure TForm2.ButtonCreateTableClick(Sender: TObject);
begin
  If SaveDialog1.Execute then
    begin
      Clientdataset1.SaveToFile(SaveDialog1.filename,dfxml);
      Form1.ClientDataSet1.Active:=false;
      Form1.ClientDataSet1.FileName:=SaveDialog1.FileName;
      Form1.ClientDataSet1.Active:=true;
      Form1.StatusBar1.Panels[0].Text:=SaveDialog1.FileName;
    end;
  Form2.Close;
  
end;

procedure TForm2.ComboDataTypeChange(Sender: TObject);
begin
  case ComboDataType.ItemIndex of
    0:EditFieldSize.Text:='15';
    1:EditFieldSize.Text:='0';
  end;
end;

procedure TForm2.ButtonCancelClick(Sender: TObject);
begin
  Form2.Close;
end;

end.
