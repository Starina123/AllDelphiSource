unit WinAPI.WindowsStore;

{$SCOPEDENUMS ON}

interface

uses
  System.Generics.Collections, System.SysUtils, System.Classes, System.TimeSpan,
  System.Win.WinRT, WinAPI.WinRT, WinAPI.Windows, WinAPI.CommonTypes,
  WinAPI.WinRT.Utils;

type
  TAppLicense = class
  private
    FIsActive: boolean;
    FIsTrial: boolean;
    FIsTrialOwnedByThisUser: boolean;
    FExtendedJsonData: string;
    FExpirationDate: TDateTime;
    FSkuStoreId: string;
    FTrialTimeRemaining: TTimeSpan;
    FTrialUniqueId: string;
    FStoreLicense: IStoreAppLicense;
    FInfo: TStringList;
  public
    constructor Create(const AStoreLicense: IStoreAppLicense);
    destructor Destroy; override;
    function ToString: string; override;
    function GetInfo: TStringList;
    property IsActive: boolean read FIsActive;
    property IsTrial: boolean read FIsTrial;
    property IsTrialOwnedByThisUser: boolean read FIsTrialOwnedByThisUser;
    property ExtendedJsonData: string read FExtendedJsonData;
    property ExpirationDate: TDateTime read FExpirationDate;
    property SkuStoreId: string read FSkuStoreId;
    property TrialTimeRemaining: TTimeSpan read FTrialTimeRemaining;
    property TrialUniqueId: string read FTrialUniqueId;
    property StoreLicense: IStoreAppLicense read FStoreLicense;
  end;

  TAppProducts = class
  private
    FProducts: TList<IStoreProduct>;
    function GetProducts(const Index: Integer): IStoreProduct;
  protected
    procedure Clear;
    procedure Add(AStoreProduct: IStoreProduct);
  public
    constructor Create; virtual;
    destructor Destroy; override;
    function Count: Integer;
    function UserHasBought(const AInAppOfferToken: String): boolean;
    function IndexOf(const AInAppOfferToken: String): Integer; overload;
    function IndexOf(const AStoreProduct: IStoreProduct): Integer; overload;
    property Products[const Index: Integer]: IStoreProduct read GetProducts; default;
  end;

  TStoreProductKind = (Application, Game, Consumable, UnmanagedConsumable, Durable);
  TStoreProductKinds = set of TStoreProductKind;

  TStoreProductKindNames = class sealed
  public const
    Application = 'Application';                  // Do not localize
    Game = 'Game';                                // Do not localize
    Consumable = 'Consumable';                    // Do not localize
    UnmanagedConsumable = 'UnmanagedConsumable';  // Do not localize
    Durable = 'Durable';                          // Do not localize
  end;

  /// <summary>
  /// The Windows.Services.Store namespace was introduced in Windows 10, version 1607, and it can only
  /// be used in projects that target Windows 10 Anniversary Edition (10.0; Build 14393) or a later release.
  /// </summary>
  TWindowsStoreCore = class
  private
    FStoreContext: IStoreContext;
    FAppLicense: TAppLicense;
    FAppProducts: TAppProducts;
    FUserCollection: TAppProducts;
    FApplicationProcessMessages: TApplicationProcessMessagesProc;

    procedure InitStoreContext;
    function GetAppLicense: TAppLicense;
    function GetAppProducts: TAppProducts;
    function GetUserCollection: TAppProducts;
    procedure ResetAppProducts(var AAppProducts: TAppProducts);
    function GetProductsFilter(const ProductKinds: TStoreProductKinds): IIterable_1__HSTRING;
    function GetStoreProductForCurrentApp: IStoreProduct;
  public
    constructor Create(const AApplicationProcessMessages: TApplicationProcessMessagesProc); virtual;
    destructor Destroy; override;
    /// <summary>
    /// Requests the purchase for the specified app or add-on and displays the UI that is used to complete the transaction via the Microsoft Store.
    /// Important: This method must be called on the UI thread.
    /// </summary>
    function PurchaseProduct(AStoreProduct: IStoreProduct): StorePurchaseStatus;

    /// <summary>
    /// Reports a consumable add-on for the current app as fulfilled in the Microsoft Store.
    /// </summary>
    function ReportConsumableFulfillment(const AProductStoreId: String; const AQuantity: UInt32;
      const ATrackingId: TGUID): IStoreConsumableResult;

    /// <summary>
    /// Reports an unmanaged-consumable add-on for the current app as fulfilled in the Microsoft Store.
    /// </summary>
    function ReportUnmanagedConsumableFulfillment(const AProductStoreId: String; const ATrackingId: TGUID)
      : IStoreConsumableResult;

    /// <summary>
    /// Gets the remaining balance for the specified consumable add-on for the current app.
    /// Use consumable add-ons for items that can be purchased, used, and purchased again.
    /// This is especially useful for things like in-game currency (gold, coins, etc.)
    /// that can be purchased and then used to purchase specific power-ups.
    /// </summary>
    function GetConsumableBalanceRemaining(const AStoreProduct: IStoreProduct): IStoreConsumableResult;

    /// <summary>
    /// Refreshed informations about products and user collection
    /// </summary>

    procedure RefreshInfo;
    /// <summary>
    /// Return true id the current user has bought the specified InAppOfferToken.
    /// </summary>
    function UserHasBought(const AInAppOfferToken: String): boolean;
    /// <summary>
    /// Gets license info for the current app, including licenses for add-ons for the current app.
    /// </summary>
    property AppLicense: TAppLicense read GetAppLicense;
    /// <summary>
    /// Gets Microsoft Store listing info for the products that can be purchased from within the current app.
    /// </summary>
    property AppProducts: TAppProducts read GetAppProducts;
    /// <summary>
    /// Gets Microsoft Store info for the add-ons of the current app for which the user has purchased.
    /// </summary>
    property UserCollection: TAppProducts read GetUserCollection;
    property StoreProductForCurrentApp: IStoreProduct read GetStoreProductForCurrentApp;
  end;

  IInitializeWithWindow = interface(IUnknown)
    ['{3E68D4BD-7135-4D10-8018-9FB6D9F33FA1}']
    procedure Initialize(hwnd: HANDLE_PTR);
  end;

