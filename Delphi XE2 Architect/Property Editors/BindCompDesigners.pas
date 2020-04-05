{*******************************************************}
{                                                       }
{             Delphi LiveBindings Framework             }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit BindCompDesigners;

interface

uses System.Classes, System.SysUtils, Data.Bind.Components, ColnEdit,
Generics.Collections, BindCompDsnResStrs, System.Bindings.EvalProtocol;

procedure Register;

type

 TBindCompDesigner = class(TInterfacedObject, IBindCompDesigner)
  private
  protected
    function IsReadOnly(ABindComp: TContainedBindComponent; AExpression: TBindCompDesignExpression): Boolean; overload; virtual;
    function IsReadOnly(ABindComp: TContainedBindComponent; AItem: TCollectionItem): Boolean; overload; virtual;
    function IsReadOnly(ABindComp: TContainedBindComponent; ACollection: TCollection): Boolean; overload; virtual;
    function GetDescription(ADataBinding: TContainedBindComponent): string; virtual;
    function CanBindComponent(ADataBindingClass: TContainedBindCompClass; AComponent: TComponent;
    ADesigner: IInterface): Boolean; virtual;
    function BindsComponent(ADataBinding: TContainedBindComponent; AComponent: TComponent): Boolean; virtual;
    function BindsComponentPropertyName(ADataBinding: TContainedBindComponent; const APropertyName: string): Boolean; virtual;
    function GetExpressions(ADataBinding: TContainedBindComponent; out ATypes: TBindCompDesignerExpressionTypes): TArray<TBindCompDesignExpression>; virtual;
    function GetExpressionCollections(ADataBinding: TContainedBindComponent): TArray<TBindCompDesignExpressionCollection>; virtual;
  end;


  TBindCompDelegateDesigner = class(TBindCompDesigner)
  private
    function TryGetDelegates(ADataBinding: TContainedBindComponent;
      out ADelegateComponent: TContainedBindComponent;
      out ADelegateDesigner: IBindCompDesigner): Boolean;
  protected
    function IsReadOnly(ABindComp: TContainedBindComponent; AExpression: TBindCompDesignExpression): Boolean; overload; override;
    function IsReadOnly(ABindComp: TContainedBindComponent; AItem: TCollectionItem): Boolean; overload;  override;
    function IsReadOnly(ABindComp: TContainedBindComponent; ACollection: TCollection): Boolean; overload;  override;
    function GetDelegate(ADataBinding: TContainedBindComponent): TContainedBindComponent; virtual; abstract;
    function GetDescription(ADataBinding: TContainedBindComponent): string; override;
    function GetExpressions(ADataBinding: TContainedBindComponent; out ATypes: TBindCompDesignerExpressionTypes): TArray<TBindCompDesignExpression>; override;
    function GetExpressionCollections(ADataBinding: TContainedBindComponent): TArray<TBindCompDesignExpressionCollection>; override;
  end;


  TBindDBFieldLinkDesigner = class(TBindCompDelegateDesigner)
  protected
    function GetDelegate(ADataBinding: TContainedBindComponent): TContainedBindComponent; override;
  end;

  TBindDBFieldLinkDesigner_NoParse = class(TBindDBFieldLinkDesigner)
  protected
    function GetExpressionCollections(ADataBinding: TContainedBindComponent): TArray<TBindCompDesignExpressionCollection>; override;
  end;

  TCommonBindComponentDesigner = class(TBindCompDesigner)
  private
  protected
     function FormatDisplayText(ABindComponent: TCommonBindComponent;
       const AFormatString: string): string; overload;
     function FormatDisplayText(ABindComponent: TCommonBindComponent;
       const AFormatString: string; ACount: Integer): string; overload;
    procedure ExecuteAssignToControlExpression(ABindComp: TCommonBindComponent;
      const AControlExpression, ASourceExpression: string;
      ACallback: TProc<IValue>; AType: TBindCompExpressionType = exprUnspecified);
    procedure ExecuteAssignToSourceExpression(ABindComp: TCommonBindComponent;
      const AControlExpression, ASourceExpression: string;
      ACallback: TProc<IValue>; AType: TBindCompExpressionType = exprUnspecified);
    function ControlScopeName(ABindComp: TCommonBindComponent): string;
    function SourceScopeName(ABindComp: TCommonBindComponent): string;
    function SourceMemberScopeName(ABindComp: TCommonBindComponent): string;

  end;

  TBindLinkDesigner = class(TCommonBindComponentDesigner)
  protected
    function GetDescription(ADataBinding: TContainedBindComponent): string; override;
    function GetExpressions(ADataBinding: TContainedBindComponent; out ATypes: TBindCompDesignerExpressionTypes): TArray<TBindCompDesignExpression>; override;
    function GetExpressionCollections(ADataBinding: TContainedBindComponent): TArray<TBindCompDesignExpressionCollection>; override;
  end;

  TBindExpressionDesigner = class(TCommonBindComponentDesigner)
  protected
    function GetDescription(ADataBinding: TContainedBindComponent): string; override;
    function GetExpressions(ADataBinding: TContainedBindComponent; out ATypes: TBindCompDesignerExpressionTypes): TArray<TBindCompDesignExpression>; override;
    function GetExpressionCollections(ADataBinding: TContainedBindComponent): TArray<TBindCompDesignExpressionCollection>; override;
  end;

  TBindExprItemsDesigner = class(TCommonBindComponentDesigner)
  protected
    function GetDescription(ADataBinding: TContainedBindComponent): string; override;
    function GetExpressions(ADataBinding: TContainedBindComponent; out ATypes: TBindCompDesignerExpressionTypes): TArray<TBindCompDesignExpression>; override;
    function GetExpressionCollections(ADataBinding: TContainedBindComponent): TArray<TBindCompDesignExpressionCollection>; override;
  end;

  TBindListDesigner = class(TCommonBindComponentDesigner)
  private
  protected
//    function FormatDisplayText(ABindList: TCustomBindList; const AFormatString: string): string;
    procedure AddExpressions(ABindComp: TCustomBindList;
      const AControlScopeName, ASourceScopeName, ASourceMemberScopeName: string;
      AList: TList<TBindCompDesignExpression>); virtual;
    procedure AddExpressionCollections(ABindList: TCustomBindList;
      AList: TList<TBindCompDesignExpressionCollection>); virtual;
    { IBindCompDesigner }
    function GetDescription(ADataBinding: TContainedBindComponent): string; override;
    function GetExpressions(ADataBinding: TContainedBindComponent; out ATypes: TBindCompDesignerExpressionTypes): TArray<TBindCompDesignExpression>; override;
    function GetExpressionCollections(ADataBinding: TContainedBindComponent): TArray<TBindCompDesignExpressionCollection>; override;
  end;

  TBindListLinkDesigner = class(TBindListDesigner)
  protected
    procedure AddExpressions(ABindComp: TCustomBindList;
      const AControlScopeName, ASourceScopeName, ASourceMemberScopeName: string;
      AList: TList<TBindCompDesignExpression>); override;
    procedure AddExpressionCollections(ABindList: TCustomBindList;
      AList: TList<TBindCompDesignExpressionCollection>); override;
    function GetDescription(ADataBinding: TContainedBindComponent): string; override;
  end;

  TBindPositionDesigner = class(TCommonBindComponentDesigner)
  protected
    function GetDescription(ADataBinding: TContainedBindComponent): string; override;
    function GetExpressions(ADataBinding: TContainedBindComponent; out ATypes: TBindCompDesignerExpressionTypes): TArray<TBindCompDesignExpression>; override;
    function GetExpressionCollections(ADataBinding: TContainedBindComponent): TArray<TBindCompDesignExpressionCollection>; override;
  end;


  TBindGridListDesigner = class(TCommonBindComponentDesigner)
  protected
    function GetDescription(ADataBinding: TContainedBindComponent): string; override;
    function GetExpressions(ADataBinding: TContainedBindComponent; out ATypes: TBindCompDesignerExpressionTypes): TArray<TBindCompDesignExpression>; override;
    function GetExpressionCollections(ADataBinding: TContainedBindComponent): TArray<TBindCompDesignExpressionCollection>; override;
  end;



  TBindGridLinkDesigner = class(TCommonBindComponentDesigner)
  protected
    function GetDescription(ADataBinding: TContainedBindComponent): string; override;
    function GetExpressions(ADataBinding: TContainedBindComponent; out ATypes: TBindCompDesignerExpressionTypes): TArray<TBindCompDesignExpression>; override;
    function GetExpressionCollections(ADataBinding: TContainedBindComponent): TArray<TBindCompDesignExpressionCollection>; override;
  end;


implementation

uses Data.Bind.DBLinks;

{ TBindCompDesigner }

function TBindCompDesigner.BindsComponent(
  ADataBinding: TContainedBindComponent; AComponent: TComponent): Boolean;
begin
  Assert(AComponent <> nil);
  Result := ADataBinding.ControlComponent = AComponent;
end;

function TBindCompDesigner.BindsComponentPropertyName(
  ADataBinding: TContainedBindComponent; const APropertyName: string): Boolean;
begin
  Result := APropertyName = 'ControlComponent'; // Do not localize
end;

function TBindCompDesigner.CanBindComponent(ADataBindingClass: TContainedBindCompClass; AComponent: TComponent;
    ADesigner: IInterface): Boolean;
begin
  Result := True;
end;

function TBindCompDesigner.GetDescription(ADataBinding: TContainedBindComponent): string;
begin
  Result := '';
end;

function TBindCompDesigner.GetExpressionCollections(
  ADataBinding: TContainedBindComponent): TArray<TBindCompDesignExpressionCollection>;
begin
  SetLength(Result, 0);
end;

function TBindCompDesigner.GetExpressions(ADataBinding: TContainedBindComponent; out ATypes: TBindCompDesignerExpressionTypes): TArray<TBindCompDesignExpression>;
begin
  ATypes := [TBindCompDesignerExpressionType.exprSourceToControl];
  SetLength(Result, 0);
end;


function TBindCompDesigner.IsReadOnly(ABindComp: TContainedBindComponent;
  AExpression: TBindCompDesignExpression): Boolean;
begin
  Result := False;
end;

function TBindCompDesigner.IsReadOnly(ABindComp: TContainedBindComponent; AItem: TCollectionItem): Boolean;
begin
  Result := False;
end;

function TBindCompDesigner.IsReadOnly(ABindComp: TContainedBindComponent; ACollection: TCollection): Boolean;
begin
  Result := False;
end;

{ TBindExpressionDesigner }


function TBindExpressionDesigner.GetDescription(
  ADataBinding: TContainedBindComponent): string;
//var
//  LControlScope: string;
//  LSourceScope: string;
//  LBindComp: TCustomBindExpression;
begin
  Assert(ADataBinding is TCustomBindExpression);
  Result := FormatDisplayText(TCommonBindComponent(ADataBinding),
    sBindExpressionDescription);
//  LBindComp := TCustomBindExpression(ADataBinding);
//  if LBindComp.SourceComponent <> nil then
//    LSourceScope := LBindComp.SourceComponent.Name;
//  if LBindComp.SourceMemberName <> '' then
//    LSourceScope := LSourceScope + ', ' + LBindComp.SourceMemberName;
//  if LBindComp.ControlComponent <> nil then
//    LControlScope := LBindComp.ControlComponent.Name;
//  Result := Format(sBindExpressionDescription, [LControlScope, LSourceScope]);
end;

