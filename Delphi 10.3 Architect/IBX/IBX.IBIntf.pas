{$A8} {$R-}
{*************************************************************}
{                                                             }
{       Embarcadero Delphi Visual Component Library           }
{       InterBase Express core components                     }
{                                                             }
{       Copyright (c) 1998-2017 Embarcadero Technologies, Inc.}
{              All rights reserved                            }
{                                                             }
{    InterBase Express is based in part on the product        }
{    Free IB Components, written by Gregory H. Deatz for      }
{    Hoagland, Longo, Moran, Dunst & Doukas Company.          }
{    Free IB Components is used under license.                }
{                                                             }
{    Additional code created by Jeff Overcash and used        }
{    with permission.                                         }
{*************************************************************}

unit IBX.IBIntf;

interface

uses
  {$IFDEF MSWINDOWS} Winapi.Windows, {$ENDIF}  IBX.IBHeader, IBX.IBInstallHeader,
  IBX.IBExternals, System.Generics.Collections, System.Classes;

type

  IGDSLibrary = interface
  ['{BCAC76DD-25EB-4261-84FE-0CB3310435E2}']
    function LibraryName: String;
    procedure LoadIBLibrary;
    procedure FreeIBLibrary;
    function TryIBLoad: Boolean;
    procedure CheckIBLoaded;
    function GetIBClientVersion: Currency;

    function isc_attach_database(status_vector : PISC_STATUS; db_name_length : Short;
                                 db_name : PByte; db_handle : PISC_DB_HANDLE;
			                           parm_buffer_length	: Short; parm_buffer : PByte): ISC_STATUS;
    function isc_array_gen_sdl(status_vector : PISC_STATUS; isc_array_desc : PISC_ARRAY_DESC;
                                isc_arg3 : PShort; isc_arg4 : PByte; isc_arg5 : PShort): ISC_STATUS;
    function isc_array_gen_sdl2(status_vector : PISC_STATUS; isc_array_desc : PISC_ARRAY_DESC_V2;
                                isc_arg3 : PShort; isc_arg4 : PByte; isc_arg5 : PShort): ISC_STATUS;
    function isc_array_get_slice(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                 trans_handle : PISC_TR_HANDLE; array_id : PISC_QUAD;
                                 descriptor : PISC_ARRAY_DESC; dest_array : PVoid;
				                         slice_length : ISC_LONG): ISC_STATUS;
    function isc_array_get_slice2(status_vector : PISC_STATUS;
                                 db_handle : PISC_DB_HANDLE; trans_handle : PISC_TR_HANDLE;
                                 array_id : PISC_QUAD; descriptor : PISC_ARRAY_DESC_V2;
                                 dest_array : PVoid; slice_length : ISC_LONG): ISC_STATUS;
    function isc_array_lookup_bounds(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                     trans_handle : PISC_TR_HANDLE; table_name, column_name : PByte;
				                             descriptor : PISC_ARRAY_DESC): ISC_STATUS;
    function isc_array_lookup_bounds2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                      trans_handle : PISC_TR_HANDLE; table_name, column_name : PByte;
				                              descriptor : PISC_ARRAY_DESC_V2): ISC_STATUS;
    function isc_array_lookup_desc(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                   trans_handle : PISC_TR_HANDLE; table_name, column_name : PByte;
				                           descriptor : PISC_ARRAY_DESC): ISC_STATUS;
    function isc_array_lookup_desc2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                    trans_handle : PISC_TR_HANDLE; table_name, column_name : PByte;
                                    descriptor : PISC_ARRAY_DESC_V2): ISC_STATUS;
    function isc_array_set_desc(status_vector : PISC_STATUS; table_name : PByte;
                                 column_name : PByte; sql_dtype, sql_length, sql_dimensions : PShort;
                                 descriptor : PISC_ARRAY_DESC): ISC_STATUS;
    function isc_array_set_desc2(status_vector : PISC_STATUS; table_name : PByte;
				                         column_name : PByte; sql_dtype, sql_length, sql_dimensions : PShort;
                                 descriptor : PISC_ARRAY_DESC_V2): ISC_STATUS;
    function isc_array_put_slice(status_vector : PISC_STATUS; db_handle  : PISC_DB_HANDLE;
                                 trans_handle : PISC_TR_HANDLE; array_id : PISC_QUAD;
                                 descriptor : PISC_ARRAY_DESC; source_array : PVoid;
                                 slice_length : PISC_LONG): ISC_STATUS;
    function isc_array_put_slice2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                 trans_handle : PISC_TR_HANDLE; array_id : PISC_QUAD;
                                 descriptor : PISC_ARRAY_DESC_V2; source_array : PVoid;
                                 slice_length : PISC_LONG): ISC_STATUS;
    procedure isc_blob_default_desc(descriptor : PISC_BLOB_DESC; table_name : PUChar;
                                   column_name : PUChar);
    procedure isc_blob_default_desc2(descriptor : PISC_BLOB_DESC_V2; table_name : PUChar;
                                    column_name : PUChar);
    function isc_blob_gen_bpb(status_vector : PISC_STATUS; to_descriptor, from_descriptor : PISC_BLOB_DESC;
                              bpb_buffer_length : UShort; bpb_buffer : PUChar;
                              bpb_length : PUShort): ISC_STATUS;
    function isc_blob_gen_bpb2(status_vector : PISC_STATUS; to_descriptor, from_descriptor          : PISC_BLOB_DESC_V2;
                               bpb_buffer_length : UShort; bpb_buffer : PUChar;
                               bpb_length  : PUShort): ISC_STATUS;
    function isc_blob_info(status_vector : PISC_STATUS; blob_handle : PISC_BLOB_HANDLE;
				                   item_list_buffer_length : Short; item_list_buffer : PByte;
				                   result_buffer_length : Short; result_buffer : PByte): ISC_STATUS;
    function isc_blob_lookup_desc(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                  trans_handle : PISC_TR_HANDLE; table_name, column_name : PByte;
                                  descriptor : PISC_BLOB_DESC; global : PUChar): ISC_STATUS;
    function isc_blob_lookup_desc2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                   trans_handle : PISC_TR_HANDLE; table_name, column_name : PByte;
                                   descriptor : PISC_BLOB_DESC_v2; global : PUChar): ISC_STATUS;
    function isc_blob_set_desc(status_vector : PISC_STATUS; table_name, column_name : PByte;
                               subtype, charset, segment_size : Short; descriptor : PISC_BLOB_DESC): ISC_STATUS;
    function isc_blob_set_desc2(status_vector : PISC_STATUS; table_name, column_name : PByte;
                                subtype, charset, segment_size : Short;
                                descriptor : PISC_BLOB_DESC_V2): ISC_STATUS;
    function isc_cancel_blob(status_vector  : PISC_STATUS; blob_handle : PISC_BLOB_HANDLE): ISC_STATUS;
    function isc_cancel_events(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
				                       event_id : PISC_LONG): ISC_STATUS;
    function isc_close_blob(status_vector : PISC_STATUS; blob_handle : PISC_BLOB_HANDLE): ISC_STATUS;
    function isc_commit_retaining(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE): ISC_STATUS;
    function isc_commit_transaction(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE): ISC_STATUS;
    function isc_create_blob2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                              tran_handle : PISC_TR_HANDLE; blob_handle : PISC_BLOB_HANDLE;
                              blob_id : PISC_QUAD; bpb_length : Short; bpb_address : PByte): ISC_STATUS;
    function isc_create_database (status_vector: PISC_STATUS;
               db_name_length : Short; db_name : PByte; db_handle : PISC_DB_HANDLE;
			         dpb_length : Short; dpb : PByte; isc_arg7 : Short): ISC_STATUS;
    function isc_database_info(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                               item_list_buffer_length : Short; item_list_buffer : PByte;
                                 result_buffer_length : Short; result_buffer : PByte): ISC_STATUS;
    procedure isc_decode_date(ib_date: PISC_QUAD; tm_date: PCTimeStructure);
    procedure isc_decode_sql_date(ib_date: PISC_DATE; tm_date: PCTimeStructure);
    procedure isc_decode_sql_time(ib_time: PISC_TIME; tm_date: PCTimeStructure);
    procedure isc_decode_timestamp(ib_timestamp: PISC_TIMESTAMP; tm_date: PCTimeStructure);
    function isc_detach_database(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE): ISC_STATUS;
    function isc_drop_database(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE): ISC_STATUS;
    function isc_dsql_alloc_statement2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
				                               stmt_handle : PISC_STMT_HANDLE): ISC_STATUS;
    function isc_dsql_describe(status_vector : PISC_STATUS; stmt_handle : PISC_STMT_HANDLE;
                               dialect : UShort; xsqlda : PXSQLDA): ISC_STATUS;
    function isc_dsql_describe_bind(status_vector : PISC_STATUS; stmt_handle : PISC_STMT_HANDLE;
                                 dialect : UShort; xsqlda : PXSQLDA): ISC_STATUS;
    function isc_dsql_exec_immed2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
				                       tran_handle : PISC_TR_HANDLE; length : UShort;
				                       statement : PByte; dialect : UShort;
                               in_xsqlda, out_xsqlda  : PXSQLDA): ISC_STATUS;
    function isc_dsql_execute(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                              stmt_handle : PISC_STMT_HANDLE; dialect : UShort;
                              xsqlda : PXSQLDA): ISC_STATUS;
    function isc_dsql_execute2(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                               stmt_handle : PISC_STMT_HANDLE; dialect : UShort;
                               in_xsqlda, out_xsqlda : PXSQLDA): ISC_STATUS;
    function isc_dsql_execute_immediate(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
				                                tran_handle : PISC_TR_HANDLE; length : UShort;
				                                statement : PByte; dialect : UShort;
                                        xsqlda : PXSQLDA): ISC_STATUS;
    function isc_dsql_fetch(status_vector : PISC_STATUS; stmt_handle : PISC_STMT_HANDLE;
				                    dialect : UShort; xsqlda : PXSQLDA): ISC_STATUS;
    function isc_dsql_free_statement(status_vector : PISC_STATUS; stmt_handle : PISC_STMT_HANDLE;
                                     options : UShort): ISC_STATUS;
    function isc_dsql_prepare(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                              stmt_handle : PISC_STMT_HANDLE; length : UShort;
                              statement : PByte; dialect : UShort;
                              xsqlda : PXSQLDA): ISC_STATUS;
    function isc_dsql_set_cursor_name(status_vector : PISC_STATUS; stmt_handle : PISC_STMT_HANDLE;
                                      cursor_name : PByte; _type : UShort): ISC_STATUS;
    function isc_dsql_sql_info(status_vector : PISC_STATUS; stmt_handle : PISC_STMT_HANDLE;
				                       item_length : Short; items : PByte; buffer_length : Short;
                               buffer : PByte): ISC_STATUS;
    procedure isc_encode_date(tm_date : PCTimeStructure; ib_date : PISC_QUAD);
    procedure isc_encode_sql_date(tm_date: PCTimeStructure; ib_date : PISC_DATE);
    procedure isc_encode_sql_time(tm_date : PCTimeStructure; ib_time : PISC_TIME);
    procedure isc_encode_timestamp(tm_date : PCTimeStructure; ib_timestamp : PISC_TIMESTAMP);
    function isc_event_block(var event_buffer : PByte; var result_buffer : PByte;
				                     id_count : UShort; event_list : array of PByte): ISC_LONG;
    procedure isc_event_counts(status_vector : PUISC_LONG; buffer_length  : Short;
				                       event_buffer : PByte; result_buffer : PByte);
    function isc_free(isc_arg1 : PByte): ISC_LONG;
    function isc_get_segment(status_vector : PISC_STATUS; blob_handle : PISC_BLOB_HANDLE;
                             actual_seg_length : PUShort; seg_buffer_length : UShort;
				                     seg_buffer : PByte): ISC_STATUS;
    function isc_interprete(buffer : PByte; status_vector : PPISC_STATUS): ISC_STATUS;
    function isc_open_blob2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                            tran_handle : PISC_TR_HANDLE; blob_handle : PISC_BLOB_HANDLE;
				                    blob_id : PISC_QUAD; bpb_length : Short; bpb_buffer : PByte): ISC_STATUS;
    function isc_prepare_transaction2(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                                      msg_length : Short; msg : PByte): ISC_STATUS;
    function isc_put_segment(status_vector : PISC_STATUS; blob_handle : PISC_BLOB_HANDLE;
				                     seg_buffer_len : UShort; seg_buffer : PByte): ISC_STATUS;
    function isc_que_events(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
				                    event_id : PISC_LONG; length : Short; event_buffer : PByte;
                            event_function : TISC_CALLBACK; event_function_arg        : PVoid): ISC_STATUS;
    function isc_release_savepoint(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                                   tran_name : PByte) : ISC_STATUS;
    function isc_rollback_retaining(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE): ISC_STATUS;
    function isc_rollback_savepoint(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                                   tran_name : PByte; Option : UShort) : ISC_STATUS;
    function isc_rollback_transaction(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE): ISC_STATUS;
    function isc_start_multiple(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                                db_handle_count : Short; teb_vector_address : PISC_TEB): ISC_STATUS;
    function isc_start_transaction(status_vector  : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                                 db_handle_count : Short; db_handle : PISC_DB_HANDLE;
                                 tpb_length  : UShort; tpb_address : PByte): ISC_STATUS;
    function isc_start_savepoint(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                                 tran_name : PByte): ISC_STATUS;
    function isc_sqlcode(status_vector : PISC_STATUS): ISC_LONG;
    procedure isc_sql_interprete(sqlcode : Short; buffer : PByte;
                                 buffer_length : Short);
    function isc_vax_integer(buffer : PByte; length : Short): ISC_LONG;
    function isc_portable_integer(buffer : PByte; length : Short): ISC_INT64;
    {IB 8.0 functions}
    function isc_dsql_batch_execute_immed(status_vector : PISC_STATUS;
						   db_handle : PISC_DB_HANDLE; tran_handle : PISC_TR_HANDLE;
						   Dialect : UShort; no_of_sql : ULong; statement : PPByte;
						   rows_affected : PULong) : ISC_STATUS;
    function isc_dsql_batch_execute(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
						   stmt_handle : PISC_STMT_HANDLE; Dialect : UShort;
						   insqlda : PXSQLDA; no_of_rows : UShort;
						   batch_vars : PXSQLVAR; rows_affected : PULong) : ISC_STATUS;

    // Security Functions
    function isc_add_user(status_vector : PISC_STATUS; user_sec_data : PUserSecData): ISC_STATUS;
    function isc_delete_user(status_vector : PISC_STATUS; user_sec_data : PUserSecData): ISC_STATUS;
    function isc_modify_user(status_vector : PISC_STATUS; user_sec_data : PUserSecData): ISC_STATUS;

    // Other OSRI functions
    function isc_prepare_transaction(status_vector         : PISC_STATUS;
                                 tran_handle               : PISC_TR_HANDLE): ISC_STATUS;
    // Other Blob functions
    function BLOB_put(isc_arg1                  : Byte;
             isc_arg2                  : PBSTREAM): Int;
    function BLOB_get(isc_arg1                  : PBSTREAM): Int;

    // Service manager functions
    function isc_service_attach (status_vector             : PISC_STATUS;
                                 isc_arg2                  : UShort;
                                 isc_arg3                  : PByte;
                                 service_handle            : PISC_SVC_HANDLE;
                                 isc_arg5                  : UShort;
                                 isc_arg6                  : PByte): ISC_STATUS;
    function isc_service_detach(status_vector             : PISC_STATUS;
                                service_handle            : PISC_SVC_HANDLE): ISC_STATUS;
    function isc_service_query  (status_vector             : PISC_STATUS;
                                 service_handle            : PISC_SVC_HANDLE;
                                 recv_handle               : PISC_SVC_HANDLE;
                                 isc_arg4                  : UShort;
                                 isc_arg5                  : PByte;
                                 isc_arg6                  : UShort;
                                 isc_arg7                  : PByte;
                                 isc_arg8                  : UShort;
                                 isc_arg9                  : PByte): ISC_STATUS;
    function isc_service_start (status_vector             : PISC_STATUS;
                                service_handle            : PISC_SVC_HANDLE;
                                recv_handle               : PISC_SVC_HANDLE;
                                isc_arg4                  : UShort;
                                isc_arg5                  : PByte): ISC_STATUS;
    // Client information functions
    procedure isc_get_client_version(buffer : PByte);
    function isc_get_client_major_version: Integer;
    function isc_get_client_minor_version: Integer;
    function isc_transaction_info(status_vector            : PISC_STATUS;
                                  tran_handle               : PISC_TR_HANDLE;
                                  item_list_buffer_length   : Short;
                                  item_list_buffer          : PByte;
                                  result_buffer_length      : Short;
                                  result_buffer             : PByte): ISC_STATUS;


  end;

  TIBInterface = TDictionary<string, IGDSLibrary>;

  procedure LoadIBInstallLibrary;
  procedure FreeIBInstallLibrary;
  procedure CheckIBInstallLoaded;
  procedure AddIBInterface(LibName : String; IBInterface : IGDSLibrary);

  function GetGDSLibrary(const ALibrary : String) : IGDSLibrary;
  function ValidateServerType(ALibrary : String) : String;
  procedure GetAvailableLibraries(LibList : TStrings);
{ Library Initialization }

