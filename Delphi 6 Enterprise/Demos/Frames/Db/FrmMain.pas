unit FrmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, FrmData, FrmMD;

type
  TForm1 = class(TForm)
    MDFrame: TMasterDetailFrame;
    SimpleFrame: TDataFrame;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  with SimpleFrame, Table1 do begin
    TableName := 'Biolife';
    with FancyFrame1 do begin
      DBMemo1.DataSource := DataSource1;
      DBMemo1.DataField := 'Notes';
      DBImage1.DataSource := DataSource1;
      DBImage1.DataField := 'Graphic';
    end;
    Open;
  end;
  with MDFrame do begin
    with MasterFrame, Table1 do begin
      FancyFrame1.Free;
      TableName := 'Customer';
      Open;
    end;
    with DetailFrame, Table1 do begin
      FancyFrame1.Free;
      MasterSource := MasterFrame.DataSource1;
      MasterFields := 'CustNo';
      IndexName := 'CustNo';
      TableName := 'Orders';
      Open;
    end;
  end;
end;

end.
       