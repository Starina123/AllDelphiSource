unit udemutil;

interface

Uses Classes,Graphics,Dialogs;

Function EditColor(AOwner:TComponent; AColor:TColor):TColor;

implementation

Function EditColor(AOwner:TComponent; AColor:TColor):TColor;
Begin
  With TColorDialog.Create(AOwner) do
  try
    Color:=AColor;
    if Execute then AColor:=Color;
  finally
    Free;
  end;
  result:=AColor;
end;

end.
 