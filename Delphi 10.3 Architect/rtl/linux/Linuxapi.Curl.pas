{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2016-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Linuxapi.Curl;

interface

uses
  Posix.SysTypes, Posix.SysSocket, Posix.SysSelect;

(*$HPPEMIT '#include <curl/curl.h>'*)

const
  CURL_SOCKET_BAD = -1;
  {$EXTERNALSYM CURL_SOCKET_BAD}
  LibCurl = 'libcurl.so';

type
  curl_socket_t = Integer;
  {$EXTERNALSYM curl_socket_t}
  curl_off_t = Longint;
  {$EXTERNALSYM curl_off_t}
  PCURL = Pointer;
  {$EXTERNALSYM PCURL}

  { linked-list structure for the CURLOPT_QUOTE option (and other) }
  pcurl_slist = ^curl_slist;
  curl_slist = record
    data: MarshaledAString;
    next: pcurl_slist;
  end;
  {$EXTERNALSYM curl_slist}
  TCURLSList = curl_slist;

  pcurl_httppost = ^curl_httppost;
  curl_httppost = record
    next: pcurl_httppost;           { next entry in the list }
    name: MarshaledAString;         { pointer to allocated name }
    namelength: Longint;            { length of name length }
    contents: MarshaledAString;     { pointer to allocated data contents }
    contentslength: Longint;        { length of contents field }
    buffer: MarshaledAString;       { pointer to allocated buffer contents }
    bufferlength: longint;          { length of buffer field }
    contenttype: MarshaledAString;  { Content-Type }
    contentheader: pcurl_slist;     { list of extra headers for this form }
    more: pcurl_httppost;           { if one field name has more than one
                                       file, this link should link to following
                                       files }
    flags: Longint;                 {  As defined below
      #define HTTPPOST_FILENAME (1<<0)   specified content is a file name
      #define HTTPPOST_READFILE (1<<1)   specified content is a file name
      #define HTTPPOST_PTRNAME (1<<2)    name is only stored pointer
                                         do not free in formfree
      #define HTTPPOST_PTRCONTENTS (1<<3)contents is only stored pointer
                                         do not free in formfree
      #define HTTPPOST_BUFFER (1<<4)     upload file from buffer
      #define HTTPPOST_PTRBUFFER (1<<5)  upload file from pointer contents
      #define HTTPPOST_CALLBACK (1<<6)   upload file contents by using the
                                         regular read callback to get the data
                                         and pass the given pointer as custom
                                         pointer }

    showfilename: MarshaledAString;  { The file name to show. If not set, the
                                       actual file name will be used (if this
                                       is a file part) }
    userp: Pointer;                  { custom pointer used for
                                       HTTPPOST_CALLBACK posts }
  end;
  {$EXTERNALSYM curl_httppost}


  { This is the CURLOPT_PROGRESSFUNCTION callback proto. It is now considered
   deprecated but was the only choice up until 7.31.0 }
  curl_progress_callback = function (clientp: Pointer; dltotal: Double; dlnow: Double;
                                      ultotal: Double; ulnow: Double): Integer; cdecl;
  {$EXTERNALSYM curl_progress_callback}

  { This is the CURLOPT_XFERINFOFUNCTION callback proto. It was introduced in
   7.32.0, it avoids floating point and provides more detailed information. }
  curl_xferinfo_callback = function(clientp: Pointer; dltotal: curl_off_t; dlnow: curl_off_t; ultotal: curl_off_t;
                                      ulnow: curl_off_t): Integer; cdecl;
  {$EXTERNALSYM curl_xferinfo_callback}

const
  { Tests have proven that 20K is a very bad buffer size for uploads on
	 Windows, while 16K for some odd reason performed a lot better.
   We do the ifndef check to allow this value to easier be changed at build
   time for those who feel adventurous. The practical minimum is about
   400 bytes since libcurl uses a buffer of this size as a scratch area
   (unrelated to network send operations). }
  CURL_MAX_WRITE_SIZE = 16384;
  {$EXTERNALSYM CURL_MAX_WRITE_SIZE}

  { The only reason to have a max limit for this is to avoid the risk of a bad
   server feeding libcurl with a never-ending header that will cause reallocs
   infinitely }
  CURL_MAX_HTTP_HEADER = (100 * 1024);
  {$EXTERNALSYM CURL_MAX_HTTP_HEADER}

  { This is a magic return code for the write callback that, when returned,
   will signal libcurl to pause receiving on the current transfer. }
  CURL_WRITEFUNC_PAUSE = $10000001;
  {$EXTERNALSYM CURL_WRITEFUNC_PAUSE}

type
  curl_write_callback = function(buffer: Pointer; size: size_t; nitems: size_t; outstream: Pointer): size_t; cdecl;
  {$EXTERNALSYM curl_write_callback}

  { enumeration of file types }
  curlfiletype = (
    CURLFILETYPE_FILE = 0,
    CURLFILETYPE_DIRECTORY,
    CURLFILETYPE_SYMLINK,
    CURLFILETYPE_DEVICE_BLOCK,
    CURLFILETYPE_DEVICE_CHAR,
    CURLFILETYPE_NAMEDPIPE,
    CURLFILETYPE_SOCKET,
    CURLFILETYPE_DOOR,   { is possible only on Sun Solaris now }
    CURLFILETYPE_UNKNOWN { should never occur }
  );
  {$EXTERNALSYM curlfiletype}
  TCurlFileType = curlfiletype;

const
  CURLFINFOFLAG_KNOWN_FILENAME = 1;
  {$EXTERNALSYM CURLFINFOFLAG_KNOWN_FILENAME}
  CURLFINFOFLAG_KNOWN_FILETYPE = 2;
  {$EXTERNALSYM CURLFINFOFLAG_KNOWN_FILETYPE}
  CURLFINFOFLAG_KNOWN_TIME = 4;
  {$EXTERNALSYM CURLFINFOFLAG_KNOWN_TIME}
  CURLFINFOFLAG_KNOWN_PERM = 8;
  {$EXTERNALSYM CURLFINFOFLAG_KNOWN_PERM}
  CURLFINFOFLAG_KNOWN_UID = 16;
  {$EXTERNALSYM CURLFINFOFLAG_KNOWN_UID}
  CURLFINFOFLAG_KNOWN_GID = 32;
  {$EXTERNALSYM CURLFINFOFLAG_KNOWN_GID}
  CURLFINFOFLAG_KNOWN_SIZE = 64;
  {$EXTERNALSYM CURLFINFOFLAG_KNOWN_SIZE}
  CURLFINFOFLAG_KNOWN_HLINKCOUNT = 128;
  {$EXTERNALSYM CURLFINFOFLAG_KNOWN_HLINKCOUNT}

type
  /// <summary>Content of this structure depends on information which is known and is
  /// achievable (e.g. by FTP LIST parsing). Please see the url_easy_setopt(3) man
  /// page for callbacks returning this structure -- some fields are mandatory,
  /// some others are optional. The FLAG field has special meaning. </summary>
  curl_fileinfo_strings = record
    { If some of these fields is not NULL, it is a pointer to b_data. }
    time: MarshaledAString;
    perm: MarshaledAString;
    user: MarshaledAString;
    group: MarshaledAString;
    target: MarshaledAString; { pointer to the target filename of a symlink }
  end;
  {$EXTERNALSYM curl_fileinfo_strings}

  curl_fileinfo = record
    filename: MarshaledAString;
    filetype: TCurlfiletype;
    time: time_t;
    perm: Cardinal;
    uid: Integer;
    gid: Integer;
    size: curl_off_t;
    hardlinks: Longint;
    strings: curl_fileinfo_strings;
    flags: Cardinal;
    { used internally }
    b_data: MarshaledAString;
    b_size: size_t;
    b_used: size_t;
  end;
  {$EXTERNALSYM curl_fileinfo}

const
  { return codes for CURLOPT_CHUNK_BGN_FUNCTION }
  CURL_CHUNK_BGN_FUNC_OK = 0;
  {$EXTERNALSYM CURL_CHUNK_BGN_FUNC_OK}
  CURL_CHUNK_BGN_FUNC_FAIL = 1; { tell the lib to end the task }
  {$EXTERNALSYM CURL_CHUNK_BGN_FUNC_FAIL = 1}
  CURL_CHUNK_BGN_FUNC_SKIP = 2; { skip this chunk over }
  {$EXTERNALSYM CURL_CHUNK_BGN_FUNC_SKIP}

type
  ///<summary>if splitting of data transfer is enabled, this callback is called before
  /// download of an individual chunk started. Note that parameter "remains" works
  /// only for FTP wildcard downloading (for now), otherwise is not used </summary>
  curl_chunk_bgn_callback = function(transfer_info: PPointer; ptr: Pointer; remains: Integer): Longint; cdecl;
  {$EXTERNALSYM curl_chunk_bgn_callback}

const
  { return codes for CURLOPT_CHUNK_END_FUNCTION }
  CURL_CHUNK_END_FUNC_OK = 0;
  {$EXTERNALSYM CURL_CHUNK_END_FUNC_OK}
  CURL_CHUNK_END_FUNC_FAIL = 1; { tell the lib to end the task }
  {$EXTERNALSYM CURL_CHUNK_END_FUNC_FAIL}

type
  ///<summary> If splitting of data transfer is enabled this callback is called after
  /// download of an individual chunk finished.
  /// Note! After this callback was set then it have to be called FOR ALL chunks.
  /// Even if downloading of this chunk was skipped in CHUNK_BGN_FUNC.
  /// This is the reason why we don't need "transfer_info" parameter in this
  /// callback and we are not interested in "remains" parameter too.</summary>
  curl_chunk_end_callback = function (ptr: Pointer): Longint; cdecl;
  {$EXTERNALSYM curl_chunk_end_callback}

const
  { return codes for FNMATCHFUNCTION }
  CURL_FNMATCHFUNC_MATCH = 0; { string corresponds to the pattern }
  {$EXTERNALSYM CURL_FNMATCHFUNC_MATCH}
  CURL_FNMATCHFUNC_NOMATCH = 1; { pattern doesn't match the string }
  {$EXTERNALSYM CURL_FNMATCHFUNC_NOMATCH}
  CURL_FNMATCHFUNC_FAIL = 2; { an error occurred }
  {$EXTERNALSYM CURL_FNMATCHFUNC_FAIL}

type
  ///<summary> callback type for wildcard downloading pattern matching. If the
  /// string matches the pattern, return CURL_FNMATCHFUNC_MATCH value, etc. </summary>
  curl_fnmatch_callback = function(ptr: Pointer; const pattern: MarshaledAString; const &string: MarshaledAString): Integer; cdecl;
  {$EXTERNALSYM curl_fnmatch_callback}

const
 { These are the return codes for the seek callbacks }
  CURL_SEEKFUNC_OK = 0;
  {$EXTERNALSYM CURL_SEEKFUNC_OK}
  CURL_SEEKFUNC_FAIL = 1;     { fail the entire transfer }
  {$EXTERNALSYM CURL_SEEKFUNC_FAIL}
  CURL_SEEKFUNC_CANTSEEK = 2; { tell libcurl seeking can't be done, so
                                libcurl might try other means instead }
  {$EXTERNALSYM CURL_SEEKFUNC_CANTSEEK}

type
  curl_seek_callback = function (instream: Pointer; offset: curl_off_t; origin: Integer): Integer; cdecl; { 'whence' }
  {$EXTERNALSYM curl_seek_callback}

const
  ///<summary> This is a return code for the read callback that, when returned, will
  /// signal libcurl to immediately abort the current transfer.</summary>
  CURL_READFUNC_ABORT = $10000000;
  {$EXTERNALSYM CURL_READFUNC_ABORT}
  ///<summary> This is a return code for the read callback that, when returned, will
  /// signal libcurl to pause sending data on the current transfer.</summary>
  CURL_READFUNC_PAUSE = $10000001;
  {$EXTERNALSYM CURL_READFUNC_PAUSE}

type
  curl_read_callback = function (buffer: Pointer; size: size_t; nitems: size_t; instream: Pointer): size_t; cdecl;
  {$EXTERNALSYM curl_read_callback}

  curlsocktype = (
    CURLSOCKTYPE_IPCXN,  { socket created for a specific IP connection }
    CURLSOCKTYPE_ACCEPT, { socket created by accept() call }
    CURLSOCKTYPE_LAST    { never use }
  );
  {$EXTERNALSYM curlsocktype}
  TCurlSockType = curlsocktype;

  { The return code from the sockopt_callback can signal information back to libcurl: }
const
  CURL_SOCKOPT_OK = 0;
  {$EXTERNALSYM CURL_SOCKOPT_OK}
  CURL_SOCKOPT_ERROR = 1; { causes libcurl to abort and return
                            CURLE_ABORTED_BY_CALLBACK }
  {$EXTERNALSYM CURL_SOCKOPT_ERROR}
  CURL_SOCKOPT_ALREADY_CONNECTED = 2;
  {$EXTERNALSYM CURL_SOCKOPT_ALREADY_CONNECTED}

type
  curl_sockopt_callback = function (clientp: Pointer; curlfd: curl_socket_t; purpose: TCurlsocktype): Integer; cdecl;
  {$EXTERNALSYM curl_sockopt_callback}

  curl_sockaddr = record
    family: Integer;
    socktype: Integer;
    protocol: Integer;
    addrlen: Cardinal; { addrlen was a socklen_t type before 7.18.0 but it
                         turned really ugly and painful on the systems that
                         lack this type }
    addr: sockaddr;
  end;
  {$EXTERNALSYM curl_sockaddr}
  pcurl_sockaddr = ^curl_sockaddr;

  curl_opensocket_callback = function (clientp: Pointer; purpose: TCurlsocktype; address: pcurl_sockaddr): curl_socket_t; cdecl;
  {$EXTERNALSYM curl_opensocket_callback}

  curl_closesocket_callback = function (clientp: Pointer; item: curl_socket_t): Integer; cdecl;
  {$EXTERNALSYM curl_closesocket_callback}

  curlioerr = (
    CURLIOE_OK,            { I/O operation successful }
    CURLIOE_UNKNOWNCMD,    { command was unknown to callback }
    CURLIOE_FAILRESTART,   { failed to restart the read }
    CURLIOE_LAST           { never use }
  );
  {$EXTERNALSYM curlioerr}
  TCurlIOErr = curlioerr;

  curliocmd = (
    CURLIOCMD_NOP,         { no operation }
    CURLIOCMD_RESTARTREAD, { restart the read stream from start }
    CURLIOCMD_LAST         { never use }
  );
  {$EXTERNALSYM curliocmd}
  TCurlIOCmd = curliocmd;

  curl_ioctl_callback = function (handle: PCURL; cmd: Integer; clientp: Pointer): curlioerr; cdecl;
  {$EXTERNALSYM curl_ioctl_callback}

  // The following typedef's are signatures of malloc, free, realloc, strdup and
  // calloc respectively.  Function pointers of these types can be passed to the
  // curl_global_init_mem() function to set user defined memory management
  // callback routines.
  curl_malloc_callback = function (size: size_t): Pointer; cdecl;
  {$EXTERNALSYM curl_malloc_callback}
  curl_free_callback = procedure (ptr: Pointer); cdecl;
  {$EXTERNALSYM curl_free_callback}
  curl_realloc_callback = function (ptr: Pointer; size: size_t): Pointer; cdecl;
  {$EXTERNALSYM curl_realloc_callback}
  curl_strdup_callback = function (str: MarshaledAString): MarshaledAString; cdecl;
  {$EXTERNALSYM curl_strdup_callback}
  curl_calloc_callback = function (nmemb: size_t; size: size_t): Pointer; cdecl;
  {$EXTERNALSYM curl_calloc_callback}

  { the kind of data that is passed to information_callback }
  curl_infotype = (
    CURLINFO_TEXT = 0,
    CURLINFO_HEADER_IN,    { 1 }
    CURLINFO_HEADER_OUT,   { 2 }
    CURLINFO_DATA_IN,      { 3 }
    CURLINFO_DATA_OUT,     { 4 }
    CURLINFO_SSL_DATA_IN,  { 5 }
    CURLINFO_SSL_DATA_OUT, { 6 }
    CURLINFO_END
  );
  {$EXTERNALSYM curl_infotype}
  TCurlInfoType = curl_infotype;

  curl_debug_callback = function (handle: PCURL;              { the handle/transfer this concerns }
                                  &type: curl_infotype;       { what kind of data }
                                  data: MarshaledAString;     { points to the data }
                                  size: size_t;               { size of the data pointed to }
                                  userptr: Pointer): Integer; cdecl; { whatever the user please }
  {$EXTERNALSYM curl_debug_callback}

  ///<summary>All possible error codes from all sorts of curl functions. Future versions
  ///may return other values, stay prepared.
  ///
  ///Always add new return codes last. Never *EVER* remove any. The return
  ///codes must remain the same!<summary>
  CURLcode = (
    CURLE_OK = 0,
    CURLE_UNSUPPORTED_PROTOCOL,    { 1 }
    CURLE_FAILED_INIT,             { 2 }
    CURLE_URL_MALFORMAT,           { 3 }
    CURLE_NOT_BUILT_IN,            { 4 - [was obsoleted in August 2007 for
                                      7.17.0, reused in April 2011 for 7.21.5] }
    CURLE_COULDNT_RESOLVE_PROXY,   { 5 }
    CURLE_COULDNT_RESOLVE_HOST,    { 6 }
    CURLE_COULDNT_CONNECT,         { 7 }
    CURLE_FTP_WEIRD_SERVER_REPLY,  { 8 }
    CURLE_REMOTE_ACCESS_DENIED,    { 9 a service was denied by the server
                                      due to lack of access - when login fails
                                      this is not returned. }
    CURLE_FTP_ACCEPT_FAILED,       { 10 - [was obsoleted in April 2006 for
                                      7.15.4, reused in Dec 2011 for 7.24.0]}
    CURLE_FTP_WEIRD_PASS_REPLY,    { 11 }
    CURLE_FTP_ACCEPT_TIMEOUT,      { 12 - timeout occurred accepting server
                                      [was obsoleted in August 2007 for 7.17.0,
                                      reused in Dec 2011 for 7.24.0]}
    CURLE_FTP_WEIRD_PASV_REPLY,    { 13 }
    CURLE_FTP_WEIRD_227_FORMAT,    { 14 }
    CURLE_FTP_CANT_GET_HOST,       { 15 }
    CURLE_HTTP2,                   { 16 - A problem in the http2 framing layer.
                                      [was obsoleted in August 2007 for 7.17.0,
                                      reused in July 2014 for 7.38.0] }
    CURLE_FTP_COULDNT_SET_TYPE,    { 17 }
    CURLE_PARTIAL_FILE,            { 18 }
    CURLE_FTP_COULDNT_RETR_FILE,   { 19 }
    CURLE_OBSOLETE20,              { 20 - NOT USED }
    CURLE_QUOTE_ERROR,             { 21 - quote command failure }
    CURLE_HTTP_RETURNED_ERROR,     { 22 }
    CURLE_WRITE_ERROR,             { 23 }
    CURLE_OBSOLETE24,              { 24 - NOT USED }
    CURLE_UPLOAD_FAILED,           { 25 - failed upload "command" }
    CURLE_READ_ERROR,              { 26 - couldn't open/read from file }
    CURLE_OUT_OF_MEMORY,           { 27 }
    { Note: CURLE_OUT_OF_MEMORY may sometimes indicate a conversion error
             instead of a memory allocation error if CURL_DOES_CONVERSIONS
             is defined
    }
    CURLE_OPERATION_TIMEDOUT,      { 28 - the timeout time was reached }
    CURLE_OBSOLETE29,              { 29 - NOT USED }
    CURLE_FTP_PORT_FAILED,         { 30 - FTP PORT operation failed }
    CURLE_FTP_COULDNT_USE_REST,    { 31 - the REST command failed }
    CURLE_OBSOLETE32,              { 32 - NOT USED }
    CURLE_RANGE_ERROR,             { 33 - RANGE "command" didn't work }
    CURLE_HTTP_POST_ERROR,         { 34 }
    CURLE_SSL_CONNECT_ERROR,       { 35 - wrong when connecting with SSL }
    CURLE_BAD_DOWNLOAD_RESUME,     { 36 - couldn't resume download }
    CURLE_FILE_COULDNT_READ_FILE,  { 37 }
    CURLE_LDAP_CANNOT_BIND,        { 38 }
    CURLE_LDAP_SEARCH_FAILED,      { 39 }
    CURLE_OBSOLETE40,              { 40 - NOT USED }
    CURLE_FUNCTION_NOT_FOUND,      { 41 }
    CURLE_ABORTED_BY_CALLBACK,     { 42 }
    CURLE_BAD_FUNCTION_ARGUMENT,   { 43 }
    CURLE_OBSOLETE44,              { 44 - NOT USED }
    CURLE_INTERFACE_FAILED,        { 45 - CURLOPT_INTERFACE failed }
    CURLE_OBSOLETE46,              { 46 - NOT USED }
    CURLE_TOO_MANY_REDIRECTS ,     { 47 - catch endless re-direct loops }
    CURLE_UNKNOWN_OPTION,          { 48 - User specified an unknown option }
    CURLE_TELNET_OPTION_SYNTAX ,   { 49 - Malformed telnet option }
    CURLE_OBSOLETE50,              { 50 - NOT USED }
    CURLE_PEER_FAILED_VERIFICATION, { 51 - peer's certificate or fingerprint
                                       wasn't verified fine }
    CURLE_GOT_NOTHING,             { 52 - when this is a specific error }
    CURLE_SSL_ENGINE_NOTFOUND,     { 53 - SSL crypto engine not found }
    CURLE_SSL_ENGINE_SETFAILED,    { 54 - can not set SSL crypto engine as
                                      default }
    CURLE_SEND_ERROR,              { 55 - failed sending network data }
    CURLE_RECV_ERROR,              { 56 - failure in receiving network data }
    CURLE_OBSOLETE57,              { 57 - NOT IN USE }
    CURLE_SSL_CERTPROBLEM,         { 58 - problem with the local certificate }
    CURLE_SSL_CIPHER,              { 59 - couldn't use specified cipher }
    CURLE_SSL_CACERT,              { 60 - problem with the CA cert (path?) }
    CURLE_BAD_CONTENT_ENCODING,    { 61 - Unrecognized/bad encoding }
    CURLE_LDAP_INVALID_URL,        { 62 - Invalid LDAP URL }
    CURLE_FILESIZE_EXCEEDED,       { 63 - Maximum file size exceeded }
    CURLE_USE_SSL_FAILED,          { 64 - Requested FTP SSL level failed }
    CURLE_SEND_FAIL_REWIND,        { 65 - Sending the data requires a rewind
                                      that failed }
    CURLE_SSL_ENGINE_INITFAILED,   { 66 - failed to initialise ENGINE }
    CURLE_LOGIN_DENIED,            { 67 - user, password or similar was not
                                      accepted and we failed to login }
    CURLE_TFTP_NOTFOUND,           { 68 - file not found on server }
    CURLE_TFTP_PERM,               { 69 - permission problem on server }
    CURLE_REMOTE_DISK_FULL,        { 70 - out of disk space on server }
    CURLE_TFTP_ILLEGAL,            { 71 - Illegal TFTP operation }
    CURLE_TFTP_UNKNOWNID,          { 72 - Unknown transfer ID }
    CURLE_REMOTE_FILE_EXISTS,      { 73 - File already exists }
    CURLE_TFTP_NOSUCHUSER,         { 74 - No such user }
    CURLE_CONV_FAILED,             { 75 - conversion failed }
    CURLE_CONV_REQD,               { 76 - caller must register conversion
                                      callbacks using curl_easy_setopt options
                                      CURLOPT_CONV_FROM_NETWORK_FUNCTION,
                                      CURLOPT_CONV_TO_NETWORK_FUNCTION, and
                                      CURLOPT_CONV_FROM_UTF8_FUNCTION }
    CURLE_SSL_CACERT_BADFILE,      { 77 - could not load CACERT file, missing
                                      or wrong format }
    CURLE_REMOTE_FILE_NOT_FOUND,   { 78 - remote file not found }
    CURLE_SSH,                     { 79 - error from the SSH layer, somewhat
                                      generic so the error message will be of
                                      interest when this has happened }

    CURLE_SSL_SHUTDOWN_FAILED,     { 80 - Failed to shut down the SSL
                                      connection }
    CURLE_AGAIN,                   { 81 - socket is not ready for send/recv,
                                      wait till it's ready and try again (Added
                                      in 7.18.2) }
    CURLE_SSL_CRL_BADFILE,         { 82 - could not load CRL file, missing or
                                      wrong format (Added in 7.19.0) }
    CURLE_SSL_ISSUER_ERROR,        { 83 - Issuer check failed.  (Added in
                                      7.19.0) }
    CURLE_FTP_PRET_FAILED,         { 84 - a PRET command failed }
    CURLE_RTSP_CSEQ_ERROR,         { 85 - mismatch of RTSP CSeq numbers }
    CURLE_RTSP_SESSION_ERROR,      { 86 - mismatch of RTSP Session Ids }
    CURLE_FTP_BAD_FILE_LIST,       { 87 - unable to parse FTP file list }
    CURLE_CHUNK_FAILED,            { 88 - chunk callback reported error }
    CURLE_NO_CONNECTION_AVAILABLE, { 89 - No connection available, the
                                      session will be queued }
    CURLE_SSL_PINNEDPUBKEYNOTMATCH, { 90 - specified pinned public key did not
                                       match }
    CURLE_SSL_INVALIDCERTSTATUS,   { 91 - invalid certificate status }
    CURL_LAST { never use! }
  );
  {$EXTERNALSYM CURLcode}
  TCURLCode = CURLcode;

const
  ///<summary>Previously obsolete error code re-used in 7.38.0</summary>
   CURLE_OBSOLETE16 = CURLE_HTTP2;
   {$EXTERNALSYM CURLE_OBSOLETE16}

  ///<summary>Previously obsolete error codes re-used in 7.24.0</summary>
  CURLE_OBSOLETE10 = CURLE_FTP_ACCEPT_FAILED;
  {$EXTERNALSYM CURLE_OBSOLETE10}
  CURLE_OBSOLETE12 = CURLE_FTP_ACCEPT_TIMEOUT;
  {$EXTERNALSYM CURLE_OBSOLETE12}

  ///<summary>The following were added in 7.21.5, April 2011</summary>
  CURLE_UNKNOWN_TELNET_OPTION = CURLE_UNKNOWN_OPTION;
  {$EXTERNALSYM CURLE_UNKNOWN_TELNET_OPTION}

  { The following were added in 7.17.1 }
  { These are scheduled to disappear by 2009 }
  CURLE_SSL_PEER_CERTIFICATE = CURLE_PEER_FAILED_VERIFICATION;
  {$EXTERNALSYM CURLE_SSL_PEER_CERTIFICATE}

  { The following were added in 7.17.0 }
  { These are scheduled to disappear by 2009 }
  CURLE_OBSOLETE = CURLE_OBSOLETE50; { no one should be using this! }
  {$EXTERNALSYM CURLE_OBSOLETE}
  CURLE_BAD_PASSWORD_ENTERED = CURLE_OBSOLETE46;
  {$EXTERNALSYM CURLE_BAD_PASSWORD_ENTERED}
  CURLE_BAD_CALLING_ORDER = CURLE_OBSOLETE44;
  {$EXTERNALSYM CURLE_BAD_CALLING_ORDER}
  CURLE_FTP_USER_PASSWORD_INCORRECT = CURLE_OBSOLETE10;
  {$EXTERNALSYM CURLE_FTP_USER_PASSWORD_INCORRECT}
  CURLE_FTP_CANT_RECONNECT = CURLE_OBSOLETE16;
  {$EXTERNALSYM CURLE_FTP_CANT_RECONNECT}
  CURLE_FTP_COULDNT_GET_SIZE = CURLE_OBSOLETE32;
  {$EXTERNALSYM CURLE_FTP_COULDNT_GET_SIZE}
  CURLE_FTP_COULDNT_SET_ASCII = CURLE_OBSOLETE29;
  {$EXTERNALSYM CURLE_FTP_COULDNT_SET_ASCII}
  CURLE_FTP_WEIRD_USER_REPLY = CURLE_OBSOLETE12;
  {$EXTERNALSYM CURLE_FTP_WEIRD_USER_REPLY}
  CURLE_FTP_WRITE_ERROR = CURLE_OBSOLETE20;
  {$EXTERNALSYM CURLE_FTP_WRITE_ERROR}
  CURLE_LIBRARY_NOT_FOUND = CURLE_OBSOLETE40;
  {$EXTERNALSYM CURLE_LIBRARY_NOT_FOUND}
  CURLE_MALFORMAT_USER = CURLE_OBSOLETE24;
  {$EXTERNALSYM CURLE_MALFORMAT_USER}
  CURLE_SHARE_IN_USE = CURLE_OBSOLETE57;
  {$EXTERNALSYM CURLE_SHARE_IN_USE}
  CURLE_URL_MALFORMAT_USER = CURLE_NOT_BUILT_IN;
  {$EXTERNALSYM CURLE_URL_MALFORMAT_USER}

  CURLE_FTP_ACCESS_DENIED = CURLE_REMOTE_ACCESS_DENIED;
  {$EXTERNALSYM CURLE_FTP_ACCESS_DENIED}
  CURLE_FTP_COULDNT_SET_BINARY = CURLE_FTP_COULDNT_SET_TYPE;
  {$EXTERNALSYM CURLE_FTP_COULDNT_SET_BINARY}
  CURLE_FTP_QUOTE_ERROR = CURLE_QUOTE_ERROR;
  {$EXTERNALSYM CURLE_FTP_QUOTE_ERROR}
  CURLE_TFTP_DISKFULL = CURLE_REMOTE_DISK_FULL;
  {$EXTERNALSYM CURLE_TFTP_DISKFULL}
  CURLE_TFTP_EXISTS = CURLE_REMOTE_FILE_EXISTS;
  {$EXTERNALSYM CURLE_TFTP_EXISTS}
  CURLE_HTTP_RANGE_ERROR = CURLE_RANGE_ERROR;
  {$EXTERNALSYM CURLE_HTTP_RANGE_ERROR}
  CURLE_FTP_SSL_FAILED = CURLE_USE_SSL_FAILED;
  {$EXTERNALSYM CURLE_FTP_SSL_FAILED}

  { The following were added earlier }

  CURLE_OPERATION_TIMEOUTED = CURLE_OPERATION_TIMEDOUT;
  {$EXTERNALSYM CURLE_OPERATION_TIMEOUTED}

  CURLE_HTTP_NOT_FOUND = CURLE_HTTP_RETURNED_ERROR;
  {$EXTERNALSYM CURLE_HTTP_NOT_FOUND}
  CURLE_HTTP_PORT_FAILED = CURLE_INTERFACE_FAILED;
  {$EXTERNALSYM CURLE_HTTP_PORT_FAILED}
  CURLE_FTP_COULDNT_STOR_FILE = CURLE_UPLOAD_FAILED;
  {$EXTERNALSYM CURLE_FTP_COULDNT_STOR_FILE}

  CURLE_FTP_PARTIAL_FILE = CURLE_PARTIAL_FILE;
  {$EXTERNALSYM CURLE_FTP_PARTIAL_FILE}
  CURLE_FTP_BAD_DOWNLOAD_RESUME = CURLE_BAD_DOWNLOAD_RESUME;
  {$EXTERNALSYM CURLE_FTP_BAD_DOWNLOAD_RESUME}

  ///<summary>This was the error code 50 in 7.7.3 and a few earlier versions, this
  ///   is no longer used by libcurl but is instead d here only to not
  ///   make programs break</summary>
  CURLE_ALREADY_COMPLETE = 99999;
  {$EXTERNALSYM CURLE_ALREADY_COMPLETE}

type
  { This prototype applies to all conversion callbacks }
  curl_conv_callback = function (buffer: MarshaledAString; length: size_t): CURLcode; cdecl;
  {$EXTERNALSYM curl_conv_callback}

  curl_ssl_ctx_callback = function (curl: PCURL;      { easy handle }
                                    ssl_ctx: Pointer; { actually an OpenSSL SSL_CTX }
                                    userptr: Pointer): CURLcode; cdecl;
  {$EXTERNALSYM curl_ssl_ctx_callback}

  curl_proxytype = (
    CURLPROXY_HTTP = 0,       { added in 7.10, new in 7.19.4 default is to use CONNECT HTTP/1.1 }
    CURLPROXY_HTTP_1_0 = 1,   { added in 7.19.4, force to use CONNECT HTTP/1.0 }
    CURLPROXY_SOCKS4 = 4,     { support added in 7.15.2, enum existed already in 7.10 }
    CURLPROXY_SOCKS5 = 5,     { added in 7.10 }
    CURLPROXY_SOCKS4A = 6,    { added in 7.18.0 }
    CURLPROXY_SOCKS5_HOSTNAME = 7 { Use the SOCKS5 protocol but pass along the
                                     host name rather than the IP address. added
                                     in 7.18.0 }
  );   { this enum was added in 7.10 }
  {$EXTERNALSYM curl_proxytype}
  TCurlProxyType = curl_proxytype;

const
  {
   * Bitmasks for CURLOPT_HTTPAUTH and CURLOPT_PROXYAUTH options:
   *
   * CURLAUTH_NONE         - No HTTP authentication
   * CURLAUTH_BASIC        - HTTP Basic authentication (default)
   * CURLAUTH_DIGEST       - HTTP Digest authentication
   * CURLAUTH_NEGOTIATE    - HTTP Negotiate (SPNEGO) authentication
   * CURLAUTH_GSSNEGOTIATE - Alias for CURLAUTH_NEGOTIATE (deprecated)
   * CURLAUTH_NTLM         - HTTP NTLM authentication
   * CURLAUTH_DIGEST_IE    - HTTP Digest authentication with IE flavour
   * CURLAUTH_NTLM_WB      - HTTP NTLM authentication delegated to winbind helper
   * CURLAUTH_ONLY         - Use together with a single other type to force no
   *                         authentication or just that single type
   * CURLAUTH_ANY          - All fine types set
   * CURLAUTH_ANYSAFE      - All fine types except Basic
  }

   CURLAUTH_NONE = Cardinal(0);
   {$EXTERNALSYM CURLAUTH_NONE}
   CURLAUTH_BASIC = Cardinal(1);
   {$EXTERNALSYM CURLAUTH_BASIC}
   CURLAUTH_DIGEST = Cardinal(2);
   {$EXTERNALSYM CURLAUTH_DIGEST}
   CURLAUTH_NEGOTIATE = Cardinal(4);
   {$EXTERNALSYM CURLAUTH_NEGOTIATE}
   { Deprecated since the advent of CURLAUTH_NEGOTIATE }
   CURLAUTH_GSSNEGOTIATE = CURLAUTH_NEGOTIATE;
   {$EXTERNALSYM CURLAUTH_GSSNEGOTIATE}
   CURLAUTH_NTLM = Cardinal(8);
   {$EXTERNALSYM CURLAUTH_NTLM}
   CURLAUTH_DIGEST_IE = Cardinal(16);
   {$EXTERNALSYM CURLAUTH_DIGEST_IE}
   CURLAUTH_NTLM_WB  = Cardinal(32);
   {$EXTERNALSYM CURLAUTH_NTLM_WB}
   CURLAUTH_ONLY = Cardinal(2147483648);
   {$EXTERNALSYM CURLAUTH_ONLY}
   CURLAUTH_ANY = not CURLAUTH_DIGEST_IE;
   {$EXTERNALSYM CURLAUTH_ANY}
   CURLAUTH_ANYSAFE = not (CURLAUTH_BASIC or CURLAUTH_DIGEST_IE);
   {$EXTERNALSYM CURLAUTH_ANYSAFE}

   CURLSSH_AUTH_ANY = not 0;               { all types supported by the server }
   {$EXTERNALSYM CURLSSH_AUTH_ANY}
   CURLSSH_AUTH_NONE = 0;                  { none allowed, silly but complete }
   {$EXTERNALSYM CURLSSH_AUTH_NONE}
   CURLSSH_AUTH_PUBLICKEY = 1;             { public/private key files }
   {$EXTERNALSYM CURLSSH_AUTH_PUBLICKEY}
   CURLSSH_AUTH_PASSWORD = 2;              { password }
   {$EXTERNALSYM CURLSSH_AUTH_PASSWORD}
   CURLSSH_AUTH_HOST = 4;                  { host key files }
   {$EXTERNALSYM CURLSSH_AUTH_HOST}
   CURLSSH_AUTH_KEYBOARD = 8;              { keyboard interactive }
   {$EXTERNALSYM CURLSSH_AUTH_KEYBOARD}
   CURLSSH_AUTH_AGENT = 16;                { agent (ssh-agent, pageant...) }
   {$EXTERNALSYM CURLSSH_AUTH_AGENT}
   CURLSSH_AUTH_DEFAULT = CURLSSH_AUTH_ANY;
   {$EXTERNALSYM CURLSSH_AUTH_DEFAULT}

   CURLGSSAPI_DELEGATION_NONE = 0;         { no delegation (default) }
   {$EXTERNALSYM CURLGSSAPI_DELEGATION_NONE}
   CURLGSSAPI_DELEGATION_POLICY_FLAG = 1;  { if permitted by policy }
   {$EXTERNALSYM CURLGSSAPI_DELEGATION_POLICY_FLAG}
   CURLGSSAPI_DELEGATION_FLAG = 2;         { delegate always }
   {$EXTERNALSYM CURLGSSAPI_DELEGATION_FLAG}

   CURL_ERROR_SIZE = 256;
   {$EXTERNALSYM CURL_ERROR_SIZE}

type
  curl_khtype = (CURLKHTYPE_UNKNOWN, CURLKHTYPE_RSA1, CURLKHTYPE_RSA, CURLKHTYPE_DSS);
  {$EXTERNALSYM curl_khtype}
  TCurlKHType = curl_khtype;

  curl_khkey = record
    key: MarshaledAString; { points to a zero-terminated string encoded with base64
                             if len is zero, otherwise to the "raw" data }
    len: size_t;
    keytype: curl_khtype;
  end;
  {$EXTERNALSYM curl_khkey}
  TCurlKHKey = curl_khkey;
  PCurlKHKey = ^TCurlKHKey;

  ///<summary>this is the set of return values expected from the curl_sshkeycallback callback</summary>
  curl_khstat = (
    CURLKHSTAT_FINE_ADD_TO_FILE,
    CURLKHSTAT_FINE,
    CURLKHSTAT_REJECT, { reject the connection, return an error }
    CURLKHSTAT_DEFER,  { do not accept it, but we can't answer right now so
                          this causes a CURLE_DEFER error but otherwise the
                          connection will be left intact etc }
    CURLKHSTAT_LAST    { not for use, only a marker for last-in-list }
  );
  {$EXTERNALSYM curl_khstat}
  TCurlKHStat = curl_khstat;

  ///<summary>this is the set of status codes pass in to the callback</summary>
  curl_khmatch = (
    CURLKHMATCH_OK,       { match }
    CURLKHMATCH_MISMATCH, { host found, key mismatch! }
    CURLKHMATCH_MISSING,  { no matching host/key found }
    CURLKHMATCH_LAST      { not for use, only a marker for last-in-list }
  );
  {$EXTERNALSYM curl_khmatch}
  TCurlKHMatch = curl_khmatch;


  curl_sshkeycallback = function (easy: PCURL;                { easy handle }
                                  knownkey: PCurlKHKey;       { known }
                                  foundkey: PCurlKHKey;       { found }
                                  viewonkeys: curl_khmatch;   { libcurl's view on the keys }
                                  clientp: Pointer): Integer; cdecl; { custom pointer passed from app }
  {$EXTERNALSYM curl_sshkeycallback}

  ///<summary>parameter for the CURLOPT_USE_SSL option</summary>
  curl_usessl = (
    CURLUSESSL_NONE,    { do not attempt to use SSL }
    CURLUSESSL_TRY,     { try using SSL, proceed anyway otherwise }
    CURLUSESSL_CONTROL, { SSL for the control connection or fail }
    CURLUSESSL_ALL,     { SSL for all communication or fail }
    CURLUSESSL_LAST     { not an option, never use }
  );
  {$EXTERNALSYM curl_usessl}
  Tcurl_usessl = curl_usessl;

  { Definition of bits for the CURLOPT_SSL_OPTIONS argument: }

const
  ///<summary>- ALLOW_BEAST tells libcurl to allow the BEAST SSL vulnerability in the
  /// name of improving interoperability with older servers. Some SSL libraries
  /// have introduced work-arounds for this flaw but those work-arounds sometimes
  /// make the SSL communication fail. To regain functionality with those broken
  /// servers, a user can this way allow the vulnerability back.</summary>
  CURLSSLOPT_ALLOW_BEAST = 1;
  {$EXTERNALSYM CURLSSLOPT_ALLOW_BEAST}

  ///<summary>- NO_REVOKE tells libcurl to disable certificate revocation checks for those
  ///   SSL backends where such behavior is present.</summary>
  CURLSSLOPT_NO_REVOKE = 1;
  {$EXTERNALSYM CURLSSLOPT_NO_REVOKE}

  { Backwards compatibility with older names }
  { These are scheduled to disappear by 2009 }

  CURLFTPSSL_NONE = CURLUSESSL_NONE;
  {$EXTERNALSYM CURLFTPSSL_NONE}
  CURLFTPSSL_TRY = CURLUSESSL_TRY;
  {$EXTERNALSYM CURLFTPSSL_TRY}
  CURLFTPSSL_CONTROL = CURLUSESSL_CONTROL;
  {$EXTERNALSYM CURLFTPSSL_CONTROL}
  CURLFTPSSL_ALL = CURLUSESSL_ALL;
  {$EXTERNALSYM CURLFTPSSL_ALL}
  CURLFTPSSL_LAST = CURLUSESSL_LAST;
  {$EXTERNALSYM CURLFTPSSL_LAST}

type
  ///<summary>parameter for the CURLOPT_FTP_SSL_CCC option</summary>
  curl_ftpccc = (
    CURLFTPSSL_CCC_NONE,    { do not send CCC }
    CURLFTPSSL_CCC_PASSIVE, { Let the server initiate the shutdown }
    CURLFTPSSL_CCC_ACTIVE,  { Initiate the shutdown }
    CURLFTPSSL_CCC_LAST     { not an option, never use }
  );
  {$EXTERNALSYM curl_ftpccc}
  TCurlFTPCCC = curl_ftpccc;

  ///<summary>parameter for the CURLOPT_FTPSSLAUTH option</summary>
  curl_ftpauth = (
    CURLFTPAUTH_DEFAULT, { let libcurl decide }
    CURLFTPAUTH_SSL,     { use "AUTH SSL" }
    CURLFTPAUTH_TLS,     { use "AUTH TLS" }
    CURLFTPAUTH_LAST { not an option, never use }
  );
  {$EXTERNALSYM curl_ftpauth}
  TCurlFTPAuth = curl_ftpauth;

  ///<summary>parameter for the CURLOPT_FTP_CREATE_MISSING_DIRS option</summary>
  curl_ftpcreatedir = (
    CURLFTP_CREATE_DIR_NONE,  { do NOT create missing dirs! }
    CURLFTP_CREATE_DIR,       { (FTP/SFTP) if CWD fails, try MKD and then CWD
                                 again if MKD succeeded, for SFTP this does
                                 similar magic }
    CURLFTP_CREATE_DIR_RETRY, { (FTP only) if CWD fails, try MKD and then CWD
                                 again even if MKD failed! }
    CURLFTP_CREATE_DIR_LAST   { not an option, never use }
  );
  {$EXTERNALSYM curl_ftpcreatedir}
  TCurlFTPCreateDir = curl_ftpcreatedir;

  ///<summary>parameter for the CURLOPT_FTP_FILEMETHOD option</summary>
  curl_ftpmethod = (
    CURLFTPMETHOD_DEFAULT,   { let libcurl pick }
    CURLFTPMETHOD_MULTICWD,  { single CWD operation for each path part }
    CURLFTPMETHOD_NOCWD,     { no CWD at all }
    CURLFTPMETHOD_SINGLECWD, { one CWD to full dir, then work on file }
    CURLFTPMETHOD_LAST       { not an option, never use }
  );
  {$EXTERNALSYM curl_ftpmethod}
  TCurlFTPMethod = curl_ftpmethod;

const
  { bitmask defines for CURLOPT_HEADEROPT }
  CURLHEADER_UNIFIED = 0;
  {$EXTERNALSYM CURLHEADER_UNIFIED}
  CURLHEADER_SEPARATE = 1 shl 0;
  {$EXTERNALSYM CURLHEADER_SEPARATE}

  { CURLPROTO_ defines are for the CURLOPT_*PROTOCOLS options }
  CURLPROTO_HTTP = 1 shl 0;
  {$EXTERNALSYM CURLPROTO_HTTP}
  CURLPROTO_HTTPS = 1 shl 1;
  {$EXTERNALSYM CURLPROTO_HTTPS}
  CURLPROTO_FTP = 1 shl 2;
  {$EXTERNALSYM CURLPROTO_FTP}
  CURLPROTO_FTPS = 1 shl 3;
  {$EXTERNALSYM CURLPROTO_FTPS}
  CURLPROTO_SCP = 1 shl 4;
  {$EXTERNALSYM CURLPROTO_SCP}
  CURLPROTO_SFTP = 1 shl 5;
  {$EXTERNALSYM CURLPROTO_SFTP}
  CURLPROTO_TELNET = 1 shl 6;
  {$EXTERNALSYM CURLPROTO_TELNET}
  CURLPROTO_LDAP = 1 shl 7;
  {$EXTERNALSYM CURLPROTO_LDAP}
  CURLPROTO_LDAPS = 1 shl 8;
  {$EXTERNALSYM CURLPROTO_LDAPS}
  CURLPROTO_DICT = 1 shl 9;
  {$EXTERNALSYM CURLPROTO_DICT}
  CURLPROTO_FILE = 1 shl 10;
  {$EXTERNALSYM CURLPROTO_FILE}
  CURLPROTO_TFTP = 1 shl 11;
  {$EXTERNALSYM CURLPROTO_TFTP}
  CURLPROTO_IMAP = 1 shl 12;
  {$EXTERNALSYM CURLPROTO_IMAP}
  CURLPROTO_IMAPS = 1 shl 13;
  {$EXTERNALSYM CURLPROTO_IMAPS}
  CURLPROTO_POP3 = 1 shl 14;
  {$EXTERNALSYM CURLPROTO_POP3}
  CURLPROTO_POP3S = 1 shl 15;
  {$EXTERNALSYM CURLPROTO_POP3S}
  CURLPROTO_SMTP = 1 shl 16;
  {$EXTERNALSYM CURLPROTO_SMTP}
  CURLPROTO_SMTPS = 1 shl 17;
  {$EXTERNALSYM CURLPROTO_SMTPS}
  CURLPROTO_RTSP = 1 shl 18;
  {$EXTERNALSYM CURLPROTO_RTSP}
  CURLPROTO_RTMP = 1 shl 19;
  {$EXTERNALSYM CURLPROTO_RTMP}
  CURLPROTO_RTMPT = 1 shl 20;
  {$EXTERNALSYM CURLPROTO_RTMPT}
  CURLPROTO_RTMPE = 1 shl 21;
  {$EXTERNALSYM CURLPROTO_RTMPE}
  CURLPROTO_RTMPTE = 1 shl 22;
  {$EXTERNALSYM CURLPROTO_RTMPTE}
  CURLPROTO_RTMPS = 1 shl 23;
  {$EXTERNALSYM CURLPROTO_RTMPS}
  CURLPROTO_RTMPTS = 1 shl 24;
  {$EXTERNALSYM CURLPROTO_RTMPTS}
  CURLPROTO_GOPHER = 1 shl 25;
  {$EXTERNALSYM CURLPROTO_GOPHER}
  CURLPROTO_SMB = 1 shl 26;
  {$EXTERNALSYM CURLPROTO_SMB}
  CURLPROTO_SMBS = 1 shl 27;
  {$EXTERNALSYM CURLPROTO_SMBS}
  CURLPROTO_ALL = not 0; { enable everything }
  {$EXTERNALSYM CURLPROTO_ALL}

  { long may be 32 or 64 bits, but we should never depend on anything else but 32 }
  CURLOPTTYPE_LONG          =     0;
  {$EXTERNALSYM CURLOPTTYPE_LONG}
  CURLOPTTYPE_OBJECTPOINT   = 10000;
  {$EXTERNALSYM CURLOPTTYPE_OBJECTPOINT}
  CURLOPTTYPE_FUNCTIONPOINT = 20000;
  {$EXTERNALSYM CURLOPTTYPE_FUNCTIONPOINT}
  CURLOPTTYPE_OFF_T         = 30000;
  {$EXTERNALSYM CURLOPTTYPE_OFF_T}

type
  CURLoption = (
    CURLOPT_PORT                    = 3,
    CURLOPT_TIMEOUT                 = 13,
    CURLOPT_INFILESIZE              = 14,
    CURLOPT_LOW_SPEED_LIMIT         = 19,
    CURLOPT_LOW_SPEED_TIME          = 20,
    CURLOPT_RESUME_FROM             = 21,
    CURLOPT_CRLF                    = 27,
    CURLOPT_SSLVERSION              = 32,
    CURLOPT_TIMECONDITION           = 33,
    CURLOPT_TIMEVALUE               = 34,
    CURLOPT_VERBOSE                 = 41,
    CURLOPT_HEADER                  = 42,
    CURLOPT_NOPROGRESS              = 43,
    CURLOPT_NOBODY                  = 44,
    CURLOPT_FAILONERROR             = 45,
    CURLOPT_UPLOAD                  = 46,
    CURLOPT_POST                    = 47,
    CURLOPT_DIRLISTONLY             = 48,
    CURLOPT_APPEND                  = 50,
    CURLOPT_NETRC                   = 51,
    CURLOPT_FOLLOWLOCATION          = 52,
    CURLOPT_TRANSFERTEXT            = 53,
    CURLOPT_PUT                     = 54,
    CURLOPT_AUTOREFERER             = 58,
    CURLOPT_PROXYPORT               = 59,
    CURLOPT_POSTFIELDSIZE           = 60,
    CURLOPT_HTTPPROXYTUNNEL         = 61,
    CURLOPT_SSL_VERIFYPEER          = 64,
    CURLOPT_MAXREDIRS               = 68,
    CURLOPT_FILETIME                = 69,
    CURLOPT_MAXCONNECTS             = 71,
    CURLOPT_CLOSEPOLICY             = 72, { Obsolete }
    CURLOPT_FRESH_CONNECT           = 74,
    CURLOPT_FORBID_REUSE            = 75,
    CURLOPT_CONNECTTIMEOUT          = 78,
    CURLOPT_HTTPGET                 = 80,
    CURLOPT_SSL_VERIFYHOST          = 81,
    CURLOPT_HTTP_VERSION            = 84,
    CURLOPT_FTP_USE_EPSV            = 85,
    CURLOPT_SSLENGINE_DEFAULT       = 90,
    CURLOPT_DNS_USE_GLOBAL_CACHE    = 91,
    CURLOPT_DNS_CACHE_TIMEOUT       = 92,
    CURLOPT_COOKIESESSION           = 96,
    CURLOPT_BUFFERSIZE              = 98,
    CURLOPT_NOSIGNAL                = 99,
    CURLOPT_PROXYTYPE               = 101,
    CURLOPT_UNRESTRICTED_AUTH       = 105,
    CURLOPT_FTP_USE_EPRT            = 106,
    CURLOPT_HTTPAUTH                = 107,
    CURLOPT_FTP_CREATE_MISSING_DIRS = 110,
    CURLOPT_PROXYAUTH               = 111,
    CURLOPT_FTP_RESPONSE_TIMEOUT    = 112,
    CURLOPT_SERVER_RESPONSE_TIMEOUT = CURLOPT_FTP_RESPONSE_TIMEOUT,
    CURLOPT_IPRESOLVE               = 113,
    CURLOPT_MAXFILESIZE             = 114,
    CURLOPT_USE_SSL                 = 119,
    CURLOPT_TCP_NODELAY             = 121,
    CURLOPT_FTPSSLAUTH              = 129,
    CURLOPT_IGNORE_CONTENT_LENGTH   = 136,
    CURLOPT_FTP_SKIP_PASV_IP        = 137,
    CURLOPT_FTP_FILEMETHOD          = 138,
    CURLOPT_LOCALPORT               = 139,
    CURLOPT_LOCALPORTRANGE          = 140,
    CURLOPT_CONNECTONLY             = 141,
    CURLOPT_SSL_SESSIONID_CACHE     = 150,
    CURLOPT_SSH_AUTH_TYPES          = 151,
    CURLOPT_FTP_SSL_CCC             = 154,
    CURLOPT_TIMEOUT_MS              = 155,
    CURLOPT_CONNECTTIMEOUT_MS       = 156,
    CURLOPT_HTTP_TRANSFER_DECODING  = 157,
    CURLOPT_HTTP_CONTENT_DECODING   = 158,
    CURLOPT_NEW_FILE_PERMS          = 159,
    CURLOPT_NEW_DIRECTORY_PERMS     = 160,
    CURLOPT_POSTREDIR               = 161,
    CURLOPT_PROXY_TRANSFER_MODE     = 166,
    CURLOPT_ADDRESS_SCOPE           = 171,
    CURLOPT_CERTINFO                = 172,
    CURLOPT_TFTP_BLKSIZE            = 178,
    CURLOPT_SOCKS5_GSSAPI_NEC       = 180,
    CURLOPT_PROTOCOLS               = 181,
    CURLOPT_REDIR_PROTOCOLS         = 182,
    CURLOPT_FTP_USE_PRET            = 188,
    CURLOPT_RTSP_REQUEST            = 189,
    CURLOPT_RTSP_CLIENT_CSEQ        = 193,
    CURLOPT_RTSP_SERVER_CSEQ        = 194,
    CURLOPT_WILDCARDMATCH           = 197,
    CURLOPT_TRANSFER_ENCODING       = 207,
    CURLOPT_GSSAPI_DELEGATION       = 210,
    CURLOPT_ACCEPTTIMEOUT_MS        = 212,
    CURLOPT_TCP_KEEPALIVE           = 213,
    CURLOPT_TCP_KEEPIDLE            = 214,
    CURLOPT_TCP_KEEPINTVL           = 215,
    CURLOPT_SSL_OPTIONS             = 216,
    CURLOPT_SASL_IR                 = 218,
    CURLOPT_SSL_ENABLE_NPN          = 225,
    CURLOPT_SSL_ENABLE_ALPN         = 226,
    CURLOPT_EXPECT_100_TIMEOUT_MS   = 227,
    CURLOPT_HEADEROPT               = 229,
    CURLOPT_SSL_VERIFYSTATUS        = 232,
    CURLOPT_SSL_FALSESTART          = 233,
    CURLOPT_PATH_AS_IS              = 234,
    CURLOPT_PIPEWAIT                = 237,
    CURLOPT_STREAM_WEIGHT           = 239,
    CURLOPT_WRITEDATA               = 10001,
    CURLOPT_URL                     = 10002,
    CURLOPT_PROXY                   = 10004,
    CURLOPT_USERPWD                 = 10005,
    CURLOPT_PROXYUSERPWD            = 10006,
    CURLOPT_RANGE                   = 10007,
    CURLOPT_READDATA                = 10009,
    CURLOPT_ERRORBUFFER             = 10010,
    CURLOPT_POSTFIELDS              = 10015,
    CURLOPT_REFERER                 = 10016,
    CURLOPT_FTPPORT                 = 10017,
    CURLOPT_USERAGENT               = 10018,
    CURLOPT_COOKIE                  = 10022,
    CURLOPT_HTTPHEADER              = 10023,
    CURLOPT_HTTPPOST                = 10024,
    CURLOPT_SSLCERT                 = 10025,
    CURLOPT_KEYPASSWD               = 10026,
    CURLOPT_QUOTE                   = 10028,
    CURLOPT_HEADERDATA              = 10029,
    CURLOPT_COOKIEFILE              = 10031,
    CURLOPT_CUSTOMREQUEST           = 10036,
    CURLOPT_STDERR                  = 10037,
    CURLOPT_POSTQUOTE               = 10039,
    CURLOPT_OBSOLETE                = 10040,
    CURLOPT_PROGRESSDATA            = 10057,
    CURLOPT_INTERFACE               = 10062,
    CURLOPT_KRBLEVEL                = 10063,
    CURLOPT_CAINFO                  = 10065,
    CURLOPT_TELNETOPTIONS           = 10070,
    CURLOPT_RANDOM_FILE             = 10076,
    CURLOPT_EGDSOCKET               = 10077,
    CURLOPT_COOKIEJAR               = 10082,
    CURLOPT_SSL_CIPHER_LIST         = 10083,
    CURLOPT_SSLCERTTYPE             = 10086,
    CURLOPT_SSLKEY                  = 10087,
    CURLOPT_SSLKEYTYPE              = 10088,
    CURLOPT_SSLENGINE               = 10089,
    CURLOPT_PREQUOTE                = 10093,
    CURLOPT_DEBUGDATA               = 10095,
    CURLOPT_CAPATH                  = 10097,
    CURLOPT_SHARE                   = 10100,
    CURLOPT_ENCODING                = 10102,
    CURLOPT_PRIVATE                 = 10103,
    CURLOPT_HTTP200ALIASES          = 10104,
    CURLOPT_SSL_CTX_DATA            = 10109,
    CURLOPT_NETRC_FILE              = 10118,
    CURLOPT_SOURCE_USERPWD          = 10123,
    CURLOPT_SOURCE_PREQUOTE         = 10127,
    CURLOPT_SOURCE_POSTQUOTE        = 10128,
    CURLOPT_IOCTLDATA               = 10131,
    CURLOPT_SOURCE_URL              = 10132, { Obsolete. Removed in 7.16.0 }
    CURLOPT_SOURCE_QUOTE            = 10133, { Obsolete. Removed in 7.16.0 }
    CURLOPT_FTP_ACCOUNT             = 10134,
    CURLOPT_COOKIELIST              = 10135,
    CURLOPT_FTP_ALTERNATIVE_TO_USER = 10147,
    CURLOPT_SOCKOPTDATA             = 10149,
    CURLOPT_SSH_PUBLIC_KEYFILE      = 10152,
    CURLOPT_SSH_PRIVATE_KEYFILE     = 10153,
    CURLOPT_SSH_HOST_PUBLIC_KEY_MD5 = 10162,
    CURLOPT_OPENSOCKETDATA          = 10164,
    CURLOPT_COPYPOSTFIELDS          = 10165,
    CURLOPT_SEEKDATA                = 10168,
    CURLOPT_CRLFILE                 = 10169,
    CURLOPT_ISSUERCERT              = 10170,
    CURLOPT_USERNAME                = 10173,
    CURLOPT_PASSWORD                = 10174,
    CURLOPT_PROXYUSERNAME           = 10175,
    CURLOPT_PROXYPASSWORD           = 10176,
    CURLOPT_NOPROXY                 = 10177,
    CURLOPT_SOCKS5_GSSAPI_SERVICE   = 10179,
    CURLOPT_SSH_KNOWNHOSTS          = 10183,
    CURLOPT_SSH_KEYDATA             = 10185,
    CURLOPT_MAIL_FROM               = 10186,
    CURLOPT_MAIL_RCPT               = 10187,
    CURLOPT_RTSP_SESSION_ID         = 10190,
    CURLOPT_RTSP_STREAM_URI         = 10191,
    CURLOPT_RTSP_TRANSPORT          = 10192,
    CURLOPT_INTERLEAVEDATA          = 10195,
    CURLOPT_CHUNK_DATA              = 10201,
    CURLOPT_FNMATCH_DATA            = 10202,
    CURLOPT_RESOLVE                 = 10203,
    CURLOPT_TLSAUTH_USERNAME        = 10204,
    CURLOPT_TLSAUTH_PASSWORD        = 10205,
    CURLOPT_TLSAUTH_TYPE            = 10206,
    CURLOPT_CLOSESOCKETDATA         = 10209,
    CURLOPT_DNS_SERVERS             = 10211,
    CURLOPT_MAIL_AUTH               = 10217,
    CURLOPT_XOAUTH2_BEARER          = 10220,
    CURLOPT_DNS_INTERFACE           = 10221,
    CURLOPT_DNS_LOCAL_IP4           = 10222,
    CURLOPT_DNS_LOCAL_IP6           = 10223,
    CURLOPT_LOGIN_OPTIONS           = 10224,
    CURLOPT_PROXYHEADER             = 10228,
    CURLOPT_PINNEDPUBLICKEY         = 10230,
    CURLOPT_UNIX_SOCKET_PATH        = 10231,
    CURLOPT_PROXY_SERVICE_NAME      = 10235,
    CURLOPT_SERVICE_NAME            = 10236,
    CURLOPT_DEFAULT_PROTOCOL        = 10238,
    CURLOPT_STREAM_DEPENDS          = 10240,
    CURLOPT_STREAM_DEPENDS_E        = 10241,
    CURLOPT_WRITEFUNCTION           = 20011,
    CURLOPT_READFUNCTION            = 20012,
    CURLOPT_PROGRESSFUNCTION        = 20056, { Deprecated }
    CURLOPT_HEADERFUNCTION          = 20079,
    CURLOPT_DEBUGFUNCTION           = 20094,
    CURLOPT_SSL_CTX_FUNCTION        = 20108,
    CURLOPT_IOCTLFUNCTION           = 20130,
    CURLOPT_CONV_FROM_NETWORK_FUNCTION = 20142,
    CURLOPT_CONV_TO_NETWORK_FUNCTION   = 20143,
    CURLOPT_CONV_FROM_UTF8_FUNCTION    = 20144,
    CURLOPT_SOCKOPTFUNCTION            = 20148,
    CURLOPT_OPENSOCKETFUNCTION         = 20163,
    CURLOPT_SEEKFUNCTION               = 20167,
    CURLOPT_SSH_KEYFUNCTION            = 20184,
    CURLOPT_INTERLEAVEFUNCTION         = 20196,
    CURLOPT_CHUNK_BGN_FUNCTION         = 20198,
    CURLOPT_CHUNK_END_FUNCTION         = 20199,
    CURLOPT_FNMATCH_FUNCTION           = 20200,
    CURLOPT_CLOSESOCKETFUNCTION        = 20208,
    CURLOPT_XFERINFOFUNCTION           = 20219,
    CURLOPT_INFILESIZE_LARGE           = 30115,
    CURLOPT_RESUME_FROM_LARGE          = 30116,
    CURLOPT_MAXFILESIZE_LARGE          = 30117,
    CURLOPT_POSTFIELDSIZE_LARGE        = 30120,
    CURLOPT_MAX_SEND_SPEED_LARGE       = 30145,
    CURLOPT_MAX_RECV_SPEED_LARGE       = 30146,
    CURLOPT_LASTENTRY
  );
  {$EXTERNALSYM CURLoption}
  TCURLOption = CURLoption;

const
  { Below here follows defines for the CURLOPT_IPRESOLVE option. If a host
     name resolves addresses using more than one IP protocol version, this
     option might be handy to force libcurl to use a specific IP version. }
  CURL_IPRESOLVE_WHATEVER = 0; { default, resolves addresses to all IP versions that your system allows }
  {$EXTERNALSYM CURL_IPRESOLVE_WHATEVER}
  CURL_IPRESOLVE_V4       = 1; { resolve to IPv4 addresses }
  {$EXTERNALSYM CURL_IPRESOLVE_V4}
  CURL_IPRESOLVE_V6       = 2; { resolve to IPv6 addresses }
  {$EXTERNALSYM CURL_IPRESOLVE_V6}

  ///<summary>three convenient "aliases" that follow the name scheme better</summary>
  CURLOPT_RTSPHEADER = CURLOPT_HTTPHEADER;
  {$EXTERNALSYM CURLOPT_RTSPHEADER}

type
  ///<summary>These enums are for use with the CURLOPT_HTTP_VERSION option.</summary>
  curl_http_version = (
    CURL_HTTP_VERSION_NONE, { setting this means we don't care, and that we'd
                               like the library to choose the best possible
                               for us! }
    CURL_HTTP_VERSION_1_0,  { please use HTTP 1.0 in the request }
    CURL_HTTP_VERSION_1_1,  { please use HTTP 1.1 in the request }
    CURL_HTTP_VERSION_2_0,  { please use HTTP 2.0 in the request }

    CURL_HTTP_VERSION_LAST  { *ILLEGAL* http version }
  );
  TCurlHTTPVersion = curl_http_version;

const
  ///<summary>Convenience definition simple because the name of the version is HTTP/2 and
  /// not 2.0. The 2_0 version of the enum name was set while the version was
  /// still planned to be 2.0 and we stick to it for compatibility.</summary>
  CURL_HTTP_VERSION_2 = CURL_HTTP_VERSION_2_0;
  {$EXTERNALSYM CURL_HTTP_VERSION_2}

type
  ///<summary>Public API enums for RTSP requests</summary>
  curl_rtspreq_values = (
      CURL_RTSPREQ_NONE, { first in list }
      CURL_RTSPREQ_OPTIONS,
      CURL_RTSPREQ_DESCRIBE,
      CURL_RTSPREQ_ANNOUNCE,
      CURL_RTSPREQ_SETUP,
      CURL_RTSPREQ_PLAY,
      CURL_RTSPREQ_PAUSE,
      CURL_RTSPREQ_TEARDOWN,
      CURL_RTSPREQ_GET_PARAMETER,
      CURL_RTSPREQ_SET_PARAMETER,
      CURL_RTSPREQ_RECORD,
      CURL_RTSPREQ_RECEIVE,
      CURL_RTSPREQ_LAST { last in list }
  );
  TCurlRtspreqValues = curl_rtspreq_values;

  ///<summary>These enums are for use with the CURLOPT_NETRC option.</summary>
  CURL_NETRC_OPTION = (
    CURL_NETRC_IGNORED,     { The .netrc will never be read. This is the default. }
    CURL_NETRC_OPTIONAL,    { A user:password in the URL will be preferred to one in the .netrc. }
    CURL_NETRC_REQUIRED,    { A user:password in the URL will be ignored.
                             * Unless one is set programmatically, the .netrc
                             * will be queried. }
    CURL_NETRC_LAST
  );
  {$EXTERNALSYM CURL_NETRC_OPTION}
  TCurlNetRCOption = CURL_NETRC_OPTION;

  curl_ssl_version = (
    CURL_SSLVERSION_DEFAULT,
    CURL_SSLVERSION_TLSv1, { TLS 1.x }
    CURL_SSLVERSION_SSLv2,
    CURL_SSLVERSION_SSLv3,
    CURL_SSLVERSION_TLSv1_0,
    CURL_SSLVERSION_TLSv1_1,
    CURL_SSLVERSION_TLSv1_2,
    CURL_SSLVERSION_LAST { never use, keep last }
  );
  TCurlSSLVersion = curl_ssl_version;

  CURL_TLSAUTH = (
    CURL_TLSAUTH_NONE,
    CURL_TLSAUTH_SRP,
    CURL_TLSAUTH_LAST { never use, keep last }
  );
  {$EXTERNALSYM CURL_TLSAUTH}
  TCurlTLSAuth = CURL_TLSAUTH;

const
  { symbols to use with CURLOPT_POSTREDIR.
    CURL_REDIR_POST_301, CURL_REDIR_POST_302 and CURL_REDIR_POST_303
    can be bitwise ORed so that CURL_REDIR_POST_301 | CURL_REDIR_POST_302
    | CURL_REDIR_POST_303 == CURL_REDIR_POST_ALL }
  CURL_REDIR_GET_ALL  = 0;
  {$EXTERNALSYM CURL_REDIR_GET_ALL}
  CURL_REDIR_POST_301 = 1;
  {$EXTERNALSYM CURL_REDIR_POST_301}
  CURL_REDIR_POST_302 = 2;
  {$EXTERNALSYM CURL_REDIR_POST_302}
  CURL_REDIR_POST_303 = 4;
  {$EXTERNALSYM CURL_REDIR_POST_303}
  CURL_REDIR_POST_ALL = (CURL_REDIR_POST_301 or CURL_REDIR_POST_302 or CURL_REDIR_POST_303);
  {$EXTERNALSYM CURL_REDIR_POST_ALL}

type
  curl_TimeCond = (
    CURL_TIMECOND_NONE,
    CURL_TIMECOND_IFMODSINCE,
    CURL_TIMECOND_IFUNMODSINCE,
    CURL_TIMECOND_LASTMOD,
    CURL_TIMECOND_LAST
  );
  {$EXTERNALSYM curl_TimeCond}
  TCurlTimeCond = curl_TimeCond;

{ curl_strequal() and curl_strnequal() are subject for removal in a future
   libcurl, see lib/README.curlx for details }
function curl_strequal(s1: MarshaledAString; s2: MarshaledAString): Integer; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_strequal}

function curl_strnequal(s1: MarshaledAString; s2: MarshaledAString; n: size_t): Integer; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_strnequal}

type
  CURLformoption = (
    CURLFORM_NOTHING,        {********* the first one is unused ************}
    CURLFORM_COPYNAME,
    CURLFORM_PTRNAME,
    CURLFORM_NAMELENGTH,
    CURLFORM_COPYCONTENTS,
    CURLFORM_PTRCONTENTS,
    CURLFORM_CONTENTSLENGTH,
    CURLFORM_FILECONTENT,
    CURLFORM_ARRAY,
    CURLFORM_OBSOLETE,
    CURLFORM_FILE,
    CURLFORM_BUFFER,
    CURLFORM_BUFFERPTR,
    CURLFORM_BUFFERLENGTH,
    CURLFORM_CONTENTTYPE,
    CURLFORM_CONTENTHEADER,
    CURLFORM_FILENAME,
    CURLFORM_END,
    CURLFORM_OBSOLETE2,
    CURLFORM_STREAM,
    CURLFORM_LASTENTRY { the last unused }
  );
  {$EXTERNALSYM CURLformoption}
  TCURLFormOption = CURLformoption;

  { structure to be used as parameter for CURLFORM_ARRAY }
  curl_forms = record
    option: CURLformoption;
    value: MarshaledAString;
  end;
  {$EXTERNALSYM curl_forms}
  TCURLForms = curl_forms;

  { use this for multipart formpost building }
  { Returns code for curl_formadd()
   *
   * Returns:
   * CURL_FORMADD_OK             on success
   * CURL_FORMADD_MEMORY         if the FormInfo allocation fails
   * CURL_FORMADD_OPTION_TWICE   if one option is given twice for one Form
   * CURL_FORMADD_NULL           if a null pointer was given for a char
   * CURL_FORMADD_MEMORY         if the allocation of a FormInfo struct failed
   * CURL_FORMADD_UNKNOWN_OPTION if an unknown option was used
   * CURL_FORMADD_INCOMPLETE     if the some FormInfo is not complete (or error)
   * CURL_FORMADD_MEMORY         if a curl_httppost struct cannot be allocated
   * CURL_FORMADD_MEMORY         if some allocation for string copying failed.
   * CURL_FORMADD_ILLEGAL_ARRAY  if an illegal option is used in an array
   *
   **************************************************************************}
  CURLFORMcode = (
    CURL_FORMADD_OK, { first, no error }
    CURL_FORMADD_MEMORY,
    CURL_FORMADD_OPTION_TWICE,
    CURL_FORMADD_NULL,
    CURL_FORMADD_UNKNOWN_OPTION,
    CURL_FORMADD_INCOMPLETE,
    CURL_FORMADD_ILLEGAL_ARRAY,
    CURL_FORMADD_DISABLED, { libcurl was built with this disabled }
    CURL_FORMADD_LAST { last }
  );
  {$EXTERNALSYM CURLFORMcode}
  TCURLFormCode = CURLFORMcode;

///<summary>Pretty advanced function for building multi-part formposts. Each invoke
/// adds one part that together construct a full post. Then use
/// CURLOPT_HTTPPOST to send it off to libcurl.</summary>
function curl_formadd(httppost: PPointer; { curl_httppost }
                       last_post: PPointer { curl_httppost }
                       ): CURLFORMcode; varargs; cdecl; external LibCurl;
{$EXTERNALSYM curl_formadd}

type
  ///<summary>callback function for curl_formget()
  /// The void *arg pointer will be the one passed as second argument to
  ///   curl_formget().
  /// The character buffer passed to it must not be freed.
  /// Should return the buffer length passed to it as the argument "len" on
  /// success.</summary>
  curl_formget_callback = function (arg: Pointer; buf: MarshaledAString; len: size_t): size_t; cdecl;
  {$EXTERNALSYM curl_formget_callback}

///<summary>Serialize a curl_httppost struct built with curl_formadd().
/// Accepts a void pointer as second argument which will be passed to
/// the curl_formget_callback function.
/// Returns 0 on success.</summary>
function curl_formget(form: pcurl_httppost; arg: Pointer; append: curl_formget_callback): Integer; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_formget}

 ///<summary>Free a multipart formpost previously built with curl_formadd().</summary>
procedure curl_formfree(form: pcurl_httppost); cdecl;
  external LibCurl;
{$EXTERNALSYM curl_formfree}

///<summary>Returns a malloc()'ed string that MUST be curl_free()ed after usage is
///complete. DEPRECATED - see lib/README.curlx</summary>
function curl_getenv(variable: MarshaledAString): MarshaledAString; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_getenv}

///<summary>Returns a static ascii string of the libcurl version.</summary>
function curl_version: MarshaledAString; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_version}

///<summary>Escapes URL strings (converts all letters consider illegal in URLs to their
/// %XX versions). This function returns a new allocated string or NULL if an
/// error occurred.</summary>
function curl_easy_escape(handle: PCURL; &string: MarshaledAString; length: Integer): MarshaledAString; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_easy_escape}

///<summary>the previous version:</summary>
function curl_escape(&string: MarshaledAString; length: Integer): MarshaledAString; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_escape}

