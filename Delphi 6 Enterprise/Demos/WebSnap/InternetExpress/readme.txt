WebSnap Demo
InternetExpress Directory

This application demonstrates how an InetXPageProducer 
component (originally named MidasPageProducer) can be used with a 
Web Page module.

InternetExpress requires client side JavaScript.  You'll need to make these
files available to the web server so that they can be downloaded when requested by
the browser.  For IIS support, copy *.js from delphi6\source\webmidas to the location
of InternetExpressISAPI.dll (typically demos\websnap\InternetExpress).  For the Web App Debugger,
you won't need to copy *.js files because the Web App Debugger is configured with 
$(DELPHI)\source\webmidas by default.

Notes
=====
  This application contains a TWebDispatcher component even though there
  are no dispatch actions.  This is necessary because TWebDispatchers know how to 
  dispatch Apply Update requests to XMLBroker components.

  A TAdapter and a TAdapterPageProducer are used to build a query form.  See QueryU.  
  Note that CmdSubmitQuery.PageName = 'QueryResult'.  This causes the QueryResult page to be
  dispatched after the query form submit button is clicked. 

  InetXPageU.TCountries.InetXPageProducerBeforeGetContent switches between two XMLBroker
  components depending upon whether a query result is being shown or the entire 
  Country table. 

  InetXPageU registers two logical pages in the initialization section.  The page used to
  display query results ('QueryResult') is not published.  The page used to display the entire country 
  table is published.

  Some custom script was added to InetXPage.html.   This
  script displays the query parameter by retrieving a value from an adapter field. 

<% if( DataSetInfo.ContinentName.Value != null) {
  var S = DataSetInfo.ContinentName.DisplayText;
  if (S=="") S = '""';  %>
  <h2>Query results for <%= S %></h2>
<% } %>


  
  

