{*******************************************************}
{                                                       }
{            CodeGear Delphi Runtime Library            }
{                                                       }
{ Copyright(c) 2010-2019 Embarcadero Technologies, Inc. }
{                  All rights reserved                  }
{                                                       }
{*******************************************************}

unit Macapi.Contacts;

interface

uses
  Macapi.ObjectiveC, Macapi.CocoaTypes, Macapi.CoreFoundation, Macapi.Foundation;

const
  CNContactTypePerson = 0;
  CNContactTypeOrganization = 1;
  CNContactSortOrderNone = 0;
  CNContactSortOrderUserDefault = 1;
  CNContactSortOrderGivenName = 2;
  CNContactSortOrderFamilyName = 3;
  CNContactFormatterStyleFullName = 0;
  CNContactFormatterStylePhoneticFullName = 1;
  CNContactDisplayNameOrderUserDefault = 0;
  CNContactDisplayNameOrderGivenNameFirst = 1;
  CNContactDisplayNameOrderFamilyNameFirst = 2;
  CNEntityTypeContacts = 0;
  CNAuthorizationStatusNotDetermined = 0;
  CNAuthorizationStatusRestricted = 1;
  CNAuthorizationStatusDenied = 2;
  CNAuthorizationStatusAuthorized = 3;
  CNContainerTypeUnassigned = 0;
  CNContainerTypeLocal = 1;
  CNContainerTypeExchange = 2;
  CNContainerTypeCardDAV = 3;
  CNErrorCodeCommunicationError = 1;
  CNErrorCodeDataAccessError = 2;
  CNErrorCodeAuthorizationDenied = 100;
  CNErrorCodeNoAccessableWritableContainers = 101;
  CNErrorCodeRecordDoesNotExist = 200;
  CNErrorCodeInsertedRecordAlreadyExists = 201;
  CNErrorCodeContainmentCycle = 202;
  CNErrorCodeContainmentScope = 203;
  CNErrorCodeParentRecordDoesNotExist = 204;
  CNErrorCodeRecordIdentifierInvalid = 205;
  CNErrorCodeValidationMultipleErrors = 300;
  CNErrorCodeValidationTypeMismatch = 301;
  CNErrorCodeValidationConfigurationError = 302;
  CNErrorCodePredicateInvalid = 400;
  CNErrorCodePolicyViolation = 500;
  CNErrorCodeClientIdentifierInvalid = 600;
  CNErrorCodeClientIdentifierDoesNotExist = 601;
  CNErrorCodeVCardMalformed = 700;
  CNErrorCodeVCardSummarizationError = 701;
  CNPostalAddressFormatterStyleMailingAddress = 0;

