{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Printer.Mac;

interface

{$SCOPEDENUMS ON}

uses
  System.UITypes, System.Types, Macapi.CoreServices, Macapi.CoreFoundation, Macapi.Foundation, Macapi.CocoaTypes,
  Macapi.AppKit, FMX.Printer, FMX.Types, FMX.Consts, FMX.Graphics;

type
  TPrinterMac = class(TPrinter)
  private
    FPrinterList: CFArrayRef;
    FPrintInfo: NSPrintInfo;
    FCanvas: TCanvas;

    // converts the given NSString to a Delphi string value
    function ConvNSString(const Value: NSString): string;
    // converts the given CFString to a Delphi string value
    function ConvCFString(const Value: CFStringRef): string;
    // converts the OSType value into a string
    function ConvDriverCreator(const Value: OSType): string;
    function GetPaperMargins: TRectF;
    function GetCoordFactor: TPointF;
  protected
    procedure CheckError(Error: OSStatus; const Msg: string); inline;

    procedure ActivePrinterChanged; override;
    procedure DoAbortDoc; override;
    procedure DoBeginDoc; override;
    procedure DoEndDoc; override;
    procedure DoNewPage; override;
    function GetCanvas: TCanvas; override;
    function GetCapabilities: TPrinterCapabilities; override;
    function GetNumCopies: Integer; override;

    function GetOrientation: TPrinterOrientation; override;
    function GetPageHeight: Integer; override;
    function GetPageWidth: Integer; override;
    procedure RefreshFonts; override;
    procedure RefreshPrinterDevices; override;
    procedure SetDefaultPrinter; override;
    procedure SetNumCopies(Value: Integer); override;
    procedure SetOrientation(Value: TPrinterOrientation); override;
  public
    constructor Create; override;
    destructor Destroy; override;

    // access to the Cocoa underlying structures
    property PrintInfo: NSPrintInfo read FPrintInfo;
    // provides the hardware margins of the paper on which the printer cannot print
    property PaperMargins: TRectF read GetPaperMargins;
    // calculates the factor used to adapt the page coordinates from
    // points to pixels, with respect to the selected resolution; when the
    // ActiveDPI of the ActivePrinter is set to -1, the scaling factor is (1, 1);
    // the factor signifies how many times are the PageWidth and PageHeight
    // (for the current DPI) larger than they are at a scale factor of (1, 1)
    property CoordFactor: TPointF read GetCoordFactor;
  end;

function ActualPrinterClass: TPrinterClass;

implementation

{$SCOPEDENUMS OFF}

uses
                                                                             
// default canvas class for the printer so that we can create the canvas in the
// constructor of the printer implementation
  Macapi.Helpers, Macapi.PrintCore, FMX.Canvas.Mac;

type
  TMacPrinterDevice = class(TPrinterDevice)
  private
    FCarbonPrinter: PMPrinter;
    FTitle: string;
  protected
    function GetTitle: string; override;

    procedure RefreshDPIList; override;
    procedure ActiveDPIChanged; override;
  public
    constructor Create(const CarbonPrinter: PMPrinter;  const ATitle, ADriver, ADevice, APort: string);
                                                 

    property CarbonPrinter: PMPrinter read FCarbonPrinter;
  end;

function ActualPrinterClass: TPrinterClass;
begin
  Result := TPrinterMac;
end;

{ TPrinterMac }

procedure TPrinterMac.ActivePrinterChanged;
begin
  inherited;

  if ActivePrinter is TMacPrinterDevice then
    PMSessionSetCurrentPMPrinter(PrintInfo.PMPrintSession, TMacPrinterDevice(ActivePrinter).CarbonPrinter);
end;

procedure TPrinterMac.CheckError(Error: OSStatus; const Msg: string);
begin
  if Error <> noErr then
    RaiseError(Msg);
end;

                                        
function TPrinterMac.ConvCFString(const Value: CFStringRef): string;
begin
  Result := CFStringRefToStr(Value);
end;

function TPrinterMac.ConvDriverCreator(const Value: OSType): string;
var
  P: PChar;
begin
  SetLength(Result, SizeOf(Value));
  P := PChar(Result);

  P[0] := Char(Byte(Value shr 24));
  P[1] := Char(Byte(Value shr 16));
  P[2] := Char(Byte(Value shr 8));
  P[3] := Char(Byte(Value));
end;

                                        
function TPrinterMac.ConvNSString(const Value: NSString): String;
begin
  Result := NSStrToStr(Value);
end;

constructor TPrinterMac.Create;
var
  Changed: Boolean;
begin
  inherited;

  FPrintInfo := TNSPrintInfo.Wrap(TNSPrintInfo.OCClass.sharedPrintInfo);
  FPrintInfo.retain;

  // set the default settings for printing
  PMSessionDefaultPageFormat(PrintInfo.PMPrintSession, PrintInfo.PMPageFormat);
  PMSessionDefaultPrintSettings(PrintInfo.PMPrintSession, PrintInfo.PMPrintSettings);
  PMSessionValidatePageFormat(PrintInfo.PMPrintSession, PrintInfo.PMPageFormat, @Changed);
  PMSessionValidatePrintSettings(PrintInfo.PMPrintSession, PrintInfo.PMPrintSettings, @Changed);

  // obtain the Carbon printer list
  PMServerCreatePrinterList(nil, @FPrinterList);

                                                                                    
// in order to delay resource allocation; we create it here to avoid application hanging
  FCanvas := TCanvasManager.CreateFromPrinter(Self);
  FCanvas.SetSize(PageWidth, PageHeight);
  FCanvas.Stroke.Kind := TBrushKind.Solid;
  FCanvas.Stroke.Color := TAlphaColors.Black;
  FCanvas.Fill.Kind := TBrushKind.Solid;
  FCanvas.Fill.Color := TAlphaColors.Black;
end;

destructor TPrinterMac.Destroy;
begin
  FCanvas.Free;

  // free the Carbon printer list
  CFRelease(FPrinterList);
  FPrintInfo.release;

  inherited;
end;

procedure TPrinterMac.DoAbortDoc;
begin
  inherited;

  PMSessionSetError(PrintInfo.PMPrintSession, kPMCancel);
end;

procedure TPrinterMac.DoBeginDoc;
var
  Changed: Boolean;
  Err: OSStatus;
begin
  inherited;

  GetActivePrinter;

  PMSessionSetError(PrintInfo.PMPrintSession, noErr);

  // validate the print settings and page format
  Err := PMSessionValidatePageFormat(PrintInfo.PMPrintSession, PrintInfo.PMPageFormat, @Changed);
  CheckError(Err, SInvalidPageFormat);
  Err := PMSessionValidatePrintSettings(PrintInfo.PMPrintSession, PrintInfo.PMPrintSettings, @Changed);
  CheckError(Err, SInvalidPrinterSettings);

  // resize the canvas to fit the new page format
  FCanvas.SetSize(PageWidth, PageHeight);

  // start document and the first page
  Err := PMSessionBeginCGDocumentNoDialog(PrintInfo.PMPrintSession, PrintInfo.PMPrintSettings, PrintInfo.PMPageFormat);
  CheckError(Err, SCantStartPrintJob);
  Err := PMSessionBeginPageNoDialog(PrintInfo.PMPrintSession, PrintInfo.PMPageFormat, nil);
  CheckError(Err, SCantPrintNewPage);

                                                                             
// don't use Canvas here, directly, because it hangs without reason within the
// call to GetCanvas virtual method
  FCanvas.BeginScene;
end;

procedure TPrinterMac.DoEndDoc;
var
  Err: OSStatus;
begin
  inherited;

  if not Aborted then
  begin
    Printer.Canvas.EndScene;

    Err := PMSessionEndPageNoDialog(PrintInfo.PMPrintSession);
    CheckError(Err, SCantEndPrintJob);
    Err := PMSessionEndDocumentNoDialog(PrintInfo.PMPrintSession);
    CheckError(Err, SCantEndPrintJob);
  end;
end;

procedure TPrinterMac.DoNewPage;
var
  Err: OSStatus;
begin
  inherited;

  Canvas.EndScene;

  Err := PMSessionEndPageNoDialog(PrintInfo.PMPrintSession);
  CheckError(Err, SCantPrintNewPage);
  Err := PMSessionBeginPageNoDialog(PrintInfo.PMPrintSession, PrintInfo.PMPageFormat, nil);
  CheckError(Err, SCantPrintNewPage);

  Canvas.BeginScene;
end;

function TPrinterMac.GetCanvas: TCanvas;
begin
  Result := FCanvas;
end;

function TPrinterMac.GetCapabilities: TPrinterCapabilities;
begin
                                                                                          
//  FPrintOp.printInfo.printer.
  Result := [];
end;

function TPrinterMac.GetCoordFactor: TPointF;
const
  CPointsPerInch = 72;
begin
  if ActivePrinter.ActiveDPIIndex = -1 then
    Result := TPointF.Create(1, 1)
  else
  begin
    Result.X := ActivePrinter.ActiveDPI.X / CPointsPerInch;
    Result.Y := ActivePrinter.ActiveDPI.Y / CPointsPerInch;
  end;
end;

function TPrinterMac.GetNumCopies: Integer;
begin
  PMGetCopies(PrintInfo.PMPrintSettings, @Result);
end;

function TPrinterMac.GetOrientation: TPrinterOrientation;
begin
  if PrintInfo.orientation = NSPortraitOrientation then
    Result := TPrinterOrientation.poPortrait
  else
    Result := TPrinterOrientation.poLandscape;
end;

function TPrinterMac.GetPageHeight: Integer;
var
  PageRect: PMRect;
  Height: Double;
  Err: OSStatus;
  Ok: Boolean;
begin
  PMSessionValidatePageFormat(PrintInfo.PMPrintSession, PrintInfo.PMPageFormat, @Ok);
  Err := PMGetAdjustedPageRect(PrintInfo.PMPageFormat, @PageRect);

  if Err = noErr then
    Height := PageRect.bottom * CoordFactor.Y
  else
    Height := 0;

  Result := Round(Height);
end;

function TPrinterMac.GetPageWidth: Integer;
var
  PageRect: PMRect;
  Width: Double;
  Err: OSStatus;
  Ok: Boolean;
begin
  PMSessionValidatePageFormat(PrintInfo.PMPrintSession, PrintInfo.PMPageFormat, @Ok);
  Err := PMGetAdjustedPageRect(PrintInfo.PMPageFormat, @PageRect);

  if Err = noErr then
    Width := PageRect.right * CoordFactor.X
  else
    Width := 0;

  Result := Round(Width);
end;

function TPrinterMac.GetPaperMargins: TRectF;
var
  PaperRect: PMRect;
  Err: OSStatus;
  Ok: Boolean;
begin
                                                                                                                   
  PMSessionValidatePageFormat(PrintInfo.PMPrintSession, PrintInfo.PMPageFormat, @Ok);
  Err := PMGetAdjustedPaperRect(PrintInfo.PMPageFormat, @PaperRect);

  if Err = noErr then
    Result := TRectF.Create(
      Abs(PaperRect.left), Abs(PaperRect.top),
      PaperRect.right - PageWidth, PaperRect.bottom - PageHeight)
  else
    Result := TRectF.Empty;
end;

procedure TPrinterMac.RefreshFonts;
begin
  inherited;

end;

procedure TPrinterMac.RefreshPrinterDevices;
var
  PrinterDevice: TMacPrinterDevice;
  CarbonPrinter: PMPrinter;
  Name: CFStringRef;
  DriverCreator: OSType;
  ReleaseInfo: VersRec;
  Title: string;
  Driver: string;
  Device: string;
  Port: string;
  Count: CFIndex;
  i: CFIndex;
begin
  inherited;

  FPrinters.Clear;

  // grab again the printer list
  CFRelease(FPrinterList);
  PMServerCreatePrinterList(nil, @FPrinterList);

  // cycle through and create the printer devices
  Count := CFArrayGetCount(FPrinterList);
  for i := 0 to Count - 1 do
  begin
    CarbonPrinter := CFArrayGetValueAtIndex(FPrinterList, i);

    // title
    Title := CFStringRefToStr(PMPrinterGetName(CarbonPrinter));

    // device
    PMPrinterGetMakeAndModelName(CarbonPrinter, @Name);
    Device := CFStringRefToStr(Name);

    // driver
    PMPrinterGetDriverCreator(CarbonPrinter, @DriverCreator);
    PMPrinterGetDriverReleaseInfo(CarbonPrinter, @ReleaseInfo);
                                                                      
    Driver := ConvDriverCreator(DriverCreator);

    // port
    Port := CFStringRefToStr(PMPrinterGetID(CarbonPrinter));

    PrinterDevice := TMacPrinterDevice.Create(CarbonPrinter,
      Title, Driver, Device, Port);
    FPrinters.Add(PrinterDevice);
  end;
end;

procedure TPrinterMac.SetDefaultPrinter;
var
  Device: TMacPrinterDevice;
  i: Integer;
begin
  inherited;

  for i := 0 to Count - 1 do
    if Printers[i] is TMacPrinterDevice then
    begin
      Device := TMacPrinterDevice(Printers[i]);

      if PMPrinterIsDefault(Device.CarbonPrinter) then
      begin
        ActivePrinter := Device;

        Exit;
      end;
    end;
end;

procedure TPrinterMac.SetNumCopies(Value: Integer);
var
  Err: OSStatus;
begin
  inherited;

  Err := PMSetCopies(PrintInfo.PMPrintSettings, Value, False);
  CheckError(Err, SCantSetNumCopies);
end;

procedure TPrinterMac.SetOrientation(Value: TPrinterOrientation);
var
  Orientation: NSPrintingOrientation;
begin
  inherited;

  if Value = TPrinterOrientation.poPortrait then
    Orientation := NSPortraitOrientation
  else
    Orientation := NSLandscapeOrientation;

  PrintInfo.setOrientation(Orientation);
  Canvas.SetSize(PageWidth, PageHeight);
end;

{ TMacPrinterDevice }

procedure TMacPrinterDevice.ActiveDPIChanged;
var
  Resolution: PMResolution;
begin
  inherited;

  // set the new resolution to the printer
  Resolution.hRes := ActiveDPI.X;
  Resolution.vRes := ActiveDPI.Y;
  PMPrinterSetOutputResolution(CarbonPrinter, TPrinterMac(Printer).PrintInfo.PMPrintSettings, @Resolution);

  // resize the canvas
  Printer.Canvas.SetSize(Printer.PageWidth, Printer.PageHeight);
end;

constructor TMacPrinterDevice.Create(const CarbonPrinter: PMPrinter; const ATitle, ADriver, ADevice, APort: string);
begin
  FCarbonPrinter := CarbonPrinter;
  FTitle := ATitle;

  inherited Create(ADriver, ADevice, APort);
end;

function TMacPrinterDevice.GetTitle: String;
begin
  Result := FTitle;
end;

procedure TMacPrinterDevice.RefreshDPIList;
var
  Resolution: PMResolution;
  Count: UInt32;
  I: Int32;
begin
  inherited;

  FDPIList.Clear;

  // preallocate memory in the DPI list
  PMPrinterGetPrinterResolutionCount(CarbonPrinter, @Count);
  FDPIList.Capacity := Count;

  for I := 1 to Count do
  begin
    PMPrinterGetIndexedPrinterResolution(CarbonPrinter, I, @Resolution);
    FDPIList.Add(TPoint.Create(Round(Resolution.hRes), Round(Resolution.vRes)));
  end;
end;

end.
