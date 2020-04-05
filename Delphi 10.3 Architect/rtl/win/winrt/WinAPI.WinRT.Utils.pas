unit WinAPI.WinRT.Utils;

interface

uses
  WinAPI.WinRT,
  WinAPI.CommonTypes;

type
  TApplicationProcessMessagesProc = procedure of object;

procedure Await(const asyncInfo: IInterface; const AApplicationProcessMessage: TApplicationProcessMessagesProc);

/// <summary>
/// Converts Delphi's TDateTime to WinRT's Windows.Foundation.DateTime
/// as explained in https://docs.microsoft.com/en-us/uwp/api/windows.foundation.datetime#remarks
/// </summary>
function TDateTimeToDateTime(const ADateTime: TDateTime): DateTime;
/// <summary>
/// Converts WinRT's Windows.Foundation.DateTime to Delphi's TDateTime
/// as explained in https://docs.microsoft.com/en-us/uwp/api/windows.foundation.datetime#remarks
/// </summary>
function DateTimeToTDateTime(const ADateTime: DateTime): TDateTime;

implementation

uses
  WinAPI.Foundation,
  System.SysUtils,
  System.Classes,
  WinAPI.Windows,
  System.Win.WinRT;

resourcestring
  StrApplicationProcessError = 'AApplicationProcessMessage must be assigned';
  StrIAsyncInfoNotSupported = 'Interface not supports IAsyncInfo';

procedure Await(const asyncInfo: IInterface; const AApplicationProcessMessage: TApplicationProcessMessagesProc);
var
  lOut: IAsyncInfo;
  lErr: Cardinal;
begin
  Assert(Assigned(AApplicationProcessMessage), StrApplicationProcessError);

  if not Supports(asyncInfo, IAsyncInfo, lOut) then
    raise Exception.Create(StrIAsyncInfoNotSupported);

  while not(lOut.Status in [asyncStatus.Completed, asyncStatus.Canceled, asyncStatus.Error]) do
  begin
    Sleep(100);
    AApplicationProcessMessage();
  end;
  lErr := HResultCode(lOut.ErrorCode);
  if lErr <> ERROR_SUCCESS then
    raise Exception.Create(SysErrorMessage(lErr));
end;

function DateTimeToTDateTime(const ADateTime: DateTime): TDateTime;
var
  lVal: Int64;
  lSystemTime: TSystemTime;
  lFileTime: TFileTime;
begin
  lVal := ADateTime.UniversalTime;
  lFileTime.dwHighDateTime := (lVal and $FFFFFFFF00000000) shr 32;
  lFileTime.dwLowDateTime := lVal and $00000000FFFFFFFF;
  FileTimeToSystemTime(lFileTime, lSystemTime);
  Result := SystemTimeToDateTime(lSystemTime);
end;

function TDateTimeToDateTime(const ADateTime: TDateTime): DateTime;
var
  lVal: Int64;
  lSystemTime: TSystemTime;
  lFileTime: TFileTime;
begin
  DateTimeToSystemTime(ADateTime, lSystemTime);
  SystemTimeToFileTime(lSystemTime, lFileTime);
  lVal := lFileTime.dwHighDateTime;
  lVal := (lVal shl 32) or lFileTime.dwLowDateTime;
  Result.UniversalTime := lVal;
end;

end.
