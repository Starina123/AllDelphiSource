unit IconAddU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ToolWin, ComCtrls, ActnList, toolsapi;

procedure Register;

implementation
uses DisplayU;

{This Procedure fire off a small modal dialog that allows the user to load a
 bitmap and view the names of the IDE's Actions.}
Procedure DisplayChoices(Var IconFileName, ActionName: string; IDE: INTAServices);
var
  i: integer;
  Alist: TCustomActionList;
begin
  DisplayForm := TDisplayForm.Create(nil);
  try
    Alist := IDE.GetActionList;
    for i := 0 to Alist.ActionCount -1 do
    begin
      DisplayForm.ComboBox1.items.add(TAction(Alist.Actions[i]).name);
    end;

    DisplayForm.Showmodal;
    IconFileName := DisplayForm.OpenPictureDialog1.filename;
    ActionName := DisplayForm.ComboBox1.text;
  finally
    DisplayForm.free;
  end;
end;


{This function just adds a given bitmap to the IDE's imagelist.  There are no
safety features to make sure the image will work.  We it only checks to see if
it worked.
  Return value is the new index of the image.
}
function AddIconToImageList(IconFileName: string; IDE: INTAServices): integer;
var
  Image: TBitmap;
begin
  Image := TBitmap.Create;
  try
    Image.LoadFromFile(IconFileName);
    Result := IDE.AddMasked(Image, Image.TransparentColor, 'New image');
  finally
    Image.free;
  end;
  if Result = -1 then
    Exception.Create('Error loading image for ToolButton in a custom package');
end;

{This procedure runs through the IDE's action list looking to match up two
 action names.  Once found, it assigns the action a new image index.}
Procedure SetImageToAction(ActionNAme: String; Index: integer; IDE: INTAServices);
var
  Alist: TCustomActionList;
  i: integer;
begin
  Alist := IDE.GetActionList;
      for i := 0 to Alist.ActionCount -1 do
    begin
      if ActionName = TAction(Alist.Actions[i]).name then   //Can use caption too
      begin
        if (Alist.actions[i]) is TAction then
          (Alist.actions[i] as Taction).Imageindex := Index;
        break
      end;
    end;
end;


{Opentools API packages use the register procedure to execute the code when
the IDE is each time loaded. }
procedure Register;
var
  IDE: INTAServices;
  IconFileName: string;
  ActionName: string;
  Index: integer;
begin
  //All function use IDE interface, so grab it just once
  IDE := (BorlandIDEServices as INTAServices);

  {This function should just be used to decide the icon names and action names
   once.  Otherwise you'll have a dialog pop everything you load Delphi.  It is
   left as an excerise to the user to store and load these names as needed}
  DisplayChoices(IconFileName, ActionName, IDE);


  if ( (ActionName <> '') and (IconFileName <> '') ) then //make sure of some input
  begin
    index := AddIconToImageList(IconFileName, IDE);
    SetImageToAction(ActionName, Index, IDE);
  end;
end;


end.