///<summary>Unescapes URL encoding in strings (converts all %XX codes to their 8bit
///versions). This function returns a new allocated string or NULL if an error
///occurred.
///Conversion Note: On non-ASCII platforms the ASCII %XX codes are
///converted into the host encoding.</summary>
function curl_easy_unescape(handle: PCURL; &string: MarshaledAString; length: Integer;
                            outlength: Integer): MarshaledAString; cdecl; external LibCurl;
{$EXTERNALSYM curl_easy_unescape}

///<summary>the previous version</summary>
function curl_unescape(&string: MarshaledAString; length: Integer): MarshaledAString; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_unescape}

///<summary>Provided for de-allocation in the same translation unit that did the
///allocation. Added in libcurl 7.10</summary>
procedure curl_free(p: Pointer); cdecl;
  external LibCurl;
{$EXTERNALSYM curl_free}

///<summary>curl_global_init() should be invoked exactly once for each application that
///uses libcurl and before any call of other libcurl functions.
///
///This function is not thread-safe!</summary>
function curl_global_init(flags: Integer): CurlCode; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_global_init}

///<summary>curl_global_init() or curl_global_init_mem() should be invoked exactly once
/// for each application that uses libcurl.  This function can be used to
/// initialize libcurl and set user defined memory management callback
/// functions.  Users can implement memory management routines to check for
/// memory leaks, check for mis-use of the curl library etc.  User registered
/// callback routines with be invoked by this library instead of the system
/// memory management routines like malloc, free etc.</summary>
function curl_global_init_mem(flags: Integer; m: curl_malloc_callback; f: curl_free_callback;
                              r: curl_realloc_callback; s: curl_strdup_callback;
                              c: curl_calloc_callback): CURLCode; cdecl; external LibCurl;
{$EXTERNALSYM curl_global_init_mem}

