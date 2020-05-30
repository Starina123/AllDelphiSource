Authorization Module
=====================

Requirements
------------
  Apache is compiled for DSO Support (see ../ApacheDSO.txt)
  Write access to Apache conf file  .../conf/httpd.conf


About
-----

  This module will only allow the user 'kylix' to enter the
  directory. It is suggested that you first build and install
  the Authentication module (which will authenticate user kylix).


Setup
-----
  Open up Authorization.dpr in Kylix
  Set the ouput directory to the libexec dir of apache

    /etc/httpd/modules
      or
    /usr/local/apache/libexec

  
  Build the application


Setup Apache
------------
  Add the following lines to the httpd.conf file
  Note: Leave out the SetHandler Directive to allow apache to use
        the default content handler (text/html....etc), otherwise
        Even if an actual file is requested, your response will be
        used.

  //--------snip----------//
    LoadModule authorization_module libexec/libAuthorization.so


    <Location /CheckID>
       	SetHandler authorization-handler
	AuthName kylix
        AuthType Basic
        Require valid-user
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

  http://localhost/CheckID

  If you have the Athentication module installed you should get 
  a Password dialog box from the browser.
  user: kylix
  pass: kylix

  this user will be authorized...
  now shut down the browser and restart it.
  goto http://localhost/CheckID  
  try
  user: foo
  pass: bar

  this user will be Authenticated, however they will not
  be authorized and an error will show in the browser.
  
  Errors will be logged in the error_log.
  view {PathToApache}/logs/error_log to see the error 
  messages.


  

