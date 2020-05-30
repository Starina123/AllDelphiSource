WebSnap Demos
SessionTest directory

This example tests session support.  An HTML form displays a single string
value associated with the current end user.  An input field is provided to
modify the string value.  The HTML form also lists start session and terminate session
events.  A button is provided to terminate the session.  The redirect check
box can be checked to verify that the session is terminated properly when
the response is a redirect.

The TSessionsService component keeps session information in memory.  In order
for this application to work properly, it must remain in memory between requests.
If you are running the Web App Debugger version (SessionTestTestSvr) then you'll
need to start SessionTestTestSvr.exe before accessing it from a browser.
SessionTestISAPI will work properly because ISAPI dlls remain in memory between
requests (unless you've disabled ISAPI caching).  This application will not
work as a CGI because a CGI is terminated after each request.

See the biolife directory for examples that use session support to keep track
of a logged in user.


