unit UnitServerCustClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Provider, DB, DBTables, Xmlxform, StdCtrls, ExtCtrls,
  Grids, DBGrids, MSXMLDOM, XMLDOM, xmlutil, DBClient, MConnect;

type
  TFormServerCustClient = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Memo2: TMemo;
    ButtonPublishXml: TButton;
    Memo3: TMemo;
    ButtonPublishParams: TButton;
    XMLTransformClient1: TXMLTransformClient;
    ButtonSaveXml: TButton;
    EditSaveXml: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    XMLTransformClient2: TXMLTransformClient;
    DCOMConnection1: TDCOMConnection;
    ClientDataSet1: TClientDataSet;
    procedure ButtonPublishXmlClick(Sender: TObject);
    procedure ButtonSaveXmlClick(Sender: TObject);
    procedure ButtonPublishParamsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormServerCustClient: TFormServerCustClient;

implementation

{$R *.DFM}

procedure TFormServerCustClient.ButtonPublishXmlClick(Sender: TObject);
begin
  Memo2.Lines.Text := XMLTransformClient2.GetDataAsXml('');
end;


procedure SaveFile(const FileName:string; const text:string);
var
  S: TFileStream;
begin
  S:= TFileStream.Create(FileName, fmCreate);
  S.Write(PChar(text)^, Length(text));
  S.Free;
end;


procedure TFormServerCustClient.ButtonSaveXmlClick(Sender: TObject);
begin
  (XMLTransformClient1.TransformGetData.ResultDocument  as IDOMPersist).save(EditSaveXml.Text);
//   SaveFile(EditSaveXml.Text, Memo2.Text);
end;

procedure TFormServerCustClient.ButtonPublishParamsClick(Sender: TObject);
begin
  XMLTransformClient1.SetParams(Memo3.Text, '');
  Memo2.Lines.Text := XMLTransformClient1.GetDataAsXml('');
end;

end.