///<summary>curl_global_cleanup() should be invoked exactly once for each application
/// that uses libcurl</summary>
procedure curl_global_cleanup; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_global_cleanup}

///<summary>Appends a string to a linked list. If no list exists, it will be created
///first. Returns the new list, after appending.</summary>
function curl_slist_append(list: pcurl_slist; str: MarshaledAString): pcurl_slist; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_slist_append}

///<summary>free a previously built curl_slist.</summary>
procedure curl_slist_free_all(list: pcurl_slist); cdecl;
  external LibCurl;
{$EXTERNALSYM curl_slist_free_all}

///<summary>Returns the time, in seconds since 1 Jan 1970 of the time string given in
///the first argument. The time argument in the second parameter is unused
///and should be set to NULL.</summary>
function curl_getdate(p: MarshaledAString; unused: time_t): time_t; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_getdate}

type
  ///<summary>info about the certificate chain, only for OpenSSL builds. Asked
  ///for with CURLOPT_CERTINFO / CURLINFO_CERTINFO</summary>
  curl_certinfo = record
    num_of_certs: Integer;              { number of certificates with information }
    certinfo: PPointer; { curl_slist }  { for each index in this array, there's a
                                           linked list with textual information in the
                                           format "name: value" }
  end;
  {$EXTERNALSYM curl_certinfo}
  TCurlCertInfo = curl_certinfo;
  PCurlCertInfo = ^curl_certinfo;

  ///<summary>enum for the different supported SSL backends</summary>
  curl_sslbackend = (
    CURLSSLBACKEND_NONE = 0,
    CURLSSLBACKEND_OPENSSL = 1,
    CURLSSLBACKEND_GNUTLS = 2,
    CURLSSLBACKEND_NSS = 3,
    CURLSSLBACKEND_OBSOLETE4 = 4,  { Was QSOSSL. }
    CURLSSLBACKEND_GSKIT = 5,
    CURLSSLBACKEND_POLARSSL = 6,
    CURLSSLBACKEND_CYASSL = 7,
    CURLSSLBACKEND_SCHANNEL = 8,
    CURLSSLBACKEND_DARWINSSL = 9,
    CURLSSLBACKEND_AXTLS = 10,
    CURLSSLBACKEND_MBEDTLS = 11
  );
  {$EXTERNALSYM curl_sslbackend}
  TCurlSSLBackend = curl_sslbackend;

  ///<summary>Information about the SSL library used and the respective internal SSL
  ///handle, which can be used to obtain further information regarding the
  ///connection. Asked for with CURLINFO_TLS_SESSION.</summary>
  curl_tlssessioninfo = record
    backend: curl_sslbackend;
    internals: Pointer;
  end;
  {$EXTERNALSYM curl_tlssessioninfo}
  TCURLTLSSessionInfo = curl_tlssessioninfo;

