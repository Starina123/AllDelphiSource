unit CustView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, Grids, DBGrids, ComCtrls, StdCtrls, Mask, Buttons,
  Menus;

type
  TfmCustView = class(TForm)
    StatusBar1: TStatusBar;
    DBGrid2: TDBGrid;
    Label3: TLabel;
    MainMenu1: TMainMenu;
    About1: TMenuItem;
    DBNavigator1: TDBNavigator;
    Label2: TLabel;
    rgDataSet: TRadioGroup;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    cbFilterOrders: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    procedure rgDataSetClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cbFilterOrdersClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid2Enter(Sender: TObject);
  end;

var
  fmCustView: TfmCustView;

implementation

uses DM, Filter1, About;

{$R *.dfm}

{ Change the Dataset for the Customer from Query to Table,
  or Table to Query. If a filter is current, set that filter
  to the just-changed Dataset. }
procedure TfmCustView.rgDataSetClick(Sender: TObject);
var
  st: string;
begin
  with DM1, CustomerSource do
  begin
    { Is the other Dataset Filtered? Get its filter. }
    if Dataset.Filtered then
      st := Dataset.Filter;
    case rgDataset.ItemIndex of
      0: if Dataset <> SQLCustomer then
           Dataset := SQLCustomer;
      1: if CustomerSource.Dataset <> Customer then
           Dataset := Customer;
    end;

    { Set the Filter of the current Dataset. }
    if st <> '' then
    begin
      Dataset.Filter := st;
      Dataset.Filtered := True;
    end;
  end;
end;

procedure TfmCustView.SpeedButton1Click(Sender: TObject);
begin
  fmFilterFrm.Show;
end;

procedure TfmCustView.cbFilterOrdersClick(Sender: TObject);
begin
  { DM1.SQLOrders.Filtered will be true if the box is checked, false otherwise. }
  DM1.SQLOrders.Filtered := cbFilterOrders.Checked;

  { If the number changed while the box is unchecked, DM1.OrdersFilterAmount
    won't know about it.  The Edit1Change procedure will set the value and
    apply the filter.}
  if cbFilterOrders.Checked then
    Edit1Change(nil); { To make sure the value is set. }
end;

procedure TfmCustView.About1Click(Sender: TObject);
begin
  with TFMAboutBox.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfmCustView.Edit1Change(Sender: TObject);
begin
  { We must test of Edit1.Text not being blank, or an exception will
    be raised when the user clears the contents of the Edit. }
  if (cbFilterOrders.checked) and (Edit1.Text <> '') then
    try
      { Attempt to set the variable on DM1 that holds the filter amount. }
      DM1.OrdersFilterAmount := StrToFloat(fmCustView.Edit1.Text);

      { Refreshing SQLOrders will cause DM1.SQLOrdersFilterRecord to be called
        once for each orders record for the current Customer. }
      DM1.SQLOrders.Refresh;

    except
      on EConvertError do
        { This happens before DM1.SQLOrders.refresh if the user typed in a
          non-numeric value, thus preventing it from trying to use an invalid
          value to filter itself, which would raise an exception once for
          each record displayed.}
        raise Exception.Create('Threshold Amount must be a number')
    end
end;

{ Set the navigator to the Customer Datasource. }
procedure TfmCustView.DBGrid1Enter(Sender: TObject);
begin
  DBNavigator1.DataSource := DBGrid1.DataSource;
end;

{ Set the navigator to the Orders Datasource. }
procedure TfmCustView.DBGrid2Enter(Sender: TObject);
begin
  DBNavigator1.DataSource := DBGrid2.DataSource;
end;

end.
