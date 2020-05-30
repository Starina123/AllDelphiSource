{*********************************************}
{ TeeChart Delphi Component Library           }
{ Main Form Demo                              }
{ Copyright (c) 1995-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
unit udemocha;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Buttons, StdCtrls, ExtCtrls;

type
  TSeriesForm = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    GroupBox3: TGroupBox;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BStacked: TBitBtn;
    BFastLine: TBitBtn;
    BitBtn14: TBitBtn;
    BArrowSeries: TBitBtn;
    BitBtn1: TBitBtn;
    BStackedAreas: TBitBtn;
    BitBtn21: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BStackedClick(Sender: TObject);
    procedure BFastLineClick(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BArrowSeriesClick(Sender: TObject);
    procedure BStackedAreasClick(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure ShowForm(AFormClass:TFormClass);
  end;

implementation

{$R *.dfm}
Uses Pie,Bubble,Gantt,Basic,UStack,UFast,
     UArrows,StackAre,UHighLo
     {$IFNDEF NODB}
     ,TablePie,SQLBars,Linked,UDBHoriz
     {$ENDIF}
     ;

Procedure TSeriesForm.ShowForm(AFormClass:TFormClass);
Begin
  With AFormClass.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
End;

procedure TSeriesForm.BitBtn4Click(Sender: TObject);
begin
  ShowForm(TBasicForm);
end;

procedure TSeriesForm.BitBtn5Click(Sender: TObject);
begin
  ShowForm(TPieForm);
end;

procedure TSeriesForm.BitBtn6Click(Sender: TObject);
begin
  ShowForm(TBubbleForm);
end;

procedure TSeriesForm.BitBtn7Click(Sender: TObject);
begin
  ShowForm(TGanttForm);
end;

Procedure ShowNeedsBDE;
Begin
  ShowMessage('Needs the Borland Database Engine.'+#13+#10+
              'Please email to get the full TeeChart DEMO.');
end;

procedure TSeriesForm.BitBtn9Click(Sender: TObject);
begin
  {$IFNDEF NODB}
  ShowForm(TTablePieForm);
  {$ELSE}
  ShowNeedsBDE;
  {$ENDIF}
end;

procedure TSeriesForm.BitBtn10Click(Sender: TObject);
begin
  {$IFNDEF NODB}
  ShowForm(TSQLBarsForm);
  {$ELSE}
  ShowNeedsBDE;
  {$ENDIF}
end;

procedure TSeriesForm.BitBtn11Click(Sender: TObject);
begin
  {$IFNDEF NODB}
  ShowForm(TLinkedTablesForm);
  {$ELSE}
   ShowNeedsBDE;
  {$ENDIF}
end;

procedure TSeriesForm.FormCreate(Sender: TObject);
begin
  if Screen.Width<800 then
     ShowMessage('Warning: '+#13+#10+
                 'This Demo is best viewed with a Screen'+#13+#10+
                 'resolution of 800x600 or greater,'+#13+#10+
                 'and a Color Depth of 256 or greater.'+#13+#10+
                 '16K Colors is also better than 256 Colors.');
end;

procedure TSeriesForm.BStackedClick(Sender: TObject);
begin
  ShowForm(TStackedForm);
end;

procedure TSeriesForm.BFastLineClick(Sender: TObject);
begin
  ShowForm(TFastLineForm);
end;

procedure TSeriesForm.BitBtn14Click(Sender: TObject);
begin
  {$IFNDEF NODB}
  ShowForm(TDBHorizBarForm);
  {$ELSE}
  ShowNeedsBDE;
  {$ENDIF}
end;

procedure TSeriesForm.BArrowSeriesClick(Sender: TObject);
begin
  ShowForm(TArrowsForm);
end;

procedure TSeriesForm.BStackedAreasClick(Sender: TObject);
begin
  ShowForm(TAreasForm);
end;

procedure TSeriesForm.BitBtn21Click(Sender: TObject);
begin
  ShowForm(THighLowForm);
end;

end.