type
  CNLabeledValue = interface;
  CNPhoneNumber = interface;
  CNPostalAddress = interface;
  CNContactRelation = interface;
  CNSocialProfile = interface;
  CNInstantMessageAddress = interface;
  CNKeyDescriptor = interface;
  CNContact = interface;
  CNContactFetchRequest = interface;
  CNContactFormatter = interface;
  CNContactProperty = interface;
  CNContactStore = interface;
  CNContactsUserDefaults = interface;
  CNContactVCardSerialization = interface;
  CNContainer = interface;
  CNGroup = interface;
  CNMutableContact = interface;
  CNMutableGroup = interface;
  CNMutablePostalAddress = interface;
  CNPostalAddressFormatter = interface;
  CNSaveRequest = interface;

  PBoolean = ^Boolean;
  PNSError = ^NSError;
  CNContactType = NSInteger;
  CNContactSortOrder = NSInteger;
  CNContactFormatterStyle = NSInteger;
  CNContactDisplayNameOrder = NSInteger;
  CNEntityType = NSInteger;
  CNAuthorizationStatus = NSInteger;
  CNContainerType = NSInteger;
  CNErrorCode = NSInteger;
  CNPostalAddressFormatterStyle = NSInteger;
  TCNContactStoreBlockMethod1 = procedure(granted: Boolean; error: NSError) of object;
  TCNContactStoreBlockMethod2 = procedure(contact: CNContact; stop: PBoolean) of object;

  CNLabeledValueClass = interface(NSObjectClass)
    ['{0E0CBFBE-B856-40B0-A640-3D4AA0720A1A}']
    [MethodName('labeledValueWithLabel:value:')]
    {class} function labeledValueWithLabel(&label: NSString; value: Pointer): Pointer; cdecl;
    {class} function localizedStringForLabel(&label: NSString): NSString; cdecl;
  end;

  CNLabeledValue = interface(NSObject)
    ['{EE3B416C-26A3-41A7-8816-5D7053114CF8}']
    function &label: NSString; cdecl;
    function identifier: NSString; cdecl;
    [MethodName('initWithLabel:value:')]
    function initWithLabel(&label: NSString; value: Pointer): Pointer; cdecl;
    [MethodName('labeledValueBySettingLabel:value:')]
    function labeledValueBySettingLabel(&label: NSString; value: Pointer): Pointer; overload; cdecl;
    function labeledValueBySettingLabel(&label: NSString): Pointer; overload; cdecl;
    function labeledValueBySettingValue(value: Pointer): Pointer; cdecl;
    function value: Pointer; cdecl;
  end;
  TCNLabeledValue = class(TOCGenericImport<CNLabeledValueClass, CNLabeledValue>) end;

  CNPhoneNumberClass = interface(NSObjectClass)
    ['{ACBB42C5-8AFB-455A-BD14-B1A4DBB88FF0}']
    {class} function phoneNumberWithStringValue(stringValue: NSString): Pointer; cdecl;
  end;

  CNPhoneNumber = interface(NSObject)
    ['{A39E9674-C002-43BE-83BA-61804F42F248}']
    function initWithStringValue(&string: NSString): Pointer; cdecl;
    function stringValue: NSString; cdecl;
  end;
  TCNPhoneNumber = class(TOCGenericImport<CNPhoneNumberClass, CNPhoneNumber>) end;

  CNPostalAddressClass = interface(NSObjectClass)
    ['{854FF57F-2270-485E-BD34-9617738007EC}']
    {class} function localizedStringForKey(key: NSString): NSString; cdecl;
  end;

  CNPostalAddress = interface(NSObject)
    ['{E0DED357-C16E-4486-80A4-0986FF35D734}']
    function city: NSString; cdecl;
    function country: NSString; cdecl;
    function ISOCountryCode: NSString; cdecl;
    function postalCode: NSString; cdecl;
    function state: NSString; cdecl;
    function street: NSString; cdecl;
    function subAdministrativeArea: NSString; cdecl;
    function subLocality: NSString; cdecl;
  end;
  TCNPostalAddress = class(TOCGenericImport<CNPostalAddressClass, CNPostalAddress>) end;

  CNContactRelationClass = interface(NSObjectClass)
    ['{481A5779-0D6C-4020-AE6F-77F2A2EF3F26}']
    {class} function contactRelationWithName(name: NSString): Pointer; cdecl;
  end;

  CNContactRelation = interface(NSObject)
    ['{976715DD-EE25-40A9-A532-65B18900D55C}']
    function initWithName(name: NSString): Pointer; cdecl;
    function name: NSString; cdecl;
  end;
  TCNContactRelation = class(TOCGenericImport<CNContactRelationClass, CNContactRelation>) end;

  CNSocialProfileClass = interface(NSObjectClass)
    ['{3F529B67-0452-4B6D-9093-E47DB081633A}']
    {class} function localizedStringForKey(key: NSString): NSString; cdecl;
    {class} function localizedStringForService(service: NSString): NSString; cdecl;
  end;

  CNSocialProfile = interface(NSObject)
    ['{9A924840-5EA9-4162-88ED-C3F1B517CBAB}']
    [MethodName('initWithUrlString:username:userIdentifier:service:')]
    function initWithUrlString(urlString: NSString; username: NSString; userIdentifier: NSString; service: NSString): Pointer; cdecl;
    function service: NSString; cdecl;
    function urlString: NSString; cdecl;
    function userIdentifier: NSString; cdecl;
    function username: NSString; cdecl;
  end;
  TCNSocialProfile = class(TOCGenericImport<CNSocialProfileClass, CNSocialProfile>) end;

  CNInstantMessageAddressClass = interface(NSObjectClass)
    ['{FA386C97-AD32-45CF-8332-00547A1F429C}']
    {class} function localizedStringForKey(key: NSString): NSString; cdecl;
    {class} function localizedStringForService(service: NSString): NSString; cdecl;
  end;

  CNInstantMessageAddress = interface(NSObject)
    ['{23112777-8624-4B68-9B22-A5BD5D271A43}']
    [MethodName('initWithUsername:service:')]
    function initWithUsername(username: NSString; service: NSString): Pointer; cdecl;
    function service: NSString; cdecl;
    function username: NSString; cdecl;
  end;
  TCNInstantMessageAddress = class(TOCGenericImport<CNInstantMessageAddressClass, CNInstantMessageAddress>) end;

  CNKeyDescriptor = interface(IObjectiveC)
    ['{6F9C8246-5851-453C-88C1-C7DC8F3CA1AE}']
  end;

  CNContactClass = interface(NSObjectClass)
    ['{8AA9C465-F3F4-4485-A64F-38ED78A8BE58}']
    {class} function comparatorForNameSortOrder(sortOrder: CNContactSortOrder): NSComparator; cdecl;
    {class} function descriptorForAllComparatorKeys: Pointer; cdecl;
    {class} function localizedStringForKey(key: NSString): NSString; cdecl;
    {class} function predicateForContactsInContainerWithIdentifier(containerIdentifier: NSString): NSPredicate; cdecl;
    {class} function predicateForContactsInGroupWithIdentifier(groupIdentifier: NSString): NSPredicate; cdecl;
    {class} function predicateForContactsMatchingEmailAddress(emailAddress: NSString): NSPredicate; cdecl;
    {class} function predicateForContactsMatchingName(name: NSString): NSPredicate; cdecl;
    {class} function predicateForContactsMatchingPhoneNumber(phoneNumber: CNPhoneNumber): NSPredicate; cdecl;
    {class} function predicateForContactsWithIdentifiers(identifiers: NSArray): NSPredicate; cdecl;
  end;

  CNContact = interface(NSObject)
    ['{27493DAD-50D1-407F-B198-DBAB68DD8708}']
    function areKeysAvailable(keyDescriptors: NSArray): Boolean; cdecl;
    function birthday: NSDateComponents; cdecl;
    function contactRelations: NSArray; cdecl;
    function contactType: CNContactType; cdecl;
    function dates: NSArray; cdecl;
    function departmentName: NSString; cdecl;
    function emailAddresses: NSArray; cdecl;
    function familyName: NSString; cdecl;
    function givenName: NSString; cdecl;
    function identifier: NSString; cdecl;
    function imageData: NSData; cdecl;
    function imageDataAvailable: Boolean; cdecl;
    function instantMessageAddresses: NSArray; cdecl;
    function isKeyAvailable(key: NSString): Boolean; cdecl;
    function isUnifiedWithContactWithIdentifier(contactIdentifier: NSString): Boolean; cdecl;
    function jobTitle: NSString; cdecl;
    function middleName: NSString; cdecl;
    function namePrefix: NSString; cdecl;
    function nameSuffix: NSString; cdecl;
    function nickname: NSString; cdecl;
    function nonGregorianBirthday: NSDateComponents; cdecl;
    function note: NSString; cdecl;
    function organizationName: NSString; cdecl;
    function phoneNumbers: NSArray; cdecl;
    function phoneticFamilyName: NSString; cdecl;
    function phoneticGivenName: NSString; cdecl;
    function phoneticMiddleName: NSString; cdecl;
    function phoneticOrganizationName: NSString; cdecl;
    function postalAddresses: NSArray; cdecl;
    function previousFamilyName: NSString; cdecl;
    function socialProfiles: NSArray; cdecl;
    function thumbnailImageData: NSData; cdecl;
    function urlAddresses: NSArray; cdecl;
  end;
  TCNContact = class(TOCGenericImport<CNContactClass, CNContact>) end;

  CNContactFetchRequestClass = interface(NSObjectClass)
    ['{0DA70287-54C3-4DEB-AD1D-271992FBFD87}']
  end;

  CNContactFetchRequest = interface(NSObject)
    ['{849A5ABF-CED5-4157-8796-952B3BF5BDC9}']
    function initWithKeysToFetch(keysToFetch: NSArray): Pointer; cdecl;
    function keysToFetch: NSArray; cdecl;
    function mutableObjects: Boolean; cdecl;
    function predicate: NSPredicate; cdecl;
    procedure setKeysToFetch(keysToFetch: NSArray); cdecl;
    procedure setMutableObjects(mutableObjects: Boolean); cdecl;
    procedure setPredicate(predicate: NSPredicate); cdecl;
    procedure setSortOrder(sortOrder: CNContactSortOrder); cdecl;
    procedure setUnifyResults(unifyResults: Boolean); cdecl;
    function sortOrder: CNContactSortOrder; cdecl;
    function unifyResults: Boolean; cdecl;
  end;
  TCNContactFetchRequest = class(TOCGenericImport<CNContactFetchRequestClass, CNContactFetchRequest>) end;

  CNContactFormatterClass = interface(NSFormatterClass)
    ['{44DBEE1A-3662-4A6E-8231-26F64189C827}']
    [MethodName('attributedStringFromContact:style:defaultAttributes:')]
    {class} function attributedStringFromContact(contact: CNContact; style: CNContactFormatterStyle;
      attributes: NSDictionary): NSAttributedString; cdecl;
    {class} function delimiterForContact(contact: CNContact): NSString; cdecl;
    {class} function descriptorForRequiredKeysForStyle(style: CNContactFormatterStyle): Pointer; cdecl;
    {class} function nameOrderForContact(contact: CNContact): CNContactDisplayNameOrder; cdecl;
    [MethodName('stringFromContact:style:')]
    {class} function stringFromContact(contact: CNContact; style: CNContactFormatterStyle): NSString; cdecl;
  end;

  CNContactFormatter = interface(NSFormatter)
    ['{44EEE996-F2C2-46F1-88D2-733B02CD9714}']
    [MethodName('attributedStringFromContact:defaultAttributes:')]
    function attributedStringFromContact(contact: CNContact; attributes: NSDictionary): NSAttributedString; cdecl;
    procedure setStyle(style: CNContactFormatterStyle); cdecl;
    function stringFromContact(contact: CNContact): NSString; cdecl;
    function style: CNContactFormatterStyle; cdecl;
  end;
  TCNContactFormatter = class(TOCGenericImport<CNContactFormatterClass, CNContactFormatter>) end;

  CNContactPropertyClass = interface(NSObjectClass)
    ['{B749D7D6-9143-4EE5-9699-03A1BD946F1A}']
  end;

  CNContactProperty = interface(NSObject)
    ['{4270B1E8-B3DE-4BFA-A2ED-05E5FF1A2D0C}']
    function &label: NSString; cdecl;
    function contact: CNContact; cdecl;
    function identifier: NSString; cdecl;
    function key: NSString; cdecl;
    function value: Pointer; cdecl;
  end;
  TCNContactProperty = class(TOCGenericImport<CNContactPropertyClass, CNContactProperty>) end;

  CNContactStoreClass = interface(NSObjectClass)
    ['{EE9C1BF6-C5A8-497A-B4F5-16811A76997B}']
    {class} function authorizationStatusForEntityType(entityType: CNEntityType): CNAuthorizationStatus; cdecl;
  end;

  CNContactStore = interface(NSObject)
    ['{C26CB370-A85C-4495-A13B-B4B460971025}']
    [MethodName('containersMatchingPredicate:error:')]
    function containersMatchingPredicate(predicate: NSPredicate; error: PNSError): NSArray; cdecl;
    function defaultContainerIdentifier: NSString; cdecl;
    [MethodName('enumerateContactsWithFetchRequest:error:usingBlock:')]
    function enumerateContactsWithFetchRequest(fetchRequest: CNContactFetchRequest; error: PNSError;
      block: TCNContactStoreBlockMethod2): Boolean; cdecl;
    [MethodName('executeSaveRequest:error:')]
    function executeSaveRequest(saveRequest: CNSaveRequest; error: PNSError): Boolean; cdecl;
    [MethodName('groupsMatchingPredicate:error:')]
    function groupsMatchingPredicate(predicate: NSPredicate; error: PNSError): NSArray; cdecl;
    [MethodName('requestAccessForEntityType:completionHandler:')]
    procedure requestAccessForEntityType(entityType: CNEntityType; completionHandler: TCNContactStoreBlockMethod1); cdecl;
    [MethodName('unifiedContactsMatchingPredicate:keysToFetch:error:')]
    function unifiedContactsMatchingPredicate(predicate: NSPredicate; keys: NSArray; error: PNSError): NSArray; cdecl;
    [MethodName('unifiedContactWithIdentifier:keysToFetch:error:')]
    function unifiedContactWithIdentifier(identifier: NSString; keys: NSArray; error: PNSError): CNContact; cdecl;
    [MethodName('unifiedMeContactWithKeysToFetch:error:')]
    function unifiedMeContactWithKeysToFetch(keys: NSArray; error: PNSError): CNContact; cdecl;
  end;
  TCNContactStore = class(TOCGenericImport<CNContactStoreClass, CNContactStore>) end;

  CNContactsUserDefaultsClass = interface(NSObjectClass)
    ['{FE7DC2B4-1C2D-4098-887F-96CE91A0FCB0}']
    {class} function sharedDefaults: Pointer; cdecl;
  end;

  CNContactsUserDefaults = interface(NSObject)
    ['{54DBD64F-579C-44A3-AAA5-64B13ED39541}']
    function countryCode: NSString; cdecl;
    function sortOrder: CNContactSortOrder; cdecl;
  end;
  TCNContactsUserDefaults = class(TOCGenericImport<CNContactsUserDefaultsClass, CNContactsUserDefaults>) end;

  CNContactVCardSerializationClass = interface(NSObjectClass)
    ['{2453A3F3-9D53-4353-992B-83687E892360}']
    [MethodName('contactsWithData:error:')]
    {class} function contactsWithData(data: NSData; error: PNSError): NSArray; cdecl;
    [MethodName('dataWithContacts:error:')]
    {class} function dataWithContacts(contacts: NSArray; error: PNSError): NSData; cdecl;
    {class} function descriptorForRequiredKeys: Pointer; cdecl;
  end;

  CNContactVCardSerialization = interface(NSObject)
    ['{047A1850-15F6-4EDE-8A5E-1E753819ABBE}']
  end;
  TCNContactVCardSerialization = class(TOCGenericImport<CNContactVCardSerializationClass, CNContactVCardSerialization>) end;

  CNContainerClass = interface(NSObjectClass)
    ['{FF230D28-FDC6-4FAC-B3DC-FDFCC571FD71}']
    {class} function predicateForContainerOfContactWithIdentifier(contactIdentifier: NSString): NSPredicate; cdecl;
    {class} function predicateForContainerOfGroupWithIdentifier(groupIdentifier: NSString): NSPredicate; cdecl;
    {class} function predicateForContainersWithIdentifiers(identifiers: NSArray): NSPredicate; cdecl;
  end;

  CNContainer = interface(NSObject)
    ['{DFF6A186-2701-44A5-9243-47F2BC725089}']
    function &type: CNContainerType; cdecl;
    function identifier: NSString; cdecl;
    function name: NSString; cdecl;
  end;
  TCNContainer = class(TOCGenericImport<CNContainerClass, CNContainer>) end;

  CNGroupClass = interface(NSObjectClass)
    ['{5C24CAC3-B839-458B-9371-2113E35E78EB}']
    {class} function predicateForGroupsInContainerWithIdentifier(containerIdentifier: NSString): NSPredicate; cdecl;
    {class} function predicateForGroupsWithIdentifiers(identifiers: NSArray): NSPredicate; cdecl;
    {class} function predicateForSubgroupsInGroupWithIdentifier(parentGroupIdentifier: NSString): NSPredicate; cdecl;
  end;

  CNGroup = interface(NSObject)
    ['{56B893EB-3F2C-4E3F-926A-8D284A4A4271}']
    function identifier: NSString; cdecl;
    function name: NSString; cdecl;
  end;
  TCNGroup = class(TOCGenericImport<CNGroupClass, CNGroup>) end;

  CNMutableContactClass = interface(CNContactClass)
    ['{A6243703-AC83-41FE-8B6C-07334F564CEC}']
  end;

  CNMutableContact = interface(CNContact)
    ['{C2682D9A-F48E-46F6-A1A1-50B391841727}']
    function birthday: NSDateComponents; cdecl;
    function contactRelations: NSArray; cdecl;
    function contactType: CNContactType; cdecl;
    function dates: NSArray; cdecl;
    function departmentName: NSString; cdecl;
    function emailAddresses: NSArray; cdecl;
    function familyName: NSString; cdecl;
    function givenName: NSString; cdecl;
    function imageData: NSData; cdecl;
    function instantMessageAddresses: NSArray; cdecl;
    function jobTitle: NSString; cdecl;
    function middleName: NSString; cdecl;
    function namePrefix: NSString; cdecl;
    function nameSuffix: NSString; cdecl;
    function nickname: NSString; cdecl;
    function nonGregorianBirthday: NSDateComponents; cdecl;
    function note: NSString; cdecl;
    function organizationName: NSString; cdecl;
    function phoneNumbers: NSArray; cdecl;
    function phoneticFamilyName: NSString; cdecl;
    function phoneticGivenName: NSString; cdecl;
    function phoneticMiddleName: NSString; cdecl;
    function phoneticOrganizationName: NSString; cdecl;
    function postalAddresses: NSArray; cdecl;
    function previousFamilyName: NSString; cdecl;
    procedure setBirthday(birthday: NSDateComponents); cdecl;
    procedure setContactRelations(contactRelations: NSArray); cdecl;
    procedure setContactType(contactType: CNContactType); cdecl;
    procedure setDates(dates: NSArray); cdecl;
    procedure setDepartmentName(departmentName: NSString); cdecl;
    procedure setEmailAddresses(emailAddresses: NSArray); cdecl;
    procedure setFamilyName(familyName: NSString); cdecl;
    procedure setGivenName(givenName: NSString); cdecl;
    procedure setImageData(imageData: NSData); cdecl;
    procedure setInstantMessageAddresses(instantMessageAddresses: NSArray); cdecl;
    procedure setJobTitle(jobTitle: NSString); cdecl;
    procedure setMiddleName(middleName: NSString); cdecl;
    procedure setNamePrefix(namePrefix: NSString); cdecl;
    procedure setNameSuffix(nameSuffix: NSString); cdecl;
    procedure setNickname(nickname: NSString); cdecl;
    procedure setNonGregorianBirthday(nonGregorianBirthday: NSDateComponents); cdecl;
    procedure setNote(note: NSString); cdecl;
    procedure setOrganizationName(organizationName: NSString); cdecl;
    procedure setPhoneNumbers(phoneNumbers: NSArray); cdecl;
    procedure setPhoneticFamilyName(phoneticFamilyName: NSString); cdecl;
    procedure setPhoneticGivenName(phoneticGivenName: NSString); cdecl;
    procedure setPhoneticMiddleName(phoneticMiddleName: NSString); cdecl;
    procedure setPhoneticOrganizationName(phoneticOrganizationName: NSString); cdecl;
    procedure setPostalAddresses(postalAddresses: NSArray); cdecl;
    procedure setPreviousFamilyName(previousFamilyName: NSString); cdecl;
    procedure setSocialProfiles(socialProfiles: NSArray); cdecl;
    procedure setUrlAddresses(urlAddresses: NSArray); cdecl;
    function socialProfiles: NSArray; cdecl;
    function urlAddresses: NSArray; cdecl;
  end;
  TCNMutableContact = class(TOCGenericImport<CNMutableContactClass, CNMutableContact>) end;

  CNMutableGroupClass = interface(CNGroupClass)
    ['{D9F650AD-A1CE-4A43-9717-D687699FE264}']
  end;

  CNMutableGroup = interface(CNGroup)
    ['{23EF12CE-DCE7-40C2-B256-FA345614F1B2}']
    function name: NSString; cdecl;
    procedure setName(name: NSString); cdecl;
  end;
  TCNMutableGroup = class(TOCGenericImport<CNMutableGroupClass, CNMutableGroup>) end;

  CNMutablePostalAddressClass = interface(CNPostalAddressClass)
    ['{7B3E3A4F-6DA7-484A-9D63-286D8F7F9255}']
  end;

  CNMutablePostalAddress = interface(CNPostalAddress)
    ['{950876DF-C601-4835-A3AB-77C6ED76DBD3}']
    function city: NSString; cdecl;
    function country: NSString; cdecl;
    function ISOCountryCode: NSString; cdecl;
    function postalCode: NSString; cdecl;
    procedure setCity(city: NSString); cdecl;
    procedure setCountry(country: NSString); cdecl;
    procedure setISOCountryCode(ISOCountryCode: NSString); cdecl;
    procedure setPostalCode(postalCode: NSString); cdecl;
    procedure setState(state: NSString); cdecl;
    procedure setStreet(street: NSString); cdecl;
    procedure setSubAdministrativeArea(subAdministrativeArea: NSString); cdecl;
    procedure setSubLocality(subLocality: NSString); cdecl;
    function state: NSString; cdecl;
    function street: NSString; cdecl;
    function subAdministrativeArea: NSString; cdecl;
    function subLocality: NSString; cdecl;
  end;
  TCNMutablePostalAddress = class(TOCGenericImport<CNMutablePostalAddressClass, CNMutablePostalAddress>) end;

  CNPostalAddressFormatterClass = interface(NSFormatterClass)
    ['{23628B0D-87C5-42B4-925F-F1B658B85D1C}']
    [MethodName('attributedStringFromPostalAddress:style:withDefaultAttributes:')]
    {class} function attributedStringFromPostalAddress(postalAddress: CNPostalAddress; style: CNPostalAddressFormatterStyle;
      attributes: NSDictionary): NSAttributedString; cdecl;
    [MethodName('stringFromPostalAddress:style:')]
    {class} function stringFromPostalAddress(postalAddress: CNPostalAddress; style: CNPostalAddressFormatterStyle): NSString; cdecl;
  end;

  CNPostalAddressFormatter = interface(NSFormatter)
    ['{F08F2985-B49E-4E73-97F6-4D6AB9407BFC}']
    [MethodName('attributedStringFromPostalAddress:withDefaultAttributes:')]
    function attributedStringFromPostalAddress(postalAddress: CNPostalAddress; attributes: NSDictionary): NSAttributedString; cdecl;
    procedure setStyle(style: CNPostalAddressFormatterStyle); cdecl;
    function stringFromPostalAddress(postalAddress: CNPostalAddress): NSString; cdecl;
    function style: CNPostalAddressFormatterStyle; cdecl;
  end;
  TCNPostalAddressFormatter = class(TOCGenericImport<CNPostalAddressFormatterClass, CNPostalAddressFormatter>) end;

  CNSaveRequestClass = interface(NSObjectClass)
    ['{17C6A1D1-2A12-45CF-9DF3-C9DF691CEA6D}']
  end;

  CNSaveRequest = interface(NSObject)
    ['{F0015D91-67D0-412D-BC68-8C3BA7E82521}']
    [MethodName('addContact:toContainerWithIdentifier:')]
    procedure addContact(contact: CNMutableContact; identifier: NSString); cdecl;
    [MethodName('addGroup:toContainerWithIdentifier:')]
    procedure addGroup(group: CNMutableGroup; identifier: NSString); cdecl;
    [MethodName('addMember:toGroup:')]
    procedure addMember(contact: CNContact; group: CNGroup); cdecl;
    [MethodName('addSubgroup:toGroup:')]
    procedure addSubgroup(subgroup: CNGroup; group: CNGroup); cdecl;
    procedure deleteContact(contact: CNMutableContact); cdecl;
    procedure deleteGroup(group: CNMutableGroup); cdecl;
    [MethodName('removeMember:fromGroup:')]
    procedure removeMember(contact: CNContact; group: CNGroup); cdecl;
    [MethodName('removeSubgroup:fromGroup:')]
    procedure removeSubgroup(subgroup: CNGroup; group: CNGroup); cdecl;
    procedure updateContact(contact: CNMutableContact); cdecl;
    procedure updateGroup(group: CNMutableGroup); cdecl;
  end;
  TCNSaveRequest = class(TOCGenericImport<CNSaveRequestClass, CNSaveRequest>) end;

