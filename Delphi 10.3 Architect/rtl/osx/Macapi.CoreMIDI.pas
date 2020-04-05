{*******************************************************}
{                                                       }
{            CodeGear Delphi Runtime Library            }
{                                                       }
{ Copyright(c) 2010-2019 Embarcadero Technologies, Inc. }
{                  All rights reserved                  }
{                                                       }
{*******************************************************}

unit Macapi.CoreMIDI;

interface

uses
  Macapi.ObjectiveC, Macapi.CocoaTypes, Macapi.CoreFoundation, Macapi.Foundation, Macapi.CoreGraphics, Macapi.CoreServices;

const
  kMIDIInvalidClient = -10830;
  kMIDIInvalidPort = -10831;
  kMIDIWrongEndpointType = -10832;
  kMIDINoConnection = -10833;
  kMIDIUnknownEndpoint = -10834;
  kMIDIUnknownProperty = -10835;
  kMIDIWrongPropertyType = -10836;
  kMIDINoCurrentSetup = -10837;
  kMIDIMessageSendErr = -10838;
  kMIDIServerStartErr = -10839;
  kMIDISetupFormatErr = -10840;
  kMIDIWrongThread = -10841;
  kMIDIObjectNotFound = -10842;
  kMIDIIDNotUnique = -10843;
  kMIDINotPermitted = -10844;
  kMIDIUnknownError = -10845;
  kMIDIObjectType_Other = -1;
  kMIDIObjectType_Device = 0;
  kMIDIObjectType_Entity = 1;
  kMIDIObjectType_Source = 2;
  kMIDIObjectType_Destination = 3;
  kMIDIObjectType_ExternalDevice = 16;
  kMIDIObjectType_ExternalEntity = 17;
  kMIDIObjectType_ExternalSource = 18;
  kMIDIObjectType_ExternalDestination = 19;
  kMIDIInvalidUniqueID = 0;
  kMIDIMsgSetupChanged = 1;
  kMIDIMsgObjectAdded = 2;
  kMIDIMsgObjectRemoved = 3;
  kMIDIMsgPropertyChanged = 4;
  kMIDIMsgThruConnectionsChanged = 5;
  kMIDIMsgSerialPortOwnerChanged = 6;
  kMIDIMsgIOError = 7;
  kMIDITransform_None = 0;
  kMIDITransform_FilterOut = 1;
  kMIDITransform_MapControl = 2;
  kMIDITransform_Add = 8;
  kMIDITransform_Scale = 9;
  kMIDITransform_MinValue = 10;
  kMIDITransform_MaxValue = 11;
  kMIDITransform_MapValue = 12;
  kMIDIThruConnection_MaxEndpoints = 8;
  kMIDIControlType_7Bit = 0;
  kMIDIControlType_14Bit = 1;
  kMIDIControlType_7BitRPN = 2;
  kMIDIControlType_14BitRPN = 3;
  kMIDIControlType_7BitNRPN = 4;
  kMIDIControlType_14BitNRPN = 5;
  MIDINetworkConnectionPolicy_NoOne = 0;
  MIDINetworkConnectionPolicy_HostsInContactList = 1;
  MIDINetworkConnectionPolicy_Anyone = 2;

