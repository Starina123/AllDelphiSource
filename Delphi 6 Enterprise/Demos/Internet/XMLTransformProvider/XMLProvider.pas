unit XMLProvider;

//----------------------------------------------------------------------------
//Borland Delphi
//Copyright (c) 2001 Borland International Inc. All Rights Reserved.
//----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, DB, DBClient, Provider, xmldom,
  Xmlxform;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    Label3: TLabel;
    XMLTransformProvider1: TXMLTransformProvider;
    Button3: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure XMLTransformProvider1DataTransformWriteTranslate(
      Sender: TObject; Id: String; SrcNode: IDOMNode; var Value: String;
      DestNode: IDOMNode);
    procedure XMLTransformProvider1DataTransformReadTranslate(
      Sender: TObject; Id: String; SrcNode: IDOMNode; var Value: String;
      DestNode: IDOMNode);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
   ClientDataSet1.Active:= false;
   ClientDataSet1.Active:= true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ClientDataSet1.ApplyUpdates(1);
end;

procedure TForm1.XMLTransformProvider1DataTransformWriteTranslate(
  Sender: TObject; Id: String; SrcNode: IDOMNode; var Value: String;
  DestNode: IDOMNode);
begin
   if Id = '#price' then
      if Value <> '' then
        if Value[1] = '$' then
           Value:= Copy(Value, 2, Length(Value)-1); //Remove '$'-sign again
end;

procedure TForm1.XMLTransformProvider1DataTransformReadTranslate(
  Sender: TObject; Id: String; SrcNode: IDOMNode; var Value: String;
  DestNode: IDOMNode);
begin
  if Id = '#price' then
     if Value <> '' then
       Value:= '$'+Value; //Add '$'-sign to 'price'-field.
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ClientDataSet1.SaveToFile(Edit1.Text, dfXML);
end;

end.