implementation

uses WinAPI.ServicesRT.Store, WinAPI.HSTRINGIterables;

resourcestring
  StrProductsNotIterable = 'Products list is not iterable';
  Str_IAP_E_UNEXPECTED = 'Cannot initialize Store interface (IAP_E_UNEXPECTED)';
  StrCannotGetCurrAppStoreProduct = 'Cannot get store product for current app';

const
  IAP_E_UNEXPECTED: Int64 = $803F6107;
  AllProductsKinds: TStoreProductKinds = [TStoreProductKind.Application, TStoreProductKind.Game,
    TStoreProductKind.Consumable, TStoreProductKind.UnmanagedConsumable, TStoreProductKind.Durable];
  StrInfoNamesIsActive = 'IsActive';
  StrInfoNamesIsTrial = 'IsTrial';
  StrInfoNamesIsTrialOwnedByThisUser = 'IsTrialOwnedByThisUser';
  StrInfoNamesExtendedJsonData = 'ExtendedJsonData';
  StrInfoNamesExpirationDate = 'ExpirationDate';
  StrInfoNamesSkuStoreId = 'SkuStoreId';
  StrInfoNamesTrialTimeRemaining = 'TrialTimeRemaining';
  StrInfoNamesTrialUniqueId = 'TrialUniqueId';


  { TWindowsStoreCore }

constructor TWindowsStoreCore.Create(const AApplicationProcessMessages: TApplicationProcessMessagesProc);
begin
  inherited Create;
  Assert(Assigned(AApplicationProcessMessages), 'AApplicationProcessMessages cannot be nil');
  FApplicationProcessMessages := AApplicationProcessMessages;
  InitStoreContext;
end;

destructor TWindowsStoreCore.Destroy;
begin
  FAppLicense.Free;
  FAppProducts.Free;
  FUserCollection.Free;
  inherited;
