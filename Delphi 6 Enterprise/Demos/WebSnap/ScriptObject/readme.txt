WebSnap Demos
ScriptObject Directory

This example demonstrates how to develop an Active Script enabled component
to use with WebSnap.

To use:

run tregsvr demos\websnap\scriptobject\sample.tlb to register the typelib defining
the dispatchable interfaces.

Install the DclSampleScriptObject package.  This package adds
TSimpleScriptObject, TExtendedAdapter, and TExtendedDataSetAdapter to the
"WebSnap Demos" page on the palette.

Create a new WebSnap application containing a Web page module using a TPageProducer or
TAdapterPageProducer.

Drop one of the new components on the Web page module.

Each component has a SampleValue property.  Add script to the .html template file
of the Web page module to display SampleValue.  JavaScript to display this property looks 
like this:

<%= SimpleScriptObject1.SampleValue %>

Click the editor's preview tab.  The preview will update automatically when you modify
the SampleValue property using the object inspector.

See the SampleObjectTest directory for web applications that use these components.