function TBindExpressionDesigner.GetExpressionCollections(
  ADataBinding: TContainedBindComponent): TArray<TBindCompDesignExpressionCollection>;
begin
  SetLength(Result, 0);
end;

function TBindExpressionDesigner.GetExpressions(ADataBinding: TContainedBindComponent; out ATypes: TBindCompDesignerExpressionTypes): TArray<TBindCompDesignExpression>;
var
  LList: TList<TBindCompDesignExpression>;
  LBindComp: TCustomBindExpression;
  LControlScope: string;
  LSourceScope: string;
  LExpressionType: TBindCompDesignerExpressionType;
begin
  LBindComp := TCustomBindExpression(ADataBinding);
  Assert(LBindComp is TCustomBindExpression);
//  if LBindComp.Bidirectional then
//    ATypes := [TBindCompDesignerExpressionType.exprBidirectional]
//  else
//    ATypes := [TBindCompDesignerExpressionType.exprSourceToControl];
  ATypes := [exprSourceToControl, exprControlToSource, exprBidirectional];
  LList := TList<TBindCompDesignExpression>.Create;
//  if LBindComp.ControlComponent <> nil then
//    LControlScope := LBindComp.ControlComponent.Name
//  else
//    LControlScope := '';
//  if LBindComp.SourceComponent <> nil then
//    LSourceScope := LBindComp.SourceComponent.Name
//  else
//    LSourceScope := '';
  LControlScope := ControlScopeName(LBindComp);
  LSourceScope := SourceScopeName(LBindComp);
  try
    LExpressionType := exprBidirectional;
    case LBindComp.Direction of
      dirSourceToControl:
        LExpressionType := exprSourceToControl;
      dirControlToSource:
        LExpressionType := exprControlToSource;
      dirBidirectional:
        LExpressionType := exprBidirectional;
    else
      Assert(False);
    end;
//    if LBindComp.Bidirectional then
//      LExpressionType := TBindCompDesignerExpressionType.exprBidirectional
//    else
//      LExpressionType := TBindCompDesignerExpressionType.exprSourceToControl;


    LList.Add(TBindCompDesignExpression.Create(
      sFormat, LControlScope, LBindComp.ControlExpression,
      LSourceScope, LBindComp.SourceExpression,
      procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
      begin
          Assert((LBindComp.Direction = dirSourceToControl) or
            (LBindComp.Direction = dirBidirectional));
        ExecuteAssignToControlExpression(LBindComp, AControlExpression, ASourceExpression, ACallback);
//            LBindComp.ExecuteAssignToControlExpression(AControlExpression, ASourceExpression,
//            procedure(AValue: IValue)
//            begin
//              // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//            if AValue <> nil then
//              LBindComp.EvaluateControlExpression(AControlExpression, ACallback)
//            else
//              ACallback(AValue);
//            end);
      end,
      procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
      begin
          //Assert(LBindComp.Bidirectional);
          Assert((LBindComp.Direction = dirControlToSource) or
            (LBindComp.Direction = dirBidirectional));
          ExecuteAssignToSourceExpression(LBindComp, AControlExpression, ASourceExpression, ACallback);
//           LBindComp.ExecuteAssignToSourceExpression(AControlExpression, ASourceExpression,
//           procedure(AValue: IValue)
//           begin
//              // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//            if AValue <> nil then
//              LBindComp.EvaluateSourceExpression(ASourceExpression, ACallback)
//            else
//              ACallback(AValue)
//           end);
      end,
      procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
      begin
        LBindComp.EvaluateControlExpression(AExpression, ACallback);
      end,
      procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Source
      begin
        LBindComp.EvaluateSourceExpression(AExpression, ACallback);
      end,
      procedure(const AName: string; const AExpression: string)  // Save Control
      begin
        LBindComp.ControlExpression := AExpression;
      end,
      procedure(const AName: string; const AExpression: string)  // Save Source
      begin
        LBindComp.SourceExpression := AExpression;
      end,
      nil, // collectionitem);
      sExpression,
      nil, // parent collection item\
      LExpressionType));

    Result := LList.ToArray;
  finally
    LList.Free;
  end;
end;

{ TBindExprItemsDesigner }

function TBindExprItemsDesigner.GetDescription(
  ADataBinding: TContainedBindComponent): string;
var
//  LControlScope: string;
//  LSourceScope: string;
  LBindComp: TCustomBindExprItems;
  LCount: Integer;
begin
  Assert(ADataBinding is TCustomBindExprItems);
  LBindComp := TCustomBindExprItems(ADataBinding);
  LCount := LBindComp.FormatExpressions.Count + LBindComp.ClearExpressions.Count;
  Result := FormatDisplayText(LBindComp, sBindExprItemsDescription, LCount)
//  if LBindComp.SourceComponent <> nil then
//    LSourceScope := LBindComp.SourceComponent.Name;
//  if LBindComp.SourceMemberName <> '' then
//    LSourceScope := LSourceScope + ', ' + LBindComp.SourceMemberName;
//  if LBindComp.ControlComponent <> nil then
//    LControlScope := LBindComp.ControlComponent.Name;
//  Result := Format(sBindExprItemsDescription, [LControlScope, LSourceScope, LCount]);
end;

function TBindExprItemsDesigner.GetExpressionCollections(
  ADataBinding: TContainedBindComponent): TArray<TBindCompDesignExpressionCollection>;
begin
  SetLength(Result, 2);
  Assert(ADataBinding is TCustomBindExprItems);
  Result[0] := TBindCompDesignExpressionCollection.Create(sFormat, TCustomBindExprItems(ADataBinding).FormatExpressions);
  Result[1] := TBindCompDesignExpressionCollection.Create(sClear, TCustomBindExprItems(ADataBinding).ClearExpressions);
end;

function TBindExprItemsDesigner.GetExpressions(ADataBinding: TContainedBindComponent; out ATypes: TBindCompDesignerExpressionTypes): TArray<TBindCompDesignExpression>;
var
  LList: TList<TBindCompDesignExpression>;
  LBindComp: TCustomBindExprItems;
  LControlScope: string;
  LSourceScope: string;
  LIndex: Integer;
  LExpression: TExpressionItemDir;
  LExpressionType: TBindCompDesignerExpressionType;
begin
  LBindComp := TCustomBindExprItems(ADataBinding);
  Assert(LBindComp is TCustomBindExprItems);
//  if LBindComp.Bidirectional then
//    ATypes := [TBindCompDesignerExpressionType.exprBidirectional]
//  else
//    ATypes := [TBindCompDesignerExpressionType.exprSourceToControl];
  ATypes := [exprSourceToControl, exprControlToSource, exprBidirectional];
  LList := TList<TBindCompDesignExpression>.Create;
//  if LBindComp.ControlComponent <> nil then
//    LControlScope := LBindComp.ControlComponent.Name
//  else
//    LControlScope := '';
//  if LBindComp.SourceComponent <> nil then
//    LSourceScope := LBindComp.SourceComponent.Name
//  else
//    LSourceScope := '';
////  if LBindComp.SourceMemberName <> '' then
////    LSourceScope := LSourceScope + ', ' + LBindComp.SourceMemberName;

  LControlScope := ControlScopeName(LBindComp);
  LSourceScope := SourceScopeName(LBindComp);

  try
//    if LBindComp.Bidirectional then
//      LExpressionType := TBindCompDesignerExpressionType.exprBidirectional
//    else
//      LExpressionType := TBindCompDesignerExpressionType.exprSourceToControl;
    for LIndex := 0 to LBindComp.FormatExpressions.Count - 1 do
    begin
      LExpression := LBindComp.FormatExpressions[LIndex];
      LExpressionType := exprBidirectional;
      case LExpression.Direction of
        dirSourceToControl:
          LExpressionType := exprSourceToControl;
        dirControlToSource:
          LExpressionType := exprControlToSource;
        dirBidirectional:
          LExpressionType := exprBidirectional;
      else
        Assert(False);
      end;

      LList.Add(TBindCompDesignExpression.Create(
        IntToStr(LExpression.Index), LControlScope, LExpression.ControlExpression,
        LSourceScope, LExpression.SourceExpression,
      procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
      begin
//          Assert((LBindComp.Direction = dirSourceToControl) or
//            (LBindComp.Direction = dirBidirectional));
        ExecuteAssignToControlExpression(LBindComp,   AControlExpression, ASourceExpression,
          ACallback);
//            LBindComp.ExecuteAssignToControlExpression(AControlExpression, ASourceExpression,
//            procedure(AValue: IValue)
//              // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//            begin
//              if AValue <> nil then
//                LBindComp.EvaluateControlExpression(AControlExpression, ACallback)
//              else
//                ACallback(AValue);
//            end);
      end,
      procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
      begin
//          Assert((LBindComp.Direction = dirControlToSource) or
//            (LBindComp.Direction = dirBidirectional));
          ExecuteAssignToSourceExpression(LBindComp,   AControlExpression, ASourceExpression,
          ACallback);
//            LBindComp.ExecuteAssignToSourceExpression(AControlExpression, ASourceExpression,
//            procedure(AValue: IValue)
//            begin  // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//              if AValue <> nil then
//                LBindComp.EvaluateSourceExpression(ASourceExpression, ACallback)
//              else
//                ACallback(AValue)
//            end);
      end,
      procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
        begin
           LBindComp.EvaluateControlExpression(AExpression, ACallback);
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)   // Execute Source
        begin
          LBindComp.EvaluateSourceExpression(AExpression, ACallback);
        end,
        procedure(const AName: string; const AExpression: string)  // Save Control
        begin
          // Anon capture doesn't seem to work here for LIndex, so use name
          LBindComp.FormatExpressions[StrToInt(AName)].ControlExpression := AExpression;
        end,
        procedure(const AName: string; const AExpression: string)  // Save Source
        begin
          LBindComp.FormatExpressions[StrToInt(AName)].SourceExpression := AExpression;
        end,
        LExpression, // collectionitem);
        sFormat,
        nil, // parent collection item
        LExpressionType));

    end;
    for LIndex := 0 to LBindComp.ClearExpressions.Count - 1 do
    begin
      LExpression := LBindComp.ClearExpressions[LIndex];

      LExpressionType := exprBidirectional;
      case LExpression.Direction of
        dirSourceToControl,
        dirBidirectional:
          LExpressionType := exprSourceToControl;
        dirControlToSource:
          LExpressionType := exprControlToSource;
      else
        Assert(False);
      end;
      LList.Add(TBindCompDesignExpression.Create(
        IntToStr(LExpression.Index), LControlScope, LExpression.ControlExpression,
        LSourceScope, LExpression.SourceExpression,
        procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)   // Execute
        begin
          ExecuteAssignToControlExpression(LBindComp, AControlExpression, ASourceExpression,
            ACallback);
//              LBindComp.ExecuteAssignToControlExpression(AControlExpression, ASourceExpression,
//              procedure(AValue: IValue)
//                // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//              begin
//                if AValue <> nil then
//                   LBindComp.EvaluateControlExpression(AControlExpression, ACallback)
//                else
//                  ACallback(AValue);
//              end);
        end,
        procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)   // Execute
        begin
          ExecuteAssignToSourceExpression(LBindComp, AControlExpression, ASourceExpression,
            ACallback);
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
        begin
           LBindComp.EvaluateControlExpression(AExpression, ACallback);
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Source
        begin
          LBindComp.EvaluateSourceExpression(AExpression, ACallback);
        end,
        procedure(const AName: string; const AExpression: string)  // Save Control
        begin
          // Anon capture doesn't seem to work here for LIndex, so use name
          LBindComp.ClearExpressions[StrToInt(AName)].ControlExpression := AExpression;
        end,
        procedure(const AName: string; const AExpression: string)  // Save Source
        begin
          LBindComp.ClearExpressions[StrToInt(AName)].SourceExpression := AExpression;
        end,
        LExpression, // collectionitem);
        sClear,
        nil, // parent collection item
        LExpressionType));

    end;
    Result := LList.ToArray;
  finally
    LList.Free;
  end;
