unit BaseViewU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, ComCtrls, ToolWin;

type
  TBaseView = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    procedure FormUnDock(Sender: TObject; Client: TControl;
      var Allow: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseView: TBaseView;

implementation

uses AppActionsU, ClientDataModuleU;

{$R *.DFM}

procedure TBaseView.FormUnDock(Sender: TObject; Client: TControl;
  var Allow: Boolean);
begin
  FormStyle := fsStayOnTop;
end;

end.
