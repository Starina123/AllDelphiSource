unit ClientFr;

{
  This is the client portion of a MIDAS demo.  Make sure that you compile and
  run the server project before trying to run this probject.

  This project demonstrates how to set parameters for a query on the server.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, StdCtrls, DBCtrls, Grids, DBGrids, ExtCtrls, MConnect;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    StartDate: TEdit;
    EndDate: TEdit;
    DBImage1: TDBImage;
    DBMemo1: TDBMemo;
    Events: TClientDataSet;
    EventsEventNo: TIntegerField;
    EventsVenueNo: TIntegerField;
    EventsEvent_Name: TStringField;
    EventsEvent_Date: TDateField;
    EventsEvent_Time: TTimeField;
    EventsEvent_Description: TMemoField;
    EventsTicket_price: TCurrencyField;
    EventsEvent_Photo: TGraphicField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ShowEvents: TButton;
    Bevel1: TBevel;
    RemoteServer: TDCOMConnection;
    procedure FormCreate(Sender: TObject);
    procedure ShowEventsClick(Sender: TObject);
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
  { Initialize the edit controls with some dates so the user can
    just click the button to see some data }
  StartDate.Text := DateToStr(EncodeDate(1996, 6, 19));
  EndDate.Text := DateToStr(EncodeDate(1996, 6, 21));
end;

procedure TForm1.ShowEventsClick(Sender: TObject);
begin

{ The query on the server looks like this:

     select * from events where
       Event_Date >= :Start_Date and
       Event_Date <= :End_Date;

  The Events ClientDataSet has the parameters from the server set up in the
  Params property.  At design time, you can right click on a ClientDataSet and
  select "Fetch Params" to initialize the params from a TQuery or TStoredProc
  on the server.  At run-time you can call TClientDataSet.FetchParams to
  initialize the params from the server.  Or you can set the params up manually
  by adding them yourself.

}

  Events.Close;
  Events.Params.ParamByName('Start_Date').AsDateTime := StrToDateTime(StartDate.Text);
  Events.Params.ParamByName('End_Date').AsDateTime := StrToDateTime(EndDate.Text);
  Events.Open;
end;

end.
  