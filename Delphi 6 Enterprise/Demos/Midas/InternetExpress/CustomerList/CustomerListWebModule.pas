(*
  InternetExpress Example.

  The default page displays a customer list.
  Clicking on a link displays a master detail form.
  The master detail page has a link that
  returns to the customer list. This link is only
  executed after asking the user if pending updates can
  be discarded.

  Demonstrates:

  TWebModule.Actions
  TMidasPageProducer
  TDataForm
  TFieldGroup
  TDataGrid
  TDataNavigator
  Styles and StyleSheets
  Customizing TMidasPageProducer.HTMLDoc
    Custom tags
    Custom Java Script
  TXMLBroker.Params.AssignStrings
  Use of IScriptProducer, IScriptManager


*)
unit CustomerListWebModule;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, MidItems, XMLBrokr,
  CompProd, PagItems, MidProd, Db, DBClient, MConnect, WebComp, HTTPProd, MidComp;

type
  TWebModule1 = class(TWebModule)
    DCOMConnection1: TDCOMConnection;
    CustList: TMidasPageProducer;
    XMLBroker1: TXMLBroker;
    Data: TMidasPageProducer;
    DataForm1: TDataForm;
    FieldGroup1: TFieldGroup;
    DataNavigator1: TDataNavigator;
    OrderNo: TFieldText;
    SaleDate: TFieldText;
    ShipDate: TFieldText;
    DataGrid1: TDataGrid;
    DataNavigator2: TDataNavigator;
    ItemNo: TTextColumn;
    PartNo: TTextColumn;
    Qty: TTextColumn;
    Discount: TTextColumn;
    StatusColumn1: TStatusColumn;
    OrderNo2: TTextColumn;
    ItemsTotal: TFieldText;
    AmountPaid: TFieldText;
    CustNames: TClientDataSet;
    ReconcileError: TMidasPageProducer;
    procedure DataHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure CustListHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
    procedure XMLBroker1RequestRecords(Sender: TObject;
      Request: TWebRequest; out RecCount: Integer;
      var OwnerData: OleVariant; var Records: String);
    procedure DataBeforeGetContent(Sender: TObject);
    procedure ReconcileErrorHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
  private
    procedure AddScript(Data: Pointer;
      AddScriptElements: IAddScriptElements);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;

implementation

uses Variants;

{$R *.dfm}

procedure TWebModule1.DataHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
var
  CustNo: Integer;
begin
  // See the HTMDoc property for location of tags.
  if TagString = 'HREFCUSTLIST' then
  begin
    // provide value for <A HREF= to return to customer list
    ReplaceText := Request.ScriptName;
    // Note that the HTMLDoc property has an onclick handler
    // to prevent this HREF from being followed if there are
    // pending updates.
  end
  else if TagString = 'CUSTOMER' then
  begin
    // HTML describing customer
    if XMLBroker1.Params.Count = 0 then
      XMLBroker1.FetchParams;
    CustNo := XMLBroker1.Params[0].AsInteger;
    CustNames.Active := True;
    CustNames.Locate('CustNo', VarArrayOf([CustNo]), []);
    ReplaceText :=
      Format('<H1>Customer Number: %d</H1>' +
              '<H1>Customer Name: %s</H1>',
        [CustNo,
         CustNames.FieldByName('Company').AsString]);
  end;
end;

procedure TWebModule1.CustListHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
var
  CompanyField, CustNoField: TField;
begin
  // See the HTMDoc property for location of tags

  // Generate list of customer HREFS.  XMLBroker1 will
  // use the Name/Value pairs to set Params.
  if TagString = 'CUSTOMERLIST' then
  begin
    CompanyField := CustNames.FieldByName('Company');
    CustNoField := CustNames.FieldByName('CustNo');
    CustNames.Open;
    while not CustNames.Eof do
    begin
      ReplaceText := Format('%s<A HREF="%s/Data?CustNo=%d">%s</A><BR>'#13#10,
        [ReplaceText, Request.ScriptName, CustNoField.AsInteger, CompanyField.AsString]);
      CustNames.Next;
    end;
  end;
end;

procedure TWebModule1.XMLBroker1RequestRecords(Sender: TObject;
  Request: TWebRequest; out RecCount: Integer; var OwnerData: OleVariant;
  var Records: String);
begin
  // Set params using name/value pairs in URL
  XMLBroker1.Params.AssignStrings(Request.QueryFields);
end;

// Add a JavaScript method to check for pending updates.
procedure TWebModule1.AddScript(Data: Pointer; AddScriptElements: IAddScriptElements);
begin
  with AddScriptElements.ScriptManager do
  if XMLDocuments.Count > 0 then
    with XMLDocuments.Items[0] do
    if RowSets.Count > 0 then
      with RowSets.Items[0] do
      AddScriptElements.AddFunction('CheckData',
        Format(
       'function CheckData()'#13#10 +
       '{'#13#10 +
       '  if ((%0:s.forcepost() != 0) ||'#13#10 +
       '    (%0:s.DeltaChanges.row.length >0))'#13#10 +
       '  {'#13#10 +
       '     return confirm("Data has been changed.  Discard changes?");'#13#10 +
       '  };'#13#10 +
       '};'#13#10, [RowSetVarName]));
end;

procedure TWebModule1.DataBeforeGetContent(Sender: TObject);
var
  ScriptProducer: IScriptProducer;
begin
  if Data.GetInterface(IScriptProducer, ScriptProducer) then
    ScriptProducer.ScriptManager.AddElementsIntf.AddPass(AddScript, nil);
end;

procedure TWebModule1.ReconcileErrorHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  // See the HTMDoc property for location of tags.
  if TagString = 'HREFCUSTLIST' then
  begin
    // provide value for <A HREF= to return to customer list
    ReplaceText := Request.ScriptName;
  end
  else if TagString = 'REDIRECT' then
  begin
    // Get redirect value send with delta packet.
    ReplaceText := Request.ContentFields.Values[SRedirect];
  end;

end;

end.
