// Author: Hadi Hariri
// Date: 09 May 2001

unit WhoIsMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdWhois;

type
  TfmMain = class(TForm)
    edDomain: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    meResults: TMemo;
    btLookup: TSpeedButton;
    IdWhois: TIdWhois;
    procedure edDomainKeyPress(Sender: TObject; var Key: Char);
    procedure btLookupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

procedure TfmMain.edDomainKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    btLookup.OnClick(Self);
  end;
end;

procedure TfmMain.btLookupClick(Sender: TObject);
var
  ALine,
  AResult: string;
  iPos: Integer;

begin
  meResults.Clear;
  AResult := IdWhoIs.WhoIs(edDomain.Text);
  while Length(AResult) > 0 do begin
    iPos := Pos(#10, AResult);
    if iPos = 1 then begin
      Delete(AResult, 1, 1);
    end else begin
      ALine := Copy(AResult, 1, iPos - 1);
      meResults.Lines.Add(ALine);
      Delete(AResult, 1, Length(ALine));
    end;
  end;
end;

end.
