{*******************************************************}
{                                                       }
{            CodeGear Delphi Runtime Library            }
{                                                       }
{ Copyright(c) 2010-2019 Embarcadero Technologies, Inc. }
{                  All rights reserved                  }
{                                                       }
{*******************************************************}

unit Macapi.AddressBook;

interface

uses
  Macapi.ObjectiveC, Macapi.CocoaTypes, Macapi.CoreFoundation, Macapi.Foundation, Macapi.CoreServices, Macapi.AppKit;

const
  kABErrorInProperty = 0;
  kABStringProperty = 1;
  kABIntegerProperty = 2;
  kABRealProperty = 3;
  kABDateProperty = 4;
  kABArrayProperty = 5;
  kABDictionaryProperty = 6;
  kABDataProperty = 7;
  kABDateComponentsProperty = 8;
  kABMultiStringProperty = 257;
  kABMultiIntegerProperty = 258;
  kABMultiRealProperty = 259;
  kABMultiDateProperty = 260;
  kABMultiArrayProperty = 261;
  kABMultiDictionaryProperty = 262;
  kABMultiDataProperty = 263;
  kABMultiDateComponentsProperty = 264;
  kABEqual = 0;
  kABNotEqual = 1;
  kABLessThan = 2;
  kABLessThanOrEqual = 3;
  kABGreaterThan = 4;
  kABGreaterThanOrEqual = 5;
  kABEqualCaseInsensitive = 6;
  kABContainsSubString = 7;
  kABContainsSubStringCaseInsensitive = 8;
  kABPrefixMatch = 9;
  kABPrefixMatchCaseInsensitive = 10;
  kABBitsInBitFieldMatch = 11;
  kABDoesNotContainSubString = 12;
  kABDoesNotContainSubStringCaseInsensitive = 13;
  kABNotEqualCaseInsensitive = 14;
  kABSuffixMatch = 15;
  kABSuffixMatchCaseInsensitive = 16;
  kABWithinIntervalAroundToday = 17;
  kABWithinIntervalAroundTodayYearless = 18;
  kABNotWithinIntervalAroundToday = 19;
  kABNotWithinIntervalAroundTodayYearless = 20;
  kABWithinIntervalFromToday = 21;
  kABWithinIntervalFromTodayYearless = 22;
  kABNotWithinIntervalFromToday = 23;
  kABNotWithinIntervalFromTodayYearless = 24;
  kABSearchAnd = 0;
  kABSearchOr = 1;
  ABAddRecordsError = 1001;
  ABRemoveRecordsError = 1002;
  ABPropertyValueValidationError = 1012;
  ABPropertyUnsupportedBySourceError = 1013;
  ABPropertyReadOnlyError = 1014;
  kABPickerSingleValueSelection = 1;
  kABPickerMultipleValueSelection = 2;
  kABPickerAllowGroupSelection = 4;
  kABPickerAllowMultipleSelection = 8;
  kEventClassABPeoplePicker = 1633841264;
  kEventABPeoplePickerGroupSelectionChanged = 1;
  kEventABPeoplePickerNameSelectionChanged = 2;
  kEventABPeoplePickerValueSelectionChanged = 3;
  kEventABPeoplePickerDisplayedPropertyChanged = 4;
  kEventABPeoplePickerGroupDoubleClicked = 5;
  kEventABPeoplePickerNameDoubleClicked = 6;
  kEventParamABPickerRef = 1633841264;
  ABNoValueSelection = 0;
  ABSingleValueSelection = 1;
  ABMultipleValueSelection = 2;

