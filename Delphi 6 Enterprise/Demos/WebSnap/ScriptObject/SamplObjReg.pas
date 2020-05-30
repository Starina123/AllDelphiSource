unit SamplObjReg;

interface

uses Classes;

  procedure Register;

implementation

uses SimpleScriptObj, ExtendedAdapterObj;

const
  sPalettePage = 'WebSnap Demos';

{ Register procedure }

procedure Register;
begin
  RegisterComponents(sPalettePage, [TSimpleScriptObject, TExtendedAdapter, TExtendedDataSetAdapter]);
  RegisterNonActiveX([TSimpleScriptObject], axrIncludeDescendants);

end;

end.
