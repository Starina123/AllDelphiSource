InetXCustom Demo
================

This package consists of several additional Internet Express 
components.  See the list of components below.  The TReconcilePageProducer
component is particularly usefull.

Examples using many of these components can be found in the inetxcenter demo
application.

Component Installation:
======================
     - Project/Open, Change "Files of Type" to be "Delphi Package (*.dpk)",
       then open ..\demos\Midas\InternetExpress\InetCustom\DclInetXCustom.dpk
     - Double click on InetXCustom.dpk, hit 'Compile' button.  When compiled,
       close InexXCustom window.
     - Click on 'Contains', hit 'Compile' button, then hit 'Install' button.
       Clear the 'components installed' message.
     - Close project.
     - go to InternetExpress Palette.  You'll find the ReconcilePageProducer
       available.  All of the other components are available within the
       TMidasPageProducer property editor.
       
Image components
================

The TImg* components use the <IMG> element to display a .gif file.  You will
need to copy the .gif files to your web server's virtual directory so that
they can be downloaded.  If you would like the .gif files to display properly at
design time, add the following registry string:

HKEY_CURRENT_USER\Software\Borland\
delphi\5.0\Property Editors\WebPage Editor\BlankPage = 'c:\inetpub\wwwroot\blank.htm'

Substitute c:\inetpub\wwwroot with the directory where the .gif files are located.
You will also need to create a file called blank.htm in this directory.  This
file should be empty.
  
The file specified by this registry key will be used to initialize the
WebBrowser control embedded within the TMidasPageProducer property editor. 

You may also specify a URL instead of a file path.  For example,
BlankPage = http://localhost/blank.htm.   A URL must be used if you set the
TImgDataNavigator.ImagePathURL to the name of a virtual directory.  For example,
TImgDataNavigator.ImagePathURL = '/images/'; 

Components list:
================
TFieldLink  
   This component generates a hyperlink. Clicking on the hyperlink generates a 
   query string that identifies the current record. A window is opened on a URL 
   that includes the query string. 
 
TImgApplyUpdatesButton  
  TImgApplyUpdatesButton behaves like TApplyUpdatesButton. An IMG element is 
  used rather than an INPUT element.
 
TImgDataNavigator  
  TImgDataNavigator is the parent of TImg*Button components.
 
TImgDeleteButton  
  TImgDeleteButton behaves like TDeleteButton. An IMG element is used rather 
  than an INPUT element.
 
TImgFirstButton  
  TImgFirstButton behaves like TFirstButton. An IMG element is used rather 
  than an INPUT element.
 
TImgInsertButton  
  TImgInsertButton behaves like TInsertButton. An IMG element is used 
  rather than an INPUT element.
 
TImgLastButton  
  TImgLastButton behaves like TLastButton. An IMG element is used 
  rather than an INPUT element. 
 
TImgNextButton  
  TImgNextButton behaves like TNextButton. An IMG element is used 
  rather than an INPUT element. 
 
TImgNextPageButton  
  TImgNextPageButton behaves like TNextPageButton. An IMG element 
  is used rather than an INPUT element.
 
TImgPostButton  
  TImgPostButton behaves like TPostButton. An IMG element is used 
  rather than an INPUT element.
 
TImgPriorButton  
  TImgPriorButton behaves like TPriorButton. An IMG element is 
  used rather than an INPUT element. 
 
TImgPriorPageButton  
  TImgPriorPageButton behaves like TPriorPageButton. An IMG element 
  is used rather than an INPUT element. 
 
TImgUndoButton  
  TImgUndoButton behaves like TUndoButton. An IMG element is used 
  rather than an INPUT element.
 
TLinkColumn  
  This component generates a hyperlink. Clicking on the hyperlink 
  generates a query string that identifies the current record. A window 
  is opened on a URL that includes the query string.
 
TPromptQueryButton  
  This component displays a dialog box that prompts for a string. The 
  value of the string is submitted as a field on the parent TQueryForm.
 
TQueryHiddenText  
  This component adds a field to a TQueryForm that is not visible to 
  users. The value of the field is passed to the server when the form is submitted.
 
TQueryPassword  
  This component generates a password field.
 
TQuerySearchSelectOptions  
  TQuerySearchSelectOptions adds incremental searching to the 
  TQuerySelectOptions component.

TReconcilePageProducer  
  This component generates a page that displays reconcile errors that occured while 
  applying updates. The user has the opportunity to correct the errors. This page 
  is associated with a TXMLBroker by setting the TXMLBroker.ReconcileProducer property.
 
TRowSetStatus  
  This component displays the row count and current row of the 
  JavaScript XMLRowSet object.
 
TShowDeltaButton  
  When clicked, this component opens a window displaying the XML data packet. 
 
TShowXMLButton  
  When clicked, this component opens a window displaying the XML data packet. 
 
TSortTextColumn  
  This component displays a sort button in the column of a TDataGrid. 
  In other respects, this component behaves like TColumnText. 
 
TSubmitValueButton  
  This query button passes a specified value when it submits a TQueryForm. 
 
TTextColumnAttr  
  This component exposes formatting properties support the by the JavaScript 
  XMLDisplay object. Properties include CurrencySymbol, MinValue, 
  MaxValue, Decimals, FixesDecimals.
 
 

