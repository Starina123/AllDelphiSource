unit FrmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Toolsapi, Menus;

type
  TForm2 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    CheckBox1: TCheckBox;
    procedure ListBox1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  WizMain;

{$R *.dfm}

procedure TForm2.ListBox1Click(Sender: TObject);
var
  i: Integer;
  TS: TStringList;

  function GetPackageIndex(Name: string): Integer;
  var
    j: Integer;
    
  begin
    Result := 0;
    for j := 0 to TS.Count-1 do
      if TS.Strings[j] = Name then
      begin
        Result := j;
        Break;
      end;
  end;

begin
  TS := TStringList.Create;

  try
    for i := 0 to PackageTest.PackageCount-1 do
      TS.Add(PackageTest.PackageNames[i]);
    
    Listbox2.Clear;
    if PackageTest.GetComponentCount(GetPackageIndex(Listbox1.Items.Strings[Listbox1.ItemIndex])) > 0 then
    begin
      for i := 0 to PackageTest.GetComponentCount(GetPackageIndex(Listbox1.Items.Strings[Listbox1.ItemIndex])) do
        Listbox2.Items.Add(PackageTest.GetComponentName(GetPackageIndex(Listbox1.Items.Strings[Listbox1.ItemIndex]), i));
    end
    else
      ListBox2.Items.Add('<No components>');
  finally
    TS.Free;
  end;
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
var
  i: Integer;
  
begin
   Listbox1.Items.Clear;
   
   if CheckBox1.Checked then
   begin
     for i := 0 to PackageTest.PackageCount-1 do
       if PackageTest.ComponentCount[i] > 0 then
          Listbox1.Items.Add(PackageTest.PackageNames[i]);
   end
   else
     for i := 0 to PackageTest.PackageCount-1 do
       Listbox1.Items.Add(PackageTest.PackageNames[i]);
end;

end.