type
  ABAddressBook = interface;
  ABRecord = interface;
  ABGroup = interface;
  ABPerson = interface;
  ABSearchElement = interface;
  ABMultiValue = interface;
  ABMutableMultiValue = interface;
  ABImageClient = interface;
  ABPeoplePickerView = interface;
  ABPersonPicker = interface;
  ABPersonPickerDelegate = interface;
  ABPersonView = interface;

  PNSError = ^NSError;
  PBoolean = ^Boolean;
  P__ABPerson = Pointer;
  PP__ABPerson = ^P__ABPerson;
  P__ABGroup = Pointer;
  PP__ABGroup = ^P__ABGroup;
  P__ABSearchElementRef = Pointer;
  PP__ABSearchElementRef = ^P__ABSearchElementRef;
  P__ABAddressBookRef = Pointer;
  PP__ABAddressBookRef = ^P__ABAddressBookRef;
  P__ABMultiValue = Pointer;
  PP__ABMultiValue = ^P__ABMultiValue;
  POpaqueABPicker = Pointer;
  PPOpaqueABPicker = ^POpaqueABPicker;
  PABActionCallbacks = ^ABActionCallbacks;
  P__ABBookflags = ^__ABBookflags;

  ABPropertyType = CFIndex;
  ABSearchComparison = CFIndex;
  ABSearchConjunction = CFIndex;
  ABRecordRef = Pointer;
  ABPersonRef = Pointer;
  PABPersonRef = ^ABPersonRef;
  ABGroupRef = Pointer;
  PABGroupRef = ^ABGroupRef;
  ABSearchElementRef = Pointer;
  PABSearchElementRef = ^ABSearchElementRef;
  ABAddressBookRef = Pointer;
  PABAddressBookRef = ^ABAddressBookRef;
  ABMultiValueRef = Pointer;
  PABMultiValueRef = ^ABMultiValueRef;
  ABMutableMultiValueRef = Pointer;
  PABMutableMultiValueRef = ^ABMutableMultiValueRef;
  ABPeoplePickerSelectionBehavior = NSUInteger;
  HIRect = CGRect;
  PHIRect = ^HIRect;
  EventTargetRef = ^OpaqueEventTargetRef;
  OpaqueEventTargetRef = record end;

  ABImageClientCallback = procedure(imageData: CFDataRef; tag: CFIndex; refcon: Pointer); cdecl;

  ABActionGetPropertyCallback = function: CFStringRef; cdecl;

  ABActionCopyTitleCallback = function(person: ABPersonRef; identifier: CFStringRef): CFStringRef; cdecl;

  ABActionEnabledCallback = function(person: ABPersonRef; identifier: CFStringRef): Boolean; cdecl;

  ABActionSelectedCallback = procedure(person: ABPersonRef; identifier: CFStringRef); cdecl;

  ABActionCallbacks = record
    version: CFIndex;
    &property: ABActionGetPropertyCallback;
    title: ABActionCopyTitleCallback;
    enabled: ABActionEnabledCallback;
    selected: ABActionSelectedCallback;
  end;

  __ABBookflags = record
    hasUnsavedChanges: Cardinal;
    readOnly: Cardinal;
    importMe: Cardinal;
    needConversion: Cardinal;
    cleanedUp: Cardinal;
    importTips: Cardinal;
    restoreFromMetaData: Cardinal;
    prefsNeedSync: Cardinal;
    waitingForReset: Cardinal;
    enforcesConstraints: Cardinal;
    tracksAllSources: Cardinal;
    _reserved: Cardinal;
  end;

  ABPickerRef = Pointer;
  PABPickerRef = ^ABPickerRef;
  ABPickerAttributes = OptionBits;

  ABAddressBookClass = interface(NSObjectClass)
    ['{2D8AD741-6676-40F7-B29A-B47023AB1A17}']
    {class} function addressBook: ABAddressBook; cdecl;
    {class} function sharedAddressBook: ABAddressBook; cdecl;
  end;

  ABAddressBook = interface(NSObject)
    ['{F55F0D9E-56AB-4C70-82EB-77BE0D782620}']
    function addRecord(&record: ABRecord): Boolean; overload; cdecl;
    [MethodName('addRecord:error:')]
    function addRecord(&record: ABRecord; error: PNSError): Boolean; overload; cdecl;
    function defaultCountryCode: NSString; cdecl;
    function defaultNameOrdering: NSInteger; cdecl;
    function formattedAddressFromDictionary(address: NSDictionary): NSAttributedString; cdecl;
    function groups: NSArray; cdecl;
    function hasUnsavedChanges: Boolean; cdecl;
    function me: ABPerson; cdecl;
    function people: NSArray; cdecl;
    function recordClassFromUniqueId(uniqueId: NSString): NSString; cdecl;
    function recordForUniqueId(uniqueId: NSString): ABRecord; cdecl;
    function recordsMatchingSearchElement(search: ABSearchElement): NSArray; cdecl;
    function removeRecord(&record: ABRecord): Boolean; overload; cdecl;
    [MethodName('removeRecord:error:')]
    function removeRecord(&record: ABRecord; error: PNSError): Boolean; overload; cdecl;
    function save: Boolean; cdecl;
    function saveAndReturnError(error: PNSError): Boolean; cdecl;
    procedure setMe(moi: ABPerson); cdecl;
  end;
  TABAddressBook = class(TOCGenericImport<ABAddressBookClass, ABAddressBook>) end;

  ABRecordClass = interface(NSObjectClass)
    ['{337BCE02-868A-4D30-8BC3-23E9EAC28E24}']
  end;

  ABRecord = interface(NSObject)
    ['{955CB911-DB0F-4D10-A259-9525C66FB876}']
    function displayName: NSString; cdecl;
    function initWithAddressBook(addressBook: ABAddressBook): Pointer; cdecl;
    function isReadOnly: Boolean; cdecl;
    function removeValueForProperty(&property: NSString): Boolean; cdecl;
    [MethodName('setValue:forProperty:error:')]
    function setValue(value: Pointer; &property: NSString; error: PNSError): Boolean; overload; cdecl;
    [MethodName('setValue:forProperty:')]
    function setValue(value: Pointer; &property: NSString): Boolean; overload; cdecl;
    function uniqueId: NSString; cdecl;
    function valueForProperty(&property: NSString): Pointer; cdecl;
  end;
  TABRecord = class(TOCGenericImport<ABRecordClass, ABRecord>) end;

  ABGroupClass = interface(ABRecordClass)
    ['{9F5A3BEE-ABD6-498B-A05A-47AA2B9058F7}']
    {class} function addPropertiesAndTypes(properties: NSDictionary): NSInteger; cdecl;
    {class} function properties: NSArray; cdecl;
    {class} function removeProperties(properties: NSArray): NSInteger; cdecl;
    [MethodName('searchElementForProperty:label:key:value:comparison:')]
    {class} function searchElementForProperty(&property: NSString; &label: NSString; key: NSString; value: Pointer;
      comparison: ABSearchComparison): ABSearchElement; cdecl;
    {class} function typeOfProperty(&property: NSString): ABPropertyType; cdecl;
  end;

  ABGroup = interface(ABRecord)
    ['{006B8261-C76D-4AB3-8EFE-7F98A492A947}']
    function addMember(person: ABPerson): Boolean; cdecl;
    function addSubgroup(group: ABGroup): Boolean; cdecl;
    [MethodName('distributionIdentifierForProperty:person:')]
    function distributionIdentifierForProperty(&property: NSString; person: ABPerson): NSString; cdecl;
    function members: NSArray; cdecl;
    function parentGroups: NSArray; cdecl;
    function removeMember(person: ABPerson): Boolean; cdecl;
    function removeSubgroup(group: ABGroup): Boolean; cdecl;
    [MethodName('setDistributionIdentifier:forProperty:person:')]
    function setDistributionIdentifier(identifier: NSString; &property: NSString; person: ABPerson): Boolean; cdecl;
    function subgroups: NSArray; cdecl;
  end;
  TABGroup = class(TOCGenericImport<ABGroupClass, ABGroup>) end;

  ABPersonClass = interface(ABRecordClass)
    ['{5931F1EC-B0BB-4D0A-B86D-B906F623976C}']
    {class} function addPropertiesAndTypes(properties: NSDictionary): NSInteger; cdecl;
    {class} procedure cancelLoadingImageDataForTag(tag: NSInteger); cdecl;
    {class} function properties: NSArray; cdecl;
    {class} function removeProperties(properties: NSArray): NSInteger; cdecl;
    [MethodName('searchElementForProperty:label:key:value:comparison:')]
    {class} function searchElementForProperty(&property: NSString; &label: NSString; key: NSString; value: Pointer;
      comparison: ABSearchComparison): ABSearchElement; cdecl;
    {class} function typeOfProperty(&property: NSString): ABPropertyType; cdecl;
  end;

  ABPerson = interface(ABRecord)
    ['{E7832FC5-3948-4010-9DF3-2E27299EDEE0}']
    function beginLoadingImageDataForClient(client: Pointer): NSInteger; cdecl;
    function imageData: NSData; cdecl;
    function initWithVCardRepresentation(vCardData: NSData): Pointer; cdecl;
    function linkedPeople: NSArray; cdecl;
    function parentGroups: NSArray; cdecl;
    function setImageData(data: NSData): Boolean; cdecl;
    function vCardRepresentation: NSData; cdecl;
  end;
  TABPerson = class(TOCGenericImport<ABPersonClass, ABPerson>) end;

  ABSearchElementClass = interface(NSObjectClass)
    ['{CDD1B5E5-18F9-4153-A510-F25E1178A74A}']
    [MethodName('searchElementForConjunction:children:')]
    {class} function searchElementForConjunction(conjuction: ABSearchConjunction; children: NSArray): ABSearchElement; cdecl;
  end;

  ABSearchElement = interface(NSObject)
    ['{7359AB7F-218D-4BE2-9452-D24BBC06EB78}']
    function matchesRecord(&record: ABRecord): Boolean; cdecl;
  end;
  TABSearchElement = class(TOCGenericImport<ABSearchElementClass, ABSearchElement>) end;

  ABMultiValueClass = interface(NSObjectClass)
    ['{B9C2BD2D-B65A-4996-9C59-5E0A137C2883}']
  end;

  ABMultiValue = interface(NSObject)
    ['{C4F9DC5C-8B28-4993-9973-85520B98BE61}']
    function count: NSUInteger; cdecl;
    function identifierAtIndex(index: NSUInteger): NSString; cdecl;
    function indexForIdentifier(identifier: NSString): NSUInteger; cdecl;
    function labelAtIndex(index: NSUInteger): NSString; cdecl;
    function labelForIdentifier(identifier: NSString): Pointer; cdecl;
    function primaryIdentifier: NSString; cdecl;
    function propertyType: ABPropertyType; cdecl;
    function valueAtIndex(index: NSUInteger): Pointer; cdecl;
    function valueForIdentifier(identifier: NSString): Pointer; cdecl;
  end;
  TABMultiValue = class(TOCGenericImport<ABMultiValueClass, ABMultiValue>) end;

  ABMutableMultiValueClass = interface(ABMultiValueClass)
    ['{641A2238-24E2-46ED-B4BA-6FF987B19DB7}']
  end;

  ABMutableMultiValue = interface(ABMultiValue)
    ['{E824A204-896C-40BE-9299-51AEBDF4ABF1}']
    [MethodName('addValue:withLabel:')]
    function addValue(value: Pointer; &label: NSString): NSString; cdecl;
    [MethodName('insertValue:withLabel:atIndex:')]
    function insertValue(value: Pointer; &label: NSString; index: NSUInteger): NSString; cdecl;
    function removeValueAndLabelAtIndex(index: NSUInteger): Boolean; cdecl;
    [MethodName('replaceLabelAtIndex:withLabel:')]
    function replaceLabelAtIndex(index: NSUInteger; &label: NSString): Boolean; cdecl;
    [MethodName('replaceValueAtIndex:withValue:')]
    function replaceValueAtIndex(index: NSUInteger; value: Pointer): Boolean; cdecl;
    function setPrimaryIdentifier(identifier: NSString): Boolean; cdecl;
  end;
  TABMutableMultiValue = class(TOCGenericImport<ABMutableMultiValueClass, ABMutableMultiValue>) end;

  ABImageClient = interface(IObjectiveC)
    ['{76446CC4-C852-421B-9F10-384B5D1BCE9A}']
    [MethodName('consumeImageData:forTag:')]
    procedure consumeImageData(data: NSData; tag: NSInteger); cdecl;
  end;

  ABPeoplePickerViewClass = interface(NSViewClass)
    ['{FA7A4458-CECB-4A84-BA97-5E482C117858}']
  end;

  ABPeoplePickerView = interface(NSView)
    ['{84199CD4-4EBF-4B08-8AD2-BF86EA0ED7AF}']
    function accessoryView: NSView; cdecl;
    procedure addProperty(&property: NSString); cdecl;
    function allowsGroupSelection: Boolean; cdecl;
    function allowsMultipleSelection: Boolean; cdecl;
    function autosaveName: NSString; cdecl;
    procedure clearSearchField(sender: Pointer); cdecl;
    function columnTitleForProperty(&property: NSString): NSString; cdecl;
    procedure deselectAll(sender: Pointer); cdecl;
    procedure deselectGroup(group: ABGroup); cdecl;
    [MethodName('deselectIdentifier:forPerson:')]
    procedure deselectIdentifier(identifier: NSString; person: ABPerson); cdecl;
    procedure deselectRecord(&record: ABRecord); cdecl;
    function displayedProperty: NSString; cdecl;
    procedure editInAddressBook(sender: Pointer); cdecl;
    function groupDoubleAction: SEL; cdecl;
    function nameDoubleAction: SEL; cdecl;
    function properties: NSArray; cdecl;
    procedure removeProperty(&property: NSString); cdecl;
    function selectedGroups: NSArray; cdecl;
    function selectedIdentifiersForPerson(person: ABPerson): NSArray; cdecl;
    function selectedRecords: NSArray; cdecl;
    function selectedValues: NSArray; cdecl;
    [MethodName('selectGroup:byExtendingSelection:')]
    procedure selectGroup(group: ABGroup; extend: Boolean); cdecl;
    [MethodName('selectIdentifier:forPerson:byExtendingSelection:')]
    procedure selectIdentifier(identifier: NSString; person: ABPerson; extend: Boolean); cdecl;
    procedure selectInAddressBook(sender: Pointer); cdecl;
    [MethodName('selectRecord:byExtendingSelection:')]
    procedure selectRecord(&record: ABRecord; extend: Boolean); cdecl;
    procedure setAccessoryView(accessoryView: NSView); cdecl;
    procedure setAllowsGroupSelection(allowsGroupSelection: Boolean); cdecl;
    procedure setAllowsMultipleSelection(allowsMultipleSelection: Boolean); cdecl;
    procedure setAutosaveName(autosaveName: NSString); cdecl;
    [MethodName('setColumnTitle:forProperty:')]
    procedure setColumnTitle(title: NSString; &property: NSString); cdecl;
    procedure setDisplayedProperty(displayedProperty: NSString); cdecl;
    procedure setGroupDoubleAction(groupDoubleAction: SEL); cdecl;
    procedure setNameDoubleAction(nameDoubleAction: SEL); cdecl;
    procedure setTarget(target: Pointer); cdecl;
    procedure setValueSelectionBehavior(valueSelectionBehavior: ABPeoplePickerSelectionBehavior); cdecl;
    function target: Pointer; cdecl;
    function valueSelectionBehavior: ABPeoplePickerSelectionBehavior; cdecl;
  end;
  TABPeoplePickerView = class(TOCGenericImport<ABPeoplePickerViewClass, ABPeoplePickerView>) end;

  ABPersonPickerClass = interface(NSObjectClass)
    ['{14EFE7B6-6520-49F4-9849-2B88A0640318}']
  end;

  ABPersonPicker = interface(NSObject)
    ['{C40D245E-1403-4230-A568-C6D5BBF136B1}']
    procedure close; cdecl;
    function delegate: Pointer; cdecl;
    function properties: NSArray; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    procedure setProperties(properties: NSArray); cdecl;
    [MethodName('showRelativeToRect:ofView:preferredEdge:')]
    procedure showRelativeToRect(positioningRect: NSRect; positioningView: NSView; preferredEdge: NSRectEdge); cdecl;
  end;
  TABPersonPicker = class(TOCGenericImport<ABPersonPickerClass, ABPersonPicker>) end;

  ABPersonPickerDelegate = interface(IObjectiveC)
    ['{CC6EECA4-BE8B-4AAF-9F0C-90BFE43D8824}']
    [MethodName('personPicker:didChoosePerson:property:identifier:')]
    procedure personPicker(picker: ABPersonPicker; person: ABPerson; &property: NSString; identifier: NSString); cdecl;
    procedure personPickerDidClose(picker: ABPersonPicker); cdecl;
  end;

  ABPersonViewClass = interface(NSViewClass)
    ['{E8ABB7BA-6F3C-4248-8EB5-DDDCF80812CF}']
  end;

  ABPersonView = interface(NSView)
    ['{CB2F28E7-7732-4355-BFF1-5F1F1C0AC9F7}']
    function editing: Boolean; cdecl;
    function person: ABPerson; cdecl;
    procedure setEditing(editing: Boolean); cdecl;
    procedure setPerson(person: ABPerson); cdecl;
    procedure setShouldShowLinkedPeople(shouldShowLinkedPeople: Boolean); cdecl;
    function shouldShowLinkedPeople: Boolean; cdecl;
  end;
  TABPersonView = class(TOCGenericImport<ABPersonViewClass, ABPersonView>) end;

