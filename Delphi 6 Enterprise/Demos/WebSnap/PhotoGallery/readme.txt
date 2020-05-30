WebSnap Demos
Photo Gallery directory

To use this demo log in as root with a password of root. Then, you can add
users to the web application.

User names are stored in users.binary in the current
directory. If, for some reason, you delete all users and you need to
login, simply delete users.binary and you can log back in with root/root.

After adding a user, they can login, upload pictures, and view pictures.


Important Note:
--------------
This web application must remain in memory between requests.  Sessions will not work otherwise.  If you 
aren't able to leave the login screen then sessions aren't working.  The ISAPI version will work 
properly because ISAPI dll's stay in memory.  However, the Web App Debugger executable will not 
remain in memory unless it is started before browsing to the login page.
