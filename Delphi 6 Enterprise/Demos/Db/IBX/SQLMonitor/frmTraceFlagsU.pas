unit frmTraceFlagsU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBDatabase, StdCtrls, Buttons, IB;

type
  TfrmTraceFlags = class(TForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetTraceFlags : TTraceFlags;
    procedure SetTraceFlags(flags : TTraceFlags);
  end;

var
  frmTraceFlags: TfrmTraceFlags;

implementation

{$R *.dfm}

{ TfrmTraceFlags }

function TfrmTraceFlags.GetTraceFlags : TTraceFlags;
begin
  if CheckBox1.Checked then
    Include(Result, tfQPrepare);
  if CheckBox2.Checked then
    Include(Result, tfQExecute);
  if CheckBox3.Checked then
    Include(Result, tfQFetch);
  if CheckBox4.Checked then
    Include(Result, tfError);
  if CheckBox5.Checked then
    Include(Result, tfStmt);
  if CheckBox6.Checked then
    Include(Result, tfConnect);
  if CheckBox7.Checked then
    Include(Result, tfTransact);
  if CheckBox8.Checked then
    Include(Result, tfBlob);
  if CheckBox9.Checked then
    Include(Result, tfService);
  if CheckBox10.Checked then
    Include(Result, tfMisc);
end;

procedure TfrmTraceFlags.SetTraceFlags(flags: TTraceFlags);
begin
  CheckBox1.Checked := tfQPrepare in flags;
  CheckBox2.Checked := tfQExecute in flags;
  CheckBox3.Checked := tfQFetch in flags;
  CheckBox4.Checked := tfError in flags;
  CheckBox5.Checked := tfStmt in flags;
  CheckBox6.Checked := tfConnect in flags;
  CheckBox7.Checked := tfTransact in flags;
  CheckBox8.Checked := tfBlob in flags;
  CheckBox9.Checked := tfService in flags;
  CheckBox10.Checked := tfMisc in flags;
end;

end.
