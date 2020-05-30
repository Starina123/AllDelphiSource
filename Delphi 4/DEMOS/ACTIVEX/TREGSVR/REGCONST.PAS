unit regconst;

interface

resourcestring
  SAbout = 'Borland Turbo Register Server -- COM Server Registration utility.' +
    #13#10'Version 1.1.  Copyright (c) 1997,98 Inprise Corporation'#13#10;
  SUsage = 'Syntax: TREGSVR [options] filename'#13#10 +
    '  -u  =  Unregister server or type library'#13#10 +
    '  -q  =  Quiet (silent) operation'#13#10 +
    '  -t  =  Register type library (default for .TLB files)'#13#10;
  SFileNotFound = 'File "%s" not found';
  SCantFindProc = '%s procedure not found in "%s"';
  SRegFail = 'Call to %s failed in "%s"';
  SLoadFail = 'Failed to load "%s"';
  SRegSuccessful = 'Call to %s was successful!';
  SRegStr = 'registered';
  SUnregStr = 'unregistered';
  STlbName = 'Type library name: %s';
  STlbGuid = 'Type library GUID: %s';
  STlbRegSuccessful = 'Type library successfully %s!';
  SCantUnregTlb = 'The version of OLEAUT32.DLL on this machine does not ' +
    'support type library unregistration.';
  SNeedFileExt = 'You must specify a file extension for "%s"';

implementation

end.