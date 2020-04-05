{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

type
  iovec = record
    iov_base: Pointer;    { Pointer to data.  }
    iov_len: size_t;      { Length of data.  }
  end;
  {$EXTERNALSYM iovec}
  Piovec = ^iovec;