end;

{ TBindLinkDesigner }

function TBindLinkDesigner.GetDescription(
  ADataBinding: TContainedBindComponent): string;
var
//  LControlScope: string;
//  LSourceScope: string;
  LBindLink: TCustomBindLink;
begin
  Assert(ADataBinding is TCustomBindLink);
  LBindLink := TCustomBindLink(ADataBinding);
//  if LBindLink.SourceComponent <> nil then
//    LSourceScope := LBindLink.SourceComponent.Name;
//  if LBindLink.SourceMemberName <> '' then
//    LSourceScope := LSourceScope + ', ' + LBindLink.SourceMemberName;
//  if LBindLink.ControlComponent <> nil then
//    LControlScope := LBindLink.ControlComponent.Name;
//  Result := Format(sBindLinkDescription, [LControlScope, LSourceScope]);
  Result := FormatDisplayText(LBindLink, sBindLinkDescription);
end;

function TBindLinkDesigner.GetExpressionCollections(
  ADataBinding: TContainedBindComponent): TArray<TBindCompDesignExpressionCollection>;
begin
  SetLength(Result, 3);
  Assert(ADataBinding is TCustomBindLink);
  Result[0] := TBindCompDesignExpressionCollection.Create(sFormat, TCustomBindLink(ADataBinding).FormatExpressions);
  Result[1] := TBindCompDesignExpressionCollection.Create(sParse, TCustomBindLink(ADataBinding).ParseExpressions);
  Result[2] := TBindCompDesignExpressionCollection.Create(sClear, TCustomBindLink(ADataBinding).ClearExpressions);
end;

function TBindLinkDesigner.GetExpressions(ADataBinding: TContainedBindComponent; out ATypes: TBindCompDesignerExpressionTypes): TArray<TBindCompDesignExpression>;
var
  LList: TList<TBindCompDesignExpression>;
  LBindComp: TCustomBindLink;
  LControlScope: string;
  LSourceScope: string;
  LIndex: Integer;
  LExpression: TExpressionItem;
begin
  LBindComp := TCustomBindLink(ADataBinding);
  Assert(LBindComp is TCustomBindLink);
  ATypes := [TBindCompDesignerExpressionType.exprControlToSource, TBindCompDesignerExpressionType.exprSourceToControl];
  LList := TList<TBindCompDesignExpression>.Create;
//  if LBindComp.ControlComponent <> nil then
//    LControlScope := LBindComp.ControlComponent.Name
//  else
//    LControlScope := '';
//  if LBindComp.SourceComponent <> nil then
//    LSourceScope := LBindComp.SourceComponent.Name
//  else
//    LSourceScope := '';
//  if LBindComp.SourceMemberName <> '' then
//    LSourceScope := LSourceScope + ', ' + LBindComp.SourceMemberName;

  LControlScope := ControlScopeName(LBindComp);
  LSourceScope := SourceMemberScopeName(LBindComp);

  try


    for LIndex := 0 to LBindComp.FormatExpressions.Count - 1 do
    begin
      LExpression := LBindComp.FormatExpressions[LIndex];
      LList.Add(TBindCompDesignExpression.Create(
        IntToStr(LExpression.Index), LControlScope, LExpression.ControlExpression,
        LSourceScope, LExpression.SourceExpression,
        procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
        begin
          ExecuteAssignToControlExpression(LBindComp, AControlExpression, ASourceExpression,
            ACallback);
//              LBindComp.ExecuteAssignToControlExpression(AControlExpression, ASourceExpression,
//              procedure(AValue: IValue)
//              begin  // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//                if AValue <> nil then
//                  LBindComp.EvaluateControlExpression(AControlExpression, ACallback)
//                else
//                  ACallback(AValue)
//              end);
        end,
        nil,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
        begin
           LBindComp.EvaluateControlExpression(AExpression, ACallback);                        
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Source
        begin
          LBindComp.EvaluateSourceExpression(AExpression, ACallback);                         
        end,
        procedure(const AName: string; const AExpression: string)  // Save Control
        begin
          // Anon capture doesn't seem to work here for LIndex, so use name
          LBindComp.FormatExpressions[StrToInt(AName)].ControlExpression := AExpression;
        end,
        procedure(const AName: string; const AExpression: string)  // Save Source
        begin
          LBindComp.FormatExpressions[StrToInt(AName)].SourceExpression := AExpression;
        end,
        LExpression,
        SFormat,
      nil, // parent collection item
      exprSourceToControl));

    end;

    for LIndex := 0 to LBindComp.ParseExpressions.Count - 1 do
    begin
      LExpression := LBindComp.ParseExpressions[LIndex];
      LList.Add(TBindCompDesignExpression.Create(
        IntToStr(LExpression.Index),
        LControlScope, LExpression.ControlExpression,
        LSourceScope, LExpression.SourceExpression,
        nil,
        procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)   // Execute
        begin
          ExecuteAssignToSourceExpression(LBindComp, AControlExpression, ASourceExpression,
            ACallback);
//              LBindComp.ExecuteAssignToSourceExpression(AControlExpression, ASourceExpression,
//              procedure(AValue: IValue)
//              begin
//                // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//                if AValue <> nil then
//                  LBindComp.EvaluateSourceExpression(ASourceExpression, ACallback)
//                else
//                  ACallback(AValue)
//              end);
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
        begin
           LBindComp.EvaluateControlExpression(AExpression, ACallback);                        
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Source
        begin
          LBindComp.EvaluateSourceExpression(AExpression, ACallback);                         
        end,
        procedure(const AName: string; const AExpression: string)  // Save Control
        begin
          LBindComp.ParseExpressions[StrToInt(AName)].ControlExpression := AExpression;
        end,
        procedure(const AName: string; const AExpression: string)  // Save Source
        begin
          LBindComp.ParseExpressions[StrToInt(AName)].SourceExpression := AExpression;
        end,
        LExpression,
        SParse,
      nil, // parent collection item
      exprControlToSource));

    end;

    for LIndex := 0 to LBindComp.ClearExpressions.Count - 1 do
    begin
      LExpression := LBindComp.ClearExpressions[LIndex];
      LList.Add(TBindCompDesignExpression.Create(
        IntToStr(LExpression.Index),
        LControlScope, LExpression.ControlExpression,
        '', LExpression.SourceExpression,
        procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
        begin
          ExecuteAssignToControlExpression(LBindComp, AControlExpression, ASourceExpression,
            ACallback);
//              LBindComp.ExecuteAssignToControlExpression(AControlExpression, ASourceExpression,
//              procedure(AValue: IValue)
//              begin
//                // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//                if AValue <> nil then
//                  LBindComp.EvaluateControlExpression(AControlExpression, ACallback)
//                else
//                  ACallback(AValue)
//              end);
        end,
        nil,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
        begin
           LBindComp.EvaluateControlExpression(AExpression, ACallback);
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Source
        begin
          LBindComp.EvaluateSourceExpression(AExpression, ACallback);
        end,
        procedure(const AName: string; const AExpression: string)  // Save Control
        begin
          LBindComp.ClearExpressions[StrToInt(AName)].ControlExpression := AExpression;
        end,
        procedure(const AName: string; const AExpression: string)  // Save Source
        begin
          LBindComp.ClearExpressions[StrToInt(AName)].SourceExpression := AExpression;
        end,
        LExpression,
        SClear,
      nil, // parent collection item
      exprSourceToControl));

    end;

    Result := LList.ToArray;
  finally
    LList.Free;
  end;
end;

{ TBindListDesigner }


//function TBindListDesigner.FormatDisplayText(ABindList: TCustomBindList;
//  const AFormatString: string): string;
//var
//  LControlScope: string;
//  LSourceScope: string;
//begin
//  if ABindList.SourceComponent <> nil then
//    LSourceScope := ABindList.SourceComponent.Name;
//  if ABindList.SourceMemberName <> '' then
//    LSourceScope := LSourceScope + ', ' + ABindList.SourceMemberName;
//  if ABindList.ControlComponent <> nil then
//    LControlScope := ABindList.ControlComponent.Name;
//  Result := Format(AFormatString (*sBindListDescription*), [LControlScope, LSourceScope]);
//end;

function TBindListDesigner.GetDescription(
  ADataBinding: TContainedBindComponent): string;
var
  LBindList: TCustomBindList;
begin
  Assert(ADataBinding is TCustomBindList);
  LBindList := TCustomBindList(ADataBinding);
  Result := FormatDisplayText(LBindList, sBindListDescription);
end;


procedure TBindListDesigner.AddExpressionCollections(
  ABindList: TCustomBindList; AList: TList<TBindCompDesignExpressionCollection>);
begin
  AList.Add(TBindCompDesignExpressionCollection.Create(sFormatControl, ABindList.FormatControlExpressions));
  AList.Add(TBindCompDesignExpressionCollection.Create(sClearControl, ABindList.ClearControlExpressions));
  AList.Add(TBindCompDesignExpressionCollection.Create(sFormat, ABindList.FormatExpressions));
end;

function TBindListDesigner.GetExpressionCollections(
  ADataBinding: TContainedBindComponent): TArray<TBindCompDesignExpressionCollection>;
var
  LList: TList<TBindCompDesignExpressionCollection>;
begin
  LList := TList<TBindCompDesignExpressionCollection>.Create;
  try
    AddExpressionCollections(ADataBinding as TCustomBindList, LList);
    Result := LList.ToArray;
  finally
    LList.Free;
  end;
end;

procedure TBindListDesigner.AddExpressions(ABindComp: TCustomBindList;
  const AControlScopeName, ASourceScopeName, ASourceMemberScopeName: string; AList: TList<TBindCompDesignExpression>);
var
  LExpression: TExpressionItem;
  LIndex: Integer;