function CNLabelHome: NSString;
function CNLabelWork: NSString;
function CNLabelOther: NSString;
function CNLabelEmailiCloud: NSString;
function CNLabelURLAddressHomePage: NSString;
function CNLabelDateAnniversary: NSString;
function CNLabelPhoneNumberiPhone: NSString;
function CNLabelPhoneNumberMobile: NSString;
function CNLabelPhoneNumberMain: NSString;
function CNLabelPhoneNumberHomeFax: NSString;
function CNLabelPhoneNumberWorkFax: NSString;
function CNLabelPhoneNumberOtherFax: NSString;
function CNLabelPhoneNumberPager: NSString;
function CNPostalAddressStreetKey: NSString;
function CNPostalAddressSubLocalityKey: NSString;
function CNPostalAddressCityKey: NSString;
function CNPostalAddressSubAdministrativeAreaKey: NSString;
function CNPostalAddressStateKey: NSString;
function CNPostalAddressPostalCodeKey: NSString;
function CNPostalAddressCountryKey: NSString;
function CNPostalAddressISOCountryCodeKey: NSString;
function CNLabelContactRelationFather: NSString;
function CNLabelContactRelationMother: NSString;
function CNLabelContactRelationParent: NSString;
function CNLabelContactRelationBrother: NSString;
function CNLabelContactRelationSister: NSString;
function CNLabelContactRelationSon: NSString;
function CNLabelContactRelationDaughter: NSString;
function CNLabelContactRelationChild: NSString;
function CNLabelContactRelationFriend: NSString;
function CNLabelContactRelationSpouse: NSString;
function CNLabelContactRelationPartner: NSString;
function CNLabelContactRelationAssistant: NSString;
function CNLabelContactRelationManager: NSString;
function CNSocialProfileURLStringKey: NSString;
function CNSocialProfileUsernameKey: NSString;
function CNSocialProfileUserIdentifierKey: NSString;
function CNSocialProfileServiceKey: NSString;
function CNSocialProfileServiceFacebook: NSString;
function CNSocialProfileServiceFlickr: NSString;
function CNSocialProfileServiceLinkedIn: NSString;
function CNSocialProfileServiceMySpace: NSString;
function CNSocialProfileServiceSinaWeibo: NSString;
function CNSocialProfileServiceTencentWeibo: NSString;
function CNSocialProfileServiceTwitter: NSString;
function CNSocialProfileServiceYelp: NSString;
function CNSocialProfileServiceGameCenter: NSString;
function CNInstantMessageAddressUsernameKey: NSString;
function CNInstantMessageAddressServiceKey: NSString;
function CNInstantMessageServiceAIM: NSString;
function CNInstantMessageServiceFacebook: NSString;
function CNInstantMessageServiceGaduGadu: NSString;
function CNInstantMessageServiceGoogleTalk: NSString;
function CNInstantMessageServiceICQ: NSString;
function CNInstantMessageServiceJabber: NSString;
function CNInstantMessageServiceMSN: NSString;
function CNInstantMessageServiceQQ: NSString;
function CNInstantMessageServiceSkype: NSString;
function CNInstantMessageServiceYahoo: NSString;
function CNContactPropertyNotFetchedExceptionName: NSString;
function CNContactIdentifierKey: NSString;
function CNContactNamePrefixKey: NSString;
function CNContactGivenNameKey: NSString;
function CNContactMiddleNameKey: NSString;
function CNContactFamilyNameKey: NSString;
function CNContactPreviousFamilyNameKey: NSString;
function CNContactNameSuffixKey: NSString;
function CNContactNicknameKey: NSString;
function CNContactOrganizationNameKey: NSString;
function CNContactDepartmentNameKey: NSString;
function CNContactJobTitleKey: NSString;
function CNContactPhoneticGivenNameKey: NSString;
function CNContactPhoneticMiddleNameKey: NSString;
function CNContactPhoneticFamilyNameKey: NSString;
function CNContactPhoneticOrganizationNameKey: NSString;
function CNContactBirthdayKey: NSString;
function CNContactNonGregorianBirthdayKey: NSString;
function CNContactNoteKey: NSString;
function CNContactImageDataKey: NSString;
function CNContactThumbnailImageDataKey: NSString;
function CNContactImageDataAvailableKey: NSString;
function CNContactTypeKey: NSString;
function CNContactPhoneNumbersKey: NSString;
function CNContactEmailAddressesKey: NSString;
function CNContactPostalAddressesKey: NSString;
function CNContactDatesKey: NSString;
function CNContactUrlAddressesKey: NSString;
function CNContactRelationsKey: NSString;
function CNContactSocialProfilesKey: NSString;
function CNContactInstantMessageAddressesKey: NSString;
function CNContactPropertyAttribute: NSString;
function CNContactStoreDidChangeNotification: NSString;
function CNContainerIdentifierKey: NSString;
function CNContainerNameKey: NSString;
function CNContainerTypeKey: NSString;
function CNErrorDomain: NSString;
function CNErrorUserInfoAffectedRecordsKey: NSString;
function CNErrorUserInfoAffectedRecordIdentifiersKey: NSString;
function CNErrorUserInfoValidationErrorsKey: NSString;
function CNErrorUserInfoKeyPathsKey: NSString;
function CNGroupIdentifierKey: NSString;
function CNGroupNameKey: NSString;
function CNPostalAddressPropertyAttribute: NSString;
function CNPostalAddressLocalizedPropertyNameAttribute: NSString;

