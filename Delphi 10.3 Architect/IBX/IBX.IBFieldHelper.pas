{       Embarcadero Delphi Visual Component Library           }
{       InterBase Express core components                     }
{                                                             }
{       Copyright (c) 1998-2017 Embarcadero Technologies, Inc.}
{              All rights reserved                            }
{                                                             }
{    Additional code created by Jeff Overcash and used        }
{    with permission.                                         }
{*************************************************************}

unit IBX.IBFieldHelper;

interface

uses
  Data.DB, IBX.IBSql;

type

  TIBFieldHelper = class helper for TField
  public
    function ChangeState : TIBChangeState;
  end;

implementation

uses
  IBX.IBCustomDataSet;

{ TIBFieldHelper }

/// <summary> Returns the change state for the field for InterBase subscriptions
/// </summary>
/// <remarks>
/// This is the same as calling The TField version in IBCustomDataset.
/// Caluculated fields and fields not part of the dataset always return csSame.
/// </remarks>
/// <returns>The IBX.TIBChangeState for the associated TField.
/// </returns>
function TIBFieldHelper.ChangeState: TIBChangeState;
begin
  Result := (DataSet as TIBCustomDataset).ChangeState(Self);
end;

end.
