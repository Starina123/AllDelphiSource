{**************************************************************************************************}
{                                                                                                  }
{ Project JEDI Code Library (JCL)                                                                  }
{                                                                                                  }
{ The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); }
{ you may not use this file except in compliance with the License. You may obtain a copy of the    }
{ License at http://www.mozilla.org/MPL/                                                           }
{                                                                                                  }
{ Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF   }
{ ANY KIND, either express or implied. See the License for the specific language governing rights  }
{ and limitations under the License.                                                               }
{                                                                                                  }
{ The Original Code is JclUnicode.pas.                                                             }
{                                                                                                  }
{ The Initial Developer of the Original Code is Mike Lischke (public att lischke-online dott de).  }
{ Portions created by Mike Lischke are Copyright (C) 1999-2000 Mike Lischke. All Rights Reserved.  }
{                                                                                                  }
{ Contributor(s):                                                                                  }
{   Marcel van Brakel                                                                              }
{   Andreas Hausladen (ahuser)                                                                     }
{   Mike Lischke                                                                                   }
{   Flier Lu (flier)                                                                               }
{   Robert Marquardt (marquardt)                                                                   }
{   Robert Rossmair (rrossmair)                                                                    }
{   Olivier Sannier (obones)                                                                       }
{   Matthias Thoma (mthoma)                                                                        }
{   Petr Vones (pvones)                                                                            }
{   Peter Schraut (http://www.console-dev.de)                                                      }
{   Florent Ouchet (outchy)                                                                        }
{   glchapman                                                                                      }
{                                                                              			   }
{  Modified by Eugene Kryukov                                       	                           }
{                                                                  	                           }
{  Latest change can be found at:                                  	                           }
{    http://www.ksdev.com/mplfiles/                                 	                           }
{                                                                  	                           }
{**************************************************************************************************}

{$IFDEF FPC}

{ TWideStrings ==============================================================}

const
  WideNull = System.WideChar(#0);
  WideTabulator = System.WideChar(#9);
  WideSpace = System.WideChar(#32);
  WideCarriageReturn = System.WideChar($D);
  WideLineFeed = System.WideChar($A);
  WideVerticalTab = System.WideChar($B);
  WideFormFeed = System.WideChar($C);
  WideLineSeparator = System.WideChar($2028);
  WideParagraphSeparator = System.WideChar($2029);

  function goodCompareObj(const a1, a2: TObject): Integer;
  begin
    Result := integer(Pointer(a1)) - integer(Pointer(a2));
    if Result <> 0 then
    begin
      if Result < 0 then
        Result := 1
      else
        Result := -1;
      Exit;
    end;
  end;

constructor TWideStrings.Create;
begin
  inherited Create;
end;

destructor TWideStrings.Destroy;
begin
  inherited;
end;

function TWideStrings.CompareStrings(const S1, S2: WideString): Integer;
begin
  Result := 0;
end;

procedure TWideStrings.Delete(Index: Integer);
begin
end;

function TWideStrings.Add(const S: WideString): Integer;
begin
  Result := GetCount;
  Insert(Result, S);
end;

function TWideStrings.Items(AIndex: integer): WideString;
begin
  Result := Strings[AIndex];
end;

function TWideStrings.AddObject(const S: WideString; AObject: TObject): Integer;
begin
  Result := Add(S);
  PutObject(Result, AObject);
end;

procedure TWideStrings.Append(const S: WideString);
begin
  Add(S);
end;

procedure TWideStrings.AddStrings(Strings: Classes.TStrings);
var
  I: Integer;
begin
  BeginUpdate;
  try
    for I := 0 to Strings.Count - 1 do AddObject(Strings[I], Strings.Objects[I]);
  finally
    EndUpdate;
  end;
end;

procedure TWideStrings.AddStrings(Strings: TWideStrings);
var
  I: Integer;
begin
  BeginUpdate;
  try
    for I := 0 to Strings.Count - 1 do AddObject(Strings[I], Strings.Objects[I]);
  finally
    EndUpdate;
  end;
end;

procedure TWideStrings.Assign(Source: TPersistent);
var
  I: Integer;
begin
  if Source is TWideStrings then
  begin
    BeginUpdate;
    try
      Clear;
      AddStrings(TWideStrings(Source));
    finally
      EndUpdate;
    end;
  end
  else
    if Source is Classes.TStrings then
    begin
      BeginUpdate;
      try
        Clear;
        for I := 0 to Classes.TStrings(Source).Count - 1 do
          AddObject(Classes.TStrings(Source)[I], Classes.TStrings(Source).Objects[I]);
      finally
        EndUpdate;
      end;
    end
    else inherited Assign(Source);
end;

procedure TWideStrings.AssignTo(Dest: TPersistent);
var
  I: Integer;
begin
  if Dest is Classes.TStrings then
    with Dest as Classes.TStrings do
    begin
      BeginUpdate;
      try
        Clear;
        for I := 0 to Self.Count - 1 do
          AddObject(Self[I], Self.Objects[I]);
      finally
        EndUpdate;
      end;
    end
  else 
  if Dest is TWideStrings then
    with Dest as TWideStrings do
    begin
      BeginUpdate;
      try
        Clear;
        AddStrings(Self);
      finally
        EndUpdate;
      end;
    end
  else inherited;
end;

procedure TWideStrings.BeginUpdate;
begin
  if FUpdateCount = 0 then
    SetUpdateState(True);
  System.Inc(FUpdateCount);
end;

procedure TWideStrings.Clear;
begin

end;

procedure TWideStrings.DefineProperties(Filer: TFiler);
  function DoWrite: Boolean;
  begin
    if Filer.Ancestor <> nil then
    begin
      Result := True;
      if Filer.Ancestor is TWideStrings then
        Result := not Equals(TWideStrings(Filer.Ancestor))
    end
    else
      Result := Count > 0;
  end;
begin
  Filer.DefineProperty('strings', ReadData, WriteData, DoWrite);
end;

procedure TWideStrings.EndUpdate;
begin
  System.Dec(FUpdateCount);
  if FUpdateCount = 0 then SetUpdateState(False);
end;

function TWideStrings.Equals(Strings: TWideStrings): Boolean;
var
  I, Count: Integer;
begin
  Result := False;
  Count := GetCount;
  if Count <> Strings.GetCount then Exit;
  for I := 0 to Count - 1 do
    if Get(I) <> Strings.Get(I) then Exit;
  Result := True;
end;

procedure TWideStrings.Error(const Msg: WideString; Data: Integer);
begin

end;

procedure TWideStrings.Exchange(Index1, Index2: Integer);
var
  TempObject: TObject;
  TempString: WideString;
begin
  BeginUpdate;
  try
    TempString := Strings[Index1];
    TempObject := Objects[Index1];
    Strings[Index1] := Strings[Index2];
    Objects[Index1] := Objects[Index2];
    Strings[Index2] := TempString;
    Objects[Index2] := TempObject;
  finally
    EndUpdate;
  end;
end;

function TWideStrings.GetCapacity: Integer;
begin
  Result := Count;
end;

function TWideStrings.GetCommaText: WideString;
var
  S: WideString;
  P: PWideChar;
  I,
  Count: Integer;
begin
  Count := GetCount;
  if (Count = 1) and (Get(0) = '') then
    Result := ''
  else
  begin
    Result := '';
    for I := 0 to Count - 1 do
    begin
      S := Get(I);
      P := PWideChar(S);
      while not (P^ in [WideNull..WideSpace, System.WideChar('"'), System.WideChar(',')]) do
       System.Inc(P);
//!!!      if (P^ <> WideNull) then S := WideQuotedStr(S, '"');
      Result := Result + S + ',';
    end;
    System.Delete(Result, Length(Result), 1);
  end;
end;

function TWideStrings.GetName(Index: Integer): WideString;
var
  P: Integer;
begin
  Result := Get(Index);
  P := Pos(WideString('='), Result);
  if P > 0 then SetLength(Result, P - 1)
           else Result := '';
end;

function TWideStrings.GetObject(Index: Integer): TObject;
begin
  Result := nil;
end;

function TWideStrings.GetTextStr: WideString;
var
  I, L, Size, Count: Integer;
  P: PWideChar;
  S: WideString;
begin
  Count := GetCount;
  Size := 0;
  for I := 0 to Count - 1 do
    System.Inc(Size, Length(Get(I)) + 2);
  SetLength(Result, Size);
  P := Pointer(Result);
  for I := 0 to Count - 1 do
  begin
    S := Get(I);
    L := Length(S);
    if L <> 0 then
    begin
      System.Move(Pointer(S)^, P^, 2 * L);
      System.Inc(P, L);
    end;
    P^ := WideCarriageReturn;
    System.Inc(P);
    P^ := WideLineFeed;
    System.Inc(P);
  end;
end;

function TWideStrings.GetValueFromIndex(Index: Integer): WideString;
begin
  if Index >= 0 then
    Result := Copy(Get(Index), Length(Names[Index]) + 2, System.MaxInt) else
    Result := '';
end;

procedure TWideStrings.SetValueFromIndex(Index: Integer; const Value: WideString);
begin
  if Value <> '' then
  begin
    if Index < 0 then Index := Add('');
    Put(Index, Names[Index] + '=' + Value);
  end
  else
    if Index >= 0 then Delete(Index);
end;

procedure TWideStrings.sort;
begin
end;

function TWideStrings.GetValue(const Name: WideString): WideString;
var
  I: Integer;
begin
  I := IndexOfName(Name);
  if I >= 0 then Result := Copy(Get(I), Length(Name) + 2, System.MaxInt)
            else Result := '';
end;

function TWideStrings.IndexOf(const S: WideString): Integer;
begin
  for Result := 0 to GetCount - 1 do
  begin
    if CompareStrings(Get(Result), S) = 0 then Exit;
  end;
  Result := -1;
end;

function TWideStrings.IndexOfName(const Name: WideString): Integer;
var
  P: Integer;
  S: WideString;
begin
  for Result := 0 to GetCount - 1 do
  begin
    S := Get(Result);
    P := Pos(WideString('='), S);
    if (P > 0) and (CompareStrings(Copy(S, 1, P - 1), Name) = 0) then Exit;
  end;
  Result := -1;
end;

function TWideStrings.IndexOfValue(const Name: WideString): Integer;
var
  P: Integer;
  S: WideString;
begin
  for Result := 0 to GetCount - 1 do
  begin
    S := Get(Result);
    P := Pos(WideString('='), S);
    if (P > 0) and (CompareStrings(Copy(S, P + 1, Length(S)), Name) = 0) then Exit;
  end;
  Result := -1;
end;

function TWideStrings.IndexOfObject(AObject: TObject): Integer;
begin
  for Result := 0 to GetCount - 1 do
    if GetObject(Result) = AObject then Exit;
  Result := -1;
end;

procedure TWideStrings.InsertObject(Index: Integer; const S: WideString; AObject: TObject);
begin
  Insert(Index, S);
  PutObject(Index, AObject);
end;

procedure TWideStrings.LoadFromFile(const FileName: WideString);
var
  Stream: TStream;
begin
  try
    Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
    try
      LoadFromStream(Stream);
    finally
      Stream.Free;
    end;
  except
    //RaiseLastWin32Error;
  end;
end;

procedure TWideStrings.LoadFromStream(Stream: TStream);
var
  Size: Integer;
  Order: System.WideChar;
  SW: WideString;
  SA: AnsiString;
begin
  BeginUpdate;
  try
    Size := Stream.Size - Stream.Position;
    Stream.Read(Order, 2);
    if (Order = BOM_LSB_FIRST) or (Order = BOM_MSB_FIRST) then
    begin
      // unicode
      SetLength(SW, (Size - 2) div 2);
      Stream.Read(PWideChar(SW)^, Size - 2);
      SetTextStr(SW);
    end
    else
    begin
      // ansi
      Stream.Position := Stream.Position - 2;
      SetLength(SA, Size);
      Stream.Read(PAnsiChar(SA)^, Size);
      SetTextStr(SA);
    end;
  finally
    EndUpdate;
  end;
end;

procedure TWideStrings.Move(CurIndex, NewIndex: Integer);
var
  TempObject: TObject;
  TempString: WideString;
begin
  if CurIndex <> NewIndex then
  begin
    BeginUpdate;
    try
      TempString := Get(CurIndex);
      TempObject := GetObject(CurIndex);
      Delete(CurIndex);
      InsertObject(NewIndex, TempString, TempObject);
    finally
      EndUpdate;
    end;
  end;
end;

procedure TWideStrings.Put(Index: Integer; const S: WideString);
var
  TempObject: TObject;
begin
  TempObject := GetObject(Index);
  Delete(Index);
  InsertObject(Index, S, TempObject);
end;

procedure TWideStrings.PutObject(Index: Integer; AObject: TObject);
begin
end;

procedure TWideStrings.ReadData(Reader: TReader);
begin
  Reader.ReadListBegin;
  BeginUpdate;
  try
    Clear;
    while not Reader.EndOfList do
      Add(Reader.ReadWideString);
  finally
    EndUpdate;
  end;
  Reader.ReadListEnd;
end;

procedure TWideStrings.SaveToFile(const FileName: WideString);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    SaveToStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TWideStrings.SaveToAnsiFile(const FileName: WideString);
var
  S: TWideStrings;
begin
  S := TWideStringList.Create;
  try
    S.Text := Text;
    S.SaveToFile(FileName);
  finally
    S.Free;
  end;
end;

procedure TWideStrings.SaveToStream(Stream: TStream);
var
  SW, BOM: WideString;
begin
  SW := GetTextStr;
  // only save if allowed
  BOM := BOM_LSB_FIRST;
  Stream.WriteBuffer(PWideChar(BOM)^, 2);
  // SW has already been filled
  Stream.WriteBuffer(PWideChar(SW)^, 2 * Length(SW));
end;

procedure TWideStrings.SetCapacity(NewCapacity: Integer);
begin
end;

procedure TWideStrings.SetCaseSensitive(const Value: Boolean);
begin
  if Value <> FCaseSensitive then
  begin
    FCaseSensitive := Value;
    if Sorted then Sort;
  end;
end;

procedure TWideStrings.SetCommaText(const Value: WideString);
var
  S: WideString;
  P, P1: PWideChar;
begin
  BeginUpdate;
  try
    Clear;
    P := PWideChar(Value);
    while P^ in [System.WideChar(#1)..WideSpace] do System.Inc(P);
    while P^ <> WideNull do
    begin
      if P^ = '"' then
//!!!        S := WideExtractQuotedStr(P, '"')
      else
      begin
        P1 := P;
        while (P^ > WideSpace) and (P^ <> ',') do System.Inc(P);
        System.SetString(S, P1, P - P1);
      end;
      Add(S);

      while P^ in [System.WideChar(#1)..WideSpace] do
        System.Inc(P);
      if P^ = ',' then
        repeat
          System.Inc(P);
        until not (P^ in [System.WideChar(#1)..WideSpace]);
    end;
  finally
    EndUpdate;
  end;
end;

procedure TWideStrings.SetItem(index: integer; AText: wideString);
begin
  Strings[index] := AText;
end;

procedure TWideStrings.SetSorted(const Value: Boolean);
begin
  if FSorted <> Value then
  begin
    if Value then Sort;
    FSorted := Value;
  end;
end;

procedure TWideStrings.SetText(Text: PWideChar);
begin
  SetTextStr(Text);
end;

procedure TWideStrings.SetTextStr(const Value: WideString);
var
  Head, Tail: PWideChar;
  S: WideString;
begin
  BeginUpdate;
  try
    Clear;
    Head := PWideChar(Value);
    while Head^ <> WideNull do
    begin
      Tail := Head;
      while not (Tail^ in [WideNull, WideLineFeed, WideCarriageReturn, WideVerticalTab, WideFormFeed]) and
            (Tail^ <> WideLineSeparator) and (Tail^ <> WideParagraphSeparator) do
        System.Inc(Tail);
      System.SetString(S, Head, Tail - Head);
      Add(S);
      Head := Tail;
      if Head^ <> WideNull then
      begin
        System.Inc(Head);
        if (Tail^ = WideCarriageReturn) and (Head^ = WideLineFeed) then
          System.Inc(Head);
      end;
    end;
  finally
    EndUpdate;
  end;
end;

procedure TWideStrings.SetUpdateState(Updating: Boolean);
begin
end;

procedure TWideStrings.SetValue(const Name, Value: WideString);
var
  I : Integer;
begin
  I := IndexOfName(Name);
  if Value <> '' then
  begin
    if I < 0 then I := Add('');
    Put(I, Name + '=' + Value);
  end
  else
    if I >= 0 then Delete(I);
end;

procedure TWideStrings.WriteData(Writer: TWriter);
var
  I: Integer;
begin
  Writer.WriteListBegin;
  for I := 0 to Count-1 do
    Writer.WriteWideString(Get(I));
  Writer.WriteListEnd;
end;

{ TWideStringList ===========================================================}

destructor TWideStringList.Destroy;
begin
  FOnChange := nil;
  FOnChanging := nil;
  inherited Destroy;
  FCount := 0;
  SetCapacity(0);
end;

function TWideStringList.Add(const S: WideString): Integer;
begin
  if not Sorted then
    Result := FCount
  else
  begin
    if sortByObject then
    begin
      Result := FCount
    end
    else
    begin
      if Find(S, Result) then
        case Duplicates of
          dupIgnore:
            Exit;
          dupError:
            Error('Doublicate string', 0);
        end;
    end;
  end;
  InsertItem(Result, S);
end;

procedure TWideStringList.Changed;
begin
  if (FUpdateCount = 0) and Assigned(FOnChange) then FOnChange(Self);
end;

procedure TWideStringList.Changing;
begin
  if (FUpdateCount = 0) and Assigned(FOnChanging) then FOnChanging(Self);
end;

procedure TWideStringList.Clear;
begin
  if FCount <> 0 then
  begin
    Changing;
    FCount := 0;
    SetCapacity(0);
    Changed;
  end;
end;

function TWideStringList.CompareStrings(const S1, S2: WideString): Integer;
begin
  {$IFDEF KS_COMPILER6_UP}
  if CaseSensitive then
    Result := WideCompareStr(S1, S2)
  else
    Result := WideCompareText(S1, S2);
  {$ELSE}
  if CaseSensitive then
    Result := CompareStr(S1, S2)
  else
    Result := CompareText(S1, S2);
  {$ENDIF}
end;

procedure TWideStringList.Delete(Index: Integer);
begin
  if (Index < 0) or (Index >= FCount) then Error('List index error', Index);
  Changing;
  FList[Index].FString := '';
  System.Finalize(FList[Index]);
  System.Dec(FCount);
  if Index < FCount then
  begin
    System.Move(FList[Index + 1], FList[Index], (FCount - Index) * SizeOf(TWideStringItem));
    PPointer(@FList[FCount])^ := nil;
  end;
  Changed;
end;

procedure TWideStringList.Exchange(Index1, Index2: Integer);
begin
  if (Index1 < 0) or (Index1 >= FCount) then Error('List index error', Index1);
  if (Index2 < 0) or (Index2 >= FCount) then Error('List index error', Index2);
  Changing;
  ExchangeItems(Index1, Index2);
  Changed;
end;

procedure TWideStringList.ExchangeItems(Index1, Index2: Integer);
var 
  P1,P2: Pointer;
begin
  P1:=Pointer(Flist[Index1].FString);
  P2:=Pointer(Flist[Index1].FObject);
  Pointer(Flist[Index1].FString) := Pointer(Flist[Index2].FString);
  Pointer(Flist[Index1].FObject) := Pointer(Flist[Index2].FObject);
  Pointer(Flist[Index2].FString) := P1;
  Pointer(Flist[Index2].FObject) := P2;
end;

function TWideStringList.Find(const S: WideString; var Index: Integer): Boolean;
var
  L, H, I, C: Integer;
begin
  Result := False;
  L := 0;
  H := FCount - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    C := CompareStrings(FList[I].FString, S);
    if C < 0 then L := I + 1
    else
    begin
      H := I - 1;
      if C = 0 then
      begin
        Result := True;
        if Duplicates <> dupAccept then L := I;
      end;
    end;
  end;
  Index := L;
end;

function TWideStringList.FindByObject(const S: TObject;
  var Index: Integer): Boolean;
var
  L, H, I, C: Integer;
begin
  Result := False;
  L := 0;
  H := FCount - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    C := goodCompareObj(FList[I].FObject, S);
    if C < 0 then L := I + 1 else
    begin
      H := I - 1;
      if C = 0 then
      begin
        Result := True;
        if Duplicates <> dupAccept then L := I;
      end;
    end;
  end;
  Index := L;
end;

function TWideStringList.Get(Index: Integer): WideString;
begin
  if (Index < 0) or (Index >= FCount) then
  begin
    Error('List index error', Index);
    Result := '';
  end
  else
    Result := FList[Index].FString;
end;

function TWideStringList.GetCapacity: Integer;
begin
  Result := FCapacity;
end;

function TWideStringList.GetCount: Integer;
begin
  Result := FCount;
end;

function TWideStringList.GetObject(Index: Integer): TObject;
begin
  if (Index < 0) or (Index >= FCount) then Error('List index error', Index);
  Result := FList[Index].FObject;
end;

procedure TWideStringList.Grow;
var
  Delta: Integer;
begin
  if FCapacity > 64 then Delta := FCapacity div 4 else
    if FCapacity > 8 then Delta := 16 else
      Delta := 4;
  SetCapacity(FCapacity + Delta);
end;

function TWideStringList.IndexOf(const S: WideString): Integer;
begin
  if not Sorted then
    Result := inherited IndexOf(S)
  else
    if not Find(S, Result) then Result := -1;
end;

procedure TWideStringList.Insert(Index: Integer; const S: WideString);
begin
  if Sorted then Error('Sorted list error', 0);
  if (Index < 0) or (Index > FCount) then Error('List index error', Index);
  InsertItem(Index, S);
end;

procedure TWideStringList.InsertItem(Index: Integer; const S: WideString);
begin
  Changing;
  if FCount = FCapacity then Grow;
  if Index < FCount then
    System.Move(FList[Index], FList[Index + 1],
      (FCount - Index) * SizeOf(TStringItem));
  with FList[Index] do
  begin
    Pointer(FString) := nil;
    FObject := nil;
    FString := S;
  end;
  System.Inc(FCount);
  Changed;
end;

procedure TWideStringList.Put(Index: Integer; const S: WideString);
begin
  if Sorted then Error('Sorted list error', 0);
  if (Index < 0) or (Index >= FCount) then Error('List index error', Index);
  Changing;
  FList[Index].FString := S;
  Changed;
end;

procedure TWideStringList.PutObject(Index: Integer; AObject: TObject);
begin
  if (Index < 0) or (Index >= FCount) then Error('List index error', Index);
  Changing;
  FList[Index].FObject := AObject;
  Changed;
end;

procedure TWideStringList.QuickSort(L, R: Integer);
var
  I, J: Integer;
  P: WideString;
begin
  repeat
    I := L;
    J := R;
    P := FList[(L + R) shr 1].FString;
    repeat
      {$IFDEF KS_COMPILER6_UP}
      while WideCompareText(FList[I].FString, P) < 0 do System.Inc(I);
      while WideCompareText(FList[J].FString, P) > 0 do System.Dec(J);
      {ELSE}
      while CompareText(FList[I].FString, P) < 0 do System.Inc(I);
      while CompareText(FList[J].FString, P) > 0 do System.Dec(J);
      {$ENDIF}
      if I <= J then
      begin
        ExchangeItems(I, J);
        System.Inc(I);
        System.Dec(J);
      end;
    until I > J;
    if L < J then QuickSort(L, J);
    L := I;
  until I >= R;
end;

procedure TWideStringList.QuickSortByObject(L, R: Integer);
var
  I, J: Integer;
  P: TObject;
begin
  repeat
    I := L;
    J := R;
    P := FList[(L + R) shr 1].FObject;
    repeat
      while goodCompareObj(FList[I].FObject, P) < 0 do System.Inc(I);
      while goodCompareObj(FList[J].FObject, P) > 0 do System.Dec(J);
      if I <= J then
      begin
        ExchangeItems(I, J);
        System.Inc(I);
        System.Dec(J);
      end;
    until I > J;
    if L < J then QuickSortByObject(L, J);
    L := I;
  until I >= R;
end;

procedure TWideStringList.SetCapacity(NewCapacity: Integer);
begin
  SetLength(FList, NewCapacity);
  FCapacity := NewCapacity;
end;

procedure TWideStringList.SetUpdateState(Updating: Boolean);
begin
  if Updating then Changing
              else Changed;
end;

procedure TWideStringList.Sort;
begin
  if not Sorted and (Count > 1) then
  begin
    Changing;
    if FsortByObject then
      QuickSortByObject(0, FCount - 1)
    else
      QuickSort(0, FCount - 1);
    Changed;
  end;
end;


{ TSizeF }

function TSizeF.Add(const Point: TSizeF): TSizeF;
begin
  Result.cx := cx + Point.cx;
  Result.cy := cy + Point.cy;
end;

function TSizeF.Create(const X, Y: Single): TSizeF;
begin
  Result.cx := X;
  Result.cy := Y;
end;

function TSizeF.Create(P: TSizeF): TSizeF;
begin
  Result.cx := P.cx;
  Result.cy := P.cy;
end;

function TSizeF.Distance(const P2: TSizeF): Double;
begin
  Result := Sqrt(Sqr(Self.cx - P2.cx) +  Sqr(Self.cy - P2.cy));
end;

function TSizeF.IsZero: Boolean;
begin
  Result := SameValue(cx, 0.0) and SameValue(cy, 0.0);
end;

function TSizeF.Subtract(const Point: TSizeF): TSizeF;
begin
  Result.cx := cx - Point.cx;
  Result.cy := cy - Point.cy;
end;

function TSizeF.Ceiling : TSize;
begin
  Result.cx := Ceil(cx);
  Result.cy := Ceil(cy);
end;

function TSizeF.Round : TSize;
begin
  Result.cx := Trunc(cx + 0.5);
  Result.cy := Trunc(cy + 0.5);
end;

function TSizeF.Truncate : TSize;
begin
  Result.cx := Trunc(cx);
  Result.cy := Trunc(cy);
end;

{ TPointF }

function TPointF.Add(const Point: TPointF): TPointF;
begin
  Result.X := Self.X + Point.X;
  Result.Y := Self.Y + Point.Y;
end;

function TPointF.Add(const Point: TPoint): TPointF;
begin
  Result.X := Self.X + Point.X;
  Result.Y := Self.Y + Point.Y;
end;

function TPointF.Create(const P: TPointF): TPointF;
begin
  Result.X := P.X;
  Result.Y := P.Y;
end;

function TPointF.Create(const X, Y: Single): TPointF;
begin
  Result.X := X;
  Result.Y := Y;
end;

function TPointF.Create(P: TPoint): TPointF;
begin
  Result.X := P.X;
  Result.Y := P.Y;
end;

function TPointF.Distance(const P2: TPointF): Double;
begin
  Result := Sqrt(Sqr(Self.X - P2.X) +  Sqr(Self.Y - P2.Y));
end;

function TPointF.IsZero: Boolean;
begin
  Result := SameValue(X, 0.0) and SameValue(Y, 0.0);
end;

procedure TPointF.Offset(const Point: TPoint);
begin
  Self.X := Self.X + Point.X;
  Self.Y := Self.Y + Point.Y;
end;

procedure TPointF.Offset(const DX, DY: Single);
begin
  Self.X := Self.X + DX;
  Self.Y := Self.Y + DY;
end;

procedure TPointF.Offset(const Point: TPointF);
begin
  Self.X := Self.X + Point.X;
  Self.Y := Self.Y + Point.Y;
end;

procedure TPointF.SetLocation(const P: TPoint);
begin
  Self.X := P.X;
  Self.Y := P.Y;
end;

procedure TPointF.SetLocation(const P: TPointF);
begin
  Self := P;
end;

procedure TPointF.SetLocation(const X, Y: Single);
begin
  Self.X := X;
  Self.Y := Y;
end;

function TPointF.Subtract(const Point: TPointF): TPointF;
begin
  Result.X := Self.X - Point.X;
  Result.Y := Self.Y - Point.Y;
end;

function TPointF.Subtract(const Point: TPoint): TPointF;
begin
  Result.X := Self.X - Point.X;
  Result.Y := Self.Y - Point.Y;
end;

function TPointF.Ceiling : TPoint;
begin
  Result.X := Ceil(X);
  Result.Y := Ceil(Y);
end;

function TPointF.Truncate : TPoint;
begin
  Result.X := Trunc(X);
  Result.Y := Trunc(Y);
end;

function TPointF.Round : TPoint;
begin
  Result.X := System.Round(X);
  Result.Y := System.Round(Y);
end;

{ TRectF }

function TRectF.Create(const R: TRectF; Normalize: Boolean): TRectF;
begin
  Result := R;
  if Normalize then Result.NormalizeRect;
end;

function TRectF.Create(const R: TRect; Normalize: Boolean): TRectF;
begin
  Result.Left := R.Left;
  Result.Top  := R.Top;
  Result.Right := R.Right;
  Result.Bottom := R.Bottom;
  if Normalize then Result.NormalizeRect;
end;

function TRectF.Create(const Origin: TPointF): TRectF;
begin
  Result.TopLeft := Origin;
  Result.BottomRight := Origin;
end;

function TRectF.Create(const Left, Top, Right, Bottom: Single): TRectF;
begin
  Result.Left := Left; Result.Top := Top;
  Result.Right := Right; Result.Bottom := Bottom;
end;

function TRectF.Create(const P1, P2: TPointF; Normalize: Boolean): TRectF;
begin
  Result.TopLeft := P1;
  Result.BottomRight := P2;
  if Normalize then Result.NormalizeRect;
end;

function TRectF.Create(const Origin: TPointF; const Width, Height: Single): TRectF;
begin
  Result.TopLeft := Origin;
  Result.Width := Width;
  Result.Height := Height;
end;

function TRectF.CenterPoint: TPointF;
begin
  Result.X := (Right - Left)/2.0 + Left;
  Result.Y := (Bottom - Top)/2.0 + Top;
end;

function TRectF.Contains(const R: TRectF): Boolean;
begin
  Result := Contains(R.TopLeft) and Contains(R.BottomRight);
end;

function TRectF.Contains(const Pt: TPointF): Boolean;
begin
  Result := ((Pt.X > Self.Left) or SameValue(Pt.X, Self.Left)) and
            (Pt.X < Self.Right) and
            ((Pt.Y > Self.Top) or SameValue(Pt.Y, Self.Top)) and
            (Pt.Y < Self.Bottom);
end;

function TRectF.Empty: TRectF;
begin
  Result := TRectF.Create(0,0,0,0);
end;

function TRectF.GetHeight: Single;
begin
  Result := Self.Bottom - Self.Top;
end;

procedure TRectF.SetHeight(const Value: Single);
begin
  Self.Bottom := Self.Top + Value;
end;

function TRectF.GetWidth: Single;
begin
  Result := Self.Right - Self.Left;
end;

procedure TRectF.SetWidth(const Value: Single);
begin
  Self.Right := Self.Left + Value;
end;

function TRectF.GetSize: TSizeF;
begin
  Result.cx := Width;
  Result.cy := Height;
end;

procedure TRectF.SetSize(const Value: TSizeF);
begin
  Width := Value.cx;
  Height := Value.cy;
end;

procedure TRectF.Inflate(const DX, DY: Single);
begin
  TopLeft.Offset(-DX, -DY);
  BottomRight.Offset(DX, DY);
end;

procedure TRectF.Inflate(const DL, DT, DR, DB: Single);
begin
  TopLeft.Offset(-DL, -DT);
  BottomRight.Offset(DR, DB);
end;

procedure TRectF.Offset(const Point: TPointF);
begin
  TopLeft.Offset(Point);
  BottomRight.Offset(Point);
end;

procedure TRectF.Offset(const DX, DY: Single);
begin
  TopLeft.Offset(DX, DY);
  BottomRight.Offset(DX, DY);
end;

function TRectF.GetLocation: TPointF;
begin
  Result := TopLeft;
end;

procedure TRectF.SetLocation(const Point: TPointF);
begin
	Offset(Point.X - Left, Point.Y - Top);
end;

procedure TRectF.SetLocation(const X, Y: Single);
begin
	Offset(X - Left, Y - Top);
end;

function TRectF.IntersectsWith(const R: TRectF): Boolean;
begin
  Result := not ( (Self.BottomRight.X < R.TopLeft.X) or
                  (Self.BottomRight.Y < R.TopLeft.Y) or
                  (R.BottomRight.X < Self.TopLeft.X) or
                  (R.BottomRight.Y < Self.TopLeft.Y) );
end;

function TRectF.IsEmpty: Boolean;
begin
  Result := (Right < Left) or SameValue(Right, Left)
         or (Bottom < Top) or SameValue(Bottom, Top);
end;

procedure TRectF.NormalizeRect;
var
  temp : Single;
begin
  if Top > Bottom then begin
    temp := Top;
    Top := Bottom;
    Bottom := temp;
  end;
  if Left > Right then begin
    temp := Left;
    Left := Right;
    Right := temp;
  end
end;

function TRectF.Ceiling : TRect;
begin
  Result.TopLeft := TopLeft.Ceiling;
  Result.BottomRight := BottomRight.Ceiling;
end;

function TRectF.Truncate : TRect;
begin
  Result.TopLeft := TopLeft.Truncate;
  Result.BottomRight := BottomRight.Truncate;
end;

function TRectF.Round : TRect;
begin
  Result.TopLeft := TopLeft.Round;
  Result.BottomRight := BottomRight.Round;
end;

function TRectF.Intersect(const R1, R2: TRectF): TRectF;
begin
  IntersectRect(Result, R1, R2);
end;

procedure TRectF.Intersect(const R: TRectF);
begin
  Self := Intersect(Self, R);
end;

function TRectF.Union(const R1, R2: TRectF): TRectF;
begin
  Result := UnionRect(R1, R2);
end;

procedure TRectF.Union(const R: TRectF);
begin
  Self := TRectF.Union(Self, R);
end;

function TRectF.Union(const Points : Array of TPointF) : TRectF;
var
  i : Integer;
  TLCorner, BRCorner : TPointF;
begin
  if Length(Points) > 0 then
  begin
    TLCorner := Points[Low(Points)];
    BRCorner := Points[Low(Points)];

    if Length(Points) > 1 then
    begin
      for i := Low(Points) + 1 to High(Points) do
      begin
        if Points[i].X < TLCorner.X then TLCorner.X := Points[i].X;
        if Points[i].X > BRCorner.X then BRCorner.X := Points[i].X;
        if Points[i].Y < TLCorner.Y then TLCorner.Y := Points[i].Y;
        if Points[i].Y > BRCorner.Y then BRCorner.Y := Points[i].Y;
      end;
    end;
    Result := TRectF.Create(TLCorner, BRCorner);
  end
  else begin
    Result := TRectF.Empty;
  end;
end;

function TRectF.GetBottomRight: TPointF;
begin
  Result := TPointF.Create(Bottom, Right);
end;

procedure TRectF.SetBottomRight(const Value: TPointF);
begin
  Right := Value.X;
  Bottom := Value.Y;
end;

function TRectF.GetTopLeft: TPointF;
begin
  Result := TPointF.Create(Top, Left);
end;

procedure TRectF.SetTopLeft(const Value: TPointF);
begin
  Left := Value.X;
  Top := Value.Y;
end;

function PointF(X, Y: Single): TPointF;
begin
  Result.X := X;
  Result.Y := Y;
end;

procedure InflateRect(var R: TRectF; const DX, DY: Single);
begin
  R.Left := R.Left - DX;
  R.Right := R.Right + DX;
  R.Top := R.Top - DY;
  R.Bottom := R.Bottom + DY;
end;

function OffsetRect(var R: TRectF; DX, DY: Single): Boolean;
begin
  if @R <> nil then // Test to increase compatiblity with Windows
  begin
    R.Left := R.Left + DX;
    R.Right := R.Right + DX;
    R.Top := R.Top + DY;
    R.Bottom := R.Bottom + DY;
    Result := True;
  end
  else
    Result := False;
end;

function RectF(Left, Top, Right, Bottom: Single): TRectF;
begin
  Result.Left := Left;
  Result.Top := Top;
  Result.Bottom := Bottom;
  Result.Right := Right;
end;

function RectHeight(const Rect: TRectF): Single;
begin
  Result := Rect.Bottom - Rect.Top;
end;

function RectWidth(const Rect: TRectF): Single;
begin
  Result := Rect.Right - Rect.Left;
end;

function PointF(const V: TVector): TPointF;
begin
  Result.X := V.X;
  Result.Y := V.Y;
end;

function UnionRect(out Rect: TRectF; const R1, R2: TRectF): Boolean;
begin
  Rect := R1;
  if not IsRectEmpty(R2) then
  begin
    if R2.Left < R1.Left then Rect.Left := R2.Left;
    if R2.Top < R1.Top then Rect.Top := R2.Top;
    if R2.Right > R1.Right then Rect.Right := R2.Right;
    if R2.Bottom > R1.Bottom then Rect.Bottom := R2.Bottom;
  end;
  Result := not IsRectEmpty(Rect);
  if not Result then FillChar(Rect, SizeOf(Rect), 0);
end;

function UnionRect(const ARect1, ARect2: TRectF): TRectF;
begin
  UnionRect(Result, ARect1, ARect2);
end;

function IntersectRect(const Rect1, Rect2: TRectF): Boolean;
begin
  Result := (Rect1.Left <= Rect2.Right) and (Rect1.Right >= Rect2.Left) and (Rect1.Top <= Rect2.Bottom) and
    (Rect1.Bottom >= Rect2.Top);
end;

function IntersectRect(out Rect: TRectF; const R1, R2: TRectF): Boolean;
begin
  Rect := R1;
  if R2.Left > R1.Left then Rect.Left := R2.Left;
  if R2.Top > R1.Top then Rect.Top := R2.Top;
  if R2.Right < R1.Right then Rect.Right := R2.Right;
  if R2.Bottom < R1.Bottom then Rect.Bottom := R2.Bottom;
  Result := not IsRectEmpty(Rect);
  if not Result then FillChar(Rect, SizeOf(Rect), 0);
end;

function EqualRect(const R1, R2: TRectF): Boolean;
begin
  Result := (R1.Left = R2.Left) and (R1.Right = R2.Right) and
    (R1.Top = R2.Top) and (R1.Bottom = R2.Bottom);
end;

function RectCenter(var R: TRectF; const Bounds: TRectF): TRectF;
begin
  OffsetRect(R, -R.Left, -R.Top);
  OffsetRect(R, Round((RectWidth(Bounds) - RectWidth(R)) / 2), Round((RectHeight(Bounds) - RectHeight(R)) / 2));
  OffsetRect(R, Bounds.Left, Bounds.Top);
  Result := R;
end;

procedure MultiplyRect(var R: TRectF; const DX, DY: Single);
begin
  R.Left := R.Left * dX;
  R.Right := R.Right * dX;
  R.Top := R.Top * dY;
  R.Bottom := R.Bottom * dY;
end;

function NormalizeRectF(const Pts: array of TPointF): TRectF;
var
  Pt: TPointF;
begin
  Result.Left := $F000;
  Result.Top := $F000;
  Result.Right := -$F000;
  Result.Bottom := -$F000;
  for Pt in Pts do
  begin
    if Pt.X < Result.Left then
      Result.Left := Pt.X;
    if Pt.Y < Result.Top then
      Result.Top := Pt.Y;
    if Pt.X > Result.Right then
      Result.Right := Pt.X;
    if Pt.Y > Result.Bottom then
      Result.Bottom := Pt.Y;
  end;
end;

///////////////////////////////////////////
// START Observers
///////////////////////////////////////////

function TObservers.GetMultiCastObserver(const ID: Integer): IInterfaceList;
begin
  raise EObserverException.Create(sObserverNotAvailable);
end;

function TObservers.IsObserving(const ID: Integer): Boolean;
begin
  Result := False;
end;

//function TLinkObservers.GetEditLinkObserver: IEditLinkObserver;
//begin
//  raise EObserverException.Create(sObserverNotAvailable);
//end;

//class function TLinkObservers.GetEditGridLink(AObservers: TObservers): IEditGridLinkObserver;
//begin
//  raise EObserverException.Create(sObserverNotAvailable);
//end;

class function TLinkObservers.GetEditLink(AObservers: TObservers): IEditLinkObserver;
begin
  raise EObserverException.Create(sObserverNotAvailable);
end;

class procedure TLinkObservers.EditLinkUpdate(AObservers: TObservers);
begin
//  GetEditLink(AObservers).Update;
end;

class procedure TLinkObservers.EditLinkReset(AObservers: TObservers);
begin
//  GetEditLink(AObservers).Reset;
end;

class function TLinkObservers.EditLinkIsReadOnly(AObservers: TObservers): Boolean;
begin
  Result := False;
end;

class procedure TLinkObservers.EditLinkSetIsReadOnly(AObservers: TObservers; AValue: Boolean);
begin
//  GetEditLink(AObservers).IsReadOnly := AValue;
end;

class procedure TLinkObservers.EditLinkModified(AObservers: TObservers);
begin
//  GetEditLink(AObservers).Modified;
end;

class function TLinkObservers.EditLinkEdit(AObservers: TObservers): Boolean;
begin
//  Result := GetEditLink(AObservers).Edit;
end;

class function TLinkObservers.EditLinkIsEditing(AObservers: TObservers): Boolean;
begin
  Result := False;
end;

//class function TLinkObservers.EditLinkIsModified(AObservers: TObservers): Boolean;
//begin
//  Result := False;
//end;

class function TLinkObservers.EditLinkIsValidChar(AObservers: TObservers; AKey: Char): Boolean;
begin
  Result := False;
end;

class procedure TLinkObservers.EditGridLinkUpdate(AObservers: TObservers);
begin
//  GetEditGridLink(AObservers).Update;
end;

class procedure TLinkObservers.EditGridLinkReset(AObservers: TObservers);
begin
//  GetEditGridLink(AObservers).Reset;
end;

class function TLinkObservers.EditGridLinkIsReadOnly(AObservers: TObservers): Boolean;
begin
  Result := False;
end;

class procedure TLinkObservers.EditGridLinkSetIsReadOnly(AObservers: TObservers; AValue: Boolean);
begin
//  GetEditGridLink(AObservers).IsReadOnly := AValue;
end;

class procedure TLinkObservers.EditGridLinkModified(AObservers: TObservers);
begin
//  GetEditGridLink(AObservers).Modified;
end;

class function TLinkObservers.EditGridLinkEdit(AObservers: TObservers): Boolean;
begin
  Result := False;
end;

class function TLinkObservers.EditGridLinkIsEditing(AObservers: TObservers): Boolean;
begin
  Result := False;
end;

//class function TLinkObservers.EditGridLinkIsModified(AObservers: TObservers): Boolean;
//begin
//  Result := False;
//end;

class function TLinkObservers.EditGridLinkIsValidChar(AObservers: TObservers; AKey: Char): Boolean;
begin
  Result := False;
end;

class procedure TLinkObservers.PositionLinkPosChanged(AObservers: TObservers);
//var
//  LList: IInterfaceList;
//  LLookupObserver: IEditLookupLinkObserver;
//  I: Integer;
begin
//  LList := AObservers.GetMultiCastObserver(TObserverMapping.LookupLinkID);
//  for I := 0 to LList.Count - 1 do
//  begin
//    if Supports(LList[I], IEditLookupLinkObserver, LLookupObserver) then
//      LLookupObserver.PosChanged;
//  end;
end;

class procedure TLinkObservers.ListSelectionChanged(AObservers: TObservers);
begin
//  if AObservers.IsObserving(TObserverMapping.EditLinkID) then
//  begin
//    if TLinkObservers.EditLinkIsEditing(AObservers) then
//    begin
//      TLinkObservers.EditLinkModified(AObservers);
//      if AObservers.IsObserving(TObserverMapping.PositionLinkID) then
//        TLinkObservers.PositionLinkPosChanged(AObservers);
//    end
//    else
//      TLinkObservers.EditLinkReset(AObservers);
//  end
//  else if AObservers.IsObserving(TObserverMapping.PositionLinkID) then
//    TLinkObservers.PositionLinkPosChanged(AObservers);
end;

///////////////////////////////////////////
// END Observers
///////////////////////////////////////////



{$ENDIF}

