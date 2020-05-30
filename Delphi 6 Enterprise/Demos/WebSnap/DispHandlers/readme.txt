WebSnap Demos
DispHandlers directory

The dcldisphandlers.dpk package demonstrates how to develop your own TWebDispatcher replacement.
The package contains the following components:


TDispatchHandlers - This component is a container for components that respond to HTTPRequests.  TDispatchHandlers
calls each child component in turn.  Each child component examine the HTTP request and may handle it or not.  
If the request is not handled by any of the child components then TDispatchHandlers will call the default 
child component if a default is defined.  Each child component has a property to indicate whether it is the default.  
Only one component may have the default property set to True.	TDispatchHandlers is registered with WebSnap so
that it will show up in the list of DispatchActions in the File/New/WebSnap/Websnap Application Dialog. 
TDispatchHandlers is a component container rather than a collection (like TWebDispatcher) so you are able register new 
dispatch handler components that have specialized behaviors and properties.

The following type of dispatch handler components are registered in dcldisphandlers.dpk.  Each of these can be 
added as a child of TDispatchHandlers:

TWebDispatchHandler - This component is similar to a TWebDispatcher action item.   It has pathinfo and producer
properties.

TFileDispatchHandler - This component has a PathInfo and HTMLFile property.  HTTP requests that match PathInfo will
receive the content of the HTMLFile in the HTTP response.

TPageDispatchHandler - This component has a Page property.  HTTP requests that have a pathinfo ending with the 
page name will receive the page content in the HTTP response.  Page are typically defined by creating new web
page modules.  The web application must contain a TPageDispatcher component.


