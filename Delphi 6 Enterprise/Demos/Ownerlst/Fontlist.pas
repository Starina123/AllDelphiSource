unit Fontlist;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    FontLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure DrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure ListBox1MeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Listbox1.Items := Screen.Fonts;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
  FontLabel.Caption := ListBox1.Items[ListBox1.ItemIndex];
end;

procedure TForm1.DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with ListBox1.Canvas do
  begin
    FillRect(Rect);
    Font.Name := ListBox1.Items[Index];
    Font.Size := 0;    // use font's preferred size
    TextOut(Rect.Left+1, Rect.Top+1, ListBox1.Items[Index]);
  end;
end;

procedure TForm1.ListBox1MeasureItem(Control: TWinControl; Index: Integer;
  var Height: Integer);
begin
  with ListBox1.Canvas do
  begin
    Font.Name := Listbox1.Items[Index];
    Font.Size := 0;                 // use font's preferred size
    Height := TextHeight('Wg') + 2; // measure ascenders and descenders
  end;
end;

end.
