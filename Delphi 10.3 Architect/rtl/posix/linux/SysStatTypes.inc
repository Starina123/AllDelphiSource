{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

type
  _stat = record
    st_dev: dev_t;          // device
{$IFDEF LINUX32}
    __pad1: Word;
{$ENDIF LINUX32}
    st_ino: ino_t;       // inode
{$IFDEF LINUX32}
    st_mode: mode_t;      // protection
    st_nlink: nlink_t;     //  number of hard links
{$ELSE LINUX64}
    st_nlink: nlink_t;     //  number of hard links
    st_mode: mode_t;      // protection
{$ENDIF LINUX32}
    st_uid: uid_t;       // user ID of owner
    st_gid: gid_t;       // group ID of owner
{$IFDEF LINUX64}
    __pad0: Integer;
{$ENDIF LINUX64}
    st_rdev: dev_t;         // device type (if inode device)
{$IFDEF LINUX32}
    __pad2: Word;
{$ENDIF LINUX32}
    st_size: off_t;      // total size, in bytes
    st_blksize: blksize_t;   // blocksize for filesystem I/O
    st_blocks: blkcnt_t;    // number of blocks allocated

    st_atime: time_t;      // time of last access
    st_atimensec: UInt32;
    st_mtime: time_t;      // time of last modification
    st_mtimensec: UInt32;
    st_ctime: time_t;      // time of last change
    st_ctimensec: UInt32;

{$IFDEF LINUX64}
    __glibc_reserved: array [0..2] of LongInt;
{$ELSE LINUX32}
    __glibc_reserved4: LongInt;
    __glibc_reserved5: LongInt;
{$ENDIF LINUX64}
  end;
  {$EXTERNALSYM _stat}
  P_stat = ^_stat;

const
{ File type }
  S_IFMT       = $0000F000;   // [XSI] type of file mask
  {$EXTERNALSYM S_IFMT}
  S_IFIFO      = $00001000;   // [XSI] named pipe (fifo)
  {$EXTERNALSYM S_IFIFO}
  S_IFCHR      = $00002000;   // [XSI] character special
  {$EXTERNALSYM S_IFCHR}
  S_IFDIR      = $00004000;   // [XSI] directory
  {$EXTERNALSYM S_IFDIR}
  S_IFBLK      = $00006000;   // [XSI] block special
  {$EXTERNALSYM S_IFBLK}
  S_IFREG      = $00008000;   // [XSI] regular
  {$EXTERNALSYM S_IFREG}
  S_IFLNK      = $0000a000;   // [XSI] symbolic link
  {$EXTERNALSYM S_IFLNK}
  S_IFSOCK     = $0000c000;   // [XSI] socket
  {$EXTERNALSYM S_IFSOCK}
  S_IFWHT      = $0000E000;   // whiteout
  {$EXTERNALSYM S_IFWHT }

  // protection flags
//  S_IREAD       = $0400;    // Read by owner.
  {$EXTERNALSYM S_IREAD}
//  S_IWRITE      = $0200;    // Write by owner.
  {$EXTERNALSYM S_IWRITE}
//  S_IEXEC       = $0100;    // Execute by owner.
  {$EXTERNALSYM S_IEXEC}

    // these next 3 are _not_ POSIX
  S_IREAD       = $0100;    // Read by owner.
  {$EXTERNALSYM S_IREAD}
  S_IWRITE      = $0080;    // Write by owner.
  {$EXTERNALSYM S_IWRITE}
  S_IEXEC       = $0040;    // Execute by owner.
  {$EXTERNALSYM S_IEXEC}

  S_IRUSR       = S_IREAD;
  {$EXTERNALSYM S_IRUSR}
  S_IWUSR       = S_IWRITE;
  {$EXTERNALSYM S_IWUSR}
  S_IXUSR       = S_IEXEC;
  {$EXTERNALSYM S_IXUSR}
  S_IRWXU       = S_IRUSR or S_IWUSR or S_IXUSR;
  {$EXTERNALSYM S_IRWXU}

//  S_IRGRP       = S_IRUSR shr 4; // Read by group.
  {$EXTERNALSYM S_IRGRP}
//  S_IWGRP       = S_IWUSR shr 4; // Write by group.
  {$EXTERNALSYM S_IWGRP}
//  S_IXGRP       = S_IXUSR shr 4; // Execute by group.
  {$EXTERNALSYM S_IXGRP}
//  S_IRWXG       = S_IRWXU shr 4; // Read, write, and execute by group.
  {$EXTERNALSYM S_IRWXG}
  S_IRWXG       = $0038; // Read, write, and execute by group.
  {$EXTERNALSYM S_IRWXG}
  S_IRGRP       = $0020; // Read by group.
  {$EXTERNALSYM S_IRGRP}
  S_IWGRP       = $0010; // Write by group.
  {$EXTERNALSYM S_IWGRP}
  S_IXGRP       = $0008; // Execute by group.
  {$EXTERNALSYM S_IXGRP}

//  S_IROTH       = S_IRGRP shr 4; // Read by others.
  {$EXTERNALSYM S_IROTH}
//  S_IWOTH       = S_IWGRP shr 4; // Write by others.
  {$EXTERNALSYM S_IWOTH}
//  S_IXOTH       = S_IXGRP shr 4; // Execute by others.
  {$EXTERNALSYM S_IXOTH}
//  S_IRWXO       = S_IRWXG shr 4; // Read, write, and execute by others.
  {$EXTERNALSYM S_IRWXO}
  S_IRWXO       = $0007; // Read, write, and execute by others.
  {$EXTERNALSYM S_IRWXO}
  S_IROTH       = $0004; // Read by others.
  {$EXTERNALSYM S_IROTH}
  S_IWOTH       = $0002; // Write by others.
  {$EXTERNALSYM S_IWOTH}
  S_IXOTH       = $0001; // Execute by others.
  {$EXTERNALSYM S_IXOTH}
  
  S_ISUID      = $00000800;   // [XSI] set user id on execution
  {$EXTERNALSYM S_ISUID }
  S_ISGID      = $00000400;   // [XSI] set group id on execution
  {$EXTERNALSYM S_ISGID }
  S_ISVTX      = $00000200;   // [XSI] directory restricted delete
  {$EXTERNALSYM S_ISVTX }

  S_ISTXT      = S_ISVTX;     // sticky bit: not supported
  {$EXTERNALSYM S_ISTXT }

