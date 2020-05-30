unit Filters;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;

type
  TFilterDlg = class(TForm)
    Label1: TLabel;
    Description: TEdit;
    Label2: TLabel;
    Extension: TEdit;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
    procedure SetFilter(const Value: string);
    function GetFilter: string;
  public
    { Public declarations }
    property Filter: string read GetFilter write SetFilter;
  end;

implementation

{$R *.DFM}

procedure TFilterDlg.SetFilter(const Value: string);
var
  P: Integer;
begin
  Description.Text := '';
  Extension.Text := '';
  if Value > '' then
  begin
    P := AnsiPos('|', Value);
    if P = 0 then P := 256;
    Description.Text := Copy(Value, 1, P - 1);
    Extension.Text := Copy(Value, P + 1, 255);
  end;
end;

function TFilterDlg.GetFilter: string;
begin
  Result := Description.Text + '|' + Extension.Text;
end;

end.
