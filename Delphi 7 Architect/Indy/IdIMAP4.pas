unit IdIMAP4;

{*

  IMAP 4 (Internet Message Access Protocol - Version 4 Rev 1)
  By Idan Cohen i_cohen@yahoo.com

  2001-FEB-27 IC: First version most of the IMAP features are implemented and
                  the core IdPOP3 features are implemented to allow a seamless
                  switch.
                  The unit is currently oriented to a session connection and not
                  to constant connection, because of that server events that are
                  raised from another user actions are not supported.
  2001-APR-18 IC: Added support for the session's connection state with a
                  special exception for commands preformed in wrong connection
                  states. Exceptions were also added for response errors.
  2001-MAY-05 IC:

  2001-Mar-13 DS: Fixed Bug # 494813 in CheckMsgSeen where LastCmdResult.Text
                  was not using the Ln index variable to access server
                  responses.

  2002-Apr-12 DS: fixed bug # 506026 in TIdIMAP4.ListSubscribedMailBoxes.  Call
                  ParseLSubResut instead of ParseListResult.

*}

{ TODO -oIC :
Change the mailbox list commands so that they receive TMailBoxTree
structures and so they can store in them the mailbox name and it's attributes. }

{ TODO -oIC :
Add support for \* special flag in messages, and check for \Recent
flag in STORE command because it cant be stored (will get no reply!!!) }

{ TODO -oIC :
5.1.2.  Mailbox Namespace Naming Convention
By convention, the first hierarchical element of any mailbox name
which begins with "#" identifies the "namespace" of the remainder of
the name.  This makes it possible to disambiguate between different
types of mailbox stores, each of which have their own namespaces.
For example, implementations which offer access to USENET
newsgroups MAY use the "#news" namespace to partition the USENET
newsgroup namespace from that of other mailboxes.  Thus, the
comp.mail.misc newsgroup would have an mailbox name of
"#news.comp.mail.misc", and the name "comp.mail.misc" could refer
to a different object (e.g. a user's private mailbox). }    {Do not Localize}

interface

uses Classes,
     IdAssignedNumbers,
     IdGlobal,
     IdMailBox,
     IdMessage,
     IdMessageClient,
     IdMessageCollection;

const
   wsOk  = 1;
   wsNo  = 2;
   wsBad = 3;
   wsPreAuth = 4;
   wsBye = 5;

type
  TIdIMAP4Commands =
  ( cmdCAPABILITY,
    cmdNOOP,
    cmdLOGOUT,
    cmdAUTHENTICATE,
    cmdLOGIN,
    cmdSELECT,
    cmdEXAMINE,
    cmdCREATE,
    cmdDELETE,
    cmdRENAME,
    cmdSUBSCRIBE,
    cmdUNSUBSCRIBE,
    cmdLIST,
    cmdLSUB,
    cmdSTATUS,
    cmdAPPEND,
    cmdCHECK,
    cmdCLOSE,
    cmdEXPUNGE,
    cmdSEARCH,
    cmdFETCH,
    cmdSTORE,
    cmdCOPY,
    cmdUID,
    cmdXCmd );

  TIdIMAP4ConnectionState = ( csAny, csNonAuthenticated, csAuthenticated, csSelected );
  {****************************************************************************
  Universal commands CAPABILITY, NOOP, and LOGOUT
  Authenticated state commands SELECT, EXAMINE, CREATE, DELETE, RENAME,
  SUBSCRIBE, UNSUBSCRIBE, LIST, LSUB, STATUS, and APPEND
  Selected state commands CHECK, CLOSE, EXPUNGE, SEARCH, FETCH, STORE, COPY, and UID
  *****************************************************************************}

  TIdIMAP4SearchKey =
  ( skAll,       //All messages in the mailbox; the default initial key for ANDing.
    skAnswered,  //Messages with the \Answered flag set.
    skBcc,       //Messages that contain the specified string in the envelope structure's BCC field.    {Do not Localize}
    skBefore,    //Messages whose internal date is earlier than the specified date.
    skBody,      //Messages that contain the specified string in the body of the message.
    skCc,        //Messages that contain the specified string in the envelope structure's CC field.    {Do not Localize}
    skDeleted,   //Messages with the \Deleted flag set.
    skDraft,     //Messages with the \Draft flag set.
    skFlagged,   //Messages with the \Flagged flag set.
    skFrom,      //Messages that contain the specified string in the envelope structure's FROM field.    {Do not Localize}
    skHeader,    //Messages that have a header with the specified field-name (as defined in [RFC-822])
                 //and that contains the specified string in the [RFC-822] field-body.
    skKeyword,   //Messages with the specified keyword set.
    skLarger,    //Messages with an [RFC-822] size larger than the specified number of octets.
    skNew,       //Messages that have the \Recent flag set but not the \Seen flag.
                 //This is functionally equivalent to "(RECENT UNSEEN)".
    skNot,       //Messages that do not match the specified search key.
    skOld,       //Messages that do not have the \Recent flag set. This is functionally
                 //equivalent to "NOT RECENT" (as opposed to "NOT NEW").
    skOn,        //Messages whose internal date is within the specified date.
    skOr,        //Messages that match either search key.
    skRecent,    //Messages that have the \Recent flag set.
    skSeen,      //Messages that have the \Seen flag set.
    skSentBefore,//Messages whose [RFC-822] Date: header is earlier than the specified date.
    skSentOn,    //Messages whose [RFC-822] Date: header is within the specified date.
    skSentSince, //Messages whose [RFC-822] Date: header is within or later than the specified date.
    skSince,     //Messages whose internal date is within or later than the specified date.
    skSmaller,   //Messages with an [RFC-822] size smaller than the specified number of octets.
    skSubject,   //Messages that contain the specified string in the envelope structure's SUBJECT field.    {Do not Localize}
    skText,      //Messages that contain the specified string in the header or body of the message.
    skTo,        //Messages that contain the specified string in the envelope structure's TO field.    {Do not Localize}
    skUID,       //Messages with unique identifiers corresponding to the specified unique identifier set.
    skUnanswered,//Messages that do not have the \Answered flag set.
    skUndeleted, //Messages that do not have the \Deleted flag set.
    skUndraft,   //Messages that do not have the \Draft flag set.
    skUnflagged, //Messages that do not have the \Flagged flag set.
    skUnKeyWord, //Messages that do not have the specified keyword set.
    skUnseen );

  TIdIMAP4SearchKeyArray = array of TIdIMAP4SearchKey;

  TIdIMAP4SearchRec = record
    Date: TDateTime;
    Size: Integer;
    Text: String;
    SearchKey : TIdIMAP4SearchKey;
  end;

  TIdIMAP4SearchRecArray = array of TIdIMAP4SearchRec;

  TIdIMAP4StatusDataItem = ( mdMessages, mdRecent, mdUIDNext, mdUIDValidity, mdUnseen );

  TIdIMAP4StoreDataItem = ( sdReplace, sdReplaceSilent, sdAdd, sdAddSilent, sdRemove, sdRemoveSilent );

  TIdRetrieveOnSelect = ( rsDisabled, rsHeaders, rsMessages );

  TIdAlertEvent = procedure(ASender: TObject; const AAlertMsg: String) of object;

  TIdIMAP4 = class(TIdMessageClient)
  private
    procedure SetMailBox(const Value: TIdMailBox);
  protected
    FCmdCounter : Integer;
    FConnectionState : TIdIMAP4ConnectionState;
    FMailBox : TIdMailBox;
    FMailBoxSeparator: Char;
    FOnAlert: TIdAlertEvent;
    FRetrieveOnSelect: TIdRetrieveOnSelect;
    function GetCmdCounter: String;
    function GetConnectionStateName: String;
    function GetNewCmdCounter: String;
    property LastCmdCounter: String read GetCmdCounter;
    property NewCmdCounter: String read GetNewCmdCounter;
  { General Functions }
    function ArrayToNumberStr (const AMsgNumList: array of Integer): String;
    function MessageFlagSetToStr (const AFlags: TIdMessageFlagsSet): String;
    //This function is needed because when using the regular DateToStr with dd/MMM/yyyy
    //(which is the IMAP needed convension) may give the month as the local language
    //three letter month instead of the English month needed.
    function DateToIMAPDateStr (const ADate: TDateTime): String;
  { General Functions }
  { Parser Functions }
    procedure ParseExpungeResult (AMB: TIdMailBox; CmdResultDetails: TStrings);
    procedure ParseListResult (AMBList: TStringList; CmdResultDetails: TStrings);
    procedure ParseLSubResult(AMBList: TStringList; CmdResultDetails: TStrings);
    procedure ParseMailBoxAttributeString(AAttributesList: String;
      var AAttributes: TIdMailBoxAttributesSet);
    procedure ParseMessageFlagString (AFlagsList: String;
      var AFlags: TIdMessageFlagsSet);
    procedure ParseSelectResult (AMB: TIdMailBox; CmdResultDetails: TStrings);
    procedure ParseStatusResult (AMB: TIdMailBox; CmdResultDetails: TStrings);
    procedure ParseSearchResult (AMB: TIdMailBox; CmdResultDetails: TStrings);
    procedure ParseEnvelopeResult (AMsg: TIdMessage; ACmdResultStr: String);
  { Parser Functions }
  public
  { TIdIMAP4 Commands }
    procedure DoAlert (const AMsg: String);
    property ConnectionState: TIdIMAP4ConnectionState read FConnectionState;
    property MailBox: TIdMailBox read FMailBox write SetMailBox;
    function AppendMsg (const AMBName: String; AMsg: TIdMessage;
      const AFlags: TIdMessageFlagsSet = []): Boolean;
    //Requests a listing of capabilities that the server supports.
    function Capability (ASlCapability: TStrings): Boolean;
    //Requests a checkpoint of the currently selected mailbox.
    function CheckMailBox: Boolean;
    //Checks if the message was read or not.
    function CheckMsgSeen (const AMsgNum: Integer): Boolean;
    //Connects and logins to the IMAP4 account.
    procedure Connect(const ATimeout: Integer = IdTimeoutDefault); override;
    //Close's the current selected mailbox in the account.    {Do not Localize}
    function CloseMailBox: Boolean;
    //Copy's a message from the current selected mailbox to the specified mailbox.    {Do not Localize}
    function CopyMsgs (const AMsgNumList: array of Integer; const AMBName: String): Boolean;
    constructor Create(AOwner: TComponent); override;
    //Create's a new mailbox with the specified name in the account.    {Do not Localize}
    function CreateMailBox (const AMBName: String): Boolean;
    //Delete's the specified mailbox from the account.    {Do not Localize}
    function DeleteMailBox (const AMBName: String): Boolean;
    //Marks a message for deletion, it will be deleted when the mailbox will be purged.
    function DeleteMsgs(const AMsgNumList: array of Integer): Boolean;
    destructor Destroy; override;
    //Logouts and disconnects from the IMAP account.
    procedure Disconnect; override;
    //Examine's the specified mailbox and inserts the results to the TIdMailBox provided.    {Do not Localize}
    function ExamineMailBox (const AMBName: String; AMB: TIdMailBox): Boolean;
    //Expunge's (deletes the marked files) the current selected mailbox in the account.    {Do not Localize}
    function ExpungeMailBox: Boolean;
    //Sends a NOOP (No Operation) to keep the account connection with the server alive.
    procedure KeepAlive;
    //Returns a list of all the child mailboxes (one level down) to the mailbox supplied.
    //This should be used when you fear that there are to many mailboxes and the listing of
    //all of them could be time consuming, so this should be used to retrieve specific mailboxes.
    function ListInferiorMailBoxes (AMailBoxList, AInferiorMailBoxList: TStringList): Boolean;
    //Returns a list of all the mailboxes in the user account.
    function ListMailBoxes (AMailBoxList: TStringList): Boolean;
    //Returns a list of all the subscribed mailboxes in the user account.
    function ListSubscribedMailBoxes (AMailBoxList: TStringList): Boolean;
    //Rename's the specified mailbox in the account.    {Do not Localize}
    function RenameMailBox (const AOldMBName, ANewMBName: String): Boolean;
    //Searches the current selected mailbox for messages matching the SearchRec and
    //returnes the results to the mailbox SearchResults array.
    function SearchMailBox (const ASearchInfo: array of TIdIMAP4SearchRec{Array}): Boolean;//array of TIdIMAP4SearchRec ) : Boolean;
    //Select's the current a mailbox in the account.    {Do not Localize}
    function SelectMailBox (const AMBName: String): Boolean;
    //Retrieves the status of the indicated mailbox.
    function StatusMailBox (const AMBName: String; AMB: TIdMailBox;
      const AStatusDataItems: array of TIdIMAP4StatusDataItem): Boolean;
    //Changes (adds or removes) message flags.
    function StoreFlags (const AMsgNumList: array of Integer;
      const AStoreMethod: TIdIMAP4StoreDataItem;
      const AFlags: TIdMessageFlagsSet): Boolean;
    //Adds the specified mailbox name to the server's set of "active" or "subscribed"    {Do not Localize}
    //mailboxes as returned by the LSUB command.
    function SubscribeMailBox (const AMBName: String): Boolean;
    //Retrieves a whole message while marking it read.
    function Retrieve (const AMsgNum: Integer; AMsg: TIdMessage): Boolean;
    //Retrieves all envelope of the selected mailbox to the specified TIdMessageCollection.
    function RetrieveAllEnvelopes (AMsgList: TIdMessageCollection): Boolean;
    //Retrieves all headers of the selected mailbox to the specified TIdMessageCollection.
    function RetrieveAllHeaders (AMsgList: TIdMessageCollection): Boolean;
    //Retrieves all messages of the selected mailbox to the specified TIdMessageCollection.
    function RetrieveAllMsgs (AMsgList: TIdMessageCollection): Boolean;
    //Retrieves only the message envelope.
    function RetrieveEnvelope (const AMsgNum: Integer; AMsg: TIdMessage): Boolean;
    //Returnes the message flag values.
    function RetrieveFlags (const AMsgNum: Integer; AFlags: TIdMessageFlagsSet): Boolean;
    //Retrieves only the message header.
    function RetrieveHeader (const AMsgNum: Integer; AMsg: TIdMessage): Boolean;
    //Retrives the current selected mailbox size.
    function RetrieveMailBoxSize: Integer;
    //Returnes the message size.
    function RetrieveMsgSize(const AMsgNum: Integer): Integer;
    //Retrieves a whole message while keeping it's Seen flag untucked    {Do not Localize}
    //(preserving the previous value).
    function RetrievePeek (const AMsgNum: Integer; AMsg: TIdMessage): Boolean;
    //Checks if the message was read or not.
    function UIDCheckMsgSeen (const AMsgUID: String): Boolean;
    //Marks a message for deletion, it will be deleted when the mailbox will be purged.
    function UIDDeleteMsg(const AMsgUID: String): Boolean;
    //Retrieves all headers of the selected mailbox to the specified TIdMessageCollection.
    function UIDRetrieveAllHeaders (AMsgList: TIdMessageCollection): Boolean;
    //Retrieves all envelope and UID of the selected mailbox to the specified TIdMessageCollection.
    function UIDRetrieveAllEnvelopes (AMsgList: TIdMessageCollection): Boolean;
    //Retrieves a whole message while marking it read.
    function UIDRetrieve (const AMsgUID: String; AMsg: TIdMessage): Boolean;
    //Retrieves only the message envelope.
    function UIDRetrieveEnvelope (const AMsgUID: String; AMsg: TIdMessage): Boolean;
    //Returnes the message flag values.
    function UIDRetrieveFlags (const AMsgUID: String; AFlags: TIdMessageFlagsSet): Boolean;
    //Retrieves only the message header.
    function UIDRetrieveHeader (const AMsgUID: String; AMsg: TIdMessage): Boolean;
    //Retrives the current selected mailbox size.
    function UIDRetrieveMailBoxSize: Integer;
    //Returnes the message size.
    function UIDRetrieveMsgSize(const AMsgUID: String): Integer;
    //Retrieves a whole message while keeping it's Seen flag untucked    {Do not Localize}
    //(preserving the previous value).
    function UIDRetrievePeek (const AMsgUID: String; AMsg: TIdMessage): Boolean;
    //Changes (adds or removes) message flags.
    function UIDStoreFlags (const AMsgUID: String;
      const AStoreMethod: TIdIMAP4StoreDataItem;
      const AFlags: TIdMessageFlagsSet): Boolean;
    //Removes the specified mailbox name from the server's set of "active" or "subscribed"    {Do not Localize}
    //mailboxes as returned by the LSUB command.
    function UnsubscribeMailBox (const AMBName: String): Boolean;
  { TIdIMAP4 Commands }
  { IdTCPConnection Commands }
    procedure GetInternalResponse (const ATag: String); overload;
    procedure GetInternalResponse; overload;
    procedure GetInternalLineResponse (const ATag: String);
    function GetResponse(const ATag: String; const
      AAllowedResponses: array of SmallInt): SmallInt; reintroduce; overload;
    function GetResponse(const AAllowedResponses: array of SmallInt):
      SmallInt; reintroduce; overload;
    function GetLineResponse(const ATag: String;
      const AAllowedResponses: array of SmallInt): SmallInt;
    function SendCmd(const ATag, AOut: string; const AResponse: SmallInt = -1): SmallInt; overload;
    function SendCmd(const ATag, AOut: string; const AResponse: array of SmallInt):
      SmallInt; overload;
  { IdTCPConnection Commands }
  published
    property OnAlert: TIdAlertEvent read FOnAlert write FOnAlert;
    property Password;
    property RetrieveOnSelect: TIdRetrieveOnSelect read FRetrieveOnSelect write FRetrieveOnSelect default rsDisabled;
    property Port default IdPORT_IMAP4;
    property Username;
    property MailBoxSeparator: Char read FMailBoxSeparator write FMailBoxSeparator default '/';    {Do not Localize}
  end;

implementation

uses
  IdEMailAddress,
  IdException,
  IdResourceStrings,
  IdTCPConnection,
  SysUtils;

type
  TIdIMAP4FetchDataItem =
  ( fdAll,           //Macro equivalent to: (FLAGS INTERNALDATE RFC822.SIZE ENVELOPE)
    fdBody,          //Non-extensible form of BODYSTRUCTURE.
    fdBodyExtensible,
    fdBodyPeek,
    fdBodyStructure, //The [MIME-IMB] body structure of the message.  This
                     //is computed by the server by parsing the [MIME-IMB]
                     //header fields in the [RFC-822] header and [MIME-IMB] headers.
    fdEnvelope,      //The envelope structure of the message.  This is
                     //computed by the server by parsing the [RFC-822]
                     //header into the component parts, defaulting various
                     //fields as necessary.
    fdFast,          //Macro equivalent to: (FLAGS INTERNALDATE RFC822.SIZE)
    fdFlags,         //The flags that are set for this message.
    fdFull,          //Macro equivalent to: (FLAGS INTERNALDATE RFC822.SIZE ENVELOPE BODY)
    fdInternalDate,  //The internal date of the message.
    fdRFC822,        //Functionally equivalent to BODY[], differing in the
                     //syntax of the resulting untagged FETCH data (RFC822
                     //is returned).
    fdRFC822Header,  //Functionally equivalent to BODY.PEEK[HEADER],
                     //differing in the syntax of the resulting untagged
                     //FETCH data (RFC822.HEADER is returned).
    fdRFC822Size,    //The [RFC-822] size of the message.
    fdRFC822Text,    //Functionally equivalent to BODY[TEXT], differing in
                     //the syntax of the resulting untagged FETCH data
                     //(RFC822.TEXT is returned).
    fdUID );         //The unique identifier for the message.

const
   IMAP4Commands : array [cmdCapability..cmdXCmd] of String =
   ( { Client Commands - Any State}
    'CAPABILITY', {Do not Localize}
    'NOOP', {Do not Localize}
    'LOGOUT', {Do not Localize}
    { Client Commands - Non Authenticated State}
    'AUTHENTICATE', {Do not Localize}
    'LOGIN', {Do not Localize}
    { Client Commands - Authenticated State}
    'SELECT', {Do not Localize}
    'EXAMINE', {Do not Localize}
    'CREATE', {Do not Localize}
    'DELETE', {Do not Localize}
    'RENAME', {Do not Localize}
    'SUBSCRIBE', {Do not Localize}
    'UNSUBSCRIBE', {Do not Localize}
    'LIST', {Do not Localize}
    'LSUB', {Do not Localize}
    'STATUS', {Do not Localize}
    'APPEND', {Do not Localize}
    { Client Commands - Selected State}
    'CHECK', {Do not Localize}
    'CLOSE', {Do not Localize}
    'EXPUNGE', {Do not Localize}
    'SEARCH', {Do not Localize}
    'FETCH', {Do not Localize}
    'STORE', {Do not Localize}
    'COPY', {Do not Localize}
    'UID', {Do not Localize}
    { Client Commands - Experimental/ Expansion}
    'X' ); {Do not Localize}

   IMAP4FetchDataItem : array [fdAll..fdUID] of String =
   ( 'ALL', {Do not Localize}          //Macro equivalent to: (FLAGS INTERNALDATE RFC822.SIZE ENVELOPE)
     'BODY', {Do not Localize}         //Non-extensible form of BODYSTRUCTURE.
     'BODY[%s]<%s>', {Do not Localize}
     'BODY.PEEK[]', {Do not Localize}
     'BODYSTRUCTURE', {Do not Localize}//The [MIME-IMB] body structure of the message.  This
                                       //is computed by the server by parsing the [MIME-IMB]
                                       //header fields in the [RFC-822] header and [MIME-IMB] headers.
     'ENVELOPE', {Do not Localize}     //The envelope structure of the message.  This is
                                       //computed by the server by parsing the [RFC-822]
                                       //header into the component parts, defaulting various
                                       //fields as necessary.
     'FAST', {Do not Localize}         //Macro equivalent to: (FLAGS INTERNALDATE RFC822.SIZE)
     'FLAGS', {Do not Localize}        //The flags that are set for this message.
     'FULL', {Do not Localize}         //Macro equivalent to: (FLAGS INTERNALDATE RFC822.SIZE ENVELOPE BODY)
     'INTERNALDATE', {Do not Localize} //The internal date of the message.
     'RFC822', {Do not Localize}       //Functionally equivalent to BODY[], differing in the
                                       //syntax of the resulting untagged FETCH data (RFC822
                                       //is returned).
     'RFC822.HEADER', {Do not Localize}//Functionally equivalent to BODY.PEEK[HEADER],
                                       //differing in the syntax of the resulting untagged
                                       //FETCH data (RFC822.HEADER is returned).
     'RFC822.SIZE', {Do not Localize}  //The [RFC-822] size of the message.
     'RFC822.TEXT', {Do not Localize}  //Functionally equivalent to BODY[TEXT], differing in
                                       //the syntax of the resulting untagged FETCH data
                                       //(RFC822.TEXT is returned).
     'UID' ); {Do not Localize}        //The unique identifier for the message.


   IMAP4SearchKeys : array [skAll..skUnseen] of String =
   ( 'ALL', {Do not Localize}      //All messages in the mailbox; the default initial key for ANDing.
     'ANSWERED', {Do not Localize} //Messages with the \Answered flag set.
     'BCC', {Do not Localize}      //Messages that contain the specified string in the envelope structure's BCC field.
     'BEFORE', {Do not Localize}   //Messages whose internal date is earlier than the specified date.
     'BODY', {Do not Localize}     //Messages that contain the specified string in the body of the message.
     'CC', {Do not Localize}       //Messages that contain the specified string in the envelope structure's CC field.
     'DELETED', {Do not Localize}  //Messages with the \Deleted flag set.
     'DRAFT', {Do not Localize}    //Messages with the \Draft flag set.
     'FLAGGED', {Do not Localize}  //Messages with the \Flagged flag set.
     'FROM', {Do not Localize}     //Messages that contain the specified string in the envelope structure's FROM field.
     'HEADER', {Do not Localize}   //Messages that have a header with the specified field-name (as defined in [RFC-822])
                                   //and that contains the specified string in the [RFC-822] field-body.
     'KEYWORD', {Do not Localize}  //Messages with the specified keyword set.
     'LARGER', {Do not Localize}   //Messages with an [RFC-822] size larger than the specified number of octets.
     'NEW', {Do not Localize}      //Messages that have the \Recent flag set but not the \Seen flag.
                                   //This is functionally equivalent to "(RECENT UNSEEN)".
     'NOT', {Do not Localize}      //Messages that do not match the specified search key.
     'OLD', {Do not Localize}      //Messages that do not have the \Recent flag set. This is functionally
                                   //equivalent to "NOT RECENT" (as opposed to "NOT NEW").
     'ON', {Do not Localize}       //Messages whose internal date is within the specified date.
     'OR', {Do not Localize}       //Messages that match either search key.
     'RECENT', {Do not Localize}   //Messages that have the \Recent flag set.
     'SEEN', {Do not Localize}     //Messages that have the \Seen flag set.
     'SENTBEFORE',{Do not Localize}//Messages whose [RFC-822] Date: header is earlier than the specified date.
     'SENTON', {Do not Localize}   //Messages whose [RFC-822] Date: header is within the specified date.
     'SENTSINCE', {Do not Localize}//Messages whose [RFC-822] Date: header is within or later than the specified date.
     'SINCE', {Do not Localize}    //Messages whose internal date is within or later than the specified date.
     'SMALLER', {Do not Localize}  //Messages with an [RFC-822] size smaller than the specified number of octets.
     'SUBJECT', {Do not Localize}  //Messages that contain the specified string in the envelope structure's SUBJECT field.
     'TEXT', {Do not Localize}     //Messages that contain the specified string in the header or body of the message.
     'TO', {Do not Localize}       //Messages that contain the specified string in the envelope structure's TO field.
     'UID', {Do not Localize}      //Messages with unique identifiers corresponding to the specified unique identifier set.
     'UNANSWERED',{Do not Localize}//Messages that do not have the \Answered flag set.
     'UNDELETED', {Do not Localize}//Messages that do not have the \Deleted flag set.
     'UNDRAFT', {Do not Localize}  //Messages that do not have the \Draft flag set.
     'UNFLAGGED', {Do not Localize}//Messages that do not have the \Flagged flag set.
     'UNKEYWORD', {Do not Localize}//Messages that do not have the specified keyword set.
     'UNSEEN' ); {Do not Localize}

   IMAP4StoreDataItem : array [sdReplace..sdRemoveSilent] of String =
   ( 'FLAGS', {Do not Localize}
     'FLAGS.SILENT', {Do not Localize}
     '+FLAGS', {Do not Localize}
     '+FLAGS.SILENT', {Do not Localize}
     '-FLAGS', {Do not Localize}
     '-FLAGS.SILENT' ); {Do not Localize}

   IMAP4StatusDataItem : array [mdMessages..mdUnseen] of String =
   ( 'MESSAGES', {Do not Localize}
     'RECENT', {Do not Localize}
     'UIDNEXT', {Do not Localize}
     'UIDVALIDITY', {Do not Localize}
     'UNSEEN' ); {Do not Localize}

{ TIdIMAP4 }

{ IdTCPConnection Commands... }

function TIdIMAP4.GetResponse(const ATag: String; const AAllowedResponses: array of SmallInt): SmallInt;
begin
  GetInternalResponse (ATag);
  if AnsiSameText(LastCmdResult.TextCode, 'OK') then {Do not Localize}
  begin
       LastCmdResult.NumericCode := wsOK;
  end
  else if AnsiSameText(LastCmdResult.TextCode, 'NO') then {Do not Localize}
  begin
       LastCmdResult.NumericCode := wsNo;
  end
  else if AnsiSameText(LastCmdResult.TextCode, 'BAD') then {Do not Localize}
  begin
       LastCmdResult.NumericCode := wsBad;
  end
  else if AnsiSameText(LastCmdResult.TextCode, 'PREAUTH') then {Do not Localize}
  begin
       LastCmdResult.NumericCode := wsPreAuth;
  end
  else if AnsiSameText(LastCmdResult.TextCode, 'BYE') then {Do not Localize}
  begin
       LastCmdResult.NumericCode := wsBye;
  end
  else
  begin
       raise EIdException.Create(RSUnrecognizedIMAP4ResponseHeader);
  end;
  Result := CheckResponse(LastCmdResult.NumericCode, AAllowedResponses);
end;

function TIdIMAP4.GetResponse(const AAllowedResponses: array of SmallInt): SmallInt;
begin
  GetInternalResponse;
  if AnsiSameText(LastCmdResult.TextCode, '* OK') then {Do not Localize}
  begin
       LastCmdResult.NumericCode := wsOK;
  end
  else if AnsiSameText(LastCmdResult.TextCode, '* NO') then {Do not Localize}
  begin
       LastCmdResult.NumericCode := wsNo;
  end
  else if AnsiSameText(LastCmdResult.TextCode, '* BAD') then {Do not Localize}
  begin
       LastCmdResult.NumericCode := wsBad;
  end
  else if AnsiSameText(LastCmdResult.TextCode, '* PREAUTH') then {Do not Localize}
  begin
       LastCmdResult.NumericCode := wsPreAuth;
  end
  else if AnsiSameText(LastCmdResult.TextCode, '* BYE') then {Do not Localize}
  begin
       LastCmdResult.NumericCode := wsBye;
  end
  else
  begin
       raise EIdException.Create(RSUnrecognizedIMAP4ResponseHeader);
  end;
  Result := CheckResponse(LastCmdResult.NumericCode, AAllowedResponses);
end;

function TIdIMAP4.GetLineResponse(const ATag: String;
  const AAllowedResponses: array of SmallInt): SmallInt;
begin
  GetInternalLineResponse (ATag);
  if AnsiSameText(LastCmdResult.TextCode, 'OK') then {Do not Localize}
  begin
       LastCmdResult.NumericCode := wsOK;
  end
  else if AnsiSameText(LastCmdResult.TextCode, 'NO') then {Do not Localize}
  begin
       LastCmdResult.NumericCode := wsNo;
  end
  else if AnsiSameText(LastCmdResult.TextCode, 'BAD') then {Do not Localize}
  begin
       LastCmdResult.NumericCode := wsBad;
  end
  else if AnsiSameText(LastCmdResult.TextCode, 'PREAUTH') then {Do not Localize}
  begin
       LastCmdResult.NumericCode := wsPreAuth;
  end
  else if AnsiSameText(LastCmdResult.TextCode, 'BYE') then {Do not Localize}
  begin
       LastCmdResult.NumericCode := wsBye;
  end
  else
  begin
       raise EIdException.Create(RSUnrecognizedIMAP4ResponseHeader);
  end;
  Result := CheckResponse(LastCmdResult.NumericCode, AAllowedResponses);
end;

procedure TIdIMAP4.GetInternalResponse (const ATag: String);
var LLine: String;
    LResponse: TStringList;
begin
     LResponse := TStringList.Create;
     try
        LLine := ReadLnWait;
        LResponse.Add(LLine);
        if ( LLine[1] = '*' ) then {Do not Localize} //Untagged response
        begin // Multi line response coming
             {We keep reading lines until we encounter either a line such as "250" or "250 Read"}
             repeat
                   LLine := ReadLnWait;
                   LResponse.Add(LLine);
             until ( AnsiSameText (Copy (LLine, 1, Length (ATag)), ATag) );
        end;
        FLastCmdResult.ParseResponse(ATag, LResponse);
     finally
            FreeAndNil (LResponse);
     end;
end;

procedure TIdIMAP4.GetInternalResponse;
var LLine: String;
    LResponse: TStringList;
begin
     LResponse := TStringList.Create;
     try
        LLine := ReadLnWait;
        LResponse.Add(LLine);
        FLastCmdResult.ParseResponse(LResponse);
     finally
            FreeAndNil (LResponse);
     end;
end;

procedure TIdIMAP4.GetInternalLineResponse (const ATag: String);
var LLine: String;
    LResponse: TStringList;
begin
     LResponse := TStringList.Create;
     try
        LLine := ReadLnWait;
        LResponse.Add(LLine);
        if ( LLine[1] = '*' ) then {Do not Localize} //Untagged response
        begin
        end
        else
        begin // Maybe multi line response coming
             while not AnsiSameText (Copy (LLine, 1, Length (ATag)), ATag) do
             begin
                  LLine := ReadLnWait;
                  LResponse.Add(LLine);
             end;
        end;
        FLastCmdResult.ParseLineResponse(ATag, LResponse);
     finally
            FreeAndNil (LResponse);
     end;
end;

function TIdIMAP4.SendCmd(const ATag, AOut: string; const AResponse: array of SmallInt): SmallInt;
begin
     if ( AOut <> #0 ) then
     begin
          WriteLn ( ATag + ' ' + AOut ); {Do not Localize}
     end;
     Result := GetResponse ( ATag, AResponse );
end;

function TIdIMAP4.SendCmd(const ATag, AOut: string; const AResponse: SmallInt): SmallInt;
begin
     if ( AResponse = -1 ) then
     begin
          result := SendCmd ( ATag, AOut, [] );
     end
     else
     begin
          result := SendCmd ( ATag, AOut, [AResponse] );
     end;
end;

{ ...IdTCPConnection Commands }

procedure TIdIMAP4.DoAlert(const AMsg: String);
begin
     if Assigned(OnAlert) then
     begin
          OnAlert(Self, AMsg);
     end;
end;

procedure TIdIMAP4.SetMailBox(const Value: TIdMailBox);
begin
     FMailBox.Assign ( Value );
end;

procedure TIdIMAP4.Connect(const ATimeout: Integer = IdTimeoutDefault);
begin
     inherited Connect(ATimeout);
     try
        GetResponse ( [wsOk, wsPreAuth] );
        if ( LastCmdResult.NumericCode = wsOk ) then
        begin
             FConnectionState := csNonAuthenticated;
             FCmdCounter := 0;
             SendCmd ( NewCmdCounter, IMAP4Commands[cmdLogin] + ' ' + Username + ' ' + Password, wsOk ); {Do not Localize}
             if ( LastCmdResult.NumericCode = wsOk ) then
             begin
                  FConnectionState := csAuthenticated;
             end;
        end
        else if ( LastCmdResult.NumericCode = wsPreAuth ) then
        begin
             FConnectionState := csAuthenticated;
             FCmdCounter := 0;
        end;
     except
           Disconnect;
           raise;
     end;
end;

constructor TIdIMAP4.Create(AOwner: TComponent);
begin
     inherited Create(AOwner);
     FMailBox := TIdMailBox.Create (Self);
     Port := IdPORT_IMAP4;
     FCmdCounter := 0;
     FConnectionState := csNonAuthenticated;
     FRetrieveOnSelect := rsDisabled;
     //TODO: May be detected automatically
     //Default in original source was '/', but Cyrus uses '.' as default    {Do not Localize}
     FMailBoxSeparator := '/';    {Do not Localize}
end;

procedure TIdIMAP4.Disconnect;
begin
     //Avialable in any state.
     if Connected then
     begin
          try
             SendCmd ( NewCmdCounter, IMAP4Commands[cmdLogout], wsOk );
          finally
                 inherited;
                 FConnectionState := csNonAuthenticated;
          end;
     end
     else
     begin
         raise EIdClosedSocket.Create ( RSStatusDisconnected );
     end;
end;

procedure TIdIMAP4.KeepAlive;
begin
     //Avialable in any state.
     SendCmd ( NewCmdCounter, IMAP4Commands[cmdNoop], wsOk );
end;

function TIdIMAP4.Capability(ASlCapability: TStrings): Boolean;
begin
     //Avialable in any state.
     Result := False;
     SendCmd ( NewCmdCounter, (IMAP4Commands[CmdCapability]), wsOk);
     if ( LastCmdResult.NumericCode = wsOk ) and Assigned (ASlCapability) then
     begin
          ASlCapability.Clear;
          BreakApart ( LastCmdResult.Text[0], ' ', ASlCapability ); {Do not Localize}
          ASlCapability.Delete(0);
          Result := True;
     end;
end;

function TIdIMAP4.GetCmdCounter: String;
begin
     Result := 'C' + IntToStr ( FCmdCounter ); {Do not Localize}
end;

function TIdIMAP4.GetNewCmdCounter: String;
begin
     Inc ( FCmdCounter );
     Result := 'C' + IntToStr ( FCmdCounter ); {Do not Localize}
end;

destructor TIdIMAP4.Destroy;
begin
     FreeAndNil(FMailBox);
     inherited;
end;

function TIdIMAP4.SelectMailBox(const AMBName: String): Boolean;
begin
     if ( ( FConnectionState = csAuthenticated ) or ( FConnectionState = csSelected ) ) then
     begin
          SendCmd ( NewCmdCounter, ( IMAP4Commands[cmdSelect] + ' "' + AMBName + '"' ), wsOk); {Do not Localize}
          if ( LastCmdResult.NumericCode = wsOk ) then
          begin
               //Put the parse in the IMAP Class and send the MB;
               ParseSelectResult (FMailBox, LastCmdResult.Text );
               FMailBox.Name := AMBName;
               FConnectionState := csSelected;
               case RetrieveOnSelect of
                 rsHeaders: RetrieveAllHeaders ( FMailBox.MessageList );
                 rsMessages: RetrieveAllMsgs ( FMailBox.MessageList );
               end;
          end
          else
          begin
               FConnectionState := csAuthenticated;
          end;
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          FConnectionState := csAuthenticated;
          raise EIdConnectionStateError.CreateFmt (
          RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.ExamineMailBox(const AMBName: String;
  AMB: TIdMailBox): Boolean;
begin
     if ( ( FConnectionState = csAuthenticated ) or ( FConnectionState = csSelected ) ) then
     begin
          SendCmd ( NewCmdCounter, ( IMAP4Commands[cmdExamine] + ' "' + AMBName + '"' ), wsOk); {Do not Localize}
          if ( LastCmdResult.NumericCode = wsOk ) then
          begin
               ParseSelectResult (AMB, LastCmdResult.Text );
               AMB.Name := AMBName;
          end;
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.CloseMailBox: Boolean;
begin
     if ( FConnectionState = csSelected ) then
     begin
          SendCmd ( NewCmdCounter, IMAP4Commands[cmdClose], wsOk );
          if ( LastCmdResult.NumericCode = wsOk ) then
          begin
               MailBox.Clear;
               FConnectionState := csAuthenticated;
          end;
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.CreateMailBox(const AMBName: String): Boolean;
begin
     if ( ( FConnectionState = csAuthenticated ) or ( FConnectionState = csSelected ) ) then
     begin
          SendCmd ( NewCmdCounter, ( IMAP4Commands[cmdCreate] + ' "' + AMBName + '"' ), wsOk); {Do not Localize}
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.DeleteMailBox(const AMBName: String): Boolean;
begin
     if ( ( FConnectionState = csAuthenticated ) or ( FConnectionState = csSelected ) ) then
     begin
          SendCmd ( NewCmdCounter, ( IMAP4Commands[cmdDelete] + ' "' + AMBName + '"' ), wsOk); {Do not Localize}
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.RenameMailBox(const AOldMBName, ANewMBName: String): Boolean;
begin
     if ( ( FConnectionState = csAuthenticated ) or ( FConnectionState = csSelected ) ) then
     begin
          SendCmd ( NewCmdCounter, ( IMAP4Commands[cmdRename] + ' "' + {Do not Localize}
          AOldMBName + '" "' + ANewMBName + '"' ), wsOk); {Do not Localize}
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.StatusMailBox(const AMBName: String;
  AMB: TIdMailBox; const AStatusDataItems: array of TIdIMAP4StatusDataItem): Boolean;
var LDataItems : String;
    Ln : Integer;
begin
     if ( ( FConnectionState = csAuthenticated ) or ( FConnectionState = csSelected ) ) then
     begin
          for Ln := Low ( AStatusDataItems ) to High ( AStatusDataItems ) do
              case AStatusDataItems[Ln] of
                mdMessages: LDataItems := LDataItems + IMAP4StatusDataItem[mdMessages] + ' '; {Do not Localize}
                mdRecent: LDataItems := LDataItems + IMAP4StatusDataItem[mdRecent] + ' '; {Do not Localize}
                mdUIDNext: LDataItems := LDataItems + IMAP4StatusDataItem[mdUIDNext] + ' '; {Do not Localize}
                mdUIDValidity: LDataItems := LDataItems + IMAP4StatusDataItem[mdUIDValidity] + ' '; {Do not Localize}
                mdUnseen: LDataItems := LDataItems + IMAP4StatusDataItem[mdUnseen] + ' '; {Do not Localize}
              end;
          SendCmd ( NewCmdCounter, ( IMAP4Commands[cmdStatus] + ' "' + AMBName + '" (' +    {Do not Localize}
          Trim ( LDataItems ) + ')' ), wsOk); {Do not Localize}
          if ( LastCmdResult.NumericCode = wsOk ) then
          begin
               ParseStatusResult ( AMB, LastCmdResult.Text );
          end;
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.CheckMailBox: Boolean;
begin
     if ( FConnectionState = csSelected ) then
     begin
          SendCmd ( NewCmdCounter, IMAP4Commands[cmdCheck], wsOk);
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.ExpungeMailBox: Boolean;
begin
     if ( FConnectionState = csSelected ) then
     begin
          SendCmd ( NewCmdCounter, IMAP4Commands[cmdExpunge], wsOk);
          if ( LastCmdResult.NumericCode = wsOk ) then
          begin
               ParseExpungeResult ( FMailBox, LastCmdResult.Text );
          end;
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.SearchMailBox(
  const ASearchInfo: array of TIdIMAP4SearchRec{Array} ) : Boolean;
var LSearchStr : String;
    Ln : Integer;
begin
     for Ln := Low ( ASearchInfo ) to High ( ASearchInfo ) do
         case ASearchInfo[Ln].SearchKey of
           //skAll:
           //SearchStr := SearchStr + IMAP4SearchKeys[skAll] + ' '; //Need to check    {Do not Localize}
           skAnswered:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skAnswered] + ' '; {Do not Localize}
           skBcc:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skBcc] + ' "' + ASearchInfo[Ln].Text + '" '; {Do not Localize}
           skBefore:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skBefore] + ' ' + DateToIMAPDateStr ( ASearchInfo[Ln].Date ) + ' '; {Do not Localize}
           skBody:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skBody] + ' "' + ASearchInfo[Ln].Text + '" '; {Do not Localize}
           skCc:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skCc] + ' "' + ASearchInfo[Ln].Text + '" '; {Do not Localize}
           skDeleted:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skDeleted] + ' '; {Do not Localize}
           skDraft:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skDraft] + ' '; {Do not Localize}
           skFlagged:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skFlagged] + ' '; {Do not Localize}
           skFrom:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skFrom] + ' "' + ASearchInfo[Ln].Text + '" '; {Do not Localize}
           //skHeader: //Need to check
           //skKeyword: //Need to check
           skLarger:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skLarger] + ' ' + IntToStr ( ASearchInfo[Ln].Size ) + ' '; {Do not Localize}
           skNew:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skNew] + ' '; {Do not Localize}
           skNot:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skNot] + ' '; {Do not Localize}
           skOld:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skOld] + ' '; {Do not Localize}
           skOn:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skOn] + ' ' + DateToIMAPDateStr ( ASearchInfo[Ln].Date ) + ' '; {Do not Localize}
           skOr:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skOr] + ' '; {Do not Localize}
           skRecent:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skRecent] + ' '; {Do not Localize}
           skSeen:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skSeen] + ' '; {Do not Localize}
           skSentBefore:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skSentBefore] + ' ' + DateToIMAPDateStr ( ASearchInfo[Ln].Date ) + ' '; {Do not Localize}
           skSentOn:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skSentOn] + ' ' + DateToIMAPDateStr ( ASearchInfo[Ln].Date ) + ' '; {Do not Localize}
           skSentSince:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skSentSince] + ' ' + DateToIMAPDateStr ( ASearchInfo[Ln].Date ) + ' '; {Do not Localize}
           skSince:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skSince] + ' ' + DateToIMAPDateStr ( ASearchInfo[Ln].Date ) + ' '; {Do not Localize}
           skSmaller:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skSmaller] + ' ' + IntToStr ( ASearchInfo[Ln].Size ) + ' '; {Do not Localize}
           skSubject:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skSubject] + ' "' + ASearchInfo[Ln].Text + '" '; {Do not Localize}
           skText:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skText] + ' "' + ASearchInfo[Ln].Text + '" '; {Do not Localize}
           skTo:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skTo] + ' "' + ASearchInfo[Ln].Text + '" '; {Do not Localize}
           skUID:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skUID] + ' ' + ASearchInfo[Ln].Text + ' '; {Do not Localize}
           skUnanswered:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skUnanswered] + ' '; {Do not Localize}
           skUndeleted:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skUndeleted] + ' '; {Do not Localize}
           skUndraft:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skUndraft] + ' '; {Do not Localize}
           skUnflagged:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skUnflagged] + ' '; {Do not Localize}
           skUnKeyWord:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skUnKeyWord] + ' '; {Do not Localize}
           skUnseen:
           LSearchStr := LSearchStr + IMAP4SearchKeys[skUnseen] + ' '; {Do not Localize}
         end;
     if ( FConnectionState = csSelected ) then
     begin
          SendCmd ( NewCmdCounter, ( IMAP4Commands[cmdSearch] + ' ' + Trim (LSearchStr) ), wsOk ); {Do not Localize}
          if ( LastCmdResult.NumericCode = wsOk ) then
          begin
               ParseSearchResult (FMailBox, LastCmdResult.Text);
          end;
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.SubscribeMailBox(const AMBName: String): Boolean;
begin
     if ( ( FConnectionState = csAuthenticated ) or ( FConnectionState = csSelected ) ) then
     begin
          SendCmd ( NewCmdCounter, (
          IMAP4Commands[cmdSubscribe] + ' "' + AMBName + '"' ), wsOk); {Do not Localize}
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.UnsubscribeMailBox(const AMBName: String): Boolean;
begin
     if ( ( FConnectionState = csAuthenticated ) or ( FConnectionState = csSelected ) ) then
     begin
          SendCmd ( NewCmdCounter, (
          IMAP4Commands[cmdUnsubscribe] + ' "' + AMBName + '"' ), wsOk); {Do not Localize}
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.ListMailBoxes(AMailBoxList: TStringList): Boolean;
begin
     if ( ( FConnectionState = csAuthenticated ) or ( FConnectionState = csSelected ) ) then
     begin
          SendCmd ( NewCmdCounter, ( IMAP4Commands[cmdList] + ' "" *' ), wsOk ); {Do not Localize}
          if ( LastCmdResult.NumericCode = wsOk ) then
          begin
               ParseListResult ( AMailBoxList, LastCmdResult.Text );
          end;
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.ListInferiorMailBoxes(AMailBoxList, AInferiorMailBoxList: TStringList): Boolean;
var Ln : Integer;
    LAuxMailBoxList : TStringList;