var
  IBClientInterface : TIBInterface;

  isc_install_clear_options: Tisc_install_clear_options;
  isc_install_execute: Tisc_install_execute;
  isc_install_get_info: Tisc_install_get_info;
  isc_install_get_message: Tisc_install_get_message;
  isc_install_load_external_text: Tisc_install_load_external_text;
  isc_install_precheck: Tisc_install_precheck;
  isc_install_set_option: Tisc_install_set_option;
  isc_uninstall_execute: Tisc_uninstall_execute;
  isc_uninstall_precheck: Tisc_uninstall_precheck;
  isc_install_unset_option: Tisc_install_unset_option;


implementation

uses System.SysUtils, IBX.IB, IBX.IBXMLHeader, IBX.IBXConst,
     System.Generics.Defaults
{$IFDEF ANDROID}
  , Posix.Stdlib,
  Androidapi.IOUtils
{$ENDIF};

var
  IBInstallLibrary: HMODULE;

  IBServerLibrary : IGDSLibrary;
  IBEmbeddedLibrary : IGDSLibrary;

{$IF (defined(iOS) and defined(CPUARM)) or defined(ANDROID)}
  {$DEFINE IB_STATIC_LINK}
{$ENDIF}

{$IFDEF IB_STATIC_LINK}

const
  {$IFDEF UNDERSCOREIMPORTNAME}
  PU = '_';
  {$ELSE}
  PU = '';
  {$ENDIF}
  {$IF defined(iOS)}
  IBLibDep = 'stdc++';
  {$ENDIF}

  function _isc_attach_database(status_vector : PISC_STATUS; db_name_length : Short;
                               db_name : PByte; db_handle : PISC_DB_HANDLE;
                               parm_buffer_length	: Short; parm_buffer : PByte): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_attach_database' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_array_gen_sdl(status_vector : PISC_STATUS; isc_array_desc : PISC_ARRAY_DESC;
                                isc_arg3 : PShort; isc_arg4 : PByte; isc_arg5 : PShort): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_array_gen_sdl' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_array_gen_sdl2(status_vector : PISC_STATUS; isc_array_desc : PISC_ARRAY_DESC_V2;
                              isc_arg3 : PShort; isc_arg4 : PByte; isc_arg5 : PShort): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_array_gen_sdl2' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_array_get_slice(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                               trans_handle : PISC_TR_HANDLE; array_id : PISC_QUAD;
                               descriptor : PISC_ARRAY_DESC; dest_array : PVoid;
                               slice_length : ISC_LONG): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_array_get_slice' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_array_get_slice2(status_vector : PISC_STATUS;
                               db_handle : PISC_DB_HANDLE; trans_handle : PISC_TR_HANDLE;
                               array_id : PISC_QUAD; descriptor : PISC_ARRAY_DESC_V2;
                               dest_array : PVoid; slice_length : ISC_LONG): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_array_get_slice2' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_array_lookup_bounds(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                   trans_handle : PISC_TR_HANDLE; table_name, column_name : PByte;
                                   descriptor : PISC_ARRAY_DESC): ISC_STATUS;  cdecl; external 'libibtogo.a' name PU + 'isc_array_lookup_bounds' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_array_lookup_bounds2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                    trans_handle : PISC_TR_HANDLE; table_name, column_name : PByte;
                                    descriptor : PISC_ARRAY_DESC_V2): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_array_lookup_bounds2' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_array_lookup_desc(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                 trans_handle : PISC_TR_HANDLE; table_name, column_name : PByte;
                                 descriptor : PISC_ARRAY_DESC): ISC_STATUS;  cdecl; external 'libibtogo.a' name PU + 'isc_array_lookup_desc' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_array_lookup_desc2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                  trans_handle : PISC_TR_HANDLE; table_name, column_name : PByte;
                                  descriptor : PISC_ARRAY_DESC_V2): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_array_lookup_desc2' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_array_set_desc(status_vector : PISC_STATUS; table_name : PByte;
                              column_name : PByte; sql_dtype, sql_length, sql_dimensions           : PShort;
                               descriptor : PISC_ARRAY_DESC): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_array_set_desc' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_array_set_desc2(status_vector : PISC_STATUS; table_name : PByte;
                               column_name : PByte; sql_dtype, sql_length, sql_dimensions : PShort;
                               descriptor : PISC_ARRAY_DESC_V2): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_array_set_desc2' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_array_put_slice(status_vector : PISC_STATUS; db_handle  : PISC_DB_HANDLE;
                               trans_handle : PISC_TR_HANDLE; array_id : PISC_QUAD;
                               descriptor : PISC_ARRAY_DESC; source_array : PVoid;
                               slice_length : PISC_LONG): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_array_put_slice' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_array_put_slice2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                               trans_handle : PISC_TR_HANDLE; array_id : PISC_QUAD;
                               descriptor : PISC_ARRAY_DESC_V2; source_array : PVoid;
                               slice_length : PISC_LONG): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_array_put_slice2' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  procedure _isc_blob_default_desc(descriptor : PISC_BLOB_DESC; table_name : PUChar;
                                 column_name : PUChar); cdecl; external 'libibtogo.a' name PU + 'isc_blob_default_desc' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  procedure _isc_blob_default_desc2(descriptor : PISC_BLOB_DESC_V2; table_name : PUChar;
                                  column_name : PUChar); cdecl; external 'libibtogo.a' name PU + 'isc_blob_default_desc2' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_blob_gen_bpb(status_vector : PISC_STATUS; to_descriptor, from_descriptor : PISC_BLOB_DESC;
                            bpb_buffer_length : UShort; bpb_buffer : PUChar;
                            bpb_length : PUShort): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_blob_gen_bpb' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_blob_gen_bpb2(status_vector : PISC_STATUS; to_descriptor, from_descriptor          : PISC_BLOB_DESC_V2;
                             bpb_buffer_length : UShort; bpb_buffer : PUChar;
                             bpb_length  : PUShort): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_blob_gen_bpb2' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_blob_info(status_vector : PISC_STATUS; blob_handle : PISC_BLOB_HANDLE;
                         item_list_buffer_length : Short; item_list_buffer : PByte;
                         result_buffer_length : Short; result_buffer : PByte): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_blob_info' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_blob_lookup_desc(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                trans_handle : PISC_TR_HANDLE; table_name, column_name : PByte;
                                descriptor : PISC_BLOB_DESC; global : PUChar): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_blob_lookup_desc' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_blob_lookup_desc2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                 trans_handle : PISC_TR_HANDLE; table_name, column_name : PByte;
                                 descriptor : PISC_BLOB_DESC_v2; global : PUChar): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_blob_lookup_desc2' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_blob_set_desc(status_vector : PISC_STATUS; table_name, column_name : PByte;
                             subtype, charset, segment_size : Short; descriptor : PISC_BLOB_DESC): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_blob_set_desc' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_blob_set_desc2(status_vector : PISC_STATUS; table_name, column_name : PByte;
                              subtype, charset, segment_size : Short;
                              descriptor : PISC_BLOB_DESC_V2): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_blob_set_desc2' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_cancel_blob(status_vector  : PISC_STATUS; blob_handle : PISC_BLOB_HANDLE): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_cancel_blob' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_cancel_events(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                             event_id : PISC_LONG): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_cancel_events' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_close_blob(status_vector : PISC_STATUS; blob_handle : PISC_BLOB_HANDLE): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_close_blob' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_commit_retaining(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_commit_retaining' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_commit_transaction(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_commit_transaction' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_create_blob2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                            tran_handle : PISC_TR_HANDLE; blob_handle : PISC_BLOB_HANDLE;
                            blob_id : PISC_QUAD; bpb_length : Short; bpb_address : PByte): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_create_blob2' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_create_database (status_vector: PISC_STATUS;
               db_name_length : Short; db_name : PByte; db_handle : PISC_DB_HANDLE;
			         dpb_length : Short; dpb : PByte; isc_arg7 : Short): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_create_database' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_database_info(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                             item_list_buffer_length : Short; item_list_buffer : PByte;
                               result_buffer_length : Short; result_buffer : PByte): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_database_info' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  procedure _isc_decode_date(ib_date: PISC_QUAD; tm_date: PCTimeStructure); cdecl; external 'libibtogo.a' name PU + 'isc_decode_date' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  procedure _isc_decode_sql_date(ib_date: PISC_DATE; tm_date: PCTimeStructure); cdecl; external 'libibtogo.a' name PU + 'isc_decode_sql_date' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  procedure _isc_decode_sql_time(ib_time: PISC_TIME; tm_date: PCTimeStructure); cdecl; external 'libibtogo.a' name PU + 'isc_decode_sql_time' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  procedure _isc_decode_timestamp(ib_timestamp: PISC_TIMESTAMP; tm_date: PCTimeStructure);  cdecl; external 'libibtogo.a' name PU + 'isc_decode_timestamp' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_detach_database(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_detach_database' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_drop_database(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_drop_database' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_dsql_alloc_statement2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                     stmt_handle : PISC_STMT_HANDLE): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_dsql_alloc_statement2' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_dsql_describe(status_vector : PISC_STATUS; stmt_handle : PISC_STMT_HANDLE;
                             dialect : UShort; xsqlda : PXSQLDA): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_dsql_describe' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_dsql_describe_bind(status_vector : PISC_STATUS; stmt_handle : PISC_STMT_HANDLE;
                               dialect : UShort; xsqlda : PXSQLDA): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_dsql_describe_bind' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_dsql_exec_immed2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
				                       tran_handle : PISC_TR_HANDLE; length : UShort;
				                       statement : PByte; dialect : UShort;
                               in_xsqlda, out_xsqlda  : PXSQLDA): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_dsql_exec_immed2' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_dsql_execute(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                            stmt_handle : PISC_STMT_HANDLE; dialect : UShort;
                            xsqlda : PXSQLDA): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_dsql_execute' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_dsql_execute2(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                             stmt_handle : PISC_STMT_HANDLE; dialect : UShort;
                             in_xsqlda, out_xsqlda : PXSQLDA): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_dsql_execute2' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_dsql_execute_immediate(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                      tran_handle : PISC_TR_HANDLE; length : UShort;
                                      statement : PByte; dialect : UShort;
                                      xsqlda : PXSQLDA): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_dsql_execute_immediate' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_dsql_fetch(status_vector : PISC_STATUS; stmt_handle : PISC_STMT_HANDLE;
                          dialect : UShort; xsqlda : PXSQLDA): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_dsql_fetch' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_dsql_free_statement(status_vector : PISC_STATUS; stmt_handle : PISC_STMT_HANDLE;
                                   options : UShort): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_dsql_free_statement' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_dsql_prepare(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                            stmt_handle : PISC_STMT_HANDLE; length : UShort;
                            statement : PByte; dialect : UShort;
                            xsqlda : PXSQLDA): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_dsql_prepare' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_dsql_set_cursor_name(status_vector : PISC_STATUS; stmt_handle : PISC_STMT_HANDLE;
                                    cursor_name : PByte; _type : UShort): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_dsql_set_cursor_name' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_dsql_sql_info(status_vector : PISC_STATUS; stmt_handle : PISC_STMT_HANDLE;
                             item_length : Short; items : PByte; buffer_length : Short;
                             buffer : PByte): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_dsql_sql_info' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  procedure _isc_encode_date(tm_date : PCTimeStructure; ib_date : PISC_QUAD); cdecl; external 'libibtogo.a' name PU + 'isc_encode_date' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  procedure _isc_encode_sql_date(tm_date: PCTimeStructure; ib_date : PISC_DATE); cdecl; external 'libibtogo.a' name PU + 'isc_encode_sql_date' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  procedure _isc_encode_sql_time(tm_date : PCTimeStructure; ib_time : PISC_TIME); cdecl; external 'libibtogo.a' name PU + 'isc_encode_sql_time' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  procedure _isc_encode_timestamp(tm_date : PCTimeStructure; ib_timestamp : PISC_TIMESTAMP); cdecl; external 'libibtogo.a' name PU + 'isc_encode_timestamp' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_event_block(var event_buffer : PByte; var result_buffer : PByte;
                           id_count : UShort; event_list : array of PByte): ISC_LONG; cdecl; external 'libibtogo.a' name PU + 'isc_event_block' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  procedure _isc_event_counts(status_vector : PUISC_LONG; buffer_length  : Short;
                             event_buffer : PByte; result_buffer : PByte); cdecl; external 'libibtogo.a' name PU + 'isc_event_counts' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_free(isc_arg1 : PByte): ISC_LONG;  cdecl; external 'libibtogo.a' name PU + 'isc_free' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_get_segment(status_vector : PISC_STATUS; blob_handle : PISC_BLOB_HANDLE;
                           actual_seg_length : PUShort; seg_buffer_length : UShort;
                           seg_buffer : PByte): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_get_segment' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_interprete(buffer : PByte; status_vector : PPISC_STATUS): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_interprete' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_open_blob2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                          tran_handle : PISC_TR_HANDLE; blob_handle : PISC_BLOB_HANDLE;
                          blob_id : PISC_QUAD; bpb_length : Short; bpb_buffer : PByte): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_open_blob2' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_prepare_transaction2(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                                    msg_length : Short; msg : PByte): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_prepare_transaction2' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_put_segment(status_vector : PISC_STATUS; blob_handle : PISC_BLOB_HANDLE;
                           seg_buffer_len : UShort; seg_buffer : PByte): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_put_segment' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_que_events(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                          event_id : PISC_LONG; length : Short; event_buffer : PByte;
                          event_function : TISC_CALLBACK; event_function_arg        : PVoid): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_que_events' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_release_savepoint(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                                 tran_name : PByte) : ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_put_segment' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_rollback_retaining(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_rollback_retaining' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_rollback_savepoint(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                                 tran_name : PByte; Option : UShort) : ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_rollback_savepoint' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_rollback_transaction(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_rollback_transaction' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_start_multiple(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                              db_handle_count : Short; teb_vector_address : PISC_TEB): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_start_multiple' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_start_transaction(status_vector  : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                                 db_handle_count : Short; db_handle : PISC_DB_HANDLE;
                                 tpb_length  : UShort; tpb_address : PByte): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_start_transaction' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_start_savepoint(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                               tran_name : PByte): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_start_savepoint' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_sqlcode(status_vector : PISC_STATUS): ISC_LONG; cdecl; external 'libibtogo.a' name PU + 'isc_sqlcode' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  procedure _isc_sql_interprete(sqlcode : Short; buffer : PByte;
                               buffer_length : Short);  cdecl; external 'libibtogo.a' name PU + 'isc_sql_interprete' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_vax_integer(buffer : PByte; length : Short): ISC_LONG;  cdecl; external 'libibtogo.a' name PU + 'isc_vax_integer' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_portable_integer(buffer : PByte; length : Short): ISC_INT64;  cdecl; external 'libibtogo.a' name PU + 'isc_portable_integer' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  {IB 8.0 functions}
  function _isc_dsql_batch_execute_immed(status_vector : PISC_STATUS;
             db_handle : PISC_DB_HANDLE; tran_handle : PISC_TR_HANDLE;
             Dialect : UShort; no_of_sql : ULong; statement : PPByte;
             rows_affected : PULong) : ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_dsql_batch_execute_immed' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_dsql_batch_execute(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
             stmt_handle : PISC_STMT_HANDLE; Dialect : UShort;
             insqlda : PXSQLDA; no_of_rows : UShort;
             batch_vars : PXSQLVAR; rows_affected : PULong) : ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_dsql_batch_execute' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}

  // Security Functions
  function _isc_add_user(status_vector : PISC_STATUS; user_sec_data : PUserSecData): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_add_user' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_delete_user(status_vector : PISC_STATUS; user_sec_data : PUserSecData): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_delete_user' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_modify_user(status_vector : PISC_STATUS; user_sec_data : PUserSecData): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_modify_user' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}

  // Other OSRI functions
  function _isc_prepare_transaction(status_vector         : PISC_STATUS;
                               tran_handle               : PISC_TR_HANDLE): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_prepare_transaction' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  // Other Blob functions
  function _BLOB_put(isc_arg1                  : Byte;
           isc_arg2                  : PBSTREAM): Int;  cdecl; external 'libibtogo.a' name PU + 'BLOB_put' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _BLOB_get(isc_arg1                  : PBSTREAM): Int; cdecl; external 'libibtogo.a' name PU + 'BLOB_get' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}

  // Service manager functions
  function _isc_service_attach (status_vector             : PISC_STATUS;
                               isc_arg2                  : UShort;
                               isc_arg3                  : PByte;
                               service_handle            : PISC_SVC_HANDLE;
                               isc_arg5                  : UShort;
                               isc_arg6                  : PByte): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_service_attach' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_service_detach(status_vector             : PISC_STATUS;
                              service_handle            : PISC_SVC_HANDLE): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_service_detach' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_service_query  (status_vector             : PISC_STATUS;
                               service_handle            : PISC_SVC_HANDLE;
                               recv_handle               : PISC_SVC_HANDLE;
                               isc_arg4                  : UShort;
                               isc_arg5                  : PByte;
                               isc_arg6                  : UShort;
                               isc_arg7                  : PByte;
                               isc_arg8                  : UShort;
                               isc_arg9                  : PByte): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_service_query' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_service_start (status_vector             : PISC_STATUS;
                              service_handle            : PISC_SVC_HANDLE;
                              recv_handle               : PISC_SVC_HANDLE;
                              isc_arg4                  : UShort;
                              isc_arg5                  : PByte): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_service_start' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  // Client information functions
  procedure _isc_get_client_version(buffer : PByte); cdecl; external 'libibtogo.a' name PU + 'isc_get_client_version' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_get_client_major_version: Integer; cdecl; external 'libibtogo.a' name PU + 'isc_get_client_major_version' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_get_client_minor_version: Integer; cdecl; external 'libibtogo.a' name PU + 'isc_get_client_minor_version' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
  function _isc_transaction_info(status_vector            : PISC_STATUS;
                                tran_handle               : PISC_TR_HANDLE;
                                item_list_buffer_length   : Short;
                                item_list_buffer          : PByte;
                                result_buffer_length      : Short;
                                result_buffer             : PByte): ISC_STATUS; cdecl; external 'libibtogo.a' name PU + 'isc_transaction_info' dependency {$IFDEF IOS}LibCPP,IBLibDep{$ELSE}'gnustl_static'{$ENDIF}; {do not localize}
{$ENDIF}

