To Compile:

Make Sure your environment is setup correct (See /installdir/README)
Using Bash (replace /usr/local/kylix with the install dir)

export DLIB=/usr/local/kylix/lib

dcc -U$DLIB WebRequestCGI.dpr

To Run:
========
copy the folder ../kylix_sample_html to the html Root of your machine.
Note: you will need root access to copy to these directories.

  mkdir /home/httpd/html/kylix_sample_html/
  cp ../kylix_sample_html/* /home/httpd/html/kylix_sample_html

You should now be able to see the index page by from your machine 
by going to http://localhost/kylix_sample_html/

Now copy the the WebRequestCGI  to the cgi-bin dir

  cp ./WebRequestCGI /home/httpd/cgi-bin

The Apache conf file needs to be edited so that the needed libraries
for the cgi are available to Apache.

  vi /etc/httpd/conf/httpd.conf

  Add this line to ### Section 2: 'Main' server configuration 
  SetEnv LD_LIBRARY_PATH /usr/local/Kylix

  then restart Apache
  /etc/rc.d/init.d/httpd restart


Now see the WebRequestCGI  section on the 
http://localhost/kylix_sample_html/index.html page
for some links that demo the cgi



Synopsis:
=========
The WebRequestCGI Has Three Actions available:
  Default /cgi-bin/WebRequestCGI
  which will show some Strings available to TWebRequest

  setcookie  /cgi-bin/WebRequestCGI/setcookie
  which will set a cookie on the client machine
  SetCookie will also allow the POST Method to set the values

  getcookie  /cgi-bin/WebRequestCGI/getcookie
  which will output the current cookie values

NOTE: Get cookie only works if you use the fully qualified domain.
      for example if the web server is foo.inprise.com and you are
      viewing the web page via http://foo/ then the getcookie might
      fail (since the cookie was set for http://foo.inprise.com)




