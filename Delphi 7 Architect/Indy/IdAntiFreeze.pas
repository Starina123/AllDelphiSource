unit IdAntiFreeze;

{
NOTE - This unit must NOT appear in any Indy uses clauses. This is a ONE way relationship
and is linked in IF the user uses this component. This is done to preserve the isolation from the
massive FORMS unit.
}

interface

uses
  Classes,
  IdAntiFreezeBase,
  IdBaseComponent;
{Directive needed for C++Builder HPP and OBJ files for this that will force it
to be statically compiled into the code}

{$I IdCompilerDefines.inc}

{$IFDEF MSWINDOWS}

{$HPPEMIT '#pragma link "IdAntiFreeze.obj"'}    {Do not Localize}

{$ENDIF}

{$IFDEF LINUX}

{$HPPEMIT '#pragma link "IdAntiFreeze.o"'}    {Do not Localize}

{$ENDIF}
type
  TIdAntiFreeze = class(TIdAntiFreezeBase)
  public
    procedure Process; override;
  end;

implementation

uses
{$IFDEF LINUX}
  QForms;
{$ENDIF}
{$IFDEF MSWINDOWS}
  Forms,
  Messages,
  Windows;
{$ENDIF}

{$IFDEF LINUX}
procedure TIdAntiFreeze.Process;
begin
  //TODO: Handle ApplicationHasPriority
  Application.ProcessMessages;
end;
{$ENDIF}

{$IFDEF MSWINDOWS}
procedure TIdAntiFreeze.Process;
var
  Msg: TMsg;
begin
  if ApplicationHasPriority then begin
    Application.ProcessMessages;
  end else begin
    // This guarantees it will not ever call Application.Idle
    if PeekMessage(Msg, 0, 0, 0, PM_NOREMOVE) then begin
      Application.HandleMessage;
    end;
  end;
end;
{$ENDIF}

end.
