{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2010-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

//DONE -osbloom -cImplement : Figure out which dylib these functions are in

function Gestalt; external CarbonCoreLib name '_Gestalt';
function ReplaceGestalt; external CarbonCoreLib name '_ReplaceGestalt';
function NewGestalt; external CarbonCoreLib name '_NewGestalt';
function NewGestaltValue; external CarbonCoreLib name '_NewGestaltValue';
function ReplaceGestaltValue; external CarbonCoreLib name '_ReplaceGestaltValue';
function SetGestaltValue; external CarbonCoreLib name '_SetGestaltValue';
function DeleteGestaltValue; external CarbonCoreLib name '_DeleteGestaltValue';
function NewSelectorFunctionUPP; external CarbonCoreLib name '_NewSelectorFunctionUPP';
procedure DisposeSelectorFunctionUPP; external CarbonCoreLib name '_DisposeSelectorFunctionUPP';
function InvokeSelectorFunctionUPP; external CarbonCoreLib name '_InvokeSelectorFunctionUPP';
