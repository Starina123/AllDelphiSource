unit requestU;

interface

uses
  {$IFDEF MSWINDOWS}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes, HTTPApp;

type
  TWebModule1 = class(TWebModule)
    procedure WebModule1WebActionItem1Action(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1waSetCookieAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1waGetCookieAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;

implementation

{$R *.dfm}

procedure TWebModule1.WebModule1WebActionItem1Action(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  aPage : TStringList;
  i: integer;
begin
  aPage:= TStringList.Create;
  aPage.Add('Method = ' +Request.Method + '<BR>');
  aPage.Add('URL = ' + Request.URL+ '<BR>');
  aPage.Add('User Agent = ' + Request.UserAgent+ '<BR>');
  aPage.Add('Cookie = ' + Request.Cookie+ '<BR>');
  aPage.Add('From = ' + Request.From+ '<BR>');
  aPage.Add('Remote Address = ' + Request.RemoteAddr+ '<BR>');
  aPage.Add('Remote Host = ' + request.RemoteHost+ '<BR>');
  Response.Content := aPage.Text;

  aPage.Free;

end;

procedure TWebModule1.WebModule1waSetCookieAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  aCookie: TStringList;
begin
  aCookie := TStringList.Create;
  if Request.Method = 'POST' then begin
    aCookie.Add('NAME="' + Request.ContentFields.Values['NAME'] + '"');
    aCookie.Add('PRODUCT="' + Request.ContentFields.Values['PRODUCT'] + '"');
    aCookie.Add('USERID="' +Request.ContentFields.Values['USERID'] + '"');
    end
  else begin
    aCookie.Add('NAME=MrFoo');
    aCookie.Add('PRODUCT=Kylix');
    aCookie.Add('USERID=A5001');
    end;

  aCookie.Add('IP="' + Request.RemoteAddr + '"');
  //aCookie.Add('Browser="' + Request.UserAgent + '"');
  with Response do begin
    SetCookieField(aCookie, Request.Host, '/', (Now + 1), False);
    Content := 'Cookie planted' ;
    end;
  end; // setcookie


procedure TWebModule1.WebModule1waGetCookieAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  i: integer;

begin
  //Response.Content :=  Request.Cookie  ;

  Response.Content := '<HTML><BODY>';
  for i := 0 to (Request.CookieFields.Count - 1) do
  begin
    Response.Content := Response.Content + ' ' +
    Request.CookieFields[i] +  '<BR>';
  end;
  Response.Content := Response.Content + '</BODY></HTML>';

end;


end.


