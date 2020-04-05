{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit DSMrWizardCommon;

interface

uses
  Windows, ToolsApi, Controls, Forms, SysUtils, Classes, Dialogs, ComObj,
  WizardAPI,
  Generics.Collections, WizardIniOptions,
  Graphics;

type

  IDsWizardImage = interface
  ['{6B5D8B03-6C84-4276-92A0-6F76D50E8315}']
    function GetImage: TBitmap;
    function LoadImage: TBitmap;
  end;

  TCustomPageMrWizard = class(TInterfacedObject, IMrWizard, IDsWizardImage)
  strict private
    { Wizard Info }
    FWizard: IWizard;

    FPersonality: string;
    FHelpContext: Integer;
    FCaption: string;
    FImageName: string;
    FBitmap: TBitmap;

    { Ini info }
    FUIOptions: TWizardIniOptions;
    procedure InitOptions(const AOptionsFileName: string);
  private


    { IMrWizard }
    procedure Start;
    function FirstPage: IWizardPage;
    procedure Cancel;
    function GetWizard: IWizard;
    procedure SetWizard(const Value: IWizard);
    function GetPersonality: string;
    { IDsWizardImage }
    function GetImage: TBitmap;
    function LoadImage: TBitmap; overload;
  protected
    function LoadImage(Instance: THandle; const ResourceName: string): TBitmap; overload;
    function LoadImage(const ResourceName: string): TBitmap; overload; virtual; abstract;

    { Wizard Utility functions }
    function CreatePage(const IID: TGUID; out Intf; const name: string = ''): Boolean;
    function GetFirstPage: IWizardpage; virtual;
    procedure Finish; virtual;
    function Caption: string;
    function GetHelpContext: Integer;
    procedure AddFirstPage(out AID: TGuid; out AName: string); virtual;
    procedure AddCustomPages(const ParentID: TGUID; const ParentName: string); virtual;
    function HasCustomPages: Boolean; virtual;
    function FirstCustomPage: IWizardpage; virtual;
    function CanFinish: Boolean; virtual;
    property Wizard: IWizard read GetWizard;
    property Personality: string read FPersonality;

  public
    constructor Create(const APersonality: string; const ACaption: string;
    AHelpContext: Integer; const AImage: string; const AOptionsFile: string);
    destructor Destroy; override;
  end;

  TDSPageClass = class(TPersistent)
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    Name: string;
    Guid: TGUID;
  end;


  TDSPageListMrWizard = class(TCustomPageMrWizard, IWizardEvents)
  private
    function GetNextPageDictionary: TDictionary<string, TDSPageClass>;
    procedure UpdatePageCount(AList: TList<TDSPageClass>); overload;
    function GetSelectedPageList: TList<TDSPageClass>;
    function ClonePage(APage: TDSPageClass): TDSPageClass;
  protected
    procedure UpdatePageCount; overload;
    { IWizardEvents }
    procedure OnEnterPage(LastPage, CurrentPage: IWizardPage; PageTransition: TPageTransition); virtual;
    procedure OnLeavePage(WizardPage: IWizardPage; PageTransition: TPageTransition); virtual;
    procedure OnLeavingPage(WizardPage: IWizardPage; PageTransition: TPageTransition; var Allow: Boolean); virtual;
    function IsPageSelected(APage: TDSPageClass): Boolean; virtual;
    function CreateWizardPage(APage: TDSPageClass): IWizardPage; virtual;
    procedure GetPageList(AList: TList<TDSPageClass>); virtual;
    function HandleNextPage(const CurrentPage: IWizardPage): IWizardPage;
    procedure AddCustomPages(const ParentID: TGUID; const ParentName: string); override;
    function HasCustomPages: Boolean; override;
    function FirstCustomPage: IWizardpage; override;
  public
    constructor Create(const APersonality: string; const ACaption: string;
    AHelpContext: Integer; const AImageName: string; const AOptionsFileName: string);
  end;

  TDSWizardPage = class(TWizardPage, IWizardPage, IWizardPageEvents)
  private
    FID: TGuid;
    { IWizardPage }
    function Close: Boolean;
    procedure Clear;
    { IWizardPageEvents }
    procedure OnEnterPage(PageTransition: TPageTransition);
    procedure OnLeavePage(PageTransition: TPageTransition);
  protected
    procedure UpdateInfo; virtual;
    { IWizardPage }
    function Page: TFrame; virtual;
    { IWizardPageEvents }
    procedure OnLeavingPage(PageTransition: TPageTransition; var Allow: Boolean); virtual;
  public
    function PageID: TGUID; override;
    constructor Create(AID: TGuid; const AName, ATitle, ADescription: string);
    function GetImage: TBitmap;  override;

  end;

const
  // Wizard control margins
  cRadioLeftMargin = 10;
  cLabelLeftMargin = 10;

implementation



{ TDSPageListMrWizard }

constructor TDSPageListMrWizard.Create(const APersonality: string; const ACaption: string;
AHelpContext: Integer; const AImageName: string; const AOptionsFileName: string);
begin
  inherited;
end;

function TDSPageListMrWizard.IsPageSelected(APage: TDSPageClass): Boolean;
begin
  Result := True;
end;

procedure TDSPageListMrWizard.OnEnterPage(LastPage, CurrentPage: IWizardPage;
  PageTransition: TPageTransition);
begin
  UpdatePageCount;
end;

procedure TDSPageListMrWizard.OnLeavePage(WizardPage: IWizardPage;
  PageTransition: TPageTransition);
begin

end;

procedure TDSPageListMrWizard.OnLeavingPage(WizardPage: IWizardPage;
  PageTransition: TPageTransition; var Allow: Boolean);
begin

end;

function TDSPageListMrWizard.CreateWizardPage(APage: TDSPageClass): IWizardPage;
begin
  Result := nil;
end;

function TDSPageListMrWizard.GetNextPageDictionary: TDictionary<string, TDSPageClass>;
var
  LList: TList<TDSPageClass>;
  LPage: TDSPageClass;
  LPrevPage: string;
begin
  LPrevPage := GetFirstPage.Name;
  LList := GetSelectedPageList;
  try
    Result := TObjectDictionary<string, TDSPageClass>.Create([doOwnsValues]);
    for LPage in LList do
      begin
        Result.Add(LPrevPage, ClonePage(LPage));
        LPrevPage := LPage.Name;
      end;
  finally
    LList.Free;
  end;
end;

function TDSPageListMrWizard.ClonePage(APage: TDSPageClass): TDSPageClass;
begin
  Result := TDSPageClass(APage.ClassType.Create);
  Result.Assign(APage);
end;

procedure TDSPageListMrWizard.GetPageList(AList: TList<TDSPageClass>);
begin
  Assert(False);
end;

function TDSPageListMrWizard.GetSelectedPageList: TList<TDSPageClass>;
var
  LList: TList<TDSPageClass>;
  LPage: TDSPageClass;
begin
  LList := TObjectList<TDSPageClass>.Create;
  GetPageList(LList);
  try
    Result := TObjectList<TDSPageClass>.Create;
    for LPage in LList do
      if IsPageSelected(LPage) then
        Result.Add(ClonePage(LPage));
  finally
    LList.Free;
  end;
end;

function TDSPageListMrWizard.HandleNextPage(
  const CurrentPage: IWizardPage): IWizardPage;
var
  LNextPage: TDSPageClass;
  LDictionary: TDictionary<string, TDSPageClass>;
  LLastPage: Boolean;
begin
  LLastPage := True;
  Result := nil;
  LDictionary := GetNextPageDictionary;
  try
    if LDictionary.TryGetValue(CurrentPage.Name, LNextPage) then
    begin
      Result := CreateWizardPage(LNextPage);
      LLastPage := not LDictionary.ContainsKey(LNextPage.Name);
    end;
  finally
    LDictionary.Free;
  end;
  Wizard.Finish := LLastPage;
  Wizard.Next := not LLastPage;
end;

procedure TDSPageListMrWizard.UpdatePageCount;
var
  LList: TList<TDSPageClass>;
begin
  LList := GetSelectedPageList;
  try
    UpdatePageCount(LList);
  finally
    LList.Free;
  end;
end;

procedure TDSPageListMrWizard.UpdatePageCount(AList: TList<TDSPageClass>);
var
  LName: string;
  I: Integer;
begin
  Wizard.PageCount := AList.Count + 1;
  if Wizard.CurrentPage <> nil then
  begin
    if Wizard.CurrentPage = GetFirstPage then
      Wizard.PageIndex := 1
    else
    begin
      LName := Wizard.CurrentPage.Name;
      for I := 0 to AList.Count - 1 do
        if AList[I].Name = LName then
        begin
          Wizard.PageIndex := I + 2;
          break;
        end;
    end;
  end;
end;

procedure TDSPageListMrWizard.AddCustomPages(const ParentID: TGUID; const ParentName: string);
var
  LParentID: TGUID;
  LParentName: string;

  procedure AddPage(const ChildID: TGUID; const ChildName: string;
      Callback: TWizardFunctionCallback; AllowBack: Boolean);
  begin
    Wizard.AddPage(LParentID, LParentName, ChildId,
      ChildName, Callback, AllowBack);
    LParentID := ChildId;
    LParentName := ChildName;
  end;

var
  LList: TList<TDSPageClass>;
  LPage: TDSPageClass;
begin
  LParentID := ParentID;
  LParentName := ParentName;
  LList := TObjectList<TDSPageClass>.Create;
  GetPageList(LList);
  try
    for LPage in LList do
      AddPage(LPage.Guid, LPage.Name, HandleNextPage, True);
    UpdatePageCount(LList);
  finally
    LList.Free;
  end;
end;

function TDSPageListMrWizard.HasCustomPages: Boolean;
begin
  Result := True;
end;

function TDSPageListMrWizard.FirstCustomPage: IWizardpage;
var
  LList: TList<TDSPageClass>;
begin
  LList := GetSelectedPageList;
  try
    Assert(LList.Count > 0);
    Result := CreateWizardPage(LList[0]);
    Wizard.Next := LList.Count > 1;
    Wizard.Finish := LList.Count = 1;
  finally
    LList.Free;
  end;
end;

{ TDSPageClass }

procedure TDSPageClass.AssignTo(Dest: TPersistent);
begin
  if Dest is TDSPageClass then
  begin
    TDSPageClass(Dest).Name := Name;
    TDSPageClass(Dest).Guid := Guid;
  end
  else
    inherited;
end;

{ TDSProjectLocationWizardPage }

procedure TDSWizardPage.Clear;
begin

end;

function TDSWizardPage.Close: Boolean;
begin
  Result := True;
end;

constructor TDSWizardPage.Create(AID: TGuid; const AName, ATitle, ADescription: string);
begin
  inherited Create;
  FID := AID;
  Title := ATitle;
  Description := ADescription;
  Name := AName;
end;

function TDSWizardPage.GetImage: TBitmap;
var
  Intf: IDsWizardImage;
begin
  if Supports(Wizard.MrWizard, IDsWizardImage, Intf) then
    Result := Intf.GetImage
  else
    Result := nil;
end;

procedure TDSWizardPage.OnEnterPage(PageTransition: TPageTransition);
begin
  UpdateInfo;
end;

procedure TDSWizardPage.OnLeavePage(PageTransition: TPageTransition);
begin

end;

procedure TDSWizardPage.OnLeavingPage(PageTransition: TPageTransition;
  var Allow: Boolean);
begin

end;

function TDSWizardPage.Page: TFrame;
begin
  Assert(False);
  Result := nil;
end;

procedure TDSWizardPage.UpdateInfo;
begin

end;

function TDSWizardPage.PageID: TGUID;
begin
  Result := FID;
end;

const
  { Wizard State }
  ivFormTop = 'FormTop';
  ivFormLeft = 'FormLeft';
  ivFormWidth = 'FormWidth';
  ivFormHeight = 'FormHeight';


procedure TCustomPageMrWizard.InitOptions(const AOptionsFileName: string);
begin
  TWizardIniOptions.InitOptions(AOptionsFileName, FUIOptions);
end;

function TCustomPageMrWizard.CreatePage(const IID: TGUID; out Intf; const name: string = ''): Boolean;
var
  WizardPage: IWizardpage;
begin
  Result := False;
  WizardPage := BorlandWizards.CreatePage(IID);
  Assert(WizardPage <> nil);
  if name <> '' then
    WizardPage.name := name;
  if Supports(WizardPage, IID, Intf) then
    Result := True;
end;

function TCustomPageMrWizard.LoadImage: TBitmap;
begin
  if FImageName <> '' then
    Result := LoadImage(FImageName)
  else
    Result := nil;
end;

function TCustomPageMrWizard.LoadImage(Instance: THandle; const ResourceName: string): TBitmap;
begin
  Result := TBitmap.Create;
  try
    Result.LoadFromResourceName(Instance, ResourceName);
  except
    FreeAndNil(Result);
  end;
end;

constructor TCustomPageMrWizard.Create(const APersonality: string; const ACaption: string;
    AHelpContext: Integer; const AImage: string; const AOptionsFile: string);
begin
  inherited Create;
  FPersonality := APersonality;
  FCaption := ACaption;
  FHelpContext := AHelpContext;
  FWizard := nil;
  FImageName := AImage;
  InitOptions(AOptionsFile);
end;

destructor TCustomPageMrWizard.Destroy;
begin
  FWizard := nil;
  FUIOPtions.Free;
  FBitmap.Free;
  inherited;
end;

function TCustomPageMrWizard.CanFinish: Boolean;
begin
  Result := True;
end;

procedure TCustomPageMrWizard.AddFirstPage(out AID: TGuid; out AName: string);
begin
  Assert(False);
end;

procedure TCustomPageMrWizard.Cancel;
begin
  if FUIOptions <> nil then
  begin
    FUIOptions[ivFormLeft] := Wizard.WizardForm.Left;
    FUIOptions[ivFormTop] := Wizard.WizardForm.Top;
    FUIOptions[ivFormWidth] := Wizard.WizardForm.Width;
    FUIOptions[ivFormHeight] := Wizard.WizardForm.Height;
  end;
end;


procedure TCustomPageMrWizard.Start;
var
  LID: TGUID;
  LName: string;
begin
  if Wizard <> nil then
  begin
    if FUIOptions <> nil then
    begin
      Wizard.WizardForm.Left := FUIOptions.GetOption(ivFormLeft, Wizard.WizardForm.Left);
      Wizard.WizardForm.Top := FUIOptions.GetOption(ivFormTop, Wizard.WizardForm.Top);
      Wizard.WizardForm.Width := FUIOptions.GetOption(ivFormWidth, Wizard.WizardForm.Width);
      Wizard.WizardForm.Height := FUIOptions.GetOption(ivFormHeight, Wizard.WizardForm.Height);
    end;

    AddFirstPage(LID, LName);
    if HasCustomPages then
      AddCustomPages(LID,
      LName);
  end;
end;

function TCustomPageMrWizard.HasCustomPages: Boolean;
begin
  Result := False;
end;

procedure TCustomPageMrWizard.AddCustomPages(const ParentID: TGUID; const ParentName: string);
begin
  Assert(False);
end;

procedure TCustomPageMrWizard.Finish;
begin
  if FUIOptions <> nil then
  begin
    FUIOptions[ivFormLeft] := Wizard.WizardForm.Left;
    FUIOptions[ivFormTop] := Wizard.WizardForm.Top;
    FUIOptions[ivFormWidth] := Wizard.WizardForm.Width;
    FUIOptions[ivFormHeight] := Wizard.WizardForm.Height;
  end;
end;

function TCustomPageMrWizard.FirstCustomPage: IWizardpage;
begin
  Assert(False);
end;

function TCustomPageMrWizard.FirstPage: IWizardpage;
begin
  Result := GetFirstPage as IWizardPage;
  Wizard.Back := False;
  Wizard.Next := True;
  Wizard.Finish := False;
  Wizard.Cancel := True;
end;

function TCustomPageMrWizard.GetFirstPage: IWizardpage;
begin
  Assert(False); // Ancestor must override
end;

function TCustomPageMrWizard.GetHelpContext: Integer;
begin
  Result := FHelpContext;
end;

function TCustomPageMrWizard.GetImage: TBitmap;
begin
  if FBitmap = nil then
    FBitmap := LoadImage;
  Result := FBitmap;
end;

function TCustomPageMrWizard.Caption: string;
begin
  Result := FCaption;
end;

function TCustomPageMrWizard.GetPersonality: string;
begin
  Result := FPersonality;
end;


function TCustomPageMrWizard.GetWizard: IWizard;
begin
  Result := FWizard;
end;

procedure TCustomPageMrWizard.SetWizard(const Value: IWizard);
begin
  FWizard := Value;
end;


end.
