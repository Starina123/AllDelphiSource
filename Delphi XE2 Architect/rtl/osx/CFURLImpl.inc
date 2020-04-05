{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2010-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}


var
  _kCFURLNameKey: Pointer = nil;
  _kCFURLLocalizedNameKey: Pointer = nil;
  _kCFURLIsRegularFileKey: Pointer = nil;
  _kCFURLIsDirectoryKey: Pointer = nil;
  _kCFURLIsSymbolicLinkKey: Pointer = nil;
  _kCFURLIsVolumeKey: Pointer = nil;
  _kCFURLIsPackageKey: Pointer = nil;
  _kCFURLIsSystemImmutableKey: Pointer = nil;
  _kCFURLIsUserImmutableKey: Pointer = nil;
  _kCFURLIsHiddenKey: Pointer = nil;
  _kCFURLHasHiddenExtensionKey: Pointer = nil;
  _kCFURLCreationDateKey: Pointer = nil;
  _kCFURLContentAccessDateKey: Pointer = nil;
  _kCFURLContentModificationDateKey: Pointer = nil;
  _kCFURLAttributeModificationDateKey: Pointer = nil;
  _kCFURLLinkCountKey: Pointer = nil;
  _kCFURLParentDirectoryURLKey: Pointer = nil;
  _kCFURLVolumeURLKey: Pointer = nil;
  _kCFURLTypeIdentifierKey: Pointer = nil;
  _kCFURLLocalizedTypeDescriptionKey: Pointer = nil;
  _kCFURLLabelNumberKey: Pointer = nil;
  _kCFURLLabelColorKey: Pointer = nil;
  _kCFURLLocalizedLabelKey: Pointer = nil;
  _kCFURLEffectiveIconKey: Pointer = nil;
  _kCFURLCustomIconKey: Pointer = nil;
  _kCFURLFileSizeKey: Pointer = nil;
  _kCFURLFileAllocatedSizeKey: Pointer = nil;
  _kCFURLIsAliasFileKey: Pointer = nil;
  _kCFURLVolumeLocalizedFormatDescriptionKey: Pointer = nil;
  _kCFURLVolumeTotalCapacityKey: Pointer = nil;
  _kCFURLVolumeAvailableCapacityKey: Pointer = nil;
  _kCFURLVolumeResourceCountKey: Pointer = nil;
  _kCFURLVolumeSupportsPersistentIDsKey: Pointer = nil;
  _kCFURLVolumeSupportsSymbolicLinksKey: Pointer = nil;
  _kCFURLVolumeSupportsHardLinksKey: Pointer = nil;
  _kCFURLVolumeSupportsJournalingKey: Pointer = nil;
  _kCFURLVolumeIsJournalingKey: Pointer = nil;
  _kCFURLVolumeSupportsSparseFilesKey: Pointer = nil;
  _kCFURLVolumeSupportsZeroRunsKey: Pointer = nil;
  _kCFURLVolumeSupportsCaseSensitiveNamesKey: Pointer = nil;
  _kCFURLVolumeSupportsCasePreservedNamesKey: Pointer = nil;

function kCFURLNameKey: CFStringRef;
begin
  if _kCFURLNameKey = nil then
    _kCFURLNameKey := dlsym(CFModule, PAnsiChar('kCFURLNameKey'));
  Result := CFStringRef(_kCFURLNameKey^);
end;

function kCFURLLocalizedNameKey: CFStringRef;
begin
  if _kCFURLLocalizedNameKey = nil then
    _kCFURLLocalizedNameKey := dlsym(CFModule, PAnsiChar('kCFURLLocalizedNameKey'));
  Result := CFStringRef(_kCFURLLocalizedNameKey^);
end;

function kCFURLIsRegularFileKey: CFStringRef;
begin
  if _kCFURLIsRegularFileKey = nil then
    _kCFURLIsRegularFileKey := dlsym(CFModule, PAnsiChar('kCFURLIsRegularFileKey'));
  Result := CFStringRef(_kCFURLIsRegularFileKey^);
end;

function kCFURLIsDirectoryKey: CFStringRef;
begin
  if _kCFURLIsDirectoryKey = nil then
    _kCFURLIsDirectoryKey := dlsym(CFModule, PAnsiChar('kCFURLIsDirectoryKey'));
  Result := CFStringRef(_kCFURLIsDirectoryKey^);
end;

