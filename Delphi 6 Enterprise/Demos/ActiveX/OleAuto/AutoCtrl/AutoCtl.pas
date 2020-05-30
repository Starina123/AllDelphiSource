unit AutoCtl;

{ This program demonstrates Delphi's automation control abilities by
  inserting a query into a document, using Microsoft Word as an automation
  server }

interface

uses Windows, Classes, SysUtils, Graphics, Forms, Controls, DB, DBGrids,
  DBTables, Grids, StdCtrls, ExtCtrls, ComCtrls, Dialogs;

type
  TForm1 = class(TForm)
    Query1: TQuery;
    Panel1: TPanel;
    InsertBtn: TButton;
    Query1Company: TStringField;
    Query1OrderNo: TFloatField;
    Query1SaleDate: TDateTimeField;
    Edit1: TEdit;
    Label1: TLabel;
    procedure InsertBtnClick(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

uses ComObj;

{$R *.dfm}

procedure TForm1.InsertBtnClick(Sender: TObject);
var
  S, Lang: string;
  MSWord: Variant;
  L: Integer;
begin
  try
    MsWord := CreateOleObject('Word.Basic');
  except
    ShowMessage('Could not start Microsoft Word.');
    Exit;
  end;
  try
    { Return Application Info. This call is the same for English and
     French Microsoft Word. }
    Lang := MsWord.AppInfo(Integer(16));
  except
    try
      { for German Microsoft Word the procedure name is translated }
      Lang := MsWord.AnwInfo(Integer(16));
    except
      { if this procedure does not exist there is a different translation of
       Microsoft Word }
       ShowMessage('Microsoft Word version is not German, French or English.');
       Exit;
    end;
  end;
  with Query1 do
  begin
    Form1.Caption := Lang;
    Close;
    Params[0].Text := Edit1.Text;
    Open;
    try
      First;
      L := 0;
      while not EOF do
      begin
        S := S + Query1Company.AsString + ListSeparator +
          Query1OrderNo.AsString + ListSeparator + Query1SaleDate.AsString + #13;
        Inc(L);
        Next;
      end;
      if (Lang = 'English (US)') or (Lang = 'English (United States)') or
         (Lang = 'English (UK)') or (Lang = 'German (Standard)') or
         (Lang = 'French (Standard') then
      begin
        MsWord.AppShow;
        MSWord.FileNew;
        MSWord.Insert(S);
        MSWord.LineUp(L, 1);
        MSWord.TextToTable(ConvertFrom := 2, NumColumns := 3);
      end;
      if Lang = 'Français' then
      begin
        MsWord.FenAppAfficher;
        MsWord.FichierNouveau;
        MSWord.Insertion(S);
        MSWord.LigneVersHaut(L, 1);
        MSWord.TexteEnTableau(ConvertirDe := 2, NbColonnesTableau := 3);
      end;
      if (Lang = 'German (De)') or (Lang = 'Deutsch') then
      begin
        MsWord.AnwAnzeigen;
        MSWord.DateiNeu;
        MSWord.Einfügen(S);
        MSWord.ZeileOben(L, 1);
        MSWord.TextInTabelle(UmWandelnVon := 2, AnzSpalten := 3);
      end;
    finally
      Close;
    end;
  end;
end;

end.
