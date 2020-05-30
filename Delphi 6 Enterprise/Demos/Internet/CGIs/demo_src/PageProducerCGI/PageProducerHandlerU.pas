// TPageProducerHandler
// By: Shane Hausle
// Usage:
//    As cgi:
//       pass the PageProducer Template as an argument to the url
//       like so 'http://monkey1:90/cgi-bin/PageProducerCGI.exe/index.html.en'
//       Where /index.html.en would be the template based on the relative path.
//       NOTE: Images must Contain the Literal Path to work.


unit PageProducerHandlerU;

interface

uses
  {$IFDEF MSWINDOWS}
  Windows, Messages, DBWeb, 
  {$ENDIF}
  SysUtils, Classes,
  HTTPApp, HTTPProd, Sockets ;
  
type
  TWebModule1 = class(TWebModule)
    tppGrok: TPageProducer;

    procedure WebModule1waProcessTPPAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure tppGrokHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
  private
    { Private declarations }
  public
    constructor create(aOwner : TComponent); override;
  end;

var
  WebModule1: TWebModule1;
  cCell, cTitle, cBackground: String;
implementation
   {$R *.dfm}
constructor TWebModule1.create(aOwner: TComponent);
  begin
  inherited;
  end;

procedure TWebModule1.WebModule1waProcessTPPAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  FilePath, s : String;
begin
  if (Request.PathInfo <> '') then
  begin
    tppGrok.HTMLFile:= Request.PathTranslated ;
    if Request.Method = 'POST' then begin
      cTitle      := Request.ContentFields.Values['TITLECOLOR'];
      cCell       := Request.ContentFields.Values['CELLCOLOR'];
      cBackground := Request.ContentFields.Values['BACKGROUNDCOLOR'];
      end
    else begin
      cTitle      := Request.QueryFields.Values['TITLECOLOR'];
      cCell       := Request.QueryFields.Values['CELLCOLOR'];
      cBackground := Request.QueryFields.Values['BACKGROUNDCOLOR'];
      end;

    if cTitle = ' ' then cTitle := 'gainsboro';
    if cCell = ' ' then cCell := 'White';
    if cBackground = ' ' then cBackground := 'White';
    Response.Content := tppGrok.Content();
  end
  else
    Response.Content := 'Invalid Params <BR> Try : <BR>' +
    'Path to CGI + FullPath To PageTemplate + ColorParams <BR> ' +
    'Example: <BR>' +
    'http://localhost/cgi-bin/PageProducerCGI/kylix_sample_html/company.ppt?TITLECOLOR=green&CELLCOLER=gainsboro&BACKGROUNDCOLOR=white' +
    '<BR>';

end;

procedure TWebModule1.tppGrokHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
 if (CompareText(TagString,'TITLECOLOR')=0) then
    ReplaceText := 'BGCOLOR = "' + cTitle + '"' ;
 if (CompareText(TagString,'CELLCOLOR')=0) then
    ReplaceText := 'BGCOLOR = "' + cCell + '"' ;
 if (CompareText(TagString, 'BACKGROUNDCOLOR')=0) then
    ReplaceText := 'BGCOLOR = "' + cBackground + '"';
    

end;

end.