begin
  for LIndex := 0 to ABindComp.FormatExpressions.Count - 1 do
  begin
    LExpression := ABindComp.FormatExpressions[LIndex];
    AList.Add(TBindCompDesignExpression.Create(
      IntToStr(LExpression.Index), AControlScopeName, LExpression.ControlExpression,
      ASourceMemberScopeName, LExpression.SourceExpression,
      procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
      begin
          ExecuteAssignToControlExpression(ABindComp, AControlExpression, ASourceExpression,
            ACallback, TBindCompExpressionType.exprFill);
//            ABindComp.ExecuteAssignToControlExpression(AControlExpression, ASourceExpression,
//            procedure(AValue: IValue)
//            begin
//              // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//              if AValue <> nil then
//                ABindComp.EvaluateControlExpression(AControlExpression, ACallback, TBindCompExpressionType.exprFill)
//              else
//                ACallback(AValue)
//            end,
//              TBindCompExpressionType.exprFill);
      end,
      nil,
      procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
      begin
        ABindComp.EvaluateControlExpression(AExpression,
          ACallback, TBindCompExpressionType.exprFill);                        
      end,
      procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Source
      begin
        ABindComp.EvaluateSourceExpression(AExpression,
          ACallback,
          TBindCompExpressionType.exprFill);                         
      end,
      procedure(const AName: string; const AExpression: string)  // Save Control
      begin
        // Anon capture doesn't seem to work here for LIndex, so use name
        ABindComp.FormatExpressions[StrToInt(AName)].ControlExpression := AExpression;
      end,
      procedure(const AName: string; const AExpression: string)  // Save Source
      begin
        ABindComp.FormatExpressions[StrToInt(AName)].SourceExpression := AExpression;
      end,
      LExpression,
      '',
    nil, // parent collection item
    exprSourceToControl
));
  end;

  for LIndex := 0 to ABindComp.FormatControlExpressions.Count - 1 do
  begin
    LExpression := ABindComp.FormatControlExpressions[LIndex];
    AList.Add(TBindCompDesignExpression.Create(
      IntToStr(LExpression.Index), AControlScopeName, LExpression.ControlExpression,  // output
      ASourceScopeName, LExpression.SourceExpression,  // value
      procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
      begin
          ExecuteAssignToControlExpression(ABindComp, AControlExpression, ASourceExpression,
            ACallback, TBindCompExpressionType.exprFormatControl);
//            ABindComp.ExecuteAssignToControlExpression(AControlExpression, ASourceExpression,
//            procedure(AValue: IValue)
//              // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//            begin
//              if AValue <> nil then
//                ABindComp.EvaluateControlExpression(AControlExpression,
//                  ACallback, TBindCompExpressionType.exprPosControl)
//              else
//                ACallback(AValue)
//            end,
//              TBindCompExpressionType.exprPosControl);
      end,
      nil,
      procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
      begin
        ABindComp.EvaluateControlExpression(AExpression,
          ACallback, TBindCompExpressionType.exprFormatControl);                        
      end,
      procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Source
      begin
        ABindComp.EvaluateSourceExpression(AExpression,
          ACallback, TBindCompExpressionType.exprFormatControl);                         
      end,
      procedure(const AName: string; const AExpression: string)  // Save Control
      begin
        // Anon capture doesn't seem to work here for LIndex, so use name
        ABindComp.FormatControlExpressions[StrToInt(AName)].ControlExpression := AExpression;
      end,
      procedure(const AName: string; const AExpression: string)  // Save Source
      begin
        ABindComp.FormatControlExpressions[StrToInt(AName)].SourceExpression := AExpression;
      end,
      LExpression,
      '',
    nil, // parent collection item
    exprSourceToControl
));
  end;

  for LIndex := 0 to ABindComp.ClearControlExpressions.Count - 1 do
  begin
    LExpression := ABindComp.ClearControlExpressions[LIndex];
    AList.Add(TBindCompDesignExpression.Create(
      IntToStr(LExpression.Index), AControlScopeName, LExpression.ControlExpression,  // output
      ASourceScopeName, LExpression.SourceExpression,  // value
      procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
      begin
          ExecuteAssignToControlExpression(ABindComp, AControlExpression, ASourceExpression,
            ACallback, TBindCompExpressionType.exprFormatControl);
//            ABindComp.ExecuteAssignToControlExpression(AControlExpression, ASourceExpression,
//            procedure(AValue:IValue)
//              // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//            begin
//              if AValue <> nil then
//                ABindComp.EvaluateControlExpression(AControlExpression,
//                  ACallback, TBindCompExpressionType.exprPosControl)
//              else
//                ACallback(AValue)
//            end,
//              TBindCompExpressionType.exprPosControl);
      end,
      nil,
      procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
      begin
        ABindComp.EvaluateControlExpression(AExpression,
          ACallback, TBindCompExpressionType.exprFormatControl);                        
      end,
      procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Source
      begin
        ABindComp.EvaluateSourceExpression(AExpression,
          ACallback,
          TBindCompExpressionType.exprFormatControl);                         
      end,
      procedure(const AName: string; const AExpression: string)  // Save Control
      begin
        // Anon capture doesn't seem to work here for LIndex, so use name
        ABindComp.ClearControlExpressions[StrToInt(AName)].ControlExpression := AExpression;
      end,
      procedure(const AName: string; const AExpression: string)  // Save Source
      begin
        ABindComp.ClearControlExpressions[StrToInt(AName)].SourceExpression := AExpression;
      end,
      LExpression,
      '',
    nil, // parent collection item
    exprSourceToControl
));
  end;

end;

function TBindListDesigner.GetExpressions(ADataBinding: TContainedBindComponent; out ATypes: TBindCompDesignerExpressionTypes): TArray<TBindCompDesignExpression>;
var
  LList: TList<TBindCompDesignExpression>;
  LBindComp: TCustomBindList;
  LControlScope: string;
  LSourceScope: string;
  LSourceMemberScope: string;
begin
  LBindComp := TCustomBindList(ADataBinding);
  Assert(LBindComp is TCustomBindList);
  ATypes := [TBindCompDesignerExpressionType.exprSourceToControl];
  LList := TList<TBindCompDesignExpression>.Create;
//  if LBindComp.ControlComponent <> nil then
//    LControlScope := LBindComp.ControlComponent.Name
//  else
//    LControlScope := '';
//  if LBindComp.SourceComponent <> nil then
//    LSourceScope := LBindComp.SourceComponent.Name
//  else
//    LSourceScope := '';
//  LSourceMemberScope := LSourceScope;
//  if LBindComp.SourceMemberName <> '' then
//    LSourceMemberScope := LSourceMemberScope + ', ' + LBindComp.SourceMemberName;
  LControlScope := ControlScopeName(LBindComp);
  LSourceScope := SourceScopeName(LBindComp);
  LSourceMemberScope := SourceMemberScopeName(LBindComp);

  try
    AddExpressions(LBindComp, LControlScope, LSourceScope, LSourceMemberScope, LList);

    Result := LList.ToArray;
  finally
    LList.Free;
  end;
end;

{ TBindPositionDesigner }


function TBindPositionDesigner.GetDescription(
  ADataBinding: TContainedBindComponent): string;
var
//  LControlScope: string;
//  LSourceScope: string;
  LBindComp: TCustomBindPosition;
begin
  Assert(ADataBinding is TCustomBindPosition);
  LBindComp := TCustomBindPosition(ADataBinding);
//  if LBindComp.SourceComponent <> nil then
//    LSourceScope := LBindComp.SourceComponent.Name;
//  if LBindComp.SourceMemberName <> '' then
//    LSourceScope := LSourceScope + ', ' + LBindComp.SourceMemberName;
//  if LBindComp.ControlComponent <> nil then
//    LControlScope := LBindComp.ControlComponent.Name;
  Result := FormatDisplayText(LBindComp, sBindPositionDescription);
end;


function TBindPositionDesigner.GetExpressionCollections(
  ADataBinding: TContainedBindComponent): TArray<TBindCompDesignExpressionCollection>;
begin
  SetLength(Result, 3);
  Assert(ADataBinding is TCustomBindPosition);
  Result[0] := TBindCompDesignExpressionCollection.Create(sPosControl, TCustomBindPosition(ADataBinding).PosControlExpressions);
  Result[1] := TBindCompDesignExpressionCollection.Create(sPosSource, TCustomBindPosition(ADataBinding).PosSourceExpressions);
  Result[2] := TBindCompDesignExpressionCollection.Create(sPosClear, TCustomBindPosition(ADataBinding).PosClearExpressions);
end;

function TBindPositionDesigner.GetExpressions(ADataBinding: TContainedBindComponent; out ATypes: TBindCompDesignerExpressionTypes): TArray<TBindCompDesignExpression>;
var
  LList: TList<TBindCompDesignExpression>;
  LBindComp: TCustomBindPosition;
  LControlScope: string;
  LSourceScope: string;
  LExpression: TExpressionItem;
  LIndex: Integer;
begin
  LBindComp := TCustomBindPosition(ADataBinding);
  Assert(LBindComp is TCustomBindPosition);
  ATypes := [TBindCompDesignerExpressionType.exprControlToSource, TBindCompDesignerExpressionType.exprSourceToControl];
  LList := TList<TBindCompDesignExpression>.Create;
//  if LBindComp.ControlComponent <> nil then
//    LControlScope := LBindComp.ControlComponent.Name
//  else
//    LControlScope := '';
//  if LBindComp.SourceComponent <> nil then
//    LSourceScope := LBindComp.SourceComponent.Name
//  else
//    LSourceScope := '';
//  if LBindComp.SourceMemberName <> '' then
//    LSourceScope := LSourceScope + ', ' + LBindComp.SourceMemberName;
  LControlScope := ControlScopeName(LBindComp);
  LSourceScope := SourceMemberScopeName(LBindComp);

  SetLength(Result, 0);
  try

    for LIndex := 0 to LBindComp.PosControlExpressions.Count - 1 do
    begin
      LExpression := LBindComp.PosControlExpressions[LIndex];
      LList.Add(TBindCompDesignExpression.Create(
        IntToStr(LExpression.Index), LControlScope, LExpression.ControlExpression,  // output
        LSourceScope, LExpression.SourceExpression,  // value
        procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
        begin
          ExecuteAssignToControlExpression(LBindComp, AControlExpression, ASourceExpression,
            ACallback, TBindCompExpressionType.exprPosControl);
//              LBindComp.ExecuteAssignToControlExpression(AControlExpression, ASourceExpression,
//              procedure(AValue: IValue)
//                // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//              begin
//                if AValue <> nil then
//                  LBindComp.EvaluateControlExpression(AControlExpression,
//                  ACallback, TBindCompExpressionType.exprPosControl)
//                else
//                  ACallback(AValue)
//              end,
//              TBindCompExpressionType.exprPosControl);
        end,
        nil,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
        begin
          LBindComp.EvaluateControlExpression(AExpression,
          ACallback, TBindCompExpressionType.exprPosControl);                        
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Source
        begin
          LBindComp.EvaluateSourceExpression(AExpression,
            ACallback, TBindCompExpressionType.exprPosControl);                         
        end,
        procedure(const AName: string; const AExpression: string)  // Save Source
        begin
          // Anon capture doesn't seem to work here for LIndex, so use name
          LBindComp.PosControlExpressions[StrToInt(AName)].ControlExpression := AExpression;
        end,
        procedure(const AName: string; const AExpression: string)  // Save Source
        begin
          LBindComp.PosControlExpressions[StrToInt(AName)].SourceExpression := AExpression;
        end,
        LExpression,
        '',
      nil, // parent collection item
      exprSourceToControl
));
    end;

    for LIndex := 0 to LBindComp.PosClearExpressions.Count - 1 do
    begin
      LExpression := LBindComp.PosClearExpressions[LIndex];
      LList.Add(TBindCompDesignExpression.Create(
        IntToStr(LExpression.Index), LControlScope, LExpression.ControlExpression,  // output
        LSourceScope, LExpression.SourceExpression,  // value
        procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
        begin
          ExecuteAssignToControlExpression(LBindComp, AControlExpression, ASourceExpression,
            ACallback, TBindCompExpressionType.exprPosControl);
//              LBindComp.ExecuteAssignToControlExpression(AControlExpression, ASourceExpression,
//              procedure(AValue: IValue)
//              begin
//                // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//                if AValue <> nil then
//                  LBindComp.EvaluateControlExpression(AControlExpression,
//                    ACallback, TBindCompExpressionType.exprPosControl)
//                else
//                  ACallback(AValue)
//              end,
//              TBindCompExpressionType.exprPosControl);
        end,
        nil,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
        begin
          LBindComp.EvaluateControlExpression(AExpression,
            ACallback, TBindCompExpressionType.exprPosControl);                        
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Source
        begin
          LBindComp.EvaluateSourceExpression(AExpression,
            ACallback,
            TBindCompExpressionType.exprPosControl);                         
        end,
        procedure(const AName: string; const AExpression: string)  // Save Control
        begin
          // Anon capture doesn't seem to work here for LIndex, so use name
          LBindComp.PosClearExpressions[StrToInt(AName)].ControlExpression := AExpression;
        end,
        procedure(const AName: string; const AExpression: string)  // Save Source
        begin
          LBindComp.PosClearExpressions[StrToInt(AName)].SourceExpression := AExpression;
        end,
        LExpression,
        '',
      nil, // parent collection item
      exprSourceToControl
));
    end;


    for LIndex := 0 to LBindComp.PosSourceExpressions.Count - 1 do
    begin
      LExpression := LBindComp.PosSourceExpressions[LIndex];
      LList.Add(TBindCompDesignExpression.Create(
        IntToStr(LExpression.Index),
        LControlScope, LExpression.ControlExpression,
        LSourceScope, LExpression.SourceExpression,
        nil,
        procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
        begin
          ExecuteAssignToSourceExpression(LBindComp, AControlExpression, ASourceExpression,
            ACallback, TBindCompExpressionType.exprPosSource);
//              LBindComp.ExecuteAssignToSourceExpression(AControlExpression, ASourceExpression,
//              procedure(AValue: IValue)
//                // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//              begin
//                if AValue <> nil then
//                  LBindComp.EvaluateSourceExpression(ASourceExpression,
//                    ACallback, TBindCompExpressionType.exprPosSource)
//                else
//                  ACallback(AValue)
//              end,
//              TBindCompExpressionType.exprPosSource);
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
        begin
          LBindComp.EvaluateControlExpression(AExpression,
              ACallback,
            TBindCompExpressionType.exprPosSource);                         
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Source
        begin
          LBindComp.EvaluateSourceExpression(AExpression,
            ACallback, TBindCompExpressionType.exprPosSource);                        
        end,
        procedure(const AName: string; const AExpression: string)  // Save Control
        begin
          // Anon capture doesn't seem to work here for LIndex, so use name
          LBindComp.PosSourceExpressions[StrToInt(AName)].ControlExpression := AExpression;
        end,
        procedure(const AName: string; const AExpression: string)  // Save Source
        begin
          LBindComp.PosSourceExpressions[StrToInt(AName)].SourceExpression := AExpression;
        end,
        LExpression,
        '',
      nil, // parent collection item
      exprControlToSource
));
    end;



    Result := LList.ToArray;
  finally
    LList.Free;
  end;