begin
     if ( ( FConnectionState = csAuthenticated ) or ( FConnectionState = csSelected ) ) then
     begin
          if ( AMailBoxList = nil ) then
          begin
               SendCmd ( NewCmdCounter, ( IMAP4Commands[cmdList] + ' "" %' ), wsOk ); {Do not Localize}
               if ( LastCmdResult.NumericCode = wsOk ) then
               begin
                    ParseListResult ( AInferiorMailBoxList, LastCmdResult.Text );
                    //The INBOX mailbox is added because I think it always has to exist
                    //in an IMAP4 account (default) but it does not list it in this command.
                    AInferiorMailBoxList.Add ( 'INBOX' ); {Do not Localize}
               end;
               Result := LastCmdResult.NumericCode = wsOk;
          end
          else
          begin
               LAuxMailBoxList := TStringList.Create;
               try
                  AInferiorMailBoxList.Clear;
                  for Ln := 0 to ( AMailBoxList.Count - 1 ) do
                  begin
                       SendCmd ( NewCmdCounter, ( IMAP4Commands[cmdList] + ' "" "' + {Do not Localize}
                       AMailBoxList[Ln] + FMailBoxSeparator + '%"' ), wsOk ); {Do not Localize}
                       if ( LastCmdResult.NumericCode = wsOk ) then
                       begin
                            ParseListResult ( LAuxMailBoxList, LastCmdResult.Text );
                            AInferiorMailBoxList.AddStrings ( LAuxMailBoxList );
                       end
                       else
                           Break;
                  end;
                  Result := LastCmdResult.NumericCode = wsOk;
               finally
                      LAuxMailBoxList.Free;
               end;
          end;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.ListSubscribedMailBoxes(
  AMailBoxList: TStringList): Boolean;
