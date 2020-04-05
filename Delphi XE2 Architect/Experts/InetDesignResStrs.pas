{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit InetDesignResStrs;

interface

resourcestring
   // Ports wizard page
  sPortsPageInfo = 'Click a field for more information';
  sPortsPageTitle = 'Port Number';
  sPortsPageDescription = 'Specify the port that will be used by the web application to listen for client requests.  ' +
  'Use the "Test" button to make sure the port number is not already in use on this computer.';
  sHTTPPortInfo = 'HTTP port.  Port 80 is the well known HTTP port number used by web servers such as IIS.';
  sHTTPSInfo = 'The HTTPS checkbox enables use of the HTTP(Secure) protocol.  Port 443 is the well known HTTPS port number used by IIS.';
  sPEMFileFilter = 'PEM File(*.pem;*.crt;*.cer)|*.pem|Any file (*.*)|*.*';
  sPEMKeyFileFilter = 'PEM File(*.pem;*.crt;*.cer;*.key)|*.pem;*.crt;*.cer;*.key|Any file (*.*)|*.*';
  sPEMFileNotFound = 'File "%s" not found';
  SPEMOpenFileTitle = 'Open';

  // CertFilesPage
  sCertFilesPageInfo = 'Click a field for more information';
  sCertFilesPageTitle = 'X.509 Certificates';
  sCertFilesPageDescription = 'Specify the X.509 certificate and key files that will be used to secure an HTTPS connection. ' +
  'After specifying a certificate and key file, use the "Test" button to validate.';
  sCertFileInfo = 'Certificate file.  This is the public key of your certificate.';
  sRootCertFileINfo = 'Root Certificate file.  Certificate file identifying a Root Certificate Authority.';
  sKeyFileInfo = 'Certificate key file.  This is the private key of your certificate.';
  sKeyFilePasswordInfo = 'Certficate key password.  This is the password used to encrypt the private key.';
  sTestCertFilesOK = 'Test succeeded';
  sCertFilesTestInfo = 'Click the "Test" button to create a temporary server and client, using the specified certificate and key files.';

   sISAPIInfo = 'An ISAPI library integrates with IIS.  IIS has support for HTTP and HTTPS.';
   sCGIInfo = 'A CGI executable integrates with IIS. ' +
   'Note that CGI is typically slower and more difficult to debug than ISAPI.';
   sIndyFormInfo = 'A stand-alone WebBroker VCL application is a web server that displays a VCL form. It Supports HTTP using an Indy HTTP server component.';
   sIndyConsoleInfo = 'A stand-alone WebBroker console application is a web server that has a text-only user interface. It Supports HTTP using an Indy HTTP server component.';
   sWebAppDebugExeInfo = 'A Web App Debugger executable integrate with the Web App Debugger, and support HTTP';
   sWebServerPageTitle = 'WebBroker Project Type';
   sWebServerPageDescription = 'Select the type of WebBroker project';
   sCoClassNameInfo = 'The class name is an identifier that will be used in the URL to connect to a particular Web App Debugger executable.';

implementation

end.
