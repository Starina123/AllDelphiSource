{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit RSConfig.ConfigDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FMX.Edit,
  FMX.Dialogs, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FMX.StdCtrls,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, FireDAC.DApt, System.Math,
  FireDAC.Phys.SQLiteVDataSet, FMX.Layouts, FMX.Types, System.IOUtils,
  FMX.DialogService, System.Generics.Collections, Rest.Json, FMX.ListBox;

type
  TCallbackProc = procedure(ASender: TObject);

  TAuthorizationItem = class
  private
    FGroups: TArray<String>;
    FPublic: Boolean;
    FUsers: TArray<String>;
  public
    property Groups: TArray<String> read FGroups write FGroups;
    property Public: Boolean read FPublic write FPublic;
    property Users: TArray<String> read FUsers write FUsers;
    function ToJson: string;
    class function FromJson(const AJsonString: string): TAuthorizationItem;
  end;

  TPublicPathsItem = class
  private
    FCharset: String;
    FDefault: String;
    FDirectory: String;
    FExtensions: TArray<String>;
    FMimes: TArray<String>;
    FPath: String;
  public
    property Charset: String read FCharset write FCharset;
    property Default: String read FDefault write FDefault;
    property Directory: String read FDirectory write FDirectory;
    property Extensions: TArray<String> read FExtensions write FExtensions;
    property Mimes: TArray<String> read FMimes write FMimes;
    property Path: String read FPath write FPath;
    function ToJson: string;
    class function FromJson(const AJsonString: string): TPublicPathsItem;
  end;

  TRedirectItem = class
  private
    FDestination: String;
  public
    property Destination: String read FDestination write FDestination;
    function ToJson: string;
    class function FromJson(const AJsonString: string): TRedirectItem;
  end;

  TConfigDM = class(TDataModule)
    SettingsMT: TFDMemTable;
    DataMT: TFDMemTable;
    ServerMT: TFDMemTable;
    PushNotificationsMT: TFDMemTable;
    ServerStatusMT: TFDMemTable;
    DataStatusMT: TFDMemTable;
    PushNotificationsStatusMT: TFDMemTable;
  private
    { Private declarations }
    FCurrentFilename: String;
    procedure PairTypeToComment(const APairType: Integer; var ACommented, AComment: Boolean);
  public
    { Public declarations }
    procedure ShowHelp(Sender: TObject);
    procedure LoadFromFile(const AFilename: String);
    procedure SaveToFile(const AFilename: String = '');
    procedure OpenDialogForEdit(AEdit: TEdit; AOpenDialog: TOpenDialog);
    procedure AddSectionListItem(AEnabled: Boolean; const AName, AValue: String;
      AListBox: TListBox; ACallback: TNotifyEvent);
    procedure RenumberListItems(AListBox: TListBox);
    procedure LoadSectionList(const ASection: String; AListBox: TListBox;
      ACallback: TNotifyEvent);
    procedure LoadSection(const ASection: String; AValueMemTable: TFDMemTable;
      AStatusMemTable: TFDMemTable);
    procedure SaveSection(const ASection: String; AValueMemTable: TFDMemTable;
      AStatusMemTable: TFDMemTable);
    procedure SaveSectionList(const ASection: String; AListBox: TListBox);
  end;

const
  INI_NAME_VALUE_PAIR = 0;
  INI_COMMENTED_NAME_VALUE_PAIR = 1;
  INI_COMMENT = 2;

  PACKAGES_FRAME = 0;
  PUBLICPATHS_FRAME = 1;
  REDIRECT_FRAME = 2;
  AUTHORIZATION_FRAME = 3;

var
  ConfigDM: TConfigDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

uses
  RSConsole.FormConfig, RSConfig.NameValueFrame;

function TAuthorizationItem.ToJson: string;
begin
  Result := TJson.ObjectToJsonString(Self, [TJsonOption.joIgnoreEmptyArrays, TJsonOption.joIgnoreEmptyStrings]);
end;

class function TAuthorizationItem.FromJson(const AJsonString: string): TAuthorizationItem;
begin
  Result := TJson.JsonToObject<TAuthorizationItem>(AJsonString)
end;

function TPublicPathsItem.ToJson: string;
begin
  Result := TJson.ObjectToJsonString(Self, [TJsonOption.joIgnoreEmptyArrays, TJsonOption.joIgnoreEmptyStrings]);
end;

class function TPublicPathsItem.FromJson(const AJsonString: string): TPublicPathsItem;
begin
  Result := TJson.JsonToObject<TPublicPathsItem>(AJsonString)
end;

function TRedirectItem.ToJson: string;
begin
  Result := TJson.ObjectToJsonString(Self);
end;

class function TRedirectItem.FromJson(const AJsonString: string): TRedirectItem;
begin
  Result := TJson.JsonToObject<TRedirectItem>(AJsonString)
end;

procedure TConfigDM.ShowHelp(Sender: TObject);
begin
  TDialogService.ShowMessage(TButton(Sender).Hint);
end;

procedure TConfigDM.OpenDialogForEdit(AEdit: TEdit; AOpenDialog: TOpenDialog);
begin
  AOpenDialog.InitialDir := GetCurrentDir;
  if AOpenDialog.Execute then
  begin
    AEdit.Text := AOpenDialog.FileName;
    TLinkObservers.ControlChanged(AEdit);
  end;
end;

procedure TConfigDM.LoadFromFile(const AFilename: String);
var
  LConfigFile: TStringList;
  LIndex: Integer;
  LSection: String;
  LPairType: Integer;
  LSectionOrder, LOrder: Integer;
  LName, LValue: String;
  LEqualLocation: Integer;
begin
  if not TFile.Exists(AFilename) then
    Exit;

  SettingsMT.EmptyDataSet;

  LConfigFile := TStringList.Create;
  try
    LConfigFile.LoadFromFile(AFilename);

    LSectionOrder := 0;
    LOrder := 0;
    for LIndex := 0 to LConfigFile.Count - 1 do
    begin
      if LConfigFile[LIndex].StartsWith('[') then
      begin
        LSection := LConfigFile[LIndex].Replace('[', '').Replace(']', '');
        LOrder := 0;
        Inc(LSectionOrder)
      end
      else
      begin
        if not LConfigFile[LIndex].IsEmpty then
        begin
          LPairType := INI_NAME_VALUE_PAIR;
          if LConfigFile[LIndex].IndexOf(';#') = 0 then
          begin
            SettingsMT.AppendRecord([LSection, LConfigFile[LIndex], '',
              INI_COMMENT, LOrder, LSectionOrder]);
          end
          else
          begin
            LEqualLocation := LConfigFile[LIndex].IndexOf('=');
            if LEqualLocation > -1 then
            begin
              LName := LConfigFile[LIndex].Substring(0, LEqualLocation);
              LValue := LConfigFile[LIndex].Substring(LEqualLocation + 1);
              if LConfigFile[LIndex].IndexOf(';') = 0 then
              begin
                LName := LName.Substring(1).TrimLeft;
                LPairType := INI_COMMENTED_NAME_VALUE_PAIR;
              end;
              SettingsMT.AppendRecord([LSection, LName, LValue, LPairType,
                LOrder, LSectionOrder]);
            end;
          end;
          Inc(LOrder);
        end;
      end;
    end;
  finally
    LConfigFile.Free;
  end;

  FCurrentFilename := AFilename;
end;

procedure TConfigDM.SaveToFile(const AFilename: String = '');
var
  LConfigFile: TStringList;
  LSection: String;
  LPairType: Integer;
  LName, LValue: String;
begin

  LConfigFile := TStringList.Create;

  try
    SettingsMT.First;
    while not SettingsMT.Eof do
    begin
      if LSection <> SettingsMT.FieldByName('Section').AsString then
      begin
        if LSection <> '' then
          LConfigFile.Append('');

        LSection := SettingsMT.FieldByName('Section').AsString;

        LConfigFile.Append('[' + LSection + ']');
      end;
      LPairType := SettingsMT.FieldByName('Type').AsInteger;
      LName := SettingsMT.FieldByName('Name').AsString;
      LValue := SettingsMT.FieldByName('Value').AsString;

      case LPairType of
        INI_NAME_VALUE_PAIR:
          begin
            LConfigFile.Append(LName + '=' + LValue);
          end;
        INI_COMMENTED_NAME_VALUE_PAIR:
          begin
            LConfigFile.Append(';' + LName + '=' + LValue);
          end;
        INI_COMMENT:
          begin
            LConfigFile.Append(LName);
          end;
      end;

      SettingsMT.Next;
    end;

    if AFilename = '' then
      LConfigFile.SaveToFile(FCurrentFilename)
    else
      LConfigFile.SaveToFile(AFilename);
  finally
    LConfigFile.Free;
  end;
end;

procedure TConfigDM.PairTypeToComment(const APairType: Integer; var ACommented, AComment: Boolean);
begin
  case APairType of
    INI_NAME_VALUE_PAIR:
      begin
        ACommented := False;
        AComment := False;
      end;
    INI_COMMENTED_NAME_VALUE_PAIR:
      begin
        ACommented := True;
        AComment := False;
      end;
    INI_COMMENT:
      begin
        ACommented := True;
        AComment := True;
      end;
    else
      AComment := True;
      ACommented := True;
  end;
end;

procedure TConfigDM.LoadSectionList(const ASection: String; AListBox: TListBox;
  ACallback: TNotifyEvent);
var
  LPairType: Integer;
  LCommented: Boolean;
  LComment: Boolean;
begin
  AListBox.BeginUpdate;
  try
    AListBox.Clear;
    SettingsMT.First;
    while not SettingsMT.Eof do
    begin
      if SettingsMT.FieldByName('Section').AsString = ASection then
      begin
        LPairType := SettingsMT.FieldByName('Type').AsInteger;
        PairTypeToComment(LPairType, LCommented, LComment);

        if not LComment then
        begin
          AddSectionListItem(not LCommented, SettingsMT.FieldByName('Name')
            .AsString, SettingsMT.FieldByName('Value').AsString, AListBox,
            ACallback);
        end;
      end;

      SettingsMT.Next;
    end;
  finally
    AListBox.EndUpdate;
  end;
end;

procedure TConfigDM.RenumberListItems(AListBox: TListBox);
var
  LIndex: Integer;
begin
  for LIndex := 0 to AListBox.Items.Count - 1 do
    if AListBox.ListItems[LIndex].TagObject <> nil then
      if AListBox.ListItems[LIndex].TagObject is TNameValueFrame then
        TNameValueFrame(AListBox.ListItems[LIndex].TagObject).CheckBox.Text := (LIndex + 1).ToString;
end;

procedure TConfigDM.AddSectionListItem(AEnabled: Boolean;
  const AName, AValue: String; AListBox: TListBox; ACallback: TNotifyEvent);
var
  LNameValueFrame: TNameValueFrame;
  LItem: TListBoxItem;
begin
  LItem := TListBoxItem.Create(AListBox);
  LItem.Parent := AListBox;
  LItem.Text := '';
  LItem.Height := 60;
  LNameValueFrame := TNameValueFrame.Create(AListBox);
  LNameValueFrame.Name := '';
  LNameValueFrame.CheckBox.Text := (AListBox.Items.Count).ToString;
  LNameValueFrame.CheckBox.IsChecked := AEnabled;
  LNameValueFrame.NameEdit.Text := AName;
  LNameValueFrame.ValueEdit.Text := AValue;
  LNameValueFrame.Align := TAlignLayout.Top;
  LNameValueFrame.Parent := LItem;
  LNameValueFrame.SetCallback(ACallback);
  LItem.TagObject := LNameValueFrame;
end;

procedure TConfigDM.SaveSectionList(const ASection: String; AListBox: TListBox);
var
  LNameValueFrame: TNameValueFrame;
  LPairType: Integer;
  LIndex: Integer;
  LSectionOrder: Integer;
begin
  LSectionOrder := -1;
  SettingsMT.Last;
  while not SettingsMT.Bof do
  begin
    if SettingsMT.FieldByName('Section').AsString = ASection then
    begin
      if LSectionOrder = -1 then
        LSectionOrder := SettingsMT.FieldByName('SectionOrder').AsInteger;
      if SettingsMT.FieldByName('Type').AsInteger <> INI_COMMENT then
        SettingsMT.Delete
      else
        SettingsMT.Prior;
    end
    else
      SettingsMT.Prior;
  end;
  SettingsMT.FindKey([LSectionOrder]);
  for LIndex := 0 to AListBox.Items.Count - 1 do
  begin
    if AListBox.ListItems[LIndex].TagObject <> nil then
      if AListBox.ListItems[LIndex].TagObject is TNameValueFrame then
      begin
        LNameValueFrame := TNameValueFrame(AListBox.ListItems[LIndex].TagObject);
        LPairType := IfThen(LNameValueFrame.CheckBox.IsChecked, INI_NAME_VALUE_PAIR, INI_COMMENTED_NAME_VALUE_PAIR);

        SettingsMT.Insert;
        SettingsMT.FieldByName('Section').AsString := ASection;
        SettingsMT.FieldByName('Name').AsString := LNameValueFrame.NameEdit.Text;
        SettingsMT.FieldByName('Value').AsString := LNameValueFrame.ValueEdit.Text;
        SettingsMT.FieldByName('Type').AsInteger := LPairType;
        SettingsMT.FieldByName('ItemOrder').AsInteger := LIndex;
        SettingsMT.FieldByName('SectionOrder').AsInteger := LSectionOrder;
        SettingsMT.Post;
      end;
  end;
end;

procedure TConfigDM.LoadSection(const ASection: String;
  AValueMemTable: TFDMemTable; AStatusMemTable: TFDMemTable);
var
  LPairType: Integer;
  LCommented: Boolean;
  LComment: Boolean;
begin
  AValueMemTable.Edit;
  AStatusMemTable.Edit;
  SettingsMT.First;
  while not SettingsMT.Eof do
  begin
    if SettingsMT.FieldByName('Section').AsString = ASection then
    begin
      LPairType := SettingsMT.FieldByName('Type').AsInteger;
      PairTypeToComment(LPairType, LCommented , LComment);

      if not LComment then
      begin
        AValueMemTable.FieldByName(SettingsMT.FieldByName('Name').AsString).AsString :=
          SettingsMT.FieldByName('Value').AsString;
        AStatusMemTable.FieldByName(SettingsMT.FieldByName('Name').AsString).AsBoolean :=
          IfThen(SettingsMT.FieldByName('Type').AsInteger = INI_NAME_VALUE_PAIR, -1, 0) <> 0;
      end;
    end;

    SettingsMT.Next;
  end;
  AStatusMemTable.Post;
  AValueMemTable.Post;
end;

procedure TConfigDM.SaveSection(const ASection: String;
  AValueMemTable: TFDMemTable; AStatusMemTable: TFDMemTable);
var
  LPairType: Integer;
  LCommented: Boolean;
  LComment: Boolean;
begin
  SettingsMT.First;
  while not SettingsMT.Eof do
  begin
    if SettingsMT.FieldByName('Section').AsString = ASection then
    begin
      LPairType := SettingsMT.FieldByName('Type').AsInteger;
      PairTypeToComment(LPairType, LCommented , LComment);

      if not LComment then
      begin
        SettingsMT.Edit;
        SettingsMT.FieldByName('Value').AsString :=
          AValueMemTable.FieldByName(SettingsMT.FieldByName('Name').AsString).AsString;
        SettingsMT.FieldByName('Type').AsInteger :=
          IfThen(AStatusMemTable.FieldByName(SettingsMT.FieldByName('Name').AsString).AsBoolean,
          INI_NAME_VALUE_PAIR, INI_COMMENTED_NAME_VALUE_PAIR);
        SettingsMT.Post;
      end;
    end;

    SettingsMT.Next;
  end;
end;

end.
