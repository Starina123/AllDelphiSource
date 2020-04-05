{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2016-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit System.Net.FileClient;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes, System.Types, System.Net.URLClient, System.Sysutils;

type
  /// <summary>Specific Class to handle File Requests</summary>
  /// <remarks></remarks>
  TFileRequest = class(TURLRequest, IURLRequest)
  end;

  /// <summary>Specific Class to handle File Responses</summary>
  TFileResponse = class(TURLResponse, IURLResponse)
  protected
    constructor Create(const AContext: TObject; const AProc: TProc;
      const AAsyncCallback: TAsyncCallback; const AAsyncCallbackEvent: TAsyncCallbackEvent;
      const ARequest: IURLRequest; const AContentStream: TStream); overload;
    /// <summary>Implementation method for specific stream creation</summary>
    function DoCreateInternalStream: TStream; override;
    function DoCancel: Boolean; override;
  public
    /// <summary>Getter for the Headers property</summary>
    function GetHeaders: TNetHeaders; override;
    /// <summary>Getter for the MimeType property</summary>
    function GetMimeType: string; override;
    /// <summary>Function that transforms the ContentStream into a string</summary>
    /// <remarks> If AnEncoding is omitted UTF8 encoding will be assumed.</remarks>
    function ContentAsString(const AnEncoding: TEncoding = nil): string; override;
  end;

  /// <summary> Class that implements a File Client.</summary>
  TFileClient = class(TURLClient)
  protected
    /// <summary>Function that obtains a Response instance</summary>
    function DoGetResponseInstance(const AContext: TObject; const AProc: TProc; const AsyncCallback: TAsyncCallback;
      const AsyncCallbackEvent: TAsyncCallbackEvent; const ARequest: IURLRequest; const AContentStream: TStream)
      : IAsyncResult; override;
    /// <summary>Function that obtains a Request instance</summary>
    function DoGetRequestInstance(const ARequestMethod: string; const AURI: TURI): IURLRequest; override;

    /// <summary>Function that asynchronusly executes a Request and obtains a response</summary>
    /// <remarks> This function creates a request before calling InternalExecuteAsync</remarks>
    function DoExecuteAsync(const AsyncCallback: TAsyncCallback; const AsyncCallbackEvent: TAsyncCallbackEvent;
      const ARequestMethod: string; const AURI: TURI; const ASourceStream, AContentStream: TStream;
      const AHeaders: TNetHeaders; AOwnsSourceStream: Boolean): IAsyncResult; override;
  public
    /// <summary>Create a File Client instance</summary>
    class function CreateInstance: TURLClient; override;
  end;

implementation

uses System.NetEncoding;

{ TFileClient }

class function TFileClient.CreateInstance: TURLClient;
begin
  Result := TFileClient.Create;
end;

function TFileClient.DoExecuteAsync(const AsyncCallback: TAsyncCallback; const AsyncCallbackEvent: TAsyncCallbackEvent;
  const ARequestMethod: string; const AURI: TURI; const ASourceStream, AContentStream: TStream;
  const AHeaders: TNetHeaders; AOwnsSourceStream: Boolean): IAsyncResult;
var
  LRequest: IURLRequest;
begin
  LRequest := GetRequest(ARequestMethod, AURI);
  Result := DoGetResponseInstance(Self, nil, AsyncCallback, AsyncCallbackEvent, LRequest, AContentStream);
  // Invoke Async Execution.
  (Result as TFileResponse).Invoke;
end;

function TFileClient.DoGetRequestInstance(const ARequestMethod: string; const AURI: TURI): IURLRequest;
begin
  Result := TFileRequest.Create(Self, ARequestMethod, AURI);
end;

function TFileClient.DoGetResponseInstance(const AContext: TObject; const AProc: TProc;
  const AsyncCallback: TAsyncCallback; const AsyncCallbackEvent: TAsyncCallbackEvent; const ARequest: IURLRequest;
  const AContentStream: TStream): IAsyncResult;
begin
  Result := TFileResponse.Create(AContext, AProc, AsyncCallback, AsyncCallbackEvent, ARequest, AContentStream);
end;

{ TFileResponse }

constructor TFileResponse.Create(const AContext: TObject; const AProc: TProc; const AAsyncCallback: TAsyncCallback;
  const AAsyncCallbackEvent: TAsyncCallbackEvent; const ARequest: IURLRequest; const AContentStream: TStream);
begin
  inherited Create(AContext, AProc, AAsyncCallback, AAsyncCallbackEvent, ARequest, AContentStream);
end;

function TFileResponse.ContentAsString(const AnEncoding: TEncoding): string;
var
  LReader: TStringStream;
begin
  If AnEncoding = nil then
    LReader := TStringStream.Create(string.Empty, TEncoding.UTF8, False)
  else
    LReader := TStringStream.Create(string.Empty, AnEncoding, False);
  try
    LReader.CopyFrom(GetContentStream, 0);
    Result := LReader.DataString;
  finally
    LReader.Free;
  end;
end;

function TFILEResponse.DoCancel: Boolean;
begin
  Result := False; //TFile request can not be canceled.
end;

function TFileResponse.DoCreateInternalStream: TStream;
var
  LPath: string;
begin
  LPath := TNetEncoding.URL.URLDecode(FRequest.URL.Path);
                                                                                            
  if (Length(LPath) > 0) and (LPath.Chars[0] = '/') then
    LPath := LPath.Substring(1);
  {$IFDEF MSWINDOWS}
  //In windows, file scheme can have ':' as a '|', so restore it to load from file.
  //Info obtained from: https://en.wikipedia.org/wiki/File_URI_scheme
  if (Length(LPath) > 1) and (LPath.Chars[1] = '|') then
    LPath[Low(string) + 1] := ':';
  {$ENDIF MSWINDOWS}
  Result := TFileStream.Create(LPath, fmOpenRead or fmShareDenyWrite);
end;

function TFileResponse.GetHeaders: TNetHeaders;
begin
  Result := nil;
end;

function TFileResponse.GetMimeType: string;
begin
  Result := string.Empty;
end;

initialization
  TURLSchemes.RegisterURLClientScheme(TFileClient, 'FILE');
finalization
  TURLSchemes.UnRegisterURLClientScheme('FILE');
end.
