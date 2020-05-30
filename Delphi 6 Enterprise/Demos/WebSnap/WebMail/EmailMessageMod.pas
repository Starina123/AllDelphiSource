
unit EmailMessageMod;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  WebAdapt, WebComp;

type
  TEmailMessageModule = class(TWebPageModule)
    PageProducer: TPageProducer;
    EmailMessage: TAdapter;
    MessageId: TAdapterField;
    MessageFromName: TAdapterField;
    MessageFromEmail: TAdapterField;
    MessageSubject: TAdapterField;
    MessageDate: TAdapterField;
    MessageBody: TAdapterField;
    StartMessage: TAdapterField;
    procedure StartMessageGetValue(Sender: TObject; var Value: Variant);
    procedure MessageIdGetValue(Sender: TObject; var Value: Variant);
    procedure MessageFromNameGetValue(Sender: TObject; var Value: Variant);
    procedure MessageFromEmailGetValue(Sender: TObject;
      var Value: Variant);
    procedure MessageSubjectGetValue(Sender: TObject; var Value: Variant);
    procedure MessageDateGetValue(Sender: TObject; var Value: Variant);
    procedure MessageBodyGetValue(Sender: TObject; var Value: Variant);
  private
    { Private declarations }
    FMessageId: Integer;
    FMessageSubject: string;
    FMessageFromName: string;
    FMessageFromEmail: string;
    FMessageDate: string;
    FMessageBody: string;
  public
    { Public declarations }
  end;

  function EmailMessageModule: TEmailMessageModule;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants, ViewMailMod, IdEMailAddress;

function EmailMessageModule: TEmailMessageModule;
begin
  Result := TEmailMessageModule(WebContext.FindModuleClass(TEmailMessageModule));
end;

procedure TEmailMessageModule.StartMessageGetValue(Sender: TObject;
  var Value: Variant);
begin
  try
    if Request.QueryFields.Values['id'] <> '' then
    begin
      FMessageId := StrToInt(Request.QueryFields.Values['id']);

      with ViewMailModule do
      begin
        if popEmail.Connected then
        try
          popEmail.Disconnect;
        except
        end;
        popEmail.UserId := WebContext.Session.Values[cUserName];
        popEmail.Password := WebContext.Session.Values[cPassword];
        popEmail.Connect;
        try
          msgEmail.Clear;
          msgEmail.NoDecode := True;
          popEmail.Retrieve(FMessageId, msgEmail);

          FMessageSubject := msgEmail.Subject;
          FMessageFromName := msgEmail.From.Name;
          FMessageFromEmail := msgEmail.From.Address;
          FMessageDate := DateTimeToStr(msgEmail.Date);
          FMessageBody := msgEmail.Body.Text;

          Value := True;
        finally
          try
            popEmail.Disconnect;
          except
          end
        end;
      end;
    end
    else
      raise Exception.Create('No valid message id passed to the EmailMessageModule');
  except
    on E: Exception do
    begin
      Value := False; // Failure
      EmailMessage.Errors.AddError(E);
    end;
  end;
end;

procedure TEmailMessageModule.MessageIdGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FMessageId;
end;

procedure TEmailMessageModule.MessageFromNameGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FMessageFromName;
end;

procedure TEmailMessageModule.MessageFromEmailGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FMessageFromEmail; 
end;

procedure TEmailMessageModule.MessageSubjectGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FMessageSubject; 
end;

procedure TEmailMessageModule.MessageDateGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FMessageDate;  
end;

procedure TEmailMessageModule.MessageBodyGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FMessageBody;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TEmailMessageModule, TWebPageInfo.Create([{wpPublished} {wpLoginRequired}], '.html'), crOnDemand, caCache));

end.