function kCFURLIsSymbolicLinkKey: CFStringRef;
begin
  if _kCFURLIsSymbolicLinkKey = nil then
    _kCFURLIsSymbolicLinkKey := dlsym(CFModule, PAnsiChar('kCFURLIsSymbolicLinkKey'));
  Result := CFStringRef(_kCFURLIsSymbolicLinkKey^);
end;

function kCFURLIsVolumeKey: CFStringRef;
begin
  if _kCFURLIsVolumeKey = nil then
    _kCFURLIsVolumeKey := dlsym(CFModule, PAnsiChar('kCFURLIsVolumeKey'));
  Result := CFStringRef(_kCFURLIsVolumeKey^);
end;

function kCFURLIsPackageKey: CFStringRef;
begin
  if _kCFURLIsPackageKey = nil then
    _kCFURLIsPackageKey := dlsym(CFModule, PAnsiChar('kCFURLIsPackageKey'));
  Result := CFStringRef(_kCFURLIsPackageKey^);
end;

function kCFURLIsSystemImmutableKey: CFStringRef;
begin
  if _kCFURLIsSystemImmutableKey = nil then
    _kCFURLIsSystemImmutableKey := dlsym(CFModule, PAnsiChar('kCFURLIsSystemImmutableKey'));
  Result := CFStringRef(_kCFURLIsSystemImmutableKey^);
end;

function kCFURLIsUserImmutableKey: CFStringRef;
begin
  if _kCFURLIsUserImmutableKey = nil then
    _kCFURLIsUserImmutableKey := dlsym(CFModule, PAnsiChar('kCFURLIsUserImmutableKey'));
  Result := CFStringRef(_kCFURLIsUserImmutableKey^);
end;

function kCFURLIsHiddenKey: CFStringRef;
begin
  if _kCFURLIsHiddenKey = nil then
    _kCFURLIsHiddenKey := dlsym(CFModule, PAnsiChar('kCFURLIsHiddenKey'));
  Result := CFStringRef(_kCFURLIsHiddenKey^);
end;

function kCFURLHasHiddenExtensionKey: CFStringRef;
begin
  if _kCFURLHasHiddenExtensionKey = nil then
    _kCFURLHasHiddenExtensionKey := dlsym(CFModule, PAnsiChar('kCFURLHasHiddenExtensionKey'));
  Result := CFStringRef(_kCFURLHasHiddenExtensionKey^);
end;

function kCFURLCreationDateKey: CFStringRef;
begin
  if _kCFURLCreationDateKey = nil then
    _kCFURLCreationDateKey := dlsym(CFModule, PAnsiChar('kCFURLCreationDateKey'));
  Result := CFStringRef(_kCFURLCreationDateKey^);
end;

function kCFURLContentAccessDateKey: CFStringRef;
begin
  if _kCFURLContentAccessDateKey = nil then
    _kCFURLContentAccessDateKey := dlsym(CFModule, PAnsiChar('kCFURLContentAccessDateKey'));
  Result := CFStringRef(_kCFURLContentAccessDateKey^);
end;

function kCFURLContentModificationDateKey: CFStringRef;
begin
  if _kCFURLContentModificationDateKey = nil then
    _kCFURLContentModificationDateKey := dlsym(CFModule, PAnsiChar('kCFURLContentModificationDateKey'));
  Result := CFStringRef(_kCFURLContentModificationDateKey^);
end;

function kCFURLAttributeModificationDateKey: CFStringRef;
begin
  if _kCFURLAttributeModificationDateKey = nil then
    _kCFURLAttributeModificationDateKey := dlsym(CFModule, PAnsiChar('kCFURLAttributeModificationDateKey'));
  Result := CFStringRef(_kCFURLAttributeModificationDateKey^);
end;

function kCFURLLinkCountKey: CFStringRef;
begin
  if _kCFURLLinkCountKey = nil then
    _kCFURLLinkCountKey := dlsym(CFModule, PAnsiChar('kCFURLLinkCountKey'));
  Result := CFStringRef(_kCFURLLinkCountKey^);
end;

function kCFURLParentDirectoryURLKey: CFStringRef;
begin
  if _kCFURLParentDirectoryURLKey = nil then
    _kCFURLParentDirectoryURLKey := dlsym(CFModule, PAnsiChar('kCFURLParentDirectoryURLKey'));
  Result := CFStringRef(_kCFURLParentDirectoryURLKey^);
end;

function kCFURLVolumeURLKey: CFStringRef;
begin
  if _kCFURLVolumeURLKey = nil then
    _kCFURLVolumeURLKey := dlsym(CFModule, PAnsiChar('kCFURLVolumeURLKey'));
  Result := CFStringRef(_kCFURLVolumeURLKey^);