end;



{ TBindColumnListDesigner }


function TBindGridListDesigner.GetDescription(
  ADataBinding: TContainedBindComponent): string;
var
//  LControlScope: string;
//  LSourceScope: string;
  LBindColumns: TCustomBindGridList;
begin
  Assert(ADataBinding is TCustomBindGridList);
  LBindColumns := TCustomBindGridList(ADataBinding);
//  if LBindColumns.SourceComponent <> nil then
//    LSourceScope := LBindColumns.SourceComponent.Name;
////      if AColumnExpressionItem.SourceMemberName <> '' then
////        LSourceScope := LSourceScope + ', ' + AColumnExpressionItem.SourceMemberName;
//  if LBindColumns.ControlComponent <> nil then
//    LControlScope := LBindColumns.ControlComponent.Name;
  Result := FormatDisplayText(LBindColumns, sBindListDescription);
end;

function TBindGridListDesigner.GetExpressionCollections(
  ADataBinding: TContainedBindComponent): TArray<TBindCompDesignExpressionCollection>;
var
  I: Integer;
  LBindComp: TCustomBindGridList;
  LColumnExpressionItem: TColumnFormatExpressionItem;
  LList: TList<TBindCompDesignExpressionCollection>;
begin
  Assert(ADataBinding is TCustomBindGridList);
  LBindComp := TCustomBindGridList(ADataBinding);
  LList := TList<TBindCompDesignExpressionCollection>.Create;
  try
    LList.Add(TBindCompDesignExpressionCollection.Create(sFormatControl, LBindComp.FormatControlExpressions));
    LList.Add(TBindCompDesignExpressionCollection.Create(sClearControl, LBindComp.ClearControlExpressions));
    LList.Add(TBindCompDesignExpressionCollection.Create
      (sColumns, LBindComp.ColumnExpressions, nil, colCollections));
    for I := 0 to LBindComp.ColumnExpressions.Count - 1 do
    begin
      LColumnExpressionItem := TColumnFormatExpressionItem(LBindComp.ColumnExpressions[I]);
      LList.Add(TBindCompDesignExpressionCollection.Create
        (sFormatColumn, LColumnExpressionItem.FormatColumnExpressions, LColumnExpressionItem));
      LList.Add(TBindCompDesignExpressionCollection.Create
        (sFormatCell, LColumnExpressionItem.FormatCellExpressions, LColumnExpressionItem));
    end;
    Result := LList.ToArray;
  finally
    LList.Free;
  end;
end;

function TBindGridListDesigner.GetExpressions(ADataBinding: TContainedBindComponent; out ATypes: TBindCompDesignerExpressionTypes): TArray<TBindCompDesignExpression>;
var
  LBindComp: TCustomBindGridList;

  function GetSaveControlExpressionProc(AExpressionItem: TExpressionItem): TBindCompDesignExpression.TSaveDesignExpression;
  begin
    Result :=
      procedure(const AName: string; const AExpressionText: string)  // Save Output
      begin
        AExpressionItem.ControlExpression := AExpressionText;
      end;
  end;

  function GetSaveSourceExpressionProc(AExpressionItem: TExpressionItem): TBindCompDesignExpression.TSaveDesignExpression;
  begin
    Result :=
      procedure(const AName: string; const AExpressionText: string)  // Save Output
      begin
        AExpressionItem.SourceExpression := AExpressionText;
      end;
  end;

  procedure AddExpressions(AList: TList<TBindCompDesignExpression>; AColumnExpressionItem: TColumnFormatExpressionItem;
    const AName: string; AExpressions: TExpressions; AType: TBindCompExpressionType;
    ADirection: TBindCompDesignerExpressionType);
  var
    LControlScope: string;
    LSourceScope: string;
    LExpression: TExpressionItem;
    LIndex: Integer;
    LSaveControl: TBindCompDesignExpression.TSaveDesignExpression;
    LSaveSource: TBindCompDesignExpression.TSaveDesignExpression;
  begin
//    if LBindComp.ControlComponent <> nil then
//      LControlScope := LBindComp.ControlComponent.Name
//    else
//      LControlScope := '';
//    if LBindComp.SourceComponent <> nil then
//      LSourceScope := LBindComp.SourceComponent.Name
//    else
//      LSourceScope := '';
    LControlScope := ControlScopeName(LBindComp);
    LSourceScope := SourceScopeName(LBindComp);
    if AColumnExpressionItem.SourceMemberName <> '' then
      LSourceScope := LSourceScope + ', ' + AColumnExpressionItem.SourceMemberName;

    for LIndex := 0 to AExpressions.Count - 1 do
    begin
      LExpression := AExpressions[LIndex];
      LSaveSource := GetSaveSourceExpressionProc(LExpression);
      LSaveControl := GetSaveControlExpressionProc(LExpression);

      AList.Add(TBindCompDesignExpression.Create(
        IntToStr(LExpression.Index), LControlScope, LExpression.ControlExpression,
        LSourceScope, LExpression.SourceExpression,
        procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
        begin
              LBindComp.ExecuteAssignToControlExpression(AColumnExpressionItem, AControlExpression, ASourceExpression,
              procedure(AValue: IValue)
              begin
                // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
                if AValue <> nil then
                  LBindComp.EvaluateControlExpression(AColumnExpressionItem, AControlExpression,
                  ACallback, AType)
                else
                  ACallback(AValue)
              end, AType);
        end,
        procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
        begin
              LBindComp.ExecuteAssignToSourceExpression(AColumnExpressionItem, AControlExpression, ASourceExpression,
              procedure(AValue: IValue)
              begin
                // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
                if AValue <> nil then
                  LBindComp.EvaluateSourceExpression(AColumnExpressionItem, ASourceExpression,
                    ACallback, AType)
                else
                  ACallback(AValue)
              end, AType);
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
        begin
            LBindComp.EvaluateControlExpression(AColumnExpressionItem, AExpression,
              ACallback, AType);
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Source
        begin
            LBindComp.EvaluateSourceExpression(AColumnExpressionItem, AExpression,
              ACallback, AType);
        end,
        LSaveControl,  // Save Control
        LSaveSource,  // Save Source
        LExpression,
        AName,
      AColumnExpressionItem, // parent collection item
      ADirection));
    end;
  end;

  procedure AddControlExpressions(LList: TList<TBindCompDesignExpression>);
  var
    LIndex: Integer;
    LExpression: TExpressionItem;
    LSourceScope: string;
    LControlScope: string;
  begin
//  if LBindComp.ControlComponent <> nil then
//    LControlScope := LBindComp.ControlComponent.Name
//  else
//    LControlScope := '';
//  if LBindComp.SourceComponent <> nil then
//    LSourceScope := LBindComp.SourceComponent.Name
//  else
//    LSourceScope := '';

    LControlScope := ControlScopeName(LBindComp);
    LSourceScope := SourceScopeName(LBindComp);
    for LIndex := 0 to LBindComp.FormatControlExpressions.Count - 1 do
    begin
      LExpression := LBindComp.FormatControlExpressions[LIndex];
      LList.Add(TBindCompDesignExpression.Create(
        IntToStr(LExpression.Index), LControlScope, LExpression.ControlExpression,  // output
        LSourceScope, LExpression.SourceExpression,  // value
        procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
        begin
          ExecuteAssignToControlExpression(LBindComp, AControlExpression, ASourceExpression,
            ACallback, TBindCompExpressionType.exprFormatControl);
//              LBindComp.ExecuteAssignToControlExpression(AControlExpression, ASourceExpression,
//              procedure(AValue: IValue)
//              begin
//                // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//                if AValue <> nil then
//                  LBindComp.EvaluateControlExpression(AControlExpression, ACallback, TBindCompExpressionType.exprPosControl)
//                else
//                  ACallback(AValue)
//              end, TBindCompExpressionType.exprFormatControl);
        end,
        nil,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
        begin
          LBindComp.EvaluateControlExpression(AExpression,
            ACallback, TBindCompExpressionType.exprFormatControl);                        
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Source
        begin
          LBindComp.EvaluateSourceExpression(AExpression,
            ACallback, TBindCompExpressionType.exprFormatControl);                         
        end,
        procedure(const AName: string; const AExpression: string)  // Save Control
        begin
          // Anon capture doesn't seem to work here for LIndex, so use name
          LBindComp.FormatControlExpressions[StrToInt(AName)].ControlExpression := AExpression;
        end,
        procedure(const AName: string; const AExpression: string)  // Save Source
        begin
          LBindComp.FormatControlExpressions[StrToInt(AName)].SourceExpression := AExpression;
        end,
        LExpression,
        '',
      nil, // parent collection item
      exprSourceToControl));
    end;

    for LIndex := 0 to LBindComp.ClearControlExpressions.Count - 1 do
    begin
      LExpression := LBindComp.ClearControlExpressions[LIndex];
      LList.Add(TBindCompDesignExpression.Create(
        IntToStr(LExpression.Index), LControlScope, LExpression.ControlExpression,  // output
        LSourceScope, LExpression.SourceExpression,  // value
        procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
        begin
          ExecuteAssignToControlExpression(LBindComp, AControlExpression, ASourceExpression,
            ACallback, TBindCompExpressionType.exprFormatControl);
//              LBindComp.ExecuteAssignToControlExpression(AControlExpression, ASourceExpression,
//              procedure(AValue: IValue)
//              begin  // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//                if AValue <> nil then
//                  LBindComp.EvaluateControlExpression(AControlExpression,
//                    ACallback, TBindCompExpressionType.exprPosControl)
//                else
//                  ACallback(AValue);
//              end, TBindCompExpressionType.exprPosControl);
        end,
        nil,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
        begin
          LBindComp.EvaluateControlExpression(AExpression,
            ACallback, TBindCompExpressionType.exprFormatControl);                        
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Source
        begin
          LBindComp.EvaluateSourceExpression(AExpression,
            ACallback,
            TBindCompExpressionType.exprPosControl);                         
        end,
        procedure(const AName: string; const AExpression: string)  // Save Control
        begin
          // Anon capture doesn't seem to work here for LIndex, so use name
          LBindComp.ClearControlExpressions[StrToInt(AName)].ControlExpression := AExpression;
        end,
        procedure(const AName: string; const AExpression: string)  // Save Source
        begin
          LBindComp.ClearControlExpressions[StrToInt(AName)].SourceExpression := AExpression;
        end,
        LExpression,
        '',
      nil, // parent collection item
      exprSourceToControl));
    end;


  end;

