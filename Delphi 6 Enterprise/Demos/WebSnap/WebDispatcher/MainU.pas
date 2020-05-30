
unit MainU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, ReqMulti,
  WebDisp;

type
  TMain = class(TWebAppDataModule)
    WebAppComponents: TWebAppComponents;
    WebDispatcher: TWebDispatcher;
    procedure WebDispatcherWebActionItem1Action(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebDispatcherWebActionItem3Action(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Main: TMain;

const
  sHeading = '<h2>WebDispatcher Test<h2>'#13#10 +
             '<table border="1" cellpadding="3">'#13#10 +
             '<tr bgcolor="#FFFFCC"><th colspan="4">Actions</th></tr>'#13#10 +
             '<tr bgcolor="#CCFFFF"><th>PathInfo</th><th>Default</th><th>Producer</th><th>Content</th></tr>'#13#10 +
             '<tr bgcolor="#CCFFFF"><td>&nbsp;</td><td align="center">*</td><td>&nbsp;</td><td>Actions table followed by "Default"</td></tr>'#13#10  +
             '<tr bgcolor="#CCFFFF"><td>/PageProducer1</td><td>&nbsp</td><td>PageProducer1</td><td>Actions table followed by "PageProducer1"</td></tr>'#13#10   +
             '<tr bgcolor="#CCFFFF"><td>/Test</td><td>&nbsp</td><td>&nbsp;</td><td>Actions table followed by "Test"</td></tr>'#13#10   +
             '</table>'#13#10;
implementation

{$R *.dfm} 

uses WebReq, WebCntxt, WebFact, Variants, ModuleU;

function Main: TMain;
begin
  Result := TMain(WebContext.FindModuleClass(TMain));
end;

procedure TMain.WebDispatcherWebActionItem1Action(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  Response.Content := sHeading + '<h1>Default';
end;

procedure TMain.WebDispatcherWebActionItem3Action(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := sHeading + '<h1>Test';
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebAppDataModuleFactory.Create(TMain, caCache));

end.
