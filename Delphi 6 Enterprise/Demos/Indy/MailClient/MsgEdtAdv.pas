{***************************************************************
 *
 * Project  : MailDemo
 * Unit Name: MsgEdtAdv
 * Purpose  : Sub form
 * Version  : 1.0
 * Date  : Wed 25 Apr 2001  -  01:28:37
 * Author  : Hadi Hari <hadi@pbe.com>
 * History  :
 * Tested  : Wed 25 Apr 2001  // Allen O'Neill <allen_oneill@hotmail.com>
 *
 ****************************************************************}

unit MsgEdtAdv;

interface

uses
{$IFDEF Linux}
   QGraphics,  QControls,  QForms,  QDialogs,  QStdCtrls,  QButtons,
{$ELSE}
   Graphics,  Controls,  Forms,  Dialogs,  StdCtrls,  Buttons,
{$ENDIF}
  windows, messages,  SysUtils,  Classes;

type
  TfrmAdvancedOptions = class(TForm)
    lblSender: TLabel;
    edtSender: TEdit;
    mmoExtraHeaders: TMemo;
    bbtnOk: TBitBtn;
    bbtnCancel: TBitBtn;
    Label1: TLabel;
  private
    { Private declarations }
  protected
  public
    { Public declarations }
  end;

var
  frmAdvancedOptions: TfrmAdvancedOptions;

implementation

{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

end.
