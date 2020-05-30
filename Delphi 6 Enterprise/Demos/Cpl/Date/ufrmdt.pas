unit ufrmdt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Calendar, ExtCtrls, ComCtrls, Mask;

type
  TfrmDateTime = class(TForm)
    Panel: TPanel;
    btnCancel: TButton;
    btnOK: TButton;
    grpboxDate: TGroupBox;
    Calendar: TCalendar;
    cmboBoxMonth: TComboBox;
    udYear: TUpDown;
    edtYear: TEdit;
    procedure frmDateTimeCreate(Sender: TObject);
    procedure cmboBoxMonthChange(Sender: TObject);
    procedure edtYearChange(Sender: TObject);
    procedure edtYearKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmDateTime.frmDateTimeCreate(Sender: TObject);
var
  i: Integer;

begin
  for i := Low(LongMonthNames) to High(LongMonthNames) do
    cmboBoxMonth.Items.Add(LongMonthNames[i]);

  cmboBoxMonth.ItemIndex := Calendar.Month-1;
  udYear.Position := Calendar.Year;
end;

procedure TfrmDateTime.cmboBoxMonthChange(Sender: TObject);
begin
  Calendar.Month := (Sender as TComboBox).ItemIndex + 1;
end;

procedure TfrmDateTime.edtYearChange(Sender: TObject);
begin
  Calendar.Year := StrToInt((Sender as TEdit).Text);
end;

procedure TfrmDateTime.edtYearKeyPress(Sender: TObject; var Key: Char);
begin
  if (not (Key in ['0'..'9'])) and (Ord(Key) <> VK_BACK) then
  begin
    Key := #0;
    Beep;
  end;
end;

end.
