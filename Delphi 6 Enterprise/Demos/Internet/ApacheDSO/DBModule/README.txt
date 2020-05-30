DBModule
========

Requirements
------------
  * Apache is compiled for DSO Support (see ../ApacheDSO.txt)
  * Write access to Apache conf file  .../conf/httpd.conf
  * Interbase Database


About
-----

  This demo will use an SQLConnection to connect to the 
  Employees DataBase. It will then produce an HTML Table
  of the Data in the Employee table.

Gotchas
-------
  The libraryName and the VendorLib have the incorrect path
  The "SetEnv LANG en_US" is not set
  User Nobody (apache) does not have rights to Interbase
  User Nobody Does not have rights to Kylix libs if installed
    in the users home Directory.


Setup
-----
  Open up DBModule.dpr in Kylix (as a non privileged user)
  Set the ouput directory to the libexec dir of apache

    /etc/httpd/modules
      or
    /usr/local/apache/libexec

  Open up the WebModule
  Select the SQLConnection1 component
  goto the Object inspector
  Verify that the LibraryName is pathed in relation to your system
  Double click on the SQLConnection component
  this will bring up the Connection Editor
  Press the test button (check) to verify the connection
  
  Build the application


Setup Apache
------------
  Add the following lines to the httpd.conf file

  //--------snip----------//

   SetEnv LD_LIBRARY_PATH /usr/local/kylix/bin
   SetEnv LANG en_US

    LoadModule dbmodule_module libexec/libDBModule.dll


    <Location /db>
       	SetHandler dbmodule-handler
    </Location>
  //--------snip----------//


Restart Apache
--------------
  /etc/rc.d/init.d/httpd restart
    or
  /usr/local/apache/bin/apachectl restart


Test the Module
---------------
  Open up a web browser and make a request from the
  protected location:

  http://localhost/db

  At this point you should get an HTML Table of the data

  view {PathToApache}/logs/error_log to see the error 


