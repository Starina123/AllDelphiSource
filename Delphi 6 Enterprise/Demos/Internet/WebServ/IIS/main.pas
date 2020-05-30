unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  HTTPApp, DBWeb, DBTables, Db, DSProd, HTTPProd, DBBdeWeb;

type
  TCustomerInfoModule = class(TWebModule)
    Query1: TQuery;
    CustomerOrders: TQueryTableProducer;
    CustomerList: TPageProducer;
    Customer: TTable;
    CustomerCustNo: TFloatField;
    CustomerCompany: TStringField;
    BioLife: TTable;
    BioLifeSpeciesNo: TFloatField;
    BioLifeCategory: TStringField;
    BioLifeCommon_Name: TStringField;
    BioLifeSpeciesName: TStringField;
    BioLifeLengthcm: TFloatField;
    BioLifeLength_In: TFloatField;
    BioLifeNotes: TMemoField;
    BioLifeGraphic: TGraphicField;
    Root: TPageProducer;
    EmployeeList: TDataSetTableProducer;
    Employee: TTable;
    BioLifeProducer: TDataSetPageProducer;
    procedure CustomerListHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure DataModule1Create(Sender: TObject);
    procedure WebModule1QueryActionAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure CustomerInfoModuleRedirectAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure BioLifeGraphicGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure CustomerInfoModuleGetImageAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure BioLifeNotesGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure RootHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure EmployeeListFormatCell(Sender: TObject; CellRow,
      CellColumn: Integer; var BgColor: THTMLBgColor;
      var Align: THTMLAlign; var VAlign: THTMLVAlign; var CustomAttrs,
      CellData: String);
    procedure CustomerInfoModuleBioLifeAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    ScriptName: String;
  public
    { Public declarations }
  end;

var
  CustomerInfoModule: TCustomerInfoModule;

implementation

uses JPeg;

{$R *.dfm}

procedure TCustomerInfoModule.DataModule1Create(Sender: TObject);
var
  FN: array[0..MAX_PATH- 1] of char;
begin
  SetString(ScriptName, FN, GetModuleFileName(hInstance, FN, SizeOf(FN)));
  ScriptName := ExtractFileName(ScriptName);
end;

procedure TCustomerInfoModule.CustomerListHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
var
  Customers: String;
begin
  Customers := '';
  if CompareText(TagString, 'CUSTLIST') = 0 then
  begin
    Customer.Open;
    try
      while not Customer.Eof do
      begin
        Customers := Customers + Format('<A HREF="/scripts/%s/runquery?CustNo=%d">%s</A><BR>',
          [ScriptName, CustomerCustNo.AsInteger, CustomerCompany.AsString]);
        Customer.Next;
      end;
    finally
      Customer.Close;
    end;
  end;
  ReplaceText := Customers;
end;

procedure TCustomerInfoModule.WebModule1QueryActionAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Customer.Open;
  try
    if Customer.Locate('CustNo', Request.QueryFields.Values['CustNo'], []) then
    begin
      CustomerOrders.Header.Clear;
      CustomerOrders.Header.Add('The following table was produced using a TQueryTableProducer.<P>');
      CustomerOrders.Header.Add('Orders for: ' + CustomerCompany.AsString);
      Response.Content := CustomerOrders.Content;
    end
    else
      Response.Content := Format('<html><body><b>Customer: %s not found</b></body></html>',
        [Request.QueryFields.Values['CustNo']]);
  finally
    Customer.Close;
  end;
end;

procedure TCustomerInfoModule.EmployeeListFormatCell(Sender: TObject;
  CellRow, CellColumn: Integer; var BgColor: THTMLBgColor;
  var Align: THTMLAlign; var VAlign: THTMLVAlign; var CustomAttrs,
  CellData: String);
begin
  if CellRow = 0 then BgColor := 'Gray'
  else if CellRow mod 2 = 0 then BgColor := 'Silver';
end;

procedure TCustomerInfoModule.CustomerInfoModuleBioLifeAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  Biolife.Open;
  try
    Response.Content := BiolifeProducer.Content;
  finally
    Biolife.Close;
  end;
end;

procedure TCustomerInfoModule.BioLifeGraphicGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := Format('<IMG SRC="/scripts/%s/getimage" alt="[%s]" border="0">',
    [ScriptName, BiolifeCommon_Name.Text]);
end;

procedure TCustomerInfoModule.BioLifeNotesGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := Sender.AsString;
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

procedure TCustomerInfoModule.CustomerInfoModuleRedirectAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  Response.SendRedirect('http://www.borland.com');
end;

procedure TCustomerInfoModule.RootHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  if TagString = 'MODULENAME' then
    ReplaceText := ScriptName;

  if TagString = 'VISITCOUNT' then
    with Response.Cookies.Add do
    begin
      Name := 'TheCookie';
      Value :=  Request.CookieFields.Values['TheCookie'];
      if Value = '' then Value := '0';
      try
        Value := IntToStr(StrToInt(Value) + 1);
      except
        Value := '1';
      end;
      Expires := Now + 1;  // this cookie expires in one day
      ReplaceText := Value;
    end;
end;

end.