const
  libContacts = '/System/Library/Frameworks/Contacts.framework/Contacts';

implementation

uses
  System.SysUtils;

var
  ContactsModule: THandle;

function CNLabelHome: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelHome');
end;

function CNLabelWork: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelWork');
end;

function CNLabelOther: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelOther');
end;

function CNLabelEmailiCloud: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelEmailiCloud');
end;

function CNLabelURLAddressHomePage: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelURLAddressHomePage');
end;

function CNLabelDateAnniversary: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelDateAnniversary');
end;

function CNLabelPhoneNumberiPhone: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelPhoneNumberiPhone');
end;

function CNLabelPhoneNumberMobile: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelPhoneNumberMobile');
end;

function CNLabelPhoneNumberMain: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelPhoneNumberMain');
end;

function CNLabelPhoneNumberHomeFax: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelPhoneNumberHomeFax');
end;

function CNLabelPhoneNumberWorkFax: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelPhoneNumberWorkFax');
end;

function CNLabelPhoneNumberOtherFax: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelPhoneNumberOtherFax');
end;

function CNLabelPhoneNumberPager: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelPhoneNumberPager');
end;

function CNPostalAddressStreetKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNPostalAddressStreetKey');
end;

function CNPostalAddressSubLocalityKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNPostalAddressSubLocalityKey');
end;

function CNPostalAddressCityKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNPostalAddressCityKey');
end;

function CNPostalAddressSubAdministrativeAreaKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNPostalAddressSubAdministrativeAreaKey');
end;

function CNPostalAddressStateKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNPostalAddressStateKey');
end;

function CNPostalAddressPostalCodeKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNPostalAddressPostalCodeKey');
end;

function CNPostalAddressCountryKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNPostalAddressCountryKey');
end;

function CNPostalAddressISOCountryCodeKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNPostalAddressISOCountryCodeKey');
end;

function CNLabelContactRelationFather: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationFather');
end;

function CNLabelContactRelationMother: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationMother');
end;

function CNLabelContactRelationParent: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationParent');
end;

function CNLabelContactRelationBrother: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationBrother');
end;

function CNLabelContactRelationSister: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationSister');
end;

function CNLabelContactRelationSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationSon');
end;

function CNLabelContactRelationDaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationDaughter');
end;

function CNLabelContactRelationChild: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationChild');
end;

function CNLabelContactRelationFriend: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationFriend');
end;

function CNLabelContactRelationSpouse: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationSpouse');
end;

function CNLabelContactRelationPartner: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationPartner');
end;

function CNLabelContactRelationAssistant: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationAssistant');
end;

