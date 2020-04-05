{*******************************************************}
{                                                       }
{            CodeGear Delphi Runtime Library            }
{                                                       }
{ Copyright(c) 2010-2019 Embarcadero Technologies, Inc. }
{                  All rights reserved                  }
{                                                       }
{*******************************************************}

unit Macapi.EventKit;

interface

uses
  Macapi.ObjectiveC, Macapi.CocoaTypes, Macapi.CoreFoundation, Macapi.Foundation, Macapi.CoreGraphics, Macapi.CoreText, Macapi.AddressBook,
  Macapi.AppKit, Macapi.MapKit, Macapi.CoreLocation;

const
  EKAuthorizationStatusNotDetermined = 0;
  EKAuthorizationStatusRestricted = 1;
  EKAuthorizationStatusDenied = 2;
  EKAuthorizationStatusAuthorized = 3;
  EKWeekdaySunday = 1;
  EKWeekdayMonday = 2;
  EKWeekdayTuesday = 3;
  EKWeekdayWednesday = 4;
  EKWeekdayThursday = 5;
  EKWeekdayFriday = 6;
  EKWeekdaySaturday = 7;
  EKSunday = EKWeekdaySunday;
  EKMonday = EKWeekdayMonday;
  EKTuesday = EKWeekdayTuesday;
  EKWednesday = EKWeekdayWednesday;
  EKThursday = EKWeekdayThursday;
  EKFriday = EKWeekdayFriday;
  EKSaturday = EKWeekdaySaturday;
  EKRecurrenceFrequencyDaily = 0;
  EKRecurrenceFrequencyWeekly = 1;
  EKRecurrenceFrequencyMonthly = 2;
  EKRecurrenceFrequencyYearly = 3;
  EKParticipantTypeUnknown = 0;
  EKParticipantTypePerson = 1;
  EKParticipantTypeRoom = 2;
  EKParticipantTypeResource = 3;
  EKParticipantTypeGroup = 4;
  EKParticipantRoleUnknown = 0;
  EKParticipantRoleRequired = 1;
  EKParticipantRoleOptional = 2;
  EKParticipantRoleChair = 3;
  EKParticipantRoleNonParticipant = 4;
  EKParticipantScheduleStatusNone = 0;
  EKParticipantScheduleStatusPending = 1;
  EKParticipantScheduleStatusSent = 2;
  EKParticipantScheduleStatusDelivered = 3;
  EKParticipantScheduleStatusRecipientNotRecognized = 4;
  EKParticipantScheduleStatusNoPrivileges = 5;
  EKParticipantScheduleStatusDeliveryFailed = 6;
  EKParticipantScheduleStatusCannotDeliver = 7;
  EKParticipantScheduleStatusRecipientNotAllowed = 8;
  EKParticipantStatusUnknown = 0;
  EKParticipantStatusPending = 1;
  EKParticipantStatusAccepted = 2;
  EKParticipantStatusDeclined = 3;
  EKParticipantStatusTentative = 4;
  EKParticipantStatusDelegated = 5;
  EKParticipantStatusCompleted = 6;
  EKParticipantStatusInProcess = 7;
  EKCalendarTypeLocal = 0;
  EKCalendarTypeCalDAV = 1;
  EKCalendarTypeExchange = 2;
  EKCalendarTypeSubscription = 3;
  EKCalendarTypeBirthday = 4;
  EKCalendarEventAvailabilityNone = 0;
  EKCalendarEventAvailabilityBusy = 1;
  EKCalendarEventAvailabilityFree = 2;
  EKCalendarEventAvailabilityTentative = 4;
  EKCalendarEventAvailabilityUnavailable = 8;
  EKSourceTypeLocal = 0;
  EKSourceTypeExchange = 1;
  EKSourceTypeCalDAV = 2;
  EKSourceTypeMobileMe = 3;
  EKSourceTypeSubscribed = 4;
  EKSourceTypeBirthdays = 5;
  EKEntityTypeEvent = 0;
  EKEntityTypeReminder = 1;
  EKEntityMaskEvent = 1;
  EKEntityMaskReminder = 2;
  EKAlarmProximityNone = 0;
  EKAlarmProximityEnter = 1;
  EKAlarmProximityLeave = 2;
  EKAlarmTypeDisplay = 0;
  EKAlarmTypeAudio = 1;
  EKAlarmTypeProcedure = 2;
  EKAlarmTypeEmail = 3;
  EKReminderPriorityNone = 0;
  EKReminderPriorityHigh = 1;
  EKReminderPriorityMedium = 5;
  EKReminderPriorityLow = 9;
  EKErrorEventNotMutable = 0;
  EKErrorNoCalendar = 1;
  EKErrorNoStartDate = 2;
  EKErrorNoEndDate = 3;
  EKErrorDatesInverted = 4;
  EKErrorInternalFailure = 5;
  EKErrorCalendarReadOnly = 6;
  EKErrorDurationGreaterThanRecurrence = 7;
  EKErrorAlarmGreaterThanRecurrence = 8;
  EKErrorStartDateTooFarInFuture = 9;
  EKErrorStartDateCollidesWithOtherOccurrence = 10;
  EKErrorObjectBelongsToDifferentStore = 11;
  EKErrorInvitesCannotBeMoved = 12;
  EKErrorInvalidSpan = 13;
  EKErrorCalendarHasNoSource = 14;
  EKErrorCalendarSourceCannotBeModified = 15;
  EKErrorCalendarIsImmutable = 16;
  EKErrorSourceDoesNotAllowCalendarAddDelete = 17;
  EKErrorRecurringReminderRequiresDueDate = 18;
  EKErrorStructuredLocationsNotSupported = 19;
  EKErrorReminderLocationsNotSupported = 20;
  EKErrorAlarmProximityNotSupported = 21;
  EKErrorCalendarDoesNotAllowEvents = 22;
  EKErrorCalendarDoesNotAllowReminders = 23;
  EKErrorSourceDoesNotAllowReminders = 24;
  EKErrorSourceDoesNotAllowEvents = 25;
  EKErrorPriorityIsInvalid = 26;
  EKErrorInvalidEntityType = 27;
  EKErrorProcedureAlarmsNotMutable = 28;
  EKErrorEventStoreNotAuthorized = 29;
  EKErrorOSNotSupported = 30;
  EKErrorLast = 31;
  EKEventAvailabilityNotSupported = -1;
  EKEventAvailabilityBusy = 0;
  EKEventAvailabilityFree = 1;
  EKEventAvailabilityTentative = 2;
  EKEventAvailabilityUnavailable = 3;
  EKEventStatusNone = 0;
  EKEventStatusConfirmed = 1;
  EKEventStatusTentative = 2;
  EKEventStatusCanceled = 3;
  EKSpanThisEvent = 0;
  EKSpanFutureEvents = 1;