var
  LList: TList<TBindCompDesignExpression>;
  I: Integer;
  LColumnExpressionItem: TColumnFormatExpressionItem;

begin
  LBindComp := TCustomBindGridList(ADataBinding);
  Assert(LBindComp is TCustomBindGridList);
  ATypes := [TBindCompDesignerExpressionType.exprSourceToControl];
  LList := TList<TBindCompDesignExpression>.Create;
  SetLength(Result, 0);
  try

    for I := 0 to LBindComp.ColumnExpressions.Count - 1 do
    begin
      LColumnExpressionItem := TColumnFormatExpressionItem(LBindComp.ColumnExpressions[I]);
      AddExpressions(LList, LColumnExpressionItem, sFormatColumn,
        LColumnExpressionItem.FormatColumnExpressions, TBindCompExpressionType.exprFormatColumn,
        exprSourceToControl);
      AddExpressions(LList, LColumnExpressionItem, sFormatCell,
        LColumnExpressionItem.FormatCellExpressions, TBindCompExpressionType.exprFill,
        exprSourceToControl);
    end;


    AddControlExpressions(LList);

    Result := LList.ToArray;
  finally
    LList.Free;
  end;
end;

{ TBindColumnDesigner }

function TBindGridLinkDesigner.GetDescription(
  ADataBinding: TContainedBindComponent): string;
var
//  LControlScope: string;
//  LSourceScope: string;
  LBindColumns: TCustomBindGridLink;
begin
  Assert(ADataBinding is TCustomBindGridLink);
  LBindColumns := TCustomBindGridLink(ADataBinding);
//  if LBindColumns.SourceComponent <> nil then
//    LSourceScope := LBindColumns.SourceComponent.Name;
////      if AColumnExpressionItem.SourceMemberName <> '' then
////        LSourceScope := LSourceScope + ', ' + AColumnExpressionItem.SourceMemberName;
//  if LBindColumns.ControlComponent <> nil then
//    LControlScope := LBindColumns.ControlComponent.Name;
  Result := FormatDisplayText(LBindColumns, sBindGridLinkDescription);
end;

function TBindGridLinkDesigner.GetExpressionCollections(
  ADataBinding: TContainedBindComponent): TArray<TBindCompDesignExpressionCollection>;
var
  I: Integer;
  LBindComp: TCustomBindGridLink;
  LColumnExpressionItem: TColumnLinkExpressionItem;
  LList: TList<TBindCompDesignExpressionCollection>;
begin
  Assert(ADataBinding is TCustomBindGridLink);
  LBindComp := TCustomBindGridLink(ADataBinding);
  LList := TList<TBindCompDesignExpressionCollection>.Create;
  try
    LList.Add(TBindCompDesignExpressionCollection.Create(sFormatControl, LBindComp.FormatControlExpressions));
    LList.Add(TBindCompDesignExpressionCollection.Create(sClearControl, LBindComp.ClearControlExpressions));
    LList.Add(TBindCompDesignExpressionCollection.Create(sPosControl, LBindComp.PosControlExpressions));
    LList.Add(TBindCompDesignExpressionCollection.Create(sPosSource, LBindComp.PosSourceExpressions));
    LList.Add(TBindCompDesignExpressionCollection.Create
      (sColumns, LBindComp.ColumnExpressions, nil, colCollections));
    for I := 0 to LBindComp.ColumnExpressions.Count - 1 do
    begin
      LColumnExpressionItem := TColumnLinkExpressionItem(LBindComp.ColumnExpressions[I]);
      LList.Add(TBindCompDesignExpressionCollection.Create
        (sFormatColumn, LColumnExpressionItem.FormatColumnExpressions, LColumnExpressionItem));
      LList.Add(TBindCompDesignExpressionCollection.Create
        (sFormatCell, LColumnExpressionItem.FormatCellExpressions, LColumnExpressionItem));
      LList.Add(TBindCompDesignExpressionCollection.Create
        (sParseCell, LColumnExpressionItem.ParseCellExpressions, LColumnExpressionItem));
    end;
    Result := LList.ToArray;
  finally
    LList.Free;
  end;
end;

function TBindGridLinkDesigner.GetExpressions(ADataBinding: TContainedBindComponent; out ATypes: TBindCompDesignerExpressionTypes): TArray<TBindCompDesignExpression>;
var
  LBindComp: TCustomBindGridLink;

  function GetSaveControlExpressionProc(AExpressionItem: TExpressionItem): TBindCompDesignExpression.TSaveDesignExpression;
  begin
    Result :=
      procedure(const AName: string; const AExpressionText: string)  // Save Output
      begin
        AExpressionItem.ControlExpression := AExpressionText;
      end;
  end;

  function GetSaveSourceExpressionProc(AExpressionItem: TExpressionItem): TBindCompDesignExpression.TSaveDesignExpression;
  begin
    Result :=
      procedure(const AName: string; const AExpressionText: string)  // Save Output
      begin
        AExpressionItem.SourceExpression := AExpressionText;
      end;
  end;

  procedure AddExpressions(AList: TList<TBindCompDesignExpression>; AColumnExpressionItem: TColumnLinkExpressionItem;
    const AName: string; AExpressions: TExpressions; AType: TBindCompExpressionType;
    ADirection: TBindCompDesignerExpressionType);
  var
    LControlScope: string;
    LSourceScope: string;
    LExpression: TExpressionItem;
    LIndex: Integer;
    LSaveControl: TBindCompDesignExpression.TSaveDesignExpression;
    LSaveSource: TBindCompDesignExpression.TSaveDesignExpression;
  begin
//    if LBindComp.ControlComponent <> nil then
//      LControlScope := LBindComp.ControlComponent.Name
//    else
//      LControlScope := '';
//    if LBindComp.SourceComponent <> nil then
//      LSourceScope := LBindComp.SourceComponent.Name
//    else
//      LSourceScope := '';
    LControlScope := ControlScopeName(LBindComp);
    LSourceScope := SourceScopeName(LBindComp);
    if AColumnExpressionItem.SourceMemberName <> '' then
      LSourceScope := LSourceScope + ', ' + AColumnExpressionItem.SourceMemberName;

    for LIndex := 0 to AExpressions.Count - 1 do
    begin
      LExpression := AExpressions[LIndex];
        LSaveSource := GetSaveSourceExpressionProc(LExpression);
        LSaveControl := GetSaveControlExpressionProc(LExpression);

      AList.Add(TBindCompDesignExpression.Create(
        IntToStr(LExpression.Index), LControlScope, LExpression.ControlExpression,
        LSourceScope, LExpression.SourceExpression,
        procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
        begin
              LBindComp.ExecuteAssignToControlExpression(AColumnExpressionItem, AControlExpression, ASourceExpression,
              procedure(AValue:IValue)
              begin
                // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
                if AValue <> nil then
                  LBindComp.EvaluateControlExpression(AColumnExpressionItem, AControlExpression, ACallback, AType)
                else
                  ACallback(AValue)
              end, AType);
        end,
        procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
        begin
              LBindComp.ExecuteAssignItemToSourceExpression(AColumnExpressionItem, AControlExpression, ASourceExpression,
              procedure(AValue: IValue)
              begin
                // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
                if AValue <> nil then
                  LBindComp.EvaluateSourceExpression(AColumnExpressionItem, ASourceExpression,
                    ACallback, AType)
                else
                  ACallback(AValue)
              end, AType);
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
        begin
            LBindComp.EvaluateControlExpression(AColumnExpressionItem, AExpression,
              ACallback, AType)
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Source
        begin
            LBindComp.EvaluateSourceExpression(AColumnExpressionItem, AExpression,
              ACallback, AType);
        end,
        LSaveControl,  // Save Control
        LSaveSource,  // Save Source
        LExpression,
        AName,
      AColumnExpressionItem, // parent collection item
      ADirection));
    end;
  end;

  procedure AddControlExpressions(LList: TList<TBindCompDesignExpression>);
  var
    LIndex: Integer;
    LExpression: TExpressionItem;
    LSourceScope: string;
    LControlScope: string;
  begin