end;

function TWindowsStoreCore.GetAppProducts: TAppProducts;
var
  LProducts: IMapView_2__HSTRING__IStoreProduct;
  LProductsIterable: IIterable_1__IKeyValuePair_2__HSTRING__IStoreProduct;
  LProductsIterator: IIterator_1__IKeyValuePair_2__HSTRING__IStoreProduct;
  LFilterList: IIterable_1__HSTRING;
  lAddOns: IAsyncOperation_1__IStoreProductQueryResult;
begin
  if Assigned(FAppProducts) then
  begin
    Exit(FAppProducts);
  end;

  LFilterList := GetProductsFilter(AllProductsKinds);

  { Gets Microsoft Store listing info for the products that can be purchased from within the current app. }
  lAddOns := FStoreContext.GetAssociatedStoreProductsAsync(LFilterList);
  Await(lAddOns, FApplicationProcessMessages);
  if lAddOns.GetResults.ExtendedError = IAP_E_UNEXPECTED then
    raise Exception.Create(Str_IAP_E_UNEXPECTED);

  LProducts := lAddOns.GetResults.Products;

  if not Supports(LProducts, IIterable_1__IKeyValuePair_2__HSTRING__IStoreProduct_Base, LProductsIterable) then
    raise Exception.Create(StrProductsNotIterable);

  ResetAppProducts(FAppProducts);

  LProductsIterator := LProductsIterable.First();
  while LProductsIterator.HasCurrent do
  begin
    FAppProducts.Add(LProductsIterator.Current.Value);
    LProductsIterator.MoveNext;
  end;
  Result := FAppProducts;
end;

function TWindowsStoreCore.GetConsumableBalanceRemaining(const AStoreProduct: IStoreProduct): IStoreConsumableResult;
var
  LStoreConsumableResult: IAsyncOperation_1__IStoreConsumableResult;
begin
  LStoreConsumableResult := FStoreContext.GetConsumableBalanceRemainingAsync(AStoreProduct.StoreId);
  Await(LStoreConsumableResult, FApplicationProcessMessages);
  Result := LStoreConsumableResult.GetResults;
end;

function TWindowsStoreCore.GetProductsFilter(const ProductKinds: TStoreProductKinds): IIterable_1__HSTRING;
begin
  Result := TIterableHSTRING.Create;
  if TStoreProductKind.Consumable in ProductKinds then
    TIterableHSTRING(Result).Add(CreateHSTRING(TStoreProductKindNames.Consumable));
  if TStoreProductKind.Durable in ProductKinds then
    TIterableHSTRING(Result).Add(CreateHSTRING(TStoreProductKindNames.Durable));
  if TStoreProductKind.UnmanagedConsumable in ProductKinds then
    TIterableHSTRING(Result).Add(CreateHSTRING(TStoreProductKindNames.UnmanagedConsumable));
  if TStoreProductKind.Application in ProductKinds then
    TIterableHSTRING(Result).Add(CreateHSTRING(TStoreProductKindNames.Application));
  if TStoreProductKind.Game in ProductKinds then
    TIterableHSTRING(Result).Add(CreateHSTRING(TStoreProductKindNames.Game));
end;

function TWindowsStoreCore.GetStoreProductForCurrentApp: IStoreProduct;
var
  LRes: IAsyncOperation_1__IStoreProductResult;
begin
  LRes := FStoreContext.GetStoreProductForCurrentAppAsync();
  Await(LRes, FApplicationProcessMessages);
  if not Succeeded(LRes.GetResults.ExtendedError) then
  begin
    raise Exception.Create(StrCannotGetCurrAppStoreProduct);
  end;
  Result := LRes.GetResults.Product;
end;

function TWindowsStoreCore.GetUserCollection: TAppProducts;
var
  lPrdcts: IMapView_2__HSTRING__IStoreProduct;
  lOut: IIterable_1__IKeyValuePair_2__HSTRING__IStoreProduct;
  lIterator: IIterator_1__IKeyValuePair_2__HSTRING__IStoreProduct;
  LFilterList: IIterable_1__HSTRING;
  LUserProducts: IAsyncOperation_1__IStoreProductQueryResult;
