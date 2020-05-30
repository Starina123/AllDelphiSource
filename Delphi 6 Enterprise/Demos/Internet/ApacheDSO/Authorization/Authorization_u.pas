{-------------------------------------------------------------------------------
// Authentication Demo
//
// Description: Three Handlers to Know, They Are (In Order):
//              ApacheOnAccessChecker......Access Control
//              ApacheOnCheckUserId........Authentication
//              ApacheOnAuthChecker........Authorization  {This Demo}
//
//              Access Control:
//                      Access control is any type of restriction that doesn't
//                      require the identity of the remote user.
//                      Use this handler to deny or grant access based on
//                      Host, IP , Domain....etc.
//
//              Authentication:
//                      May I see your ID Please ? Who are you and can you
//                      Prove it ? Use this handler to implement your desired
//                      Authentication Scheme.
//
//              Authorization:
//                      OK, So you _ARE_ Mr.Foo, However I still can't Let you
//                      in ! Once you know Who the person is, use the
//                      Authorization handler to determine if the individual
//                      user can enter.
//
//
//              This Demo Will Authorize the _Authenticated_ user. Use the
//              Authentication of your Choice. It will authorize only the user
//              named kylix.
//-----------------------------------------------------------------------------}

unit Authorization_u;

interface

uses
  SysUtils, Classes, HTTPApp, ApacheApp, HTTPD;

type
  TWebModule1 = class(TWebModule)
    procedure WebModule1Actions0Action(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;
  path : String;

implementation

uses WebReq;

{$R *.xfm}


procedure TWebModule1.WebModule1Actions0Action(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  // this only fires if the SetHandler directive is used....
  response.content:='You have been authorized: '+ Request.Content;
end;



function Apache_OnAuthChecker(Request: Prequest_rec): integer;
var
  c_req: Pconn_rec;
begin
    c_req := Request^.connection;

    if strcomp('kylix', c_req.user) = 0 then
      result := AP_OK
    else
    begin
      ap_log_error(Request.server.error_fname , APLOG_ALERT, APLOG_ALERT, Request.server,
                   PChar('access to ' + Request.uri + ' failed, reason: user ' +
                   c_req.user + ' not allowed access '));
      result := HTTP_UNAUTHORIZED;
    end;
end;

initialization
   //ApacheOnCreateDirConfig := create_auth_dir_config;
   //ApacheOnAccessChecker := Apache_OnAccessChecker;
   //ApacheOnCheckUserId := Apache_OnCheckUserID;
   ApacheOnAuthChecker := Apache_OnAuthChecker;
end.

