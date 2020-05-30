unit dmThreadU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, IBCustomDataSet, IBQuery, IBDatabase;

type
  TdmThread = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
  private
    { Private declarations }
  public
    constructor Create(DB_Name : String; Username : String; Password : String); reintroduce; overload;
    { Public declarations }
  end;

var
  dmThread: TdmThread;

implementation

{$R *.dfm}

{ TdmThread }

constructor TdmThread.Create(DB_Name: String; Username : String; Password : String);
begin
  inherited Create(nil);
  IBDatabase1.DatabaseName := DB_Name;
  IBDatabase1.Params.Add(Format('user_name=%s', [Username]));
  IBDatabase1.Params.Add(Format('password=%s', [Password]));
  IBDatabase1.Connected := true;
end;

end.