begin
  if Assigned(FUserCollection) then
  begin
    Exit(FUserCollection);
  end;

  LFilterList := GetProductsFilter(AllProductsKinds);
  LUserProducts := FStoreContext.GetUserCollectionAsync(LFilterList);
  Await(LUserProducts, FApplicationProcessMessages);
  if LUserProducts.GetResults.ExtendedError = IAP_E_UNEXPECTED then
    raise Exception.Create(Str_IAP_E_UNEXPECTED);

  lPrdcts := LUserProducts.GetResults.Products;

  if not Supports(lPrdcts, IIterable_1__IKeyValuePair_2__HSTRING__IStoreProduct_Base, lOut) then
    raise Exception.Create(StrProductsNotIterable);

  ResetAppProducts(FUserCollection);

  lIterator := lOut.First();
  while lIterator.HasCurrent do
  begin
    FUserCollection.Add(lIterator.Current.Value);
    lIterator.MoveNext;
  end;
  Result := FUserCollection;
end;

function TWindowsStoreCore.GetAppLicense: TAppLicense;
var
  LAppLicense: IAsyncOperation_1__IStoreAppLicense;
begin
  if not Assigned(FAppLicense) then
  begin
    LAppLicense := FStoreContext.GetAppLicenseAsync();
    Await(LAppLicense, FApplicationProcessMessages);
    FAppLicense := TAppLicense.Create(LAppLicense.GetResults);
  end;
  Result := FAppLicense;
end;

procedure TWindowsStoreCore.InitStoreContext;
begin
  if not Assigned(FStoreContext) then
  begin
    FStoreContext := TStoreContext.Statics.GetDefault();
  end;
end;

function TWindowsStoreCore.PurchaseProduct(AStoreProduct: IStoreProduct): StorePurchaseStatus;
var
  LPurchaseRequest: IAsyncOperation_1__IStorePurchaseResult;
  LInitWindow: IInitializeWithWindow;
begin
  // https://github.com/Microsoft/Windows-universal-samples/blob/master/Samples/Store/cs/Scenario2_InAppPurchase.xaml.cs
  // This method *must* be called on the Main thread
  TThread.Synchronize(nil,
    procedure
    begin
      LInitWindow := FStoreContext as IInitializeWithWindow;
      LInitWindow.Initialize(GetForegroundWindow());
      LPurchaseRequest := FStoreContext.RequestPurchaseAsync(AStoreProduct.StoreId);
      Await(LPurchaseRequest, FApplicationProcessMessages);
    end);
  Result := LPurchaseRequest.GetResults.Status;
end;

procedure TWindowsStoreCore.RefreshInfo;
begin
  FreeAndNil(FAppLicense);
  AppLicense;
  FreeAndNil(FAppProducts);
  FreeAndNil(FUserCollection);
  AppProducts.Count; // just to refresh
  UserCollection.Count; // just to refresh
end;

function TWindowsStoreCore.ReportConsumableFulfillment(const AProductStoreId: String; const AQuantity: UInt32;
const ATrackingId: TGUID): IStoreConsumableResult;
var
  LStoreConsumableResult: IAsyncOperation_1__IStoreConsumableResult;
begin
  LStoreConsumableResult := FStoreContext.ReportConsumableFulfillmentAsync(CreateHSTRING(AProductStoreId), AQuantity,
    ATrackingId);
  Await(LStoreConsumableResult, FApplicationProcessMessages);
  Result := LStoreConsumableResult.GetResults;
end;

function TWindowsStoreCore.ReportUnmanagedConsumableFulfillment(const AProductStoreId: String; const ATrackingId: TGUID)
  : IStoreConsumableResult;
begin
  { Quantity:
    For a developer-managed consumable (that is, a consumable where the developer
    keeps track of the balance), specify 1.
  }
  Result := ReportConsumableFulfillment(AProductStoreId, 1, ATrackingId);
