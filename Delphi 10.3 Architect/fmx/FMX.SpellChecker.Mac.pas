{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2013-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.SpellChecker.Mac;

interface

{$SCOPEDENUMS ON}

implementation

uses
  System.SysUtils, FMX.SpellChecker, FMX.Platform, Macapi.AppKit, Macapi.Foundation, Macapi.ObjectiveC, FMX.Types,
  Macapi.CocoaTypes, Macapi.Helpers;

type
  TCocoaSpellCheckerService = class(TInterfacedObject, IFMXSpellCheckerService)
  private
    FChecker: NSSpellChecker;
    function GetChecker: NSSpellChecker;
  public
    destructor Destroy; override;
    { IFMXSpellCheckerService }
    function CheckSpelling(Word: string): TArray<string>;
    function GuessCompletions(Word: string): TArray<string>;
    property Checker: NSSpellChecker read GetChecker;
  end;

var
  CocoaSpellCheckerService: TCocoaSpellCheckerService;

procedure RegisterSpellCheckerService;
begin
  CocoaSpellCheckerService := TCocoaSpellCheckerService.Create;
  TPlatformServices.Current.AddPlatformService(IFMXSpellCheckerService, CocoaSpellCheckerService);
end;

procedure UnregisterSpellCheckerService;
begin
  TPlatformServices.Current.RemovePlatformService(IFMXSpellCheckerService);
  CocoaSpellCheckerService := nil;
end;

{ TOSXSpellCheckerService }

function TCocoaSpellCheckerService.CheckSpelling(Word: string): TArray<string>;
var
  I: NSUInteger;
  SpellWords: NSArray;
  Range: NSRange;
begin
  Assert(Checker <> nil, 'Native bridge was not created');
  Result := nil;
  if Checker.checkSpellingOfString(StrToNSStr(Word), 0).location <> NSNotFound then
  begin
    Range.location := 0;
    Range.length := Word.Length;
    SpellWords := Checker.guessesForWordRange(Range, StrToNSStr(Word), nil, 0);
    if SpellWords.count > 0 then
    begin
      SetLength(Result, SpellWords.count);
      for I := 0 to SpellWords.count - 1 do
        Result[I] := UTF8ToUnicodeString(TNSString.Wrap(SpellWords.objectAtIndex(I)).UTF8String);
    end;
  end;
end;

function TCocoaSpellCheckerService.GetChecker: NSSpellChecker;
begin
  if FChecker = nil then
    FChecker := TNSSpellChecker.Create;
  Result := FChecker;
end;

destructor TCocoaSpellCheckerService.Destroy;
begin
  if FChecker <> nil then
  begin
    FChecker.release;
    FChecker := nil;
  end;
  inherited;
end;

function TCocoaSpellCheckerService.GuessCompletions(
  Word: string): TArray<string>;
var
  I: NSUInteger;
  Words: NSArray;
  Range: NSRange;
begin
  Assert(Checker <> nil, 'Native bridge was not created');
  Result := nil;
  Range.location := 0;
  Range.length := Word.Length;
  Words := Checker.completionsForPartialWordRange(Range, StrToNSStr(Word), nil, 0);
  if Words.count > 0 then
  begin
    SetLength(Result, Words.count);
    for I := 0 to Words.count - 1 do
      Result[I] := UTF8ToUnicodeString(TNSString.Wrap(Words.objectAtIndex(I)).UTF8String);
  end;
end;

initialization
  RegisterSpellCheckerService;
end.
