unit main;

//----------------------------------------------------------------------------
//Borland Delphi
//Copyright (c) 2001 Borland International Inc. All Rights Reserved.
//----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, xmldom, Xmlxform, Grids, DBGrids, StdCtrls, ExtCtrls, DB,
  DBClient;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    XMLTransform1: TXMLTransform;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
  XMLTransform1.SourceXMLFile := 'country_dp.xml';
  Memo1.Text := XMLTransform1.Data;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  (XMLTransform1.ResultDocument  as IDOMPersist).save(Edit1.Text);
end;

end.
