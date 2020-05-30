InternetExpress Center Demo

This sample application demonstrates a web site containing
InternetExpress information and examples.

The following projects are part of this example:

1) InetXCenterCGI.Exe, INetXCenterISAPI
These are two versions of the same application.  See
INetXCenterModule for additional comments.  

2) rdmINetXCenter.exe
This remote data module provides data uses by INetXCenterCGI and
INetXCenterISAPI.

3) InetXCenterComponents.bpl
This component package contains a custom page producer and
a custom client dataset.  See InetXCenterProd.pas and
readfileclientdataset.pas for additional comments.  You will
need to build and install this package before opening a designer
on INetXCenterModule.pas.

4) ComponentsInfoEditor.exe
This Windows application is used to edit the contents of a
local ClientDataSet file.  See ComponentsInfoEditUnit1.pas for
additional comments.

5) DclINetXCustom.bpl, INetXCustom.bpl
These are the design and runtime packages of InternetExpress custom
components.  You will need to build these packages and
install DclINetXCustom.bpl before opening a designer
on INetXCenterModule.pas.  These packages are located in
the InetXCustom subdirectory.


Setup

  1) You'll need a webserver and a virtual directory to put
  the executable (INetxCenterISAPI.DLL or INetXCenterCGI.EXE) and
  the web midas java script. The virtual directory will need to allow
  execute and script access.

  2) Copy source\webmidas\*.js to the virtual directory.  Modify
  the project options of InetXCenter*.dpr so that the output directory
  is the virtual directory.  Build InetXCenter*.dpr.
  
  3) Copy *.htm, *.cgi, *.jpg from InetXCustom and INetXCenter to the virtual directory.
  Image components
  
  If you would like the .gif and .jpg files to display properly at
  design time, add the following registry string:

  HKEY_CURRENT_USER\Software\Borland\
  delphi\5.0\Property Editors\WebPage Editor\BlankPage = 'c:\inetpub\wwwroot\blank.htm'

  Substitute c:\inetpub\wwwroot with the directory where the .gif and .jpg
  files are located.
  You will also need to create a file called blank.htm in this directory.  This
  file should be empty.  

  The file specified by this registry key will be used to initialize the
  WebBrowser control embedded within the TMidasPageProducer property editor. 

  You may also specify a URL instead of a file path.  For example,
  BlankPage = http://localhost/blank.htm.   
 
  4) Copy the clientdataset file containing components information
  (componentsinfo.cds) to the virtual directory.  Alternatively,
  you can change the filename property of InetxCenterModule.ComponentsInfoDS
  and ComponentsInfoEditorUnit1.ClientDataSet1 to a fully
  qualified filename.

  5) Build and run (to register) the remote data module rdmInetXCenter.exe.

  6) Use DCOM config to allow the remote data module to be launched
  by the web server.  The coclass name is INetXCenterData.
  For IIS this means giving the IUSER_ guest
  account launch rights.  See the DCOM config security page.  You may
  also want to change the Identify to interactive user so that
  you can shut down the remote data module using the task manager.

  7) Compile InetxCenterISAPI.dll and InetxCenterCGI.exe.  Copy these
  files to the virtual directory.  Or, instead of copying and 
  before you compile, set the Project/Options/Directories/Output Directory 
  to the location of your virtual directory.  

  8) Access the web module by entering the name of your virtual
  directory URL followed by the name of the executable.

  For example: http://localhost/webpub/demo/InetXCenterISAPI.dll,
  or http://localhost/webpub/demo/InetxCenterCGI.exe.

Troubleshooting

  If you have trouble getting the pages to display, verify that
  the java script files are available and that DCOM security is
  set up correctly. 
  
  Note that Navigator often has better error reporting than IE.  
  Try Navigator if IE isn't providing a usefull message.
  
  You can also use the scripttest.html file in the troubleshoot
  sample directory to verify that the InternetExpress 
  JavaScript include files are available from your web server.

Shutting down the virtual directory

  If InetXCenterISAPI.dll has been loaded
  by the web server you will need to shut down the virtual directory
  before replacing InetXCenterISAPI.dll.  If you are using IIS then
  Internet Service Manager can be used to shutdown the virtual directory
  (Note that Internet Service Manager is not installed by default when
  you install PWS on NT 4.0.  You will need to check this option during
  installation).  To shutdown a virtual directory, open Internet
  Service Manager, right click on the virtual directory, and choose
  "Properties...".  Click the Unload button located on the Virtual Directory
  tab.
 