end;

procedure TWindowsStoreCore.ResetAppProducts(var AAppProducts: TAppProducts);
begin
  if not Assigned(AAppProducts) then
  begin
    AAppProducts := TAppProducts.Create;
  end
  else
  begin
    AAppProducts.Clear;
  end;
end;

function TWindowsStoreCore.UserHasBought(const AInAppOfferToken: String): boolean;
begin
  Result := UserCollection.UserHasBought(AInAppOfferToken);
end;

constructor TAppLicense.Create(const AStoreLicense: IStoreAppLicense);
begin
  inherited Create;
  FIsActive := AStoreLicense.IsActive;
  FIsTrial := AStoreLicense.IsTrial;
  FIsTrialOwnedByThisUser := AStoreLicense.IsTrialOwnedByThisUser;
  FExtendedJsonData := AStoreLicense.ExtendedJsonData.ToString;
  FExpirationDate := DateTimeToTDateTime(AStoreLicense.ExpirationDate);
  FSkuStoreId := AStoreLicense.SkuStoreId.ToString;
  FTrialTimeRemaining := TTimeSpan.Create(AStoreLicense.TrialTimeRemaining.Duration);
  FTrialUniqueId := AStoreLicense.TrialUniqueId.ToString;
  FStoreLicense := AStoreLicense;
end;

destructor TAppLicense.Destroy;
begin
  FInfo.Free;
  inherited;
end;

function TAppLicense.GetInfo: TStringList;
begin
  if not Assigned(FInfo) then
  begin
    FInfo := TStringList.Create;
    try
      FInfo.Values[StrInfoNamesIsActive] := IsActive.ToString(TUseBoolStrs.True);
      FInfo.Values[StrInfoNamesIsTrial] := IsTrial.ToString(TUseBoolStrs.True);
      FInfo.Values[StrInfoNamesIsTrialOwnedByThisUser] := IsTrialOwnedByThisUser.ToString(TUseBoolStrs.True);
      FInfo.Values[StrInfoNamesExtendedJsonData] := ExtendedJsonData;
      FInfo.Values[StrInfoNamesExpirationDate] := DateTimeToStr(FExpirationDate);
      FInfo.Values[StrInfoNamesSkuStoreId] := FSkuStoreId;
      FInfo.Values[StrInfoNamesTrialTimeRemaining] := FTrialTimeRemaining;
      FInfo.Values[StrInfoNamesTrialUniqueId] := FTrialUniqueId;
    except
      FreeAndNil(FInfo);
      raise;
    end;
  end;
  Result := FInfo;
end;

function TAppLicense.ToString: string;
begin
  Result := GetInfo.Text;
end;

procedure TAppProducts.Add(AStoreProduct: IStoreProduct);
begin
  FProducts.Add(AStoreProduct);
end;

procedure TAppProducts.Clear;
begin
  FProducts.Clear;
end;

function TAppProducts.Count: Integer;
begin
  Result := FProducts.Count;
end;

constructor TAppProducts.Create;
begin
  inherited;
  FProducts := TList<IStoreProduct>.Create;
end;

destructor TAppProducts.Destroy;
begin
  FProducts.Free;
  inherited;
end;

function TAppProducts.GetProducts(const Index: Integer): IStoreProduct;
begin
  Result := FProducts[Index];
end;

function TAppProducts.IndexOf(const AInAppOfferToken: String): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to FProducts.Count - 1 do
  begin
    if TWindowsString.HStringToString(FProducts[I].InAppOfferToken) = AInAppOfferToken then
    begin
      Exit(I);
    end;
  end;
end;

function TAppProducts.IndexOf(const AStoreProduct: IStoreProduct): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to FProducts.Count - 1 do
  begin
    if FProducts[I] = AStoreProduct then
    begin
      Exit(I);
    end;
  end;
end;

function TAppProducts.UserHasBought(const AInAppOfferToken: String): boolean;
begin
  Result := IndexOf(AInAppOfferToken) > -1;
end;

end.
