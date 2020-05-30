
{*******************************************************}
{                                                       }
{       Borland Delphi Sample                           }
{                                                       }
{       Copyright (c) 2001 Inprise Corporation          }
{                                                       }
{*******************************************************}

unit ImgBtnProducerReg;

interface

uses DesignIntf, DesignEditors, Classes, SysUtils,
 WebComp, ImgBtnProducer;

  procedure Register;

implementation

const
  sPalettePage = 'WebSnap Demos';

{ Register procedure }

procedure Register;
begin
  RegisterComponents(sPalettePage, [TImageButtonProducer]);
  RegisterNonActiveX([TImageButtonProducer], axrIncludeDescendants);
end;


end.