type
  MIDICIProfile = interface;
  MIDICIProfileState = interface;
  MIDICISession = interface;
  MIDINetworkHost = interface;
  MIDINetworkConnection = interface;
  MIDINetworkSession = interface;

  PMIDIPacket = ^MIDIPacket;
  PMIDIPacketList = ^MIDIPacketList;
  PMIDISysexSendRequest = ^MIDISysexSendRequest;
  PMIDINotification = ^MIDINotification;
  PMIDIObjectAddRemoveNotification = ^MIDIObjectAddRemoveNotification;
  PMIDIObjectPropertyChangeNotification = ^MIDIObjectPropertyChangeNotification;
  PMIDIIOErrorNotification = ^MIDIIOErrorNotification;
  PMIDIValueMap = ^MIDIValueMap;
  PMIDITransform = ^MIDITransform;
  PMIDIControlTransform = ^MIDIControlTransform;
  PMIDIThruConnectionEndpoint = ^MIDIThruConnectionEndpoint;
  PMIDIThruConnectionParams = ^MIDIThruConnectionParams;
  PMIDIDriverInterface = ^MIDIDriverInterface;
  PMIDICIDeviceIdentification = ^MIDICIDeviceIdentification;
  PPMIDIDriverInterface = ^PMIDIDriverInterface;
  PNSError = ^NSError;
  PMIDIObjectType = ^MIDIObjectType;

  MIDIObjectRef = UInt32;
  PMIDIObjectRef = ^MIDIObjectRef;
  MIDIClientRef = MIDIObjectRef;
  PMIDIClientRef = ^MIDIClientRef;
  MIDIPortRef = MIDIObjectRef;
  PMIDIPortRef = ^MIDIPortRef;
  MIDIDeviceRef = MIDIObjectRef;
  PMIDIDeviceRef = ^MIDIDeviceRef;
  MIDIEntityRef = MIDIObjectRef;
  PMIDIEntityRef = ^MIDIEntityRef;
  MIDIEndpointRef = MIDIObjectRef;
  PMIDIEndpointRef = ^MIDIEndpointRef;
  MIDITimeStamp = UInt64;
  MIDIObjectType = NSInteger;
  MIDIUniqueID = SInt32;

  MIDINotifyProc = procedure(message: PMIDINotification; refCon: Pointer); cdecl;

  MIDINotifyBlock = procedure(message: PMIDINotification) of object;

  MIDIReadProc = procedure(pktlist: PMIDIPacketList; readProcRefCon: Pointer; srcConnRefCon: Pointer); cdecl;

  MIDIReadBlock = procedure(pktlist: PMIDIPacketList; srcConnRefCon: Pointer) of object;

  MIDICompletionProc = procedure(request: PMIDISysexSendRequest); cdecl;

  MIDIPacket = record
    timeStamp: MIDITimeStamp;
    length: UInt16;
    data: array [0..255] of &Byte;
  end;

  MIDIPacketList = record
    numPackets: UInt32;
    packet: array [0..0] of MIDIPacket;
  end;

  MIDISysexSendRequest = record
    destination: MIDIEndpointRef;
    data: PByte;
    bytesToSend: UInt32;
    complete: Boolean;
    reserved: array [0..2] of &Byte;
    completionProc: MIDICompletionProc;
    completionRefCon: Pointer;
  end;

  MIDINotificationMessageID = NSInteger;

  MIDINotification = record
    messageID: MIDINotificationMessageID;
    messageSize: UInt32;
  end;

  MIDIObjectAddRemoveNotification = record
    messageID: MIDINotificationMessageID;
    messageSize: UInt32;
    parent: MIDIObjectRef;
    parentType: MIDIObjectType;
    child: MIDIObjectRef;
    childType: MIDIObjectType;
  end;

  MIDIObjectPropertyChangeNotification = record
    messageID: MIDINotificationMessageID;
    messageSize: UInt32;
    &object: MIDIObjectRef;
    objectType: MIDIObjectType;
    propertyName: CFStringRef;
  end;

  MIDIIOErrorNotification = record
    messageID: MIDINotificationMessageID;
    messageSize: UInt32;
    driverDevice: MIDIDeviceRef;
    errorCode: OSStatus;
  end;

  MIDISetupRef = MIDIObjectRef;
  PMIDISetupRef = ^MIDISetupRef;
  MIDIThruConnectionRef = MIDIObjectRef;
  PMIDIThruConnectionRef = ^MIDIThruConnectionRef;

  MIDIValueMap = record
    value: array [0..127] of UInt8;
  end;

  MIDITransformType = NSInteger;
  MIDITransformControlType = NSInteger;

  MIDITransform = record
    transform: MIDITransformType;
    param: SInt16;
  end;

  MIDIControlTransform = record
    controlType: MIDITransformControlType;
    remappedControlType: MIDITransformControlType;
    controlNumber: UInt16;
    transform: MIDITransformType;
    param: SInt16;
  end;

  MIDIThruConnectionEndpoint = record
    endpointRef: MIDIEndpointRef;
    uniqueID: MIDIUniqueID;
  end;

  MIDIThruConnectionParams = record
    version: UInt32;
    numSources: UInt32;
    sources: array [0..7] of MIDIThruConnectionEndpoint;
    numDestinations: UInt32;
    destinations: array [0..7] of MIDIThruConnectionEndpoint;
    channelMap: array [0..15] of UInt8;
    lowVelocity: UInt8;
    highVelocity: UInt8;
    lowNote: UInt8;
    highNote: UInt8;
    noteNumber: MIDITransform;
    velocity: MIDITransform;
    keyPressure: MIDITransform;
    channelPressure: MIDITransform;
    programChange: MIDITransform;
    pitchBend: MIDITransform;
    filterOutSysEx: UInt8;
    filterOutMTC: UInt8;
    filterOutBeatClock: UInt8;
    filterOutTuneRequest: UInt8;
    reserved2: array [0..2] of UInt8;
    filterOutAllControls: UInt8;
    numControlTransforms: UInt16;
    numMaps: UInt16;
    reserved3: array [0..3] of UInt16;
  end;

  MIDIDriverRef = PPMIDIDriverInterface;
  MIDIDeviceListRef = MIDIObjectRef;

  MIDIDriverInterface = record
    _reserved: Pointer;
    QueryInterface: function(thisPointer: Pointer; iid: CFUUIDRef; ppv: PPointer): HRESULT; cdecl;
    AddRef: function(thisPointer: Pointer): UInt32; cdecl;
    Release: function(thisPointer: Pointer): UInt32; cdecl;
    FindDevices: function(self: MIDIDriverRef; devList: MIDIDeviceListRef): OSStatus; cdecl;
    Start: function(self: MIDIDriverRef; devList: MIDIDeviceListRef): OSStatus; cdecl;
    Stop: function(self: MIDIDriverRef): OSStatus; cdecl;
    Configure: function(self: MIDIDriverRef; device: MIDIDeviceRef): OSStatus; cdecl;
    Send: function(self: MIDIDriverRef; pktlist: PMIDIPacketList; destRefCon1: Pointer; destRefCon2: Pointer): OSStatus; cdecl;
    EnableSource: function(self: MIDIDriverRef; src: MIDIEndpointRef; enabled: Boolean): OSStatus; cdecl;
    Flush: function(self: MIDIDriverRef; dest: MIDIEndpointRef; destRefCon1: Pointer; destRefCon2: Pointer): OSStatus; cdecl;
    Monitor: function(self: MIDIDriverRef; dest: MIDIEndpointRef; pktlist: PMIDIPacketList): OSStatus; cdecl;
  end;

  MIDIChannelNumber = UInt8;

  MIDICIDeviceIdentification = record
    manufacturer: array [0..2] of UInt8;
    family: array [0..1] of UInt8;
    modelNumber: array [0..1] of UInt8;
    revisionLevel: array [0..3] of UInt8;
    reserved: array [0..4] of UInt8;
  end;

  MIDICIProfileChangedBlock = procedure(session: MIDICISession; channel: MIDIChannelNumber; profile: MIDICIProfile; enabled: Boolean) of object;

  MIDICIPropertyChangedBlock = procedure(session: MIDICISession; channel: MIDIChannelNumber; data: NSData) of object;

  MIDICIPropertyResponseBlock = procedure(session: MIDICISession; channel: MIDIChannelNumber; response: NSData; error: NSError) of object;
  MIDINetworkConnectionPolicy = NSInteger;
  TMIDICISessionBlockMethod1 = procedure of object;

  MIDICIProfileClass = interface(NSObjectClass)
    ['{1F32AD47-BDD8-49AE-AEE7-206BE220938F}']
  end;

  MIDICIProfile = interface(NSObject)
    ['{4B01AD52-272E-4020-BC1C-63D00C0372B2}']
    [MethodName('initWithData:name:')]
    function initWithData(data: NSData; inName: NSString): Pointer; cdecl;
    function name: NSString; cdecl;
    function profileID: NSData; cdecl;
  end;
  TMIDICIProfile = class(TOCGenericImport<MIDICIProfileClass, MIDICIProfile>) end;

  MIDICIProfileStateClass = interface(NSObjectClass)
    ['{80A756B4-8CD9-412E-B3A6-8D802488AA1B}']
  end;

  MIDICIProfileState = interface(NSObject)
    ['{447FD132-9FB6-46CE-93A9-FCF2F5A0E9EE}']
    function disabledProfiles: NSArray; cdecl;
    function enabledProfiles: NSArray; cdecl;
    [MethodName('initWithEnabledProfiles:disabledProfiles:')]
    function initWithEnabledProfiles(enabled: NSArray; disabled: NSArray): Pointer; cdecl;
  end;
  TMIDICIProfileState = class(TOCGenericImport<MIDICIProfileStateClass, MIDICIProfileState>) end;

  MIDICISessionClass = interface(NSObjectClass)
    ['{CC045F5B-D694-4A84-AC78-6A675744DE79}']
  end;

  MIDICISession = interface(NSObject)
    ['{B5FB4E6E-CCDC-4A08-92DE-1E419B2DF94E}']
    function deviceIdentification: MIDICIDeviceIdentification; cdecl;
    [MethodName('disableProfile:onChannel:error:')]
    function disableProfile(profile: MIDICIProfile; channel: MIDIChannelNumber; outError: PNSError): Boolean; cdecl;
    [MethodName('enableProfile:onChannel:error:')]
    function enableProfile(profile: MIDICIProfile; channel: MIDIChannelNumber; outError: PNSError): Boolean; cdecl;
    function entity: MIDIEntityRef; cdecl;
    [MethodName('getProperty:onChannel:responseHandler:')]
    procedure getProperty(inquiry: NSData; channel: MIDIChannelNumber; handler: MIDICIPropertyResponseBlock); cdecl;
    [MethodName('hasProperty:onChannel:responseHandler:')]
    procedure hasProperty(inquiry: NSData; channel: MIDIChannelNumber; handler: MIDICIPropertyResponseBlock); cdecl;
    [MethodName('initWithMIDIEntity:dataReadyHandler:')]
    function initWithMIDIEntity(entity: MIDIEntityRef; handler: TMIDICISessionBlockMethod1): Pointer; cdecl;
    function profileChangedCallback: MIDICIProfileChangedBlock; cdecl;
    function profileStateForChannel(channel: MIDIChannelNumber): MIDICIProfileState; cdecl;
    function propertyChangedCallback: MIDICIPropertyChangedBlock; cdecl;
    procedure setProfileChangedCallback(profileChangedCallback: MIDICIProfileChangedBlock); cdecl;
    [MethodName('setProperty:onChannel:responseHandler:')]
    procedure setProperty(inquiry: NSData; channel: MIDIChannelNumber; handler: MIDICIPropertyResponseBlock); cdecl;
    procedure setPropertyChangedCallback(propertyChangedCallback: MIDICIPropertyChangedBlock); cdecl;
    function supportsProfileCapability: Boolean; cdecl;
    function supportsPropertyCapability: Boolean; cdecl;
  end;
  TMIDICISession = class(TOCGenericImport<MIDICISessionClass, MIDICISession>) end;

  MIDINetworkHostClass = interface(NSObjectClass)
    ['{54B8CBA8-5F7E-4B87-8EE0-D18961CFF57B}']
    [MethodName('hostWithName:netServiceName:netServiceDomain:')]
    {class} function hostWithName(name: NSString; netServiceName: NSString; netServiceDomain: NSString): Pointer; overload; cdecl;
    [MethodName('hostWithName:netService:')]
    {class} function hostWithName(name: NSString; netService: NSNetService): Pointer; overload; cdecl;
    [MethodName('hostWithName:address:port:')]
    {class} function hostWithName(name: NSString; address: NSString; port: NSUInteger): Pointer; overload; cdecl;
  end;

  MIDINetworkHost = interface(NSObject)
    ['{F73B1270-C8D5-4EAB-BB9A-9E0EEC3D32B2}']
    function address: NSString; cdecl;
    function hasSameAddressAs(other: MIDINetworkHost): Boolean; cdecl;
    function name: NSString; cdecl;
    function netServiceDomain: NSString; cdecl;
    function netServiceName: NSString; cdecl;
    function port: NSUInteger; cdecl;
  end;
  TMIDINetworkHost = class(TOCGenericImport<MIDINetworkHostClass, MIDINetworkHost>) end;

  MIDINetworkConnectionClass = interface(NSObjectClass)
    ['{3D5DC7F4-3188-4894-B18F-4DDF1C736C7E}']
    {class} function connectionWithHost(host: MIDINetworkHost): Pointer; cdecl;
  end;

  MIDINetworkConnection = interface(NSObject)
    ['{25482A21-7E67-426A-83BF-77868ED5938E}']
    function host: MIDINetworkHost; cdecl;
  end;
  TMIDINetworkConnection = class(TOCGenericImport<MIDINetworkConnectionClass, MIDINetworkConnection>) end;

  MIDINetworkSessionClass = interface(NSObjectClass)
    ['{90DD8F1E-C68F-49CB-A2F6-07D070992C61}']
    {class} function defaultSession: MIDINetworkSession; cdecl;
  end;

  MIDINetworkSession = interface(NSObject)
    ['{54C0BF20-204C-42C6-B3E0-87A65A045530}']
    function addConnection(connection: MIDINetworkConnection): Boolean; cdecl;
    function addContact(contact: MIDINetworkHost): Boolean; cdecl;
    function connectionPolicy: MIDINetworkConnectionPolicy; cdecl;
    function connections: NSSet; cdecl;
    function contacts: NSSet; cdecl;
    function destinationEndpoint: MIDIEndpointRef; cdecl;
    function isEnabled: Boolean; cdecl;
    function localName: NSString; cdecl;
    function networkName: NSString; cdecl;
    function networkPort: NSUInteger; cdecl;
    function removeConnection(connection: MIDINetworkConnection): Boolean; cdecl;
    function removeContact(contact: MIDINetworkHost): Boolean; cdecl;
    procedure setConnectionPolicy(connectionPolicy: MIDINetworkConnectionPolicy); cdecl;
    procedure setEnabled(enabled: Boolean); cdecl;
    function sourceEndpoint: MIDIEndpointRef; cdecl;
  end;
  TMIDINetworkSession = class(TOCGenericImport<MIDINetworkSessionClass, MIDINetworkSession>) end;

