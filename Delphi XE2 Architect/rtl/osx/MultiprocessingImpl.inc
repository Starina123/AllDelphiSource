{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2010-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

function MPProcessors; external CarbonCoreLib name '_MPProcessors';
function MPProcessorsScheduled; external CarbonCoreLib name '_MPProcessorsScheduled';
function MPCreateTask; external CarbonCoreLib name '_MPCreateTask';
function MPTerminateTask; external CarbonCoreLib name '_MPTerminateTask';
function MPSetTaskWeight; external CarbonCoreLib name '_MPSetTaskWeight';
function MPTaskIsPreemptive; external CarbonCoreLib name '_MPTaskIsPreemptive';
procedure MPExit; external CarbonCoreLib name '_MPExit';
procedure MPYield; external CarbonCoreLib name '_MPYield';
function MPCurrentTaskID; external CarbonCoreLib name '_MPCurrentTaskID';
function MPSetTaskType; external CarbonCoreLib name '_MPSetTaskType';
function MPAllocateTaskStorageIndex; external CarbonCoreLib name '_MPAllocateTaskStorageIndex';
function MPDeallocateTaskStorageIndex; external CarbonCoreLib name '_MPDeallocateTaskStorageIndex';
function MPSetTaskStorageValue; external CarbonCoreLib name '_MPSetTaskStorageValue';
function MPGetTaskStorageValue; external CarbonCoreLib name '_MPGetTaskStorageValue';
function MPCreateQueue; external CarbonCoreLib name '_MPCreateQueue';
function MPDeleteQueue; external CarbonCoreLib name '_MPDeleteQueue';
function MPNotifyQueue; external CarbonCoreLib name '_MPNotifyQueue';
function MPWaitOnQueue; external CarbonCoreLib name '_MPWaitOnQueue';
function MPSetQueueReserve; external CarbonCoreLib name '_MPSetQueueReserve';
function MPCreateSemaphore; external CarbonCoreLib name '_MPCreateSemaphore';
function MPDeleteSemaphore; external CarbonCoreLib name '_MPDeleteSemaphore';
function MPSignalSemaphore; external CarbonCoreLib name '_MPSignalSemaphore';
function MPWaitOnSemaphore; external CarbonCoreLib name '_MPWaitOnSemaphore';
function MPCreateCriticalRegion; external CarbonCoreLib name '_MPCreateCriticalRegion';
function MPDeleteCriticalRegion; external CarbonCoreLib name '_MPDeleteCriticalRegion';
function MPEnterCriticalRegion; external CarbonCoreLib name '_MPEnterCriticalRegion';
function MPExitCriticalRegion; external CarbonCoreLib name '_MPExitCriticalRegion';
function MPCreateEvent; external CarbonCoreLib name '_MPCreateEvent';
function MPDeleteEvent; external CarbonCoreLib name '_MPDeleteEvent';
function MPSetEvent; external CarbonCoreLib name '_MPSetEvent';
function MPWaitForEvent; external CarbonCoreLib name '_MPWaitForEvent';
function MPCreateNotification; external CarbonCoreLib name '_MPCreateNotification';
function MPDeleteNotification; external CarbonCoreLib name '_MPDeleteNotification';
function MPModifyNotification; external CarbonCoreLib name '_MPModifyNotification';
function MPModifyNotificationParameters; external CarbonCoreLib name '_MPModifyNotificationParameters';
function MPCauseNotification; external CarbonCoreLib name '_MPCauseNotification';
function MPDelayUntil; external CarbonCoreLib name '_MPDelayUntil';
function MPCreateTimer; external CarbonCoreLib name '_MPCreateTimer';
function MPDeleteTimer; external CarbonCoreLib name '_MPDeleteTimer';
function MPSetTimerNotify; external CarbonCoreLib name '_MPSetTimerNotify';
function MPArmTimer; external CarbonCoreLib name '_MPArmTimer';
function MPCancelTimer; external CarbonCoreLib name '_MPCancelTimer';
function MPAllocateAligned; external CarbonCoreLib name '_MPAllocateAligned';
function MPAllocate; external CarbonCoreLib name '_MPAllocate';
procedure MPFree; external CarbonCoreLib name '_MPFree';
function MPGetAllocatedBlockSize; external CarbonCoreLib name '_MPGetAllocatedBlockSize';
procedure MPBlockCopy; external CarbonCoreLib name '_MPBlockCopy';
procedure MPBlockClear; external CarbonCoreLib name '_MPBlockClear';

{$IFNDEF __LP64__}
procedure MPDataToCode; external CarbonCoreLib name '_MPDataToCode';
{$ENDIF __LP64__}

function MPSetExceptionHandler; external CarbonCoreLib name '_MPSetExceptionHandler';
function MPDisposeTaskException; external CarbonCoreLib name '_MPDisposeTaskException';
function MPExtractTaskState; external CarbonCoreLib name '_MPExtractTaskState';
function MPSetTaskState; external CarbonCoreLib name '_MPSetTaskState';
function MPThrowException; external CarbonCoreLib name '_MPThrowException';
function MPRegisterDebugger; external CarbonCoreLib name '_MPRegisterDebugger';
function MPUnregisterDebugger; external CarbonCoreLib name '_MPUnregisterDebugger';
function MPRemoteCall; external CarbonCoreLib name '_MPRemoteCall';
function MPRemoteCallCFM; external CarbonCoreLib name '_MPRemoteCallCFM';
function _MPIsFullyInitialized; external CarbonCoreLib name '__MPIsFullyInitialized';
procedure _MPLibraryVersion; external CarbonCoreLib name '__MPLibraryVersion';
function _MPLibraryIsCompatible; external CarbonCoreLib name '__MPLibraryIsCompatible';

function MPCreateBinarySemaphore(out semaphore: MPSemaphoreID): OSStatus; inline;
begin
  Result := MPCreateSemaphore(1, 1, semaphore);
end;

function MPLibraryIsLoaded: Boolean;
begin
  Result := (@_MPIsFullyInitialized <> nil) and _MPIsFullyInitialized;
{  ( ( (UInt32)_MPIsFullyInitialized != (UInt32)kMPUnresolvedCFragSymbolAddress ) &&   \
      ( _MPIsFullyInitialized () ) )}
end;

