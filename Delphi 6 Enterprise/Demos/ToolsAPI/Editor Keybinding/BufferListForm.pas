unit BufferListForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TBufferListFrm = class(TForm)
    BufferListBox: TListBox;
    OKButton: TButton;
    CancelButton: TButton;
    procedure BufferListBoxDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TBufferListFrm.BufferListBoxDblClick(Sender: TObject);
begin
  if BufferListBox.ItemIndex > -1 then ModalResult := mrOK;
end;

end.
