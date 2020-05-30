{-------------------------------------------------------------------------------
// Authentication Demo
//
// Description: Three Handlers to Know, They Are (In Order):
//              ApacheOnAccessChecker......Access Control
//              ApacheOnCheckUserId........Authentication {This Demo}
//              ApacheOnAuthChecker........Authorization
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
//-----------------------------------------------------------------------------}

unit Authentication_u;

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
  response.content:='Access Granted: '+ Request.Content;
end;

function Apache_OnAccessChecker (Request: Prequest_rec): integer;
begin
   result:= 0;
end;

type
  Pauth_config_rec = ^auth_config_rec;
    auth_config_rec = packed record
    auth_pwfile: pchar;
    auth_grpfile: pchar;
    auth_authoritative: integer;
  end;


function create_auth_dir_config(Pool: Ppool; szDir: pchar): pointer;
var
  sec: Pauth_config_rec;
begin
  sec := ap_pcalloc(Pool, sizeof(auth_config_rec));
  sec.auth_pwfile := nil;	// just to illustrate the default really
  sec.auth_grpfile := nil;	// unless you have a broken HP cc
  sec.auth_authoritative := 1;	// keep the fortress secure by default
  result:= sec;
end;


function get_pw(r: Prequest_rec; user, auth_pwfile: pchar): pchar;
var
  f: Pconfigfile_t;
  l: array[0..255] of char;
  rpw, w: pchar;
begin
 result := nil;
 f := ap_pcfg_openfile(r^.pool, auth_pwfile);
 if f = nil then exit;
 while ap_cfg_getline(l, 255, f) = 0 do
 begin
   if (l[0] = '#') or (strlen(l) = 0) then
     continue;
   rpw := l;
   w := ap_getword(r^.pool, @rpw, ':');
   if strcomp(user, w) = 0 then
     begin
       ap_cfg_closefile(f);
       result := ap_getword(r^.pool, @rpw, ':');
       exit;
     end;
 end;
 ap_cfg_closefile(f);
end;
function authenticate_basic_user(Request: Prequest_rec): integer;
var
  sec: auth_config_rec;
  c: Pconn_rec;
  sent_pw: pchar;
  real_pw: pchar;
  res: integer;
begin
  //pMod := @apache_module;
  // This apiCall is failing with an Undefined symbol.
  // sec := ap_get_module_config(Request^.per_dir_config, pMod);
  // This means that we can't read them from the
  // config file, and they need to be set here.

  // This would be read in from AuthUserFile in the conf file
  sec.auth_pwfile := '/usr/local/apache/conf/kylixpassfile.txt';
  sec.auth_grpfile := nil;
  sec.auth_authoritative := 1;
  // end ===============================================
  c := Request^.connection;
  res := ap_get_basic_auth_pw(Request, @sent_pw);
  if res <> 0 then
    begin
      result := res;
      exit;
    end;
    // logging left in as an aid
    ap_log_error(Request.server.error_fname , APLOG_EMERG, APLOG_ALERT, Request.server,
                PChar('user tested = ' + c^.user));

  if sec.auth_pwfile = nil then
    begin
    ap_log_error(Request.server.error_fname , APLOG_EMERG, APLOG_ALERT, Request.server,
                PChar('pw file is nil'));
      result := AP_DECLINED;
      exit;
    end;

    real_pw := get_pw(Request, c^.user, sec.auth_pwfile);
    if real_pw = nil then
      begin
      ap_log_error(Request.server.error_fname , APLOG_EMERG, APLOG_ALERT, Request.server,
                PChar('real_pw is nil'));
        if sec.auth_authoritative <> 0 then
        begin
          result := AP_DECLINED;
          exit;
        end;
          result := AUTH_REQUIRED;
        exit;
      end;

      ap_log_error(Request.server.error_fname , APLOG_EMERG, APLOG_ALERT, Request.server,
                PChar('sent pw=' + sent_pw + ' acutal pass=' + real_pw));
      if strcomp(sent_pw, real_pw) = 0 then
        result := AP_OK
      else
        result := AUTH_REQUIRED;

end;


function Apache_OnAuthChecker(Request: Prequest_rec): integer;
begin
  //ap_note_basic_auth_failure(Request);
    result:= 0;
end;

initialization
   ApacheOnCreateDirConfig := create_auth_dir_config;
   ApacheOnAccessChecker := Apache_OnAccessChecker;
   ApacheOnCheckUserId := authenticate_basic_user;
   ApacheOnAuthChecker := Apache_OnAuthChecker;
end.

