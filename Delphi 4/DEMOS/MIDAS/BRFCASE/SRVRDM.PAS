unit SrvrDM;

{
  This is the server DataModule of the Briefcase demo.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComServ, ComObj, VCLCom, StdVcl, BdeProv, DataBkr, DBClient, Server_TLB,
  Db, DBTables;

type
  TBriefCaseDemo = class(TRemoteDataModule, IBriefCaseDemo)
    Query1: TQuery;
    Session1: TSession;
    Database1: TDatabase;
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function Get_Query1: IProvider; safecall;
  end;

var
  BriefCaseDemo: TBriefCaseDemo;

implementation

{$R *.DFM}

function TBriefCaseDemo.Get_Query1: IProvider;
begin
  Result := Query1.Provider;
end;

initialization
  TComponentFactory.Create(ComServer, TBriefCaseDemo,
    Class_BriefCaseDemo, ciMultiInstance, tmApartment);
end.