function CNLabelContactRelationManager: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationManager');
end;

function CNSocialProfileURLStringKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileURLStringKey');
end;

function CNSocialProfileUsernameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileUsernameKey');
end;

function CNSocialProfileUserIdentifierKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileUserIdentifierKey');
end;

function CNSocialProfileServiceKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileServiceKey');
end;

function CNSocialProfileServiceFacebook: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileServiceFacebook');
end;

function CNSocialProfileServiceFlickr: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileServiceFlickr');
end;

function CNSocialProfileServiceLinkedIn: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileServiceLinkedIn');
end;

function CNSocialProfileServiceMySpace: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileServiceMySpace');
end;

function CNSocialProfileServiceSinaWeibo: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileServiceSinaWeibo');
end;

function CNSocialProfileServiceTencentWeibo: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileServiceTencentWeibo');
end;

function CNSocialProfileServiceTwitter: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileServiceTwitter');
end;

function CNSocialProfileServiceYelp: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileServiceYelp');
end;

function CNSocialProfileServiceGameCenter: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileServiceGameCenter');
end;

function CNInstantMessageAddressUsernameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNInstantMessageAddressUsernameKey');
end;

function CNInstantMessageAddressServiceKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNInstantMessageAddressServiceKey');
end;

