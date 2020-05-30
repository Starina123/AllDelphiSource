WebSnap Demos
ImgBtnProducer directory

This package registers TImageButtonProducer.  This component is used to
render images on behalf of a TAdapterActionButton.  Use properties of TImageButtonProducer to
specify how buttons should look.  TImageButtonProducer will create and update .jpg files as
needed.  Use the Preview tab of the code editor to preview buttons at design-time.

To use this component:


- Install DclImgBtnProducers.bpl

- Create a Web Page module that uses a TAdapterPageProducer
  component.  Build a form with the TAdapterPageProducer, adding
  one or more TAdapterActionButton components to the form.
  
- Drop a TImageButtonProducer component onto the Web Page module 
  (see the "WebSnap Demos" palette page).
  
- Set the CacheDir and VirtualDir properties.  CacheDir identifies the directory where image files
  will be created.  The VirtualDir property identifies the location known by an HTTP
  server such as IIS.   
    
- Set the TAdapterActionButton.ImageProducer property with the name of the ImageButtonProducer.

- Modify properties of the ImageProducerComponent to achieve the desired appearance.

- Preview the buttons in the code editor window using the Preview tab.

- Configure your HTTP server.  If you are using the Web App Debugger then include the CacheDir
in the Web App Debugger search path.  For other servers, set up a virtual directory where the
images can be found. 
 
- Compile.  The application is ready to run.  If this is a Web App Debugger executable, you can run
from the IDE.



