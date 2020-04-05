{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{ Macros used as `request' argument to `ioctl'.  }
const
  __SID        = (Ord('S') shl 8);
  {$EXTERNALSYM __SID}

  I_NREAD      = (__SID or 1);     { Counts the number of data bytes in the data
                                     block in the first message.  }
  {$EXTERNALSYM I_NREAD}
  I_PUSH       = (__SID or 2);     { Push STREAMS module onto top of the current
                                     STREAM, just below the STREAM head.  }
  {$EXTERNALSYM I_PUSH}
  I_POP        = (__SID or 3);     { Remove STREAMS module from just below the
                                     STREAM head.  }
  {$EXTERNALSYM I_POP}
  I_LOOK       = (__SID or 4);     { Retrieve the name of the module just below
                                     the STREAM head and place it in a character
                                     string.  }
  {$EXTERNALSYM I_LOOK}
  I_FLUSH      = (__SID or 5);     { Flush all input and/or output.  }
  {$EXTERNALSYM I_FLUSH}
  I_SRDOPT     = (__SID or 6);     { Sets the read mode.  }
  {$EXTERNALSYM I_SRDOPT}
  I_GRDOPT     = (__SID or 7);     { Returns the current read mode setting.  }
  {$EXTERNALSYM I_GRDOPT}
  I_STR        = (__SID or 8);     { Construct an internal STREAMS `ioctl'
                                     message and send that message downstream. }
  {$EXTERNALSYM I_STR}
  I_SETSIG     = (__SID or 9);     { Inform the STREAM head that the process
                                     wants the SIGPOLL signal issued.  }
  {$EXTERNALSYM I_SETSIG}
  I_GETSIG     = (__SID or 10);    { Return the events for which the calling
                                     process is currently registered to be sent
                                     a SIGPOLL signal.  }
  {$EXTERNALSYM I_GETSIG}
  I_FIND       = (__SID or 11);    { Compares the names of all modules currently
                                     present in the STREAM to the name pointed to
                                     by `arg'.  }
  {$EXTERNALSYM I_FIND}
  I_LINK       = (__SID or 12);    { Connect two STREAMs.  }
  {$EXTERNALSYM I_LINK}
  I_UNLINK     = (__SID or 13);    { Disconnects the two STREAMs.  }
  {$EXTERNALSYM I_UNLINK}
  I_PEEK       = (__SID or 15);    { Allows a process to retrieve the information
                                     in the first message on the STREAM head read
                                     queue without taking the message off the
                                     queue.  }
  {$EXTERNALSYM I_PEEK}
  I_FDINSERT   = (__SID or 16);    { Create a message from the specified
                                     buffer(s), adds information about another
                                     STREAM, and send the message downstream.  }
  {$EXTERNALSYM I_FDINSERT}
  I_SENDFD     = (__SID or 17);    { Requests the STREAM associated with `fildes'
                                     to send a message, containing a file
                                     pointer, to the STREAM head at the other end
                                     of a STREAMS pipe.  }
  {$EXTERNALSYM I_SENDFD}
  I_RECVFD     = (__SID or 14);    { Non-EFT definition.  }
  {$EXTERNALSYM I_RECVFD}
  I_SWROPT     = (__SID or 19);    { Set the write mode.  }
  {$EXTERNALSYM I_SWROPT}
  I_GWROPT     = (__SID or 20);    { Return the current write mode setting.  }
  {$EXTERNALSYM I_GWROPT}
  I_LIST       = (__SID or 21);    { List all the module names on the STREAM, up
                                     to and including the topmost driver name. }
  {$EXTERNALSYM I_LIST}
  I_PLINK      = (__SID or 22);    { Connect two STREAMs with a persistent
                                     link.  }
  {$EXTERNALSYM I_PLINK}
  I_PUNLINK    = (__SID or 23);    { Disconnect the two STREAMs that were
                                     connected with a persistent link.  }
  {$EXTERNALSYM I_PUNLINK}
  I_FLUSHBAND  = (__SID or 28);    { Flush only band specified.  }
  {$EXTERNALSYM I_FLUSHBAND}
  I_CKBAND     = (__SID or 29);    { Check if the message of a given priority
                                     band exists on the STREAM head read
                                     queue.  }
  {$EXTERNALSYM I_CKBAND}
  I_GETBAND    = (__SID or 30);    { Return the priority band of the first
                                     message on the STREAM head read queue.  }
  {$EXTERNALSYM I_GETBAND}
  I_ATMARK     = (__SID or 31);    { See if the current message on the STREAM
                                     head read queue is "marked" by some module
                                     downstream.  }
  {$EXTERNALSYM I_ATMARK}
  I_SETCLTIME  = (__SID or 32);    { Set the time the STREAM head will delay when
                                     a STREAM is closing and there is data on
                                     the write queues.  }
  {$EXTERNALSYM I_SETCLTIME}
  I_GETCLTIME  = (__SID or 33);    { Get current value for closing timeout.  }
  {$EXTERNALSYM I_GETCLTIME}
  I_CANPUT     = (__SID or 34);    { Check if a certain band is writable.  }
  {$EXTERNALSYM I_CANPUT}

{ Used in `I_LOOK' request.  }
  FMNAMESZ     = 8;         { compatibility w/UnixWare/Solaris.  }
  {$EXTERNALSYM FMNAMESZ}

{ Flush options.  }
  FLUSHR       = $01;       { Flush read queues.  }
  {$EXTERNALSYM FLUSHR}
  FLUSHW       = $02;       { Flush write queues.  }
  {$EXTERNALSYM FLUSHW}
  FLUSHRW      = $03;       { Flush read and write queues.  }
  {$EXTERNALSYM FLUSHRW}

  FLUSHBAND    = $04;       { Flush only specified band.  }
  {$EXTERNALSYM FLUSHBAND}

{ Possible arguments for `I_SETSIG'.  }
  S_INPUT      = $0001;     { A message, other than a high-priority
                              message, has arrived.  }
  {$EXTERNALSYM S_INPUT}
  S_HIPRI      = $0002;     { A high-priority message is present.  }
  {$EXTERNALSYM S_HIPRI}
  S_OUTPUT     = $0004;     { The write queue for normal data is no longer
                              full.  }
  {$EXTERNALSYM S_OUTPUT}
  S_MSG        = $0008;     { A STREAMS signal message that contains the
                              SIGPOLL signal reaches the front of the
                              STREAM head read queue.  }
  {$EXTERNALSYM S_MSG}
  S_ERROR      = $0010;     { Notification of an error condition.  }
  {$EXTERNALSYM S_ERROR}
  S_HANGUP     = $0020;     { Notification of a hangup.  }
  {$EXTERNALSYM S_HANGUP}
  S_RDNORM     = $0040;     { A normal message has arrived.  }
  {$EXTERNALSYM S_RDNORM}
  S_WRNORM     = S_OUTPUT;
  {$EXTERNALSYM S_WRNORM}
  S_RDBAND     = $0080;     { A message with a non-zero priority has
                              arrived.  }
  {$EXTERNALSYM S_RDBAND}
  S_WRBAND     = $0100;     { The write queue for a non-zero priority
                              band is no longer full.  }
  {$EXTERNALSYM S_WRBAND}
  S_BANDURG    = $0200;     { When used in conjunction with S_RDBAND,
                              SIGURG is generated instead of SIGPOLL when
                              a priority message reaches the front of the
                              STREAM head read queue.  }
  {$EXTERNALSYM S_BANDURG}

{ Option for `I_PEEK'.  }
  RS_HIPRI     = $01;       { Only look for high-priority messages.  }
  {$EXTERNALSYM RS_HIPRI}

{ Options for `I_SRDOPT'.  }
  RNORM        = $0000;     { Byte-STREAM mode, the default.  }
  {$EXTERNALSYM RNORM}
  RMSGD        = $0001;     { Message-discard mode.   }
  {$EXTERNALSYM RMSGD}
  RMSGN        = $0002;     { Message-nondiscard mode.   }
  {$EXTERNALSYM RMSGN}
  RPROTDAT     = $0004;     { Deliver the control part of a message as
                              data.  }
  {$EXTERNALSYM RPROTDAT}
  RPROTDIS     = $0008;     { Discard the control part of a message,
                              delivering any data part.  }
  {$EXTERNALSYM RPROTDIS}
  RPROTNORM    = $0010;     { Fail `read' with EBADMSG if a message
                              containing a control part is at the front
                              of the STREAM head read queue.  }
  {$EXTERNALSYM RPROTNORM}
  RPROTMASK    = $001C;     { The RPROT bits }
  {$EXTERNALSYM RPROTMASK}

{ Possible mode for `I_SWROPT'.  }
  SNDZERO      = $001;      { Send a zero-length message downstream when a
                              `write' of 0 bytes occurs.  }
  {$EXTERNALSYM SNDZERO}
  SNDPIPE      = $002;      { Send SIGPIPE on write and putmsg if
                              sd_werror is set.  }
  {$EXTERNALSYM SNDPIPE}

{ Arguments for `I_ATMARK'.  }
  ANYMARK      = $01;       { Check if the message is marked.  }
  {$EXTERNALSYM ANYMARK}
  LASTMARK     = $02;       { Check if the message is the last one marked
                              on the queue.  }
  {$EXTERNALSYM LASTMARK}

{ Argument for `I_UNLINK'.  }
  MUXID_ALL    = (-1);      { Unlink all STREAMs linked to the STREAM
                              associated with `fildes'.  }
  {$EXTERNALSYM MUXID_ALL}


{ Macros for `getmsg', `getpmsg', `putmsg' and `putpmsg'.  }
  MSG_HIPRI    = $01;       { Send/receive high priority message.  }
  {$EXTERNALSYM MSG_HIPRI}
  MSG_ANY      = $02;       { Receive any message.  }
  {$EXTERNALSYM MSG_ANY}
  MSG_BAND     = $04;       { Receive message from specified band.  }
  {$EXTERNALSYM MSG_BAND}

{ Values returned by getmsg and getpmsg }
  MORECTL      = 1;         { More control information is left in message.  }
  {$EXTERNALSYM MORECTL}
  MOREDATA     = 2;         { More data is left in message.  }
  {$EXTERNALSYM MOREDATA}

type
  t_uscalar_t = Cardinal;
  {$EXTERNALSYM t_uscalar_t}
  Pt_uscalar_t = ^t_uscalar_t;
   
{ Structure used for the I_FLUSHBAND ioctl on streams.  }
  bandinfo = record
    bi_pri: Byte;
    bi_flag: Integer;
  end;
  {$EXTERNALSYM bandinfo}
  Pbandinfo = ^bandinfo;
  {$EXTERNALSYM Pbandinfo}

  strbuf = record
    maxlen: Integer;       { Maximum buffer length.  }
    len: Integer;          { Length of data.  }
    buf: MarshaledAString;        { Pointer to buffer.  }
  end;
  {$EXTERNALSYM strbuf}
  Pstrbuf = ^strbuf;
  {$EXTERNALSYM Pstrbuf}
  {$DEFINE STRBUF_DEFINED}

  strpeek = record
    ctlbuf: strbuf;
    databuf: strbuf;
    flags: t_uscalar_t;    { UnixWare/Solaris compatibility.  }
  end;
  {$EXTERNALSYM strpeek}
  Pstrpeek = ^strpeek;
  {$EXTERNALSYM Pstrpeek}

  strfdinsert = record
    ctlbuf: strbuf;
    databuf: strbuf;
    flags: t_uscalar_t;    { UnixWare/Solaris compatibility.  }
    fildes: Integer;
    offset: Integer;
  end;
  {$EXTERNALSYM strfdinsert}
  Pstrfdinsert = ^strfdinsert;
  {$EXTERNALSYM Pstrfdinsert}

  strioctl = record
    ic_cmd: Integer;
    ic_timout: Integer;
    ic_len: Integer;
    ic_dp: MarshaledAString;
  end;
  {$EXTERNALSYM strioctl}
  Pstrioctl = ^strioctl;
  {$EXTERNALSYM Pstrioctl}

  strrecvfd = record
    fd: Integer;
    uid: uid_t;
    gid: gid_t;
    __fill: packed array[0..8-1] of Byte; { UnixWare/Solaris compatibility }
  end;
  {$EXTERNALSYM strrecvfd}
  Pstrrecvfd = ^strrecvfd;
  {$EXTERNALSYM Pstrrecvfd}


  str_mlist = record
    l_name: packed array[0..FMNAMESZ + 1 - 1] of Byte;
  end;
  {$EXTERNALSYM str_mlist}
  Pstr_mlist = ^str_mlist;
  {$EXTERNALSYM Pstr_mlist}

  str_list = record
    sl_nmods: Integer;
    sl_modlist: Pstr_mlist;
  end;
  {$EXTERNALSYM str_list}
  Pstr_list = ^str_list;
  {$EXTERNALSYM Pstr_list}
