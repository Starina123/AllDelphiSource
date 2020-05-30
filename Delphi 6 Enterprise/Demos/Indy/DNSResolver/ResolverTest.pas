{***************************************************************
 *
 * Project  : Resolver
 * Unit Name: ResolverTest
 * Purpose  :
 * Version  : 1.0
 * Date  : Wed 25 Apr 2001  -  01:14:19
 * Author  : Ray Malone / Vladimir Vassiliev  <ray@mbssoftware.com  voldemarv@hotpop.com>
 * History  :
 * Tested  : Wed 25 Apr 2001  // Allen O'Neill <allen_oneill@hotmail.com>
 *
 ****************************************************************}

unit ResolverTest;

//------------------------------------------------------------------------------
// The setup data for the Resolver is stored in the regsistry
// It stores the port and  primary, secondary and tertiany dns servers.
//------------------------------------------------------------------------------
// The TDNResolver is us just a UPD Client containing a TDnsMessage.
// Its sole funciton is to connect disconect send and receive DNS messages.
// The DnsMessage ecodes and decodes DNS messages
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// A DNS Resolver sends a Dns Header and a DnsQuestion to a DNS server.
// Type DNS Header (tDNSHeader) is a component to store the header of
// a DNSResolver Query and Header DNS Server Response
// The ReEsolver sends the Server a header and the Sever returns it with various
// bits or values set.
//  The DNS Header Contains the following
// The Most significant are the Rcodes (Return Codes) if the Rcode is 0 the
// the server was able to complete the requested task. Otherwise it contains
// an error code for what when wrong. The RCodes are listed in the
// WinshoeDnsResolver.pas file.
//
// fQdCount is the number of entries in the request from a resolver to a server.
// fQdCount would normally be set to 1.
//
// fAnCount is set by the server to the number of answers to the query.
//
// fNsCount is the number of entries in the Name Server list
//
// fArCount is the number of additional records.
//
// TDNSHeader exposes all the fields of a header... even those only set by
// the server so it can be used to build a DNS server
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//  TDNS Question
//  A DNS Question contains three pieces of data
//  They are:
//  QName  : ShortString;
//  QType  : Word;
//  QClass : Word;
//
//  QName is either a domain name or an IP address.
//  The QType is the type of question
//  They are requests for
//  A  a Host Address
//  NS  Authoritative name server
//  MD  A mail destination obsolete use MX (OBSOLETE)
//  MF  A mail forwarder obsolete use MX  (OBSOLETE)
//  Name  The canonical name for an alias
//  SOA  Marks the start of a zone of authority
//  MB  A mail box domain name (Experimental)
//  MG  A mail group member (Experimental)
//  MR  A mail Rename Domain Name (Experimental)
//  NULL  RR (Experimental)
//  WKS  A well known service description
//  PTR  A Domain Name Pointer (IP Addr) is question Answer is Domain name
//  HINFO  Host Information;
//  MINFO  Mailbox or Mail List Information;
//  MX  Mail Exchange
//  TXT  Text String;
//  AXFR  A Request for the Transfer of an entire zone;
//  MAILB  A request for mailbox related records (MB MG OR MR}
//  MAILA  A request for mail agent RRs (Obsolete see MX)
//  Star  A Request for all Records '*'
//
//  Indy implements these requests by defining constant values.
//  The identifier is preceeded by the letter c to show its a constant value
//  ca = 1;
//  cns =2  etc.
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//  TDNS Response
//-----------------------------------------------------------------------------
// The total Data returned by server in response to a query is stored the
// following Record  structure.
// The Name, Type, and Class  were defines as Qname, Qtype, and QClass above
// TTL is a dateTime Dword to tell when the information expires. This is uses
// By resolvers to cache data to hold network traffic to a mimimum.
// The Winshoe DNS Resolvers does not implement a cache.
// RData if defined above
// StarData is of indefinate length. the '*' Query type is send me everything
// It is Defined as an RData Type but a pascal variant record can not store
// a type String so we made a Star data string;
//------------------------------------------------------------------------------
// DNS Servers return data in various forms. the TDnsMessage parses this data
// and puts it in structures depending on its aType as shown in the Const
// QType definitions above.
// Data Structures for the Responses to the various Qtypes are defined next.
// The data structures are named for the types of questions and responses (QType)
//
//------------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//
//Type
//  ptDNSResource = ^TDNSresource;
//  tDNSResource = Record
//  Name : ShortString;
//  aType : Word;
//  aClass : Word;
//  TTL  : DWord;
//  RdLength : Word;
//  RData : TRData;
//  StarData: String;
//  end;
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//
// The Returnd Data (RData) from a server in response to a query can be in
// several formats the following variant record is used to hold the returned
// data.
//-----------------------------------------------------------------------------
//  TRdata = Record
//  case Byte of
//  1 : (DomainName : ShortString);
//  2 : (HInfo : tHInfo);
//  3 : (MInfo : tMInfo);
//  4 : (MX : TMx);
//  5 : (SOA : TSOA);
//  6 : (A : DWord);
//  7 : (WKS : TWks);
//  8 : (Data : Array[0..4096] of Char);
//  9 : (HostAddrStr : ShortString);
//  end;
//
//
//  Type
//  tHInfo = Record
//  CPUStr : ShortString;
//  OsStr : ShortString;
//  end;
//
//
//  tMInfo = Record
//  RMailBox : ShortString;
//  EMailBox : ShortString;
//  end;
//
//
//  tMX = Record
//  Preference : Word;  { This is the priority of this server }
//  Exchange : ShortString; {this is the Domain name of the Mail Server }
//  end;
//
//
//  TSOA = Record
//  MName : ShortString;
//  RName : ShortString;
//  Serial : DWord;
//  Refresh : DWord;
//  ReTry : Dword;
//  Expire : Dword;
//  Minimum : DWord;
//  end;
//
//
//  TWKS = Record
//  Address : Dword;
//  Protocol : Byte;
//  Bits : Array[0..7] of Byte;
//  end;

