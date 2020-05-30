unit EuroConv;

{ ***************************************************************************
  Monetary conversion units

  The constants, names and monetary logic in this unit follow the various EU
  standards layed out in documents 397R1103, 398R2866 and 300R1478.

  WARNING: In order for the rounding rules to exactly match the EU dictates
           this unit will adjust your application's rounding mode to rmUp.
           This will affect how rounding happens globally and may cause
           unforeseen side effects in your application.

  At the time of the writing of this document those documents where at
    http://europa.eu.int/eur-lex/en/lif/dat/1997/en_397R1103.html
    http://europa.eu.int/eur-lex/en/lif/dat/1998/en_398R2866.html
    http://europa.eu.int/eur-lex/en/lif/dat/2000/en_300R1478.html

  If not found there you can search for them on http://europa.eu.int/eur-lex

  The conversion rates for US dollar, British pound and Japanese yen are
  accurate as of 12/12/2000 at 18:35 EST and were as reported by
  CNNfn (http://cnnfn.cnn.com/markets/currency)

  Great monetary exchange rate sites
    http://pacific.commerce.ubc.ca/xr/rates.html
    http://www.imf.org/external/np/tre/sdr/drates/8101.htm
    http://www.belgraver.demon.nl/currconv2/

  ***************************************************************************
  References:
  [1]  Article 1 in http://europa.eu.int/eur-lex/en/lif/dat/1998/en_398R2866.html
  [2]  Article 1 in http://europa.eu.int/eur-lex/en/lif/dat/2000/en_300R1478.html
  [3]  Article 4.4 in http://europa.eu.int/eur-lex/en/lif/dat/1997/en_397R1103.html

}

interface

uses
  ConvUtils, Math;

var
  // *************************************************************************
  // Euro Conversion Units
  // basic unit of measurement is euro
  cbEuro: TConvFamily;

  euEUR: TConvType; { EU euro }
  euBEF: TConvType; { Belgian francs }
  euDEM: TConvType; { German marks }
  euGRD: TConvType; { Greek drachmas }
  euESP: TConvType; { Spanish pesetas }
  euFFR: TConvType; { French francs }
  euIEP: TConvType; { Irish pounds }
  euITL: TConvType; { Italian lire }
  euLUF: TConvType; { Luxembourg francs }
  euNLG: TConvType; { Dutch guilders }
  euATS: TConvType; { Austrian schillings }
  euPTE: TConvType; { Portuguese escudos }
  euFIM: TConvType; { Finnish marks }

  euUSD: TConvType; { US dollars }
  euGBP: TConvType; { British pounds }
  euJPY: TConvType; { Japanese yens }

const
  // Fixed conversion Euro rates [1]
  EURToEUR = 1.00000;
  BEFToEUR = 40.3399;
  DEMToEUR = 1.95583;
  GRDToEUR = 340.750; // [2] effective 1/1/2001
  ESPToEUR = 166.386;
  FFRToEUR = 6.55957;
  IEPToEUR = 0.787564;
  ITLToEUR = 1936.27;
  LUFToEUR = 40.3399;
  NLGToEUR = 2.20371;
  ATSToEUR = 13.7603;
  PTEToEUR = 200.482;
  FIMToEUR = 5.94573;

  // Subunit rounding for Euro conversion and expressed as powers of ten [3]
  EURSubUnit = -2;
  BEFSubUnit =  0;
  DEMSubUnit = -2;
  GRDSubUnit =  0; // [2] effective 1/1/2001
  ESPSubUnit =  0;
  FFRSubUnit = -2;
  IEPSubUnit = -2;
  ITLSubUnit =  0;
  LUFSubUnit = -2;
  NLGSubUnit = -2;
  ATSSubUnit = -2;
  PTESubUnit = -2;
  FIMSubUnit =  0;

var
  // Accurate as of 12/12/2000 at 16:42 PST but almost certainly isn't anymore
  // Remember if you are changing these values in realtime you might, depending
  //  on your application's structure, have to deal with threading issues.
  USDToEUR: Double = 1.1369;
  GBPToEUR: Double = 1.6462;
  JPYToEUR: Double = 0.0102;

  // Subunit rounding for Euro conversion and expressed as powers of ten
  USDSubUnit: Integer = -2;
  GBPSubUnit: Integer = -2;
  JPYSubUnit: Integer = -2;


// Registration methods
function RegisterEuroConversionType(const AFamily: TConvFamily;
  const ADescription: string; const AFactor: Double;
  const ARound: TRoundToRange): TConvType; overload;

function RegisterEuroConversionType(const AFamily: TConvFamily;
  const ADescription: string; const AToCommonProc,
  AFromCommonProc: TConversionProc): TConvType; overload;

// Types used during the conversion of Euro to and from other currencies
type
  TConvTypeEuroFactor = class(TConvTypeFactor)
  private
    FRound: TRoundToRange;
  public
    constructor Create(const AConvFamily: TConvFamily;
      const ADescription: string; const AFactor: Double;
      const ARound: TRoundToRange);
    function ToCommon(const AValue: Double): Double; override;
    function FromCommon(const AValue: Double): Double; override;
  end;

// various strings used in this unit

resourcestring
  SEuroDescription = 'Euro';
  SEURDescription = 'EUEuro';
  SBEFDescription = 'BelgianFrancs';
  SDEMDescription = 'GermanMarks';
  SGRDDescription = 'GreekDrachmas';
  SESPDescription = 'SpanishPesetas';
  SFFRDescription = 'FrenchFrancs';
  SIEPDescription = 'IrishPounds';
  SITLDescription = 'ItalianLire';
  SLUFDescription = 'LuxembourgFrancs';
  SNLGDescription = 'DutchGuilders';
  SATSDescription = 'AustrianSchillings';
  SPTEDescription = 'PortugueseEscudos';
  SFIMDescription = 'FinnishMarks';
  SUSDDescription = 'USDollars';
  SGBPDescription = 'BritishPounds';
  SJPYDescription = 'JapaneseYens';

implementation

{ TConvTypeEuroFactor }

constructor TConvTypeEuroFactor.Create(const AConvFamily: TConvFamily;
  const ADescription: string; const AFactor: Double;
  const ARound: TRoundToRange);
begin
  inherited Create(AConvFamily, ADescription, AFactor);
  FRound := ARound;
end;

function TConvTypeEuroFactor.FromCommon(const AValue: Double): Double;
begin
  Result := SimpleRoundTo(AValue * Factor, FRound);
end;

function TConvTypeEuroFactor.ToCommon(const AValue: Double): Double;
begin
  Result := AValue / Factor;
end;

function RegisterEuroConversionType(const AFamily: TConvFamily;
  const ADescription: string; const AFactor: Double;
  const ARound: TRoundToRange): TConvType;
var
  LInfo: TConvTypeInfo;
begin
  LInfo := TConvTypeEuroFactor.Create(AFamily, ADescription, AFactor, ARound);
  if not RegisterConversionType(LInfo, Result) then
  begin
    LInfo.Free;
    RaiseConversionRegError(AFamily, ADescription);
  end;
end;

function RegisterEuroConversionType(const AFamily: TConvFamily;
  const ADescription: string; const AToCommonProc,
  AFromCommonProc: TConversionProc): TConvType;
begin
  Result := RegisterConversionType(AFamily, ADescription,
                                   AToCommonProc, AFromCommonProc);
end;

function ConvertUSDToEUR(const AValue: Double): Double;
begin
  Result := AValue * USDToEUR;
end;

function ConvertEURToUSD(const AValue: Double): Double;
begin
  Result := SimpleRoundTo(AValue / USDToEUR, USDSubUnit);
end;

function ConvertGBPToEUR(const AValue: Double): Double;
begin
  Result := AValue * GBPToEUR;
end;

function ConvertEURToGBP(const AValue: Double): Double;
begin
  Result := SimpleRoundTo(AValue / GBPToEUR, GBPSubUnit);
end;

function ConvertJPYToEUR(const AValue: Double): Double;
begin
  Result := AValue * JPYToEUR;
end;

function ConvertEURToJPY(const AValue: Double): Double;
begin
  Result := SimpleRoundTo(AValue / JPYToEUR, JPYSubUnit);
end;

initialization

  // Euro's family type
  cbEuro := RegisterConversionFamily(SEuroDescription);

  // Euro's various conversion types
  euEUR := RegisterEuroConversionType(cbEuro, SEURDescription, EURToEUR, EURSubUnit);
  euBEF := RegisterEuroConversionType(cbEuro, SBEFDescription, BEFToEUR, BEFSubUnit);
  euDEM := RegisterEuroConversionType(cbEuro, SDEMDescription, DEMToEUR, DEMSubUnit);
  euGRD := RegisterEuroConversionType(cbEuro, SGRDDescription, GRDToEUR, GRDSubUnit);
  euESP := RegisterEuroConversionType(cbEuro, SESPDescription, ESPToEUR, ESPSubUnit);
  euFFR := RegisterEuroConversionType(cbEuro, SFFRDescription, FFRToEUR, FFRSubUnit);
  euIEP := RegisterEuroConversionType(cbEuro, SIEPDescription, IEPToEUR, IEPSubUnit);
  euITL := RegisterEuroConversionType(cbEuro, SITLDescription, ITLToEUR, ITLSubUnit);
  euLUF := RegisterEuroConversionType(cbEuro, SLUFDescription, LUFToEUR, LUFSubUnit);
  euNLG := RegisterEuroConversionType(cbEuro, SNLGDescription, NLGToEUR, NLGSubUnit);
  euATS := RegisterEuroConversionType(cbEuro, SATSDescription, ATSToEUR, ATSSubUnit);
  euPTE := RegisterEuroConversionType(cbEuro, SPTEDescription, PTEToEUR, PTESubUnit);
  euFIM := RegisterEuroConversionType(cbEuro, SFIMDescription, FIMToEUR, FIMSubUnit);
  euUSD := RegisterEuroConversionType(cbEuro, SUSDDescription,
                                      ConvertUSDToEUR, ConvertEURToUSD);
  euGBP := RegisterEuroConversionType(cbEuro, SGBPDescription,
                                      ConvertGBPToEUR, ConvertEURToGBP);
  euJPY := RegisterEuroConversionType(cbEuro, SJPYDescription,
                                      ConvertJPYToEUR, ConvertEURToJPY);

finalization

  // Unregister all the conversion types we are responsible for
  UnregisterConversionFamily(cbEuro);
end.
