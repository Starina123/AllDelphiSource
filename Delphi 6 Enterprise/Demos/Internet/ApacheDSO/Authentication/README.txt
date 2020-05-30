Authentication Module
=====================

Requirements
------------
  Apache is compiled for DSO Support (see ../ApacheDSO.txt)
  Write access to Apache conf file  .../conf/httpd.conf


About
-----

  This is a partial port of mod_auth.c
  It should provide a basic framework that will allow
  Kylix Apache developers to build on.


Setup
-----
  Open up Authentication.dpr in Kylix
  Set the ouput directory to the libexec dir of apache

    /etc/httpd/modules
      or
    /usr/local/apache/libexec

  Copy the PlainText Password file "kylixpasswordfile.txt" to 
  the desired location
  Suggested:
   /etc/httpd/conf
   /usr/local/apache/conf

  Change the location of the Password file in the unit
  source Authentication_u.pas
  this is located about line 65
   sec.auth_pwfile := '/usr/local/apache/conf/kylixpassfile.txt';
  Change the value to the location of your kylixpassfile.txt

  
  Build the application


Setup Apache
------------
  Add the following lines to the httpd.conf file
  Note: Leave out the SetHandler Directive to allow apache to use
        the default content handler (text/html....etc), otherwise
        Even if an actual file is requested, your response will be
        used.

  //--------snip----------//
    LoadModule authentication_module libexec/libAuthentication.so


    <Location /CheckID>
       	SetHandler authentication-handler
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

  At this point you should get an Password dialog box
  from the browser.
  user: kylix
  pass: kylix

  Errors will be logged in the error_log.
  view {PathToApache}/logs/error_log to see the error 
  messages.

