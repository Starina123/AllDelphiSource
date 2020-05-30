{***************************************************************}
{                                                               }
{   Borland Delphi Visual Component Library                     }
{                                                               }
{   Copyright (c) 2000-2001 Borland Software Corporation        }
{                                                               }
{***************************************************************}

unit WebNode;

interface

uses Classes;

type

  IWebNode = interface
  ['{8B7623DC-1B68-4551-A742-DC4CD941AF59}']
    procedure Execute(const DataMsg: WideString; Response: TStream);
  end;


implementation

end.