const
  CURLINFO_STRING   = $100000;
  {$EXTERNALSYM CURLINFO_STRING}
  CURLINFO_LONG     = $200000;
  {$EXTERNALSYM CURLINFO_LONG}
  CURLINFO_DOUBLE   = $300000;
  {$EXTERNALSYM CURLINFO_DOUBLE}
  CURLINFO_SLIST    = $400000;
  {$EXTERNALSYM CURLINFO_SLIST}
  CURLINFO_SOCKET   = $500000;
  {$EXTERNALSYM CURLINFO_SOCKET}
  CURLINFO_MASK     = $0fffff;
  {$EXTERNALSYM CURLINFO_MASK}
  CURLINFO_TYPEMASK = $f00000;
  {$EXTERNALSYM CURLINFO_TYPEMASK}

type
   CURLINFO = (
    CURLINFO_NONE, { first, never use this }
    CURLINFO_EFFECTIVE_URL    = CURLINFO_STRING + 1,
    CURLINFO_RESPONSE_CODE    = CURLINFO_LONG   + 2,
    CURLINFO_TOTAL_TIME       = CURLINFO_DOUBLE + 3,
    CURLINFO_NAMELOOKUP_TIME  = CURLINFO_DOUBLE + 4,
    CURLINFO_CONNECT_TIME     = CURLINFO_DOUBLE + 5,
    CURLINFO_PRETRANSFER_TIME = CURLINFO_DOUBLE + 6,
    CURLINFO_SIZE_UPLOAD      = CURLINFO_DOUBLE + 7,
    CURLINFO_SIZE_DOWNLOAD    = CURLINFO_DOUBLE + 8,
    CURLINFO_SPEED_DOWNLOAD   = CURLINFO_DOUBLE + 9,
    CURLINFO_SPEED_UPLOAD     = CURLINFO_DOUBLE + 10,
    CURLINFO_HEADER_SIZE      = CURLINFO_LONG   + 11,
    CURLINFO_REQUEST_SIZE     = CURLINFO_LONG   + 12,
    CURLINFO_SSL_VERIFYRESULT = CURLINFO_LONG   + 13,
    CURLINFO_FILETIME         = CURLINFO_LONG   + 14,
    CURLINFO_CONTENT_LENGTH_DOWNLOAD   = CURLINFO_DOUBLE + 15,
    CURLINFO_CONTENT_LENGTH_UPLOAD     = CURLINFO_DOUBLE + 16,
    CURLINFO_STARTTRANSFER_TIME = CURLINFO_DOUBLE + 17,
    CURLINFO_CONTENT_TYPE     = CURLINFO_STRING + 18,
    CURLINFO_REDIRECT_TIME    = CURLINFO_DOUBLE + 19,
    CURLINFO_REDIRECT_COUNT   = CURLINFO_LONG   + 20,
    CURLINFO_PRIVATE          = CURLINFO_STRING + 21,
    CURLINFO_HTTP_CONNECTCODE = CURLINFO_LONG   + 22,
    CURLINFO_HTTPAUTH_AVAIL   = CURLINFO_LONG   + 23,
    CURLINFO_PROXYAUTH_AVAIL  = CURLINFO_LONG   + 24,
    CURLINFO_OS_ERRNO         = CURLINFO_LONG   + 25,
    CURLINFO_NUM_CONNECTS     = CURLINFO_LONG   + 26,
    CURLINFO_SSL_ENGINES      = CURLINFO_SLIST  + 27,
    CURLINFO_COOKIELIST       = CURLINFO_SLIST  + 28,
    CURLINFO_LASTSOCKET       = CURLINFO_LONG   + 29,
    CURLINFO_FTP_ENTRY_PATH   = CURLINFO_STRING + 30,
    CURLINFO_REDIRECT_URL     = CURLINFO_STRING + 31,
    CURLINFO_PRIMARY_IP       = CURLINFO_STRING + 32,
    CURLINFO_APPCONNECT_TIME  = CURLINFO_DOUBLE + 33,
    CURLINFO_CERTINFO         = CURLINFO_SLIST  + 34,
    CURLINFO_CONDITION_UNMET  = CURLINFO_LONG   + 35,
    CURLINFO_RTSP_SESSION_ID  = CURLINFO_STRING + 36,
    CURLINFO_RTSP_CLIENT_CSEQ = CURLINFO_LONG   + 37,
    CURLINFO_RTSP_SERVER_CSEQ = CURLINFO_LONG   + 38,
    CURLINFO_RTSP_CSEQ_RECV   = CURLINFO_LONG   + 39,
    CURLINFO_PRIMARY_PORT     = CURLINFO_LONG   + 40,
    CURLINFO_LOCAL_IP         = CURLINFO_STRING + 41,
    CURLINFO_LOCAL_PORT       = CURLINFO_LONG   + 42,
    CURLINFO_TLS_SESSION      = CURLINFO_SLIST  + 43,
    CURLINFO_ACTIVESOCKET     = CURLINFO_SOCKET + 44,
    { Fill in new entries below here! }
    CURLINFO_LASTONE          = 44
  );
  {$EXTERNALSYM CURLINFO}
  TCurlInfo = CURLINFO;

