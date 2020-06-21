object DmConexao: TDmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 294
  Width = 339
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 152
    Top = 112
  end
  object FDC_database: TFDConnection
    Params.Strings = (
      'Database=D:\AppFinanceiro99\trunk\Mobile\DataBase\db.db'
      'OpenMode=ReadWrite'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 144
    Top = 32
  end
end