function kABUIDProperty: NSString;
function kABCreationDateProperty: NSString;
function kABModificationDateProperty: NSString;
function kABFirstNameProperty: NSString;
function kABLastNameProperty: NSString;
function kABFirstNamePhoneticProperty: NSString;
function kABLastNamePhoneticProperty: NSString;
function kABNicknameProperty: NSString;
function kABMaidenNameProperty: NSString;
function kABBirthdayProperty: NSString;
function kABBirthdayComponentsProperty: NSString;
function kABAlternateBirthdayComponentsProperty: NSString;
function kABOrganizationProperty: NSString;
function kABOrganizationPhoneticProperty: NSString;
function kABJobTitleProperty: NSString;
function kABHomePageProperty: NSString;
function kABURLsProperty: NSString;
function kABHomePageLabel: NSString;
function kABCalendarURIsProperty: NSString;
function kABEmailProperty: NSString;
function kABEmailWorkLabel: NSString;
function kABEmailHomeLabel: NSString;
function kABEmailMobileMeLabel: NSString;
function kABAddressProperty: NSString;
function kABAddressStreetKey: NSString;
function kABAddressCityKey: NSString;
function kABAddressStateKey: NSString;
function kABAddressZIPKey: NSString;
function kABAddressCountryKey: NSString;
function kABAddressCountryCodeKey: NSString;
function kABAddressHomeLabel: NSString;
function kABAddressWorkLabel: NSString;
function kABOtherDatesProperty: NSString;
function kABOtherDateComponentsProperty: NSString;
function kABAnniversaryLabel: NSString;
function kABRelatedNamesProperty: NSString;
function kABFatherLabel: NSString;
function kABMotherLabel: NSString;
function kABParentLabel: NSString;
function kABBrotherLabel: NSString;
function kABSisterLabel: NSString;
function kABChildLabel: NSString;
function kABFriendLabel: NSString;
function kABSpouseLabel: NSString;
function kABPartnerLabel: NSString;
function kABAssistantLabel: NSString;
function kABManagerLabel: NSString;
function kABDepartmentProperty: NSString;
function kABPersonFlags: NSString;
function kABPhoneProperty: NSString;
function kABPhoneWorkLabel: NSString;
function kABPhoneHomeLabel: NSString;
function kABPhoneiPhoneLabel: NSString;
function kABPhoneMobileLabel: NSString;
function kABPhoneMainLabel: NSString;
function kABPhoneHomeFAXLabel: NSString;
function kABPhoneWorkFAXLabel: NSString;
function kABPhonePagerLabel: NSString;
function kABAIMInstantProperty: NSString;
function kABAIMWorkLabel: NSString;
function kABAIMHomeLabel: NSString;
function kABAIMMobileMeLabel: NSString;
function kABJabberInstantProperty: NSString;
function kABJabberWorkLabel: NSString;
function kABJabberHomeLabel: NSString;
function kABMSNInstantProperty: NSString;
function kABMSNWorkLabel: NSString;
function kABMSNHomeLabel: NSString;
function kABYahooInstantProperty: NSString;
function kABYahooWorkLabel: NSString;
function kABYahooHomeLabel: NSString;
function kABICQInstantProperty: NSString;
function kABICQWorkLabel: NSString;
function kABICQHomeLabel: NSString;
function kABInstantMessageProperty: NSString;
function kABInstantMessageUsernameKey: NSString;
function kABInstantMessageServiceKey: NSString;
function kABInstantMessageServiceAIM: NSString;
function kABInstantMessageServiceFacebook: NSString;
function kABInstantMessageServiceGaduGadu: NSString;
function kABInstantMessageServiceGoogleTalk: NSString;
function kABInstantMessageServiceICQ: NSString;
function kABInstantMessageServiceJabber: NSString;
function kABInstantMessageServiceMSN: NSString;
function kABInstantMessageServiceQQ: NSString;
function kABInstantMessageServiceSkype: NSString;
function kABInstantMessageServiceYahoo: NSString;
function kABSocialProfileProperty: NSString;
function kABSocialProfileURLKey: NSString;
function kABSocialProfileUsernameKey: NSString;
function kABSocialProfileUserIdentifierKey: NSString;
function kABSocialProfileServiceKey: NSString;
function kABSocialProfileServiceTwitter: NSString;
function kABSocialProfileServiceFacebook: NSString;
function kABSocialProfileServiceLinkedIn: NSString;
function kABSocialProfileServiceFlickr: NSString;
function kABSocialProfileServiceMySpace: NSString;
function kABSocialProfileServiceSinaWeibo: NSString;
function kABSocialProfileServiceTencentWeibo: NSString;
function kABSocialProfileServiceYelp: NSString;
function kABNoteProperty: NSString;
function kABMiddleNameProperty: NSString;
function kABMiddleNamePhoneticProperty: NSString;
function kABTitleProperty: NSString;
function kABSuffixProperty: NSString;
function kABGroupNameProperty: NSString;
function kABWorkLabel: NSString;
function kABHomeLabel: NSString;
function kABOtherLabel: NSString;
function kABMobileMeLabel: NSString;
function kABDatabaseChangedNotification: NSString;
function kABDatabaseChangedExternallyNotification: NSString;
function kABInsertedRecords: NSString;
function kABUpdatedRecords: NSString;
function kABDeletedRecords: NSString;
function ABAddressBookErrorDomain: NSString;
function ABMultiValueIdentifiersErrorKey: NSString;
function ABPeoplePickerGroupSelectionDidChangeNotification: NSString;
function ABPeoplePickerNameSelectionDidChangeNotification: NSString;
function ABPeoplePickerValueSelectionDidChangeNotification: NSString;
function ABPeoplePickerDisplayedPropertyDidChangeNotification: NSString;

