{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2012-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Macapi.OCBlocks;

interface

uses
  System.TypInfo;

type
  TObjCBlocks = class
  strict private
    class var BlockEvents: TArray<TMethod>;
    class var EventTypes: TArray<Pointer>;
    class var Blocks: TArray<Pointer>;
    class var Capacity: Integer;
    class var Current: Integer;
    class function GetBlockIndex: Integer;
    class procedure Grow;
  public
    class constructor Create;
    class destructor Destroy;
    class function SetEvent(const Value: TMethod; const TypeInfo: Pointer): Pointer;
    class function GetEvent(const Index: Integer): TMethod;
    class function GetEventType(const Index: Integer): Pointer;
    class procedure FreeBlocks(const Owner: TObject);
  end;

  TGetBlockType = class(TInterfacedObject)
  private
    FTypeInfo: PTypeInfo;
  public
    procedure XForm(Src: Pointer; Dest: Pointer);
    constructor Create(P: PTypeInfo);
  end;

implementation

uses Macapi.ObjectiveC, System.Rtti;

function GetObjCBlock(BlockNumber: Integer; ParamCount: Integer; DelphiProxy: Pointer): Pointer;
{$IF Defined(CPUARM)}
  cdecl; varargs; external 'librtlhelper.a' name 'GetObjCBlock';
{$ELSEIF Defined(CPUX64)}
  cdecl; external 'librtlhelper.a' name 'GetObjCBlock';
{$ELSE}
begin
  // macOS32
  Result := nil;
end;
{$ENDIF}

procedure FreeBlock(Block: Pointer);
{$IFDEF CPUARM}
  cdecl; varargs; external 'librtlhelper.a' name 'FreeBlock';
{$ELSEIF Defined(CPUX64)}
  cdecl; external 'librtlhelper.a' name 'FreeBlock';
{$ELSE}
begin
  // macOS32
end;
{$ENDIF}

procedure _objcblockcallbackallpointer(const Index: Integer; const Params: Pointer);
var
  Event: TMethod;
  MethodType: TRttiInvokableType;
  Context: TRttiContext;
  TypeInfo: PTypeInfo;
  TypeData: PTypeData;
  MethodValue: TValue;
  SourceArgs: PPointer;
  Args: TArray<TValue>;
  I: Integer;
  Par: TRttiParameter;
  Wrapped: IInterface;
begin
  Event := TObjCBlocks.GetEvent(Index);
  TypeInfo := TObjCBlocks.GetEventType(Index);
  TypeData := TypeInfo^.TypeData;

  Context := TRttiContext.Create;
  try
    MethodType := Context.GetType(TypeInfo) as TRttiInvokableType;
    TValue.Make(@Event, TypeInfo, MethodValue);
    SetLength(Args, TypeData^.ParamCount);
    SourceArgs := Params;
    I := 0;
    for Par in MethodType.GetParameters do
    begin
      if Par.ParamType.TypeKind = tkInterface then
      begin
        WrapInterFace(SourceArgs^, Par.ParamType.Handle, Wrapped);
        TValue.Make(@Wrapped, Par.ParamType.Handle, Args[I]);
      end
      else
        TValue.Make(SourceArgs, Par.ParamType.Handle, Args[I]);

      Inc(SourceArgs);
      Inc(I);
    end;
    MethodType.Invoke(MethodValue, Args);

  finally
    Context.Free;
  end;
end;

class constructor TObjCBlocks.Create;
begin
  Inherited;
  Capacity := 5;
  Current := 0;
  Grow;
end;

class destructor TObjCBlocks.Destroy;
var
  I: Integer;
begin
  for I := Low(Blocks) to High(Blocks) do
    if Blocks[I] <> nil then
      FreeBlock(Blocks[I]);
  Inherited;
end;

class procedure TObjCBlocks.FreeBlocks(const Owner: TObject);
var
  I: Integer;
begin
  for I := Low(BlockEvents) to High(BlockEvents) do
    if Owner = BlockEvents[I].Data then
    begin
      BlockEvents[I].Data := nil;
      FreeBlock(Blocks[I]);
      Blocks[I] := nil;
    end;
end;

class function TObjCBlocks.GetBlockIndex: Integer;
var
  I: Integer;
begin
  for I := Low(Blocks) to Current do
    if Blocks[I] = nil then
      Exit(I);

  Inc(Current);
  if Current >= Capacity then
    Grow;
  Result := Current;
end;

class function TObjCBlocks.GetEvent(const Index: Integer): TMethod;
begin
  Result := BlockEvents[Index];
end;

class function TObjCBlocks.GetEventType(const Index: Integer): Pointer;
begin
  Result := EventTypes[Index];
end;

class procedure TObjCBlocks.Grow;
begin
  Inc(Capacity, 5);
  SetLength(BlockEvents, Capacity);
  SetLength(EventTypes, Capacity);
  SetLength(Blocks, Capacity);
end;

class function TObjCBlocks.SetEvent(const Value: TMethod; const TypeInfo: Pointer): Pointer;
var
  Index: Integer;
begin
  Index := GetBlockIndex;
  BlockEvents[Index] := Value;
  EventTypes[Index] := TypeInfo;
  Result := GetObjCBlock(Index, PTypeInfo(TypeInfo)^.TypeData^.ParamCount, @_objcblockcallbackallpointer);
  Blocks[Index] := Result;
end;

constructor TGetBlockType.Create(P: PTypeInfo);
begin
  FTypeInfo := P;
end;

procedure TGetBlockType.XForm(Src: Pointer; Dest: Pointer);
var
  Method: ^TMethod;
begin
{$IFDEF OSX64}
  Method := Src;
{$ELSE !OSX64}
  Method := PPointer(Src)^;
{$ENDIF OSX64}
  if (Method^.Code = nil) and (Method^.Data = nil) then
    PPointer(Dest)^ := nil
  else
    PPointer(Dest)^ := TObjCBlocks.SetEvent(Method^, FTypeInfo)
end;

end.