type

  TIBServerLibrary = class(TInterfacedObject, IGDSLibrary)
  private
    FIBLibrary: HMODULE;
    FIBXMLLibrary : HMODULE;
    FIBClientVersion: Currency;

    {$IF Defined(MACOS) or Defined(IB_iOSSimulator) or Defined(POSIX)}
    FIBCrypt : HMODULE;
    {$ENDIF}
    FBLOB_get: TBLOB_get;
    FBLOB_put: TBLOB_put;
    Fisc_sqlcode: Tisc_sqlcode;
    Fisc_sql_interprete: Tisc_sql_interprete;
    Fisc_interprete: Tisc_interprete;
    Fisc_vax_integer: Tisc_vax_integer;
    Fisc_portable_integer: Tisc_portable_integer;
    Fisc_blob_info: Tisc_blob_info;
    Fisc_open_blob2: Tisc_open_blob2;
    Fisc_close_blob: Tisc_close_blob;
    Fisc_get_segment: Tisc_get_segment;
    Fisc_put_segment: Tisc_put_segment;
    Fisc_create_blob2: Tisc_create_blob2;
    Fisc_create_database : Tisc_create_database;
    Fisc_array_gen_sdl : Tisc_array_gen_sdl;
    Fisc_array_get_slice : Tisc_array_get_slice;
    Fisc_array_lookup_bounds : Tisc_array_lookup_bounds;
    Fisc_array_lookup_desc : Tisc_array_lookup_desc;
    Fisc_array_set_desc : Tisc_array_set_desc;
    Fisc_array_put_slice : Tisc_array_put_slice;
    Fisc_blob_default_desc : Tisc_blob_default_desc;
    Fisc_blob_gen_bpb : Tisc_blob_gen_bpb;
    Fisc_blob_lookup_desc : Tisc_blob_lookup_desc;
    Fisc_blob_set_desc : Tisc_blob_set_desc;
    Fisc_cancel_blob : Tisc_cancel_blob;

    Fisc_service_attach: Tisc_service_attach;
    Fisc_service_detach: Tisc_service_detach;
    Fisc_service_query: Tisc_service_query;
    Fisc_service_start: Tisc_service_start;
    Fisc_decode_date: Tisc_decode_date;
    Fisc_decode_sql_date: Tisc_decode_sql_date;
    Fisc_decode_sql_time: Tisc_decode_sql_time;
    Fisc_decode_timestamp: Tisc_decode_timestamp;
    Fisc_encode_date: Tisc_encode_date;
    Fisc_encode_sql_date: Tisc_encode_sql_date;
    Fisc_encode_sql_time: Tisc_encode_sql_time;
    Fisc_encode_timestamp: Tisc_encode_timestamp;
    Fisc_dsql_free_statement: Tisc_dsql_free_statement;
    Fisc_dsql_execute2: Tisc_dsql_execute2;

    Fisc_dsql_execute: Tisc_dsql_execute;
    Fisc_dsql_set_cursor_name: Tisc_dsql_set_cursor_name;
    Fisc_dsql_fetch: Tisc_dsql_fetch;
    Fisc_dsql_sql_info: Tisc_dsql_sql_info;
    Fisc_dsql_alloc_statement2: Tisc_dsql_alloc_statement2;
    Fisc_dsql_prepare: Tisc_dsql_prepare;
    Fisc_dsql_describe_bind: Tisc_dsql_describe_bind;
    Fisc_dsql_exec_immed2 : Tisc_dsql_exec_immed2;
    Fisc_dsql_describe: Tisc_dsql_describe;
    Fisc_dsql_execute_immediate: Tisc_dsql_execute_immediate;
    Fisc_drop_database: Tisc_drop_database;
    Fisc_detach_database: Tisc_detach_database;
    Fisc_attach_database: Tisc_attach_database;
    Fisc_database_info: Tisc_database_info;
    Fisc_start_multiple: Tisc_start_multiple;
    Fisc_start_transaction : Tisc_start_transaction;
    Fisc_commit_transaction: Tisc_commit_transaction;
    Fisc_commit_retaining: Tisc_commit_retaining;
    Fisc_rollback_transaction: Tisc_rollback_transaction;
    Fisc_rollback_retaining: Tisc_rollback_retaining;
    Fisc_cancel_events: Tisc_cancel_events;
    Fisc_que_events: Tisc_que_events;
    Fisc_event_counts: Tisc_event_counts;
    Fisc_event_block: Tisc_event_block;
    Fisc_free: Tisc_free;
    Fisc_add_user   : Tisc_add_user;
    Fisc_delete_user: Tisc_delete_user;
    Fisc_modify_user: Tisc_modify_user;
    Fisc_prepare_transaction : Tisc_prepare_transaction;
    Fisc_prepare_transaction2 : Tisc_prepare_transaction2;

    { IB 7.0 functions only}
    Fisc_get_client_version : Tisc_get_client_version;
    Fisc_get_client_major_version : Tisc_get_client_major_version;
    Fisc_get_client_minor_version : Tisc_get_client_minor_version;
    Fisc_array_gen_sdl2 : Tisc_array_gen_sdl2;
    Fisc_array_get_slice2 : Tisc_array_get_slice2;
    Fisc_array_lookup_bounds2 : Tisc_array_lookup_bounds2;
    Fisc_array_lookup_desc2 : Tisc_array_lookup_desc2;
    Fisc_array_set_desc2 : Tisc_array_set_desc2;
    Fisc_array_put_slice2 : Tisc_array_put_slice2;
    Fisc_blob_default_desc2 : Tisc_blob_default_desc2;
    Fisc_blob_gen_bpb2 : Tisc_blob_gen_bpb2;
    Fisc_blob_lookup_desc2 : Tisc_blob_lookup_desc2;
    Fisc_blob_set_desc2 : Tisc_blob_set_desc2;

    {IB 7.1 functions only}
    Fisc_release_savepoint : Tisc_release_savepoint;
    Fisc_rollback_savepoint : Tisc_rollback_savepoint;
    Fisc_start_savepoint : Tisc_start_savepoint;
    Fisc_transaction_info : Tisc_transaction_info;

    {IB 8.0 functions only}
    Fisc_dsql_batch_execute_immed : Tisc_dsql_batch_execute_immed;
    Fisc_dsql_batch_execute: Tisc_dsql_batch_execute;

  public
    constructor Create;
    function LibraryName: String; virtual;

    procedure LoadIBLibrary;
    procedure FreeIBLibrary;
    function TryIBLoad: Boolean;
    procedure CheckIBLoaded;
    function GetIBClientVersion: Currency;

    function isc_attach_database(status_vector : PISC_STATUS; db_name_length : Short;
                                 db_name : PByte; db_handle : PISC_DB_HANDLE;
			                           parm_buffer_length	: Short; parm_buffer : PByte): ISC_STATUS;
    function isc_array_gen_sdl(status_vector : PISC_STATUS; isc_array_desc : PISC_ARRAY_DESC;
                                isc_arg3 : PShort; isc_arg4 : PByte; isc_arg5 : PShort): ISC_STATUS;
    function isc_array_gen_sdl2(status_vector : PISC_STATUS; isc_array_desc : PISC_ARRAY_DESC_V2;
                                isc_arg3 : PShort; isc_arg4 : PByte; isc_arg5 : PShort): ISC_STATUS;
    function isc_array_get_slice(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                 trans_handle : PISC_TR_HANDLE; array_id : PISC_QUAD;
                                 descriptor : PISC_ARRAY_DESC; dest_array : PVoid;
				                         slice_length : ISC_LONG): ISC_STATUS;
    function isc_array_get_slice2(status_vector : PISC_STATUS;
                                 db_handle : PISC_DB_HANDLE; trans_handle : PISC_TR_HANDLE;
                                 array_id : PISC_QUAD; descriptor : PISC_ARRAY_DESC_V2;
                                 dest_array : PVoid; slice_length : ISC_LONG): ISC_STATUS;
    function isc_array_lookup_bounds(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                     trans_handle : PISC_TR_HANDLE; table_name, column_name : PByte;
				                             descriptor : PISC_ARRAY_DESC): ISC_STATUS;
    function isc_array_lookup_bounds2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                      trans_handle : PISC_TR_HANDLE; table_name, column_name : PByte;
				                              descriptor : PISC_ARRAY_DESC_V2): ISC_STATUS;
    function isc_array_lookup_desc(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                   trans_handle : PISC_TR_HANDLE; table_name, column_name : PByte;
				                           descriptor : PISC_ARRAY_DESC): ISC_STATUS;
    function isc_array_lookup_desc2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                    trans_handle : PISC_TR_HANDLE; table_name, column_name : PByte;
                                    descriptor : PISC_ARRAY_DESC_V2): ISC_STATUS;
    function isc_array_set_desc(status_vector : PISC_STATUS; table_name : PByte;
                                column_name : PByte; sql_dtype, sql_length, sql_dimensions           : PShort;
                                 descriptor : PISC_ARRAY_DESC): ISC_STATUS;
    function isc_array_set_desc2(status_vector : PISC_STATUS; table_name : PByte;
				                         column_name : PByte; sql_dtype, sql_length, sql_dimensions : PShort;
                                 descriptor : PISC_ARRAY_DESC_V2): ISC_STATUS;
    function isc_array_put_slice(status_vector : PISC_STATUS; db_handle  : PISC_DB_HANDLE;
                                 trans_handle : PISC_TR_HANDLE; array_id : PISC_QUAD;
                                 descriptor : PISC_ARRAY_DESC; source_array : PVoid;
                                 slice_length : PISC_LONG): ISC_STATUS;
    function isc_array_put_slice2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                 trans_handle : PISC_TR_HANDLE; array_id : PISC_QUAD;
                                 descriptor : PISC_ARRAY_DESC_V2; source_array : PVoid;
                                 slice_length : PISC_LONG): ISC_STATUS;
    procedure isc_blob_default_desc(descriptor : PISC_BLOB_DESC; table_name : PUChar;
                                   column_name : PUChar);
    procedure isc_blob_default_desc2(descriptor : PISC_BLOB_DESC_V2; table_name : PUChar;
                                    column_name : PUChar);
    function isc_blob_gen_bpb(status_vector : PISC_STATUS; to_descriptor, from_descriptor : PISC_BLOB_DESC;
                              bpb_buffer_length : UShort; bpb_buffer : PUChar;
                              bpb_length : PUShort): ISC_STATUS;
    function isc_blob_gen_bpb2(status_vector : PISC_STATUS; to_descriptor, from_descriptor          : PISC_BLOB_DESC_V2;
                               bpb_buffer_length : UShort; bpb_buffer : PUChar;
                               bpb_length  : PUShort): ISC_STATUS;
    function isc_blob_info(status_vector : PISC_STATUS; blob_handle : PISC_BLOB_HANDLE;
				                   item_list_buffer_length : Short; item_list_buffer : PByte;
				                   result_buffer_length : Short; result_buffer : PByte): ISC_STATUS;
    function isc_blob_lookup_desc(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                  trans_handle : PISC_TR_HANDLE; table_name, column_name : PByte;
                                  descriptor : PISC_BLOB_DESC; global : PUChar): ISC_STATUS;
    function isc_blob_lookup_desc2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                                   trans_handle : PISC_TR_HANDLE; table_name, column_name : PByte;
                                   descriptor : PISC_BLOB_DESC_v2; global : PUChar): ISC_STATUS;
    function isc_blob_set_desc(status_vector : PISC_STATUS; table_name, column_name : PByte;
                               subtype, charset, segment_size : Short; descriptor : PISC_BLOB_DESC): ISC_STATUS;
    function isc_blob_set_desc2(status_vector : PISC_STATUS; table_name, column_name : PByte;
                                subtype, charset, segment_size : Short;
                                descriptor : PISC_BLOB_DESC_V2): ISC_STATUS;
    function isc_cancel_blob(status_vector  : PISC_STATUS; blob_handle : PISC_BLOB_HANDLE): ISC_STATUS;
    function isc_cancel_events(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
				                       event_id : PISC_LONG): ISC_STATUS;
    function isc_close_blob(status_vector : PISC_STATUS; blob_handle : PISC_BLOB_HANDLE): ISC_STATUS;
    function isc_commit_retaining(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE): ISC_STATUS;
    function isc_commit_transaction(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE): ISC_STATUS;
    function isc_create_blob2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                              tran_handle : PISC_TR_HANDLE; blob_handle : PISC_BLOB_HANDLE;
                              blob_id : PISC_QUAD; bpb_length : Short; bpb_address : PByte): ISC_STATUS;
    function isc_create_database(status_vector: PISC_STATUS;
               db_name_length : Short; db_name : PByte; db_handle : PISC_DB_HANDLE;
			         dpb_length : Short; dpb : PByte; isc_arg7 : Short): ISC_STATUS;
    function isc_database_info(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                               item_list_buffer_length : Short; item_list_buffer : PByte;
                                 result_buffer_length : Short; result_buffer : PByte): ISC_STATUS;
    procedure isc_decode_date(ib_date: PISC_QUAD; tm_date: PCTimeStructure);
    procedure isc_decode_sql_date(ib_date: PISC_DATE; tm_date: PCTimeStructure);
    procedure isc_decode_sql_time(ib_time: PISC_TIME; tm_date: PCTimeStructure);
    procedure isc_decode_timestamp(ib_timestamp: PISC_TIMESTAMP; tm_date: PCTimeStructure);
    function isc_detach_database(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE): ISC_STATUS;
    function isc_drop_database(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE): ISC_STATUS;
    function isc_dsql_alloc_statement2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
				                               stmt_handle : PISC_STMT_HANDLE): ISC_STATUS;
    function isc_dsql_describe(status_vector : PISC_STATUS; stmt_handle : PISC_STMT_HANDLE;
                               dialect : UShort; xsqlda : PXSQLDA): ISC_STATUS;
    function isc_dsql_describe_bind(status_vector : PISC_STATUS; stmt_handle : PISC_STMT_HANDLE;
                                 dialect : UShort; xsqlda : PXSQLDA): ISC_STATUS;
    function isc_dsql_exec_immed2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
				                       tran_handle : PISC_TR_HANDLE; length : UShort;
				                       statement : PByte; dialect : UShort;
                               in_xsqlda, out_xsqlda  : PXSQLDA): ISC_STATUS;
    function isc_dsql_execute(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                              stmt_handle : PISC_STMT_HANDLE; dialect : UShort;
                              xsqlda : PXSQLDA): ISC_STATUS;
    function isc_dsql_execute2(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                               stmt_handle : PISC_STMT_HANDLE; dialect : UShort;
                               in_xsqlda, out_xsqlda : PXSQLDA): ISC_STATUS;
    function isc_dsql_execute_immediate(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
				                                tran_handle : PISC_TR_HANDLE; length : UShort;
				                                statement : PByte; dialect : UShort;
                                        xsqlda : PXSQLDA): ISC_STATUS;
    function isc_dsql_fetch(status_vector : PISC_STATUS; stmt_handle : PISC_STMT_HANDLE;
				                    dialect : UShort; xsqlda : PXSQLDA): ISC_STATUS;
    function isc_dsql_free_statement(status_vector : PISC_STATUS; stmt_handle : PISC_STMT_HANDLE;
                                     options : UShort): ISC_STATUS;
    function isc_dsql_prepare(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                              stmt_handle : PISC_STMT_HANDLE; length : UShort;
                              statement : PByte; dialect : UShort;
                              xsqlda : PXSQLDA): ISC_STATUS;
    function isc_dsql_set_cursor_name(status_vector : PISC_STATUS; stmt_handle : PISC_STMT_HANDLE;
                                      cursor_name : PByte; _type : UShort): ISC_STATUS;
    function isc_dsql_sql_info(status_vector : PISC_STATUS; stmt_handle : PISC_STMT_HANDLE;
				                       item_length : Short; items : PByte; buffer_length : Short;
                               buffer : PByte): ISC_STATUS;
    procedure isc_encode_date(tm_date : PCTimeStructure; ib_date : PISC_QUAD);
    procedure isc_encode_sql_date(tm_date: PCTimeStructure; ib_date : PISC_DATE);
    procedure isc_encode_sql_time(tm_date : PCTimeStructure; ib_time : PISC_TIME);
    procedure isc_encode_timestamp(tm_date : PCTimeStructure; ib_timestamp : PISC_TIMESTAMP);
    function isc_event_block(var event_buffer : PByte; var result_buffer : PByte;
				                     id_count : UShort; event_list : array of PByte): ISC_LONG;
    procedure isc_event_counts(status_vector : PUISC_LONG; buffer_length  : Short;
				                       event_buffer : PByte; result_buffer : PByte);
    function isc_free(isc_arg1 : PByte): ISC_LONG;
    function isc_get_segment(status_vector : PISC_STATUS; blob_handle : PISC_BLOB_HANDLE;
                             actual_seg_length : PUShort; seg_buffer_length : UShort;
				                     seg_buffer : PByte): ISC_STATUS;
    function isc_interprete(buffer : PByte; status_vector : PPISC_STATUS): ISC_STATUS;
    function isc_open_blob2(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
                            tran_handle : PISC_TR_HANDLE; blob_handle : PISC_BLOB_HANDLE;
				                    blob_id : PISC_QUAD; bpb_length : Short; bpb_buffer : PByte): ISC_STATUS;
    function isc_prepare_transaction2(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                                      msg_length : Short; msg : PByte): ISC_STATUS;
    function isc_put_segment(status_vector : PISC_STATUS; blob_handle : PISC_BLOB_HANDLE;
				                     seg_buffer_len : UShort; seg_buffer : PByte): ISC_STATUS;
    function isc_que_events(status_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
				                    event_id : PISC_LONG; length : Short; event_buffer : PByte;
                            event_function : TISC_CALLBACK; event_function_arg        : PVoid): ISC_STATUS;
    function isc_release_savepoint(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                                   tran_name : PByte) : ISC_STATUS;
    function isc_rollback_retaining(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE): ISC_STATUS;
    function isc_rollback_savepoint(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                                   tran_name : PByte; Option : UShort) : ISC_STATUS;
    function isc_rollback_transaction(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE): ISC_STATUS;
    function isc_start_multiple(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                                db_handle_count : Short; teb_vector_address : PISC_TEB): ISC_STATUS;
    function isc_start_transaction(status_vector  : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                                 db_handle_count : Short; db_handle : PISC_DB_HANDLE;
                                 tpb_length  : UShort; tpb_address : PByte): ISC_STATUS;
    function isc_start_savepoint(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
                                 tran_name : PByte): ISC_STATUS;
    function isc_sqlcode(status_vector : PISC_STATUS): ISC_LONG;
    procedure isc_sql_interprete(sqlcode : Short; buffer : PByte;
                                 buffer_length : Short);
    function isc_vax_integer(buffer : PByte; length : Short): ISC_LONG;
    function isc_portable_integer(buffer : PByte; length : Short): ISC_INT64;
    {IB 8.0 functions}
    function isc_dsql_batch_execute_immed(status_vector : PISC_STATUS;
						   db_handle : PISC_DB_HANDLE; tran_handle : PISC_TR_HANDLE;
						   Dialect : UShort; no_of_sql : ULong; statement : PPByte;
						   rows_affected : PULong) : ISC_STATUS;
    function isc_dsql_batch_execute(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
						   stmt_handle : PISC_STMT_HANDLE; Dialect : UShort;
						   insqlda : PXSQLDA; no_of_rows : UShort;
						   batch_vars : PXSQLVAR; rows_affected : PULong) : ISC_STATUS;

    // Security Functions
    function isc_add_user(status_vector : PISC_STATUS; user_sec_data : PUserSecData): ISC_STATUS;
    function isc_delete_user(status_vector : PISC_STATUS; user_sec_data : PUserSecData): ISC_STATUS;
    function isc_modify_user(status_vector : PISC_STATUS; user_sec_data : PUserSecData): ISC_STATUS;

    // Other OSRI functions
    function isc_prepare_transaction(status_vector         : PISC_STATUS;
                                 tran_handle               : PISC_TR_HANDLE): ISC_STATUS;
    // Other Blob functions
    function BLOB_put(isc_arg1                  : Byte;
             isc_arg2                  : PBSTREAM): Int;
    function BLOB_get(isc_arg1                  : PBSTREAM): Int;

    // Service manager functions
    function isc_service_attach (status_vector             : PISC_STATUS;
                                 isc_arg2                  : UShort;
                                 isc_arg3                  : PByte;
                                 service_handle            : PISC_SVC_HANDLE;
                                 isc_arg5                  : UShort;
                                 isc_arg6                  : PByte): ISC_STATUS;
    function isc_service_detach(status_vector             : PISC_STATUS;
                                service_handle            : PISC_SVC_HANDLE): ISC_STATUS;
    function isc_service_query  (status_vector             : PISC_STATUS;
                                 service_handle            : PISC_SVC_HANDLE;
                                 recv_handle               : PISC_SVC_HANDLE;
                                 isc_arg4                  : UShort;
                                 isc_arg5                  : PByte;
                                 isc_arg6                  : UShort;
                                 isc_arg7                  : PByte;
                                 isc_arg8                  : UShort;
                                 isc_arg9                  : PByte): ISC_STATUS;
    function isc_service_start (status_vector             : PISC_STATUS;
                                service_handle            : PISC_SVC_HANDLE;
                                recv_handle               : PISC_SVC_HANDLE;
                                isc_arg4                  : UShort;
                                isc_arg5                  : PByte): ISC_STATUS;
    // Client information functions
    procedure isc_get_client_version(buffer : PByte);
    function isc_get_client_major_version: Integer;
    function isc_get_client_minor_version: Integer;
    function isc_transaction_info(status_vector            : PISC_STATUS;
                                  tran_handle               : PISC_TR_HANDLE;
                                  item_list_buffer_length   : Short;
                                  item_list_buffer          : PByte;
                                  result_buffer_length      : Short;
                                  result_buffer             : PByte): ISC_STATUS;
  end;

  TIBEmbeddedLibrary = Class(TIBServerLibrary)
  public
    function LibraryName: String; override;
  end;