const
  libAddressBook = '/System/Library/Frameworks/AddressBook.framework/AddressBook';

function ABGetSharedAddressBook: ABAddressBookRef; cdecl;
  external libAddressBook name _PU + 'ABGetSharedAddressBook';

function ABCopyArrayOfMatchingRecords(addressBook: ABAddressBookRef; search: ABSearchElementRef): CFArrayRef; cdecl;
  external libAddressBook name _PU + 'ABCopyArrayOfMatchingRecords';

function ABSave(addressBook: ABAddressBookRef): Boolean; cdecl;
  external libAddressBook name _PU + 'ABSave';

function ABHasUnsavedChanges(addressBook: ABAddressBookRef): Boolean; cdecl;
  external libAddressBook name _PU + 'ABHasUnsavedChanges';

function ABGetMe(addressBook: ABAddressBookRef): ABPersonRef; cdecl;
  external libAddressBook name _PU + 'ABGetMe';

procedure ABSetMe(addressBook: ABAddressBookRef; moi: ABPersonRef); cdecl;
  external libAddressBook name _PU + 'ABSetMe';

function ABCopyRecordTypeFromUniqueId(addressBook: ABAddressBookRef; uniqueId: CFStringRef): CFStringRef; cdecl;
  external libAddressBook name _PU + 'ABCopyRecordTypeFromUniqueId';

