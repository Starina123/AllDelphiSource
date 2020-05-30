# ScriptName: configure.s 
#
# Objective:
#	     Crate a apache.conf file that contains the directives that need 
#	     to be added to httpd.conf. This is based upon the current location
#	     of the CGIs directory, so it is essential that this script and the 
# 	     CGIs directory is in the needed location prior to running the script.
#
#---------------------------------------------------------------------------------

#!/bin/bash

DEMO_ROOT=`pwd`
CONF_FILE=apache.conf


echo "Alias /demo_html $DEMO_ROOT/demo_html" >$CONF_FILE
echo "ScriptAlias /demo_bin $DEMO_ROOT/demo_bin" >>$CONF_FILE