function isc_rollback_retaining_stub(status_vector   : PISC_STATUS;
              tran_handle     : PISC_TR_HANDLE):
                                     ISC_STATUS; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  Result := 0;
  IBError(ibxeIB60feature, ['isc_rollback_retaining']); {do not localize}
end;

function isc_service_attach_stub(status_vector      : PISC_STATUS;
                                 isc_arg2           : UShort;
                                 isc_arg3           : PByte;
                                 service_handle     : PISC_SVC_HANDLE;
                                 isc_arg5           : UShort;
                                 isc_arg6           : PByte):
                                 ISC_STATUS; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  Result := 0;
  IBError(ibxeIB60feature, ['isc_service_attach']); {do not localize}
end;

function isc_service_detach_stub(status_vector      : PISC_STATUS;
                                 service_handle     : PISC_SVC_HANDLE):
                                 ISC_STATUS; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  Result := 0;
  IBError(ibxeIB60feature, ['isc_service_detach']); {do not localize}
end;

function isc_service_query_stub(status_vector        : PISC_STATUS;
                                service_handle       : PISC_SVC_HANDLE;
                                recv_handle          : PISC_SVC_HANDLE;
                                isc_arg4             : UShort;
                                isc_arg5             : PByte;
                                isc_arg6             : UShort;
                                isc_arg7             : PByte;
                                isc_arg8             : UShort;
                                isc_arg9             : PByte):
                                ISC_STATUS; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  Result := 0;
  IBError(ibxeIB60feature, ['isc_service_query']); {do not localize}
end;

function isc_service_start_stub(status_vector        : PISC_STATUS;
                                service_handle       : PISC_SVC_HANDLE;
                                recv_handle          : PISC_SVC_HANDLE;
                                isc_arg4             : UShort;
                                isc_arg5             : PByte):
                                ISC_STATUS; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  Result := 0;
  IBError(ibxeIB60feature, ['isc_service_start']); {do not localize}
end;

