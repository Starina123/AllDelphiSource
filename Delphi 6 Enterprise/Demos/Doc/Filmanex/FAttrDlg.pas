unit FAttrDlg;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TFileAttrForm = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    FileDirName: TLabel;
    FilePathName: TLabel;
    ChangeDate: TLabel;
    GroupBox1: TGroupBox;
    ReadOnly: TCheckBox;
    Archive: TCheckBox;
    System: TCheckBox;
    Hidden: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FileAttrForm: TFileAttrForm;

implementation

{$R *.dfm}

end.
