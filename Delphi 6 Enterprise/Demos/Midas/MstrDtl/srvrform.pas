unit srvrform;

{ This demo uses the IBLOCAL alias which is setup by the install program
  when you install Delphi 5.0 if you have installed Local Interbase.

  This example demonstrates how ClientDataSets can be used in a master-detail
  application.  This is the server (or middle-tier).


  This form is not used in the demo.  You can make the form not visible by
  adding the line

    Application.ShowMainForm := False;

  to the project source.  (View | Project Source will show the project source.)
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TServerForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ServerForm: TServerForm;

implementation

{$R *.dfm}

end.