procedure isc_encode_sql_date_stub(tm_date           : PCTimeStructure;
                 ib_date           : PISC_DATE);
                                   {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  IBError(ibxeIB60feature, ['isc_encode_sql_date']); {do not localize}
end;

procedure isc_encode_sql_time_stub(tm_date           : PCTimeStructure;
                   ib_time           : PISC_TIME);
                                   {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  IBError(ibxeIB60feature, ['isc_encode_sql_time']); {do not localize}
end;

procedure isc_encode_timestamp_stub(tm_date          : PCTimeStructure;
                  ib_timestamp     : PISC_TIMESTAMP);
                                    {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  IBError(ibxeIB60feature, ['isc_encode_sql_timestamp']); {do not localize}
end;

procedure isc_decode_sql_date_stub(ib_date           : PISC_DATE;
                                   tm_date           : PCTimeStructure);
                                   {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  IBError(ibxeIB60feature, ['isc_decode_sql_date']); {do not localize}
end;

procedure isc_decode_sql_time_stub(ib_time           : PISC_TIME;
                                   tm_date           : PCTimeStructure);
                                   {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  IBError(ibxeIB60feature, ['isc_decode_sql_time']); {do not localize}
end;

procedure isc_decode_timestamp_stub(ib_timestamp     : PISC_TIMESTAMP;
                                    tm_date          : PCTimeStructure);
                                    {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  IBError(ibxeIB60feature, ['isc_decode_timestamp']); {do not localize}
end;

function isc_install_clear_options_stub(hOption: POPTIONS_HANDLE):MSG_NO; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  Result := 0;
  IBError(ibxeIB60feature, ['isc_install_xxx ']); {do not localize}
end;

function isc_install_execute_stub(hOption: OPTIONS_HANDLE;
                             src_dir: TEXT;
                             dest_dir: TEXT;
                             status_func: FP_STATUS;
                             status_data: pointer;
                             error_func: FP_ERROR;
                             error_data: pointer;
                             uninstal_file_name: TEXT):MSG_NO; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  Result := 0;
  IBError(ibxeIB60feature, ['isc_install_xxx ']); {do not localize}
end;

function isc_install_get_info_stub(info_type :integer;
                              option :OPT;
                              info_buffer : Pointer;
                              buf_len : Cardinal): MSG_NO; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  Result := 0;
  IBError(ibxeIB60feature, ['isc_install_xxx ']); {do not localize}
end;

function isc_install_get_message_stub(hOption: OPTIONS_HANDLE;
                                 message_no: MSG_NO;
                                 message_txt: Pointer;
                                 message_len: Cardinal):MSG_NO; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  Result := 0;
  IBError(ibxeIB60feature, ['isc_install_xxx ']); {do not localize}
end;

function isc_install_load_external_text_stub(msg_file_name: TEXT):MSG_NO; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  Result := 0;
  IBError(ibxeIB60feature, ['isc_install_xxx ']); {do not localize}
end;

function isc_install_precheck_stub(hOption: OPTIONS_HANDLE;
                              src_dir: TEXT;
                              dest_dir: TEXT):MSG_NO; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  Result := 0;
  IBError(ibxeIB60feature, ['isc_install_xxx ']); {do not localize}
end;

function isc_install_set_option_stub(hOption: POPTIONS_HANDLE;
                                option: OPT):MSG_NO; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  Result := 0;
  IBError(ibxeIB60feature, ['isc_install_xxx ']); {do not localize}
end;

function isc_uninstall_execute_stub(uninstall_file_name: TEXT;
                               status_func: FP_STATUS;
                               status_data: pointer;
                               error_func: FP_ERROR;
                               error_data: pointer):MSG_NO; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  Result := 0;
  IBError(ibxeIB60feature, ['isc_install_xxx ']); {do not localize}
end;

function isc_uninstall_precheck_stub(uninstall_file_name: TEXT):MSG_NO; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  Result := 0;
  IBError(ibxeIB60feature, ['isc_install_xxx ']); {do not localize}
end;

function isc_install_unset_option_stub(hOption: POPTIONS_HANDLE;
                                  option: OPT):MSG_NO; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  Result := 0;
  IBError(ibxeIB60feature, ['isc_install_xxx ']); {do not localize}
end;

procedure isc_get_client_version_stub(buffer : PByte); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  raise EIBClientError.Create(Format(SIB70feature, ['isc_get_client_version '])); {do not localize}
end;

function isc_get_client_major_version_stub : Integer; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  raise EIBClientError.Create(Format(SIB70feature, ['isc_get_client_major_version '])); {do not localize}
end;

function isc_get_client_minor_version_stub : Integer; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  raise EIBClientError.Create(Format(SIB70feature, ['isc_get_client_minor_version '])); {do not localize}
end;

function isc_array_gen_sdl2_stub(status_vector            : PISC_STATUS;
                                 isc_array_desc           : PISC_ARRAY_DESC_V2;
                                 isc_arg3                 : PShort;
                                 isc_arg4                 : PByte;
                                 isc_arg5                 : PShort): ISC_STATUS;
                                {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  raise EIBClientError.Create(Format(SIB70feature, ['isc_array_gen_sdl2 '])); {do not localize}
end;

function isc_array_get_slice2_stub(status_vector            : PISC_STATUS;
                              db_handle                : PISC_DB_HANDLE;
                              trans_handle             : PISC_TR_HANDLE;
				 array_id                 : PISC_QUAD;
				 descriptor               : PISC_ARRAY_DESC_V2;
				 dest_array               : PVoid;
				 slice_length             : ISC_LONG): ISC_STATUS;
                                {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  raise EIBClientError.Create(Format(SIB70feature, ['isc_array_get_slice2 '])); {do not localize}
end;

function isc_array_lookup_bounds2_stub(status_vector        : PISC_STATUS;
                                 db_handle                : PISC_DB_HANDLE;
                                 trans_handle             : PISC_TR_HANDLE;
				 table_name,
				 column_name              : PByte;
				 descriptor               : PISC_ARRAY_DESC_V2): ISC_STATUS;
                                {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  raise EIBClientError.Create(Format(SIB70feature, ['isc_array_lookup_bounds2 '])); {do not localize}
end;

function isc_array_lookup_desc2_stub(status_vector          : PISC_STATUS;
                                 db_handle                : PISC_DB_HANDLE;
                                 trans_handle             : PISC_TR_HANDLE;
				 table_name,
				 column_name              : PByte;
				 descriptor               : PISC_ARRAY_DESC_V2): ISC_STATUS;
                                {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  raise EIBClientError.Create(Format(SIB70feature, ['isc_array_lookup_desc2 '])); {do not localize}
end;

function isc_array_set_desc2_stub(status_vector            : PISC_STATUS;
				 table_name               : PByte;
				 column_name              : PByte;
				 sql_dtype,
                                 sql_length,
                                 sql_dimensions           : PShort;
                                 descriptor               : PISC_ARRAY_DESC_V2): ISC_STATUS;
                                {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  raise EIBClientError.Create(Format(SIB70feature, ['isc_array_set_desc2 '])); {do not localize}
end;

function isc_array_put_slice2_stub(status_vector            : PISC_STATUS;
                                 db_handle                : PISC_DB_HANDLE;
                                 trans_handle             : PISC_TR_HANDLE;
                                 array_id                 : PISC_QUAD;
                                 descriptor               : PISC_ARRAY_DESC_V2;
                                 source_array             : PVoid;
                                 slice_length             : PISC_LONG): ISC_STATUS;
                                {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  raise EIBClientError.Create(Format(SIB70feature, ['isc_array_put_slice2 '])); {do not localize}
end;

procedure isc_blob_default_desc2_stub(descriptor           : PISC_BLOB_DESC_V2;
                                 table_name               : PUChar;
                                 column_name              : PUChar);
                                {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  raise EIBClientError.Create(Format(SIB70feature, ['isc_blob_default_desc2 '])); {do not localize}
end;

function isc_blob_gen_bpb2_stub(status_vector            : PISC_STATUS;
				 to_descriptor, from_descriptor          : PISC_BLOB_DESC_V2;
                                 bpb_buffer_length        : UShort;
                                 bpb_buffer               : PUChar;
                                 bpb_length               : PUShort): ISC_STATUS;
                                {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  raise EIBClientError.Create(Format(SIB70feature, ['isc_blob_gen_bpb2 '])); {do not localize}
end;

function isc_blob_lookup_desc2_stub(status_vector           : PISC_STATUS;
                                 db_handle                : PISC_DB_HANDLE;
                                 trans_handle             : PISC_TR_HANDLE;
                                 table_name,
                                 column_name              : PByte;
                                 descriptor               : PISC_BLOB_DESC_v2;
                                 global                   : PUChar): ISC_STATUS;
                                {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  raise EIBClientError.Create(Format(SIB70feature, ['isc_blob_lookup_desc2 '])); {do not localize}
end;

function isc_blob_set_desc2_stub(status_vector : PISC_STATUS;
  table_name, column_name : PByte; subtype, charset, segment_size : Short;
  descriptor : PISC_BLOB_DESC_V2): ISC_STATUS; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  raise EIBClientError.Create(Format(SIB70feature, ['isc_blob_set_desc2 '])); {do not localize}
end;

function isc_release_savepoint_stub(status_vector : PISC_STATUS;
                                   tran_handle :  PISC_TR_HANDLE;
                                   tran_name : PByte) : ISC_STATUS; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  raise EIBClientError.Create(Format(SIB71feature, ['isc_release_savepoint '])); {do not localize}
end;

function isc_rollback_savepoint_stub(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
   tran_name : PByte; Option : UShort) :  ISC_STATUS; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  raise EIBClientError.Create(Format(SIB71feature, ['isc_rollback_savepoint '])); {do not localize}
end;

function isc_start_savepoint_stub(status_vector : PISC_STATUS;
                                tran_handle : PISC_TR_HANDLE;
                                tran_name : PByte): ISC_STATUS; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  raise EIBClientError.Create(Format(SIB71feature, ['isc_start_savepoint '])); {do not localize}
end;

{IB 8.0 functions}
function isc_dsql_batch_execute_immed_stub(sstatus_vector : PISC_STATUS; db_handle : PISC_DB_HANDLE;
						   tran_handle : PISC_TR_HANDLE; Dialect : UShort; no_of_sql : ulong;
						   statement : PPByte; rows_affected : PULong) : ISC_STATUS;
               {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  raise EIBClientError.Create(Format(SIB80feature, ['isc_dsql_batch_execute_immed'])); {do not localize}
end;

function isc_dsql_batch_execute_stub(status_vector : PISC_STATUS; tran_handle : PISC_TR_HANDLE;
						   stmt_handle : PISC_STMT_HANDLE; Dialect : UShort;
						   insqlda : PXSQLDA; no_of_rows : UShort;
						   batch_vars : PXSQLVAR; rows_affected : PULong) : ISC_STATUS;
               {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF POSIX} cdecl; {$ENDIF}
begin
  raise EIBClientError.Create(Format(SIB80feature, ['isc_dsql_batch_execute'])); {do not localize}
end;

function TIBServerLibrary.LibraryName: String;
begin
  Result := IBASE_DLL;
end;

procedure TIBServerLibrary.LoadIBLibrary;
{$IFNDEF IB_STATIC_LINK}
var
  CurLibrary : THandle;
  sLibName : String;

  function TryGetProcAddr(ProcName: String): Pointer;
  begin
    Result := GetProcAddress(CurLibrary, PChar(ProcName));
  end;

  function GetProcAddr(ProcName: String): Pointer;
  begin
    Result := GetProcAddress(CurLibrary, PChar(ProcName));
    if not Assigned(Result) then
      RaiseLastOSError;
  end;
{$ENDIF}

begin
{$IFDEF IB_STATIC_LINK}
  FBLOB_get := _BLOB_get;
  FBLOB_put := _BLOB_put;
  Fisc_sqlcode := _isc_sqlcode;
  Fisc_sql_interprete := _isc_sql_interprete;
  Fisc_interprete := _isc_interprete;
  Fisc_vax_integer := _isc_vax_integer;
  Fisc_portable_integer := _isc_portable_integer;
  Fisc_blob_info := _isc_blob_info;
  Fisc_open_blob2 := _isc_open_blob2;
  Fisc_close_blob := _isc_close_blob;
  Fisc_get_segment := _isc_get_segment;
  Fisc_put_segment := _isc_put_segment;
  Fisc_create_blob2 := _isc_create_blob2;
  Fisc_create_database := _isc_create_database;
  Fisc_cancel_blob := _isc_cancel_blob;
  Fisc_array_gen_sdl := _isc_array_gen_sdl;
  Fisc_array_get_slice := _isc_array_get_slice;
  Fisc_array_lookup_bounds := _isc_array_lookup_bounds;
  Fisc_array_lookup_desc := _isc_array_lookup_desc;
  Fisc_array_set_desc := _isc_array_set_desc;
  Fisc_array_put_slice := _isc_array_put_slice;
  Fisc_blob_default_desc := _isc_blob_default_desc;
  Fisc_blob_gen_bpb := _isc_blob_gen_bpb;
  Fisc_blob_lookup_desc := _isc_blob_lookup_desc;
  Fisc_blob_set_desc := _isc_blob_set_desc;
  Fisc_decode_date := _isc_decode_date;
  Fisc_encode_date := _isc_encode_date;
  Fisc_dsql_free_statement := _isc_dsql_free_statement;
  Fisc_dsql_execute2 := _isc_dsql_execute2;
  Fisc_dsql_execute := _isc_dsql_execute;
  Fisc_dsql_set_cursor_name := _isc_dsql_set_cursor_name;
  Fisc_dsql_fetch := _isc_dsql_fetch;
  Fisc_dsql_sql_info := _isc_dsql_sql_info;
  Fisc_dsql_alloc_statement2 := _isc_dsql_alloc_statement2;
  Fisc_dsql_prepare := _isc_dsql_prepare;
  Fisc_dsql_describe_bind := _isc_dsql_describe_bind;
  Fisc_dsql_exec_immed2 := _isc_dsql_exec_immed2;
  Fisc_dsql_describe := _isc_dsql_describe;
  Fisc_dsql_execute_immediate := _isc_dsql_execute_immediate;
  Fisc_drop_database := _isc_drop_database;
  Fisc_detach_database := _isc_detach_database;
  Fisc_attach_database := _isc_attach_database;
  Fisc_database_info := _isc_database_info;
  Fisc_start_multiple := _isc_start_multiple;
  Fisc_start_transaction := _isc_start_transaction;
  Fisc_commit_transaction := _isc_commit_transaction;
  Fisc_commit_retaining := _isc_commit_retaining;
  Fisc_rollback_transaction := _isc_rollback_transaction;
  Fisc_cancel_events := _isc_cancel_events;
  Fisc_que_events := _isc_que_events;
  Fisc_event_counts := _isc_event_counts;
  Fisc_event_block := _isc_event_block;
  Fisc_free := _isc_free;
  Fisc_add_user := _isc_add_user;
  Fisc_delete_user := _isc_delete_user;
  Fisc_modify_user := _isc_modify_user;
  Fisc_prepare_transaction := _isc_prepare_transaction;
  Fisc_prepare_transaction2 := _isc_prepare_transaction2;
  Fisc_transaction_info := _isc_transaction_info;

  Fisc_rollback_retaining := _isc_rollback_retaining;
  Fisc_service_attach := _isc_service_attach;
  Fisc_service_detach := _isc_service_detach;
  Fisc_service_query := _isc_service_query;
  Fisc_service_start := _isc_service_start;
  Fisc_decode_sql_date := _isc_decode_sql_date;
  Fisc_decode_sql_time := _isc_decode_sql_time;
  Fisc_decode_timestamp := _isc_decode_timestamp;
  Fisc_encode_sql_date := _isc_encode_sql_date;
  Fisc_encode_sql_time := _isc_encode_sql_time;
  Fisc_encode_timestamp := _isc_encode_timestamp;

  Fisc_get_client_version := _isc_get_client_version;
  Fisc_get_client_major_version := _isc_get_client_major_version;
  Fisc_get_client_minor_version := _isc_get_client_minor_version;
  FIBClientVersion := isc_get_client_major_version + (isc_get_client_minor_version / 10);

  Fisc_array_gen_sdl2 := _isc_array_gen_sdl2;
  Fisc_array_get_slice2 := _isc_array_get_slice2;
  Fisc_array_lookup_bounds2 := _isc_array_lookup_bounds2;
  Fisc_array_lookup_desc2 := _isc_array_lookup_desc2;
  Fisc_array_set_desc2 := _isc_array_set_desc2;
  Fisc_array_put_slice2 := _isc_array_put_slice2;
  Fisc_blob_default_desc2 := _isc_blob_default_desc2;
  Fisc_blob_gen_bpb2 := _isc_blob_gen_bpb2;
  Fisc_blob_lookup_desc2 := _isc_blob_lookup_desc2;
  Fisc_blob_set_desc2 := _isc_blob_set_desc2;

  Fisc_release_savepoint := _isc_release_savepoint;
  Fisc_rollback_savepoint := _isc_rollback_savepoint;
  Fisc_start_savepoint := _isc_start_savepoint;

  Fisc_dsql_batch_execute_immed := _isc_dsql_batch_execute_immed;
  Fisc_dsql_batch_execute := _isc_dsql_batch_execute;

  isc_dsql_xml_fetch := isc_dsql_xml_fetch_stub;
  isc_dsql_xml_fetch_all := isc_dsql_xml_fetch_all_stub;
  isc_dsql_xml_buffer_fetch := isc_dsql_xml_buffer_fetch_stub;
{$ELSE}  // Non IB_STATIC_LINK load

  sLibName := LibraryName;
  FIBLibrary := LoadLibrary(PChar(sLibName));
{$IFDEF MSWINDOWS}
  if (FIBLibrary > HINSTANCE_ERROR) then
{$ENDIF}
{$IF Defined(MACOS) or Defined(IB_iOSSimulator) or Defined(POSIX)}
  if (FIBCrypt = 0) then
    FIBCrypt := LoadLibrary('libcrypt.dylib');  {do not localize}
  if (FIBLibrary <> 0) then
{$ENDIF}
  begin
    CurLibrary := FIBLibrary;
    FBLOB_get := GetProcAddr('BLOB_get'); {do not localize}
    FBLOB_put := GetProcAddr('BLOB_put'); {do not localize}
    Fisc_sqlcode := GetProcAddr('isc_sqlcode'); {do not localize}
    Fisc_sql_interprete := GetProcAddr('isc_sql_interprete'); {do not localize}
    Fisc_interprete := GetProcAddr('isc_interprete'); {do not localize}
    Fisc_vax_integer := GetProcAddr('isc_vax_integer'); {do not localize}
    Fisc_portable_integer := GetProcAddr('isc_portable_integer'); {do not localize}
    Fisc_blob_info := GetProcAddr('isc_blob_info'); {do not localize}
    Fisc_open_blob2 := GetProcAddr('isc_open_blob2'); {do not localize}
    Fisc_close_blob := GetProcAddr('isc_close_blob'); {do not localize}
    Fisc_get_segment := GetProcAddr('isc_get_segment'); {do not localize}
    Fisc_put_segment := GetProcAddr('isc_put_segment'); {do not localize}
    Fisc_create_blob2 := GetProcAddr('isc_create_blob2'); {do not localize}
    Fisc_create_database := GetProcAddr('isc_create_database'); {do not localize}
    Fisc_cancel_blob := GetProcAddr('isc_cancel_blob');  {do not localize}
    Fisc_array_gen_sdl := GetProcAddr('isc_array_gen_sdl'); {do not localize}
    Fisc_array_get_slice := GetProcAddr('isc_array_get_slice'); {do not localize}
    Fisc_array_lookup_bounds := GetProcAddr('isc_array_lookup_bounds'); {do not localize}
    Fisc_array_lookup_desc := GetProcAddr('isc_array_lookup_desc'); {do not localize}
    Fisc_array_set_desc := GetProcAddr('isc_array_set_desc'); {do not localize}
    Fisc_array_put_slice := GetProcAddr('isc_array_put_slice'); {do not localize}
    Fisc_blob_default_desc := GetProcAddr('isc_blob_default_desc'); {do not localize}
    Fisc_blob_gen_bpb := GetProcAddr('isc_blob_gen_bpb');  {do not localize}
    Fisc_blob_lookup_desc := GetProcAddr('isc_blob_lookup_desc'); {do not localize}
    Fisc_blob_set_desc := GetProcAddr('isc_blob_set_desc'); {do not localize}
    Fisc_decode_date := GetProcAddr('isc_decode_date'); {do not localize}
    Fisc_encode_date := GetProcAddr('isc_encode_date'); {do not localize}
    Fisc_dsql_free_statement := GetProcAddr('isc_dsql_free_statement'); {do not localize}
    Fisc_dsql_execute2 := GetProcAddr('isc_dsql_execute2'); {do not localize}
    Fisc_dsql_execute := GetProcAddr('isc_dsql_execute'); {do not localize}
    Fisc_dsql_set_cursor_name := GetProcAddr('isc_dsql_set_cursor_name'); {do not localize}
    Fisc_dsql_fetch := GetProcAddr('isc_dsql_fetch'); {do not localize}
    Fisc_dsql_sql_info := GetProcAddr('isc_dsql_sql_info'); {do not localize}
    Fisc_dsql_alloc_statement2 := GetProcAddr('isc_dsql_alloc_statement2'); {do not localize}
    Fisc_dsql_prepare := GetProcAddr('isc_dsql_prepare'); {do not localize}
    Fisc_dsql_describe_bind := GetProcAddr('isc_dsql_describe_bind'); {do not localize}
    Fisc_dsql_exec_immed2 := GetProcAddr('isc_dsql_exec_immed2'); {do not localize }
    Fisc_dsql_describe := GetProcAddr('isc_dsql_describe'); {do not localize}
    Fisc_dsql_execute_immediate := GetProcAddr('isc_dsql_execute_immediate'); {do not localize}
    Fisc_drop_database := GetProcAddr('isc_drop_database'); {do not localize}
    Fisc_detach_database := GetProcAddr('isc_detach_database'); {do not localize}
    Fisc_attach_database := GetProcAddr('isc_attach_database'); {do not localize}
    Fisc_database_info := GetProcAddr('isc_database_info'); {do not localize}
    Fisc_start_multiple := GetProcAddr('isc_start_multiple'); {do not localize}
    Fisc_start_transaction := GetProcAddr('isc_start_transaction'); {do nto localize }
    Fisc_commit_transaction := GetProcAddr('isc_commit_transaction'); {do not localize}
    Fisc_commit_retaining := GetProcAddr('isc_commit_retaining'); {do not localize}
    Fisc_rollback_transaction := GetProcAddr('isc_rollback_transaction'); {do not localize}
    Fisc_cancel_events := GetProcAddr('isc_cancel_events'); {do not localize}
    Fisc_que_events := GetProcAddr('isc_que_events'); {do not localize}
    Fisc_event_counts := GetProcAddr('isc_event_counts'); {do not localize}
    Fisc_event_block := GetProcAddr('isc_event_block'); {do not localize}
    Fisc_free := GetProcAddr('isc_free'); {do not localize}
    Fisc_add_user := GetProcAddr('isc_add_user'); {do not localize}
    Fisc_delete_user := GetProcAddr('isc_delete_user'); {do not localize}
    Fisc_modify_user := GetProcAddr('isc_modify_user'); {do not localize}
    Fisc_prepare_transaction := GetProcAddr('isc_prepare_transaction'); {do not localize}
    Fisc_prepare_transaction2 := GetProcAddr('isc_prepare_transaction2'); {do not localize}
    Fisc_transaction_info := GetProcAddr('isc_transaction_info'); {do not localize}

    Fisc_rollback_retaining := TryGetProcAddr('isc_rollback_retaining'); {do not localize}
    if Assigned(Fisc_rollback_retaining) then
    begin
      FIBClientVersion := 6;
      Fisc_service_attach := GetProcAddr('isc_service_attach'); {do not localize}
      Fisc_service_detach := GetProcAddr('isc_service_detach'); {do not localize}
      Fisc_service_query := GetProcAddr('isc_service_query'); {do not localize}
      Fisc_service_start := GetProcAddr('isc_service_start'); {do not localize}
      Fisc_decode_sql_date := GetProcAddr('isc_decode_sql_date'); {do not localize}
      Fisc_decode_sql_time := GetProcAddr('isc_decode_sql_time'); {do not localize}
      Fisc_decode_timestamp := GetProcAddr('isc_decode_timestamp'); {do not localize}
      Fisc_encode_sql_date := GetProcAddr('isc_encode_sql_date'); {do not localize}
      Fisc_encode_sql_time := GetProcAddr('isc_encode_sql_time'); {do not localize}
      Fisc_encode_timestamp := GetProcAddr('isc_encode_timestamp'); {do not localize}
    end else
    begin
      FIBClientVersion := 5;
      Fisc_rollback_retaining := isc_rollback_retaining_stub;
      Fisc_service_attach := isc_service_attach_stub;
      Fisc_service_detach := isc_service_detach_stub;
      Fisc_service_query := isc_service_query_stub;
      Fisc_service_start := isc_service_start_stub;
      Fisc_decode_sql_date := isc_decode_sql_date_stub;
      Fisc_decode_sql_time := isc_decode_sql_time_stub;
      Fisc_decode_timestamp := isc_decode_timestamp_stub;
      Fisc_encode_sql_date := isc_encode_sql_date_stub;
      Fisc_encode_sql_time := isc_encode_sql_time_stub;
      Fisc_encode_timestamp := isc_encode_timestamp_stub;
    end;

    Fisc_get_client_version := TryGetProcAddr('isc_get_client_version'); {do not localize}
    if Assigned(Fisc_get_client_version) then
    begin
      Fisc_get_client_major_version := GetProcAddr('isc_get_client_major_version'); {do not localize}
      Fisc_get_client_minor_version := GetProcAddr('isc_get_client_minor_version'); {do not localize}
      FIBClientVersion := isc_get_client_major_version + (isc_get_client_minor_version / 10);
    end
    else
    begin
      Fisc_get_client_version := isc_get_client_version_stub;
      Fisc_get_client_major_version := isc_get_client_major_version_stub;
      Fisc_get_client_minor_version := isc_get_client_minor_version_stub;
    end;

    if FIBClientVersion >= 7 then
    begin
      Fisc_array_gen_sdl2 := GetProcAddr('isc_array_gen_sdl2');
      Fisc_array_get_slice2 := GetProcAddr('isc_array_get_slice2');
      Fisc_array_lookup_bounds2 := GetProcAddr('isc_array_lookup_bounds2');
      Fisc_array_lookup_desc2 := GetProcAddr('isc_array_lookup_desc2');
      Fisc_array_set_desc2 := GetProcAddr('isc_array_set_desc2');
      Fisc_array_put_slice2 := GetProcAddr('isc_array_put_slice2');
      Fisc_blob_default_desc2 := GetProcAddr('isc_blob_default_desc2');
      Fisc_blob_gen_bpb2 := GetProcAddr('isc_blob_gen_bpb2');
      Fisc_blob_lookup_desc2 := GetProcAddr('isc_blob_lookup_desc2');
      Fisc_blob_set_desc2 := GetProcAddr('isc_blob_set_desc2');

      if FIBClientVersion >= 7.1 then
      begin
        Fisc_release_savepoint := GetProcAddr('isc_release_savepoint');
        Fisc_rollback_savepoint := GetProcAddr('isc_rollback_savepoint');
        Fisc_start_savepoint := GetProcAddr('isc_start_savepoint');
      end
      else
      begin
        Fisc_release_savepoint := isc_release_savepoint_stub;
        Fisc_rollback_savepoint := isc_rollback_savepoint_stub;
        Fisc_start_savepoint := isc_start_savepoint_stub;
      end;
      if FIBClientVersion >= 8.0 then
      begin
        Fisc_dsql_batch_execute_immed := GetProcAddr('isc_dsql_batch_execute_immed');
        Fisc_dsql_batch_execute := GetProcAddr('isc_dsql_batch_execute');
      end
      else
      begin
        Fisc_dsql_batch_execute_immed := isc_dsql_batch_execute_immed_stub;
        Fisc_dsql_batch_execute := isc_dsql_batch_execute_stub;
      end;
    end
    else
    begin
      Fisc_array_gen_sdl2 := isc_array_gen_sdl2_stub;
      Fisc_array_get_slice2 := isc_array_get_slice2_stub;
      Fisc_array_lookup_bounds2 := isc_array_lookup_bounds2_stub;
      Fisc_array_lookup_desc2 := isc_array_lookup_desc2_stub;
      Fisc_array_set_desc2 := isc_array_set_desc2_stub;
      Fisc_array_put_slice2 := isc_array_put_slice2_stub;
      Fisc_blob_default_desc2 := isc_blob_default_desc2_stub;
      Fisc_blob_gen_bpb2 := isc_blob_gen_bpb2_stub;
      Fisc_blob_lookup_desc2 := isc_blob_lookup_desc2_stub;
      Fisc_blob_set_desc2 := isc_blob_set_desc2_stub;
      Fisc_release_savepoint := isc_release_savepoint_stub;
      Fisc_rollback_savepoint := isc_rollback_savepoint_stub;
      Fisc_start_savepoint := isc_start_savepoint_stub;
    end;

    FIBXMLLibrary := LoadLibrary(IBXML_DLL);
    {$IFDEF MSWINDOWS}
    if (FIBXMLLibrary > HINSTANCE_ERROR) then
    {$ENDIF}
    {$IF Defined(MACOS) or Defined(LINUX)}
    if (FIBXMLLibrary <> 0) then
    {$ENDIF}
    begin
      CurLibrary := FIBXMLLibrary;
      isc_dsql_xml_fetch := GetProcAddr('isc_dsql_xml_fetch'); {do not localize}
      isc_dsql_xml_fetch_all := GetProcAddr('isc_dsql_xml_fetch_all'); {do not localize}
      isc_dsql_xml_buffer_fetch := GetProcAddr('isc_dsql_xml_buffer_fetch'); {do not localize}
    end
    else
    begin
      isc_dsql_xml_fetch := isc_dsql_xml_fetch_stub;
      isc_dsql_xml_fetch_all := isc_dsql_xml_fetch_all_stub;
      isc_dsql_xml_buffer_fetch := isc_dsql_xml_buffer_fetch_stub;
    end;
  end;
{$ENDIF IB_STATIC_LINK}
end;

procedure TIBServerLibrary.FreeIBLibrary;
begin
  {$IFDEF MSWINDOWS}
  if (FIBLibrary > HINSTANCE_ERROR) then
  {$ENDIF}
  {$IFDEF MACOS}
  if (FIBLibrary <> 0) then
  {$ENDIF}
  begin
    FreeLibrary(FIBLibrary);
    FIBLibrary := 0;
  end;
  {$IFDEF MSWINDOWS}
  if (FIBXMLLibrary > HINSTANCE_ERROR) then
  {$ENDIF}
  {$IFDEF MACOS}
  if (FIBXMLLibrary <> 0) then
  {$ENDIF}
  begin
    FreeLibrary(FIBXMLLibrary);
    FIBXMLLibrary := 0;
  end;
  {$IF Defined(MACOS) or Defined(IB_iOSSimulator) or Defined(POSIX)}
  if FIBCrypt <> 0 then
  begin
    FreeLibrary(FIBCrypt);
    FIBCrypt := 0;
  end;
  {$ENDIF}
end;

procedure LoadIBInstallLibrary;

  function GetProcAddr(ProcName: String): Pointer;
  begin
    Result := GetProcAddress(IBInstallLibrary, PChar(ProcName));
    if not Assigned(Result) then
      RaiseLastOSError;
  end;

begin
{$IFDEF IB_STATIC_LINK}
  raise exception.Create(SInstallOSNotSupported);
{$ELSE}
  IBInstallLibrary := LoadLibrary(IB_INSTALL_DLL);
  {$IFDEF MSWINDOWS}
  if (IBInstallLibrary > HINSTANCE_ERROR) then
  {$ENDIF}
  {$IF Defined(MACOS) or Defined(LINUX)}
  if (IBInstallLibrary <> 0) then
  {$ENDIF}
  begin
    isc_install_clear_options := GetProcAddr('isc_install_clear_options'); {do not localize}
    isc_install_execute := GetProcAddr('isc_install_execute'); {do not localize}
    isc_install_get_info := GetProcAddr('isc_install_get_info'); {do not localize}
    isc_install_get_message := GetProcAddr('isc_install_get_message'); {do not localize}
    isc_install_load_external_text := GetProcAddr('isc_install_load_external_text'); {do not localize}
    isc_install_precheck := GetProcAddr('isc_install_precheck'); {do not localize}
    isc_install_set_option := GetProcAddr('isc_install_set_option'); {do not localize}
    isc_uninstall_execute := GetProcAddr('isc_uninstall_execute'); {do not localize}
    isc_uninstall_precheck := GetProcAddr('isc_uninstall_precheck'); {do not localize}
    isc_install_unset_option := GetProcAddr('isc_install_unset_option'); {do not localize}
  end
  else
  begin
    isc_install_clear_options := isc_install_clear_options_stub;
    isc_install_execute := isc_install_execute_stub;
    isc_install_get_info := isc_install_get_info_stub;
    isc_install_get_message := isc_install_get_message_stub;
    isc_install_load_external_text := isc_install_load_external_text_stub;
    isc_install_precheck := isc_install_precheck_stub;
    isc_install_set_option := isc_install_set_option_stub;
    isc_uninstall_execute := isc_uninstall_execute_stub;
    isc_uninstall_precheck := isc_uninstall_precheck_stub;
    isc_install_unset_option := isc_install_unset_option_stub;
  end;
{$ENDIF iOS or IB_STATIC_LINK}
end;

procedure FreeIBInstallLibrary;
begin
  {$IFDEF MSWINDOWS}
  if (IBInstallLibrary > HINSTANCE_ERROR) then
  {$ENDIF}
  {$IFDEF MACOS}
  if (IBInstallLibrary <> 0) then
  {$ENDIF}
  begin
    FreeLibrary(IBInstallLibrary);
    IBInstallLibrary := 0;
  end;
end;

function TIBServerLibrary.TryIBLoad: Boolean;
begin
{$IFDEF IB_STATIC_LINK}
  if not Assigned(Fisc_attach_database) then
    LoadIBLibrary;
  result := Assigned(Fisc_attach_database);
{$else}
  {$IFDEF MSWINDOWS}
  if (FIBLibrary <= HINSTANCE_ERROR) then
  {$ENDIF}
  {$IFDEF MACOS}
  if (FIBLibrary = 0) then
  {$ENDIF}
    LoadIBLibrary;

  {$IFDEF MSWINDOWS}
  if (FIBLibrary <= HINSTANCE_ERROR) then
  {$ENDIF}
  {$IF Defined(MACOS) or Defined(LINUX)}
  if (FIBLibrary = 0) then
  {$ENDIF}
    result := False
  else
    result := True;
{$ENDIF IB_STATIC_LINK}
end;

procedure TIBServerLibrary.CheckIBLoaded;
begin
  if not TryIBLoad then
    IBError(ibxeInterBaseMissing, [LibraryName]);
end;

constructor TIBServerLibrary.Create;
begin
  inherited;
  FIBLibrary := 0;
  FIBXMLLibrary := 0;
  {$IF Defined(MACOS) or Defined(IB_iOSSimulator) or Defined(POSIX)}
  FIBCrypt := 0;
  {$ENDIF}
end;

function TIBServerLibrary.GetIBClientVersion: Currency;
begin
  CheckIBLoaded;
  result := FIBClientVersion;
end;

procedure CheckIBInstallLoaded;
begin
  {$IFDEF MSWINDOWS}
  if (IBInstallLibrary <= HINSTANCE_ERROR) then
  {$ENDIF}
  {$IFDEF MACOS}
  if (IBInstallLibrary = 0) then
  {$ENDIF}
    LoadIBInstallLibrary;

  {$IFDEF MSWINDOWS}
  if (IBInstallLibrary <= HINSTANCE_ERROR) then
  {$ENDIF}
  {$IFDEF MACOS}
  if (IBInstallLibrary = 0) then
  {$ENDIF}
    IBError(ibxeInterBaseInstallMissing, [nil]);
end;

function GetGDSLibrary(const ALibrary : String) : IGDSLibrary;
begin
  Result := IBClientInterface.Items[ALibrary];
  if Result = nil then
    IBError(ibxeInvalidLibraryType, [ALibrary]);
end;

function ValidateServerType(ALibrary : String) : String;
var
  i : Integer;
begin
  for i := 0 to IBClientInterface.Count - 1 do
    if aLibrary.ToLower = IBClientInterface.ToArray[i].Key.ToLower then
       Result := IBClientInterface.ToArray[i].Key;
  if Result = '' then
    IBError(ibxeInvalidLibraryType, [ALibrary]);
end;

procedure GetAvailableLibraries(LibList : TStrings);
var
  i : Integer;
begin
  for i := 0 to IBClientInterface.Count - 1 do
    LibList.Add(IBClientInterface.ToArray[i].Key);
end;

procedure AddIBInterface(LibName : String; IBInterface : IGDSLibrary);
begin
  IBClientInterface.Add(LibName, IBInterface);
end;
{ TDynamicLibrary }

function TIBServerLibrary.BLOB_put(isc_arg1: Byte; isc_arg2: PBSTREAM): Int;
begin
  Result := FBLOB_put(isc_arg1, isc_arg2);
end;

function TIBServerLibrary.isc_add_user(status_vector: PISC_STATUS;
  user_sec_data: PUserSecData): ISC_STATUS;
begin
  Result := Fisc_add_user(status_vector, user_sec_data);
end;

function TIBServerLibrary.isc_array_gen_sdl(status_vector: PISC_STATUS;
  isc_array_desc: PISC_ARRAY_DESC; isc_arg3: PShort; isc_arg4: PByte;
  isc_arg5: PShort): ISC_STATUS;
begin
  Result := Fisc_array_gen_sdl(status_vector, isc_array_desc, isc_arg3, isc_arg4, isc_arg5);
end;

function TIBServerLibrary.isc_array_gen_sdl2(status_vector: PISC_STATUS;
  isc_array_desc: PISC_ARRAY_DESC_V2; isc_arg3: PShort; isc_arg4: PByte;
  isc_arg5: PShort): ISC_STATUS;
begin
  Result := Fisc_array_gen_sdl2(status_vector, isc_array_desc, isc_arg3, isc_arg4, isc_arg5);
end;

function TIBServerLibrary.isc_array_get_slice(status_vector: PISC_STATUS;
  db_handle: PISC_DB_HANDLE; trans_handle: PISC_TR_HANDLE;
  array_id: PISC_QUAD; descriptor: PISC_ARRAY_DESC; dest_array: PVoid;
  slice_length: ISC_LONG): ISC_STATUS;
begin
  Result := Fisc_array_get_slice(status_vector, db_handle, trans_handle,
               array_id, descriptor, dest_array, slice_length);
end;

function TIBServerLibrary.isc_array_get_slice2(status_vector: PISC_STATUS;
  db_handle: PISC_DB_HANDLE; trans_handle: PISC_TR_HANDLE;
  array_id: PISC_QUAD; descriptor: PISC_ARRAY_DESC_V2; dest_array: PVoid;
  slice_length: ISC_LONG): ISC_STATUS;
begin
  Result := Fisc_array_get_slice2(status_vector, db_handle, trans_handle,
                 array_id, descriptor, dest_array, slice_length);
end;

function TIBServerLibrary.isc_array_lookup_bounds(
  status_vector: PISC_STATUS; db_handle: PISC_DB_HANDLE;
  trans_handle: PISC_TR_HANDLE; table_name, column_name: PByte;
  descriptor: PISC_ARRAY_DESC): ISC_STATUS;
begin
  Result := Fisc_array_lookup_bounds(status_vector, db_handle,
                   trans_handle, table_name, column_name, descriptor);
end;

function TIBServerLibrary.isc_array_lookup_bounds2(
  status_vector: PISC_STATUS; db_handle: PISC_DB_HANDLE;
  trans_handle: PISC_TR_HANDLE; table_name, column_name: PByte;
  descriptor: PISC_ARRAY_DESC_V2): ISC_STATUS;
begin
  Result := Fisc_array_lookup_bounds2(status_vector, db_handle,
          trans_handle, table_name, column_name, descriptor);
end;

function TIBServerLibrary.isc_array_lookup_desc(status_vector: PISC_STATUS;
  db_handle: PISC_DB_HANDLE; trans_handle: PISC_TR_HANDLE; table_name,
  column_name: PByte; descriptor: PISC_ARRAY_DESC): ISC_STATUS;
begin
  Result := Fisc_array_lookup_desc(status_vector, db_handle, trans_handle,
            table_name, column_name, descriptor);
end;

function TIBServerLibrary.isc_array_lookup_desc2(status_vector: PISC_STATUS;
  db_handle: PISC_DB_HANDLE; trans_handle: PISC_TR_HANDLE; table_name,
  column_name: PByte; descriptor: PISC_ARRAY_DESC_V2): ISC_STATUS;
begin
  Result := Fisc_array_lookup_desc2(status_vector, db_handle, trans_handle,
            table_name, column_name, descriptor);
end;

function TIBServerLibrary.isc_array_put_slice(status_vector: PISC_STATUS;
  db_handle: PISC_DB_HANDLE; trans_handle: PISC_TR_HANDLE;
  array_id: PISC_QUAD; descriptor: PISC_ARRAY_DESC; source_array: PVoid;
  slice_length: PISC_LONG): ISC_STATUS;
begin
  Result := Fisc_array_put_slice(status_vector, db_handle, trans_handle,
                    array_id, descriptor, source_array, slice_length);
end;

function TIBServerLibrary.isc_array_put_slice2(status_vector: PISC_STATUS;
  db_handle: PISC_DB_HANDLE; trans_handle: PISC_TR_HANDLE;
  array_id: PISC_QUAD; descriptor: PISC_ARRAY_DESC_V2; source_array: PVoid;
  slice_length: PISC_LONG): ISC_STATUS;
begin
  Result := Fisc_array_put_slice2(status_vector, db_handle, trans_handle,
                array_id, descriptor, source_array, slice_length);
end;

function TIBServerLibrary.isc_array_set_desc(status_vector: PISC_STATUS;
  table_name, column_name: PByte; sql_dtype, sql_length,
  sql_dimensions: PShort; descriptor: PISC_ARRAY_DESC): ISC_STATUS;
begin
  Result := Fisc_array_set_desc(status_vector, table_name, column_name,
                sql_dtype, sql_length, sql_dimensions, descriptor);
end;

function TIBServerLibrary.isc_array_set_desc2(status_vector: PISC_STATUS;
  table_name, column_name: PByte; sql_dtype, sql_length,
  sql_dimensions: PShort; descriptor: PISC_ARRAY_DESC_V2): ISC_STATUS;
begin
  Result := Fisc_array_set_desc2(status_vector, table_name, column_name,
             sql_dtype, sql_length, sql_dimensions, descriptor);
end;

function TIBServerLibrary.isc_attach_database(status_vector: PISC_STATUS;
  db_name_length: Short; db_name: PByte; db_handle: PISC_DB_HANDLE;
  parm_buffer_length: Short; parm_buffer: PByte): ISC_STATUS;
begin
  Result := Fisc_attach_database(status_vector, db_name_length, db_name,
              db_handle, parm_buffer_length, parm_buffer);
end;

procedure TIBServerLibrary.isc_blob_default_desc(descriptor: PISC_BLOB_DESC;
  table_name, column_name: PUChar);
begin
  Fisc_blob_default_desc(descriptor, table_name, column_name);
end;

procedure TIBServerLibrary.isc_blob_default_desc2(
  descriptor: PISC_BLOB_DESC_V2; table_name, column_name: PUChar);
begin
  Fisc_blob_default_desc2(descriptor, table_name, column_name);
end;

function TIBServerLibrary.isc_blob_gen_bpb(status_vector: PISC_STATUS;
  to_descriptor, from_descriptor: PISC_BLOB_DESC;
  bpb_buffer_length: UShort; bpb_buffer: PUChar;
  bpb_length: PUShort): ISC_STATUS;
begin
  Result := Fisc_blob_gen_bpb(status_vector, to_descriptor, from_descriptor,
               bpb_buffer_length, bpb_buffer, bpb_length);
end;

function TIBServerLibrary.isc_blob_gen_bpb2(status_vector: PISC_STATUS;
  to_descriptor, from_descriptor: PISC_BLOB_DESC_V2;
  bpb_buffer_length: UShort; bpb_buffer: PUChar;
  bpb_length: PUShort): ISC_STATUS;
begin
  Result := Fisc_blob_gen_bpb2(status_vector, to_descriptor, from_descriptor,
           bpb_buffer_length, bpb_buffer, bpb_length);
end;

function TIBServerLibrary.isc_blob_info(status_vector: PISC_STATUS;
  blob_handle: PISC_BLOB_HANDLE; item_list_buffer_length: Short;
  item_list_buffer: PByte; result_buffer_length: Short;
  result_buffer: PByte): ISC_STATUS;
begin
  Result := Fisc_blob_info(status_vector, blob_handle, item_list_buffer_length,
                 item_list_buffer, result_buffer_length, result_buffer);
end;

function TIBServerLibrary.isc_blob_lookup_desc(status_vector: PISC_STATUS;
  db_handle: PISC_DB_HANDLE; trans_handle: PISC_TR_HANDLE; table_name,
  column_name: PByte; descriptor: PISC_BLOB_DESC;
  global: PUChar): ISC_STATUS;
begin
  Result := Fisc_blob_lookup_desc(status_vector, db_handle, trans_handle,
                   table_name, column_name, descriptor, global);
end;

function TIBServerLibrary.isc_blob_lookup_desc2(status_vector: PISC_STATUS;
  db_handle: PISC_DB_HANDLE; trans_handle: PISC_TR_HANDLE; table_name,
  column_name: PByte; descriptor: PISC_BLOB_DESC_v2;
  global: PUChar): ISC_STATUS;
begin
  Result := Fisc_blob_lookup_desc2(status_vector, db_handle, trans_handle,
                table_name, column_name, descriptor, global);
end;

function TIBServerLibrary.isc_blob_set_desc(status_vector: PISC_STATUS;
  table_name, column_name: PByte; subtype, charset, segment_size: Short;
  descriptor: PISC_BLOB_DESC): ISC_STATUS;
begin
  Result := Fisc_blob_set_desc(status_vector, table_name, column_name, subtype,
                charset, segment_size, descriptor);
end;

function TIBServerLibrary.isc_blob_set_desc2(status_vector: PISC_STATUS;
  table_name, column_name: PByte; subtype, charset, segment_size: Short;
  descriptor: PISC_BLOB_DESC_V2): ISC_STATUS;
begin
  Result := Fisc_blob_set_desc2(status_vector, table_name, column_name, subtype,
                   charset, segment_size, descriptor);
end;

function TIBServerLibrary.isc_cancel_blob(status_vector: PISC_STATUS;
  blob_handle: PISC_BLOB_HANDLE): ISC_STATUS;
begin
  Result := Fisc_cancel_blob(status_vector, blob_handle);
end;

function TIBServerLibrary.isc_cancel_events(status_vector: PISC_STATUS;
  db_handle: PISC_DB_HANDLE; event_id: PISC_LONG): ISC_STATUS;
begin
  Result := Fisc_cancel_events(status_vector, db_handle, event_id);
end;

function TIBServerLibrary.isc_close_blob(status_vector: PISC_STATUS;
  blob_handle: PISC_BLOB_HANDLE): ISC_STATUS;
begin
  Result := Fisc_close_blob(status_vector, blob_handle);
end;

function TIBServerLibrary.isc_commit_retaining(status_vector: PISC_STATUS;
  tran_handle: PISC_TR_HANDLE): ISC_STATUS;
begin
  Result := Fisc_commit_retaining(status_vector, tran_handle);
end;

function TIBServerLibrary.isc_commit_transaction(status_vector: PISC_STATUS;
  tran_handle: PISC_TR_HANDLE): ISC_STATUS;
begin
  Result := Fisc_commit_transaction(status_vector, tran_handle);
end;

function TIBServerLibrary.isc_create_blob2(status_vector: PISC_STATUS;
  db_handle: PISC_DB_HANDLE; tran_handle: PISC_TR_HANDLE;
  blob_handle: PISC_BLOB_HANDLE; blob_id: PISC_QUAD; bpb_length: Short;
  bpb_address: PByte): ISC_STATUS;
begin
  Result := Fisc_create_blob2(status_vector, db_handle, tran_handle,
                 blob_handle, blob_id, bpb_length, bpb_address);
end;

function TIBServerLibrary.isc_create_database(status_vector: PISC_STATUS;
               db_name_length : Short; db_name : PByte; db_handle : PISC_DB_HANDLE;
			         dpb_length : Short; dpb : PByte; isc_arg7 : Short): ISC_STATUS;
begin
  Result := Fisc_create_database(status_vector, db_name_length, db_name, db_handle,
               dpb_length, dpb, isc_arg7);
end;

function TIBServerLibrary.isc_database_info(status_vector: PISC_STATUS;
  db_handle: PISC_DB_HANDLE; item_list_buffer_length: Short;
  item_list_buffer: PByte; result_buffer_length: Short;
  result_buffer: PByte): ISC_STATUS;
begin
  Result := Fisc_database_info(status_vector, db_handle, item_list_buffer_length,
                item_list_buffer, result_buffer_length, result_buffer);
end;

procedure TIBServerLibrary.isc_decode_date(ib_date: PISC_QUAD;
  tm_date: PCTimeStructure);
begin
  Fisc_decode_date(ib_date, tm_date);
end;

procedure TIBServerLibrary.isc_decode_sql_date(ib_date: PISC_DATE;
  tm_date: PCTimeStructure);
begin
  Fisc_decode_sql_date(ib_date, tm_date);
end;

procedure TIBServerLibrary.isc_decode_sql_time(ib_time: PISC_TIME;
  tm_date: PCTimeStructure);
begin
  Fisc_decode_sql_time(ib_time, tm_date);
end;

procedure TIBServerLibrary.isc_decode_timestamp(
  ib_timestamp: PISC_TIMESTAMP; tm_date: PCTimeStructure);
begin
  Fisc_decode_timestamp(ib_timestamp, tm_date);
end;

function TIBServerLibrary.isc_delete_user(status_vector: PISC_STATUS;
  user_sec_data: PUserSecData): ISC_STATUS;
begin
  Result := Fisc_delete_user(status_vector, user_sec_data);
end;

function TIBServerLibrary.isc_detach_database(status_vector: PISC_STATUS;
  db_handle: PISC_DB_HANDLE): ISC_STATUS;
begin
  Result := Fisc_detach_database(status_vector, db_handle);
end;

function TIBServerLibrary.isc_drop_database(status_vector: PISC_STATUS;
  db_handle: PISC_DB_HANDLE): ISC_STATUS;
begin
  Result := Fisc_drop_database(status_vector, db_handle);
end;

function TIBServerLibrary.isc_dsql_alloc_statement2(
  status_vector: PISC_STATUS; db_handle: PISC_DB_HANDLE;
  stmt_handle: PISC_STMT_HANDLE): ISC_STATUS;
begin
  Result := Fisc_dsql_alloc_statement2( status_vector, db_handle, stmt_handle);
end;

function TIBServerLibrary.isc_dsql_batch_execute(status_vector: PISC_STATUS;
  tran_handle: PISC_TR_HANDLE; stmt_handle: PISC_STMT_HANDLE; Dialect: UShort;
  insqlda: PXSQLDA; no_of_rows: UShort; batch_vars: PXSQLVAR;
  rows_affected: PULong): ISC_STATUS;
begin
  Result := Fisc_dsql_batch_execute(status_vector, tran_handle, stmt_handle, Dialect,
    insqlda, no_of_rows, batch_vars, rows_affected);
end;

function TIBServerLibrary.isc_dsql_batch_execute_immed(status_vector : PISC_STATUS;
						   db_handle : PISC_DB_HANDLE; tran_handle : PISC_TR_HANDLE;
						   Dialect : UShort; no_of_sql : ULong; statement : PPByte;
						   rows_affected : PULong): ISC_STATUS;
begin
  Result := Fisc_dsql_batch_execute_immed(status_vector, db_handle,
      tran_handle, Dialect, no_of_sql, statement, rows_affected);
end;

function TIBServerLibrary.isc_dsql_describe(status_vector: PISC_STATUS;
  stmt_handle: PISC_STMT_HANDLE; dialect: UShort;
  xsqlda: PXSQLDA): ISC_STATUS;
begin
  Result := Fisc_dsql_describe(status_vector, stmt_handle, dialect, xsqlda);
end;

function TIBServerLibrary.isc_dsql_describe_bind(status_vector: PISC_STATUS;
  stmt_handle: PISC_STMT_HANDLE; dialect: UShort;
  xsqlda: PXSQLDA): ISC_STATUS;
begin
  Result := Fisc_dsql_describe_bind(status_vector, stmt_handle, dialect,
                  xsqlda);
end;

function TIBServerLibrary.isc_dsql_execute(status_vector: PISC_STATUS;
  tran_handle: PISC_TR_HANDLE; stmt_handle: PISC_STMT_HANDLE;
  dialect: UShort; xsqlda: PXSQLDA): ISC_STATUS;
begin
  Result := Fisc_dsql_execute(status_vector, tran_handle, stmt_handle,
              dialect, xsqlda);
end;

function TIBServerLibrary.isc_dsql_execute_immediate(
  status_vector: PISC_STATUS; db_handle: PISC_DB_HANDLE;
  tran_handle: PISC_TR_HANDLE; length: UShort; statement: PByte;
  dialect: UShort; xsqlda: PXSQLDA): ISC_STATUS;
begin
  Result := Fisc_dsql_execute_immediate(status_vector, db_handle,
               tran_handle, length, statement, dialect, xsqlda);
end;

function TIBServerLibrary.isc_dsql_exec_immed2(status_vector: PISC_STATUS;
  db_handle: PISC_DB_HANDLE; tran_handle: PISC_TR_HANDLE; length: UShort;
  statement: PByte; dialect: UShort; in_xsqlda,
  out_xsqlda: PXSQLDA): ISC_STATUS;
begin
  Result := Fisc_dsql_exec_immed2(status_vector, db_handle, tran_handle, length,
                     statement, dialect, in_xsqlda, out_xsqlda);
end;

function TIBServerLibrary.isc_dsql_execute2(status_vector: PISC_STATUS;
  tran_handle: PISC_TR_HANDLE; stmt_handle: PISC_STMT_HANDLE;
  dialect: UShort; in_xsqlda, out_xsqlda: PXSQLDA): ISC_STATUS;
begin
  Result := Fisc_dsql_execute2(status_vector, tran_handle, stmt_handle,
                dialect, in_xsqlda, out_xsqlda);
end;

function TIBServerLibrary.isc_dsql_fetch(status_vector: PISC_STATUS;
  stmt_handle: PISC_STMT_HANDLE; dialect: UShort;
  xsqlda: PXSQLDA): ISC_STATUS;
begin
  Result := Fisc_dsql_fetch(status_vector, stmt_handle, dialect, xsqlda);
end;

function TIBServerLibrary.isc_dsql_free_statement(
  status_vector: PISC_STATUS; stmt_handle: PISC_STMT_HANDLE;
  options: UShort): ISC_STATUS;
begin
  Result := Fisc_dsql_free_statement(status_vector, stmt_handle, options);
end;

function TIBServerLibrary.isc_dsql_prepare(status_vector: PISC_STATUS;
  tran_handle: PISC_TR_HANDLE; stmt_handle: PISC_STMT_HANDLE;
  length: UShort; statement: PByte; dialect: UShort;
  xsqlda: PXSQLDA): ISC_STATUS;
begin
  Result := Fisc_dsql_prepare(status_vector, tran_handle, stmt_handle,
                    length, statement, dialect, xsqlda);
end;

function TIBServerLibrary.isc_dsql_set_cursor_name(
  status_vector: PISC_STATUS; stmt_handle: PISC_STMT_HANDLE;
  cursor_name: PByte; _type: UShort): ISC_STATUS;
begin
  Result := Fisc_dsql_set_cursor_name(status_vector, stmt_handle, cursor_name,
                       _type);
end;

function TIBServerLibrary.isc_dsql_sql_info(status_vector: PISC_STATUS;
  stmt_handle: PISC_STMT_HANDLE; item_length: Short; items: PByte;
  buffer_length: Short; buffer: PByte): ISC_STATUS;
begin
  Result := Fisc_dsql_sql_info(status_vector, stmt_handle, item_length, items,
                buffer_length, buffer);
end;

procedure TIBServerLibrary.isc_encode_date(tm_date: PCTimeStructure;
  ib_date: PISC_QUAD);
begin
  Fisc_encode_date(tm_date, ib_date);
end;

procedure TIBServerLibrary.isc_encode_sql_date(tm_date: PCTimeStructure;
  ib_date: PISC_DATE);
begin
  Fisc_encode_sql_date(tm_date, ib_date);
end;

procedure TIBServerLibrary.isc_encode_sql_time(tm_date: PCTimeStructure;
  ib_time: PISC_TIME);
begin
  Fisc_encode_sql_time(tm_date, ib_time);
end;

procedure TIBServerLibrary.isc_encode_timestamp(tm_date: PCTimeStructure;
  ib_timestamp: PISC_TIMESTAMP);
begin
  Fisc_encode_timestamp(tm_date, ib_timestamp);
end;

type
  Tsib_event_block = function (var EventBuffer : PByte; var ResultBuffer: PByte; IDCount: UShort;
    Event1, Event2, Event3, Event4, Event5, Event6, Event7, Event8, Event9,
    Event10, Event11, Event12, Event13, Event14, Event15: PByte): ISC_LONG; cdecl;


function TIBServerLibrary.isc_event_block(var event_buffer : PByte; var result_buffer : PByte;
				                     id_count : UShort; event_list : array of PByte): ISC_LONG;
begin
  Result := Tsib_event_block(Fisc_event_block)(event_buffer, result_buffer,
    id_count, event_list[0], event_list[1], event_list[2], event_list[3],
    event_list[4], event_list[5], event_list[6], event_list[7], event_list[8],
    event_list[9], event_list[10], event_list[11], event_list[12],
    event_list[13], event_list[14]);
end;

procedure TIBServerLibrary.isc_event_counts(status_vector: PUISC_LONG;
  buffer_length: Short; event_buffer : PByte; result_buffer: PByte);
begin
  Fisc_event_counts(status_vector, buffer_length, event_buffer, result_buffer);
end;

function TIBServerLibrary.isc_free(isc_arg1: PByte): ISC_LONG;
begin
  Result := Fisc_free(isc_arg1);
end;

function TIBServerLibrary.isc_get_client_major_version: Integer;
begin
  Result := Fisc_get_client_major_version
end;

function TIBServerLibrary.isc_get_client_minor_version: Integer;
begin
  Result := Fisc_get_client_minor_version
end;

procedure TIBServerLibrary.isc_get_client_version(buffer: PByte);
begin
  Fisc_get_client_version(buffer);
end;

function TIBServerLibrary.isc_get_segment(status_vector: PISC_STATUS;
  blob_handle: PISC_BLOB_HANDLE; actual_seg_length: PUShort;
  seg_buffer_length: UShort; seg_buffer: PByte): ISC_STATUS;
begin
  Result := Fisc_get_segment(status_vector, blob_handle, actual_seg_length,
              seg_buffer_length, seg_buffer);
end;

function TIBServerLibrary.isc_interprete(buffer: PByte;
  status_vector: PPISC_STATUS): ISC_STATUS;
begin
  Result := Fisc_interprete(buffer, status_vector);
end;

function TIBServerLibrary.isc_modify_user(status_vector: PISC_STATUS;
  user_sec_data: PUserSecData): ISC_STATUS;
begin
  Result := Fisc_modify_user(status_vector, user_sec_data);
end;

function TIBServerLibrary.isc_open_blob2(status_vector: PISC_STATUS;
  db_handle: PISC_DB_HANDLE; tran_handle: PISC_TR_HANDLE;
  blob_handle: PISC_BLOB_HANDLE; blob_id: PISC_QUAD; bpb_length: Short;
  bpb_buffer: PByte): ISC_STATUS;
begin
  Result := Fisc_open_blob2(status_vector, db_handle, tran_handle,
              blob_handle, blob_id, bpb_length, bpb_buffer);
end;

function TIBServerLibrary.isc_prepare_transaction(
  status_vector: PISC_STATUS; tran_handle: PISC_TR_HANDLE): ISC_STATUS;
begin
  Result := Fisc_prepare_transaction(status_vector, tran_handle);
end;

function TIBServerLibrary.isc_prepare_transaction2(
  status_vector: PISC_STATUS; tran_handle: PISC_TR_HANDLE;
  msg_length: Short; msg: PByte): ISC_STATUS;
begin
  Result := Fisc_prepare_transaction2(status_vector, tran_handle, msg_length, msg);
end;

function TIBServerLibrary.isc_put_segment(status_vector: PISC_STATUS;
  blob_handle: PISC_BLOB_HANDLE; seg_buffer_len: UShort;
  seg_buffer: PByte): ISC_STATUS;
begin
  Result := Fisc_put_segment(status_vector, blob_handle, seg_buffer_len, seg_buffer);
end;

function TIBServerLibrary.isc_que_events(status_vector: PISC_STATUS;
  db_handle: PISC_DB_HANDLE; event_id: PISC_LONG; length: Short;
  event_buffer: PByte; event_function: TISC_CALLBACK;
  event_function_arg: PVoid): ISC_STATUS;
begin
  Result := Fisc_que_events(status_vector, db_handle, event_id, length,
            event_buffer, event_function, event_function_arg);
end;

function TIBServerLibrary.isc_release_savepoint(status_vector: PISC_STATUS;
  tran_handle: PISC_TR_HANDLE; tran_name: PByte): ISC_STATUS;
begin
  Result := Fisc_release_savepoint(status_vector, tran_handle, tran_name);
end;

function TIBServerLibrary.isc_rollback_retaining(status_vector: PISC_STATUS;
  tran_handle: PISC_TR_HANDLE): ISC_STATUS;
begin
  Result := Fisc_rollback_retaining(status_vector, tran_handle);
end;

function TIBServerLibrary.isc_rollback_savepoint(status_vector : PISC_STATUS;
   tran_handle : PISC_TR_HANDLE; tran_name : PByte;
   Option : UShort): ISC_STATUS;
begin
  Result := Fisc_rollback_savepoint(status_vector, tran_handle, tran_name,
               Option);
end;

function TIBServerLibrary.isc_rollback_transaction(
  status_vector: PISC_STATUS; tran_handle: PISC_TR_HANDLE): ISC_STATUS;
begin
  Result := Fisc_rollback_transaction(status_vector, tran_handle);
end;

function TIBServerLibrary.isc_service_attach(status_vector: PISC_STATUS;
  isc_arg2: UShort; isc_arg3: PByte; service_handle: PISC_SVC_HANDLE;
  isc_arg5: UShort; isc_arg6: PByte): ISC_STATUS;
begin
  Result := Fisc_service_attach(status_vector, isc_arg2, isc_arg3,
             service_handle, isc_arg5, isc_arg6);
end;

function TIBServerLibrary.isc_service_detach(status_vector: PISC_STATUS;
  service_handle: PISC_SVC_HANDLE): ISC_STATUS;
begin
  Result := Fisc_service_detach(status_vector, service_handle);
end;

function TIBServerLibrary.isc_service_query(status_vector: PISC_STATUS;
  service_handle, recv_handle: PISC_SVC_HANDLE; isc_arg4: UShort;
  isc_arg5: PByte; isc_arg6: UShort; isc_arg7: PByte; isc_arg8: UShort;
  isc_arg9: PByte): ISC_STATUS;
begin
  Result := Fisc_service_query(status_vector, service_handle, recv_handle,
               isc_arg4, isc_arg5, isc_arg6, isc_arg7, isc_arg8, isc_arg9);
end;

function TIBServerLibrary.isc_service_start(status_vector: PISC_STATUS;
  service_handle, recv_handle: PISC_SVC_HANDLE; isc_arg4: UShort;
  isc_arg5: PByte): ISC_STATUS;
begin
  Result := Fisc_service_start(status_vector, service_handle, recv_handle,
             isc_arg4, isc_arg5);
end;

procedure TIBServerLibrary.isc_sql_interprete(sqlcode: Short; buffer: PByte;
  buffer_length: Short);
begin
   Fisc_sql_interprete(sqlcode, buffer, buffer_length);
end;

function TIBServerLibrary.isc_sqlcode(status_vector: PISC_STATUS): ISC_LONG;
begin
  Result := Fisc_sqlcode(status_vector);
end;

function TIBServerLibrary.isc_start_multiple(status_vector: PISC_STATUS;
  tran_handle: PISC_TR_HANDLE; db_handle_count: Short;
  teb_vector_address: PISC_TEB): ISC_STATUS;
begin
  Result := Fisc_start_multiple(status_vector, tran_handle, db_handle_count,
               teb_vector_address);
end;

function TIBServerLibrary.isc_start_transaction(status_vector: PISC_STATUS;
  tran_handle: PISC_TR_HANDLE; db_handle_count: Short;
  db_handle: PISC_DB_HANDLE; tpb_length: UShort;
  tpb_address: PByte): ISC_STATUS;
begin
  Result := Fisc_start_transaction(status_vector, tran_handle, db_handle_count, db_handle,
                         tpb_length, tpb_address);
end;

function TIBServerLibrary.isc_start_savepoint(status_vector: PISC_STATUS;
  tran_handle: PISC_TR_HANDLE; tran_name: PByte): ISC_STATUS;
begin
  Result := Fisc_start_savepoint(status_vector, tran_handle, tran_name);
end;

function TIBServerLibrary.isc_vax_integer(buffer: PByte;
  length: Short): ISC_LONG;
begin
  Result := Fisc_vax_integer(buffer, length);
end;

function TIBServerLibrary.isc_portable_integer(buffer: PByte;
  length: Short): ISC_INT64;
begin
  Result := Fisc_portable_integer(buffer, length);
end;

function TIBServerLibrary.BLOB_get(isc_arg1: PBSTREAM): Int;
begin
  Result := FBLOB_get(isc_arg1);
end;

function TIBServerLibrary.isc_transaction_info(status_vector: PISC_STATUS;
  tran_handle: PISC_TR_HANDLE; item_list_buffer_length: Short;
  item_list_buffer: PByte; result_buffer_length: Short;
  result_buffer: PByte): ISC_STATUS;
begin
  Result := Fisc_transaction_info(status_vector, tran_handle,
                   item_list_buffer_length, item_list_buffer,
                   result_buffer_length, result_buffer);
end;

{ TIBEmbeddedserver }

function TIBEmbeddedLibrary.LibraryName: String;
begin
  Result := IBTOGO_DLL;
end;

{$IFDEF ANDROID}
procedure SetInterBaseVariable;
var
  M: TMarshaller;
begin
  setenv('INTERBASE', M.AsUtf8(GetFilesDir + PathDelim + 'interbase').ToPointer, 1);  {do not localize}
end;
{$ENDIF}

initialization
  IBClientInterface := TIBInterface.Create(TIStringComparer.Ordinal);
  IBServerLibrary := TIBServerLibrary.Create;
  AddIBInterface('IBServer', IBServerLibrary);  {do not localize}
  IBEmbeddedLibrary := TIBEmbeddedLibrary.Create;
  AddIBInterface('IBEmbedded', IBEmbeddedLibrary); {do not localize}
{$IFDEF ANDROID}
  SetInterBaseVariable;
{$ENDIF}

finalization
  IBServerLibrary := nil;
  IBEmbeddedLibrary := nil;
  IBClientInterface.Free;
  FreeIBInstallLibrary;
end.
