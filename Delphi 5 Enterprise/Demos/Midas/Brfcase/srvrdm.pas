unit SrvrDM;

{
  This is the server DataModule of the Briefcase demo.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComServ, ComObj, VCLCom, StdVcl, DataBkr, DBClient, Server_TLB,
  Db, DBTables, Provider;

type
  TBriefCaseDemo = class(TRemoteDataModule, IBriefCaseDemo)
    Query1: TQuery;
    Session1: TSession;
    Database1: TDatabase;
    DataSetProvider1: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BriefCaseDemo: TBriefCaseDemo;

implementation

{$R *.DFM}

initialization
  TComponentFactory.Create(ComServer, TBriefCaseDemo,
    Class_BriefCaseDemo, ciMultiInstance, tmApartment);
end.
