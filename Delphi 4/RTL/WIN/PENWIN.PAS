
{*******************************************************}
{                                                       }
{       Borland Delphi Runtime Library                  }
{       Win32 pen API interface unit                    }
{                                                       }
{       Copyright (C) 1994,98 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit PenWin;

{$WEAKPACKAGEUNIT}

{ Pen Windows functions, types, and definitions  }

{ "FBC" in the comments means that the feature exists only for
  backward compatibility. It should not be used by new applications. }

interface

uses Windows, Messages, MMSystem;

{ Enabled Alphabet: }

const
  ALC_DEFAULT              = $00000000;  { nothing }
  ALC_LCALPHA              = $00000001;  { a..z }
  ALC_UCALPHA              = $00000002;  { A..Z }
  ALC_NUMERIC              = $00000004;  { 0..9 }
  ALC_PUNC                 = $00000008;  { !-;`"?()&.,; and backslash }
  ALC_MATH                 = $00000010;  // %^*()-+={}<>,/.
  ALC_MONETARY             = $00000020;  { ,.$ or local }
  ALC_OTHER                = $00000040;  { @#|_~[] }
  ALC_ASCII                = $00000080;  { restrict to 7-bit chars 20..7f }
  ALC_WHITE                = $00000100;  { white space }
  ALC_NONPRINT             = $00000200;  { sp tab ret ctrl glyphs }
  ALC_DBCS                 = $00000400;  { allow DBCS variety of SBCS }
  ALC_JIS1                 = $00000800;  { kanji JPN, ShiftJIS 1 only }
  ALC_GESTURE              = $00004000;  { gestures }
  ALC_USEBITMAP            = $00008000;  { use rc.rgbfAlc to enable chars }
  ALC_HIRAGANA             = $00010000;  { hiragana JPN }
  ALC_KATAKANA             = $00020000;  { katakana JPN }
  ALC_KANJI                = $00040000;  { kanji JPN, ShiftJIS 1+2+3 }
  ALC_GLOBALPRIORITY       = $10000000;
  ALC_OEM                  = $0FF80000;  { OEM recognizer-specific }
  ALC_RESERVED             = $E0003000;  { avail for future use }
  ALC_NOPRIORITY           = $00000000;  { for alcPriority = none }

  ALC_ALPHA                = ALC_LCALPHA or ALC_UCALPHA;
  ALC_ALPHANUMERIC         = ALC_ALPHA or ALC_NUMERIC;
  ALC_SYSMINIMUM = ALC_ALPHANUMERIC or ALC_PUNC or ALC_WHITE or ALC_GESTURE;
  ALC_ALL = ALC_SYSMINIMUM or ALC_MATH or ALC_MONETARY or ALC_OTHER or ALC_NONPRINT;
  ALC_KANJISYSMINIMUM = ALC_SYSMINIMUM or ALC_HIRAGANA or ALC_KATAKANA or ALC_JIS1;
  ALC_KANJIALL = ALC_ALL or ALC_HIRAGANA or ALC_KATAKANA or ALC_KANJI;

{ box edit styles: }

  BXS_NONE                 = $0000;  { none }
  BXS_RECT                 = $0001;  { use rectangle instead of cusp }
  BXS_BOXCROSS             = $0004;  { use cross at box center }
  BXS_MASK                 = $0007;  { mask for above }

{ Public Bitmaps : }

  OBM_SKBBTNUP                = 32767;
  OBM_SKBBTNDOWN              = 32766;
  OBM_SKBBTNDISABLED          = 32765;

  OBM_ZENBTNUP                = 32764;
  OBM_ZENBTNDOWN              = 32763;
  OBM_ZENBTNDISABLED          = 32762;

  OBM_HANBTNUP                = 32761;
  OBM_HANBTNDOWN              = 32760;
  OBM_HANBTNDISABLED          = 32759;

  OBM_KKCBTNUP                = 32758;
  OBM_KKCBTNDOWN              = 32757;
  OBM_KKCBTNDISABLED          = 32756;

  OBM_SIPBTNUP                = 32755;
  OBM_SIPBTNDOWN              = 32754;
  OBM_SIPBTNDISABLED          = 32753;

  OBM_PTYBTNUP                = 32752;
  OBM_PTYBTNDOWN              = 32751;
  OBM_PTYBTNDISABLED          = 32750;

{ Default pen cursor to indicate writing, points northwest }
  IDC_PEN             = MAKEINTRESOURCE(32631);

{ alternate select cursor: upsidedown standard arrow, points southeast }
  IDC_ALTSELECT       = MAKEINTRESOURCE(32501);

{ special SYV values: }
  SYV_NULL                    = $00000000;
  SYV_UNKNOWN                 = $00000001;
  SYV_EMPTY                   = $00000003;
  SYV_BEGINOR                 = $00000010;
  SYV_ENDOR                   = $00000011;
  SYV_OR                      = $00000012;
  SYV_SOFTNEWLINE             = $00000020;
  SYV_SPACENULL               = $00010000;    { SyvCharacterToSymbol('\0') }

{ SYV values for gestures: }
  SYV_SELECTFIRST             = $0002FFC0;    { . means circle in following }
  SYV_LASSO                   = $0002FFC1;    { lasso o-tap }
  SYV_SELECTLEFT              = $0002FFC2;    { no glyph }
  SYV_SELECTRIGHT             = $0002FFC3;    { no glyph }
  SYV_SELECTLAST              = $0002FFCF;    { 16 SYVs reserved for selection }

  SYV_CLEARCHAR               = $0002FFD2;    { d. }
  SYV_HELP                    = $0002FFD3;    { no glyph }
  SYV_KKCONVERT               = $0002FFD4;    { k. }
  SYV_CLEAR                   = $0002FFD5;    { d. }
  SYV_INSERT                  = $0002FFD6;    { ^. }
  SYV_CONTEXT                 = $0002FFD7;    { m. }
  SYV_EXTENDSELECT            = $0002FFD8;    { no glyph }
  SYV_UNDO                    = $0002FFD9;    { u. }
  SYV_COPY                    = $0002FFDA;    { c. }
  SYV_CUT                     = $0002FFDB;    { x. }
  SYV_PASTE                   = $0002FFDC;    { p. }
  SYV_CLEARWORD               = $0002FFDD;    { no glyph }
  SYV_USER                    = $0002FFDE;    { reserved }
  SYV_CORRECT                 = $0002FFDF;    { check. }

  SYV_BACKSPACE               = $00020008;    { no glyph }
  SYV_TAB                     = $00020009;    { t. }
  SYV_RETURN                  = $0002000D;    { n. }
  SYV_SPACE                   = $00020020;    { s. }

{ Application specific gestures, Circle a-z and Circle A-Z: }
  SYV_APPGESTUREMASK          = $00020000;
  SYV_CIRCLEUPA               = $000224B6;    { map into Unicode space }
  SYV_CIRCLEUPZ               = $000224CF;    {  for circled letters }
  SYV_CIRCLELOA               = $000224D0;
  SYV_CIRCLELOZ               = $000224E9;

{ SYV definitions for shapes: }
  SYV_SHAPELINE               = $00040001;
  SYV_SHAPEELLIPSE            = $00040002;
  SYV_SHAPERECT               = $00040003;
  SYV_SHAPEMIN                = SYV_SHAPELINE; { alias }
  SYV_SHAPEMAX                = SYV_SHAPERECT; { alias }

{ SYV classes: }
  SYVHI_SPECIAL               = 0;
  SYVHI_ANSI                  = 1;
  SYVHI_GESTURE               = 2;
  SYVHI_KANJI                 = 3;
  SYVHI_SHAPE                 = 4;
  SYVHI_UNICODE               = 5;
  SYVHI_VKEY                  = 6;


{ IEdit Pop-up Menu Command Items }

  IEM_UNDO                    = 1;         { Undo }
  IEM_CUT                     = 2;         { Cut }
  IEM_COPY                    = 3;         { Copy }
  IEM_PASTE                   = 4;         { Paste }
  IEM_CLEAR                   = 5;         { Clear }
  IEM_SELECTALL               = 6;         { Select All Strokes }
  IEM_ERASE                   = 7;         { Use Eraser }
  IEM_PROPERTIES              = 8;         { DoProperties }
  IEM_LASSO                   = 9;         { Use Lasso }
  IEM_RESIZE                  = 10;        { Resize }

  IEM_USER                        = 100;   { first menu item# available to app }

{ IEdit Style Attributes }
  IES_BORDER                  = $0001;   { ctl has a border }
  IES_HSCROLL                 = $0002;   { ctl is horizontally scrollable }
  IES_VSCROLL                 = $0004;   { ctl is vertically scrollable }
  IES_OWNERDRAW               = $0008;   { ctl will be drawn by parent window }


{ PenData API constants: }

{ ANIMATEINFO callback options: }
  AI_CBSTROKE                 = $FFFF;  { Animate callback after every stroke }

{ ANIMATEINFO options: }
  AI_SKIPUPSTROKES            = $0001;  { ignore upstrokes in animation }

{ CompressPenData() API options: }
  CMPD_COMPRESS               = $0001;
  CMPD_DECOMPRESS             = $0002;

{ CreatePenDataRegion types: }
  CPDR_BOX                    = 1;      { bounding box }
  CPDR_LASSO                  = 2;      { lasso }

{ CreatePenData (CPD) and Pen Hardware (PHW) Flags; }
{ The order of PHW flags is important: }
  CPD_DEFAULT                 = $047F;  { CPD_TIME | PHW_ALL }
  CPD_USERBYTE                = $0100;  { alloc 8 bits/stroke }
  CPD_USERWORD                = $0200;  { alloc 16 bits/stroke }
  CPD_USERDWORD               = $0300;  { alloc 32 bits/stroke }
  CPD_TIME                    = $0400;  { maintain abs time info per stroke }

{ DrawPenDataEx() flags/options: }
  DPD_HDCPEN                  = $0001;  { use pen selected in HDC }
  DPD_DRAWSEL                 = $0002;  { draw the selection }

{ ExtractPenDataPoints options (EPDP_xx): }
  EPDP_REMOVE                 = $0001;  { Remove points from the pendata }

{ ExtractPenDataStrokes options and modifiers (EPDS_xx): }
  EPDS_SELECT                 = 1;      { selected strokes }
  EPDS_STROKEINDEX            = 2;      { index }
  EPDS_USER                   = 3;      { user-specific value }
  EPDS_PENTIP                 = 4;      { complete pentip }
  EPDS_TIPCOLOR               = 5;      { pentip color }
  EPDS_TIPWIDTH               = 6;      { pentip width }
  EPDS_TIPNIB                 = 7;      { pentip nib style }
  EPDS_INKSET                 = 8;      { inkset match }

  EPDS_EQ                     = $0000;  { default: same as }
  EPDS_LT                     = $0010;  { all strokes less than }
  EPDS_GT                     = $0020;  { all strokes greater than }
  EPDS_NOT                    = $0040;  { all strokes not matching }
  EPDS_NE                     = $0040;  { alias }
  EPDS_GTE                    = $0050;  { alias for NOT LT }
  EPDS_LTE                    = $0060;  { alias for NOT GT }

  EPDS_REMOVE                 = $8000;  { remove matching strokes from source }

{ GetPenDataAttributes options (GPA_xx): }
  GPA_MAXLEN                  = 1;  { length of longest stroke }
  GPA_POINTS                  = 2;  { total number of points }
  GPA_PDTS                    = 3;  { PDTS_xx bits }
  GPA_RATE                    = 4;  { get sampling rate }
  GPA_RECTBOUND               = 5;  { bounding rect of all points }
  GPA_RECTBOUNDINK            = 6;  { ditto, adj for fat ink }
  GPA_SIZE                    = 7;  { size of pendata in bytes }
  GPA_STROKES                 = 8;  { total number of strokes }
  GPA_TIME                    = 9;  { absolute time at creation of pendata }
  GPA_USER                    = 10; { number of user bytes available: 0, 1, 2, 4 }
  GPA_VERSION                 = 11; { version number of pendata }

{ GetStrokeAttributes options (GSA_xx): }
  GSA_PENTIP                  = 1;  { get stroke pentip (color, width, nib) }
  GSA_PENTIPCLASS             = 2;  { same as GSA_PENTIP }
  GSA_USER                    = 3;  { get stroke user value }
  GSA_USERCLASS               = 4;  { get stroke's class user value }
  GSA_TIME                    = 5;  { get time of stroke }
  GSA_SIZE                    = 6;  { get size of stroke in points and bytes }
  GSA_SELECT                  = 7;  { get selection status of stroke }
  GSA_DOWN                    = 8;  { get up/down state of stroke }
  GSA_RECTBOUND               = 9;  { get the bounding rectangle of the stroke }

{ GetStrokeTableAttributes options (GSA_xx): }
  GSA_PENTIPTABLE             = 10; { get table-indexed pentip }
  GSA_SIZETABLE               = 11; { get count of Stroke Class Table entries }
  GSA_USERTABLE               = 12; { get table-indexed user value }

  IX_END                      = $FFFF;  { to or past last available index }

{ PenTip: }
  PENTIP_NIBDEFAULT           = (0);            { default pen tip nib style }
  PENTIP_HEIGHTDEFAULT        = (0);            { default pen tip nib height }
  PENTIP_OPAQUE               = $FF;            { default opaque ink }
  PENTIP_HILITE               = $80;
  PENTIP_TRANSPARENT          = (0);

{ General PenData API return values (PDR_xx): }
  PDR_NOHIT                   = 3;      { hit test failed }
  PDR_HIT                     = 2;      { hit test succeeded }
  PDR_OK                      = 1;      { success }
  PDR_CANCEL                  = 0;      { callback cancel or impasse }

  PDR_ERROR                   = -1;     { parameter or unspecified error }
  PDR_PNDTERR                 = -2;     { bad pendata }
  PDR_VERSIONERR              = -3;     { pendata version error }
  PDR_COMPRESSED              = -4;     { pendata is compressed }
  PDR_STRKINDEXERR            = -5;     { stroke index error }
  PDR_PNTINDEXERR             = -6;     { point index error }
  PDR_MEMERR                  = -7;     { memory error }
  PDR_INKSETERR               = -8;     { bad inkset }
  PDR_ABORT                   = -9;     { pendata has become invalid, e.g. }
  PDR_NA                      = -10;    { option not available (pw kernel) }

  PDR_USERDATAERR             = -16;    { user data error }
  PDR_SCALINGERR              = -17;    { scale error }
  PDR_TIMESTAMPERR            = -18;    { timestamp error }
  PDR_OEMDATAERR              = -19;    { OEM data error }
  PDR_SCTERR                  = -20;    { SCT error (full) }

{ PenData Scaling (PDTS): }
  PDTS_LOMETRIC               = 0;      { 0.01mm }
  PDTS_HIMETRIC               = 1;      { 0.001mm }
  PDTS_HIENGLISH              = 2;      { 0.001" }
  PDTS_STANDARDSCALE          = 2;      { PDTS_HIENGLISH   alias }
  PDTS_DISPLAY                = 3;      { display pixel }
  PDTS_ARBITRARY              = 4;      { app-specific scaling }
  PDTS_SCALEMASK              = $000F;  { scaling values in low nibble }

{ CompactPenData API trim options: }
  PDTT_DEFAULT                = $0000;
  PDTT_PENINFO                = $0100;
  PDTT_UPPOINTS               = $0200;
  PDTT_OEMDATA                = $0400;
  PDTT_COLLINEAR              = $0800;
  PDTT_COLINEAR               = $0800;  { alt sp alias }
  PDTT_DECOMPRESS             = $4000;  { decompress the data }
  PDTT_COMPRESS               = $8000;
  PDTT_ALL                    = $0F00;  { PENINFO|UPPOINTS|OEMDATA|COLLINEAR }

  PHW_NONE                    = $0000;  { no OEMdata }
  PHW_PRESSURE                = $0001;  { report pressure in OEMdata if avail }
  PHW_HEIGHT                  = $0002;  { ditto height }
  PHW_ANGLEXY                 = $0004;  { ditto xy angle }
  PHW_ANGLEZ                  = $0008;  { ditto z angle }
  PHW_BARRELROTATION          = $0010;  { ditto barrel rotation }
  PHW_OEMSPECIFIC             = $0020;  { ditto OEM-specific value }
  PHW_PDK                     = $0040;  { report per-point PDK_xx in OEM data }
  PHW_ALL                     = $007F;  { report everything }

{ compact pen data trim options: matches PDTT_values (see above) }
  PDTS_COMPRESS2NDDERIV       = $0010;  { compress using 2nd deriv }
  PDTS_COMPRESSMETHOD         = $00F0;  { sum of compress method flags }
  PDTS_NOPENINFO              = $0100;  { removes PENINFO struct from header }
  PDTS_NOUPPOINTS             = $0200;  { remove up pts }
  PDTS_NOOEMDATA              = $0400;  { remove OEM data }
  PDTS_NOCOLLINEAR            = $0800;  { remove successive identical pts }
  PDTS_NOCOLINEAR             = $0800;  { alt sp alias }
  PDTS_NOTICK                 = $1000;  { remove timing info (2.0) }
  PDTS_NOUSER                 = $2000;  { remove user info (2.0) }
  PDTS_NOEMPTYSTROKES         = $4000;  { remove empty strokes (2.0) }
  PDTS_COMPRESSED             = $8000;  { perform lossless compression }

{ SetStrokeAttributes options (SSA_xx): }
  SSA_PENTIP                  = 1;      { set stroke tip (color, width, nib) }
  SSA_PENTIPCLASS             = 2;      { set stroke's class pentip }
  SSA_USER                    = 3;      { set stroke user value }
  SSA_USERCLASS               = 4;      { set stroke's class user value }
  SSA_TIME                    = 5;      { set time of stroke }
  SSA_SELECT                  = 6;      { set selection status of stroke }
  SSA_DOWN                    = 7;      { set up/down state of stroke }

{ SetStrokeTableAttributes options (SSA_xx): }
  SSA_PENTIPTABLE             = 8;      { set table-indexed pentip }
  SSA_USERTABLE               = 9;      { set table-indexed user value }

{ PenTip flag bits: }
  TIP_ERASECOLOR              = 1;      { erase specific color pentip.rgb }

{ TrimPenData() API options: }
  TPD_RECALCSIZE              = $0000;  { no trim, used for resize calc }
  TPD_USER                    = $0080;  { per-stroke user info }
  TPD_TIME                    = $0100;  { per-stroke timing info }
  TPD_UPPOINTS                = $0200;  { x-y data up points }
  TPD_COLLINEAR               = $0400;  { colinear and coincident points }
  TPD_COLINEAR                = $0400;  { alt sp alias }
  TPD_PENINFO                 = $0800;  { PenInfo struct and all OEM }
  TPD_PHW                     = $1000;  { OEM & pdk except stroke tick or user }
  TPD_OEMDATA                 = $1000;  { ditto }
  TPD_EMPTYSTROKES            = $2000;  { strokes with zero points }
  TPD_EVERYTHING              = $3FFF;  { everything (incl PHW_xx) except down pts }


{ Dictionary: }

  cbDictPathMax               = 255;
  DIRQ_QUERY                  = 1;
  DIRQ_DESCRIPTION            = 2;
  DIRQ_CONFIGURE              = 3;
  DIRQ_OPEN                   = 4;
  DIRQ_CLOSE                  = 5;
  DIRQ_SETWORDLISTS           = 6;
  DIRQ_STRING                 = 7;
  DIRQ_SUGGEST                = 8;
  DIRQ_ADD                    = 9;
  DIRQ_DELETE                 = 10;
  DIRQ_FLUSH                  = 11;
  DIRQ_RCCHANGE               = 12;
  DIRQ_SYMBOLGRAPH            = 13;
  DIRQ_INIT                   = 14;
  DIRQ_CLEANUP                = 15;
  DIRQ_COPYRIGHT              = 16;
  DIRQ_USER                   = 4096;


{ Pen driver: }

  BITPENUP                    = $8000;

{ Pen Driver messages: }
  DRV_SetPenDriverEntryPoints         = DRV_RESERVED+1;
  DRV_SetEntryPoints                  = DRV_RESERVED+1; { alias }
  DRV_RemovePenDriverEntryPoints      = DRV_RESERVED+2;
  DRV_RemoveEntryPoints               = DRV_RESERVED+2; { alias }
  DRV_SetPenSamplingRate              = DRV_RESERVED+3;
  DRV_SetPenSamplingDist              = DRV_RESERVED+4;
  DRV_GetName                         = DRV_RESERVED+5;
  DRV_GetVersion                      = DRV_RESERVED+6;
  DRV_GetPenInfo                      = DRV_RESERVED+7;
  DRV_PenPlayStart                    = DRV_RESERVED+8;
  DRV_PenPlayBack                     = DRV_RESERVED+9;
  DRV_PenPlayStop                     = DRV_RESERVED+10;
  DRV_GetCalibration                  = DRV_RESERVED+11;
  DRV_SetCalibration                  = DRV_RESERVED+12;
  DRV_Reserved1                       = DRV_RESERVED+13;
  DRV_Reserved2                       = DRV_RESERVED+14;
  DRV_Query                           = DRV_RESERVED+15;
  DRV_GetPenSamplingRate              = DRV_RESERVED+16;
  DRV_Calibrate                       = DRV_RESERVED+17;

{ Pen Driver Playback constants: }
  PLAY_VERSION_10_DATA     = 0;
  PLAY_VERSION_20_DATA     = 1;

{ Pen Driver return values: }
  DRV_FAILURE                 = $00000000;
  DRV_SUCCESS                 = $00000001;
  DRV_BADPARAM1               = $FFFFFFFF;
  DRV_BADPARAM2               = $FFFFFFFE;
  DRV_BADSTRUCT               = $FFFFFFFD;

{ Pen Driver register messages flags: }
  PENREG_DEFAULT              = $00000002;
  PENREG_WILLHANDLEMOUSE      = $00000001;

  MAXOEMDATAWORDS             = 6;            { rgwOemData[MAXOEMDATAWORDS] }

  RC_LDEFAULTFLAGS            = $80000000;

{ Pen Collection Mode termination conditions: }
{ (note update doc for PCMINFO struct if change these) }
  PCM_PENUP                   = $00000001;    { stop on penup }
  PCM_RANGE                   = $00000002;    { stop on leaving range }
  PCM_INVERT                  = $00000020;    { stop on tap of opposite end }
  PCM_RECTEXCLUDE             = $00002000;    { click in exclude rect }
  PCM_RECTBOUND               = $00004000;    { click outside bounds rect }
  PCM_TIMEOUT                 = $00008000;    { no activity for timeout ms }
{ new for 2.0: }
  PCM_RGNBOUND                = $00010000;    { click outside bounding region }
  PCM_RGNEXCLUDE              = $00020000;    { click in exclude region }
  PCM_DOPOLLING               = $00040000;    { polling mode }
  PCM_TAPNHOLD                = $00080000;    { check for Tap And Hold }
  PCM_ADDDEFAULTS             = RC_LDEFAULTFLAGS; { $80000000 }

{ Pen Device Capabilities: }
  PDC_INTEGRATED              = $00000001;    { display=digitizer }
  PDC_PROXIMITY               = $00000002;    { detect non-contacting pen }
  PDC_RANGE                   = $00000004;    { event on out-of-range }
  PDC_INVERT                  = $00000008;    { pen opposite end detect }
  PDC_RELATIVE                = $00000010;    { pen driver coords }
  PDC_BARREL1                 = $00000020;    { barrel button 1 present }
  PDC_BARREL2                 = $00000040;    { ditto 2 }
  PDC_BARREL3                 = $00000080;    { ditto 3 }

{ Pen Driver Kit states: }
  PDK_NULL                    = $0000;  { default to no flags set }
  PDK_UP                      = $0000;  { PDK_NULL alias }
  PDK_DOWN                    = $0001;  { pentip switch ON due to contact }
  PDK_BARREL1                 = $0002;  { barrel1 switch depressed }
  PDK_BARREL2                 = $0004;  { ditto 2 }
  PDK_BARREL3                 = $0008;  { ditto 3 }
  PDK_SWITCHES                = $000F;  { sum of down + barrels 1,2,3 }
  PDK_UNUSED10                = $0020;
  PDK_UNUSED20                = $0040;
  PDK_INVERTED                = $0080;  { other end of pen used as tip }
  PDK_PENIDMASK               = $0F00;  { bits 8..11 physical pen id (0..15) }
  PDK_UNUSED1000              = $1000;
  PDK_INKSTOPPED              = $2000;  { Inking stopped }
  PDK_OUTOFRANGE              = $4000;  { pen left range (OEM data invalid) }
  PDK_DRIVER                  = $8000;  { pen (not mouse) event }

  PDK_TIPMASK                 = $0001;  { mask for testing PDK_DOWN }

{ OEM-specific values for Pen Driver: }
  PDT_NULL                    = 0;
  PDT_PRESSURE                = 1;      { pressure supported }
  PDT_HEIGHT                  = 2;      { height above tablet }
  PDT_ANGLEXY                 = 3;      { xy (horiz) angle supported }
  PDT_ANGLEZ                  = 4;      { z (vert) angle supported }
  PDT_BARRELROTATION          = 5;      { barrel is rotated }
  PDT_OEMSPECIFIC             = 16;     { max }

{ Denotes the ID of the current packet }
  PID_CURRENT                 = -1;

{ Handwriting Recognizer: }

{ GetResultsHRC options: }
  GRH_ALL                     = 0;      { get all results }
  GRH_GESTURE                 = 1;      { get only gesture results }
  GRH_NONGESTURE              = 2;      { get all but gesture results }

{ Gesture sets for EnableGestureSetHRC (bit flags): }
  GST_SEL                     = $00000001;    { sel & lasso }
  GST_CLIP                    = $00000002;    { cut copy paste }
  GST_WHITE                   = $00000004;    { sp tab ret }
  GST_KKCONVERT               = $00000008;    { kkconvert }
  GST_EDIT                    = $00000010;    { insert correct undo clear }
  GST_SYS                     = $00000017;    { all of the above }
  GST_CIRCLELO                = $00000100;    { lowercase circle }
  GST_CIRCLEUP                = $00000200;    { uppercase circle }
  GST_CIRCLE                  = $00000300;    { all circle }
  GST_ALL                     = $00000317;    { all of the above }

{ General HRC API return values (HRCR_xx): }
  HRCR_NORESULTS              = 4;      { No possible results  to be found }
  HRCR_COMPLETE               = 3;      { finished recognition }
  HRCR_GESTURE                = 2;      { recognized gesture }
  HRCR_OK                     = 1;      { success }
  HRCR_INCOMPLETE             = 0;      { recognizer is processing input }
  HRCR_ERROR                  = -1;     { invalid param or unspecified error }
  HRCR_MEMERR                 = -2;     { memory error }
  HRCR_INVALIDGUIDE           = -3;     { invalid GUIDE struct }
  HRCR_INVALIDPNDT            = -4;     { invalid pendata }
  HRCR_UNSUPPORTED            = -5;     { recognizer does not support feature }
  HRCR_CONFLICT               = -6;     { training conflict }
  HRCR_HOOKED                 = -8;     { hookasaurus ate the result }

{ system wordlist for AddWordsHWL: }
  HWL_SYSTEM                  = (1);       { magic value means system wordlist }

{ inkset returns: }
  ISR_ERROR                   = -1;     { Memory or other error }
  ISR_BADINKSET               = -2;     { bad source inkset }
  ISR_BADINDEX                = -3;     { bad inkset index }

  MAXHOTSPOT                  = 8;      { max number of hotspots possible }

{ ProcessHRC time constants: }
  PH_MAX                      = $FFFFFFFF;    { recognize rest of ink }
  PH_DEFAULT                  = $FFFFFFFE;    { reasonable time }
  PH_MIN                      = $FFFFFFFD;    { minimum time }

{ ResultsHookHRC options: }
  RHH_STD                     = 0;      { GetResultsHRC }
  RHH_BOX                     = 1;      { GetBoxResultsHRC }

{ SetWordlistCoercionHRC options: }
  SCH_NONE                    = 0;      { turn off coercion }
  SCH_ADVISE                  = 1;      { macro is hint only }
  SCH_FORCE                   = 2;      { some result is forced from macro }

{ Symbol Context Insert Modes }
  SCIM_INSERT                 = 0;      { insert }
  SCIM_OVERWRITE              = 1;      { overwrite }

{ SetResultsHookHREC options: }
  SRH_HOOKALL                 = 1;      { hook all recognizers }

{ SetInternationalHRC options: }
  SSH_RD                      = 1;      { to right and down (English) }
  SSH_RU                      = 2;      { to right and up }
  SSH_LD                      = 3;      { to left and down (Hebrew) }
  SSH_LU                      = 4;      { to left and up }
  SSH_DL                      = 5;      { down and to the left (Chinese) }
  SSH_DR                      = 6;      { down and to the right (Chinese) }
  SSH_UL                      = 7;      { up and to the left }
  SSH_UR                      = 8;      { up and to the right }

  SIH_ALLANSICHAR             = 1;      { use all ANSI }

{ TrainHREC options: }
  TH_QUERY                    = 0;      { query the user if conflict }
  TH_FORCE                    = 1;      { ditto no query }
  TH_SUGGEST                  = 2;      { abandon training if conflict }

{ Return values for WCR_TRAIN Function }
  TRAIN_NONE                  = $0000;
  TRAIN_DEFAULT               = $0001;
  TRAIN_CUSTOM                = $0002;
  TRAIN_BOTH                  = TRAIN_DEFAULT or TRAIN_CUSTOM;

{ Control values for TRAINSAVE }
  TRAIN_SAVE                  = 0;      { save changes that have been made }
  TRAIN_REVERT                = 1;      { discard changes that have been made }
  TRAIN_RESET                 = 2;      { use factory settings }

{ ConfigRecognizer and ConfigHREC options: }
  WCR_RECOGNAME               = 0;      { ConfigRecognizer 1.0 }
  WCR_QUERY                   = 1;
  WCR_CONFIGDIALOG            = 2;
  WCR_DEFAULT                 = 3;
  WCR_RCCHANGE                = 4;
  WCR_VERSION                 = 5;
  WCR_TRAIN                   = 6;
  WCR_TRAINSAVE               = 7;
  WCR_TRAINMAX                = 8;
  WCR_TRAINDIRTY              = 9;
  WCR_TRAINCUSTOM             = 10;
  WCR_QUERYLANGUAGE           = 11;
  WCR_USERCHANGE              = 12;

{ ConfigHREC options: }
  WCR_PWVERSION               = 13;     { ver of PenWin recognizer supports }
  WCR_GETALCPRIORITY          = 14;     { get recognizer's ALC priority }
  WCR_SETALCPRIORITY          = 15;     { set recognizer's ALC priority }
  WCR_GETANSISTATE            = 16;     { get ALLANSICHAR state }
  WCR_SETANSISTATE            = 17;     { set ALLANSICHAR if T }
  WCR_GETHAND                 = 18;     { get writing hand }
  WCR_SETHAND                 = 19;     { set writing hand }
  WCR_GETDIRECTION            = 20;     { get writing direction }
  WCR_SETDIRECTION            = 21;     { set writing direction }
  WCR_INITRECOGNIZER          = 22;     { init recognizer and set user name }
  WCR_CLOSERECOGNIZER         = 23;     { close recognizer }

  WCR_PRIVATE                 = 1024;

{ sub-functions of WCR_USERCHANGE }
  CRUC_NOTIFY                 = 0;      { user name change }
  CRUC_REMOVE                 = 1;      { user name deleted }

{ Word List Types: }
  WLT_STRING                  = 0;      { one string }
  WLT_STRINGTABLE             = 1;      { array of strings }
  WLT_EMPTY                   = 2;      { empty wordlist }
  WLT_WORDLIST                = 3;      { handle to a wordlist }


{ IEdit Background Options }

  IEB_DEFAULT                 = 0;      { default (use COLOR_WINDOW) }
  IEB_BRUSH                   = 1;      { paint background with brush }
  IEB_BIT_UL                  = 2;      { bitmap, upper-left aligned }
  IEB_BIT_CENTER              = 3;      { bitmap, centered in control }
  IEB_BIT_TILE                = 4;      { bitmap, tiled repeatedly in ctl }
  IEB_BIT_STRETCH             = 5;      { bitmap, stretched to fit ctl }
  IEB_OWNERDRAW               = 6;      { parent window will draw background }

{ IEdit Drawing Options }
  IEDO_NONE                   = $0000;  { no drawing }
  IEDO_FAST                   = $0001;  { ink drawn as fast as possible (def) }
  IEDO_SAVEUPSTROKES          = $0002;  { save upstrokes }
  IEDO_RESERVED               = $FFFC;  { reserved bits }

{ IEdit Input Options }
  IEI_MOVE                    = $0001;  { move ink into ctl }
  IEI_RESIZE                  = $0002;  { resize ink to fit within ctl }
  IEI_CROP                    = $0004;  { discard ink outside of ctl }
  IEI_DISCARD                 = $0008;  { discard all ink if any outside ctl }
  IEI_RESERVED                = $FFF0;  { reserved }

{ IEdit IE_GETINK options }
  IEGI_ALL                    = $0000;  { get all ink from control }
  IEGI_SELECTION              = $0001;  { get selected ink from control }

{ IEdit IE_SETMODE/IE_GETMODE (mode) options }
  IEMODE_READY                = 0;      { default inking, moving, sizing mode }
  IEMODE_ERASE                = 1;      { erasing Mode }
  IEMODE_LASSO                = 2;      { lasso selection mode }

{ IEdit    Notification Bits }
  IEN_NULL                    = $0000;  { null notification }
  IEN_PDEVENT                 = $0001;  { notify about pointing device events }
  IEN_PAINT                   = $0002;  { send painting-related notifications }
  IEN_FOCUS                   = $0004;  { send focus-related notifications }
  IEN_SCROLL                  = $0008;  { send scrolling notifications }
  IEN_EDIT                    = $0010;  { send editing/change notifications }
  IEN_PROPERTIES              = $0020;  { send properties dialog notification }
  IEN_RESERVED                = $FF80;  { reserved }

{ IEdit Return Values }
  IER_OK                      = 0;      { success }
  IER_NO                      = 0;      { ctl cannot do request }
  IER_YES                     = 1;      { ctl can do request }
  IER_ERROR                   = -1;     { unspecified error; operation failed }
  IER_PARAMERR                = -2;     { bogus lParam value, bad handle, etc }
  IER_OWNERDRAW               = -3;     { can't set drawopts in ownerdraw ctl }
  IER_SECURITY                = -4;     { security protection disallows action }
  IER_SELECTION               = -5;     { nothing selected in control }
  IER_SCALE                   = -6;     { merge:  incompatible scaling factors }
  IER_MEMERR                  = -7;     { memory error }
  IER_NOCOMMAND               = -8;     { tried IE_GETCOMMAND w/no command }
  IER_NOGESTURE               = -9;     { tried IE_GETGESTURE w/no gesture }
  IER_NOPDEVENT               = -10;    { tried IE_GETPDEVENT but no event }
  IER_NOTINPAINT              = -11;    { tried IE_GETPAINTSTRUCT but no paint }
  IER_PENDATA                 = -12;    { can't do request with NULL hpd in ctl }

{ IEdit Recognition Options }
  IEREC_NONE                  = $0000;  { No recognition }
  IEREC_GESTURE               = $0001;  { Gesture recognition }
{$DEFINE IEREC_ALL}
  IEREC_RESERVED              = $FFFE;  { Reserved }

{ IEdit Security Options }
  IESEC_NOCOPY                = $0001;  { copying disallowed }
  IESEC_NOCUT                 = $0002;  { cutting disallowed }
  IESEC_NOPASTE               = $0004;  { pasting disallowed }
  IESEC_NOUNDO                = $0008;  { undoing disallowed }
  IESEC_NOINK                 = $0010;  { inking  disallowed }
  IESEC_NOERASE               = $0020;  { erasing disallowed }
  IESEC_NOGET                 = $0040;  { IE_GETINK message verboten }
  IESEC_NOSET                 = $0080;  { IE_SETINK message verboten }
  IESEC_RESERVED              = $FF00;  { reserved }

{ IEdit IE_SETFORMAT/IE_GETFORMAT options }
  IESF_ALL                    = $0001;  { set/get stk fmt of all ink }
  IESF_SELECTION              = $0002;  { set/get stk fmt of selected ink }
  IESF_STROKE                 = $0004;  { set/get stk fmt of specified stroke }

  IESF_TIPCOLOR               = $0008;  { set color }
  IESF_TIPWIDTH               = $0010;  { set width }
  IESF_PENTIP                 = IESF_TIPCOLOR or IESF_TIPWIDTH;


{ IEdit IE_SETINK options }
  IESI_REPLACE                = $0000;  { replace ink in control }
  IESI_APPEND                 = $0001;  { append ink to existing control ink }

{ Ink Edit Control (IEdit) definitions }
{ IEdit Notifications }
  IN_PDEVENT          = (IEN_PDEVENT shl 8) or 0; { pointing device event occurred }
  IN_ERASEBKGND       = (IEN_NULL shl 8) or 1; { control needs bkgnd erased }
  IN_PREPAINT         = (IEN_PAINT shl 8) or 2; { before control paints its ink }
  IN_PAINT            = (IEN_NULL shl 8) or 3; { control needs to be painted }
  IN_POSTPAINT        = (IEN_PAINT shl 8) or 4; { after control has painted }
  IN_MODECHANGED      = (IEN_EDIT shl 8) or 5; { mode changed }
  IN_CHANGE           = (IEN_EDIT shl 8) or 6; { contents changed & painted }
  IN_UPDATE           = (IEN_EDIT shl 8) or 7; { contents changed & !painted }
  IN_SETFOCUS         = (IEN_FOCUS shl 8) or 8; { IEdit is getting focus }
  IN_KILLFOCUS        = (IEN_FOCUS shl 8) or 9; { IEdit is losing focus }
  IN_MEMERR           = (IEN_NULL shl 8) or 10; { memory error }
  IN_HSCROLL          = (IEN_SCROLL shl 8) or 11; { horz scrolled, not painted }
  IN_VSCROLL          = (IEN_SCROLL shl 8) or 12; { vert scrolled, not painted }
  IN_GESTURE          = (IEN_EDIT shl 8) or 13; { user has gestured on control }
  IN_COMMAND          = (IEN_EDIT shl 8) or 14; { command selected from menu }
  IN_CLOSE            = (IEN_NULL shl 8) or 15; { I-Edit is being closed }
  IN_PROPERTIES       = (IEN_PROPERTIES shl 8) or 16; { properties dialog }


{ PenIn[k]put API constants }

{ Default Processing }
  LRET_DONE                   = 1;
  LRET_ABORT                  = -1;
  LRET_HRC                    = -2;
  LRET_HPENDATA               = -3;
  LRET_PRIVATE                = -4;

{ Inkput: }
  PCMR_OK                     = 0;
  PCMR_ALREADYCOLLECTING      = -1;
  PCMR_INVALIDCOLLECTION      = -2;
  PCMR_EVENTLOCK              = -3;
  PCMR_INVALID_PACKETID       = -4;
  PCMR_TERMTIMEOUT            = -5;
  PCMR_TERMRANGE              = -6;
  PCMR_TERMPENUP              = -7;
  PCMR_TERMEX                 = -8;
  PCMR_TERMBOUND              = -9;
  PCMR_APPTERMINATED          = -10;
  PCMR_TAP                    = -11;    { alias PCMR_TAPNHOLD_LAST }
  PCMR_SELECT                 = -12;    { ret because of tap & hold }
  PCMR_OVERFLOW               = -13;
  PCMR_ERROR                  = -14;    { parameter or unspecified error }
  PCMR_DISPLAYERR             = -15;    { inking only }
  PCMR_TERMINVERT             = -16;    { termination due to tapping opposite end of pen }

  PII_INKCLIPRECT             = $0001;
  PII_INKSTOPRECT             = $0002;
  PII_INKCLIPRGN              = $0004;
  PII_INKSTOPRGN              = $0008;
  PII_INKPENTIP               = $0010;
  PII_SAVEBACKGROUND          = $0020;
  PII_CLIPSTOP                = $0040;

  PIT_RGNBOUND                = $0001;
  PIT_RGNEXCLUDE              = $0002;
  PIT_TIMEOUT                 = $0004;
  PIT_TAPNHOLD                = $0008;


{ Misc RC Definitions: }

  CL_NULL                     = 0;
  CL_MINIMUM                  = 1;      { minimum confidence level }
  CL_MAXIMUM                  = 100;    { max (require perfect recog) }
  cwRcReservedMax             = 8;      { rc.rgwReserved[cwRcReservedMax] }
  ENUM_MINIMUM                = 1;
  ENUM_MAXIMUM                = 4096;

  HKP_SETHOOK                 = 0;      { SetRecogHook() }
  HKP_UNHOOK                  = $FFFF;

  HWR_RESULTS                 = 0;
  HWR_APPWIDE                 = 1;

  iSycNull                    = -1;
  LPDFNULL                    = 0;      { nil }
  MAXDICTIONARIES             = 16;     { rc.rglpdf[MAXDICTIONARIES] }
  wPntAll                     = $FFFF;
  cbRcLanguageMax             = 44;     { rc.lpLanguage[cbRcLanguageMax] }
  cbRcUserMax                 = 32;     { rc.lpUser[cbRcUserMax] }
  cbRcrgbfAlcMax              = 32;     { rc.rgbfAlc[cbRcrgbfAlcMax] }
  RC_WDEFAULT                 = $FFFF;
  RC_LDEFAULT                 = $FFFFFFFF;
  RC_WDEFAULTFLAGS            = $8000;
//  RC_LDEFAULTFLAGS            = $80000000; defined above

{ CorrectWriting() API constants: }
{ LOWORD values: }
  CWR_REPLACECR               = $0001;  { replace carriage ret (\r) with space }
  CWR_STRIPCR                 = CWR_REPLACECR; { alias for backward compatibility }
  CWR_STRIPLF                 = $0002;  { strip linefeed (\n) }
  CWR_REPLACETAB              = $0004;  { replace tab with space (\t) }
  CWR_STRIPTAB                = CWR_REPLACETAB; { alias for backward compatibility }
  CWR_SINGLELINEEDIT          = CWR_REPLACECR or CWR_STRIPLF or CWR_REPLACETAB; { all of the above }
  CWR_INSERT                  = $0008;  { use "Insert Text" instead of "Edit Text" in the title }
  CWR_TITLE                   = $0010;  { interpret dwParam as title string }
  CWR_KKCONVERT               = $0020;  { JPN initiate IME }
  CWR_SIMPLE                  = $0040;  { simple dialog (lens) }
  CWR_HEDIT                   = $0080;  { HEDIT CorrectWriting }
  CWR_KEYBOARD                = $0100;  { keyboard lens }
  CWR_BOXES                   = $0200;  { bedit lens }

{ HIWORD values: keyboard types }
  CWRK_DEFAULT                = 0;      { default keyboard type }
  CWRK_BASIC                  = 1;      { basic keyboard }
  CWRK_FULL                   = 2;      { full keyboard }
  CWRK_NUMPAD                 = 3;      { numeric keyboard }
  CWRK_TELPAD                 = 4;      { Telephone type keyboard }

  GPMI_OK                     = 0;
  GPMI_INVALIDPMI             = $8000;

{ inkwidth limits }
  INKWIDTH_MINIMUM            = 0;          { 0 invisible, 1..15 pixel widths }
  INKWIDTH_MAXIMUM            = 15;         { max width in pixels }

{ Get/SetPenMiscInfo: }
{ PMI_RCCHANGE is for WM_GLOBALRCCHANGE compatability only: }
  PMI_RCCHANGE                = 0;      { invalid for Get/SetPenMiscInfo }

  PMI_BEDIT                   = 1;      { boxed edit info }
  PMI_IMECOLOR                = 2;      { input method editor color }
  PMI_CXTABLET                = 3;      { tablet width }
  PMI_CYTABLET                = 4;      { tablet height }
  PMI_PENTIP                  = 6;      { pen tip: color, width, nib }
  PMI_ENABLEFLAGS             = 7;      { PWE_xx enablements }
  PMI_TIMEOUT                 = 8;      { handwriting timeout }
  PMI_TIMEOUTGEST             = 9;      { gesture timeout }
  PMI_TIMEOUTSEL              = 10;     { select (press&hold) timeout }
  PMI_SYSFLAGS                = 11;     { component load configuration }
  PMI_INDEXFROMRGB            = 12;     { color table index from RGB }
  PMI_RGBFROMINDEX            = 13;     { RGB from color table index }
  PMI_SYSREC                  = 14;     { handle to system recognizer }
  PMI_TICKREF                 = 15;     { reference absolute time }

  PMI_SAVE                    = $1000;  { save setting to file }

{ Set/GetPenMiscInfo/PMI_ENABLEFLAGS flags: }
  PWE_AUTOWRITE               = $0001;  { pen functionality where IBeam }
  PWE_ACTIONHANDLES           = $0002;  { action handles in controls }
  PWE_INPUTCURSOR             = $0004;  { show cursor while writing }
  PWE_LENS                    = $0008;  { allow lens popup }

{ GetPenMiscInfo/PMI_SYSFLAGS flags: }
  PWF_RC1                     = $0001;  { Windows for Pen 1.0 RC support }
  PWF_PEN                     = $0004;  { pen drv loaded & hdwe init'd }
  PWF_INKDISPLAY              = $0008;  { ink-compatible display drv loaded }
  PWF_RECOGNIZER              = $0010;  { system recognizer installed }
  PWF_BEDIT                   = $0100;  { boxed edit support }
  PWF_HEDIT                   = $0200;  { free input edit support }
  PWF_IEDIT                   = $0400;  { ink edit support }
  PWF_ENHANCED                = $1000;  { enh features (gest, 1ms timing) }
  PWF_FULL    = PWF_RC1 or PWF_PEN or PWF_INKDISPLAY or PWF_RECOGNIZER or
                PWF_BEDIT or PWF_HEDIT or PWF_IEDIT or PWF_ENHANCED;

{ SetPenAppFlags API constants: }
  RPA_DEFAULT                 = $0001;  { = RPA_HEDIT }
  RPA_HEDIT                   = $0001;  { convert EDIT to HEDIT }
  RPA_KANJIFIXEDBEDIT         = $0002;
  RPA_DBCSPRIORITY            = $0004;  { assume DBCS has priority (Japan) }

  PMIR_OK                     = 0;
  PMIR_INDEX                  = -1;
  PMIR_VALUE                  = -2;
  PMIR_INVALIDBOXEDITINFO     = -3;
  PMIR_INIERROR               = -4;
  PMIR_ERROR                  = -5;
  PMIR_NA                     = -6;

  SPMI_OK                     = 0;
  SPMI_INVALIDBOXEDITINFO     = 1;
  SPMI_INIERROR               = 2;
  SPMI_INVALIDPMI             = $8000;


{ RC Options and Flags: }

{ RC Direction: }
  RCD_DEFAULT                 = 0;      { def none }
  RCD_LR                      = 1;      { left to right like English }
  RCD_RL                      = 2;      { right to left like Arabic }
  RCD_TB                      = 3;      { top to bottom like Japanese }
  RCD_BT                      = 4;      { bottom to top like some Chinese }

{ RC International Preferences: }
  RCIP_ALLANSICHAR            = $0001;  { all ANSI chars }
  RCIP_MASK                   = $0001;

{ RC Options: }
  RCO_NOPOINTEREVENT          = $00000001;    { no recog tap, tap/hold }
  RCO_SAVEALLDATA             = $00000002;    { save pen data like upstrokes }
  RCO_SAVEHPENDATA            = $00000004;    { save pen data for app }
  RCO_NOFLASHUNKNOWN          = $00000008;    { no ? cursor on unknown }
  RCO_TABLETCOORD             = $00000010;    { tablet coords used in RC }
  RCO_NOSPACEBREAK            = $00000020;    { no space break recog -> dict }
  RCO_NOHIDECURSOR            = $00000040;    { display cursor during inking }
  RCO_NOHOOK                  = $00000080;    { disallow ink hook (passwords) }
  RCO_BOXED                   = $00000100;    { valid rc.guide provided }
  RCO_SUGGEST                 = $00000200;    { for dict suggest }
  RCO_DISABLEGESMAP           = $00000400;    { disable gesture mapping }
  RCO_NOFLASHCURSOR           = $00000800;    { no cursor feedback }
  RCO_BOXCROSS                = $00001000;    { show + at boxedit center }
  RCO_COLDRECOG               = $00008000;    { result is from cold recog }
  RCO_SAVEBACKGROUND          = $00010000;    { Save background from ink }
  RCO_DODEFAULT               = $00020000;    { do default gesture processing }

{ RC Orientation of Tablet: }
  RCOR_NORMAL                 = 1;      { tablet not rotated }
  RCOR_RIGHT                  = 2;      { rotated 90 deg anticlockwise }
  RCOR_UPSIDEDOWN             = 3;      { rotated 180 deg }
  RCOR_LEFT                   = 4;      { rotated 90 deg clockwise }

{ RC Preferences: }
  RCP_LEFTHAND                = $0001;  { left handed input }
  RCP_MAPCHAR                 = $0004;  { fill in syg.lpsyc (ink) for training }

{ RCRESULT wResultsType values: }
  RCRT_DEFAULT                = $0000;  { normal ret }
  RCRT_UNIDENTIFIED           = $0001;  { result contains unidentified results }
  RCRT_GESTURE                = $0002;  { result is a gesture }
  RCRT_NOSYMBOLMATCH          = $0004;  { nothing recognized (no ink match) }
  RCRT_PRIVATE                = $4000;  { recognizer-specific symbol }
  RCRT_NORECOG                = $8000;  { no recog attempted, only data ret }
  RCRT_ALREADYPROCESSED       = $0008;  { GestMgr hooked it }
  RCRT_GESTURETRANSLATED      = $0010;  { GestMgr translated it to ANSI value }
  RCRT_GESTURETOKEYS          = $0020;  { ditto to set of virtual keys }

{ RC Result Return Mode specification: }
  RRM_STROKE                  = 0;      { return results after each stroke }
  RRM_SYMBOL                  = 1;      { per symbol (e.g. boxed edits) }
  RRM_WORD                    = 2;      { on recog of a word }
  RRM_NEWLINE                 = 3;      { on recog of a line break }
  RRM_COMPLETE                = 16;     { on PCM_xx specified completion }

  TPT_CLOSEST                 = $0001;   { Assign to the closest target }
  TPT_INTERSECTINK            = $0002;   { target with intersecting ink }
  TPT_TEXTUAL                 = $0004;   { apply textual heuristics }
  TPT_DEFAULT                 = TPT_TEXTUAL or TPT_INTERSECTINK or TPT_CLOSEST;


{ Virtual Event Layer: }
  VWM_MOUSEMOVE               = $0001;
  VWM_MOUSELEFTDOWN           = $0002;
  VWM_MOUSELEFTUP             = $0004;
  VWM_MOUSERIGHTDOWN          = $0008;
  VWM_MOUSERIGHTUP            = $0010;


{ Messages and Defines }

  WM_RCRESULT                 = WM_PENWINFIRST+1;   { $381 }
  WM_HOOKRCRESULT             = WM_PENWINFIRST+2;   { $382 }
  WM_PENMISCINFO              = WM_PENWINFIRST+3;   { $383 }
  WM_GLOBALRCCHANGE           = WM_PENWINFIRST+3;   { alias }
  WM_SKB                      = WM_PENWINFIRST+4;   { $384 }
  WM_PENCTL                   = WM_PENWINFIRST+5;   { $385 }
  WM_HEDITCTL                 = WM_PENWINFIRST+5;   { FBC: alias }

{ WM_HEDITCTL (WM_PENCTL) wParam options: }
  HE_GETRC                    = 3;      { FBC: get RC from HEDIT/BEDIT control }
  HE_SETRC                    = 4;      { FBC: ditto set }
  HE_GETINFLATE               = 5;      { FBC: get inflate rect }
  HE_SETINFLATE               = 6;      { FBC: ditto set }
  HE_GETUNDERLINE             = 7;      { get underline mode }
  HE_SETUNDERLINE             = 8;      { ditto set }
  HE_GETINKHANDLE             = 9;      { get handle to captured ink }
  HE_SETINKMODE               = 10;     { begin HEDIT cold recog mode }
  HE_STOPINKMODE              = 11;     { end cold recog mode }
  HE_GETRCRESULTCODE          = 12;     { FBC: result of recog after HN_ENDREC }
  HE_DEFAULTFONT              = 13;     { switch BEDIT to def font }
  HE_CHARPOSITION             = 14;     { BEDIT byte offset -> char position }
  HE_CHAROFFSET               = 15;     { BEDIT char position -> byte offset }
  HE_GETBOXLAYOUT             = 20;     { get BEDIT layout }
  HE_SETBOXLAYOUT             = 21;     { ditto set }
  HE_GETRCRESULT              = 22;     { FBC: get RCRESULT after HN_RCRESULT }
  HE_KKCONVERT                = 30;     { JPN start kana-kanji conversion }
  HE_GETKKCONVERT             = 31;     { JPN get KK state }
  HE_CANCELKKCONVERT          = 32;     { JPN cancel KK conversion }
  HE_FIXKKCONVERT             = 33;     { JPN force KK result }
  HE_GETKKSTATUS              = 34;     { JPN get KK UI state }
  HE_KKNOCONVERT              = 35;     { JPN revert conversion }
  HE_SETIMEDEFAULT            = 36;     { JPN set a range of DCS }
  HE_GETIMEDEFAULT            = 37;     { JPN get a range of DCS }
  HE_ENABLEALTLIST            = 40;     { en/disable dropdown recog alt's }
  HE_SHOWALTLIST              = 41;     { show dropdown (assume enabled) }
  HE_HIDEALTLIST              = 42;     { hide dropdown alternatives }
  HE_GETLENSTYPE              = 43;     { get lens type: CWR_ and CWRK_ flags }
  HE_SETLENSTYPE              = 44;     { set lens type: CWR_ and CWRK_ flags }

{ JPN Kana-to-Kanji conversion subfunctions: }
  HEKK_DEFAULT                = 0;      { def }
  HEKK_CONVERT                = 1;      { convert in place }
  HEKK_CANDIDATE              = 2;      { start conversion dialog }
  HEKK_DBCSCHAR               = 3;      { convert to DBCS }
  HEKK_SBCSCHAR               = 4;      { convert to SBCS }
  HEKK_HIRAGANA               = 5;      { convert to hiragana }
  HEKK_KATAKANA               = 6;      { convert to katakana }

{ JPN Return value of HE_GETKKSTATUS }
  HEKKR_PRECONVERT            = 1;      { in pre conversion mode }
  HEKKR_CONVERT               = 2;      { in mid conversion mode }
  HEKKR_TEMPCONFIRM           = 3;      { in post conversion mode }

{ HE_STOPINKMODE (stop cold recog) options: }
  HEP_NORECOG                 = 0;      { don't recog ink }
  HEP_RECOG                   = 1;      { recog ink }
  HEP_WAITFORTAP              = 2;      { recog after tap in window }

{ WM_PENCTL notifications: }
  HN_ENDREC                   = 4;      { recog complete }
  HN_DELAYEDRECOGFAIL         = 5;      { HE_STOPINKMODE (cold recog) failed }
  HN_RESULT                   = 20;     { HEDIT/BEDIT has received new ink/recognition result }
  HN_RCRESULT                 = HN_RESULT;
  HN_ENDKKCONVERT             = 30;     { JPN KK conversion complete }
  HN_BEGINDIALOG              = 40;     { Lens/EditText/garbage detection dialog }
{  is about to come up on this hedit/bedit }
  HN_ENDDIALOG                = 41;     { Lens/EditText/garbage detection dialog }
{  has just been destroyed }


{ Messages common with other controls: }

  IE_GETMODIFY          = EM_GETMODIFY;        { gets the mod'n (dirty) bit }
  IE_SETMODIFY          = EM_SETMODIFY;        { sets the mod'n (dirty) bit }
  IE_CANUNDO            = EM_CANUNDO;          { queries whether can undo }
  IE_UNDO               = EM_UNDO;             { undo }
  IE_EMPTYUNDOBUFFER    = EM_EMPTYUNDOBUFFER;  { clears IEDIT undo buffer }
  IE_MSGFIRST           = WM_USER+150;         { $496 = 1174 }

{ IEdit common messages: }
  IE_GETINK                 = IE_MSGFIRST+0;    { gets ink from the control }
  IE_SETINK                 = IE_MSGFIRST+1;    { sets ink into the control }
  IE_GETPENTIP              = IE_MSGFIRST+2;    { gets the cur def ink pentip }
  IE_SETPENTIP              = IE_MSGFIRST+3;    { sets the cur def ink pentip }
  IE_GETERASERTIP           = IE_MSGFIRST+4;    { gets the cur eraser pentip }
  IE_SETERASERTIP           = IE_MSGFIRST+5;    { sets the cur eraser pentip }
  IE_GETBKGND               = IE_MSGFIRST+6;    { gets the bkgnd options }
  IE_SETBKGND               = IE_MSGFIRST+7;    { sets the bkgnd options }
  IE_GETGRIDORIGIN          = IE_MSGFIRST+8;    { gets the bkgnd grid origin }
  IE_SETGRIDORIGIN          = IE_MSGFIRST+9;    { sets the bkgnd grid origin }
  IE_GETGRIDPEN             = IE_MSGFIRST+10;   { gets the bkgnd grid pen }
  IE_SETGRIDPEN             = IE_MSGFIRST+11;   { sets the bkgnd grid pen }
  IE_GETGRIDSIZE            = IE_MSGFIRST+12;   { gets the bkgnd grid size }
  IE_SETGRIDSIZE            = IE_MSGFIRST+13;   { sets the bkgnd grid size }
  IE_GETMODE                = IE_MSGFIRST+14;   { gets the current pen mode }
  IE_SETMODE                = IE_MSGFIRST+15;   { sets the current pen mode }
  IE_GETINKRECT             = IE_MSGFIRST+16;   { gets the rectbound of the ink }

{ IEdit-specific messages: }
  IE_GETAPPDATA             = IE_MSGFIRST+34;   { gets the user-defined datum }
  IE_SETAPPDATA             = IE_MSGFIRST+35;   { sets the user-defined data }
  IE_GETDRAWOPTS            = IE_MSGFIRST+36;   { gets the ink draw options }
  IE_SETDRAWOPTS            = IE_MSGFIRST+37;   { sets the ink options }
  IE_GETFORMAT              = IE_MSGFIRST+38;   { gets format of stroke(s) }
  IE_SETFORMAT              = IE_MSGFIRST+39;   { sets format of stroke(s) }
  IE_GETINKINPUT            = IE_MSGFIRST+40;   { gets the ink input option }
  IE_SETINKINPUT            = IE_MSGFIRST+41;   { sets the ink input option }
  IE_GETNOTIFY              = IE_MSGFIRST+42;   { gets the notification bits }
  IE_SETNOTIFY              = IE_MSGFIRST+43;   { sets the notification bits }
  IE_GETRECOG               = IE_MSGFIRST+44;   { gets recognition options }
  IE_SETRECOG               = IE_MSGFIRST+45;   { sets recognition options }
  IE_GETSECURITY            = IE_MSGFIRST+46;   { gets the security options }
  IE_SETSECURITY            = IE_MSGFIRST+47;   { sets the security options }
  IE_GETSEL                 = IE_MSGFIRST+48;   { gets sel status of a stroke }
  IE_SETSEL                 = IE_MSGFIRST+49;   { sets sel status of a stroke }
  IE_DOCOMMAND              = IE_MSGFIRST+50;   { send command to IEdit }
  IE_GETCOMMAND             = IE_MSGFIRST+51;   { gets user command }
  IE_GETCOUNT               = IE_MSGFIRST+52;   { gets count of strks in I-Edit }
  IE_GETGESTURE             = IE_MSGFIRST+53;   { gets details on user gesture }
  IE_GETMENU                = IE_MSGFIRST+54;   { gets handle to pop-up menu }
  IE_GETPAINTDC             = IE_MSGFIRST+55;   { gets the HDC for painting }
  IE_GETPDEVENT             = IE_MSGFIRST+56;   { gets details of last pd event }
  IE_GETSELCOUNT            = IE_MSGFIRST+57;   { gets count of selected strks }
  IE_GETSELITEMS            = IE_MSGFIRST+58;   { gets indices of all sel strks }
  IE_GETSTYLE               = IE_MSGFIRST+59;   { gets IEdit control styles }


{ (H)Edit Control: }

{ CTLINITHEDIT.dwFlags values }
  CIH_NOGDMSG               = $0001;  { disable garbage detection message box for this edit }
  CIH_NOACTIONHANDLE        = $0002;  { disable action handles for this edit }
  CIH_NOEDITTEXT            = $0004;  { disable Lens/Edit/Insert text for this edit }
  CIH_NOFLASHCURSOR         = $0008;  { don't flash cursor on tap-n-hold in this (h)edit }


{ Boxed Edit Control: }

{ box edit alternative list: }
  HEAL_DEFAULT                = -1;     { AltList def value for lParam }

{ box edit Info: }
  BEI_FACESIZE                = 32;     { max size of font name, = LF_FACESIZE }
  BEIF_BOXCROSS               = $0001;

{ box edit size: }
  BESC_DEFAULT                = 0;
  BESC_ROMANFIXED             = 1;
  BESC_KANJIFIXED             = 2;
  BESC_USERDEFINED            = 3;

{ CTLINITBEDIT.wFlags values }
  CIB_NOGDMSG               = $0001;  { disable garbage detection message box for this bedit }
  CIB_NOACTIONHANDLE        = $0002;  { disable action handles for this bedit }
  CIB_NOFLASHCURSOR         = $0004;  { don't flash cursor on tap-n-hold in this bedit }
  CIB_NOWRITING             = $0010;  { disallow pen input into control }

  BXD_CELLWIDTH               = 12;
  BXD_CELLHEIGHT              = 16;
  BXD_BASEHEIGHT              = 13;
  BXD_BASEHORZ                = 0;
  BXD_MIDFROMBASE             = 0;
  BXD_CUSPHEIGHT              = 2;
  BXD_ENDCUSPHEIGHT           = 4;

  BXDK_CELLWIDTH              = 32;
  BXDK_CELLHEIGHT             = 32;
  BXDK_BASEHEIGHT             = 28;
  BXDK_BASEHORZ               = 0;
  BXDK_MIDFROMBASE            = 0;
  BXDK_CUSPHEIGHT             = 28;
  BXDK_ENDCUSPHEIGHT          = 10;

{ IME colors for bedit }
  COLOR_BE_INPUT                 = 0;
  COLOR_BE_INPUT_TEXT            = 1;
  COLOR_BE_CONVERT               = 2;
  COLOR_BE_CONVERT_TEXT          = 3;
  COLOR_BE_CONVERTED             = 4;
  COLOR_BE_CONVERTED_TEXT        = 5;
  COLOR_BE_UNCONVERT             = 6;
  COLOR_BE_UNCONVERT_TEXT        = 7;
  COLOR_BE_CURSOR                = 8;
  COLOR_BE_CURSOR_TEXT           = 9;
  COLOR_BE_PRECONVERT            = 10;
  COLOR_BE_PRECONVERT_TEXT       = 11;
  MAXIMECOLORS                   = 12;

  WM_PENMISC                  = WM_PENWINFIRST+6;   { $386 }

{ WM_PENMISC message constants: }
  PMSC_BEDITCHANGE            = 1;      { broadcast when BEDIT changes }
  PMSC_PENUICHANGE            = 2;      { JPN broadcast when PENUI changes }
  PMSC_SUBINPCHANGE           = 3;      { JPN broadcast when SUBINPUT changes }
  PMSC_KKCTLENABLE            = 4;      { JPN }
  PMSC_GETPCMINFO             = 5;      { query the window's PCMINFO }
  PMSC_SETPCMINFO             = 6;      { set the window's PCMINFO }
  PMSC_GETINKINGINFO          = 7;      { query the window's INKINGINFO }
  PMSC_SETINKINGINFO          = 8;      { set the window's INKINGINFO }
  PMSC_GETHRC                 = 9;      { query the window's HRC }
  PMSC_SETHRC                 = 10;     { set the window's HRC }
  PMSC_GETSYMBOLCOUNT         = 11;     { count of symbols in result recd by window }
  PMSC_GETSYMBOLS             = 12;     { ditto symbols }
  PMSC_SETSYMBOLS             = 13;     { ditto set symbols }
  PMSC_LOADPW                 = 15;     { broadcast load state on penwin }
  PMSC_INKSTOP                = 16;

{ PMSCL_xx lParam values for PMSC_xx: }
  PMSCL_UNLOADED              = 0;      { penwin just unloaded }
  PMSCL_LOADED                = 1;      { penwin just loaded }
  PMSCL_UNLOADING             = 2;      { penwin about to unload }

  WM_CTLINIT                  = WM_PENWINFIRST+7;   { $387 }

{ WM_CTLINIT message constants: }
  CTLINIT_HEDIT               = 1;
  CTLINIT_BEDIT               = 7;
  CTLINIT_IEDIT               = 9;
  CTLINIT_MAX                 = 10;

  WM_PENEVENT                 = WM_PENWINFIRST+8;   { $388 }

{ WM_PENEVENT message values for wParam: }
  PE_PENDOWN                  = 1;      { pen tip down }
  PE_PENUP                    = 2;      { pen tip went from down to up }
  PE_PENMOVE                  = 3;      { pen moved without a tip transition }
  PE_TERMINATING              = 4;      { Peninput about to terminate }
  PE_TERMINATED               = 5;      { Peninput terminated }
  PE_BUFFERWARNING            = 6;      { Buffer half full. }
  PE_BEGININPUT               = 7;      { begin default input }
  PE_SETTARGETS               = 8;      { set target data structure (TARGINFO) }
  PE_BEGINDATA                = 9;      { init message to all targets }
  PE_MOREDATA                 = 10;     { target gets more data }
  PE_ENDDATA                  = 11;     { termination message to all targets }
  PE_GETPCMINFO               = 12;     { get input collection info }
  PE_GETINKINGINFO            = 13;     { get inking info }
  PE_ENDINPUT                 = 14;     { Input termination message to window }
{ starting default input }
  PE_RESULT                   = 15;     { sent after ProcessHRC but before GetResultsHRC }

type
  HTRG = Integer;
  HPCM = Integer;
  HPENDATA = Integer;
  HREC = Integer;


{ Types }

{ Simple: }
type
  ALC = Longint;                                { Enabled Alphabet }
  CL = Integer;                              { Confidence Level }
  HKP = UINT;                                { Hook Parameter }
  REC = Integer;                             { recognition result }
  SYV = Longint;                                { Symbol Value }

{ Pointer Types: }
type
  PALC = ^ALC;                                      { ptr to ALC }
  POEM = Pointer;                                   { alias }
  PSYV = ^SYV;                                      { ptr to SYV }
  PHPENDATA = ^HPENDATA;                            { ptr to HPENDATA }

{ Function Prototypes: }
  TFNEnumProc = function(p1: PSYV; p2: Integer; p3: Integer): Integer stdcall;
  PFNLPDF = ^TFNLPDF;
  TFNLPDF = function(p1: Integer; p2, p3: Pointer; p4: Integer;
    p5, p6: DWORD): Integer stdcall;
  TFNRCYieldProc = function: BOOL stdcall;


{ Structures: }

  PAbsTime = ^TAbsTime;
  TAbsTime = packed record    { 2.0 absolute date/time }
    sec: DWORD;    { number of seconds since 1/1/1970, ret by CRTlib time() fn }
    ms: UINT;      { additional offset in ms, 0..999 }
  end;

  PCtlInitHEdit = ^TCtlInitHEdit;
  TCtlInitHEdit = packed record { 2.0 init struct for (h)edit }
    cbSize: DWORD;              { sizeof(CTLINITHEDIT) }
    hwnd: HWND;                 { (h)edit window handle }
    id: Integer;                    { its id }
    dwFlags: DWORD;             { CIE_xx }
    dwReserved: DWORD;          { for future use }
  end;

  PBoxLayout = ^TBoxLayout;
  TBoxLayout = packed record  { 1.0 box edit layout }
    cyCusp: Integer;                { pixel height of box (BXS_RECT) or cusp }
    cyEndCusp: Integer;             { pixel height of cusps at extreme ends }
    style: UINT;                { BXS_xx style }
    dwReserved1: DWORD;         { reserved }
    dwReserved2: DWORD;         { reserved }
    dwReserved3: DWORD;         { reserved }
  end;

  PIMEColors = ^TIMEColors;
  TIMEColors = packed record  { 2.0 IME undetermined string color info. }
    cColors: Integer;               { count of colors to be set/get }
    lpnElem: PINT;             { address of array of elements }
    lprgbIme: ^COLORREF;        { address of array of RGB values }
  end;

  PCtlInitBEdit = ^TCtlInitBEdit;
  TCtlInitBEdit = packed record { 2.0 init struct for box edit }
    cbSize: DWORD;              { sizeof(CTLINITBEDIT) }
    hwnd: HWND;                 { box edit window handle }
    id: Integer;                    { its id }
    wSizeCategory: WORD;        { BESC_xx }
    wFlags: WORD;               { CIB_xx }
    dwReserved: DWORD;          { for future use }
  end;

  PBoxEditInfo = ^TBoxEditInfo;
  TBoxEditInfo = packed record { 1.1 box edit Size Info }
    cxBox: Integer;                 { width of a single box }
    cyBox: Integer;                 { ditto height }
    cxBase: Integer;                { in-box x-margin to guideline }
    cyBase: Integer;                { in-box y offset from top to baseline }
    cyMid: Integer;                 { 0 or distance from baseline to midline }
    boxlayout: TBoxLayout;       { embedded BOXLAYOUT structure }
    wFlags: UINT;               { BEIF_xx }
    szFaceName: packed array[0..BEI_FACESIZE-1] of BYTE;{ font face name }
    wFontHeight: UINT;          { font height }
    rgwReserved: packed array[0..7] of UINT;{ for future use }
  end;

  PRectOfs = ^TRectOfs;
  TRectOfs = packed record    { 1.0 rectangle offset for nonisometric inflation }
    dLeft: Integer;                 { inflation leftwards from left side }
    dTop: Integer;                  { ditto upwards from top }
    dRight: Integer;                { ditto rightwards from right }
    dBottom: Integer;               { ditto downwards from bottom }
  end;

  PPenDataHeader = ^TPenDataHeader;
  TPenDataHeader = packed record { 1.0 main pen data header }
    wVersion: UINT;             { pen data format version }
    cbSizeUsed: UINT;           { size of pendata mem block in bytes }
    cStrokes: UINT;             { number of strokes (incl up-strokes) }
    cPnt: UINT;                 { count of all points }
    cPntStrokeMax: UINT;        { length (in points) of longest stroke }
    rectBound: TRect;            { bounding rect of all down points }
    wPndts: UINT;               { PDTS_xx bits }
    nInkWidth: Integer;             { ink width in pixels }
    rgbInk: DWORD;              { ink color }
  end;

  PStrokeInfo = ^TStrokeInfo;
  TStrokeInfo = packed record { 1.0 stroke header }
    cPnt: UINT;                 { count of points in stroke }
    cbPnts: UINT;               { size of stroke in bytes }
    wPdk: UINT;                 { state of stroke }
    dwTick: DWORD;              { time at beginning of stroke }
  end;

  PPenTip = ^TPenTip;
  TPenTip = packed record     { 2.0 Pen Tip characteristics }
    cbSize: DWORD;              { sizeof(PENTIP) }
    btype: BYTE;                { pen type/nib (calligraphic nib, etc.) }
    bwidth: BYTE;               { width of Nib (typically = nInkWidth) }
    bheight: BYTE;              { height of Nib }
    bOpacity: BYTE;             { 0=transparent, $80=hilite, $FF=opaque }
    rgb: COLORREF;              { pen color }
    dwFlags: DWORD;             { TIP_xx flags }
    dwReserved: DWORD;          { for future expansion }
  end;

  TFNAnimateProc = function(p1: HPENDATA; p2, p3: UINT; p4: PUINT;
    p5: LPARAM): BOOL stdcall;

  PAnimateInfo = ^TAnimateInfo;
  TAnimateInfo = packed record { 2.0 Animation parameters }
    cbSize: DWORD;              { sizeof(ANIMATEINFO) }
    uSpeedPct: UINT;            { speed percent to animate at }
    uPeriodCB: UINT;            { time between calls to callback in ms }
    fuFlags: UINT;              { animation flags }
    lParam: LPARAM;             { value to pass to callback }
    dwReserved: DWORD;          { reserved }
  end;

  POEMPenInfo = ^TOEMPenInfo;
  TOEMPenInfo = packed record { 1.0 OEM pen/tablet hdwe info }
    wPdt: UINT;                 { pen data type }
    wValueMax: UINT;            { largest val ret by device }
    wDistinct: UINT;            { number of distinct readings possible }
  end;

  PPenPacket = ^TPenPacket;
  TPenPacket = packed record
    wTabletX: UINT;             { x in raw coords }
    wTabletY: UINT;             { ditto y }
    wPDK: UINT;                 { state bits }
    rgwOemData: packed array[0..MAXOEMDATAWORDS-1] of UINT;{ OEM-specific data }
  end;

  POEMPenPacket = ^TOEMPenPacket;
  TOEMPenPacket = packed record
    wTabletX: UINT;             { x in raw coords }
    wTabletY: UINT;             { ditto y }
    wPDK: UINT;                 { state bits }
    rgwOemData: packed array[0..MAXOEMDATAWORDS-1] of UINT;{ OEM-specific data }
    dwTime: DWORD;
  end;

  PPenInfo = ^TPenInfo;
  TPenInfo = packed record    { 1.0 pen/tablet hdwe info }
    cxRawWidth: UINT;           { max x coord and tablet width in 0.001" }
    cyRawHeight: UINT;          { ditto y, height }
    wDistinctWidth: UINT;       { number of distinct x values tablet ret }
    wDistinctHeight: UINT;      { ditto y }
    nSamplingRate: Integer;         { samples / second }
    nSamplingDist: Integer;         { min distance to move before generating event }
    lPdc: Longint;                 { Pen Device Capabilities }
    cPens: Integer;                 { number of pens supported }
    cbOemData: Integer;             { width of OEM data packet }
    rgoempeninfo: packed array[0..MAXOEMDATAWORDS-1] of TOEMPenInfo;{ supported OEM data types }
    rgwReserved: packed array[0..6] of UINT;{ for internal use }
    fuOEM: UINT;                { which OEM data, timing, PDK_xx to report }
  end;

  PCalbStruct = ^TCalbStruct;
  TCalbStruct = packed record { 1.0 pen calibration }
    wOffsetX: Integer;
    wOffsetY: Integer;
    wDistinctWidth: Integer;
    wDistinctHeight: Integer;
  end;

  TFNRawHook = function(PenPacket: PPenPacket): BOOL stdcall;


{ Handwriting Recognizer: }

type
  HRC = Integer;
  HRCRESULT = Integer;
  HWL = Integer;
  HRECHOOK = Integer;
  HINKSET = Integer;

  PHRC = ^HRC;
  PHRCRESULT = ^HRCRESULT;
  PHWL = ^HWL;

  TFNHRCResultHookProc = function(p1: HREC; p2: HRC; p3, p4, p5: UINT;
    p6: Pointer): BOOL stdcall;

{ Inksets: }

  LPHINKSET = ^HINKSET;                                    { ptr to HINKSET }

  PInterval = ^TInterval;
  TInterval = packed record   { 2.0 interval structure for inksets }
    atBegin: TAbsTime;           { begining of 1-ms granularity interval }
    atEnd: TAbsTime;             { 1 ms past end of interval }
  end;

  PBoxResults = ^TBoxResults;
  TBoxResults = packed record { 2.0 }
    indxBox: UINT;
    hinksetBox: HINKSET;
    rgSyv: packed array[0..0] of SYV;
  end;

  PGuide = ^TGuide;
  TGuide = packed record      { 1.0 guide structure }
    xOrigin: Integer;               { left edge of first box (screen coord)) }
    yOrigin: Integer;               { ditto top edge }
    cxBox: Integer;                 { width of a single box }
    cyBox: Integer;                 { ditto height }
    cxBase: Integer;                { in-box x-margin to guideline }
    cyBase: Integer;                { in-box y offset from top to baseline }
    cHorzBox: Integer;              { count of boxed columns }
    cVertBox: Integer;              { ditto rows }
    cyMid: Integer;                 { 0 or distance from baseline to midline }
  end;

  PCtlInitIEdit = ^TCtlInitIEdit;
  TCtlInitIEdit = packed record { 2.0 init struct for Ink Edit }
    cbSize: DWORD;              { sizeof(CTLINITIEDIT) }
    hwnd: HWND;                 { IEdit window handle }
    id: Integer;                    { its ID }
    ieb: WORD;                  { IEB_* (background) bits }
    iedo: WORD;                 { IEDO_* (draw options) bits }
    iei: WORD;                  { IEI_* (ink input) bits }
    ien: WORD;                  { IEN_* (notification) bits }
    ierec: WORD;                { IEREC_* (recognition) bits }
    ies: WORD;                  { IES_* (style) bits }
    iesec: WORD;                { IESEC_* (security) bits }
    pdts: WORD;                 { initial pendata scale factor (PDTS_*) }
    hpndt: HPENDATA;            { initial pendata (or NULL if none) }
    hgdiobj: HGDIOBJ;           { background brush or bitmap handle }
    hpenGrid: HPEN;             { pen to use in drawing grid }
    ptOrgGrid: TPoint;          { grid lines point of origin }
    wVGrid: WORD;               { vertical gridline spacing }
    wHGrid: WORD;               { horizontal gridline spacing }
    dwApp: DWORD;               { application-defined data }
    dwReserved: DWORD;          { reserved for future use }
  end;

  PPDEvent = ^TPDEvent;
  TPDEvent = packed record    { 2.0 }
    cbSize: DWORD;              { sizeof(PDEVENT) }
    hwnd: HWND;                 { window handle of I-Edit }
    wm: UINT;                   { WM_* (window message) of event }
    wParam: WPARAM;             { wParam of message }
    lParam: LPARAM;             { lParam of message }
    pt: TPoint;                  { event pt in I-Edit client co-ords }
    fPen: BOOL;                 { TRUE if pen (or other inking device) }
    lExInfo: Longint;              { GetMessageExtraInfo() return value }
    dwReserved: DWORD;          { for future use }
  end;

  PStrkFmt = ^TStrkFmt;
  TStrkFmt = packed record    { 2.0 }
    cbSize: DWORD;              { sizeof(STRKFMT) }
    iesf: UINT;                 { stroke format flags and return bits }
    iStrk: UINT;                { stroke index if IESF_STROKE }
    tip: TPenTip;                { ink tip attributes }
    dwUser: DWORD;              { user data for strokes }
    dwReserved: DWORD;          { for future use }
  end;

  PPCMInfo = ^TPCMInfo;
  TPCMInfo = packed record    { 2.0 Pen Collection Mode Information }
    cbSize: DWORD;              { sizeof(PCMINFO) }
    dwPcm: DWORD;               { PCM_xxx flags }
    rectBound: TRect;            { if finish on pendown outside this rect }
    rectExclude: TRect;          { if finish on pendown inside this rect }
    hrgnBound: HRGN;            { if finish on pendown outside this region }
    hrgnExclude: HRGN;          { if finish on pendown inside this region }
    dwTimeout: DWORD;           { if finish after timeout, this many ms }
  end;

  PInkingInfo = ^TInkingInfo;
  TInkingInfo = packed record { 2.0 Pen Inking Information }
    cbSize: DWORD;              { sizeof(INKINGINFO) }
    wFlags: UINT;               { One of the PII_xx flags }
    tip: TPenTip;                { Pen type, size and color }
    rectClip: TRect;             { Clipping rect for the ink }
    rectInkStop: TRect;          { Rect in which a pen down stops inking }
    hrgnClip: HRGN;             { Clipping region for the ink }
    hrgnInkStop: HRGN;          { Region in which a pen down stops inking }
  end;

  PSYC = ^TSYC;
  TSYC = packed record        { 1.0 Symbol Correspondence for Ink }
    wStrokeFirst: UINT;         { first stroke, inclusive }
    wPntFirst: UINT;            { first point in first stroke, inclusive }
    wStrokeLast: UINT;          { last stroke, inclusive }
    wPntLast: UINT;             { last point in last stroke, inclusive }
    fLastSyc: BOOL;             { T: no more SYCs follow for current SYE }
  end;

  PSYE = ^TSYE;
  TSYE = packed record        { 1.0 Symbol Element }
    syv: SYV;                   { symbol value }
    lRecogVal: Longint;            { for internal use by recognizer }
    cl: CL;                     { confidence level }
    iSyc: Integer;                  { SYC index }
  end;

  PSYG = ^TSYG;
  TSYG = packed record        { 1.0 Symbol Graph }
    rgpntHotSpots: packed array[0..MAXHOTSPOT-1] of TPoint;{ hot spots (max 8) }
    cHotSpot: Integer;              { number of valid hot spots in rgpntHotSpots }
    nFirstBox: Integer;             { row-major index to box of 1st char in result }
    lRecogVal: Longint;            { reserved for use by recoognizer }
    lpsye: PSYE;               { nodes of symbol graph }
    cSye: Integer;                  { number of SYEs in symbol graph }
    lpsyc: PSYC;               { ptr to corresp symbol ink }
    cSyc: Integer;                  { ditto count }
  end;

  PRC = ^TRC;
  TRC = packed record         { 1.0 Recognition Context (RC) }
    hrec: HREC;                 { handle of recognizer to use }
    hwnd: HWND;                 { window to send results to }
    wEventRef: UINT;            { index into ink buffer }
    wRcPreferences: UINT;       { flags: RCP_xx Preferences }
    lRcOptions: Longint;           { RCO_xx options }
    lpfnYield: TFNRCYieldProc;     { procedure called during Yield() }
    lpUser: packed array[0..cbRcUserMax-1] of BYTE;{ current writer }
    wCountry: UINT;             { country code }
    wIntlPreferences: UINT;     { flags: RCIP_xx }
    lpLanguage: packed array[0..cbRcLanguageMax-1] of Char;{ language strings }
    rglpdf: packed array[0..MAXDICTIONARIES-1] of PFNLPDF;{ list of dictionary functions }
    wTryDictionary: UINT;       { max enumerations to search }
    clErrorLevel: CL;           { level where recognizer should reject input }
    alc: ALC;                   { enabled alphabet }
    alcPriority: ALC;           { prioritizes the ALC_ codes }
    rgbfAlc: packed array[0..cbRcrgbfAlcMax-1] of BYTE;{ bit field for enabled characters }
    wResultMode: UINT;          { RRM_xx when to send (asap or when complete) }
    wTimeOut: UINT;             { recognition timeout in ms }
    lPcm: Longint;                 { flags: PCM_xx for ending recognition }
    rectBound: TRect;            { bounding rect for inking (def:screen coords) }
    rectExclude: TRect;          { pen down inside this terminates recognition }
    guide: TGuide;               { struct: defines guidelines for recognizer }
    wRcOrient: UINT;            { RCOR_xx orientation of writing wrt tablet }
    wRcDirect: UINT;            { RCD_xx direction of writing }
    nInkWidth: Integer;             { ink width 0 (none) or 1..15 pixels }
    rgbInk: COLORREF;           { ink color }
    dwAppParam: DWORD;          { for application use }
    dwDictParam: DWORD;         { for app use to be passed on to dictionaries }
    dwRecognizer: DWORD;        { for app use to be passed on to recognizer }
    rgwReserved: packed array[0..cwRcReservedMax-1] of UINT;{ reserved for future use by Windows }
  end;

  PRCResult = ^TRCResult;
  TRCResult = packed record   { 1.0 Recognition Result }
    syg: TSYG;                   { symbol graph }
    wResultsType: UINT;         { see RCRT_xx }
    cSyv: Integer;                  { count of symbol values }
    lpsyv: PSYV;               { NULL-term ptr to recog's best guess }
    hSyv: THandle;               { globally-shared handle to lpsyv mem }
    nBaseLine: Integer;             { 0 or baseline of input writing }
    nMidLine: Integer;              { ditto midline }
    hpendata: HPENDATA;         { pen data mem }
    rectBoundInk: TRect;         { ink data bounds }
    pntEnd: TPoint;              { pt that terminated recog }
    lprc: PRC;                 { recog context used }
  end;

  TFNFuncResults = function(p1: PRCResult; p2: REC): Integer stdcall;

  PTarget = ^TTarget;
  TTarget = packed record     { 2.0 Geometry for a single target. }
    dwFlags: DWORD;             { individual target flags }
    idTarget: DWORD;            { TARGINFO.rgTarget[] index }
    htrgTarget: HTRG;           { HANDLE32 equiv }
    rectBound: TRect;           { Bounding rect of the target }
    dwData: DWORD;              { data collection info per target }
    rectBoundInk: TRect;        { Reserved for internal use, must be zero }
    rectBoundLastInk: TRect;    { Reserved for internal use, must be zero }
  end;

  PTargInfo = ^TTargInfo;
  TTargInfo = packed record   { 2.0 A set of targets }
    cbSize: DWORD;              { sizeof(TARGINFO) }
    dwFlags: DWORD;             { flags }
    htrgOwner: HTRG;            { HANDLE32 equiv }
    cTargets: WORD;             { count of targets }
    iTargetLast: WORD;          { last target, used by TargetPoints API }
{ if TPT_TEXTUAL flag is set }
    rgTarget: packed array[0..0] of TTarget;{ variable-length array of targets }
  end;

  PInpParams = ^TInpParams;
  TInpParams = packed record  { 2.0 }
    cbSize: DWORD;              { sizeof(INPPARAMS) }
    dwFlags: DWORD;
    hpndt: HPENDATA;
    target: TTarget;             { target structure }
  end;

  PSKBInfo = ^TSKBInfo;
  TSKBInfo = packed record
    handle: HWnd;
    nPad: Word;
    fVisible: Bool;
    fMinimized: Bool;
    hect: TRect;
    dwReserved: Longint;
  end;


{ Utility Functions }

{ Misc }
function FPenUpX(X: Integer): BOOL;
function GetWEventRef: Word;

{ ALC: }
function MpAlcB(lprc: PRC; i: Word): PByte;
function MpIbf(i: Word): Byte;
procedure SetAlcBitAnsi(lprc: PRC; i: Word);
procedure ResetAlcBitAnsi(lprc: PRC; i: Word);
function IsAlcBitAnsi(lprc: PRC; i: Word): Boolean;


{ draw 2.0 pendata using internal stroke formats: }
function DrawPenDataFmt(hdc: HDC; lprect: PRect; hpndt: THandle): Integer;


{ Handwriting Recognizer: }

{ Intervals: }

{ difference of two absolute times (at2 > at1 for positive result): }
function dwDiffAT(at1, at2: TAbsTime): Integer;

{ comparison of two absolute times (TRUE if at1 < at2): }
function FLTAbsTime(at1, at2: TAbsTime): Boolean;

function FLTEAbsTime(at1, at2: TAbsTime): Boolean;

function FEQAbsTime(at1, at2: TAbsTime): Boolean;

{ test if abstime is within an interval: }
function FAbsTimeInInterval(at: TAbsTime; lpi: PInterval): Boolean;

{ test if interval (lpiT) is within an another interval (lpiS): }
function FIntervalInInterval(lpiT, lpiS: PInterval): Boolean;

{ test if interval (lpiT) intersects another interval (lpiS): }
function FIntervalXInterval(lpiT, lpiS: PInterval): Boolean;

{ duration of an PInterval in ms: }
function dwDurInterval(lpi: PInterval): Integer;

{ fill a pointer to an ABSTIME structure from a count of seconds and ms: }
procedure MakeAbsTime(var lpat: TAbsTime; sec, ms: Integer);

{ SYV functions: }

function FIsSpecial(syv: DWORD): Boolean;
function FIsAnsi(syv: DWORD): Boolean;
function FIsGesture(syv: DWORD): Boolean;
function FIsKanji(syv: DWORD): Boolean;
function FIsShape(syv: DWORD): Boolean;
function FIsUniCode(syv: DWORD): Boolean;
function FIsVKey(syv: DWORD): Boolean;

function ChSyvToAnsi(syv: DWORD): Byte;
function WSyvToKanji(syv: DWORD): Word;
function SyvCharacterToSymbol(c: Char): DWORD;
function SyvKanjiToSymbol(c: Char): DWORD;

function FIsSelectGesture(syv: DWORD): Boolean;
function FIsStdGesture(syv: DWORD): Boolean;
function FIsAnsiGesture(syv: DWORD): Boolean;

function SubPenMsgFromWpLp(wp, lp: DWORD): Word;
function EventRefFromWpLp(wp, lp: DWORD): Word;
function TerminationFromWpLp(wp, lp: DWORD): Integer;

function HwndFromHtrg(trg: HTRG): HWND;
function HpcmFromWpLp(wp, lp: DWORD): Integer;
function HtrgFromHwnd(hwnd: HWND): HTRG;


{ APIs and Prototypes }

{ PenData: }
function AddPointsPenData(p1: HPENDATA; p2: PPoint; p3: Pointer;
  p4: PStrokeInfo): HPENDATA; stdcall;
function CompressPenData(p1: HPENDATA; p2: UINT; p3: DWORD): Integer; stdcall;
function CreatePenDataEx(p1: PPenInfo; p2: UINT; p3: UINT;
  p4: UINT): HPENDATA; stdcall;
function CreatePenDataRegion(p1: HPENDATA; p2: UINT): HRGN; stdcall;
function DestroyPenData(p1: HPENDATA): BOOL; stdcall;
function DrawPenDataEx(p1: HDC; p2: PRect; p3: HPENDATA; p4: UINT; p5: UINT;
  p6: UINT; p7: UINT; p8: TFNAnimateProc; p9: PAnimateInfo;
  p10: UINT): Integer; stdcall;
function DuplicatePenData(p1: HPENDATA; p2: UINT): HPENDATA; stdcall;
function ExtractPenDataPoints(p1: HPENDATA; p2: UINT; p3: UINT; p4: UINT;
  p5: PPoint; p6: Pointer; p7: UINT): Integer; stdcall;
function ExtractPenDataStrokes(p1: HPENDATA; p2: UINT; p3: LPARAM;
  p4: PHPENDATA; p5: UINT): Integer; stdcall;
function GetPenDataAttributes(p1: HPENDATA; p2: Pointer; p3: UINT): Integer; stdcall;
function GetPenDataInfo(p1: HPENDATA; p2: PPENDATAHEADER; p3: PPenInfo;
  p4: DWORD): BOOL; stdcall;
function GetPointsFromPenData(p1: HPENDATA; p2: UINT; p3: UINT; p4: UINT;
  p5: PPoint): BOOL; stdcall;
function GetStrokeAttributes(p1: HPENDATA; p2: UINT; p3: Pointer;
  p4: UINT): Integer; stdcall;
function GetStrokeTableAttributes(p1: HPENDATA; p2: UINT; p3: Pointer;
  p4: UINT): Integer; stdcall;
function HitTestPenData(p1: HPENDATA; p2: PPoint; p3: UINT; p4: PUINT;
  p5: PUINT): Integer; stdcall;
function InsertPenData(p1: HPENDATA; p2: HPENDATA; p3: UINT): Integer; stdcall;
function InsertPenDataPoints(p1: HPENDATA; p2: UINT; p3: UINT; p4: UINT;
  p5: PPoint; p6: Pointer): Integer; stdcall;
function InsertPenDataStroke(p1: HPENDATA; p2: UINT; p3: PPoint; p4: Pointer;
  p5: PStrokeInfo): Integer; stdcall;
function MetricScalePenData(p1: HPENDATA; p2: UINT): BOOL; stdcall;
function OffsetPenData(p1: HPENDATA; p2: Integer; p3: Integer): BOOL; stdcall;
function PenDataFromBuffer(p1: PHPENDATA; p2: UINT; p3: PByte; p4: Longint;
  p5: PDWORD): Longint; stdcall;
function PenDataToBuffer(p1: HPENDATA; p2: PByte; p3: Longint;
  p4: PDWORD): Longint; stdcall;
function RedisplayPenData(p1: HDC; p2: HPENDATA; p3: PPoint; p4: PPoint;
  p5: Integer; p6: DWORD): BOOL; stdcall;
function RemovePenDataStrokes(p1: HPENDATA; p2: UINT; p3: UINT): Integer; stdcall;
function ResizePenData(p1: HPENDATA; p2: PRect): BOOL; stdcall;
function SetStrokeAttributes(p1: HPENDATA; p2: UINT; p3: LPARAM;
  p4: UINT): Integer; stdcall;
function SetStrokeTableAttributes(p1: HPENDATA; p2: UINT; p3: LPARAM;
  p4: UINT): Integer; stdcall;
function TrimPenData(p1: HPENDATA; p2: DWORD; p3: DWORD): Integer; stdcall;


{ Pen Hardware/Driver: }
function GetPenAsyncState(p1: UINT): BOOL; stdcall;
function IsPenEvent(p1: UINT; p2: Longint): BOOL; stdcall;


{ Handwriting Recognizer: }
function AddPenDataHRC(p1: HRC; p2: HPENDATA): Integer; stdcall;
function AddPenInputHRC(p1: HRC; p2: PPoint; p3: Pointer; p4: UINT;
  p5: PStrokeInfo): Integer; stdcall;
function AddWordsHWL(p1: HWL; p2: LPSTR; p3: UINT): Integer; stdcall;
function ConfigHREC(p1: HREC; p2: UINT; p3: WPARAM; p4: LPARAM): Integer; stdcall;
function CreateCompatibleHRC(p1: HRC; p2: HREC): HRC; stdcall;
function CreateHWL(p1: HREC; p2: LPSTR; p3: UINT; p4: DWORD): HWL; stdcall;
function CreateInksetHRCRESULT(p1: HRCRESULT; p2: UINT;
  p3: UINT): HINKSET; stdcall;
function CreatePenDataHRC(p1: HRC): HPENDATA; stdcall;
function DestroyHRC(p1: HRC): Integer; stdcall;
function DestroyHRCRESULT(p1: HRCRESULT): Integer; stdcall;
function DestroyHWL(p1: HWL): Integer; stdcall;
function EnableGestureSetHRC(p1: HRC; p2: SYV; p3: BOOL): Integer; stdcall;
function EnableSystemDictionaryHRC(p1: HRC; p2: BOOL): Integer; stdcall;
function EndPenInputHRC(p1: HRC): Integer; stdcall;
function GetAlphabetHRC(p1: HRC; p2: PALC; p3: PByte): Integer; stdcall;
function GetAlphabetPriorityHRC(p1: HRC; p2: PALC; p3: PByte): Integer; stdcall;
function GetAlternateWordsHRCRESULT(p1: HRCRESULT; p2: UINT; p3: UINT;
  p4: PHRCRESULT; p5: UINT): Integer; stdcall;
function GetBoxMappingHRCRESULT(p1: HRCRESULT; p2, p3: UINT;
  p4: PUINT): Integer; stdcall;
function GetBoxResultsHRC(p1: HRC; p2, p3, p4: UINT;
  p5: PBoxResults; p6: BOOL): Integer; stdcall;
function GetGuideHRC(p1: HRC; p2: PGuide; p3: PUINT): Integer; stdcall;
function GetHotspotsHRCRESULT(p1: HRCRESULT; p2: UINT; p3: PPoint;
  p4: UINT): Integer; stdcall;
function GetHRECFromHRC(p1: HRC): HREC; stdcall;
function GetInternationalHRC(p1: HRC; p2: PUINT; p3: LPSTR; p4: PUINT;
  p5: PUINT): Integer; stdcall;
function GetMaxResultsHRC(p1: HRC): Integer; stdcall;
function GetResultsHRC(p1: HRC; p2: UINT; p3: PHRCRESULT;
  p4: UINT): Integer; stdcall;
function GetSymbolCountHRCRESULT(p1: HRCRESULT): Integer; stdcall;
function GetSymbolsHRCRESULT(p1: HRCRESULT; p2: UINT; p3: PSYV;
  p4: UINT): Integer; stdcall;
function GetWordlistHRC(p1: HRC; p2: PHWL): Integer; stdcall;
function GetWordlistCoercionHRC(p1: HRC): Integer; stdcall;
function ProcessHRC(p1: HRC; p2: DWORD): Integer; stdcall;
function ReadHWL(p1: HWL; p2: HFILE): Integer; stdcall;
function SetAlphabetHRC(p1: HRC; p2: ALC; p3: PByte): Integer; stdcall;
function SetAlphabetPriorityHRC(p1: HRC; p2: ALC; p3: PByte): Integer; stdcall;
function SetBoxAlphabetHRC(p1: HRC; p2: PALC; p3: UINT): Integer; stdcall;
function SetGuideHRC(p1: HRC; p2: PGuide; p3: UINT): Integer; stdcall;
function SetInternationalHRC(p1: HRC; p2: UINT; p3: LPCSTR; p4: UINT;
  p5: UINT): Integer; stdcall;
function SetMaxResultsHRC(p1: HRC; p2: UINT): Integer; stdcall;
function SetResultsHookHREC(p1: HREC; var p2: TFNHRCResultHookProc): HRECHOOK; stdcall;
function SetWordlistCoercionHRC(p1: HRC; p2: UINT): Integer; stdcall;
function SetWordlistHRC(p1: HRC; p2: HWL): Integer; stdcall;
function TrainHREC(p1: HREC; p2: PSYV; p3: UINT; p4: HPENDATA;
  p5: UINT): Integer; stdcall;
function UnhookResultsHookHREC(p1: HREC; p2: HRECHOOK): Integer; stdcall;
function WriteHWL(p1: HWL; p2: HFILE): Integer; stdcall;

{ Recognizer Installation: }
function InstallRecognizer(p1: LPSTR): HREC; stdcall;
function UninstallRecognizer(p1: HREC): Pointer; stdcall;

{ Inksets: }
function AddInksetInterval(p1: HINKSET; p2: PInterval): BOOL; stdcall;
function CreateInkset(p1: UINT): HINKSET; stdcall;
function DestroyInkset(p1: HINKSET): BOOL; stdcall;
function GetInksetInterval(p1: HINKSET; p2: UINT; p3: PInterval): Integer; stdcall;
function GetInksetIntervalCount(p1: HINKSET): Integer; stdcall;

{ Symbol Values: }
function CharacterToSymbol(p1: LPSTR; p2: Integer; p3: PSYV): Integer; stdcall;
function SymbolToCharacter(p1: PSYV; p2: Integer; p3: LPSTR;
  p4: PINT): BOOL; stdcall;


{ Pen Input/Inking: }
function DoDefaultPenInput(p1: HWND; p2: UINT): Integer; stdcall;
function GetPenInput(p1: HPCM; p2: PPoint; p3: Pointer; p4: UINT; p5: UINT;
  p6: PStrokeInfo): Integer; stdcall;
function PeekPenInput(p1: HPCM; p2: UINT; p3: PPoint; p4: Pointer;
  p5: UINT): Integer; stdcall;
function StartInking(p1: HPCM; p2: UINT; p3: PInkingInfo): Integer; stdcall;
function StartPenInput(p1: HWND; p2: UINT; p3: PPCMInfo;
  p4: PINT): HPCM; stdcall;
function StopInking(p1: HPCM): Integer; stdcall;
function StopPenInput(p1: HPCM; p2: UINT; p3: Integer): Integer; stdcall;


{ Miscellaneous/Utilities: }
function BoundingRectFromPoints(p1: PPoint; p2: UINT;
  p3: PRect): Pointer; stdcall;
function DPtoTP(p1: PPoint; p2: Integer): BOOL; stdcall;
function GetPenAppFlags: UINT; stdcall;
function SetPenAppFlags(p1: UINT; p2: UINT): Pointer; stdcall;
function GetPenMiscInfo(p1: WPARAM; p2: LPARAM): Longint; stdcall;
function GetVersionPenWin: UINT; stdcall;
function SetPenMiscInfo(p1: WPARAM; p2: LPARAM): Longint; stdcall;
function TPtoDP(p1: PPoint; p2: Integer): BOOL; stdcall;
function CorrectWriting(p1: HWND; p2: LPSTR; p3: UINT; p4: Pointer; p5: DWORD;
  p6: DWORD): BOOL; stdcall;

{ Ink Targeting: }
function TargetPoints(p1: PTargInfo; p2: PPoint; p3: DWORD; p4: UINT;
  p5: PStrokeInfo): Integer; stdcall;

{ Kanji }
function KKConvert(hwndConvert: HWND; hwndCaller: HWND; lpBuf: LPSTR;
  cbBuf: UINT; lpPnt: PPoint): BOOL; stdcall;

implementation

const
  penwin32 = 'penwin32.dll';

function AddInksetInterval;             external penwin32 name 'AddInksetInterval';
function AddPenDataHRC;                 external penwin32 name 'AddPenDataHRC';
function AddPenInputHRC;                external penwin32 name 'AddPenInputHRC';
function AddPointsPenData;              external penwin32 name 'AddPointsPenData';
function AddWordsHWL;                   external penwin32 name 'AddWordsHWL';
function BoundingRectFromPoints;        external penwin32 name 'BoundingRectFromPoints';
function CharacterToSymbol;             external penwin32 name 'CharacterToSymbol';
function CompressPenData;               external penwin32 name 'CompressPenData';
function ConfigHREC;                    external penwin32 name 'ConfigHREC';
function CorrectWriting;                external penwin32 name 'CorrectWriting';
function CreateCompatibleHRC;           external penwin32 name 'CreateCompatibleHRC';
function CreateHWL;                     external penwin32 name 'CreateHWL';
function CreateInkset;                  external penwin32 name 'CreateInkset';
function CreateInksetHRCRESULT;         external penwin32 name 'CreateInksetHRCRESULT';
function CreatePenDataEx;               external penwin32 name 'CreatePenDataEx';
function CreatePenDataHRC;              external penwin32 name 'CreatePenDataHRC';
function CreatePenDataRegion;           external penwin32 name 'CreatePenDataRegion';
function DestroyHRC;                    external penwin32 name 'DestroyHRC';
function DestroyHRCRESULT;              external penwin32 name 'DestroyHRCRESULT';
function DestroyHWL;                    external penwin32 name 'DestroyHWL';
function DestroyInkset;                 external penwin32 name 'DestroyInkset';
function DestroyPenData;                external penwin32 name 'DestroyPenData';
function DoDefaultPenInput;             external penwin32 name 'DoDefaultPenInput';
function DPtoTP;                        external penwin32 name 'DPtoTP';
function DrawPenDataEx;                 external penwin32 name 'DrawPenDataEx';
function DuplicatePenData;              external penwin32 name 'DuplicatePenData';
function EnableGestureSetHRC;           external penwin32 name 'EnableGestureSetHRC';
function EnableSystemDictionaryHRC;     external penwin32 name 'EnableSystemDictionaryHRC';
function EndPenInputHRC;                external penwin32 name 'EndPenInputHRC';
function ExtractPenDataPoints;          external penwin32 name 'ExtractPenDataPoints';
function ExtractPenDataStrokes;         external penwin32 name 'ExtractPenDataStrokes';
function GetAlphabetHRC;                external penwin32 name 'GetAlphabetHRC';
function GetAlphabetPriorityHRC;        external penwin32 name 'GetAlphabetPriorityHRC';
function GetAlternateWordsHRCRESULT;    external penwin32 name 'GetAlternateWordsHRCRESULT';
function GetBoxMappingHRCRESULT;        external penwin32 name 'GetBoxMappingHRCRESULT';
function GetBoxResultsHRC;              external penwin32 name 'GetBoxResultsHRC';
function GetGuideHRC;                   external penwin32 name 'GetGuideHRC';
function GetHotspotsHRCRESULT;          external penwin32 name 'GetHotspotsHRCRESULT';
function GetHRECFromHRC;                external penwin32 name 'GetHRECFromHRC';
function GetInksetInterval;             external penwin32 name 'GetInksetInterval';
function GetInksetIntervalCount;        external penwin32 name 'GetInksetIntervalCount';
function GetInternationalHRC;           external penwin32 name 'GetInternationalHRC';
function GetMaxResultsHRC;              external penwin32 name 'GetMaxResultsHRC';
function GetPenAppFlags;                external penwin32 name 'GetPenAppFlags';
function GetPenAsyncState;              external penwin32 name 'GetPenAsyncState';
function GetPenDataAttributes;          external penwin32 name 'GetPenDataAttributes';
function GetPenDataInfo;                external penwin32 name 'GetPenDataInfo';
function GetPenInput;                   external penwin32 name 'GetPenInput';
function GetPenMiscInfo;                external penwin32 name 'GetPenMiscInfo';
function GetPointsFromPenData;          external penwin32 name 'GetPointsFromPenData';
function GetResultsHRC;                 external penwin32 name 'GetResultsHRC';
function GetStrokeAttributes;           external penwin32 name 'GetStrokeAttributes';
function GetStrokeTableAttributes;      external penwin32 name 'GetStrokeTableAttributes';
function GetSymbolCountHRCRESULT;       external penwin32 name 'GetSymbolCountHRCRESULT';
function GetSymbolsHRCRESULT;           external penwin32 name 'GetSymbolsHRCRESULT';
function GetVersionPenWin;              external penwin32 name 'GetVersionPenWin';
function GetWordlistCoercionHRC;        external penwin32 name 'GetWordlistCoercionHRC';
function GetWordlistHRC;                external penwin32 name 'GetWordlistHRC';
function HitTestPenData;                external penwin32 name 'HitTestPenData';
function InsertPenData;                 external penwin32 name 'InsertPenData';
function InsertPenDataPoints;           external penwin32 name 'InsertPenDataPoints';
function InsertPenDataStroke;           external penwin32 name 'InsertPenDataStroke';
function InstallRecognizer;             external penwin32 name 'InstallRecognizer';
function IsPenEvent;                    external penwin32 name 'IsPenEvent';
function KKConvert;                     external penwin32 name 'KKConvert';
function MetricScalePenData;            external penwin32 name 'MetricScalePenData';
function OffsetPenData;                 external penwin32 name 'OffsetPenData';
function PeekPenInput;                  external penwin32 name 'PeekPenInput';
function PenDataFromBuffer;             external penwin32 name 'PenDataFromBuffer';
function PenDataToBuffer;               external penwin32 name 'PenDataToBuffer';
function ProcessHRC;                    external penwin32 name 'ProcessHRC';
function ReadHWL;                       external penwin32 name 'ReadHWL';
function RedisplayPenData;              external penwin32 name 'RedisplayPenData';
function RemovePenDataStrokes;          external penwin32 name 'RemovePenDataStrokes';
function ResizePenData;                 external penwin32 name 'ResizePenData';
function SetAlphabetHRC;                external penwin32 name 'SetAlphabetHRC';
function SetAlphabetPriorityHRC;        external penwin32 name 'SetAlphabetPriorityHRC';
function SetBoxAlphabetHRC;             external penwin32 name 'SetBoxAlphabetHRC';
function SetGuideHRC;                   external penwin32 name 'SetGuideHRC';
function SetInternationalHRC;           external penwin32 name 'SetInternationalHRC';
function SetMaxResultsHRC;              external penwin32 name 'SetMaxResultsHRC';
function SetPenAppFlags;                external penwin32 name 'SetPenAppFlags';
function SetPenMiscInfo;                external penwin32 name 'SetPenMiscInfo';
function SetResultsHookHREC;            external penwin32 name 'SetResultsHookHREC';
function SetStrokeAttributes;           external penwin32 name 'SetStrokeAttributes';
function SetStrokeTableAttributes;      external penwin32 name 'SetStrokeTableAttributes';
function SetWordlistCoercionHRC;        external penwin32 name 'SetWordlistCoercionHRC';
function SetWordlistHRC;                external penwin32 name 'SetWordlistHRC';
function StartInking;                   external penwin32 name 'StartInking';
function StartPenInput;                 external penwin32 name 'StartPenInput';
function StopInking;                    external penwin32 name 'StopInking';
function StopPenInput;                  external penwin32 name 'StopPenInput';
function SymbolToCharacter;             external penwin32 name 'SymbolToCharacter';
function TargetPoints;                  external penwin32 name 'TargetPoints';
function TPtoDP;                        external penwin32 name 'TPtoDP';
function TrainHREC;                     external penwin32 name 'TrainHREC';
function TrimPenData;                   external penwin32 name 'TrimPenData';
function UnhookResultsHookHREC;         external penwin32 name 'UnhookResultsHookHREC';
function UninstallRecognizer;           external penwin32 name 'UninstallRecognizer';
function WriteHWL;                      external penwin32 name 'WriteHWL';

function FPenUpX(X: Integer): BOOL;
begin
  Result := (X and BITPENUP) <> 0;
end;

function GetWEventRef: Word;
begin
  Result := Word(GetMessageExtraInfo);
end;

function MpAlcB(lprc: PRC; i: Word): PByte;
begin
  Result := @lprc^.rgbfAlc[ (i and $FF) shr 3 ];
end;

function MpIbf(i: Word): Byte;
begin
  Result := 1 shl (i and 7);
end;

procedure SetAlcBitAnsi(lprc: PRC; i: Word);
var
  P: PByte;
begin
  P := MpAlcB(lprc, i);
  P^ := P^ or MpIbf(i);
end;

procedure ResetAlcBitAnsi(lprc: PRC; i: Word);
var
  P: PByte;
begin
  P := MpAlcB(lprc, i);
  P^ := P^ and not MpIbf(i);
end;

function IsAlcBitAnsi(lprc: PRC; i: Word): Boolean;
begin
  Result := MpAlcB(lprc,i)^ and MpIbf(i) <> 0;
end;

function DrawPenDataFmt(hdc: HDC; lprect: PRect; hpndt: THandle): Integer;
begin
  Result := DrawPenDataEx(hdc, lprect, hpndt, 0, IX_END, 0, IX_END, nil, nil, 0);
end;

function dwDiffAT(at1, at2: TAbsTime): Integer;
begin
  Result := 1000 * (at2.sec - at1.sec) - (at1.ms + at2.ms);
end;

function FLTAbsTime(at1, at2: TAbsTime): Boolean;
begin
  Result := (at1.sec < at2.sec) or ((at1.sec = at2.sec) and (at1.ms < at2.ms));
end;

function FLTEAbsTime(at1, at2: TAbsTime): Boolean;
begin
  Result := (at1.sec < at2.sec) or ((at1.sec = at2.sec) and (at1.ms <= at2.ms));
end;

function FEQAbsTime(at1, at2: TAbsTime): Boolean;
begin
  Result := (at1.sec = at2.sec) and (at1.ms = at2.ms);
end;

function FAbsTimeInInterval(at: TAbsTime; lpi: PInterval): Boolean;
begin
  Result := FLTEAbsTime(lpi^.atBegin, at) and FLTEAbsTime(at, lpi^.atEnd);
end;

function FIntervalInInterval(lpiT, lpiS: PInterval): Boolean;
begin
  Result := FLTEAbsTime(lpiS^.atBegin, lpiT^.atBegin) and
    FLTEAbsTime(lpiT^.atEnd, lpiS^.atEnd);
end;

function FIntervalXInterval(lpiT, lpiS: PInterval): Boolean;
begin
  Result := (not FLTAbsTime(lpiT^.atEnd, lpiS^.atBegin)) or
     FLTAbsTime(lpiS^.atEnd, lpiT^.atBegin);
end;

function dwDurInterval(lpi: PInterval): Integer;
begin
  Result := dwDiffAT(lpi^.atBegin, lpi^.atEnd);
end;

procedure MakeAbsTime(var lpat: TAbsTime; sec, ms: Integer);
begin
  lpat.sec := sec + ms div 1000;
  lpat.ms := ms mod 1000;
end;

function FIsSpecial(syv: DWORD): Boolean;
begin
  Result := HiWord(syv) = SYVHI_SPECIAL;
end;

function FIsAnsi(syv: DWORD): Boolean;
begin
  Result := HiWord(syv) = SYVHI_ANSI;
end;

function FIsGesture(syv: DWORD): Boolean;
begin
  Result := HiWord(syv) = SYVHI_GESTURE;
end;

function FIsKanji(syv: DWORD): Boolean;
begin
  Result := HiWord(syv) = SYVHI_KANJI;
end;

function FIsShape(syv: DWORD): Boolean;
begin
  Result := HiWord(syv) = SYVHI_SHAPE;
end;

function FIsUniCode(syv: DWORD): Boolean;
begin
  Result := HiWord(syv) = SYVHI_UNICODE;
end;

function FIsVKey(syv: DWORD): Boolean;
begin
  Result := HiWord(syv) = SYVHI_VKEY;
end;

function ChSyvToAnsi(syv: DWORD): Byte;
begin
  Result := Byte(LOWORD(syv));
end;

function WSyvToKanji(syv: DWORD): Word;
begin
  Result := LOWORD(syv);
end;

function SyvCharacterToSymbol(c: Char): DWORD;
begin
  Result := Byte(c) or $10000;
end;

function SyvKanjiToSymbol(c: Char): DWORD;
begin
  Result := Byte(c) or $30000;
end;

function FIsSelectGesture(syv: DWORD): Boolean;
begin
  Result := (syv >= SYV_SELECTFIRST) and (syv <= SYV_SELECTLAST);
end;

function FIsStdGesture(syv: DWORD): Boolean;
begin
  Result := FIsSelectGesture(syv) or (syv = SYV_CLEAR) or (syv = SYV_HELP) or
    (syv = SYV_EXTENDSELECT) or (syv = SYV_UNDO) or (syv = SYV_COPY) or
    (syv = SYV_CUT) or (syv = SYV_PASTE) or (syv = SYV_CLEARWORD) or
    (syv = SYV_KKCONVERT) or (syv = SYV_USER) or (syv = SYV_CORRECT);
end;

function FIsAnsiGesture(syv: DWORD): Boolean;
begin
  Result := (syv = SYV_BACKSPACE) or (syv = SYV_TAB) or
    (syv = SYV_RETURN) or (syv = SYV_SPACE);
end;

function SubPenMsgFromWpLp(wp, lp: DWORD): Word;
begin
  Result := LOWORD(wp);
end;

function EventRefFromWpLp(wp, lp: DWORD): Word;
begin
  Result := HiWord(wp);
end;

function TerminationFromWpLp(wp, lp: DWORD): Integer;
begin
  Result := HiWord(wp);
end;

function HpcmFromWpLp(wp, lp: DWORD): Integer;
begin
  Result := HPCM(lp);
end;

function HwndFromHtrg(trg: HTRG): HWND;
begin
  Result := HWND(trg);
end;

function HtrgFromHwnd(hwnd: HWND): HTRG;
begin
  Result := HTRG(hwnd);
end;

end.
