unit DelCtrls_TLB;

// ************************************************************************ //
// WARNING                                                                  //
// -------                                                                  //
// The types declared in this file were generated from data read from a     //
// Type Library. If this type library is explicitly or indirectly (via      //
// another type library referring to this type library) re-imported, or the //
// 'Refresh' command of the Type Library Editor activated while editing the //
// Type Library, the contents of this file will be regenerated and all      //
// manual modifications will be lost.                                       //
// ************************************************************************ //

// PASTLWTR : $Revision:   1.11.1.62  $
// File generated on 6/13/98 11:22:32 AM from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\Delphi4\DelCtrls\DelCtrls.tlb
// IID\LCID: {695CDAC9-02E5-11D2-B20D-00C04FA368D4}\0
// Helpfile: 
// HelpString: Delphi 4 AXCtrls Library
// Version:    1.0
// ************************************************************************ //

interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:      //
//   Type Libraries     : LIBID_xxxx                                    //
//   CoClasses          : CLASS_xxxx                                    //
//   DISPInterfaces     : DIID_xxxx                                     //
//   Non-DISP interfaces: IID_xxxx                                      //
// *********************************************************************//
const
  LIBID_DelCtrls: TGUID = '{695CDAC9-02E5-11D2-B20D-00C04FA368D4}';
  IID_IAnimateX: TGUID = '{695CDACA-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IAnimateXEvents: TGUID = '{695CDACC-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_AnimateX: TGUID = '{695CDACE-02E5-11D2-B20D-00C04FA368D4}';
  IID_IButtonX: TGUID = '{695CDAD4-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IButtonXEvents: TGUID = '{695CDAD6-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_ButtonX: TGUID = '{695CDAD8-02E5-11D2-B20D-00C04FA368D4}';
  IID_ICalendarX: TGUID = '{695CDADD-02E5-11D2-B20D-00C04FA368D4}';
  DIID_ICalendarXEvents: TGUID = '{695CDADF-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_CalendarX: TGUID = '{695CDAE1-02E5-11D2-B20D-00C04FA368D4}';
  IID_ICheckBoxX: TGUID = '{695CDAE5-02E5-11D2-B20D-00C04FA368D4}';
  DIID_ICheckBoxXEvents: TGUID = '{695CDAE7-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_CheckBoxX: TGUID = '{695CDAE9-02E5-11D2-B20D-00C04FA368D4}';
  IID_ICheckListBoxX: TGUID = '{695CDAEE-02E5-11D2-B20D-00C04FA368D4}';
  DIID_ICheckListBoxXEvents: TGUID = '{695CDAF0-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_CheckListBoxX: TGUID = '{695CDAF2-02E5-11D2-B20D-00C04FA368D4}';
  IID_IColorGridX: TGUID = '{695CDAF7-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IColorGridXEvents: TGUID = '{695CDAF9-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_ColorGridX: TGUID = '{695CDAFB-02E5-11D2-B20D-00C04FA368D4}';
  IID_IComboBoxX: TGUID = '{695CDAFF-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IComboBoxXEvents: TGUID = '{695CDB01-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_ComboBoxX: TGUID = '{695CDB03-02E5-11D2-B20D-00C04FA368D4}';
  IID_IControlBarX: TGUID = '{695CDB08-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IControlBarXEvents: TGUID = '{695CDB0A-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_ControlBarX: TGUID = '{695CDB0C-02E5-11D2-B20D-00C04FA368D4}';
  IID_IDateTimePickerX: TGUID = '{695CDB11-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IDateTimePickerXEvents: TGUID = '{695CDB13-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_DateTimePickerX: TGUID = '{695CDB15-02E5-11D2-B20D-00C04FA368D4}';
  IID_IDrawGridX: TGUID = '{695CDB1C-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IDrawGridXEvents: TGUID = '{695CDB1E-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_DrawGridX: TGUID = '{695CDB20-02E5-11D2-B20D-00C04FA368D4}';
  IID_IEditX: TGUID = '{695CDB24-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IEditXEvents: TGUID = '{695CDB26-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_EditX: TGUID = '{695CDB28-02E5-11D2-B20D-00C04FA368D4}';
  IID_IGroupBoxX: TGUID = '{695CDB2B-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IGroupBoxXEvents: TGUID = '{695CDB2D-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_GroupBoxX: TGUID = '{695CDB2F-02E5-11D2-B20D-00C04FA368D4}';
  IID_IHotKeyX: TGUID = '{695CDB32-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IHotKeyXEvents: TGUID = '{695CDB34-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_HotKeyX: TGUID = '{695CDB36-02E5-11D2-B20D-00C04FA368D4}';
  IID_IListBoxX: TGUID = '{695CDB39-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IListBoxXEvents: TGUID = '{695CDB3B-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_ListBoxX: TGUID = '{695CDB3D-02E5-11D2-B20D-00C04FA368D4}';
  IID_IMaskEditX: TGUID = '{695CDB40-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IMaskEditXEvents: TGUID = '{695CDB42-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_MaskEditX: TGUID = '{695CDB44-02E5-11D2-B20D-00C04FA368D4}';
  IID_IMediaPlayerX: TGUID = '{695CDB47-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IMediaPlayerXEvents: TGUID = '{695CDB49-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_MediaPlayerX: TGUID = '{695CDB4B-02E5-11D2-B20D-00C04FA368D4}';
  IID_IMemoX: TGUID = '{695CDB53-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IMemoXEvents: TGUID = '{695CDB55-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_MemoX: TGUID = '{695CDB57-02E5-11D2-B20D-00C04FA368D4}';
  IID_IMonthCalendarX: TGUID = '{695CDB5A-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IMonthCalendarXEvents: TGUID = '{695CDB5C-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_MonthCalendarX: TGUID = '{695CDB5E-02E5-11D2-B20D-00C04FA368D4}';
  IID_INotebookX: TGUID = '{695CDB62-02E5-11D2-B20D-00C04FA368D4}';
  DIID_INotebookXEvents: TGUID = '{695CDB64-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_NotebookX: TGUID = '{695CDB66-02E5-11D2-B20D-00C04FA368D4}';
  IID_IOutlineX: TGUID = '{695CDB69-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IOutlineXEvents: TGUID = '{695CDB6B-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_OutlineX: TGUID = '{695CDB6D-02E5-11D2-B20D-00C04FA368D4}';
  IID_IPageScrollerX: TGUID = '{695CDB72-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IPageScrollerXEvents: TGUID = '{695CDB74-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_PageScrollerX: TGUID = '{695CDB76-02E5-11D2-B20D-00C04FA368D4}';
  IID_IPanelX: TGUID = '{695CDB7C-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IPanelXEvents: TGUID = '{695CDB7E-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_PanelX: TGUID = '{695CDB80-02E5-11D2-B20D-00C04FA368D4}';
  IID_IProgressBarX: TGUID = '{695CDB83-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IProgressBarXEvents: TGUID = '{695CDB85-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_ProgressBarX: TGUID = '{695CDB87-02E5-11D2-B20D-00C04FA368D4}';
  IID_IRadioButtonX: TGUID = '{695CDB8B-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IRadioButtonXEvents: TGUID = '{695CDB8D-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_RadioButtonX: TGUID = '{695CDB8F-02E5-11D2-B20D-00C04FA368D4}';
  IID_IRadioGroupX: TGUID = '{695CDB92-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IRadioGroupXEvents: TGUID = '{695CDB94-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_RadioGroupX: TGUID = '{695CDB96-02E5-11D2-B20D-00C04FA368D4}';
  IID_IRichEditX: TGUID = '{695CDB99-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IRichEditXEvents: TGUID = '{695CDB9B-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_RichEditX: TGUID = '{695CDB9D-02E5-11D2-B20D-00C04FA368D4}';
  IID_IScrollBarX: TGUID = '{695CDBA0-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IScrollBarXEvents: TGUID = '{695CDBA2-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_ScrollBarX: TGUID = '{695CDBA4-02E5-11D2-B20D-00C04FA368D4}';
  IID_IScrollBoxX: TGUID = '{695CDBA9-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IScrollBoxXEvents: TGUID = '{695CDBAB-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_ScrollBoxX: TGUID = '{695CDBAD-02E5-11D2-B20D-00C04FA368D4}';
  IID_ISpinButtonX: TGUID = '{695CDBB0-02E5-11D2-B20D-00C04FA368D4}';
  DIID_ISpinButtonXEvents: TGUID = '{695CDBB2-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_SpinButtonX: TGUID = '{695CDBB4-02E5-11D2-B20D-00C04FA368D4}';
  IID_ISpinEditX: TGUID = '{695CDBB7-02E5-11D2-B20D-00C04FA368D4}';
  DIID_ISpinEditXEvents: TGUID = '{695CDBB9-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_SpinEditX: TGUID = '{695CDBBB-02E5-11D2-B20D-00C04FA368D4}';
  IID_IStaticTextX: TGUID = '{695CDBBE-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IStaticTextXEvents: TGUID = '{695CDBC0-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_StaticTextX: TGUID = '{695CDBC2-02E5-11D2-B20D-00C04FA368D4}';
  IID_IStringGridX: TGUID = '{695CDBC6-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IStringGridXEvents: TGUID = '{695CDBC8-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_StringGridX: TGUID = '{695CDBCA-02E5-11D2-B20D-00C04FA368D4}';
  IID_ITabbedNotebookX: TGUID = '{695CDBCD-02E5-11D2-B20D-00C04FA368D4}';
  DIID_ITabbedNotebookXEvents: TGUID = '{695CDBCF-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_TabbedNotebookX: TGUID = '{695CDBD1-02E5-11D2-B20D-00C04FA368D4}';
  IID_ITabControlX: TGUID = '{695CDBD4-02E5-11D2-B20D-00C04FA368D4}';
  DIID_ITabControlXEvents: TGUID = '{695CDBD6-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_TabControlX: TGUID = '{695CDBD8-02E5-11D2-B20D-00C04FA368D4}';
  IID_ITabSetX: TGUID = '{695CDBDD-02E5-11D2-B20D-00C04FA368D4}';
  DIID_ITabSetXEvents: TGUID = '{695CDBDF-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_TabSetX: TGUID = '{695CDBE1-02E5-11D2-B20D-00C04FA368D4}';
  IID_ITrackBarX: TGUID = '{695CDBE4-02E5-11D2-B20D-00C04FA368D4}';
  DIID_ITrackBarXEvents: TGUID = '{695CDBE6-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_TrackBarX: TGUID = '{695CDBE8-02E5-11D2-B20D-00C04FA368D4}';
  IID_IUpDownX: TGUID = '{695CDBEE-02E5-11D2-B20D-00C04FA368D4}';
  DIID_IUpDownXEvents: TGUID = '{695CDBF0-02E5-11D2-B20D-00C04FA368D4}';
  CLASS_UpDownX: TGUID = '{695CDBF2-02E5-11D2-B20D-00C04FA368D4}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                  //
// *********************************************************************//
// TxCommonAVI constants
type
  TxCommonAVI = TOleEnum;
const
  aviNone = $00000000;
  aviFindFolder = $00000001;
  aviFindFile = $00000002;
  aviFindComputer = $00000003;
  aviCopyFiles = $00000004;
  aviCopyFile = $00000005;
  aviRecycleFile = $00000006;
  aviEmptyRecycle = $00000007;
  aviDeleteFile = $00000008;

// TxAlignment constants
type
  TxAlignment = TOleEnum;
const
  taLeftJustify = $00000000;
  taRightJustify = $00000001;
  taCenter = $00000002;

// TxBiDiMode constants
type
  TxBiDiMode = TOleEnum;
const
  bdLeftToRight = $00000000;
  bdRightToLeft = $00000001;
  bdRightToLeftNoAlign = $00000002;
  bdRightToLeftReadingOnly = $00000003;

// TxDragMode constants
type
  TxDragMode = TOleEnum;
const
  dmManual = $00000000;
  dmAutomatic = $00000001;

// TxMouseButton constants
type
  TxMouseButton = TOleEnum;
const
  mbLeft = $00000000;
  mbRight = $00000001;
  mbMiddle = $00000002;

// TxBorderStyle constants
type
  TxBorderStyle = TOleEnum;
const
  bsNone = $00000000;
  bsSingle = $00000001;

// TxLeftRight constants
type
  TxLeftRight = TOleEnum;
const
  taLeftJustify_ = $00000000;
  taRightJustify_ = $00000001;

// TxCheckBoxState constants
type
  TxCheckBoxState = TOleEnum;
const
  cbUnchecked = $00000000;
  cbChecked = $00000001;
  cbGrayed = $00000002;

// TxImeMode constants
type
  TxImeMode = TOleEnum;
const
  imDisable = $00000000;
  imClose = $00000001;
  imOpen = $00000002;
  imDontCare = $00000003;
  imSAlpha = $00000004;
  imAlpha = $00000005;
  imHira = $00000006;
  imSKata = $00000007;
  imKata = $00000008;
  imChinese = $00000009;
  imSHanguel = $0000000A;
  imHanguel = $0000000B;

// TxListBoxStyle constants
type
  TxListBoxStyle = TOleEnum;
const
  lbStandard = $00000000;
  lbOwnerDrawFixed = $00000001;
  lbOwnerDrawVariable = $00000002;

// TxGridOrdering constants
type
  TxGridOrdering = TOleEnum;
const
  go16x1 = $00000000;
  go8x2 = $00000001;
  go4x4 = $00000002;
  go2x8 = $00000003;
  go1x16 = $00000004;

// TxComboBoxStyle constants
type
  TxComboBoxStyle = TOleEnum;
const
  csDropDown = $00000000;
  csSimple = $00000001;
  csDropDownList = $00000002;
  csOwnerDrawFixed = $00000003;
  csOwnerDrawVariable = $00000004;

// TxEditCharCase constants
type
  TxEditCharCase = TOleEnum;
const
  ecNormal = $00000000;
  ecUpperCase = $00000001;
  ecLowerCase = $00000002;

// TxBevelCut constants
type
  TxBevelCut = TOleEnum;
const
  bvNone = $00000000;
  bvLowered = $00000001;
  bvRaised = $00000002;
  bvSpace = $00000003;

// TxBevelKind constants
type
  TxBevelKind = TOleEnum;
const
  bkNone = $00000000;
  bkTile = $00000001;
  bkSoft = $00000002;
  bkFlat = $00000003;

// TxDTCalAlignment constants
type
  TxDTCalAlignment = TOleEnum;
const
  dtaLeft = $00000000;
  dtaRight = $00000001;

// TxDTDateFormat constants
type
  TxDTDateFormat = TOleEnum;
const
  dfShort = $00000000;
  dfLong = $00000001;

// TxDTDateMode constants
type
  TxDTDateMode = TOleEnum;
const
  dmComboBox = $00000000;
  dmUpDown = $00000001;

// TxDateTimeKind constants
type
  TxDateTimeKind = TOleEnum;
const
  dtkDate = $00000000;
  dtkTime = $00000001;

// TxScrollStyle constants
type
  TxScrollStyle = TOleEnum;
const
  ssNone = $00000000;
  ssHorizontal = $00000001;
  ssVertical = $00000002;
  ssBoth = $00000003;

// TxMPModes constants
type
  TxMPModes = TOleEnum;
const
  mpNotReady = $00000000;
  mpStopped = $00000001;
  mpPlaying = $00000002;
  mpRecording = $00000003;
  mpSeeking = $00000004;
  mpPaused = $00000005;
  mpOpen = $00000006;

// TxMPNotifyValues constants
type
  TxMPNotifyValues = TOleEnum;
const
  nvSuccessful = $00000000;
  nvSuperseded = $00000001;
  nvAborted = $00000002;
  nvFailure = $00000003;

// TxMPTimeFormats constants
type
  TxMPTimeFormats = TOleEnum;
const
  tfMilliseconds = $00000000;
  tfHMS = $00000001;
  tfMSF = $00000002;
  tfFrames = $00000003;
  tfSMPTE24 = $00000004;
  tfSMPTE25 = $00000005;
  tfSMPTE30 = $00000006;
  tfSMPTE30Drop = $00000007;
  tfBytes = $00000008;
  tfSamples = $00000009;
  tfTMSF = $0000000A;

// TxMPDeviceTypes constants
type
  TxMPDeviceTypes = TOleEnum;
const
  dtAutoSelect = $00000000;
  dtAVIVideo = $00000001;
  dtCDAudio = $00000002;
  dtDAT = $00000003;
  dtDigitalVideo = $00000004;
  dtMMMovie = $00000005;
  dtOther = $00000006;
  dtOverlay = $00000007;
  dtScanner = $00000008;
  dtSequencer = $00000009;
  dtVCR = $0000000A;
  dtVideodisc = $0000000B;
  dtWaveAudio = $0000000C;

// TxMPBtnType constants
type
  TxMPBtnType = TOleEnum;
const
  btPlay = $00000000;
  btPause = $00000001;
  btStop = $00000002;
  btNext = $00000003;
  btPrev = $00000004;
  btStep = $00000005;
  btBack = $00000006;
  btRecord = $00000007;
  btEject = $00000008;

// TxCalDayOfWeek constants
type
  TxCalDayOfWeek = TOleEnum;
const
  dowMonday = $00000000;
  dowTuesday = $00000001;
  dowWednesday = $00000002;
  dowThursday = $00000003;
  dowFriday = $00000004;
  dowSaturday = $00000005;
  dowSunday = $00000006;
  dowLocaleDefault = $00000007;

// TxOutlineStyle constants
type
  TxOutlineStyle = TOleEnum;
const
  osText = $00000000;
  osPlusMinusText = $00000001;
  osPictureText = $00000002;
  osPlusMinusPictureText = $00000003;
  osTreeText = $00000004;
  osTreePictureText = $00000005;

// TxOutlineType constants
type
  TxOutlineType = TOleEnum;
const
  otStandard = $00000000;
  otOwnerDraw = $00000001;

// TxPageScrollerButtonState constants
type
  TxPageScrollerButtonState = TOleEnum;
const
  bsNormal = $00000000;
  bsInvisible = $00000001;
  bsGrayed = $00000002;
  bsDepressed = $00000003;
  bsHot = $00000004;

// TxPageScrollerButton constants
type
  TxPageScrollerButton = TOleEnum;
const
  sbFirst = $00000000;
  sbLast = $00000001;

// TxPageScrollerOrientation constants
type
  TxPageScrollerOrientation = TOleEnum;
const
  soHorizontal = $00000000;
  soVertical = $00000001;

// TxProgressBarOrientation constants
type
  TxProgressBarOrientation = TOleEnum;
const
  pbHorizontal = $00000000;
  pbVertical = $00000001;

// TxScrollBarKind constants
type
  TxScrollBarKind = TOleEnum;
const
  sbHorizontal = $00000000;
  sbVertical = $00000001;

// TxScrollCode constants
type
  TxScrollCode = TOleEnum;
const
  scLineUp = $00000000;
  scLineDown = $00000001;
  scPageUp = $00000002;
  scPageDown = $00000003;
  scPosition = $00000004;
  scTrack = $00000005;
  scTop = $00000006;
  scBottom = $00000007;
  scEndScroll = $00000008;

// TxStaticBorderStyle constants
type
  TxStaticBorderStyle = TOleEnum;
const
  sbsNone = $00000000;
  sbsSingle = $00000001;
  sbsSunken = $00000002;

// TxTabStyle constants
type
  TxTabStyle = TOleEnum;
const
  tsTabs = $00000000;
  tsButtons = $00000001;
  tsFlatButtons = $00000002;

// TxTabPosition constants
type
  TxTabPosition = TOleEnum;
const
  tpTop = $00000000;
  tpBottom = $00000001;
  tpLeft = $00000002;
  tpRight = $00000003;

// TxTrackBarOrientation constants
type
  TxTrackBarOrientation = TOleEnum;
const
  trHorizontal = $00000000;
  trVertical = $00000001;

// TxTickMark constants
type
  TxTickMark = TOleEnum;
const
  tmBottomRight = $00000000;
  tmTopLeft = $00000001;
  tmBoth = $00000002;

// TxTickStyle constants
type
  TxTickStyle = TOleEnum;
const
  tsNone = $00000000;
  tsAuto = $00000001;
  tsManual = $00000002;

// TxUDAlignButton constants
type
  TxUDAlignButton = TOleEnum;
const
  udLeft = $00000000;
  udRight = $00000001;

// TxUDOrientation constants
type
  TxUDOrientation = TOleEnum;
const
  udHorizontal = $00000000;
  udVertical = $00000001;

// TxUDBtnType constants
type
  TxUDBtnType = TOleEnum;
const
  btNext_ = $00000000;
  btPrev_ = $00000001;

type

// *********************************************************************//
// Forward declaration of interfaces defined in Type Library            //
// *********************************************************************//
  IAnimateX = interface;
  IAnimateXDisp = dispinterface;
  IAnimateXEvents = dispinterface;
  IButtonX = interface;
  IButtonXDisp = dispinterface;
  IButtonXEvents = dispinterface;
  ICalendarX = interface;
  ICalendarXDisp = dispinterface;
  ICalendarXEvents = dispinterface;
  ICheckBoxX = interface;
  ICheckBoxXDisp = dispinterface;
  ICheckBoxXEvents = dispinterface;
  ICheckListBoxX = interface;
  ICheckListBoxXDisp = dispinterface;
  ICheckListBoxXEvents = dispinterface;
  IColorGridX = interface;
  IColorGridXDisp = dispinterface;
  IColorGridXEvents = dispinterface;
  IComboBoxX = interface;
  IComboBoxXDisp = dispinterface;
  IComboBoxXEvents = dispinterface;
  IControlBarX = interface;
  IControlBarXDisp = dispinterface;
  IControlBarXEvents = dispinterface;
  IDateTimePickerX = interface;
  IDateTimePickerXDisp = dispinterface;
  IDateTimePickerXEvents = dispinterface;
  IDrawGridX = interface;
  IDrawGridXDisp = dispinterface;
  IDrawGridXEvents = dispinterface;
  IEditX = interface;
  IEditXDisp = dispinterface;
  IEditXEvents = dispinterface;
  IGroupBoxX = interface;
  IGroupBoxXDisp = dispinterface;
  IGroupBoxXEvents = dispinterface;
  IHotKeyX = interface;
  IHotKeyXDisp = dispinterface;
  IHotKeyXEvents = dispinterface;
  IListBoxX = interface;
  IListBoxXDisp = dispinterface;
  IListBoxXEvents = dispinterface;
  IMaskEditX = interface;
  IMaskEditXDisp = dispinterface;
  IMaskEditXEvents = dispinterface;
  IMediaPlayerX = interface;
  IMediaPlayerXDisp = dispinterface;
  IMediaPlayerXEvents = dispinterface;
  IMemoX = interface;
  IMemoXDisp = dispinterface;
  IMemoXEvents = dispinterface;
  IMonthCalendarX = interface;
  IMonthCalendarXDisp = dispinterface;
  IMonthCalendarXEvents = dispinterface;
  INotebookX = interface;
  INotebookXDisp = dispinterface;
  INotebookXEvents = dispinterface;
  IOutlineX = interface;
  IOutlineXDisp = dispinterface;
  IOutlineXEvents = dispinterface;
  IPageScrollerX = interface;
  IPageScrollerXDisp = dispinterface;
  IPageScrollerXEvents = dispinterface;
  IPanelX = interface;
  IPanelXDisp = dispinterface;
  IPanelXEvents = dispinterface;
  IProgressBarX = interface;
  IProgressBarXDisp = dispinterface;
  IProgressBarXEvents = dispinterface;
  IRadioButtonX = interface;
  IRadioButtonXDisp = dispinterface;
  IRadioButtonXEvents = dispinterface;
  IRadioGroupX = interface;
  IRadioGroupXDisp = dispinterface;
  IRadioGroupXEvents = dispinterface;
  IRichEditX = interface;
  IRichEditXDisp = dispinterface;
  IRichEditXEvents = dispinterface;
  IScrollBarX = interface;
  IScrollBarXDisp = dispinterface;
  IScrollBarXEvents = dispinterface;
  IScrollBoxX = interface;
  IScrollBoxXDisp = dispinterface;
  IScrollBoxXEvents = dispinterface;
  ISpinButtonX = interface;
  ISpinButtonXDisp = dispinterface;
  ISpinButtonXEvents = dispinterface;
  ISpinEditX = interface;
  ISpinEditXDisp = dispinterface;
  ISpinEditXEvents = dispinterface;
  IStaticTextX = interface;
  IStaticTextXDisp = dispinterface;
  IStaticTextXEvents = dispinterface;
  IStringGridX = interface;
  IStringGridXDisp = dispinterface;
  IStringGridXEvents = dispinterface;
  ITabbedNotebookX = interface;
  ITabbedNotebookXDisp = dispinterface;
  ITabbedNotebookXEvents = dispinterface;
  ITabControlX = interface;
  ITabControlXDisp = dispinterface;
  ITabControlXEvents = dispinterface;
  ITabSetX = interface;
  ITabSetXDisp = dispinterface;
  ITabSetXEvents = dispinterface;
  ITrackBarX = interface;
  ITrackBarXDisp = dispinterface;
  ITrackBarXEvents = dispinterface;
  IUpDownX = interface;
  IUpDownXDisp = dispinterface;
  IUpDownXEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                     //
// (NOTE: Here we map each CoClass to its Default Interface)            //
// *********************************************************************//
  AnimateX = IAnimateX;
  ButtonX = IButtonX;
  CalendarX = ICalendarX;
  CheckBoxX = ICheckBoxX;
  CheckListBoxX = ICheckListBoxX;
  ColorGridX = IColorGridX;
  ComboBoxX = IComboBoxX;
  ControlBarX = IControlBarX;
  DateTimePickerX = IDateTimePickerX;
  DrawGridX = IDrawGridX;
  EditX = IEditX;
  GroupBoxX = IGroupBoxX;
  HotKeyX = IHotKeyX;
  ListBoxX = IListBoxX;
  MaskEditX = IMaskEditX;
  MediaPlayerX = IMediaPlayerX;
  MemoX = IMemoX;
  MonthCalendarX = IMonthCalendarX;
  NotebookX = INotebookX;
  OutlineX = IOutlineX;
  PageScrollerX = IPageScrollerX;
  PanelX = IPanelX;
  ProgressBarX = IProgressBarX;
  RadioButtonX = IRadioButtonX;
  RadioGroupX = IRadioGroupX;
  RichEditX = IRichEditX;
  ScrollBarX = IScrollBarX;
  ScrollBoxX = IScrollBoxX;
  SpinButtonX = ISpinButtonX;
  SpinEditX = ISpinEditX;
  StaticTextX = IStaticTextX;
  StringGridX = IStringGridX;
  TabbedNotebookX = ITabbedNotebookX;
  TabControlX = ITabControlX;
  TabSetX = ITabSetX;
  TrackBarX = ITrackBarX;
  UpDownX = IUpDownX;


// *********************************************************************//
// Interface: IAnimateX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDACA-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IAnimateX = interface(IDispatch)
    ['{695CDACA-02E5-11D2-B20D-00C04FA368D4}']
    function Get_FrameCount: Integer; safecall;
    function Get_FrameHeight: Integer; safecall;
    function Get_FrameWidth: Integer; safecall;
    function Get_Open: WordBool; safecall;
    procedure Set_Open(Value: WordBool); safecall;
    procedure Play(FromFrame: Smallint; ToFrame: Smallint; Count: Integer); safecall;
    procedure Reset; safecall;
    procedure Seek(Frame: Smallint); safecall;
    procedure Stop; safecall;
    function Get_ResHandle: Integer; safecall;
    procedure Set_ResHandle(Value: Integer); safecall;
    function Get_ResId: Integer; safecall;
    procedure Set_ResId(Value: Integer); safecall;
    function Get_ResName: WideString; safecall;
    procedure Set_ResName(const Value: WideString); safecall;
    function Get_Active: WordBool; safecall;
    procedure Set_Active(Value: WordBool); safecall;
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_Center: WordBool; safecall;
    procedure Set_Center(Value: WordBool); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_CommonAVI: TxCommonAVI; safecall;
    procedure Set_CommonAVI(Value: TxCommonAVI); safecall;
    function Get_FileName: WideString; safecall;
    procedure Set_FileName(const Value: WideString); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_Repetitions: Integer; safecall;
    procedure Set_Repetitions(Value: Integer); safecall;
    function Get_StartFrame: Smallint; safecall;
    procedure Set_StartFrame(Value: Smallint); safecall;
    function Get_StopFrame: Smallint; safecall;
    procedure Set_StopFrame(Value: Smallint); safecall;
    function Get_Timers: WordBool; safecall;
    procedure Set_Timers(Value: WordBool); safecall;
    function Get_Transparent: WordBool; safecall;
    procedure Set_Transparent(Value: WordBool); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property FrameCount: Integer read Get_FrameCount;
    property FrameHeight: Integer read Get_FrameHeight;
    property FrameWidth: Integer read Get_FrameWidth;
    property Open: WordBool read Get_Open write Set_Open;
    property ResHandle: Integer read Get_ResHandle write Set_ResHandle;
    property ResId: Integer read Get_ResId write Set_ResId;
    property ResName: WideString read Get_ResName write Set_ResName;
    property Active: WordBool read Get_Active write Set_Active;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property Center: WordBool read Get_Center write Set_Center;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property CommonAVI: TxCommonAVI read Get_CommonAVI write Set_CommonAVI;
    property FileName: WideString read Get_FileName write Set_FileName;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property Repetitions: Integer read Get_Repetitions write Set_Repetitions;
    property StartFrame: Smallint read Get_StartFrame write Set_StartFrame;
    property StopFrame: Smallint read Get_StopFrame write Set_StopFrame;
    property Timers: WordBool read Get_Timers write Set_Timers;
    property Transparent: WordBool read Get_Transparent write Set_Transparent;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IAnimateXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDACA-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IAnimateXDisp = dispinterface
    ['{695CDACA-02E5-11D2-B20D-00C04FA368D4}']
    property FrameCount: Integer readonly dispid 1;
    property FrameHeight: Integer readonly dispid 2;
    property FrameWidth: Integer readonly dispid 3;
    property Open: WordBool dispid 4;
    procedure Play(FromFrame: Smallint; ToFrame: Smallint; Count: Integer); dispid 5;
    procedure Reset; dispid 6;
    procedure Seek(Frame: Smallint); dispid 7;
    procedure Stop; dispid 8;
    property ResHandle: Integer dispid 9;
    property ResId: Integer dispid 10;
    property ResName: WideString dispid 11;
    property Active: WordBool dispid 12;
    property AutoSize: WordBool dispid 13;
    property Center: WordBool dispid 14;
    property Color: OLE_COLOR dispid -501;
    property CommonAVI: TxCommonAVI dispid 15;
    property FileName: WideString dispid 16;
    property ParentColor: WordBool dispid 17;
    property Repetitions: Integer dispid 18;
    property StartFrame: Smallint dispid 19;
    property StopFrame: Smallint dispid 20;
    property Timers: WordBool dispid 21;
    property Transparent: WordBool dispid 22;
    property Visible: WordBool dispid 23;
    property DoubleBuffered: WordBool dispid 26;
    procedure FlipChildren(AllLevels: WordBool); dispid 27;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 30;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 31;
    property Enabled: WordBool dispid -514;
    function GetControlsAlignment: TxAlignment; dispid 32;
    procedure InitiateAction; dispid 34;
    function IsRightToLeft: WordBool; dispid 35;
    function UseRightToLeftAlignment: WordBool; dispid 40;
    function UseRightToLeftReading: WordBool; dispid 41;
    function UseRightToLeftScrollBar: WordBool; dispid 42;
    property BiDiMode: TxBiDiMode dispid 43;
    property Cursor: Smallint dispid 44;
    function ClassNameIs(const Name: WideString): WordBool; dispid 48;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IAnimateXEvents
// Flags:     (0)
// GUID:      {695CDACC-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IAnimateXEvents = dispinterface
    ['{695CDACC-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnOpen; dispid 1;
    procedure OnClose; dispid 2;
    procedure OnStart; dispid 3;
    procedure OnStop; dispid 4;
  end;

// *********************************************************************//
// Interface: IButtonX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDAD4-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IButtonX = interface(IDispatch)
    ['{695CDAD4-02E5-11D2-B20D-00C04FA368D4}']
    procedure Click; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Cancel: WordBool; safecall;
    procedure Set_Cancel(Value: WordBool); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Default: WordBool; safecall;
    procedure Set_Default(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Cancel: WordBool read Get_Cancel write Set_Cancel;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Default: WordBool read Get_Default write Set_Default;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IButtonXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDAD4-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IButtonXDisp = dispinterface
    ['{695CDAD4-02E5-11D2-B20D-00C04FA368D4}']
    procedure Click; dispid 1;
    function UseRightToLeftAlignment: WordBool; dispid 2;
    property BiDiMode: TxBiDiMode dispid 3;
    property Cancel: WordBool dispid 4;
    property Caption: WideString dispid -518;
    property Default: WordBool dispid 5;
    property DragCursor: Smallint dispid 6;
    property DragMode: TxDragMode dispid 7;
    property Enabled: WordBool dispid -514;
    property Font: IFontDisp dispid -512;
    property ParentFont: WordBool dispid 8;
    property Visible: WordBool dispid 9;
    property DoubleBuffered: WordBool dispid 12;
    procedure FlipChildren(AllLevels: WordBool); dispid 13;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 16;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 17;
    function GetControlsAlignment: TxAlignment; dispid 18;
    procedure InitiateAction; dispid 20;
    function IsRightToLeft: WordBool; dispid 21;
    function UseRightToLeftReading: WordBool; dispid 26;
    function UseRightToLeftScrollBar: WordBool; dispid 27;
    property Cursor: Smallint dispid 28;
    function ClassNameIs(const Name: WideString): WordBool; dispid 32;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IButtonXEvents
// Flags:     (0)
// GUID:      {695CDAD6-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IButtonXEvents = dispinterface
    ['{695CDAD6-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnClick; dispid 1;
    procedure OnKeyPress(var Key: Smallint); dispid 7;
  end;

// *********************************************************************//
// Interface: ICalendarX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDADD-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ICalendarX = interface(IDispatch)
    ['{695CDADD-02E5-11D2-B20D-00C04FA368D4}']
    function Get_CalendarDate: Double; safecall;
    procedure Set_CalendarDate(Value: Double); safecall;
    procedure NextMonth; safecall;
    procedure NextYear; safecall;
    procedure PrevMonth; safecall;
    procedure PrevYear; safecall;
    procedure UpdateCalendar; safecall;
    function Get_BorderStyle: TxBorderStyle; safecall;
    procedure Set_BorderStyle(Value: TxBorderStyle); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_Day: Integer; safecall;
    procedure Set_Day(Value: Integer); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_GridLineWidth: Integer; safecall;
    procedure Set_GridLineWidth(Value: Integer); safecall;
    function Get_Month: Integer; safecall;
    procedure Set_Month(Value: Integer); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_ReadOnly: WordBool; safecall;
    procedure Set_ReadOnly(Value: WordBool); safecall;
    function Get_StartOfWeek: Smallint; safecall;
    procedure Set_StartOfWeek(Value: Smallint); safecall;
    function Get_UseCurrentDate: WordBool; safecall;
    procedure Set_UseCurrentDate(Value: WordBool); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_Year: Integer; safecall;
    procedure Set_Year(Value: Integer); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property CalendarDate: Double read Get_CalendarDate write Set_CalendarDate;
    property BorderStyle: TxBorderStyle read Get_BorderStyle write Set_BorderStyle;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property Day: Integer read Get_Day write Set_Day;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property GridLineWidth: Integer read Get_GridLineWidth write Set_GridLineWidth;
    property Month: Integer read Get_Month write Set_Month;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property ReadOnly: WordBool read Get_ReadOnly write Set_ReadOnly;
    property StartOfWeek: Smallint read Get_StartOfWeek write Set_StartOfWeek;
    property UseCurrentDate: WordBool read Get_UseCurrentDate write Set_UseCurrentDate;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property Year: Integer read Get_Year write Set_Year;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  ICalendarXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDADD-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ICalendarXDisp = dispinterface
    ['{695CDADD-02E5-11D2-B20D-00C04FA368D4}']
    property CalendarDate: Double dispid 1;
    procedure NextMonth; dispid 2;
    procedure NextYear; dispid 3;
    procedure PrevMonth; dispid 4;
    procedure PrevYear; dispid 5;
    procedure UpdateCalendar; dispid 6;
    property BorderStyle: TxBorderStyle dispid 7;
    property Color: OLE_COLOR dispid -501;
    property Ctl3D: WordBool dispid 8;
    property Day: Integer dispid 9;
    property DragCursor: Smallint dispid 10;
    property DragMode: TxDragMode dispid 11;
    property Enabled: WordBool dispid -514;
    property Font: IFontDisp dispid -512;
    property GridLineWidth: Integer dispid 12;
    property Month: Integer dispid 13;
    property ParentColor: WordBool dispid 14;
    property ParentFont: WordBool dispid 15;
    property ReadOnly: WordBool dispid 16;
    property StartOfWeek: Smallint dispid 17;
    property UseCurrentDate: WordBool dispid 18;
    property Visible: WordBool dispid 19;
    property Year: Integer dispid 20;
    property DoubleBuffered: WordBool dispid 23;
    procedure FlipChildren(AllLevels: WordBool); dispid 24;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 27;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 28;
    function GetControlsAlignment: TxAlignment; dispid 29;
    procedure InitiateAction; dispid 31;
    function IsRightToLeft: WordBool; dispid 32;
    function UseRightToLeftAlignment: WordBool; dispid 37;
    function UseRightToLeftReading: WordBool; dispid 38;
    function UseRightToLeftScrollBar: WordBool; dispid 39;
    property BiDiMode: TxBiDiMode dispid 40;
    property Cursor: Smallint dispid 41;
    function ClassNameIs(const Name: WideString): WordBool; dispid 45;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  ICalendarXEvents
// Flags:     (0)
// GUID:      {695CDADF-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ICalendarXEvents = dispinterface
    ['{695CDADF-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnClick; dispid 1;
    procedure OnChange; dispid 2;
    procedure OnDblClick; dispid 3;
    procedure OnKeyPress(var Key: Smallint); dispid 9;
  end;

// *********************************************************************//
// Interface: ICheckBoxX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDAE5-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ICheckBoxX = interface(IDispatch)
    ['{695CDAE5-02E5-11D2-B20D-00C04FA368D4}']
    function Get_Alignment: TxLeftRight; safecall;
    procedure Set_Alignment(Value: TxLeftRight); safecall;
    function Get_AllowGrayed: WordBool; safecall;
    procedure Set_AllowGrayed(Value: WordBool); safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Checked: WordBool; safecall;
    procedure Set_Checked(Value: WordBool); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_State: TxCheckBoxState; safecall;
    procedure Set_State(Value: TxCheckBoxState); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property Alignment: TxLeftRight read Get_Alignment write Set_Alignment;
    property AllowGrayed: WordBool read Get_AllowGrayed write Set_AllowGrayed;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Checked: WordBool read Get_Checked write Set_Checked;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property State: TxCheckBoxState read Get_State write Set_State;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  ICheckBoxXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDAE5-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ICheckBoxXDisp = dispinterface
    ['{695CDAE5-02E5-11D2-B20D-00C04FA368D4}']
    property Alignment: TxLeftRight dispid 1;
    property AllowGrayed: WordBool dispid 2;
    property BiDiMode: TxBiDiMode dispid 3;
    property Caption: WideString dispid -518;
    property Checked: WordBool dispid 4;
    property Color: OLE_COLOR dispid -501;
    property Ctl3D: WordBool dispid 5;
    property DragCursor: Smallint dispid 6;
    property DragMode: TxDragMode dispid 7;
    property Enabled: WordBool dispid -514;
    property Font: IFontDisp dispid -512;
    property ParentColor: WordBool dispid 8;
    property ParentCtl3D: WordBool dispid 9;
    property ParentFont: WordBool dispid 10;
    property State: TxCheckBoxState dispid 11;
    property Visible: WordBool dispid 12;
    function GetControlsAlignment: TxAlignment; dispid 13;
    property DoubleBuffered: WordBool dispid 16;
    procedure FlipChildren(AllLevels: WordBool); dispid 17;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 20;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 21;
    procedure InitiateAction; dispid 23;
    function IsRightToLeft: WordBool; dispid 24;
    function UseRightToLeftAlignment: WordBool; dispid 29;
    function UseRightToLeftReading: WordBool; dispid 30;
    function UseRightToLeftScrollBar: WordBool; dispid 31;
    property Cursor: Smallint dispid 32;
    function ClassNameIs(const Name: WideString): WordBool; dispid 36;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  ICheckBoxXEvents
// Flags:     (0)
// GUID:      {695CDAE7-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ICheckBoxXEvents = dispinterface
    ['{695CDAE7-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnClick; dispid 1;
    procedure OnKeyPress(var Key: Smallint); dispid 7;
  end;

// *********************************************************************//
// Interface: ICheckListBoxX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDAEE-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ICheckListBoxX = interface(IDispatch)
    ['{695CDAEE-02E5-11D2-B20D-00C04FA368D4}']
    function Get_AllowGrayed: WordBool; safecall;
    procedure Set_AllowGrayed(Value: WordBool); safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_BorderStyle: TxBorderStyle; safecall;
    procedure Set_BorderStyle(Value: TxBorderStyle); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Columns: Integer; safecall;
    procedure Set_Columns(Value: Integer); safecall;
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Flat: WordBool; safecall;
    procedure Set_Flat(Value: WordBool); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_ImeMode: TxImeMode; safecall;
    procedure Set_ImeMode(Value: TxImeMode); safecall;
    function Get_ImeName: WideString; safecall;
    procedure Set_ImeName(const Value: WideString); safecall;
    function Get_IntegralHeight: WordBool; safecall;
    procedure Set_IntegralHeight(Value: WordBool); safecall;
    function Get_ItemHeight: Integer; safecall;
    procedure Set_ItemHeight(Value: Integer); safecall;
    function Get_Items: IStrings; safecall;
    procedure Set_Items(const Value: IStrings); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_Sorted: WordBool; safecall;
    procedure Set_Sorted(Value: WordBool); safecall;
    function Get_Style: TxListBoxStyle; safecall;
    procedure Set_Style(Value: TxListBoxStyle); safecall;
    function Get_TabWidth: Integer; safecall;
    procedure Set_TabWidth(Value: Integer); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure Clear; safecall;
    function Get_ItemIndex: Integer; safecall;
    procedure Set_ItemIndex(Value: Integer); safecall;
    function Get_SelCount: Integer; safecall;
    function Get_TopIndex: Integer; safecall;
    procedure Set_TopIndex(Value: Integer); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property AllowGrayed: WordBool read Get_AllowGrayed write Set_AllowGrayed;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property BorderStyle: TxBorderStyle read Get_BorderStyle write Set_BorderStyle;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Columns: Integer read Get_Columns write Set_Columns;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Flat: WordBool read Get_Flat write Set_Flat;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property ImeMode: TxImeMode read Get_ImeMode write Set_ImeMode;
    property ImeName: WideString read Get_ImeName write Set_ImeName;
    property IntegralHeight: WordBool read Get_IntegralHeight write Set_IntegralHeight;
    property ItemHeight: Integer read Get_ItemHeight write Set_ItemHeight;
    property Items: IStrings read Get_Items write Set_Items;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property Sorted: WordBool read Get_Sorted write Set_Sorted;
    property Style: TxListBoxStyle read Get_Style write Set_Style;
    property TabWidth: Integer read Get_TabWidth write Set_TabWidth;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property ItemIndex: Integer read Get_ItemIndex write Set_ItemIndex;
    property SelCount: Integer read Get_SelCount;
    property TopIndex: Integer read Get_TopIndex write Set_TopIndex;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  ICheckListBoxXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDAEE-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ICheckListBoxXDisp = dispinterface
    ['{695CDAEE-02E5-11D2-B20D-00C04FA368D4}']
    property AllowGrayed: WordBool dispid 1;
    property BiDiMode: TxBiDiMode dispid 2;
    property BorderStyle: TxBorderStyle dispid 3;
    property Color: OLE_COLOR dispid -501;
    property Columns: Integer dispid 4;
    property Ctl3D: WordBool dispid 5;
    property DragCursor: Smallint dispid 6;
    property DragMode: TxDragMode dispid 7;
    property Enabled: WordBool dispid -514;
    property Flat: WordBool dispid 8;
    property Font: IFontDisp dispid -512;
    property ImeMode: TxImeMode dispid 9;
    property ImeName: WideString dispid 10;
    property IntegralHeight: WordBool dispid 11;
    property ItemHeight: Integer dispid 12;
    property Items: IStrings dispid 13;
    property ParentColor: WordBool dispid 14;
    property ParentCtl3D: WordBool dispid 15;
    property ParentFont: WordBool dispid 16;
    property Sorted: WordBool dispid 17;
    property Style: TxListBoxStyle dispid 18;
    property TabWidth: Integer dispid 19;
    property Visible: WordBool dispid 20;
    procedure Clear; dispid 21;
    property ItemIndex: Integer dispid 23;
    property SelCount: Integer readonly dispid 24;
    property TopIndex: Integer dispid 25;
    property DoubleBuffered: WordBool dispid 28;
    procedure FlipChildren(AllLevels: WordBool); dispid 29;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 32;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 33;
    function GetControlsAlignment: TxAlignment; dispid 34;
    procedure InitiateAction; dispid 36;
    function IsRightToLeft: WordBool; dispid 37;
    function UseRightToLeftAlignment: WordBool; dispid 42;
    function UseRightToLeftReading: WordBool; dispid 43;
    function UseRightToLeftScrollBar: WordBool; dispid 44;
    property Cursor: Smallint dispid 45;
    function ClassNameIs(const Name: WideString): WordBool; dispid 49;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  ICheckListBoxXEvents
// Flags:     (0)
// GUID:      {695CDAF0-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ICheckListBoxXEvents = dispinterface
    ['{695CDAF0-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnClickCheck; dispid 1;
    procedure OnClick; dispid 2;
    procedure OnDblClick; dispid 3;
    procedure OnKeyPress(var Key: Smallint); dispid 10;
    procedure OnMeasureItem(Index: Integer; var Height: Integer); dispid 12;
  end;

// *********************************************************************//
// Interface: IColorGridX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDAF7-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IColorGridX = interface(IDispatch)
    ['{695CDAF7-02E5-11D2-B20D-00C04FA368D4}']
    function ColorToIndex(AColor: OLE_COLOR): Integer; safecall;
    function Get_ForegroundColor: OLE_COLOR; safecall;
    function Get_BackgroundColor: OLE_COLOR; safecall;
    function Get_ClickEnablesColor: WordBool; safecall;
    procedure Set_ClickEnablesColor(Value: WordBool); safecall;
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_GridOrdering: TxGridOrdering; safecall;
    procedure Set_GridOrdering(Value: TxGridOrdering); safecall;
    function Get_ForegroundIndex: Integer; safecall;
    procedure Set_ForegroundIndex(Value: Integer); safecall;
    function Get_BackgroundIndex: Integer; safecall;
    procedure Set_BackgroundIndex(Value: Integer); safecall;
    function Get_ForegroundEnabled: WordBool; safecall;
    procedure Set_ForegroundEnabled(Value: WordBool); safecall;
    function Get_BackgroundEnabled: WordBool; safecall;
    procedure Set_BackgroundEnabled(Value: WordBool); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_Selection: Integer; safecall;
    procedure Set_Selection(Value: Integer); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property ForegroundColor: OLE_COLOR read Get_ForegroundColor;
    property BackgroundColor: OLE_COLOR read Get_BackgroundColor;
    property ClickEnablesColor: WordBool read Get_ClickEnablesColor write Set_ClickEnablesColor;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property GridOrdering: TxGridOrdering read Get_GridOrdering write Set_GridOrdering;
    property ForegroundIndex: Integer read Get_ForegroundIndex write Set_ForegroundIndex;
    property BackgroundIndex: Integer read Get_BackgroundIndex write Set_BackgroundIndex;
    property ForegroundEnabled: WordBool read Get_ForegroundEnabled write Set_ForegroundEnabled;
    property BackgroundEnabled: WordBool read Get_BackgroundEnabled write Set_BackgroundEnabled;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property Selection: Integer read Get_Selection write Set_Selection;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IColorGridXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDAF7-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IColorGridXDisp = dispinterface
    ['{695CDAF7-02E5-11D2-B20D-00C04FA368D4}']
    function ColorToIndex(AColor: OLE_COLOR): Integer; dispid 1;
    property ForegroundColor: OLE_COLOR readonly dispid 2;
    property BackgroundColor: OLE_COLOR readonly dispid 3;
    property ClickEnablesColor: WordBool dispid 4;
    property Ctl3D: WordBool dispid 5;
    property DragCursor: Smallint dispid 6;
    property DragMode: TxDragMode dispid 7;
    property Enabled: WordBool dispid -514;
    property GridOrdering: TxGridOrdering dispid 8;
    property ForegroundIndex: Integer dispid 9;
    property BackgroundIndex: Integer dispid 10;
    property ForegroundEnabled: WordBool dispid 11;
    property BackgroundEnabled: WordBool dispid 12;
    property Font: IFontDisp dispid -512;
    property ParentCtl3D: WordBool dispid 13;
    property ParentFont: WordBool dispid 14;
    property Selection: Integer dispid 15;
    property Visible: WordBool dispid 16;
    property DoubleBuffered: WordBool dispid 19;
    procedure FlipChildren(AllLevels: WordBool); dispid 20;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 23;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 24;
    function GetControlsAlignment: TxAlignment; dispid 25;
    procedure InitiateAction; dispid 27;
    function IsRightToLeft: WordBool; dispid 28;
    function UseRightToLeftAlignment: WordBool; dispid 33;
    function UseRightToLeftReading: WordBool; dispid 34;
    function UseRightToLeftScrollBar: WordBool; dispid 35;
    property BiDiMode: TxBiDiMode dispid 36;
    property Cursor: Smallint dispid 37;
    function ClassNameIs(const Name: WideString): WordBool; dispid 41;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IColorGridXEvents
// Flags:     (0)
// GUID:      {695CDAF9-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IColorGridXEvents = dispinterface
    ['{695CDAF9-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnChange; dispid 1;
    procedure OnClick; dispid 2;
    procedure OnKeyPress(var Key: Smallint); dispid 7;
  end;

// *********************************************************************//
// Interface: IComboBoxX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDAFF-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IComboBoxX = interface(IDispatch)
    ['{695CDAFF-02E5-11D2-B20D-00C04FA368D4}']
    function Get_Style: TxComboBoxStyle; safecall;
    procedure Set_Style(Value: TxComboBoxStyle); safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_DropDownCount: Integer; safecall;
    procedure Set_DropDownCount(Value: Integer); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_ImeMode: TxImeMode; safecall;
    procedure Set_ImeMode(Value: TxImeMode); safecall;
    function Get_ImeName: WideString; safecall;
    procedure Set_ImeName(const Value: WideString); safecall;
    function Get_ItemHeight: Integer; safecall;
    procedure Set_ItemHeight(Value: Integer); safecall;
    function Get_Items: IStrings; safecall;
    procedure Set_Items(const Value: IStrings); safecall;
    function Get_MaxLength: Integer; safecall;
    procedure Set_MaxLength(Value: Integer); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_Sorted: WordBool; safecall;
    procedure Set_Sorted(Value: WordBool); safecall;
    function Get_Text: WideString; safecall;
    procedure Set_Text(const Value: WideString); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure Clear; safecall;
    procedure SelectAll; safecall;
    function Get_CharCase: TxEditCharCase; safecall;
    procedure Set_CharCase(Value: TxEditCharCase); safecall;
    function Get_DroppedDown: WordBool; safecall;
    procedure Set_DroppedDown(Value: WordBool); safecall;
    function Get_ItemIndex: Integer; safecall;
    procedure Set_ItemIndex(Value: Integer); safecall;
    function Get_SelLength: Integer; safecall;
    procedure Set_SelLength(Value: Integer); safecall;
    function Get_SelStart: Integer; safecall;
    procedure Set_SelStart(Value: Integer); safecall;
    function Get_SelText: WideString; safecall;
    procedure Set_SelText(const Value: WideString); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property Style: TxComboBoxStyle read Get_Style write Set_Style;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property DropDownCount: Integer read Get_DropDownCount write Set_DropDownCount;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property ImeMode: TxImeMode read Get_ImeMode write Set_ImeMode;
    property ImeName: WideString read Get_ImeName write Set_ImeName;
    property ItemHeight: Integer read Get_ItemHeight write Set_ItemHeight;
    property Items: IStrings read Get_Items write Set_Items;
    property MaxLength: Integer read Get_MaxLength write Set_MaxLength;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property Sorted: WordBool read Get_Sorted write Set_Sorted;
    property Text: WideString read Get_Text write Set_Text;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property CharCase: TxEditCharCase read Get_CharCase write Set_CharCase;
    property DroppedDown: WordBool read Get_DroppedDown write Set_DroppedDown;
    property ItemIndex: Integer read Get_ItemIndex write Set_ItemIndex;
    property SelLength: Integer read Get_SelLength write Set_SelLength;
    property SelStart: Integer read Get_SelStart write Set_SelStart;
    property SelText: WideString read Get_SelText write Set_SelText;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IComboBoxXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDAFF-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IComboBoxXDisp = dispinterface
    ['{695CDAFF-02E5-11D2-B20D-00C04FA368D4}']
    property Style: TxComboBoxStyle dispid 1;
    property BiDiMode: TxBiDiMode dispid 2;
    property Color: OLE_COLOR dispid -501;
    property Ctl3D: WordBool dispid 3;
    property DragCursor: Smallint dispid 4;
    property DragMode: TxDragMode dispid 5;
    property DropDownCount: Integer dispid 6;
    property Enabled: WordBool dispid -514;
    property Font: IFontDisp dispid -512;
    property ImeMode: TxImeMode dispid 7;
    property ImeName: WideString dispid 8;
    property ItemHeight: Integer dispid 9;
    property Items: IStrings dispid 10;
    property MaxLength: Integer dispid 11;
    property ParentColor: WordBool dispid 12;
    property ParentCtl3D: WordBool dispid 13;
    property ParentFont: WordBool dispid 14;
    property Sorted: WordBool dispid 15;
    property Text: WideString dispid -517;
    property Visible: WordBool dispid 16;
    procedure Clear; dispid 17;
    procedure SelectAll; dispid 18;
    property CharCase: TxEditCharCase dispid 19;
    property DroppedDown: WordBool dispid 20;
    property ItemIndex: Integer dispid 21;
    property SelLength: Integer dispid 22;
    property SelStart: Integer dispid 23;
    property SelText: WideString dispid 24;
    property DoubleBuffered: WordBool dispid 27;
    procedure FlipChildren(AllLevels: WordBool); dispid 28;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 31;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 32;
    function GetControlsAlignment: TxAlignment; dispid 33;
    procedure InitiateAction; dispid 35;
    function IsRightToLeft: WordBool; dispid 36;
    function UseRightToLeftAlignment: WordBool; dispid 41;
    function UseRightToLeftReading: WordBool; dispid 42;
    function UseRightToLeftScrollBar: WordBool; dispid 43;
    property Cursor: Smallint dispid 44;
    function ClassNameIs(const Name: WideString): WordBool; dispid 48;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IComboBoxXEvents
// Flags:     (0)
// GUID:      {695CDB01-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IComboBoxXEvents = dispinterface
    ['{695CDB01-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnChange; dispid 1;
    procedure OnClick; dispid 2;
    procedure OnDblClick; dispid 3;
    procedure OnDropDown; dispid 7;
    procedure OnKeyPress(var Key: Smallint); dispid 11;
    procedure OnMeasureItem(Index: Integer; var Height: Integer); dispid 13;
  end;

// *********************************************************************//
// Interface: IControlBarX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB08-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IControlBarX = interface(IDispatch)
    ['{695CDB08-02E5-11D2-B20D-00C04FA368D4}']
    function Get_AutoDrag: WordBool; safecall;
    procedure Set_AutoDrag(Value: WordBool); safecall;
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_BevelInner: TxBevelCut; safecall;
    procedure Set_BevelInner(Value: TxBevelCut); safecall;
    function Get_BevelOuter: TxBevelCut; safecall;
    procedure Set_BevelOuter(Value: TxBevelCut); safecall;
    function Get_BevelKind: TxBevelKind; safecall;
    procedure Set_BevelKind(Value: TxBevelKind); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_DockSite: WordBool; safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_Picture: IPictureDisp; safecall;
    procedure Set_Picture(const Value: IPictureDisp); safecall;
    function Get_RowSnap: WordBool; safecall;
    procedure Set_RowSnap(Value: WordBool); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    procedure StickControls; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property AutoDrag: WordBool read Get_AutoDrag write Set_AutoDrag;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property BevelInner: TxBevelCut read Get_BevelInner write Set_BevelInner;
    property BevelOuter: TxBevelCut read Get_BevelOuter write Set_BevelOuter;
    property BevelKind: TxBevelKind read Get_BevelKind write Set_BevelKind;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property DockSite: WordBool read Get_DockSite write Set_DockSite;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property Picture: IPictureDisp read Get_Picture write Set_Picture;
    property RowSnap: WordBool read Get_RowSnap write Set_RowSnap;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IControlBarXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB08-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IControlBarXDisp = dispinterface
    ['{695CDB08-02E5-11D2-B20D-00C04FA368D4}']
    property AutoDrag: WordBool dispid 1;
    property AutoSize: WordBool dispid 2;
    property BevelInner: TxBevelCut dispid 3;
    property BevelOuter: TxBevelCut dispid 4;
    property BevelKind: TxBevelKind dispid 5;
    property Color: OLE_COLOR dispid -501;
    property DockSite: WordBool dispid 6;
    property DragCursor: Smallint dispid 7;
    property DragMode: TxDragMode dispid 8;
    property Enabled: WordBool dispid -514;
    property ParentColor: WordBool dispid 9;
    property ParentCtl3D: WordBool dispid 10;
    property ParentFont: WordBool dispid 11;
    property Picture: IPictureDisp dispid -523;
    property RowSnap: WordBool dispid 12;
    property Visible: WordBool dispid 13;
    procedure FlipChildren(AllLevels: WordBool); dispid 14;
    procedure StickControls; dispid 15;
    property DoubleBuffered: WordBool dispid 18;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 21;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 22;
    function GetControlsAlignment: TxAlignment; dispid 23;
    procedure InitiateAction; dispid 25;
    function IsRightToLeft: WordBool; dispid 26;
    function UseRightToLeftAlignment: WordBool; dispid 31;
    function UseRightToLeftReading: WordBool; dispid 32;
    function UseRightToLeftScrollBar: WordBool; dispid 33;
    property BiDiMode: TxBiDiMode dispid 34;
    property Cursor: Smallint dispid 35;
    function ClassNameIs(const Name: WideString): WordBool; dispid 39;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IControlBarXEvents
// Flags:     (0)
// GUID:      {695CDB0A-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IControlBarXEvents = dispinterface
    ['{695CDB0A-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnCanResize(var NewWidth: Integer; var NewHeight: Integer; var Resize: WordBool); dispid 5;
    procedure OnClick; dispid 6;
    procedure OnConstrainedResize(var MinWidth: Integer; var MinHeight: Integer; 
                                  var MaxWidth: Integer; var MaxHeight: Integer); dispid 7;
    procedure OnDblClick; dispid 10;
    procedure OnPaint; dispid 19;
    procedure OnResize; dispid 20;
  end;

// *********************************************************************//
// Interface: IDateTimePickerX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB11-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IDateTimePickerX = interface(IDispatch)
    ['{695CDB11-02E5-11D2-B20D-00C04FA368D4}']
    function Get_DateTime: Double; safecall;
    procedure Set_DateTime(Value: Double); safecall;
    function Get_DroppedDown: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_CalAlignment: TxDTCalAlignment; safecall;
    procedure Set_CalAlignment(Value: TxDTCalAlignment); safecall;
    function Get_Date: Double; safecall;
    procedure Set_Date(Value: Double); safecall;
    function Get_Time: Double; safecall;
    procedure Set_Time(Value: Double); safecall;
    function Get_ShowCheckbox: WordBool; safecall;
    procedure Set_ShowCheckbox(Value: WordBool); safecall;
    function Get_Checked: WordBool; safecall;
    procedure Set_Checked(Value: WordBool); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_DateFormat: TxDTDateFormat; safecall;
    procedure Set_DateFormat(Value: TxDTDateFormat); safecall;
    function Get_DateMode: TxDTDateMode; safecall;
    procedure Set_DateMode(Value: TxDTDateMode); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_ImeMode: TxImeMode; safecall;
    procedure Set_ImeMode(Value: TxImeMode); safecall;
    function Get_ImeName: WideString; safecall;
    procedure Set_ImeName(const Value: WideString); safecall;
    function Get_Kind: TxDateTimeKind; safecall;
    procedure Set_Kind(Value: TxDateTimeKind); safecall;
    function Get_MaxDate: Double; safecall;
    procedure Set_MaxDate(Value: Double); safecall;
    function Get_MinDate: Double; safecall;
    procedure Set_MinDate(Value: Double); safecall;
    function Get_ParseInput: WordBool; safecall;
    procedure Set_ParseInput(Value: WordBool); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property DateTime: Double read Get_DateTime write Set_DateTime;
    property DroppedDown: WordBool read Get_DroppedDown;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property CalAlignment: TxDTCalAlignment read Get_CalAlignment write Set_CalAlignment;
    property Date: Double read Get_Date write Set_Date;
    property Time: Double read Get_Time write Set_Time;
    property ShowCheckbox: WordBool read Get_ShowCheckbox write Set_ShowCheckbox;
    property Checked: WordBool read Get_Checked write Set_Checked;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property DateFormat: TxDTDateFormat read Get_DateFormat write Set_DateFormat;
    property DateMode: TxDTDateMode read Get_DateMode write Set_DateMode;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property ImeMode: TxImeMode read Get_ImeMode write Set_ImeMode;
    property ImeName: WideString read Get_ImeName write Set_ImeName;
    property Kind: TxDateTimeKind read Get_Kind write Set_Kind;
    property MaxDate: Double read Get_MaxDate write Set_MaxDate;
    property MinDate: Double read Get_MinDate write Set_MinDate;
    property ParseInput: WordBool read Get_ParseInput write Set_ParseInput;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IDateTimePickerXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB11-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IDateTimePickerXDisp = dispinterface
    ['{695CDB11-02E5-11D2-B20D-00C04FA368D4}']
    property DateTime: Double dispid 1;
    property DroppedDown: WordBool readonly dispid 2;
    property BiDiMode: TxBiDiMode dispid 3;
    property CalAlignment: TxDTCalAlignment dispid 4;
    property Date: Double dispid 5;
    property Time: Double dispid 6;
    property ShowCheckbox: WordBool dispid 7;
    property Checked: WordBool dispid 8;
    property Color: OLE_COLOR dispid -501;
    property DateFormat: TxDTDateFormat dispid 9;
    property DateMode: TxDTDateMode dispid 10;
    property DragCursor: Smallint dispid 11;
    property DragMode: TxDragMode dispid 12;
    property Enabled: WordBool dispid -514;
    property Font: IFontDisp dispid -512;
    property ImeMode: TxImeMode dispid 13;
    property ImeName: WideString dispid 14;
    property Kind: TxDateTimeKind dispid 15;
    property MaxDate: Double dispid 16;
    property MinDate: Double dispid 17;
    property ParseInput: WordBool dispid 18;
    property ParentColor: WordBool dispid 19;
    property ParentFont: WordBool dispid 20;
    property Visible: WordBool dispid 21;
    property DoubleBuffered: WordBool dispid 25;
    procedure FlipChildren(AllLevels: WordBool); dispid 26;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 29;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 30;
    function GetControlsAlignment: TxAlignment; dispid 31;
    procedure InitiateAction; dispid 33;
    function IsRightToLeft: WordBool; dispid 34;
    function UseRightToLeftAlignment: WordBool; dispid 39;
    function UseRightToLeftReading: WordBool; dispid 40;
    function UseRightToLeftScrollBar: WordBool; dispid 41;
    property Cursor: Smallint dispid 42;
    function ClassNameIs(const Name: WideString): WordBool; dispid 46;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IDateTimePickerXEvents
// Flags:     (0)
// GUID:      {695CDB13-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IDateTimePickerXEvents = dispinterface
    ['{695CDB13-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnClick; dispid 1;
    procedure OnCloseUp; dispid 2;
    procedure OnChange; dispid 3;
    procedure OnDropDown; dispid 4;
    procedure OnDblClick; dispid 5;
    procedure OnKeyPress(var Key: Smallint); dispid 11;
    procedure OnUserInput(const UserString: WideString; var DateAndTime: Double; 
                          var AllowChange: WordBool); dispid 15;
  end;

// *********************************************************************//
// Interface: IDrawGridX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB1C-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IDrawGridX = interface(IDispatch)
    ['{695CDB1C-02E5-11D2-B20D-00C04FA368D4}']
    procedure MouseToCell(X: Integer; Y: Integer; var ACol: Integer; var ARow: Integer); safecall;
    function Get_Col: Integer; safecall;
    procedure Set_Col(Value: Integer); safecall;
    function Get_EditorMode: WordBool; safecall;
    procedure Set_EditorMode(Value: WordBool); safecall;
    function Get_GridHeight: Integer; safecall;
    function Get_GridWidth: Integer; safecall;
    function Get_LeftCol: Integer; safecall;
    procedure Set_LeftCol(Value: Integer); safecall;
    function Get_Row: Integer; safecall;
    procedure Set_Row(Value: Integer); safecall;
    function Get_TopRow: Integer; safecall;
    procedure Set_TopRow(Value: Integer); safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_BorderStyle: TxBorderStyle; safecall;
    procedure Set_BorderStyle(Value: TxBorderStyle); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_ColCount: Integer; safecall;
    procedure Set_ColCount(Value: Integer); safecall;
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_DefaultColWidth: Integer; safecall;
    procedure Set_DefaultColWidth(Value: Integer); safecall;
    function Get_DefaultRowHeight: Integer; safecall;
    procedure Set_DefaultRowHeight(Value: Integer); safecall;
    function Get_DefaultDrawing: WordBool; safecall;
    procedure Set_DefaultDrawing(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_FixedColor: OLE_COLOR; safecall;
    procedure Set_FixedColor(Value: OLE_COLOR); safecall;
    function Get_FixedCols: Integer; safecall;
    procedure Set_FixedCols(Value: Integer); safecall;
    function Get_RowCount: Integer; safecall;
    procedure Set_RowCount(Value: Integer); safecall;
    function Get_FixedRows: Integer; safecall;
    procedure Set_FixedRows(Value: Integer); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_GridLineWidth: Integer; safecall;
    procedure Set_GridLineWidth(Value: Integer); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_ScrollBars: TxScrollStyle; safecall;
    procedure Set_ScrollBars(Value: TxScrollStyle); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_VisibleColCount: Integer; safecall;
    function Get_VisibleRowCount: Integer; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property Col: Integer read Get_Col write Set_Col;
    property EditorMode: WordBool read Get_EditorMode write Set_EditorMode;
    property GridHeight: Integer read Get_GridHeight;
    property GridWidth: Integer read Get_GridWidth;
    property LeftCol: Integer read Get_LeftCol write Set_LeftCol;
    property Row: Integer read Get_Row write Set_Row;
    property TopRow: Integer read Get_TopRow write Set_TopRow;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property BorderStyle: TxBorderStyle read Get_BorderStyle write Set_BorderStyle;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property ColCount: Integer read Get_ColCount write Set_ColCount;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property DefaultColWidth: Integer read Get_DefaultColWidth write Set_DefaultColWidth;
    property DefaultRowHeight: Integer read Get_DefaultRowHeight write Set_DefaultRowHeight;
    property DefaultDrawing: WordBool read Get_DefaultDrawing write Set_DefaultDrawing;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property FixedColor: OLE_COLOR read Get_FixedColor write Set_FixedColor;
    property FixedCols: Integer read Get_FixedCols write Set_FixedCols;
    property RowCount: Integer read Get_RowCount write Set_RowCount;
    property FixedRows: Integer read Get_FixedRows write Set_FixedRows;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property GridLineWidth: Integer read Get_GridLineWidth write Set_GridLineWidth;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property ScrollBars: TxScrollStyle read Get_ScrollBars write Set_ScrollBars;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property VisibleColCount: Integer read Get_VisibleColCount;
    property VisibleRowCount: Integer read Get_VisibleRowCount;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IDrawGridXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB1C-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IDrawGridXDisp = dispinterface
    ['{695CDB1C-02E5-11D2-B20D-00C04FA368D4}']
    procedure MouseToCell(X: Integer; Y: Integer; var ACol: Integer; var ARow: Integer); dispid 1;
    property Col: Integer dispid 2;
    property EditorMode: WordBool dispid 3;
    property GridHeight: Integer readonly dispid 4;
    property GridWidth: Integer readonly dispid 5;
    property LeftCol: Integer dispid 6;
    property Row: Integer dispid 7;
    property TopRow: Integer dispid 8;
    property BiDiMode: TxBiDiMode dispid 9;
    property BorderStyle: TxBorderStyle dispid 10;
    property Color: OLE_COLOR dispid -501;
    property ColCount: Integer dispid 11;
    property Ctl3D: WordBool dispid 12;
    property DefaultColWidth: Integer dispid 13;
    property DefaultRowHeight: Integer dispid 14;
    property DefaultDrawing: WordBool dispid 15;
    property DragCursor: Smallint dispid 16;
    property DragMode: TxDragMode dispid 17;
    property Enabled: WordBool dispid -514;
    property FixedColor: OLE_COLOR dispid 18;
    property FixedCols: Integer dispid 19;
    property RowCount: Integer dispid 20;
    property FixedRows: Integer dispid 21;
    property Font: IFontDisp dispid -512;
    property GridLineWidth: Integer dispid 22;
    property ParentColor: WordBool dispid 23;
    property ParentCtl3D: WordBool dispid 24;
    property ParentFont: WordBool dispid 25;
    property ScrollBars: TxScrollStyle dispid 26;
    property Visible: WordBool dispid 27;
    property VisibleColCount: Integer readonly dispid 28;
    property VisibleRowCount: Integer readonly dispid 29;
    property DoubleBuffered: WordBool dispid 32;
    procedure FlipChildren(AllLevels: WordBool); dispid 33;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 36;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 37;
    function GetControlsAlignment: TxAlignment; dispid 38;
    procedure InitiateAction; dispid 40;
    function IsRightToLeft: WordBool; dispid 41;
    function UseRightToLeftAlignment: WordBool; dispid 46;
    function UseRightToLeftReading: WordBool; dispid 47;
    function UseRightToLeftScrollBar: WordBool; dispid 48;
    property Cursor: Smallint dispid 49;
    function ClassNameIs(const Name: WideString): WordBool; dispid 53;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IDrawGridXEvents
// Flags:     (0)
// GUID:      {695CDB1E-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IDrawGridXEvents = dispinterface
    ['{695CDB1E-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnClick; dispid 1;
    procedure OnColumnMoved(FromIndex: Integer; ToIndex: Integer); dispid 2;
    procedure OnDblClick; dispid 3;
    procedure OnGetEditMask(ACol: Integer; ARow: Integer; var Value: WideString); dispid 9;
    procedure OnGetEditText(ACol: Integer; ARow: Integer; var Value: WideString); dispid 10;
    procedure OnKeyPress(var Key: Smallint); dispid 12;
    procedure OnRowMoved(FromIndex: Integer; ToIndex: Integer); dispid 19;
    procedure OnSelectCell(ACol: Integer; ARow: Integer; var CanSelect: WordBool); dispid 20;
    procedure OnSetEditText(ACol: Integer; ARow: Integer; const Value: WideString); dispid 21;
    procedure OnTopLeftChanged; dispid 24;
  end;

// *********************************************************************//
// Interface: IEditX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB24-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IEditX = interface(IDispatch)
    ['{695CDB24-02E5-11D2-B20D-00C04FA368D4}']
    function Get_AutoSelect: WordBool; safecall;
    procedure Set_AutoSelect(Value: WordBool); safecall;
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_BorderStyle: TxBorderStyle; safecall;
    procedure Set_BorderStyle(Value: TxBorderStyle); safecall;
    function Get_CharCase: TxEditCharCase; safecall;
    procedure Set_CharCase(Value: TxEditCharCase); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_HideSelection: WordBool; safecall;
    procedure Set_HideSelection(Value: WordBool); safecall;
    function Get_ImeMode: TxImeMode; safecall;
    procedure Set_ImeMode(Value: TxImeMode); safecall;
    function Get_ImeName: WideString; safecall;
    procedure Set_ImeName(const Value: WideString); safecall;
    function Get_MaxLength: Integer; safecall;
    procedure Set_MaxLength(Value: Integer); safecall;
    function Get_OEMConvert: WordBool; safecall;
    procedure Set_OEMConvert(Value: WordBool); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_PasswordChar: Smallint; safecall;
    procedure Set_PasswordChar(Value: Smallint); safecall;
    function Get_ReadOnly: WordBool; safecall;
    procedure Set_ReadOnly(Value: WordBool); safecall;
    function Get_Text: WideString; safecall;
    procedure Set_Text(const Value: WideString); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure Clear; safecall;
    procedure ClearSelection; safecall;
    procedure CopyToClipboard; safecall;
    procedure CutToClipboard; safecall;
    procedure PasteFromClipboard; safecall;
    procedure Undo; safecall;
    procedure ClearUndo; safecall;
    procedure SelectAll; safecall;
    function Get_CanUndo: WordBool; safecall;
    function Get_Modified: WordBool; safecall;
    procedure Set_Modified(Value: WordBool); safecall;
    function Get_SelLength: Integer; safecall;
    procedure Set_SelLength(Value: Integer); safecall;
    function Get_SelStart: Integer; safecall;
    procedure Set_SelStart(Value: Integer); safecall;
    function Get_SelText: WideString; safecall;
    procedure Set_SelText(const Value: WideString); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property AutoSelect: WordBool read Get_AutoSelect write Set_AutoSelect;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property BorderStyle: TxBorderStyle read Get_BorderStyle write Set_BorderStyle;
    property CharCase: TxEditCharCase read Get_CharCase write Set_CharCase;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property HideSelection: WordBool read Get_HideSelection write Set_HideSelection;
    property ImeMode: TxImeMode read Get_ImeMode write Set_ImeMode;
    property ImeName: WideString read Get_ImeName write Set_ImeName;
    property MaxLength: Integer read Get_MaxLength write Set_MaxLength;
    property OEMConvert: WordBool read Get_OEMConvert write Set_OEMConvert;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property PasswordChar: Smallint read Get_PasswordChar write Set_PasswordChar;
    property ReadOnly: WordBool read Get_ReadOnly write Set_ReadOnly;
    property Text: WideString read Get_Text write Set_Text;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property CanUndo: WordBool read Get_CanUndo;
    property Modified: WordBool read Get_Modified write Set_Modified;
    property SelLength: Integer read Get_SelLength write Set_SelLength;
    property SelStart: Integer read Get_SelStart write Set_SelStart;
    property SelText: WideString read Get_SelText write Set_SelText;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IEditXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB24-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IEditXDisp = dispinterface
    ['{695CDB24-02E5-11D2-B20D-00C04FA368D4}']
    property AutoSelect: WordBool dispid 1;
    property AutoSize: WordBool dispid 2;
    property BiDiMode: TxBiDiMode dispid 3;
    property BorderStyle: TxBorderStyle dispid 4;
    property CharCase: TxEditCharCase dispid 5;
    property Color: OLE_COLOR dispid -501;
    property Ctl3D: WordBool dispid 6;
    property DragCursor: Smallint dispid 7;
    property DragMode: TxDragMode dispid 8;
    property Enabled: WordBool dispid -514;
    property Font: IFontDisp dispid -512;
    property HideSelection: WordBool dispid 9;
    property ImeMode: TxImeMode dispid 10;
    property ImeName: WideString dispid 11;
    property MaxLength: Integer dispid 12;
    property OEMConvert: WordBool dispid 13;
    property ParentColor: WordBool dispid 14;
    property ParentCtl3D: WordBool dispid 15;
    property ParentFont: WordBool dispid 16;
    property PasswordChar: Smallint dispid 17;
    property ReadOnly: WordBool dispid 18;
    property Text: WideString dispid -517;
    property Visible: WordBool dispid 19;
    procedure Clear; dispid 20;
    procedure ClearSelection; dispid 21;
    procedure CopyToClipboard; dispid 22;
    procedure CutToClipboard; dispid 23;
    procedure PasteFromClipboard; dispid 25;
    procedure Undo; dispid 26;
    procedure ClearUndo; dispid 27;
    procedure SelectAll; dispid 29;
    property CanUndo: WordBool readonly dispid 31;
    property Modified: WordBool dispid 32;
    property SelLength: Integer dispid 33;
    property SelStart: Integer dispid 34;
    property SelText: WideString dispid 35;
    property DoubleBuffered: WordBool dispid 37;
    procedure FlipChildren(AllLevels: WordBool); dispid 38;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 41;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 42;
    function GetControlsAlignment: TxAlignment; dispid 43;
    procedure InitiateAction; dispid 45;
    function IsRightToLeft: WordBool; dispid 46;
    function UseRightToLeftAlignment: WordBool; dispid 51;
    function UseRightToLeftReading: WordBool; dispid 52;
    function UseRightToLeftScrollBar: WordBool; dispid 53;
    property Cursor: Smallint dispid 54;
    function ClassNameIs(const Name: WideString): WordBool; dispid 58;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IEditXEvents
// Flags:     (0)
// GUID:      {695CDB26-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IEditXEvents = dispinterface
    ['{695CDB26-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnChange; dispid 1;
    procedure OnClick; dispid 2;
    procedure OnDblClick; dispid 3;
    procedure OnKeyPress(var Key: Smallint); dispid 9;
  end;

// *********************************************************************//
// Interface: IGroupBoxX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB2B-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IGroupBoxX = interface(IDispatch)
    ['{695CDB2B-02E5-11D2-B20D-00C04FA368D4}']
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_DockSite: WordBool; safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property DockSite: WordBool read Get_DockSite write Set_DockSite;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IGroupBoxXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB2B-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IGroupBoxXDisp = dispinterface
    ['{695CDB2B-02E5-11D2-B20D-00C04FA368D4}']
    property BiDiMode: TxBiDiMode dispid 1;
    property Caption: WideString dispid -518;
    property Color: OLE_COLOR dispid -501;
    property Ctl3D: WordBool dispid 2;
    property DockSite: WordBool dispid 3;
    property DragCursor: Smallint dispid 4;
    property DragMode: TxDragMode dispid 5;
    property Enabled: WordBool dispid -514;
    property Font: IFontDisp dispid -512;
    property ParentColor: WordBool dispid 6;
    property ParentCtl3D: WordBool dispid 7;
    property ParentFont: WordBool dispid 8;
    property Visible: WordBool dispid 9;
    property DoubleBuffered: WordBool dispid 12;
    procedure FlipChildren(AllLevels: WordBool); dispid 13;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 16;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 17;
    function GetControlsAlignment: TxAlignment; dispid 18;
    procedure InitiateAction; dispid 20;
    function IsRightToLeft: WordBool; dispid 21;
    function UseRightToLeftAlignment: WordBool; dispid 26;
    function UseRightToLeftReading: WordBool; dispid 27;
    function UseRightToLeftScrollBar: WordBool; dispid 28;
    property Cursor: Smallint dispid 29;
    function ClassNameIs(const Name: WideString): WordBool; dispid 33;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IGroupBoxXEvents
// Flags:     (0)
// GUID:      {695CDB2D-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IGroupBoxXEvents = dispinterface
    ['{695CDB2D-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnClick; dispid 1;
    procedure OnDblClick; dispid 2;
  end;

// *********************************************************************//
// Interface: IHotKeyX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB32-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IHotKeyX = interface(IDispatch)
    ['{695CDB32-02E5-11D2-B20D-00C04FA368D4}']
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_HotKey: Smallint; safecall;
    procedure Set_HotKey(Value: Smallint); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property HotKey: Smallint read Get_HotKey write Set_HotKey;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IHotKeyXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB32-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IHotKeyXDisp = dispinterface
    ['{695CDB32-02E5-11D2-B20D-00C04FA368D4}']
    property AutoSize: WordBool dispid 1;
    property BiDiMode: TxBiDiMode dispid 2;
    property Enabled: WordBool dispid -514;
    property HotKey: Smallint dispid 3;
    property Visible: WordBool dispid 4;
    property DoubleBuffered: WordBool dispid 7;
    procedure FlipChildren(AllLevels: WordBool); dispid 8;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 11;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 12;
    function GetControlsAlignment: TxAlignment; dispid 13;
    procedure InitiateAction; dispid 15;
    function IsRightToLeft: WordBool; dispid 16;
    function UseRightToLeftAlignment: WordBool; dispid 21;
    function UseRightToLeftReading: WordBool; dispid 22;
    function UseRightToLeftScrollBar: WordBool; dispid 23;
    property Cursor: Smallint dispid 24;
    function ClassNameIs(const Name: WideString): WordBool; dispid 28;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IHotKeyXEvents
// Flags:     (0)
// GUID:      {695CDB34-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IHotKeyXEvents = dispinterface
    ['{695CDB34-02E5-11D2-B20D-00C04FA368D4}']
  end;

// *********************************************************************//
// Interface: IListBoxX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB39-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IListBoxX = interface(IDispatch)
    ['{695CDB39-02E5-11D2-B20D-00C04FA368D4}']
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_BorderStyle: TxBorderStyle; safecall;
    procedure Set_BorderStyle(Value: TxBorderStyle); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Columns: Integer; safecall;
    procedure Set_Columns(Value: Integer); safecall;
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_ExtendedSelect: WordBool; safecall;
    procedure Set_ExtendedSelect(Value: WordBool); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_ImeMode: TxImeMode; safecall;
    procedure Set_ImeMode(Value: TxImeMode); safecall;
    function Get_ImeName: WideString; safecall;
    procedure Set_ImeName(const Value: WideString); safecall;
    function Get_IntegralHeight: WordBool; safecall;
    procedure Set_IntegralHeight(Value: WordBool); safecall;
    function Get_ItemHeight: Integer; safecall;
    procedure Set_ItemHeight(Value: Integer); safecall;
    function Get_Items: IStrings; safecall;
    procedure Set_Items(const Value: IStrings); safecall;
    function Get_MultiSelect: WordBool; safecall;
    procedure Set_MultiSelect(Value: WordBool); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_Sorted: WordBool; safecall;
    procedure Set_Sorted(Value: WordBool); safecall;
    function Get_Style: TxListBoxStyle; safecall;
    procedure Set_Style(Value: TxListBoxStyle); safecall;
    function Get_TabWidth: Integer; safecall;
    procedure Set_TabWidth(Value: Integer); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure Clear; safecall;
    function Get_ItemIndex: Integer; safecall;
    procedure Set_ItemIndex(Value: Integer); safecall;
    function Get_SelCount: Integer; safecall;
    function Get_TopIndex: Integer; safecall;
    procedure Set_TopIndex(Value: Integer); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property BorderStyle: TxBorderStyle read Get_BorderStyle write Set_BorderStyle;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Columns: Integer read Get_Columns write Set_Columns;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property ExtendedSelect: WordBool read Get_ExtendedSelect write Set_ExtendedSelect;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property ImeMode: TxImeMode read Get_ImeMode write Set_ImeMode;
    property ImeName: WideString read Get_ImeName write Set_ImeName;
    property IntegralHeight: WordBool read Get_IntegralHeight write Set_IntegralHeight;
    property ItemHeight: Integer read Get_ItemHeight write Set_ItemHeight;
    property Items: IStrings read Get_Items write Set_Items;
    property MultiSelect: WordBool read Get_MultiSelect write Set_MultiSelect;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property Sorted: WordBool read Get_Sorted write Set_Sorted;
    property Style: TxListBoxStyle read Get_Style write Set_Style;
    property TabWidth: Integer read Get_TabWidth write Set_TabWidth;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property ItemIndex: Integer read Get_ItemIndex write Set_ItemIndex;
    property SelCount: Integer read Get_SelCount;
    property TopIndex: Integer read Get_TopIndex write Set_TopIndex;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IListBoxXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB39-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IListBoxXDisp = dispinterface
    ['{695CDB39-02E5-11D2-B20D-00C04FA368D4}']
    property BiDiMode: TxBiDiMode dispid 1;
    property BorderStyle: TxBorderStyle dispid 2;
    property Color: OLE_COLOR dispid -501;
    property Columns: Integer dispid 3;
    property Ctl3D: WordBool dispid 4;
    property DragCursor: Smallint dispid 5;
    property DragMode: TxDragMode dispid 6;
    property Enabled: WordBool dispid -514;
    property ExtendedSelect: WordBool dispid 7;
    property Font: IFontDisp dispid -512;
    property ImeMode: TxImeMode dispid 8;
    property ImeName: WideString dispid 9;
    property IntegralHeight: WordBool dispid 10;
    property ItemHeight: Integer dispid 11;
    property Items: IStrings dispid 12;
    property MultiSelect: WordBool dispid 13;
    property ParentColor: WordBool dispid 14;
    property ParentCtl3D: WordBool dispid 15;
    property ParentFont: WordBool dispid 16;
    property Sorted: WordBool dispid 17;
    property Style: TxListBoxStyle dispid 18;
    property TabWidth: Integer dispid 19;
    property Visible: WordBool dispid 20;
    procedure Clear; dispid 21;
    property ItemIndex: Integer dispid 23;
    property SelCount: Integer readonly dispid 24;
    property TopIndex: Integer dispid 25;
    property DoubleBuffered: WordBool dispid 28;
    procedure FlipChildren(AllLevels: WordBool); dispid 29;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 32;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 33;
    function GetControlsAlignment: TxAlignment; dispid 34;
    procedure InitiateAction; dispid 36;
    function IsRightToLeft: WordBool; dispid 37;
    function UseRightToLeftAlignment: WordBool; dispid 42;
    function UseRightToLeftReading: WordBool; dispid 43;
    function UseRightToLeftScrollBar: WordBool; dispid 44;
    property Cursor: Smallint dispid 45;
    function ClassNameIs(const Name: WideString): WordBool; dispid 49;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IListBoxXEvents
// Flags:     (0)
// GUID:      {695CDB3B-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IListBoxXEvents = dispinterface
    ['{695CDB3B-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnClick; dispid 1;
    procedure OnDblClick; dispid 2;
    procedure OnKeyPress(var Key: Smallint); dispid 9;
    procedure OnMeasureItem(Index: Integer; var Height: Integer); dispid 11;
  end;

// *********************************************************************//
// Interface: IMaskEditX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB40-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IMaskEditX = interface(IDispatch)
    ['{695CDB40-02E5-11D2-B20D-00C04FA368D4}']
    function Get_AutoSelect: WordBool; safecall;
    procedure Set_AutoSelect(Value: WordBool); safecall;
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_BorderStyle: TxBorderStyle; safecall;
    procedure Set_BorderStyle(Value: TxBorderStyle); safecall;
    function Get_CharCase: TxEditCharCase; safecall;
    procedure Set_CharCase(Value: TxEditCharCase); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_EditMask: WideString; safecall;
    procedure Set_EditMask(const Value: WideString); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_ImeMode: TxImeMode; safecall;
    procedure Set_ImeMode(Value: TxImeMode); safecall;
    function Get_ImeName: WideString; safecall;
    procedure Set_ImeName(const Value: WideString); safecall;
    function Get_MaxLength: Integer; safecall;
    procedure Set_MaxLength(Value: Integer); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_PasswordChar: Smallint; safecall;
    procedure Set_PasswordChar(Value: Smallint); safecall;
    function Get_ReadOnly: WordBool; safecall;
    procedure Set_ReadOnly(Value: WordBool); safecall;
    function Get_Text: WideString; safecall;
    procedure Set_Text(const Value: WideString); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure ValidateEdit; safecall;
    procedure Clear; safecall;
    function Get_IsMasked: WordBool; safecall;
    function Get_EditText: WideString; safecall;
    procedure Set_EditText(const Value: WideString); safecall;
    procedure ClearSelection; safecall;
    procedure CopyToClipboard; safecall;
    procedure CutToClipboard; safecall;
    procedure PasteFromClipboard; safecall;
    procedure Undo; safecall;
    procedure ClearUndo; safecall;
    procedure SelectAll; safecall;
    function Get_CanUndo: WordBool; safecall;
    function Get_Modified: WordBool; safecall;
    procedure Set_Modified(Value: WordBool); safecall;
    function Get_SelLength: Integer; safecall;
    procedure Set_SelLength(Value: Integer); safecall;
    function Get_SelStart: Integer; safecall;
    procedure Set_SelStart(Value: Integer); safecall;
    function Get_SelText: WideString; safecall;
    procedure Set_SelText(const Value: WideString); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property AutoSelect: WordBool read Get_AutoSelect write Set_AutoSelect;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property BorderStyle: TxBorderStyle read Get_BorderStyle write Set_BorderStyle;
    property CharCase: TxEditCharCase read Get_CharCase write Set_CharCase;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property EditMask: WideString read Get_EditMask write Set_EditMask;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property ImeMode: TxImeMode read Get_ImeMode write Set_ImeMode;
    property ImeName: WideString read Get_ImeName write Set_ImeName;
    property MaxLength: Integer read Get_MaxLength write Set_MaxLength;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property PasswordChar: Smallint read Get_PasswordChar write Set_PasswordChar;
    property ReadOnly: WordBool read Get_ReadOnly write Set_ReadOnly;
    property Text: WideString read Get_Text write Set_Text;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property IsMasked: WordBool read Get_IsMasked;
    property EditText: WideString read Get_EditText write Set_EditText;
    property CanUndo: WordBool read Get_CanUndo;
    property Modified: WordBool read Get_Modified write Set_Modified;
    property SelLength: Integer read Get_SelLength write Set_SelLength;
    property SelStart: Integer read Get_SelStart write Set_SelStart;
    property SelText: WideString read Get_SelText write Set_SelText;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IMaskEditXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB40-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IMaskEditXDisp = dispinterface
    ['{695CDB40-02E5-11D2-B20D-00C04FA368D4}']
    property AutoSelect: WordBool dispid 1;
    property AutoSize: WordBool dispid 2;
    property BiDiMode: TxBiDiMode dispid 3;
    property BorderStyle: TxBorderStyle dispid 4;
    property CharCase: TxEditCharCase dispid 5;
    property Color: OLE_COLOR dispid -501;
    property Ctl3D: WordBool dispid 6;
    property DragCursor: Smallint dispid 7;
    property DragMode: TxDragMode dispid 8;
    property Enabled: WordBool dispid -514;
    property EditMask: WideString dispid 9;
    property Font: IFontDisp dispid -512;
    property ImeMode: TxImeMode dispid 10;
    property ImeName: WideString dispid 11;
    property MaxLength: Integer dispid 12;
    property ParentColor: WordBool dispid 13;
    property ParentCtl3D: WordBool dispid 14;
    property ParentFont: WordBool dispid 15;
    property PasswordChar: Smallint dispid 16;
    property ReadOnly: WordBool dispid 17;
    property Text: WideString dispid -517;
    property Visible: WordBool dispid 18;
    procedure ValidateEdit; dispid 19;
    procedure Clear; dispid 20;
    property IsMasked: WordBool readonly dispid 21;
    property EditText: WideString dispid 22;
    procedure ClearSelection; dispid 23;
    procedure CopyToClipboard; dispid 24;
    procedure CutToClipboard; dispid 25;
    procedure PasteFromClipboard; dispid 27;
    procedure Undo; dispid 28;
    procedure ClearUndo; dispid 29;
    procedure SelectAll; dispid 31;
    property CanUndo: WordBool readonly dispid 33;
    property Modified: WordBool dispid 34;
    property SelLength: Integer dispid 35;
    property SelStart: Integer dispid 36;
    property SelText: WideString dispid 37;
    property DoubleBuffered: WordBool dispid 39;
    procedure FlipChildren(AllLevels: WordBool); dispid 40;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 43;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 44;
    function GetControlsAlignment: TxAlignment; dispid 45;
    procedure InitiateAction; dispid 47;
    function IsRightToLeft: WordBool; dispid 48;
    function UseRightToLeftAlignment: WordBool; dispid 53;
    function UseRightToLeftReading: WordBool; dispid 54;
    function UseRightToLeftScrollBar: WordBool; dispid 55;
    property Cursor: Smallint dispid 56;
    function ClassNameIs(const Name: WideString): WordBool; dispid 60;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IMaskEditXEvents
// Flags:     (0)
// GUID:      {695CDB42-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IMaskEditXEvents = dispinterface
    ['{695CDB42-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnChange; dispid 1;
    procedure OnClick; dispid 2;
    procedure OnDblClick; dispid 3;
    procedure OnKeyPress(var Key: Smallint); dispid 9;
  end;

// *********************************************************************//
// Interface: IMediaPlayerX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB47-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IMediaPlayerX = interface(IDispatch)
    ['{695CDB47-02E5-11D2-B20D-00C04FA368D4}']
    procedure Open; safecall;
    procedure Close; safecall;
    procedure Play; safecall;
    procedure Stop; safecall;
    procedure Pause; safecall;
    procedure Step; safecall;
    procedure Back; safecall;
    procedure Previous; safecall;
    procedure Next; safecall;
    procedure StartRecording; safecall;
    procedure Eject; safecall;
    procedure Save; safecall;
    procedure PauseOnly; safecall;
    procedure Resume; safecall;
    procedure Rewind; safecall;
    function Get_Error: Integer; safecall;
    function Get_ErrorMessage: WideString; safecall;
    function Get_Start: Integer; safecall;
    function Get_Length: Integer; safecall;
    function Get_Tracks: Integer; safecall;
    function Get_Frames: Integer; safecall;
    procedure Set_Frames(Value: Integer); safecall;
    function Get_Mode: TxMPModes; safecall;
    function Get_Position: Integer; safecall;
    procedure Set_Position(Value: Integer); safecall;
    function Get_Wait: WordBool; safecall;
    procedure Set_Wait(Value: WordBool); safecall;
    function Get_Notify: WordBool; safecall;
    procedure Set_Notify(Value: WordBool); safecall;
    function Get_NotifyValue: TxMPNotifyValues; safecall;
    function Get_StartPos: Integer; safecall;
    procedure Set_StartPos(Value: Integer); safecall;
    function Get_EndPos: Integer; safecall;
    procedure Set_EndPos(Value: Integer); safecall;
    function Get_DeviceID: Smallint; safecall;
    function Get_TimeFormat: TxMPTimeFormats; safecall;
    procedure Set_TimeFormat(Value: TxMPTimeFormats); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_AutoEnable: WordBool; safecall;
    procedure Set_AutoEnable(Value: WordBool); safecall;
    function Get_AutoOpen: WordBool; safecall;
    procedure Set_AutoOpen(Value: WordBool); safecall;
    function Get_AutoRewind: WordBool; safecall;
    procedure Set_AutoRewind(Value: WordBool); safecall;
    function Get_DeviceType: TxMPDeviceTypes; safecall;
    procedure Set_DeviceType(Value: TxMPDeviceTypes); safecall;
    function Get_FileName: WideString; safecall;
    procedure Set_FileName(const Value: WideString); safecall;
    function Get_Shareable: WordBool; safecall;
    procedure Set_Shareable(Value: WordBool); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property Error: Integer read Get_Error;
    property ErrorMessage: WideString read Get_ErrorMessage;
    property Start: Integer read Get_Start;
    property Length: Integer read Get_Length;
    property Tracks: Integer read Get_Tracks;
    property Frames: Integer read Get_Frames write Set_Frames;
    property Mode: TxMPModes read Get_Mode;
    property Position: Integer read Get_Position write Set_Position;
    property Wait: WordBool read Get_Wait write Set_Wait;
    property Notify: WordBool read Get_Notify write Set_Notify;
    property NotifyValue: TxMPNotifyValues read Get_NotifyValue;
    property StartPos: Integer read Get_StartPos write Set_StartPos;
    property EndPos: Integer read Get_EndPos write Set_EndPos;
    property DeviceID: Smallint read Get_DeviceID;
    property TimeFormat: TxMPTimeFormats read Get_TimeFormat write Set_TimeFormat;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property AutoEnable: WordBool read Get_AutoEnable write Set_AutoEnable;
    property AutoOpen: WordBool read Get_AutoOpen write Set_AutoOpen;
    property AutoRewind: WordBool read Get_AutoRewind write Set_AutoRewind;
    property DeviceType: TxMPDeviceTypes read Get_DeviceType write Set_DeviceType;
    property FileName: WideString read Get_FileName write Set_FileName;
    property Shareable: WordBool read Get_Shareable write Set_Shareable;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IMediaPlayerXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB47-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IMediaPlayerXDisp = dispinterface
    ['{695CDB47-02E5-11D2-B20D-00C04FA368D4}']
    procedure Open; dispid 1;
    procedure Close; dispid 2;
    procedure Play; dispid 3;
    procedure Stop; dispid 4;
    procedure Pause; dispid 5;
    procedure Step; dispid 6;
    procedure Back; dispid 7;
    procedure Previous; dispid 8;
    procedure Next; dispid 9;
    procedure StartRecording; dispid 10;
    procedure Eject; dispid 11;
    procedure Save; dispid 12;
    procedure PauseOnly; dispid 13;
    procedure Resume; dispid 14;
    procedure Rewind; dispid 15;
    property Error: Integer readonly dispid 16;
    property ErrorMessage: WideString readonly dispid 17;
    property Start: Integer readonly dispid 18;
    property Length: Integer readonly dispid 19;
    property Tracks: Integer readonly dispid 20;
    property Frames: Integer dispid 21;
    property Mode: TxMPModes readonly dispid 22;
    property Position: Integer dispid 23;
    property Wait: WordBool dispid 24;
    property Notify: WordBool dispid 25;
    property NotifyValue: TxMPNotifyValues readonly dispid 26;
    property StartPos: Integer dispid 27;
    property EndPos: Integer dispid 28;
    property DeviceID: Smallint readonly dispid 29;
    property TimeFormat: TxMPTimeFormats dispid 30;
    property Enabled: WordBool dispid -514;
    property AutoEnable: WordBool dispid 31;
    property AutoOpen: WordBool dispid 32;
    property AutoRewind: WordBool dispid 33;
    property DeviceType: TxMPDeviceTypes dispid 34;
    property FileName: WideString dispid 35;
    property Shareable: WordBool dispid 36;
    property Visible: WordBool dispid 37;
    property DoubleBuffered: WordBool dispid 40;
    procedure FlipChildren(AllLevels: WordBool); dispid 41;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 44;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 45;
    function GetControlsAlignment: TxAlignment; dispid 46;
    procedure InitiateAction; dispid 48;
    function IsRightToLeft: WordBool; dispid 49;
    function UseRightToLeftAlignment: WordBool; dispid 54;
    function UseRightToLeftReading: WordBool; dispid 55;
    function UseRightToLeftScrollBar: WordBool; dispid 56;
    property BiDiMode: TxBiDiMode dispid 57;
    property Cursor: Smallint dispid 58;
    function ClassNameIs(const Name: WideString): WordBool; dispid 62;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IMediaPlayerXEvents
// Flags:     (0)
// GUID:      {695CDB49-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IMediaPlayerXEvents = dispinterface
    ['{695CDB49-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnClick(Button: TxMPBtnType; var DoDefault: WordBool); dispid 1;
    procedure OnPostClick(Button: TxMPBtnType); dispid 2;
    procedure OnNotify; dispid 3;
  end;

// *********************************************************************//
// Interface: IMemoX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB53-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IMemoX = interface(IDispatch)
    ['{695CDB53-02E5-11D2-B20D-00C04FA368D4}']
    function Get_Alignment: TxAlignment; safecall;
    procedure Set_Alignment(Value: TxAlignment); safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_BorderStyle: TxBorderStyle; safecall;
    procedure Set_BorderStyle(Value: TxBorderStyle); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_HideSelection: WordBool; safecall;
    procedure Set_HideSelection(Value: WordBool); safecall;
    function Get_ImeMode: TxImeMode; safecall;
    procedure Set_ImeMode(Value: TxImeMode); safecall;
    function Get_ImeName: WideString; safecall;
    procedure Set_ImeName(const Value: WideString); safecall;
    function Get_Lines: IStrings; safecall;
    procedure Set_Lines(const Value: IStrings); safecall;
    function Get_MaxLength: Integer; safecall;
    procedure Set_MaxLength(Value: Integer); safecall;
    function Get_OEMConvert: WordBool; safecall;
    procedure Set_OEMConvert(Value: WordBool); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_ReadOnly: WordBool; safecall;
    procedure Set_ReadOnly(Value: WordBool); safecall;
    function Get_ScrollBars: TxScrollStyle; safecall;
    procedure Set_ScrollBars(Value: TxScrollStyle); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_WantReturns: WordBool; safecall;
    procedure Set_WantReturns(Value: WordBool); safecall;
    function Get_WantTabs: WordBool; safecall;
    procedure Set_WantTabs(Value: WordBool); safecall;
    function Get_WordWrap: WordBool; safecall;
    procedure Set_WordWrap(Value: WordBool); safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure Clear; safecall;
    procedure ClearSelection; safecall;
    procedure CopyToClipboard; safecall;
    procedure CutToClipboard; safecall;
    procedure PasteFromClipboard; safecall;
    procedure Undo; safecall;
    procedure ClearUndo; safecall;
    procedure SelectAll; safecall;
    function Get_CanUndo: WordBool; safecall;
    function Get_Modified: WordBool; safecall;
    procedure Set_Modified(Value: WordBool); safecall;
    function Get_SelLength: Integer; safecall;
    procedure Set_SelLength(Value: Integer); safecall;
    function Get_SelStart: Integer; safecall;
    procedure Set_SelStart(Value: Integer); safecall;
    function Get_SelText: WideString; safecall;
    procedure Set_SelText(const Value: WideString); safecall;
    function Get_Text: WideString; safecall;
    procedure Set_Text(const Value: WideString); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property Alignment: TxAlignment read Get_Alignment write Set_Alignment;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property BorderStyle: TxBorderStyle read Get_BorderStyle write Set_BorderStyle;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property HideSelection: WordBool read Get_HideSelection write Set_HideSelection;
    property ImeMode: TxImeMode read Get_ImeMode write Set_ImeMode;
    property ImeName: WideString read Get_ImeName write Set_ImeName;
    property Lines: IStrings read Get_Lines write Set_Lines;
    property MaxLength: Integer read Get_MaxLength write Set_MaxLength;
    property OEMConvert: WordBool read Get_OEMConvert write Set_OEMConvert;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property ReadOnly: WordBool read Get_ReadOnly write Set_ReadOnly;
    property ScrollBars: TxScrollStyle read Get_ScrollBars write Set_ScrollBars;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property WantReturns: WordBool read Get_WantReturns write Set_WantReturns;
    property WantTabs: WordBool read Get_WantTabs write Set_WantTabs;
    property WordWrap: WordBool read Get_WordWrap write Set_WordWrap;
    property CanUndo: WordBool read Get_CanUndo;
    property Modified: WordBool read Get_Modified write Set_Modified;
    property SelLength: Integer read Get_SelLength write Set_SelLength;
    property SelStart: Integer read Get_SelStart write Set_SelStart;
    property SelText: WideString read Get_SelText write Set_SelText;
    property Text: WideString read Get_Text write Set_Text;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IMemoXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB53-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IMemoXDisp = dispinterface
    ['{695CDB53-02E5-11D2-B20D-00C04FA368D4}']
    property Alignment: TxAlignment dispid 1;
    property BiDiMode: TxBiDiMode dispid 2;
    property BorderStyle: TxBorderStyle dispid 3;
    property Color: OLE_COLOR dispid -501;
    property Ctl3D: WordBool dispid 4;
    property DragCursor: Smallint dispid 5;
    property DragMode: TxDragMode dispid 6;
    property Enabled: WordBool dispid -514;
    property Font: IFontDisp dispid -512;
    property HideSelection: WordBool dispid 7;
    property ImeMode: TxImeMode dispid 8;
    property ImeName: WideString dispid 9;
    property Lines: IStrings dispid 10;
    property MaxLength: Integer dispid 11;
    property OEMConvert: WordBool dispid 12;
    property ParentColor: WordBool dispid 13;
    property ParentCtl3D: WordBool dispid 14;
    property ParentFont: WordBool dispid 15;
    property ReadOnly: WordBool dispid 16;
    property ScrollBars: TxScrollStyle dispid 17;
    property Visible: WordBool dispid 18;
    property WantReturns: WordBool dispid 19;
    property WantTabs: WordBool dispid 20;
    property WordWrap: WordBool dispid 21;
    function GetControlsAlignment: TxAlignment; dispid 22;
    procedure Clear; dispid 23;
    procedure ClearSelection; dispid 24;
    procedure CopyToClipboard; dispid 25;
    procedure CutToClipboard; dispid 26;
    procedure PasteFromClipboard; dispid 28;
    procedure Undo; dispid 29;
    procedure ClearUndo; dispid 30;
    procedure SelectAll; dispid 32;
    property CanUndo: WordBool readonly dispid 34;
    property Modified: WordBool dispid 35;
    property SelLength: Integer dispid 36;
    property SelStart: Integer dispid 37;
    property SelText: WideString dispid 38;
    property Text: WideString dispid -517;
    property DoubleBuffered: WordBool dispid 40;
    procedure FlipChildren(AllLevels: WordBool); dispid 41;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 44;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 45;
    procedure InitiateAction; dispid 47;
    function IsRightToLeft: WordBool; dispid 48;
    function UseRightToLeftAlignment: WordBool; dispid 53;
    function UseRightToLeftReading: WordBool; dispid 54;
    function UseRightToLeftScrollBar: WordBool; dispid 55;
    property Cursor: Smallint dispid 56;
    function ClassNameIs(const Name: WideString): WordBool; dispid 60;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IMemoXEvents
// Flags:     (0)
// GUID:      {695CDB55-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IMemoXEvents = dispinterface
    ['{695CDB55-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnChange; dispid 1;
    procedure OnClick; dispid 2;
    procedure OnDblClick; dispid 3;
    procedure OnKeyPress(var Key: Smallint); dispid 9;
  end;

// *********************************************************************//
// Interface: IMonthCalendarX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB5A-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IMonthCalendarX = interface(IDispatch)
    ['{695CDB5A-02E5-11D2-B20D-00C04FA368D4}']
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_MultiSelect: WordBool; safecall;
    procedure Set_MultiSelect(Value: WordBool); safecall;
    function Get_Date: Double; safecall;
    procedure Set_Date(Value: Double); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_EndDate: Double; safecall;
    procedure Set_EndDate(Value: Double); safecall;
    function Get_FirstDayOfWeek: TxCalDayOfWeek; safecall;
    procedure Set_FirstDayOfWeek(Value: TxCalDayOfWeek); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_ImeMode: TxImeMode; safecall;
    procedure Set_ImeMode(Value: TxImeMode); safecall;
    function Get_ImeName: WideString; safecall;
    procedure Set_ImeName(const Value: WideString); safecall;
    function Get_MaxDate: Double; safecall;
    procedure Set_MaxDate(Value: Double); safecall;
    function Get_MaxSelectRange: Integer; safecall;
    procedure Set_MaxSelectRange(Value: Integer); safecall;
    function Get_MinDate: Double; safecall;
    procedure Set_MinDate(Value: Double); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_ShowToday: WordBool; safecall;
    procedure Set_ShowToday(Value: WordBool); safecall;
    function Get_ShowTodayCircle: WordBool; safecall;
    procedure Set_ShowTodayCircle(Value: WordBool); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_WeekNumbers: WordBool; safecall;
    procedure Set_WeekNumbers(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property MultiSelect: WordBool read Get_MultiSelect write Set_MultiSelect;
    property Date: Double read Get_Date write Set_Date;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property EndDate: Double read Get_EndDate write Set_EndDate;
    property FirstDayOfWeek: TxCalDayOfWeek read Get_FirstDayOfWeek write Set_FirstDayOfWeek;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property ImeMode: TxImeMode read Get_ImeMode write Set_ImeMode;
    property ImeName: WideString read Get_ImeName write Set_ImeName;
    property MaxDate: Double read Get_MaxDate write Set_MaxDate;
    property MaxSelectRange: Integer read Get_MaxSelectRange write Set_MaxSelectRange;
    property MinDate: Double read Get_MinDate write Set_MinDate;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property ShowToday: WordBool read Get_ShowToday write Set_ShowToday;
    property ShowTodayCircle: WordBool read Get_ShowTodayCircle write Set_ShowTodayCircle;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property WeekNumbers: WordBool read Get_WeekNumbers write Set_WeekNumbers;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IMonthCalendarXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB5A-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IMonthCalendarXDisp = dispinterface
    ['{695CDB5A-02E5-11D2-B20D-00C04FA368D4}']
    property AutoSize: WordBool dispid 1;
    property BiDiMode: TxBiDiMode dispid 2;
    property MultiSelect: WordBool dispid 3;
    property Date: Double dispid 4;
    property DragCursor: Smallint dispid 5;
    property DragMode: TxDragMode dispid 6;
    property Enabled: WordBool dispid -514;
    property EndDate: Double dispid 7;
    property FirstDayOfWeek: TxCalDayOfWeek dispid 8;
    property Font: IFontDisp dispid -512;
    property ImeMode: TxImeMode dispid 9;
    property ImeName: WideString dispid 10;
    property MaxDate: Double dispid 11;
    property MaxSelectRange: Integer dispid 12;
    property MinDate: Double dispid 13;
    property ParentFont: WordBool dispid 14;
    property ShowToday: WordBool dispid 15;
    property ShowTodayCircle: WordBool dispid 16;
    property Visible: WordBool dispid 17;
    property WeekNumbers: WordBool dispid 18;
    property DoubleBuffered: WordBool dispid 22;
    procedure FlipChildren(AllLevels: WordBool); dispid 23;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 26;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 27;
    function GetControlsAlignment: TxAlignment; dispid 28;
    procedure InitiateAction; dispid 30;
    function IsRightToLeft: WordBool; dispid 31;
    function UseRightToLeftAlignment: WordBool; dispid 36;
    function UseRightToLeftReading: WordBool; dispid 37;
    function UseRightToLeftScrollBar: WordBool; dispid 38;
    property Cursor: Smallint dispid 39;
    function ClassNameIs(const Name: WideString): WordBool; dispid 43;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IMonthCalendarXEvents
// Flags:     (0)
// GUID:      {695CDB5C-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IMonthCalendarXEvents = dispinterface
    ['{695CDB5C-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnClick; dispid 1;
    procedure OnDblClick; dispid 2;
    procedure OnGetMonthInfo(Month: Integer; var MonthBoldInfo: Integer); dispid 7;
    procedure OnKeyPress(var Key: Smallint); dispid 9;
  end;

// *********************************************************************//
// Interface: INotebookX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB62-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  INotebookX = interface(IDispatch)
    ['{695CDB62-02E5-11D2-B20D-00C04FA368D4}']
    function Get_ActivePage: WideString; safecall;
    procedure Set_ActivePage(const Value: WideString); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_PageIndex: Integer; safecall;
    procedure Set_PageIndex(Value: Integer); safecall;
    function Get_Pages: IStrings; safecall;
    procedure Set_Pages(const Value: IStrings); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property ActivePage: WideString read Get_ActivePage write Set_ActivePage;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property PageIndex: Integer read Get_PageIndex write Set_PageIndex;
    property Pages: IStrings read Get_Pages write Set_Pages;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  INotebookXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB62-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  INotebookXDisp = dispinterface
    ['{695CDB62-02E5-11D2-B20D-00C04FA368D4}']
    property ActivePage: WideString dispid 1;
    property Color: OLE_COLOR dispid -501;
    property Ctl3D: WordBool dispid 2;
    property DragCursor: Smallint dispid 3;
    property DragMode: TxDragMode dispid 4;
    property Font: IFontDisp dispid -512;
    property Enabled: WordBool dispid -514;
    property PageIndex: Integer dispid 5;
    property Pages: IStrings dispid 6;
    property ParentColor: WordBool dispid 7;
    property ParentCtl3D: WordBool dispid 8;
    property ParentFont: WordBool dispid 9;
    property Visible: WordBool dispid 10;
    property DoubleBuffered: WordBool dispid 13;
    procedure FlipChildren(AllLevels: WordBool); dispid 14;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 17;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 18;
    function GetControlsAlignment: TxAlignment; dispid 19;
    procedure InitiateAction; dispid 21;
    function IsRightToLeft: WordBool; dispid 22;
    function UseRightToLeftAlignment: WordBool; dispid 27;
    function UseRightToLeftReading: WordBool; dispid 28;
    function UseRightToLeftScrollBar: WordBool; dispid 29;
    property BiDiMode: TxBiDiMode dispid 30;
    property Cursor: Smallint dispid 31;
    function ClassNameIs(const Name: WideString): WordBool; dispid 35;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  INotebookXEvents
// Flags:     (0)
// GUID:      {695CDB64-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  INotebookXEvents = dispinterface
    ['{695CDB64-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnClick; dispid 1;
    procedure OnDblClick; dispid 2;
    procedure OnPageChanged; dispid 10;
  end;

// *********************************************************************//
// Interface: IOutlineX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB69-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IOutlineX = interface(IDispatch)
    ['{695CDB69-02E5-11D2-B20D-00C04FA368D4}']
    function Get_Lines: IStrings; safecall;
    procedure Set_Lines(const Value: IStrings); safecall;
    function Get_OutlineStyle: TxOutlineStyle; safecall;
    procedure Set_OutlineStyle(Value: TxOutlineStyle); safecall;
    function Get_Style: TxOutlineType; safecall;
    procedure Set_Style(Value: TxOutlineType); safecall;
    function Get_ItemHeight: Integer; safecall;
    procedure Set_ItemHeight(Value: Integer); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_BorderStyle: TxBorderStyle; safecall;
    procedure Set_BorderStyle(Value: TxBorderStyle); safecall;
    function Get_ItemSeparator: WideString; safecall;
    procedure Set_ItemSeparator(const Value: WideString); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_ScrollBars: TxScrollStyle; safecall;
    procedure Set_ScrollBars(Value: TxScrollStyle); safecall;
    function Add(Index: Integer; const Text: WideString): Integer; safecall;
    function AddChild(Index: Integer; const Text: WideString): Integer; safecall;
    function Insert(Index: Integer; const Text: WideString): Integer; safecall;
    procedure Delete(Index: Integer); safecall;
    function GetItem(X: Integer; Y: Integer): Integer; safecall;
    function GetTextItem(const Param1: WideString): Integer; safecall;
    procedure FullExpand; safecall;
    procedure FullCollapse; safecall;
    procedure LoadFromFile(const FileName: WideString); safecall;
    procedure SaveToFile(const FileName: WideString); safecall;
    procedure BeginUpdate; safecall;
    procedure EndUpdate; safecall;
    procedure SetUpdateState(Value: WordBool); safecall;
    procedure Clear; safecall;
    function Get_ItemCount: Integer; safecall;
    function Get_SelectedItem: Integer; safecall;
    procedure Set_SelectedItem(Value: Integer); safecall;
    function Get_Row: Integer; safecall;
    procedure Set_Row(Value: Integer); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property Lines: IStrings read Get_Lines write Set_Lines;
    property OutlineStyle: TxOutlineStyle read Get_OutlineStyle write Set_OutlineStyle;
    property Style: TxOutlineType read Get_Style write Set_Style;
    property ItemHeight: Integer read Get_ItemHeight write Set_ItemHeight;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property BorderStyle: TxBorderStyle read Get_BorderStyle write Set_BorderStyle;
    property ItemSeparator: WideString read Get_ItemSeparator write Set_ItemSeparator;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property ScrollBars: TxScrollStyle read Get_ScrollBars write Set_ScrollBars;
    property ItemCount: Integer read Get_ItemCount;
    property SelectedItem: Integer read Get_SelectedItem write Set_SelectedItem;
    property Row: Integer read Get_Row write Set_Row;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IOutlineXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB69-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IOutlineXDisp = dispinterface
    ['{695CDB69-02E5-11D2-B20D-00C04FA368D4}']
    property Lines: IStrings dispid 1;
    property OutlineStyle: TxOutlineStyle dispid 2;
    property Style: TxOutlineType dispid 3;
    property ItemHeight: Integer dispid 4;
    property Enabled: WordBool dispid -514;
    property Font: IFontDisp dispid -512;
    property Color: OLE_COLOR dispid -501;
    property ParentColor: WordBool dispid 5;
    property ParentCtl3D: WordBool dispid 6;
    property Ctl3D: WordBool dispid 7;
    property Visible: WordBool dispid 8;
    property DragMode: TxDragMode dispid 9;
    property DragCursor: Smallint dispid 10;
    property BorderStyle: TxBorderStyle dispid 11;
    property ItemSeparator: WideString dispid 12;
    property ParentFont: WordBool dispid 13;
    property ScrollBars: TxScrollStyle dispid 14;
    function Add(Index: Integer; const Text: WideString): Integer; dispid 15;
    function AddChild(Index: Integer; const Text: WideString): Integer; dispid 16;
    function Insert(Index: Integer; const Text: WideString): Integer; dispid 19;
    procedure Delete(Index: Integer); dispid 21;
    function GetItem(X: Integer; Y: Integer): Integer; dispid 23;
    function GetTextItem(const Param1: WideString): Integer; dispid 25;
    procedure FullExpand; dispid 26;
    procedure FullCollapse; dispid 27;
    procedure LoadFromFile(const FileName: WideString); dispid 28;
    procedure SaveToFile(const FileName: WideString); dispid 30;
    procedure BeginUpdate; dispid 32;
    procedure EndUpdate; dispid 33;
    procedure SetUpdateState(Value: WordBool); dispid 34;
    procedure Clear; dispid 35;
    property ItemCount: Integer readonly dispid 36;
    property SelectedItem: Integer dispid 37;
    property Row: Integer dispid 38;
    property DoubleBuffered: WordBool dispid 41;
    procedure FlipChildren(AllLevels: WordBool); dispid 42;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 45;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 46;
    function GetControlsAlignment: TxAlignment; dispid 47;
    procedure InitiateAction; dispid 49;
    function IsRightToLeft: WordBool; dispid 50;
    function UseRightToLeftAlignment: WordBool; dispid 55;
    function UseRightToLeftReading: WordBool; dispid 56;
    function UseRightToLeftScrollBar: WordBool; dispid 57;
    property BiDiMode: TxBiDiMode dispid 58;
    property Cursor: Smallint dispid 59;
    function ClassNameIs(const Name: WideString): WordBool; dispid 63;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IOutlineXEvents
// Flags:     (0)
// GUID:      {695CDB6B-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IOutlineXEvents = dispinterface
    ['{695CDB6B-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnExpand(Index: Integer); dispid 1;
    procedure OnCollapse(Index: Integer); dispid 2;
    procedure OnClick; dispid 4;
    procedure OnDblClick; dispid 14;
    procedure OnKeyPress(var Key: Smallint); dispid 16;
  end;

// *********************************************************************//
// Interface: IPageScrollerX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB72-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IPageScrollerX = interface(IDispatch)
    ['{695CDB72-02E5-11D2-B20D-00C04FA368D4}']
    function GetButtonState(Button: TxPageScrollerButton): TxPageScrollerButtonState; safecall;
    function Get_AutoScroll: WordBool; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    function Get_ButtonSize: Integer; safecall;
    procedure Set_ButtonSize(Value: Integer); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_DockSite: WordBool; safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_DragScroll: WordBool; safecall;
    procedure Set_DragScroll(Value: WordBool); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_Margin: Integer; safecall;
    procedure Set_Margin(Value: Integer); safecall;
    function Get_Orientation: TxPageScrollerOrientation; safecall;
    procedure Set_Orientation(Value: TxPageScrollerOrientation); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_Position: Integer; safecall;
    procedure Set_Position(Value: Integer); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property AutoScroll: WordBool read Get_AutoScroll write Set_AutoScroll;
    property ButtonSize: Integer read Get_ButtonSize write Set_ButtonSize;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property DockSite: WordBool read Get_DockSite write Set_DockSite;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property DragScroll: WordBool read Get_DragScroll write Set_DragScroll;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property Margin: Integer read Get_Margin write Set_Margin;
    property Orientation: TxPageScrollerOrientation read Get_Orientation write Set_Orientation;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property Position: Integer read Get_Position write Set_Position;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IPageScrollerXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB72-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IPageScrollerXDisp = dispinterface
    ['{695CDB72-02E5-11D2-B20D-00C04FA368D4}']
    function GetButtonState(Button: TxPageScrollerButton): TxPageScrollerButtonState; dispid 1;
    property AutoScroll: WordBool dispid 2;
    property ButtonSize: Integer dispid 3;
    property Color: OLE_COLOR dispid -501;
    property DockSite: WordBool dispid 4;
    property DragCursor: Smallint dispid 5;
    property DragMode: TxDragMode dispid 6;
    property DragScroll: WordBool dispid 7;
    property Enabled: WordBool dispid -514;
    property Font: IFontDisp dispid -512;
    property Margin: Integer dispid 8;
    property Orientation: TxPageScrollerOrientation dispid 9;
    property ParentColor: WordBool dispid 10;
    property ParentFont: WordBool dispid 11;
    property Position: Integer dispid 12;
    property Visible: WordBool dispid 13;
    property DoubleBuffered: WordBool dispid 16;
    procedure FlipChildren(AllLevels: WordBool); dispid 17;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 20;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 21;
    function GetControlsAlignment: TxAlignment; dispid 22;
    procedure InitiateAction; dispid 24;
    function IsRightToLeft: WordBool; dispid 25;
    function UseRightToLeftAlignment: WordBool; dispid 30;
    function UseRightToLeftReading: WordBool; dispid 31;
    function UseRightToLeftScrollBar: WordBool; dispid 32;
    property BiDiMode: TxBiDiMode dispid 33;
    property Cursor: Smallint dispid 34;
    function ClassNameIs(const Name: WideString): WordBool; dispid 38;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IPageScrollerXEvents
// Flags:     (0)
// GUID:      {695CDB74-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IPageScrollerXEvents = dispinterface
    ['{695CDB74-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnClick; dispid 1;
    procedure OnDblClick; dispid 2;
    procedure OnKeyPress(var Key: Smallint); dispid 8;
    procedure OnResize; dispid 10;
  end;

// *********************************************************************//
// Interface: IPanelX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB7C-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IPanelX = interface(IDispatch)
    ['{695CDB7C-02E5-11D2-B20D-00C04FA368D4}']
    function Get_Alignment: TxAlignment; safecall;
    procedure Set_Alignment(Value: TxAlignment); safecall;
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_BevelInner: TxBevelCut; safecall;
    procedure Set_BevelInner(Value: TxBevelCut); safecall;
    function Get_BevelOuter: TxBevelCut; safecall;
    procedure Set_BevelOuter(Value: TxBevelCut); safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_BorderStyle: TxBorderStyle; safecall;
    procedure Set_BorderStyle(Value: TxBorderStyle); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_UseDockManager: WordBool; safecall;
    procedure Set_UseDockManager(Value: WordBool); safecall;
    function Get_DockSite: WordBool; safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_FullRepaint: WordBool; safecall;
    procedure Set_FullRepaint(Value: WordBool); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_Locked: WordBool; safecall;
    procedure Set_Locked(Value: WordBool); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property Alignment: TxAlignment read Get_Alignment write Set_Alignment;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property BevelInner: TxBevelCut read Get_BevelInner write Set_BevelInner;
    property BevelOuter: TxBevelCut read Get_BevelOuter write Set_BevelOuter;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property BorderStyle: TxBorderStyle read Get_BorderStyle write Set_BorderStyle;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property UseDockManager: WordBool read Get_UseDockManager write Set_UseDockManager;
    property DockSite: WordBool read Get_DockSite write Set_DockSite;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property FullRepaint: WordBool read Get_FullRepaint write Set_FullRepaint;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property Locked: WordBool read Get_Locked write Set_Locked;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IPanelXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB7C-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IPanelXDisp = dispinterface
    ['{695CDB7C-02E5-11D2-B20D-00C04FA368D4}']
    property Alignment: TxAlignment dispid 1;
    property AutoSize: WordBool dispid 2;
    property BevelInner: TxBevelCut dispid 3;
    property BevelOuter: TxBevelCut dispid 4;
    property BiDiMode: TxBiDiMode dispid 5;
    property BorderStyle: TxBorderStyle dispid 6;
    property Caption: WideString dispid -518;
    property Color: OLE_COLOR dispid -501;
    property Ctl3D: WordBool dispid 7;
    property UseDockManager: WordBool dispid 8;
    property DockSite: WordBool dispid 9;
    property DragCursor: Smallint dispid 10;
    property DragMode: TxDragMode dispid 11;
    property Enabled: WordBool dispid -514;
    property FullRepaint: WordBool dispid 12;
    property Font: IFontDisp dispid -512;
    property Locked: WordBool dispid 13;
    property ParentColor: WordBool dispid 14;
    property ParentCtl3D: WordBool dispid 15;
    property ParentFont: WordBool dispid 16;
    property Visible: WordBool dispid 17;
    function GetControlsAlignment: TxAlignment; dispid 18;
    property DoubleBuffered: WordBool dispid 21;
    procedure FlipChildren(AllLevels: WordBool); dispid 22;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 25;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 26;
    procedure InitiateAction; dispid 28;
    function IsRightToLeft: WordBool; dispid 29;
    function UseRightToLeftAlignment: WordBool; dispid 34;
    function UseRightToLeftReading: WordBool; dispid 35;
    function UseRightToLeftScrollBar: WordBool; dispid 36;
    property Cursor: Smallint dispid 37;
    function ClassNameIs(const Name: WideString): WordBool; dispid 41;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IPanelXEvents
// Flags:     (0)
// GUID:      {695CDB7E-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IPanelXEvents = dispinterface
    ['{695CDB7E-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnCanResize(var NewWidth: Integer; var NewHeight: Integer; var Resize: WordBool); dispid 1;
    procedure OnClick; dispid 2;
    procedure OnConstrainedResize(var MinWidth: Integer; var MinHeight: Integer; 
                                  var MaxWidth: Integer; var MaxHeight: Integer); dispid 3;
    procedure OnDblClick; dispid 6;
    procedure OnResize; dispid 15;
  end;

// *********************************************************************//
// Interface: IProgressBarX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB83-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IProgressBarX = interface(IDispatch)
    ['{695CDB83-02E5-11D2-B20D-00C04FA368D4}']
    procedure StepIt; safecall;
    procedure StepBy(Delta: Integer); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Min: Integer; safecall;
    procedure Set_Min(Value: Integer); safecall;
    function Get_Max: Integer; safecall;
    procedure Set_Max(Value: Integer); safecall;
    function Get_Orientation: TxProgressBarOrientation; safecall;
    procedure Set_Orientation(Value: TxProgressBarOrientation); safecall;
    function Get_Position: Integer; safecall;
    procedure Set_Position(Value: Integer); safecall;
    function Get_Smooth: WordBool; safecall;
    procedure Set_Smooth(Value: WordBool); safecall;
    function Get_Step: Integer; safecall;
    procedure Set_Step(Value: Integer); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Min: Integer read Get_Min write Set_Min;
    property Max: Integer read Get_Max write Set_Max;
    property Orientation: TxProgressBarOrientation read Get_Orientation write Set_Orientation;
    property Position: Integer read Get_Position write Set_Position;
    property Smooth: WordBool read Get_Smooth write Set_Smooth;
    property Step: Integer read Get_Step write Set_Step;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IProgressBarXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB83-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IProgressBarXDisp = dispinterface
    ['{695CDB83-02E5-11D2-B20D-00C04FA368D4}']
    procedure StepIt; dispid 1;
    procedure StepBy(Delta: Integer); dispid 2;
    property DragCursor: Smallint dispid 3;
    property DragMode: TxDragMode dispid 4;
    property Enabled: WordBool dispid -514;
    property Min: Integer dispid 5;
    property Max: Integer dispid 6;
    property Orientation: TxProgressBarOrientation dispid 7;
    property Position: Integer dispid 8;
    property Smooth: WordBool dispid 9;
    property Step: Integer dispid 10;
    property Visible: WordBool dispid 11;
    property DoubleBuffered: WordBool dispid 14;
    procedure FlipChildren(AllLevels: WordBool); dispid 15;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 18;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 19;
    function GetControlsAlignment: TxAlignment; dispid 20;
    procedure InitiateAction; dispid 22;
    function IsRightToLeft: WordBool; dispid 23;
    function UseRightToLeftAlignment: WordBool; dispid 28;
    function UseRightToLeftReading: WordBool; dispid 29;
    function UseRightToLeftScrollBar: WordBool; dispid 30;
    property BiDiMode: TxBiDiMode dispid 31;
    property Cursor: Smallint dispid 32;
    function ClassNameIs(const Name: WideString): WordBool; dispid 36;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IProgressBarXEvents
// Flags:     (0)
// GUID:      {695CDB85-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IProgressBarXEvents = dispinterface
    ['{695CDB85-02E5-11D2-B20D-00C04FA368D4}']
  end;

// *********************************************************************//
// Interface: IRadioButtonX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB8B-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IRadioButtonX = interface(IDispatch)
    ['{695CDB8B-02E5-11D2-B20D-00C04FA368D4}']
    function GetControlsAlignment: TxAlignment; safecall;
    function Get_Alignment: TxLeftRight; safecall;
    procedure Set_Alignment(Value: TxLeftRight); safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Checked: WordBool; safecall;
    procedure Set_Checked(Value: WordBool); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property Alignment: TxLeftRight read Get_Alignment write Set_Alignment;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Checked: WordBool read Get_Checked write Set_Checked;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IRadioButtonXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB8B-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IRadioButtonXDisp = dispinterface
    ['{695CDB8B-02E5-11D2-B20D-00C04FA368D4}']
    function GetControlsAlignment: TxAlignment; dispid 1;
    property Alignment: TxLeftRight dispid 2;
    property BiDiMode: TxBiDiMode dispid 3;
    property Caption: WideString dispid -518;
    property Checked: WordBool dispid 4;
    property Color: OLE_COLOR dispid -501;
    property Ctl3D: WordBool dispid 5;
    property DragCursor: Smallint dispid 6;
    property DragMode: TxDragMode dispid 7;
    property Enabled: WordBool dispid -514;
    property Font: IFontDisp dispid -512;
    property ParentColor: WordBool dispid 8;
    property ParentCtl3D: WordBool dispid 9;
    property ParentFont: WordBool dispid 10;
    property Visible: WordBool dispid 11;
    property DoubleBuffered: WordBool dispid 14;
    procedure FlipChildren(AllLevels: WordBool); dispid 15;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 18;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 19;
    procedure InitiateAction; dispid 21;
    function IsRightToLeft: WordBool; dispid 22;
    function UseRightToLeftAlignment: WordBool; dispid 27;
    function UseRightToLeftReading: WordBool; dispid 28;
    function UseRightToLeftScrollBar: WordBool; dispid 29;
    property Cursor: Smallint dispid 30;
    function ClassNameIs(const Name: WideString): WordBool; dispid 34;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IRadioButtonXEvents
// Flags:     (0)
// GUID:      {695CDB8D-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IRadioButtonXEvents = dispinterface
    ['{695CDB8D-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnClick; dispid 1;
    procedure OnDblClick; dispid 2;
    procedure OnKeyPress(var Key: Smallint); dispid 8;
  end;

// *********************************************************************//
// Interface: IRadioGroupX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB92-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IRadioGroupX = interface(IDispatch)
    ['{695CDB92-02E5-11D2-B20D-00C04FA368D4}']
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Columns: Integer; safecall;
    procedure Set_Columns(Value: Integer); safecall;
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_ItemIndex: Integer; safecall;
    procedure Set_ItemIndex(Value: Integer); safecall;
    function Get_Items: IStrings; safecall;
    procedure Set_Items(const Value: IStrings); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Columns: Integer read Get_Columns write Set_Columns;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property ItemIndex: Integer read Get_ItemIndex write Set_ItemIndex;
    property Items: IStrings read Get_Items write Set_Items;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IRadioGroupXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB92-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IRadioGroupXDisp = dispinterface
    ['{695CDB92-02E5-11D2-B20D-00C04FA368D4}']
    property BiDiMode: TxBiDiMode dispid 1;
    property Caption: WideString dispid -518;
    property Color: OLE_COLOR dispid -501;
    property Columns: Integer dispid 2;
    property Ctl3D: WordBool dispid 3;
    property DragCursor: Smallint dispid 4;
    property DragMode: TxDragMode dispid 5;
    property Enabled: WordBool dispid -514;
    property Font: IFontDisp dispid -512;
    property ItemIndex: Integer dispid 6;
    property Items: IStrings dispid 7;
    property ParentColor: WordBool dispid 8;
    property ParentCtl3D: WordBool dispid 9;
    property ParentFont: WordBool dispid 10;
    property Visible: WordBool dispid 11;
    procedure FlipChildren(AllLevels: WordBool); dispid 12;
    property DoubleBuffered: WordBool dispid 15;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 18;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 19;
    function GetControlsAlignment: TxAlignment; dispid 20;
    procedure InitiateAction; dispid 22;
    function IsRightToLeft: WordBool; dispid 23;
    function UseRightToLeftAlignment: WordBool; dispid 28;
    function UseRightToLeftReading: WordBool; dispid 29;
    function UseRightToLeftScrollBar: WordBool; dispid 30;
    property Cursor: Smallint dispid 31;
    function ClassNameIs(const Name: WideString): WordBool; dispid 35;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IRadioGroupXEvents
// Flags:     (0)
// GUID:      {695CDB94-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IRadioGroupXEvents = dispinterface
    ['{695CDB94-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnClick; dispid 1;
  end;

// *********************************************************************//
// Interface: IRichEditX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB99-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IRichEditX = interface(IDispatch)
    ['{695CDB99-02E5-11D2-B20D-00C04FA368D4}']
    function Get_Alignment: TxAlignment; safecall;
    procedure Set_Alignment(Value: TxAlignment); safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_BorderStyle: TxBorderStyle; safecall;
    procedure Set_BorderStyle(Value: TxBorderStyle); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_HideSelection: WordBool; safecall;
    procedure Set_HideSelection(Value: WordBool); safecall;
    function Get_HideScrollBars: WordBool; safecall;
    procedure Set_HideScrollBars(Value: WordBool); safecall;
    function Get_ImeMode: TxImeMode; safecall;
    procedure Set_ImeMode(Value: TxImeMode); safecall;
    function Get_ImeName: WideString; safecall;
    procedure Set_ImeName(const Value: WideString); safecall;
    function Get_Lines: IStrings; safecall;
    procedure Set_Lines(const Value: IStrings); safecall;
    function Get_MaxLength: Integer; safecall;
    procedure Set_MaxLength(Value: Integer); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_PlainText: WordBool; safecall;
    procedure Set_PlainText(Value: WordBool); safecall;
    function Get_ReadOnly: WordBool; safecall;
    procedure Set_ReadOnly(Value: WordBool); safecall;
    function Get_ScrollBars: TxScrollStyle; safecall;
    procedure Set_ScrollBars(Value: TxScrollStyle); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_WantTabs: WordBool; safecall;
    procedure Set_WantTabs(Value: WordBool); safecall;
    function Get_WantReturns: WordBool; safecall;
    procedure Set_WantReturns(Value: WordBool); safecall;
    function Get_WordWrap: WordBool; safecall;
    procedure Set_WordWrap(Value: WordBool); safecall;
    procedure Clear; safecall;
    procedure Print(const Caption: WideString); safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure ClearSelection; safecall;
    procedure CopyToClipboard; safecall;
    procedure CutToClipboard; safecall;
    procedure PasteFromClipboard; safecall;
    procedure Undo; safecall;
    procedure ClearUndo; safecall;
    procedure SelectAll; safecall;
    function Get_CanUndo: WordBool; safecall;
    function Get_Modified: WordBool; safecall;
    procedure Set_Modified(Value: WordBool); safecall;
    function Get_SelLength: Integer; safecall;
    procedure Set_SelLength(Value: Integer); safecall;
    function Get_SelStart: Integer; safecall;
    procedure Set_SelStart(Value: Integer); safecall;
    function Get_SelText: WideString; safecall;
    procedure Set_SelText(const Value: WideString); safecall;
    function Get_Text: WideString; safecall;
    procedure Set_Text(const Value: WideString); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property Alignment: TxAlignment read Get_Alignment write Set_Alignment;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property BorderStyle: TxBorderStyle read Get_BorderStyle write Set_BorderStyle;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property HideSelection: WordBool read Get_HideSelection write Set_HideSelection;
    property HideScrollBars: WordBool read Get_HideScrollBars write Set_HideScrollBars;
    property ImeMode: TxImeMode read Get_ImeMode write Set_ImeMode;
    property ImeName: WideString read Get_ImeName write Set_ImeName;
    property Lines: IStrings read Get_Lines write Set_Lines;
    property MaxLength: Integer read Get_MaxLength write Set_MaxLength;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property PlainText: WordBool read Get_PlainText write Set_PlainText;
    property ReadOnly: WordBool read Get_ReadOnly write Set_ReadOnly;
    property ScrollBars: TxScrollStyle read Get_ScrollBars write Set_ScrollBars;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property WantTabs: WordBool read Get_WantTabs write Set_WantTabs;
    property WantReturns: WordBool read Get_WantReturns write Set_WantReturns;
    property WordWrap: WordBool read Get_WordWrap write Set_WordWrap;
    property CanUndo: WordBool read Get_CanUndo;
    property Modified: WordBool read Get_Modified write Set_Modified;
    property SelLength: Integer read Get_SelLength write Set_SelLength;
    property SelStart: Integer read Get_SelStart write Set_SelStart;
    property SelText: WideString read Get_SelText write Set_SelText;
    property Text: WideString read Get_Text write Set_Text;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IRichEditXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDB99-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IRichEditXDisp = dispinterface
    ['{695CDB99-02E5-11D2-B20D-00C04FA368D4}']
    property Alignment: TxAlignment dispid 1;
    property BiDiMode: TxBiDiMode dispid 2;
    property BorderStyle: TxBorderStyle dispid 3;
    property Color: OLE_COLOR dispid -501;
    property Ctl3D: WordBool dispid 4;
    property DragCursor: Smallint dispid 5;
    property DragMode: TxDragMode dispid 6;
    property Enabled: WordBool dispid -514;
    property Font: IFontDisp dispid -512;
    property HideSelection: WordBool dispid 7;
    property HideScrollBars: WordBool dispid 8;
    property ImeMode: TxImeMode dispid 9;
    property ImeName: WideString dispid 10;
    property Lines: IStrings dispid 11;
    property MaxLength: Integer dispid 12;
    property ParentColor: WordBool dispid 13;
    property ParentCtl3D: WordBool dispid 14;
    property ParentFont: WordBool dispid 15;
    property PlainText: WordBool dispid 16;
    property ReadOnly: WordBool dispid 17;
    property ScrollBars: TxScrollStyle dispid 18;
    property Visible: WordBool dispid 19;
    property WantTabs: WordBool dispid 20;
    property WantReturns: WordBool dispid 21;
    property WordWrap: WordBool dispid 22;
    procedure Clear; dispid 23;
    procedure Print(const Caption: WideString); dispid 26;
    function GetControlsAlignment: TxAlignment; dispid 28;
    procedure ClearSelection; dispid 29;
    procedure CopyToClipboard; dispid 30;
    procedure CutToClipboard; dispid 31;
    procedure PasteFromClipboard; dispid 33;
    procedure Undo; dispid 34;
    procedure ClearUndo; dispid 35;
    procedure SelectAll; dispid 36;
    property CanUndo: WordBool readonly dispid 38;
    property Modified: WordBool dispid 39;
    property SelLength: Integer dispid 40;
    property SelStart: Integer dispid 41;
    property SelText: WideString dispid 42;
    property Text: WideString dispid -517;
    property DoubleBuffered: WordBool dispid 44;
    procedure FlipChildren(AllLevels: WordBool); dispid 45;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 48;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 49;
    procedure InitiateAction; dispid 51;
    function IsRightToLeft: WordBool; dispid 52;
    function UseRightToLeftAlignment: WordBool; dispid 57;
    function UseRightToLeftReading: WordBool; dispid 58;
    function UseRightToLeftScrollBar: WordBool; dispid 59;
    property Cursor: Smallint dispid 60;
    function ClassNameIs(const Name: WideString): WordBool; dispid 64;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IRichEditXEvents
// Flags:     (0)
// GUID:      {695CDB9B-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IRichEditXEvents = dispinterface
    ['{695CDB9B-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnChange; dispid 1;
    procedure OnKeyPress(var Key: Smallint); dispid 7;
    procedure OnProtectChange(StartPos: Integer; EndPos: Integer; var AllowChange: WordBool); dispid 15;
    procedure OnSaveClipboard(NumObjects: Integer; NumChars: Integer; var SaveClipboard: WordBool); dispid 17;
    procedure OnSelectionChange; dispid 18;
  end;

// *********************************************************************//
// Interface: IScrollBarX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDBA0-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IScrollBarX = interface(IDispatch)
    ['{695CDBA0-02E5-11D2-B20D-00C04FA368D4}']
    procedure SetParams(APosition: Integer; AMin: Integer; AMax: Integer); safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Kind: TxScrollBarKind; safecall;
    procedure Set_Kind(Value: TxScrollBarKind); safecall;
    function Get_LargeChange: Smallint; safecall;
    procedure Set_LargeChange(Value: Smallint); safecall;
    function Get_Max: Integer; safecall;
    procedure Set_Max(Value: Integer); safecall;
    function Get_Min: Integer; safecall;
    procedure Set_Min(Value: Integer); safecall;
    function Get_PageSize: Integer; safecall;
    procedure Set_PageSize(Value: Integer); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_Position: Integer; safecall;
    procedure Set_Position(Value: Integer); safecall;
    function Get_SmallChange: Smallint; safecall;
    procedure Set_SmallChange(Value: Smallint); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Kind: TxScrollBarKind read Get_Kind write Set_Kind;
    property LargeChange: Smallint read Get_LargeChange write Set_LargeChange;
    property Max: Integer read Get_Max write Set_Max;
    property Min: Integer read Get_Min write Set_Min;
    property PageSize: Integer read Get_PageSize write Set_PageSize;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property Position: Integer read Get_Position write Set_Position;
    property SmallChange: Smallint read Get_SmallChange write Set_SmallChange;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IScrollBarXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDBA0-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IScrollBarXDisp = dispinterface
    ['{695CDBA0-02E5-11D2-B20D-00C04FA368D4}']
    procedure SetParams(APosition: Integer; AMin: Integer; AMax: Integer); dispid 1;
    property BiDiMode: TxBiDiMode dispid 2;
    property Ctl3D: WordBool dispid 3;
    property DragCursor: Smallint dispid 4;
    property DragMode: TxDragMode dispid 5;
    property Enabled: WordBool dispid -514;
    property Kind: TxScrollBarKind dispid 6;
    property LargeChange: Smallint dispid 7;
    property Max: Integer dispid 8;
    property Min: Integer dispid 9;
    property PageSize: Integer dispid 10;
    property ParentCtl3D: WordBool dispid 11;
    property Position: Integer dispid 12;
    property SmallChange: Smallint dispid 13;
    property Visible: WordBool dispid 14;
    property DoubleBuffered: WordBool dispid 17;
    procedure FlipChildren(AllLevels: WordBool); dispid 18;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 21;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 22;
    function GetControlsAlignment: TxAlignment; dispid 23;
    procedure InitiateAction; dispid 25;
    function IsRightToLeft: WordBool; dispid 26;
    function UseRightToLeftAlignment: WordBool; dispid 31;
    function UseRightToLeftReading: WordBool; dispid 32;
    function UseRightToLeftScrollBar: WordBool; dispid 33;
    property Cursor: Smallint dispid 34;
    function ClassNameIs(const Name: WideString): WordBool; dispid 38;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IScrollBarXEvents
// Flags:     (0)
// GUID:      {695CDBA2-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IScrollBarXEvents = dispinterface
    ['{695CDBA2-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnChange; dispid 1;
    procedure OnKeyPress(var Key: Smallint); dispid 7;
    procedure OnScroll(ScrollCode: TxScrollCode; var ScrollPos: Integer); dispid 9;
  end;

// *********************************************************************//
// Interface: IScrollBoxX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDBA9-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IScrollBoxX = interface(IDispatch)
    ['{695CDBA9-02E5-11D2-B20D-00C04FA368D4}']
    function Get_AutoScroll: WordBool; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_BorderStyle: TxBorderStyle; safecall;
    procedure Set_BorderStyle(Value: TxBorderStyle); safecall;
    function Get_DockSite: WordBool; safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure DisableAutoRange; safecall;
    procedure EnableAutoRange; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property AutoScroll: WordBool read Get_AutoScroll write Set_AutoScroll;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property BorderStyle: TxBorderStyle read Get_BorderStyle write Set_BorderStyle;
    property DockSite: WordBool read Get_DockSite write Set_DockSite;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IScrollBoxXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDBA9-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IScrollBoxXDisp = dispinterface
    ['{695CDBA9-02E5-11D2-B20D-00C04FA368D4}']
    property AutoScroll: WordBool dispid 1;
    property AutoSize: WordBool dispid 2;
    property BiDiMode: TxBiDiMode dispid 3;
    property BorderStyle: TxBorderStyle dispid 4;
    property DockSite: WordBool dispid 5;
    property DragCursor: Smallint dispid 6;
    property DragMode: TxDragMode dispid 7;
    property Enabled: WordBool dispid -514;
    property Color: OLE_COLOR dispid -501;
    property Ctl3D: WordBool dispid 8;
    property Font: IFontDisp dispid -512;
    property ParentColor: WordBool dispid 9;
    property ParentCtl3D: WordBool dispid 10;
    property ParentFont: WordBool dispid 11;
    property Visible: WordBool dispid 12;
    procedure DisableAutoRange; dispid 13;
    procedure EnableAutoRange; dispid 14;
    property DoubleBuffered: WordBool dispid 18;
    procedure FlipChildren(AllLevels: WordBool); dispid 19;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 22;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 23;
    function GetControlsAlignment: TxAlignment; dispid 24;
    procedure InitiateAction; dispid 26;
    function IsRightToLeft: WordBool; dispid 27;
    function UseRightToLeftAlignment: WordBool; dispid 32;
    function UseRightToLeftReading: WordBool; dispid 33;
    function UseRightToLeftScrollBar: WordBool; dispid 34;
    property Cursor: Smallint dispid 35;
    function ClassNameIs(const Name: WideString): WordBool; dispid 39;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IScrollBoxXEvents
// Flags:     (0)
// GUID:      {695CDBAB-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IScrollBoxXEvents = dispinterface
    ['{695CDBAB-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnCanResize(var NewWidth: Integer; var NewHeight: Integer; var Resize: WordBool); dispid 1;
    procedure OnClick; dispid 2;
    procedure OnConstrainedResize(var MinWidth: Integer; var MinHeight: Integer; 
                                  var MaxWidth: Integer; var MaxHeight: Integer); dispid 3;
    procedure OnDblClick; dispid 4;
    procedure OnResize; dispid 18;
  end;

// *********************************************************************//
// Interface: ISpinButtonX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDBB0-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ISpinButtonX = interface(IDispatch)
    ['{695CDBB0-02E5-11D2-B20D-00C04FA368D4}']
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_DownNumGlyphs: Smallint; safecall;
    procedure Set_DownNumGlyphs(Value: Smallint); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_UpNumGlyphs: Smallint; safecall;
    procedure Set_UpNumGlyphs(Value: Smallint); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property DownNumGlyphs: Smallint read Get_DownNumGlyphs write Set_DownNumGlyphs;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property UpNumGlyphs: Smallint read Get_UpNumGlyphs write Set_UpNumGlyphs;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  ISpinButtonXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDBB0-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ISpinButtonXDisp = dispinterface
    ['{695CDBB0-02E5-11D2-B20D-00C04FA368D4}']
    property Ctl3D: WordBool dispid 1;
    property DownNumGlyphs: Smallint dispid 2;
    property DragCursor: Smallint dispid 3;
    property DragMode: TxDragMode dispid 4;
    property Enabled: WordBool dispid -514;
    property ParentCtl3D: WordBool dispid 5;
    property UpNumGlyphs: Smallint dispid 6;
    property Visible: WordBool dispid 7;
    property DoubleBuffered: WordBool dispid 10;
    procedure FlipChildren(AllLevels: WordBool); dispid 11;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 14;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 15;
    function GetControlsAlignment: TxAlignment; dispid 16;
    procedure InitiateAction; dispid 18;
    function IsRightToLeft: WordBool; dispid 19;
    function UseRightToLeftAlignment: WordBool; dispid 24;
    function UseRightToLeftReading: WordBool; dispid 25;
    function UseRightToLeftScrollBar: WordBool; dispid 26;
    property BiDiMode: TxBiDiMode dispid 27;
    property Cursor: Smallint dispid 28;
    function ClassNameIs(const Name: WideString): WordBool; dispid 32;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  ISpinButtonXEvents
// Flags:     (0)
// GUID:      {695CDBB2-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ISpinButtonXEvents = dispinterface
    ['{695CDBB2-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnDownClick; dispid 1;
    procedure OnUpClick; dispid 8;
  end;

// *********************************************************************//
// Interface: ISpinEditX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDBB7-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ISpinEditX = interface(IDispatch)
    ['{695CDBB7-02E5-11D2-B20D-00C04FA368D4}']
    function Get_AutoSelect: WordBool; safecall;
    procedure Set_AutoSelect(Value: WordBool); safecall;
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_EditorEnabled: WordBool; safecall;
    procedure Set_EditorEnabled(Value: WordBool); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_Increment: Integer; safecall;
    procedure Set_Increment(Value: Integer); safecall;
    function Get_MaxLength: Integer; safecall;
    procedure Set_MaxLength(Value: Integer); safecall;
    function Get_MaxValue: Integer; safecall;
    procedure Set_MaxValue(Value: Integer); safecall;
    function Get_MinValue: Integer; safecall;
    procedure Set_MinValue(Value: Integer); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_ReadOnly: WordBool; safecall;
    procedure Set_ReadOnly(Value: WordBool); safecall;
    function Get_Value: Integer; safecall;
    procedure Set_Value(Value: Integer); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure Clear; safecall;
    procedure ClearSelection; safecall;
    procedure CopyToClipboard; safecall;
    procedure CutToClipboard; safecall;
    procedure PasteFromClipboard; safecall;
    procedure Undo; safecall;
    procedure ClearUndo; safecall;
    procedure SelectAll; safecall;
    function Get_CanUndo: WordBool; safecall;
    function Get_Modified: WordBool; safecall;
    procedure Set_Modified(Value: WordBool); safecall;
    function Get_SelLength: Integer; safecall;
    procedure Set_SelLength(Value: Integer); safecall;
    function Get_SelStart: Integer; safecall;
    procedure Set_SelStart(Value: Integer); safecall;
    function Get_SelText: WideString; safecall;
    procedure Set_SelText(const Value: WideString); safecall;
    function Get_Text: WideString; safecall;
    procedure Set_Text(const Value: WideString); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property AutoSelect: WordBool read Get_AutoSelect write Set_AutoSelect;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property EditorEnabled: WordBool read Get_EditorEnabled write Set_EditorEnabled;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property Increment: Integer read Get_Increment write Set_Increment;
    property MaxLength: Integer read Get_MaxLength write Set_MaxLength;
    property MaxValue: Integer read Get_MaxValue write Set_MaxValue;
    property MinValue: Integer read Get_MinValue write Set_MinValue;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property ReadOnly: WordBool read Get_ReadOnly write Set_ReadOnly;
    property Value: Integer read Get_Value write Set_Value;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property CanUndo: WordBool read Get_CanUndo;
    property Modified: WordBool read Get_Modified write Set_Modified;
    property SelLength: Integer read Get_SelLength write Set_SelLength;
    property SelStart: Integer read Get_SelStart write Set_SelStart;
    property SelText: WideString read Get_SelText write Set_SelText;
    property Text: WideString read Get_Text write Set_Text;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  ISpinEditXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDBB7-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ISpinEditXDisp = dispinterface
    ['{695CDBB7-02E5-11D2-B20D-00C04FA368D4}']
    property AutoSelect: WordBool dispid 1;
    property AutoSize: WordBool dispid 2;
    property Color: OLE_COLOR dispid -501;
    property Ctl3D: WordBool dispid 3;
    property DragCursor: Smallint dispid 4;
    property DragMode: TxDragMode dispid 5;
    property EditorEnabled: WordBool dispid 6;
    property Enabled: WordBool dispid -514;
    property Font: IFontDisp dispid -512;
    property Increment: Integer dispid 7;
    property MaxLength: Integer dispid 8;
    property MaxValue: Integer dispid 9;
    property MinValue: Integer dispid 10;
    property ParentColor: WordBool dispid 11;
    property ParentCtl3D: WordBool dispid 12;
    property ParentFont: WordBool dispid 13;
    property ReadOnly: WordBool dispid 14;
    property Value: Integer dispid 15;
    property Visible: WordBool dispid 16;
    procedure Clear; dispid 17;
    procedure ClearSelection; dispid 18;
    procedure CopyToClipboard; dispid 19;
    procedure CutToClipboard; dispid 20;
    procedure PasteFromClipboard; dispid 22;
    procedure Undo; dispid 23;
    procedure ClearUndo; dispid 24;
    procedure SelectAll; dispid 26;
    property CanUndo: WordBool readonly dispid 28;
    property Modified: WordBool dispid 29;
    property SelLength: Integer dispid 30;
    property SelStart: Integer dispid 31;
    property SelText: WideString dispid 32;
    property Text: WideString dispid -517;
    property DoubleBuffered: WordBool dispid 34;
    procedure FlipChildren(AllLevels: WordBool); dispid 35;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 38;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 39;
    function GetControlsAlignment: TxAlignment; dispid 40;
    procedure InitiateAction; dispid 42;
    function IsRightToLeft: WordBool; dispid 43;
    function UseRightToLeftAlignment: WordBool; dispid 48;
    function UseRightToLeftReading: WordBool; dispid 49;
    function UseRightToLeftScrollBar: WordBool; dispid 50;
    property BiDiMode: TxBiDiMode dispid 51;
    property Cursor: Smallint dispid 52;
    function ClassNameIs(const Name: WideString): WordBool; dispid 56;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  ISpinEditXEvents
// Flags:     (0)
// GUID:      {695CDBB9-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ISpinEditXEvents = dispinterface
    ['{695CDBB9-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnChange; dispid 1;
    procedure OnClick; dispid 2;
    procedure OnDblClick; dispid 3;
    procedure OnKeyPress(var Key: Smallint); dispid 8;
  end;

// *********************************************************************//
// Interface: IStaticTextX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDBBE-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IStaticTextX = interface(IDispatch)
    ['{695CDBBE-02E5-11D2-B20D-00C04FA368D4}']
    function Get_Alignment: TxAlignment; safecall;
    procedure Set_Alignment(Value: TxAlignment); safecall;
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_BorderStyle: TxStaticBorderStyle; safecall;
    procedure Set_BorderStyle(Value: TxStaticBorderStyle); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_ShowAccelChar: WordBool; safecall;
    procedure Set_ShowAccelChar(Value: WordBool); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property Alignment: TxAlignment read Get_Alignment write Set_Alignment;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property BorderStyle: TxStaticBorderStyle read Get_BorderStyle write Set_BorderStyle;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property ShowAccelChar: WordBool read Get_ShowAccelChar write Set_ShowAccelChar;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IStaticTextXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDBBE-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IStaticTextXDisp = dispinterface
    ['{695CDBBE-02E5-11D2-B20D-00C04FA368D4}']
    property Alignment: TxAlignment dispid 1;
    property AutoSize: WordBool dispid 2;
    property BiDiMode: TxBiDiMode dispid 3;
    property BorderStyle: TxStaticBorderStyle dispid 4;
    property Caption: WideString dispid -518;
    property Color: OLE_COLOR dispid -501;
    property DragCursor: Smallint dispid 5;
    property DragMode: TxDragMode dispid 6;
    property Enabled: WordBool dispid -514;
    property Font: IFontDisp dispid -512;
    property ParentColor: WordBool dispid 7;
    property ParentFont: WordBool dispid 8;
    property ShowAccelChar: WordBool dispid 9;
    property Visible: WordBool dispid 10;
    property DoubleBuffered: WordBool dispid 13;
    procedure FlipChildren(AllLevels: WordBool); dispid 14;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 17;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 18;
    function GetControlsAlignment: TxAlignment; dispid 19;
    procedure InitiateAction; dispid 21;
    function IsRightToLeft: WordBool; dispid 22;
    function UseRightToLeftAlignment: WordBool; dispid 27;
    function UseRightToLeftReading: WordBool; dispid 28;
    function UseRightToLeftScrollBar: WordBool; dispid 29;
    property Cursor: Smallint dispid 30;
    function ClassNameIs(const Name: WideString): WordBool; dispid 34;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IStaticTextXEvents
// Flags:     (0)
// GUID:      {695CDBC0-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IStaticTextXEvents = dispinterface
    ['{695CDBC0-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnClick; dispid 1;
    procedure OnDblClick; dispid 2;
  end;

// *********************************************************************//
// Interface: IStringGridX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDBC6-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IStringGridX = interface(IDispatch)
    ['{695CDBC6-02E5-11D2-B20D-00C04FA368D4}']
    procedure MouseToCell(X: Integer; Y: Integer; var ACol: Integer; var ARow: Integer); safecall;
    function Get_Col: Integer; safecall;
    procedure Set_Col(Value: Integer); safecall;
    function Get_EditorMode: WordBool; safecall;
    procedure Set_EditorMode(Value: WordBool); safecall;
    function Get_GridHeight: Integer; safecall;
    function Get_GridWidth: Integer; safecall;
    function Get_LeftCol: Integer; safecall;
    procedure Set_LeftCol(Value: Integer); safecall;
    function Get_Row: Integer; safecall;
    procedure Set_Row(Value: Integer); safecall;
    function Get_TopRow: Integer; safecall;
    procedure Set_TopRow(Value: Integer); safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_BorderStyle: TxBorderStyle; safecall;
    procedure Set_BorderStyle(Value: TxBorderStyle); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_ColCount: Integer; safecall;
    procedure Set_ColCount(Value: Integer); safecall;
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_DefaultColWidth: Integer; safecall;
    procedure Set_DefaultColWidth(Value: Integer); safecall;
    function Get_DefaultRowHeight: Integer; safecall;
    procedure Set_DefaultRowHeight(Value: Integer); safecall;
    function Get_DefaultDrawing: WordBool; safecall;
    procedure Set_DefaultDrawing(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_FixedColor: OLE_COLOR; safecall;
    procedure Set_FixedColor(Value: OLE_COLOR); safecall;
    function Get_FixedCols: Integer; safecall;
    procedure Set_FixedCols(Value: Integer); safecall;
    function Get_RowCount: Integer; safecall;
    procedure Set_RowCount(Value: Integer); safecall;
    function Get_FixedRows: Integer; safecall;
    procedure Set_FixedRows(Value: Integer); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_GridLineWidth: Integer; safecall;
    procedure Set_GridLineWidth(Value: Integer); safecall;
    function Get_ParentColor: WordBool; safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_ScrollBars: TxScrollStyle; safecall;
    procedure Set_ScrollBars(Value: TxScrollStyle); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_VisibleColCount: Integer; safecall;
    function Get_VisibleRowCount: Integer; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property Col: Integer read Get_Col write Set_Col;
    property EditorMode: WordBool read Get_EditorMode write Set_EditorMode;
    property GridHeight: Integer read Get_GridHeight;
    property GridWidth: Integer read Get_GridWidth;
    property LeftCol: Integer read Get_LeftCol write Set_LeftCol;
    property Row: Integer read Get_Row write Set_Row;
    property TopRow: Integer read Get_TopRow write Set_TopRow;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property BorderStyle: TxBorderStyle read Get_BorderStyle write Set_BorderStyle;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property ColCount: Integer read Get_ColCount write Set_ColCount;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property DefaultColWidth: Integer read Get_DefaultColWidth write Set_DefaultColWidth;
    property DefaultRowHeight: Integer read Get_DefaultRowHeight write Set_DefaultRowHeight;
    property DefaultDrawing: WordBool read Get_DefaultDrawing write Set_DefaultDrawing;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property FixedColor: OLE_COLOR read Get_FixedColor write Set_FixedColor;
    property FixedCols: Integer read Get_FixedCols write Set_FixedCols;
    property RowCount: Integer read Get_RowCount write Set_RowCount;
    property FixedRows: Integer read Get_FixedRows write Set_FixedRows;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property GridLineWidth: Integer read Get_GridLineWidth write Set_GridLineWidth;
    property ParentColor: WordBool read Get_ParentColor write Set_ParentColor;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property ScrollBars: TxScrollStyle read Get_ScrollBars write Set_ScrollBars;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property VisibleColCount: Integer read Get_VisibleColCount;
    property VisibleRowCount: Integer read Get_VisibleRowCount;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IStringGridXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDBC6-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IStringGridXDisp = dispinterface
    ['{695CDBC6-02E5-11D2-B20D-00C04FA368D4}']
    procedure MouseToCell(X: Integer; Y: Integer; var ACol: Integer; var ARow: Integer); dispid 1;
    property Col: Integer dispid 2;
    property EditorMode: WordBool dispid 3;
    property GridHeight: Integer readonly dispid 4;
    property GridWidth: Integer readonly dispid 5;
    property LeftCol: Integer dispid 6;
    property Row: Integer dispid 7;
    property TopRow: Integer dispid 8;
    property BiDiMode: TxBiDiMode dispid 9;
    property BorderStyle: TxBorderStyle dispid 10;
    property Color: OLE_COLOR dispid -501;
    property ColCount: Integer dispid 11;
    property Ctl3D: WordBool dispid 12;
    property DefaultColWidth: Integer dispid 13;
    property DefaultRowHeight: Integer dispid 14;
    property DefaultDrawing: WordBool dispid 15;
    property DragCursor: Smallint dispid 16;
    property DragMode: TxDragMode dispid 17;
    property Enabled: WordBool dispid -514;
    property FixedColor: OLE_COLOR dispid 18;
    property FixedCols: Integer dispid 19;
    property RowCount: Integer dispid 20;
    property FixedRows: Integer dispid 21;
    property Font: IFontDisp dispid -512;
    property GridLineWidth: Integer dispid 22;
    property ParentColor: WordBool dispid 23;
    property ParentCtl3D: WordBool dispid 24;
    property ParentFont: WordBool dispid 25;
    property ScrollBars: TxScrollStyle dispid 26;
    property Visible: WordBool dispid 27;
    property VisibleColCount: Integer readonly dispid 28;
    property VisibleRowCount: Integer readonly dispid 29;
    property DoubleBuffered: WordBool dispid 32;
    procedure FlipChildren(AllLevels: WordBool); dispid 33;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 36;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 37;
    function GetControlsAlignment: TxAlignment; dispid 38;
    procedure InitiateAction; dispid 40;
    function IsRightToLeft: WordBool; dispid 41;
    function UseRightToLeftAlignment: WordBool; dispid 46;
    function UseRightToLeftReading: WordBool; dispid 47;
    function UseRightToLeftScrollBar: WordBool; dispid 48;
    property Cursor: Smallint dispid 49;
    function ClassNameIs(const Name: WideString): WordBool; dispid 53;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IStringGridXEvents
// Flags:     (0)
// GUID:      {695CDBC8-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IStringGridXEvents = dispinterface
    ['{695CDBC8-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnClick; dispid 1;
    procedure OnColumnMoved(FromIndex: Integer; ToIndex: Integer); dispid 2;
    procedure OnDblClick; dispid 3;
    procedure OnGetEditMask(ACol: Integer; ARow: Integer; var Value: WideString); dispid 9;
    procedure OnGetEditText(ACol: Integer; ARow: Integer; var Value: WideString); dispid 10;
    procedure OnKeyPress(var Key: Smallint); dispid 12;
    procedure OnRowMoved(FromIndex: Integer; ToIndex: Integer); dispid 19;
    procedure OnSelectCell(ACol: Integer; ARow: Integer; var CanSelect: WordBool); dispid 20;
    procedure OnSetEditText(ACol: Integer; ARow: Integer; const Value: WideString); dispid 21;
    procedure OnTopLeftChanged; dispid 24;
  end;

// *********************************************************************//
// Interface: ITabbedNotebookX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDBCD-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ITabbedNotebookX = interface(IDispatch)
    ['{695CDBCD-02E5-11D2-B20D-00C04FA368D4}']
    function GetIndexForPage(const PageName: WideString): Integer; safecall;
    function Get_TopFont: IFontDisp; safecall;
    function Get_ActivePage: WideString; safecall;
    procedure Set_ActivePage(const Value: WideString); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_PageIndex: Integer; safecall;
    procedure Set_PageIndex(Value: Integer); safecall;
    function Get_Pages: IStrings; safecall;
    procedure Set_Pages(const Value: IStrings); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_TabsPerRow: Integer; safecall;
    procedure Set_TabsPerRow(Value: Integer); safecall;
    function Get_TabFont: IFontDisp; safecall;
    procedure Set_TabFont(const Value: IFontDisp); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property TopFont: IFontDisp read Get_TopFont;
    property ActivePage: WideString read Get_ActivePage write Set_ActivePage;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property PageIndex: Integer read Get_PageIndex write Set_PageIndex;
    property Pages: IStrings read Get_Pages write Set_Pages;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property TabsPerRow: Integer read Get_TabsPerRow write Set_TabsPerRow;
    property TabFont: IFontDisp read Get_TabFont write Set_TabFont;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  ITabbedNotebookXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDBCD-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ITabbedNotebookXDisp = dispinterface
    ['{695CDBCD-02E5-11D2-B20D-00C04FA368D4}']
    function GetIndexForPage(const PageName: WideString): Integer; dispid 1;
    property TopFont: IFontDisp readonly dispid 2;
    property ActivePage: WideString dispid 4;
    property Enabled: WordBool dispid -514;
    property PageIndex: Integer dispid 5;
    property Pages: IStrings dispid 6;
    property Font: IFontDisp dispid -512;
    property TabsPerRow: Integer dispid 7;
    property TabFont: IFontDisp dispid 8;
    property Visible: WordBool dispid 9;
    property DoubleBuffered: WordBool dispid 12;
    procedure FlipChildren(AllLevels: WordBool); dispid 13;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 16;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 17;
    function GetControlsAlignment: TxAlignment; dispid 18;
    procedure InitiateAction; dispid 20;
    function IsRightToLeft: WordBool; dispid 21;
    function UseRightToLeftAlignment: WordBool; dispid 26;
    function UseRightToLeftReading: WordBool; dispid 27;
    function UseRightToLeftScrollBar: WordBool; dispid 28;
    property BiDiMode: TxBiDiMode dispid 29;
    property Cursor: Smallint dispid 30;
    function ClassNameIs(const Name: WideString): WordBool; dispid 34;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  ITabbedNotebookXEvents
// Flags:     (0)
// GUID:      {695CDBCF-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ITabbedNotebookXEvents = dispinterface
    ['{695CDBCF-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnClick; dispid 1;
    procedure OnChange(NewTab: Integer; var AllowChange: WordBool); dispid 2;
  end;

// *********************************************************************//
// Interface: ITabControlX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDBD4-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ITabControlX = interface(IDispatch)
    ['{695CDBD4-02E5-11D2-B20D-00C04FA368D4}']
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_DockSite: WordBool; safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_HotTrack: WordBool; safecall;
    procedure Set_HotTrack(Value: WordBool); safecall;
    function Get_MultiLine: WordBool; safecall;
    procedure Set_MultiLine(Value: WordBool); safecall;
    function Get_MultiSelect: WordBool; safecall;
    procedure Set_MultiSelect(Value: WordBool); safecall;
    function Get_OwnerDraw: WordBool; safecall;
    procedure Set_OwnerDraw(Value: WordBool); safecall;
    function Get_ParentFont: WordBool; safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    function Get_RaggedRight: WordBool; safecall;
    procedure Set_RaggedRight(Value: WordBool); safecall;
    function Get_ScrollOpposite: WordBool; safecall;
    procedure Set_ScrollOpposite(Value: WordBool); safecall;
    function Get_Style: TxTabStyle; safecall;
    procedure Set_Style(Value: TxTabStyle); safecall;
    function Get_TabHeight: Smallint; safecall;
    procedure Set_TabHeight(Value: Smallint); safecall;
    function Get_TabPosition: TxTabPosition; safecall;
    procedure Set_TabPosition(Value: TxTabPosition); safecall;
    function Get_Tabs: IStrings; safecall;
    procedure Set_Tabs(const Value: IStrings); safecall;
    function Get_TabIndex: Integer; safecall;
    procedure Set_TabIndex(Value: Integer); safecall;
    function Get_TabWidth: Smallint; safecall;
    procedure Set_TabWidth(Value: Smallint); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property DockSite: WordBool read Get_DockSite write Set_DockSite;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property HotTrack: WordBool read Get_HotTrack write Set_HotTrack;
    property MultiLine: WordBool read Get_MultiLine write Set_MultiLine;
    property MultiSelect: WordBool read Get_MultiSelect write Set_MultiSelect;
    property OwnerDraw: WordBool read Get_OwnerDraw write Set_OwnerDraw;
    property ParentFont: WordBool read Get_ParentFont write Set_ParentFont;
    property RaggedRight: WordBool read Get_RaggedRight write Set_RaggedRight;
    property ScrollOpposite: WordBool read Get_ScrollOpposite write Set_ScrollOpposite;
    property Style: TxTabStyle read Get_Style write Set_Style;
    property TabHeight: Smallint read Get_TabHeight write Set_TabHeight;
    property TabPosition: TxTabPosition read Get_TabPosition write Set_TabPosition;
    property Tabs: IStrings read Get_Tabs write Set_Tabs;
    property TabIndex: Integer read Get_TabIndex write Set_TabIndex;
    property TabWidth: Smallint read Get_TabWidth write Set_TabWidth;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  ITabControlXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDBD4-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ITabControlXDisp = dispinterface
    ['{695CDBD4-02E5-11D2-B20D-00C04FA368D4}']
    property BiDiMode: TxBiDiMode dispid 1;
    property DockSite: WordBool dispid 2;
    property DragCursor: Smallint dispid 3;
    property DragMode: TxDragMode dispid 4;
    property Enabled: WordBool dispid -514;
    property Font: IFontDisp dispid -512;
    property HotTrack: WordBool dispid 5;
    property MultiLine: WordBool dispid 6;
    property MultiSelect: WordBool dispid 7;
    property OwnerDraw: WordBool dispid 8;
    property ParentFont: WordBool dispid 9;
    property RaggedRight: WordBool dispid 10;
    property ScrollOpposite: WordBool dispid 11;
    property Style: TxTabStyle dispid 12;
    property TabHeight: Smallint dispid 13;
    property TabPosition: TxTabPosition dispid 14;
    property Tabs: IStrings dispid 15;
    property TabIndex: Integer dispid 16;
    property TabWidth: Smallint dispid 17;
    property Visible: WordBool dispid 18;
    property DoubleBuffered: WordBool dispid 21;
    procedure FlipChildren(AllLevels: WordBool); dispid 22;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 25;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 26;
    function GetControlsAlignment: TxAlignment; dispid 27;
    procedure InitiateAction; dispid 29;
    function IsRightToLeft: WordBool; dispid 30;
    function UseRightToLeftAlignment: WordBool; dispid 35;
    function UseRightToLeftReading: WordBool; dispid 36;
    function UseRightToLeftScrollBar: WordBool; dispid 37;
    property Cursor: Smallint dispid 38;
    function ClassNameIs(const Name: WideString): WordBool; dispid 42;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  ITabControlXEvents
// Flags:     (0)
// GUID:      {695CDBD6-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ITabControlXEvents = dispinterface
    ['{695CDBD6-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnChange; dispid 1;
    procedure OnChanging(var AllowChange: WordBool); dispid 2;
    procedure OnGetImageIndex(TabIndex: Integer; var ImageIndex: Integer); dispid 10;
    procedure OnResize; dispid 15;
  end;

// *********************************************************************//
// Interface: ITabSetX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDBDD-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ITabSetX = interface(IDispatch)
    ['{695CDBDD-02E5-11D2-B20D-00C04FA368D4}']
    procedure SelectNext(Direction: WordBool); safecall;
    function Get_FirstIndex: Integer; safecall;
    procedure Set_FirstIndex(Value: Integer); safecall;
    function Get_AutoScroll: WordBool; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    function Get_BackgroundColor: OLE_COLOR; safecall;
    procedure Set_BackgroundColor(Value: OLE_COLOR); safecall;
    function Get_DitherBackground: WordBool; safecall;
    procedure Set_DitherBackground(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_EndMargin: Integer; safecall;
    procedure Set_EndMargin(Value: Integer); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    function Get_StartMargin: Integer; safecall;
    procedure Set_StartMargin(Value: Integer); safecall;
    function Get_SelectedColor: OLE_COLOR; safecall;
    procedure Set_SelectedColor(Value: OLE_COLOR); safecall;
    function Get_Style: TxTabStyle; safecall;
    procedure Set_Style(Value: TxTabStyle); safecall;
    function Get_TabHeight: Integer; safecall;
    procedure Set_TabHeight(Value: Integer); safecall;
    function Get_Tabs: IStrings; safecall;
    procedure Set_Tabs(const Value: IStrings); safecall;
    function Get_TabIndex: Integer; safecall;
    procedure Set_TabIndex(Value: Integer); safecall;
    function Get_UnselectedColor: OLE_COLOR; safecall;
    procedure Set_UnselectedColor(Value: OLE_COLOR); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_VisibleTabs: Integer; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property FirstIndex: Integer read Get_FirstIndex write Set_FirstIndex;
    property AutoScroll: WordBool read Get_AutoScroll write Set_AutoScroll;
    property BackgroundColor: OLE_COLOR read Get_BackgroundColor write Set_BackgroundColor;
    property DitherBackground: WordBool read Get_DitherBackground write Set_DitherBackground;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property EndMargin: Integer read Get_EndMargin write Set_EndMargin;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property StartMargin: Integer read Get_StartMargin write Set_StartMargin;
    property SelectedColor: OLE_COLOR read Get_SelectedColor write Set_SelectedColor;
    property Style: TxTabStyle read Get_Style write Set_Style;
    property TabHeight: Integer read Get_TabHeight write Set_TabHeight;
    property Tabs: IStrings read Get_Tabs write Set_Tabs;
    property TabIndex: Integer read Get_TabIndex write Set_TabIndex;
    property UnselectedColor: OLE_COLOR read Get_UnselectedColor write Set_UnselectedColor;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property VisibleTabs: Integer read Get_VisibleTabs;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  ITabSetXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDBDD-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ITabSetXDisp = dispinterface
    ['{695CDBDD-02E5-11D2-B20D-00C04FA368D4}']
    procedure SelectNext(Direction: WordBool); dispid 2;
    property FirstIndex: Integer dispid 3;
    property AutoScroll: WordBool dispid 4;
    property BackgroundColor: OLE_COLOR dispid 5;
    property DitherBackground: WordBool dispid 6;
    property DragCursor: Smallint dispid 7;
    property DragMode: TxDragMode dispid 8;
    property Enabled: WordBool dispid -514;
    property EndMargin: Integer dispid 9;
    property Font: IFontDisp dispid -512;
    property StartMargin: Integer dispid 10;
    property SelectedColor: OLE_COLOR dispid 11;
    property Style: TxTabStyle dispid 12;
    property TabHeight: Integer dispid 13;
    property Tabs: IStrings dispid 14;
    property TabIndex: Integer dispid 15;
    property UnselectedColor: OLE_COLOR dispid 16;
    property Visible: WordBool dispid 17;
    property VisibleTabs: Integer readonly dispid 18;
    property DoubleBuffered: WordBool dispid 21;
    procedure FlipChildren(AllLevels: WordBool); dispid 22;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 25;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 26;
    function GetControlsAlignment: TxAlignment; dispid 27;
    procedure InitiateAction; dispid 29;
    function IsRightToLeft: WordBool; dispid 30;
    function UseRightToLeftAlignment: WordBool; dispid 35;
    function UseRightToLeftReading: WordBool; dispid 36;
    function UseRightToLeftScrollBar: WordBool; dispid 37;
    property BiDiMode: TxBiDiMode dispid 38;
    property Cursor: Smallint dispid 39;
    function ClassNameIs(const Name: WideString): WordBool; dispid 43;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  ITabSetXEvents
// Flags:     (0)
// GUID:      {695CDBDF-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ITabSetXEvents = dispinterface
    ['{695CDBDF-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnClick; dispid 1;
    procedure OnChange(NewTab: Integer; var AllowChange: WordBool); dispid 2;
    procedure OnMeasureTab(Index: Integer; var TabWidth: Integer); dispid 11;
  end;

// *********************************************************************//
// Interface: ITrackBarX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDBE4-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ITrackBarX = interface(IDispatch)
    ['{695CDBE4-02E5-11D2-B20D-00C04FA368D4}']
    procedure SetTick(Value: Integer); safecall;
    function Get_Ctl3D: WordBool; safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    function Get_DragCursor: Smallint; safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    function Get_DragMode: TxDragMode; safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_LineSize: Integer; safecall;
    procedure Set_LineSize(Value: Integer); safecall;
    function Get_Max: Integer; safecall;
    procedure Set_Max(Value: Integer); safecall;
    function Get_Min: Integer; safecall;
    procedure Set_Min(Value: Integer); safecall;
    function Get_Orientation: TxTrackBarOrientation; safecall;
    procedure Set_Orientation(Value: TxTrackBarOrientation); safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    function Get_PageSize: Integer; safecall;
    procedure Set_PageSize(Value: Integer); safecall;
    function Get_Frequency: Integer; safecall;
    procedure Set_Frequency(Value: Integer); safecall;
    function Get_Position: Integer; safecall;
    procedure Set_Position(Value: Integer); safecall;
    function Get_SliderVisible: WordBool; safecall;
    procedure Set_SliderVisible(Value: WordBool); safecall;
    function Get_SelEnd: Integer; safecall;
    procedure Set_SelEnd(Value: Integer); safecall;
    function Get_SelStart: Integer; safecall;
    procedure Set_SelStart(Value: Integer); safecall;
    function Get_ThumbLength: Integer; safecall;
    procedure Set_ThumbLength(Value: Integer); safecall;
    function Get_TickMarks: TxTickMark; safecall;
    procedure Set_TickMarks(Value: TxTickMark); safecall;
    function Get_TickStyle: TxTickStyle; safecall;
    procedure Set_TickStyle(Value: TxTickStyle); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property Ctl3D: WordBool read Get_Ctl3D write Set_Ctl3D;
    property DragCursor: Smallint read Get_DragCursor write Set_DragCursor;
    property DragMode: TxDragMode read Get_DragMode write Set_DragMode;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property LineSize: Integer read Get_LineSize write Set_LineSize;
    property Max: Integer read Get_Max write Set_Max;
    property Min: Integer read Get_Min write Set_Min;
    property Orientation: TxTrackBarOrientation read Get_Orientation write Set_Orientation;
    property ParentCtl3D: WordBool read Get_ParentCtl3D write Set_ParentCtl3D;
    property PageSize: Integer read Get_PageSize write Set_PageSize;
    property Frequency: Integer read Get_Frequency write Set_Frequency;
    property Position: Integer read Get_Position write Set_Position;
    property SliderVisible: WordBool read Get_SliderVisible write Set_SliderVisible;
    property SelEnd: Integer read Get_SelEnd write Set_SelEnd;
    property SelStart: Integer read Get_SelStart write Set_SelStart;
    property ThumbLength: Integer read Get_ThumbLength write Set_ThumbLength;
    property TickMarks: TxTickMark read Get_TickMarks write Set_TickMarks;
    property TickStyle: TxTickStyle read Get_TickStyle write Set_TickStyle;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  ITrackBarXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDBE4-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ITrackBarXDisp = dispinterface
    ['{695CDBE4-02E5-11D2-B20D-00C04FA368D4}']
    procedure SetTick(Value: Integer); dispid 1;
    property Ctl3D: WordBool dispid 2;
    property DragCursor: Smallint dispid 3;
    property DragMode: TxDragMode dispid 4;
    property Enabled: WordBool dispid -514;
    property LineSize: Integer dispid 5;
    property Max: Integer dispid 6;
    property Min: Integer dispid 7;
    property Orientation: TxTrackBarOrientation dispid 8;
    property ParentCtl3D: WordBool dispid 9;
    property PageSize: Integer dispid 10;
    property Frequency: Integer dispid 11;
    property Position: Integer dispid 12;
    property SliderVisible: WordBool dispid 13;
    property SelEnd: Integer dispid 14;
    property SelStart: Integer dispid 15;
    property ThumbLength: Integer dispid 16;
    property TickMarks: TxTickMark dispid 17;
    property TickStyle: TxTickStyle dispid 18;
    property Visible: WordBool dispid 19;
    property DoubleBuffered: WordBool dispid 22;
    procedure FlipChildren(AllLevels: WordBool); dispid 23;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 26;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 27;
    function GetControlsAlignment: TxAlignment; dispid 28;
    procedure InitiateAction; dispid 30;
    function IsRightToLeft: WordBool; dispid 31;
    function UseRightToLeftAlignment: WordBool; dispid 36;
    function UseRightToLeftReading: WordBool; dispid 37;
    function UseRightToLeftScrollBar: WordBool; dispid 38;
    property BiDiMode: TxBiDiMode dispid 39;
    property Cursor: Smallint dispid 40;
    function ClassNameIs(const Name: WideString): WordBool; dispid 44;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  ITrackBarXEvents
// Flags:     (0)
// GUID:      {695CDBE6-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  ITrackBarXEvents = dispinterface
    ['{695CDBE6-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnChange; dispid 1;
    procedure OnKeyPress(var Key: Smallint); dispid 7;
  end;

// *********************************************************************//
// Interface: IUpDownX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDBEE-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IUpDownX = interface(IDispatch)
    ['{695CDBEE-02E5-11D2-B20D-00C04FA368D4}']
    function Get_AlignButton: TxUDAlignButton; safecall;
    procedure Set_AlignButton(Value: TxUDAlignButton); safecall;
    function Get_ArrowKeys: WordBool; safecall;
    procedure Set_ArrowKeys(Value: WordBool); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Min: Smallint; safecall;
    procedure Set_Min(Value: Smallint); safecall;
    function Get_Max: Smallint; safecall;
    procedure Set_Max(Value: Smallint); safecall;
    function Get_Increment: Integer; safecall;
    procedure Set_Increment(Value: Integer); safecall;
    function Get_Orientation: TxUDOrientation; safecall;
    procedure Set_Orientation(Value: TxUDOrientation); safecall;
    function Get_Position: Smallint; safecall;
    procedure Set_Position(Value: Smallint); safecall;
    function Get_Thousands: WordBool; safecall;
    procedure Set_Thousands(Value: WordBool); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_Wrap: WordBool; safecall;
    procedure Set_Wrap(Value: WordBool); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    procedure InitiateAction; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    procedure AboutBox; safecall;
    property AlignButton: TxUDAlignButton read Get_AlignButton write Set_AlignButton;
    property ArrowKeys: WordBool read Get_ArrowKeys write Set_ArrowKeys;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Min: Smallint read Get_Min write Set_Min;
    property Max: Smallint read Get_Max write Set_Max;
    property Increment: Integer read Get_Increment write Set_Increment;
    property Orientation: TxUDOrientation read Get_Orientation write Set_Orientation;
    property Position: Smallint read Get_Position write Set_Position;
    property Thousands: WordBool read Get_Thousands write Set_Thousands;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property Wrap: WordBool read Get_Wrap write Set_Wrap;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property BiDiMode: TxBiDiMode read Get_BiDiMode write Set_BiDiMode;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IUpDownXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {695CDBEE-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IUpDownXDisp = dispinterface
    ['{695CDBEE-02E5-11D2-B20D-00C04FA368D4}']
    property AlignButton: TxUDAlignButton dispid 1;
    property ArrowKeys: WordBool dispid 2;
    property Enabled: WordBool dispid -514;
    property Min: Smallint dispid 3;
    property Max: Smallint dispid 4;
    property Increment: Integer dispid 5;
    property Orientation: TxUDOrientation dispid 6;
    property Position: Smallint dispid 7;
    property Thousands: WordBool dispid 8;
    property Visible: WordBool dispid 9;
    property Wrap: WordBool dispid 10;
    property DoubleBuffered: WordBool dispid 13;
    procedure FlipChildren(AllLevels: WordBool); dispid 14;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; dispid 17;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; dispid 18;
    function GetControlsAlignment: TxAlignment; dispid 19;
    procedure InitiateAction; dispid 21;
    function IsRightToLeft: WordBool; dispid 22;
    function UseRightToLeftAlignment: WordBool; dispid 27;
    function UseRightToLeftReading: WordBool; dispid 28;
    function UseRightToLeftScrollBar: WordBool; dispid 29;
    property BiDiMode: TxBiDiMode dispid 30;
    property Cursor: Smallint dispid 31;
    function ClassNameIs(const Name: WideString): WordBool; dispid 35;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  IUpDownXEvents
// Flags:     (0)
// GUID:      {695CDBF0-02E5-11D2-B20D-00C04FA368D4}
// *********************************************************************//
  IUpDownXEvents = dispinterface
    ['{695CDBF0-02E5-11D2-B20D-00C04FA368D4}']
    procedure OnChanging(var AllowChange: WordBool); dispid 1;
    procedure OnClick(Button: TxUDBtnType); dispid 2;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TAnimateX
// Help String      : AnimateX Control
// Default Interface: IAnimateX
// Def. Intf. DISP? : No
// Event   Interface: IAnimateXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TAnimateX = class(TOleControl)
  private
    FOnOpen: TNotifyEvent;
    FOnClose: TNotifyEvent;
    FOnStart: TNotifyEvent;
    FOnStop: TNotifyEvent;
    FIntf: IAnimateX;
    function  GetControlInterface: IAnimateX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure Play(FromFrame: Smallint; ToFrame: Smallint; Count: Integer);
    procedure Reset;
    procedure Seek(Frame: Smallint);
    procedure Stop;
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IAnimateX read GetControlInterface;
    property FrameCount: Integer index 1 read GetIntegerProp;
    property FrameHeight: Integer index 2 read GetIntegerProp;
    property FrameWidth: Integer index 3 read GetIntegerProp;
    property Open: WordBool index 4 read GetWordBoolProp write SetWordBoolProp;
    property ResHandle: Integer index 9 read GetIntegerProp write SetIntegerProp;
    property ResId: Integer index 10 read GetIntegerProp write SetIntegerProp;
    property ResName: WideString index 11 read GetWideStringProp write SetWideStringProp;
    property DoubleBuffered: WordBool index 26 read GetWordBoolProp write SetWordBoolProp;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp;
    property BiDiMode: TOleEnum index 43 read GetTOleEnumProp write SetTOleEnumProp;
  published
    property Active: WordBool index 12 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoSize: WordBool index 13 read GetWordBoolProp write SetWordBoolProp stored False;
    property Center: WordBool index 14 read GetWordBoolProp write SetWordBoolProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property CommonAVI: TOleEnum index 15 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property FileName: WideString index 16 read GetWideStringProp write SetWideStringProp stored False;
    property ParentColor: WordBool index 17 read GetWordBoolProp write SetWordBoolProp stored False;
    property Repetitions: Integer index 18 read GetIntegerProp write SetIntegerProp stored False;
    property StartFrame: Smallint index 19 read GetSmallintProp write SetSmallintProp stored False;
    property StopFrame: Smallint index 20 read GetSmallintProp write SetSmallintProp stored False;
    property Timers: WordBool index 21 read GetWordBoolProp write SetWordBoolProp stored False;
    property Transparent: WordBool index 22 read GetWordBoolProp write SetWordBoolProp stored False;
    property Visible: WordBool index 23 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 44 read GetSmallintProp write SetSmallintProp stored False;
    property OnOpen: TNotifyEvent read FOnOpen write FOnOpen;
    property OnClose: TNotifyEvent read FOnClose write FOnClose;
    property OnStart: TNotifyEvent read FOnStart write FOnStart;
    property OnStop: TNotifyEvent read FOnStop write FOnStop;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TButtonX
// Help String      : ButtonX Control
// Default Interface: IButtonX
// Def. Intf. DISP? : No
// Event   Interface: IButtonXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TButtonXOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;

  TButtonX = class(TOleControl)
  private
    FOnClick: TNotifyEvent;
    FOnKeyPress: TButtonXOnKeyPress;
    FIntf: IButtonX;
    function  GetControlInterface: IButtonX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure Click;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IButtonX read GetControlInterface;
    property DoubleBuffered: WordBool index 12 read GetWordBoolProp write SetWordBoolProp;
  published
    property BiDiMode: TOleEnum index 3 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Cancel: WordBool index 4 read GetWordBoolProp write SetWordBoolProp stored False;
    property Caption: WideString index -518 read GetWideStringProp write SetWideStringProp stored False;
    property Default: WordBool index 5 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 6 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 7 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property ParentFont: WordBool index 8 read GetWordBoolProp write SetWordBoolProp stored False;
    property Visible: WordBool index 9 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 28 read GetSmallintProp write SetSmallintProp stored False;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnKeyPress: TButtonXOnKeyPress read FOnKeyPress write FOnKeyPress;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TCalendarX
// Help String      : CalendarX Control
// Default Interface: ICalendarX
// Def. Intf. DISP? : No
// Event   Interface: ICalendarXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TCalendarXOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;

  TCalendarX = class(TOleControl)
  private
    FOnClick: TNotifyEvent;
    FOnChange: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnKeyPress: TCalendarXOnKeyPress;
    FIntf: ICalendarX;
    function  GetControlInterface: ICalendarX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure NextMonth;
    procedure NextYear;
    procedure PrevMonth;
    procedure PrevYear;
    procedure UpdateCalendar;
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: ICalendarX read GetControlInterface;
    property CalendarDate: Double index 1 read GetDoubleProp write SetDoubleProp;
    property DoubleBuffered: WordBool index 23 read GetWordBoolProp write SetWordBoolProp;
    property BiDiMode: TOleEnum index 40 read GetTOleEnumProp write SetTOleEnumProp;
  published
    property BorderStyle: TOleEnum index 7 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Ctl3D: WordBool index 8 read GetWordBoolProp write SetWordBoolProp stored False;
    property Day: Integer index 9 read GetIntegerProp write SetIntegerProp stored False;
    property DragCursor: Smallint index 10 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 11 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property GridLineWidth: Integer index 12 read GetIntegerProp write SetIntegerProp stored False;
    property Month: Integer index 13 read GetIntegerProp write SetIntegerProp stored False;
    property ParentColor: WordBool index 14 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 15 read GetWordBoolProp write SetWordBoolProp stored False;
    property ReadOnly: WordBool index 16 read GetWordBoolProp write SetWordBoolProp stored False;
    property StartOfWeek: Smallint index 17 read GetSmallintProp write SetSmallintProp stored False;
    property UseCurrentDate: WordBool index 18 read GetWordBoolProp write SetWordBoolProp stored False;
    property Visible: WordBool index 19 read GetWordBoolProp write SetWordBoolProp stored False;
    property Year: Integer index 20 read GetIntegerProp write SetIntegerProp stored False;
    property Cursor: Smallint index 41 read GetSmallintProp write SetSmallintProp stored False;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnKeyPress: TCalendarXOnKeyPress read FOnKeyPress write FOnKeyPress;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TCheckBoxX
// Help String      : CheckBoxX Control
// Default Interface: ICheckBoxX
// Def. Intf. DISP? : No
// Event   Interface: ICheckBoxXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TCheckBoxXOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;

  TCheckBoxX = class(TOleControl)
  private
    FOnClick: TNotifyEvent;
    FOnKeyPress: TCheckBoxXOnKeyPress;
    FIntf: ICheckBoxX;
    function  GetControlInterface: ICheckBoxX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: ICheckBoxX read GetControlInterface;
    property DoubleBuffered: WordBool index 16 read GetWordBoolProp write SetWordBoolProp;
  published
    property Alignment: TOleEnum index 1 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property AllowGrayed: WordBool index 2 read GetWordBoolProp write SetWordBoolProp stored False;
    property BiDiMode: TOleEnum index 3 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Caption: WideString index -518 read GetWideStringProp write SetWideStringProp stored False;
    property Checked: WordBool index 4 read GetWordBoolProp write SetWordBoolProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Ctl3D: WordBool index 5 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 6 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 7 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property ParentColor: WordBool index 8 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentCtl3D: WordBool index 9 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 10 read GetWordBoolProp write SetWordBoolProp stored False;
    property State: TOleEnum index 11 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Visible: WordBool index 12 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 32 read GetSmallintProp write SetSmallintProp stored False;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnKeyPress: TCheckBoxXOnKeyPress read FOnKeyPress write FOnKeyPress;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TCheckListBoxX
// Help String      : CheckListBoxX Control
// Default Interface: ICheckListBoxX
// Def. Intf. DISP? : No
// Event   Interface: ICheckListBoxXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TCheckListBoxXOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;
  TCheckListBoxXOnMeasureItem = procedure(Sender: TObject; Index: Integer; var Height: Integer) of object;

  TCheckListBoxX = class(TOleControl)
  private
    FOnClickCheck: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnKeyPress: TCheckListBoxXOnKeyPress;
    FOnMeasureItem: TCheckListBoxXOnMeasureItem;
    FIntf: ICheckListBoxX;
    function  GetControlInterface: ICheckListBoxX;
    function Get_Items: IStrings;
    procedure Set_Items(const Value: IStrings);
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure Clear;
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: ICheckListBoxX read GetControlInterface;
    property Items: IStrings read Get_Items write Set_Items;
    property ItemIndex: Integer index 23 read GetIntegerProp write SetIntegerProp;
    property SelCount: Integer index 24 read GetIntegerProp;
    property TopIndex: Integer index 25 read GetIntegerProp write SetIntegerProp;
    property DoubleBuffered: WordBool index 28 read GetWordBoolProp write SetWordBoolProp;
  published
    property AllowGrayed: WordBool index 1 read GetWordBoolProp write SetWordBoolProp stored False;
    property BiDiMode: TOleEnum index 2 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property BorderStyle: TOleEnum index 3 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Columns: Integer index 4 read GetIntegerProp write SetIntegerProp stored False;
    property Ctl3D: WordBool index 5 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 6 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 7 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property Flat: WordBool index 8 read GetWordBoolProp write SetWordBoolProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property ImeMode: TOleEnum index 9 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property ImeName: WideString index 10 read GetWideStringProp write SetWideStringProp stored False;
    property IntegralHeight: WordBool index 11 read GetWordBoolProp write SetWordBoolProp stored False;
    property ItemHeight: Integer index 12 read GetIntegerProp write SetIntegerProp stored False;
    property ParentColor: WordBool index 14 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentCtl3D: WordBool index 15 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 16 read GetWordBoolProp write SetWordBoolProp stored False;
    property Sorted: WordBool index 17 read GetWordBoolProp write SetWordBoolProp stored False;
    property Style: TOleEnum index 18 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property TabWidth: Integer index 19 read GetIntegerProp write SetIntegerProp stored False;
    property Visible: WordBool index 20 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 45 read GetSmallintProp write SetSmallintProp stored False;
    property OnClickCheck: TNotifyEvent read FOnClickCheck write FOnClickCheck;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnKeyPress: TCheckListBoxXOnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnMeasureItem: TCheckListBoxXOnMeasureItem read FOnMeasureItem write FOnMeasureItem;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TColorGridX
// Help String      : ColorGridX Control
// Default Interface: IColorGridX
// Def. Intf. DISP? : No
// Event   Interface: IColorGridXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TColorGridXOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;

  TColorGridX = class(TOleControl)
  private
    FOnChange: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnKeyPress: TColorGridXOnKeyPress;
    FIntf: IColorGridX;
    function  GetControlInterface: IColorGridX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function ColorToIndex(AColor: OLE_COLOR; out Value: Integer): Integer;
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IColorGridX read GetControlInterface;
    property ForegroundColor: TColor index 2 read GetTColorProp;
    property BackgroundColor: TColor index 3 read GetTColorProp;
    property DoubleBuffered: WordBool index 19 read GetWordBoolProp write SetWordBoolProp;
    property BiDiMode: TOleEnum index 36 read GetTOleEnumProp write SetTOleEnumProp;
  published
    property ClickEnablesColor: WordBool index 4 read GetWordBoolProp write SetWordBoolProp stored False;
    property Ctl3D: WordBool index 5 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 6 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 7 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property GridOrdering: TOleEnum index 8 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property ForegroundIndex: Integer index 9 read GetIntegerProp write SetIntegerProp stored False;
    property BackgroundIndex: Integer index 10 read GetIntegerProp write SetIntegerProp stored False;
    property ForegroundEnabled: WordBool index 11 read GetWordBoolProp write SetWordBoolProp stored False;
    property BackgroundEnabled: WordBool index 12 read GetWordBoolProp write SetWordBoolProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property ParentCtl3D: WordBool index 13 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 14 read GetWordBoolProp write SetWordBoolProp stored False;
    property Selection: Integer index 15 read GetIntegerProp write SetIntegerProp stored False;
    property Visible: WordBool index 16 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 37 read GetSmallintProp write SetSmallintProp stored False;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnKeyPress: TColorGridXOnKeyPress read FOnKeyPress write FOnKeyPress;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TComboBoxX
// Help String      : ComboBoxX Control
// Default Interface: IComboBoxX
// Def. Intf. DISP? : No
// Event   Interface: IComboBoxXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TComboBoxXOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;
  TComboBoxXOnMeasureItem = procedure(Sender: TObject; Index: Integer; var Height: Integer) of object;

  TComboBoxX = class(TOleControl)
  private
    FOnChange: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnDropDown: TNotifyEvent;
    FOnKeyPress: TComboBoxXOnKeyPress;
    FOnMeasureItem: TComboBoxXOnMeasureItem;
    FIntf: IComboBoxX;
    function  GetControlInterface: IComboBoxX;
    function Get_Items: IStrings;
    procedure Set_Items(const Value: IStrings);
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure Clear;
    procedure SelectAll;
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IComboBoxX read GetControlInterface;
    property Items: IStrings read Get_Items write Set_Items;
    property CharCase: TOleEnum index 19 read GetTOleEnumProp write SetTOleEnumProp;
    property DroppedDown: WordBool index 20 read GetWordBoolProp write SetWordBoolProp;
    property ItemIndex: Integer index 21 read GetIntegerProp write SetIntegerProp;
    property SelLength: Integer index 22 read GetIntegerProp write SetIntegerProp;
    property SelStart: Integer index 23 read GetIntegerProp write SetIntegerProp;
    property SelText: WideString index 24 read GetWideStringProp write SetWideStringProp;
    property DoubleBuffered: WordBool index 27 read GetWordBoolProp write SetWordBoolProp;
  published
    property Style: TOleEnum index 1 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property BiDiMode: TOleEnum index 2 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Ctl3D: WordBool index 3 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 4 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 5 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property DropDownCount: Integer index 6 read GetIntegerProp write SetIntegerProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property ImeMode: TOleEnum index 7 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property ImeName: WideString index 8 read GetWideStringProp write SetWideStringProp stored False;
    property ItemHeight: Integer index 9 read GetIntegerProp write SetIntegerProp stored False;
    property MaxLength: Integer index 11 read GetIntegerProp write SetIntegerProp stored False;
    property ParentColor: WordBool index 12 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentCtl3D: WordBool index 13 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 14 read GetWordBoolProp write SetWordBoolProp stored False;
    property Sorted: WordBool index 15 read GetWordBoolProp write SetWordBoolProp stored False;
    property Text: WideString index -517 read GetWideStringProp write SetWideStringProp stored False;
    property Visible: WordBool index 16 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 44 read GetSmallintProp write SetSmallintProp stored False;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnDropDown: TNotifyEvent read FOnDropDown write FOnDropDown;
    property OnKeyPress: TComboBoxXOnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnMeasureItem: TComboBoxXOnMeasureItem read FOnMeasureItem write FOnMeasureItem;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TControlBarX
// Help String      : ControlBarX Control
// Default Interface: IControlBarX
// Def. Intf. DISP? : No
// Event   Interface: IControlBarXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TControlBarXOnCanResize = procedure(Sender: TObject; var NewWidth: Integer; 
                                                       var NewHeight: Integer; var Resize: WordBool) of object;
  TControlBarXOnConstrainedResize = procedure(Sender: TObject; var MinWidth: Integer; 
                                                               var MinHeight: Integer; 
                                                               var MaxWidth: Integer; 
                                                               var MaxHeight: Integer) of object;

  TControlBarX = class(TOleControl)
  private
    FOnCanResize: TControlBarXOnCanResize;
    FOnClick: TNotifyEvent;
    FOnConstrainedResize: TControlBarXOnConstrainedResize;
    FOnDblClick: TNotifyEvent;
    FOnPaint: TNotifyEvent;
    FOnResize: TNotifyEvent;
    FIntf: IControlBarX;
    function  GetControlInterface: IControlBarX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure FlipChildren(AllLevels: WordBool);
    procedure StickControls;
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IControlBarX read GetControlInterface;
    property DoubleBuffered: WordBool index 18 read GetWordBoolProp write SetWordBoolProp;
    property BiDiMode: TOleEnum index 34 read GetTOleEnumProp write SetTOleEnumProp;
  published
    property AutoDrag: WordBool index 1 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoSize: WordBool index 2 read GetWordBoolProp write SetWordBoolProp stored False;
    property BevelInner: TOleEnum index 3 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property BevelOuter: TOleEnum index 4 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property BevelKind: TOleEnum index 5 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property DockSite: WordBool index 6 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 7 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 8 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentColor: WordBool index 9 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentCtl3D: WordBool index 10 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 11 read GetWordBoolProp write SetWordBoolProp stored False;
    property Picture: TPicture index -523 read GetTPictureProp write SetTPictureProp stored False;
    property RowSnap: WordBool index 12 read GetWordBoolProp write SetWordBoolProp stored False;
    property Visible: WordBool index 13 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 35 read GetSmallintProp write SetSmallintProp stored False;
    property OnCanResize: TControlBarXOnCanResize read FOnCanResize write FOnCanResize;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnConstrainedResize: TControlBarXOnConstrainedResize read FOnConstrainedResize write FOnConstrainedResize;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
    property OnResize: TNotifyEvent read FOnResize write FOnResize;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TDateTimePickerX
// Help String      : DateTimePickerX Control
// Default Interface: IDateTimePickerX
// Def. Intf. DISP? : No
// Event   Interface: IDateTimePickerXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TDateTimePickerXOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;
  TDateTimePickerXOnUserInput = procedure(Sender: TObject; const UserString: WideString; 
                                                           var DateAndTime: Double; 
                                                           var AllowChange: WordBool) of object;

  TDateTimePickerX = class(TOleControl)
  private
    FOnClick: TNotifyEvent;
    FOnCloseUp: TNotifyEvent;
    FOnChange: TNotifyEvent;
    FOnDropDown: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnKeyPress: TDateTimePickerXOnKeyPress;
    FOnUserInput: TDateTimePickerXOnUserInput;
    FIntf: IDateTimePickerX;
    function  GetControlInterface: IDateTimePickerX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IDateTimePickerX read GetControlInterface;
    property DateTime: Double index 1 read GetDoubleProp write SetDoubleProp;
    property DroppedDown: WordBool index 2 read GetWordBoolProp;
    property DoubleBuffered: WordBool index 25 read GetWordBoolProp write SetWordBoolProp;
  published
    property BiDiMode: TOleEnum index 3 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property CalAlignment: TOleEnum index 4 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Date: Double index 5 read GetDoubleProp write SetDoubleProp stored False;
    property Time: Double index 6 read GetDoubleProp write SetDoubleProp stored False;
    property ShowCheckbox: WordBool index 7 read GetWordBoolProp write SetWordBoolProp stored False;
    property Checked: WordBool index 8 read GetWordBoolProp write SetWordBoolProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property DateFormat: TOleEnum index 9 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property DateMode: TOleEnum index 10 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property DragCursor: Smallint index 11 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 12 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property ImeMode: TOleEnum index 13 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property ImeName: WideString index 14 read GetWideStringProp write SetWideStringProp stored False;
    property Kind: TOleEnum index 15 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property MaxDate: Double index 16 read GetDoubleProp write SetDoubleProp stored False;
    property MinDate: Double index 17 read GetDoubleProp write SetDoubleProp stored False;
    property ParseInput: WordBool index 18 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentColor: WordBool index 19 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 20 read GetWordBoolProp write SetWordBoolProp stored False;
    property Visible: WordBool index 21 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 42 read GetSmallintProp write SetSmallintProp stored False;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnCloseUp: TNotifyEvent read FOnCloseUp write FOnCloseUp;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnDropDown: TNotifyEvent read FOnDropDown write FOnDropDown;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnKeyPress: TDateTimePickerXOnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnUserInput: TDateTimePickerXOnUserInput read FOnUserInput write FOnUserInput;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TDrawGridX
// Help String      : DrawGridX Control
// Default Interface: IDrawGridX
// Def. Intf. DISP? : No
// Event   Interface: IDrawGridXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TDrawGridXOnColumnMoved = procedure(Sender: TObject; FromIndex: Integer; ToIndex: Integer) of object;
  TDrawGridXOnGetEditMask = procedure(Sender: TObject; ACol: Integer; ARow: Integer; 
                                                       var Value: WideString) of object;
  TDrawGridXOnGetEditText = procedure(Sender: TObject; ACol: Integer; ARow: Integer; 
                                                       var Value: WideString) of object;
  TDrawGridXOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;
  TDrawGridXOnRowMoved = procedure(Sender: TObject; FromIndex: Integer; ToIndex: Integer) of object;
  TDrawGridXOnSelectCell = procedure(Sender: TObject; ACol: Integer; ARow: Integer; 
                                                      var CanSelect: WordBool) of object;
  TDrawGridXOnSetEditText = procedure(Sender: TObject; ACol: Integer; ARow: Integer; 
                                                       const Value: WideString) of object;

  TDrawGridX = class(TOleControl)
  private
    FOnClick: TNotifyEvent;
    FOnColumnMoved: TDrawGridXOnColumnMoved;
    FOnDblClick: TNotifyEvent;
    FOnGetEditMask: TDrawGridXOnGetEditMask;
    FOnGetEditText: TDrawGridXOnGetEditText;
    FOnKeyPress: TDrawGridXOnKeyPress;
    FOnRowMoved: TDrawGridXOnRowMoved;
    FOnSelectCell: TDrawGridXOnSelectCell;
    FOnSetEditText: TDrawGridXOnSetEditText;
    FOnTopLeftChanged: TNotifyEvent;
    FIntf: IDrawGridX;
    function  GetControlInterface: IDrawGridX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure MouseToCell(X: Integer; Y: Integer; var ACol: Integer; var ARow: Integer);
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IDrawGridX read GetControlInterface;
    property Col: Integer index 2 read GetIntegerProp write SetIntegerProp;
    property EditorMode: WordBool index 3 read GetWordBoolProp write SetWordBoolProp;
    property GridHeight: Integer index 4 read GetIntegerProp;
    property GridWidth: Integer index 5 read GetIntegerProp;
    property LeftCol: Integer index 6 read GetIntegerProp write SetIntegerProp;
    property Row: Integer index 7 read GetIntegerProp write SetIntegerProp;
    property TopRow: Integer index 8 read GetIntegerProp write SetIntegerProp;
    property VisibleColCount: Integer index 28 read GetIntegerProp;
    property VisibleRowCount: Integer index 29 read GetIntegerProp;
    property DoubleBuffered: WordBool index 32 read GetWordBoolProp write SetWordBoolProp;
  published
    property BiDiMode: TOleEnum index 9 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property BorderStyle: TOleEnum index 10 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property ColCount: Integer index 11 read GetIntegerProp write SetIntegerProp stored False;
    property Ctl3D: WordBool index 12 read GetWordBoolProp write SetWordBoolProp stored False;
    property DefaultColWidth: Integer index 13 read GetIntegerProp write SetIntegerProp stored False;
    property DefaultRowHeight: Integer index 14 read GetIntegerProp write SetIntegerProp stored False;
    property DefaultDrawing: WordBool index 15 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 16 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 17 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property FixedColor: TColor index 18 read GetTColorProp write SetTColorProp stored False;
    property FixedCols: Integer index 19 read GetIntegerProp write SetIntegerProp stored False;
    property RowCount: Integer index 20 read GetIntegerProp write SetIntegerProp stored False;
    property FixedRows: Integer index 21 read GetIntegerProp write SetIntegerProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property GridLineWidth: Integer index 22 read GetIntegerProp write SetIntegerProp stored False;
    property ParentColor: WordBool index 23 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentCtl3D: WordBool index 24 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 25 read GetWordBoolProp write SetWordBoolProp stored False;
    property ScrollBars: TOleEnum index 26 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Visible: WordBool index 27 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 49 read GetSmallintProp write SetSmallintProp stored False;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnColumnMoved: TDrawGridXOnColumnMoved read FOnColumnMoved write FOnColumnMoved;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnGetEditMask: TDrawGridXOnGetEditMask read FOnGetEditMask write FOnGetEditMask;
    property OnGetEditText: TDrawGridXOnGetEditText read FOnGetEditText write FOnGetEditText;
    property OnKeyPress: TDrawGridXOnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnRowMoved: TDrawGridXOnRowMoved read FOnRowMoved write FOnRowMoved;
    property OnSelectCell: TDrawGridXOnSelectCell read FOnSelectCell write FOnSelectCell;
    property OnSetEditText: TDrawGridXOnSetEditText read FOnSetEditText write FOnSetEditText;
    property OnTopLeftChanged: TNotifyEvent read FOnTopLeftChanged write FOnTopLeftChanged;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TEditX
// Help String      : EditX Control
// Default Interface: IEditX
// Def. Intf. DISP? : No
// Event   Interface: IEditXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TEditXOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;

  TEditX = class(TOleControl)
  private
    FOnChange: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnKeyPress: TEditXOnKeyPress;
    FIntf: IEditX;
    function  GetControlInterface: IEditX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure Clear;
    procedure ClearSelection;
    procedure CopyToClipboard;
    procedure CutToClipboard;
    procedure PasteFromClipboard;
    procedure Undo;
    procedure ClearUndo;
    procedure SelectAll;
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IEditX read GetControlInterface;
    property CanUndo: WordBool index 31 read GetWordBoolProp;
    property Modified: WordBool index 32 read GetWordBoolProp write SetWordBoolProp;
    property SelLength: Integer index 33 read GetIntegerProp write SetIntegerProp;
    property SelStart: Integer index 34 read GetIntegerProp write SetIntegerProp;
    property SelText: WideString index 35 read GetWideStringProp write SetWideStringProp;
    property DoubleBuffered: WordBool index 37 read GetWordBoolProp write SetWordBoolProp;
  published
    property AutoSelect: WordBool index 1 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoSize: WordBool index 2 read GetWordBoolProp write SetWordBoolProp stored False;
    property BiDiMode: TOleEnum index 3 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property BorderStyle: TOleEnum index 4 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property CharCase: TOleEnum index 5 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Ctl3D: WordBool index 6 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 7 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 8 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property HideSelection: WordBool index 9 read GetWordBoolProp write SetWordBoolProp stored False;
    property ImeMode: TOleEnum index 10 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property ImeName: WideString index 11 read GetWideStringProp write SetWideStringProp stored False;
    property MaxLength: Integer index 12 read GetIntegerProp write SetIntegerProp stored False;
    property OEMConvert: WordBool index 13 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentColor: WordBool index 14 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentCtl3D: WordBool index 15 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 16 read GetWordBoolProp write SetWordBoolProp stored False;
    property PasswordChar: Smallint index 17 read GetSmallintProp write SetSmallintProp stored False;
    property ReadOnly: WordBool index 18 read GetWordBoolProp write SetWordBoolProp stored False;
    property Text: WideString index -517 read GetWideStringProp write SetWideStringProp stored False;
    property Visible: WordBool index 19 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 54 read GetSmallintProp write SetSmallintProp stored False;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnKeyPress: TEditXOnKeyPress read FOnKeyPress write FOnKeyPress;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TGroupBoxX
// Help String      : GroupBoxX Control
// Default Interface: IGroupBoxX
// Def. Intf. DISP? : No
// Event   Interface: IGroupBoxXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TGroupBoxX = class(TOleControl)
  private
    FOnClick: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FIntf: IGroupBoxX;
    function  GetControlInterface: IGroupBoxX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IGroupBoxX read GetControlInterface;
    property DoubleBuffered: WordBool index 12 read GetWordBoolProp write SetWordBoolProp;
  published
    property BiDiMode: TOleEnum index 1 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Caption: WideString index -518 read GetWideStringProp write SetWideStringProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Ctl3D: WordBool index 2 read GetWordBoolProp write SetWordBoolProp stored False;
    property DockSite: WordBool index 3 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 4 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 5 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property ParentColor: WordBool index 6 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentCtl3D: WordBool index 7 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 8 read GetWordBoolProp write SetWordBoolProp stored False;
    property Visible: WordBool index 9 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 29 read GetSmallintProp write SetSmallintProp stored False;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : THotKeyX
// Help String      : HotKeyX Control
// Default Interface: IHotKeyX
// Def. Intf. DISP? : No
// Event   Interface: IHotKeyXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  THotKeyX = class(TOleControl)
  private
    FIntf: IHotKeyX;
    function  GetControlInterface: IHotKeyX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IHotKeyX read GetControlInterface;
    property DoubleBuffered: WordBool index 7 read GetWordBoolProp write SetWordBoolProp;
  published
    property AutoSize: WordBool index 1 read GetWordBoolProp write SetWordBoolProp stored False;
    property BiDiMode: TOleEnum index 2 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property HotKey: Smallint index 3 read GetSmallintProp write SetSmallintProp stored False;
    property Visible: WordBool index 4 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 24 read GetSmallintProp write SetSmallintProp stored False;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TListBoxX
// Help String      : ListBoxX Control
// Default Interface: IListBoxX
// Def. Intf. DISP? : No
// Event   Interface: IListBoxXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TListBoxXOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;
  TListBoxXOnMeasureItem = procedure(Sender: TObject; Index: Integer; var Height: Integer) of object;

  TListBoxX = class(TOleControl)
  private
    FOnClick: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnKeyPress: TListBoxXOnKeyPress;
    FOnMeasureItem: TListBoxXOnMeasureItem;
    FIntf: IListBoxX;
    function  GetControlInterface: IListBoxX;
    function Get_Items: IStrings;
    procedure Set_Items(const Value: IStrings);
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure Clear;
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IListBoxX read GetControlInterface;
    property Items: IStrings read Get_Items write Set_Items;
    property ItemIndex: Integer index 23 read GetIntegerProp write SetIntegerProp;
    property SelCount: Integer index 24 read GetIntegerProp;
    property TopIndex: Integer index 25 read GetIntegerProp write SetIntegerProp;
    property DoubleBuffered: WordBool index 28 read GetWordBoolProp write SetWordBoolProp;
  published
    property BiDiMode: TOleEnum index 1 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property BorderStyle: TOleEnum index 2 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Columns: Integer index 3 read GetIntegerProp write SetIntegerProp stored False;
    property Ctl3D: WordBool index 4 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 5 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 6 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property ExtendedSelect: WordBool index 7 read GetWordBoolProp write SetWordBoolProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property ImeMode: TOleEnum index 8 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property ImeName: WideString index 9 read GetWideStringProp write SetWideStringProp stored False;
    property IntegralHeight: WordBool index 10 read GetWordBoolProp write SetWordBoolProp stored False;
    property ItemHeight: Integer index 11 read GetIntegerProp write SetIntegerProp stored False;
    property MultiSelect: WordBool index 13 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentColor: WordBool index 14 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentCtl3D: WordBool index 15 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 16 read GetWordBoolProp write SetWordBoolProp stored False;
    property Sorted: WordBool index 17 read GetWordBoolProp write SetWordBoolProp stored False;
    property Style: TOleEnum index 18 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property TabWidth: Integer index 19 read GetIntegerProp write SetIntegerProp stored False;
    property Visible: WordBool index 20 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 45 read GetSmallintProp write SetSmallintProp stored False;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnKeyPress: TListBoxXOnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnMeasureItem: TListBoxXOnMeasureItem read FOnMeasureItem write FOnMeasureItem;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TMaskEditX
// Help String      : MaskEditX Control
// Default Interface: IMaskEditX
// Def. Intf. DISP? : No
// Event   Interface: IMaskEditXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TMaskEditXOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;

  TMaskEditX = class(TOleControl)
  private
    FOnChange: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnKeyPress: TMaskEditXOnKeyPress;
    FIntf: IMaskEditX;
    function  GetControlInterface: IMaskEditX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure ValidateEdit;
    procedure Clear;
    procedure ClearSelection;
    procedure CopyToClipboard;
    procedure CutToClipboard;
    procedure PasteFromClipboard;
    procedure Undo;
    procedure ClearUndo;
    procedure SelectAll;
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IMaskEditX read GetControlInterface;
    property IsMasked: WordBool index 21 read GetWordBoolProp;
    property EditText: WideString index 22 read GetWideStringProp write SetWideStringProp;
    property CanUndo: WordBool index 33 read GetWordBoolProp;
    property Modified: WordBool index 34 read GetWordBoolProp write SetWordBoolProp;
    property SelLength: Integer index 35 read GetIntegerProp write SetIntegerProp;
    property SelStart: Integer index 36 read GetIntegerProp write SetIntegerProp;
    property SelText: WideString index 37 read GetWideStringProp write SetWideStringProp;
    property DoubleBuffered: WordBool index 39 read GetWordBoolProp write SetWordBoolProp;
  published
    property AutoSelect: WordBool index 1 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoSize: WordBool index 2 read GetWordBoolProp write SetWordBoolProp stored False;
    property BiDiMode: TOleEnum index 3 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property BorderStyle: TOleEnum index 4 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property CharCase: TOleEnum index 5 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Ctl3D: WordBool index 6 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 7 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 8 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property EditMask: WideString index 9 read GetWideStringProp write SetWideStringProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property ImeMode: TOleEnum index 10 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property ImeName: WideString index 11 read GetWideStringProp write SetWideStringProp stored False;
    property MaxLength: Integer index 12 read GetIntegerProp write SetIntegerProp stored False;
    property ParentColor: WordBool index 13 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentCtl3D: WordBool index 14 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 15 read GetWordBoolProp write SetWordBoolProp stored False;
    property PasswordChar: Smallint index 16 read GetSmallintProp write SetSmallintProp stored False;
    property ReadOnly: WordBool index 17 read GetWordBoolProp write SetWordBoolProp stored False;
    property Text: WideString index -517 read GetWideStringProp write SetWideStringProp stored False;
    property Visible: WordBool index 18 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 56 read GetSmallintProp write SetSmallintProp stored False;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnKeyPress: TMaskEditXOnKeyPress read FOnKeyPress write FOnKeyPress;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TMediaPlayerX
// Help String      : MediaPlayerX Control
// Default Interface: IMediaPlayerX
// Def. Intf. DISP? : No
// Event   Interface: IMediaPlayerXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TMediaPlayerXOnClick = procedure(Sender: TObject; Button: TxMPBtnType; var DoDefault: WordBool) of object;
  TMediaPlayerXOnPostClick = procedure(Sender: TObject; Button: TxMPBtnType) of object;

  TMediaPlayerX = class(TOleControl)
  private
    FOnClick: TMediaPlayerXOnClick;
    FOnPostClick: TMediaPlayerXOnPostClick;
    FOnNotify: TNotifyEvent;
    FIntf: IMediaPlayerX;
    function  GetControlInterface: IMediaPlayerX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure Open;
    procedure Close;
    procedure Play;
    procedure Stop;
    procedure Pause;
    procedure Step;
    procedure Back;
    procedure Previous;
    procedure Next;
    procedure StartRecording;
    procedure Eject;
    procedure Save;
    procedure PauseOnly;
    procedure Resume;
    procedure Rewind;
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IMediaPlayerX read GetControlInterface;
    property Error: Integer index 16 read GetIntegerProp;
    property ErrorMessage: WideString index 17 read GetWideStringProp;
    property Start: Integer index 18 read GetIntegerProp;
    property Length: Integer index 19 read GetIntegerProp;
    property Tracks: Integer index 20 read GetIntegerProp;
    property Frames: Integer index 21 read GetIntegerProp write SetIntegerProp;
    property Mode: TOleEnum index 22 read GetTOleEnumProp;
    property Position: Integer index 23 read GetIntegerProp write SetIntegerProp;
    property Wait: WordBool index 24 read GetWordBoolProp write SetWordBoolProp;
    property Notify: WordBool index 25 read GetWordBoolProp write SetWordBoolProp;
    property NotifyValue: TOleEnum index 26 read GetTOleEnumProp;
    property StartPos: Integer index 27 read GetIntegerProp write SetIntegerProp;
    property EndPos: Integer index 28 read GetIntegerProp write SetIntegerProp;
    property DeviceID: Smallint index 29 read GetSmallintProp;
    property TimeFormat: TOleEnum index 30 read GetTOleEnumProp write SetTOleEnumProp;
    property DoubleBuffered: WordBool index 40 read GetWordBoolProp write SetWordBoolProp;
    property BiDiMode: TOleEnum index 57 read GetTOleEnumProp write SetTOleEnumProp;
  published
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoEnable: WordBool index 31 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoOpen: WordBool index 32 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoRewind: WordBool index 33 read GetWordBoolProp write SetWordBoolProp stored False;
    property DeviceType: TOleEnum index 34 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property FileName: WideString index 35 read GetWideStringProp write SetWideStringProp stored False;
    property Shareable: WordBool index 36 read GetWordBoolProp write SetWordBoolProp stored False;
    property Visible: WordBool index 37 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 58 read GetSmallintProp write SetSmallintProp stored False;
    property OnClick: TMediaPlayerXOnClick read FOnClick write FOnClick;
    property OnPostClick: TMediaPlayerXOnPostClick read FOnPostClick write FOnPostClick;
    property OnNotify: TNotifyEvent read FOnNotify write FOnNotify;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TMemoX
// Help String      : MemoX Control
// Default Interface: IMemoX
// Def. Intf. DISP? : No
// Event   Interface: IMemoXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TMemoXOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;

  TMemoX = class(TOleControl)
  private
    FOnChange: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnKeyPress: TMemoXOnKeyPress;
    FIntf: IMemoX;
    function  GetControlInterface: IMemoX;
    function Get_Lines: IStrings;
    procedure Set_Lines(const Value: IStrings);
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure Clear;
    procedure ClearSelection;
    procedure CopyToClipboard;
    procedure CutToClipboard;
    procedure PasteFromClipboard;
    procedure Undo;
    procedure ClearUndo;
    procedure SelectAll;
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IMemoX read GetControlInterface;
    property Lines: IStrings read Get_Lines write Set_Lines;
    property CanUndo: WordBool index 34 read GetWordBoolProp;
    property Modified: WordBool index 35 read GetWordBoolProp write SetWordBoolProp;
    property SelLength: Integer index 36 read GetIntegerProp write SetIntegerProp;
    property SelStart: Integer index 37 read GetIntegerProp write SetIntegerProp;
    property SelText: WideString index 38 read GetWideStringProp write SetWideStringProp;
    property Text: WideString index -517 read GetWideStringProp write SetWideStringProp;
    property DoubleBuffered: WordBool index 40 read GetWordBoolProp write SetWordBoolProp;
  published
    property Alignment: TOleEnum index 1 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property BiDiMode: TOleEnum index 2 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property BorderStyle: TOleEnum index 3 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Ctl3D: WordBool index 4 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 5 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 6 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property HideSelection: WordBool index 7 read GetWordBoolProp write SetWordBoolProp stored False;
    property ImeMode: TOleEnum index 8 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property ImeName: WideString index 9 read GetWideStringProp write SetWideStringProp stored False;
    property MaxLength: Integer index 11 read GetIntegerProp write SetIntegerProp stored False;
    property OEMConvert: WordBool index 12 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentColor: WordBool index 13 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentCtl3D: WordBool index 14 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 15 read GetWordBoolProp write SetWordBoolProp stored False;
    property ReadOnly: WordBool index 16 read GetWordBoolProp write SetWordBoolProp stored False;
    property ScrollBars: TOleEnum index 17 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Visible: WordBool index 18 read GetWordBoolProp write SetWordBoolProp stored False;
    property WantReturns: WordBool index 19 read GetWordBoolProp write SetWordBoolProp stored False;
    property WantTabs: WordBool index 20 read GetWordBoolProp write SetWordBoolProp stored False;
    property WordWrap: WordBool index 21 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 56 read GetSmallintProp write SetSmallintProp stored False;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnKeyPress: TMemoXOnKeyPress read FOnKeyPress write FOnKeyPress;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TMonthCalendarX
// Help String      : MonthCalendarX Control
// Default Interface: IMonthCalendarX
// Def. Intf. DISP? : No
// Event   Interface: IMonthCalendarXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TMonthCalendarXOnGetMonthInfo = procedure(Sender: TObject; Month: Integer; 
                                                             var MonthBoldInfo: Integer) of object;
  TMonthCalendarXOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;

  TMonthCalendarX = class(TOleControl)
  private
    FOnClick: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnGetMonthInfo: TMonthCalendarXOnGetMonthInfo;
    FOnKeyPress: TMonthCalendarXOnKeyPress;
    FIntf: IMonthCalendarX;
    function  GetControlInterface: IMonthCalendarX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IMonthCalendarX read GetControlInterface;
    property DoubleBuffered: WordBool index 22 read GetWordBoolProp write SetWordBoolProp;
  published
    property AutoSize: WordBool index 1 read GetWordBoolProp write SetWordBoolProp stored False;
    property BiDiMode: TOleEnum index 2 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property MultiSelect: WordBool index 3 read GetWordBoolProp write SetWordBoolProp stored False;
    property Date: Double index 4 read GetDoubleProp write SetDoubleProp stored False;
    property DragCursor: Smallint index 5 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 6 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property EndDate: Double index 7 read GetDoubleProp write SetDoubleProp stored False;
    property FirstDayOfWeek: TOleEnum index 8 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property ImeMode: TOleEnum index 9 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property ImeName: WideString index 10 read GetWideStringProp write SetWideStringProp stored False;
    property MaxDate: Double index 11 read GetDoubleProp write SetDoubleProp stored False;
    property MaxSelectRange: Integer index 12 read GetIntegerProp write SetIntegerProp stored False;
    property MinDate: Double index 13 read GetDoubleProp write SetDoubleProp stored False;
    property ParentFont: WordBool index 14 read GetWordBoolProp write SetWordBoolProp stored False;
    property ShowToday: WordBool index 15 read GetWordBoolProp write SetWordBoolProp stored False;
    property ShowTodayCircle: WordBool index 16 read GetWordBoolProp write SetWordBoolProp stored False;
    property Visible: WordBool index 17 read GetWordBoolProp write SetWordBoolProp stored False;
    property WeekNumbers: WordBool index 18 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 39 read GetSmallintProp write SetSmallintProp stored False;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnGetMonthInfo: TMonthCalendarXOnGetMonthInfo read FOnGetMonthInfo write FOnGetMonthInfo;
    property OnKeyPress: TMonthCalendarXOnKeyPress read FOnKeyPress write FOnKeyPress;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TNotebookX
// Help String      : NotebookX Control
// Default Interface: INotebookX
// Def. Intf. DISP? : No
// Event   Interface: INotebookXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TNotebookX = class(TOleControl)
  private
    FOnClick: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnPageChanged: TNotifyEvent;
    FIntf: INotebookX;
    function  GetControlInterface: INotebookX;
    function Get_Pages: IStrings;
    procedure Set_Pages(const Value: IStrings);
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: INotebookX read GetControlInterface;
    property Pages: IStrings read Get_Pages write Set_Pages;
    property DoubleBuffered: WordBool index 13 read GetWordBoolProp write SetWordBoolProp;
    property BiDiMode: TOleEnum index 30 read GetTOleEnumProp write SetTOleEnumProp;
  published
    property ActivePage: WideString index 1 read GetWideStringProp write SetWideStringProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Ctl3D: WordBool index 2 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 3 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 4 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property PageIndex: Integer index 5 read GetIntegerProp write SetIntegerProp stored False;
    property ParentColor: WordBool index 7 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentCtl3D: WordBool index 8 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 9 read GetWordBoolProp write SetWordBoolProp stored False;
    property Visible: WordBool index 10 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 31 read GetSmallintProp write SetSmallintProp stored False;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnPageChanged: TNotifyEvent read FOnPageChanged write FOnPageChanged;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TOutlineX
// Help String      : OutlineX Control
// Default Interface: IOutlineX
// Def. Intf. DISP? : No
// Event   Interface: IOutlineXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TOutlineXOnExpand = procedure(Sender: TObject; Index: Integer) of object;
  TOutlineXOnCollapse = procedure(Sender: TObject; Index: Integer) of object;
  TOutlineXOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;

  TOutlineX = class(TOleControl)
  private
    FOnExpand: TOutlineXOnExpand;
    FOnCollapse: TOutlineXOnCollapse;
    FOnClick: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnKeyPress: TOutlineXOnKeyPress;
    FIntf: IOutlineX;
    function  GetControlInterface: IOutlineX;
    function Get_Lines: IStrings;
    procedure Set_Lines(const Value: IStrings);
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function Add(Index: Integer; const Text: WideString; out Value: Integer): Integer;
    function AddChild(Index: Integer; const Text: WideString; out Value: Integer): Integer;
    function Insert(Index: Integer; const Text: WideString; out Value: Integer): Integer;
    procedure Delete(Index: Integer);
    function GetItem(X: Integer; Y: Integer; out Value: Integer): Integer;
    function GetTextItem(const Param1: WideString; out Value: Integer): Integer;
    procedure FullExpand;
    procedure FullCollapse;
    procedure LoadFromFile(const FileName: WideString);
    procedure SaveToFile(const FileName: WideString);
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure SetUpdateState(Value: WordBool);
    procedure Clear;
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IOutlineX read GetControlInterface;
    property Lines: IStrings read Get_Lines write Set_Lines;
    property ItemCount: Integer index 36 read GetIntegerProp;
    property SelectedItem: Integer index 37 read GetIntegerProp write SetIntegerProp;
    property Row: Integer index 38 read GetIntegerProp write SetIntegerProp;
    property DoubleBuffered: WordBool index 41 read GetWordBoolProp write SetWordBoolProp;
    property BiDiMode: TOleEnum index 58 read GetTOleEnumProp write SetTOleEnumProp;
  published
    property OutlineStyle: TOleEnum index 2 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Style: TOleEnum index 3 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property ItemHeight: Integer index 4 read GetIntegerProp write SetIntegerProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property ParentColor: WordBool index 5 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentCtl3D: WordBool index 6 read GetWordBoolProp write SetWordBoolProp stored False;
    property Ctl3D: WordBool index 7 read GetWordBoolProp write SetWordBoolProp stored False;
    property Visible: WordBool index 8 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragMode: TOleEnum index 9 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property DragCursor: Smallint index 10 read GetSmallintProp write SetSmallintProp stored False;
    property BorderStyle: TOleEnum index 11 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property ItemSeparator: WideString index 12 read GetWideStringProp write SetWideStringProp stored False;
    property ParentFont: WordBool index 13 read GetWordBoolProp write SetWordBoolProp stored False;
    property ScrollBars: TOleEnum index 14 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Cursor: Smallint index 59 read GetSmallintProp write SetSmallintProp stored False;
    property OnExpand: TOutlineXOnExpand read FOnExpand write FOnExpand;
    property OnCollapse: TOutlineXOnCollapse read FOnCollapse write FOnCollapse;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnKeyPress: TOutlineXOnKeyPress read FOnKeyPress write FOnKeyPress;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TPageScrollerX
// Help String      : PageScrollerX Control
// Default Interface: IPageScrollerX
// Def. Intf. DISP? : No
// Event   Interface: IPageScrollerXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TPageScrollerXOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;

  TPageScrollerX = class(TOleControl)
  private
    FOnClick: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnKeyPress: TPageScrollerXOnKeyPress;
    FOnResize: TNotifyEvent;
    FIntf: IPageScrollerX;
    function  GetControlInterface: IPageScrollerX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function GetButtonState(Button: TxPageScrollerButton; out Value: TxPageScrollerButtonState): TxPageScrollerButtonState;
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IPageScrollerX read GetControlInterface;
    property DoubleBuffered: WordBool index 16 read GetWordBoolProp write SetWordBoolProp;
    property BiDiMode: TOleEnum index 33 read GetTOleEnumProp write SetTOleEnumProp;
  published
    property AutoScroll: WordBool index 2 read GetWordBoolProp write SetWordBoolProp stored False;
    property ButtonSize: Integer index 3 read GetIntegerProp write SetIntegerProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property DockSite: WordBool index 4 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 5 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 6 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property DragScroll: WordBool index 7 read GetWordBoolProp write SetWordBoolProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property Margin: Integer index 8 read GetIntegerProp write SetIntegerProp stored False;
    property Orientation: TOleEnum index 9 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property ParentColor: WordBool index 10 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 11 read GetWordBoolProp write SetWordBoolProp stored False;
    property Position: Integer index 12 read GetIntegerProp write SetIntegerProp stored False;
    property Visible: WordBool index 13 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 34 read GetSmallintProp write SetSmallintProp stored False;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnKeyPress: TPageScrollerXOnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnResize: TNotifyEvent read FOnResize write FOnResize;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TPanelX
// Help String      : PanelX Control
// Default Interface: IPanelX
// Def. Intf. DISP? : No
// Event   Interface: IPanelXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TPanelXOnCanResize = procedure(Sender: TObject; var NewWidth: Integer; var NewHeight: Integer; 
                                                  var Resize: WordBool) of object;
  TPanelXOnConstrainedResize = procedure(Sender: TObject; var MinWidth: Integer; 
                                                          var MinHeight: Integer; 
                                                          var MaxWidth: Integer; 
                                                          var MaxHeight: Integer) of object;

  TPanelX = class(TOleControl)
  private
    FOnCanResize: TPanelXOnCanResize;
    FOnClick: TNotifyEvent;
    FOnConstrainedResize: TPanelXOnConstrainedResize;
    FOnDblClick: TNotifyEvent;
    FOnResize: TNotifyEvent;
    FIntf: IPanelX;
    function  GetControlInterface: IPanelX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IPanelX read GetControlInterface;
    property DoubleBuffered: WordBool index 21 read GetWordBoolProp write SetWordBoolProp;
  published
    property Alignment: TOleEnum index 1 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property AutoSize: WordBool index 2 read GetWordBoolProp write SetWordBoolProp stored False;
    property BevelInner: TOleEnum index 3 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property BevelOuter: TOleEnum index 4 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property BiDiMode: TOleEnum index 5 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property BorderStyle: TOleEnum index 6 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Caption: WideString index -518 read GetWideStringProp write SetWideStringProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Ctl3D: WordBool index 7 read GetWordBoolProp write SetWordBoolProp stored False;
    property UseDockManager: WordBool index 8 read GetWordBoolProp write SetWordBoolProp stored False;
    property DockSite: WordBool index 9 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 10 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 11 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property FullRepaint: WordBool index 12 read GetWordBoolProp write SetWordBoolProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property Locked: WordBool index 13 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentColor: WordBool index 14 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentCtl3D: WordBool index 15 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 16 read GetWordBoolProp write SetWordBoolProp stored False;
    property Visible: WordBool index 17 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 37 read GetSmallintProp write SetSmallintProp stored False;
    property OnCanResize: TPanelXOnCanResize read FOnCanResize write FOnCanResize;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnConstrainedResize: TPanelXOnConstrainedResize read FOnConstrainedResize write FOnConstrainedResize;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnResize: TNotifyEvent read FOnResize write FOnResize;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TProgressBarX
// Help String      : ProgressBarX Control
// Default Interface: IProgressBarX
// Def. Intf. DISP? : No
// Event   Interface: IProgressBarXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TProgressBarX = class(TOleControl)
  private
    FIntf: IProgressBarX;
    function  GetControlInterface: IProgressBarX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure StepIt;
    procedure StepBy(Delta: Integer);
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IProgressBarX read GetControlInterface;
    property DoubleBuffered: WordBool index 14 read GetWordBoolProp write SetWordBoolProp;
    property BiDiMode: TOleEnum index 31 read GetTOleEnumProp write SetTOleEnumProp;
  published
    property DragCursor: Smallint index 3 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 4 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property Min: Integer index 5 read GetIntegerProp write SetIntegerProp stored False;
    property Max: Integer index 6 read GetIntegerProp write SetIntegerProp stored False;
    property Orientation: TOleEnum index 7 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Position: Integer index 8 read GetIntegerProp write SetIntegerProp stored False;
    property Smooth: WordBool index 9 read GetWordBoolProp write SetWordBoolProp stored False;
    property Step: Integer index 10 read GetIntegerProp write SetIntegerProp stored False;
    property Visible: WordBool index 11 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 32 read GetSmallintProp write SetSmallintProp stored False;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TRadioButtonX
// Help String      : RadioButtonX Control
// Default Interface: IRadioButtonX
// Def. Intf. DISP? : No
// Event   Interface: IRadioButtonXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TRadioButtonXOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;

  TRadioButtonX = class(TOleControl)
  private
    FOnClick: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnKeyPress: TRadioButtonXOnKeyPress;
    FIntf: IRadioButtonX;
    function  GetControlInterface: IRadioButtonX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IRadioButtonX read GetControlInterface;
    property DoubleBuffered: WordBool index 14 read GetWordBoolProp write SetWordBoolProp;
  published
    property Alignment: TOleEnum index 2 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property BiDiMode: TOleEnum index 3 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Caption: WideString index -518 read GetWideStringProp write SetWideStringProp stored False;
    property Checked: WordBool index 4 read GetWordBoolProp write SetWordBoolProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Ctl3D: WordBool index 5 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 6 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 7 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property ParentColor: WordBool index 8 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentCtl3D: WordBool index 9 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 10 read GetWordBoolProp write SetWordBoolProp stored False;
    property Visible: WordBool index 11 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 30 read GetSmallintProp write SetSmallintProp stored False;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnKeyPress: TRadioButtonXOnKeyPress read FOnKeyPress write FOnKeyPress;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TRadioGroupX
// Help String      : RadioGroupX Control
// Default Interface: IRadioGroupX
// Def. Intf. DISP? : No
// Event   Interface: IRadioGroupXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TRadioGroupX = class(TOleControl)
  private
    FOnClick: TNotifyEvent;
    FIntf: IRadioGroupX;
    function  GetControlInterface: IRadioGroupX;
    function Get_Items: IStrings;
    procedure Set_Items(const Value: IStrings);
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IRadioGroupX read GetControlInterface;
    property Items: IStrings read Get_Items write Set_Items;
    property DoubleBuffered: WordBool index 15 read GetWordBoolProp write SetWordBoolProp;
  published
    property BiDiMode: TOleEnum index 1 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Caption: WideString index -518 read GetWideStringProp write SetWideStringProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Columns: Integer index 2 read GetIntegerProp write SetIntegerProp stored False;
    property Ctl3D: WordBool index 3 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 4 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 5 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property ItemIndex: Integer index 6 read GetIntegerProp write SetIntegerProp stored False;
    property ParentColor: WordBool index 8 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentCtl3D: WordBool index 9 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 10 read GetWordBoolProp write SetWordBoolProp stored False;
    property Visible: WordBool index 11 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 31 read GetSmallintProp write SetSmallintProp stored False;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TRichEditX
// Help String      : RichEditX Control
// Default Interface: IRichEditX
// Def. Intf. DISP? : No
// Event   Interface: IRichEditXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TRichEditXOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;
  TRichEditXOnProtectChange = procedure(Sender: TObject; StartPos: Integer; EndPos: Integer; 
                                                         var AllowChange: WordBool) of object;
  TRichEditXOnSaveClipboard = procedure(Sender: TObject; NumObjects: Integer; NumChars: Integer; 
                                                         var SaveClipboard: WordBool) of object;

  TRichEditX = class(TOleControl)
  private
    FOnChange: TNotifyEvent;
    FOnKeyPress: TRichEditXOnKeyPress;
    FOnProtectChange: TRichEditXOnProtectChange;
    FOnSaveClipboard: TRichEditXOnSaveClipboard;
    FOnSelectionChange: TNotifyEvent;
    FIntf: IRichEditX;
    function  GetControlInterface: IRichEditX;
    function Get_Lines: IStrings;
    procedure Set_Lines(const Value: IStrings);
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure Clear;
    procedure Print(const Caption: WideString);
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure ClearSelection;
    procedure CopyToClipboard;
    procedure CutToClipboard;
    procedure PasteFromClipboard;
    procedure Undo;
    procedure ClearUndo;
    procedure SelectAll;
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IRichEditX read GetControlInterface;
    property Lines: IStrings read Get_Lines write Set_Lines;
    property CanUndo: WordBool index 38 read GetWordBoolProp;
    property Modified: WordBool index 39 read GetWordBoolProp write SetWordBoolProp;
    property SelLength: Integer index 40 read GetIntegerProp write SetIntegerProp;
    property SelStart: Integer index 41 read GetIntegerProp write SetIntegerProp;
    property SelText: WideString index 42 read GetWideStringProp write SetWideStringProp;
    property Text: WideString index -517 read GetWideStringProp write SetWideStringProp;
    property DoubleBuffered: WordBool index 44 read GetWordBoolProp write SetWordBoolProp;
  published
    property Alignment: TOleEnum index 1 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property BiDiMode: TOleEnum index 2 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property BorderStyle: TOleEnum index 3 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Ctl3D: WordBool index 4 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 5 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 6 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property HideSelection: WordBool index 7 read GetWordBoolProp write SetWordBoolProp stored False;
    property HideScrollBars: WordBool index 8 read GetWordBoolProp write SetWordBoolProp stored False;
    property ImeMode: TOleEnum index 9 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property ImeName: WideString index 10 read GetWideStringProp write SetWideStringProp stored False;
    property MaxLength: Integer index 12 read GetIntegerProp write SetIntegerProp stored False;
    property ParentColor: WordBool index 13 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentCtl3D: WordBool index 14 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 15 read GetWordBoolProp write SetWordBoolProp stored False;
    property PlainText: WordBool index 16 read GetWordBoolProp write SetWordBoolProp stored False;
    property ReadOnly: WordBool index 17 read GetWordBoolProp write SetWordBoolProp stored False;
    property ScrollBars: TOleEnum index 18 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Visible: WordBool index 19 read GetWordBoolProp write SetWordBoolProp stored False;
    property WantTabs: WordBool index 20 read GetWordBoolProp write SetWordBoolProp stored False;
    property WantReturns: WordBool index 21 read GetWordBoolProp write SetWordBoolProp stored False;
    property WordWrap: WordBool index 22 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 60 read GetSmallintProp write SetSmallintProp stored False;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnKeyPress: TRichEditXOnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnProtectChange: TRichEditXOnProtectChange read FOnProtectChange write FOnProtectChange;
    property OnSaveClipboard: TRichEditXOnSaveClipboard read FOnSaveClipboard write FOnSaveClipboard;
    property OnSelectionChange: TNotifyEvent read FOnSelectionChange write FOnSelectionChange;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TScrollBarX
// Help String      : ScrollBarX Control
// Default Interface: IScrollBarX
// Def. Intf. DISP? : No
// Event   Interface: IScrollBarXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TScrollBarXOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;
  TScrollBarXOnScroll = procedure(Sender: TObject; ScrollCode: TxScrollCode; var ScrollPos: Integer) of object;

  TScrollBarX = class(TOleControl)
  private
    FOnChange: TNotifyEvent;
    FOnKeyPress: TScrollBarXOnKeyPress;
    FOnScroll: TScrollBarXOnScroll;
    FIntf: IScrollBarX;
    function  GetControlInterface: IScrollBarX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure SetParams(APosition: Integer; AMin: Integer; AMax: Integer);
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IScrollBarX read GetControlInterface;
    property DoubleBuffered: WordBool index 17 read GetWordBoolProp write SetWordBoolProp;
  published
    property BiDiMode: TOleEnum index 2 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Ctl3D: WordBool index 3 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 4 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 5 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property Kind: TOleEnum index 6 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property LargeChange: Smallint index 7 read GetSmallintProp write SetSmallintProp stored False;
    property Max: Integer index 8 read GetIntegerProp write SetIntegerProp stored False;
    property Min: Integer index 9 read GetIntegerProp write SetIntegerProp stored False;
    property PageSize: Integer index 10 read GetIntegerProp write SetIntegerProp stored False;
    property ParentCtl3D: WordBool index 11 read GetWordBoolProp write SetWordBoolProp stored False;
    property Position: Integer index 12 read GetIntegerProp write SetIntegerProp stored False;
    property SmallChange: Smallint index 13 read GetSmallintProp write SetSmallintProp stored False;
    property Visible: WordBool index 14 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 34 read GetSmallintProp write SetSmallintProp stored False;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnKeyPress: TScrollBarXOnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnScroll: TScrollBarXOnScroll read FOnScroll write FOnScroll;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TScrollBoxX
// Help String      : ScrollBoxX Control
// Default Interface: IScrollBoxX
// Def. Intf. DISP? : No
// Event   Interface: IScrollBoxXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TScrollBoxXOnCanResize = procedure(Sender: TObject; var NewWidth: Integer; 
                                                      var NewHeight: Integer; var Resize: WordBool) of object;
  TScrollBoxXOnConstrainedResize = procedure(Sender: TObject; var MinWidth: Integer; 
                                                              var MinHeight: Integer; 
                                                              var MaxWidth: Integer; 
                                                              var MaxHeight: Integer) of object;

  TScrollBoxX = class(TOleControl)
  private
    FOnCanResize: TScrollBoxXOnCanResize;
    FOnClick: TNotifyEvent;
    FOnConstrainedResize: TScrollBoxXOnConstrainedResize;
    FOnDblClick: TNotifyEvent;
    FOnResize: TNotifyEvent;
    FIntf: IScrollBoxX;
    function  GetControlInterface: IScrollBoxX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure DisableAutoRange;
    procedure EnableAutoRange;
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IScrollBoxX read GetControlInterface;
    property DoubleBuffered: WordBool index 18 read GetWordBoolProp write SetWordBoolProp;
  published
    property AutoScroll: WordBool index 1 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoSize: WordBool index 2 read GetWordBoolProp write SetWordBoolProp stored False;
    property BiDiMode: TOleEnum index 3 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property BorderStyle: TOleEnum index 4 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property DockSite: WordBool index 5 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 6 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 7 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Ctl3D: WordBool index 8 read GetWordBoolProp write SetWordBoolProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property ParentColor: WordBool index 9 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentCtl3D: WordBool index 10 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 11 read GetWordBoolProp write SetWordBoolProp stored False;
    property Visible: WordBool index 12 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 35 read GetSmallintProp write SetSmallintProp stored False;
    property OnCanResize: TScrollBoxXOnCanResize read FOnCanResize write FOnCanResize;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnConstrainedResize: TScrollBoxXOnConstrainedResize read FOnConstrainedResize write FOnConstrainedResize;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnResize: TNotifyEvent read FOnResize write FOnResize;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TSpinButtonX
// Help String      : SpinButtonX Control
// Default Interface: ISpinButtonX
// Def. Intf. DISP? : No
// Event   Interface: ISpinButtonXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TSpinButtonX = class(TOleControl)
  private
    FOnDownClick: TNotifyEvent;
    FOnUpClick: TNotifyEvent;
    FIntf: ISpinButtonX;
    function  GetControlInterface: ISpinButtonX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: ISpinButtonX read GetControlInterface;
    property DoubleBuffered: WordBool index 10 read GetWordBoolProp write SetWordBoolProp;
    property BiDiMode: TOleEnum index 27 read GetTOleEnumProp write SetTOleEnumProp;
  published
    property Ctl3D: WordBool index 1 read GetWordBoolProp write SetWordBoolProp stored False;
    property DownNumGlyphs: Smallint index 2 read GetSmallintProp write SetSmallintProp stored False;
    property DragCursor: Smallint index 3 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 4 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentCtl3D: WordBool index 5 read GetWordBoolProp write SetWordBoolProp stored False;
    property UpNumGlyphs: Smallint index 6 read GetSmallintProp write SetSmallintProp stored False;
    property Visible: WordBool index 7 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 28 read GetSmallintProp write SetSmallintProp stored False;
    property OnDownClick: TNotifyEvent read FOnDownClick write FOnDownClick;
    property OnUpClick: TNotifyEvent read FOnUpClick write FOnUpClick;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TSpinEditX
// Help String      : SpinEditX Control
// Default Interface: ISpinEditX
// Def. Intf. DISP? : No
// Event   Interface: ISpinEditXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TSpinEditXOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;

  TSpinEditX = class(TOleControl)
  private
    FOnChange: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnKeyPress: TSpinEditXOnKeyPress;
    FIntf: ISpinEditX;
    function  GetControlInterface: ISpinEditX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure Clear;
    procedure ClearSelection;
    procedure CopyToClipboard;
    procedure CutToClipboard;
    procedure PasteFromClipboard;
    procedure Undo;
    procedure ClearUndo;
    procedure SelectAll;
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: ISpinEditX read GetControlInterface;
    property CanUndo: WordBool index 28 read GetWordBoolProp;
    property Modified: WordBool index 29 read GetWordBoolProp write SetWordBoolProp;
    property SelLength: Integer index 30 read GetIntegerProp write SetIntegerProp;
    property SelStart: Integer index 31 read GetIntegerProp write SetIntegerProp;
    property SelText: WideString index 32 read GetWideStringProp write SetWideStringProp;
    property Text: WideString index -517 read GetWideStringProp write SetWideStringProp;
    property DoubleBuffered: WordBool index 34 read GetWordBoolProp write SetWordBoolProp;
    property BiDiMode: TOleEnum index 51 read GetTOleEnumProp write SetTOleEnumProp;
  published
    property AutoSelect: WordBool index 1 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoSize: WordBool index 2 read GetWordBoolProp write SetWordBoolProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Ctl3D: WordBool index 3 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 4 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 5 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property EditorEnabled: WordBool index 6 read GetWordBoolProp write SetWordBoolProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property Increment: Integer index 7 read GetIntegerProp write SetIntegerProp stored False;
    property MaxLength: Integer index 8 read GetIntegerProp write SetIntegerProp stored False;
    property MaxValue: Integer index 9 read GetIntegerProp write SetIntegerProp stored False;
    property MinValue: Integer index 10 read GetIntegerProp write SetIntegerProp stored False;
    property ParentColor: WordBool index 11 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentCtl3D: WordBool index 12 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 13 read GetWordBoolProp write SetWordBoolProp stored False;
    property ReadOnly: WordBool index 14 read GetWordBoolProp write SetWordBoolProp stored False;
    property Value: Integer index 15 read GetIntegerProp write SetIntegerProp stored False;
    property Visible: WordBool index 16 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 52 read GetSmallintProp write SetSmallintProp stored False;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnKeyPress: TSpinEditXOnKeyPress read FOnKeyPress write FOnKeyPress;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TStaticTextX
// Help String      : StaticTextX Control
// Default Interface: IStaticTextX
// Def. Intf. DISP? : No
// Event   Interface: IStaticTextXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TStaticTextX = class(TOleControl)
  private
    FOnClick: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FIntf: IStaticTextX;
    function  GetControlInterface: IStaticTextX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IStaticTextX read GetControlInterface;
    property DoubleBuffered: WordBool index 13 read GetWordBoolProp write SetWordBoolProp;
  published
    property Alignment: TOleEnum index 1 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property AutoSize: WordBool index 2 read GetWordBoolProp write SetWordBoolProp stored False;
    property BiDiMode: TOleEnum index 3 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property BorderStyle: TOleEnum index 4 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Caption: WideString index -518 read GetWideStringProp write SetWideStringProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property DragCursor: Smallint index 5 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 6 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property ParentColor: WordBool index 7 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 8 read GetWordBoolProp write SetWordBoolProp stored False;
    property ShowAccelChar: WordBool index 9 read GetWordBoolProp write SetWordBoolProp stored False;
    property Visible: WordBool index 10 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 30 read GetSmallintProp write SetSmallintProp stored False;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TStringGridX
// Help String      : StringGridX Control
// Default Interface: IStringGridX
// Def. Intf. DISP? : No
// Event   Interface: IStringGridXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TStringGridXOnColumnMoved = procedure(Sender: TObject; FromIndex: Integer; ToIndex: Integer) of object;
  TStringGridXOnGetEditMask = procedure(Sender: TObject; ACol: Integer; ARow: Integer; 
                                                         var Value: WideString) of object;
  TStringGridXOnGetEditText = procedure(Sender: TObject; ACol: Integer; ARow: Integer; 
                                                         var Value: WideString) of object;
  TStringGridXOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;
  TStringGridXOnRowMoved = procedure(Sender: TObject; FromIndex: Integer; ToIndex: Integer) of object;
  TStringGridXOnSelectCell = procedure(Sender: TObject; ACol: Integer; ARow: Integer; 
                                                        var CanSelect: WordBool) of object;
  TStringGridXOnSetEditText = procedure(Sender: TObject; ACol: Integer; ARow: Integer; 
                                                         const Value: WideString) of object;

  TStringGridX = class(TOleControl)
  private
    FOnClick: TNotifyEvent;
    FOnColumnMoved: TStringGridXOnColumnMoved;
    FOnDblClick: TNotifyEvent;
    FOnGetEditMask: TStringGridXOnGetEditMask;
    FOnGetEditText: TStringGridXOnGetEditText;
    FOnKeyPress: TStringGridXOnKeyPress;
    FOnRowMoved: TStringGridXOnRowMoved;
    FOnSelectCell: TStringGridXOnSelectCell;
    FOnSetEditText: TStringGridXOnSetEditText;
    FOnTopLeftChanged: TNotifyEvent;
    FIntf: IStringGridX;
    function  GetControlInterface: IStringGridX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure MouseToCell(X: Integer; Y: Integer; var ACol: Integer; var ARow: Integer);
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IStringGridX read GetControlInterface;
    property Col: Integer index 2 read GetIntegerProp write SetIntegerProp;
    property EditorMode: WordBool index 3 read GetWordBoolProp write SetWordBoolProp;
    property GridHeight: Integer index 4 read GetIntegerProp;
    property GridWidth: Integer index 5 read GetIntegerProp;
    property LeftCol: Integer index 6 read GetIntegerProp write SetIntegerProp;
    property Row: Integer index 7 read GetIntegerProp write SetIntegerProp;
    property TopRow: Integer index 8 read GetIntegerProp write SetIntegerProp;
    property VisibleColCount: Integer index 28 read GetIntegerProp;
    property VisibleRowCount: Integer index 29 read GetIntegerProp;
    property DoubleBuffered: WordBool index 32 read GetWordBoolProp write SetWordBoolProp;
  published
    property BiDiMode: TOleEnum index 9 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property BorderStyle: TOleEnum index 10 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property ColCount: Integer index 11 read GetIntegerProp write SetIntegerProp stored False;
    property Ctl3D: WordBool index 12 read GetWordBoolProp write SetWordBoolProp stored False;
    property DefaultColWidth: Integer index 13 read GetIntegerProp write SetIntegerProp stored False;
    property DefaultRowHeight: Integer index 14 read GetIntegerProp write SetIntegerProp stored False;
    property DefaultDrawing: WordBool index 15 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 16 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 17 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property FixedColor: TColor index 18 read GetTColorProp write SetTColorProp stored False;
    property FixedCols: Integer index 19 read GetIntegerProp write SetIntegerProp stored False;
    property RowCount: Integer index 20 read GetIntegerProp write SetIntegerProp stored False;
    property FixedRows: Integer index 21 read GetIntegerProp write SetIntegerProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property GridLineWidth: Integer index 22 read GetIntegerProp write SetIntegerProp stored False;
    property ParentColor: WordBool index 23 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentCtl3D: WordBool index 24 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 25 read GetWordBoolProp write SetWordBoolProp stored False;
    property ScrollBars: TOleEnum index 26 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Visible: WordBool index 27 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 49 read GetSmallintProp write SetSmallintProp stored False;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnColumnMoved: TStringGridXOnColumnMoved read FOnColumnMoved write FOnColumnMoved;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnGetEditMask: TStringGridXOnGetEditMask read FOnGetEditMask write FOnGetEditMask;
    property OnGetEditText: TStringGridXOnGetEditText read FOnGetEditText write FOnGetEditText;
    property OnKeyPress: TStringGridXOnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnRowMoved: TStringGridXOnRowMoved read FOnRowMoved write FOnRowMoved;
    property OnSelectCell: TStringGridXOnSelectCell read FOnSelectCell write FOnSelectCell;
    property OnSetEditText: TStringGridXOnSetEditText read FOnSetEditText write FOnSetEditText;
    property OnTopLeftChanged: TNotifyEvent read FOnTopLeftChanged write FOnTopLeftChanged;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TTabbedNotebookX
// Help String      : TabbedNotebookX Control
// Default Interface: ITabbedNotebookX
// Def. Intf. DISP? : No
// Event   Interface: ITabbedNotebookXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TTabbedNotebookXOnChange = procedure(Sender: TObject; NewTab: Integer; var AllowChange: WordBool) of object;

  TTabbedNotebookX = class(TOleControl)
  private
    FOnClick: TNotifyEvent;
    FOnChange: TTabbedNotebookXOnChange;
    FIntf: ITabbedNotebookX;
    function  GetControlInterface: ITabbedNotebookX;
    function Get_Pages: IStrings;
    procedure Set_Pages(const Value: IStrings);
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function GetIndexForPage(const PageName: WideString; out Value: Integer): Integer;
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: ITabbedNotebookX read GetControlInterface;
    property TopFont: TFont index 2 read GetTFontProp;
    property Pages: IStrings read Get_Pages write Set_Pages;
    property DoubleBuffered: WordBool index 12 read GetWordBoolProp write SetWordBoolProp;
    property BiDiMode: TOleEnum index 29 read GetTOleEnumProp write SetTOleEnumProp;
  published
    property ActivePage: WideString index 4 read GetWideStringProp write SetWideStringProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property PageIndex: Integer index 5 read GetIntegerProp write SetIntegerProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property TabsPerRow: Integer index 7 read GetIntegerProp write SetIntegerProp stored False;
    property TabFont: TFont index 8 read GetTFontProp write SetTFontProp stored False;
    property Visible: WordBool index 9 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 30 read GetSmallintProp write SetSmallintProp stored False;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnChange: TTabbedNotebookXOnChange read FOnChange write FOnChange;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TTabControlX
// Help String      : TabControlX Control
// Default Interface: ITabControlX
// Def. Intf. DISP? : No
// Event   Interface: ITabControlXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TTabControlXOnChanging = procedure(Sender: TObject; var AllowChange: WordBool) of object;
  TTabControlXOnGetImageIndex = procedure(Sender: TObject; TabIndex: Integer; 
                                                           var ImageIndex: Integer) of object;

  TTabControlX = class(TOleControl)
  private
    FOnChange: TNotifyEvent;
    FOnChanging: TTabControlXOnChanging;
    FOnGetImageIndex: TTabControlXOnGetImageIndex;
    FOnResize: TNotifyEvent;
    FIntf: ITabControlX;
    function  GetControlInterface: ITabControlX;
    function Get_Tabs: IStrings;
    procedure Set_Tabs(const Value: IStrings);
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: ITabControlX read GetControlInterface;
    property Tabs: IStrings read Get_Tabs write Set_Tabs;
    property DoubleBuffered: WordBool index 21 read GetWordBoolProp write SetWordBoolProp;
  published
    property BiDiMode: TOleEnum index 1 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property DockSite: WordBool index 2 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 3 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 4 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property HotTrack: WordBool index 5 read GetWordBoolProp write SetWordBoolProp stored False;
    property MultiLine: WordBool index 6 read GetWordBoolProp write SetWordBoolProp stored False;
    property MultiSelect: WordBool index 7 read GetWordBoolProp write SetWordBoolProp stored False;
    property OwnerDraw: WordBool index 8 read GetWordBoolProp write SetWordBoolProp stored False;
    property ParentFont: WordBool index 9 read GetWordBoolProp write SetWordBoolProp stored False;
    property RaggedRight: WordBool index 10 read GetWordBoolProp write SetWordBoolProp stored False;
    property ScrollOpposite: WordBool index 11 read GetWordBoolProp write SetWordBoolProp stored False;
    property Style: TOleEnum index 12 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property TabHeight: Smallint index 13 read GetSmallintProp write SetSmallintProp stored False;
    property TabPosition: TOleEnum index 14 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property TabIndex: Integer index 16 read GetIntegerProp write SetIntegerProp stored False;
    property TabWidth: Smallint index 17 read GetSmallintProp write SetSmallintProp stored False;
    property Visible: WordBool index 18 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 38 read GetSmallintProp write SetSmallintProp stored False;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnChanging: TTabControlXOnChanging read FOnChanging write FOnChanging;
    property OnGetImageIndex: TTabControlXOnGetImageIndex read FOnGetImageIndex write FOnGetImageIndex;
    property OnResize: TNotifyEvent read FOnResize write FOnResize;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TTabSetX
// Help String      : TabSetX Control
// Default Interface: ITabSetX
// Def. Intf. DISP? : No
// Event   Interface: ITabSetXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TTabSetXOnChange = procedure(Sender: TObject; NewTab: Integer; var AllowChange: WordBool) of object;
  TTabSetXOnMeasureTab = procedure(Sender: TObject; Index: Integer; var TabWidth: Integer) of object;

  TTabSetX = class(TOleControl)
  private
    FOnClick: TNotifyEvent;
    FOnChange: TTabSetXOnChange;
    FOnMeasureTab: TTabSetXOnMeasureTab;
    FIntf: ITabSetX;
    function  GetControlInterface: ITabSetX;
    function Get_Tabs: IStrings;
    procedure Set_Tabs(const Value: IStrings);
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure SelectNext(Direction: WordBool);
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: ITabSetX read GetControlInterface;
    property FirstIndex: Integer index 3 read GetIntegerProp write SetIntegerProp;
    property Tabs: IStrings read Get_Tabs write Set_Tabs;
    property VisibleTabs: Integer index 18 read GetIntegerProp;
    property DoubleBuffered: WordBool index 21 read GetWordBoolProp write SetWordBoolProp;
    property BiDiMode: TOleEnum index 38 read GetTOleEnumProp write SetTOleEnumProp;
  published
    property AutoScroll: WordBool index 4 read GetWordBoolProp write SetWordBoolProp stored False;
    property BackgroundColor: TColor index 5 read GetTColorProp write SetTColorProp stored False;
    property DitherBackground: WordBool index 6 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 7 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 8 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property EndMargin: Integer index 9 read GetIntegerProp write SetIntegerProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property StartMargin: Integer index 10 read GetIntegerProp write SetIntegerProp stored False;
    property SelectedColor: TColor index 11 read GetTColorProp write SetTColorProp stored False;
    property Style: TOleEnum index 12 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property TabHeight: Integer index 13 read GetIntegerProp write SetIntegerProp stored False;
    property TabIndex: Integer index 15 read GetIntegerProp write SetIntegerProp stored False;
    property UnselectedColor: TColor index 16 read GetTColorProp write SetTColorProp stored False;
    property Visible: WordBool index 17 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 39 read GetSmallintProp write SetSmallintProp stored False;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnChange: TTabSetXOnChange read FOnChange write FOnChange;
    property OnMeasureTab: TTabSetXOnMeasureTab read FOnMeasureTab write FOnMeasureTab;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TTrackBarX
// Help String      : TrackBarX Control
// Default Interface: ITrackBarX
// Def. Intf. DISP? : No
// Event   Interface: ITrackBarXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TTrackBarXOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;

  TTrackBarX = class(TOleControl)
  private
    FOnChange: TNotifyEvent;
    FOnKeyPress: TTrackBarXOnKeyPress;
    FIntf: ITrackBarX;
    function  GetControlInterface: ITrackBarX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure SetTick(Value: Integer);
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: ITrackBarX read GetControlInterface;
    property DoubleBuffered: WordBool index 22 read GetWordBoolProp write SetWordBoolProp;
    property BiDiMode: TOleEnum index 39 read GetTOleEnumProp write SetTOleEnumProp;
  published
    property Ctl3D: WordBool index 2 read GetWordBoolProp write SetWordBoolProp stored False;
    property DragCursor: Smallint index 3 read GetSmallintProp write SetSmallintProp stored False;
    property DragMode: TOleEnum index 4 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property LineSize: Integer index 5 read GetIntegerProp write SetIntegerProp stored False;
    property Max: Integer index 6 read GetIntegerProp write SetIntegerProp stored False;
    property Min: Integer index 7 read GetIntegerProp write SetIntegerProp stored False;
    property Orientation: TOleEnum index 8 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property ParentCtl3D: WordBool index 9 read GetWordBoolProp write SetWordBoolProp stored False;
    property PageSize: Integer index 10 read GetIntegerProp write SetIntegerProp stored False;
    property Frequency: Integer index 11 read GetIntegerProp write SetIntegerProp stored False;
    property Position: Integer index 12 read GetIntegerProp write SetIntegerProp stored False;
    property SliderVisible: WordBool index 13 read GetWordBoolProp write SetWordBoolProp stored False;
    property SelEnd: Integer index 14 read GetIntegerProp write SetIntegerProp stored False;
    property SelStart: Integer index 15 read GetIntegerProp write SetIntegerProp stored False;
    property ThumbLength: Integer index 16 read GetIntegerProp write SetIntegerProp stored False;
    property TickMarks: TOleEnum index 17 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property TickStyle: TOleEnum index 18 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Visible: WordBool index 19 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 40 read GetSmallintProp write SetSmallintProp stored False;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnKeyPress: TTrackBarXOnKeyPress read FOnKeyPress write FOnKeyPress;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TUpDownX
// Help String      : UpDownX Control
// Default Interface: IUpDownX
// Def. Intf. DISP? : No
// Event   Interface: IUpDownXEvents
// TypeFlags        : (38) CanCreate Licensed Control
// *********************************************************************//
  TUpDownXOnChanging = procedure(Sender: TObject; var AllowChange: WordBool) of object;
  TUpDownXOnClick = procedure(Sender: TObject; Button: TxUDBtnType) of object;

  TUpDownX = class(TOleControl)
  private
    FOnChanging: TUpDownXOnChanging;
    FOnClick: TUpDownXOnClick;
    FIntf: IUpDownX;
    function  GetControlInterface: IUpDownX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure FlipChildren(AllLevels: WordBool);
    function DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
    function DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
    function GetControlsAlignment(out Value: TxAlignment): TxAlignment;
    procedure InitiateAction;
    function IsRightToLeft(out Value: WordBool): WordBool;
    function UseRightToLeftAlignment(out Value: WordBool): WordBool;
    function UseRightToLeftReading(out Value: WordBool): WordBool;
    function UseRightToLeftScrollBar(out Value: WordBool): WordBool;
    function ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
    procedure AboutBox;
    property  ControlInterface: IUpDownX read GetControlInterface;
    property DoubleBuffered: WordBool index 13 read GetWordBoolProp write SetWordBoolProp;
    property BiDiMode: TOleEnum index 30 read GetTOleEnumProp write SetTOleEnumProp;
  published
    property AlignButton: TOleEnum index 1 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property ArrowKeys: WordBool index 2 read GetWordBoolProp write SetWordBoolProp stored False;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp stored False;
    property Min: Smallint index 3 read GetSmallintProp write SetSmallintProp stored False;
    property Max: Smallint index 4 read GetSmallintProp write SetSmallintProp stored False;
    property Increment: Integer index 5 read GetIntegerProp write SetIntegerProp stored False;
    property Orientation: TOleEnum index 6 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Position: Smallint index 7 read GetSmallintProp write SetSmallintProp stored False;
    property Thousands: WordBool index 8 read GetWordBoolProp write SetWordBoolProp stored False;
    property Visible: WordBool index 9 read GetWordBoolProp write SetWordBoolProp stored False;
    property Wrap: WordBool index 10 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 31 read GetSmallintProp write SetSmallintProp stored False;
    property OnChanging: TUpDownXOnChanging read FOnChanging write FOnChanging;
    property OnClick: TUpDownXOnClick read FOnClick write FOnClick;
  end;

procedure Register;

implementation

uses ComObj;

procedure TAnimateX.InitControlData;
const
  CEventDispIDs: array [0..3] of DWORD = (
    $00000001, $00000002, $00000003, $00000004);
  CControlData: TControlData = (
    ClassID: '{695CDACE-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDACC-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 4;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $00000009;
    Version: 300);
begin
  ControlData := @CControlData;
end;

procedure TAnimateX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IAnimateX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TAnimateX.GetControlInterface: IAnimateX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TAnimateX.Play(FromFrame: Smallint; ToFrame: Smallint; Count: Integer);
begin
  ControlInterface.Play(FromFrame, ToFrame, Count);
end;

procedure TAnimateX.Reset;
begin
  ControlInterface.Reset;
end;

procedure TAnimateX.Seek(Frame: Smallint);
begin
  ControlInterface.Seek(Frame);
end;

procedure TAnimateX.Stop;
begin
  ControlInterface.Stop;
end;

procedure TAnimateX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TAnimateX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TAnimateX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TAnimateX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TAnimateX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TAnimateX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TAnimateX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TAnimateX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TAnimateX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TAnimateX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TAnimateX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TButtonX.InitControlData;
const
  CEventDispIDs: array [0..1] of DWORD = (
    $00000001, $00000007);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDAD8-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDAD6-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 2;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000001C;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TButtonX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IButtonX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TButtonX.GetControlInterface: IButtonX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TButtonX.Click;
begin
  ControlInterface.Click;
end;

function TButtonX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

procedure TButtonX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TButtonX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TButtonX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TButtonX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TButtonX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TButtonX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TButtonX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TButtonX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TButtonX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TButtonX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TCalendarX.InitControlData;
const
  CEventDispIDs: array [0..3] of DWORD = (
    $00000001, $00000002, $00000003, $00000009);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDAE1-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDADF-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 4;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000000D;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TCalendarX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as ICalendarX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TCalendarX.GetControlInterface: ICalendarX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TCalendarX.NextMonth;
begin
  ControlInterface.NextMonth;
end;

procedure TCalendarX.NextYear;
begin
  ControlInterface.NextYear;
end;

procedure TCalendarX.PrevMonth;
begin
  ControlInterface.PrevMonth;
end;

procedure TCalendarX.PrevYear;
begin
  ControlInterface.PrevYear;
end;

procedure TCalendarX.UpdateCalendar;
begin
  ControlInterface.UpdateCalendar;
end;

procedure TCalendarX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TCalendarX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TCalendarX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TCalendarX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TCalendarX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TCalendarX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TCalendarX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TCalendarX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TCalendarX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TCalendarX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TCalendarX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TCheckBoxX.InitControlData;
const
  CEventDispIDs: array [0..1] of DWORD = (
    $00000001, $00000007);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDAE9-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDAE7-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 2;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000001D;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TCheckBoxX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as ICheckBoxX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TCheckBoxX.GetControlInterface: ICheckBoxX;
begin
  CreateControl;
  Result := FIntf;
end;

function TCheckBoxX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TCheckBoxX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TCheckBoxX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TCheckBoxX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

procedure TCheckBoxX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TCheckBoxX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TCheckBoxX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TCheckBoxX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TCheckBoxX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TCheckBoxX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TCheckBoxX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TCheckListBoxX.InitControlData;
const
  CEventDispIDs: array [0..4] of DWORD = (
    $00000001, $00000002, $00000003, $0000000A, $0000000C);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDAF2-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDAF0-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 5;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000000D;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TCheckListBoxX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as ICheckListBoxX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TCheckListBoxX.GetControlInterface: ICheckListBoxX;
begin
  CreateControl;
  Result := FIntf;
end;

function TCheckListBoxX.Get_Items: IStrings;
begin
  Result := ControlInterface.Get_Items;
end;

procedure TCheckListBoxX.Set_Items(const Value: IStrings);
begin
  ControlInterface.Set_Items(Value);
end;

procedure TCheckListBoxX.Clear;
begin
  ControlInterface.Clear;
end;

procedure TCheckListBoxX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TCheckListBoxX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TCheckListBoxX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TCheckListBoxX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TCheckListBoxX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TCheckListBoxX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TCheckListBoxX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TCheckListBoxX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TCheckListBoxX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TCheckListBoxX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TCheckListBoxX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TColorGridX.InitControlData;
const
  CEventDispIDs: array [0..2] of DWORD = (
    $00000001, $00000002, $00000007);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDAFB-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDAF9-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 3;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000000C;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TColorGridX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IColorGridX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TColorGridX.GetControlInterface: IColorGridX;
begin
  CreateControl;
  Result := FIntf;
end;

function TColorGridX.ColorToIndex(AColor: OLE_COLOR; out Value: Integer): Integer;
begin
  Result := ControlInterface.ColorToIndex(AColor);
end;

procedure TColorGridX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TColorGridX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TColorGridX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TColorGridX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TColorGridX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TColorGridX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TColorGridX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TColorGridX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TColorGridX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TColorGridX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TColorGridX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TComboBoxX.InitControlData;
const
  CEventDispIDs: array [0..5] of DWORD = (
    $00000001, $00000002, $00000003, $00000007, $0000000B, $0000000D);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDB03-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDB01-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 6;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000002D;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TComboBoxX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IComboBoxX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TComboBoxX.GetControlInterface: IComboBoxX;
begin
  CreateControl;
  Result := FIntf;
end;

function TComboBoxX.Get_Items: IStrings;
begin
  Result := ControlInterface.Get_Items;
end;

procedure TComboBoxX.Set_Items(const Value: IStrings);
begin
  ControlInterface.Set_Items(Value);
end;

procedure TComboBoxX.Clear;
begin
  ControlInterface.Clear;
end;

procedure TComboBoxX.SelectAll;
begin
  ControlInterface.SelectAll;
end;

procedure TComboBoxX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TComboBoxX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TComboBoxX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TComboBoxX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TComboBoxX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TComboBoxX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TComboBoxX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TComboBoxX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TComboBoxX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TComboBoxX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TComboBoxX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TControlBarX.InitControlData;
const
  CEventDispIDs: array [0..5] of DWORD = (
    $00000005, $00000006, $00000007, $0000000A, $00000013, $00000014);
  CTPictureIDs: array [0..0] of DWORD = (
    $FFFFFDF5);
  CControlData: TControlData = (
    ClassID: '{695CDB0C-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDB0A-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 6;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $00000009;
    Version: 300;
    FontCount: 0;
    FontIDs: nil;
    PictureCount: 1;
    PictureIDs: @CTPictureIDs);
begin
  ControlData := @CControlData;
end;

procedure TControlBarX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IControlBarX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TControlBarX.GetControlInterface: IControlBarX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TControlBarX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

procedure TControlBarX.StickControls;
begin
  ControlInterface.StickControls;
end;

function TControlBarX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TControlBarX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TControlBarX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TControlBarX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TControlBarX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TControlBarX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TControlBarX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TControlBarX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TControlBarX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TControlBarX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TDateTimePickerX.InitControlData;
const
  CEventDispIDs: array [0..6] of DWORD = (
    $00000001, $00000002, $00000003, $00000004, $00000005, $0000000B,
    $0000000F);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDB15-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDB13-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 7;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000000D;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TDateTimePickerX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IDateTimePickerX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TDateTimePickerX.GetControlInterface: IDateTimePickerX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TDateTimePickerX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TDateTimePickerX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TDateTimePickerX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TDateTimePickerX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TDateTimePickerX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TDateTimePickerX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TDateTimePickerX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TDateTimePickerX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TDateTimePickerX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TDateTimePickerX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TDateTimePickerX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TDrawGridX.InitControlData;
const
  CEventDispIDs: array [0..9] of DWORD = (
    $00000001, $00000002, $00000003, $00000009, $0000000A, $0000000C,
    $00000013, $00000014, $00000015, $00000018);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDB20-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDB1E-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 10;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000000D;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TDrawGridX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IDrawGridX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TDrawGridX.GetControlInterface: IDrawGridX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TDrawGridX.MouseToCell(X: Integer; Y: Integer; var ACol: Integer; var ARow: Integer);
begin
  ControlInterface.MouseToCell(X, Y, ACol, ARow);
end;

procedure TDrawGridX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TDrawGridX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TDrawGridX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TDrawGridX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TDrawGridX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TDrawGridX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TDrawGridX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TDrawGridX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TDrawGridX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TDrawGridX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TDrawGridX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TEditX.InitControlData;
const
  CEventDispIDs: array [0..3] of DWORD = (
    $00000001, $00000002, $00000003, $00000009);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDB28-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDB26-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 4;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000002D;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TEditX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IEditX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TEditX.GetControlInterface: IEditX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TEditX.Clear;
begin
  ControlInterface.Clear;
end;

procedure TEditX.ClearSelection;
begin
  ControlInterface.ClearSelection;
end;

procedure TEditX.CopyToClipboard;
begin
  ControlInterface.CopyToClipboard;
end;

procedure TEditX.CutToClipboard;
begin
  ControlInterface.CutToClipboard;
end;

procedure TEditX.PasteFromClipboard;
begin
  ControlInterface.PasteFromClipboard;
end;

procedure TEditX.Undo;
begin
  ControlInterface.Undo;
end;

procedure TEditX.ClearUndo;
begin
  ControlInterface.ClearUndo;
end;

procedure TEditX.SelectAll;
begin
  ControlInterface.SelectAll;
end;

procedure TEditX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TEditX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TEditX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TEditX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TEditX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TEditX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TEditX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TEditX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TEditX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TEditX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TEditX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TGroupBoxX.InitControlData;
const
  CEventDispIDs: array [0..1] of DWORD = (
    $00000001, $00000002);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDB2F-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDB2D-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 2;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000001D;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TGroupBoxX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IGroupBoxX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TGroupBoxX.GetControlInterface: IGroupBoxX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TGroupBoxX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TGroupBoxX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TGroupBoxX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TGroupBoxX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TGroupBoxX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TGroupBoxX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TGroupBoxX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TGroupBoxX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TGroupBoxX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TGroupBoxX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TGroupBoxX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure THotKeyX.InitControlData;
const
  CControlData: TControlData = (
    ClassID: '{695CDB36-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil;
    Flags: $00000008;
    Version: 300);
begin
  ControlData := @CControlData;
end;

procedure THotKeyX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IHotKeyX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function THotKeyX.GetControlInterface: IHotKeyX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure THotKeyX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function THotKeyX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function THotKeyX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function THotKeyX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure THotKeyX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function THotKeyX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function THotKeyX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function THotKeyX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function THotKeyX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function THotKeyX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure THotKeyX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TListBoxX.InitControlData;
const
  CEventDispIDs: array [0..3] of DWORD = (
    $00000001, $00000002, $00000009, $0000000B);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDB3D-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDB3B-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 4;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000000D;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TListBoxX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IListBoxX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TListBoxX.GetControlInterface: IListBoxX;
begin
  CreateControl;
  Result := FIntf;
end;

function TListBoxX.Get_Items: IStrings;
begin
  Result := ControlInterface.Get_Items;
end;

procedure TListBoxX.Set_Items(const Value: IStrings);
begin
  ControlInterface.Set_Items(Value);
end;

procedure TListBoxX.Clear;
begin
  ControlInterface.Clear;
end;

procedure TListBoxX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TListBoxX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TListBoxX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TListBoxX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TListBoxX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TListBoxX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TListBoxX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TListBoxX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TListBoxX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TListBoxX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TListBoxX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TMaskEditX.InitControlData;
const
  CEventDispIDs: array [0..3] of DWORD = (
    $00000001, $00000002, $00000003, $00000009);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDB44-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDB42-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 4;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000002D;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TMaskEditX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IMaskEditX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TMaskEditX.GetControlInterface: IMaskEditX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TMaskEditX.ValidateEdit;
begin
  ControlInterface.ValidateEdit;
end;

procedure TMaskEditX.Clear;
begin
  ControlInterface.Clear;
end;

procedure TMaskEditX.ClearSelection;
begin
  ControlInterface.ClearSelection;
end;

procedure TMaskEditX.CopyToClipboard;
begin
  ControlInterface.CopyToClipboard;
end;

procedure TMaskEditX.CutToClipboard;
begin
  ControlInterface.CutToClipboard;
end;

procedure TMaskEditX.PasteFromClipboard;
begin
  ControlInterface.PasteFromClipboard;
end;

procedure TMaskEditX.Undo;
begin
  ControlInterface.Undo;
end;

procedure TMaskEditX.ClearUndo;
begin
  ControlInterface.ClearUndo;
end;

procedure TMaskEditX.SelectAll;
begin
  ControlInterface.SelectAll;
end;

procedure TMaskEditX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TMaskEditX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TMaskEditX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TMaskEditX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TMaskEditX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TMaskEditX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TMaskEditX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TMaskEditX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TMaskEditX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TMaskEditX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TMaskEditX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TMediaPlayerX.InitControlData;
const
  CEventDispIDs: array [0..2] of DWORD = (
    $00000001, $00000002, $00000003);
  CControlData: TControlData = (
    ClassID: '{695CDB4B-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDB49-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 3;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $00000008;
    Version: 300);
begin
  ControlData := @CControlData;
end;

procedure TMediaPlayerX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IMediaPlayerX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TMediaPlayerX.GetControlInterface: IMediaPlayerX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TMediaPlayerX.Open;
begin
  ControlInterface.Open;
end;

procedure TMediaPlayerX.Close;
begin
  ControlInterface.Close;
end;

procedure TMediaPlayerX.Play;
begin
  ControlInterface.Play;
end;

procedure TMediaPlayerX.Stop;
begin
  ControlInterface.Stop;
end;

procedure TMediaPlayerX.Pause;
begin
  ControlInterface.Pause;
end;

procedure TMediaPlayerX.Step;
begin
  ControlInterface.Step;
end;

procedure TMediaPlayerX.Back;
begin
  ControlInterface.Back;
end;

procedure TMediaPlayerX.Previous;
begin
  ControlInterface.Previous;
end;

procedure TMediaPlayerX.Next;
begin
  ControlInterface.Next;
end;

procedure TMediaPlayerX.StartRecording;
begin
  ControlInterface.StartRecording;
end;

procedure TMediaPlayerX.Eject;
begin
  ControlInterface.Eject;
end;

procedure TMediaPlayerX.Save;
begin
  ControlInterface.Save;
end;

procedure TMediaPlayerX.PauseOnly;
begin
  ControlInterface.PauseOnly;
end;

procedure TMediaPlayerX.Resume;
begin
  ControlInterface.Resume;
end;

procedure TMediaPlayerX.Rewind;
begin
  ControlInterface.Rewind;
end;

procedure TMediaPlayerX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TMediaPlayerX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TMediaPlayerX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TMediaPlayerX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TMediaPlayerX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TMediaPlayerX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TMediaPlayerX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TMediaPlayerX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TMediaPlayerX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TMediaPlayerX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TMediaPlayerX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TMemoX.InitControlData;
const
  CEventDispIDs: array [0..3] of DWORD = (
    $00000001, $00000002, $00000003, $00000009);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDB57-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDB55-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 4;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000002D;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TMemoX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IMemoX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TMemoX.GetControlInterface: IMemoX;
begin
  CreateControl;
  Result := FIntf;
end;

function TMemoX.Get_Lines: IStrings;
begin
  Result := ControlInterface.Get_Lines;
end;

procedure TMemoX.Set_Lines(const Value: IStrings);
begin
  ControlInterface.Set_Lines(Value);
end;

function TMemoX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TMemoX.Clear;
begin
  ControlInterface.Clear;
end;

procedure TMemoX.ClearSelection;
begin
  ControlInterface.ClearSelection;
end;

procedure TMemoX.CopyToClipboard;
begin
  ControlInterface.CopyToClipboard;
end;

procedure TMemoX.CutToClipboard;
begin
  ControlInterface.CutToClipboard;
end;

procedure TMemoX.PasteFromClipboard;
begin
  ControlInterface.PasteFromClipboard;
end;

procedure TMemoX.Undo;
begin
  ControlInterface.Undo;
end;

procedure TMemoX.ClearUndo;
begin
  ControlInterface.ClearUndo;
end;

procedure TMemoX.SelectAll;
begin
  ControlInterface.SelectAll;
end;

procedure TMemoX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TMemoX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TMemoX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

procedure TMemoX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TMemoX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TMemoX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TMemoX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TMemoX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TMemoX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TMemoX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TMonthCalendarX.InitControlData;
const
  CEventDispIDs: array [0..3] of DWORD = (
    $00000001, $00000002, $00000007, $00000009);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDB5E-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDB5C-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 4;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000000C;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TMonthCalendarX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IMonthCalendarX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TMonthCalendarX.GetControlInterface: IMonthCalendarX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TMonthCalendarX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TMonthCalendarX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TMonthCalendarX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TMonthCalendarX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TMonthCalendarX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TMonthCalendarX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TMonthCalendarX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TMonthCalendarX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TMonthCalendarX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TMonthCalendarX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TMonthCalendarX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TNotebookX.InitControlData;
const
  CEventDispIDs: array [0..2] of DWORD = (
    $00000001, $00000002, $0000000A);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDB66-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDB64-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 3;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000000D;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TNotebookX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as INotebookX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TNotebookX.GetControlInterface: INotebookX;
begin
  CreateControl;
  Result := FIntf;
end;

function TNotebookX.Get_Pages: IStrings;
begin
  Result := ControlInterface.Get_Pages;
end;

procedure TNotebookX.Set_Pages(const Value: IStrings);
begin
  ControlInterface.Set_Pages(Value);
end;

procedure TNotebookX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TNotebookX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TNotebookX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TNotebookX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TNotebookX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TNotebookX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TNotebookX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TNotebookX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TNotebookX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TNotebookX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TNotebookX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TOutlineX.InitControlData;
const
  CEventDispIDs: array [0..4] of DWORD = (
    $00000001, $00000002, $00000004, $0000000E, $00000010);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDB6D-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDB6B-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 5;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000000D;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TOutlineX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IOutlineX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TOutlineX.GetControlInterface: IOutlineX;
begin
  CreateControl;
  Result := FIntf;
end;

function TOutlineX.Get_Lines: IStrings;
begin
  Result := ControlInterface.Get_Lines;
end;

procedure TOutlineX.Set_Lines(const Value: IStrings);
begin
  ControlInterface.Set_Lines(Value);
end;

function TOutlineX.Add(Index: Integer; const Text: WideString; out Value: Integer): Integer;
begin
  Result := ControlInterface.Add(Index, Text);
end;

function TOutlineX.AddChild(Index: Integer; const Text: WideString; out Value: Integer): Integer;
begin
  Result := ControlInterface.AddChild(Index, Text);
end;

function TOutlineX.Insert(Index: Integer; const Text: WideString; out Value: Integer): Integer;
begin
  Result := ControlInterface.Insert(Index, Text);
end;

procedure TOutlineX.Delete(Index: Integer);
begin
  ControlInterface.Delete(Index);
end;

function TOutlineX.GetItem(X: Integer; Y: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.GetItem(X, Y);
end;

function TOutlineX.GetTextItem(const Param1: WideString; out Value: Integer): Integer;
begin
  Result := ControlInterface.GetTextItem(Param1);
end;

procedure TOutlineX.FullExpand;
begin
  ControlInterface.FullExpand;
end;

procedure TOutlineX.FullCollapse;
begin
  ControlInterface.FullCollapse;
end;

procedure TOutlineX.LoadFromFile(const FileName: WideString);
begin
  ControlInterface.LoadFromFile(FileName);
end;

procedure TOutlineX.SaveToFile(const FileName: WideString);
begin
  ControlInterface.SaveToFile(FileName);
end;

procedure TOutlineX.BeginUpdate;
begin
  ControlInterface.BeginUpdate;
end;

procedure TOutlineX.EndUpdate;
begin
  ControlInterface.EndUpdate;
end;

procedure TOutlineX.SetUpdateState(Value: WordBool);
begin
  ControlInterface.SetUpdateState(Value);
end;

procedure TOutlineX.Clear;
begin
  ControlInterface.Clear;
end;

procedure TOutlineX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TOutlineX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TOutlineX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TOutlineX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TOutlineX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TOutlineX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TOutlineX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TOutlineX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TOutlineX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TOutlineX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TOutlineX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TPageScrollerX.InitControlData;
const
  CEventDispIDs: array [0..3] of DWORD = (
    $00000001, $00000002, $00000008, $0000000A);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDB76-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDB74-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 4;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000000D;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TPageScrollerX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IPageScrollerX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TPageScrollerX.GetControlInterface: IPageScrollerX;
begin
  CreateControl;
  Result := FIntf;
end;

function TPageScrollerX.GetButtonState(Button: TxPageScrollerButton; 
                                       out Value: TxPageScrollerButtonState): TxPageScrollerButtonState;
begin
  Result := ControlInterface.GetButtonState(Button);
end;

procedure TPageScrollerX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TPageScrollerX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TPageScrollerX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TPageScrollerX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TPageScrollerX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TPageScrollerX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TPageScrollerX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TPageScrollerX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TPageScrollerX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TPageScrollerX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TPageScrollerX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TPanelX.InitControlData;
const
  CEventDispIDs: array [0..4] of DWORD = (
    $00000001, $00000002, $00000003, $00000006, $0000000F);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDB80-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDB7E-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 5;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000001D;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TPanelX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IPanelX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TPanelX.GetControlInterface: IPanelX;
begin
  CreateControl;
  Result := FIntf;
end;

function TPanelX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TPanelX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TPanelX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TPanelX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

procedure TPanelX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TPanelX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TPanelX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TPanelX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TPanelX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TPanelX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TPanelX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TProgressBarX.InitControlData;
const
  CControlData: TControlData = (
    ClassID: '{695CDB87-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil;
    Flags: $00000008;
    Version: 300);
begin
  ControlData := @CControlData;
end;

procedure TProgressBarX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IProgressBarX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TProgressBarX.GetControlInterface: IProgressBarX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TProgressBarX.StepIt;
begin
  ControlInterface.StepIt;
end;

procedure TProgressBarX.StepBy(Delta: Integer);
begin
  ControlInterface.StepBy(Delta);
end;

procedure TProgressBarX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TProgressBarX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TProgressBarX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TProgressBarX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TProgressBarX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TProgressBarX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TProgressBarX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TProgressBarX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TProgressBarX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TProgressBarX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TProgressBarX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TRadioButtonX.InitControlData;
const
  CEventDispIDs: array [0..2] of DWORD = (
    $00000001, $00000002, $00000008);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDB8F-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDB8D-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 3;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000001D;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TRadioButtonX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IRadioButtonX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TRadioButtonX.GetControlInterface: IRadioButtonX;
begin
  CreateControl;
  Result := FIntf;
end;

function TRadioButtonX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TRadioButtonX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TRadioButtonX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TRadioButtonX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

procedure TRadioButtonX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TRadioButtonX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TRadioButtonX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TRadioButtonX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TRadioButtonX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TRadioButtonX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TRadioButtonX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TRadioGroupX.InitControlData;
const
  CEventDispIDs: array [0..0] of DWORD = (
    $00000001);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDB96-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDB94-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 1;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000001D;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TRadioGroupX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IRadioGroupX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TRadioGroupX.GetControlInterface: IRadioGroupX;
begin
  CreateControl;
  Result := FIntf;
end;

function TRadioGroupX.Get_Items: IStrings;
begin
  Result := ControlInterface.Get_Items;
end;

procedure TRadioGroupX.Set_Items(const Value: IStrings);
begin
  ControlInterface.Set_Items(Value);
end;

procedure TRadioGroupX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TRadioGroupX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TRadioGroupX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TRadioGroupX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TRadioGroupX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TRadioGroupX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TRadioGroupX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TRadioGroupX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TRadioGroupX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TRadioGroupX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TRadioGroupX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TRichEditX.InitControlData;
const
  CEventDispIDs: array [0..4] of DWORD = (
    $00000001, $00000007, $0000000F, $00000011, $00000012);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDB9D-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDB9B-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 5;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000002D;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TRichEditX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IRichEditX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TRichEditX.GetControlInterface: IRichEditX;
begin
  CreateControl;
  Result := FIntf;
end;

function TRichEditX.Get_Lines: IStrings;
begin
  Result := ControlInterface.Get_Lines;
end;

procedure TRichEditX.Set_Lines(const Value: IStrings);
begin
  ControlInterface.Set_Lines(Value);
end;

procedure TRichEditX.Clear;
begin
  ControlInterface.Clear;
end;

procedure TRichEditX.Print(const Caption: WideString);
begin
  ControlInterface.Print(Caption);
end;

function TRichEditX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TRichEditX.ClearSelection;
begin
  ControlInterface.ClearSelection;
end;

procedure TRichEditX.CopyToClipboard;
begin
  ControlInterface.CopyToClipboard;
end;

procedure TRichEditX.CutToClipboard;
begin
  ControlInterface.CutToClipboard;
end;

procedure TRichEditX.PasteFromClipboard;
begin
  ControlInterface.PasteFromClipboard;
end;

procedure TRichEditX.Undo;
begin
  ControlInterface.Undo;
end;

procedure TRichEditX.ClearUndo;
begin
  ControlInterface.ClearUndo;
end;

procedure TRichEditX.SelectAll;
begin
  ControlInterface.SelectAll;
end;

procedure TRichEditX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TRichEditX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TRichEditX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

procedure TRichEditX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TRichEditX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TRichEditX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TRichEditX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TRichEditX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TRichEditX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TRichEditX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TScrollBarX.InitControlData;
const
  CEventDispIDs: array [0..2] of DWORD = (
    $00000001, $00000007, $00000009);
  CControlData: TControlData = (
    ClassID: '{695CDBA4-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDBA2-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 3;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $00000008;
    Version: 300);
begin
  ControlData := @CControlData;
end;

procedure TScrollBarX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IScrollBarX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TScrollBarX.GetControlInterface: IScrollBarX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TScrollBarX.SetParams(APosition: Integer; AMin: Integer; AMax: Integer);
begin
  ControlInterface.SetParams(APosition, AMin, AMax);
end;

procedure TScrollBarX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TScrollBarX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TScrollBarX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TScrollBarX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TScrollBarX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TScrollBarX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TScrollBarX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TScrollBarX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TScrollBarX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TScrollBarX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TScrollBarX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TScrollBoxX.InitControlData;
const
  CEventDispIDs: array [0..4] of DWORD = (
    $00000001, $00000002, $00000003, $00000004, $00000012);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDBAD-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDBAB-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 5;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000000D;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TScrollBoxX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IScrollBoxX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TScrollBoxX.GetControlInterface: IScrollBoxX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TScrollBoxX.DisableAutoRange;
begin
  ControlInterface.DisableAutoRange;
end;

procedure TScrollBoxX.EnableAutoRange;
begin
  ControlInterface.EnableAutoRange;
end;

procedure TScrollBoxX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TScrollBoxX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TScrollBoxX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TScrollBoxX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TScrollBoxX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TScrollBoxX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TScrollBoxX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TScrollBoxX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TScrollBoxX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TScrollBoxX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TScrollBoxX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TSpinButtonX.InitControlData;
const
  CEventDispIDs: array [0..1] of DWORD = (
    $00000001, $00000008);
  CControlData: TControlData = (
    ClassID: '{695CDBB4-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDBB2-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 2;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $00000008;
    Version: 300);
begin
  ControlData := @CControlData;
end;

procedure TSpinButtonX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as ISpinButtonX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TSpinButtonX.GetControlInterface: ISpinButtonX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TSpinButtonX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TSpinButtonX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TSpinButtonX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TSpinButtonX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TSpinButtonX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TSpinButtonX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TSpinButtonX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TSpinButtonX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TSpinButtonX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TSpinButtonX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TSpinButtonX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TSpinEditX.InitControlData;
const
  CEventDispIDs: array [0..3] of DWORD = (
    $00000001, $00000002, $00000003, $00000008);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDBBB-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDBB9-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 4;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000002D;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TSpinEditX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as ISpinEditX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TSpinEditX.GetControlInterface: ISpinEditX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TSpinEditX.Clear;
begin
  ControlInterface.Clear;
end;

procedure TSpinEditX.ClearSelection;
begin
  ControlInterface.ClearSelection;
end;

procedure TSpinEditX.CopyToClipboard;
begin
  ControlInterface.CopyToClipboard;
end;

procedure TSpinEditX.CutToClipboard;
begin
  ControlInterface.CutToClipboard;
end;

procedure TSpinEditX.PasteFromClipboard;
begin
  ControlInterface.PasteFromClipboard;
end;

procedure TSpinEditX.Undo;
begin
  ControlInterface.Undo;
end;

procedure TSpinEditX.ClearUndo;
begin
  ControlInterface.ClearUndo;
end;

procedure TSpinEditX.SelectAll;
begin
  ControlInterface.SelectAll;
end;

procedure TSpinEditX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TSpinEditX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TSpinEditX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TSpinEditX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TSpinEditX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TSpinEditX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TSpinEditX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TSpinEditX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TSpinEditX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TSpinEditX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TSpinEditX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TStaticTextX.InitControlData;
const
  CEventDispIDs: array [0..1] of DWORD = (
    $00000001, $00000002);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDBC2-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDBC0-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 2;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000001D;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TStaticTextX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IStaticTextX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TStaticTextX.GetControlInterface: IStaticTextX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TStaticTextX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TStaticTextX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TStaticTextX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TStaticTextX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TStaticTextX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TStaticTextX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TStaticTextX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TStaticTextX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TStaticTextX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TStaticTextX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TStaticTextX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TStringGridX.InitControlData;
const
  CEventDispIDs: array [0..9] of DWORD = (
    $00000001, $00000002, $00000003, $00000009, $0000000A, $0000000C,
    $00000013, $00000014, $00000015, $00000018);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDBCA-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDBC8-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 10;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000000D;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TStringGridX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IStringGridX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TStringGridX.GetControlInterface: IStringGridX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TStringGridX.MouseToCell(X: Integer; Y: Integer; var ACol: Integer; var ARow: Integer);
begin
  ControlInterface.MouseToCell(X, Y, ACol, ARow);
end;

procedure TStringGridX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TStringGridX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TStringGridX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TStringGridX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TStringGridX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TStringGridX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TStringGridX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TStringGridX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TStringGridX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TStringGridX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TStringGridX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TTabbedNotebookX.InitControlData;
const
  CEventDispIDs: array [0..1] of DWORD = (
    $00000001, $00000002);
  CTFontIDs: array [0..2] of DWORD = (
    $00000002, $FFFFFE00, $00000008);
  CControlData: TControlData = (
    ClassID: '{695CDBD1-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDBCF-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 2;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000000C;
    Version: 300;
    FontCount: 3;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TTabbedNotebookX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as ITabbedNotebookX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TTabbedNotebookX.GetControlInterface: ITabbedNotebookX;
begin
  CreateControl;
  Result := FIntf;
end;

function TTabbedNotebookX.Get_Pages: IStrings;
begin
  Result := ControlInterface.Get_Pages;
end;

procedure TTabbedNotebookX.Set_Pages(const Value: IStrings);
begin
  ControlInterface.Set_Pages(Value);
end;

function TTabbedNotebookX.GetIndexForPage(const PageName: WideString; out Value: Integer): Integer;
begin
  Result := ControlInterface.GetIndexForPage(PageName);
end;

procedure TTabbedNotebookX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TTabbedNotebookX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TTabbedNotebookX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TTabbedNotebookX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TTabbedNotebookX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TTabbedNotebookX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TTabbedNotebookX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TTabbedNotebookX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TTabbedNotebookX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TTabbedNotebookX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TTabbedNotebookX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TTabControlX.InitControlData;
const
  CEventDispIDs: array [0..3] of DWORD = (
    $00000001, $00000002, $0000000A, $0000000F);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDBD8-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDBD6-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 4;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000000C;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TTabControlX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as ITabControlX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TTabControlX.GetControlInterface: ITabControlX;
begin
  CreateControl;
  Result := FIntf;
end;

function TTabControlX.Get_Tabs: IStrings;
begin
  Result := ControlInterface.Get_Tabs;
end;

procedure TTabControlX.Set_Tabs(const Value: IStrings);
begin
  ControlInterface.Set_Tabs(Value);
end;

procedure TTabControlX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TTabControlX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TTabControlX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TTabControlX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TTabControlX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TTabControlX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TTabControlX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TTabControlX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TTabControlX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TTabControlX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TTabControlX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TTabSetX.InitControlData;
const
  CEventDispIDs: array [0..2] of DWORD = (
    $00000001, $00000002, $0000000B);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData = (
    ClassID: '{695CDBE1-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDBDF-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 3;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $0000000C;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TTabSetX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as ITabSetX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TTabSetX.GetControlInterface: ITabSetX;
begin
  CreateControl;
  Result := FIntf;
end;

function TTabSetX.Get_Tabs: IStrings;
begin
  Result := ControlInterface.Get_Tabs;
end;

procedure TTabSetX.Set_Tabs(const Value: IStrings);
begin
  ControlInterface.Set_Tabs(Value);
end;

procedure TTabSetX.SelectNext(Direction: WordBool);
begin
  ControlInterface.SelectNext(Direction);
end;

procedure TTabSetX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TTabSetX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TTabSetX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TTabSetX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TTabSetX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TTabSetX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TTabSetX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TTabSetX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TTabSetX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TTabSetX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TTabSetX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TTrackBarX.InitControlData;
const
  CEventDispIDs: array [0..1] of DWORD = (
    $00000001, $00000007);
  CControlData: TControlData = (
    ClassID: '{695CDBE8-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDBE6-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 2;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $00000008;
    Version: 300);
begin
  ControlData := @CControlData;
end;

procedure TTrackBarX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as ITrackBarX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TTrackBarX.GetControlInterface: ITrackBarX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TTrackBarX.SetTick(Value: Integer);
begin
  ControlInterface.SetTick(Value);
end;

procedure TTrackBarX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TTrackBarX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TTrackBarX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TTrackBarX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TTrackBarX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TTrackBarX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TTrackBarX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TTrackBarX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TTrackBarX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TTrackBarX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TTrackBarX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure TUpDownX.InitControlData;
const
  CEventDispIDs: array [0..1] of DWORD = (
    $00000001, $00000002);
  CControlData: TControlData = (
    ClassID: '{695CDBF2-02E5-11D2-B20D-00C04FA368D4}';
    EventIID: '{695CDBF0-02E5-11D2-B20D-00C04FA368D4}';
    EventCount: 2;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $00000008;
    Version: 300);
begin
  ControlData := @CControlData;
end;

procedure TUpDownX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IUpDownX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TUpDownX.GetControlInterface: IUpDownX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TUpDownX.FlipChildren(AllLevels: WordBool);
begin
  ControlInterface.FlipChildren(AllLevels);
end;

function TUpDownX.DrawTextBiDiModeFlags(Flags: Integer; out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlags(Flags);
end;

function TUpDownX.DrawTextBiDiModeFlagsReadingOnly(out Value: Integer): Integer;
begin
  Result := ControlInterface.DrawTextBiDiModeFlagsReadingOnly;
end;

function TUpDownX.GetControlsAlignment(out Value: TxAlignment): TxAlignment;
begin
  Result := ControlInterface.GetControlsAlignment;
end;

procedure TUpDownX.InitiateAction;
begin
  ControlInterface.InitiateAction;
end;

function TUpDownX.IsRightToLeft(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.IsRightToLeft;
end;

function TUpDownX.UseRightToLeftAlignment(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftAlignment;
end;

function TUpDownX.UseRightToLeftReading(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftReading;
end;

function TUpDownX.UseRightToLeftScrollBar(out Value: WordBool): WordBool;
begin
  Result := ControlInterface.UseRightToLeftScrollBar;
end;

function TUpDownX.ClassNameIs(const Name: WideString; out Value: WordBool): WordBool;
begin
  Result := ControlInterface.ClassNameIs(Name);
end;

procedure TUpDownX.AboutBox;
begin
  ControlInterface.AboutBox;
end;

procedure Register;
begin
  RegisterComponents('ActiveX',[TAnimateX, TButtonX, TCalendarX, TCheckBoxX, 
    TCheckListBoxX, TColorGridX, TComboBoxX, TControlBarX, TDateTimePickerX, 
    TDrawGridX, TEditX, TGroupBoxX, THotKeyX, TListBoxX, 
    TMaskEditX, TMediaPlayerX, TMemoX, TMonthCalendarX, TNotebookX, 
    TOutlineX, TPageScrollerX, TPanelX, TProgressBarX, TRadioButtonX, 
    TRadioGroupX, TRichEditX, TScrollBarX, TScrollBoxX, TSpinButtonX, 
    TSpinEditX, TStaticTextX, TStringGridX, TTabbedNotebookX, TTabControlX, 
    TTabSetX, TTrackBarX, TUpDownX]);
end;

end.