end;

function kCFURLTypeIdentifierKey: CFStringRef;
begin
  if _kCFURLTypeIdentifierKey = nil then
    _kCFURLTypeIdentifierKey := dlsym(CFModule, PAnsiChar('kCFURLTypeIdentifierKey'));
  Result := CFStringRef(_kCFURLTypeIdentifierKey^);
end;

function kCFURLLocalizedTypeDescriptionKey: CFStringRef;
begin
  if _kCFURLLocalizedTypeDescriptionKey = nil then
    _kCFURLLocalizedTypeDescriptionKey := dlsym(CFModule, PAnsiChar('kCFURLLocalizedTypeDescriptionKey'));
  Result := CFStringRef(_kCFURLLocalizedTypeDescriptionKey^);
end;

function kCFURLLabelNumberKey: CFStringRef;
begin
  if _kCFURLLabelNumberKey = nil then
    _kCFURLLabelNumberKey := dlsym(CFModule, PAnsiChar('kCFURLLabelNumberKey'));
  Result := CFStringRef(_kCFURLLabelNumberKey^);
end;

function kCFURLLabelColorKey: CFStringRef;
begin
  if _kCFURLLabelColorKey = nil then
    _kCFURLLabelColorKey := dlsym(CFModule, PAnsiChar('kCFURLLabelColorKey'));
  Result := CFStringRef(_kCFURLLabelColorKey^);
end;

function kCFURLLocalizedLabelKey: CFStringRef;
begin
  if _kCFURLLocalizedLabelKey = nil then
    _kCFURLLocalizedLabelKey := dlsym(CFModule, PAnsiChar('kCFURLLocalizedLabelKey'));
  Result := CFStringRef(_kCFURLLocalizedLabelKey^);
end;

function kCFURLEffectiveIconKey: CFStringRef;
begin
  if _kCFURLEffectiveIconKey = nil then
    _kCFURLEffectiveIconKey := dlsym(CFModule, PAnsiChar('kCFURLEffectiveIconKey'));
  Result := CFStringRef(_kCFURLEffectiveIconKey^);
end;

function kCFURLCustomIconKey: CFStringRef;
begin
  if _kCFURLCustomIconKey = nil then
    _kCFURLCustomIconKey := dlsym(CFModule, PAnsiChar('kCFURLCustomIconKey'));
  Result := CFStringRef(_kCFURLCustomIconKey^);
end;

function kCFURLFileSizeKey: CFStringRef;
begin
  if _kCFURLFileSizeKey = nil then
    _kCFURLFileSizeKey := dlsym(CFModule, PAnsiChar('kCFURLFileSizeKey'));
  Result := CFStringRef(_kCFURLFileSizeKey^);
end;

function kCFURLFileAllocatedSizeKey: CFStringRef;
begin
  if _kCFURLFileAllocatedSizeKey = nil then
    _kCFURLFileAllocatedSizeKey := dlsym(CFModule, PAnsiChar('kCFURLFileAllocatedSizeKey'));
  Result := CFStringRef(_kCFURLFileAllocatedSizeKey^);
end;

function kCFURLIsAliasFileKey: CFStringRef;
begin
  if _kCFURLIsAliasFileKey = nil then
    _kCFURLIsAliasFileKey := dlsym(CFModule, PAnsiChar('kCFURLIsAliasFileKey'));
  Result := CFStringRef(_kCFURLIsAliasFileKey^);
end;

function kCFURLVolumeLocalizedFormatDescriptionKey: CFStringRef;
begin
  if _kCFURLVolumeLocalizedFormatDescriptionKey = nil then
    _kCFURLVolumeLocalizedFormatDescriptionKey := dlsym(CFModule, PAnsiChar('kCFURLVolumeLocalizedFormatDescriptionKey'));
  Result := CFStringRef(_kCFURLVolumeLocalizedFormatDescriptionKey^);
end;

function kCFURLVolumeTotalCapacityKey: CFStringRef;
begin
  if _kCFURLVolumeTotalCapacityKey = nil then
    _kCFURLVolumeTotalCapacityKey := dlsym(CFModule, PAnsiChar('kCFURLVolumeTotalCapacityKey'));
  Result := CFStringRef(_kCFURLVolumeTotalCapacityKey^);
end;

