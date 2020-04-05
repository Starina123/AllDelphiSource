object ConfigDM: TConfigDM
  OldCreateOrder = False
  Height = 485
  Width = 628
  object SettingsMT: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'Section'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 4098
      end
      item
        Name = 'Value'
        DataType = ftString
        Size = 4098
      end
      item
        Name = 'Type'
        DataType = ftInteger
      end
      item
        Name = 'ItemOrder'
        DataType = ftInteger
      end
      item
        Name = 'SectionOrder'
        DataType = ftInteger
      end>
    IndexDefs = <>
    IndexFieldNames = 'SectionOrder:A;'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 304
    Top = 160
  end
  object DataMT: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'InstanceName'
        DataType = ftString
        Size = 512
      end
      item
        Name = 'Database'
        DataType = ftString
        Size = 4098
      end
      item
        Name = 'UserName'
        DataType = ftString
        Size = 512
      end
      item
        Name = 'Password'
        DataType = ftString
        Size = 512
      end
      item
        Name = 'SEPassword'
        DataType = ftString
        Size = 512
      end
      item
        Name = 'Pooled'
        DataType = ftString
        Size = 512
      end
      item
        Name = 'PooledMax'
        DataType = ftString
        Size = 512
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 200
    Top = 160
  end
  object ServerMT: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'MaxConnections'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'MaxUsers'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'MasterSecret'
        DataType = ftString
        Size = 512
      end
      item
        Name = 'AppSecret'
        DataType = ftString
        Size = 512
      end
      item
        Name = 'ApplicationID'
        DataType = ftString
        Size = 512
      end
      item
        Name = 'Port'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'HTTPS'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'CertFile'
        DataType = ftString
        Size = 4096
      end
      item
        Name = 'RootCertFile'
        DataType = ftString
        Size = 4096
      end
      item
        Name = 'KeyFile'
        DataType = ftString
        Size = 4096
      end
      item
        Name = 'KeyFilePassword'
        DataType = ftString
        Size = 512
      end
      item
        Name = 'CrossDomain'
        DataType = ftString
        Size = 1024
      end
      item
        Name = 'ThreadPool'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'ThreadPoolSize'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'ListenQueue'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'KeepAlive'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'ProxyHost'
        DataType = ftString
        Size = 1024
      end
      item
        Name = 'ProxyPort'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'ProxyUserName'
        DataType = ftString
        Size = 512
      end
      item
        Name = 'ProxyPassword'
        DataType = ftString
        Size = 512
      end
      item
        Name = 'MultiTenantMode'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'DefaultTenantId'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'TenantIDCookieName'
        DataType = ftString
        Size = 512
      end
      item
        Name = 'Resources'
        DataType = ftString
        Size = 512
      end
      item
        Name = 'FileName'
        DataType = ftString
        Size = 4096
      end
      item
        Name = 'Append'
        DataType = ftString
        Size = 128
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 96
    Top = 112
  end
  object PushNotificationsMT: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'ApiKey'
        DataType = ftString
        Size = 4096
      end
      item
        Name = 'ApiURL'
        DataType = ftString
        Size = 4096
      end
      item
        Name = 'CertificateFileName'
        DataType = ftString
        Size = 4096
      end
      item
        Name = 'CertificateFilePassword'
        DataType = ftString
        Size = 512
      end
      item
        Name = 'ProductionEnvironment'
        DataType = ftString
        Size = 128
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 336
    Top = 264
  end
  object ServerStatusMT: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'MaxConnections'
        DataType = ftBoolean
      end
      item
        Name = 'MaxUsers'
        DataType = ftBoolean
      end
      item
        Name = 'MasterSecret'
        DataType = ftBoolean
      end
      item
        Name = 'AppSecret'
        DataType = ftBoolean
      end
      item
        Name = 'ApplicationID'
        DataType = ftBoolean
      end
      item
        Name = 'Port'
        DataType = ftBoolean
      end
      item
        Name = 'HTTPS'
        DataType = ftBoolean
      end
      item
        Name = 'CertFile'
        DataType = ftBoolean
      end
      item
        Name = 'RootCertFile'
        DataType = ftBoolean
      end
      item
        Name = 'KeyFile'
        DataType = ftBoolean
      end
      item
        Name = 'KeyFilePassword'
        DataType = ftBoolean
      end
      item
        Name = 'CrossDomain'
        DataType = ftBoolean
      end
      item
        Name = 'ThreadPool'
        DataType = ftBoolean
      end
      item
        Name = 'ThreadPoolSize'
        DataType = ftBoolean
      end
      item
        Name = 'ListenQueue'
        DataType = ftBoolean
      end
      item
        Name = 'KeepAlive'
        DataType = ftBoolean
      end
      item
        Name = 'ProxyHost'
        DataType = ftBoolean
      end
      item
        Name = 'ProxyPort'
        DataType = ftBoolean
      end
      item
        Name = 'ProxyUserName'
        DataType = ftBoolean
      end
      item
        Name = 'ProxyPassword'
        DataType = ftBoolean
      end
      item
        Name = 'MultiTenantMode'
        DataType = ftBoolean
      end
      item
        Name = 'DefaultTenantId'
        DataType = ftBoolean
      end
      item
        Name = 'TenantIDCookieName'
        DataType = ftBoolean
      end
      item
        Name = 'Resources'
        DataType = ftBoolean
      end
      item
        Name = 'FileName'
        DataType = ftBoolean
      end
      item
        Name = 'Append'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 104
    Top = 168
  end
  object DataStatusMT: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'InstanceName'
        DataType = ftBoolean
      end
      item
        Name = 'Database'
        DataType = ftBoolean
      end
      item
        Name = 'UserName'
        DataType = ftBoolean
      end
      item
        Name = 'Password'
        DataType = ftBoolean
      end
      item
        Name = 'SEPassword'
        DataType = ftBoolean
      end
      item
        Name = 'Pooled'
        DataType = ftBoolean
      end
      item
        Name = 'PooledMax'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 216
    Top = 216
  end
  object PushNotificationsStatusMT: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'ApiKey'
        DataType = ftBoolean
      end
      item
        Name = 'ApiURL'
        DataType = ftBoolean
      end
      item
        Name = 'CertificateFileName'
        DataType = ftBoolean
      end
      item
        Name = 'CertificateFilePassword'
        DataType = ftBoolean
      end
      item
        Name = 'ProductionEnvironment'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 344
    Top = 320
  end
end
