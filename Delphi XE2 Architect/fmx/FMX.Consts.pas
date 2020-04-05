{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX.Consts;

interface

resourcestring
  { Error Strings }
  SInvalidPrinterOp       = 'Operation not supported on selected printer';
  SInvalidPrinter         = 'Printer selected is not valid';
  SPrinterIndexError      = 'Printer index out of range';
  SDeviceOnPort           = '%s on %s';
  SNoDefaultPrinter       = 'There is no default printer currently selected';
  SNotPrinting            = 'Printer is not currently printing';
  SPrinting               = 'Printing in progress';
  SInvalidPrinterSettings = 'Invalid printing job settings';
  SInvalidPageFormat      = 'Invalid page format settings';
  SCantStartPrintJob      = 'Cannot start the printing job';
  SCantEndPrintJob        = 'Cannot end the printing job';
  SCantPrintNewPage       = 'Cannot add the page for printing';
  SCantSetNumCopies       = 'Cannot change the number of document copies';

  SInvalidPrinterClass    = 'Invalid printer class: %s';
  SPromptArrayTooShort    = 'Length of value array must be >= length of prompt array';
  SPromptArrayEmpty       = 'Prompt array must not be empty';
  SInvalidColorString     = 'Invalid Color string';

  SInvalidFmxHandle   = 'Invalid FMX Handle: %s%.*x';

  { Dialog Strings }
  SMsgDlgWarning = 'Warning';
  SMsgDlgError = 'Error';
  SMsgDlgInformation = 'Information';
  SMsgDlgConfirm = 'Confirm';
  SMsgDlgYes = '&Yes';
  SMsgDlgNo = '&No';
  SMsgDlgOK = 'OK';
  SMsgDlgCancel = 'Cancel';
  SMsgDlgHelp = '&Help';
  SMsgDlgHelpNone = 'No help available';
  SMsgDlgHelpHelp = 'Help';
  SMsgDlgAbort = '&Abort';
  SMsgDlgRetry = '&Retry';
  SMsgDlgIgnore = '&Ignore';
  SMsgDlgAll = '&All';
  SMsgDlgNoToAll = 'N&o to All';
  SMsgDlgYesToAll = 'Yes to &All';
  SMsgDlgClose = '&Close';

  SUsername = '&Username';
  SPassword = '&Password';
  SDomain = '&Domain';
  SLogin = 'Login';

  { Menus }
  SMenuAppQuit = 'Quit %s';
  SMenuAppQuitKey = 'q';

  SmkcBkSp = 'BkSp';
  SmkcTab = 'Tab';
  SmkcEsc = 'Esc';
  SmkcEnter = 'Enter';
  SmkcSpace = 'Space';
  SmkcPgUp = 'PgUp';
  SmkcPgDn = 'PgDn';
  SmkcEnd = 'End';
  SmkcHome = 'Home';
  SmkcLeft = 'Left';
  SmkcUp = 'Up';
  SmkcRight = 'Right';
  SmkcDown = 'Down';
  SmkcIns = 'Ins';
  SmkcDel = 'Del';
  SmkcShift = 'Shift+';
  SmkcCtrl = 'Ctrl+';
  SmkcAlt = 'Alt+';
  SmkcCmd = 'Cmd+';

  SEditUndo = 'Undo';
  SEditCopy = 'Copy';
  SEditCut = 'Cut';
  SEditPaste = 'Paste';
  SEditDelete = 'Delete';
  SEditSelectAll = 'Select All';

  SAseLexerTokenError = 'ERROR at line %d. %s expected but token %s found.';
  SAseLexerCharError = 'ERROR at line %d. ''%s'' expected but char ''%s'' found.';

  SAseParserWrongMaterialsNumError = 'Wrong materials number';
  SAseParserWrongVertexNumError = 'Wrong vertex number';
  SAseParserWrongNormalNumError = 'Wrong normal number';
  SAseParserWrongTexCoordNumError = 'Wrong texture coord number';
  SAseParserWrongVertexIdxError = 'Wrong vertex index';
  SAseParserWrongFacesNumError = 'Wrong faces number';
  SAseParserWrongFacesIdxError = 'Wrong faces index';
  SAseParserWrongTriangleMeshNumError = 'Wrong triangle mesh number';
  SAseParserWrongTriangleMeshIdxError = 'Wrong triangle mesh index';
  SAseParserWrongTexCoordIdxError = 'Wrong texture coord index';
  SAseParserUnexpectedKyWordError = 'Unexpected key word';

  SIndexDataNotFoundError = 'Index data not found';
  SEffectIdNotFoundError = 'Effect id %s not found';
  SMeshIdNotFoundError = 'Mesh id %s not found';
  SControllerIdNotFoundError = 'Controller id %s not found';

  SCannotCreateCircularDependence = 'Cannot create a circular dependency beetwen components';
  SPropertyOutOfRange = '%s property out of range';

  SPrinterDPIChangeError = 'Active printer DPI can''t be changed while printing';
  SPrinterSettingsReadError = 'Error occured while reading printer settings: %s';
  SPrinterSettingsWriteError = 'Error occured while writing printer settings: %s';


implementation

end.