//------------------------------------------------------------------------------
// Header, question, and response objects make up the DNS Message object.
// the TDNSQuestionList is used to hold both the send and received queries
// in easy to handle pascal data structures
// A Question Consists of a Name, Atype and aClass.
//  Name can be a domain name or an IP address depending on the type of
//  question. Question and answer types and Classes are given constant names
//  as defined in WinshoeDnsResolver.pas
//------------------------------------------------------------------------------
//
// The procedure CreateQueryPacket takes the Mesage header and questions and
// formats them in to a query packet for sending. When the Server responds
// with a reply packet the  procedure DecodeReplyPacket formats the reply into
// the proper response data structures depending on the type of reponse.
//------------------------------------------------------------------------------

interface

uses
{$IFDEF Linux}
   QGraphics,  QControls,  QForms,  QDialogs,  QStdCtrls,  QButtons,  QExtCtrls,
     QComCtrls,
{$ELSE}
   Graphics,  Controls,  Forms,  Dialogs,  StdCtrls,  Buttons,  ExtCtrls,  ComCtrls,
{$ENDIF}
  windows, messages,  SysUtils,  Classes, IdBaseComponent, IdComponent, IdUDPBase,
    IdUDPClient, IdDNSResolver,  IniFiles;

type
  TResolverForm = class(TForm)
    ConnectBtn: TBitBtn;
    Memo: TMemo;
    Edit1: TEdit;
    QueryTypeListBox: TListBox;
    Panel1: TPanel;
    SelectedQueryLabel: TPanel;
    DNSLabel: TPanel;
    StatusBar: TStatusBar;
    IdDNSResolver: TIdDNSResolver;
    EdDNS: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EdTimeOut: TEdit;
    Label3: TLabel;
    procedure ConnectBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QueryTypeListBoxClick(Sender: TObject);
    procedure EdTimeOutKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    InProgress: Boolean;
    aQueryType: Integer;
    procedure ShowQueryType;
    procedure DisplayResults;
  public
    { Public declarations }
  end;

var
  ResolverForm: TResolverForm;

implementation

