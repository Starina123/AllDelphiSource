
ECHO OFF

REM ScriptName: configure.bat
REM
REM Objective:
REM	     Crate a apache.conf file that contains the directives that need 
REM	     to be added to httpd.conf. This is based upon the current location
REM	     of the CGIs directory, so it is essential that this script and the 
REM 	     CGIs directory is in the needed location prior to running the script.
REM
REM ------------------------------------------------------------------------------



SET DEMO_ROOT=%CD%
SET CONF_FILE=apache.conf


echo Alias /demo_html %DEMO_ROOT%\demo_html >%CONF_FILE%
echo ScriptAlias /demo_bin %DEMO_ROOT%\demo_bin >>%CONF_FILE%

echo file apache.conf created
