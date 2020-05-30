
unit ViewMailMod;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdPOP3, WebAdapt, WebComp, IdMessage;

type
  TViewMailModule = class(TWebPageModule)
    PageProducer: TPageProducer;
    popEmail: TIdPOP3;
    EmailAdapter: TAdapter;
    MessageId: TAdapterField;
    MessageSubject: TAdapterField;
    MessageDate: TAdapterField;
    msgEmail: TIdMessage;
    MessageFromName: TAdapterField;
    MessageFromEmail: TAdapterField;
    MessageSize: TAdapterField;
    MessageCount: TAdapterField;
    GetEmail: TAdapterAction;
    procedure EmailAdapterIterateRecords(Sender: TObject;
      Action: TIteratorMethod; var EOF: Boolean);
    procedure WebPageModuleDeactivate(Sender: TObject);
    procedure MessageIdGetValue(Sender: TObject; var Value: Variant);
    procedure MessageSubjectGetValue(Sender: TObject; var Value: Variant);
    procedure MessageFromNameGetValue(Sender: TObject; var Value: Variant);
    procedure MessageDateGetValue(Sender: TObject; var Value: Variant);
    procedure MessageFromEmailGetValue(Sender: TObject;
      var Value: Variant);
    procedure MessageSizeGetValue(Sender: TObject; var Value: Variant);
    procedure MessageCountGetValue(Sender: TObject; var Value: Variant);
    procedure GetEmailGetParams(Sender: TObject; Params: TStrings);
    procedure GetEmailExecute(Sender: TObject; Params: TStrings);
  private
    { Private declarations }
    FMessageId: Integer;
    FMessageCount: Integer;
    FMessageSubject: string;
    FMessageFromName: string;
    FMessageFromEmail: string;
    FMessageDate: string;
    FMessageSize: Integer;
  public
    { Public declarations }
  end;

  function ViewMailModule: TViewMailModule;

const
  cUserName = 'UserName';
  cPassword = 'Password';

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants, IdEMailAddress,
  EmailMessageMod, WebDisp;

function ViewMailModule: TViewMailModule;
begin
  Result := TViewMailModule(WebContext.FindModuleClass(TViewMailModule));
end;

procedure TViewMailModule.EmailAdapterIterateRecords(Sender: TObject;
  Action: TIteratorMethod; var EOF: Boolean);

  procedure FillInMessageInfo;
  begin
    msgEmail.Clear;
    popEmail.RetrieveHeader(FMessageId, msgEmail);
    FMessageSubject := msgEmail.Subject;
    FMessageFromName := msgEmail.From.Name;
    FMessageFromEmail := msgEmail.From.Address;
    FMessageDate := DateTimeToStr(msgEmail.Date);
    FMessageSize := popEmail.RetrieveMsgSize(FMessageId);
  end;

begin
  if Action = itStart then
  begin
    // Connect to the server, using the user name and password stored
    // in the session.
    if popEmail.Connected then
    begin
      try
        popEmail.Disconnect
      except
      end;
    end;
    popEmail.UserId := WebContext.Session.Values[cUserName];
    popEmail.Password := WebContext.Session.Values[cPassword];
    popEmail.Connect;
    // Find out the message count
    FMessageCount := popEmail.CheckMessages;
    FMessageId := 1;
    EOF := FMessageCount = 0;
  end
  else if Action = itNext then
  begin
    Inc(FMessageId);
    EOF := FMessageId > FMessageCount;
  end
  else
  begin
    EOF := True;
    popEmail.Disconnect;
  end;

  if not EOF then
    FillInMessageInfo;
end;

procedure TViewMailModule.WebPageModuleDeactivate(Sender: TObject);
begin
  try
    if popEmail.Connected then
      popEmail.Disconnect;
  except
  end;
end;

procedure TViewMailModule.MessageIdGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FMessageId;
end;

procedure TViewMailModule.MessageSubjectGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FMessageSubject;
end;

procedure TViewMailModule.MessageFromNameGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FMessageFromName;
end;

procedure TViewMailModule.MessageDateGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FMessageDate;
end;

procedure TViewMailModule.MessageFromEmailGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FMessageFromEmail;
end;

procedure TViewMailModule.MessageSizeGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FMessageSize;
end;

procedure TViewMailModule.MessageCountGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FMessageCount;
end;

procedure TViewMailModule.GetEmailGetParams(Sender: TObject;
  Params: TStrings);
begin
  Params.Values['id'] := IntToStr(FMessageId);
end;

procedure TViewMailModule.GetEmailExecute(Sender: TObject;
  Params: TStrings);
begin
  if (Params.Values['id'] <> '') and (WebContext.EndUser.LoggedIn) then
    DispatchPageName(EmailMessageModule.Name, Response, []);
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TViewMailModule, TWebPageInfo.Create([wpPublished, wpLoginRequired], '.html'), crOnDemand, caCache));

end.