function kMIDIPropertyName: CFStringRef;
function kMIDIPropertyManufacturer: CFStringRef;
function kMIDIPropertyModel: CFStringRef;
function kMIDIPropertyUniqueID: CFStringRef;
function kMIDIPropertyDeviceID: CFStringRef;
function kMIDIPropertyReceiveChannels: CFStringRef;
function kMIDIPropertyTransmitChannels: CFStringRef;
function kMIDIPropertyMaxSysExSpeed: CFStringRef;
function kMIDIPropertyAdvanceScheduleTimeMuSec: CFStringRef;
function kMIDIPropertyIsEmbeddedEntity: CFStringRef;
function kMIDIPropertyIsBroadcast: CFStringRef;
function kMIDIPropertySingleRealtimeEntity: CFStringRef;
function kMIDIPropertyConnectionUniqueID: CFStringRef;
function kMIDIPropertyOffline: CFStringRef;
function kMIDIPropertyPrivate: CFStringRef;
function kMIDIPropertyDriverOwner: CFStringRef;
function kMIDIPropertyFactoryPatchNameFile: CFStringRef;
function kMIDIPropertyUserPatchNameFile: CFStringRef;
function kMIDIPropertyNameConfiguration: CFStringRef;
function kMIDIPropertyImage: CFStringRef;
function kMIDIPropertyDriverVersion: CFStringRef;
function kMIDIPropertySupportsGeneralMIDI: CFStringRef;
function kMIDIPropertySupportsMMC: CFStringRef;
function kMIDIPropertyCanRoute: CFStringRef;
function kMIDIPropertyReceivesClock: CFStringRef;
function kMIDIPropertyReceivesMTC: CFStringRef;
function kMIDIPropertyReceivesNotes: CFStringRef;
function kMIDIPropertyReceivesProgramChanges: CFStringRef;
function kMIDIPropertyReceivesBankSelectMSB: CFStringRef;
function kMIDIPropertyReceivesBankSelectLSB: CFStringRef;
function kMIDIPropertyTransmitsClock: CFStringRef;
function kMIDIPropertyTransmitsMTC: CFStringRef;
function kMIDIPropertyTransmitsNotes: CFStringRef;
function kMIDIPropertyTransmitsProgramChanges: CFStringRef;
function kMIDIPropertyTransmitsBankSelectMSB: CFStringRef;
function kMIDIPropertyTransmitsBankSelectLSB: CFStringRef;
function kMIDIPropertyPanDisruptsStereo: CFStringRef;
function kMIDIPropertyIsSampler: CFStringRef;
function kMIDIPropertyIsDrumMachine: CFStringRef;
function kMIDIPropertyIsMixer: CFStringRef;
function kMIDIPropertyIsEffectUnit: CFStringRef;
function kMIDIPropertyMaxReceiveChannels: CFStringRef;
function kMIDIPropertyMaxTransmitChannels: CFStringRef;
function kMIDIPropertyDriverDeviceEditorApp: CFStringRef;
function kMIDIPropertySupportsShowControl: CFStringRef;
function kMIDIPropertyDisplayName: CFStringRef;
function kMIDIDriverPropertyUsesSerial: CFStringRef;
function MIDINetworkBonjourServiceType: NSString;
function MIDINetworkNotificationContactsDidChange: NSString;
function MIDINetworkNotificationSessionDidChange: NSString;

