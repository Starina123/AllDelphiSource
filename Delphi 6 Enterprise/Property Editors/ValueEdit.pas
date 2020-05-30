{*******************************************************}
{                                                       }
{       Delphi Visual Component Library                 }
{       Value Editor Dialog                             }
{                                                       }
{       Copyright (c) 1999-2001 Borland Software Corp.  }
{                                                       }
{*******************************************************}

unit ValueEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StrEdit, Menus, StdCtrls, ExtCtrls, Grids, ValEdit;

type
  TValueEditDlg = class(TStrEditDlg)
    ValueListEditor1: TValueListEditor;
    procedure ValueListEditor1StringsChange(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetLines: TStrings; override;
    procedure SetLines(const Value: TStrings); override;
    function GetLinesControl: TWinControl; override;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

function TValueEditDlg.GetLinesControl: TWinControl;
begin
  Result := ValueListEditor1;
end;

function TValueEditDlg.GetLines: TStrings;
begin
  Result := ValueListEditor1.Strings;
end;

procedure TValueEditDlg.SetLines(const Value: TStrings);
begin
  ValueListEditor1.Strings := Value;
end;

procedure TValueEditDlg.ValueListEditor1StringsChange(Sender: TObject);
begin
  inherited;
  if Sender = ValueListEditor1 then FModified := True;
end;

end.
