unit DBWebModule;

interface

uses
 SysUtils, Classes, HTTPApp, DBWeb, DB, SqlExpr, FMTBcd, DBXpress;

type
  TWebModule1 = class(TWebModule)
    SQLConnection1: TSQLConnection;
    Employees: TSQLTable;
    DataSetTableProducer1: TDataSetTableProducer;
    procedure WebModule1WebActionItem2Action(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;

implementation

{$R *.xfm}

procedure TWebModule1.WebModule1WebActionItem2Action(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
response.content:='I am the foo that is not a bar';
end;

end.
