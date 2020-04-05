{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.ZOrder.Win;

interface

{$SCOPEDENUMS ON}

uses
  System.Types, Winapi.Windows, FMX.Controls, FMX.Forms, FMX.ZOrder;

type

  /// <summary>Helper class used to manage platform controls</summary>
  TWinZOrderManager = class(TCustomZOrderManager<HWND>)
  private
    function AbsoluteToParentView(const AControl: TControl; const AParentView: HWnd): TRect;
  protected
    function GetParentView(const AControlHandle: HWnd): HWnd; override;
    procedure RemoveFromParent(const AControlHandle: HWnd); override;
    procedure InsertSubview(const AParentHandle, AChildHandle, APreviousSiblingView: HWnd); override;
    function IndexOfView(const AControlHandle: HWnd): Integer; override;
    procedure UpdateBounds(const AControlHandle: HWnd; const AControl: TControl; const AParentHandle: HWnd); override;
    procedure UpdateVisible(const AControlHandle: HWnd; const AVisible: Boolean); override;
    function GetFormView(const AForm: TCommonCustomForm): HWND; override;
    function SameView(const AControlLeftHwnd, AControlRightHwnd: HWND): Boolean; override;
    function NullView: HWnd; override;
  end;

implementation

uses
  System.Math, FMX.Platform.Win, FMX.Types;

{ Helper functions }

type
  TEnumData = record
    I, Index: Integer;
    View: HWnd;
  end;
  PEnumData = ^TEnumData;

function CountEnum(Wnd: HWND; Data: PEnumData): BOOL; stdcall;
begin
  Inc(Data.I);
  Result := True;
end;

function GetViewChildrenCount(const View: HWnd): Integer;
var
  Data: TEnumData;
begin
  Data.I := 0;
  EnumChildWindows(View, @CountEnum, LParam(@Data));
  Result := Data.I;
end;

function IndexEnum(Wnd: HWND; Data: PEnumData): BOOL; stdcall;
begin
  Dec(Data.I);
  Result := Data.View <> Wnd;
end;

function GetIndexOfView(const View: HWnd): Integer;
var
  Data: TEnumData;
  Parent: HWnd;
begin
  Parent := GetParent(View);
  Data.I := GetViewChildrenCount(Parent);
  Data.View := View;
  EnumChildWindows(Parent, @IndexEnum, LParam(@Data));
  Result := Data.I;
end;

function ViewEnum(Wnd: HWND; Data: PEnumData): BOOL; stdcall;
begin
  Dec(Data.I);
  Data.View := Wnd;
  Result := Data.I > Data.Index;
end;

function GetViewAtIndex(const Parent: HWnd; const Index: Integer): HWnd;
var
  Data: TEnumData;
begin
  Data.I := GetViewChildrenCount(Parent);
  Data.View := 0;
  Data.Index := Index;
  EnumChildWindows(Parent, @ViewEnum, LParam(@Data));
  Result := Data.View;
end;

{ TWinZOrderManager }

function TWinZOrderManager.AbsoluteToParentView(const AControl: TControl; const AParentView: HWnd): TRect;
var
  Bounds: TRectF;
  Form: TCommonCustomForm;
  FormWnd: HWND;
  ScreenScale: Single;
begin
  if FindForm(AControl, Form) then
  begin
    Bounds := AControl.AbsoluteRect;
    ScreenScale := Form.Handle.Scale;

    Result := TRectF.Create(Bounds.Left * ScreenScale, Bounds.Top * ScreenScale,
                            Bounds.Right * ScreenScale, Bounds.Bottom * ScreenScale).Round;

    FormWnd := WindowHandleToPlatform(Form.Handle).Wnd;
    ClientToScreen(FormWnd, Result.TopLeft);
    ClientToScreen(FormWnd, Result.BottomRight);
    ScreenToClient(AParentView, Result.TopLeft);
    ScreenToClient(AParentView, Result.BottomRight);
  end
  else
    Result := TRect.Empty;
end;

function TWinZOrderManager.SameView(const AControlLeftHwnd, AControlRightHwnd: HWND): Boolean;
begin
  Result := AControlLeftHwnd = AControlRightHwnd;
end;

function TWinZOrderManager.GetFormView(const AForm: TCommonCustomForm): HWND;
var
  FormHandle: TWinWindowHandle;
begin
  FormHandle := WindowHandleToPlatform(AForm.Handle);
  Result := FormHandle.Wnd;
end;

function TWinZOrderManager.GetParentView(const AControlHandle: HWnd): HWnd;
begin
  Result := GetParent(AControlHandle);
end;

function TWinZOrderManager.IndexOfView(const AControlHandle: HWnd): Integer;
begin
  Result := GetIndexOfView(AControlHandle);
end;

procedure TWinZOrderManager.InsertSubview(const AParentHandle, AChildHandle, APreviousSiblingView: HWnd);
var
  PreviousSiblingViewIdx, I: Integer;
begin
  SetParent(AChildHandle, AParentHandle);
  if APreviousSiblingView = 0 then
    SetWindowPos(AChildHandle, HWND_BOTTOM, 0, 0, 0, 0, SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE)
  else
  begin
    PreviousSiblingViewIdx := GetIndexOfView(APreviousSiblingView);
    for I := PreviousSiblingViewIdx + 1 to GetViewChildrenCount(AParentHandle) - 2 do
      SetWindowPos(GetViewAtIndex(AParentHandle, PreviousSiblingViewIdx + 1), HWND_TOP, 0, 0, 0, 0, SWP_NOACTIVATE or
        SWP_NOMOVE or SWP_NOSIZE);
  end;
end;

function TWinZOrderManager.NullView: HWnd;
begin
  Result := 0;
end;

procedure TWinZOrderManager.RemoveFromParent(const AControlHandle: HWnd);
begin
  SetParent(AControlHandle, 0);
end;

procedure TWinZOrderManager.UpdateBounds(const AControlHandle: HWnd; const AControl: TControl; const AParentHandle: HWnd);
var
  WinBounds: TRect;
begin
  WinBounds := AbsoluteToParentView(AControl, AParentHandle);
  SetWindowPos(AControlHandle, 0, WinBounds.Left, WinBounds.Top, WinBounds.Width, WinBounds.Height, SWP_NOZORDER
    or SWP_NOACTIVATE);
end;

procedure TWinZOrderManager.UpdateVisible(const AControlHandle: HWnd; const AVisible: Boolean);
var
  Flag: Integer;
begin
  Flag := IfThen(AVisible, SWP_SHOWWINDOW, SWP_HIDEWINDOW);
  SetWindowPos(AControlHandle, 0, 0, 0, 0, 0, Flag or SWP_NOSIZE or SWP_NOMOVE or SWP_NOZORDER or SWP_NOACTIVATE)
end;

end.
