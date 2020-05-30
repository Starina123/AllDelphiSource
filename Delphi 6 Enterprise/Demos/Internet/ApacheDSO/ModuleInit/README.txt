Demo: ModuleInit

Requirements
============
  Apache is compiled for DSO Support (see ../ApacheDSO.txt)
  Write access to Apache conf file  .../conf/httpd.conf


Build Project (using the IDE)
=============
  Open ModuleInit.dpr in Delphi
  From the menu items select:
    Project | Options -->Directories Tab
  Set the OutPut Directory to the location you use for your Apache Modules. Make
  sure you have write access to the location you are using.
  Apache Modules are usually stored in the following locations:
        /etc/httpd/modules
        /usr/local/apache/libexec


Build Project (From the commmand line)
=============
  Execute:
    PathToKylixRoot/bin/kylixpath
    Example:
      /usr/local/kylix/bin/kylixpath
  Execute:
    dcc ModuleInit.dpr
    cp libModuleInit.so PathToApache/libexec/

Setup
=====
  Edit the Apache Conf file. Default locations include.......
   /usr/local/apache/conf/httpd.conf
   /etc/httpd/conf/httpd.conf

  Add the following lines to httpd.conf

        SetEnv LD_LIBRARY_PATH {PathToKylixRoot/bin}

        LoadModule ModuleInit_Module {path to libModuleInit.so}
        <Location /HelloWorld>
                SetHandler moduleinit-handler
        </Location>


Run the Demo
============
  Start Apache
  Open a WebBrowser
  goto http://localhost/ModuleInit/

