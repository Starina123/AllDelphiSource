InternetExpress Demo

See the comments at the top of CustomerListWebModule.pas

Setup

  1) You'll need a webserver and a virtual directory to put
  the executable (CustomerList.exe) and the web midas java script.
  The virtual directory will need to allow execute and script
  access.

  2) Copy source\webmidas\*.js to the virtual directory.  Modify
  the project options of CustomerList.dpr so that the output directory
  is the virtual directory.  Build CustomerList.exe.

  3) Build and run (to register) the remote data module rdmCustomerData.exe.

  4) Use DCOM config to allow the remote data module to be launched
  by the web server.  The coclass name is CustomerData.
  For IIS this means giving the IUSER_ guest
  account launch rights.  See the DCOM config security page.  You may
  also want to change the Identity to interactive user so that
  you can shut down the remote data module using the task manager.

  5) Access the web module by entering the name of you virtual
  directory URL followed by the name of the exe:

  For example: http://localhost/webpub/demo/CustomerList.exe

  If you have trouble getting the pages to display, verify that
  the java script files are available and that DCOM security is
  set up correctly. 
  
  Note that Navigator often has better error reporting than IE.  
  Try Navigator if IE isn't providing a usefull message.
  
  You can also use the scripttest.html file in the troubleshoot
  sample directory to verify that the InternetExpress 
  JavaScript include files are available from your web server.

