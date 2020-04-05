unit DUnitTestRunner;

interface

uses
  SysUtils,
  TextTestRunner,
  {$IFDEF CLR}
    {$IF RTLVersion <= 20.00} // RS 2009 or earlier
    NGuiTestRunner,
    {$IFEND}
  {$ENDIF}
  {$IFDEF MSWINDOWS}
  Forms,
  GuiTestRunner,
  {$ENDIF}
  TestFramework;

procedure RunRegisteredTests;

implementation

procedure RunRegisteredTests;
begin
  {$IFDEF MSWINDOWS}
  Application.Initialize;
  {$ENDIF}
  if IsConsole then
  begin
    with TextTestRunner.RunRegisteredTests do
      Free;
  end
  else
  begin
    {$IFDEF CLR}
      {$IF RTLVersion <= 20.00} // RS 2009 or earlier
        NGuiTestRunner.RunRegisteredTests;
      {$ELSE}
        Assert(False, 'DotNet unit test not supported');
      {$IFEND}
    {$ENDIF}
    {$IFDEF MSWINDOWS}
    GuiTestRunner.RunRegisteredTests;
    {$ENDIF}
  end;
end;

end.
