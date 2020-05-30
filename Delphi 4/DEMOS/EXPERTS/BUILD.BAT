REM Build the demo Application and Dialog Expert
REM To use this batch file you must have the Delphi Bin directory on your path.
@echo off

REM Build strings.res
brcc32 strings.rc
if errorlevel 1 goto Fail

REM Build the DLL
dcc32 exptdemo
if errorlevel 1 goto Fail
dcc32 projexpl
if errorlevel 1 goto Fail

goto Exit

:Fail
echo Build failed.

:Exit
