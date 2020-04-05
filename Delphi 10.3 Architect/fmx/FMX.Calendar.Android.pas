{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Calendar.Android;

interface

{$SCOPEDENUMS ON}

uses
  System.Types, System.UITypes, Androidapi.JNI.Widget, Androidapi.JNIBridge, Androidapi.JNI.GraphicsContentViewText,
  FMX.Controls.Presentation, FMX.Controls.Model, FMX.Presentation.Messages, FMX.Calendar, FMX.Controls,
  FMX.Presentation.Android;

type

{ TAndroidNativeCalendar }

  TAndroidNativeCalendarListener = class;

  TAndroidNativeCalendar = class(TAndroidNativeView)
  private
    FListener: TAndroidNativeCalendarListener;
    function GetView: JCalendarView;
    function GetModel: TCalendarModel;
    procedure UpdateDate;
    procedure UpdateWeekNumbers;
    procedure UpdateFirstDayOfWeek;
  protected
    { Messages From Model}
    procedure MMDateChanged(var AMessage: TDispatchMessageWithValue<TDateTime>); message MM_DATE_CHANGED;
    procedure MMWeekNumbersChanged(var AMessage: TDispatchMessageWithValue<Boolean>); message MM_WEEKNUMBERS_CHANGED;
    procedure MMFirstDayOfWeekChanged(var AMessage: TDispatchMessageWithValue<TCalDayOfWeek>); message MM_FIRSTDAYOFWEEK_CHANGED;
    { Messages From Controller }
    procedure PMInit(var AMessage: TDispatchMessage); message PM_INIT;
  protected
    function DefineModelClass: TDataModelClass; override;
    function CreateView: JView; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    /// <summary>Returns the first day of the week in the current locale.</summary>
    class function GetCurrentLocaleFirstDayOfWeek: TCalDayOfWeek;
  public
    property Model: TCalendarModel read GetModel;
    property View: JCalendarView read GetView;
  end;

  TAndroidNativeCalendarListener = class(TJavaLocal, JCalendarView_OnDateChangeListener)
  private
    [Weak] FCalendar: TAndroidNativeCalendar;
  public
    constructor Create(const ACalendar: TAndroidNativeCalendar);
    { JCalendarView_OnDateChangeListener }
     procedure onSelectedDayChange(view: JCalendarView; year: Integer; month: Integer; dayOfMonth: Integer); cdecl;
  end;

implementation

uses
  System.SysUtils, System.DateUtils, Androidapi.Helpers, Androidapi.JNI.App, Androidapi.JNI.JavaTypes,
  FMX.Presentation.Factory, FMX.Platform, FMX.Consts;

{ TAndroidNativeCalendar }

constructor TAndroidNativeCalendar.Create;
begin
  inherited;
  FListener := TAndroidNativeCalendarListener.Create(Self);
  View.setOnDateChangeListener(FListener);
end;

function TAndroidNativeCalendar.CreateView: JView;
begin
  Result := TJCalendarView.JavaClass.init(TAndroidHelper.Context);
end;

function TAndroidNativeCalendar.DefineModelClass: TDataModelClass;
begin
  Result := TCalendarModel;
end;

destructor TAndroidNativeCalendar.Destroy;
begin
  View.setOnDateChangeListener(nil);
  FreeAndNil(FListener);
  inherited;
end;

function TAndroidNativeCalendar.GetModel: TCalendarModel;
begin
  Result := inherited GetModel<TCalendarModel>;
end;

class function TAndroidNativeCalendar.GetCurrentLocaleFirstDayOfWeek: TCalDayOfWeek;
var
  LocaleService: IFMXLocaleService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXLocaleService, LocaleService) then
    Result := TCalDayOfWeek((LocaleService.GetFirstWeekday + DaysPerWeek - DayMonday) mod DaysPerWeek)
  else
    Result := TCalDayOfWeek.dowSunday;
end;

function TAndroidNativeCalendar.GetView: JCalendarView;
begin
  Result := inherited GetView<JCalendarView>;
end;