const
  ///<summary>CURLINFO_RESPONSE_CODE is the new name for the option previously known as CURLINFO_HTTP_CODE</summary>
  CURLINFO_HTTP_CODE = CURLINFO_RESPONSE_CODE;
  {$EXTERNALSYM CURLINFO_HTTP_CODE}

type
  curl_closepolicy = (
    CURLCLOSEPOLICY_NONE, { first, never use this }
    CURLCLOSEPOLICY_OLDEST,
    CURLCLOSEPOLICY_LEAST_RECENTLY_USED,
    CURLCLOSEPOLICY_LEAST_TRAFFIC,
    CURLCLOSEPOLICY_SLOWEST,
    CURLCLOSEPOLICY_CALLBACK,
    CURLCLOSEPOLICY_LAST { last, never use this }
  );
  {$EXTERNALSYM curl_closepolicy}
  TCurlClosePolicy = curl_closepolicy;

const
  CURL_GLOBAL_SSL = 1 shl 0;
  {$EXTERNALSYM CURL_GLOBAL_SSL}
  CURL_GLOBAL_WIN32 = 1 shl 1;
  {$EXTERNALSYM CURL_GLOBAL_WIN32}
  CURL_GLOBAL_ALL = CURL_GLOBAL_SSL or CURL_GLOBAL_WIN32;
  {$EXTERNALSYM CURL_GLOBAL_ALL}
  CURL_GLOBAL_NOTHING = 0;
  {$EXTERNALSYM CURL_GLOBAL_NOTHING}
  CURL_GLOBAL_DEFAULT = CURL_GLOBAL_ALL;
  {$EXTERNALSYM CURL_GLOBAL_DEFAULT}
  CURL_GLOBAL_ACK_EINTR = 1 shl 2;
  {$EXTERNALSYM CURL_GLOBAL_ACK_EINTR}


