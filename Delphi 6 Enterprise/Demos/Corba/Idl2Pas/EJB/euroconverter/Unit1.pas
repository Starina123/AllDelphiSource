unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Label2: TLabel;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
Uses
   Corba,
   ejb_currencyconverter_c,
   ejb_currencyconverter_i;

{$R *.DFM}


Var
  Home: EuroConverterHome;
  Remote: EuroConverter;

procedure TForm1.Button1Click(Sender: TObject);
Var
  HflASText: String;
  EuroAsText: String;
  Hfl,Euro: Single;

begin
   HflASText := Edit1.Text;
   Hfl := StrToFloat(HflASText);

   Euro :=  Remote.hfl2float(hfl);

   EuroAsText := FloattoStr(Euro);
   Edit2.Text := EuroAsText;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CorbaInitialize;

  Home := TEuroConverterHomeHelper.Bind('sidl/EuroConverter');
  Remote := Home._create as ejb_currencyconverter_i.EuroConverter;
end;

end.
