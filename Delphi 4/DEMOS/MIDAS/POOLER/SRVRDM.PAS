{*******************************************************}
{                                                       }
{        Midas RemoteDataModule Pooler Demo             }
{                                                       }
{*******************************************************}

unit SrvrDM;

{
  This is the Remote Data Module (RDM) that is going to be pooled.
  The differences between this RDM and a regular RDM are as follows;
  1) In order to share RDMs the client must be stateless. This means that the
     IProvider interface cannot be used in conjunction with pooling.  Below
     you'll notice the procedure Select that is used to retrieve data.
  2) The RDMs need to run in their own thread.  In order to do this for out of
     process servers, you can use the ThreadedClassFactory included in this
     demo.
  3) This class is an internal accesible class only and is not registered in the
     registry.  All access to this object is done from the pooler object.  If
     you look in the Type Library you will see 2 different CoClasses for this
     project.  One is for this class and one is for the Pooler.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComServ, ComObj, VCLCom, StdVcl, BdeProv, ActiveX, DataBkr, Server_TLB,
  Db, DBTables, ThrddCF;

type
  TPooledRDM = class(TDataModule, IPooledRDM)
    Session1: TSession;
    Database1: TDatabase;
    Query1: TQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure Select(const SQLStr: WideString; out Data: OleVariant); safecall;
  end;

var
  PooledRDM: TPooledRDM;
{ Need a reference to the ClassFactory so the pooler can create instances of the
  class. }
  RDMFactory: TThreadedClassFactory;

implementation

{$R *.DFM}

{ Select is used to retrieve all the data from a query.  This is done so the
  server can be stateless. }
procedure TPooledRDM.Select(const SQLStr: WideString;
  out Data: OleVariant);
begin
  Query1.SQL.Text := SQLStr;
  Data := Query1.Provider.Data;
end;

initialization
  RDMFactory := TThreadedClassFactory.Create(ComServer, TPooledRDM,
    Class_PooledRDM, ciInternal);
end.
