{***************************************************************
 *
 * Project  : MapsDemo
 * Unit Name: mapsMain
 * Purpose  : Demonstrates checking domain against "Mail Abuse Prevention System"
 * Version  : 1.0
 * Date  : Wed 25 Apr 2001  -  01:29:36
 * Author  : <unknown>
 * History  :
 * Tested  : Wed 25 Apr 2001  // Allen O'Neill <allen_oneill@hotmail.com>
 *
 ****************************************************************}

 (*
 MAPS - Mail Abuse Prevention System  http://mail-abuse.org/
 RBL - Realtime Blackhole List
 DUL - Dial-up User List
 RSS - Relay Spam Stopper
 ORBS - Open Relay Behaviour-modification System  http://www.orbs.org/

Here are some site that you can test with - they are known spammers

209.132.59.86
209.211.253.248
160.79.241.223  ; internetsales.net (UU.NET/9netave.com)
198.30.222.8  ; intouch2001.com (OAR.NET/oar.net)
199.93.70.41  ; yug.com (BBNPLANET.COM/burlee.com)
200.38.11.82  ; bulk-email-company.com (TELNOR.COM/telnor.com)
200.49.75.17  ; bulklist.com (METRORED.COM.AR/metrored.com.ar)
204.213.85.162  ; webmole.com (SPRINTLINK.NET/oltronics.net)
204.83.230.164  ; apex-pi.com (SPRINTLINK.NET/sasktel.sk.ca)
205.147.234.77  ; bizzmaker.com (FAST.NET/fast.net)
205.238.206.132  ; realcybersex.com (EPIX.NET/datamg.com)
206.67.55.130  ; internetmarketers.net (UU.NET/media3.net)
206.67.58.127  ; emailtools.net (UU.NET/media3.net)
206.67.63.41  ; emailtools.com (UU.NET/media3.net)
207.180.29.196  ; kingcard.com (ICI.NET/ici.net)
207.198.74.82  ; bulkemail.cc (NETLIMITED.NET/netservers.net)
207.213.224.154  ; archmarketing.com (PBI.NET/ahnet.net)
207.23.186.230  ; market-2-sales.com (BC.NET/junction.net)
207.87.193.201  ; bulk-email-mailer.com (QWEST.NET/conninc.com)
208.135.196.4  ; outboundusa.com (CW.NET/cw.net)
208.161.191.177  ; americaint.com (CW.NET/y2kisp.com)
208.171.120.18  ; emailemailemail.com (CW.NET/digihost.com)
208.171.120.87  ; moneyfun.com (CW.NET/digihost.com)
208.178.185.81  ; ezonetrade.com (GBLX.NET/directnic.com)
208.221.168.112  ; rlyeh.com (UU.NET/dynatek.net)
208.234.13.9  ; w3-lightspeed.com (UU.NET/aitcom.net)
208.234.15.37  ; webmasterszone.net (UU.NET/aitcom.net)
208.234.16.236  ; websitesint.com/ (UU.NET/aitcom.net)
208.234.29.141  ; 4uservers.com (UU.NET/aitcom.net)
208.234.4.123  ; cyberlink1.com (UU.NET/aitcom.net)

 *)

unit mapsMain;

interface

uses
  {$IFDEF Linux}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls,
  {$ELSE}
  windows, messages, graphics, controls, forms, dialogs, stdctrls,
  {$ENDIF}
  SysUtils, Classes, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient,
  IdDNSResolver;

type
  TForm1 = class(TForm)
  btnCheckIP: TButton;
  cboList: TComboBox;
  IdDNSResolver1: TIdDNSResolver;
  Label1: TLabel;
  Memo1: TMemo;
  Memo2: TMemo;
  txtDNSServer: TEdit;
  Label2: TLabel;
  Label3: TLabel;
  procedure btnCheckIPClick(Sender: TObject);
  procedure FormCreate(Sender: TObject);
  procedure FillCombo;
  private
  { Private declarations }
  procedure Check_ORBS;
  procedure Check_RSS;
  procedure Check_DUL;
  procedure Check_RBL;
  public
  { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}
uses  IdGlobal;

const
//  stMAPS_DNS = 'smtp.wvnet.edu';
//  stMAPS_DNS = 'blackholes.mail-abuse.org';
  stRBL = '.rbl.maps.vix.com';
  stDUL = '.dul.maps.vix.com';
  stRSS = '.relays.mail-abuse.org';
  stORBS = '.relays.orbs.org';

function ReverseIPAddress(IPAddress: string): string;
var Part1, Part2, Part3, Part4: string;
begin
  Part1 := Fetch(IPAddress, '.');
  Part2 := Fetch(IPAddress, '.');
  Part3 := Fetch(IPAddress, '.');
  Part4 := Fetch(IPAddress);
  Result := Part4 + '.' + Part3 + '.' + Part2 + '.' + Part1;
end;

procedure TForm1.Check_RBL;
var idx: Integer;
begin
  IdDNSResolver1.RequestedRecords := [cA];
  try
  {MAPS RBL - Real Time Blackhole list}
  IdDNSResolver1.ResolveDomain(ReverseIPAddress(cboList.Text) + stRBL);
  for idx := 0 to Pred(IdDNSResolver1.Answers.Count) do
  begin
  try
  if IdDNSResolver1.DNSAnList[idx].AType = cA then
  begin
