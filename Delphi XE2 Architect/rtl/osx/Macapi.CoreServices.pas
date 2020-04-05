{*******************************************************}
{                                                       }
{                Delphi Runtime Library                 }
{                                                       }
{          File: CoreServices.h                         }
{          Copyright (c) Apple, Inc.                    }
{          All Rights Reserved.                         }
{                                                       }
{       Translator: Embarcadero Technologies, Inc.      }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Macapi.CoreServices;

{$WEAKPACKAGEUNIT}

interface

{$I OSTypes.inc}
{$I MacTypes.inc}
{$I TextCommon.inc}
{$I Files.inc}
{$I Multiprocessing.inc}
{$I DriverServices.inc}
{ $I OSServices.inc}
{ $I SFNetwork.inc}
{ $I LaunchServices.inc}
{ $I SearchKit.inc}
{ $I Metadata.inc}
{ $I DictionaryServices.inc}
{ $I AE.inc}
{$I Gestalt.inc}

const
  CoreServicesLib = '/System/Library/Frameworks/CoreServices.framework/CoreServices';
  {$EXTERNALSYM CoreServicesLib}
  CarbonCoreLib = '/System/Library/Frameworks/CoreServices.framework/Frameworks/CarbonCore.framework/CarbonCore';
  {$EXTERNALSYM CarbonCoreLib}

implementation

{$I MacTypesImpl.inc}
{ $I TextCommonImpl.inc}
{$I FilesImpl.inc}
{$I MultiprocessingImpl.inc}
{$I DriverServicesImpl.inc}
{ $I OSServicesImpl.inc}
{ $I SFNetworkImpl.inc}
{ $I LaunchServicesImpl.inc}
{ $I SearchKitImpl.inc}
{ $I MetadataImpl.inc}
{ $I DictionaryServicesImpl.inc}
{ $I AEImpl.inc}
{$I GestaltImpl.inc}

end.
