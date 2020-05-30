unit XMLClient;

//----------------------------------------------------------------------------
//Borland Delphi
//Copyright (c) 2001 Borland International Inc. All Rights Reserved.
//----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Provider, DB, DBTables, Xmlxform, StdCtrls, ExtCtrls,
  Grids, DBGrids, MSXMLDOM, XMLDOM, xmlutil;

type
  TformMain = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Memo2: TMemo;
    Button1: TButton;
    Memo3: TMemo;
    Button2: TButton;
    XMLTransformClient1: TXMLTransformClient;
    Table1: TTable;
    DataSetProvider1: TDataSetProvider;
    Button3: TButton;
    Edit1: TEdit;
    Button4: TButton;
    Button5: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMain: TformMain;

implementation

uses readme;

{$R *.DFM}

procedure TformMain.Button1Click(Sender: TObject);
begin
  Table1.Active := True;
  
  Memo2.Lines.Text := XMLTransformClient1.GetDataAsXml('');
end;


procedure SaveFile(const FileName:string; const text:string);
var
  S: TFileStream;
begin
   S:= TFileStream.Create(FileName, fmCreate);
   S.Write(PChar(text)^, Length(text));
   S.Free;
end;


procedure TformMain.Button3Click(Sender: TObject);
begin
   (XMLTransformClient1.TransformGetData.ResultDocument  as IDOMPersist).save(Edit1.Text);
end;

procedure TformMain.Button2Click(Sender: TObject);
begin
   XMLTransformClient1.ApplyUpdates(Memo3.Lines.Text, 'country_ins.xtr', 0);
   Table1.Active:= false; Table1.Active:= true;

end;

procedure TformMain.Button4Click(Sender: TObject);
begin
  XMLTransformClient1.ApplyUpdates(Memo3.Lines.Text, 'country_del.xtr', 0);
  Table1.Active:= false; Table1.Active:= true;
end;

procedure TformMain.Button5Click(Sender: TObject);
begin
   FormReadMe.Visible:= true;
end;

end.
