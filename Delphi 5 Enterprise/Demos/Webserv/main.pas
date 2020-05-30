unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  HTTPApp, DBWeb, DBTables, Db, DSProd;

type
  TCustomerInfoModule = class(TWebModule)
    Query1: TQuery;
    CustomerOrders: TQueryTableProducer;
    CustomerList: TPageProducer;
    Customer: TTable;
    CustomerCustNo: TFloatField;
    CustomerCompany: TStringField;
    CustSource: TDataSource;
    BioLife: TTable;
    BioLifeProducer: TDataSetPageProducer;
    BioLifeSpeciesNo: TFloatField;
    BioLifeCategory: TStringField;
    BioLifeCommon_Name: TStringField;
    BioLifeSpeciesName: TStringField;
    BioLifeLengthcm: TFloatField;
    BioLifeLength_In: TFloatField;
    BioLifeNotes: TMemoField;
    BioLifeGraphic: TGraphicField;
    Root: TPageProducer;
    procedure CustomerListHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure DataModule1Create(Sender: TObject);
    procedure WebModule1CustomerListAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1QueryActionAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure CustomerInfoModuleRedirectAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure BioLifeGraphicGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure CustomerInfoModuleGetImageAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure CustomerInfoModuleBioLifeAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure BioLifeNotesGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure CustomerInfoModulerootAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure RootHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
  private
    ScriptName: String;
  public
    { Public declarations }
  end;

var
  CustomerInfoModule: TCustomerInfoModule;

implementation

uses JPeg;

{$R *.DFM}

procedure TCustomerInfoModule.CustomerListHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
var
  Customers: String;
begin
  if CompareText(TagString, 'CUSTLIST') = 0 then
  begin
    Customers := '';
    Customer.First;
    while not Customer.Eof do
    begin
      Customers := Customers + Format('<A HREF="/scripts/%s/runquery?CustNo=%d">%s</A><BR>',
        [ScriptName, CustomerCustNo.AsInteger, CustomerCompany.AsString]);
      Customer.Next;
    end;
  end;
  ReplaceText := Customers;
end;

procedure TCustomerInfoModule.DataModule1Create(Sender: TObject);
var
  FN: array[0..MAX_PATH- 1] of char;
begin
  Customer.Open;
  BioLife.Open;
  SetString(ScriptName, FN, GetModuleFileName(hInstance, FN, SizeOf(FN)));
  ScriptName := ExtractFileName(ScriptName);
end;

procedure TCustomerInfoModule.WebModule1CustomerListAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := CustomerList.Content;
end;

procedure TCustomerInfoModule.WebModule1QueryActionAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if Customer.Locate('CustNo', Request.QueryFields.Values['CustNo'], []) then
  begin
    CustomerOrders.Header.Clear;
    CustomerOrders.Header.Add('The following table was produced using a TDatasetTableProducer.<P>');    
    CustomerOrders.Header.Add('Orders for: ' + CustomerCompany.AsString);
    Response.Content := CustomerOrders.Content;
  end
  else
    Response.Content := Format('<html><body><b>Customer: %s not found</b></body></html>',
      [Request.QueryFields.Values['CustNo']]);
end;

procedure TCustomerInfoModule.CustomerInfoModuleRedirectAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  Response.SendRedirect('http://www.borland.com');
end;

procedure TCustomerInfoModule.BioLifeGraphicGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := Format('<IMG SRC="/scripts/%s/getimage" alt="[%s]" border="0">',
    [ScriptName, BiolifeCommon_Name.Text]);
end;

procedure TCustomerInfoModule.CustomerInfoModuleGetImageAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  Jpg: TJpegImage;
  S: TMemoryStream;
  B: TBitmap;
begin
  Jpg := TJpegImage.Create;
  try
    B := TBitmap.Create;
    try
      B.Assign(BioLifeGraphic);
      Jpg.Assign(B);
    finally
      B.Free;
    end;
    S := TMemoryStream.Create;
    Jpg.SaveToStream(S);
    S.Position := 0;
    Response.ContentType := 'image/jpeg';
    Response.ContentStream := S; // do not free the stream because the response
                                 // object will handle that task.
  finally
    Jpg.Free;
  end;
end;

procedure TCustomerInfoModule.CustomerInfoModuleBioLifeAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  Response.Content := BioLifeProducer.Content;
end;

procedure TCustomerInfoModule.BioLifeNotesGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := Sender.AsString;
end;

procedure TCustomerInfoModule.CustomerInfoModulerootAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := Root.Content;
end;

procedure TCustomerInfoModule.RootHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  if TagString = 'MODULENAME' then
    ReplaceText := ScriptName;
end;

end.
