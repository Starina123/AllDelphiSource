{  InternetExpress sample application.

   The InetXCenter sample application displays information
   about various InternetExpress components.  This information
   is stored in a local file created by TClientDataSet.

   This application is used to edit the information in the
   local file.

   ClientDataSet1.FileName is the file used to store the CDS.
   When ClientDataSet1 is activated at design time, you may
   not see the data seen at runtime because the application
   output directory may be different than the project directory.

}

unit ComponentsInfoEditorUnit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Grids, DBGrids, Db, DBClient;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    DBGrid1: TDBGrid;
    DBComboBox1: TDBComboBox;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    Button1: TButton;
    Button2: TButton;
    ClientDataSet1: TClientDataSet;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if ClientDataSet1.Modified then
    ClientDataSet1.Post;
  ClientDataSet1.SaveToFile(ClientDataSet1.FileName);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ClientDataSet1.Close;
  ClientDataSet1.LoadFromFile(ClientDataSet1.FileName);
end;

procedure TForm1.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  { Workaround bug in which memo text can't be created once
    a record is inserted. }
  DBMemo1.Text := ' ';
  DBMemo2.Text := ' ';
end;

{ The structure of a client data set can't be changed
without losing the data.  To change the structure, create
a new clientdataset and use code like this to copy data
from the old dataset to the new dataset.
}

{
procedure TForm1.Button5Click(Sender: TObject);

  procedure CopyValue(FieldName: string);
  begin
    ClientDataSet2.FieldByName(FieldName).Value :=
      ClientDataSet1.FieldByName(FieldName).Value;
  end;
begin
  ClientDataSet1.Active := true;
  ClientDataSet2.Active := true;
  while not ClientDataSet1.eof do
  begin
    ClientDataSet2.Insert;
    CopyValue('ClassName');
    CopyValue('Description');
    CopyValue('ShortDescription');
    CopyValue('Usage');
    ClientDataSet2.Post;
    ClientDataSet1.Next;
  end;
end;
}


end.
