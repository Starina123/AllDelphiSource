CGIs Setup.
===========

  The projects in this directory are written as cross platform, 
  and should work under linux and windows. There are two project 
  group files, one  for windows (demoCGIs.windows.bpg) and 
  one for linux (demoCGIs.linux.bpg).

Pick a location:
----------------
  Pick the location you want these demos to live in and copy the 
  CGIs dir to that location.
  for example:
    LINUX:
    cp -R /usr/local/kylix/demos/internet/CGIs /home/httpd
    
    WINDOWS:
    drag ../Delphi/demos/internet/CGIs C:/inetpub/


run the configuration script
----------------------------
  In the CGIs directory there is a configure.s and a configure.bat file.
  Run this file after you've moved the CGIs directory to it's desired 
  location. The configure script will create a file nammed apache.conf.
  Append this file the the httpd.conf file.

  LINUX:
   [prompt]$ ./configure.s
   [prompt]$ cat apache.conf >> /etc/httpd/conf/httpd.conf

  Note: you may need to set the executable flag on the script
        chmod 755 configure.s

  WINDOWS:
   prompt> configure.bat
   Copy the contents of apache.conf to httpd.conf
   



Build the projects:
-------------------
  In Delphi/kylix open up the respective .bpg file.
  
  LINUX:
   File | Open --> browse to demoCGIs.linux.bpg
   Project | build all projects

  WINDOWS:
   File | Open --> browse to demoCGIs.windows.bpg
   Project | build all projects
   NOTE: under win9X you may need to reconfigure the bpg file 
         so that the paths use \ instead of /

Restart Apache
---------------
  
  LINUX:
   [prompt]$ /etc/rc.d/init.d/httpd restart


Run the CGIs via the html provided
----------------------------------
  In a Web Browser enter the address:
   http://localhost/demo_html/

  Providing the httpd.conf file was set up correct, you should now see
  the CGIs web driver page.
  

 

********MISC web development info***********

Project Output Directory
========================

Linux:
------
  When I'm doing CGI development I prefere to setup a "web" group on my linux
  box. I install as root, then do all my development as a standard user "me".
  I then set each of my CGI Projects output dir to /home/httpd/cgi-bin or 
  whatever the path is to my current web server cgi dir.
  To do this you will need to do two things:

        * Create a group and add your self to it.
        * Change the permissions for /home/httpd to allow group Read Write.

        Adding Groups
        -------------
        As Root, Edit the file /etc/group
        Add a new group using th efollowing format:
          GroupName:x:GroupID:Users
          where GroupID is unique
          The line I added is as follows
          web:x:80:me, root, nobody

        Change Permissions
        ------------------
        as root,
        cd /home/httpd
        chgrp -R web httpd
        chmod -R 775 httpd


Windows:
--------
  CGI Development is a little easier under windows, since you don't really have
  to worry too much about the permissions. Just set your output directory to
  the location of you cgi exe's for example: "C:\Inetpub\cgi-bin"
  note: if you are using IIS you will need to set up a  virtual directory named 
        cgi-bin that has execute permissions.
        for Example:
         Start Menu -> Settings -> Administrative Tools -> Personal Web Manager
         Select: Advanced Options
         Add a Virtual Directory:
            Directory = c:\Inetpub\cgi-bin {or whatever your desired path is}
            Alias = cgi-bin
            Application permissions -> Execute




