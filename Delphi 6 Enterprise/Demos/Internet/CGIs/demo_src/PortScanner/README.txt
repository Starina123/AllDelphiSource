To Compile:

Make Sure your environment is setup correct (See /installdir/README)
Using Bash (replace /usr/local/kylix with the install dir)

export DLIB=/usr/local/kylix/lib

dcc -U$DLIB PortScanner.dpr

To Run:
========
copy the folder ../kylix_sample_html to the html Root of your machine.
Note: you will need root access to copy to these directories.

  mkdir /home/httpd/html/kylix_sample_html/
  cp ../kylix_sample_html/* /home/httpd/html/kylix_sample_html

You should now be able to see the index page by from your machine 
by going to http://localhost/kylix_sample_html/

Now copy the the PortScanner to the cgi-bin dir

  cp ./PortScanner /home/httpd/cgi-bin

The Apache conf file needs to be edited so that the needed libraries
for the cgi are available to Apache.

  vi /etc/httpd/conf/httpd.conf

  Add this line to ### Section 2: 'Main' server configuration 
  SetEnv LD_LIBRARY_PATH /usr/local/Kylix

  then restart Apache
  /etc/rc.d/init.d/httpd restart


Now see the PortScanner section on the 
http://localhost/kylix_sample_html/index.html page
for some links that demo the cgi



Synopsis:
=========
The PortScanner attempts to make a socket connection to the
ports 1-1024. Any open ports are noted in the output.
This could be turned into a multi-threaded command line 
application, or the port range could be added to the
POST method..........



