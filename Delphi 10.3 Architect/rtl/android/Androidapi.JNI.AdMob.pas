{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2013-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Androidapi.JNI.AdMob;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Location,
  Androidapi.JNI.Os,
  Androidapi.JNI.Util;

type
// ===== Forward declarations =====

  JAdActivity = interface;//com.google.android.gms.ads.AdActivity
  JAdListener = interface;//com.google.android.gms.ads.AdListener
  JAdRequest = interface;//com.google.android.gms.ads.AdRequest
  JAdRequest_Builder = interface;//com.google.android.gms.ads.AdRequest$Builder
  JAdSize = interface;//com.google.android.gms.ads.AdSize
  JAdView = interface;//com.google.android.gms.ads.AdView
  JInterstitialAd = interface;//com.google.android.gms.ads.InterstitialAd
  JAppEventListener = interface;//com.google.android.gms.ads.doubleclick.AppEventListener
  JCustomRenderedAd = interface;//com.google.android.gms.ads.doubleclick.CustomRenderedAd
  JOnCustomRenderedAdLoadedListener = interface;//com.google.android.gms.ads.doubleclick.OnCustomRenderedAdLoadedListener
  JPublisherAdRequest = interface;//com.google.android.gms.ads.doubleclick.PublisherAdRequest
  JPublisherAdRequest_Builder = interface;//com.google.android.gms.ads.doubleclick.PublisherAdRequest$Builder
  JPublisherAdView = interface;//com.google.android.gms.ads.doubleclick.PublisherAdView
  JPublisherInterstitialAd = interface;//com.google.android.gms.ads.doubleclick.PublisherInterstitialAd
  JInAppPurchase = interface;//com.google.android.gms.ads.purchase.InAppPurchase
  JInAppPurchaseActivity = interface;//com.google.android.gms.ads.purchase.InAppPurchaseActivity
  JInAppPurchaseListener = interface;//com.google.android.gms.ads.purchase.InAppPurchaseListener
  JInAppPurchaseResult = interface;//com.google.android.gms.ads.purchase.InAppPurchaseResult
  JPlayStorePurchaseListener = interface;//com.google.android.gms.ads.purchase.PlayStorePurchaseListener
  JSearchAdRequest = interface;//com.google.android.gms.ads.search.SearchAdRequest
  JSearchAdRequest_Builder = interface;//com.google.android.gms.ads.search.SearchAdRequest$Builder
  JSearchAdView = interface;//com.google.android.gms.ads.search.SearchAdView

// ===== Interface declarations =====

  JAdActivityClass = interface(JActivityClass)
    ['{439F386F-D57B-41AA-917E-392A23F51ECE}']
    {class} function _GetCLASS_NAME: JString; cdecl;
    {class} function _GetSIMPLE_CLASS_NAME: JString; cdecl;
    {class} function init: JAdActivity; cdecl;
    {class} property CLASS_NAME: JString read _GetCLASS_NAME;
    {class} property SIMPLE_CLASS_NAME: JString read _GetSIMPLE_CLASS_NAME;
  end;

  [JavaSignature('com/google/android/gms/ads/AdActivity')]
  JAdActivity = interface(JActivity)
    ['{82CE84CE-F616-41F0-88ED-D53DBE675F15}']
    procedure setContentView(view: JView); cdecl; overload;
    procedure setContentView(layoutResID: Integer); cdecl; overload;
    procedure setContentView(view: JView; params: JViewGroup_LayoutParams); cdecl; overload;
  end;
  TJAdActivity = class(TJavaGenericImport<JAdActivityClass, JAdActivity>) end;

  JAdListenerClass = interface(JObjectClass)
    ['{22D3BB99-7931-49A5-B29C-893667600EFD}']
    {class} function init: JAdListener; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/AdListener')]
  JAdListener = interface(JObject)
    ['{62EE9CD8-6B80-4046-A01D-5AFDFC095925}']
    procedure onAdClosed; cdecl;
    procedure onAdFailedToLoad(errorCode: Integer); cdecl;
    procedure onAdLeftApplication; cdecl;
    procedure onAdLoaded; cdecl;
    procedure onAdOpened; cdecl;
  end;
  TJAdListener = class(TJavaGenericImport<JAdListenerClass, JAdListener>) end;

  JAdRequestClass = interface(JObjectClass)
    ['{83BBA0E5-5A1B-4C4E-8174-BF55FB897504}']
    {class} function _GetDEVICE_ID_EMULATOR: JString; cdecl;
    {class} function _GetERROR_CODE_INTERNAL_ERROR: Integer; cdecl;
    {class} function _GetERROR_CODE_INVALID_REQUEST: Integer; cdecl;
    {class} function _GetERROR_CODE_NETWORK_ERROR: Integer; cdecl;
    {class} function _GetERROR_CODE_NO_FILL: Integer; cdecl;
    {class} function _GetGENDER_FEMALE: Integer; cdecl;
    {class} function _GetGENDER_MALE: Integer; cdecl;
    {class} function _GetGENDER_UNKNOWN: Integer; cdecl;
    {class} function _GetMAX_CONTENT_URL_LENGTH: Integer; cdecl;
    {class} property DEVICE_ID_EMULATOR: JString read _GetDEVICE_ID_EMULATOR;
    {class} property ERROR_CODE_INTERNAL_ERROR: Integer read _GetERROR_CODE_INTERNAL_ERROR;
    {class} property ERROR_CODE_INVALID_REQUEST: Integer read _GetERROR_CODE_INVALID_REQUEST;
    {class} property ERROR_CODE_NETWORK_ERROR: Integer read _GetERROR_CODE_NETWORK_ERROR;
    {class} property ERROR_CODE_NO_FILL: Integer read _GetERROR_CODE_NO_FILL;
    {class} property GENDER_FEMALE: Integer read _GetGENDER_FEMALE;
    {class} property GENDER_MALE: Integer read _GetGENDER_MALE;
    {class} property GENDER_UNKNOWN: Integer read _GetGENDER_UNKNOWN;
    {class} property MAX_CONTENT_URL_LENGTH: Integer read _GetMAX_CONTENT_URL_LENGTH;
  end;

  [JavaSignature('com/google/android/gms/ads/AdRequest')]
  JAdRequest = interface(JObject)
    ['{6A952D89-493B-4EC3-9B2D-419540C3E919}']
    function getBirthday: JDate; cdecl;
    function getContentUrl: JString; cdecl;
    function getGender: Integer; cdecl;
    function getKeywords: JSet; cdecl;
    function getLocation: JLocation; cdecl;
    //function getNetworkExtras(networkExtrasClass: Jlang_Class): JNetworkExtras; cdecl;
    function isTestDevice(context: JContext): Boolean; cdecl;
  end;
  TJAdRequest = class(TJavaGenericImport<JAdRequestClass, JAdRequest>) end;

  JAdRequest_BuilderClass = interface(JObjectClass)
    ['{31A61751-C547-4A56-AB61-F867EBA5961D}']
    {class} function init: JAdRequest_Builder; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/AdRequest$Builder')]
  JAdRequest_Builder = interface(JObject)
    ['{983C6775-921E-4A57-B560-F364B7D60ADC}']
    function addKeyword(keyword: JString): JAdRequest_Builder; cdecl;
    //function addNetworkExtras(networkExtras: JNetworkExtras): JAdRequest_Builder; cdecl;
    function addTestDevice(deviceId: JString): JAdRequest_Builder; cdecl;
    function build: JAdRequest; cdecl;
    function setBirthday(birthday: JDate): JAdRequest_Builder; cdecl;
    function setContentUrl(contentUrl: JString): JAdRequest_Builder; cdecl;
    function setGender(gender: Integer): JAdRequest_Builder; cdecl;
    function setLocation(location: JLocation): JAdRequest_Builder; cdecl;
    function setRequestAgent(requestAgent: JString): JAdRequest_Builder; cdecl;
    function tagForChildDirectedTreatment(tagForChildDirectedTreatment: Boolean): JAdRequest_Builder; cdecl;
  end;
  TJAdRequest_Builder = class(TJavaGenericImport<JAdRequest_BuilderClass, JAdRequest_Builder>) end;

  JAdSizeClass = interface(JObjectClass)
    ['{3A15A6B8-8EB9-49BA-9FD9-6B8D507F7707}']
    {class} function _GetAUTO_HEIGHT: Integer; cdecl;
    {class} function _GetBANNER: JAdSize; cdecl;
    {class} function _GetFULL_BANNER: JAdSize; cdecl;
    {class} function _GetFULL_WIDTH: Integer; cdecl;
    {class} function _GetLARGE_BANNER: JAdSize; cdecl;
    {class} function _GetLEADERBOARD: JAdSize; cdecl;
    {class} function _GetMEDIUM_RECTANGLE: JAdSize; cdecl;
    {class} function _GetSMART_BANNER: JAdSize; cdecl;
    {class} function _GetWIDE_SKYSCRAPER: JAdSize; cdecl;
    {class} function init(width: Integer; height: Integer): JAdSize; cdecl;
    {class} property AUTO_HEIGHT: Integer read _GetAUTO_HEIGHT;
    {class} property BANNER: JAdSize read _GetBANNER;
    {class} property FULL_BANNER: JAdSize read _GetFULL_BANNER;
    {class} property FULL_WIDTH: Integer read _GetFULL_WIDTH;
    {class} property LARGE_BANNER: JAdSize read _GetLARGE_BANNER;
    {class} property LEADERBOARD: JAdSize read _GetLEADERBOARD;
    {class} property MEDIUM_RECTANGLE: JAdSize read _GetMEDIUM_RECTANGLE;
    {class} property SMART_BANNER: JAdSize read _GetSMART_BANNER;
    {class} property WIDE_SKYSCRAPER: JAdSize read _GetWIDE_SKYSCRAPER;
  end;

  [JavaSignature('com/google/android/gms/ads/AdSize')]
  JAdSize = interface(JObject)
    ['{6A30E519-3C74-464C-B145-C0A6A02B3093}']
    function equals(other: JObject): Boolean; cdecl;
    function getHeight: Integer; cdecl;
    function getHeightInPixels(context: JContext): Integer; cdecl;
    function getWidth: Integer; cdecl;
    function getWidthInPixels(context: JContext): Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isAutoHeight: Boolean; cdecl;
    function isFullWidth: Boolean; cdecl;
    function toString: JString; cdecl;
  end;
  TJAdSize = class(TJavaGenericImport<JAdSizeClass, JAdSize>) end;

  JAdViewClass = interface(JViewGroupClass)
    ['{D2A51E0D-437B-4F72-8826-BCCCBF315647}']
    {class} function init(context: JContext): JAdView; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet): JAdView; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet; defStyle: Integer): JAdView; cdecl; overload;
  end;

  [JavaSignature('com/google/android/gms/ads/AdView')]
  JAdView = interface(JViewGroup)
    ['{58156621-09A0-4178-81FD-9349FD929B6B}']
    procedure destroy; cdecl;
    function getAdListener: JAdListener; cdecl;
    function getAdSize: JAdSize; cdecl;
    function getAdUnitId: JString; cdecl;
    function getInAppPurchaseListener: JInAppPurchaseListener; cdecl;
    function getMediationAdapterClassName: JString; cdecl;
    procedure loadAd(adRequest: JAdRequest); cdecl;
    procedure pause; cdecl;
    procedure resume; cdecl;
    procedure setAdListener(adListener: JAdListener); cdecl;
    procedure setAdSize(adSize: JAdSize); cdecl;
    procedure setAdUnitId(adUnitId: JString); cdecl;
    procedure setInAppPurchaseListener(inAppPurchaseListener: JInAppPurchaseListener); cdecl;
    procedure setPlayStorePurchaseParams(playStorePurchaseListener: JPlayStorePurchaseListener; publicKey: JString); cdecl;
  end;
  TJAdView = class(TJavaGenericImport<JAdViewClass, JAdView>) end;

  JInterstitialAdClass = interface(JObjectClass)
    ['{8AA805B5-8169-45DD-9FAD-C70BB5569A57}']
    {class} function init(context: JContext): JInterstitialAd; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/InterstitialAd')]
  JInterstitialAd = interface(JObject)
    ['{72B51FC0-FDA8-4006-8804-C15126DE4CEA}']
    function getAdListener: JAdListener; cdecl;
    function getAdUnitId: JString; cdecl;
    function getInAppPurchaseListener: JInAppPurchaseListener; cdecl;
    function getMediationAdapterClassName: JString; cdecl;
    function isLoaded: Boolean; cdecl;
    procedure loadAd(adRequest: JAdRequest); cdecl;
    procedure setAdListener(adListener: JAdListener); cdecl;
    procedure setAdUnitId(adUnitId: JString); cdecl;
    procedure setInAppPurchaseListener(inAppPurchaseListener: JInAppPurchaseListener); cdecl;
    procedure setPlayStorePurchaseParams(playStorePurchaseListener: JPlayStorePurchaseListener; publicKey: JString); cdecl;
    procedure show; cdecl;
  end;
  TJInterstitialAd = class(TJavaGenericImport<JInterstitialAdClass, JInterstitialAd>) end;

  JAppEventListenerClass = interface(IJavaClass)
    ['{F042C944-4B7A-48D2-83C0-FFC09FC1DCE7}']
  end;

  [JavaSignature('com/google/android/gms/ads/doubleclick/AppEventListener')]
  JAppEventListener = interface(IJavaInstance)
    ['{DEB88D3D-276B-4A03-93C1-CA9412699C9A}']
    procedure onAppEvent(var1: JString; var2: JString); cdecl;
  end;
  TJAppEventListener = class(TJavaGenericImport<JAppEventListenerClass, JAppEventListener>) end;

  JCustomRenderedAdClass = interface(IJavaClass)
    ['{5CAC8F91-3E48-416F-98AC-064E4E170DF4}']
  end;

  [JavaSignature('com/google/android/gms/ads/doubleclick/CustomRenderedAd')]
  JCustomRenderedAd = interface(IJavaInstance)
    ['{07845FA9-F639-4508-8837-AAF33C32C965}']
    function getBaseUrl: JString; cdecl;
    function getContent: JString; cdecl;
    procedure onAdRendered(var1: JView); cdecl;
    procedure recordClick; cdecl;
    procedure recordImpression; cdecl;
  end;
  TJCustomRenderedAd = class(TJavaGenericImport<JCustomRenderedAdClass, JCustomRenderedAd>) end;

  JOnCustomRenderedAdLoadedListenerClass = interface(IJavaClass)
    ['{31D37E94-2013-48EA-AD77-8CFCEA114133}']
  end;

  [JavaSignature('com/google/android/gms/ads/doubleclick/OnCustomRenderedAdLoadedListener')]
  JOnCustomRenderedAdLoadedListener = interface(IJavaInstance)
    ['{BB54CF6D-E855-4B0D-A3B1-32D44FEA4F05}']
    procedure onCustomRenderedAdLoaded(var1: JCustomRenderedAd); cdecl;
  end;
  TJOnCustomRenderedAdLoadedListener = class(TJavaGenericImport<JOnCustomRenderedAdLoadedListenerClass, JOnCustomRenderedAdLoadedListener>) end;

  JPublisherAdRequestClass = interface(JObjectClass)
    ['{39D1125A-4F6A-4732-B0D0-E729502DC81D}']
    {class} function _GetDEVICE_ID_EMULATOR: JString; cdecl;
    {class} function _GetERROR_CODE_INTERNAL_ERROR: Integer; cdecl;
    {class} function _GetERROR_CODE_INVALID_REQUEST: Integer; cdecl;
    {class} function _GetERROR_CODE_NETWORK_ERROR: Integer; cdecl;
    {class} function _GetERROR_CODE_NO_FILL: Integer; cdecl;
    {class} function _GetGENDER_FEMALE: Integer; cdecl;
    {class} function _GetGENDER_MALE: Integer; cdecl;
    {class} function _GetGENDER_UNKNOWN: Integer; cdecl;
    {class} procedure updateCorrelator; cdecl;
    {class} property DEVICE_ID_EMULATOR: JString read _GetDEVICE_ID_EMULATOR;
    {class} property ERROR_CODE_INTERNAL_ERROR: Integer read _GetERROR_CODE_INTERNAL_ERROR;
    {class} property ERROR_CODE_INVALID_REQUEST: Integer read _GetERROR_CODE_INVALID_REQUEST;
    {class} property ERROR_CODE_NETWORK_ERROR: Integer read _GetERROR_CODE_NETWORK_ERROR;
    {class} property ERROR_CODE_NO_FILL: Integer read _GetERROR_CODE_NO_FILL;
    {class} property GENDER_FEMALE: Integer read _GetGENDER_FEMALE;
    {class} property GENDER_MALE: Integer read _GetGENDER_MALE;
    {class} property GENDER_UNKNOWN: Integer read _GetGENDER_UNKNOWN;
  end;

  [JavaSignature('com/google/android/gms/ads/doubleclick/PublisherAdRequest')]
  JPublisherAdRequest = interface(JObject)
    ['{9D3D4BD6-BAEE-47A4-983D-2109F50E56D6}']
    function getBirthday: JDate; cdecl;
    function getContentUrl: JString; cdecl;
    function getCustomTargeting: JBundle; cdecl;
    function getGender: Integer; cdecl;
    function getKeywords: JSet; cdecl;
    function getLocation: JLocation; cdecl;
    function getManualImpressionsEnabled: Boolean; cdecl;
    //function getNetworkExtras(P1: Jlang_Class): JNetworkExtras; cdecl;
    function getPublisherProvidedId: JString; cdecl;
    function isTestDevice(context: JContext): Boolean; cdecl;
  end;
  TJPublisherAdRequest = class(TJavaGenericImport<JPublisherAdRequestClass, JPublisherAdRequest>) end;

  JPublisherAdRequest_BuilderClass = interface(JObjectClass)
    ['{EBFAF2AC-A8B4-4A99-B6DA-25EC5547F2E8}']
    {class} function init: JPublisherAdRequest_Builder; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/doubleclick/PublisherAdRequest$Builder')]
  JPublisherAdRequest_Builder = interface(JObject)
    ['{D5ED5685-0497-4AC2-BD21-990B50681BF1}']
    function addCategoryExclusion(categoryExclusion: JString): JPublisherAdRequest_Builder; cdecl;
    function addCustomTargeting(key: JString; values: JList): JPublisherAdRequest_Builder; cdecl; overload;
    function addCustomTargeting(key: JString; value: JString): JPublisherAdRequest_Builder; cdecl; overload;
    function addKeyword(keyword: JString): JPublisherAdRequest_Builder; cdecl;
    //function addNetworkExtras(networkExtras: JNetworkExtras): JPublisherAdRequest_Builder; cdecl;
    function addTestDevice(deviceId: JString): JPublisherAdRequest_Builder; cdecl;
    function build: JPublisherAdRequest; cdecl;
    function setBirthday(birthday: JDate): JPublisherAdRequest_Builder; cdecl;
    function setContentUrl(contentUrl: JString): JPublisherAdRequest_Builder; cdecl;
    function setGender(gender: Integer): JPublisherAdRequest_Builder; cdecl;
    function setLocation(location: JLocation): JPublisherAdRequest_Builder; cdecl;
    function setManualImpressionsEnabled(manualImpressionsEnabled: Boolean): JPublisherAdRequest_Builder; cdecl;
    function setPublisherProvidedId(publisherProvidedId: JString): JPublisherAdRequest_Builder; cdecl;
    function setRequestAgent(requestAgent: JString): JPublisherAdRequest_Builder; cdecl;
    function tagForChildDirectedTreatment(tagForChildDirectedTreatment: Boolean): JPublisherAdRequest_Builder; cdecl;
  end;
  TJPublisherAdRequest_Builder = class(TJavaGenericImport<JPublisherAdRequest_BuilderClass, JPublisherAdRequest_Builder>) end;

  JPublisherAdViewClass = interface(JViewGroupClass)
    ['{51F802FF-7605-4151-89B3-BA90714B01D6}']
    {class} function init(context: JContext): JPublisherAdView; cdecl; overload;
    {class} function init(context: JContext; attr: JAttributeSet): JPublisherAdView; cdecl; overload;
    {class} function init(context: JContext; attr: JAttributeSet; defStyle: Integer): JPublisherAdView; cdecl; overload;
  end;

  [JavaSignature('com/google/android/gms/ads/doubleclick/PublisherAdView')]
  JPublisherAdView = interface(JViewGroup)
    ['{70C813E0-7948-4191-A891-9B2A3AA87D94}']
    procedure destroy; cdecl;
    function getAdListener: JAdListener; cdecl;
    function getAdSize: JAdSize; cdecl;
    function getAdSizes: TJavaObjectArray<JAdSize>; cdecl;
    function getAdUnitId: JString; cdecl;
    function getAppEventListener: JAppEventListener; cdecl;
    function getMediationAdapterClassName: JString; cdecl;
    function getOnCustomRenderedAdLoadedListener: JOnCustomRenderedAdLoadedListener; cdecl;
    procedure loadAd(publisherAdRequest: JPublisherAdRequest); cdecl;
    procedure pause; cdecl;
    procedure recordManualImpression; cdecl;
    procedure resume; cdecl;
    procedure setAdListener(adListener: JAdListener); cdecl;
    procedure setAdUnitId(adUnitId: JString); cdecl;
    procedure setAppEventListener(appEventListener: JAppEventListener); cdecl;
    procedure setOnCustomRenderedAdLoadedListener(onCustomRenderedAdLoadedListener: JOnCustomRenderedAdLoadedListener); cdecl;
  end;
  TJPublisherAdView = class(TJavaGenericImport<JPublisherAdViewClass, JPublisherAdView>) end;

  JPublisherInterstitialAdClass = interface(JObjectClass)
    ['{80459978-CFCD-4D2F-8A8A-1750BD100EC8}']
    {class} function init(context: JContext): JPublisherInterstitialAd; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/doubleclick/PublisherInterstitialAd')]
  JPublisherInterstitialAd = interface(JObject)
    ['{BC12B3C9-E5B3-4A05-8308-21E4A93E5EA4}']
    function getAdListener: JAdListener; cdecl;
    function getAdUnitId: JString; cdecl;
    function getAppEventListener: JAppEventListener; cdecl;
    function getMediationAdapterClassName: JString; cdecl;
    function getOnCustomRenderedAdLoadedListener: JOnCustomRenderedAdLoadedListener; cdecl;
    function isLoaded: Boolean; cdecl;
    procedure loadAd(publisherAdRequest: JPublisherAdRequest); cdecl;
    procedure setAdListener(adListener: JAdListener); cdecl;
    procedure setAdUnitId(adUnitId: JString); cdecl;
    procedure setAppEventListener(appEventListener: JAppEventListener); cdecl;
    procedure setOnCustomRenderedAdLoadedListener(onCustomRenderedAdLoadedListener: JOnCustomRenderedAdLoadedListener); cdecl;
    procedure show; cdecl;
  end;
  TJPublisherInterstitialAd = class(TJavaGenericImport<JPublisherInterstitialAdClass, JPublisherInterstitialAd>) end;

  JInAppPurchaseClass = interface(IJavaClass)
    ['{50520615-A225-40F1-800C-2F30765DEC55}']
    {class} function _GetRESOLUTION_CANCELED: Integer; cdecl;
    {class} function _GetRESOLUTION_FAILURE: Integer; cdecl;
    {class} function _GetRESOLUTION_INVALID_PRODUCT: Integer; cdecl;
    {class} function _GetRESOLUTION_SUCCESS: Integer; cdecl;
    {class} property RESOLUTION_CANCELED: Integer read _GetRESOLUTION_CANCELED;
    {class} property RESOLUTION_FAILURE: Integer read _GetRESOLUTION_FAILURE;
    {class} property RESOLUTION_INVALID_PRODUCT: Integer read _GetRESOLUTION_INVALID_PRODUCT;
    {class} property RESOLUTION_SUCCESS: Integer read _GetRESOLUTION_SUCCESS;
  end;

  [JavaSignature('com/google/android/gms/ads/purchase/InAppPurchase')]
  JInAppPurchase = interface(IJavaInstance)
    ['{2B2483F4-8783-4261-B145-70FFAA9AEF59}']
    function getProductId: JString; cdecl;
    procedure recordPlayBillingResolution(billingResponseCode: Integer); cdecl;
    procedure recordResolution(resolution: Integer); cdecl;
  end;
  TJInAppPurchase = class(TJavaGenericImport<JInAppPurchaseClass, JInAppPurchase>) end;

  JInAppPurchaseActivityClass = interface(JActivityClass)
    ['{B1215D8E-E914-4354-B9EE-571190A9884F}']
    {class} function _GetCLASS_NAME: JString; cdecl;
    {class} function _GetSIMPLE_CLASS_NAME: JString; cdecl;
    {class} function init: JInAppPurchaseActivity; cdecl;
    {class} property CLASS_NAME: JString read _GetCLASS_NAME;
    {class} property SIMPLE_CLASS_NAME: JString read _GetSIMPLE_CLASS_NAME;
  end;

  [JavaSignature('com/google/android/gms/ads/purchase/InAppPurchaseActivity')]
  JInAppPurchaseActivity = interface(JActivity)
    ['{DCC71068-7561-4CA4-8BF4-C6A30BD342AE}']
  end;
  TJInAppPurchaseActivity = class(TJavaGenericImport<JInAppPurchaseActivityClass, JInAppPurchaseActivity>) end;

  JInAppPurchaseListenerClass = interface(IJavaClass)
    ['{E490D77A-D519-4EF6-A160-6C64D39B0F99}']
  end;

  [JavaSignature('com/google/android/gms/ads/purchase/InAppPurchaseListener')]
  JInAppPurchaseListener = interface(IJavaInstance)
    ['{E4A4DD68-0E57-46C7-BF31-90751737880D}']
    procedure onInAppPurchaseRequested(inAppPurchase: JInAppPurchase); cdecl;
  end;
  TJInAppPurchaseListener = class(TJavaGenericImport<JInAppPurchaseListenerClass, JInAppPurchaseListener>) end;

  JInAppPurchaseResultClass = interface(IJavaClass)
    ['{6D6C3D99-530B-479F-B13E-05A3C3B31B83}']
  end;

  [JavaSignature('com/google/android/gms/ads/purchase/InAppPurchaseResult')]
  JInAppPurchaseResult = interface(IJavaInstance)
    ['{5A2C5AFE-2ADA-4F01-BC21-86D5BC7AC10F}']
    procedure finishPurchase; cdecl;
    function getProductId: JString; cdecl;
    function getPurchaseData: JIntent; cdecl;
    function getResultCode: Integer; cdecl;
    function isVerified: Boolean; cdecl;
  end;
  TJInAppPurchaseResult = class(TJavaGenericImport<JInAppPurchaseResultClass, JInAppPurchaseResult>) end;

  JPlayStorePurchaseListenerClass = interface(IJavaClass)
    ['{02E8999B-CCBA-4049-BB73-40A74EB1D890}']
  end;

  [JavaSignature('com/google/android/gms/ads/purchase/PlayStorePurchaseListener')]
  JPlayStorePurchaseListener = interface(IJavaInstance)
    ['{35400957-85ED-4009-BA1F-7BC6062AE6D0}']
    function isValidPurchase(productId: JString): Boolean; cdecl;
    procedure onInAppPurchaseFinished(inAppPurchaseResult: JInAppPurchaseResult); cdecl;
  end;
  TJPlayStorePurchaseListener = class(TJavaGenericImport<JPlayStorePurchaseListenerClass, JPlayStorePurchaseListener>) end;

  JSearchAdRequestClass = interface(JObjectClass)
    ['{31CC1220-F7EC-44D3-9805-80A0C42377CE}']
    {class} function _GetBORDER_TYPE_DASHED: Integer; cdecl;
    {class} function _GetBORDER_TYPE_DOTTED: Integer; cdecl;
    {class} function _GetBORDER_TYPE_NONE: Integer; cdecl;
    {class} function _GetBORDER_TYPE_SOLID: Integer; cdecl;
    {class} function _GetCALL_BUTTON_COLOR_DARK: Integer; cdecl;
    {class} function _GetCALL_BUTTON_COLOR_LIGHT: Integer; cdecl;
    {class} function _GetCALL_BUTTON_COLOR_MEDIUM: Integer; cdecl;
    {class} function _GetDEVICE_ID_EMULATOR: JString; cdecl;
    {class} function _GetERROR_CODE_INTERNAL_ERROR: Integer; cdecl;
    {class} function _GetERROR_CODE_INVALID_REQUEST: Integer; cdecl;
    {class} function _GetERROR_CODE_NETWORK_ERROR: Integer; cdecl;
    {class} function _GetERROR_CODE_NO_FILL: Integer; cdecl;
    {class} property BORDER_TYPE_DASHED: Integer read _GetBORDER_TYPE_DASHED;
    {class} property BORDER_TYPE_DOTTED: Integer read _GetBORDER_TYPE_DOTTED;
    {class} property BORDER_TYPE_NONE: Integer read _GetBORDER_TYPE_NONE;
    {class} property BORDER_TYPE_SOLID: Integer read _GetBORDER_TYPE_SOLID;
    {class} property CALL_BUTTON_COLOR_DARK: Integer read _GetCALL_BUTTON_COLOR_DARK;
    {class} property CALL_BUTTON_COLOR_LIGHT: Integer read _GetCALL_BUTTON_COLOR_LIGHT;
    {class} property CALL_BUTTON_COLOR_MEDIUM: Integer read _GetCALL_BUTTON_COLOR_MEDIUM;
    {class} property DEVICE_ID_EMULATOR: JString read _GetDEVICE_ID_EMULATOR;
    {class} property ERROR_CODE_INTERNAL_ERROR: Integer read _GetERROR_CODE_INTERNAL_ERROR;
    {class} property ERROR_CODE_INVALID_REQUEST: Integer read _GetERROR_CODE_INVALID_REQUEST;
    {class} property ERROR_CODE_NETWORK_ERROR: Integer read _GetERROR_CODE_NETWORK_ERROR;
    {class} property ERROR_CODE_NO_FILL: Integer read _GetERROR_CODE_NO_FILL;
  end;

  [JavaSignature('com/google/android/gms/ads/search/SearchAdRequest')]
  JSearchAdRequest = interface(JObject)
    ['{7105D858-7D2D-4105-A415-4B9C3B187692}']
    function getAnchorTextColor: Integer; cdecl;
    function getBackgroundColor: Integer; cdecl;
    function getBackgroundGradientBottom: Integer; cdecl;
    function getBackgroundGradientTop: Integer; cdecl;
    function getBorderColor: Integer; cdecl;
    function getBorderThickness: Integer; cdecl;
    function getBorderType: Integer; cdecl;
    function getCallButtonColor: Integer; cdecl;
    function getCustomChannels: JString; cdecl;
    function getDescriptionTextColor: Integer; cdecl;
    function getFontFace: JString; cdecl;
    function getHeaderTextColor: Integer; cdecl;
    function getHeaderTextSize: Integer; cdecl;
    function getLocation: JLocation; cdecl;
    //function getNetworkExtras(networkExtrasClass: Jlang_Class): JNetworkExtras; cdecl;
    function getQuery: JString; cdecl;
    function isTestDevice(context: JContext): Boolean; cdecl;
  end;
  TJSearchAdRequest = class(TJavaGenericImport<JSearchAdRequestClass, JSearchAdRequest>) end;

  JSearchAdRequest_BuilderClass = interface(JObjectClass)
    ['{BFC1817C-04E6-421F-95E5-CD3B30059C40}']
    {class} function init: JSearchAdRequest_Builder; cdecl;
  end;

  [JavaSignature('com/google/android/gms/ads/search/SearchAdRequest$Builder')]
  JSearchAdRequest_Builder = interface(JObject)
    ['{F33FB6FC-B4E7-4B4B-ACEC-9108757675C6}']
    //function addNetworkExtras(networkExtras: JNetworkExtras): JSearchAdRequest_Builder; cdecl;
    function addTestDevice(deviceId: JString): JSearchAdRequest_Builder; cdecl;
    function build: JSearchAdRequest; cdecl;
    function setAnchorTextColor(anchorTextColor: Integer): JSearchAdRequest_Builder; cdecl;
    function setBackgroundColor(backgroundColor: Integer): JSearchAdRequest_Builder; cdecl;
    function setBackgroundGradient(top: Integer; bottom: Integer): JSearchAdRequest_Builder; cdecl;
    function setBorderColor(borderColor: Integer): JSearchAdRequest_Builder; cdecl;
    function setBorderThickness(borderThickness: Integer): JSearchAdRequest_Builder; cdecl;
    function setBorderType(borderType: Integer): JSearchAdRequest_Builder; cdecl;
    function setCallButtonColor(callButtonColor: Integer): JSearchAdRequest_Builder; cdecl;
    function setCustomChannels(channelIds: JString): JSearchAdRequest_Builder; cdecl;
    function setDescriptionTextColor(descriptionTextColor: Integer): JSearchAdRequest_Builder; cdecl;
    function setFontFace(fontFace: JString): JSearchAdRequest_Builder; cdecl;
    function setHeaderTextColor(headerTextColor: Integer): JSearchAdRequest_Builder; cdecl;
    function setHeaderTextSize(headerTextSize: Integer): JSearchAdRequest_Builder; cdecl;
    function setLocation(location: JLocation): JSearchAdRequest_Builder; cdecl;
    function setQuery(query: JString): JSearchAdRequest_Builder; cdecl;
    function setRequestAgent(requestAgent: JString): JSearchAdRequest_Builder; cdecl;
    function tagForChildDirectedTreatment(tagForChildDirectedTreatment: Boolean): JSearchAdRequest_Builder; cdecl;
  end;
  TJSearchAdRequest_Builder = class(TJavaGenericImport<JSearchAdRequest_BuilderClass, JSearchAdRequest_Builder>) end;

  JSearchAdViewClass = interface(JViewGroupClass)
    ['{ECDC5A65-5618-48D3-82E7-4B06898CBBCC}']
    {class} function init(context: JContext): JSearchAdView; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet): JSearchAdView; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet; defStyle: Integer): JSearchAdView; cdecl; overload;
  end;

  [JavaSignature('com/google/android/gms/ads/search/SearchAdView')]
  JSearchAdView = interface(JViewGroup)
    ['{9FB97DC2-F4F5-4E7C-AFAC-0BA46A8E9043}']
    procedure destroy; cdecl;
    function getAdListener: JAdListener; cdecl;
    function getAdSize: JAdSize; cdecl;
    function getAdUnitId: JString; cdecl;
    procedure loadAd(searchAdRequest: JSearchAdRequest); cdecl;
    procedure pause; cdecl;
    procedure resume; cdecl;
    procedure setAdListener(adListener: JAdListener); cdecl;
    procedure setAdSize(adSize: JAdSize); cdecl;
    procedure setAdUnitId(adUnitId: JString); cdecl;
  end;
  TJSearchAdView = class(TJavaGenericImport<JSearchAdViewClass, JSearchAdView>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdActivity', TypeInfo(Androidapi.JNI.AdMob.JAdActivity));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdListener', TypeInfo(Androidapi.JNI.AdMob.JAdListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdRequest', TypeInfo(Androidapi.JNI.AdMob.JAdRequest));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdRequest_Builder', TypeInfo(Androidapi.JNI.AdMob.JAdRequest_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdSize', TypeInfo(Androidapi.JNI.AdMob.JAdSize));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAdView', TypeInfo(Androidapi.JNI.AdMob.JAdView));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JInterstitialAd', TypeInfo(Androidapi.JNI.AdMob.JInterstitialAd));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JAppEventListener', TypeInfo(Androidapi.JNI.AdMob.JAppEventListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JCustomRenderedAd', TypeInfo(Androidapi.JNI.AdMob.JCustomRenderedAd));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JOnCustomRenderedAdLoadedListener', TypeInfo(Androidapi.JNI.AdMob.JOnCustomRenderedAdLoadedListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JPublisherAdRequest', TypeInfo(Androidapi.JNI.AdMob.JPublisherAdRequest));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JPublisherAdRequest_Builder', TypeInfo(Androidapi.JNI.AdMob.JPublisherAdRequest_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JPublisherAdView', TypeInfo(Androidapi.JNI.AdMob.JPublisherAdView));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JPublisherInterstitialAd', TypeInfo(Androidapi.JNI.AdMob.JPublisherInterstitialAd));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JInAppPurchase', TypeInfo(Androidapi.JNI.AdMob.JInAppPurchase));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JInAppPurchaseActivity', TypeInfo(Androidapi.JNI.AdMob.JInAppPurchaseActivity));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JInAppPurchaseListener', TypeInfo(Androidapi.JNI.AdMob.JInAppPurchaseListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JInAppPurchaseResult', TypeInfo(Androidapi.JNI.AdMob.JInAppPurchaseResult));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JPlayStorePurchaseListener', TypeInfo(Androidapi.JNI.AdMob.JPlayStorePurchaseListener));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JSearchAdRequest', TypeInfo(Androidapi.JNI.AdMob.JSearchAdRequest));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JSearchAdRequest_Builder', TypeInfo(Androidapi.JNI.AdMob.JSearchAdRequest_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.AdMob.JSearchAdView', TypeInfo(Androidapi.JNI.AdMob.JSearchAdView));
end;

initialization
  RegisterTypes;
end.