procedure TAndroidNativeCalendar.MMDateChanged(var AMessage: TDispatchMessageWithValue<TDateTime>);
begin
  UpdateDate;
end;

procedure TAndroidNativeCalendar.MMFirstDayOfWeekChanged(var AMessage: TDispatchMessageWithValue<TCalDayOfWeek>);
begin
  UpdateFirstDayOfWeek;
end;

procedure TAndroidNativeCalendar.MMWeekNumbersChanged(var AMessage: TDispatchMessageWithValue<Boolean>);
begin
  UpdateWeekNumbers;
end;

procedure TAndroidNativeCalendar.PMInit(var AMessage: TDispatchMessage);
begin
  inherited;
  UpdateDate;
  UpdateWeekNumbers;
  UpdateFirstDayOfWeek;
end;

procedure TAndroidNativeCalendar.UpdateDate;
begin
  View.setDate(DateTimeToUnix(Model.DateTime) * MSecsPerSec);
end;

procedure TAndroidNativeCalendar.UpdateFirstDayOfWeek;

  function CalDayOfWeekToInt(const ADayOfWeek: TCalDayOfWeek): Integer;
  begin
    case ADayOfWeek of
      TCalDayOfWeek.dowMonday:
        Result := TJCalendar.JavaClass.MONDAY;
      TCalDayOfWeek.dowTuesday:
        Result := TJCalendar.JavaClass.TUESDAY;
      TCalDayOfWeek.dowWednesday:
        Result := TJCalendar.JavaClass.WEDNESDAY;
      TCalDayOfWeek.dowThursday:
        Result := TJCalendar.JavaClass.THURSDAY;
      TCalDayOfWeek.dowFriday:
        Result := TJCalendar.JavaClass.FRIDAY;
      TCalDayOfWeek.dowSaturday:
        Result := TJCalendar.JavaClass.SATURDAY;
      TCalDayOfWeek.dowSunday:
        Result := TJCalendar.JavaClass.SUNDAY;
      else
        Result := TJCalendar.JavaClass.SUNDAY;
    end;
  end;

var
  FirstDayOfWeek: TCalDayOfWeek;
begin
  if Model.FirstDayOfWeek = TCalDayOfWeek.dowLocaleDefault then
    FirstDayOfWeek := GetCurrentLocaleFirstDayOfWeek
  else
    FirstDayOfWeek := Model.FirstDayOfWeek;

  View.setFirstDayOfWeek(CalDayOfWeekToInt(FirstDayOfWeek));
end;

procedure TAndroidNativeCalendar.UpdateWeekNumbers;
begin
  View.setShowWeekNumber(Model.WeekNumbers);
end;

{ TAndroidNativeCalendarListener }

constructor TAndroidNativeCalendarListener.Create(const ACalendar: TAndroidNativeCalendar);
begin
  if ACalendar = nil then
    raise EArgumentNilException.CreateFmt(SWrongParameter, ['ACalendar']);

  inherited Create;
  FCalendar := ACalendar;
end;

procedure TAndroidNativeCalendarListener.onSelectedDayChange(view: JCalendarView; year, month, dayOfMonth: Integer);
var
  OldDay, NewDay: Word;
begin
  OldDay := DayOf(FCalendar.Model.DateTime);
  NewDay := DayOf(Date);

  FCalendar.Model.DisableNotify;
  try
    FCalendar.Model.DateTime := EncodeDate(year, month, dayOfMonth);
  finally
    FCalendar.Model.EnableNotify;
  end;

  if Assigned(FCalendar.Model.OnChange) then
    FCalendar.Model.OnChange(FCalendar.Control);

  if (OldDay <> NewDay) and Assigned(FCalendar.Model.OnDateSelected) then
    FCalendar.Model.OnDateSelected(FCalendar.Control);
end;

initialization
  TPresentationProxyFactory.Current.Register(TCalendar, TControlType.Platform, TAndroidPresentationProxy<TAndroidNativeCalendar>);
finalization
  TPresentationProxyFactory.Current.Unregister(TCalendar, TControlType.Platform, TAndroidPresentationProxy<TAndroidNativeCalendar>);
end.