function ABAddPropertiesAndTypes(addressBook: ABAddressBookRef; recordType: CFStringRef; propertiesAndTypes: CFDictionaryRef): CFIndex; cdecl;
  external libAddressBook name _PU + 'ABAddPropertiesAndTypes';

function ABRemoveProperties(addressBook: ABAddressBookRef; recordType: CFStringRef; properties: CFArrayRef): CFIndex; cdecl;
  external libAddressBook name _PU + 'ABRemoveProperties';

function ABCopyArrayOfPropertiesForRecordType(addressBook: ABAddressBookRef; recordType: CFStringRef): CFArrayRef; cdecl;
  external libAddressBook name _PU + 'ABCopyArrayOfPropertiesForRecordType';

function ABTypeOfProperty(addressBook: ABAddressBookRef; recordType: CFStringRef; &property: CFStringRef): ABPropertyType; cdecl;
  external libAddressBook name _PU + 'ABTypeOfProperty';

function ABCopyRecordForUniqueId(addressBook: ABAddressBookRef; uniqueId: CFStringRef): ABRecordRef; cdecl;
  external libAddressBook name _PU + 'ABCopyRecordForUniqueId';

function ABAddRecord(addressBook: ABAddressBookRef; &record: ABRecordRef): Boolean; cdecl;
  external libAddressBook name _PU + 'ABAddRecord';

function ABRemoveRecord(addressBook: ABAddressBookRef; &record: ABRecordRef): Boolean; cdecl;
  external libAddressBook name _PU + 'ABRemoveRecord';

function ABCopyArrayOfAllPeople(addressBook: ABAddressBookRef): CFArrayRef; cdecl;
  external libAddressBook name _PU + 'ABCopyArrayOfAllPeople';

function ABCopyArrayOfAllGroups(addressBook: ABAddressBookRef): CFArrayRef; cdecl;
  external libAddressBook name _PU + 'ABCopyArrayOfAllGroups';

function ABRecordCreateCopy(&record: ABRecordRef): ABRecordRef; cdecl;
  external libAddressBook name _PU + 'ABRecordCreateCopy';

function ABRecordCopyRecordType(&record: ABRecordRef): CFStringRef; cdecl;
  external libAddressBook name _PU + 'ABRecordCopyRecordType';

function ABRecordCopyValue(&record: ABRecordRef; &property: CFStringRef): CFTypeRef; cdecl;
  external libAddressBook name _PU + 'ABRecordCopyValue';

function ABRecordSetValue(&record: ABRecordRef; &property: CFStringRef; value: CFTypeRef): Boolean; cdecl;
  external libAddressBook name _PU + 'ABRecordSetValue';

function ABRecordRemoveValue(&record: ABRecordRef; &property: CFStringRef): Boolean; cdecl;
  external libAddressBook name _PU + 'ABRecordRemoveValue';

function ABRecordIsReadOnly(&record: ABRecordRef): Boolean; cdecl;
  external libAddressBook name _PU + 'ABRecordIsReadOnly';

function ABRecordCopyUniqueId(&record: ABRecordRef): CFStringRef; cdecl;
  external libAddressBook name _PU + 'ABRecordCopyUniqueId';

function ABPersonCreate: ABPersonRef; cdecl;
  external libAddressBook name _PU + 'ABPersonCreate';

function ABPersonCreateWithVCardRepresentation(vCard: CFDataRef): ABPersonRef; cdecl;
  external libAddressBook name _PU + 'ABPersonCreateWithVCardRepresentation';

function ABPersonCopyVCardRepresentation(person: ABPersonRef): CFDataRef; cdecl;
  external libAddressBook name _PU + 'ABPersonCopyVCardRepresentation';

function ABPersonCopyParentGroups(person: ABPersonRef): CFArrayRef; cdecl;
  external libAddressBook name _PU + 'ABPersonCopyParentGroups';

function ABPersonCreateSearchElement(&property: CFStringRef; &label: CFStringRef; key: CFStringRef; value: CFTypeRef;
  comparison: ABSearchComparison): ABSearchElementRef; cdecl;
  external libAddressBook name _PU + 'ABPersonCreateSearchElement';

function ABGroupCreate: ABGroupRef; cdecl;
  external libAddressBook name _PU + 'ABGroupCreate';

function ABGroupCopyArrayOfAllMembers(group: ABGroupRef): CFArrayRef; cdecl;
  external libAddressBook name _PU + 'ABGroupCopyArrayOfAllMembers';

function ABGroupAddMember(group: ABGroupRef; personToAdd: ABPersonRef): Boolean; cdecl;
  external libAddressBook name _PU + 'ABGroupAddMember';

function ABGroupRemoveMember(group: ABGroupRef; personToRemove: ABPersonRef): Boolean; cdecl;
  external libAddressBook name _PU + 'ABGroupRemoveMember';

function ABGroupCopyArrayOfAllSubgroups(group: ABGroupRef): CFArrayRef; cdecl;
  external libAddressBook name _PU + 'ABGroupCopyArrayOfAllSubgroups';

function ABGroupAddGroup(group: ABGroupRef; groupToAdd: ABGroupRef): Boolean; cdecl;
  external libAddressBook name _PU + 'ABGroupAddGroup';

function ABGroupRemoveGroup(group: ABGroupRef; groupToRemove: ABGroupRef): Boolean; cdecl;
  external libAddressBook name _PU + 'ABGroupRemoveGroup';

function ABGroupCopyParentGroups(group: ABGroupRef): CFArrayRef; cdecl;
  external libAddressBook name _PU + 'ABGroupCopyParentGroups';

function ABGroupSetDistributionIdentifier(group: ABGroupRef; person: ABPersonRef; &property: CFStringRef; identifier: CFStringRef): Boolean; cdecl;
  external libAddressBook name _PU + 'ABGroupSetDistributionIdentifier';

function ABGroupCopyDistributionIdentifier(group: ABGroupRef; person: ABPersonRef; &property: CFStringRef): CFStringRef; cdecl;
  external libAddressBook name _PU + 'ABGroupCopyDistributionIdentifier';