//  if LBindComp.ControlComponent <> nil then
//    LControlScope := LBindComp.ControlComponent.Name
//  else
//    LControlScope := '';
//  if LBindComp.SourceComponent <> nil then
//    LSourceScope := LBindComp.SourceComponent.Name
//  else
//    LSourceScope := '';
    LControlScope := ControlScopeName(LBindComp);
    LSourceScope := SourceScopeName(LBindComp);

    for LIndex := 0 to LBindComp.FormatControlExpressions.Count - 1 do
    begin
      LExpression := LBindComp.FormatControlExpressions[LIndex];
      LList.Add(TBindCompDesignExpression.Create(
        IntToStr(LExpression.Index), LControlScope, LExpression.ControlExpression,  // output
        LSourceScope, LExpression.SourceExpression,  // value
        procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
        begin
          ExecuteAssignToControlExpression(LBindComp, AControlExpression, ASourceExpression,
            ACallback, TBindCompExpressionType.exprFormatControl);
//              LBindComp.ExecuteAssignToControlExpression(AControlExpression, ASourceExpression,
//              procedure(AValue: IValue)
//              begin
//                // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//                if AValue <> nil then
//                  LBindComp.EvaluateControlExpression(AControlExpression,
//                    ACallback, TBindCompExpressionType.exprPosControl)
//                else
//                  ACallback(AValue)
//              end,
//                TBindCompExpressionType.exprPosControl);
        end,
        nil,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
        begin
          LBindComp.EvaluateControlExpression(AExpression,
            ACallback, TBindCompExpressionType.exprFormatControl);                        
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Source
        begin
          LBindComp.EvaluateSourceExpression(AExpression,
              ACallback,
            TBindCompExpressionType.exprFormatControl);                         
        end,
        procedure(const AName: string; const AExpression: string)  // Save Control
        begin
          // Anon capture doesn't seem to work here for LIndex, so use name
          LBindComp.FormatControlExpressions[StrToInt(AName)].ControlExpression := AExpression;
        end,
        procedure(const AName: string; const AExpression: string)  // Save Source
        begin
          LBindComp.FormatControlExpressions[StrToInt(AName)].SourceExpression := AExpression;
        end,
        LExpression,
        '',
      nil, // parent collection item
      exprSourceToControl));
    end;


    for LIndex := 0 to LBindComp.ClearControlExpressions.Count - 1 do
    begin
      LExpression := LBindComp.ClearControlExpressions[LIndex];
      LList.Add(TBindCompDesignExpression.Create(
        IntToStr(LExpression.Index), LControlScope, LExpression.ControlExpression,  // output
        LSourceScope, LExpression.SourceExpression,  // value
        procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
        begin
          ExecuteAssignToControlExpression(LBindComp, AControlExpression, ASourceExpression,
            ACallback, TBindCompExpressionType.exprFormatControl);
//              LBindComp.ExecuteAssignToControlExpression(AControlExpression, ASourceExpression,
//              procedure(AValue: IValue)
//              begin  // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//                if AValue <> nil then
//                  LBindComp.EvaluateControlExpression(AControlExpression,
//                   ACallback, TBindCompExpressionType.exprPosControl)
//                else
//                  ACallback(AValue)
//              end,
//                 TBindCompExpressionType.exprPosControl);
        end,
        nil,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
        begin
          LBindComp.EvaluateControlExpression(AExpression,
            ACallback, TBindCompExpressionType.exprFormatControl)                        
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Source
        begin
          LBindComp.EvaluateSourceExpression(AExpression,
            ACallback,
            TBindCompExpressionType.exprFormatControl);                         
        end,
        procedure(const AName: string; const AExpression: string)  // Save Control
        begin
          // Anon capture doesn't seem to work here for LIndex, so use name
          LBindComp.ClearControlExpressions[StrToInt(AName)].ControlExpression := AExpression;
        end,
        procedure(const AName: string; const AExpression: string)  // Save Source
        begin
          LBindComp.ClearControlExpressions[StrToInt(AName)].SourceExpression := AExpression;
        end,
        LExpression,
        '',
      nil, // parent collection item
      exprSourceToControl));
    end;



  end;


  procedure AddPosExpressions(LList: TList<TBindCompDesignExpression>);
  var
    LIndex: Integer;
    LExpression: TExpressionItem;
    LSourceScope: string;
    LControlScope: string;
  begin
//  if LBindComp.ControlComponent <> nil then
//    LControlScope := LBindComp.ControlComponent.Name
//  else
//    LControlScope := '';
//  if LBindComp.SourceComponent <> nil then
//    LSourceScope := LBindComp.SourceComponent.Name
//  else
//    LSourceScope := '';
    LControlScope := ControlScopeName(LBindComp);
    LSourceScope := SourceScopeName(LBindComp);

    for LIndex := 0 to LBindComp.PosControlExpressions.Count - 1 do
    begin
      LExpression := LBindComp.PosControlExpressions[LIndex];
      LList.Add(TBindCompDesignExpression.Create(
        IntToStr(LExpression.Index), LControlScope, LExpression.ControlExpression,  // output
        LSourceScope, LExpression.SourceExpression,  // value
        procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
        begin
          ExecuteAssignToControlExpression(LBindComp, AControlExpression, ASourceExpression,
            ACallback, TBindCompExpressionType.exprPosControl);
//              LBindComp.ExecuteAssignToControlExpression(AControlExpression, ASourceExpression,
//              procedure(AValue: IValue)
//              begin
//                // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//                if AValue <> nil then
//                  LBindComp.EvaluateControlExpression(AControlExpression,
//                   ACallback, TBindCompExpressionType.exprPosControl)
//                else
//                  ACallback(AValue)
//              end,
//                 TBindCompExpressionType.exprPosControl);
        end,
        nil,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
        begin
          LBindComp.EvaluateControlExpression(AExpression,
           ACallback, TBindCompExpressionType.exprPosControl);                        
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Source
        begin
          LBindComp.EvaluateSourceExpression(AExpression,
            ACallback,
            TBindCompExpressionType.exprPosControl);                         
        end,
        procedure(const AName: string; const AExpression: string)  // Save Control
        begin
          // Anon capture doesn't seem to work here for LIndex, so use name
          LBindComp.PosControlExpressions[StrToInt(AName)].ControlExpression := AExpression;
        end,
        procedure(const AName: string; const AExpression: string)  // Save Source
        begin
          LBindComp.PosControlExpressions[StrToInt(AName)].SourceExpression := AExpression;
        end,
        LExpression,
        '',
      nil, // parent collection item
      exprSourceToControl));
    end;


    for LIndex := 0 to LBindComp.PosSourceExpressions.Count - 1 do
    begin
      LExpression := LBindComp.PosSourceExpressions[LIndex];
      LList.Add(TBindCompDesignExpression.Create(
        IntToStr(LExpression.Index),
        LControlScope, LExpression.ControlExpression,
        LSourceScope, LExpression.SourceExpression,
        nil,
        procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
        begin
          ExecuteAssignToSourceExpression(LBindComp, AControlExpression, ASourceExpression,
            ACallback, TBindCompExpressionType.exprPosSource);
//              LBindComp.ExecuteAssignToSourceExpression(AControlExpression, ASourceExpression,
//              procedure(AValue: IValue)
//              begin
//                // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//                if AValue <> nil then
//                  LBindComp.EvaluateSourceExpression(ASourceExpression,
//                  ACallback, TBindCompExpressionType.exprPosSource)
//                else
//                  ACallback(AValue)
//              end, TBindCompExpressionType.exprPosSource);
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
        begin
          LBindComp.EvaluateControlExpression(AExpression,
            ACallback,
            TBindCompExpressionType.exprPosSource);                         
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Source
        begin
          LBindComp.EvaluateSourceExpression(AExpression,
           ACallback, TBindCompExpressionType.exprPosSource);                        
        end,
        procedure(const AName: string; const AExpression: string)  // Save Control
        begin
          LBindComp.PosSourceExpressions[StrToInt(AName)].ControlExpression := AExpression;
        end,
        procedure(const AName: string; const AExpression: string)  // Save Source
        begin
          // Anon capture doesn't seem to work here for LIndex, so use name
          LBindComp.PosSourceExpressions[StrToInt(AName)].SourceExpression := AExpression;
        end,
        LExpression,
        '',
      nil, // parent collection item
      exprControlToSource));
    end;
  end;

var
  LList: TList<TBindCompDesignExpression>;
  I: Integer;
  LColumnExpressionItem: TColumnLinkExpressionItem;

begin
  LBindComp := TCustomBindGridLink(ADataBinding);
  Assert(LBindComp is TCustomBindGridLink);
  ATypes := [TBindCompDesignerExpressionType.exprControlToSource,
    TBindCompDesignerExpressionType.exprSourceToControl];
  LList := TList<TBindCompDesignExpression>.Create;
  SetLength(Result, 0);
  try

    for I := 0 to LBindComp.ColumnExpressions.Count - 1 do
    begin
      LColumnExpressionItem := TColumnLinkExpressionItem(LBindComp.ColumnExpressions[I]);
      AddExpressions(LList, LColumnExpressionItem, sFormatColumn,
        LColumnExpressionItem.FormatColumnExpressions, TBindCompExpressionType.exprFormatColumn,
        exprSourceToControl);
      AddExpressions(LList, LColumnExpressionItem, sFormatCell,
        LColumnExpressionItem.FormatCellExpressions, TBindCompExpressionType.exprFill,
        exprSourceToControl);
      AddExpressions(LList, LColumnExpressionItem, sParseCell,
        LColumnExpressionItem.ParseCellExpressions, TBindCompExpressionType.exprParse,
        exprControlToSource);
    end;


    AddControlExpressions(LList);
    AddPosExpressions(LList);

    Result := LList.ToArray;
  finally
    LList.Free;
  end;
end;

{ TBindListLinkDesigner }

procedure TBindListLinkDesigner.AddExpressionCollections(
  ABindList: TCustomBindList;
  AList: TList<TBindCompDesignExpressionCollection>);
begin
  inherited;
  AList.Add(TBindCompDesignExpressionCollection.Create(sPosControl, (ABindList as TCustomBindListLink).PosControlExpressions));
  AList.Add(TBindCompDesignExpressionCollection.Create(sPosSource, (ABindList as TCustomBindListLink).PosSourceExpressions));
  AList.Add(TBindCompDesignExpressionCollection.Create(sParse, (ABindList as TCustomBindListLink).ParseExpressions));

end;

procedure TBindListLinkDesigner.AddExpressions(ABindComp: TCustomBindList;
  const AControlScopeName, ASourceScopeName, ASourceMemberScopeName: string;
  AList: TList<TBindCompDesignExpression>);
var
  LBindComp: TCustomBindListLink;
  LIndex: Integer;
  LExpression: TExpressionItem;