{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

procedure TResolverForm.FormCreate(Sender: TObject);
var
  IniFile: TIniFile;
begin { FormCreate }
  IniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Resolve.ini');
  with IniFile do
  try
    EdDNS.Text := ReadString('Resolver', 'DNS', '');
    EdTimeOut.Text := IntToStr(ReadInteger('Resolver', 'TimeOut', 30000));
  finally
    Free;
  end;
  aQueryType := 1;
  QueryTypeListBox.ItemIndex := 0;
  ShowQueryType;
  StatusBar.SimpleText := 'Current Domain Name Server is :  ' +
    IdDnsResolver.Host;
end; { FormCreate }

procedure TResolverForm.ShowQueryType;
begin { ShowQueryType }
  with SelectedQueryLabel do
  begin
    Alignment := taCenter;
    Caption := 'Selected Query Type is ' + GetQTypeStr(aQueryType);
    Alignment := taCenter;
  end;
  if aQueryType = cPTR then
    DnsLabel.Caption := 'Enter IP Address'
  else
    DnsLabel.Caption := 'Enter Domain Name';
end; { ShowQueryType }

procedure TResolverForm.QueryTypeListBoxClick(Sender: TObject);
begin { QueryTypeListBoxClick }
  with QueryTypelistBox do
  begin
    if ItemIndex > -1 then
      aQueryType := Succ(ItemIndex);
    if aQueryType > 16 then
      aQueryType := aQueryType + 235;
    ShowQueryType;
  end;
end; { QueryTypeListBoxClick }

procedure TResolverForm.DisplayResults;
var
  DnsResource: TIdDNSResourceItem;
  Idx: Integer;
  procedure ShowaList;
    procedure ShowSoa;
    begin { ShowSoa }
      with DnsResource.Rdata.SOA do
      begin
        Memo.Lines.Add('Primary Data Src :  ' + MName);
        Memo.Lines.Add('Responsible Mailbox :  ' + Rname);
        Memo.Lines.Add('Serial : ' + IntToStr(Serial) + '  Refresh : ' +
          IntTostr(REfresh)
          + '  Retry : ' + IntTosTr(Retry));
        Memo.Lines.Add('Expire :  ' + IntTosTr(Expire) + '  Minimum : ' +
          IntToStr(Minimum));
      end;
    end; { ShowSoa }
  begin { ShowAList }
    Memo.Lines.Add('Resource name is :  ' + DnsResource.Name);
    Memo.Lines.Add('Type is :  ' + GetQTypeStr(DnsResource.aType) +
      '  Class is :  ' + GetQClassStr(DnsResource.AClass));
    case DnsResource.aType of
      cA: Memo.Lines.Add('IP Address is :  ' + DnsResource.Rdata.HostAddrStr
        {DomainName});
      cSoa: ShowSoa;
      cPtr: Memo.Lines.Add('Domain name is :  ' + DnsResource.Rdata.DomainName);
      cMx: Memo.Lines.Add('MX Priority :  ' +
        IntToStr(DnsResource.Rdata.MX.Preference)
          + '  MX Server :  ' + DNsResource.Rdata.MX.Exchange);
    else
      Memo.Lines.Add('Domain name is :  ' + DnsResource.Rdata.DomainName);
    end;
    Memo.Lines.Add('');
  end; { ShowAList }
begin { DisplayResults }
  Memo.Lines.Clear;
  with IdDNSResolver do
  begin
    if DnsAnList.Count > 0 then
    begin
      Memo.Lines.Add('Answer List' + #13 + #10);
      for Idx := 0 to DnsAnList.Count - 1 do
      begin
        DnsResource := DnsAnList[Idx];
        ShowAList;
      end;
    end;
    Memo.Lines.Add('');
    if DnsNsList.Count > 0 then
    begin
      Memo.Lines.Add('Authority List' + #13 + #10);
      for Idx := 0 to DnsNsList.Count - 1 do
      begin
        DnsResource := DnsNsList[Idx];
        ShowAList;
      end;
    end;
    Memo.Lines.Add('');
    if DnsArList.Count > 0 then
    begin
      Memo.Lines.Add('Additional Response List' + #13 + #10);
      for Idx := 0 to DnsArList.Count - 1 do
      begin
        DnsResource := DnsArList[Idx];
        ShowAList;
      end;
    end;
  end;
end; { DisplayResults }

procedure TResolverForm.ConnectBtnClick(Sender: TObject);
begin { ConnectBtnClick }
  if InProgress then
    Exit;
  InProgress := True;
  try
    Memo.Clear;
    IdDnsResolver.Host := EdDNS.Text;
    IdDnsResolver.ReceiveTimeout := StrToInt(EdTimeOut.Text);
    StatusBar.SimpleText := 'Current Domain Name Server is :  ' +
      IdDnsResolver.Host;
    IdDnsResolver.ClearVars;
    with IdDnsREsolver.DNSHeader do
    begin
      //  InitVars;  { It's not neccessary because this call is in ClearVars}
      //  ID := Id +1;  { Resolver/Server coordination Set to Random num on Create then inc'd }
      Qr := False; { False is a query; True is a response}
      Opcode := 0;
        { 0 is Query 1 is Iquery Iquery is send IP return <domainname>}
      RD := True; { Request Recursive search}
      QDCount := 1; { Just one Question }
    end;
    IdDnsREsolver.DNSQDList.Clear;
    with IdDnsREsolver.DNSQDList.Add do {And the Question is ?}
    begin
      if Length(Edit1.Text) = 0 then
      begin
        if aQueryType = cPTR then
          Qname := '209.239.140.2'
        else
          QName := 'mbssoftware.com';
      end
      else
        QName := Edit1.Text;
      QType := aQueryType;
      QClass := cIN;
    end;
    IdDNSResolver.ResolveDNS;
    DisplayResults;
  finally
    InProgress := False;
  end;
end; { ConnectBtnClick }

procedure TResolverForm.EdTimeOutKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', '-', #8]) then
  begin
    Key := #0;
    Beep;
  end;
end;

procedure TResolverForm.FormDestroy(Sender: TObject);
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Resolve.ini');
  with IniFile do
  try
    WriteString('Resolver', 'DNS', EdDNS.Text);
    WriteInteger('Resolver', 'TimeOut', StrToInt(EdTimeOut.Text));
  finally
    Free;
  end;
end;

end.