type
  { Setup defines, protos etc for the sharing stuff. }

  ///<summary>Different data locks for a single share</summary>
  curl_lock_data = (
    CURL_LOCK_DATA_NONE = 0,
    {  CURL_LOCK_DATA_SHARE is used internally to say that
     *  the locking is just made to change the internal state of the share
     *  itself. }
    CURL_LOCK_DATA_SHARE,
    CURL_LOCK_DATA_COOKIE,
    CURL_LOCK_DATA_DNS,
    CURL_LOCK_DATA_SSL_SESSION,
    CURL_LOCK_DATA_CONNECT,
    CURL_LOCK_DATA_LAST
  );
  {$EXTERNALSYM curl_lock_data}
  TCurlLockData = curl_lock_data;

  ///<summary>Different lock access types</summary>
  curl_lock_access = (
    CURL_LOCK_ACCESS_NONE = 0,   { unspecified action }
    CURL_LOCK_ACCESS_SHARED = 1, { for read perhaps }
    CURL_LOCK_ACCESS_SINGLE = 2, { for write perhaps }
    CURL_LOCK_ACCESS_LAST        { never use }
  );
  {$EXTERNALSYM curl_lock_access}
  TCurlLockAccess = curl_lock_access;

  curl_lock_function = procedure (handle: PCURL;data: curl_lock_data; locktype: curl_lock_access; userptr: Pointer); cdecl;
  {$EXTERNALSYM curl_lock_function}
  curl_unlock_function = procedure (handle: PCURL; data: curl_lock_data; userptr: Pointer); cdecl;
  {$EXTERNALSYM curl_unlock_function}

  PCURLSH = Pointer;
  {$EXTERNALSYM PCURLSH}

  CURLSHcode = (
    CURLSHE_OK,  { all is fine }
    CURLSHE_BAD_OPTION, { 1 }
    CURLSHE_IN_USE,     { 2 }
    CURLSHE_INVALID,    { 3 }
    CURLSHE_NOMEM,      { 4 out of memory }
    CURLSHE_NOT_BUILT_IN, { 5 feature not present in lib }
    CURLSHE_LAST        { never use }
  );
  {$EXTERNALSYM CURLSHcode}
  TCURLSHCode = CURLSHcode;

  CURLSHoption = (
    CURLSHOPT_NONE,  { don't use }
    CURLSHOPT_SHARE,   { specify a data type to share }
    CURLSHOPT_UNSHARE, { specify which data type to stop sharing }
    CURLSHOPT_LOCKFUNC,   { pass in a 'curl_lock_function' pointer }
    CURLSHOPT_UNLOCKFUNC, { pass in a 'curl_unlock_function' pointer }
    CURLSHOPT_USERDATA,   { pass in a user data pointer used in the lock/unlock callback functions }
    CURLSHOPT_LAST  { never use }
  );
  {$EXTERNALSYM CURLSHoption}
  TCURLSHOption = CURLSHoption;

function curl_share_init: PCURLSH; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_share_init}

