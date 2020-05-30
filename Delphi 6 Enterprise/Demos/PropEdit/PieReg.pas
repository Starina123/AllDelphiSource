unit PieReg;

interface

uses Windows, Classes, Graphics, Forms, Controls, Pies, Buttons, DesignIntf,
  DesignWindows, StdCtrls, ComCtrls, DesignEditors;

type
  TAngleEditorDlg = class(TForm)
    EAngleLabel: TLabel;
    OKButton: TButton;
    CancelButton: TButton;
    SAngleLabel: TLabel;
    STrackBar: TTrackBar;
    ETrackBar: TTrackBar;
    procedure CancelClick(Sender: TObject);
    procedure STrackBarChange(Sender: TObject);
    procedure ETrackBarChange(Sender: TObject);
  private
    FOrigStart, FOrigEnd: Integer;
    FAngles: TAngles;
    procedure SetStartAngle(Value: Integer);
    procedure SetEndAngle(Value: Integer);
    procedure SetAngles(Value: TAngles);
  public
    property EditorAngles: TAngles read FAngles write SetAngles;
  end;

  TAnglesProperty = class(TClassProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

  { Component editor - brings up angle editor when double clicking on
    Angles property }
  TPieEditor = class(TDefaultEditor)
  protected
    procedure EditProperty(const PropertyEditor: IProperty;
      var Continue: Boolean); override;
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

procedure Register;

implementation

uses SysUtils;

{$R *.dfm}

{ TAngleEditorDlg }

procedure TAngleEditorDlg.STrackBarChange(Sender: TObject);
begin
  SetStartAngle(STrackBar.Position);
end;

procedure TAngleEditorDlg.ETrackBarChange(Sender: TObject);
begin
  SetEndAngle(ETrackBar.Position);
end;

procedure TAngleEditorDlg.SetStartAngle(Value: Integer);
begin
  STrackBar.Position := Value;
  SAngleLabel.Caption := 'StartAngle = '+ IntToStr(Value);
  FAngles.StartAngle := Value;
end;

procedure TAngleEditorDlg.SetEndAngle(Value: Integer);
begin
  ETrackBar.Position := Value;
  EAngleLabel.Caption := 'EndAngle = '+ IntToStr(Value);
  FAngles.EndAngle := Value;
end;

procedure TAngleEditorDlg.SetAngles(Value: TAngles);
begin
  FAngles := Value;
  FOrigStart := Value.StartAngle;
  FOrigEnd := Value.EndAngle;
  SetStartAngle(Value.StartAngle);
  SetEndAngle(Value.EndAngle);
end;

procedure TAngleEditorDlg.CancelClick(Sender: TObject);
begin
  SetStartAngle(FOrigStart);
  SetEndAngle(FOrigEnd);
end;

{ TAnglesProperty }

procedure TAnglesProperty.Edit;
var
  Angles: TAngles;
  AngleEditor: TAngleEditorDlg;
begin
  Angles := TAngles(GetOrdValue);
  AngleEditor := TAngleEditorDlg.Create(Application);
  try
    AngleEditor.EditorAngles := Angles;
    AngleEditor.ShowModal;
  finally
    AngleEditor.Free;
  end;
end;

function TAnglesProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paSubProperties];
end;

{TPieEditor}

procedure TPieEditor.EditProperty(const PropertyEditor: IProperty;
  var Continue: Boolean);
var
  PropName: string;
begin
  PropName := PropertyEditor.GetName;
  if (CompareText(PropName, 'ANGLES') = 0) then
  begin
    PropertyEditor.Edit;
    Continue := False;
  end;
end;

function TPieEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

function TPieEditor.GetVerb(Index: Integer): string;
begin
  if Index = 0 then
    Result := 'Edit Angles'
  else Result := '';
end;

procedure TPieEditor.ExecuteVerb(Index: Integer);
begin
  if Index = 0 then Edit;
end;

procedure Register;
begin
  RegisterComponents('Samples',[TPie]);
  RegisterComponentEditor(TPie, TPieEditor);
  RegisterPropertyEditor(TypeInfo(TAngles), nil, '', TAnglesProperty);
end;

end.
