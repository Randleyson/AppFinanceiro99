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
    LoginPrompt = False
    Left = 56
    Top = 16
  end
  object FDQcategoria_Categoria: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from tab_categoria')
    Left = 456
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
    Top = 368
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
  object FDQLancamento_Lanc: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select  id_lancamento,'
      '        valor,'
      '        data,'
      '        l.descricao,'
      '        case '
      
        '          when TIPO_LANCAMENTO = '#39'C'#39' and quitada = '#39'S'#39' then '#39'Rec' +
        'eita'#39
      
        '          when TIPO_LANCAMENTO = '#39'D'#39' and quitada = '#39'S'#39' then '#39'Des' +
        'pesa'#39
      
        '          when TIPO_LANCAMENTO = '#39'C'#39' and quitada = '#39'N'#39' then '#39'Nao' +
        ' Recebido'#39
      
        '          when TIPO_LANCAMENTO = '#39'D'#39' and quitada = '#39'N'#39' then '#39'N'#227'o' +
        ' Pago'#39' '
      '        end status,'
      '        c.descricao categoria,'
      '        case '
      
        '          when tipo_lancamento = '#39'D'#39' and quitada = '#39'S'#39' then '#39'PAG' +
        'O'#39' '
      
        '          when tipo_lancamento = '#39'D'#39' and quitada = '#39'N'#39' then '#39'NAO' +
        ' PAGO'#39'           '
      
        '          when tipo_lancamento = '#39'C'#39' and quitada = '#39'S'#39' then '#39'REC' +
        'EBIDO'#39' '
      
        '          when tipo_lancamento = '#39'C'#39' and quitada = '#39'N'#39' then '#39'NAO' +
        ' RECEBIDO'#39'   '
      '        end tipo'
      'from tab_Lancamento l'
      'left join tab_categoria c on c.id_categoria = l.id_categoria'
      'WHERE strftime('#39'%Y'#39', data) = :Ano '
      'AND  strftime('#39'%m'#39', data) = :Mes'
      'AND id_lancamento in (select id_lancamento from tab_lancamento'
      '                        where case '
      
        '                            when tipo_lancamento = '#39'D'#39' and quita' +
        'da = '#39'S'#39' then '#39'PAGO'#39' '
      
        '                            when tipo_lancamento = '#39'D'#39' and quita' +
        'da = '#39'N'#39' then '#39'NAOPAGO'#39'           '
      
        '                            when tipo_lancamento = '#39'C'#39' and quita' +
        'da = '#39'S'#39' then '#39'RECEBIDO'#39' '
      
        '                            when tipo_lancamento = '#39'C'#39' and quita' +
        'da = '#39'N'#39' then '#39'NAORECEBIDO'#39'   '
      '                            end = :PAGO OR case '
      
        '                            when tipo_lancamento = '#39'D'#39' and quita' +
        'da = '#39'S'#39' then '#39'PAGO'#39' '
      
        '                            when tipo_lancamento = '#39'D'#39' and quita' +
        'da = '#39'N'#39' then '#39'NAOPAGO'#39'           '
      
        '                            when tipo_lancamento = '#39'C'#39' and quita' +
        'da = '#39'S'#39' then '#39'RECEBIDO'#39' '
      
        '                            when tipo_lancamento = '#39'C'#39' and quita' +
        'da = '#39'N'#39' then '#39'NAORECEBIDO'#39'   '
      '                            end = :NAOPAGO OR case '
      
        '                            when tipo_lancamento = '#39'D'#39' and quita' +
        'da = '#39'S'#39' then '#39'PAGO'#39' '
      
        '                            when tipo_lancamento = '#39'D'#39' and quita' +
        'da = '#39'N'#39' then '#39'NAO PAGO'#39'           '
      
        '                            when tipo_lancamento = '#39'C'#39' and quita' +
        'da = '#39'S'#39' then '#39'RECEBIDO'#39' '
      
        '                            when tipo_lancamento = '#39'C'#39' and quita' +
        'da = '#39'N'#39' then '#39'NAORECEBIDO'#39'   '
      '                            end = :RECEBIDO OR case '
      
        '                            when tipo_lancamento = '#39'D'#39' and quita' +
        'da = '#39'S'#39' then '#39'PAGO'#39' '
      
        '                            when tipo_lancamento = '#39'D'#39' and quita' +
        'da = '#39'N'#39' then '#39'NAO PAGO'#39'           '
      
        '                            when tipo_lancamento = '#39'C'#39' and quita' +
        'da = '#39'S'#39' then '#39'RECEBIDO'#39' '
      
        '                            when tipo_lancamento = '#39'C'#39' and quita' +
        'da = '#39'N'#39' then '#39'NAORECEBIDO'#39'   '
      '                            end = :NAORECEBIDO) '
      ''
      'order by data')
    Left = 312
    Top = 160
    ParamData = <
      item
        Name = 'ANO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'MES'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PAGO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NAOPAGO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'RECEBIDO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NAORECEBIDO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object FDQLancamento_LancID_LANCAMENTO: TIntegerField
      FieldName = 'ID_LANCAMENTO'
      Origin = 'ID_LANCAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQLancamento_LancVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'VALOR'
    end
    object FDQLancamento_LancDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'DATA'
    end
    object FDQLancamento_LancDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object FDQLancamento_Lancstatus: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'status'
      Origin = 'status'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object FDQLancamento_Lanccategoria: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'categoria'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object FDQLancamento_Lanctipo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
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
    Left = 320
    Top = 80
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
  object FDQuery1: TFDQuery
    Connection = FDConn
    Left = 656
    Top = 416
  end
  object FDQTotalizadore_Lanc: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT  '
      '       IFNULL(SUM((SELECT SUM(VALOR) FROM TAB_LANCAMENTO A    '
      '            WHERE QUITADA = '#39'S'#39' '
      '            and tipo_lancamento = '#39'C'#39
      
        '            AND A.ID_LANCAMENTO = Z.ID_LANCAMENTO)),0.00) receit' +
        'a,'
      '            '
      '        IFNULL(SUM((SELECT sum(VALOR) FROM TAB_LANCAMENTO A    '
      '            WHERE QUITADA = '#39'S'#39' '
      '            and tipo_lancamento = '#39'D'#39
      
        '            AND A.ID_LANCAMENTO = Z.ID_LANCAMENTO)),0.00) despes' +
        'a,'
      ''
      
        '        IFNULL(SUM(IFNULL((SELECT SUM(VALOR) FROM TAB_LANCAMENTO' +
        ' A    '
      '            WHERE QUITADA = '#39'S'#39' '
      '            and tipo_lancamento = '#39'C'#39
      '            AND A.ID_LANCAMENTO = Z.ID_LANCAMENTO),0) -'
      '        IFNULL((SELECT sum(VALOR) FROM TAB_LANCAMENTO A    '
      '            WHERE QUITADA = '#39'S'#39' '
      '            and tipo_lancamento = '#39'D'#39
      
        '            AND A.ID_LANCAMENTO = Z.ID_LANCAMENTO),0)),0.00) SAL' +
        'DO,'
      '            '
      '       IFNULL(SUM((SELECT sum(VALOR) FROM TAB_LANCAMENTO A    '
      '            WHERE QUITADA = '#39'N'#39' '
      '            and tipo_lancamento = '#39'C'#39
      
        '            AND A.ID_LANCAMENTO = Z.ID_LANCAMENTO)),0.00) prevRe' +
        'ceita,'
      '            '
      '        IFNULL(SUM((SELECT sum(VALOR) FROM TAB_LANCAMENTO A    '
      '            WHERE QUITADA = '#39'N'#39' '
      '            and tipo_lancamento = '#39'D'#39
      
        '            AND A.ID_LANCAMENTO = Z.ID_LANCAMENTO)),0.00) prevDe' +
        'spesa,'
      '            '
      
        '       IFNULL(SUM(IFNULL((SELECT sum(VALOR) FROM TAB_LANCAMENTO ' +
        'A    '
      '                          WHERE QUITADA = '#39'N'#39' '
      '                          and tipo_lancamento = '#39'C'#39
      
        '                          AND A.ID_LANCAMENTO = Z.ID_LANCAMENTO)' +
        ',0.00) -'
      
        '                  IFNULL((SELECT sum(VALOR) FROM TAB_LANCAMENTO ' +
        'A    '
      '                          WHERE QUITADA = '#39'N'#39' '
      '                          and tipo_lancamento = '#39'D'#39
      
        '                          AND A.ID_LANCAMENTO = Z.ID_LANCAMENTO)' +
        ',0.00)),0.00) prevSaldo'
      'FROM TAB_LANCAMENTO Z'
      'WHERE strftime('#39'%Y'#39', data) = :Ano'
      'AND  strftime('#39'%m'#39', data) = :Mes'
      'AND id_lancamento in (select id_lancamento from tab_lancamento'
      '                        where case '
      
        '                            when tipo_lancamento = '#39'D'#39' and quita' +
        'da = '#39'S'#39' then '#39'PAGO'#39' '
      
        '                            when tipo_lancamento = '#39'D'#39' and quita' +
        'da = '#39'N'#39' then '#39'NAOPAGO'#39'           '
      
        '                            when tipo_lancamento = '#39'C'#39' and quita' +
        'da = '#39'S'#39' then '#39'RECEBIDO'#39' '
      
        '                            when tipo_lancamento = '#39'C'#39' and quita' +
        'da = '#39'N'#39' then '#39'NAORECEBIDO'#39'   '
      '                            end = :PAGO OR case '
      
        '                            when tipo_lancamento = '#39'D'#39' and quita' +
        'da = '#39'S'#39' then '#39'PAGO'#39' '
      
        '                            when tipo_lancamento = '#39'D'#39' and quita' +
        'da = '#39'N'#39' then '#39'NAOPAGO'#39'           '
      
        '                            when tipo_lancamento = '#39'C'#39' and quita' +
        'da = '#39'S'#39' then '#39'RECEBIDO'#39' '
      
        '                            when tipo_lancamento = '#39'C'#39' and quita' +
        'da = '#39'N'#39' then '#39'NAORECEBIDO'#39'   '
      '                            end = :NAOPAGO OR case '
      
        '                            when tipo_lancamento = '#39'D'#39' and quita' +
        'da = '#39'S'#39' then '#39'PAGO'#39' '
      
        '                            when tipo_lancamento = '#39'D'#39' and quita' +
        'da = '#39'N'#39' then '#39'NAOPAGO'#39'           '
      
        '                            when tipo_lancamento = '#39'C'#39' and quita' +
        'da = '#39'S'#39' then '#39'RECEBIDO'#39' '
      
        '                            when tipo_lancamento = '#39'C'#39' and quita' +
        'da = '#39'N'#39' then '#39'NAORECEBIDO'#39'   '
      '                            end = :RECEBIDO OR case '
      
        '                            when tipo_lancamento = '#39'D'#39' and quita' +
        'da = '#39'S'#39' then '#39'PAGO'#39' '
      
        '                            when tipo_lancamento = '#39'D'#39' and quita' +
        'da = '#39'N'#39' then '#39'NAOPAGO'#39'           '
      
        '                            when tipo_lancamento = '#39'C'#39' and quita' +
        'da = '#39'S'#39' then '#39'RECEBIDO'#39' '
      
        '                            when tipo_lancamento = '#39'C'#39' and quita' +
        'da = '#39'N'#39' then '#39'NAORECEBIDO'#39'   '
      '                            end = :NAORECEBIDO) '
      ''
      ''
      ''
      ''
      '')
    Left = 312
    Top = 232
    ParamData = <
      item
        Name = 'ANO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'MES'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PAGO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NAOPAGO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'RECEBIDO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NAORECEBIDO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object FDQTotalizadore_Lancreceita: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'receita'
      Origin = 'receita'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQTotalizadore_Lancdespesa: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'despesa'
      Origin = 'despesa'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQTotalizadore_LancSALDO: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'SALDO'
      Origin = 'SALDO'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQTotalizadore_LancprevReceita: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'prevReceita'
      Origin = 'prevReceita'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQTotalizadore_LancprevDespesa: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'prevDespesa'
      Origin = 'prevDespesa'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQTotalizadore_LancprevSaldo: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'prevSaldo'
      Origin = 'prevSaldo'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
