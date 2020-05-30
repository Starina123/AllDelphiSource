WebSnap Demos
TestSvrInfo directory

This example web application provides the functionality of serverinfo.exe using server side
script and adapters. (Serverinfo.exe is the application that is used with the Web App
Debugger to display and start registered Web App Debugger executables).

This demo demonstrates a custom Adapter component as well as mixing server side and
client side JavaScript.

It also demonstrates how to store HTML template files as resources so that there is only
a single deployment file.

Build SvrInfoComponents.dpr
===========================

This package contains the TCustomSvrInfoAdapter component used by TestSvrInfo.dpr.

File/Open/SvrInfoComponents.dpk
Install

SvrInfoAdapter can be found on the "WebSnap Samples" component palette page.

Build TestSvrInfo.dpr
=====================

File/Open/TestSvrInfo.dpr
Compile
Run (Once to register)

Testing
=======

Start bin\WebAppDbg.exe
Browse the registered servers using ServerInfo
Click on TestSvrInfo.TestSvrInfo to invoke.

Reconfiguring the Web App Debugger
==================================

Start bin/WebAppDbg.exe

Server/Options
--------------
Default URL: TestSvrInfo.TestSvrInfo 
OK

Now you should be able to invoke TestSvrInfo.TestSvrInfo from the Web App Debugger window.


Trouble Shooting
================

Be sure that WebAppDbg.exe is running and started.
Be sure that the typelibaries (weblib.tlb and webbrokerscript.tlb) are registered
The JavaScript engine must be installed on your computer.  Look for jscript.dll in winnt\system32.
