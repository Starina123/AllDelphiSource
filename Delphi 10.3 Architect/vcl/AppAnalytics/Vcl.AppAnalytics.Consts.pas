{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2016-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Vcl.AppAnalytics.Consts;

interface

resourcestring

SPrivacyMessage = 'Privacy Notice:'#13#10#13#10 +
'This application anonymously tracks your usage and sends it to us for analysis. We use this analysis to make the software work better for you.'#13#10#13#10 +
'This tracking is completely anonymous. No personally identifying information is tracked, and nothing about your usage can be tracked back to you.'#13#10#13#10 +
'Thank you for helping us to improve this software.';

SOneAnalyticsComponentAllowed = 'Only one analytics component can be used per application';

SCBTHookFailed = 'CBT hook could not be installed. Error code: %d';

SInvalidApplicationID = 'Invalid Application ID';


implementation

end.
