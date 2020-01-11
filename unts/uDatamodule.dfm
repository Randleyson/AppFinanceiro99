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
    LoginPrompt = False
    Left = 64
    Top = 16
  end
  object FDQcategoria: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from tab_categoria')
    Left = 168
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
  object FDQTab_Lancamento: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from tab_lancamento')
    Left = 488
    Top = 224
    object FDQTab_LancamentoID_LANCAMENTO: TIntegerField
      FieldName = 'ID_LANCAMENTO'
      Origin = 'ID_LANCAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQTab_LancamentoVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'VALOR'
    end
    object FDQTab_LancamentoDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'DATA'
    end
    object FDQTab_LancamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object FDQTab_LancamentoID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
      Origin = 'ID_CATEGORIA'
    end
    object FDQTab_LancamentoTIPO_LANCAMENTO: TStringField
      FieldName = 'TIPO_LANCAMENTO'
      Origin = 'TIPO_LANCAMENTO'
      Size = 1
    end
    object FDQTab_LancamentoQUITADA: TStringField
      FieldName = 'QUITADA'
      Origin = 'QUITADA'
      Size = 1
    end
  end
  object FDQNovoID: TFDQuery
    Connection = FDConn
    Left = 488
    Top = 136
  end
  object FDQgeral: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      
        'insert into tab_lancamento(id_lancamento,valor,data,descricao,id' +
        '_categoria,tipo_lancamento,quitada)'
      
        'values (:pIdlancamento, :pValor, :pDdata, :pDescricao, :pIdcateg' +
        'oria, :pTipo, :pQuidata)')
    Left = 504
    Top = 360
    ParamData = <
      item
        Name = 'PIDLANCAMENTO'
        DataType = ftWideString
        ParamType = ptInput
        Value = '16'
      end
      item
        Name = 'PVALOR'
        DataType = ftWideString
        ParamType = ptInput
        Value = '15'
      end
      item
        Name = 'PDDATA'
        DataType = ftWideString
        ParamType = ptInput
        Value = '2019-10-20'
      end
      item
        Name = 'PDESCRICAO'
        DataType = ftWideString
        ParamType = ptInput
        Value = 'khjk'
      end
      item
        Name = 'PIDCATEGORIA'
        DataType = ftWideString
        ParamType = ptInput
        Value = '5'
      end
      item
        Name = 'PTIPO'
        DataType = ftWideString
        ParamType = ptInput
        Value = 'c'
      end
      item
        Name = 'PQUIDATA'
        DataType = ftWideString
        ParamType = ptInput
        Value = 's'
      end>
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
  object FDQHome: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select ifnull(a.valor,0) despesa,'
      '       ifnull(b.valor,0) receitas,'
      '       ifnull(c.valor,0) pago,'
      '       ifnull(d.valor,0) recebido,'
      '       ifnull(e.valor,0) apagar,'
      '       ifnull(f.valor,0) areceber '
      
        'from (select '#39'1'#39' id ,sum(valor) valor from tab_lancamento where ' +
        'tipo_lancamento = '#39'C'#39') a'
      
        'left join (select '#39'1'#39' id ,sum(valor) valor from tab_lancamento w' +
        'here tipo_lancamento = '#39'D'#39') b on b.id=a.id'
      
        'left join (select '#39'1'#39' id ,sum(valor) valor from tab_lancamento w' +
        'here tipo_lancamento = '#39'C'#39' and quitada = '#39'S'#39') c on c.id=a.id'
      
        'left join (select '#39'1'#39' id ,sum(valor) valor from tab_lancamento w' +
        'here tipo_lancamento = '#39'D'#39' and quitada = '#39'S'#39') d on d.id=a.id'
      
        'left join (select '#39'1'#39' id ,sum(Valor) valor from tab_lancamento w' +
        'here tipo_lancamento = '#39'C'#39' and quitada = '#39'N'#39') e on e.id=a.id'
      
        'left join (select '#39'1'#39' id ,sum(valor) valor from tab_lancamento w' +
        'here tipo_lancamento = '#39'D'#39' and quitada = '#39'N'#39') f on f.id=a.id')
    Left = 536
    Top = 32
  end
  object FDQTotalLacamento: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select ifnull(sum(valor),0) valor'
      'from tab_lancamento '
      'where tipo_lancamento like :TIPO'
      'and quitada like :QUITADA'
      'and data between :DATA1 AND :DATA2'
      '')
    Left = 352
    Top = 168
    ParamData = <
      item
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        Name = 'QUITADA'
        ParamType = ptInput
      end
      item
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        Name = 'DATA2'
        ParamType = ptInput
      end>
  end
  object FDQSelectConsulta: TFDQuery
    Connection = FDConn
    Left = 504
    Top = 296
  end
  object FDQLancamento: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select id_lancamento,'
      '       valor,'
      '       data,'
      '       l.descricao,'
      '       l.id_categoria,'
      '       tipo_lancamento,'
      '       quitada,'
      '       case when tipo_lancamento = '#39'C'#39' then cast(0 as varchar)'
      '       else cast(1 as varchar) end icone,'
      '       c.descricao categoria'
      'from tab_lancamento l'
      'join tab_categoria c on (c.id_categoria = l.id_categoria)'
      'where strftime('#39'%m'#39', l.data) like :MES'
      'and strftime('#39'%Y'#39', l.data) like :ANO'
      ''
      ''
      '')
    Left = 376
    Top = 32
    ParamData = <
      item
        Name = 'MES'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ANO'
        ParamType = ptInput
      end>
    object FDQLancamentoID_LANCAMENTO: TIntegerField
      FieldName = 'ID_LANCAMENTO'
      Origin = 'ID_LANCAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
    object FDQLancamentoicone: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'icone'
      Origin = 'icone'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object FDQLancamentocategoria: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'categoria'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object FDQuery1: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select ifnull(a.valor,0) despesa,'
      '       ifnull(b.valor,0) receitas,'
      '       ifnull(c.valor,0) pago,'
      '       ifnull(d.valor,0) recebido,'
      '       ifnull(e.valor,0) apagar,'
      '       ifnull(f.valor,0) areceber '
      
        'from (select '#39'1'#39' id ,sum(valor) valor from tab_lancamento where ' +
        'tipo_lancamento = '#39'C'#39') a'
      
        'left join (select '#39'1'#39' id ,sum(valor) valor from tab_lancamento w' +
        'here tipo_lancamento = '#39'D'#39') b on b.id=a.id'
      
        'left join (select '#39'1'#39' id ,sum(valor) valor from tab_lancamento w' +
        'here tipo_lancamento = '#39'C'#39' and quitada = '#39'S'#39') c on c.id=a.id'
      
        'left join (select '#39'1'#39' id ,sum(valor) valor from tab_lancamento w' +
        'here tipo_lancamento = '#39'D'#39' and quitada = '#39'S'#39') d on d.id=a.id'
      
        'left join (select '#39'1'#39' id ,sum(Valor) valor from tab_lancamento w' +
        'here tipo_lancamento = '#39'C'#39' and quitada = '#39'N'#39') e on e.id=a.id'
      
        'left join (select '#39'1'#39' id ,sum(valor) valor from tab_lancamento w' +
        'here tipo_lancamento = '#39'D'#39' and quitada = '#39'N'#39') f on f.id=a.id')
    Left = 624
    Top = 32
  end
  object FDQUpdate: TFDQuery
    Connection = FDConn
    Left = 112
    Top = 408
  end
  object FDQuery2: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select login,'
      '       senha,'
      '       ifnull(ind_login,'#39'N'#39') ind_login'
      ' from tab_config')
    Left = 464
    Top = 40
    object StringField1: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Size = 100
    end
    object StringField2: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 50
    end
    object WideStringField1: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'ind_login'
      Origin = 'ind_login'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
  object FDQTotalApagaAreceber: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select ifnull(sum(valor),0) valor'
      'from tab_lancamento'
      'where quitada = '#39'N'#39
      ' and tipo_lancamento = :tipo')
    Left = 344
    Top = 296
    ParamData = <
      item
        Name = 'TIPO'
        ParamType = ptInput
      end>
    object FDQTotalApagaArecebervalor: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'valor'
      Origin = 'valor'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object FDQInsertCadLancamento: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select *'
      'from tab_lancamento ')
    Left = 168
    Top = 80
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
  object FDQSaldo: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select ifnull(SUM(VALOR),0) saldo '
      'from tab_lancamento'
      'where quitada = :quitada'
      'and tipo_lancamento = :tipo'
      '')
    Left = 56
    Top = 152
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
  object FDQListaApagarAreceber: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select id_lancamento id,'
      '       descricao,'
      '       valor,'
      '       data'
      'from tab_lancamento'
      'where quitada = '#39'N'#39
      ''
      ''
      '')
    Left = 56
    Top = 232
  end
  object FDQInsert: TFDQuery
    Connection = FDConn
    Left = 184
    Top = 408
  end
  object FDQtabLancamento: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from tab_lancamento')
    Left = 160
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
