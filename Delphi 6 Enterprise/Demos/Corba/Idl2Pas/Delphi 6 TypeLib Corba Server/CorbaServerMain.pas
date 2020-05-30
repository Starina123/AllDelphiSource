unit CorbaServerMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, ComObj, StdVcl,
  CorbaObj, Server_TLB;

type

  TMyTest = class(TCorbaImplementation, IMyTest)
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function Get_X: Integer; safecall;
  end;

implementation

uses CorbInit, ServerMain;

function TMyTest.Get_X: Integer;
begin
   Form1.ListBox1.Items.Add( DateTimeToStr(Now) + ' :  Client request');
   result := 123;
end;

initialization
  TCorbaObjectFactory.Create('MyTestFactory', 'MyTest', 'IDL:Server/MyTestFactory:1.0', IMyTest,
    TMyTest, iMultiInstance, tmSingleThread);
end.