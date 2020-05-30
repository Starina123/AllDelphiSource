unit ConvertItUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    ConvTypes: TListBox;
    ConvValue: TEdit;
    ConvResults: TListBox;
    ConvValueIncDec: TUpDown;
    ConvFamilies: TTabControl;
    StatusBar1: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure ConvTypesClick(Sender: TObject);
    procedure ConvValueChange(Sender: TObject);
    procedure ConvFamiliesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  ConvUtils, StdConvs, EuroConv, StrUtils;

procedure TForm1.FormShow(Sender: TObject);
var
  LFamilies: TConvFamilyArray;
  I: Integer;
  LStrings: TStringList;
begin
  ConvFamilies.Tabs.Clear;
  LStrings := TStringList.Create;
  try
    GetConvFamilies(LFamilies);
    for I := 0 to Length(LFamilies) - 1 do
      LStrings.AddObject(ConvFamilyToDescription(LFamilies[I]), TObject(LFamilies[I]));
    LStrings.Sort;
    ConvFamilies.Tabs.Assign(LStrings);
    ConvFamiliesChange(Sender);
  finally
    LStrings.Free;
  end;
end;

procedure TForm1.ConvFamiliesChange(Sender: TObject);
var
  LFamily: TConvFamily;
  LTypes: TConvTypeArray;
  I: Integer;
begin
  LFamily := TConvFamily(ConvFamilies.Tabs.Objects[ConvFamilies.TabIndex]);
  with ConvTypes, Items do
  begin
    BeginUpdate;
    Clear;
    GetConvTypes(LFamily, LTypes);
    for I := 0 to Length(LTypes) - 1 do
      AddObject(ConvTypeToDescription(LTypes[I]), TObject(LTypes[I]));
    ItemIndex := 0;
    EndUpdate;
  end;
  ConvTypesClick(Sender);
end;

procedure TForm1.ConvTypesClick(Sender: TObject);
begin
  ConvValueChange(Sender);
end;

procedure TForm1.ConvValueChange(Sender: TObject);
var
  LValue: Double;
  LBaseType, LTestType: TConvType;
  I: Integer;
begin
  with ConvResults, Items do
  try
    BeginUpdate;
    Clear;
    try
      LValue := StrToFloatDef(ConvValue.Text, 0);
      if ConvTypes.ItemIndex <> -1 then
      begin
        LBaseType := TConvType(ConvTypes.Items.Objects[ConvTypes.ItemIndex]);
        for I := 0 to ConvTypes.Items.Count - 1 do
        begin
          LTestType := TConvType(ConvTypes.Items.Objects[I]);
          Add(Format('%n %s', [Convert(LValue, LBaseType, LTestType),
                               ConvTypeToDescription(LTestType)]));
        end;
      end
      else
        Add('No base type');
    except
      Add('Cannot parse value');
    end;
  finally
    EndUpdate;
  end;
end;

end.
