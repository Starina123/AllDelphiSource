///////////////////////////////////////////////////////////////////////////
//                                                                       //
// Copyright � 1997-1998, NetMasters, L.L.C                              //
//  - All rights reserved worldwide. -                                   //
//  Portions may be Copyright � Inprise.                                 //
//                                                                       //
// DayTime Demo :  (DayTmDemo.dpr)                                       //
//                                                                       //
// DESCRIPTION:                                                          //
//                                                                       //
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY //
// KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE   //
// IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR //
// PURPOSE.                                                              //
//                                                                       //
///////////////////////////////////////////////////////////////////////////
//									 //
// Revision History							 //
//									 //
//                                                                       //
///////////////////////////////////////////////////////////////////////////
program DTmDemo;

uses
  Forms,
  DTDem in 'DTDem.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.