type
  EKObject = interface;
  EKAlarm = interface;
  EKCalendar = interface;
  EKCalendarItem = interface;
  EKEvent = interface;
  EKEventStore = interface;
  EKParticipant = interface;
  EKRecurrenceDayOfWeek = interface;
  EKRecurrenceEnd = interface;
  EKRecurrenceRule = interface;
  EKReminder = interface;
  EKSource = interface;
  EKStructuredLocation = interface;

  PBoolean = ^Boolean;
  EKAuthorizationStatus = NSInteger;
  EKWeekday = NSInteger;
  EKRecurrenceFrequency = NSInteger;
  EKParticipantType = NSInteger;
  EKParticipantRole = NSInteger;
  EKParticipantScheduleStatus = NSInteger;
  EKParticipantStatus = NSInteger;
  EKCalendarType = NSInteger;
  EKCalendarEventAvailabilityMask = NSInteger;
  EKSourceType = NSInteger;
  EKEntityType = NSInteger;
  EKEntityMask = NSInteger;
  EKAlarmProximity = NSInteger;
  EKAlarmType = NSInteger;
  EKReminderPriority = NSInteger;
  EKErrorCode = NSInteger;
  EKEventAvailability = NSInteger;
  EKEventStatus = NSInteger;
  EKSpan = NSInteger;

  EKEventSearchCallback = procedure(event: EKEvent; stop: PBoolean) of object;

  EKEventStoreRequestAccessCompletionHandler = procedure(granted: Boolean; error: NSError) of object;
  TEKEventStoreBlockMethod1 = procedure(reminders: NSArray) of object;

  EKObjectClass = interface(NSObjectClass)
    ['{479BFA0D-0339-4EF3-A198-2273044F5A77}']
  end;

  EKObject = interface(NSObject)
    ['{C257E9A4-DE32-4FB4-B998-2319CB38C42C}']
    function hasChanges: Boolean; cdecl;
    function isNew: Boolean; cdecl;
    function refresh: Boolean; cdecl;
    procedure reset; cdecl;
    procedure rollback; cdecl;
  end;
  TEKObject = class(TOCGenericImport<EKObjectClass, EKObject>) end;

  EKAlarmClass = interface(EKObjectClass)
    ['{65A6FB52-508D-463F-9EE7-87E06FEB82AA}']
    {class} function alarmWithAbsoluteDate(date: NSDate): EKAlarm; cdecl;
    {class} function alarmWithRelativeOffset(offset: NSTimeInterval): EKAlarm; cdecl;
  end;

  EKAlarm = interface(EKObject)
    ['{EFC02730-2409-4324-A9A5-186D4DE87C4C}']
    function &type: EKAlarmType; cdecl;
    function absoluteDate: NSDate; cdecl;
    function emailAddress: NSString; cdecl;
    function proximity: EKAlarmProximity; cdecl;
    function relativeOffset: NSTimeInterval; cdecl;
    procedure setAbsoluteDate(absoluteDate: NSDate); cdecl;
    procedure setEmailAddress(emailAddress: NSString); cdecl;
    procedure setProximity(proximity: EKAlarmProximity); cdecl;
    procedure setRelativeOffset(relativeOffset: NSTimeInterval); cdecl;
    procedure setSoundName(soundName: NSString); cdecl;
    procedure setStructuredLocation(structuredLocation: EKStructuredLocation); cdecl;
    procedure setUrl(url: NSURL); cdecl;
    function soundName: NSString; cdecl;
    function structuredLocation: EKStructuredLocation; cdecl;
    function url: NSURL; cdecl;
  end;
  TEKAlarm = class(TOCGenericImport<EKAlarmClass, EKAlarm>) end;

  EKCalendarClass = interface(EKObjectClass)
    ['{70438B51-53BD-45BC-AC19-289A31918257}']
    [MethodName('calendarForEntityType:eventStore:')]
    {class} function calendarForEntityType(entityType: EKEntityType; eventStore: EKEventStore): EKCalendar; cdecl;
    {class} function calendarWithEventStore(eventStore: EKEventStore): EKCalendar; cdecl;
  end;

  EKCalendar = interface(EKObject)
    ['{A75D19AA-CD4B-4B80-ACA3-9AA365CDF274}']
    function &type: EKCalendarType; cdecl;
    function allowedEntityTypes: EKEntityMask; cdecl;
    function allowsContentModifications: Boolean; cdecl;
    function calendarIdentifier: NSString; cdecl;
    function color: NSColor; cdecl;
    function isImmutable: Boolean; cdecl;
    function isSubscribed: Boolean; cdecl;
    procedure setColor(color: NSColor); cdecl;
    procedure setSource(source: EKSource); cdecl;
    procedure setTitle(title: NSString); cdecl;
    function source: EKSource; cdecl;
    function supportedEventAvailabilities: EKCalendarEventAvailabilityMask; cdecl;
    function title: NSString; cdecl;
  end;
  TEKCalendar = class(TOCGenericImport<EKCalendarClass, EKCalendar>) end;

  EKCalendarItemClass = interface(EKObjectClass)
    ['{A40FBC53-0DCE-42C4-839E-ABDE221B4692}']
  end;

  EKCalendarItem = interface(EKObject)
    ['{B5174A99-BC31-45D7-B3A3-46797AC5A6E1}']
    procedure addAlarm(alarm: EKAlarm); cdecl;
    procedure addRecurrenceRule(rule: EKRecurrenceRule); cdecl;
    function alarms: NSArray; cdecl;
    function attendees: NSArray; cdecl;
    function calendar: EKCalendar; cdecl;
    function calendarItemExternalIdentifier: NSString; cdecl;
    function calendarItemIdentifier: NSString; cdecl;
    function creationDate: NSDate; cdecl;
    function hasAlarms: Boolean; cdecl;
    function hasAttendees: Boolean; cdecl;
    function hasNotes: Boolean; cdecl;
    function hasRecurrenceRules: Boolean; cdecl;
    function lastModifiedDate: NSDate; cdecl;
    function location: NSString; cdecl;
    function notes: NSString; cdecl;
    function recurrenceRules: NSArray; cdecl;
    procedure removeAlarm(alarm: EKAlarm); cdecl;
    procedure removeRecurrenceRule(rule: EKRecurrenceRule); cdecl;
    procedure setAlarms(alarms: NSArray); cdecl;
    procedure setCalendar(calendar: EKCalendar); cdecl;
    procedure setLocation(location: NSString); cdecl;
    procedure setNotes(notes: NSString); cdecl;
    procedure setRecurrenceRules(recurrenceRules: NSArray); cdecl;
    procedure setTimeZone(timeZone: NSTimeZone); cdecl;
    procedure setTitle(title: NSString); cdecl;
    procedure setURL(URL: NSURL); cdecl;
    function timeZone: NSTimeZone; cdecl;
    function title: NSString; cdecl;
    function URL: NSURL; cdecl;
    function UUID: NSString; cdecl;
  end;
  TEKCalendarItem = class(TOCGenericImport<EKCalendarItemClass, EKCalendarItem>) end;

  EKEventClass = interface(EKCalendarItemClass)
    ['{E7B7D365-A73F-46F1-85B1-67EAAE728C94}']
    {class} function eventWithEventStore(eventStore: EKEventStore): EKEvent; cdecl;
  end;

  EKEvent = interface(EKCalendarItem)
    ['{1A13335F-D329-4242-AAFE-ED6BED938A05}']
    function availability: EKEventAvailability; cdecl;
    function birthdayContactIdentifier: NSString; cdecl;
    function birthdayPersonID: NSInteger; cdecl;
    function birthdayPersonUniqueID: NSString; cdecl;
    function compareStartDateWithEvent(other: EKEvent): NSComparisonResult; cdecl;
    function endDate: NSDate; cdecl;
    function eventIdentifier: NSString; cdecl;
    function isAllDay: Boolean; cdecl;
    function isDetached: Boolean; cdecl;
    function occurrenceDate: NSDate; cdecl;
    function organizer: EKParticipant; cdecl;
    function refresh: Boolean; cdecl;
    procedure setAllDay(allDay: Boolean); cdecl;
    procedure setAvailability(availability: EKEventAvailability); cdecl;
    procedure setEndDate(endDate: NSDate); cdecl;
    procedure setStartDate(startDate: NSDate); cdecl;
    procedure setStructuredLocation(structuredLocation: EKStructuredLocation); cdecl;
    function startDate: NSDate; cdecl;
    function status: EKEventStatus; cdecl;
    function structuredLocation: EKStructuredLocation; cdecl;
  end;
  TEKEvent = class(TOCGenericImport<EKEventClass, EKEvent>) end;

  EKEventStoreClass = interface(NSObjectClass)
    ['{752A4F01-9E2C-4336-BDFA-3B5537AC7C51}']
    {class} function authorizationStatusForEntityType(entityType: EKEntityType): EKAuthorizationStatus; cdecl;
  end;

  EKEventStore = interface(NSObject)
    ['{11A11172-5322-4F89-BD32-0A7D228D253A}']
    function calendarItemsWithExternalIdentifier(externalIdentifier: NSString): NSArray; cdecl;
    function calendarItemWithIdentifier(identifier: NSString): EKCalendarItem; cdecl;
    function calendars: NSArray; cdecl;
    function calendarsForEntityType(entityType: EKEntityType): NSArray; cdecl;
    function calendarWithIdentifier(identifier: NSString): EKCalendar; cdecl;
    procedure cancelFetchRequest(fetchIdentifier: Pointer); cdecl;
    function commit(error: PNSError): Boolean; cdecl;
    function defaultCalendarForNewEvents: EKCalendar; cdecl;
    function defaultCalendarForNewReminders: EKCalendar; cdecl;
    function delegateSources: NSArray; cdecl;
    [MethodName('enumerateEventsMatchingPredicate:usingBlock:')]
    procedure enumerateEventsMatchingPredicate(predicate: NSPredicate; block: EKEventSearchCallback); cdecl;
    function eventsMatchingPredicate(predicate: NSPredicate): NSArray; cdecl;
    function eventStoreIdentifier: NSString; cdecl;
    function eventWithIdentifier(identifier: NSString): EKEvent; cdecl;
    [MethodName('fetchRemindersMatchingPredicate:completion:')]
    function fetchRemindersMatchingPredicate(predicate: NSPredicate; completion: TEKEventStoreBlockMethod1): Pointer; cdecl;
    function initWithAccessToEntityTypes(entityTypes: EKEntityMask): Pointer; cdecl;
    function initWithSources(sources: NSArray): Pointer; cdecl;
    [MethodName('predicateForCompletedRemindersWithCompletionDateStarting:ending:calendars:')]
    function predicateForCompletedRemindersWithCompletionDateStarting(startDate: NSDate; endDate: NSDate; calendars: NSArray): NSPredicate; cdecl;
    [MethodName('predicateForEventsWithStartDate:endDate:calendars:')]
    function predicateForEventsWithStartDate(startDate: NSDate; endDate: NSDate; calendars: NSArray): NSPredicate; cdecl;
    [MethodName('predicateForIncompleteRemindersWithDueDateStarting:ending:calendars:')]
    function predicateForIncompleteRemindersWithDueDateStarting(startDate: NSDate; endDate: NSDate; calendars: NSArray): NSPredicate; cdecl;
    function predicateForRemindersInCalendars(calendars: NSArray): NSPredicate; cdecl;
    procedure refreshSourcesIfNecessary; cdecl;
    [MethodName('removeCalendar:commit:error:')]
    function removeCalendar(calendar: EKCalendar; commit: Boolean; error: PNSError): Boolean; cdecl;
    [MethodName('removeEvent:span:commit:error:')]
    function removeEvent(event: EKEvent; span: EKSpan; commit: Boolean; error: PNSError): Boolean; overload; cdecl;
    [MethodName('removeEvent:span:error:')]
    function removeEvent(event: EKEvent; span: EKSpan; error: PNSError): Boolean; overload; cdecl;
    [MethodName('removeReminder:commit:error:')]
    function removeReminder(reminder: EKReminder; commit: Boolean; error: PNSError): Boolean; cdecl;
    [MethodName('requestAccessToEntityType:completion:')]
    procedure requestAccessToEntityType(entityType: EKEntityType; completion: EKEventStoreRequestAccessCompletionHandler); cdecl;
    procedure reset; cdecl;
    [MethodName('saveCalendar:commit:error:')]
    function saveCalendar(calendar: EKCalendar; commit: Boolean; error: PNSError): Boolean; cdecl;
    [MethodName('saveEvent:span:commit:error:')]
    function saveEvent(event: EKEvent; span: EKSpan; commit: Boolean; error: PNSError): Boolean; overload; cdecl;
    [MethodName('saveEvent:span:error:')]
    function saveEvent(event: EKEvent; span: EKSpan; error: PNSError): Boolean; overload; cdecl;
    [MethodName('saveReminder:commit:error:')]
    function saveReminder(reminder: EKReminder; commit: Boolean; error: PNSError): Boolean; cdecl;
    function sources: NSArray; cdecl;
    function sourceWithIdentifier(identifier: NSString): EKSource; cdecl;
  end;
  TEKEventStore = class(TOCGenericImport<EKEventStoreClass, EKEventStore>) end;

  EKParticipantClass = interface(EKObjectClass)
    ['{1EE7E142-644B-4679-9DB8-33E00FC1001D}']
  end;

  EKParticipant = interface(EKObject)
    ['{E921C21E-889C-4CD6-9F76-80F22079A0C9}']
    function ABPersonInAddressBook(addressBook: ABAddressBook): ABPerson; cdecl;
    function contactPredicate: NSPredicate; cdecl;
    function isCurrentUser: Boolean; cdecl;
    function name: NSString; cdecl;
    function participantRole: EKParticipantRole; cdecl;
    function participantStatus: EKParticipantStatus; cdecl;
    function participantType: EKParticipantType; cdecl;
    function URL: NSURL; cdecl;
  end;
  TEKParticipant = class(TOCGenericImport<EKParticipantClass, EKParticipant>) end;

  EKRecurrenceDayOfWeekClass = interface(NSObjectClass)
    ['{CBCD9D40-596F-4162-AEAD-3E2A7830E396}']
    {class} function dayOfWeek(dayOfTheWeek: EKWeekday): Pointer; overload; cdecl;
    [MethodName('dayOfWeek:weekNumber:')]
    {class} function dayOfWeek(dayOfTheWeek: EKWeekday; weekNumber: NSInteger): Pointer; overload; cdecl;
  end;

  EKRecurrenceDayOfWeek = interface(NSObject)
    ['{66B5C433-3753-49C9-BD10-5B07A3A46DC7}']
    function dayOfTheWeek: EKWeekday; cdecl;
    [MethodName('initWithDayOfTheWeek:weekNumber:')]
    function initWithDayOfTheWeek(dayOfTheWeek: EKWeekday; weekNumber: NSInteger): Pointer; cdecl;
    function weekNumber: NSInteger; cdecl;
  end;
  TEKRecurrenceDayOfWeek = class(TOCGenericImport<EKRecurrenceDayOfWeekClass, EKRecurrenceDayOfWeek>) end;

  EKRecurrenceEndClass = interface(NSObjectClass)
    ['{A7CAECF1-BC65-4812-8499-254B026DF584}']
    {class} function recurrenceEndWithEndDate(endDate: NSDate): Pointer; cdecl;
    {class} function recurrenceEndWithOccurrenceCount(occurrenceCount: NSUInteger): Pointer; cdecl;
  end;

  EKRecurrenceEnd = interface(NSObject)
    ['{64E2EDFB-ED3A-422D-8C5B-4E67C2D1D2A8}']
    function endDate: NSDate; cdecl;
    function occurrenceCount: NSUInteger; cdecl;
  end;
  TEKRecurrenceEnd = class(TOCGenericImport<EKRecurrenceEndClass, EKRecurrenceEnd>) end;

  EKRecurrenceRuleClass = interface(EKObjectClass)
    ['{031DDEFD-004B-4377-8B19-E1D4617D9051}']
  end;

  EKRecurrenceRule = interface(EKObject)
    ['{8F8E1281-B1D9-4ACD-864F-53B3C36C4176}']
    function calendarIdentifier: NSString; cdecl;
    function daysOfTheMonth: NSArray; cdecl;
    function daysOfTheWeek: NSArray; cdecl;
    function daysOfTheYear: NSArray; cdecl;
    function firstDayOfTheWeek: NSInteger; cdecl;
    function frequency: EKRecurrenceFrequency; cdecl;
    [MethodName('initRecurrenceWithFrequency:interval:end:')]
    function initRecurrenceWithFrequency(&type: EKRecurrenceFrequency; interval: NSInteger; &end: EKRecurrenceEnd): Pointer; overload; cdecl;
    [MethodName('initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:')]
    function initRecurrenceWithFrequency(&type: EKRecurrenceFrequency; interval: NSInteger; days: NSArray; monthDays: NSArray; months: NSArray;
      weeksOfTheYear: NSArray; daysOfTheYear: NSArray; setPositions: NSArray; &end: EKRecurrenceEnd): Pointer; overload; cdecl;
    function interval: NSInteger; cdecl;
    function monthsOfTheYear: NSArray; cdecl;
    function recurrenceEnd: EKRecurrenceEnd; cdecl;
    function setPositions: NSArray; cdecl;
    procedure setRecurrenceEnd(recurrenceEnd: EKRecurrenceEnd); cdecl;
    function weeksOfTheYear: NSArray; cdecl;
  end;
  TEKRecurrenceRule = class(TOCGenericImport<EKRecurrenceRuleClass, EKRecurrenceRule>) end;

  EKReminderClass = interface(EKCalendarItemClass)
    ['{406E4FFD-ABFB-499B-BF4F-400F1E37CD5B}']
    {class} function reminderWithEventStore(eventStore: EKEventStore): EKReminder; cdecl;
  end;

  EKReminder = interface(EKCalendarItem)
    ['{AC41FE30-80AC-422F-A5C5-C5C44072CEE1}']
    function completionDate: NSDate; cdecl;
    function dueDateComponents: NSDateComponents; cdecl;
    function isCompleted: Boolean; cdecl;
    function priority: NSUInteger; cdecl;
    procedure setCompleted(completed: Boolean); cdecl;
    procedure setCompletionDate(completionDate: NSDate); cdecl;
    procedure setDueDateComponents(dueDateComponents: NSDateComponents); cdecl;
    procedure setPriority(priority: NSUInteger); cdecl;
    procedure setStartDateComponents(startDateComponents: NSDateComponents); cdecl;
    function startDateComponents: NSDateComponents; cdecl;
  end;
  TEKReminder = class(TOCGenericImport<EKReminderClass, EKReminder>) end;

  EKSourceClass = interface(EKObjectClass)
    ['{6BEC53C5-23D8-48B7-BEA1-4EBDC9496BE2}']
  end;

  EKSource = interface(EKObject)
    ['{2E762A07-F5F7-4AF4-A631-8B58A10925C6}']
    function calendars: NSSet; cdecl;
    function calendarsForEntityType(entityType: EKEntityType): NSSet; cdecl;
    function sourceIdentifier: NSString; cdecl;
    function sourceType: EKSourceType; cdecl;
    function title: NSString; cdecl;
  end;
  TEKSource = class(TOCGenericImport<EKSourceClass, EKSource>) end;

  EKStructuredLocationClass = interface(EKObjectClass)
    ['{D3B37D3B-1AD3-43A2-B479-0DBD4588C899}']
    {class} function locationWithMapItem(mapItem: MKMapItem): Pointer; cdecl;
    {class} function locationWithTitle(title: NSString): Pointer; cdecl;
  end;

  EKStructuredLocation = interface(EKObject)
    ['{AAEB5128-3431-4129-9A82-25F07F7C55A5}']
    function geoLocation: CLLocation; cdecl;
    function radius: Double; cdecl;
    procedure setGeoLocation(geoLocation: CLLocation); cdecl;
    procedure setRadius(radius: Double); cdecl;
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
  end;
  TEKStructuredLocation = class(TOCGenericImport<EKStructuredLocationClass, EKStructuredLocation>) end;

function EKErrorDomain: NSString;
function EKEventStoreChangedNotification: NSString;

const
  libEventKit = '/System/Library/Frameworks/EventKit.framework/EventKit';

implementation

uses
  System.SysUtils;

var
  EventKitModule: THandle;

function EKErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libEventKit, 'EKErrorDomain');
end;

function EKEventStoreChangedNotification: NSString;
begin
  Result := CocoaNSStringConst(libEventKit, 'EKEventStoreChangedNotification');
end;

initialization
  EventKitModule := LoadLibrary(libEventKit);

finalization
  if EventKitModule <> 0 then
    FreeLibrary(EventKitModule);

end.