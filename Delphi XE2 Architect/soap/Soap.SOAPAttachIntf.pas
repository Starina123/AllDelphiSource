{*******************************************************}
{                                                       }
{                Delphi Runtime Library                 }
{         SOAP Attachment Interfaces                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}
unit Soap.SOAPAttachIntf;

interface

uses System.Classes, Soap.InvokeRegistry;

type

  TSoapDataList = class(TList)
  public
    procedure Clear; override;
    function Add(Item: Pointer): Integer; reintroduce;
    procedure Assign(ListA: TList; AOperator: TListAssignOp = laCopy;
                     ListB: TList = Nil); reintroduce;
    procedure Insert(Index: Integer; aClass: TClass); reintroduce;
    function Remove(aClass: TClass): Integer; reintroduce;
  end;

  TOnSendAttachmentEvent = procedure(AttachmentStream: TStream; Attachment: TSOAPAttachment) of object;
  TOnGetAttachmentEvent = procedure(AttachmentStream: TStream; Attachment: TSOAPAttachment) of object;

  IMimeAttachmentHandler = interface
  ['{6B742425-FE6A-4EC2-ACF9-4751AF4E0EF8}']
  procedure ProcessMultiPartForm(const ASourceStream, ADestStream: TStream;
                                 const AMimeBoundary: AnsiString;
                                 SoapHeaders: TStrings;
                                 Attachments: TSoapDataList;
                                 const TempDir: string);

    { Add a new Soap Header  }
    procedure AddSoapHeader(Value: string);
    procedure CreateMimeStream(Envelope: TStream; Attachments: TSoapDataList);
    { combine MimeBoundary, Soap Headers and Envelope, and Attachments into single Stream }
    procedure FinalizeStream;

    function  GetMIMEStream(Release: Boolean = False): TStream;
    function  GetMIMEBoundary: AnsiString;
    procedure SetMIMEBoundary(const MimeBndry: AnsiString);
    function  GetOnSendAttachmentEvent: TOnSendAttachmentEvent;
    procedure SetOnSendAttachmentEvent(OnSendAttachment: TOnSendAttachmentEvent);
    function  GetOnGetAttachmentEvent: TOnGetAttachmentEvent;
    procedure SetOnGetAttachmentEvent(OnGetAttachment: TOnGetAttachmentEvent);

    property MIMEBoundary: AnsiString read GetMimeBoundary write SetMimeBoundary;
    property OnSendAttachment: TOnSendAttachmentEvent read GetOnSendAttachmentEvent write SetOnSendAttachmentEvent;
    property OnGetAttachment: TOnGetAttachmentEvent read GetOnGetAttachmentEvent write SetOnGetAttachmentEvent;
  end;


implementation

uses System.SysUtils, Soap.SOAPConst, Soap.SOAPAttach;

procedure TSoapDataList.Clear;
var
  I: Integer;
begin
  for I := 0 to Count -1 do
    TSOAPAttachmentData(Items[I]).Free;
  inherited Clear;
end;

procedure TSoapDataList.Assign(ListA: TList; AOperator: TListAssignOp = laCopy;
                               ListB: TList = Nil);
begin
  raise Exception.Create(SInvalidMethod);
end;

function TSoapDataList.Add(Item: Pointer): Integer;
begin
  Result := inherited Add(Item);
end;

procedure TSoapDataList.Insert(Index: Integer; aClass: TClass);
begin
  raise Exception.Create(SInvalidMethod);
end;

function TSoapDataList.Remove(aClass: TClass): Integer;
begin
  raise Exception.Create(SInvalidMethod);
end;



end.
