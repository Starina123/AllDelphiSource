
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{       Dataset Designer Add Fields Dialog              }
{                                                       }
{       Copyright (c) 1997,99 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit DSAdd;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, StdCtrls, Buttons;

type
  TAddFields = class(TForm)
    OkBtn: TButton;
    CancelBtn: TButton;
    GroupBox1: TGroupBox;
    FieldsList: TListBox;
    HelpBtn: TButton;
    procedure FormCreate(Sender: TObject);
    procedure HelpBtnClick(Sender: TObject);
  public
    procedure SelectAll;
  end;

var
  AddFields: TAddFields;

implementation

{$R *.DFM}

uses LibHelp;

procedure TAddFields.SelectAll;
var
  I: Integer;
begin
  with FieldsList do
    for I := 0 to Items.Count - 1 do
      Selected[I] := True;
end;

procedure TAddFields.FormCreate(Sender: TObject);
begin
  HelpContext := hcDDataSetAdd;
end;

procedure TAddFields.HelpBtnClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

end.