const
  libCoreMIDI = '/System/Library/Frameworks/CoreMIDI.framework/CoreMIDI';

function MIDIClientCreate(name: CFStringRef; notifyProc: MIDINotifyProc; notifyRefCon: Pointer; outClient: PMIDIClientRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIClientCreate';

function MIDIClientCreateWithBlock(name: CFStringRef; outClient: PMIDIClientRef; notifyBlock: MIDINotifyBlock): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIClientCreateWithBlock';

function MIDIClientDispose(client: MIDIClientRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIClientDispose';

function MIDIInputPortCreate(client: MIDIClientRef; portName: CFStringRef; readProc: MIDIReadProc; refCon: Pointer; outPort: PMIDIPortRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIInputPortCreate';

function MIDIInputPortCreateWithBlock(client: MIDIClientRef; portName: CFStringRef; outPort: PMIDIPortRef; readBlock: MIDIReadBlock): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIInputPortCreateWithBlock';

function MIDIOutputPortCreate(client: MIDIClientRef; portName: CFStringRef; outPort: PMIDIPortRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIOutputPortCreate';

function MIDIPortDispose(port: MIDIPortRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIPortDispose';

function MIDIPortConnectSource(port: MIDIPortRef; source: MIDIEndpointRef; connRefCon: Pointer): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIPortConnectSource';

function MIDIPortDisconnectSource(port: MIDIPortRef; source: MIDIEndpointRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIPortDisconnectSource';

function MIDIGetNumberOfDevices: ItemCount; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetNumberOfDevices';

function MIDIGetDevice(deviceIndex0: ItemCount): MIDIDeviceRef; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetDevice';

function MIDIDeviceGetNumberOfEntities(device: MIDIDeviceRef): ItemCount; cdecl;
  external libCoreMIDI name _PU + 'MIDIDeviceGetNumberOfEntities';

function MIDIDeviceGetEntity(device: MIDIDeviceRef; entityIndex0: ItemCount): MIDIEntityRef; cdecl;
  external libCoreMIDI name _PU + 'MIDIDeviceGetEntity';

function MIDIEntityGetNumberOfSources(entity: MIDIEntityRef): ItemCount; cdecl;
  external libCoreMIDI name _PU + 'MIDIEntityGetNumberOfSources';

function MIDIEntityGetSource(entity: MIDIEntityRef; sourceIndex0: ItemCount): MIDIEndpointRef; cdecl;
  external libCoreMIDI name _PU + 'MIDIEntityGetSource';

function MIDIEntityGetNumberOfDestinations(entity: MIDIEntityRef): ItemCount; cdecl;
  external libCoreMIDI name _PU + 'MIDIEntityGetNumberOfDestinations';

function MIDIEntityGetDestination(entity: MIDIEntityRef; destIndex0: ItemCount): MIDIEndpointRef; cdecl;
  external libCoreMIDI name _PU + 'MIDIEntityGetDestination';

function MIDIEntityGetDevice(inEntity: MIDIEntityRef; outDevice: PMIDIDeviceRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIEntityGetDevice';

function MIDIGetNumberOfSources: ItemCount; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetNumberOfSources';

function MIDIGetSource(sourceIndex0: ItemCount): MIDIEndpointRef; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetSource';

function MIDIGetNumberOfDestinations: ItemCount; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetNumberOfDestinations';

function MIDIGetDestination(destIndex0: ItemCount): MIDIEndpointRef; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetDestination';

function MIDIEndpointGetEntity(inEndpoint: MIDIEndpointRef; outEntity: PMIDIEntityRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIEndpointGetEntity';

function MIDIDestinationCreate(client: MIDIClientRef; name: CFStringRef; readProc: MIDIReadProc; refCon: Pointer; outDest: PMIDIEndpointRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIDestinationCreate';

function MIDIDestinationCreateWithBlock(client: MIDIClientRef; name: CFStringRef; outDest: PMIDIEndpointRef; readBlock: MIDIReadBlock): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIDestinationCreateWithBlock';

function MIDISourceCreate(client: MIDIClientRef; name: CFStringRef; outSrc: PMIDIEndpointRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISourceCreate';

function MIDIEndpointDispose(endpt: MIDIEndpointRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIEndpointDispose';

function MIDIGetNumberOfExternalDevices: ItemCount; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetNumberOfExternalDevices';

function MIDIGetExternalDevice(deviceIndex0: ItemCount): MIDIDeviceRef; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetExternalDevice';

function MIDIObjectGetIntegerProperty(obj: MIDIObjectRef; propertyID: CFStringRef; outValue: PSInt32): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIObjectGetIntegerProperty';

function MIDIObjectSetIntegerProperty(obj: MIDIObjectRef; propertyID: CFStringRef; value: SInt32): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIObjectSetIntegerProperty';

function MIDIObjectGetStringProperty(obj: MIDIObjectRef; propertyID: CFStringRef; str: PCFStringRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIObjectGetStringProperty';

function MIDIObjectSetStringProperty(obj: MIDIObjectRef; propertyID: CFStringRef; str: CFStringRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIObjectSetStringProperty';

function MIDIObjectGetDataProperty(obj: MIDIObjectRef; propertyID: CFStringRef; outData: PCFDataRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIObjectGetDataProperty';

function MIDIObjectSetDataProperty(obj: MIDIObjectRef; propertyID: CFStringRef; data: CFDataRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIObjectSetDataProperty';

function MIDIObjectGetDictionaryProperty(obj: MIDIObjectRef; propertyID: CFStringRef; outDict: PCFDictionaryRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIObjectGetDictionaryProperty';

function MIDIObjectSetDictionaryProperty(obj: MIDIObjectRef; propertyID: CFStringRef; dict: CFDictionaryRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIObjectSetDictionaryProperty';

function MIDIObjectGetProperties(obj: MIDIObjectRef; outProperties: PCFPropertyListRef; deep: Boolean): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIObjectGetProperties';

function MIDIObjectRemoveProperty(obj: MIDIObjectRef; propertyID: CFStringRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIObjectRemoveProperty';

function MIDIObjectFindByUniqueID(inUniqueID: MIDIUniqueID; outObject: PMIDIObjectRef; outObjectType: PMIDIObjectType): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIObjectFindByUniqueID';

function MIDISend(port: MIDIPortRef; dest: MIDIEndpointRef; pktlist: PMIDIPacketList): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISend';

function MIDISendSysex(request: PMIDISysexSendRequest): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISendSysex';

function MIDIReceived(src: MIDIEndpointRef; pktlist: PMIDIPacketList): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIReceived';

function MIDIFlushOutput(dest: MIDIEndpointRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIFlushOutput';

function MIDIRestart: OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIRestart';

function MIDIPacketListInit(pktlist: PMIDIPacketList): PMIDIPacket; cdecl;
  external libCoreMIDI name _PU + 'MIDIPacketListInit';

function MIDIPacketListAdd(pktlist: PMIDIPacketList; listSize: ByteCount; curPacket: PMIDIPacket; time: MIDITimeStamp; nData: ByteCount; data: PByte): PMIDIPacket; cdecl;
  external libCoreMIDI name _PU + 'MIDIPacketListAdd';

function MIDISetupCreate(outSetup: PMIDISetupRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISetupCreate';

function MIDISetupDispose(setup: MIDISetupRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISetupDispose';

function MIDISetupInstall(setup: MIDISetupRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISetupInstall';

function MIDISetupGetCurrent(outSetup: PMIDISetupRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISetupGetCurrent';

function MIDISetupToData(setup: MIDISetupRef; outData: PCFDataRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISetupToData';

function MIDISetupFromData(data: CFDataRef; outSetup: PMIDISetupRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISetupFromData';

function MIDIDeviceAddEntity(device: MIDIDeviceRef; name: CFStringRef; embedded: Boolean; numSourceEndpoints: ItemCount;
  numDestinationEndpoints: ItemCount; newEntity: PMIDIEntityRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIDeviceAddEntity';

function MIDIDeviceRemoveEntity(device: MIDIDeviceRef; entity: MIDIEntityRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIDeviceRemoveEntity';

function MIDIEntityAddOrRemoveEndpoints(entity: MIDIEntityRef; numSourceEndpoints: ItemCount; numDestinationEndpoints: ItemCount): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIEntityAddOrRemoveEndpoints';

function MIDISetupAddDevice(device: MIDIDeviceRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISetupAddDevice';

function MIDISetupRemoveDevice(device: MIDIDeviceRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISetupRemoveDevice';

function MIDISetupAddExternalDevice(device: MIDIDeviceRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISetupAddExternalDevice';

function MIDISetupRemoveExternalDevice(device: MIDIDeviceRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISetupRemoveExternalDevice';

function MIDIGetSerialPortOwner(portName: CFStringRef; outDriverName: PCFStringRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetSerialPortOwner';

function MIDISetSerialPortOwner(portName: CFStringRef; driverName: CFStringRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISetSerialPortOwner';

function MIDIGetSerialPortDrivers(outDriverNames: PCFArrayRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetSerialPortDrivers';

function MIDIExternalDeviceCreate(name: CFStringRef; manufacturer: CFStringRef; model: CFStringRef; outDevice: PMIDIDeviceRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIExternalDeviceCreate';

procedure MIDIThruConnectionParamsInitialize(inConnectionParams: PMIDIThruConnectionParams); cdecl;
  external libCoreMIDI name _PU + 'MIDIThruConnectionParamsInitialize';

function MIDIThruConnectionCreate(inPersistentOwnerID: CFStringRef; inConnectionParams: CFDataRef;
  outConnection: PMIDIThruConnectionRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIThruConnectionCreate';

function MIDIThruConnectionDispose(connection: MIDIThruConnectionRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIThruConnectionDispose';

function MIDIThruConnectionGetParams(connection: MIDIThruConnectionRef; outConnectionParams: PCFDataRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIThruConnectionGetParams';

function MIDIThruConnectionSetParams(connection: MIDIThruConnectionRef; inConnectionParams: CFDataRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIThruConnectionSetParams';

function MIDIThruConnectionFind(inPersistentOwnerID: CFStringRef; outConnectionList: PCFDataRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIThruConnectionFind';

function MIDIDeviceCreate(owner: MIDIDriverRef; name: CFStringRef; manufacturer: CFStringRef; model: CFStringRef;
  outDevice: PMIDIDeviceRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIDeviceCreate';

function MIDIDeviceDispose(device: MIDIDeviceRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIDeviceDispose';

function MIDIDeviceListGetNumberOfDevices(devList: MIDIDeviceListRef): ItemCount; cdecl;
  external libCoreMIDI name _PU + 'MIDIDeviceListGetNumberOfDevices';

function MIDIDeviceListGetDevice(devList: MIDIDeviceListRef; index0: ItemCount): MIDIDeviceRef; cdecl;
  external libCoreMIDI name _PU + 'MIDIDeviceListGetDevice';

function MIDIDeviceListAddDevice(devList: MIDIDeviceListRef; dev: MIDIDeviceRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIDeviceListAddDevice';

function MIDIDeviceListDispose(devList: MIDIDeviceListRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIDeviceListDispose';

function MIDIEndpointSetRefCons(endpt: MIDIEndpointRef; ref1: Pointer; ref2: Pointer): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIEndpointSetRefCons';

function MIDIEndpointGetRefCons(endpt: MIDIEndpointRef; ref1: PPointer; ref2: PPointer): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIEndpointGetRefCons';

function MIDIGetDriverIORunLoop: CFRunLoopRef; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetDriverIORunLoop';

function MIDIGetDriverDeviceList(driver: MIDIDriverRef): MIDIDeviceListRef; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetDriverDeviceList';

function MIDIDriverEnableMonitoring(driver: MIDIDriverRef; enabled: Boolean): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIDriverEnableMonitoring';

implementation

uses
  System.SysUtils;

var
  CoreMIDIModule: THandle;

function kMIDIPropertyName: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyName'));
end;

function kMIDIPropertyManufacturer: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyManufacturer'));
end;

function kMIDIPropertyModel: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyModel'));
end;

function kMIDIPropertyUniqueID: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyUniqueID'));
end;

function kMIDIPropertyDeviceID: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyDeviceID'));
end;

function kMIDIPropertyReceiveChannels: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyReceiveChannels'));
end;

function kMIDIPropertyTransmitChannels: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyTransmitChannels'));
end;

function kMIDIPropertyMaxSysExSpeed: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyMaxSysExSpeed'));
end;

function kMIDIPropertyAdvanceScheduleTimeMuSec: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyAdvanceScheduleTimeMuSec'));
end;

function kMIDIPropertyIsEmbeddedEntity: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyIsEmbeddedEntity'));
end;

function kMIDIPropertyIsBroadcast: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyIsBroadcast'));
end;

function kMIDIPropertySingleRealtimeEntity: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertySingleRealtimeEntity'));
end;

function kMIDIPropertyConnectionUniqueID: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyConnectionUniqueID'));
end;

function kMIDIPropertyOffline: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyOffline'));
end;

function kMIDIPropertyPrivate: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyPrivate'));
end;

function kMIDIPropertyDriverOwner: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyDriverOwner'));
end;

function kMIDIPropertyFactoryPatchNameFile: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyFactoryPatchNameFile'));
end;

function kMIDIPropertyUserPatchNameFile: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyUserPatchNameFile'));
end;

function kMIDIPropertyNameConfiguration: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyNameConfiguration'));
end;

function kMIDIPropertyImage: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyImage'));
end;

function kMIDIPropertyDriverVersion: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyDriverVersion'));
end;

function kMIDIPropertySupportsGeneralMIDI: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertySupportsGeneralMIDI'));
end;

function kMIDIPropertySupportsMMC: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertySupportsMMC'));
end;

function kMIDIPropertyCanRoute: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyCanRoute'));
end;

function kMIDIPropertyReceivesClock: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyReceivesClock'));
end;

function kMIDIPropertyReceivesMTC: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyReceivesMTC'));
end;

function kMIDIPropertyReceivesNotes: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyReceivesNotes'));
end;

function kMIDIPropertyReceivesProgramChanges: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyReceivesProgramChanges'));
end;

function kMIDIPropertyReceivesBankSelectMSB: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyReceivesBankSelectMSB'));
end;

function kMIDIPropertyReceivesBankSelectLSB: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyReceivesBankSelectLSB'));
end;

function kMIDIPropertyTransmitsClock: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyTransmitsClock'));
end;

function kMIDIPropertyTransmitsMTC: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyTransmitsMTC'));
end;

function kMIDIPropertyTransmitsNotes: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyTransmitsNotes'));
end;

function kMIDIPropertyTransmitsProgramChanges: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyTransmitsProgramChanges'));
end;

function kMIDIPropertyTransmitsBankSelectMSB: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyTransmitsBankSelectMSB'));
end;

function kMIDIPropertyTransmitsBankSelectLSB: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyTransmitsBankSelectLSB'));
end;

function kMIDIPropertyPanDisruptsStereo: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyPanDisruptsStereo'));
end;

function kMIDIPropertyIsSampler: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyIsSampler'));
end;

function kMIDIPropertyIsDrumMachine: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyIsDrumMachine'));
end;

function kMIDIPropertyIsMixer: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyIsMixer'));
end;

function kMIDIPropertyIsEffectUnit: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyIsEffectUnit'));
end;

function kMIDIPropertyMaxReceiveChannels: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyMaxReceiveChannels'));
end;

function kMIDIPropertyMaxTransmitChannels: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyMaxTransmitChannels'));
end;

function kMIDIPropertyDriverDeviceEditorApp: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyDriverDeviceEditorApp'));
end;

function kMIDIPropertySupportsShowControl: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertySupportsShowControl'));
end;

function kMIDIPropertyDisplayName: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyDisplayName'));
end;

function kMIDIDriverPropertyUsesSerial: CFStringRef;
begin
  Result := CFStringRef(CocoaPointerConst(libCoreMIDI, 'kMIDIDriverPropertyUsesSerial'));
end;

function MIDINetworkBonjourServiceType: NSString;
begin
  Result := CocoaNSStringConst(libCoreMIDI, 'MIDINetworkBonjourServiceType');
end;

function MIDINetworkNotificationContactsDidChange: NSString;
begin
  Result := CocoaNSStringConst(libCoreMIDI, 'MIDINetworkNotificationContactsDidChange');
end;

function MIDINetworkNotificationSessionDidChange: NSString;
begin
  Result := CocoaNSStringConst(libCoreMIDI, 'MIDINetworkNotificationSessionDidChange');
end;

initialization
  CoreMIDIModule := LoadLibrary(libCoreMIDI);

finalization
  if CoreMIDIModule <> 0 then
    FreeLibrary(CoreMIDIModule);

end.