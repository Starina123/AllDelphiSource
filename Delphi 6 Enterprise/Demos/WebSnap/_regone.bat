echo off
: This batch file registers a Web App Debugger executable
: Parameters
:  %1 - File name of the executable
:  %2 - Pass "unregserver" to unregister

if /%1 == / goto filenameexpected
if /%2 == / goto doregserver
  if not %2 = unregserver goto unregserverexpected
    echo Unregistering %1
    %1 /unregserver
    goto done
:doregserver
echo Registering %1
%1 /regserver
goto done


:unregserverexpected
echo Error:  Expected value for parameter 2 is unregserver
goto done

:filenameexpected
echo Error:  Expected a filename as parameter 1
goto done
:done

