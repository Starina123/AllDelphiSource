unit IssueErrors;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, DBClient, DB, IssuesServerUnit;

type
  TUpdateErrorDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure CancelBtnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Delta: TClientDataSet;
    DataSet: TClientDataSet;
    Issue: TIssue;
  end;

var
  UpdateErrorDlg: TUpdateErrorDlg;

implementation

{$R *.dfm}

procedure TUpdateErrorDlg.CancelBtnClick(Sender: TObject);
begin
  DataSet.CancelUpdates;
end;

procedure TUpdateErrorDlg.Button1Click(Sender: TObject);
begin
  Edit1.ReadOnly := False;
  Edit2.ReadOnly := False;
  Edit3.ReadOnly := False;
  Edit1.SetFocus;
end;

procedure TUpdateErrorDlg.Edit1Change(Sender: TObject);
begin
  Issue.ID := StrToInt(Edit1.Text);
end;

procedure TUpdateErrorDlg.Edit2Change(Sender: TObject);
begin
  Issue.Owner := Edit2.Text;
end;

procedure TUpdateErrorDlg.Edit3Change(Sender: TObject);
begin
  Issue.DateOpened.AsDateTime := StrToDate(Edit3.Text);
end;

end.
