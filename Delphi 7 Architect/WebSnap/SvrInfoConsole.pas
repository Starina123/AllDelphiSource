{***************************************************************}
{                                                               }
{   Borland Delphi Visual Component Library                     }
{                                                               }
{   Copyright (c) 2000-2001 Borland Software Corporation        }
{                                                               }
{***************************************************************}
unit SvrInfoConsole;

interface

uses
  SysUtils, Classes, QForms;

type
  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses SockApp;

{$R *.xfm}

initialization
  TWebAppSockObjectFactory.Create('ServerInfo');

end.
