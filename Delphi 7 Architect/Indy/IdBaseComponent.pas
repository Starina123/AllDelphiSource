unit IdBaseComponent;

interface

uses
  Classes;

// ***********************************************************
// TIdBaseComponent is the base class for all Indy components.
// ***********************************************************
type
  TIdBaseComponent = class(TComponent)
  public
    function GetVersion: string;
    property Version: string read GetVersion;
  published
  end;

implementation

uses
  IdGlobal;

function TIdBaseComponent.GetVersion: string;
begin
  Result := gsIdVersion;
end;

end.
