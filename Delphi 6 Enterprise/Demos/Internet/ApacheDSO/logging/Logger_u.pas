// Logger Demo
//
// Description: The ApacheOnLogger handler gets called for every request
//              made on the webServer. You can use this handler to log
//              Server Activity. In this example a simple ap_log_error call is
//              made. Don't forget to return 'AP_OK' so that
//              other handlers after you will continue executing.

unit Logger_u;

interface

uses
  SysUtils, Classes, HTTPApp, HTTPD, ApacheApp;

type
  TWebModule1 = class(TWebModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;

implementation

uses WebReq;

{$IFDEF LINUX}{$R *.xfm}{$ENDIF}
{$IFDEF MSWINDOWS} {$R *.dfm}{$ENDIF}

function Apache_OnLogger(Req: Prequest_rec): integer;
var
 Msg : String;

begin
  // change the flags as needed
  // this message will written to the error log
  // For EVERY request, when this module is loaded
  Msg := 'The Logger Says: Request from IP=' + Req.connection.remote_ip +
         ' Content-Type: ' + Req.content_type;

  ap_log_error(Req.server.error_fname , APLOG_INFO, APLOG_NOTICE, Req.server,
                PChar(Msg));

  result := AP_OK;

end;

initialization
  //WebRequestHandler.WebModuleClass := TWebModule1;
  ApacheOnLogger := Apache_OnLogger;
end.