{***************************************************************
 *
 * Project  : CGIMailer
 * Unit Name: fMain
 * Purpose  : Demonstrates using SMTP comp to sendmail using CGI
 * Version  : 1.0
 * Date     : Fri 16 Feb 2001  -  04:27:01
 * Author   : Allen O'Neill <allen_oneill@hotmail.com>         
 * History  :
 *
 ****************************************************************}

unit fMain;

interface

uses
    windows,   messages,   SysUtils,   Classes,   HTTPApp,   IdMessage,
    IdBaseComponent,   IdComponent,   IdTCPConnection,   IdTCPClient,
    IdMessageClient,  IdSMTP
    {$IFDEF VER140},HTTPProd;{$ELSE};{$ENDIF}

type
  TWebModule1 = class(TWebModule)
    IdSMTP: TIdSMTP;
    IdMessage: TIdMessage;
    pgeError: TPageProducer;
    pgeForm: TPageProducer;
    pgeSuccess: TPageProducer;
    procedure WebModule1actMainAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure pgeErrorHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure pgeFormHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
  private
    { Private declarations }
  Err_Msg: string;
	slstVarsIn: TStrings;
    
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;

implementation

{$R *.DFM}

procedure TWebModule1.WebModule1actMainAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);

begin

Err_Msg := '<ul>';

if Request.MethodType = mtGet then
  slstVarsIn := Request.QueryFields
else if Request.MethodType = mtPost then
  slstVarsIn := Request.ContentFields
else
  begin
  Response.content := pgeError.content;
  end;

if slstVarsIn.Count = 0 then Response.content := pgeForm.content // if there is no data sent in then returnthe mailer input form
  else
    begin
    // set message parts
    with IdMessage do
      begin

      if trim(slstVarsIn.Values['Sender']) <> '' then
        begin
        Sender.Address := slstVarsIn.Values['Sender'];
        From.Address := slstVarsIn.Values['Sender'];
        end
      else Err_Msg := Err_Msg + #13 + '<li>' + 'Cannot send without sender information ..';

      if trim(slstVarsIn.Values['Too']) <> '' then
        Recipients.EMailAddresses := slstVarsIn.Values['too']
      else Err_Msg := Err_Msg + #13 + '<li>' + 'Cannot send without recipient <i>(to)</i> information ..';

      if trim(slstVarsIn.Values['Body']) <> '' then
        Body.Append(slstVarsIn.Values['Body'])
      else Err_Msg := Err_Msg + #13 + '<li>' + 'Ahhh come on ... how about some text in the message? ..';

      if  trim(slstVarsIn.Values['Subject']) <> '' then
        Subject := slstVarsIn.Values['Subject']
      else Subject := '<no subject>';

      end;

    // set recipient parts and send it off !
    with IdSMTP do
      begin

      if length(trim(slstVarsIn.Values['Host'])) > 0 then
        Host := slstVarsIn.Values['Host']
      else Err_Msg := Err_Msg + #13 + '<li>' + 'You must fill in the SMTP host name!';


      if length(trim(slstVarsIn.Values['user'])) > 0 then
        UserId := slstVarsIn.Values['user']
      else Err_Msg := Err_Msg + #13 + '<li>' + 'You must fill in the SMTP user name!';

      if Err_Msg = '<ul>' then
        begin
          try
          Connect;
          Send(IdMessage);
          Disconnect;
          Response.content := pgeSuccess.content;
          except
          on E : Exception do
            begin
            Err_Msg := Err_Msg + #13 + '<li>' + E.Message;
            Response.content := pgeError.content;
            end;
          end
        end
      else Response.content := pgeError.content;

      end;

    end;


end;

procedure TWebModule1.pgeErrorHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
if TagString = 'ERROR_MSG' then ReplaceText := Err_Msg + '</ul>';
end;

procedure TWebModule1.pgeFormHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
if TagString = 'HOST' then ReplaceText := Request.Host;
if TagString = 'SCRIPT' then ReplaceText := Request.ScriptName;
 
end;

end.
