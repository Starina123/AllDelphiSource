
{
  InternetExpress sample component.

  TReadFileClientDataSet is a custom TClientDataSet that
  does not write the client data set file to disk when the
  data set is closed.  The inetxcenter sample application
  uses a client data set file for read only data.

}
unit ReadFileClientDataSet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient;

type
  TReadFileClientDataSet = class(TClientDataSet)
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure CloseCursor; override;
  public
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('InternetExpress', [TReadFileClientDataSet]);
end;

{ TReadFileClientDataSet }

procedure TReadFileClientDataSet.CloseCursor;
var
  SaveFileName: string;
begin
  // Prevent client data set file from being saved to disk.
  SaveFileName := FileName;
  FileName := '';
  try
    inherited CloseCursor;
  finally
    FileName := SaveFileName;
  end;
end;

end.
