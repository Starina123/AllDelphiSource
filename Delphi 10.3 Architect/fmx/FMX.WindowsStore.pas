{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.WindowsStore;

interface

uses
  System.SysUtils, System.Classes, WinAPI.WindowsStore, WinAPI.CommonTypes,
  FMX.Controls;

type
  [ComponentPlatformsAttribute(pidWin32 or pidWin64)]
  TWindowsStore = class(TComponent)
  private
    FWindowsStore: TWindowsStoreCore;
    function GetAppLicense: TAppLicense;
    function GetAppProducts: TAppProducts;
    function GetStoreProductForCurrentApp: IStoreProduct;
    function GetUserCollection: TAppProducts;
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    // methods from TWindowsStoreCore

    /// <summary>
    /// Requests the purchase for the specified app or add-on and displays the UI that is used to complete the transaction via the Microsoft Store.
    /// Important: This method must be called on the UI thread.
    /// </summary>
    function PurchaseProduct(AStoreProduct: IStoreProduct): StorePurchaseStatus;

    /// <summary>
    /// Reports a consumable add-on for the current app as fulfilled in the Microsoft Store.
    /// </summary>
    function ReportConsumableFulfillment(const AProductStoreId: String;
      const AQuantity: UInt32; const ATrackingId: TGUID)
      : IStoreConsumableResult;

    /// <summary>
    /// Reports an unmanaged-consumable add-on for the current app as fulfilled in the Microsoft Store.
    /// </summary>
    function ReportUnmanagedConsumableFulfillment(const AProductStoreId: String;
      const ATrackingId: TGUID): IStoreConsumableResult;

    /// <summary>
    /// Gets the remaining balance for the specified consumable add-on for the current app.
    /// Use consumable add-ons for items that can be purchased, used, and purchased again.
    /// This is especially useful for things like in-game currency (gold, coins, etc.)
    /// that can be purchased and then used to purchase specific power-ups.
    /// </summary>
    function GetConsumableBalanceRemaining(const AStoreProduct: IStoreProduct)
      : IStoreConsumableResult;

    /// <summary>
    /// Refreshed informations about products and user collection
    /// </summary>

    procedure RefreshInfo;
    /// <summary>
    /// Return true id the current user has bought the specified InAppOfferToken.
    /// </summary>
    function UserHasBought(const AInAppOfferToken: String): boolean;
    // properties from TWindowsStoreCore

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
    /// <summary>
    /// Represent this app itself.
    /// </summary>
    property StoreProductForCurrentApp: IStoreProduct
      read GetStoreProductForCurrentApp;

  published
    { Published declarations }
  end;

implementation

uses
  FMX.Forms;

{ TWindowsStore }

constructor TWindowsStore.Create(AOwner: TComponent);
begin
  inherited;
  FWindowsStore := TWindowsStoreCore.Create(Application.ProcessMessages);
end;

destructor TWindowsStore.Destroy;
begin
  FWindowsStore.Free;
  inherited;
end;

function TWindowsStore.GetAppLicense: TAppLicense;
begin
  Result := FWindowsStore.AppLicense;
end;

function TWindowsStore.GetAppProducts: TAppProducts;
begin
  Result := FWindowsStore.AppProducts;
end;

function TWindowsStore.GetConsumableBalanceRemaining(const AStoreProduct
  : IStoreProduct): IStoreConsumableResult;
begin
  Result := FWindowsStore.GetConsumableBalanceRemaining(AStoreProduct);
end;

function TWindowsStore.GetStoreProductForCurrentApp: IStoreProduct;
begin
  Result := FWindowsStore.StoreProductForCurrentApp;
end;

function TWindowsStore.GetUserCollection: TAppProducts;
begin
  Result := FWindowsStore.UserCollection;
end;

function TWindowsStore.PurchaseProduct(AStoreProduct: IStoreProduct)
  : StorePurchaseStatus;
begin
  Result := FWindowsStore.PurchaseProduct(AStoreProduct);
end;

procedure TWindowsStore.RefreshInfo;
begin
  FWindowsStore.RefreshInfo;
end;

function TWindowsStore.ReportConsumableFulfillment(const AProductStoreId
  : String; const AQuantity: UInt32; const ATrackingId: TGUID)
  : IStoreConsumableResult;
begin
  Result := FWindowsStore.ReportConsumableFulfillment(AProductStoreId,
    AQuantity, ATrackingId);
end;

function TWindowsStore.ReportUnmanagedConsumableFulfillment
  (const AProductStoreId: String; const ATrackingId: TGUID)
  : IStoreConsumableResult;
begin
  Result := FWindowsStore.ReportUnmanagedConsumableFulfillment(AProductStoreId,
    ATrackingId);
end;

function TWindowsStore.UserHasBought(const AInAppOfferToken: String): boolean;
begin
  Result := FWindowsStore.UserHasBought(AInAppOfferToken);
end;

end.
