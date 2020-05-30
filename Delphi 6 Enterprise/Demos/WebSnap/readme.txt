
WebSnap Demos
Readme

Setting up your development system
==================================

If you will be writing some server-side JavaScript you'll want to install 
an Active Scripting debugger. Download the Microsoft Script Debugger from 
msdn.microsoft.com/scripting

If you will be using XSL then you should get the latest version of msxml3.  
Download msmxl3.exe and xmlinst.exe from msdn.microsoft.com.

Be sure that you have the JavaScript Active
scripting engine installed.  Look for jscript.dll in your system directory.

The scripting engine and JScript documentation can be downloaded from msdn.microsoft.com/scripting

makefile
========

Use the makefile to build all demo projects and packages.  Run MAKE.EXE from the demos\websnap directory.
To build with debug information, specify a -DDEBUG command line parameter when running MAKE.EXE.

regall.bat
==========

Once you've built all projects, use regall.bat to register all of the examples that work with the 
Web App Debugger.  

Web applications that work with the Web App Debugger are called Web App Debugger executables.
Because they are out-of-process COM servers, they need to be registered before the Web App Debugger 
can call them.  

Running Samples with the Web App Debugger
=========================================

Start bin\webappdbg.exe or use the Tools/Web App Debugger command.  Click the Start button if necessary.
Click on the default URL link displayed in the Web App Debugger window.  You should see a list of all registered
Web App Debugger executables.  Select an application and click the Go button.  

Running Samples under IIS
=========================

As a quick way to get WebSnap demos running under IIS, create a virtual directory named websnapdemos
that references the demos\websnap directory.   Enable execute access and directory browsing.  Use your
browser to traverse the webnap demo directories.  Double click on ISAPI dll's to run the ISAPI demo apps.

WebSnapDemos.html
=================

Open this file in a browser to view brief descriptions of the demos and run them by clicking
a hyperlink.

Setting up the IDE
==================

Right click on a toolbar to get the list of toolbars.  Check Internet.  Use this toolbar to create
new WebSnap modules and projects.   

Sample Design packages
======================

Some of the sample applications use sample design time packages.  The readme's associated with each project
identify the sample design packages that are used, if any. If a project uses a sample design package, you'll want
to install the package before opening the project.

If you attempt to open a module that contains components from a design package that has not been installed,
an error message box will be displayed.  Choose Cancel in response to the error message box,
close the module, install the package containing the missing component, and reopen the module.

All of the sample design packages are identified by the "dcl" prefix.  This stands for Delphi Component Library.

Here is a list of projects that use sample design packages.  By default, package .bpl files are 
built into projects\bpl.  Before opening ActionFieldTest\ActionFieldTest.dpr, for example, you'll need to install
Projects\bpl\dclactionfield.bpl. 

    Projects			  Packages
    --------                      --------
ActionFieldTest\*.dpr       ActionField\DclActionField.dpk        
   
ImgBtnCountryEditor\*.dpr   ImgBtnProducer\DclImgBtnProducer.dpk

ScriptObjectTest\*.dpr      ScriptObject\DclSampleScriptObjects.dpk   

XMLBiolife\*.dpr            XMLBuilder\DclXMLBuilder.dpk 
 

AllDemos.bpg
============

AllDemos.bpg is a project group that contains all sample packages and projects.  Use AllDemos.bpg to compile 
projects, view readme's and install design packages.  

Using alldemos.bpg to compile all (or build all) projects is not recommended because a large amount of memory 
will be used to cache .dcu files.  Use demos\webnap\makefile to build all projects.  

You may see unexpected behavior when working with alldemos.bpg.  For example, you may see 
an incorrect page name when previewing a web page module.  For best results, open one project at a time.

Deployment
==========

In order to run WebSnap application on a machine that does not have Delphi installed, 
you'll need to register (using tregsvr.exe) webbrokerscript.tlb and stdvcl40.tlb 
on the deployment machine.  Register weblib.tlb if webappdbg.exe will be used on the deployment machine.

Trouble Shooting
================

Web App Debugger not working
  Is bin\weblib.tlb registered (with tregsvr.tlb)?
  Is bin\serverinfo.exe registered?  Run once to register.
  Is the Web App Debugger started?  Start it by clicking the Start button.
Web App Debugger executables not working
  Is the Web App Debugger running and started? 
  Is the executable registered?  Run once to register.  Verify registration by viewing the progid listed
    by serverinfo.exe
  Is webbrokerscript.tlb registered (If you participated in the D6 fieldtest, be sure that you have 
    the shipping version registered).
  Is the JavaScript engine installed on your computer.  Look for jscript.dll in winnt\system32.
ServerInfo.exe not working
  Is serverinfo.exe registered?  Run once to register.
  Has the browser been refreshed?.  Click reload or refresh.
XSL/XML Demos not working
  Is msxml3 installed?  Download msxml3 from msdn.microsoft.com.
ISAPI apps not working
  Is a virtual directory called websnapdemos defined?
  Does the directory have execute access?
DBExpress demos not working
  Have you modified the app to indicate the location of employee.gdb?  
Login not working in biolife, xmlbiolife, or photogallery
  Does the executable remain running between requests?  Sessions will not work otherwise.  The
    Web App Debugger executable demos must be started before browsing to the login pages.
Biolife/BDE Errors
  Have you set up a BDE share dir?  See biolife\readme.txt for more information.
ScriptObjectTest not working
  Did you register scriptobject\sample.tlb?
  
