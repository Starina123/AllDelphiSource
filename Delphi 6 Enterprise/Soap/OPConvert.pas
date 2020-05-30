{*******************************************************}
{                                                       }
{ Borland Delphi Visual Component Library               }
{                 SOAP Support                          }
{                                                       }
{ Copyright (c) 2001 Borland Software Corporation       }
{                                                       }
{*******************************************************}

unit OPConvert;

interface

uses IntfInfo, InvokeRegistry, SysUtils, Classes;


type

  TSOAPConvertOption = (soSendUntyped, soSendMultiRefObj, soSendMultiRefArray, soTryAllSchema);
  TSOAPConvertOptions = set of TSOAPConvertOption;

  IOPConvert = interface
  ['{BBE4BD6D-EAB1-4CA6-816D-B187E5B43E17}']
    { Property Accessors }
    function GetOptions: TSOAPConvertOptions;
    procedure SetOptions(Value: TSOAPConvertOptions);
    { client methods }
    function InvContextToMsg(const IntfMD: TIntfMetaData; MethNum: Integer; Con: TInvContext): InvString;
    procedure ProcessResponse(const Resp: TStream; const MD: TIntfMethEntry;
      Context: TInvContext);  overload;
    procedure ProcessResponse(const Resp: InvString; const MD: TIntfMethEntry;
      Context: TInvContext);  overload;
    { server methods }
    procedure MsgToInvContext(const Request: InvString; const IntfMD: TIntfMetaData;
      var MethNum: Integer; Context: TInvContext); overload;
    procedure MsgToInvContext(const Request: TStream; const IntfMD: TIntfMetaData;
      var MethNum: Integer; Context: TInvContext);  overload;
    procedure MakeResponse(const IntfMD: TIntfMetaData; const MethNum: Integer;
      Context: TInvContext; Response: TStream);
    function MakeFault(const Ex: Exception): InvString;

    property Options:  TSOAPConvertOptions read GetOptions write SetOptions;
  end;


implementation

end.
