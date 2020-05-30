To Compile:

Make Sure your environment is setup correct (See /installdir/README)
Using Bash (replace /usr/local/kylix with the install dir)
Edit PageProducerHandlerU.pas Create method and change
the htmlDocRoot string to reflect the location of your html root dir.
If your html root dir is the default '/home/httpd/html/' then there 
is no need to edit this file.

export DLIB=/usr/local/kylix/lib

dcc -U$DLIB PageProducerCGI.dpr

To Run:
========
copy the folder ../kylix_sample_html to the html Root of your machine.
Note: you will need root access to copy to these directories.

  mkdir /home/httpd/html/kylix_sample_html/
  cp ../kylix_sample_html/* /home/httpd/html/kylix_sample_html

You should now be able to see the index page from your machine 
by going to http://localhost/kylix_sample_html/

Now copy the the PageProducerCGI to the cgi-bin dir

  cp ./PageProducerCGI /home/httpd/cgi-bin

The Apache conf file needs to be edited so that the needed libraries
for the cgi are available to Apache.

  vi /etc/httpd/conf/httpd.conf

  Add this line to ### Section 2: 'Main' server configuration 
  SetEnv LD_LIBRARY_PATH /usr/local/Kylix

  then restart Apache
  /etc/rc.d/init.d/httpd restart


Now see the PageProducerCGI section on the 
http://localhost/kylix_sample_html/index.html page
for some links that demo the cgi

Things to Watch:
  the file name case can change from windows to Linux.
  be sure that the case of the html is correct (company.ppt)

Synopsis:
=========
The PageProducerCGI takes an argument of a PageProducerTemplate
followed by some color settings for that page.
You can use the get POST method, or the GET method
described below.

http://localhost/cgi-bin/PageProducerCGI/kylix_sample_html/company.ppt?TITLECOLOR=green&CELLCOLER=gainsboro&BACKGROUNDCOLOR=white
  
  *whew*

Where:

  http://localhost/cgi-bin/PageProducerCGI
  is the path to the cgi

  /kylix_sample_html/company.ppt
  is the relative path to the PageProducerTemplate file
  this could be any html file with the <#ARG> Page producer tags

  ?TITLECOLOR=green&CELLCOLER=gainsboro&BACKGROUNDCOLOR=white
  are the arguments to set the .ppt file colors

Why:
  These arguments could be accessed from a user cookie or just from 
  some links to allow for a more dynamic website. Since the pages
  will need to run through a cgi this approach is limited to low 
  traffic areas of the website.

How:
  in the PageProducerHandlerU.pas file the default action
  WebModule1waProcessTPPAction  uses the TWebRequest to get 
  the passed params, then sets the values and calls the content
  method of the PageProducer. 