function ABGroupCreateSearchElement(&property: CFStringRef; &label: CFStringRef; key: CFStringRef; value: CFTypeRef;
  comparison: ABSearchComparison): ABSearchElementRef; cdecl;
  external libAddressBook name _PU + 'ABGroupCreateSearchElement';

function ABSearchElementCreateWithConjunction(conjunction: ABSearchConjunction; childrenSearchElement: CFArrayRef): ABSearchElementRef; cdecl;
  external libAddressBook name _PU + 'ABSearchElementCreateWithConjunction';

function ABSearchElementMatchesRecord(searchElement: ABSearchElementRef; &record: ABRecordRef): Boolean; cdecl;
  external libAddressBook name _PU + 'ABSearchElementMatchesRecord';

function ABMultiValueCreate: ABMultiValueRef; cdecl;
  external libAddressBook name _PU + 'ABMultiValueCreate';

function ABMultiValueCount(multiValue: ABMultiValueRef): CFIndex; cdecl;
  external libAddressBook name _PU + 'ABMultiValueCount';

function ABMultiValueCopyValueAtIndex(multiValue: ABMultiValueRef; index: CFIndex): CFTypeRef; cdecl;
  external libAddressBook name _PU + 'ABMultiValueCopyValueAtIndex';

function ABMultiValueCopyLabelAtIndex(multiValue: ABMultiValueRef; index: CFIndex): CFStringRef; cdecl;
  external libAddressBook name _PU + 'ABMultiValueCopyLabelAtIndex';

function ABMultiValueCopyPrimaryIdentifier(multiValue: ABMultiValueRef): CFStringRef; cdecl;
  external libAddressBook name _PU + 'ABMultiValueCopyPrimaryIdentifier';

function ABMultiValueIndexForIdentifier(multiValue: ABMultiValueRef; identifier: CFStringRef): CFIndex; cdecl;
  external libAddressBook name _PU + 'ABMultiValueIndexForIdentifier';

function ABMultiValueCopyIdentifierAtIndex(multiValue: ABMultiValueRef; index: CFIndex): CFStringRef; cdecl;
  external libAddressBook name _PU + 'ABMultiValueCopyIdentifierAtIndex';

function ABMultiValuePropertyType(multiValue: ABMultiValueRef): ABPropertyType; cdecl;
  external libAddressBook name _PU + 'ABMultiValuePropertyType';

function ABMultiValueCreateCopy(multiValue: ABMultiValueRef): ABMultiValueRef; cdecl;
  external libAddressBook name _PU + 'ABMultiValueCreateCopy';

function ABMultiValueCreateMutable: ABMutableMultiValueRef; cdecl;
  external libAddressBook name _PU + 'ABMultiValueCreateMutable';

function ABMultiValueAdd(multiValue: ABMutableMultiValueRef; value: CFTypeRef; &label: CFStringRef; outIdentifier: PCFStringRef): Boolean; cdecl;
  external libAddressBook name _PU + 'ABMultiValueAdd';

function ABMultiValueInsert(multiValue: ABMutableMultiValueRef; value: CFTypeRef; &label: CFStringRef; index: CFIndex;
  outIdentifier: PCFStringRef): Boolean; cdecl;
  external libAddressBook name _PU + 'ABMultiValueInsert';

function ABMultiValueRemove(multiValue: ABMutableMultiValueRef; index: CFIndex): Boolean; cdecl;
  external libAddressBook name _PU + 'ABMultiValueRemove';

function ABMultiValueReplaceValue(multiValue: ABMutableMultiValueRef; value: CFTypeRef; index: CFIndex): Boolean; cdecl;
  external libAddressBook name _PU + 'ABMultiValueReplaceValue';

function ABMultiValueReplaceLabel(multiValue: ABMutableMultiValueRef; &label: CFStringRef; index: CFIndex): Boolean; cdecl;
  external libAddressBook name _PU + 'ABMultiValueReplaceLabel';

function ABMultiValueSetPrimaryIdentifier(multiValue: ABMutableMultiValueRef; identifier: CFStringRef): Boolean; cdecl;
  external libAddressBook name _PU + 'ABMultiValueSetPrimaryIdentifier';

function ABMultiValueCreateMutableCopy(multiValue: ABMultiValueRef): ABMutableMultiValueRef; cdecl;
  external libAddressBook name _PU + 'ABMultiValueCreateMutableCopy';

function ABCopyLocalizedPropertyOrLabel(labelOrProperty: CFStringRef): CFStringRef; cdecl;
  external libAddressBook name _PU + 'ABCopyLocalizedPropertyOrLabel';

function ABCreateFormattedAddressFromDictionary(addressBook: ABAddressBookRef; address: CFDictionaryRef): CFStringRef; cdecl;
  external libAddressBook name _PU + 'ABCreateFormattedAddressFromDictionary';

function ABCopyDefaultCountryCode(addressBook: ABAddressBookRef): CFStringRef; cdecl;
  external libAddressBook name _PU + 'ABCopyDefaultCountryCode';

function ABPersonSetImageData(person: ABPersonRef; imageData: CFDataRef): Boolean; cdecl;
  external libAddressBook name _PU + 'ABPersonSetImageData';

function ABPersonCopyImageData(person: ABPersonRef): CFDataRef; cdecl;
  external libAddressBook name _PU + 'ABPersonCopyImageData';

function ABBeginLoadingImageDataForClient(person: ABPersonRef; callback: ABImageClientCallback; refcon: Pointer): CFIndex; cdecl;
  external libAddressBook name _PU + 'ABBeginLoadingImageDataForClient';

procedure ABCancelLoadingImageDataForTag(tag: CFIndex); cdecl;
  external libAddressBook name _PU + 'ABCancelLoadingImageDataForTag';

function ABLocalizedPropertyOrLabel(propertyOrLabel: NSString): NSString; cdecl;
  external libAddressBook name _PU + 'ABLocalizedPropertyOrLabel';

function ABPickerCreate: ABPickerRef; cdecl;
  external libAddressBook name _PU + 'ABPickerCreate';

procedure ABPickerSetFrame(inPicker: ABPickerRef; inFrame: PHIRect); cdecl;
  external libAddressBook name _PU + 'ABPickerSetFrame';

procedure ABPickerGetFrame(inPicker: ABPickerRef; outFrame: PHIRect); cdecl;
  external libAddressBook name _PU + 'ABPickerGetFrame';

procedure ABPickerSetVisibility(inPicker: ABPickerRef; visible: Boolean); cdecl;
  external libAddressBook name _PU + 'ABPickerSetVisibility';

function ABPickerIsVisible(inPicker: ABPickerRef): Boolean; cdecl;
  external libAddressBook name _PU + 'ABPickerIsVisible';

function ABPickerGetAttributes(inPicker: ABPickerRef): ABPickerAttributes; cdecl;
  external libAddressBook name _PU + 'ABPickerGetAttributes';

procedure ABPickerChangeAttributes(inPicker: ABPickerRef; inAttributesToSet: ABPickerAttributes; inAttributesToClear: ABPickerAttributes); cdecl;
  external libAddressBook name _PU + 'ABPickerChangeAttributes';

