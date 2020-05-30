WebSnap Demos
XMLBiolife Directory

This project requires msxml3.  You can download msmxl3.exe and xmlinst.exe from msdn.microsoft.com.

This sample application provides the same functionality as biolife but uses XSL
to format the pages instead of JScript.  The sample XSLT template (template.xsl) is
used to format all pages.  The TAdapterXMLBuilder components generates an XML 
describing the structure and data on the page.  After generated the XML, the AdapterXMLBuilder
component transforms the XML into HTML use template.xsl. To add, remove, and rearrange 
page elements, modify the AdapterXMLBuilder components.  To change the appearance of the pages, 
modify template.xsl.

Before opening this project, install demos\websnap\xmlbuilder\dclxmlbuilder.bpl.

This project contains the following modules:

DMU - This web data module contains BDE components needed to access the biolife table.  Also contain an XSLTemplate component.
This component is registered by dclxmlbuilder.  The XSLTemplate component references the template.xsl XSLT file.

EditU - This web page module provides a page for editing a single record in the biolife table.

LoginU - This web page module provides a login form.  Login as either "Will" or "Ellen". Case is important.  Ellen
can update biolife.  Will can only view.

GridU - This web page module provides a grid for viewing the biolife table.


Important Note:
--------------
This web application must remain in memory between requests.  Sessions will not work otherwise.  If you 
aren't able to leave the login screen then sessions aren't working.  The ISAPI version will work 
properly because ISAPI dll's stay in memory.  However, the Web App Debugger executable will not 
remain in memory unless it is started before browsing to the login page.