//  Memo1.Lines.Add(IdDNSResolver1.DNSAnList[idx].RData.DomainName + ' is in the MAPS RBL');
  Memo1.Lines.Add(cboList.Text + ' is in the MAPS RBL');
  end;
  except
  end;
  end;
  {Now get a helpful bounce message}
  IdDNSResolver1.RequestedRecords := [cTXT];
  try
  IdDNSResolver1.ResolveDomain(ReverseIPAddress(cboList.Text) + stRBL {'.rbl.maps.vix.com'});
  for idx := 0 to Pred(IdDNSResolver1.DNSAnList.Count) do
  begin
  try
  if IdDNSResolver1.DNSAnList[idx].AType = cTXT then
  begin
  Memo1.Lines.Add('Bounce Message: ' + IdDNSResolver1.DNSAnList[idx].StarData);
  end;
  except
  end;
  end;
  finally
  end;
  except
  Memo1.Lines.Add('Not in MAPS RBL');
  end;
end;

procedure TForm1.Check_DUL;
var idx: Integer;
begin
  IdDNSResolver1.RequestedRecords := [cA];
  try
  {MAPS DUL - Dial-Up User List}
  IdDNSResolver1.ResolveDomain(ReverseIPAddress(cboList.Text) + stDUL);
  for idx := 0 to Pred(IdDNSResolver1.Answers.Count) do
  begin
  try
  if IdDNSResolver1.DNSAnList[idx].AType = cA then
  begin
//  Memo1.Lines.Add(IdDNSResolver1.DNSAnList[idx].RData.DomainName + ' is in the MAPS DUL');
  Memo1.Lines.Add(cboList.Text + ' is in the MAPS DUL');
  end;
  except
  end;
  end;
  {Now get a helpful bounce message}
  IdDNSResolver1.RequestedRecords := [cTXT];
  try
  IdDNSResolver1.ResolveDomain(ReverseIPAddress(cboList.Text) + stDUL);
  for idx := 0 to Pred(IdDNSResolver1.Answers.Count) do
  begin
  try
  if IdDNSResolver1.DNSAnList[idx].AType = cTXT then
  begin
  Memo1.Lines.Add('Bounce Message: ' + IdDNSResolver1.DNSAnList[idx].StarData);
  end;
  except
  end;
  end;
  finally
  end;
  except
  Memo1.Lines.Add('Not in MAPS DUL');
  end;
end;

procedure TForm1.Check_RSS;
var idx: Integer;
begin
  IdDNSResolver1.RequestedRecords := [cA];
  try
  {MAPS RSS - Relay Spam Stopper}
  IdDNSResolver1.ResolveDomain(cboList.Text + stRSS);
  for idx := 0 to Pred(IdDNSResolver1.Answers.Count) do
  begin
  try
  if IdDNSResolver1.DNSAnList[idx].AType = cA then
  begin
//  Memo1.Lines.Add(IdDNSResolver1.DNSAnList[idx].RData.DomainName + ' is in the MAPS RRS');
  Memo1.Lines.Add(cboList.Text + ' is in the MAPS RRS');
  end;
  except
  end;
  end;
  IdDNSResolver1.RequestedRecords := [cTXT];
  try
  IdDNSResolver1.ResolveDomain(cboList.Text + stRSS);
  for idx := 0 to Pred(IdDNSResolver1.Answers.Count) do
  begin
  try
  if IdDNSResolver1.DNSAnList[idx].AType = cTXT then
  begin
//  Memo1.Lines.Add(IdDNSResolver1.DNSAnList[idx].StarData + ' is in the MAPS RBL');
  Memo1.Lines.Add(cboList.Text + ' is in the MAPS RBL');
  end;
  except
  end;
  end;
  finally
  end;
  except
  Memo1.Lines.Add('Not in MAPS RSS');
  end;
end;

procedure TForm1.Check_ORBS;
var idx: Integer;
begin
  IdDNSResolver1.RequestedRecords := [cA];
  try
  {ORBS http://www.orbs.org}
  IdDNSResolver1.ResolveDomain(ReverseIPAddress(cboList.Text) + stORBS);
  for idx := 0 to Pred(IdDNSResolver1.Answers.Count) do
  begin
  try
  if IdDNSResolver1.DNSAnList[idx].AType = cA then
  begin
  Memo1.Lines.Add(cboList.Text + ' is in ORBS');
  end;
  except
  end;
  end;
  except
  Memo1.Lines.Add('Not in ORBS');
  end;
end;

procedure TForm1.btnCheckIPClick(Sender: TObject);
begin
  Memo1.Clear;
  if (cboList.Text = '') then exit;
  application.processmessages;
  IdDNSResolver1.ClearVars;
  IdDNSResolver1.Host := txtDNSServer.text;

  Memo1.Lines.Add('Checking ' + cboList.Text);
  Check_RBL;
  Check_DUL;
  Check_RSS;
  Check_ORBS;
  Memo1.Lines.Add('------- finished -------');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FillCombo;
end;

procedure TForm1.FillCombo;
begin
  with cboList do
  begin
  clear;
  items.add('127.0.0.2'); //test  RBL, ORBS
  items.add('127.0.0.3'); //test  DUL
  items.add('209.132.59.86'); //RBL
  items.add('209.211.253.248'); //RBL ORBS
  items.add('160.79.241.223'); //RBL
  items.add('198.30.222.8'); //in nothing
  items.add('205.147.234.77'); //ORBS
  items.add('206.67.55.130'); //RBL
  items.add('206.67.58.127'); //RBL
  text := '127.0.0.2';
  end;
end;

end.

