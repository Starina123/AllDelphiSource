{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

type
   nl_item = Integer;
   {$EXTERNALSYM nl_item}
   
const
  CODESET: nl_item = 14;
  {$EXTERNALSYM CODESET}
  D_T_FMT: nl_item = 131112;
  {$EXTERNALSYM D_T_FMT}
  D_FMT: nl_item = 131113;
  {$EXTERNALSYM D_FMT}
  T_FMT: nl_item = 131114;
  {$EXTERNALSYM T_FMT}
  T_FMT_AMPM: nl_item = 131115;
  {$EXTERNALSYM T_FMT_AMPM}
  AM_STR: nl_item = 131110;
  {$EXTERNALSYM AM_STR}
  PM_STR: nl_item = 131111;
  {$EXTERNALSYM PM_STR}
  DAY_1: nl_item = 131079;
  {$EXTERNALSYM DAY_1}
  DAY_2: nl_item = 131080;
  {$EXTERNALSYM DAY_2}
  DAY_3: nl_item = 131081;
  {$EXTERNALSYM DAY_3}
  DAY_4: nl_item = 131082;
  {$EXTERNALSYM DAY_4}
  DAY_5: nl_item = 131083;
  {$EXTERNALSYM DAY_5}
  DAY_6: nl_item = 131084;
  {$EXTERNALSYM DAY_6}
  DAY_7: nl_item = 131085;
  {$EXTERNALSYM DAY_7}
  ABDAY_1: nl_item = 131072;
  {$EXTERNALSYM ABDAY_1}
  ABDAY_2: nl_item = 131073;
  {$EXTERNALSYM ABDAY_2}
  ABDAY_3: nl_item = 131074;
  {$EXTERNALSYM ABDAY_3}
  ABDAY_4: nl_item = 131075;
  {$EXTERNALSYM ABDAY_4}
  ABDAY_5: nl_item = 131076;
  {$EXTERNALSYM ABDAY_5}
  ABDAY_6: nl_item = 131077;
  {$EXTERNALSYM ABDAY_6}
  ABDAY_7: nl_item = 131078;
  {$EXTERNALSYM ABDAY_7}
  MON_1: nl_item = 131098;
  {$EXTERNALSYM MON_1}
  MON_2: nl_item = 131099;
  {$EXTERNALSYM MON_2}
  MON_3: nl_item = 131100;
  {$EXTERNALSYM MON_3}
  MON_4: nl_item = 131101;
  {$EXTERNALSYM MON_4}
  MON_5: nl_item = 131102;
  {$EXTERNALSYM MON_5}
  MON_6: nl_item = 131103;
  {$EXTERNALSYM MON_6}
  MON_7: nl_item = 131104;
  {$EXTERNALSYM MON_7}
  MON_8: nl_item = 131105;
  {$EXTERNALSYM MON_8}
  MON_9: nl_item = 131106;
  {$EXTERNALSYM MON_9}
  MON_10: nl_item = 131107;
  {$EXTERNALSYM MON_10}
  MON_11: nl_item = 131108;
  {$EXTERNALSYM MON_11}
  MON_12: nl_item = 131109;
  {$EXTERNALSYM MON_12}
  ABMON_1: nl_item = 131086;
  {$EXTERNALSYM ABMON_1}
  ABMON_2: nl_item = 131087;
  {$EXTERNALSYM ABMON_2}
  ABMON_3: nl_item = 131088;
  {$EXTERNALSYM ABMON_3}
  ABMON_4: nl_item = 131089;
  {$EXTERNALSYM ABMON_4}
  ABMON_5: nl_item = 131090;
  {$EXTERNALSYM ABMON_5}
  ABMON_6: nl_item = 131091;
  {$EXTERNALSYM ABMON_6}
  ABMON_7: nl_item = 131092;
  {$EXTERNALSYM ABMON_7}
  ABMON_8: nl_item = 131093;
  {$EXTERNALSYM ABMON_8}
  ABMON_9: nl_item = 131094;
  {$EXTERNALSYM ABMON_9}
  ABMON_10: nl_item = 131095;
  {$EXTERNALSYM ABMON_10}
  ABMON_11: nl_item = 131096;
  {$EXTERNALSYM ABMON_11}
  ABMON_12: nl_item = 131097;
  {$EXTERNALSYM ABMON_12}
  ERA: nl_item = 131116;
  {$EXTERNALSYM ERA}
  ERA_YEAR: nl_item = 131117;
  {$EXTERNALSYM ERA_YEAR}
  ERA_D_FMT: nl_item = 131118;
  {$EXTERNALSYM ERA_D_FMT}
  ERA_D_T_FMT: nl_item = 131120;
  {$EXTERNALSYM ERA_D_T_FMT}
  ERA_T_FMT: nl_item = 131121;
  {$EXTERNALSYM ERA_T_FMT}
  ALT_DIGITS: nl_item = 131119;
  {$EXTERNALSYM ALT_DIGITS}
  RADIXCHAR: nl_item = 65536;
  {$EXTERNALSYM RADIXCHAR}
  THOUSEP: nl_item = 65537;
  {$EXTERNALSYM THOUSEP}
  YESEXPR: nl_item = 327680;
  {$EXTERNALSYM YESEXPR}
  NOEXPR: nl_item = 327681;
  {$EXTERNALSYM NOEXPR}
  CRNCYSTR: nl_item = 262159;
  {$EXTERNALSYM CRNCYSTR}

{$IFDEF LINUX}
  _NL_TIME_ERA_NUM_ENTRIES: nl_item = 131122;    // Number entries in the era arrays.
  {$EXTERNALSYM _NL_TIME_ERA_NUM_ENTRIES}
  _NL_TIME_ERA_ENTRIES    : nl_item = 131123;    // Structure with era entries in usable form.
  {$EXTERNALSYM _NL_TIME_ERA_ENTRIES}
  _NL_WABDAY_1 : nl_item = 131124;    //
  {$EXTERNALSYM _NL_WABDAY_1}
  _NL_WABDAY_2 : nl_item = 131125;    //
  {$EXTERNALSYM _NL_WABDAY_2}
  _NL_WABDAY_3 : nl_item = 131126;    //
  _NL_WABDAY_4 : nl_item = 131127;    //
  _NL_WABDAY_5 : nl_item = 131128;    //
  _NL_WABDAY_6 : nl_item = 131129;    //
  _NL_WABDAY_7 : nl_item = 131130;    //
  _NL_WDAY_1 : nl_item = 131131;    //
  _NL_WDAY_2 : nl_item = 131132;    //
{$ENDIF}

