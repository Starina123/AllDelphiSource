{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Printer.Android;

interface

uses FMX.Printer;

function ActualPrinterClass: TPrinterClass;

implementation

function ActualPrinterClass: TPrinterClass;
begin
  Result := nil;
end;

end.
