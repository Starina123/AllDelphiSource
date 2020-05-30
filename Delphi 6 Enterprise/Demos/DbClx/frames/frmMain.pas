unit frmMain;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QExtCtrls, FrmMD, frmData;

type
  TForm1 = class(TForm)
    SimpleFrame: TDataFrame;
    Splitter1: TSplitter;
    MDFrame: TMasterDetailFrame;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.xfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  with SimpleFrame, ClientDataset1 do begin
    FileName := 'biolife.cds';
    with FancyFrame1 do begin
      DBMemo1.DataSource := DataSource1;
      DBMemo1.DataField := 'Notes';
      DBImage1.DataSource := DataSource1;
      DBImage1.DataField := 'Graphic';
    end;
    ClientDataset1.Open;
  end;

  with MDFrame do begin
    with MasterFrame, ClientDataset1 do begin
      FancyFrame1.Free;
      FileName := 'customer.cds';
      Open;
    end;
    with DetailFrame, ClientDataset1 do begin
      FancyFrame1.Free;
      MasterSource := MasterFrame.DataSource1;
      MasterFields := 'CustNo';
      IndexFieldNames := 'CustNo';
      FileName := 'orders.cds';
      Open;
    end;
  end;
end;

end.
