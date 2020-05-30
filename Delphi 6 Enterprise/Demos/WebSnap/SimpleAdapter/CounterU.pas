unit CounterU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, HTTPProd, SiteProd,
  WebAdapt, WebComp, WebModu;

type
  TCounter = class(TWebPageModule)
    Adapter: TAdapter;
    Count: TAdapterField;
    Increment: TAdapterAction;
    Dec: TAdapterAction;
    PageProducer: TPageProducer;
    Arg1: TAdapterField;
    Add: TAdapterAction;
    Subtract: TAdapterAction;
    procedure GetParams(Sender: TObject; Params: TStrings);
    procedure PageProducerModuleActivate(Sender: TObject);
    procedure IncrementExecute(Sender: TObject; Params: TStrings);
    procedure CountGetValue(Sender: TObject; var Value: Variant);
    procedure DecExecute(Sender: TObject; Params: TStrings);
    procedure Arg1Execute(Sender: TObject; Params: TStrings);
    procedure Arg1GetValue(Sender: TObject; var Value: Variant);
  private
    FCount: Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

  function Counter: TCounter;

implementation

{$R *.dfm} {*.html}

uses WebReq, WebCntxt, WebFact, SiteComp, AdaptReq;

function Counter: TCounter;
begin
  Result := TCounter(WebContext.FindModuleClass(TCounter));
end;

procedure TCounter.GetParams(Sender: TObject;
  Params: TStrings);
begin
  Params.Add(Format('Count=%d', [FCount]));
end;

procedure TCounter.PageProducerModuleActivate(Sender: TObject);
begin
  // Initialize data
  FCount := 0;
end;

procedure TCounter.IncrementExecute(Sender: TObject;
  Params: TStrings);
begin
  // Retrieve last value
  FCount := StrToInt(Params.Values['Count']);
  Inc(FCount);
end;

procedure TCounter.CountGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := FCount;
end;

procedure TCounter.DecExecute(Sender: TObject; Params: TStrings);
begin
  FCount := StrToInt(Params.Values['Count']);
  FCount := FCount - 1;
end;

procedure TCounter.Arg1Execute(Sender: TObject; Params: TStrings);
var
  Value: IActionFieldValue;
begin
  FCount := StrToInt(Params.Values['Count']);
  Value := Arg1.ActionValue;
  if Assigned(Value) then
    try
      if Value.ValueCount > 1 then
        raise Exception.Create('Multiple values not supported')
      else
        if Sender = Add then
          FCount := FCount + Value.Values[0]
        else if Sender = Subtract then
          FCount := FCount - Value.Values[0]
        else
          Assert(False);
    except
      on E: Exception do
        Adapter.Errors.AddError(E);
    end;
end;


procedure TCounter.Arg1GetValue(Sender: TObject; var Value: Variant);
begin
  // Echo last value
  if Arg1.ActionValue <> nil then
    Value := Arg1.ActionValue.Values[0]

end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TCounter, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
