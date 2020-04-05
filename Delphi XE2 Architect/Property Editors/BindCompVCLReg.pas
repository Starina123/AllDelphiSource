{*******************************************************}
{                                                       }
{             Delphi LiveBindings Framework             }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit BindCompVCLReg;

interface

procedure Register;

implementation

uses DsnConst, System.Classes,
  // Initialization
  Vcl.Bind.DBEngExt, Vcl.Bind.Editors, Data.Bind.Components, BindCompReg, Vcl.Controls,
  DesignIntf, DesignEditors;

type
  TContainedBindComponentSelectionEditor = class(TSelectionEditor)
  public
    procedure RequiresUnits(Proc: TGetStrProc); override;
  end;

procedure TContainedBindComponentSelectionEditor.RequiresUnits(Proc: TGetStrProc);
var
  I: Integer;
  LContainedBindComponent: TContainedBindComponent;
begin
  for I := 0 to Designer.Root.ComponentCount - 1 do
  begin
    if Designer.Root.Components[i] is TContainedBindComponent then
    begin
      LContainedBindComponent := TContainedBindComponent(Designer.Root.Components[i]);
      if Assigned(LContainedBindComponent.ControlComponent) then
        if LContainedBindComponent.ControlComponent is TControl then
        begin
          Proc('Vcl.Bind.Editors');
          Exit;
        end;
    end;
  end;
end;

procedure Register;
begin
  RegisterSelectionEditor(TContainedBindComponent, TContainedBindComponentSelectionEditor);
  // Add "Live Bindings" to controls
  RegisterSelectionEditor(Vcl.Controls.TControl, TAddDataBindingsPropertyFilter);
  // Verbs to add data bindings
  RegisterSelectionEditor(Vcl.Controls.TControl, TBindCompFactorySelectionEditor);

end;

end.