function curl_share_setopt(shareinit: PCURLSH; option: CURLSHoption): CURLSHcode; varargs; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_share_setopt}

function curl_share_cleanup(shareinit: PCURLSH): CURLSHcode; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_share_cleanup}


type
  { Structures for querying information about the curl library at runtime. }

  CURLversion = (
    CURLVERSION_FIRST,
    CURLVERSION_SECOND,
    CURLVERSION_THIRD,
    CURLVERSION_FOURTH,
    CURLVERSION_LAST { never actually use this }
  );
  {$EXTERNALSYM CURLversion}
  TCURLversion = CURLversion;

const
  ///<summary>The 'CURLVERSION_NOW' is the symbolic name meant to be used by
  ///basically all programs ever that want to get version information. It is
  ///meant to be a built-in version number for what kind of struct the caller
  ///expects. If the struct ever changes, we redefine the NOW to another enum
  ///from above.</summary>
  CURLVERSION_NOW = CURLVERSION_FOURTH;
  {$EXTERNALSYM CURLVERSION_NOW}

type
  curl_version_info_data = record
    age: CURLversion;         { age of the returned struct }
    version: MarshaledAString; { LIBCURL_VERSION }
    version_num: Cardinal;    { LIBCURL_VERSION_NUM }
    host: MarshaledAstring;   { OS/host/cpu/machine when configured }
    features: Integer;        { bitmask, see defines below }
    ssl_version: MarshaledAString; { human readable string }
    ssl_version_num: Longint; { not used anymore, always 0 }
    libz_version: MarshaledAString; { human readable string }
    protocols: PMarshaledAString; { protocols is terminated by an entry with a NULL protoname }
    { The fields below this were added in CURLVERSION_SECOND }
    ares: MarshaledAString;
    ares_num: Integer;
    { This field was added in CURLVERSION_THIRD }
    libidn: MarshaledAString;
    { These field were added in CURLVERSION_FOURTH }
    iconv_ver_num: Integer; { Same as '_libiconv_version' if built with HAVE_ICONV }
    libssh_version: MarshaledAString; { human readable string }
  end;
  {$EXTERNALSYM curl_version_info_data}
  TCurlVersionInfoData = curl_version_info_data;

const
  CURL_VERSION_IPV6         = 1 shl 0;  { IPv6-enabled }
  {$EXTERNALSYM CURL_VERSION_IPV6}
  CURL_VERSION_KERBEROS4    = 1 shl 1;  { Kerberos V4 auth is supported (deprecated) }
  {$EXTERNALSYM CURL_VERSION_KERBEROS4}
  CURL_VERSION_SSL          = 1 shl 2;  { SSL options are present }
  {$EXTERNALSYM CURL_VERSION_SSL}
  CURL_VERSION_LIBZ         = 1 shl 3;  { libz features are present }
  {$EXTERNALSYM CURL_VERSION_LIBZ}
  CURL_VERSION_NTLM         = 1 shl 4;  { NTLM auth is supported }
  {$EXTERNALSYM CURL_VERSION_NTLM}
  CURL_VERSION_GSSNEGOTIATE = 1 shl 5;  { Negotiate auth is supported (deprecated) }
  {$EXTERNALSYM CURL_VERSION_GSSNEGOTIATE}
  CURL_VERSION_DEBUG        = 1 shl 6;  { Built with debug capabilities }
  {$EXTERNALSYM CURL_VERSION_DEBUG}
  CURL_VERSION_ASYNCHDNS    = 1 shl 7;  { Asynchronous DNS resolves }
  {$EXTERNALSYM CURL_VERSION_ASYNCHDNS}
  CURL_VERSION_SPNEGO       = 1 shl 8;  { SPNEGO auth is supported }
  {$EXTERNALSYM CURL_VERSION_SPNEGO}
  CURL_VERSION_LARGEFILE    = 1 shl 9;  { Supports files larger than 2GB }
  {$EXTERNALSYM CURL_VERSION_LARGEFILE}
  CURL_VERSION_IDN          = 1 shl 10; { Internationized Domain Names are supported }
  {$EXTERNALSYM CURL_VERSION_IDN}
  CURL_VERSION_SSPI         = 1 shl 11; { Built against Windows SSPI }
  {$EXTERNALSYM CURL_VERSION_SSPI}
  CURL_VERSION_CONV         = 1 shl 12; { Character conversions supported }
  {$EXTERNALSYM CURL_VERSION_CONV}
  CURL_VERSION_CURLDEBUG    = 1 shl 13; { Debug memory tracking supported }
  {$EXTERNALSYM CURL_VERSION_CURLDEBUG}
  CURL_VERSION_TLSAUTH_SRP  = 1 shl 14; { TLS-SRP auth is supported }
  {$EXTERNALSYM CURL_VERSION_TLSAUTH_SRP}
  CURL_VERSION_NTLM_WB      = 1 shl 15; { NTLM delegation to winbind helper is suported }
  {$EXTERNALSYM CURL_VERSION_NTLM_WB}
  CURL_VERSION_HTTP2        = 1 shl 16; { HTTP2 support built-in }
  {$EXTERNALSYM CURL_VERSION_HTTP2}
  CURL_VERSION_GSSAPI       = 1 shl 17; { Built against a GSS-API library }
  {$EXTERNALSYM CURL_VERSION_GSSAPI}
  CURL_VERSION_KERBEROS5    = 1 shl 18; { Kerberos V5 auth is supported }
  {$EXTERNALSYM CURL_VERSION_KERBEROS5}
  CURL_VERSION_UNIX_SOCKETS = 1 shl 19; { Unix domain sockets support }
  {$EXTERNALSYM CURL_VERSION_UNIX_SOCKETS}

///<summary>This function returns a pointer to a static copy of the version info
///struct. See above.</summary>
function curl_version_info(version: CURLversion): curl_version_info_data; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_version_info}

///<summary>The curl_easy_strerror function may be used to turn a CURLcode value
///into the equivalent human readable error string.  This is useful
///for printing meaningful error messages.</summary>
function curl_easy_strerror(code: CURLcode): MarshaledAString; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_easy_strerror}

///<summary>The curl_share_strerror function may be used to turn a CURLSHcode value
///into the equivalent human readable error string.  This is useful
///for printing meaningful error messages.</summary>
function curl_share_strerror(shcode: CURLSHcode): MarshaledAString; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_share_strerror}

///<summary>The curl_easy_pause function pauses or unpauses transfers. Select the new
///state by setting the bitmask, use the convenience defines below.</summary>
function curl_easy_pause(handle: PCURL; bitmask: Integer): CURLcode; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_easy_pause}

const
  CURLPAUSE_RECV = 1 shl 0;
  {$EXTERNALSYM CURLPAUSE_RECV}
  CURLPAUSE_RECV_CONT = 0;
  {$EXTERNALSYM CURLPAUSE_RECV_CONT}

  CURLPAUSE_SEND = 1 shl 2;
  {$EXTERNALSYM CURLPAUSE_SEND}
  CURLPAUSE_SEND_CONT = 0;
  {$EXTERNALSYM CURLPAUSE_SEND_CONT}

  CURLPAUSE_ALL = CURLPAUSE_RECV or CURLPAUSE_SEND;
  {$EXTERNALSYM CURLPAUSE_ALL}
  CURLPAUSE_CONT = CURLPAUSE_RECV_CONT or CURLPAUSE_SEND_CONT;
  {$EXTERNALSYM CURLPAUSE_CONT}

{ easy.h}

(*$HPPEMIT '#include <curl/easy.h>'*)

function curl_easy_init: PCURL; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_easy_init}

function curl_easy_setopt(curl: PCURL; option: CURLoption): CURLcode; varargs; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_easy_setopt}

function curl_easy_perform(curl: PCURL): CURLcode; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_easy_perform}

procedure curl_easy_cleanup(curl: PCURL); cdecl;
  external LibCurl;
{$EXTERNALSYM curl_easy_cleanup}

///<summary>Request internal information from the curl session with this function.  The
///third argument MUST be a pointer to a long, a pointer to a char * or a
///pointer to a double (as the documentation describes elsewhere).  The data
///pointed to will be filled in accordingly and can be relied upon only if the
///function returns CURLE_OK.  This function is intended to get used *AFTER* a
///performed transfer, all results from this function are undefined until the
///transfer is completed.</summary>
function curl_easy_getinfo(curl: PCURL; info: CURLINFO): CURLcode; varargs; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_easy_getinfo}

///<summary>Creates a new curl session handle with the same options set for the handle
///passed in. Duplicating a handle could only be a matter of cloning data and
///options, internal state info and things like persistent connections cannot
///be transferred. It is useful in multithreaded applications when you can run
///curl_easy_duphandle() for each new thread to avoid a series of identical
///curl_easy_setopt() invokes in every thread.</summary>
function curl_easy_duphandle(curl: PCURL): PCURL; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_easy_duphandle}

///<summary>Re-initializes a CURL handle to the default values. This puts back the
///handle to the same state as it was in when it was just created.
///
///It does keep: live connections, the Session ID cache, the DNS cache and the
///cookies.</summary>
procedure curl_easy_reset(curl: PCURL); cdecl;
  external LibCurl;
{$EXTERNALSYM curl_easy_reset}

///<summary>Receives data from the connected socket. Use after successful
///curl_easy_perform() with CURLOPT_CONNECT_ONLY option.</summary>
function curl_easy_recv(curl: PCURL; buffer: Pointer; buflen: size_t;n: size_t): CURLcode; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_easy_recv}

///<summary>Sends data over the connected socket. Use after successful
///curl_easy_perform() with CURLOPT_CONNECT_ONLY option.</summary>
function curl_easy_send(curl: PCURL; buffer: Pointer; buflen: size_t; n: size_t): CURLcode; cdecl;

  external LibCurl;

{$EXTERNALSYM curl_easy_send}


{ multi.h }

(*$HPPEMIT '#include <curl/multi.h>'*)

  {
  This is an "external" header file. Don't give away any internals here!

  GOALS

  o Enable a "pull" interface. The application that uses libcurl decides where
    and when to ask libcurl to get/send data.

  o Enable multiple simultaneous transfers in the same thread without making it
    complicated for the application.

  o Enable the application to select() on its own file descriptors and curl's
    file descriptors simultaneous easily. }



 { This header file should not really need to include "curl.h" since curl.h
 * itself includes this file and we expect user applications to do #include
 * <curl/curl.h> without the need for especially including multi.h.
 *
 * For some reason we added this include here at one point, and rather than to
 * break existing (wrongly written) libcurl applications, we leave it as-is
 * but with this warning attached. }