procedure ABPickerAddProperty(inPicker: ABPickerRef; inProperty: CFStringRef); cdecl;
  external libAddressBook name _PU + 'ABPickerAddProperty';

procedure ABPickerRemoveProperty(inPicker: ABPickerRef; inProperty: CFStringRef); cdecl;
  external libAddressBook name _PU + 'ABPickerRemoveProperty';

function ABPickerCopyProperties(inPicker: ABPickerRef): CFArrayRef; cdecl;
  external libAddressBook name _PU + 'ABPickerCopyProperties';

procedure ABPickerSetColumnTitle(inPicker: ABPickerRef; inTitle: CFStringRef; inProperty: CFStringRef); cdecl;
  external libAddressBook name _PU + 'ABPickerSetColumnTitle';

function ABPickerCopyColumnTitle(inPicker: ABPickerRef; inProperty: CFStringRef): CFStringRef; cdecl;
  external libAddressBook name _PU + 'ABPickerCopyColumnTitle';

procedure ABPickerSetDisplayedProperty(inPicker: ABPickerRef; inProperty: CFStringRef); cdecl;
  external libAddressBook name _PU + 'ABPickerSetDisplayedProperty';

function ABPickerCopyDisplayedProperty(inPicker: ABPickerRef): CFStringRef; cdecl;
  external libAddressBook name _PU + 'ABPickerCopyDisplayedProperty';

function ABPickerCopySelectedGroups(inPicker: ABPickerRef): CFArrayRef; cdecl;
  external libAddressBook name _PU + 'ABPickerCopySelectedGroups';

function ABPickerCopySelectedRecords(inPicker: ABPickerRef): CFArrayRef; cdecl;
  external libAddressBook name _PU + 'ABPickerCopySelectedRecords';

function ABPickerCopySelectedIdentifiers(inPicker: ABPickerRef; inPerson: ABPersonRef): CFArrayRef; cdecl;
  external libAddressBook name _PU + 'ABPickerCopySelectedIdentifiers';

function ABPickerCopySelectedValues(inPicker: ABPickerRef): CFArrayRef; cdecl;
  external libAddressBook name _PU + 'ABPickerCopySelectedValues';

procedure ABPickerSelectGroup(inPicker: ABPickerRef; inGroup: ABGroupRef; inExtendSelection: Boolean); cdecl;
  external libAddressBook name _PU + 'ABPickerSelectGroup';

procedure ABPickerSelectRecord(inPicker: ABPickerRef; inRecord: ABRecordRef; inExtendSelection: Boolean); cdecl;
  external libAddressBook name _PU + 'ABPickerSelectRecord';

procedure ABPickerSelectIdentifier(inPicker: ABPickerRef; inPerson: ABPersonRef; inIdentifier: CFStringRef; inExtendSelection: Boolean); cdecl;
  external libAddressBook name _PU + 'ABPickerSelectIdentifier';

procedure ABPickerDeselectGroup(inPicker: ABPickerRef; inGroup: ABGroupRef); cdecl;
  external libAddressBook name _PU + 'ABPickerDeselectGroup';

procedure ABPickerDeselectRecord(inPicker: ABPickerRef; inRecord: ABRecordRef); cdecl;
  external libAddressBook name _PU + 'ABPickerDeselectRecord';

procedure ABPickerDeselectIdentifier(inPicker: ABPickerRef; inPerson: ABPersonRef; inIdentifier: CFStringRef); cdecl;
  external libAddressBook name _PU + 'ABPickerDeselectIdentifier';

procedure ABPickerDeselectAll(inPicker: ABPickerRef); cdecl;
  external libAddressBook name _PU + 'ABPickerDeselectAll';

procedure ABPickerSetDelegate(inPicker: ABPickerRef; inDelegate: EventTargetRef); cdecl;
  external libAddressBook name _PU + 'ABPickerSetDelegate';

function ABPickerGetDelegate(inPicker: ABPickerRef): EventTargetRef; cdecl;
  external libAddressBook name _PU + 'ABPickerGetDelegate';

procedure ABPickerClearSearchField(inPicker: ABPickerRef); cdecl;
  external libAddressBook name _PU + 'ABPickerClearSearchField';

procedure ABPickerEditInAddressBook(inPicker: ABPickerRef); cdecl;
  external libAddressBook name _PU + 'ABPickerEditInAddressBook';

procedure ABPickerSelectInAddressBook(inPicker: ABPickerRef); cdecl;
  external libAddressBook name _PU + 'ABPickerSelectInAddressBook';

implementation

uses
  System.SysUtils;

var
  AddressBookModule: THandle;

function kABUIDProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABUIDProperty');
end;

function kABCreationDateProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABCreationDateProperty');
end;

function kABModificationDateProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABModificationDateProperty');
end;

function kABFirstNameProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABFirstNameProperty');
end;

function kABLastNameProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABLastNameProperty');
end;

function kABFirstNamePhoneticProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABFirstNamePhoneticProperty');
end;

function kABLastNamePhoneticProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABLastNamePhoneticProperty');
end;

function kABNicknameProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABNicknameProperty');
end;

function kABMaidenNameProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABMaidenNameProperty');
end;

function kABBirthdayProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABBirthdayProperty');
end;

function kABBirthdayComponentsProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABBirthdayComponentsProperty');
end;

function kABAlternateBirthdayComponentsProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABAlternateBirthdayComponentsProperty');
end;

function kABOrganizationProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABOrganizationProperty');
end;

function kABOrganizationPhoneticProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABOrganizationPhoneticProperty');
end;

function kABJobTitleProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABJobTitleProperty');
end;

function kABHomePageProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABHomePageProperty');
end;

function kABURLsProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABURLsProperty');
end;

function kABHomePageLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABHomePageLabel');
end;

function kABCalendarURIsProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABCalendarURIsProperty');
end;

function kABEmailProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABEmailProperty');
end;

function kABEmailWorkLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABEmailWorkLabel');
end;

function kABEmailHomeLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABEmailHomeLabel');
end;

function kABEmailMobileMeLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABEmailMobileMeLabel');
end;

function kABAddressProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABAddressProperty');
end;

function kABAddressStreetKey: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABAddressStreetKey');
end;

function kABAddressCityKey: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABAddressCityKey');
end;

function kABAddressStateKey: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABAddressStateKey');
end;

function kABAddressZIPKey: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABAddressZIPKey');
end;

function kABAddressCountryKey: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABAddressCountryKey');
end;

function kABAddressCountryCodeKey: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABAddressCountryCodeKey');
end;

function kABAddressHomeLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABAddressHomeLabel');
end;

function kABAddressWorkLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABAddressWorkLabel');
end;

function kABOtherDatesProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABOtherDatesProperty');
end;

function kABOtherDateComponentsProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABOtherDateComponentsProperty');
end;

function kABAnniversaryLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABAnniversaryLabel');
end;

function kABRelatedNamesProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABRelatedNamesProperty');
end;

function kABFatherLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABFatherLabel');
end;

function kABMotherLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABMotherLabel');
end;

function kABParentLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABParentLabel');
end;

function kABBrotherLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABBrotherLabel');
end;

function kABSisterLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABSisterLabel');
end;

function kABChildLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABChildLabel');
end;

function kABFriendLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABFriendLabel');
end;

function kABSpouseLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABSpouseLabel');
end;

function kABPartnerLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABPartnerLabel');
end;

function kABAssistantLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABAssistantLabel');
end;

function kABManagerLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABManagerLabel');
end;

function kABDepartmentProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABDepartmentProperty');
end;

function kABPersonFlags: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABPersonFlags');
end;

function kABPhoneProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABPhoneProperty');
end;

function kABPhoneWorkLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABPhoneWorkLabel');
end;

function kABPhoneHomeLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABPhoneHomeLabel');
end;

function kABPhoneiPhoneLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABPhoneiPhoneLabel');
end;

function kABPhoneMobileLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABPhoneMobileLabel');
end;

function kABPhoneMainLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABPhoneMainLabel');
end;

function kABPhoneHomeFAXLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABPhoneHomeFAXLabel');
end;

function kABPhoneWorkFAXLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABPhoneWorkFAXLabel');
end;

function kABPhonePagerLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABPhonePagerLabel');
end;

function kABAIMInstantProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABAIMInstantProperty');
end;

function kABAIMWorkLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABAIMWorkLabel');
end;

function kABAIMHomeLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABAIMHomeLabel');
end;

function kABAIMMobileMeLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABAIMMobileMeLabel');
end;

function kABJabberInstantProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABJabberInstantProperty');
end;

function kABJabberWorkLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABJabberWorkLabel');
end;

function kABJabberHomeLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABJabberHomeLabel');
end;

function kABMSNInstantProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABMSNInstantProperty');
end;

function kABMSNWorkLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABMSNWorkLabel');
end;

function kABMSNHomeLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABMSNHomeLabel');
end;

function kABYahooInstantProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABYahooInstantProperty');
end;

function kABYahooWorkLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABYahooWorkLabel');
end;

function kABYahooHomeLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABYahooHomeLabel');
end;

function kABICQInstantProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABICQInstantProperty');
end;

function kABICQWorkLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABICQWorkLabel');
end;

function kABICQHomeLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABICQHomeLabel');
end;

function kABInstantMessageProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABInstantMessageProperty');
end;

function kABInstantMessageUsernameKey: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABInstantMessageUsernameKey');
end;

function kABInstantMessageServiceKey: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABInstantMessageServiceKey');
end;

function kABInstantMessageServiceAIM: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABInstantMessageServiceAIM');
end;

function kABInstantMessageServiceFacebook: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABInstantMessageServiceFacebook');
end;

function kABInstantMessageServiceGaduGadu: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABInstantMessageServiceGaduGadu');
end;

function kABInstantMessageServiceGoogleTalk: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABInstantMessageServiceGoogleTalk');
end;

function kABInstantMessageServiceICQ: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABInstantMessageServiceICQ');
end;

function kABInstantMessageServiceJabber: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABInstantMessageServiceJabber');
end;

function kABInstantMessageServiceMSN: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABInstantMessageServiceMSN');
end;

function kABInstantMessageServiceQQ: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABInstantMessageServiceQQ');
end;

function kABInstantMessageServiceSkype: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABInstantMessageServiceSkype');
end;

function kABInstantMessageServiceYahoo: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABInstantMessageServiceYahoo');
end;

function kABSocialProfileProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABSocialProfileProperty');
end;

function kABSocialProfileURLKey: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABSocialProfileURLKey');
end;

function kABSocialProfileUsernameKey: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABSocialProfileUsernameKey');
end;

function kABSocialProfileUserIdentifierKey: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABSocialProfileUserIdentifierKey');
end;

function kABSocialProfileServiceKey: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABSocialProfileServiceKey');
end;

function kABSocialProfileServiceTwitter: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABSocialProfileServiceTwitter');
end;

function kABSocialProfileServiceFacebook: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABSocialProfileServiceFacebook');
end;

function kABSocialProfileServiceLinkedIn: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABSocialProfileServiceLinkedIn');
end;

function kABSocialProfileServiceFlickr: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABSocialProfileServiceFlickr');
end;

function kABSocialProfileServiceMySpace: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABSocialProfileServiceMySpace');
end;

function kABSocialProfileServiceSinaWeibo: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABSocialProfileServiceSinaWeibo');
end;

function kABSocialProfileServiceTencentWeibo: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABSocialProfileServiceTencentWeibo');
end;

function kABSocialProfileServiceYelp: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABSocialProfileServiceYelp');
end;

function kABNoteProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABNoteProperty');
end;

function kABMiddleNameProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABMiddleNameProperty');
end;

function kABMiddleNamePhoneticProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABMiddleNamePhoneticProperty');
end;

function kABTitleProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABTitleProperty');
end;

function kABSuffixProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABSuffixProperty');
end;

function kABGroupNameProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABGroupNameProperty');
end;

function kABWorkLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABWorkLabel');
end;

function kABHomeLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABHomeLabel');
end;

function kABOtherLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABOtherLabel');
end;

function kABMobileMeLabel: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABMobileMeLabel');
end;

function kABDatabaseChangedNotification: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABDatabaseChangedNotification');
end;

function kABDatabaseChangedExternallyNotification: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABDatabaseChangedExternallyNotification');
end;

function kABInsertedRecords: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABInsertedRecords');
end;

function kABUpdatedRecords: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABUpdatedRecords');
end;

function kABDeletedRecords: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'kABDeletedRecords');
end;

function ABAddressBookErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'ABAddressBookErrorDomain');
end;

function ABMultiValueIdentifiersErrorKey: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'ABMultiValueIdentifiersErrorKey');
end;

function ABPeoplePickerGroupSelectionDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'ABPeoplePickerGroupSelectionDidChangeNotification');
end;

function ABPeoplePickerNameSelectionDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'ABPeoplePickerNameSelectionDidChangeNotification');
end;

function ABPeoplePickerValueSelectionDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'ABPeoplePickerValueSelectionDidChangeNotification');
end;

function ABPeoplePickerDisplayedPropertyDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAddressBook, 'ABPeoplePickerDisplayedPropertyDidChangeNotification');
end;

initialization
  AddressBookModule := LoadLibrary(libAddressBook);

finalization
  if AddressBookModule <> 0 then
    FreeLibrary(AddressBookModule);

end.