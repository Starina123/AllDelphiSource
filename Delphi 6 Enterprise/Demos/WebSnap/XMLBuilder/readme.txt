WebSnap Demos
XMLBuilder Directory

This package requires msxml3.  You can download msmxl3.exe and xmlinst.exe from msdn.microsoft.com.

This directory contains 2 packages:
 
 XMLBuilder.bpl is a runtime package that contains components used to dynamically
 generate XML and transform the XML with an XSL template.
   
 DclXMLBuilder.bpl is a design package that registers the components in XMLBuilder.
 
 XMLBuilder must be built before DclXMLBuilder.

DclXMLBuilder installs the following components on the "WebSnap Demos" page:

 TAdapterXMLBuilder - Builds an XML defining elements on a Web Page.  Applies an
 XSL template to the XML to produce HTML content.  When designing a page, this component
 works like TAdapterPageProducer--you add child components to define a heirarchical 
 definition of a page that accesses data through Adapter components (e.g.; TDataSetAdapter).
 
 TXSLTemplate - Manages an XSL template file.  Used by TAdapterXMLBuilder to retrieve the 
 XSL template.
 
Other components are registered for use by TAdapterXMLBuilder.  These components work like
their TAdapterPageProducer counterparts (e.g.; TXMLForm works like TAdapterForm).

  TXMLForm
  TXMLFieldGroup
  TXMLGrid
  TXMLCommandGroup
  TXMLCommandColumn,
  TXMLAdapterActionItem
  TXMLAdapterFieldItem
  TXMLAdapterColumnItem
  TXMLAdapterEditColumnItem
  TXMLAdapterErrors

See the xmlbiolife directory for a sample application using these components.
