unit IdMessageCoderXXE;

interface

uses
  Classes,
  IdMessageCoderUUE, IdMessageCoder, IdMessage;

type
  // No Decoder - UUE handles XXE decoding

  TIdMessageEncoderXXE = class(TIdMessageEncoderUUEBase)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TIdMessageEncoderInfoXXE = class(TIdMessageEncoderInfo)
  public
    constructor Create; override;
  end;

implementation

uses
  IdCoderXXE;

{ TIdMessageEncoderInfoXXE }

constructor TIdMessageEncoderInfoXXE.Create;
begin
  inherited;
  FMessageEncoderClass := TIdMessageEncoderXXE;
end;

{ TIdMessageEncoderXXE }

constructor TIdMessageEncoderXXE.Create(AOwner: TComponent);
begin
  inherited;
  FEncoderClass := TIdEncoderXXE;
end;

initialization
  TIdMessageEncoderList.RegisterEncoder('XXE', TIdMessageEncoderInfoXXE.Create);    {Do not Localize}
end.