begin
  if ((FConnectionState = csAuthenticated) or (FConnectionState = csSelected)) then
  begin
    SendCmd(NewCmdCounter, (IMAP4Commands[cmdLSub] + ' "" *'), wsOk); {Do not Localize}
    if (LastCmdResult.NumericCode = wsOk) then
    begin
      // ds - fixed bug # 506026
      ParseLSubResult(AMailBoxList, LastCmdResult.Text);
    end;
    Result := (LastCmdResult.NumericCode = wsOk);
  end

  else
  begin
    raise EIdConnectionStateError.CreateFmt(RSIMAP4ConnectionStateError,
      [GetConnectionStateName]);
    Result := False;
  end;
end;

function TIdIMAP4.StoreFlags(const AMsgNumList: array of Integer;
  const AStoreMethod: TIdIMAP4StoreDataItem;
  const AFlags: TIdMessageFlagsSet): Boolean;
var LDataItem,
    LMsgSet,
    LFlags : String;
begin
     if ( Length ( AMsgNumList ) = 0 ) then
     begin
          Result := False;
          Exit;
     end;
     LMsgSet := ArrayToNumberStr ( AMsgNumList );
     case AStoreMethod of
       sdReplace: LDataItem := IMAP4StoreDataItem[sdReplaceSilent];
       sdAdd: LDataItem := IMAP4StoreDataItem[sdAddSilent];
       sdRemove: LDataItem := IMAP4StoreDataItem[sdRemoveSilent];
     end;
     LFlags := MessageFlagSetToStr(AFlags);
     if ( FConnectionState = csSelected ) then
     begin
          SendCmd ( NewCmdCounter, ( IMAP4Commands[cmdStore] + ' ' + LMsgSet + ' ' + {Do not Localize}
          LDataItem + ' (' + Trim ( LFlags ) + ')' ), wsOk); {Do not Localize}
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.UIDStoreFlags (const AMsgUID: String;
  const AStoreMethod: TIdIMAP4StoreDataItem;
  const AFlags: TIdMessageFlagsSet): Boolean;