function kCFURLVolumeAvailableCapacityKey: CFStringRef;
begin
  if _kCFURLVolumeAvailableCapacityKey = nil then
    _kCFURLVolumeAvailableCapacityKey := dlsym(CFModule, PAnsiChar('kCFURLVolumeAvailableCapacityKey'));
  Result := CFStringRef(_kCFURLVolumeAvailableCapacityKey^);
end;

function kCFURLVolumeResourceCountKey: CFStringRef;
begin
  if _kCFURLVolumeResourceCountKey = nil then
    _kCFURLVolumeResourceCountKey := dlsym(CFModule, PAnsiChar('kCFURLVolumeResourceCountKey'));
  Result := CFStringRef(_kCFURLVolumeResourceCountKey^);
end;

function kCFURLVolumeSupportsPersistentIDsKey: CFStringRef;
begin
  if _kCFURLVolumeSupportsPersistentIDsKey = nil then
    _kCFURLVolumeSupportsPersistentIDsKey := dlsym(CFModule, PAnsiChar('kCFURLVolumeSupportsPersistentIDsKey'));
  Result := CFStringRef(_kCFURLVolumeSupportsPersistentIDsKey^);
end;

function kCFURLVolumeSupportsSymbolicLinksKey: CFStringRef;
begin
  if _kCFURLVolumeSupportsSymbolicLinksKey = nil then
    _kCFURLVolumeSupportsSymbolicLinksKey := dlsym(CFModule, PAnsiChar('kCFURLVolumeSupportsSymbolicLinksKey'));
  Result := CFStringRef(_kCFURLVolumeSupportsSymbolicLinksKey^);
end;

function kCFURLVolumeSupportsHardLinksKey: CFStringRef;
begin
  if _kCFURLVolumeSupportsHardLinksKey = nil then
    _kCFURLVolumeSupportsHardLinksKey := dlsym(CFModule, PAnsiChar('kCFURLVolumeSupportsHardLinksKey'));
  Result := CFStringRef(_kCFURLVolumeSupportsHardLinksKey^);
end;

function kCFURLVolumeSupportsJournalingKey: CFStringRef;
begin
  if _kCFURLVolumeSupportsJournalingKey = nil then
    _kCFURLVolumeSupportsJournalingKey := dlsym(CFModule, PAnsiChar('kCFURLVolumeSupportsJournalingKey'));
  Result := CFStringRef(_kCFURLVolumeSupportsJournalingKey^);
end;

function kCFURLVolumeIsJournalingKey: CFStringRef;
begin
  if _kCFURLVolumeIsJournalingKey = nil then
    _kCFURLVolumeIsJournalingKey := dlsym(CFModule, PAnsiChar('kCFURLVolumeIsJournalingKey'));
  Result := CFStringRef(_kCFURLVolumeIsJournalingKey^);
end;

function kCFURLVolumeSupportsSparseFilesKey: CFStringRef;
begin
  if _kCFURLVolumeSupportsSparseFilesKey = nil then
    _kCFURLVolumeSupportsSparseFilesKey := dlsym(CFModule, PAnsiChar('kCFURLVolumeSupportsSparseFilesKey'));
  Result := CFStringRef(_kCFURLVolumeSupportsSparseFilesKey^);
end;

function kCFURLVolumeSupportsZeroRunsKey: CFStringRef;
begin
  if _kCFURLVolumeSupportsZeroRunsKey = nil then
    _kCFURLVolumeSupportsZeroRunsKey := dlsym(CFModule, PAnsiChar('kCFURLVolumeSupportsZeroRunsKey'));
  Result := CFStringRef(_kCFURLVolumeSupportsZeroRunsKey^);
end;

function kCFURLVolumeSupportsCaseSensitiveNamesKey: CFStringRef;
begin
  if _kCFURLVolumeSupportsCaseSensitiveNamesKey = nil then
    _kCFURLVolumeSupportsCaseSensitiveNamesKey := dlsym(CFModule, PAnsiChar('kCFURLVolumeSupportsCaseSensitiveNamesKey'));
  Result := CFStringRef(_kCFURLVolumeSupportsCaseSensitiveNamesKey^);
end;

function kCFURLVolumeSupportsCasePreservedNamesKey: CFStringRef;
begin
  if _kCFURLVolumeSupportsCasePreservedNamesKey = nil then
    _kCFURLVolumeSupportsCasePreservedNamesKey := dlsym(CFModule, PAnsiChar('kCFURLVolumeSupportsCasePreservedNamesKey'));
  Result := CFStringRef(_kCFURLVolumeSupportsCasePreservedNamesKey^);
end;

