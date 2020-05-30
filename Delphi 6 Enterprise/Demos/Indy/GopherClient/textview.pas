{***************************************************************
 *
 * Project  : GopherClient
 * Unit Name: textview
 * Purpose  : Sub form
 * Version  : 1.0
 * Date  : Wed 25 Apr 2001  -  01:17:06
 * Author  : <unknown>
 * History  :
 * Tested  : Wed 25 Apr 2001  // Allen O'Neill <allen_oneill@hotmail.com> 
 *
 ****************************************************************}

unit textview;

interface

uses
  {$IFDEF Linux}
  QControls, QStdCtrls, QGraphics, QForms, QDialogs, QComCtrls,
  {$ELSE}
  windows, messages, graphics, controls, forms, dialogs, StdCtrls,
  {$ENDIF}
  SysUtils, Classes;

type
  TfrmTextView = class(TForm)
  btnOk: TButton;
  mmoTextFile: TMemo;
  private
  { Private declarations }
  public
  { Public declarations }
  end;

var
  frmTextView: TfrmTextView;

implementation

{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

end.
