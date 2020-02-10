object Dm: TDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 518
  Width = 747
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 168
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
    Left = 56
    Top = 16
  end
  object FDQcategoria_Categoria: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from tab_categoria')
    Left = 440
    Top = 16
    object FDQcategoria_CategoriaID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
      Origin = 'ID_CATEGORIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQcategoria_CategoriaDESCRICAO: TStringField
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
    Left = 56
    Top = 72
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
    Left = 104
    Top = 448
  end
  object FDQInsertCadLancamento: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select *'
      'from tab_lancamento ')
    Left = 656
    Top = 288
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
    Top = 448
  end
  object FDQSaldoDeLancamento: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select ifnull(SUM(VALOR),0) saldo '
      'from tab_lancamento'
      'where quitada = :quitada'
      'and tipo_lancamento = :tipo'
      '')
    Left = 56
    Top = 208
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
    Left = 168
    Top = 448
  end
  object FDQtabLancamento: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from '
      'tab_lancamento'
      ''
      ''
      '')
    Left = 648
    Top = 352
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
  object FDQUltimosLanc: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select id_lancamento,'
      '        valor,'
      '        data,'
      '        l.descricao,'
      '        tipo_lancamento tipoLancamento,'
      '        c.descricao categoria'
      'from '
      'tab_lancamento l'
      'left join tab_categoria c on c.ID_CATEGORIA=l.ID_CATEGORIA'
      'where quitada = '#39'S'#39)
    Left = 56
    Top = 136
    object FDQUltimosLancID_LANCAMENTO: TFDAutoIncField
      FieldName = 'ID_LANCAMENTO'
      Origin = 'ID_LANCAMENTO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQUltimosLancVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'VALOR'
    end
    object FDQUltimosLancDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'DATA'
    end
    object FDQUltimosLancDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object FDQUltimosLanctipoLancamento: TStringField
      FieldName = 'tipoLancamento'
      Origin = 'TIPO_LANCAMENTO'
      Size = 1
    end
    object FDQUltimosLanccategoria: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'categoria'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object FDQLancamento: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from tab_Lancamento')
    Left = 64
    Top = 280
    object FDQLancamentoID_LANCAMENTO: TFDAutoIncField
      FieldName = 'ID_LANCAMENTO'
      Origin = 'ID_LANCAMENTO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQLancamentoVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'VALOR'
    end
    object FDQLancamentoDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'DATA'
    end
    object FDQLancamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object FDQLancamentoID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
      Origin = 'ID_CATEGORIA'
    end
    object FDQLancamentoTIPO_LANCAMENTO: TStringField
      FieldName = 'TIPO_LANCAMENTO'
      Origin = 'TIPO_LANCAMENTO'
      Size = 1
    end
    object FDQLancamentoQUITADA: TStringField
      FieldName = 'QUITADA'
      Origin = 'QUITADA'
      Size = 1
    end
    object FDQLancamentoNROPARCELA: TIntegerField
      FieldName = 'NROPARCELA'
      Origin = 'NROPARCELA'
    end
  end
  object FDQGeral: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      '')
    Left = 656
    Top = 16
  end
  object FDQCategoria_CadLanc: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from tab_categoria')
    Left = 312
    Top = 16
  end
  object FDQLancamento_CadLanc: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from tab_lancamento')
    Left = 312
    Top = 88
    object FDQLancamento_CadLancID_LANCAMENTO: TIntegerField
      FieldName = 'ID_LANCAMENTO'
      Origin = 'ID_LANCAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQLancamento_CadLancVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'VALOR'
    end
    object FDQLancamento_CadLancDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'DATA'
    end
    object FDQLancamento_CadLancDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object FDQLancamento_CadLancID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
      Origin = 'ID_CATEGORIA'
    end
    object FDQLancamento_CadLancTIPO_LANCAMENTO: TStringField
      FieldName = 'TIPO_LANCAMENTO'
      Origin = 'TIPO_LANCAMENTO'
      Size = 1
    end
    object FDQLancamento_CadLancQUITADA: TStringField
      FieldName = 'QUITADA'
      Origin = 'QUITADA'
      Size = 1
    end
    object FDQLancamento_CadLancNROPARCELA: TIntegerField
      FieldName = 'NROPARCELA'
      Origin = 'NROPARCELA'
    end
  end
end
