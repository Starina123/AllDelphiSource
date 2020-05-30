{*******************************************************}
{                                                       }
{        Midas RemoteDataModule Pooler Demo             }
{                                                       }
{*******************************************************}

unit srvrdm;

{
  This is the Remote Data Module (RDM) that is going to be pooled.
  The differences between this RDM and a regular RDM are as follows;
  1) In order to share RDMs the client must be stateless. This means that the
     all calls that come into the server, must not rely on any informatin passed
     in previous calls.
  2) The RDMs need to run in their own thread which is why the factory
     constructor is specifying tmApartment as the threading model.  tmFree or
     tmBoth could also be used if the server is written to support Free threading.
  3) This class is an internal accesible class only and is not registered in the
     registry.  All access to this object is done from the pooler object.  If
     you look in the Type Library you will see 2 different CoClasses for this
     project.  One is for this class and one is for the Pooler.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComServ, ComObj, VCLCom, StdVcl, ActiveX, DataBkr, Server_TLB,
  Db, DBTables, Provider, Variants;

type
  TPooledRDM = class(TRemoteDataModule, IPooledRDM)
    Session1: TSession;
    Database1: TDatabase;
    Query1: TQuery;
    DataSetProvider1: TDataSetProvider;
    procedure DataSetProvider1BeforeGetRecords(Sender: TObject;
      var OwnerData: OleVariant);
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
{ Need a reference to the ClassFactory so the pooler can create instances of the
  class. }
  RDMFactory: TComponentFactory;

implementation

{$R *.dfm}

{ Since this is a stateless server, before records are fetched, the query needs
  to be positioned to the correct location. The client passes the query and the
  value of the first field for the last record it fetched.  If you are fetching
  all records then you don't need to locate the last record.  If the query
  isn't changing, then you don't need to pass the query to the server.}
procedure TPooledRDM.DataSetProvider1BeforeGetRecords(Sender: TObject;
  var OwnerData: OleVariant);
begin
  try
    Query1.Close;
    Query1.SQL.Text := OwnerData[0];
    if not VarIsNull(OwnerData[1]) and not VarIsEmpty(OwnerData[1]) then
    begin
      Query1.Open;
      if not Query1.Locate(Query1.Fields[0].FieldName, OwnerData[1], []) then
        raise Exception.Create('Record not found');
      Query1.Next;
    end;
  finally
    OwnerData := NULL;
  end;
end;

class procedure TPooledRDM.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;


initialization
  RDMFactory := TComponentFactory.Create(ComServer, TPooledRDM,
    Class_PooledRDM, ciInternal, tmApartment);
end.
