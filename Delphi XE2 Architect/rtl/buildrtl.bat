@echo off
setlocal

if "%1"=="" goto help
set ARG=%1

set TARGET=default
set CONFIG=debug
set VERBOSITY=normal
set CONLOGPARAMS=/clp:NoItemAndPropertyList;NoSummary;DisableMPLogging
set FRAMEWORKDIR=v3.5

if not EXIST %SystemRoot%\Microsoft.NET\Framework\%FRAMEWORKDIR%\MSBuild.exe goto nomsbuild
if not "%BDS%"=="" goto BdsSet
if "%ProgramFiles(x86)%"=="" set ProgramFiles(x86)=%ProgramFiles%
set BDS=%ProgramFiles(x86)%\Embarcadero\RAD Studio\9.0
if not exist "%BDS%\bin\bds.exe" goto SetBDS

:BdsSet
if "%ARG%"=="clean" set TARGET=clean
if "%ARG%"=="release" set CONFIG=release

set PLATFORM=Win32
set PROJECT=BuildWinRTL.dproj
call :DoBuild

set PLATFORM=Win64
set PROJECT=BuildWinRTL.dproj
call :DoBuild

set PLATFORM=OSX32
set PROJECT=BuildOsxRTL.dproj
call :DoBuild

goto end

:DoBuild
call %SYSTEMROOT%\Microsoft.Net\Framework\%FRAMEWORKDIR%\msbuild.exe /v:%VERBOSITY% /t:%TARGET% /p:Platform=%PLATFORM% /p:Config=%CONFIGURATION% %PROPERTIES% %CONLOGPARAMS% %LOGGER% %PROJECT%
echo.
if errorlevel 1 goto builderror
exit /b

:builderror
echo *** Build Failed ***
goto end

:SetBDS
echo Error: Cannot find the RadStudio (BDS) location.  You must set BDS=Location
goto end

:nomsbuild
echo Error: MsBuild %FRAMEWORKDIR% was not found on this system.  Ensure that you have the Version %FRAMEWORKDIR% .NET Framework installed (via Windows Update).
goto end

:help

echo.
echo           Batch file to build the RTL
echo ------------------------------------------------
echo.
echo Standard targets:
echo 	debug                Build debug configuration
echo 	release              Build release configuration
echo 	clean                Clean target
echo ------------------------------------------------

:end
endlocal