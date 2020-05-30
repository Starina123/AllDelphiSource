{*------------------------------------------------------------------------------
 *ModuleInit_u
 *  The actual Apache API routines are assigned in the ApacheInit.pas unit.
 *  When working with the Apache API you should try to put the assignments
 *  in a seperate unit so that your WebModule is Portable.
 *
 *About this demo.
 *  This demo will show how to assign the module initialization handler. It will
 *  Load an ini file and display this data when this module is uses as a content
 *  handler.
 *-----------------------------------------------------------------------------}

unit ModuleInit_u;

interface

uses
  {$IFDEF WINDOWS}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes, HTTPApp, ApacheApp, HTTPD, IniFiles,
  // unit that contains the Apache Handlers.
  ApacheInit;

type
  TWebModule1 = class(TWebModule)
    procedure WebModule1WebActionItem1Action(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);

  private
  public
    constructor Create(AOwner: TComponent); override;

  end;

var
  WebModule1: TWebModule1;

implementation

{$R *.dfm}

constructor TWebModule1.Create(AOwner: TComponent);
  begin
    inherited Create(AOwner);
  end;

procedure TWebModule1.WebModule1WebActionItem1Action(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  var
    i, count: integer;
  begin

  Response.Content:='These are that were initialized by the module<BR><BR>';
  Response.Content:= Response.Content + '<B>Interbase Drivers</B><BR>';
  // read the ini values out to the client
  count:= Interbase_Drivers.Count;
  for i:=0 to count -1 do
    response.Content:= Response.Content + Interbase_Drivers.Strings[i] + '<BR>';

  Response.Content:= Response.Content + '<B>IBLocal Settings</B><BR>';
  count:=IBLocal_Settings.Count;
  for i:=0 to count-1 do
    Response.Content:= Response.Content + IBLocal_Settings.Strings[i] + '<BR>';


  end;


initialization
    // make the assignments here
   // ApacheOnInit :=WebModule1.Apache_OnInit;

end.// end Unit