var LDataItem,
    LFlags : String;
begin
     if ( AMsgUID = '' ) then    {Do not Localize}
     begin
          Result := False;
          Exit;
     end;
     case AStoreMethod of
       sdReplace: LDataItem := IMAP4StoreDataItem[sdReplaceSilent];
       sdAdd: LDataItem := IMAP4StoreDataItem[sdAddSilent];
       sdRemove: LDataItem := IMAP4StoreDataItem[sdRemoveSilent];
     end;
     LFlags := MessageFlagSetToStr(AFlags);
     if ( FConnectionState = csSelected ) then
     begin
          SendCmd ( NewCmdCounter, ( IMAP4Commands[cmdUID] + ' ' + IMAP4Commands[cmdStore] + ' ' +    {Do not Localize}
          AMsgUID + ' ' + LDataItem + ' (' + Trim ( LFlags ) + ')' ), wsOk); {Do not Localize}
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.CopyMsgs(const AMsgNumList: array of Integer;
  const AMBName: String): Boolean;
var LMsgSet : String;
begin
     if ( Length ( AMsgNumList ) = 0 ) then
     begin
          Result := False;
          Exit;
     end;
     LMsgSet := ArrayToNumberStr ( AMsgNumList );
     if ( FConnectionState = csSelected ) then
     begin
          SendCmd ( NewCmdCounter, ( IMAP4Commands[cmdCopy] + ' ' + LMsgSet + ' "' + AMBName + '"' ), wsOk); {Do not Localize}
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.AppendMsg(const AMBName: String; AMsg: TIdMessage;
  const AFlags: TIdMessageFlagsSet = []): Boolean;
var LFlags,
    LMsgLiteral: String;
    Ln: Integer;
