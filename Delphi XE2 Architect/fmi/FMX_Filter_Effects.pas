{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_Filter_Effects;

interface

uses Classes, Types, UITypes, FMX_Types, FMX_Filter;

type

  TFilterBaseFilter = class(TFmxObject)
  private
    FFilter: TFilter;
    FInputFilter: TFilterBaseFilter;
    function GetOutput: TBitmap;
    procedure SetInput(AValue: TBitmap);
    procedure SetInputFilter(AValue: TFilterBaseFilter);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Input: TBitmap write SetInput;
    property Output: TBitmap read GetOutput;
  published
    property InputFilter: TFilterBaseFilter read FInputFilter write SetInputFilter;
  end;

  //An effect that GaussianBlurs.
  TFilterGaussianBlur = class(TFilterBaseFilter)
  private
    function GetBlurAmount: Single;
    procedure SetBlurAmount(AValue: Single);
  published
    // The GaussianBlur factor.
    property BlurAmount: Single read GetBlurAmount write SetBlurAmount;
  end;

  //An effect that blurs.
  TFilterBoxBlur = class(TFilterBaseFilter)
  private
    function GetBlurAmount: Single;
    procedure SetBlurAmount(AValue: Single);
  published
    // The blur factor.
    property BlurAmount: Single read GetBlurAmount write SetBlurAmount;
  end;

  //An effect that blurs in a single direction.
  TFilterDirectionalBlur = class(TFilterBaseFilter)
  private
    function GetAngle: Single;
    procedure SetAngle(AValue: Single);
    function GetBlurAmount: Single;
    procedure SetBlurAmount(AValue: Single);
  published
    // The direction of the blur (in degrees).
    property Angle: Single read GetAngle write SetAngle;
    // The scale of the blur (as a fraction of the input size).
    property BlurAmount: Single read GetBlurAmount write SetBlurAmount;
  end;

  //An effect that applies a radial blur to the input.
  TFilterRadialBlur = class(TFilterBaseFilter)
  private
    function GetCenter: TPointF;
    procedure SetCenter(AValue: TPointF);
    function GetBlurAmount: Single;
    procedure SetBlurAmount(AValue: Single);
  published
    // The center point of the ripples.
  public
    property Center: TPointF read GetCenter write SetCenter;
  published
    // The scale of the blur (as a fraction of the input size).
    property BlurAmount: Single read GetBlurAmount write SetBlurAmount;
  end;

  //Applies an affine transform to an image.
  TFilterAffineTransform = class(TFilterBaseFilter)
  private
    function GetCenter: TPointF;
    procedure SetCenter(AValue: TPointF);
    function GetRotation: Single;
    procedure SetRotation(AValue: Single);
    function GetScale: Single;
    procedure SetScale(AValue: Single);
  published
    // The center point of the rotation.
  public
    property Center: TPointF read GetCenter write SetCenter;
  published
    // Rotation angle in degrees.
    property Rotation: Single read GetRotation write SetRotation;
    // Scale value as floating.
    property Scale: Single read GetScale write SetScale;
  end;

  //Applies an perspective transform to an image.
  TFilterPerspectiveTransform = class(TFilterBaseFilter)
  private
    function GetTopLeft: TPointF;
    procedure SetTopLeft(AValue: TPointF);
    function GetTopRight: TPointF;
    procedure SetTopRight(AValue: TPointF);
    function GetBottomRight: TPointF;
    procedure SetBottomRight(AValue: TPointF);
    function GetBottomLeft: TPointF;
    procedure SetBottomLeft(AValue: TPointF);
  published
    // Top left point of result transformation.
  public
    property TopLeft: TPointF read GetTopLeft write SetTopLeft;
  published
    // Top right point of result transformation.
  public
    property TopRight: TPointF read GetTopRight write SetTopRight;
  published
    // Bottom right point of result transformation.
  public
    property BottomRight: TPointF read GetBottomRight write SetBottomRight;
  published
    // Bottom left point of result transformation.
  public
    property BottomLeft: TPointF read GetBottomLeft write SetBottomLeft;
  published
  end;

  //The size and shape of the cropped image depend on the rectangle you specify.
  TFilterCrop = class(TFilterBaseFilter)
  private
    function GetLeftTop: TPointF;
    procedure SetLeftTop(AValue: TPointF);
    function GetRightBottom: TPointF;
    procedure SetRightBottom(AValue: TPointF);
  published
    // Left-top corner of cropping rect
  public
    property LeftTop: TPointF read GetLeftTop write SetLeftTop;
  published
    // Left-top corner of cropping rect
  public
    property RightBottom: TPointF read GetRightBottom write SetRightBottom;
  published
  end;

  //A transition effect.
  TFilterBandedSwirlTransition = class(TFilterBaseFilter)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetStrength: Single;
    procedure SetStrength(AValue: Single);
    function GetFrequency: Single;
    procedure SetFrequency(AValue: Single);
    function GetCenter: TPointF;
    procedure SetCenter(AValue: TPointF);
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The amount of twist to the spiral.
    property Strength: Single read GetStrength write SetStrength;
    // The frequency of the spiral.
    property Frequency: Single read GetFrequency write SetFrequency;
    // The center point of the ripples.
  public
    property Center: TPointF read GetCenter write SetCenter;
  published
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //A transition effect.
  TFilterBlindTransition = class(TFilterBaseFilter)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetNumberOfBlinds: Single;
    procedure SetNumberOfBlinds(AValue: Single);
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The number of Blinds strips
    property NumberOfBlinds: Single read GetNumberOfBlinds write SetNumberOfBlinds;
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //A transition effect.
  TFilterBloodTransition = class(TFilterBaseFilter)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetRandomSeed: Single;
    procedure SetRandomSeed(AValue: Single);
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The seed value that determines dripiness.
    property RandomSeed: Single read GetRandomSeed write SetRandomSeed;
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //A transition effect.
  TFilterCircleTransition = class(TFilterBaseFilter)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetFuzzyAmount: Single;
    procedure SetFuzzyAmount(AValue: Single);
    function GetSize: Single;
    procedure SetSize(AValue: Single);
    function GetCenter: TPointF;
    procedure SetCenter(AValue: TPointF);
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The fuzziness factor.
    property FuzzyAmount: Single read GetFuzzyAmount write SetFuzzyAmount;
    // The size of the circle.
    property Size: Single read GetSize write SetSize;
    // The center point of effect.
  public
    property Center: TPointF read GetCenter write SetCenter;
  published
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //A transition effect.
  TFilterMagnifyTransition = class(TFilterBaseFilter)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetCenter: TPointF;
    procedure SetCenter(AValue: TPointF);
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The center point of effect.
  public
    property Center: TPointF read GetCenter write SetCenter;
  published
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //A transition effect.
  TFilterCrumpleTransition = class(TFilterBaseFilter)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetRandomSeed: Single;
    procedure SetRandomSeed(AValue: Single);
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The seed value that determines dripiness.
    property RandomSeed: Single read GetRandomSeed write SetRandomSeed;
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //A transition effect.
  TFilterDissolveTransition = class(TFilterBaseFilter)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetRandomSeed: Single;
    procedure SetRandomSeed(AValue: Single);
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The seed value that determines dripiness.
    property RandomSeed: Single read GetRandomSeed write SetRandomSeed;
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //A transition effect.
  TFilterDropTransition = class(TFilterBaseFilter)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetRandomSeed: Single;
    procedure SetRandomSeed(AValue: Single);
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The seed value that determines dripiness.
    property RandomSeed: Single read GetRandomSeed write SetRandomSeed;
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //A transition effect.
  TFilterFadeTransition = class(TFilterBaseFilter)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //A transition effect.
  TFilterBrightTransition = class(TFilterBaseFilter)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //A transition effect.
  TFilterPixelateTransition = class(TFilterBaseFilter)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //A transition effect.
  TFilterBlurTransition = class(TFilterBaseFilter)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //A transition effect.
  TFilterWiggleTransition = class(TFilterBaseFilter)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //A transition effect.
  TFilterShapeTransition = class(TFilterBaseFilter)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //A transition effect.
  TFilterRippleTransition = class(TFilterBaseFilter)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //A transition effect.
  TFilterRotateCrumpleTransition = class(TFilterBaseFilter)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetRandomSeed: Single;
    procedure SetRandomSeed(AValue: Single);
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The seed value that determines dripiness.
    property RandomSeed: Single read GetRandomSeed write SetRandomSeed;
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //A transition effect.
  TFilterSaturateTransition = class(TFilterBaseFilter)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //A transition effect.
  TFilterSlideTransition = class(TFilterBaseFilter)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetSlideAmount: TPointF;
    procedure SetSlideAmount(AValue: TPointF);
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The center point of the ripples.
  public
    property SlideAmount: TPointF read GetSlideAmount write SetSlideAmount;
  published
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //A transition effect.
  TFilterSwirlTransition = class(TFilterBaseFilter)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetStrength: Single;
    procedure SetStrength(AValue: Single);
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The amount of twist to the spiral.
    property Strength: Single read GetStrength write SetStrength;
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //A transition effect.
  TFilterWaterTransition = class(TFilterBaseFilter)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetRandomSeed: Single;
    procedure SetRandomSeed(AValue: Single);
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The seed value that determines dripiness.
    property RandomSeed: Single read GetRandomSeed write SetRandomSeed;
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //A transition effect.
  TFilterWaveTransition = class(TFilterBaseFilter)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //A transition effect.
  TFilterLineTransition = class(TFilterBaseFilter)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetOrigin: TPointF;
    procedure SetOrigin(AValue: TPointF);
    function GetNormal: TPointF;
    procedure SetNormal(AValue: TPointF);
    function GetOffset: TPointF;
    procedure SetOffset(AValue: TPointF);
    function GetFuzzyAmount: Single;
    procedure SetFuzzyAmount(AValue: Single);
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The line origin.
  public
    property Origin: TPointF read GetOrigin write SetOrigin;
  published
    // The line normal.
  public
    property Normal: TPointF read GetNormal write SetNormal;
  published
    // The line offset.
  public
    property Offset: TPointF read GetOffset write SetOffset;
  published
    // The fuzziness factor.
    property FuzzyAmount: Single read GetFuzzyAmount write SetFuzzyAmount;
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //An effect that inverts all colors.
  TFilterInvert = class(TFilterBaseFilter)
  private
  published
  end;

  //Remaps colors so they fall within shades of a single color.
  TFilterMonochrome = class(TFilterBaseFilter)
  private
  published
  end;

  //An effect that makes pixels of a particular color transparent.
  TFilterColorKeyAlpha = class(TFilterBaseFilter)
  private
    function GetColorKey: Single;
    procedure SetColorKey(AValue: Single);
    function GetTolerance: Single;
    procedure SetTolerance(AValue: Single);
  published
    // The color that becomes transparent.
    property ColorKey: Single read GetColorKey write SetColorKey;
    // The tolerance in color differences.
    property Tolerance: Single read GetTolerance write SetTolerance;
  end;

  //Converts a grayscale image to a white image that is masked by alpha.
  TFilterMaskToAlpha = class(TFilterBaseFilter)
  private
  published
  end;

  //Changes the overall hue, or tint, of the source pixels.
  TFilterHueAdjust = class(TFilterBaseFilter)
  private
    function GetHue: Single;
    procedure SetHue(AValue: Single);
  published
    // The hue offset.
    property Hue: Single read GetHue write SetHue;
  end;

  //An effect that controls brightness and contrast.
  TFilterContrast = class(TFilterBaseFilter)
  private
    function GetBrightness: Single;
    procedure SetBrightness(AValue: Single);
    function GetContrast: Single;
    procedure SetContrast(AValue: Single);
  published
    // The brightness offset.
    property Brightness: Single read GetBrightness write SetBrightness;
    // The contrast multiplier.
    property Contrast: Single read GetContrast write SetContrast;
  end;

  //An effect that intensifies bright regions.
  TFilterBloom = class(TFilterBaseFilter)
  private
    function GetBloomIntensity: Single;
    procedure SetBloomIntensity(AValue: Single);
    function GetBaseIntensity: Single;
    procedure SetBaseIntensity(AValue: Single);
    function GetBloomSaturation: Single;
    procedure SetBloomSaturation(AValue: Single);
    function GetBaseSaturation: Single;
    procedure SetBaseSaturation(AValue: Single);
  published
    // Intensity of the bloom image.
    property BloomIntensity: Single read GetBloomIntensity write SetBloomIntensity;
    // Intensity of the base image.
    property BaseIntensity: Single read GetBaseIntensity write SetBaseIntensity;
    // Saturation of the bloom image.
    property BloomSaturation: Single read GetBloomSaturation write SetBloomSaturation;
    // Saturation of the base image.
    property BaseSaturation: Single read GetBaseSaturation write SetBaseSaturation;
  end;

  //An effect that intensifies dark regions.
  TFilterGloom = class(TFilterBaseFilter)
  private
    function GetGloomIntensity: Single;
    procedure SetGloomIntensity(AValue: Single);
    function GetBaseIntensity: Single;
    procedure SetBaseIntensity(AValue: Single);
    function GetGloomSaturation: Single;
    procedure SetGloomSaturation(AValue: Single);
    function GetBaseSaturation: Single;
    procedure SetBaseSaturation(AValue: Single);
  published
    // Intensity of the gloom image.
    property GloomIntensity: Single read GetGloomIntensity write SetGloomIntensity;
    // Intensity of the base image.
    property BaseIntensity: Single read GetBaseIntensity write SetBaseIntensity;
    // Saturation of the gloom image.
    property GloomSaturation: Single read GetGloomSaturation write SetGloomSaturation;
    // Saturation of the base image.
    property BaseSaturation: Single read GetBaseSaturation write SetBaseSaturation;
  end;

  //Normal blending of two images.
  TFilterNormalBlend = class(TFilterBaseFilter)
  private
    function GetTarget: TBitmap;
    procedure SetTarget(AValue: TBitmap);
  published
    // The target bitmap.
  public
    property Target: TBitmap read GetTarget write SetTarget;
  published
  end;

  //Generates a solid color.
  TFilterFill = class(TFilterBaseFilter)
  private
    function GetColor: TAlphaColor;
    procedure SetColor(AValue: TAlphaColor);
  published
    // The fill color.
    property Color: TAlphaColor read GetColor write SetColor;
  end;

  //Fill all pixels with not empty alpha.
  TFilterFillRGB = class(TFilterBaseFilter)
  private
    function GetColor: TAlphaColor;
    procedure SetColor(AValue: TAlphaColor);
  published
    // The fill color.
    property Color: TAlphaColor read GetColor write SetColor;
  end;

  //
  TFilterPixelate = class(TFilterBaseFilter)
  private
    function GetBlockCount: Single;
    procedure SetBlockCount(AValue: Single);
  published
    // The number of pixel blocks.
    property BlockCount: Single read GetBlockCount write SetBlockCount;
  end;

  //An effect that embosses the input.
  TFilterEmboss = class(TFilterBaseFilter)
  private
    function GetAmount: Single;
    procedure SetAmount(AValue: Single);
    function GetWidth: Single;
    procedure SetWidth(AValue: Single);
  published
    // The amplitude of the embossing.
    property Amount: Single read GetAmount write SetAmount;
    // The separation between samples (as a fraction of input size).
    property Width: Single read GetWidth write SetWidth;
  end;

  //An effect that sharpens the input.
  TFilterSharpen = class(TFilterBaseFilter)
  private
    function GetAmount: Single;
    procedure SetAmount(AValue: Single);
  published
    // The amount of sharpening.
    property Amount: Single read GetAmount write SetAmount;
  end;

  //An effect that applies cartoon-like shading (posterization).
  TFilterToon = class(TFilterBaseFilter)
  private
    function GetLevels: Single;
    procedure SetLevels(AValue: Single);
  published
    // The number of color levels to use.
    property Levels: Single read GetLevels write SetLevels;
  end;

  //Sepia effect.
  TFilterSepia = class(TFilterBaseFilter)
  private
    function GetAmount: Single;
    procedure SetAmount(AValue: Single);
  published
    // The amount of sharpening.
    property Amount: Single read GetAmount write SetAmount;
  end;

  //An paper sketch effect.
  TFilterPaperSketch = class(TFilterBaseFilter)
  private
    function GetBrushSize: Single;
    procedure SetBrushSize(AValue: Single);
  published
    // The brush size of the sketch effect.
    property BrushSize: Single read GetBrushSize write SetBrushSize;
  end;

  //An pencil stroke effect.
  TFilterPencilStroke = class(TFilterBaseFilter)
  private
    function GetBrushSize: Single;
    procedure SetBrushSize(AValue: Single);
  published
    // The brush size of the sketch effect.
    property BrushSize: Single read GetBrushSize write SetBrushSize;
  end;

  //Pixel shader tiles the image across multiple rows and columns
  TFilterTiler = class(TFilterBaseFilter)
  private
    function GetVerticalTileCount: Single;
    procedure SetVerticalTileCount(AValue: Single);
    function GetHorizontalTileCount: Single;
    procedure SetHorizontalTileCount(AValue: Single);
    function GetHorizontalOffset: Single;
    procedure SetHorizontalOffset(AValue: Single);
    function GetVerticalOffset: Single;
    procedure SetVerticalOffset(AValue: Single);
  published
    // The number of verical tiles to add to the output. The higher the value the more tiles.
    property VerticalTileCount: Single read GetVerticalTileCount write SetVerticalTileCount;
    // The number of horizontal tiles to add to the output. The higher the value the more tiles.
    property HorizontalTileCount: Single read GetHorizontalTileCount write SetHorizontalTileCount;
    // Change the horizontal offset of each tile.
    property HorizontalOffset: Single read GetHorizontalOffset write SetHorizontalOffset;
    // Change the vertical offset of each tile.
    property VerticalOffset: Single read GetVerticalOffset write SetVerticalOffset;
  end;

  //An effect that superimposes rippling waves upon the input.
  TFilterRipple = class(TFilterBaseFilter)
  private
    function GetCenter: TPointF;
    procedure SetCenter(AValue: TPointF);
    function GetAmplitude: Single;
    procedure SetAmplitude(AValue: Single);
    function GetFrequency: Single;
    procedure SetFrequency(AValue: Single);
    function GetPhase: Single;
    procedure SetPhase(AValue: Single);
    function GetAspectRatio: Single;
    procedure SetAspectRatio(AValue: Single);
  published
    // The center point of the ripples.
  public
    property Center: TPointF read GetCenter write SetCenter;
  published
    // The amplitude of the ripples.
    property Amplitude: Single read GetAmplitude write SetAmplitude;
    // The frequency of the ripples.
    property Frequency: Single read GetFrequency write SetFrequency;
    // The phase of the ripples.
    property Phase: Single read GetPhase write SetPhase;
    // The aspect ratio (width / height) of the input.
    property AspectRatio: Single read GetAspectRatio write SetAspectRatio;
  end;

  //An effect that swirls the input in a spiral.
  TFilterSwirl = class(TFilterBaseFilter)
  private
    function GetCenter: TPointF;
    procedure SetCenter(AValue: TPointF);
    function GetStrength: Single;
    procedure SetStrength(AValue: Single);
    function GetAspectRatio: Single;
    procedure SetAspectRatio(AValue: Single);
  published
    // The center point of the ripples.
  public
    property Center: TPointF read GetCenter write SetCenter;
  published
    // The amount of twist to the spiral.
    property Strength: Single read GetStrength write SetStrength;
    // The aspect ratio (width / height) of the input.
    property AspectRatio: Single read GetAspectRatio write SetAspectRatio;
  end;

  //An effect that magnifies a circular region.
  TFilterMagnify = class(TFilterBaseFilter)
  private
    function GetCenter: TPointF;
    procedure SetCenter(AValue: TPointF);
    function GetRadius: Single;
    procedure SetRadius(AValue: Single);
    function GetMagnification: Single;
    procedure SetMagnification(AValue: Single);
    function GetAspectRatio: Single;
    procedure SetAspectRatio(AValue: Single);
  published
    // The center point of the ripples.
  public
    property Center: TPointF read GetCenter write SetCenter;
  published
    // The radius of the magnified region.
    property Radius: Single read GetRadius write SetRadius;
    // The magnification factor.
    property Magnification: Single read GetMagnification write SetMagnification;
    // The aspect ratio (width / height) of the input.
    property AspectRatio: Single read GetAspectRatio write SetAspectRatio;
  end;

  //An effect that magnifies a circular region.
  TFilterSmoothMagnify = class(TFilterBaseFilter)
  private
    function GetCenter: TPointF;
    procedure SetCenter(AValue: TPointF);
    function GetInnerRadius: Single;
    procedure SetInnerRadius(AValue: Single);
    function GetOuterRadius: Single;
    procedure SetOuterRadius(AValue: Single);
    function GetMagnification: Single;
    procedure SetMagnification(AValue: Single);
    function GetAspectRatio: Single;
    procedure SetAspectRatio(AValue: Single);
  published
    // The center point of the ripples.
  public
    property Center: TPointF read GetCenter write SetCenter;
  published
    // The inner radius of the magnified region.
    property InnerRadius: Single read GetInnerRadius write SetInnerRadius;
    // The outer radius of the magnified region.
    property OuterRadius: Single read GetOuterRadius write SetOuterRadius;
    // The magnification factor.
    property Magnification: Single read GetMagnification write SetMagnification;
    // The aspect ratio (width / height) of the input.
    property AspectRatio: Single read GetAspectRatio write SetAspectRatio;
  end;

  //An effect that creates bands of bright regions.
  TFilterBands = class(TFilterBaseFilter)
  private
    function GetBandDensity: Single;
    procedure SetBandDensity(AValue: Single);
    function GetBandIntensity: Single;
    procedure SetBandIntensity(AValue: Single);
  published
    // The number of verical bands to add to the output. The higher the value the more bands.
    property BandDensity: Single read GetBandDensity write SetBandDensity;
    // Intensity of each band.
    property BandIntensity: Single read GetBandIntensity write SetBandIntensity;
  end;

  //An effect that applies a wave pattern to the input.
  TFilterWave = class(TFilterBaseFilter)
  private
    function GetTime: Single;
    procedure SetTime(AValue: Single);
    function GetWaveSize: Single;
    procedure SetWaveSize(AValue: Single);
  published
    // The moment in time. Animate this value over a long period of time. The speed depends on the size. The larger the size, the larger the increase in time on every frame, thus from 0 to 2048 in a smaller amount of time.
    property Time: Single read GetTime write SetTime;
    // The distance between waves. (the higher the value the closer the waves are to their neighbor).
    property WaveSize: Single read GetWaveSize write SetWaveSize;
  end;

  //Wrap image by two Bezier curves.
  TFilterWrap = class(TFilterBaseFilter)
  private
    function GetLeftStart: Single;
    procedure SetLeftStart(AValue: Single);
    function GetLeftControl1: Single;
    procedure SetLeftControl1(AValue: Single);
    function GetLeftControl2: Single;
    procedure SetLeftControl2(AValue: Single);
    function GetLeftEnd: Single;
    procedure SetLeftEnd(AValue: Single);
    function GetRightStart: Single;
    procedure SetRightStart(AValue: Single);
    function GetRightControl1: Single;
    procedure SetRightControl1(AValue: Single);
    function GetRightControl2: Single;
    procedure SetRightControl2(AValue: Single);
    function GetRightEnd: Single;
    procedure SetRightEnd(AValue: Single);
  published
    // Left wrap curve start point
    property LeftStart: Single read GetLeftStart write SetLeftStart;
    // Left wrap curve control point 1
    property LeftControl1: Single read GetLeftControl1 write SetLeftControl1;
    // Left wrap curve control point 2
    property LeftControl2: Single read GetLeftControl2 write SetLeftControl2;
    // Left wrap curve end point
    property LeftEnd: Single read GetLeftEnd write SetLeftEnd;
    // Right wrap curve start point
    property RightStart: Single read GetRightStart write SetRightStart;
    // Right wrap curve control point 1
    property RightControl1: Single read GetRightControl1 write SetRightControl1;
    // Right wrap curve control point 2
    property RightControl2: Single read GetRightControl2 write SetRightControl2;
    // Right wrap curve end point
    property RightEnd: Single read GetRightEnd write SetRightEnd;
  end;

  //An effect that swirls the input in alternating clockwise and counterclockwise bands.
  TFilterBandedSwirl = class(TFilterBaseFilter)
  private
    function GetCenter: TPointF;
    procedure SetCenter(AValue: TPointF);
    function GetBands: Single;
    procedure SetBands(AValue: Single);
    function GetStrength: Single;
    procedure SetStrength(AValue: Single);
    function GetAspectRatio: Single;
    procedure SetAspectRatio(AValue: Single);
  published
    // The center point of the ripples.
  public
    property Center: TPointF read GetCenter write SetCenter;
  published
    // The number of bands in the swirl.
    property Bands: Single read GetBands write SetBands;
    // The amount of twist to the spiral.
    property Strength: Single read GetStrength write SetStrength;
    // The aspect ratio (width / height) of the input.
    property AspectRatio: Single read GetAspectRatio write SetAspectRatio;
  end;

  //An effect that pinches a circular region.
  TFilterPinch = class(TFilterBaseFilter)
  private
    function GetCenter: TPointF;
    procedure SetCenter(AValue: TPointF);
    function GetRadius: Single;
    procedure SetRadius(AValue: Single);
    function GetStrength: Single;
    procedure SetStrength(AValue: Single);
    function GetAspectRatio: Single;
    procedure SetAspectRatio(AValue: Single);
  published
    // The center point of the pinched region.
  public
    property Center: TPointF read GetCenter write SetCenter;
  published
    // The radius of the pinched region.
    property Radius: Single read GetRadius write SetRadius;
    // The amount of twist to the spiral.
    property Strength: Single read GetStrength write SetStrength;
    // The aspect ratio (width / height) of the input.
    property AspectRatio: Single read GetAspectRatio write SetAspectRatio;
  end;


  TImageFXEffect = class(TEffect)
  private
    FFilter: TFilter;
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ProcessEffect(Canvas: TCanvas; const Visual: TBitmap; const Data: Single); override;
  end;



  //An effect that GaussianBlurs.
  TGaussianBlurEffect = class(TImageFXEffect)
  private
    function GetBlurAmount: Single;
    procedure SetBlurAmount(AValue: Single);
  published
    // The GaussianBlur factor.
    property BlurAmount: Single read GetBlurAmount write SetBlurAmount;
  end;

  //An effect that blurs.
  TBoxBlurEffect = class(TImageFXEffect)
  private
    function GetBlurAmount: Single;
    procedure SetBlurAmount(AValue: Single);
  published
    // The blur factor.
    property BlurAmount: Single read GetBlurAmount write SetBlurAmount;
  end;

  //An effect that blurs in a single direction.
  TDirectionalBlurEffect = class(TImageFXEffect)
  private
    function GetAngle: Single;
    procedure SetAngle(AValue: Single);
    function GetBlurAmount: Single;
    procedure SetBlurAmount(AValue: Single);
  published
    // The direction of the blur (in degrees).
    property Angle: Single read GetAngle write SetAngle;
    // The scale of the blur (as a fraction of the input size).
    property BlurAmount: Single read GetBlurAmount write SetBlurAmount;
  end;

  //An effect that applies a radial blur to the input.
  TRadialBlurEffect = class(TImageFXEffect)
  private
    function GetCenter: TPointF;
    procedure SetCenter(AValue: TPointF);
    function GetBlurAmount: Single;
    procedure SetBlurAmount(AValue: Single);
  published
    // The center point of the ripples.
  public
    property Center: TPointF read GetCenter write SetCenter;
  published
    // The scale of the blur (as a fraction of the input size).
    property BlurAmount: Single read GetBlurAmount write SetBlurAmount;
  end;

  //Applies an affine transform to an image.
  TAffineTransformEffect = class(TImageFXEffect)
  private
    function GetCenter: TPointF;
    procedure SetCenter(AValue: TPointF);
    function GetRotation: Single;
    procedure SetRotation(AValue: Single);
    function GetScale: Single;
    procedure SetScale(AValue: Single);
  published
    // The center point of the rotation.
  public
    property Center: TPointF read GetCenter write SetCenter;
  published
    // Rotation angle in degrees.
    property Rotation: Single read GetRotation write SetRotation;
    // Scale value as floating.
    property Scale: Single read GetScale write SetScale;
  end;

  //Applies an perspective transform to an image.
  TPerspectiveTransformEffect = class(TImageFXEffect)
  private
    function GetTopLeft: TPointF;
    procedure SetTopLeft(AValue: TPointF);
    function GetTopRight: TPointF;
    procedure SetTopRight(AValue: TPointF);
    function GetBottomRight: TPointF;
    procedure SetBottomRight(AValue: TPointF);
    function GetBottomLeft: TPointF;
    procedure SetBottomLeft(AValue: TPointF);
  published
    // Top left point of result transformation.
  public
    property TopLeft: TPointF read GetTopLeft write SetTopLeft;
  published
    // Top right point of result transformation.
  public
    property TopRight: TPointF read GetTopRight write SetTopRight;
  published
    // Bottom right point of result transformation.
  public
    property BottomRight: TPointF read GetBottomRight write SetBottomRight;
  published
    // Bottom left point of result transformation.
  public
    property BottomLeft: TPointF read GetBottomLeft write SetBottomLeft;
  published
  end;

  //The size and shape of the cropped image depend on the rectangle you specify.
  TCropEffect = class(TImageFXEffect)
  private
    function GetLeftTop: TPointF;
    procedure SetLeftTop(AValue: TPointF);
    function GetRightBottom: TPointF;
    procedure SetRightBottom(AValue: TPointF);
  published
    // Left-top corner of cropping rect
  public
    property LeftTop: TPointF read GetLeftTop write SetLeftTop;
  published
    // Left-top corner of cropping rect
  public
    property RightBottom: TPointF read GetRightBottom write SetRightBottom;
  published
  end;

  //A transition effect.
  TBandedSwirlTransitionEffect = class(TImageFXEffect)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetStrength: Single;
    procedure SetStrength(AValue: Single);
    function GetFrequency: Single;
    procedure SetFrequency(AValue: Single);
    function GetCenter: TPointF;
    procedure SetCenter(AValue: TPointF);
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The amount of twist to the spiral.
    property Strength: Single read GetStrength write SetStrength;
    // The frequency of the spiral.
    property Frequency: Single read GetFrequency write SetFrequency;
    // The center point of the ripples.
  public
    property Center: TPointF read GetCenter write SetCenter;
  published
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //A transition effect.
  TBlindTransitionEffect = class(TImageFXEffect)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetNumberOfBlinds: Single;
    procedure SetNumberOfBlinds(AValue: Single);
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The number of Blinds strips
    property NumberOfBlinds: Single read GetNumberOfBlinds write SetNumberOfBlinds;
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //A transition effect.
  TBloodTransitionEffect = class(TImageFXEffect)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetRandomSeed: Single;
    procedure SetRandomSeed(AValue: Single);
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The seed value that determines dripiness.
    property RandomSeed: Single read GetRandomSeed write SetRandomSeed;
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //A transition effect.
  TCircleTransitionEffect = class(TImageFXEffect)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetFuzzyAmount: Single;
    procedure SetFuzzyAmount(AValue: Single);
    function GetSize: Single;
    procedure SetSize(AValue: Single);
    function GetCenter: TPointF;
    procedure SetCenter(AValue: TPointF);
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The fuzziness factor.
    property FuzzyAmount: Single read GetFuzzyAmount write SetFuzzyAmount;
    // The size of the circle.
    property Size: Single read GetSize write SetSize;
    // The center point of effect.
  public
    property Center: TPointF read GetCenter write SetCenter;
  published
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //A transition effect.
  TMagnifyTransitionEffect = class(TImageFXEffect)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetCenter: TPointF;
    procedure SetCenter(AValue: TPointF);
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The center point of effect.
  public
    property Center: TPointF read GetCenter write SetCenter;
  published
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //A transition effect.
  TCrumpleTransitionEffect = class(TImageFXEffect)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetRandomSeed: Single;
    procedure SetRandomSeed(AValue: Single);
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The seed value that determines dripiness.
    property RandomSeed: Single read GetRandomSeed write SetRandomSeed;
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //A transition effect.
  TDissolveTransitionEffect = class(TImageFXEffect)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetRandomSeed: Single;
    procedure SetRandomSeed(AValue: Single);
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The seed value that determines dripiness.
    property RandomSeed: Single read GetRandomSeed write SetRandomSeed;
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //A transition effect.
  TDropTransitionEffect = class(TImageFXEffect)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetRandomSeed: Single;
    procedure SetRandomSeed(AValue: Single);
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The seed value that determines dripiness.
    property RandomSeed: Single read GetRandomSeed write SetRandomSeed;
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //A transition effect.
  TFadeTransitionEffect = class(TImageFXEffect)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //A transition effect.
  TBrightTransitionEffect = class(TImageFXEffect)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //A transition effect.
  TPixelateTransitionEffect = class(TImageFXEffect)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //A transition effect.
  TBlurTransitionEffect = class(TImageFXEffect)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //A transition effect.
  TWiggleTransitionEffect = class(TImageFXEffect)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //A transition effect.
  TShapeTransitionEffect = class(TImageFXEffect)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //A transition effect.
  TRippleTransitionEffect = class(TImageFXEffect)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //A transition effect.
  TRotateCrumpleTransitionEffect = class(TImageFXEffect)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetRandomSeed: Single;
    procedure SetRandomSeed(AValue: Single);
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The seed value that determines dripiness.
    property RandomSeed: Single read GetRandomSeed write SetRandomSeed;
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //A transition effect.
  TSaturateTransitionEffect = class(TImageFXEffect)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //A transition effect.
  TSlideTransitionEffect = class(TImageFXEffect)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetSlideAmount: TPointF;
    procedure SetSlideAmount(AValue: TPointF);
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The center point of the ripples.
  public
    property SlideAmount: TPointF read GetSlideAmount write SetSlideAmount;
  published
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //A transition effect.
  TSwirlTransitionEffect = class(TImageFXEffect)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetStrength: Single;
    procedure SetStrength(AValue: Single);
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The amount of twist to the spiral.
    property Strength: Single read GetStrength write SetStrength;
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //A transition effect.
  TWaterTransitionEffect = class(TImageFXEffect)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetRandomSeed: Single;
    procedure SetRandomSeed(AValue: Single);
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The seed value that determines dripiness.
    property RandomSeed: Single read GetRandomSeed write SetRandomSeed;
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //A transition effect.
  TWaveTransitionEffect = class(TImageFXEffect)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //A transition effect.
  TLineTransitionEffect = class(TImageFXEffect)
  private
    function GetProgress: Single;
    procedure SetProgress(AValue: Single);
    function GetOrigin: TPointF;
    procedure SetOrigin(AValue: TPointF);
    function GetNormal: TPointF;
    procedure SetNormal(AValue: TPointF);
    function GetOffset1: TPointF;
    procedure SetOffset(AValue: TPointF);
    function GetFuzzyAmount: Single;
    procedure SetFuzzyAmount(AValue: Single);
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The amount(%) of the transition from first texture to the second texture.
    property Progress: Single read GetProgress write SetProgress;
    // The line origin.
  public
    property Origin: TPointF read GetOrigin write SetOrigin;
  published
    // The line normal.
  public
    property Normal: TPointF read GetNormal write SetNormal;
  published
    // The line offset.
  public
    property Offset: TPointF read GetOffset1 write SetOffset;
  published
    // The fuzziness factor.
    property FuzzyAmount: Single read GetFuzzyAmount write SetFuzzyAmount;
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //An effect that inverts all colors.
  TInvertEffect = class(TImageFXEffect)
  private
  published
  end;

  //Remaps colors so they fall within shades of a single color.
  TMonochromeEffect = class(TImageFXEffect)
  private
  published
  end;

  //An effect that makes pixels of a particular color transparent.
  TColorKeyAlphaEffect = class(TImageFXEffect)
  private
    function GetColorKey: Single;
    procedure SetColorKey(AValue: Single);
    function GetTolerance: Single;
    procedure SetTolerance(AValue: Single);
  published
    // The color that becomes transparent.
    property ColorKey: Single read GetColorKey write SetColorKey;
    // The tolerance in color differences.
    property Tolerance: Single read GetTolerance write SetTolerance;
  end;

  //Converts a grayscale image to a white image that is masked by alpha.
  TMaskToAlphaEffect = class(TImageFXEffect)
  private
  published
  end;

  //Changes the overall hue, or tint, of the source pixels.
  THueAdjustEffect = class(TImageFXEffect)
  private
    function GetHue: Single;
    procedure SetHue(AValue: Single);
  published
    // The hue offset.
    property Hue: Single read GetHue write SetHue;
  end;

  //An effect that controls brightness and contrast.
  TContrastEffect = class(TImageFXEffect)
  private
    function GetBrightness: Single;
    procedure SetBrightness(AValue: Single);
    function GetContrast: Single;
    procedure SetContrast(AValue: Single);
  published
    // The brightness offset.
    property Brightness: Single read GetBrightness write SetBrightness;
    // The contrast multiplier.
    property Contrast: Single read GetContrast write SetContrast;
  end;

  //An effect that intensifies bright regions.
  TBloomEffect = class(TImageFXEffect)
  private
    function GetBloomIntensity: Single;
    procedure SetBloomIntensity(AValue: Single);
    function GetBaseIntensity: Single;
    procedure SetBaseIntensity(AValue: Single);
    function GetBloomSaturation: Single;
    procedure SetBloomSaturation(AValue: Single);
    function GetBaseSaturation: Single;
    procedure SetBaseSaturation(AValue: Single);
  published
    // Intensity of the bloom image.
    property BloomIntensity: Single read GetBloomIntensity write SetBloomIntensity;
    // Intensity of the base image.
    property BaseIntensity: Single read GetBaseIntensity write SetBaseIntensity;
    // Saturation of the bloom image.
    property BloomSaturation: Single read GetBloomSaturation write SetBloomSaturation;
    // Saturation of the base image.
    property BaseSaturation: Single read GetBaseSaturation write SetBaseSaturation;
  end;

  //An effect that intensifies dark regions.
  TGloomEffect = class(TImageFXEffect)
  private
    function GetGloomIntensity: Single;
    procedure SetGloomIntensity(AValue: Single);
    function GetBaseIntensity: Single;
    procedure SetBaseIntensity(AValue: Single);
    function GetGloomSaturation: Single;
    procedure SetGloomSaturation(AValue: Single);
    function GetBaseSaturation: Single;
    procedure SetBaseSaturation(AValue: Single);
  published
    // Intensity of the gloom image.
    property GloomIntensity: Single read GetGloomIntensity write SetGloomIntensity;
    // Intensity of the base image.
    property BaseIntensity: Single read GetBaseIntensity write SetBaseIntensity;
    // Saturation of the gloom image.
    property GloomSaturation: Single read GetGloomSaturation write SetGloomSaturation;
    // Saturation of the base image.
    property BaseSaturation: Single read GetBaseSaturation write SetBaseSaturation;
  end;

  //Normal blending of two images.
  TNormalBlendEffect = class(TImageFXEffect)
  private
    procedure SetTarget(AValue: TBitmap);
  private
    FTarget: TBitmap;
    procedure DoTargetChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    // The target bitmap.
    property Target: TBitmap read FTarget write SetTarget;
  end;

  //Generates a solid color.
  TFillEffect = class(TImageFXEffect)
  private
    function GetColor: TAlphaColor;
    procedure SetColor(AValue: TAlphaColor);
  published
    // The fill color.
    property Color: TAlphaColor read GetColor write SetColor;
  end;

  //Fill all pixels with not empty alpha.
  TFillRGBEffect = class(TImageFXEffect)
  private
    function GetColor: TAlphaColor;
    procedure SetColor(AValue: TAlphaColor);
  published
    // The fill color.
    property Color: TAlphaColor read GetColor write SetColor;
  end;

  //
  TPixelateEffect = class(TImageFXEffect)
  private
    function GetBlockCount: Single;
    procedure SetBlockCount(AValue: Single);
  published
    // The number of pixel blocks.
    property BlockCount: Single read GetBlockCount write SetBlockCount;
  end;

  //An effect that embosses the input.
  TEmbossEffect = class(TImageFXEffect)
  private
    function GetAmount: Single;
    procedure SetAmount(AValue: Single);
    function GetWidth: Single;
    procedure SetWidth(AValue: Single);
  published
    // The amplitude of the embossing.
    property Amount: Single read GetAmount write SetAmount;
    // The separation between samples (as a fraction of input size).
    property Width: Single read GetWidth write SetWidth;
  end;

  //An effect that sharpens the input.
  TSharpenEffect = class(TImageFXEffect)
  private
    function GetAmount: Single;
    procedure SetAmount(AValue: Single);
  published
    // The amount of sharpening.
    property Amount: Single read GetAmount write SetAmount;
  end;

  //An effect that applies cartoon-like shading (posterization).
  TToonEffect = class(TImageFXEffect)
  private
    function GetLevels: Single;
    procedure SetLevels(AValue: Single);
  published
    // The number of color levels to use.
    property Levels: Single read GetLevels write SetLevels;
  end;

  //Sepia effect.
  TSepiaEffect = class(TImageFXEffect)
  private
    function GetAmount: Single;
    procedure SetAmount(AValue: Single);
  published
    // The amount of sharpening.
    property Amount: Single read GetAmount write SetAmount;
  end;

  //An paper sketch effect.
  TPaperSketchEffect = class(TImageFXEffect)
  private
    function GetBrushSize: Single;
    procedure SetBrushSize(AValue: Single);
  published
    // The brush size of the sketch effect.
    property BrushSize: Single read GetBrushSize write SetBrushSize;
  end;

  //An pencil stroke effect.
  TPencilStrokeEffect = class(TImageFXEffect)
  private
    function GetBrushSize: Single;
    procedure SetBrushSize(AValue: Single);
  published
    // The brush size of the sketch effect.
    property BrushSize: Single read GetBrushSize write SetBrushSize;
  end;

  //Pixel shader tiles the image across multiple rows and columns
  TTilerEffect = class(TImageFXEffect)
  private
    function GetVerticalTileCount: Single;
    procedure SetVerticalTileCount(AValue: Single);
    function GetHorizontalTileCount: Single;
    procedure SetHorizontalTileCount(AValue: Single);
    function GetHorizontalOffset: Single;
    procedure SetHorizontalOffset(AValue: Single);
    function GetVerticalOffset: Single;
    procedure SetVerticalOffset(AValue: Single);
  published
    // The number of verical tiles to add to the output. The higher the value the more tiles.
    property VerticalTileCount: Single read GetVerticalTileCount write SetVerticalTileCount;
    // The number of horizontal tiles to add to the output. The higher the value the more tiles.
    property HorizontalTileCount: Single read GetHorizontalTileCount write SetHorizontalTileCount;
    // Change the horizontal offset of each tile.
    property HorizontalOffset: Single read GetHorizontalOffset write SetHorizontalOffset;
    // Change the vertical offset of each tile.
    property VerticalOffset: Single read GetVerticalOffset write SetVerticalOffset;
  end;

  //An effect that superimposes rippling waves upon the input.
  TRippleEffect = class(TImageFXEffect)
  private
    function GetCenter: TPointF;
    procedure SetCenter(AValue: TPointF);
    function GetAmplitude: Single;
    procedure SetAmplitude(AValue: Single);
    function GetFrequency: Single;
    procedure SetFrequency(AValue: Single);
    function GetPhase: Single;
    procedure SetPhase(AValue: Single);
    function GetAspectRatio: Single;
    procedure SetAspectRatio(AValue: Single);
  published
    // The center point of the ripples.
  public
    property Center: TPointF read GetCenter write SetCenter;
  published
    // The amplitude of the ripples.
    property Amplitude: Single read GetAmplitude write SetAmplitude;
    // The frequency of the ripples.
    property Frequency: Single read GetFrequency write SetFrequency;
    // The phase of the ripples.
    property Phase: Single read GetPhase write SetPhase;
    // The aspect ratio (width / height) of the input.
    property AspectRatio: Single read GetAspectRatio write SetAspectRatio;
  end;

  //An effect that swirls the input in a spiral.
  TSwirlEffect = class(TImageFXEffect)
  private
    function GetCenter: TPointF;
    procedure SetCenter(AValue: TPointF);
    function GetStrength: Single;
    procedure SetStrength(AValue: Single);
    function GetAspectRatio: Single;
    procedure SetAspectRatio(AValue: Single);
  published
    // The center point of the ripples.
  public
    property Center: TPointF read GetCenter write SetCenter;
  published
    // The amount of twist to the spiral.
    property Strength: Single read GetStrength write SetStrength;
    // The aspect ratio (width / height) of the input.
    property AspectRatio: Single read GetAspectRatio write SetAspectRatio;
  end;

  //An effect that magnifies a circular region.
  TMagnifyEffect = class(TImageFXEffect)
  private
    function GetCenter: TPointF;
    procedure SetCenter(AValue: TPointF);
    function GetRadius: Single;
    procedure SetRadius(AValue: Single);
    function GetMagnification: Single;
    procedure SetMagnification(AValue: Single);
    function GetAspectRatio: Single;
    procedure SetAspectRatio(AValue: Single);
  published
    // The center point of the ripples.
  public
    property Center: TPointF read GetCenter write SetCenter;
  published
    // The radius of the magnified region.
    property Radius: Single read GetRadius write SetRadius;
    // The magnification factor.
    property Magnification: Single read GetMagnification write SetMagnification;
    // The aspect ratio (width / height) of the input.
    property AspectRatio: Single read GetAspectRatio write SetAspectRatio;
  end;

  //An effect that magnifies a circular region.
  TSmoothMagnifyEffect = class(TImageFXEffect)
  private
    function GetCenter: TPointF;
    procedure SetCenter(AValue: TPointF);
    function GetInnerRadius: Single;
    procedure SetInnerRadius(AValue: Single);
    function GetOuterRadius: Single;
    procedure SetOuterRadius(AValue: Single);
    function GetMagnification: Single;
    procedure SetMagnification(AValue: Single);
    function GetAspectRatio: Single;
    procedure SetAspectRatio(AValue: Single);
  published
    // The center point of the ripples.
  public
    property Center: TPointF read GetCenter write SetCenter;
  published
    // The inner radius of the magnified region.
    property InnerRadius: Single read GetInnerRadius write SetInnerRadius;
    // The outer radius of the magnified region.
    property OuterRadius: Single read GetOuterRadius write SetOuterRadius;
    // The magnification factor.
    property Magnification: Single read GetMagnification write SetMagnification;
    // The aspect ratio (width / height) of the input.
    property AspectRatio: Single read GetAspectRatio write SetAspectRatio;
  end;

  //An effect that creates bands of bright regions.
  TBandsEffect = class(TImageFXEffect)
  private
    function GetBandDensity: Single;
    procedure SetBandDensity(AValue: Single);
    function GetBandIntensity: Single;
    procedure SetBandIntensity(AValue: Single);
  published
    // The number of verical bands to add to the output. The higher the value the more bands.
    property BandDensity: Single read GetBandDensity write SetBandDensity;
    // Intensity of each band.
    property BandIntensity: Single read GetBandIntensity write SetBandIntensity;
  end;

  //An effect that applies a wave pattern to the input.
  TWaveEffect = class(TImageFXEffect)
  private
    function GetTime: Single;
    procedure SetTime(AValue: Single);
    function GetWaveSize: Single;
    procedure SetWaveSize(AValue: Single);
  published
    // The moment in time. Animate this value over a long period of time. The speed depends on the size. The larger the size, the larger the increase in time on every frame, thus from 0 to 2048 in a smaller amount of time.
    property Time: Single read GetTime write SetTime;
    // The distance between waves. (the higher the value the closer the waves are to their neighbor).
    property WaveSize: Single read GetWaveSize write SetWaveSize;
  end;

  //Wrap image by two Bezier curves.
  TWrapEffect = class(TImageFXEffect)
  private
    function GetLeftStart: Single;
    procedure SetLeftStart(AValue: Single);
    function GetLeftControl1: Single;
    procedure SetLeftControl1(AValue: Single);
    function GetLeftControl2: Single;
    procedure SetLeftControl2(AValue: Single);
    function GetLeftEnd: Single;
    procedure SetLeftEnd(AValue: Single);
    function GetRightStart: Single;
    procedure SetRightStart(AValue: Single);
    function GetRightControl1: Single;
    procedure SetRightControl1(AValue: Single);
    function GetRightControl2: Single;
    procedure SetRightControl2(AValue: Single);
    function GetRightEnd: Single;
    procedure SetRightEnd(AValue: Single);
  published
    // Left wrap curve start point
    property LeftStart: Single read GetLeftStart write SetLeftStart;
    // Left wrap curve control point 1
    property LeftControl1: Single read GetLeftControl1 write SetLeftControl1;
    // Left wrap curve control point 2
    property LeftControl2: Single read GetLeftControl2 write SetLeftControl2;
    // Left wrap curve end point
    property LeftEnd: Single read GetLeftEnd write SetLeftEnd;
    // Right wrap curve start point
    property RightStart: Single read GetRightStart write SetRightStart;
    // Right wrap curve control point 1
    property RightControl1: Single read GetRightControl1 write SetRightControl1;
    // Right wrap curve control point 2
    property RightControl2: Single read GetRightControl2 write SetRightControl2;
    // Right wrap curve end point
    property RightEnd: Single read GetRightEnd write SetRightEnd;
  end;

  //An effect that swirls the input in alternating clockwise and counterclockwise bands.
  TBandedSwirlEffect = class(TImageFXEffect)
  private
    function GetCenter: TPointF;
    procedure SetCenter(AValue: TPointF);
    function GetBands: Single;
    procedure SetBands(AValue: Single);
    function GetStrength: Single;
    procedure SetStrength(AValue: Single);
    function GetAspectRatio: Single;
    procedure SetAspectRatio(AValue: Single);
  published
    // The center point of the ripples.
  public
    property Center: TPointF read GetCenter write SetCenter;
  published
    // The number of bands in the swirl.
    property Bands: Single read GetBands write SetBands;
    // The amount of twist to the spiral.
    property Strength: Single read GetStrength write SetStrength;
    // The aspect ratio (width / height) of the input.
    property AspectRatio: Single read GetAspectRatio write SetAspectRatio;
  end;

  //An effect that pinches a circular region.
  TPinchEffect = class(TImageFXEffect)
  private
    function GetCenter: TPointF;
    procedure SetCenter(AValue: TPointF);
    function GetRadius: Single;
    procedure SetRadius(AValue: Single);
    function GetStrength: Single;
    procedure SetStrength(AValue: Single);
    function GetAspectRatio: Single;
    procedure SetAspectRatio(AValue: Single);
  published
    // The center point of the pinched region.
  public
    property Center: TPointF read GetCenter write SetCenter;
  published
    // The radius of the pinched region.
    property Radius: Single read GetRadius write SetRadius;
    // The amount of twist to the spiral.
    property Strength: Single read GetStrength write SetStrength;
    // The aspect ratio (width / height) of the input.
    property AspectRatio: Single read GetAspectRatio write SetAspectRatio;
  end;

procedure Register;

implementation


constructor TFilterBaseFilter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFilter := FilterByName(Copy(ClassName, 10, 100));
end;

destructor TFilterBaseFilter.Destroy; 
begin
  if FFilter <> nil then
    FFilter.Free;
  inherited Destroy;
end;

function TFilterBaseFilter.GetOutput: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Output']
  else
    Result := nil;
end;

procedure TFilterBaseFilter.SetInput(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Input'] := AValue;
end;

procedure TFilterBaseFilter.SetInputFilter(AValue: TFilterBaseFilter);
begin
  FInputFilter := AValue;
  if FFilter <> nil then
    if (FInputFilter <> nil) then
      FFilter.InputFilter := FInputFilter.FFilter
    else
      FFilter.InputFilter := nil;
end;

procedure TFilterBaseFilter.Notification(AComponent: TComponent; Operation: TOperation);
begin
  if (Operation = opRemove) and (AComponent = FInputFilter) then
    InputFilter := nil;
end;

{ TFilterGaussianBlur Implementation }

function TFilterGaussianBlur.GetBlurAmount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BlurAmount']
  else
    Result := 0;
end;

procedure TFilterGaussianBlur.SetBlurAmount(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['BlurAmount'] := AValue;
end;

{ TFilterBoxBlur Implementation }

function TFilterBoxBlur.GetBlurAmount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BlurAmount']
  else
    Result := 0;
end;

procedure TFilterBoxBlur.SetBlurAmount(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['BlurAmount'] := AValue;
end;

{ TFilterDirectionalBlur Implementation }

function TFilterDirectionalBlur.GetAngle: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Angle']
  else
    Result := 0;
end;

function TFilterDirectionalBlur.GetBlurAmount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BlurAmount']
  else
    Result := 0;
end;

procedure TFilterDirectionalBlur.SetAngle(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Angle'] := AValue;
end;

procedure TFilterDirectionalBlur.SetBlurAmount(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['BlurAmount'] := AValue;
end;

{ TFilterRadialBlur Implementation }

function TFilterRadialBlur.GetCenter: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Center']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TFilterRadialBlur.GetBlurAmount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BlurAmount']
  else
    Result := 0;
end;

procedure TFilterRadialBlur.SetCenter(AValue: TPointF);
begin
  if FFilter <> nil then
    FFilter.ValuesAsPoint['Center'] := PointF(AValue.x, AValue.y);
end;

procedure TFilterRadialBlur.SetBlurAmount(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['BlurAmount'] := AValue;
end;

{ TFilterAffineTransform Implementation }

function TFilterAffineTransform.GetCenter: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Center']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TFilterAffineTransform.GetRotation: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Rotation']
  else
    Result := 0;
end;

function TFilterAffineTransform.GetScale: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Scale']
  else
    Result := 0;
end;

procedure TFilterAffineTransform.SetCenter(AValue: TPointF);
begin
  if FFilter <> nil then
    FFilter.ValuesAsPoint['Center'] := PointF(AValue.x, AValue.y);
end;

procedure TFilterAffineTransform.SetRotation(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Rotation'] := AValue;
end;

procedure TFilterAffineTransform.SetScale(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Scale'] := AValue;
end;

{ TFilterPerspectiveTransform Implementation }

function TFilterPerspectiveTransform.GetTopLeft: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['TopLeft']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TFilterPerspectiveTransform.GetTopRight: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['TopRight']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TFilterPerspectiveTransform.GetBottomRight: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['BottomRight']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TFilterPerspectiveTransform.GetBottomLeft: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['BottomLeft']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

procedure TFilterPerspectiveTransform.SetTopLeft(AValue: TPointF);
begin
  if FFilter <> nil then
    FFilter.ValuesAsPoint['TopLeft'] := PointF(AValue.x, AValue.y);
end;

procedure TFilterPerspectiveTransform.SetTopRight(AValue: TPointF);
begin
  if FFilter <> nil then
    FFilter.ValuesAsPoint['TopRight'] := PointF(AValue.x, AValue.y);
end;

procedure TFilterPerspectiveTransform.SetBottomRight(AValue: TPointF);
begin
  if FFilter <> nil then
    FFilter.ValuesAsPoint['BottomRight'] := PointF(AValue.x, AValue.y);
end;

procedure TFilterPerspectiveTransform.SetBottomLeft(AValue: TPointF);
begin
  if FFilter <> nil then
    FFilter.ValuesAsPoint['BottomLeft'] := PointF(AValue.x, AValue.y);
end;

{ TFilterCrop Implementation }

function TFilterCrop.GetLeftTop: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['LeftTop']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TFilterCrop.GetRightBottom: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['RightBottom']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

procedure TFilterCrop.SetLeftTop(AValue: TPointF);
begin
  if FFilter <> nil then
    FFilter.ValuesAsPoint['LeftTop'] := PointF(AValue.x, AValue.y);
end;

procedure TFilterCrop.SetRightBottom(AValue: TPointF);
begin
  if FFilter <> nil then
    FFilter.ValuesAsPoint['RightBottom'] := PointF(AValue.x, AValue.y);
end;

{ TFilterBandedSwirlTransition Implementation }

function TFilterBandedSwirlTransition.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TFilterBandedSwirlTransition.GetStrength: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Strength']
  else
    Result := 0;
end;

function TFilterBandedSwirlTransition.GetFrequency: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Frequency']
  else
    Result := 0;
end;

function TFilterBandedSwirlTransition.GetCenter: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Center']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TFilterBandedSwirlTransition.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterBandedSwirlTransition.SetProgress(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Progress'] := AValue;
end;

procedure TFilterBandedSwirlTransition.SetStrength(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Strength'] := AValue;
end;

procedure TFilterBandedSwirlTransition.SetFrequency(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Frequency'] := AValue;
end;

procedure TFilterBandedSwirlTransition.SetCenter(AValue: TPointF);
begin
  if FFilter <> nil then
    FFilter.ValuesAsPoint['Center'] := PointF(AValue.x, AValue.y);
end;

procedure TFilterBandedSwirlTransition.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterBlindTransition Implementation }

function TFilterBlindTransition.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TFilterBlindTransition.GetNumberOfBlinds: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['NumberOfBlinds']
  else
    Result := 0;
end;

function TFilterBlindTransition.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterBlindTransition.SetProgress(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Progress'] := AValue;
end;

procedure TFilterBlindTransition.SetNumberOfBlinds(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['NumberOfBlinds'] := AValue;
end;

procedure TFilterBlindTransition.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterBloodTransition Implementation }

function TFilterBloodTransition.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TFilterBloodTransition.GetRandomSeed: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['RandomSeed']
  else
    Result := 0;
end;

function TFilterBloodTransition.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterBloodTransition.SetProgress(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Progress'] := AValue;
end;

procedure TFilterBloodTransition.SetRandomSeed(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['RandomSeed'] := AValue;
end;

procedure TFilterBloodTransition.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterCircleTransition Implementation }

function TFilterCircleTransition.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TFilterCircleTransition.GetFuzzyAmount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['FuzzyAmount']
  else
    Result := 0;
end;

function TFilterCircleTransition.GetSize: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Size']
  else
    Result := 0;
end;

function TFilterCircleTransition.GetCenter: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Center']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TFilterCircleTransition.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterCircleTransition.SetProgress(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Progress'] := AValue;
end;

procedure TFilterCircleTransition.SetFuzzyAmount(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['FuzzyAmount'] := AValue;
end;

procedure TFilterCircleTransition.SetSize(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Size'] := AValue;
end;

procedure TFilterCircleTransition.SetCenter(AValue: TPointF);
begin
  if FFilter <> nil then
    FFilter.ValuesAsPoint['Center'] := PointF(AValue.x, AValue.y);
end;

procedure TFilterCircleTransition.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterMagnifyTransition Implementation }

function TFilterMagnifyTransition.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TFilterMagnifyTransition.GetCenter: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Center']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TFilterMagnifyTransition.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterMagnifyTransition.SetProgress(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Progress'] := AValue;
end;

procedure TFilterMagnifyTransition.SetCenter(AValue: TPointF);
begin
  if FFilter <> nil then
    FFilter.ValuesAsPoint['Center'] := PointF(AValue.x, AValue.y);
end;

procedure TFilterMagnifyTransition.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterCrumpleTransition Implementation }

function TFilterCrumpleTransition.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TFilterCrumpleTransition.GetRandomSeed: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['RandomSeed']
  else
    Result := 0;
end;

function TFilterCrumpleTransition.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterCrumpleTransition.SetProgress(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Progress'] := AValue;
end;

procedure TFilterCrumpleTransition.SetRandomSeed(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['RandomSeed'] := AValue;
end;

procedure TFilterCrumpleTransition.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterDissolveTransition Implementation }

function TFilterDissolveTransition.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TFilterDissolveTransition.GetRandomSeed: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['RandomSeed']
  else
    Result := 0;
end;

function TFilterDissolveTransition.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterDissolveTransition.SetProgress(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Progress'] := AValue;
end;

procedure TFilterDissolveTransition.SetRandomSeed(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['RandomSeed'] := AValue;
end;

procedure TFilterDissolveTransition.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterDropTransition Implementation }

function TFilterDropTransition.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TFilterDropTransition.GetRandomSeed: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['RandomSeed']
  else
    Result := 0;
end;

function TFilterDropTransition.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterDropTransition.SetProgress(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Progress'] := AValue;
end;

procedure TFilterDropTransition.SetRandomSeed(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['RandomSeed'] := AValue;
end;

procedure TFilterDropTransition.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterFadeTransition Implementation }

function TFilterFadeTransition.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TFilterFadeTransition.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterFadeTransition.SetProgress(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Progress'] := AValue;
end;

procedure TFilterFadeTransition.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterBrightTransition Implementation }

function TFilterBrightTransition.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TFilterBrightTransition.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterBrightTransition.SetProgress(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Progress'] := AValue;
end;

procedure TFilterBrightTransition.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterPixelateTransition Implementation }

function TFilterPixelateTransition.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TFilterPixelateTransition.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterPixelateTransition.SetProgress(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Progress'] := AValue;
end;

procedure TFilterPixelateTransition.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterBlurTransition Implementation }

function TFilterBlurTransition.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TFilterBlurTransition.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterBlurTransition.SetProgress(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Progress'] := AValue;
end;

procedure TFilterBlurTransition.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterWiggleTransition Implementation }

function TFilterWiggleTransition.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TFilterWiggleTransition.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterWiggleTransition.SetProgress(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Progress'] := AValue;
end;

procedure TFilterWiggleTransition.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterShapeTransition Implementation }

function TFilterShapeTransition.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TFilterShapeTransition.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterShapeTransition.SetProgress(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Progress'] := AValue;
end;

procedure TFilterShapeTransition.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterRippleTransition Implementation }

function TFilterRippleTransition.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TFilterRippleTransition.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterRippleTransition.SetProgress(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Progress'] := AValue;
end;

procedure TFilterRippleTransition.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterRotateCrumpleTransition Implementation }

function TFilterRotateCrumpleTransition.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TFilterRotateCrumpleTransition.GetRandomSeed: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['RandomSeed']
  else
    Result := 0;
end;

function TFilterRotateCrumpleTransition.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterRotateCrumpleTransition.SetProgress(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Progress'] := AValue;
end;

procedure TFilterRotateCrumpleTransition.SetRandomSeed(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['RandomSeed'] := AValue;
end;

procedure TFilterRotateCrumpleTransition.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterSaturateTransition Implementation }

function TFilterSaturateTransition.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TFilterSaturateTransition.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterSaturateTransition.SetProgress(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Progress'] := AValue;
end;

procedure TFilterSaturateTransition.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterSlideTransition Implementation }

function TFilterSlideTransition.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TFilterSlideTransition.GetSlideAmount: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['SlideAmount']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TFilterSlideTransition.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterSlideTransition.SetProgress(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Progress'] := AValue;
end;

procedure TFilterSlideTransition.SetSlideAmount(AValue: TPointF);
begin
  if FFilter <> nil then
    FFilter.ValuesAsPoint['SlideAmount'] := PointF(AValue.x, AValue.y);
end;

procedure TFilterSlideTransition.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterSwirlTransition Implementation }

function TFilterSwirlTransition.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TFilterSwirlTransition.GetStrength: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Strength']
  else
    Result := 0;
end;

function TFilterSwirlTransition.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterSwirlTransition.SetProgress(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Progress'] := AValue;
end;

procedure TFilterSwirlTransition.SetStrength(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Strength'] := AValue;
end;

procedure TFilterSwirlTransition.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterWaterTransition Implementation }

function TFilterWaterTransition.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TFilterWaterTransition.GetRandomSeed: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['RandomSeed']
  else
    Result := 0;
end;

function TFilterWaterTransition.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterWaterTransition.SetProgress(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Progress'] := AValue;
end;

procedure TFilterWaterTransition.SetRandomSeed(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['RandomSeed'] := AValue;
end;

procedure TFilterWaterTransition.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterWaveTransition Implementation }

function TFilterWaveTransition.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TFilterWaveTransition.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterWaveTransition.SetProgress(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Progress'] := AValue;
end;

procedure TFilterWaveTransition.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterLineTransition Implementation }

function TFilterLineTransition.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TFilterLineTransition.GetOrigin: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Origin']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TFilterLineTransition.GetNormal: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Normal']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TFilterLineTransition.GetOffset: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Offset']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TFilterLineTransition.GetFuzzyAmount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['FuzzyAmount']
  else
    Result := 0;
end;

function TFilterLineTransition.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterLineTransition.SetProgress(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Progress'] := AValue;
end;

procedure TFilterLineTransition.SetOrigin(AValue: TPointF);
begin
  if FFilter <> nil then
    FFilter.ValuesAsPoint['Origin'] := PointF(AValue.x, AValue.y);
end;

procedure TFilterLineTransition.SetNormal(AValue: TPointF);
begin
  if FFilter <> nil then
    FFilter.ValuesAsPoint['Normal'] := PointF(AValue.x, AValue.y);
end;

procedure TFilterLineTransition.SetOffset(AValue: TPointF);
begin
  if FFilter <> nil then
    FFilter.ValuesAsPoint['Offset'] := PointF(AValue.x, AValue.y);
end;

procedure TFilterLineTransition.SetFuzzyAmount(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['FuzzyAmount'] := AValue;
end;

procedure TFilterLineTransition.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterInvert Implementation }

{ TFilterMonochrome Implementation }

{ TFilterColorKeyAlpha Implementation }

function TFilterColorKeyAlpha.GetColorKey: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['ColorKey']
  else
    Result := 0;
end;

function TFilterColorKeyAlpha.GetTolerance: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Tolerance']
  else
    Result := 0;
end;

procedure TFilterColorKeyAlpha.SetColorKey(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['ColorKey'] := AValue;
end;

procedure TFilterColorKeyAlpha.SetTolerance(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Tolerance'] := AValue;
end;

{ TFilterMaskToAlpha Implementation }

{ TFilterHueAdjust Implementation }

function TFilterHueAdjust.GetHue: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Hue']
  else
    Result := 0;
end;

procedure TFilterHueAdjust.SetHue(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Hue'] := AValue;
end;

{ TFilterContrast Implementation }

function TFilterContrast.GetBrightness: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Brightness']
  else
    Result := 0;
end;

function TFilterContrast.GetContrast: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Contrast']
  else
    Result := 0;
end;

procedure TFilterContrast.SetBrightness(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Brightness'] := AValue;
end;

procedure TFilterContrast.SetContrast(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Contrast'] := AValue;
end;

{ TFilterBloom Implementation }

function TFilterBloom.GetBloomIntensity: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BloomIntensity']
  else
    Result := 0;
end;

function TFilterBloom.GetBaseIntensity: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BaseIntensity']
  else
    Result := 0;
end;

function TFilterBloom.GetBloomSaturation: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BloomSaturation']
  else
    Result := 0;
end;

function TFilterBloom.GetBaseSaturation: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BaseSaturation']
  else
    Result := 0;
end;

procedure TFilterBloom.SetBloomIntensity(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['BloomIntensity'] := AValue;
end;

procedure TFilterBloom.SetBaseIntensity(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['BaseIntensity'] := AValue;
end;

procedure TFilterBloom.SetBloomSaturation(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['BloomSaturation'] := AValue;
end;

procedure TFilterBloom.SetBaseSaturation(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['BaseSaturation'] := AValue;
end;

{ TFilterGloom Implementation }

function TFilterGloom.GetGloomIntensity: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['GloomIntensity']
  else
    Result := 0;
end;

function TFilterGloom.GetBaseIntensity: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BaseIntensity']
  else
    Result := 0;
end;

function TFilterGloom.GetGloomSaturation: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['GloomSaturation']
  else
    Result := 0;
end;

function TFilterGloom.GetBaseSaturation: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BaseSaturation']
  else
    Result := 0;
end;

procedure TFilterGloom.SetGloomIntensity(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['GloomIntensity'] := AValue;
end;

procedure TFilterGloom.SetBaseIntensity(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['BaseIntensity'] := AValue;
end;

procedure TFilterGloom.SetGloomSaturation(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['GloomSaturation'] := AValue;
end;

procedure TFilterGloom.SetBaseSaturation(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['BaseSaturation'] := AValue;
end;

{ TFilterNormalBlend Implementation }

function TFilterNormalBlend.GetTarget: TBitmap;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsBitmap['Target']
  else
    Result := nil;
end;

procedure TFilterNormalBlend.SetTarget(AValue: TBitmap);
begin
  if FFilter <> nil then
    FFilter.ValuesAsBitmap['Target'] := AValue;
end;

{ TFilterFill Implementation }

function TFilterFill.GetColor: TAlphaColor;
begin
  if FFilter <> nil then
  {$IFNDEF FPC}
    Result := FFilter.Values['Color']
  {$ELSE}
    Result := Cardinal(FFilter.Values['Color'])
  {$ENDIF}
  else
    Result := 0;
end;

procedure TFilterFill.SetColor(AValue: TAlphaColor);
begin
  if FFilter <> nil then
    FFilter.Values['Color'] := AValue;
end;

{ TFilterFillRGB Implementation }

function TFilterFillRGB.GetColor: TAlphaColor;
begin
  if FFilter <> nil then
  {$IFNDEF FPC}
    Result := FFilter.Values['Color']
  {$ELSE}
    Result := Cardinal(FFilter.Values['Color'])
  {$ENDIF}
  else
    Result := 0;
end;

procedure TFilterFillRGB.SetColor(AValue: TAlphaColor);
begin
  if FFilter <> nil then
    FFilter.Values['Color'] := AValue;
end;

{ TFilterPixelate Implementation }

function TFilterPixelate.GetBlockCount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BlockCount']
  else
    Result := 0;
end;

procedure TFilterPixelate.SetBlockCount(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['BlockCount'] := AValue;
end;

{ TFilterEmboss Implementation }

function TFilterEmboss.GetAmount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Amount']
  else
    Result := 0;
end;

function TFilterEmboss.GetWidth: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Width']
  else
    Result := 0;
end;

procedure TFilterEmboss.SetAmount(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Amount'] := AValue;
end;

procedure TFilterEmboss.SetWidth(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Width'] := AValue;
end;

{ TFilterSharpen Implementation }

function TFilterSharpen.GetAmount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Amount']
  else
    Result := 0;
end;

procedure TFilterSharpen.SetAmount(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Amount'] := AValue;
end;

{ TFilterToon Implementation }

function TFilterToon.GetLevels: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Levels']
  else
    Result := 0;
end;

procedure TFilterToon.SetLevels(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Levels'] := AValue;
end;

{ TFilterSepia Implementation }

function TFilterSepia.GetAmount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Amount']
  else
    Result := 0;
end;

procedure TFilterSepia.SetAmount(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Amount'] := AValue;
end;

{ TFilterPaperSketch Implementation }

function TFilterPaperSketch.GetBrushSize: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BrushSize']
  else
    Result := 0;
end;

procedure TFilterPaperSketch.SetBrushSize(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['BrushSize'] := AValue;
end;

{ TFilterPencilStroke Implementation }

function TFilterPencilStroke.GetBrushSize: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BrushSize']
  else
    Result := 0;
end;

procedure TFilterPencilStroke.SetBrushSize(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['BrushSize'] := AValue;
end;

{ TFilterTiler Implementation }

function TFilterTiler.GetVerticalTileCount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['VerticalTileCount']
  else
    Result := 0;
end;

function TFilterTiler.GetHorizontalTileCount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['HorizontalTileCount']
  else
    Result := 0;
end;

function TFilterTiler.GetHorizontalOffset: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['HorizontalOffset']
  else
    Result := 0;
end;

function TFilterTiler.GetVerticalOffset: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['VerticalOffset']
  else
    Result := 0;
end;

procedure TFilterTiler.SetVerticalTileCount(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['VerticalTileCount'] := AValue;
end;

procedure TFilterTiler.SetHorizontalTileCount(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['HorizontalTileCount'] := AValue;
end;

procedure TFilterTiler.SetHorizontalOffset(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['HorizontalOffset'] := AValue;
end;

procedure TFilterTiler.SetVerticalOffset(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['VerticalOffset'] := AValue;
end;

{ TFilterRipple Implementation }

function TFilterRipple.GetCenter: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Center']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TFilterRipple.GetAmplitude: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Amplitude']
  else
    Result := 0;
end;

function TFilterRipple.GetFrequency: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Frequency']
  else
    Result := 0;
end;

function TFilterRipple.GetPhase: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Phase']
  else
    Result := 0;
end;

function TFilterRipple.GetAspectRatio: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['AspectRatio']
  else
    Result := 0;
end;

procedure TFilterRipple.SetCenter(AValue: TPointF);
begin
  if FFilter <> nil then
    FFilter.ValuesAsPoint['Center'] := PointF(AValue.x, AValue.y);
end;

procedure TFilterRipple.SetAmplitude(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Amplitude'] := AValue;
end;

procedure TFilterRipple.SetFrequency(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Frequency'] := AValue;
end;

procedure TFilterRipple.SetPhase(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Phase'] := AValue;
end;

procedure TFilterRipple.SetAspectRatio(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['AspectRatio'] := AValue;
end;

{ TFilterSwirl Implementation }

function TFilterSwirl.GetCenter: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Center']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TFilterSwirl.GetStrength: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Strength']
  else
    Result := 0;
end;

function TFilterSwirl.GetAspectRatio: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['AspectRatio']
  else
    Result := 0;
end;

procedure TFilterSwirl.SetCenter(AValue: TPointF);
begin
  if FFilter <> nil then
    FFilter.ValuesAsPoint['Center'] := PointF(AValue.x, AValue.y);
end;

procedure TFilterSwirl.SetStrength(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Strength'] := AValue;
end;

procedure TFilterSwirl.SetAspectRatio(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['AspectRatio'] := AValue;
end;

{ TFilterMagnify Implementation }

function TFilterMagnify.GetCenter: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Center']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TFilterMagnify.GetRadius: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Radius']
  else
    Result := 0;
end;

function TFilterMagnify.GetMagnification: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Magnification']
  else
    Result := 0;
end;

function TFilterMagnify.GetAspectRatio: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['AspectRatio']
  else
    Result := 0;
end;

procedure TFilterMagnify.SetCenter(AValue: TPointF);
begin
  if FFilter <> nil then
    FFilter.ValuesAsPoint['Center'] := PointF(AValue.x, AValue.y);
end;

procedure TFilterMagnify.SetRadius(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Radius'] := AValue;
end;

procedure TFilterMagnify.SetMagnification(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Magnification'] := AValue;
end;

procedure TFilterMagnify.SetAspectRatio(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['AspectRatio'] := AValue;
end;

{ TFilterSmoothMagnify Implementation }

function TFilterSmoothMagnify.GetCenter: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Center']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TFilterSmoothMagnify.GetInnerRadius: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['InnerRadius']
  else
    Result := 0;
end;

function TFilterSmoothMagnify.GetOuterRadius: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['OuterRadius']
  else
    Result := 0;
end;

function TFilterSmoothMagnify.GetMagnification: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Magnification']
  else
    Result := 0;
end;

function TFilterSmoothMagnify.GetAspectRatio: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['AspectRatio']
  else
    Result := 0;
end;

procedure TFilterSmoothMagnify.SetCenter(AValue: TPointF);
begin
  if FFilter <> nil then
    FFilter.ValuesAsPoint['Center'] := PointF(AValue.x, AValue.y);
end;

procedure TFilterSmoothMagnify.SetInnerRadius(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['InnerRadius'] := AValue;
end;

procedure TFilterSmoothMagnify.SetOuterRadius(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['OuterRadius'] := AValue;
end;

procedure TFilterSmoothMagnify.SetMagnification(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Magnification'] := AValue;
end;

procedure TFilterSmoothMagnify.SetAspectRatio(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['AspectRatio'] := AValue;
end;

{ TFilterBands Implementation }

function TFilterBands.GetBandDensity: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BandDensity']
  else
    Result := 0;
end;

function TFilterBands.GetBandIntensity: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BandIntensity']
  else
    Result := 0;
end;

procedure TFilterBands.SetBandDensity(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['BandDensity'] := AValue;
end;

procedure TFilterBands.SetBandIntensity(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['BandIntensity'] := AValue;
end;

{ TFilterWave Implementation }

function TFilterWave.GetTime: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Time']
  else
    Result := 0;
end;

function TFilterWave.GetWaveSize: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['WaveSize']
  else
    Result := 0;
end;

procedure TFilterWave.SetTime(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Time'] := AValue;
end;

procedure TFilterWave.SetWaveSize(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['WaveSize'] := AValue;
end;

{ TFilterWrap Implementation }

function TFilterWrap.GetLeftStart: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['LeftStart']
  else
    Result := 0;
end;

function TFilterWrap.GetLeftControl1: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['LeftControl1']
  else
    Result := 0;
end;

function TFilterWrap.GetLeftControl2: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['LeftControl2']
  else
    Result := 0;
end;

function TFilterWrap.GetLeftEnd: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['LeftEnd']
  else
    Result := 0;
end;

function TFilterWrap.GetRightStart: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['RightStart']
  else
    Result := 0;
end;

function TFilterWrap.GetRightControl1: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['RightControl1']
  else
    Result := 0;
end;

function TFilterWrap.GetRightControl2: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['RightControl2']
  else
    Result := 0;
end;

function TFilterWrap.GetRightEnd: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['RightEnd']
  else
    Result := 0;
end;

procedure TFilterWrap.SetLeftStart(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['LeftStart'] := AValue;
end;

procedure TFilterWrap.SetLeftControl1(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['LeftControl1'] := AValue;
end;

procedure TFilterWrap.SetLeftControl2(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['LeftControl2'] := AValue;
end;

procedure TFilterWrap.SetLeftEnd(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['LeftEnd'] := AValue;
end;

procedure TFilterWrap.SetRightStart(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['RightStart'] := AValue;
end;

procedure TFilterWrap.SetRightControl1(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['RightControl1'] := AValue;
end;

procedure TFilterWrap.SetRightControl2(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['RightControl2'] := AValue;
end;

procedure TFilterWrap.SetRightEnd(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['RightEnd'] := AValue;
end;

{ TFilterBandedSwirl Implementation }

function TFilterBandedSwirl.GetCenter: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Center']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TFilterBandedSwirl.GetBands: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Bands']
  else
    Result := 0;
end;

function TFilterBandedSwirl.GetStrength: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Strength']
  else
    Result := 0;
end;

function TFilterBandedSwirl.GetAspectRatio: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['AspectRatio']
  else
    Result := 0;
end;

procedure TFilterBandedSwirl.SetCenter(AValue: TPointF);
begin
  if FFilter <> nil then
    FFilter.ValuesAsPoint['Center'] := PointF(AValue.x, AValue.y);
end;

procedure TFilterBandedSwirl.SetBands(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Bands'] := AValue;
end;

procedure TFilterBandedSwirl.SetStrength(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Strength'] := AValue;
end;

procedure TFilterBandedSwirl.SetAspectRatio(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['AspectRatio'] := AValue;
end;

{ TFilterPinch Implementation }

function TFilterPinch.GetCenter: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Center']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TFilterPinch.GetRadius: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Radius']
  else
    Result := 0;
end;

function TFilterPinch.GetStrength: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Strength']
  else
    Result := 0;
end;

function TFilterPinch.GetAspectRatio: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['AspectRatio']
  else
    Result := 0;
end;

procedure TFilterPinch.SetCenter(AValue: TPointF);
begin
  if FFilter <> nil then
    FFilter.ValuesAsPoint['Center'] := PointF(AValue.x, AValue.y);
end;

procedure TFilterPinch.SetRadius(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Radius'] := AValue;
end;

procedure TFilterPinch.SetStrength(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['Strength'] := AValue;
end;

procedure TFilterPinch.SetAspectRatio(AValue: Single);
begin
  if FFilter <> nil then
    FFilter.Values['AspectRatio'] := AValue;
end;


constructor TImageFXEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DisablePaint := true;
  FFilter := FilterByName(Copy(Copy(ClassName, 2, 100), 1, Length(Copy(ClassName, 2, 100)) - 6));
end;

destructor TImageFXEffect.Destroy; 
begin
  if FFilter <> nil then
    FFilter.Free;
  inherited Destroy;
end;

procedure TImageFXEffect.ProcessEffect(Canvas: TCanvas; const Visual: TBitmap; const Data: single);
begin
  if FFilter = nil then Exit;
  FFilter.ValuesAsBitmap['Input'] := Visual;
  Visual.Assign(FFilter.ValuesAsBitmap['Output']);
end;

{ TGaussianBlurEffect Implementation }

function TGaussianBlurEffect.GetBlurAmount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BlurAmount']
  else
    Result := 0;
end;

procedure TGaussianBlurEffect.SetBlurAmount(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['BlurAmount'] := AValue;
  UpdateParentEffects;
end;

{ TBoxBlurEffect Implementation }

function TBoxBlurEffect.GetBlurAmount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BlurAmount']
  else
    Result := 0;
end;

procedure TBoxBlurEffect.SetBlurAmount(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['BlurAmount'] := AValue;
  UpdateParentEffects;
end;

{ TDirectionalBlurEffect Implementation }

function TDirectionalBlurEffect.GetAngle: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Angle']
  else
    Result := 0;
end;

function TDirectionalBlurEffect.GetBlurAmount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BlurAmount']
  else
    Result := 0;
end;

procedure TDirectionalBlurEffect.SetAngle(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Angle'] := AValue;
  UpdateParentEffects;
end;

procedure TDirectionalBlurEffect.SetBlurAmount(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['BlurAmount'] := AValue;
  UpdateParentEffects;
end;

{ TRadialBlurEffect Implementation }

function TRadialBlurEffect.GetCenter: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Center']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TRadialBlurEffect.GetBlurAmount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BlurAmount']
  else
    Result := 0;
end;

procedure TRadialBlurEffect.SetCenter(AValue: TPointF);
begin
  if FFilter = nil then Exit;
  FFilter.ValuesAsPoint['Center'] := PointF(AValue.x, AValue.y);
  UpdateParentEffects;
end;

procedure TRadialBlurEffect.SetBlurAmount(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['BlurAmount'] := AValue;
  UpdateParentEffects;
end;

{ TAffineTransformEffect Implementation }

function TAffineTransformEffect.GetCenter: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Center']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TAffineTransformEffect.GetRotation: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Rotation']
  else
    Result := 0;
end;

function TAffineTransformEffect.GetScale: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Scale']
  else
    Result := 0;
end;

procedure TAffineTransformEffect.SetCenter(AValue: TPointF);
begin
  if FFilter = nil then Exit;
  FFilter.ValuesAsPoint['Center'] := PointF(AValue.x, AValue.y);
  UpdateParentEffects;
end;

procedure TAffineTransformEffect.SetRotation(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Rotation'] := AValue;
  UpdateParentEffects;
end;

procedure TAffineTransformEffect.SetScale(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Scale'] := AValue;
  UpdateParentEffects;
end;

{ TPerspectiveTransformEffect Implementation }

function TPerspectiveTransformEffect.GetTopLeft: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['TopLeft']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TPerspectiveTransformEffect.GetTopRight: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['TopRight']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TPerspectiveTransformEffect.GetBottomRight: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['BottomRight']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TPerspectiveTransformEffect.GetBottomLeft: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['BottomLeft']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

procedure TPerspectiveTransformEffect.SetTopLeft(AValue: TPointF);
begin
  if FFilter = nil then Exit;
  FFilter.ValuesAsPoint['TopLeft'] := PointF(AValue.x, AValue.y);
  UpdateParentEffects;
end;

procedure TPerspectiveTransformEffect.SetTopRight(AValue: TPointF);
begin
  if FFilter = nil then Exit;
  FFilter.ValuesAsPoint['TopRight'] := PointF(AValue.x, AValue.y);
  UpdateParentEffects;
end;

procedure TPerspectiveTransformEffect.SetBottomRight(AValue: TPointF);
begin
  if FFilter = nil then Exit;
  FFilter.ValuesAsPoint['BottomRight'] := PointF(AValue.x, AValue.y);
  UpdateParentEffects;
end;

procedure TPerspectiveTransformEffect.SetBottomLeft(AValue: TPointF);
begin
  if FFilter = nil then Exit;
  FFilter.ValuesAsPoint['BottomLeft'] := PointF(AValue.x, AValue.y);
  UpdateParentEffects;
end;

{ TCropEffect Implementation }

function TCropEffect.GetLeftTop: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['LeftTop']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TCropEffect.GetRightBottom: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['RightBottom']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

procedure TCropEffect.SetLeftTop(AValue: TPointF);
begin
  if FFilter = nil then Exit;
  FFilter.ValuesAsPoint['LeftTop'] := PointF(AValue.x, AValue.y);
  UpdateParentEffects;
end;

procedure TCropEffect.SetRightBottom(AValue: TPointF);
begin
  if FFilter = nil then Exit;
  FFilter.ValuesAsPoint['RightBottom'] := PointF(AValue.x, AValue.y);
  UpdateParentEffects;
end;

{ TBandedSwirlTransitionEffect Implementation }

constructor TBandedSwirlTransitionEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TBandedSwirlTransitionEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TBandedSwirlTransitionEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

function TBandedSwirlTransitionEffect.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TBandedSwirlTransitionEffect.GetStrength: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Strength']
  else
    Result := 0;
end;

function TBandedSwirlTransitionEffect.GetFrequency: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Frequency']
  else
    Result := 0;
end;

function TBandedSwirlTransitionEffect.GetCenter: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Center']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

procedure TBandedSwirlTransitionEffect.SetProgress(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Progress'] := AValue;
  UpdateParentEffects;
end;

procedure TBandedSwirlTransitionEffect.SetStrength(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Strength'] := AValue;
  UpdateParentEffects;
end;

procedure TBandedSwirlTransitionEffect.SetFrequency(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Frequency'] := AValue;
  UpdateParentEffects;
end;

procedure TBandedSwirlTransitionEffect.SetCenter(AValue: TPointF);
begin
  if FFilter = nil then Exit;
  FFilter.ValuesAsPoint['Center'] := PointF(AValue.x, AValue.y);
  UpdateParentEffects;
end;

procedure TBandedSwirlTransitionEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TBlindTransitionEffect Implementation }

constructor TBlindTransitionEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TBlindTransitionEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TBlindTransitionEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

function TBlindTransitionEffect.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TBlindTransitionEffect.GetNumberOfBlinds: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['NumberOfBlinds']
  else
    Result := 0;
end;

procedure TBlindTransitionEffect.SetProgress(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Progress'] := AValue;
  UpdateParentEffects;
end;

procedure TBlindTransitionEffect.SetNumberOfBlinds(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['NumberOfBlinds'] := AValue;
  UpdateParentEffects;
end;

procedure TBlindTransitionEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TBloodTransitionEffect Implementation }

constructor TBloodTransitionEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TBloodTransitionEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TBloodTransitionEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

function TBloodTransitionEffect.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TBloodTransitionEffect.GetRandomSeed: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['RandomSeed']
  else
    Result := 0;
end;

procedure TBloodTransitionEffect.SetProgress(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Progress'] := AValue;
  UpdateParentEffects;
end;

procedure TBloodTransitionEffect.SetRandomSeed(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['RandomSeed'] := AValue;
  UpdateParentEffects;
end;

procedure TBloodTransitionEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TCircleTransitionEffect Implementation }

constructor TCircleTransitionEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TCircleTransitionEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TCircleTransitionEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

function TCircleTransitionEffect.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TCircleTransitionEffect.GetFuzzyAmount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['FuzzyAmount']
  else
    Result := 0;
end;

function TCircleTransitionEffect.GetSize: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Size']
  else
    Result := 0;
end;

function TCircleTransitionEffect.GetCenter: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Center']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

procedure TCircleTransitionEffect.SetProgress(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Progress'] := AValue;
  UpdateParentEffects;
end;

procedure TCircleTransitionEffect.SetFuzzyAmount(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['FuzzyAmount'] := AValue;
  UpdateParentEffects;
end;

procedure TCircleTransitionEffect.SetSize(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Size'] := AValue;
  UpdateParentEffects;
end;

procedure TCircleTransitionEffect.SetCenter(AValue: TPointF);
begin
  if FFilter = nil then Exit;
  FFilter.ValuesAsPoint['Center'] := PointF(AValue.x, AValue.y);
  UpdateParentEffects;
end;

procedure TCircleTransitionEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TMagnifyTransitionEffect Implementation }

constructor TMagnifyTransitionEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TMagnifyTransitionEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TMagnifyTransitionEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

function TMagnifyTransitionEffect.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TMagnifyTransitionEffect.GetCenter: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Center']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

procedure TMagnifyTransitionEffect.SetProgress(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Progress'] := AValue;
  UpdateParentEffects;
end;

procedure TMagnifyTransitionEffect.SetCenter(AValue: TPointF);
begin
  if FFilter = nil then Exit;
  FFilter.ValuesAsPoint['Center'] := PointF(AValue.x, AValue.y);
  UpdateParentEffects;
end;

procedure TMagnifyTransitionEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TCrumpleTransitionEffect Implementation }

constructor TCrumpleTransitionEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TCrumpleTransitionEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TCrumpleTransitionEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

function TCrumpleTransitionEffect.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TCrumpleTransitionEffect.GetRandomSeed: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['RandomSeed']
  else
    Result := 0;
end;

procedure TCrumpleTransitionEffect.SetProgress(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Progress'] := AValue;
  UpdateParentEffects;
end;

procedure TCrumpleTransitionEffect.SetRandomSeed(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['RandomSeed'] := AValue;
  UpdateParentEffects;
end;

procedure TCrumpleTransitionEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TDissolveTransitionEffect Implementation }

constructor TDissolveTransitionEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TDissolveTransitionEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TDissolveTransitionEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

function TDissolveTransitionEffect.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TDissolveTransitionEffect.GetRandomSeed: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['RandomSeed']
  else
    Result := 0;
end;

procedure TDissolveTransitionEffect.SetProgress(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Progress'] := AValue;
  UpdateParentEffects;
end;

procedure TDissolveTransitionEffect.SetRandomSeed(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['RandomSeed'] := AValue;
  UpdateParentEffects;
end;

procedure TDissolveTransitionEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TDropTransitionEffect Implementation }

constructor TDropTransitionEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TDropTransitionEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TDropTransitionEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

function TDropTransitionEffect.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TDropTransitionEffect.GetRandomSeed: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['RandomSeed']
  else
    Result := 0;
end;

procedure TDropTransitionEffect.SetProgress(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Progress'] := AValue;
  UpdateParentEffects;
end;

procedure TDropTransitionEffect.SetRandomSeed(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['RandomSeed'] := AValue;
  UpdateParentEffects;
end;

procedure TDropTransitionEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TFadeTransitionEffect Implementation }

constructor TFadeTransitionEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TFadeTransitionEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TFadeTransitionEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

function TFadeTransitionEffect.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

procedure TFadeTransitionEffect.SetProgress(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Progress'] := AValue;
  UpdateParentEffects;
end;

procedure TFadeTransitionEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TBrightTransitionEffect Implementation }

constructor TBrightTransitionEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TBrightTransitionEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TBrightTransitionEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

function TBrightTransitionEffect.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

procedure TBrightTransitionEffect.SetProgress(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Progress'] := AValue;
  UpdateParentEffects;
end;

procedure TBrightTransitionEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TPixelateTransitionEffect Implementation }

constructor TPixelateTransitionEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TPixelateTransitionEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TPixelateTransitionEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

function TPixelateTransitionEffect.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

procedure TPixelateTransitionEffect.SetProgress(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Progress'] := AValue;
  UpdateParentEffects;
end;

procedure TPixelateTransitionEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TBlurTransitionEffect Implementation }

constructor TBlurTransitionEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TBlurTransitionEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TBlurTransitionEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

function TBlurTransitionEffect.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

procedure TBlurTransitionEffect.SetProgress(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Progress'] := AValue;
  UpdateParentEffects;
end;

procedure TBlurTransitionEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TWiggleTransitionEffect Implementation }

constructor TWiggleTransitionEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TWiggleTransitionEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TWiggleTransitionEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

function TWiggleTransitionEffect.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

procedure TWiggleTransitionEffect.SetProgress(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Progress'] := AValue;
  UpdateParentEffects;
end;

procedure TWiggleTransitionEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TShapeTransitionEffect Implementation }

constructor TShapeTransitionEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TShapeTransitionEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TShapeTransitionEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

function TShapeTransitionEffect.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

procedure TShapeTransitionEffect.SetProgress(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Progress'] := AValue;
  UpdateParentEffects;
end;

procedure TShapeTransitionEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TRippleTransitionEffect Implementation }

constructor TRippleTransitionEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TRippleTransitionEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TRippleTransitionEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

function TRippleTransitionEffect.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

procedure TRippleTransitionEffect.SetProgress(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Progress'] := AValue;
  UpdateParentEffects;
end;

procedure TRippleTransitionEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TRotateCrumpleTransitionEffect Implementation }

constructor TRotateCrumpleTransitionEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TRotateCrumpleTransitionEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TRotateCrumpleTransitionEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

function TRotateCrumpleTransitionEffect.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TRotateCrumpleTransitionEffect.GetRandomSeed: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['RandomSeed']
  else
    Result := 0;
end;

procedure TRotateCrumpleTransitionEffect.SetProgress(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Progress'] := AValue;
  UpdateParentEffects;
end;

procedure TRotateCrumpleTransitionEffect.SetRandomSeed(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['RandomSeed'] := AValue;
  UpdateParentEffects;
end;

procedure TRotateCrumpleTransitionEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TSaturateTransitionEffect Implementation }

constructor TSaturateTransitionEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TSaturateTransitionEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TSaturateTransitionEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

function TSaturateTransitionEffect.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

procedure TSaturateTransitionEffect.SetProgress(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Progress'] := AValue;
  UpdateParentEffects;
end;

procedure TSaturateTransitionEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TSlideTransitionEffect Implementation }

constructor TSlideTransitionEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TSlideTransitionEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TSlideTransitionEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

function TSlideTransitionEffect.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TSlideTransitionEffect.GetSlideAmount: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['SlideAmount']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

procedure TSlideTransitionEffect.SetProgress(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Progress'] := AValue;
  UpdateParentEffects;
end;

procedure TSlideTransitionEffect.SetSlideAmount(AValue: TPointF);
begin
  if FFilter = nil then Exit;
  FFilter.ValuesAsPoint['SlideAmount'] := PointF(AValue.x, AValue.y);
  UpdateParentEffects;
end;

procedure TSlideTransitionEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TSwirlTransitionEffect Implementation }

constructor TSwirlTransitionEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TSwirlTransitionEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TSwirlTransitionEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

function TSwirlTransitionEffect.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TSwirlTransitionEffect.GetStrength: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Strength']
  else
    Result := 0;
end;

procedure TSwirlTransitionEffect.SetProgress(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Progress'] := AValue;
  UpdateParentEffects;
end;

procedure TSwirlTransitionEffect.SetStrength(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Strength'] := AValue;
  UpdateParentEffects;
end;

procedure TSwirlTransitionEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TWaterTransitionEffect Implementation }

constructor TWaterTransitionEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TWaterTransitionEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TWaterTransitionEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

function TWaterTransitionEffect.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TWaterTransitionEffect.GetRandomSeed: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['RandomSeed']
  else
    Result := 0;
end;

procedure TWaterTransitionEffect.SetProgress(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Progress'] := AValue;
  UpdateParentEffects;
end;

procedure TWaterTransitionEffect.SetRandomSeed(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['RandomSeed'] := AValue;
  UpdateParentEffects;
end;

procedure TWaterTransitionEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TWaveTransitionEffect Implementation }

constructor TWaveTransitionEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TWaveTransitionEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TWaveTransitionEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

function TWaveTransitionEffect.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

procedure TWaveTransitionEffect.SetProgress(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Progress'] := AValue;
  UpdateParentEffects;
end;

procedure TWaveTransitionEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TLineTransitionEffect Implementation }

constructor TLineTransitionEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TLineTransitionEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TLineTransitionEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

function TLineTransitionEffect.GetProgress: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Progress']
  else
    Result := 0;
end;

function TLineTransitionEffect.GetOrigin: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Origin']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TLineTransitionEffect.GetNormal: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Normal']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TLineTransitionEffect.GetOffset1: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Offset']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TLineTransitionEffect.GetFuzzyAmount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['FuzzyAmount']
  else
    Result := 0;
end;

procedure TLineTransitionEffect.SetProgress(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Progress'] := AValue;
  UpdateParentEffects;
end;

procedure TLineTransitionEffect.SetOrigin(AValue: TPointF);
begin
  if FFilter = nil then Exit;
  FFilter.ValuesAsPoint['Origin'] := PointF(AValue.x, AValue.y);
  UpdateParentEffects;
end;

procedure TLineTransitionEffect.SetNormal(AValue: TPointF);
begin
  if FFilter = nil then Exit;
  FFilter.ValuesAsPoint['Normal'] := PointF(AValue.x, AValue.y);
  UpdateParentEffects;
end;

procedure TLineTransitionEffect.SetOffset(AValue: TPointF);
begin
  if FFilter = nil then Exit;
  FFilter.ValuesAsPoint['Offset'] := PointF(AValue.x, AValue.y);
  UpdateParentEffects;
end;

procedure TLineTransitionEffect.SetFuzzyAmount(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['FuzzyAmount'] := AValue;
  UpdateParentEffects;
end;

procedure TLineTransitionEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TInvertEffect Implementation }

{ TMonochromeEffect Implementation }

{ TColorKeyAlphaEffect Implementation }

function TColorKeyAlphaEffect.GetColorKey: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['ColorKey']
  else
    Result := 0;
end;

function TColorKeyAlphaEffect.GetTolerance: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Tolerance']
  else
    Result := 0;
end;

procedure TColorKeyAlphaEffect.SetColorKey(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['ColorKey'] := AValue;
  UpdateParentEffects;
end;

procedure TColorKeyAlphaEffect.SetTolerance(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Tolerance'] := AValue;
  UpdateParentEffects;
end;

{ TMaskToAlphaEffect Implementation }

{ THueAdjustEffect Implementation }

function THueAdjustEffect.GetHue: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Hue']
  else
    Result := 0;
end;

procedure THueAdjustEffect.SetHue(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Hue'] := AValue;
  UpdateParentEffects;
end;

{ TContrastEffect Implementation }

function TContrastEffect.GetBrightness: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Brightness']
  else
    Result := 0;
end;

function TContrastEffect.GetContrast: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Contrast']
  else
    Result := 0;
end;

procedure TContrastEffect.SetBrightness(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Brightness'] := AValue;
  UpdateParentEffects;
end;

procedure TContrastEffect.SetContrast(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Contrast'] := AValue;
  UpdateParentEffects;
end;

{ TBloomEffect Implementation }

function TBloomEffect.GetBloomIntensity: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BloomIntensity']
  else
    Result := 0;
end;

function TBloomEffect.GetBaseIntensity: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BaseIntensity']
  else
    Result := 0;
end;

function TBloomEffect.GetBloomSaturation: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BloomSaturation']
  else
    Result := 0;
end;

function TBloomEffect.GetBaseSaturation: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BaseSaturation']
  else
    Result := 0;
end;

procedure TBloomEffect.SetBloomIntensity(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['BloomIntensity'] := AValue;
  UpdateParentEffects;
end;

procedure TBloomEffect.SetBaseIntensity(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['BaseIntensity'] := AValue;
  UpdateParentEffects;
end;

procedure TBloomEffect.SetBloomSaturation(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['BloomSaturation'] := AValue;
  UpdateParentEffects;
end;

procedure TBloomEffect.SetBaseSaturation(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['BaseSaturation'] := AValue;
  UpdateParentEffects;
end;

{ TGloomEffect Implementation }

function TGloomEffect.GetGloomIntensity: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['GloomIntensity']
  else
    Result := 0;
end;

function TGloomEffect.GetBaseIntensity: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BaseIntensity']
  else
    Result := 0;
end;

function TGloomEffect.GetGloomSaturation: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['GloomSaturation']
  else
    Result := 0;
end;

function TGloomEffect.GetBaseSaturation: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BaseSaturation']
  else
    Result := 0;
end;

procedure TGloomEffect.SetGloomIntensity(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['GloomIntensity'] := AValue;
  UpdateParentEffects;
end;

procedure TGloomEffect.SetBaseIntensity(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['BaseIntensity'] := AValue;
  UpdateParentEffects;
end;

procedure TGloomEffect.SetGloomSaturation(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['GloomSaturation'] := AValue;
  UpdateParentEffects;
end;

procedure TGloomEffect.SetBaseSaturation(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['BaseSaturation'] := AValue;
  UpdateParentEffects;
end;

{ TNormalBlendEffect Implementation }

constructor TNormalBlendEffect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTarget := TBitmap.Create(0, 0);
  FTarget.OnChange := DoTargetChanged;
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
end;

destructor TNormalBlendEffect.Destroy; 
begin
  FTarget.Free;
  inherited Destroy;
end;

procedure TNormalBlendEffect.DoTargetChanged(Sender: TObject);
begin
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

procedure TNormalBlendEffect.SetTarget(AValue: TBitmap);
begin
  FTarget.Assign(AValue);
  if FFilter <> nil then 
    FFilter.ValuesAsBitmap['Target'] := FTarget;
  UpdateParentEffects;
end;

{ TFillEffect Implementation }

function TFillEffect.GetColor: TAlphaColor;
begin
  if FFilter <> nil then
  {$IFNDEF FPC}
    Result := FFilter.Values['Color']
  {$ELSE}
    Result := Cardinal(FFilter.Values['Color'])
  {$ENDIF}
  else
    Result := 0;
end;

procedure TFillEffect.SetColor(AValue: TAlphaColor);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Color'] := AValue;
  UpdateParentEffects;
end;

{ TFillRGBEffect Implementation }

function TFillRGBEffect.GetColor: TAlphaColor;
begin
  if FFilter <> nil then
  {$IFNDEF FPC}
    Result := FFilter.Values['Color']
  {$ELSE}
    Result := Cardinal(FFilter.Values['Color'])
  {$ENDIF}
  else
    Result := 0;
end;

procedure TFillRGBEffect.SetColor(AValue: TAlphaColor);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Color'] := AValue;
  UpdateParentEffects;
end;

{ TPixelateEffect Implementation }

function TPixelateEffect.GetBlockCount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BlockCount']
  else
    Result := 0;
end;

procedure TPixelateEffect.SetBlockCount(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['BlockCount'] := AValue;
  UpdateParentEffects;
end;

{ TEmbossEffect Implementation }

function TEmbossEffect.GetAmount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Amount']
  else
    Result := 0;
end;

function TEmbossEffect.GetWidth: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Width']
  else
    Result := 0;
end;

procedure TEmbossEffect.SetAmount(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Amount'] := AValue;
  UpdateParentEffects;
end;

procedure TEmbossEffect.SetWidth(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Width'] := AValue;
  UpdateParentEffects;
end;

{ TSharpenEffect Implementation }

function TSharpenEffect.GetAmount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Amount']
  else
    Result := 0;
end;

procedure TSharpenEffect.SetAmount(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Amount'] := AValue;
  UpdateParentEffects;
end;

{ TToonEffect Implementation }

function TToonEffect.GetLevels: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Levels']
  else
    Result := 0;
end;

procedure TToonEffect.SetLevels(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Levels'] := AValue;
  UpdateParentEffects;
end;

{ TSepiaEffect Implementation }

function TSepiaEffect.GetAmount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Amount']
  else
    Result := 0;
end;

procedure TSepiaEffect.SetAmount(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Amount'] := AValue;
  UpdateParentEffects;
end;

{ TPaperSketchEffect Implementation }

function TPaperSketchEffect.GetBrushSize: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BrushSize']
  else
    Result := 0;
end;

procedure TPaperSketchEffect.SetBrushSize(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['BrushSize'] := AValue;
  UpdateParentEffects;
end;

{ TPencilStrokeEffect Implementation }

function TPencilStrokeEffect.GetBrushSize: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BrushSize']
  else
    Result := 0;
end;

procedure TPencilStrokeEffect.SetBrushSize(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['BrushSize'] := AValue;
  UpdateParentEffects;
end;

{ TTilerEffect Implementation }

function TTilerEffect.GetVerticalTileCount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['VerticalTileCount']
  else
    Result := 0;
end;

function TTilerEffect.GetHorizontalTileCount: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['HorizontalTileCount']
  else
    Result := 0;
end;

function TTilerEffect.GetHorizontalOffset: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['HorizontalOffset']
  else
    Result := 0;
end;

function TTilerEffect.GetVerticalOffset: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['VerticalOffset']
  else
    Result := 0;
end;

procedure TTilerEffect.SetVerticalTileCount(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['VerticalTileCount'] := AValue;
  UpdateParentEffects;
end;

procedure TTilerEffect.SetHorizontalTileCount(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['HorizontalTileCount'] := AValue;
  UpdateParentEffects;
end;

procedure TTilerEffect.SetHorizontalOffset(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['HorizontalOffset'] := AValue;
  UpdateParentEffects;
end;

procedure TTilerEffect.SetVerticalOffset(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['VerticalOffset'] := AValue;
  UpdateParentEffects;
end;

{ TRippleEffect Implementation }

function TRippleEffect.GetCenter: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Center']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TRippleEffect.GetAmplitude: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Amplitude']
  else
    Result := 0;
end;

function TRippleEffect.GetFrequency: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Frequency']
  else
    Result := 0;
end;

function TRippleEffect.GetPhase: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Phase']
  else
    Result := 0;
end;

function TRippleEffect.GetAspectRatio: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['AspectRatio']
  else
    Result := 0;
end;

procedure TRippleEffect.SetCenter(AValue: TPointF);
begin
  if FFilter = nil then Exit;
  FFilter.ValuesAsPoint['Center'] := PointF(AValue.x, AValue.y);
  UpdateParentEffects;
end;

procedure TRippleEffect.SetAmplitude(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Amplitude'] := AValue;
  UpdateParentEffects;
end;

procedure TRippleEffect.SetFrequency(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Frequency'] := AValue;
  UpdateParentEffects;
end;

procedure TRippleEffect.SetPhase(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Phase'] := AValue;
  UpdateParentEffects;
end;

procedure TRippleEffect.SetAspectRatio(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['AspectRatio'] := AValue;
  UpdateParentEffects;
end;

{ TSwirlEffect Implementation }

function TSwirlEffect.GetCenter: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Center']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TSwirlEffect.GetStrength: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Strength']
  else
    Result := 0;
end;

function TSwirlEffect.GetAspectRatio: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['AspectRatio']
  else
    Result := 0;
end;

procedure TSwirlEffect.SetCenter(AValue: TPointF);
begin
  if FFilter = nil then Exit;
  FFilter.ValuesAsPoint['Center'] := PointF(AValue.x, AValue.y);
  UpdateParentEffects;
end;

procedure TSwirlEffect.SetStrength(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Strength'] := AValue;
  UpdateParentEffects;
end;

procedure TSwirlEffect.SetAspectRatio(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['AspectRatio'] := AValue;
  UpdateParentEffects;
end;

{ TMagnifyEffect Implementation }

function TMagnifyEffect.GetCenter: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Center']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TMagnifyEffect.GetRadius: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Radius']
  else
    Result := 0;
end;

function TMagnifyEffect.GetMagnification: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Magnification']
  else
    Result := 0;
end;

function TMagnifyEffect.GetAspectRatio: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['AspectRatio']
  else
    Result := 0;
end;

procedure TMagnifyEffect.SetCenter(AValue: TPointF);
begin
  if FFilter = nil then Exit;
  FFilter.ValuesAsPoint['Center'] := PointF(AValue.x, AValue.y);
  UpdateParentEffects;
end;

procedure TMagnifyEffect.SetRadius(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Radius'] := AValue;
  UpdateParentEffects;
end;

procedure TMagnifyEffect.SetMagnification(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Magnification'] := AValue;
  UpdateParentEffects;
end;

procedure TMagnifyEffect.SetAspectRatio(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['AspectRatio'] := AValue;
  UpdateParentEffects;
end;

{ TSmoothMagnifyEffect Implementation }

function TSmoothMagnifyEffect.GetCenter: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Center']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TSmoothMagnifyEffect.GetInnerRadius: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['InnerRadius']
  else
    Result := 0;
end;

function TSmoothMagnifyEffect.GetOuterRadius: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['OuterRadius']
  else
    Result := 0;
end;

function TSmoothMagnifyEffect.GetMagnification: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Magnification']
  else
    Result := 0;
end;

function TSmoothMagnifyEffect.GetAspectRatio: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['AspectRatio']
  else
    Result := 0;
end;

procedure TSmoothMagnifyEffect.SetCenter(AValue: TPointF);
begin
  if FFilter = nil then Exit;
  FFilter.ValuesAsPoint['Center'] := PointF(AValue.x, AValue.y);
  UpdateParentEffects;
end;

procedure TSmoothMagnifyEffect.SetInnerRadius(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['InnerRadius'] := AValue;
  UpdateParentEffects;
end;

procedure TSmoothMagnifyEffect.SetOuterRadius(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['OuterRadius'] := AValue;
  UpdateParentEffects;
end;

procedure TSmoothMagnifyEffect.SetMagnification(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Magnification'] := AValue;
  UpdateParentEffects;
end;

procedure TSmoothMagnifyEffect.SetAspectRatio(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['AspectRatio'] := AValue;
  UpdateParentEffects;
end;

{ TBandsEffect Implementation }

function TBandsEffect.GetBandDensity: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BandDensity']
  else
    Result := 0;
end;

function TBandsEffect.GetBandIntensity: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['BandIntensity']
  else
    Result := 0;
end;

procedure TBandsEffect.SetBandDensity(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['BandDensity'] := AValue;
  UpdateParentEffects;
end;

procedure TBandsEffect.SetBandIntensity(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['BandIntensity'] := AValue;
  UpdateParentEffects;
end;

{ TWaveEffect Implementation }

function TWaveEffect.GetTime: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Time']
  else
    Result := 0;
end;

function TWaveEffect.GetWaveSize: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['WaveSize']
  else
    Result := 0;
end;

procedure TWaveEffect.SetTime(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Time'] := AValue;
  UpdateParentEffects;
end;

procedure TWaveEffect.SetWaveSize(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['WaveSize'] := AValue;
  UpdateParentEffects;
end;

{ TWrapEffect Implementation }

function TWrapEffect.GetLeftStart: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['LeftStart']
  else
    Result := 0;
end;

function TWrapEffect.GetLeftControl1: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['LeftControl1']
  else
    Result := 0;
end;

function TWrapEffect.GetLeftControl2: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['LeftControl2']
  else
    Result := 0;
end;

function TWrapEffect.GetLeftEnd: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['LeftEnd']
  else
    Result := 0;
end;

function TWrapEffect.GetRightStart: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['RightStart']
  else
    Result := 0;
end;

function TWrapEffect.GetRightControl1: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['RightControl1']
  else
    Result := 0;
end;

function TWrapEffect.GetRightControl2: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['RightControl2']
  else
    Result := 0;
end;

function TWrapEffect.GetRightEnd: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['RightEnd']
  else
    Result := 0;
end;

procedure TWrapEffect.SetLeftStart(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['LeftStart'] := AValue;
  UpdateParentEffects;
end;

procedure TWrapEffect.SetLeftControl1(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['LeftControl1'] := AValue;
  UpdateParentEffects;
end;

procedure TWrapEffect.SetLeftControl2(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['LeftControl2'] := AValue;
  UpdateParentEffects;
end;

procedure TWrapEffect.SetLeftEnd(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['LeftEnd'] := AValue;
  UpdateParentEffects;
end;

procedure TWrapEffect.SetRightStart(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['RightStart'] := AValue;
  UpdateParentEffects;
end;

procedure TWrapEffect.SetRightControl1(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['RightControl1'] := AValue;
  UpdateParentEffects;
end;

procedure TWrapEffect.SetRightControl2(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['RightControl2'] := AValue;
  UpdateParentEffects;
end;

procedure TWrapEffect.SetRightEnd(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['RightEnd'] := AValue;
  UpdateParentEffects;
end;

{ TBandedSwirlEffect Implementation }

function TBandedSwirlEffect.GetCenter: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Center']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TBandedSwirlEffect.GetBands: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Bands']
  else
    Result := 0;
end;

function TBandedSwirlEffect.GetStrength: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Strength']
  else
    Result := 0;
end;

function TBandedSwirlEffect.GetAspectRatio: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['AspectRatio']
  else
    Result := 0;
end;

procedure TBandedSwirlEffect.SetCenter(AValue: TPointF);
begin
  if FFilter = nil then Exit;
  FFilter.ValuesAsPoint['Center'] := PointF(AValue.x, AValue.y);
  UpdateParentEffects;
end;

procedure TBandedSwirlEffect.SetBands(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Bands'] := AValue;
  UpdateParentEffects;
end;

procedure TBandedSwirlEffect.SetStrength(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Strength'] := AValue;
  UpdateParentEffects;
end;

procedure TBandedSwirlEffect.SetAspectRatio(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['AspectRatio'] := AValue;
  UpdateParentEffects;
end;

{ TPinchEffect Implementation }

function TPinchEffect.GetCenter: TPointF;
begin
  if FFilter <> nil then
    Result := FFilter.ValuesAsPoint['Center']
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

function TPinchEffect.GetRadius: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Radius']
  else
    Result := 0;
end;

function TPinchEffect.GetStrength: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['Strength']
  else
    Result := 0;
end;

function TPinchEffect.GetAspectRatio: Single;
begin
  if FFilter <> nil then
    Result := FFilter.Values['AspectRatio']
  else
    Result := 0;
end;

procedure TPinchEffect.SetCenter(AValue: TPointF);
begin
  if FFilter = nil then Exit;
  FFilter.ValuesAsPoint['Center'] := PointF(AValue.x, AValue.y);
  UpdateParentEffects;
end;

procedure TPinchEffect.SetRadius(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Radius'] := AValue;
  UpdateParentEffects;
end;

procedure TPinchEffect.SetStrength(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['Strength'] := AValue;
  UpdateParentEffects;
end;

procedure TPinchEffect.SetAspectRatio(AValue: Single);
begin
  if FFilter = nil then Exit;
  FFilter.Values['AspectRatio'] := AValue;
  UpdateParentEffects;
end;


procedure Register;
begin
  RegisterNoIcon([TGaussianBlurEffect]);
  RegisterNoIcon([TBoxBlurEffect]);
  RegisterNoIcon([TDirectionalBlurEffect]);
  RegisterNoIcon([TRadialBlurEffect]);
  RegisterNoIcon([TAffineTransformEffect]);
  RegisterNoIcon([TPerspectiveTransformEffect]);
  RegisterNoIcon([TCropEffect]);
  RegisterNoIcon([TBandedSwirlTransitionEffect]);
  RegisterNoIcon([TBlindTransitionEffect]);
  RegisterNoIcon([TBloodTransitionEffect]);
  RegisterNoIcon([TCircleTransitionEffect]);
  RegisterNoIcon([TMagnifyTransitionEffect]);
  RegisterNoIcon([TCrumpleTransitionEffect]);
  RegisterNoIcon([TDissolveTransitionEffect]);
  RegisterNoIcon([TDropTransitionEffect]);
  RegisterNoIcon([TFadeTransitionEffect]);
  RegisterNoIcon([TBrightTransitionEffect]);
  RegisterNoIcon([TPixelateTransitionEffect]);
  RegisterNoIcon([TBlurTransitionEffect]);
  RegisterNoIcon([TWiggleTransitionEffect]);
  RegisterNoIcon([TShapeTransitionEffect]);
  RegisterNoIcon([TRippleTransitionEffect]);
  RegisterNoIcon([TRotateCrumpleTransitionEffect]);
  RegisterNoIcon([TSaturateTransitionEffect]);
  RegisterNoIcon([TSlideTransitionEffect]);
  RegisterNoIcon([TSwirlTransitionEffect]);
  RegisterNoIcon([TWaterTransitionEffect]);
  RegisterNoIcon([TWaveTransitionEffect]);
  RegisterNoIcon([TLineTransitionEffect]);
  RegisterNoIcon([TInvertEffect]);
  RegisterNoIcon([TMonochromeEffect]);
  RegisterNoIcon([TColorKeyAlphaEffect]);
  RegisterNoIcon([TMaskToAlphaEffect]);
  RegisterNoIcon([THueAdjustEffect]);
  RegisterNoIcon([TContrastEffect]);
  RegisterNoIcon([TBloomEffect]);
  RegisterNoIcon([TGloomEffect]);
  RegisterNoIcon([TNormalBlendEffect]);
  RegisterNoIcon([TFillEffect]);
  RegisterNoIcon([TFillRGBEffect]);
  RegisterNoIcon([TPixelateEffect]);
  RegisterNoIcon([TEmbossEffect]);
  RegisterNoIcon([TSharpenEffect]);
  RegisterNoIcon([TToonEffect]);
  RegisterNoIcon([TSepiaEffect]);
  RegisterNoIcon([TPaperSketchEffect]);
  RegisterNoIcon([TPencilStrokeEffect]);
  RegisterNoIcon([TTilerEffect]);
  RegisterNoIcon([TRippleEffect]);
  RegisterNoIcon([TSwirlEffect]);
  RegisterNoIcon([TMagnifyEffect]);
  RegisterNoIcon([TSmoothMagnifyEffect]);
  RegisterNoIcon([TBandsEffect]);
  RegisterNoIcon([TWaveEffect]);
  RegisterNoIcon([TWrapEffect]);
  RegisterNoIcon([TBandedSwirlEffect]);
  RegisterNoIcon([TPinchEffect]);
end;

initialization
  StartClassGroup(TFmxObject);
  ActivateClassGroup(TFmxObject);
  RegisterClasses([TGaussianBlurEffect]);
  RegisterClasses([TBoxBlurEffect]);
  RegisterClasses([TDirectionalBlurEffect]);
  RegisterClasses([TRadialBlurEffect]);
  RegisterClasses([TAffineTransformEffect]);
  RegisterClasses([TPerspectiveTransformEffect]);
  RegisterClasses([TCropEffect]);
  RegisterClasses([TBandedSwirlTransitionEffect]);
  RegisterClasses([TBlindTransitionEffect]);
  RegisterClasses([TBloodTransitionEffect]);
  RegisterClasses([TCircleTransitionEffect]);
  RegisterClasses([TMagnifyTransitionEffect]);
  RegisterClasses([TCrumpleTransitionEffect]);
  RegisterClasses([TDissolveTransitionEffect]);
  RegisterClasses([TDropTransitionEffect]);
  RegisterClasses([TFadeTransitionEffect]);
  RegisterClasses([TBrightTransitionEffect]);
  RegisterClasses([TPixelateTransitionEffect]);
  RegisterClasses([TBlurTransitionEffect]);
  RegisterClasses([TWiggleTransitionEffect]);
  RegisterClasses([TShapeTransitionEffect]);
  RegisterClasses([TRippleTransitionEffect]);
  RegisterClasses([TRotateCrumpleTransitionEffect]);
  RegisterClasses([TSaturateTransitionEffect]);
  RegisterClasses([TSlideTransitionEffect]);
  RegisterClasses([TSwirlTransitionEffect]);
  RegisterClasses([TWaterTransitionEffect]);
  RegisterClasses([TWaveTransitionEffect]);
  RegisterClasses([TLineTransitionEffect]);
  RegisterClasses([TInvertEffect]);
  RegisterClasses([TMonochromeEffect]);
  RegisterClasses([TColorKeyAlphaEffect]);
  RegisterClasses([TMaskToAlphaEffect]);
  RegisterClasses([THueAdjustEffect]);
  RegisterClasses([TContrastEffect]);
  RegisterClasses([TBloomEffect]);
  RegisterClasses([TGloomEffect]);
  RegisterClasses([TNormalBlendEffect]);
  RegisterClasses([TFillEffect]);
  RegisterClasses([TFillRGBEffect]);
  RegisterClasses([TPixelateEffect]);
  RegisterClasses([TEmbossEffect]);
  RegisterClasses([TSharpenEffect]);
  RegisterClasses([TToonEffect]);
  RegisterClasses([TSepiaEffect]);
  RegisterClasses([TPaperSketchEffect]);
  RegisterClasses([TPencilStrokeEffect]);
  RegisterClasses([TTilerEffect]);
  RegisterClasses([TRippleEffect]);
  RegisterClasses([TSwirlEffect]);
  RegisterClasses([TMagnifyEffect]);
  RegisterClasses([TSmoothMagnifyEffect]);
  RegisterClasses([TBandsEffect]);
  RegisterClasses([TWaveEffect]);
  RegisterClasses([TWrapEffect]);
  RegisterClasses([TBandedSwirlEffect]);
  RegisterClasses([TPinchEffect]);
finalization
end.
