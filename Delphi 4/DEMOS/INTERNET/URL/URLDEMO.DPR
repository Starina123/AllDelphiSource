///////////////////////////////////////////////////////////////////////////
//                                                                       //
// Copyright © 1997-1998, NetMasters, L.L.C                              //
//  - All rights reserved worldwide. -                                   //
//  Portions may be Copyright © Inprise.                                 //
//                                                                       //
// URL Encoder/Decoder Demo:  (urldemo.dpr)                              //
//                                                                       //
// DESCRIPTION:                                                          //
//                                                                       //
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY //
// KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE   //
// IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR //
// PURPOSE.                                                              //
//                                                                       //
///////////////////////////////////////////////////////////////////////////
//
// Revision History
//
//                                                                       //
///////////////////////////////////////////////////////////////////////////
program urldemo;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