begin
     if ( ( FConnectionState = csAuthenticated ) or ( FConnectionState = csSelected ) ) then
     begin
          if ( {Assigned (AMsg) and} ( AMBName <> '' ) ) then    {Do not Localize}
          begin
               LFlags := MessageFlagSetToStr(AFlags);
               if ( LFlags <> '' ) then    {Do not Localize}
               begin
                    LFlags := '(' + Trim (LFlags) + ')'; {Do not Localize}
               end;
               LMsgLiteral := '{' + IntToStr ( {Do not Localize}
               Length ((AMsg.Headers.Text) + #13#10 + (AMsg.Body.Text))) + '}'; {Do not Localize}
               SendCmd (NewCmdCounter, (
               IMAP4Commands[cmdAppend] + ' ' + AMBName + ' ' + LFlags + ' ' + LMsgLiteral), wsOK); {Do not Localize}
               if ( LastCmdResult.NumericCode = wsOk ) then
               begin
                    for Ln := 0 to Pred (AMsg.Headers.Count) do
                    begin
                         WriteLn (AMsg.Headers[Ln]);
                    end;
                    WriteLn (#13#10);
                    for Ln := 0 to Pred (AMsg.Body.Count) do
                    begin
                         WriteLn (AMsg.Body[Ln]);
                    end;
                    WriteLn (#13#10);
                    GetResponse(LastCmdCounter, [wsOK]);
               end;
               if ( LastCmdResult.NumericCode = wsOk ) then
               begin
                    ParseSelectResult(FMailBox, LastCmdResult.Text);
               end;
               Result := LastCmdResult.NumericCode = wsOk;
          end
          else
          begin
               Result := False;
          end;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.RetrieveEnvelope(const AMsgNum: Integer;
  AMsg: TIdMessage): Boolean;
var LSlRetrieve : TStringList;
    LStr: String;
    Ln: Integer;
begin
     if ( FConnectionState = csSelected ) then
     begin
          LSlRetrieve := TStringList.Create;
          try
             SendCmd (NewCmdCounter, ( IMAP4Commands[cmdFetch] + ' ' +    {Do not Localize}
             IntToStr ( AMsgNum ) + ' (' + {Do not Localize}
             IMAP4FetchDataItem[fdEnvelope] + ')'), wsOK); {Do not Localize}
             if ( LastCmdResult.NumericCode = wsOk ) then
             begin
                  BreakApart ( LastCmdResult.Text[0], ' ', LSlRetrieve ); {Do not Localize}
                  if ( AnsiSameText ( LSlRetrieve[0], IntToStr ( AMsgNum ) ) and
                       AnsiSameText ( LSlRetrieve[1], IMAP4Commands[cmdFetch] ) and
                       AnsiSameText ( LSlRetrieve[2], '(' + IMAP4FetchDataItem[fdEnvelope] ) ) then {Do not Localize}
                  begin
                       LStr := Copy ( LastCmdResult.Text[0],
                       ( Pos ( IMAP4FetchDataItem[fdEnvelope] + ' (', LastCmdResult.Text[0] ) + {Do not Localize}
                       Length ( IMAP4FetchDataItem[fdEnvelope] + ' (' ) ), {Do not Localize}
                       Length ( LastCmdResult.Text[0] ) );
                       if ( LastCmdResult.Text.Count > 2 ) then
                       begin
                            for Ln := 1 to Pred (Pred (LastCmdResult.Text.Count)) do
                            begin
                                 LStr := LStr + LastCmdResult.Text[Ln];
                            end;
                       end;
                       LStr := Copy (LStr, 1, Length (LStr) - 2);
                       ParseEnvelopeResult (AMsg, LStr);
                  end;
             end;
          finally
                 LSlRetrieve.Free;
          end;
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;


function TIdIMAP4.UIDRetrieveEnvelope(const AMsgUID: String;
  AMsg: TIdMessage): Boolean;
var LSlRetrieve : TStringList;
    LStr: String;
    Ln: Integer;
begin
     if ( FConnectionState = csSelected ) then
     begin
          LSlRetrieve := TStringList.Create;
          try
             SendCmd (NewCmdCounter, ( IMAP4Commands[cmdUID] + ' ' + IMAP4Commands[cmdFetch] + ' ' +    {Do not Localize}
             AMsgUID + ' (' + IMAP4FetchDataItem[fdEnvelope] + ')'), wsOK);    {Do not Localize}
             if ( LastCmdResult.NumericCode = wsOk ) then
             begin
                  BreakApart ( LastCmdResult.Text[0], ' ', LSlRetrieve ); {Do not Localize}
                  if ( AnsiSameText ( LSlRetrieve[1], IMAP4Commands[cmdFetch] ) and
                       AnsiSameText ( LSlRetrieve[2], '(' + IMAP4FetchDataItem[fdUID] ) and    {Do not Localize}
                       AnsiSameText ( LSlRetrieve[3], AMsgUID ) and
                       AnsiSameText ( LSlRetrieve[4], IMAP4FetchDataItem[fdEnvelope] ) ) then {Do not Localize}
                  begin
                       LStr := Copy ( LastCmdResult.Text[0],
                       ( Pos ( IMAP4FetchDataItem[fdEnvelope] + ' (', LastCmdResult.Text[0] ) + {Do not Localize}
                       Length ( IMAP4FetchDataItem[fdEnvelope] + ' (' ) ), {Do not Localize}
                       Length ( LastCmdResult.Text[0] ) );
                       if ( LastCmdResult.Text.Count > 2 ) then
                       begin
                            for Ln := 1 to Pred (Pred (LastCmdResult.Text.Count)) do
                            begin
                                 LStr := LStr + LastCmdResult.Text[Ln];
                            end;
                       end;
                       LStr := Copy (LStr, 1, Length (LStr) - 2);
                       ParseEnvelopeResult (AMsg, LStr);
                  end;
             end;
          finally
                 LSlRetrieve.Free;
          end;
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.RetrieveAllEnvelopes(
  AMsgList: TIdMessageCollection): Boolean;
var LStr: String;
    Ln: Integer;
    LMsgItem: TIdMessageItem;
begin
     if ( FConnectionState = csSelected ) then
     begin
          SendCmd (NewCmdCounter, ( IMAP4Commands[cmdFetch] + ' 1:* (' + {Do not Localize}
          IMAP4FetchDataItem[fdEnvelope] + ')'), wsOK); {Do not Localize}
          if ( LastCmdResult.NumericCode = wsOk ) then
          begin
               Ln := 0;
               while Ln < Pred (LastCmdResult.Text.Count) do
               begin
                    if ( ( Pos ( IMAP4Commands[cmdFetch], LastCmdResult.Text[Ln] ) > 0 ) and
                         ( Pos ( IMAP4FetchDataItem[fdEnvelope] + ' (', LastCmdResult.Text[Ln] ) > 0 ) ) then    {Do not Localize}
                    begin
                         LStr := Copy ( LastCmdResult.Text[Ln],
                         ( Pos ( IMAP4FetchDataItem[fdEnvelope] + ' (', LastCmdResult.Text[Ln] ) + {Do not Localize}
                         Length ( IMAP4FetchDataItem[fdEnvelope] + ' (' ) ), {Do not Localize}
                         Length ( LastCmdResult.Text[Ln] ) );
                         Inc (Ln);
                         while ( not ( Pos ( IMAP4Commands[cmdFetch], LastCmdResult.Text[Ln] ) = 1 ) and
                                 not ( Pos ( IMAP4FetchDataItem[fdEnvelope] + ' (', LastCmdResult.Text[Ln] ) > 0 ) ) do    {Do not Localize}
                         begin
                              LStr := LStr + LastCmdResult.Text[Ln];
                              Inc (Ln);
                         end;
                         LStr := Copy (LStr, 1, Length (LStr) - 2);
                         LMsgItem := AMsgList.Add;
                         ParseEnvelopeResult (LMsgItem.IdMessage, LStr);
                    end;
               end;
          end;
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.UIDRetrieveAllEnvelopes(
  AMsgList: TIdMessageCollection): Boolean;
var LStr: String;
    Ln: Integer;
    LMsgItem: TIdMessageItem;
begin
     if ( FConnectionState = csSelected ) then
     begin
          SendCmd (NewCmdCounter, ( IMAP4Commands[cmdUID] + ' ' + IMAP4Commands[cmdFetch] + ' 1:* (' + {Do not Localize}
          IMAP4FetchDataItem[fdEnvelope] + ')'), wsOK); {Do not Localize}
          if ( LastCmdResult.NumericCode = wsOk ) then
          begin
               Ln := 0;
               while Ln < Pred (LastCmdResult.Text.Count) do
               begin
                    if ( ( Pos ( IMAP4Commands[cmdFetch], LastCmdResult.Text[Ln] ) > 0 ) and
                         ( Pos ( IMAP4FetchDataItem[fdEnvelope] + ' (', LastCmdResult.Text[Ln] ) > 0 ) and    {Do not Localize}
                         ( Pos ( IMAP4FetchDataItem[fdUID], LastCmdResult.Text[Ln] ) > 0 ) ) then
                    begin
                         LMsgItem := AMsgList.Add;
                         //Get UID
                         LStr := Trim ( Copy ( LastCmdResult.Text[Ln],
                         ( Pos ( IMAP4FetchDataItem[fdUID], LastCmdResult.Text[Ln] ) +
                         Length ( IMAP4FetchDataItem[fdUID] ) ), MaxInt ) );
                         LStr := Trim (Copy (LStr, 1,
                         Pos ( ' ', LStr ) - 1));    {Do not Localize}
                         LMsgItem.IdMessage.UID := LStr;
                         //Get envelope
                         LStr := Copy ( LastCmdResult.Text[Ln],
                         ( Pos ( IMAP4FetchDataItem[fdEnvelope] + ' (', LastCmdResult.Text[Ln] ) + {Do not Localize}
                         Length ( IMAP4FetchDataItem[fdEnvelope] + ' (' ) ), {Do not Localize}
                         Length ( LastCmdResult.Text[Ln] ) );
                         Inc (Ln);
                         while ( not ( Pos ( IMAP4Commands[cmdFetch], LastCmdResult.Text[Ln] ) = 1 ) and
                                 not ( Pos ( IMAP4FetchDataItem[fdUID], LastCmdResult.Text[Ln] ) > 0 ) ) do
                         begin
                              LStr := LStr + LastCmdResult.Text[Ln];
                              Inc (Ln);
                         end;
                         LStr := Copy (LStr, 1, Length (LStr) - 2);
                         ParseEnvelopeResult (LMsgItem.IdMessage, LStr);
                    end;
               end;
          end;
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.RetrieveHeader(const AMsgNum: Integer;
  AMsg: TIdMessage): Boolean;
var LSlRetrieve : TStringList;
begin
     if ( FConnectionState = csSelected ) then
     begin
          LSlRetrieve := TStringList.Create;
          try
             WriteLn ( NewCmdCounter + ' ' + ( {Do not Localize}
             IMAP4Commands[cmdFetch] + ' ' + IntToStr ( AMsgNum ) + ' (' + {Do not Localize}
             IMAP4FetchDataItem[fdRFC822Header] + ')' ) ); {Do not Localize}
             if ( GetLineResponse ( GetCmdCounter, [wsOk] ) = wsOk ) then
             begin
                  BreakApart ( LastCmdResult.Text[0], ' ', LSlRetrieve ); {Do not Localize}
                  if ( AnsiSameText ( LSlRetrieve[0], IntToStr ( AMsgNum ) ) and
                       AnsiSameText ( LSlRetrieve[1], IMAP4Commands[cmdFetch] ) and
                       AnsiSameText ( LSlRetrieve[2], '(' + IMAP4FetchDataItem[fdRFC822Header] ) ) then {Do not Localize}
                  begin
                       ReceiveHeader ( AMsg, ')' ); {Do not Localize}
                       GetResponse ( GetCmdCounter, [wsOk] );
                  end;
             end;
          finally
                 LSlRetrieve.Free;
          end;
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.UIDRetrieveHeader(const AMsgUID: String;
  AMsg: TIdMessage): Boolean;
var LSlRetrieve : TStringList;
begin
     if ( FConnectionState = csSelected ) then
     begin
          LSlRetrieve := TStringList.Create;
          try
             WriteLn ( NewCmdCounter + ' ' + ( IMAP4Commands[cmdUID] + ' ' + IMAP4Commands[cmdFetch] + ' ' +    {Do not Localize}
             AMsgUID + ' (' + IMAP4FetchDataItem[fdRFC822Header] + ')' ) );    {Do not Localize}
             if ( GetLineResponse ( GetCmdCounter, [wsOk] ) = wsOk ) then
             begin
                  BreakApart ( LastCmdResult.Text[0], ' ', LSlRetrieve ); {Do not Localize}
                  if ( AnsiSameText ( LSlRetrieve[1], IMAP4Commands[cmdFetch] ) and
                       AnsiSameText ( LSlRetrieve[2], '(' + IMAP4FetchDataItem[fdRFC822Header] ) and    {Do not Localize}
                       AnsiSameText ( LSlRetrieve[3], AMsgUID ) and
                       AnsiSameText ( LSlRetrieve[4], IMAP4FetchDataItem[fdRFC822Header] ) ) then {Do not Localize}
                  begin
                       ReceiveHeader ( AMsg, ')' ); {Do not Localize}
                       GetResponse ( GetCmdCounter, [wsOk] );
                  end;
             end;
          finally
                 LSlRetrieve.Free;
          end;
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.UIDRetrieveAllHeaders(
  AMsgList: TIdMessageCollection): Boolean;
begin
     Result := False;
end;

function TIdIMAP4.Retrieve(const AMsgNum: Integer;
  AMsg: TIdMessage): Boolean;
var LSlRetrieve : TStringList;
    LStr: String;
    Fn: Integer;
    LFlags: TIdMessageFlagsSet;
begin
     if ( FConnectionState = csSelected ) then
     begin
          LSlRetrieve := TStringList.Create;
          try
             WriteLn (
             NewCmdCounter + ' ' + ( IMAP4Commands[cmdFetch] + ' ' + IntToStr ( AMsgNum ) + {Do not Localize}
             ' (' + IMAP4FetchDataItem[fdRFC822] + ')' ) ); {Do not Localize}
             if ( GetLineResponse ( GetCmdCounter, [wsOk] ) = wsOk ) then
             begin
                  BreakApart ( LastCmdResult.Text[0], ' ', LSlRetrieve ); {Do not Localize}
                  if ( AnsiSameText ( LSlRetrieve[0], IntToStr ( AMsgNum ) ) and
                       AnsiSameText ( LSlRetrieve[1], IMAP4Commands[cmdFetch] ) and
                       AnsiSameText ( LSlRetrieve[2], '(' + IMAP4FetchDataItem[fdRFC822] ) ) then {Do not Localize}
                  begin
                       if ReceiveHeader(AMsg) = '' then {Do not Localize} // Only retreive the body if we do not already have a full RFC
                       begin
                            ReceiveBody ( AMsg, ')' ); {Do not Localize}
                       end;
                       GetResponse ( GetCmdCounter, [wsOk] );
                       for Fn := 0 to ( LastCmdResult.Text.Count - 1 ) do
                       begin
                            if ( Pos ( ( IntToStr ( AMsgNum ) + ' FETCH (FLAGS ' ), {Do not Localize}
                               LastCmdResult.Text[Fn] ) > 0 ) then
                            begin
                                 LStr := Copy ( LastCmdResult.Text[Fn],
                                 ( Pos ( 'FLAGS (', LastCmdResult.Text[Fn] ) + {Do not Localize}
                                 Length ( 'FLAGS (' ) ), {Do not Localize}
                                 Length ( LastCmdResult.Text[Fn] ) );
                                 LStr := Copy ( LStr, 1, ( Pos ( '))', LStr ) - 1 ) ); {Do not Localize}
                                 ParseMessageFlagString ( LStr, LFlags );
                                 AMsg.Flags := LFlags;
                            end;
                       end;
                  end;
             end;
          finally
                 LSlRetrieve.Free;
          end;
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.RetrievePeek(const AMsgNum: Integer;
  AMsg: TIdMessage): Boolean;
var LSlRetrieve : TStringList;
begin
     if ( FConnectionState = csSelected ) then
     begin
          LSlRetrieve := TStringList.Create;
          try
             WriteLn (
             NewCmdCounter + ' ' + ( IMAP4Commands[cmdFetch] + ' ' + IntToStr ( AMsgNum ) + {Do not Localize}
             ' (' + IMAP4FetchDataItem[fdBodyPeek] + ')' ) ); {Do not Localize}
             if ( GetLineResponse ( GetCmdCounter, [wsOk] ) = wsOk ) then
             begin
                  BreakApart ( LastCmdResult.Text[0], ' ', LSlRetrieve ); {Do not Localize}
                  if ( AnsiSameText ( LSlRetrieve[0], IntToStr ( AMsgNum ) ) and
                       AnsiSameText ( LSlRetrieve[1], IMAP4Commands[cmdFetch] ) and
                       AnsiSameText ( LSlRetrieve[2], '(' + {'BODY[]'} IMAP4FetchDataItem[fdBodyPeek] ) ) then {Do not Localize}
                  begin
                       if ReceiveHeader(AMsg) = '' then {Do not Localize} // Only retreive the body if we do not already have a full RFC
                       begin
                            ReceiveBody ( AMsg, ')' ); {Do not Localize}
                       end;
                       GetResponse ( GetCmdCounter, [wsOk] );
                  end;
             end;
          finally
                 LSlRetrieve.Free;
          end;
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;


function TIdIMAP4.UIDRetrieve(const AMsgUID: String;
  AMsg: TIdMessage): Boolean;
var LSlRetrieve : TStringList;
    LStr: String;
    Fn: Integer;
    LFlags: TIdMessageFlagsSet;
begin
     if ( FConnectionState = csSelected ) then
     begin
          LSlRetrieve := TStringList.Create;
          try
             WriteLn (
             NewCmdCounter + ' ' + ( IMAP4Commands[cmdUID] + ' ' + IMAP4Commands[cmdFetch] + ' ' + AMsgUID + {Do not Localize}
             ' (' + IMAP4FetchDataItem[fdRFC822] + ')' ) ); {Do not Localize}
             if ( GetLineResponse ( GetCmdCounter, [wsOk] ) = wsOk ) then
             begin
                  BreakApart ( LastCmdResult.Text[0], ' ', LSlRetrieve ); {Do not Localize}
                  if ( AnsiSameText ( LSlRetrieve[1], IMAP4Commands[cmdFetch] ) and
                       AnsiSameText ( LSlRetrieve[2], '(' + IMAP4FetchDataItem[fdUID] ) and {Do not Localize}
                       AnsiSameText ( LSlRetrieve[3], AMsgUID ) and
                       AnsiSameText ( LSlRetrieve[4], IMAP4FetchDataItem[fdRFC822] ) ) then
                  begin
                       if ReceiveHeader(AMsg) = '' then {Do not Localize} // Only retreive the body if we do not already have a full RFC
                       begin
                            ReceiveBody ( AMsg, ')' ); {Do not Localize}
                       end;
                       GetResponse ( GetCmdCounter, [wsOk] );
                       for Fn := 0 to ( LastCmdResult.Text.Count - 1 ) do
                       begin
                            if ( Pos ( ( AMsgUID + ' FETCH (FLAGS ' ), {Do not Localize}
                               LastCmdResult.Text[Fn] ) > 0 ) then
                            begin
                                 LStr := Copy ( LastCmdResult.Text[Fn],
                                 ( Pos ( 'FLAGS (', LastCmdResult.Text[Fn] ) + {Do not Localize}
                                 Length ( 'FLAGS (' ) ), {Do not Localize}
                                 Length ( LastCmdResult.Text[Fn] ) );
                                 LStr := Copy ( LStr, 1, ( Pos ( '))', LStr ) - 1 ) ); {Do not Localize}
                                 ParseMessageFlagString ( LStr, LFlags );
                                 AMsg.Flags := LFlags;
                            end;
                       end;
                  end;
             end;
          finally
                 LSlRetrieve.Free;
          end;
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.UIDRetrievePeek(const AMsgUID: String;
  AMsg: TIdMessage): Boolean;
var LSlRetrieve : TStringList;
begin
     if ( FConnectionState = csSelected ) then
     begin
          LSlRetrieve := TStringList.Create;
          try
             WriteLn (
             NewCmdCounter + ' ' + ( IMAP4Commands[cmdUID] + ' ' + IMAP4Commands[cmdFetch] + ' ' +    {Do not Localize}
             AMsgUID + ' (' + IMAP4FetchDataItem[fdBodyPeek] + ')' ) ); {Do not Localize}
             if ( GetLineResponse ( GetCmdCounter, [wsOk] ) = wsOk ) then
             begin
                  BreakApart ( LastCmdResult.Text[0], ' ', LSlRetrieve ); {Do not Localize}
                  if ( AnsiSameText ( LSlRetrieve[1], IMAP4Commands[cmdFetch] ) and
                       AnsiSameText ( LSlRetrieve[2], '(' + IMAP4FetchDataItem[fdUID] ) and {Do not Localize}
                       AnsiSameText ( LSlRetrieve[3], AMsgUID ) ) then
                  begin
                       if ReceiveHeader(AMsg) = '' then {Do not Localize} // Only retreive the body if we do not already have a full RFC
                       begin
                            ReceiveBody ( AMsg, ')' ); {Do not Localize}
                       end;
                       GetResponse ( GetCmdCounter, [wsOk] );
                  end;
             end;
          finally
                 LSlRetrieve.Free;
          end;
          Result := LastCmdResult.NumericCode = wsOk;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.RetrieveAllHeaders(
  AMsgList: TIdMessageCollection): Boolean;
var LMsgItem : TIdMessageItem;
    Ln : Integer;
begin
     if ( FConnectionState = csSelected ) then
     begin
          if ( AMsgList <> nil ) then
          begin
               Result := True;
               for Ln := 1 to FMailBox.TotalMsgs do
               begin
                    LMsgItem := AMsgList.Add;
                    if not RetrieveHeader ( Ln, LMsgItem.IdMessage ) then
                    begin
                         Result := False;
                         Break;
                    end;
               end;
          end
          else
          begin
               Result := False;
          end;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.RetrieveAllMsgs(
  AMsgList: TIdMessageCollection): Boolean;
var LMsgItem : TIdMessageItem;
    Ln : Integer;
begin
     if ( FConnectionState = csSelected ) then
     begin
          if ( AMsgList <> nil ) then
          begin
               Result := True;
               for Ln := 1 to FMailBox.TotalMsgs do
               begin
                    LMsgItem := AMsgList.Add;
                    if not Retrieve ( Ln, LMsgItem.IdMessage ) then
                    begin
                         Result := False;
                         Break;
                    end;
               end;
          end
          else
          begin
               Result := False;
          end;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.DeleteMsgs(const AMsgNumList: array of Integer): Boolean;
begin
     Result := StoreFlags (AMsgNumList, sdAdd, [mfDeleted]);
end;

function TIdIMAP4.UIDDeleteMsg(const AMsgUID: String): Boolean;
begin
     Result := UIDStoreFlags (AMsgUID, sdAdd, [mfDeleted]);
end;

function TIdIMAP4.RetrieveMailBoxSize: Integer;
var LSlRetrieve : TStringList;
    Ln : Integer;
begin
     if ( FConnectionState = csSelected ) then
     begin
          if ( FMailBox.TotalMsgs > 0 ) then
          begin
               SendCmd ( NewCmdCounter, ( IMAP4Commands[cmdFetch] + ' 1:' + IntToStr ( FMailBox.TotalMsgs ) + {Do not Localize}
               ' (' + IMAP4FetchDataItem[fdRFC822Size] + ')' ), wsOk ); {Do not Localize}
               if ( LastCmdResult.NumericCode = wsOk ) then
               begin
                    Result := 0;
                    LSlRetrieve := TStringList.Create;
                    try
                       for Ln := 0 to ( FMailBox.TotalMsgs - 1 )do
                       begin
                            BreakApart ( LastCmdResult.Text[Ln], ' ', LSlRetrieve ); {Do not Localize}
                            if ( AnsiSameText ( LSlRetrieve[0], IntToStr ( Ln + 1 ) ) and
                                 AnsiSameText ( LSlRetrieve[1], IMAP4Commands[cmdFetch] ) and
                                 AnsiSameText ( LSlRetrieve[2], '(' + IMAP4FetchDataItem[fdRFC822Size] ) ) then {Do not Localize}
                               Result := Result + StrToInt (
                               Copy ( LSlRetrieve[3], 1, ( Length ( LSlRetrieve[3] ) - 1 ) ) )
                            else
                            begin
                                 Result := 0;
                                 Break;
                            end;
                            LSlRetrieve.Clear;
                       end;
                    finally
                           LSlRetrieve.Free;
                    end;
               end
               else
                   Result := -1;
          end
          else
              Result := 0;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := -1;
     end;
end;

function TIdIMAP4.UIDRetrieveMailBoxSize: Integer;
var LSlRetrieve : TStringList;
    Ln : Integer;
begin
     if ( FConnectionState = csSelected ) then
     begin
          if ( FMailBox.TotalMsgs > 0 ) then
          begin
               SendCmd ( NewCmdCounter, ( IMAP4Commands[cmdUID] + ' ' + IMAP4Commands[cmdFetch] + ' 1:*' +    {Do not Localize}
               ' (' + IMAP4FetchDataItem[fdRFC822Size] + ')' ), wsOk ); {Do not Localize}
               if ( LastCmdResult.NumericCode = wsOk ) then
               begin
                    Result := 0;
                    LSlRetrieve := TStringList.Create;
                    try
                       for Ln := 0 to ( FMailBox.TotalMsgs - 1 )do
                       begin
                            BreakApart ( LastCmdResult.Text[Ln], ' ', LSlRetrieve ); {Do not Localize}
                            if ( AnsiSameText ( LSlRetrieve[0], IntToStr ( Ln + 1 ) ) and
                                 AnsiSameText ( LSlRetrieve[1], IMAP4Commands[cmdFetch] ) and
                                 AnsiSameText ( LSlRetrieve[2], '(' + IMAP4Commands[cmdUID] ) and    {Do not Localize}
                                 AnsiSameText ( LSlRetrieve[4], IMAP4FetchDataItem[fdRFC822Size] ) ) then {Do not Localize}
                               Result := Result + StrToInt (
                               Copy ( LSlRetrieve[5], 1, ( Length ( LSlRetrieve[3] ) - 1 ) ) )
                            else
                            begin
                                 Result := 0;
                                 Break;
                            end;
                            LSlRetrieve.Clear;
                       end;
                    finally
                           LSlRetrieve.Free;
                    end;
               end
               else
                   Result := -1;
          end
          else
              Result := 0;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := -1;
     end;
end;

function TIdIMAP4.RetrieveMsgSize(const AMsgNum: Integer): Integer;
var LSlRetrieve : TStringList;
begin
     if ( FConnectionState = csSelected ) then
     begin
          SendCmd ( NewCmdCounter, ( IMAP4Commands[cmdFetch] + ' ' + IntToStr ( AMsgNum ) + {Do not Localize}
          ' (' + IMAP4FetchDataItem[fdRFC822Size] + ')' ), wsOk ); {Do not Localize}
          if ( LastCmdResult.NumericCode = wsOk ) then
          begin
               LSlRetrieve := TStringList.Create;
               try
                  BreakApart ( LastCmdResult.Text[0], ' ', LSlRetrieve ); {Do not Localize}
                  if ( AnsiSameText ( LSlRetrieve[0], IntToStr ( AMsgNum ) ) and
                       AnsiSameText ( LSlRetrieve[1], IMAP4Commands[cmdFetch] ) and
                       AnsiSameText ( LSlRetrieve[2], '(' + IMAP4FetchDataItem[fdRFC822Size] ) ) then {Do not Localize}
                     Result := StrToInt (
                     Copy ( LSlRetrieve[3], 1, ( Length ( LSlRetrieve[3] ) - 1 ) ) )
                  else
                      Result := -1;
               finally
                      LSlRetrieve.Free;
               end;
          end
          else
              Result := -1;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := -1;
     end;
end;

function TIdIMAP4.UIDRetrieveMsgSize(const AMsgUID: String): Integer;
var LSlRetrieve : TStringList;
begin
     if ( FConnectionState = csSelected ) then
     begin
          SendCmd ( NewCmdCounter, ( IMAP4Commands[cmdUID] + ' ' + IMAP4Commands[cmdFetch] +    {Do not Localize}
          ' ' + AMsgUID + ' (' + IMAP4FetchDataItem[fdRFC822Size] + ')' ), wsOk ); {Do not Localize}
          if ( LastCmdResult.NumericCode = wsOk ) then
          begin
               LSlRetrieve := TStringList.Create;
               try
                  BreakApart ( LastCmdResult.Text[0], ' ', LSlRetrieve ); {Do not Localize}
                  if ( AnsiSameText (LSlRetrieve[1], IMAP4Commands[cmdFetch]) and
                       AnsiSameText (LSlRetrieve[2], '(' + IMAP4FetchDataItem[fdUID]) and    {Do not Localize}
                       AnsiSameText (LSlRetrieve[3], AMsgUID) and
                       AnsiSameText (LSlRetrieve[4], IMAP4FetchDataItem[fdRfc822Size]) ) then {Do not Localize}
                  begin
                       Result := StrToInt (Copy (LSlRetrieve[5], 1, (Length (LSlRetrieve[5]) - 1)));
                  end
                  else
                  begin
                       Result := -1;
                  end;
               finally
                      LSlRetrieve.Free;
               end;
          end
          else
              Result := -1;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := -1;
     end;
end;

function TIdIMAP4.CheckMsgSeen(const AMsgNum: Integer): Boolean;
var
  Ln : Integer;
  LSlRetrieve : TStringList;

begin
  Result := False;

  if (FConnectionState = csSelected) then
  begin
    SendCmd(NewCmdCounter, (IMAP4Commands[cmdFetch] + ' ' + IntToStr(AMsgNum) + {Do not Localize}
      ' (' + IMAP4FetchDataItem[fdFlags] + ')' ), wsOk); {Do not Localize}

    if (LastCmdResult.NumericCode = wsOk) then
    begin
      for Ln := 0 to (LastCmdResult.Text.Count - 1) do
      begin
        LSlRetrieve := TStringList.Create;
        try
          // DS 13-Mar-2001 Fix Bug # 494813
          BreakApart(LastCmdResult.Text[Ln], ' ', LSlRetrieve); {Do not Localize}
          if (AnsiSameText(LSlRetrieve[0], IntToStr(AMsgNum)) and
            AnsiSameText(LSlRetrieve[1], IMAP4Commands[cmdFetch]) and
            AnsiSameText(LSlRetrieve[2], '(' + IMAP4FetchDataItem[fdFlags])) then {Do not Localize}
          begin
            Result := (Pos(MessageFlags[mfSeen], LastCmdResult.Text[Ln]) > 0);
          end;
        finally
          LSlRetrieve.Free;
        end;
      end;
    end

    else
    begin
       Result := False;
    end;
  end

  else
  begin
    raise EIdConnectionStateError.CreateFmt(RSIMAP4ConnectionStateError, [GetConnectionStateName]);
    Result := False;
  end;
end;

function TIdIMAP4.UIDCheckMsgSeen(const AMsgUID: String): Boolean;
var LSlRetrieve : TStringList;
begin
     Result := False;
     if ( FConnectionState = csSelected ) then
     begin
          SendCmd ( NewCmdCounter, ( IMAP4Commands[cmdUID] + ' ' + IMAP4Commands[cmdFetch] + ' ' +    {Do not Localize}
          AMsgUID + ' (' + IMAP4FetchDataItem[fdFlags] + ')' ), wsOk ); {Do not Localize}
          if ( LastCmdResult.NumericCode = wsOk ) then
          begin
               LSlRetrieve := TStringList.Create;
               try
                  BreakApart ( LastCmdResult.Text[0], ' ', LSlRetrieve ); {Do not Localize}
                  if ( AnsiSameText (LSlRetrieve[1], IMAP4Commands[cmdFetch]) and
                       AnsiSameText (LSlRetrieve[2], '(' + IMAP4FetchDataItem[fdUID]) and    {Do not Localize}
                       AnsiSameText (LSlRetrieve[3], AMsgUID) and
                       AnsiSameText (LSlRetrieve[4], IMAP4FetchDataItem[fdFlags]) ) then
                  begin
                       if ( Pos ( MessageFlags[mfSeen], LastCmdResult.Text[0] ) > 0 ) then
                       begin
                            Result := True;
                       end
                       else
                       begin
                            Result := False;
                       end;
                  end;
               finally
                      LSlRetrieve.Free;
               end;
          end
          else
          begin
               Result := False;
          end;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.RetrieveFlags(const AMsgNum: Integer; AFlags: {Pointer}TIdMessageFlagsSet): Boolean;
var Ln: Integer;
    LStr: String;
    LSlRetrieve: TStringList;
begin
     Result := False;
     if ( FConnectionState = csSelected ) then
     begin
          SendCmd ( NewCmdCounter, ( IMAP4Commands[cmdFetch] + ' ' + IntToStr ( AMsgNum ) + {Do not Localize}
          ' (' + IMAP4FetchDataItem[fdFlags] + ')' ), wsOk ); {Do not Localize}
          if ( LastCmdResult.NumericCode = wsOk ) then
          begin
               for Ln := 0 to ( LastCmdResult.Text.Count - 1 ) do
               begin
                    LSlRetrieve := TStringList.Create;
                    try
                       BreakApart ( LastCmdResult.Text[0], ' ', LSlRetrieve ); {Do not Localize}
                       if ( AnsiSameText ( LSlRetrieve[0], IntToStr ( AMsgNum ) ) and
                            AnsiSameText ( LSlRetrieve[1], IMAP4Commands[cmdFetch] ) and
                            AnsiSameText ( LSlRetrieve[2], '(' + IMAP4FetchDataItem[fdFlags] ) ) then {Do not Localize}
                       begin
                            LStr := Copy ( LastCmdResult.Text[Ln],
                            ( Pos ( IMAP4FetchDataItem[fdFlags] + ' (', LastCmdResult.Text[Ln] ) +    {Do not Localize}
                            Length ( IMAP4FetchDataItem[fdFlags] + ' (' ) ), {Do not Localize}
                            Length ( LastCmdResult.Text[Ln] ) );
                            LStr := Copy ( LStr, 1, ( Pos ( '))', LStr ) - 1 ) ); {Do not Localize}
                            ParseMessageFlagString ( LStr, AFlags );
                            Result := True;
                       end;
                    finally
                           LSlRetrieve.Free;
                    end;
               end;
          end
          else
              Result := False;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;


function TIdIMAP4.UIDRetrieveFlags(const AMsgUID: String;
  AFlags: TIdMessageFlagsSet): Boolean;
var Ln: Integer;
    LStr: String;
    LSlRetrieve: TStringList;
begin
     Result := False;
     if ( FConnectionState = csSelected ) then
     begin
          SendCmd ( NewCmdCounter, ( IMAP4Commands[cmdUID] + ' ' + IMAP4Commands[cmdFetch] + ' ' +    {Do not Localize}
          AMsgUID + ' (' + IMAP4FetchDataItem[fdFlags] + ')' ), wsOk );    {Do not Localize}
          if ( LastCmdResult.NumericCode = wsOk ) then
          begin
               for Ln := 0 to ( LastCmdResult.Text.Count - 1 ) do
               begin
                    LSlRetrieve := TStringList.Create;
                    try
                       BreakApart ( LastCmdResult.Text[0], ' ', LSlRetrieve ); {Do not Localize}
                       if ( AnsiSameText ( LSlRetrieve[1], IMAP4Commands[cmdFetch] ) and
                            AnsiSameText ( LSlRetrieve[2], '(' + IMAP4FetchDataItem[fdUID] ) and    {Do not Localize}
                            AnsiSameText ( LSlRetrieve[3], AMsgUID ) and
                            AnsiSameText ( LSlRetrieve[4], IMAP4FetchDataItem[fdFlags] ) ) then {Do not Localize}
                       begin
                            LStr := Copy ( LastCmdResult.Text[Ln],
                            ( Pos ( IMAP4FetchDataItem[fdFlags] + ' (', LastCmdResult.Text[Ln] ) +    {Do not Localize}
                            Length ( IMAP4FetchDataItem[fdFlags] + ' (' ) ), {Do not Localize}
                            Length ( LastCmdResult.Text[Ln] ) );
                            LStr := Copy ( LStr, 1, ( Pos ( '))', LStr ) - 1 ) ); {Do not Localize}
                            ParseMessageFlagString ( LStr, AFlags );
                            Result := True;
                       end;
                    finally
                           LSlRetrieve.Free;
                    end;
               end;
          end
          else
              Result := False;
     end
     else
     begin
          raise EIdConnectionStateError.CreateFmt (
                RSIMAP4ConnectionStateError, [GetConnectionStateName] );
          Result := False;
     end;
end;

function TIdIMAP4.GetConnectionStateName: String;
begin
     case FConnectionState of
       csAny : Result := RSIMAP4ConnectionStateAny;
       csNonAuthenticated : Result := RSIMAP4ConnectionStateNonAuthenticated;
       csAuthenticated : Result := RSIMAP4ConnectionStateAuthenticated;
       csSelected : Result := RSIMAP4ConnectionStateSelected;
     end;
end;

{ ...TIdIMAP4 Commands }

{ Parser Functions... }

procedure TIdIMAP4.ParseExpungeResult(AMB: TIdMailBox;
  CmdResultDetails: TStrings);
var Ln : Integer;
    LSlExpunge : TStringList;
begin
     LSlExpunge := TStringList.Create;
     SetLength ( AMB.DeletedMsgs, 0 );
     try
        if ( CmdResultDetails.Count > 1 ) then
        for Ln := 0 to ( CmdResultDetails.Count - 2 ) do
        begin
             BreakApart ( CmdResultDetails[Ln], ' ', LSlExpunge ); {Do not Localize}
             if AnsiSameText ( LSlExpunge[1], IMAP4Commands[cmdExpunge] ) then
             begin
                  SetLength ( AMB.DeletedMsgs, ( Length ( AMB.DeletedMsgs ) + 1 ) );
                  AMB.DeletedMsgs[Length ( AMB.DeletedMsgs ) - 1] := StrToInt ( LSlExpunge[0] );
             end;
             LSlExpunge.Clear;
        end;
     finally
            LSlExpunge.Free;
     end;
end;

procedure TIdIMAP4.ParseMessageFlagString(AFlagsList: String;
  var AFlags: TIdMessageFlagsSet);
var LSlFlags : TStringList;
    Ln : Integer;
begin
     LSlFlags := TStringList.Create;
     AFlags := [];
     BreakApart ( AFlagsList, ' ', LSlFlags ); {Do not Localize}
     try
        for Ln := 0 to ( LSlFlags.Count - 1 ) do
        begin
             if AnsiSameText ( LSlFlags[Ln], MessageFlags[mfAnswered] ) then
             begin
                  AFlags := AFlags + [mfAnswered];
             end
             else if AnsiSameText ( LSlFlags[Ln], MessageFlags[mfFlagged] ) then
             begin
                  AFlags := AFlags + [mfFlagged];
             end
             else if AnsiSameText ( LSlFlags[Ln], MessageFlags[mfDeleted] ) then
             begin
                  AFlags := AFlags + [mfDeleted];
             end
             else if AnsiSameText ( LSlFlags[Ln], MessageFlags[mfDraft] ) then
             begin
                  AFlags := AFlags + [mfDraft];
             end
             else if AnsiSameText ( LSlFlags[Ln], MessageFlags[mfSeen] ) then
             begin
                  AFlags := AFlags + [mfSeen];
             end
             else if AnsiSameText ( LSlFlags[Ln], MessageFlags[mfRecent] ) then
             begin
                  AFlags := AFlags + [mfRecent];
             end;
        end;
     finally
            LSlFlags.Free;
     end;
end;

procedure TIdIMAP4.ParseMailBoxAttributeString(AAttributesList: String;
  var AAttributes: TIdMailBoxAttributesSet);
var LSlAttributes : TStringList;
    Ln : Integer;
begin
     LSlAttributes := TStringList.Create;
     AAttributes := [];
     BreakApart ( AAttributesList, ' ', LSlAttributes ); {Do not Localize}
     try
        for Ln := 0 to ( LSlAttributes.Count - 1 ) do
        begin
             if AnsiSameText ( LSlAttributes[Ln], MailBoxAttributes[maNoinferiors] ) then
             begin
                  AAttributes := AAttributes + [maNoinferiors];
             end
             else if AnsiSameText ( LSlAttributes[Ln], MailBoxAttributes[maNoselect] ) then
             begin
                  AAttributes := AAttributes + [maNoselect];
             end
             else if AnsiSameText ( LSlAttributes[Ln], MailBoxAttributes[maMarked] ) then
             begin
                  AAttributes := AAttributes + [maMarked];
             end
             else if AnsiSameText ( LSlAttributes[Ln], MailBoxAttributes[maUnmarked] ) then
             begin
                  AAttributes := AAttributes + [maUnmarked];
             end;
        end;
     finally
            LSlAttributes.Free;
     end;
end;

procedure TIdIMAP4.ParseSearchResult(AMB: TIdMailBox;
  CmdResultDetails: TStrings);
var Ln: Integer;
    LSlSearch: TStringList;
begin
     LSlSearch := TStringList.Create;
     SetLength ( AMB.SearchResult, 0 );
     try
        if ( ( Pos ( IMAP4Commands[cmdSearch], CmdResultDetails[0] ) > 0 ) and
             ( CmdResultDetails.Count > 1 ) ) then
        begin
             BreakApart ( CmdResultDetails[0], ' ', LSlSearch ); {Do not Localize}
             for Ln := 1 to ( LSlSearch.Count - 1 ) do
             begin
                  SetLength ( AMB.SearchResult, ( Length ( AMB.SearchResult ) + 1 ) );
                  AMB.SearchResult[Length ( AMB.SearchResult ) - 1] := StrToInt ( LSlSearch[Ln] );
             end;
        end;
     finally
            LSlSearch.Free;
     end;
end;

procedure TIdIMAP4.ParseStatusResult(AMB: TIdMailBox;
  CmdResultDetails: TStrings);
var Ln : Integer;
    LStr : String;
    LSlStatus : TStringList;
begin
     LSlStatus := TStringList.Create;
     try
        if ( ( Pos ( IMAP4Commands[cmdStatus], CmdResultDetails[0] ) > 0 ) and
             ( CmdResultDetails.Count > 1 ) ) then
        begin
             LStr := Copy ( CmdResultDetails[0],
             ( Pos ( IMAP4Commands[cmdStatus], CmdResultDetails[0] ) +
             Length ( IMAP4Commands[cmdStatus] ) ),
             Length ( CmdResultDetails[0] ) );
             AMB.Name := Trim ( Copy ( LStr, 1, ( Pos ( '(', LStr ) - 1 ) ) ); {Do not Localize}
             LStr := Copy ( LStr, ( Pos ( '(', LStr ) + 1 ), {Do not Localize}
             ( Length ( LStr ) - Pos ( '(', LStr ) - 1 ) ); {Do not Localize}
             BreakApart ( LStr, ' ', LSlStatus ); {Do not Localize}
             Ln := 0;
             while ( Ln < LSlStatus.Count ) do
             begin
                  if AnsiSameText ( LSlStatus[Ln], IMAP4StatusDataItem[mdMessages] ) then
                  begin
                       AMB.TotalMsgs := StrToInt ( LSlStatus[Ln + 1] );
                       Ln := Ln + 2;
                  end
                  else if AnsiSameText ( LSlStatus[Ln], IMAP4StatusDataItem[mdRecent] ) then
                  begin
                       AMB.RecentMsgs := StrToInt ( LSlStatus[Ln + 1] );
                       Ln := Ln + 2;
                  end
                  else if AnsiSameText ( LSlStatus[Ln], IMAP4StatusDataItem[mdUnseen] ) then
                  begin
                       AMB.UnseenMsgs := StrToInt ( LSlStatus[Ln + 1] );
                       Ln := Ln + 2;
                  end
                  else if AnsiSameText ( LSlStatus[Ln], IMAP4StatusDataItem[mdUIDNext] ) then
                  begin
                       AMB.UIDNext := LSlStatus[Ln + 1];
                       Ln := Ln + 2;
                  end
                  else if AnsiSameText ( LSlStatus[Ln], IMAP4StatusDataItem[mdUIDValidity] ) then
                  begin
                       AMB.UIDValidity := LSlStatus[Ln + 1];
                       Ln := Ln + 2;
                  end;
             end;
        end;
     finally
            LSlStatus.Free;
     end;
end;

procedure TIdIMAP4.ParseSelectResult(AMB : TIdMailBox;
  CmdResultDetails: TStrings);
var Ln : Integer;
    LStr : String;
    LFlags: TIdMessageFlagsSet;
begin
     AMB.Clear;
     for Ln := 0 to ( CmdResultDetails.Count - 1 ) do
     begin
          if ( Pos ( 'EXISTS', CmdResultDetails[Ln] ) > 0 ) then {Do not Localize}
          begin
               AMB.TotalMsgs := StrToInt ( Trim ( Copy ( CmdResultDetails[Ln], 0,
               ( Pos ( 'EXISTS', CmdResultDetails[Ln] ) - 1 ) ) ) ); {Do not Localize}
          end;
          if ( Pos ( 'RECENT', CmdResultDetails[Ln] ) > 0 ) then {Do not Localize}
          begin
               AMB.RecentMsgs := StrToInt ( Trim ( Copy ( CmdResultDetails[Ln], 0,
               ( Pos ( 'RECENT', CmdResultDetails[Ln] ) - 1 ) ) ) ); {Do not Localize}
          end;
          if ( Pos ( '[UIDVALIDITY', CmdResultDetails[Ln] ) > 0 ) then {Do not Localize}
          begin
               AMB.UIDValidity := Trim ( Copy ( CmdResultDetails[Ln],
               ( Pos ( '[UIDVALIDITY', CmdResultDetails[Ln] ) + {Do not Localize}
               Length ( '[UIDVALIDITY' ) ), {Do not Localize}
               ( Pos ( ']', CmdResultDetails[Ln] ) -    {Do not Localize}
               ( Pos ( '[UIDVALIDITY', CmdResultDetails[Ln] ) +    {Do not Localize}
               Length ( '[UIDVALIDITY' ) ) ) ) ); {Do not Localize}
          end;
          if ( Pos ( '[UIDNEXT', CmdResultDetails[Ln] ) > 0 ) then {Do not Localize}
          begin
               AMB.UIDNext := Trim ( Copy ( CmdResultDetails[Ln],
               ( Pos ( '[UIDNEXT', CmdResultDetails[Ln] ) + {Do not Localize}
               Length ( '[UIDNEXT' ) ), {Do not Localize}
               ( Pos ( ']', CmdResultDetails[Ln] ) -    {Do not Localize}
               ( Pos ( '[UIDNEXT', CmdResultDetails[Ln] ) +    {Do not Localize}
               Length ( '[UIDNEXT' ) ) - 1 ) ) ); {Do not Localize}
          end;
          if ( Pos ( 'FLAGS', CmdResultDetails[Ln] ) > 0 ) then {Do not Localize}
          begin
               ParseMessageFlagString ( Copy ( CmdResultDetails[Ln],
               ( Pos ( '(', CmdResultDetails[Ln] ) + 1 ), {Do not Localize}
               ( Pos ( ')', CmdResultDetails[Ln] ) -    {Do not Localize}
               Pos ( '(', CmdResultDetails[Ln] ) - 1 ) ), LFlags ); {Do not Localize}
               AMB.Flags := LFlags;
          end;
          if ( Pos ( '[PERMANENTFLAGS', CmdResultDetails[Ln] ) > 0 ) then {Do not Localize}
          begin
               ParseMessageFlagString ( Copy ( CmdResultDetails[Ln],
               ( Pos ( '(', CmdResultDetails[Ln] ) + 1 ), {Do not Localize}
               ( Pos ( ')', CmdResultDetails[Ln] ) -    {Do not Localize}
               Pos ( '(', CmdResultDetails[Ln] ) - 1 ) ), {Do not Localize}
               LFlags );
               AMB.ChangeableFlags := LFlags;
          end;
          if ( Pos ( '[UNSEEN', CmdResultDetails[Ln] ) > 0 ) then {Do not Localize}
          begin
               AMB.FirstUnseenMsg := StrToInt ( Trim ( Copy ( CmdResultDetails[Ln],
               ( Pos ( '[UNSEEN', CmdResultDetails[Ln] ) + {Do not Localize}
               Length ( '[UNSEEN' ) ), {Do not Localize}
               ( Pos ( ']', CmdResultDetails[Ln] ) -    {Do not Localize}
               ( Pos ( '[UNSEEN', CmdResultDetails[Ln] ) +    {Do not Localize}
               Length ( '[UNSEEN' ) ) ) ) ) ); {Do not Localize}
          end;
          if ( Pos ( '[READ-', CmdResultDetails[Ln] ) > 0 ) then {Do not Localize}
          begin
               LStr := Trim ( Copy ( CmdResultDetails[Ln],
                    ( Pos ( '[', CmdResultDetails[Ln] ) ), {Do not Localize}
                    ( Pos ( ']', CmdResultDetails[Ln] ) - Pos ( '[', CmdResultDetails[Ln] ) + 1 ) ) ); {Do not Localize}
               if AnsiSameText ( LStr, '[READ-WRITE]' ) then {Do not Localize}
               begin
                    AMB.State := msReadWrite;
               end
               else if AnsiSameText ( LStr, '[READ-ONLY]' ) then {Do not Localize}
               begin
                    AMB.State := msReadOnly;
               end;
          end;
          if ( Pos ( '[ALERT]', CmdResultDetails[Ln] ) > 0 ) then {Do not Localize}
          begin
               LStr := Trim ( Copy ( CmdResultDetails[Ln],
               ( Pos ( '[ALERT]', CmdResultDetails[Ln] ) + {Do not Localize}
               Length ( '[ALERT]' ) ), MaxInt ) ); {Do not Localize}
               if ( LStr <> '' ) then    {Do not Localize}
               begin
                    DoAlert ( LStr );
               end;
          end;
     end;
end;

procedure TIdIMAP4.ParseListResult(AMBList: TStringList;
  CmdResultDetails: TStrings);
var Ln : Integer;
    LStr : String;
    LPChar : PChar;
begin
     AMBList.Clear;
     for Ln := 0 to ( CmdResultDetails.Count - 2 ) do
     begin
          LStr := CmdResultDetails[Ln];
          if ( Pos ( IMAP4Commands[cmdList], LStr ) = 1 ) then
          begin
               //TODO: Get mail box attributes here;
               //TODO: mailBoxSeparator may be determined automatically
               LStr := Trim ( Copy (
               LStr, ( Pos ( '"' + FMailBoxSeparator + '"', LStr ) + 4 ), MaxInt ) ); {Do not Localize}
               LPChar := PChar ( LStr );
               if ( ( LStr[1] = '"' ) and {Do not Localize}
                    ( LStr[Length ( LStr )] = '"' ) ) then {Do not Localize}
               begin
                    AMBList.Add ( AnsiExtractQuotedStr ( LPChar, '"' ) ); {Do not Localize}
               end
               else
               begin
                    AMBList.Add ( LStr );
               end;
          end;
     end;
end;

procedure TIdIMAP4.ParseLSubResult(AMBList: TStringList; CmdResultDetails: TStrings);
var Ln: Integer;
    LStr: String;
    LPChar: PChar;
begin
  AMBList.Clear;
  for Ln := 0 to (CmdResultDetails.Count - 2) do
  begin
      LStr := CmdResultDetails[Ln];
      if (Pos(IMAP4Commands[cmdLSub], LStr) = 1) then
      begin
        //TODO: Get mail box attributes here;
        //TODO: mailBoxSeparator may be determined automatically

        LStr := Trim (Copy(LStr, (Pos('"' + FMailBoxSeparator + '"', LStr) + 4), MaxInt)); {Do not Localize}
        LPChar := PChar(LStr);
        if ((LStr[1] = '"') and {Do not Localize}
          (LStr[Length(LStr)] = '"')) then {Do not Localize}
        begin
          AMBList.Add(AnsiExtractQuotedStr(LPChar, '"')); {Do not Localize}
        end

        else
        begin
          AMBList.Add ( LStr );
        end;
      end;
  end;
end;

procedure TIdIMAP4.ParseEnvelopeResult(AMsg: TIdMessage;
  ACmdResultStr: String);

  procedure DecodeEnvelopeAddress (const AAddressStr: String;
    AEmailAddressItem: TIdEmailAddressItem); overload;
  var LStr: String;
      LPChar: PChar;
  begin
       if ( ( AAddressStr[1] = '(' ) and    {Do not Localize}
            ( AAddressStr[Length (AAddressStr)] = ')' ) and    {Do not Localize}
            Assigned (AEmailAddressItem) ) then
       begin
            LStr := Copy (AAddressStr, 2, Length (AAddressStr) - 2);
            //Gets the name part
            if AnsiSameText (Copy (LStr, 1, Pos (' ', LStr) - 1), 'NIL') then    {Do not Localize}
            begin
                 LStr := Copy (LStr, Pos (' ', LStr) + 1, MaxInt);    {Do not Localize}
            end
            else
            begin
                 if ( LStr[1] = '{' ) then    {Do not Localize}
                 begin
                      LStr := Copy (LStr, Pos ('}', LStr) + 1, MaxInt);    {Do not Localize}
                      AEmailAddressItem.Name := Copy (LStr, 1, Pos ('" ', LStr) - 1);    {Do not Localize}
                      LStr := Copy (LStr, Pos ('" ', LStr) + 2, MaxInt);    {Do not Localize}
                 end
                 else
                 begin
                      LPChar := PChar (Copy (LStr, 1, Pos ('" ', LStr)));    {Do not Localize}
                      AEmailAddressItem.Name := AnsiExtractQuotedStr ( LPChar, '"' );    {Do not Localize}
                      LStr := Copy (LStr, Pos ('" ', LStr) + 2, MaxInt);    {Do not Localize}
                 end;
            end;
            //Gets the source root part
            if AnsiSameText (Copy (LStr, 1, Pos (' ', LStr) - 1), 'NIL') then    {Do not Localize}
            begin
                 LStr := Copy (LStr, Pos (' ', LStr) + 1, MaxInt);    {Do not Localize}
            end
            else
            begin
                 LPChar := PChar (Copy (LStr, 1, Pos ('" ', LStr)));    {Do not Localize}
                 AEmailAddressItem.Name := AnsiExtractQuotedStr ( LPChar, '"' );    {Do not Localize}
                 LStr := Copy (LStr, Pos ('" ', LStr) + 2, MaxInt);    {Do not Localize}
            end;
            //Gets the mailbox name part
            if AnsiSameText (Copy (LStr, 1, Pos (' ', LStr) - 1), 'NIL') then    {Do not Localize}
            begin
                 LStr := Copy (LStr, Pos (' ', LStr) + 1, MaxInt);    {Do not Localize}
            end
            else
            begin
                 LPChar := PChar (Copy (LStr, 1, Pos ('" ', LStr)));    {Do not Localize}
                 AEmailAddressItem.Address := AnsiExtractQuotedStr ( LPChar, '"' );    {Do not Localize}
                 LStr := Copy (LStr, Pos ('" ', LStr) + 2, MaxInt);    {Do not Localize}
            end;
            //Gets the host name part
            if not AnsiSameText (Copy (LStr, 1, MaxInt), 'NIL') then    {Do not Localize}
            begin
                 LPChar := PChar (Copy (LStr, 1, MaxInt));
                 AEmailAddressItem.Address := AEmailAddressItem.Address + '@' +    {Do not Localize}
                 AnsiExtractQuotedStr ( LPChar, '"' );    {Do not Localize}
            end;
       end;
  end;

  procedure DecodeEnvelopeAddress (const AAddressStr: String;
    AEmailAddressList: TIdEmailAddressList); overload;
  var LStr: String;
  begin
       if ( ( AAddressStr[1] = '(' ) and    {Do not Localize}
            ( AAddressStr[Length (AAddressStr)] = ')' ) and    {Do not Localize}
            Assigned (AEmailAddressList) ) then
       begin
            LStr := Copy (AAddressStr, 2, Length (AAddressStr) - 2);
            while ( Pos (')', LStr) > 0 ) do    {Do not Localize}
            begin
                 DecodeEnvelopeAddress (Copy (LStr, 1, Pos (')', LStr)), AEmailAddressList.Add);    {Do not Localize}
                 LStr := Trim (Copy (LStr, Pos (')', LStr) + 1, MaxInt));    {Do not Localize}
            end;
       end;
  end;
var LStr: String;
    LPChar: PChar;
begin
     //The fields of the envelope structure are in the
     //following order: date, subject, from, sender,
     //reply-to, to, cc, bcc, in-reply-to, and message-id.
     //The date, subject, in-reply-to, and message-id
     //fields are strings.  The from, sender, reply-to,
     //to, cc, and bcc fields are parenthesized lists of
     //address structures.

     //An address structure is a parenthesized list that
     //describes an electronic mail address.  The fields
     //of an address structure are in the following order:
     //personal name, [SMTP] at-domain-list (source
     //route), mailbox name, and host name.

     //* 4 FETCH (ENVELOPE ("Sun, 15 Jul 2001 02:56:45 -0700 (PDT)" "Your Borland Commu
     //nity Account Activation Code" (("Borland Community" NIL "mailbot" "borland.com")
     //) NIL NIL (("" NIL "name" "company.com")) NIL NIL NIL "<200107150956.CAA1
     //8152@borland.com>"))

     //AMsg.Clear;
     //Extract envelope date field
     if AnsiSameText (Copy (ACmdResultStr, 1, Pos (' ', ACmdResultStr) - 1), 'NIL') then    {Do not Localize}
     begin
          ACmdResultStr := Copy (ACmdResultStr, Pos (' ', ACmdResultStr) + 1, MaxInt);    {Do not Localize}
     end
     else
     begin
          LPChar := PChar (Copy (ACmdResultStr, 1, Pos ('" ', ACmdResultStr)));    {Do not Localize}
          LStr := AnsiExtractQuotedStr (LPChar, '"');    {Do not Localize}
          AMsg.Date := GMTToLocalDateTime (LStr);
          ACmdResultStr := Copy (ACmdResultStr, Pos ('" ', ACmdResultStr) + 2, MaxInt);    {Do not Localize}
     end;
     //Extract envelope subject field
     if AnsiSameText (Copy (ACmdResultStr, 1, Pos (' ', ACmdResultStr) - 1), 'NIL') then    {Do not Localize}
     begin
          ACmdResultStr := Copy (ACmdResultStr, Pos (' ', ACmdResultStr) + 1, MaxInt);    {Do not Localize}
     end
     else
     begin
          if ( ACmdResultStr[1] = '{' ) then    {Do not Localize}
          begin
               ACmdResultStr := Copy (ACmdResultStr, Pos ('}', ACmdResultStr) + 1, MaxInt);    {Do not Localize}
               LStr := Copy (ACmdResultStr, 1, Pos (' ', ACmdResultStr) - 1);    {Do not Localize}
               AMsg.Subject := LStr;
               ACmdResultStr := Copy (ACmdResultStr, Pos (' ', ACmdResultStr) + 1, MaxInt);    {Do not Localize}
          end
          else
          begin
               LPChar := PChar (Copy (ACmdResultStr, 1, Pos ('" ', ACmdResultStr)));    {Do not Localize}
               LStr := AnsiExtractQuotedStr (LPChar, '"');    {Do not Localize}
               AMsg.Subject := LStr;
               ACmdResultStr := Copy (ACmdResultStr, Pos ('" ', ACmdResultStr) + 2, MaxInt);    {Do not Localize}
          end;
     end;
     //Extract envelope from field
     if AnsiSameText (Copy (ACmdResultStr, 1, Pos (' ', ACmdResultStr) - 1), 'NIL') then    {Do not Localize}
     begin
          ACmdResultStr := Copy (ACmdResultStr, Pos (' ', ACmdResultStr) + 1, MaxInt);    {Do not Localize}
     end
     else
     begin
          LStr := Copy (ACmdResultStr, 2, Pos (')) ', ACmdResultStr) - 1);    {Do not Localize}
          DecodeEnvelopeAddress (LStr, AMsg.From);
          ACmdResultStr := Copy (ACmdResultStr, Pos (')) ', ACmdResultStr) + 3, MaxInt);    {Do not Localize}
     end;
     //Extract envelope sender field
     if AnsiSameText (Copy (ACmdResultStr, 1, Pos (' ', ACmdResultStr) - 1), 'NIL') then    {Do not Localize}
     begin
          ACmdResultStr := Copy (ACmdResultStr, Pos (' ', ACmdResultStr) + 1, MaxInt);    {Do not Localize}
     end
     else
     begin
          LStr := Copy (ACmdResultStr, 1, Pos (')) ', ACmdResultStr) + 1);    {Do not Localize}
          DecodeEnvelopeAddress (LStr, AMsg.Sender);
          ACmdResultStr := Copy (ACmdResultStr, Pos (')) ', ACmdResultStr) + 3, MaxInt);    {Do not Localize}
     end;
     //Extract envelope reply-to field
     if AnsiSameText (Copy (ACmdResultStr, 1, Pos (' ', ACmdResultStr) - 1), 'NIL') then    {Do not Localize}
     begin
          ACmdResultStr := Copy (ACmdResultStr, Pos (' ', ACmdResultStr) + 1, MaxInt);    {Do not Localize}
     end
     else
     begin
          LStr := Copy (ACmdResultStr, 1, Pos (')) ', ACmdResultStr) + 1);    {Do not Localize}
          DecodeEnvelopeAddress (LStr, AMsg.ReplyTo);
          ACmdResultStr := Copy (ACmdResultStr, Pos (')) ', ACmdResultStr) + 3, MaxInt);    {Do not Localize}
     end;
     //Extract envelope to field
     if AnsiSameText (Copy (ACmdResultStr, 1, Pos (' ', ACmdResultStr) - 1), 'NIL') then    {Do not Localize}
     begin
          ACmdResultStr := Copy (ACmdResultStr, Pos (' ', ACmdResultStr) + 1, MaxInt);    {Do not Localize}
     end
     else
     begin
          LStr := Copy (ACmdResultStr, 1, Pos (')) ', ACmdResultStr) + 1);    {Do not Localize}
          DecodeEnvelopeAddress (LStr, AMsg.Recipients);
          ACmdResultStr := Copy (ACmdResultStr, Pos (')) ', ACmdResultStr) + 3, MaxInt);    {Do not Localize}
     end;
     //Extract envelope cc field
     if AnsiSameText (Copy (ACmdResultStr, 1, Pos (' ', ACmdResultStr) - 1), 'NIL') then    {Do not Localize}
     begin
          ACmdResultStr := Copy (ACmdResultStr, Pos (' ', ACmdResultStr) + 1, MaxInt);    {Do not Localize}
     end
     else
     begin
          LStr := Copy (ACmdResultStr, 1, Pos (')) ', ACmdResultStr) + 1);    {Do not Localize}
          DecodeEnvelopeAddress (LStr, AMsg.CCList);
          ACmdResultStr := Copy (ACmdResultStr, Pos (')) ', ACmdResultStr) + 3, MaxInt);    {Do not Localize}
     end;
     //Extract envelope bcc field
     if AnsiSameText (Copy (ACmdResultStr, 1, Pos (' ', ACmdResultStr) - 1), 'NIL') then    {Do not Localize}
     begin
          ACmdResultStr := Copy (ACmdResultStr, Pos (' ', ACmdResultStr) + 1, MaxInt);    {Do not Localize}
     end
     else
     begin
          LStr := Copy (ACmdResultStr, 1, Pos (')) ', ACmdResultStr) + 1);    {Do not Localize}
          DecodeEnvelopeAddress (LStr, AMsg.BccList);
          ACmdResultStr := Copy (ACmdResultStr, Pos (')) ', ACmdResultStr) + 3, MaxInt);    {Do not Localize}
     end;
     //Extract envelope in-reply-to field
     if AnsiSameText (Copy (ACmdResultStr, 1, Pos (' ', ACmdResultStr) - 1), 'NIL') then    {Do not Localize}
     begin
          ACmdResultStr := Copy (ACmdResultStr, Pos (' ', ACmdResultStr) + 1, MaxInt);    {Do not Localize}
     end
     else
     begin
          LPChar := PChar (Copy (ACmdResultStr, 1, Pos ('" ', ACmdResultStr)));    {Do not Localize}
          LStr := AnsiExtractQuotedStr (LPChar, '"');    {Do not Localize}
          ACmdResultStr := Copy (ACmdResultStr, Pos ('" ', ACmdResultStr) + 2, MaxInt);    {Do not Localize}
     end;
     //Extract envelope message-id field
     if AnsiSameText (Copy (ACmdResultStr, 1, Pos (' ', ACmdResultStr) - 1), 'NIL') then    {Do not Localize}
     begin
          ACmdResultStr := Copy (ACmdResultStr, Pos (' ', ACmdResultStr) + 1, MaxInt);    {Do not Localize}
     end
     else
     begin
          LPChar := PChar (ACmdResultStr);
          LStr := AnsiExtractQuotedStr (LPChar, '"');    {Do not Localize}
          AMsg.MsgId := Trim (LStr);
     end;
end;

{ ...Parser Functions }

function TIdIMAP4.ArrayToNumberStr (const AMsgNumList: array of Integer): String;
var Ln : Integer;
begin
     for Ln := 0 to ( Length ( AMsgNumList ) - 1 ) do
         Result := Result + IntToStr ( AMsgNumList[Ln] ) + ','; {Do not Localize}
     SetLength ( Result, ( Length ( Result ) - 1 ) );
end;

function TIdIMAP4.MessageFlagSetToStr(
  const AFlags: TIdMessageFlagsSet): String;
begin
     Result := '';    {Do not Localize}
     if mfAnswered in AFlags then Result := Result + MessageFlags[mfAnswered] + ' '; {Do not Localize}
     if mfFlagged in AFlags then Result := Result + MessageFlags[mfFlagged] + ' '; {Do not Localize}
     if mfDeleted in AFlags then Result := Result + MessageFlags[mfDeleted] + ' '; {Do not Localize}
     if mfDraft in AFlags then Result := Result + MessageFlags[mfDraft] + ' '; {Do not Localize}
     if mfSeen in AFlags then Result := Result + MessageFlags[mfSeen] + ' '; {Do not Localize}
end;

function TIdIMAP4.DateToIMAPDateStr(const ADate: TDateTime): String;
var LStr: String;
begin
     ShortDateFormat := 'dd-mm-yyyy';    {Do not Localize}
     DateSeparator := '-';    {Do not Localize}
     LStr := DateToStr (ADate);
     Result := Copy (LStr, 1, Pos (DateSeparator, LStr));
     LStr := Copy (LStr, Pos (DateSeparator, LStr) + 1, MaxInt);
     Result := Result + monthnames[StrToInt (Copy (LStr, 1, Pos (DateSeparator, LStr) - 1))];
     Result := Result + Copy (LStr, Pos (DateSeparator, LStr), MaxInt);
     Result := UpperCase (Result);
end;

end.