type
  PCURLM = Pointer;
  {$EXTERNALSYM PCURLM}

  CURLMcode = (
    CURLM_CALL_MULTI_PERFORM = -1, { please call curl_multi_perform() or curl_multi_socket*() soon }
    CURLM_OK,
    CURLM_BAD_HANDLE,      { the passed-in handle is not a valid CURLM handle }
    CURLM_BAD_EASY_HANDLE, { an easy handle was not good/valid }
    CURLM_OUT_OF_MEMORY,   { if you ever get this, you're in deep sh*t }
    CURLM_INTERNAL_ERROR,  { this is a libcurl bug }
    CURLM_BAD_SOCKET,      { the passed in socket argument did not match }
    CURLM_UNKNOWN_OPTION,  { curl_multi_setopt() with unsupported option }
    CURLM_ADDED_ALREADY,   { an easy handle already added to a multi handle was attempted to get added - again }
    CURLM_LAST
  );
  {$EXTERNALSYM CURLMcode}
  TCURLMCode = CURLMcode;

const
  ///<summary>just to make code nicer when using curl_multi_socket() you can now check
  ///for CURLM_CALL_MULTI_SOCKET too in the same style it works for
  ///curl_multi_perform() and CURLM_CALL_MULTI_PERFORM</summary>
  CURLM_CALL_MULTI_SOCKET = CURLM_CALL_MULTI_PERFORM;
  {$EXTERNALSYM CURLM_CALL_MULTI_SOCKET}

  { bitmask bits for CURLMOPT_PIPELINING }
  CURLPIPE_NOTHING   = Longint(0);
  {$EXTERNALSYM CURLPIPE_NOTHING}
  CURLPIPE_HTTP1      = Longint(1);
  {$EXTERNALSYM CURLPIPE_HTTP1}
  CURLPIPE_MULTIPLEX = Longint(2);
  {$EXTERNALSYM CURLPIPE_MULTIPLEX}

type
  CURLMSG_VAL = (
    CURLMSG_NONE, { first, not used }
    CURLMSG_DONE, { This easy handle has completed. 'result' contains the CURLcode of the transfer }
    CURLMSG_LAST  { last, not used }
  );
  {$EXTERNALSYM CURLMSG_VAL}
  TCURLMsgVal = CURLMSG_VAL;
  {$EXTERNALSYM TCURLMsgVal}

  CURLMsg = record
    msg: CURLMSG_VAL;   { what this message means }
    easy_handle: PCURL; { the handle it concerns }
    case data: Integer of
      0: (whatever: Pointer);  { message-specific data }
      1: (result: CURLcode);   { return code for transfer }
  end;
  {$EXTERNALSYM CURLMsg}
  TCurlMsg = CURLMsg;
  PCurlMsg = ^CurlMsg;

const
  { Based on poll(2) structure and values.
   * We don't use pollfd and POLL* constants explicitly
   * to cover platforms without poll(). }
  CURL_WAIT_POLLIN   = $0001;
  {$EXTERNALSYM CURL_WAIT_POLLIN}
  CURL_WAIT_POLLPRI  = $0002;
  {$EXTERNALSYM CURL_WAIT_POLLPRI}
  CURL_WAIT_POLLOUT  = $0004;
  {$EXTERNALSYM CURL_WAIT_POLLOUT}

type
  curl_waitfd = record
    fd: curl_socket_t;
    events: SmallInt;
    revents: SmallInt; { not supported yet }
  end;
  {$EXTERNALSYM curl_waitfd}
  pcurl_waitfd = curl_waitfd;
  TCurlWaitFD = curl_waitfd;
  PCurlWaitFD = ^TCurlWaitFD;

///<summary>inititalize multi-style curl usage
///
///Returns: a new CURLM handle to use in all 'curl_multi' functions.</summary>
function curl_multi_init: PCURLM; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_multi_init}

///<summary>add a standard curl handle to the multi stack
///
///Returns: CURLMcode type, general multi error code.</summary>
function curl_multi_add_handle(multi_handle: PCURLM; curl_handle: PCURL): CURLMcode; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_multi_add_handle}

///<summary>removes a curl handle from the multi stack again
///
///Returns: CURLMcode type, general multi error code.</summary>
function curl_multi_remove_handle(multi_handle: PCURLM; curl_handle: PCURL): CURLMcode; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_multi_remove_handle}

///<summary>Ask curl for its fd_set sets. The app can use these to select() or
///         poll() on. We want curl_multi_perform() called as soon as one of
///         them are ready.
///
///Returns: CURLMcode type, general multi error code.</summary>
function curl_multi_fdset(multi_handle: PCURLM; read_fd_set: fd_set; write_fd_set: fd_set;
                          exc_fd_set: pfd_set; max_fd: PInteger): CURLMcode; cdecl; external LibCurl;
{$EXTERNALSYM curl_multi_fdset}

///Poll on all fds within a CURLM set as well as any
///additional fds passed to the function.
///
///Returns:  CURLMcode type, general multi error code.</summary>
function curl_multi_wait(multi_handle: PCURLM; extra_fds: curl_waitfd; extra_nfds: Cardinal;
                         timeout_ms: Integer; ret: PInteger): CURLMcode; cdecl; external LibCurl;
{$EXTERNALSYM curl_multi_wait}

///<summary>When the app thinks there's data available for curl it calls this
///function to read/write whatever there is right now. This returns
///as soon as the reads and writes are done. This function does not
///require that there actually is data available for reading or that
///data can be written, it can be called just in case. It returns
///the number of handles that still transfer data in the second
///argument's integer-pointer.
///
/// Returns: CURLMcode type, general multi error code. *NOTE* that this only
///          returns errors etc regarding the whole multi stack. There might
///          still have occurred problems on invidual transfers even when this
///          returns OK.</summary>
function curl_multi_perform(multi_handle: PCURLM; running_handles: PInteger): CURLMcode; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_multi_perform}

///<summary>Cleans up and removes a whole multi stack. It does not free or
///touch any individual easy handles in any way. We need to define
///in what state those handles will be if this function is called
///in the middle of a transfer.
///
///Returns: CURLMcode type, general multi error code.</summary>
function curl_multi_cleanup(multi_handle: PCURLM): CURLMcode; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_multi_cleanup}

///<summary>Ask the multi handle if there's any messages/informationals from
///the individual transfers. Messages include informationals such as
///error code from the transfer or just the fact that a transfer is
///completed. More details on these should be written down as well.
///
///Repeated calls to this function will return a new struct each
///time, until a special "end of msgs" struct is returned as a signal
///that there is no more to get at this point.
///
///The data the returned pointer points to will not survive calling
///curl_multi_cleanup().
///
///The 'CURLMsg' struct is meant to be very simple and only contain
///very basic informations. If more involved information is wanted,
///we will provide the particular "transfer handle" in that struct
///and that should/could/would be used in subsequent
///curl_easy_getinfo() calls (or similar). The point being that we
///must never expose complex structs to applications, as then we'll
///undoubtably get backwards compatibility problems in the future.
///
///Returns: A pointer to a filled-in struct, or NULL if it failed or ran out
///of structs. It also writes the number of messages left in the
///queue (after this read) in the integer the second argument points to.</summary>
function curl_multi_info_read(multi_handle: PCURLM; msgs_in_queue: PInteger): PCURLMsg; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_multi_info_read}

///<summary>The curl_multi_strerror function may be used to turn a CURLMcode
///value into the equivalent human readable error string.  This is
///useful for printing meaningful error messages.
///
///Returns: A pointer to a zero-terminated error message.</summary>
function curl_multi_strerror(mode: CURLMcode): MarshaledAString; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_multi_strerror}

 { Name:    curl_multi_socket() and
 *          curl_multi_socket_all()
 *
 * Desc:    An alternative version of curl_multi_perform() that allows the
 *          application to pass in one of the file descriptors that have been
 *          detected to have "action" on them and let libcurl perform.
 *          See man page for details. }

const
  CURL_POLL_NONE   = 0;
  {$EXTERNALSYM CURL_POLL_NONE}
  CURL_POLL_IN     = 1;
  {$EXTERNALSYM CURL_POLL_IN}
  CURL_POLL_OUT    = 2;
  {$EXTERNALSYM CURL_POLL_OUT}
  CURL_POLL_INOUT  = 3;
  {$EXTERNALSYM CURL_POLL_INOUT}
  CURL_POLL_REMOVE = 4;
  {$EXTERNALSYM CURL_POLL_REMOVE}

  CURL_SOCKET_TIMEOUT = CURL_SOCKET_BAD;
  {$EXTERNALSYM CURL_SOCKET_TIMEOUT}

  CURL_CSELECT_IN   = $01;
  {$EXTERNALSYM CURL_CSELECT_IN}
  CURL_CSELECT_OUT  = $02;
  {$EXTERNALSYM CURL_CSELECT_OUT}
  CURL_CSELECT_ERR  = $04;
  {$EXTERNALSYM CURL_CSELECT_ERR}

type
  curl_socket_callback = function(easy: PCURL;          { easy handle }
                                      s: curl_socket_t; { socket }
                                      what: Integer;    { see above }
                                      userp: Pointer;   { private callback pointer }
                                      socketp: Pointer): Integer; cdecl;  { private socket pointer }
  {$EXTERNALSYM curl_socket_callback}

  ///<summary>Called by libcurl whenever the library detects a change in the
  ///maximum number of milliseconds the app is allowed to wait before
  ///curl_multi_socket() or curl_multi_perform() must be called
  ///(to allow libcurl's timed events to take place).
  ///
  ///Returns: The callback should return zero.</summary>
  curl_multi_timer_callback = function (multi: PCURLM;       { multi handle }
                                        timeout_ms: Longint; { see above }
                                        userp: Pointer): Integer; cdecl;   { private callback pointer }
  {$EXTERNALSYM curl_multi_timer_callback}

function curl_multi_socket(multi_handle: PCURLM; s: curl_socket_t; running_handles: PInteger): CURLMcode; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_multi_socket}

function curl_multi_socket_action(multi_handle: PCURLM; s: curl_socket_t; ev_bitmask: Integer;
                                  running_handles: PInteger): CURLMcode; cdecl; external LibCurl;
{$EXTERNALSYM curl_multi_socket_action}

function curl_multi_socket_all(multi_handle: PCURLM; running_handles: PInteger): CURLMcode; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_multi_socket_all}

///<summary>Returns the maximum number of milliseconds the app is allowed to
///wait before curl_multi_socket() or curl_multi_perform() must be
///called (to allow libcurl's timed events to take place).
///
///Returns: CURLM error code.</summary>
function curl_multi_timeout(multi_handle: PCURLM; milliseconds: PLongint): CURLMcode; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_multi_timeout}

type
  CURLMoption = (
    CURLMOPT_PIPELINING = 3,  { set to 1 to enable pipelining for this multi handle }
    CURLMOPT_MAXCONNECTS = 6, { maximum number of entries in the connection cache }
    CURLMOPT_MAX_HOST_CONNECTIONS = 7, { maximum number of (pipelining) connections to one host }
    CURLMOPT_MAX_PIPELINE_LENGTH = 8,  { maximum number of requests in a pipeline }
    CURLMOPT_MAX_TOTAL_CONNECTIONS = 13, { maximum number of open connections in total }

    CURLMOPT_SOCKETDATA = 10002, { This is the argument passed to the socket callback }
    CURLMOPT_TIMERDATA = 10005, { This is the argument passed to the timer callback }
    CURLMOPT_PIPELINING_SITE_BL = 10011,  { a list of site names(+port) that are blacklisted from  pipelining }
    CURLMOPT_PIPELINING_SERVER_BL = 10012,{ a list of server types that are blacklisted from pipelining }
    CURLMOPT_PUSHDATA =  10015, { This is the argument passed to the server push callback }

    CURLMOPT_SOCKETFUNCTION = 20001, { This is the socket callback function pointer }
    CURLMOPT_TIMERFUNCTION = 20004, { This is the timer callback function pointer }
    CURLMOPT_PUSHFUNCTION = 20014, { This is the server push callback function pointer }

    CURLMOPT_CONTENT_LENGTH_PENALTY_SIZE = 30009, { a connection with a content-length longer than this will not be considered for pipelining }
    CURLMOPT_CHUNK_LENGTH_PENALTY_SIZE = 30010,   { a connection with a chunk length longer than this  will not be considered for pipelining }

    CURLMOPT_LASTENTRY { the last unused }
  );
  {$EXTERNALSYM CURLMoption}
  TCurlMOption = CURLMoption;


///<summary>Sets options for the multi handle.
///
///Returns: CURLM error code.</summary>
function curl_multi_setopt(multi_handle: PCURLM; option: CURLMoption): CURLMcode; varargs; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_multi_setopt}

///<summary>This function sets an association in the multi handle between the
///given socket and a private pointer of the application. This is
///(only) useful for curl_multi_socket uses.
///
///Returns: CURLM error code.</summary>
function curl_multi_assign(multi_handle: PCURLM; sockfd: curl_socket_t; sockp: Pointer): CURLMcode; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_multi_assign}


///<summary>This callback gets called when a new stream is being pushed by the
///server. It approves or denies the new stream.
///
///Returns: CURL_PUSH_OK or CURL_PUSH_DENY.</summary>
const
  CURL_PUSH_OK   = 0;
  {$EXTERNALSYM CURL_PUSH_OK}
  CURL_PUSH_DENY = 1;
  {$EXTERNALSYM CURL_PUSH_DENY}

type
  curl_pushheaders = record  end;  { forward declaration only }
  pcurl_pushheaders = ^curl_pushheaders;

function curl_pushheader_bynum(h: pcurl_pushheaders; num: size_t): MarshaledAString; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_pushheader_bynum}

function curl_pushheader_byname(h: pcurl_pushheaders; name: MarshaledAString): MarshaledAString; cdecl;
  external LibCurl;
{$EXTERNALSYM curl_pushheader_byname}

type
  curl_push_callback = function(parent: PCURL; easy: PCURL; num_headers: size_t; headers: pcurl_pushheaders;
                                userp: Pointer): Integer; cdecl;
  {$EXTERNALSYM curl_push_callback}


implementation

end.
