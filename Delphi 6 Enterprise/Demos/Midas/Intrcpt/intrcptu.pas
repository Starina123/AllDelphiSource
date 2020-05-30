
{*******************************************************}
{                                                       }
{       DataSnap Socket Server Intercepor Demo             }
{                                                       }
{*******************************************************}

unit intrcptu;

{
  NOTE: This demo requires the ZLib units found in the extras directory on the
  CD.

  The Socket Server has the ability to install an interception COM object that
  can be called whenever it receives or sends data.  Using this feature, you
  can encrypt or compress data using any method you wish.  This demo uses the
  ZLib compression units that ship on the CD to compress/uncompress all data
  going over the wire.

  To use this demo;
  1) Make sure you have copied the ZLib units from the CD to a directory and
     have added that directory to this projects search path.
  2) Compile Intrcpt.dpr.
  3) Register Intrcpt.DLL using REGSVR32 or TREGSVR on both the client and the
     server.
  4) On the Server: Bring up the properties for the Socket Server (right click
     on the icon in the task bar and select properties) and put the GUID for
     Intrcpt.DLL in the Interceptor GUID edit control.  The GUID is defined
     below as Class_DataCompressor.
  5) On the Client: Set the TSocketConnection.InterceptName property to
     Intrcpt.DataCompressor. This will set the InterceptGUID property to the
     Class_DataCompressor GUID. Recompile your client.
}

interface

uses
  Windows, ActiveX, ComObj, SConnect;

type
  {
    The interception object needs to implement IDataIntercept defined in
    SConnect.pas.  This interface has 2 procedures DataIn and DataOut described
    below.
  }
  TDataCompressor = class(TComObject, IDataIntercept)
  protected
    procedure DataIn(const Data: IDataBlock); stdcall;
    procedure DataOut(const Data: IDataBlock); stdcall;
  end;

const
  Class_DataCompressor: TGUID = '{B249776C-E429-11D1-AAA4-00C04FA35CFA}';

implementation

uses ComServ, SysUtils, ZLib, Classes, MidConst;

{
  DataIn is called whenever data is coming into the client or server.  Use this
  procedure to uncompress or decrypt data.
}
procedure TDataCompressor.DataIn(const Data: IDataBlock);
var
  Size: Integer;
  InStream, OutStream: TMemoryStream;
  ZStream: TDecompressionStream;
  p: Pointer;
begin
  InStream := TMemoryStream.Create;
  try
    { Skip BytesReserved bytes of data }
    p := Pointer(Integer(Data.Memory) + Data.BytesReserved);
    Size := PInteger(p)^;
    if Size = 0 then Exit; 
    p := Pointer(Integer(p) + SizeOf(Size));
    InStream.Write(p^, Data.Size - SizeOf(Size));
    OutStream := TMemoryStream.Create;
    try
      InStream.Position := 0;
      ZStream := TDecompressionStream.Create(InStream);
      try
        OutStream.CopyFrom(ZStream, Size);
      finally
        ZStream.Free;
      end;
      { Clear the datablock, then write the uncompressed data back into the
        datablock }
      Data.Clear;
      Data.Write(OutStream.Memory^, OutStream.Size);
    finally
      OutStream.Free;
    end;
  finally
    InStream.Free;
  end;
end;

{
  DataOut is called whenever data is leaving the client or server.  Use this
  procedure to compress or encrypt data.
}
procedure TDataCompressor.DataOut(const Data: IDataBlock);
var
  InStream, OutStream: TMemoryStream;
  ZStream: TCompressionStream;
  Size: Integer;
begin
  InStream := TMemoryStream.Create;
  try
    { Skip BytesReserved bytes of data }
    InStream.Write(Pointer(Integer(Data.Memory) + Data.BytesReserved)^, Data.Size);
    Size := InStream.Size;
    if Size = 0 then Exit; 
    OutStream := TMemoryStream.Create;
    try
      ZStream := TCompressionStream.Create(clFastest, OutStream);
      try
        ZStream.CopyFrom(InStream, 0);
      finally
        ZStream.Free;
      end;
      { Clear the datablock, then write the compressed data back into the
        datablock }
      Data.Clear;
      Data.Write(Size, SizeOf(Integer));
      Data.Write(OutStream.Memory^, OutStream.Size);
    finally
      OutStream.Free;
    end;
  finally
    InStream.Free;
  end;
end;

initialization
  { Use this class factory to allow for easy identification of Interceptors }
  TPacketInterceptFactory.Create(ComServer, TDataCompressor, Class_DataCompressor,
    'DataCompressor', 'SampleInterceptor', ciMultiInstance, tmApartment);
end.
