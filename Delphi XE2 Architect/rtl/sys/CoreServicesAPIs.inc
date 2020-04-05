{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

const
  CarbonCoreLib = '/System/Library/Frameworks/CoreServices.framework/Frameworks/CarbonCore.framework/CarbonCore';

function MPProcessors: Cardinal; cdecl external CarbonCoreLib name '_MPProcessors';
procedure MPYield; cdecl external CarbonCoreLib name '_MPYield';

function UpTime: UInt64; cdecl external CarbonCoreLib name '_UpTime';
function AbsoluteToNanoseconds(absoluteTime: UInt64): UInt64; cdecl external CarbonCoreLib name '_AbsoluteToNanoseconds';