begin
  inherited;
  LBindComp := ABindComp as TCustomBindListLink;

  for LIndex := 0 to LBindComp.PosControlExpressions.Count - 1 do
  begin
    LExpression := LBindComp.PosControlExpressions[LIndex];
    AList.Add(TBindCompDesignExpression.Create(
      IntToStr(LExpression.Index), AControlScopeName, LExpression.ControlExpression,  // output
      ASourceScopeName, LExpression.SourceExpression,  // value
      procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
      begin
          ExecuteAssignToControlExpression(LBindComp, AControlExpression, ASourceExpression,
            ACallback, TBindCompExpressionType.exprPosControl);
//            LBindComp.ExecuteAssignToControlExpression(AControlExpression, ASourceExpression,
//            procedure(AValue: IValue)
//            begin
//              // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//              if AValue <> nil then
//                LBindComp.EvaluateControlExpression(AControlExpression,
//                 ACallback, TBindCompExpressionType.exprPosControl)
//              else
//                ACallback(AValue)
//            end,
//               TBindCompExpressionType.exprPosControl);
      end,
      nil,
      procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
      begin
        LBindComp.EvaluateControlExpression(AExpression,
          ACallback, TBindCompExpressionType.exprPosControl);                        
      end,
      procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)   // Execute Source
      begin
        LBindComp.EvaluateSourceExpression(AExpression,
          ACallback, TBindCompExpressionType.exprPosControl);                         
      end,
      procedure(const AName: string; const AExpression: string)  // Save Control
      begin
        // Anon capture doesn't seem to work here for LIndex, so use name
        LBindComp.PosControlExpressions[StrToInt(AName)].ControlExpression := AExpression;
      end,
      procedure(const AName: string; const AExpression: string)  // Save Source
      begin
        LBindComp.PosControlExpressions[StrToInt(AName)].SourceExpression := AExpression;
      end,
      LExpression,
      '',
    nil, // parent collection item
    exprSourceToControl));
  end;


  for LIndex := 0 to LBindComp.PosSourceExpressions.Count - 1 do
  begin
    LExpression := LBindComp.PosSourceExpressions[LIndex];
    AList.Add(TBindCompDesignExpression.Create(
      IntToStr(LExpression.Index),
      AControlScopeName, LExpression.ControlExpression,
      ASourceScopeName, LExpression.SourceExpression,
      nil,
      procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
      begin
          ExecuteAssignToSourceExpression(LBindComp, AControlExpression, ASourceExpression,
            ACallback, TBindCompExpressionType.exprPosSource);
//            LBindComp.ExecuteAssignToSourceExpression(AControlExpression, ASourceExpression,
//            procedure(AValue: IValue)
//            begin
//              // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//              if AValue <> nil then
//                LBindComp.EvaluateControlExpression(ASourceExpression,
//                  ACallback, TBindCompExpressionType.exprPosSource)
//              else
//                ACallback(AValue)
//            end,
//               TBindCompExpressionType.exprPosSource);
      end,
      procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
      begin
        LBindComp.EvaluateControlExpression(AExpression,
          ACallback, TBindCompExpressionType.exprPosSource);                         
      end,
      procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Source
      begin
        LBindComp.EvaluateSourceExpression(AExpression,
          ACallback, TBindCompExpressionType.exprPosSource);                        
      end,
      procedure(const AName: string; const AExpression: string)  // Save Control
      begin
        LBindComp.PosSourceExpressions[StrToInt(AName)].ControlExpression := AExpression;
      end,
      procedure(const AName: string; const AExpression: string)  // Save Source
      begin
        // Anon capture doesn't seem to work here for LIndex, so use name
        LBindComp.PosSourceExpressions[StrToInt(AName)].SourceExpression := AExpression;
      end,
      LExpression,
      '',
    nil, // parent collection item
    exprControlToSource));
  end;

    for LIndex := 0 to LBindComp.ParseExpressions.Count - 1 do
    begin
      LExpression := LBindComp.ParseExpressions[LIndex];
      AList.Add(TBindCompDesignExpression.Create(
        IntToStr(LExpression.Index),
        AControlScopeName, LExpression.ControlExpression,
        ASourceScopeName, LExpression.SourceExpression,
        nil,
        procedure(const AName: string; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>)    // Execute
        begin
          ExecuteAssignToSourceExpression(LBindComp, AControlExpression, ASourceExpression,
            ACallback, TBindCompExpressionType.exprParse);
//              LBindComp.ExecuteAssignToSourceExpression(AControlExpression, ASourceExpression,
//              procedure(AValue: IValue)
//              begin
//                // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
//                if AValue <> nil then
//                  LBindComp.EvaluateSourceExpression(AControlExpression, ACallback,
//                   TBindCompExpressionType.exprParse)
//                else
//                  ACallback(AValue)
//              end,
//                 TBindCompExpressionType.exprParse);
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Control
        begin
          LBindComp.EvaluateControlExpression(AExpression,
            ACallback, TBindCompExpressionType.exprParse);                         
        end,
        procedure(const AName: string; const AExpression: string; ACallback: TProc<IValue>)    // Execute Source
        begin
          LBindComp.EvaluateSourceExpression(AExpression,
            ACallback, TBindCompExpressionType.exprParse);                        
        end,
        procedure(const AName: string; const AExpression: string)  // Save Control
        begin
          LBindComp.ParseExpressions[StrToInt(AName)].ControlExpression := AExpression;
        end,
        procedure(const AName: string; const AExpression: string)  // Save Source
        begin
          // Anon capture doesn't seem to work here for LIndex, so use name
          LBindComp.ParseExpressions[StrToInt(AName)].SourceExpression := AExpression;
        end,
        LExpression,
        SParse,
      nil, // parent collection item
      exprSourceToControl));

    end;

end;

function TBindListLinkDesigner.GetDescription(
  ADataBinding: TContainedBindComponent): string;
var
  LBindList: TCustomBindList;
begin
  Assert(ADataBinding is TCustomBindList);
  LBindList := TCustomBindList(ADataBinding);
  Result := FormatDisplayText(LBindList, sBindLinkDescription);
end;

{ TBindCompDelegateDesigner }


function TBindCompDelegateDesigner.TryGetDelegates(ADataBinding: TContainedBindComponent;
  out ADelegateComponent: TContainedBindComponent; out ADelegateDesigner: IBindCompDesigner): Boolean;
begin
  ADelegateComponent := GetDelegate(ADataBinding);
  if ADelegateComponent <> nil then
    ADelegateDesigner := Data.Bind.Components.GetBindCompDesigner(TContainedBindCompClass(ADelegateComponent.ClassType))
  else
    ADelegateDesigner := nil;
  Result := (ADelegateComponent <> nil) and (ADelegateDesigner <> nil);
end;

function TBindCompDelegateDesigner.GetDescription(
  ADataBinding: TContainedBindComponent): string;
var
  LDelegateDesigner: IBindCompDesigner;
  LDelegateComponent: TContainedBindComponent;
begin
  if TryGetDelegates(ADataBinding, LDelegateComponent, LDelegateDesigner) then
    Result := LDelegateDesigner.GetDescription(LDelegateComponent)
  else
    Result := '';
end;

function TBindCompDelegateDesigner.GetExpressionCollections(
  ADataBinding: TContainedBindComponent): TArray<TBindCompDesignExpressionCollection>;
var
  LDelegateDesigner: IBindCompDesigner;
  LDelegateComponent: TContainedBindComponent;
begin
  if TryGetDelegates(ADataBinding, LDelegateComponent, LDelegateDesigner) then
    Result := LDelegateDesigner.GetExpressionCollections(LDelegateComponent)
  else
    SetLength(Result, 0);
end;

function TBindCompDelegateDesigner.GetExpressions(
  ADataBinding: TContainedBindComponent;
  out ATypes: TBindCompDesignerExpressionTypes): TArray<TBindCompDesignExpression>;
var
  LDelegateDesigner: IBindCompDesigner;
  LDelegateComponent: TContainedBindComponent;
begin
  if TryGetDelegates(ADataBinding, LDelegateComponent, LDelegateDesigner) then
    Result := LDelegateDesigner.GetExpressions(LDelegateComponent, ATypes)
  else
    SetLength(Result, 0);
end;

function TBindCompDelegateDesigner.IsReadOnly(ABindComp: TContainedBindComponent;
  AExpression: TBindCompDesignExpression): Boolean;
begin
  Result := True;
end;

function TBindCompDelegateDesigner.IsReadOnly(ABindComp: TContainedBindComponent; AItem: TCollectionItem): Boolean;
begin
  Result := True;
end;

function TBindCompDelegateDesigner.IsReadOnly(ABindComp: TContainedBindComponent;
  ACollection: TCollection): Boolean;
begin
  Result := True;
end;

{ TCustomBindDBFieldLinkDesigner }

function TBindDBFieldLinkDesigner.GetDelegate(
  ADataBinding: TContainedBindComponent): TContainedBindComponent;
var
  LComponent: TBaseBindDBControlLink;
begin
  LComponent := ADataBinding as TBaseBindDBControlLink;
  Result := LComponent.GetDelegate;
end;

{ TBindDBFieldLinkDesigner_NoParse }

function TBindDBFieldLinkDesigner_NoParse.GetExpressionCollections(
  ADataBinding: TContainedBindComponent): TArray<TBindCompDesignExpressionCollection>;
var
  LCollection: TBindCompDesignExpressionCollection;
  LList:  TList<TBindCompDesignExpressionCollection>;
begin
  Result := inherited;
  // Exclude Parse collection because can't write label text to field
  LList := TList<TBindCompDesignExpressionCollection>.Create;
  try
    for LCollection in Result do
    begin
      if LCollection.Name = sParse then
        continue;
      LList.Add(LCollection);
    end;
    Result := LList.ToArray;
  finally
    LList.Free;
  end;


end;

procedure Register;
begin
  RegisterBindCompDesigner(TCustomBindExpression, TBindExpressionDesigner.Create);
  RegisterBindCompDesigner(TCustomBindExprItems, TBindExprItemsDesigner.Create);

  RegisterBindCompDesigner(TCustomBindLink, TBindLinkDesigner.Create);
  RegisterBindCompDesigner(TCustomBindList, TBindListDesigner.Create);
  RegisterBindCompDesigner(TCustomBindGridLink, TBindGridLinkDesigner.Create);
  RegisterBindCompDesigner(TCustomBindListLink, TBindListLinkDesigner.Create);
  RegisterBindCompDesigner(TCustomBindGridList, TBindGridListDesigner.Create);
  RegisterBindCompDesigner(TCustomBindPosition, TBindPositionDesigner.Create);
end;

{ TCommonBindComponentDesigner }

function TCommonBindComponentDesigner.FormatDisplayText(
  ABindComponent: TCommonBindComponent; const AFormatString: string): string;
var
  LControlScope: string;
  LSourceScope: string;
begin
  if ABindComponent.SourceComponent <> nil then
    LSourceScope := ABindComponent.SourceComponent.Name;
  if ABindComponent.SourceMemberName <> '' then
    LSourceScope := LSourceScope + ', ' + ABindComponent.SourceMemberName;
  if ABindComponent.ControlComponent <> nil then
    LControlScope := ABindComponent.ControlComponent.Name;
  Result := Format(AFormatString (*sBindListDescription*), [LControlScope, LSourceScope]);
end;

function TCommonBindComponentDesigner.FormatDisplayText(
  ABindComponent: TCommonBindComponent; const AFormatString: string; ACount: Integer): string;
var
  LControlScope: string;
  LSourceScope: string;
begin
  if ABindComponent.SourceComponent <> nil then
    LSourceScope := ABindComponent.SourceComponent.Name;
  if ABindComponent.SourceMemberName <> '' then
    LSourceScope := LSourceScope + ', ' + ABindComponent.SourceMemberName;
  if ABindComponent.ControlComponent <> nil then
    LControlScope := ABindComponent.ControlComponent.Name;
  Result := Format(AFormatString (*sBindListDescription*), [LControlScope, LSourceScope, ACount]);
end;

function TCommonBindComponentDesigner.ControlScopeName(
  ABindComp: TCommonBindComponent): string;
begin
  if ABindComp.ControlComponent <> nil then
    Result := ABindComp.ControlComponent.Name
  else
    Result := '';
end;

function TCommonBindComponentDesigner.SourceScopeName(
  ABindComp: TCommonBindComponent): string;
begin
  if ABindComp.SourceComponent <> nil then
    Result := ABindComp.SourceComponent.Name
  else
    Result := '';
end;

function TCommonBindComponentDesigner.SourceMemberScopeName(
  ABindComp: TCommonBindComponent): string;
begin
  Result := SourceScopeName(ABindComp);
  if ABindComp.SourceMemberName <> '' then
    Result := Result + ', ' + ABindComp.SourceMemberName;
end;

procedure TCommonBindComponentDesigner.ExecuteAssignToControlExpression(
  ABindComp: TCommonBindComponent; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>;
  AType: TBindCompExpressionType);
begin
  ABindComp.ExecuteAssignToControlExpression(AControlExpression, ASourceExpression,
  procedure(AValue: IValue)
  begin
    // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
  if AValue <> nil then
    ABindComp.EvaluateControlExpression(AControlExpression, ACallback)
  else
    ACallback(AValue);
  end);
end;

procedure TCommonBindComponentDesigner.ExecuteAssignToSourceExpression(
  ABindComp: TCommonBindComponent; const AControlExpression, ASourceExpression: string; ACallback: TProc<IValue>;
  AType: TBindCompExpressionType);
begin
   ABindComp.ExecuteAssignToSourceExpression(AControlExpression, ASourceExpression,
   procedure(AValue: IValue)
   begin
      // Display value of output expression in case it is a TObject.  This allows visualizers work on TObject
    if AValue <> nil then
      ABindComp.EvaluateSourceExpression(ASourceExpression, ACallback, AType)
    else
      ACallback(AValue)
   end, AType);
end;

end.