function CNInstantMessageServiceAIM: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNInstantMessageServiceAIM');
end;

function CNInstantMessageServiceFacebook: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNInstantMessageServiceFacebook');
end;

function CNInstantMessageServiceGaduGadu: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNInstantMessageServiceGaduGadu');
end;

function CNInstantMessageServiceGoogleTalk: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNInstantMessageServiceGoogleTalk');
end;

function CNInstantMessageServiceICQ: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNInstantMessageServiceICQ');
end;

function CNInstantMessageServiceJabber: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNInstantMessageServiceJabber');
end;

function CNInstantMessageServiceMSN: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNInstantMessageServiceMSN');
end;

function CNInstantMessageServiceQQ: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNInstantMessageServiceQQ');
end;

function CNInstantMessageServiceSkype: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNInstantMessageServiceSkype');
end;

function CNInstantMessageServiceYahoo: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNInstantMessageServiceYahoo');
end;

function CNContactPropertyNotFetchedExceptionName: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactPropertyNotFetchedExceptionName');
end;

function CNContactIdentifierKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactIdentifierKey');
end;

function CNContactNamePrefixKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactNamePrefixKey');
end;

function CNContactGivenNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactGivenNameKey');
end;

function CNContactMiddleNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactMiddleNameKey');
end;

function CNContactFamilyNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactFamilyNameKey');
end;

function CNContactPreviousFamilyNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactPreviousFamilyNameKey');
end;

function CNContactNameSuffixKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactNameSuffixKey');
end;

function CNContactNicknameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactNicknameKey');
end;

function CNContactOrganizationNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactOrganizationNameKey');
end;

function CNContactDepartmentNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactDepartmentNameKey');
end;

function CNContactJobTitleKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactJobTitleKey');
end;

function CNContactPhoneticGivenNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactPhoneticGivenNameKey');
end;

function CNContactPhoneticMiddleNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactPhoneticMiddleNameKey');
end;

function CNContactPhoneticFamilyNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactPhoneticFamilyNameKey');
end;

function CNContactPhoneticOrganizationNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactPhoneticOrganizationNameKey');
end;

function CNContactBirthdayKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactBirthdayKey');
end;

function CNContactNonGregorianBirthdayKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactNonGregorianBirthdayKey');
end;

function CNContactNoteKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactNoteKey');
end;

function CNContactImageDataKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactImageDataKey');
end;

function CNContactThumbnailImageDataKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactThumbnailImageDataKey');
end;

function CNContactImageDataAvailableKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactImageDataAvailableKey');
end;

function CNContactTypeKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactTypeKey');
end;

function CNContactPhoneNumbersKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactPhoneNumbersKey');
end;

function CNContactEmailAddressesKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactEmailAddressesKey');
end;

function CNContactPostalAddressesKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactPostalAddressesKey');
end;

function CNContactDatesKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactDatesKey');
end;

function CNContactUrlAddressesKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactUrlAddressesKey');
end;

function CNContactRelationsKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactRelationsKey');
end;

function CNContactSocialProfilesKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactSocialProfilesKey');
end;

function CNContactInstantMessageAddressesKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactInstantMessageAddressesKey');
end;

function CNContactPropertyAttribute: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactPropertyAttribute');
end;

function CNContactStoreDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactStoreDidChangeNotification');
end;

function CNContainerIdentifierKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContainerIdentifierKey');
end;

function CNContainerNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContainerNameKey');
end;

function CNContainerTypeKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContainerTypeKey');
end;

function CNErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNErrorDomain');
end;

function CNErrorUserInfoAffectedRecordsKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNErrorUserInfoAffectedRecordsKey');
end;

function CNErrorUserInfoAffectedRecordIdentifiersKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNErrorUserInfoAffectedRecordIdentifiersKey');
end;

function CNErrorUserInfoValidationErrorsKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNErrorUserInfoValidationErrorsKey');
end;

function CNErrorUserInfoKeyPathsKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNErrorUserInfoKeyPathsKey');
end;

function CNGroupIdentifierKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNGroupIdentifierKey');
end;

function CNGroupNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNGroupNameKey');
end;

function CNPostalAddressPropertyAttribute: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNPostalAddressPropertyAttribute');
end;

function CNPostalAddressLocalizedPropertyNameAttribute: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNPostalAddressLocalizedPropertyNameAttribute');
end;

initialization
  ContactsModule := LoadLibrary(libContacts);

finalization
  if ContactsModule <> 0 then
    FreeLibrary(ContactsModule);

end.