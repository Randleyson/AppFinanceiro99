object Dm: TDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 470
  Width = 726
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 152
    Top = 16
  end
  object FDConn: TFDConnection
    Params.Strings = (
      
        'Database=D:\Programac'#227'o\Delphi\android\AppFinanceiro99\db\databa' +
        'se.db'
      'OpenMode=ReadWrite'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 16
  end
  object FDQcategoria: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from tab_categoria')
    Left = 176
    Top = 232
    object FDQcategoriaID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
      Origin = 'ID_CATEGORIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQcategoriaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 50
    end
  end
  object FDQUsuario: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select login,'
      '       senha,'
      '       ind_login,'
      '       nome,'
      '       idiona,'
      '       moeda'
      ' from tab_config')
    Left = 48
    Top = 80
    object FDQUsuarioLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Size = 100
    end
    object FDQUsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 50
    end
    object FDQUsuarioNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object FDQUsuarioIDIONA: TStringField
      FieldName = 'IDIONA'
      Origin = 'IDIONA'
      Size = 50
    end
    object FDQUsuarioMOEDA: TStringField
      FieldName = 'MOEDA'
      Origin = 'MOEDA'
      Size = 50
    end
    object FDQUsuarioIND_LOGIN: TStringField
      FieldName = 'IND_LOGIN'
      Origin = 'IND_LOGIN'
      Size = 1
    end
  end
  object FDQUpdate: TFDQuery
    Connection = FDConn
    Left = 112
    Top = 408
  end
  object FDQInsertCadLancamento: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select *'
      'from tab_lancamento ')
    Left = 176
    Top = 88
    object FDQInsertCadLancamentoID_LANCAMENTO: TIntegerField
      FieldName = 'ID_LANCAMENTO'
      Origin = 'ID_LANCAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQInsertCadLancamentoVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'VALOR'
    end
    object FDQInsertCadLancamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object FDQInsertCadLancamentoID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
      Origin = 'ID_CATEGORIA'
    end
    object FDQInsertCadLancamentoTIPO_LANCAMENTO: TStringField
      FieldName = 'TIPO_LANCAMENTO'
      Origin = 'TIPO_LANCAMENTO'
      Size = 1
    end
    object FDQInsertCadLancamentoQUITADA: TStringField
      FieldName = 'QUITADA'
      Origin = 'QUITADA'
      Size = 1
    end
    object FDQInsertCadLancamentoNROPARCELA: TIntegerField
      FieldName = 'NROPARCELA'
      Origin = 'NROPARCELA'
    end
    object FDQInsertCadLancamentoDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'DATA'
    end
  end
  object FDQDelete: TFDQuery
    Connection = FDConn
    Left = 32
    Top = 408
  end
  object FDQSaldoDeLancamento: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select ifnull(SUM(VALOR),0) saldo '
      'from tab_lancamento'
      'where quitada = :quitada'
      'and tipo_lancamento = :tipo'
      '')
    Left = 48
    Top = 144
    ParamData = <
      item
        Name = 'QUITADA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TIPO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDQInsert: TFDQuery
    Connection = FDConn
    Left = 184
    Top = 408
  end
  object FDQtabLancamento: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from '
      'tab_lancamento'
      ''
      ''
      '')
    Left = 176
    Top = 160
    object FDQtabLancamentoID_LANCAMENTO: TIntegerField
      FieldName = 'ID_LANCAMENTO'
      Origin = 'ID_LANCAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQtabLancamentoVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'VALOR'
    end
    object FDQtabLancamentoDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'DATA'
    end
    object FDQtabLancamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object FDQtabLancamentoID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
      Origin = 'ID_CATEGORIA'
    end
    object FDQtabLancamentoTIPO_LANCAMENTO: TStringField
      FieldName = 'TIPO_LANCAMENTO'
      Origin = 'TIPO_LANCAMENTO'
      Size = 1
    end
    object FDQtabLancamentoQUITADA: TStringField
      FieldName = 'QUITADA'
      Origin = 'QUITADA'
      Size = 1
    end
    object FDQtabLancamentoNROPARCELA: TIntegerField
      FieldName = 'NROPARCELA'
      Origin = 'NROPARCELA'
    end
  end
end
