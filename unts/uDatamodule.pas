unit uDatamodule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,System.IOUtils;

type
  TDm = class(TDataModule)
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDConn: TFDConnection;
    FDQcategoria: TFDQuery;
    FDQTab_Lancamento: TFDQuery;
    FDQcategoriaID_CATEGORIA: TIntegerField;
    FDQcategoriaDESCRICAO: TStringField;
    FDQNovoID: TFDQuery;
    FDQgeral: TFDQuery;
    FDQUsuario: TFDQuery;
    FDQHome: TFDQuery;
    FDQTotalLacamento: TFDQuery;
    FDQSelectConsulta: TFDQuery;
    FDQLancamento: TFDQuery;
    FDQLancamentoID_LANCAMENTO: TIntegerField;
    FDQLancamentoVALOR: TFloatField;
    FDQLancamentoDATA: TDateTimeField;
    FDQLancamentoDESCRICAO: TStringField;
    FDQLancamentoID_CATEGORIA: TIntegerField;
    FDQLancamentoTIPO_LANCAMENTO: TStringField;
    FDQLancamentoQUITADA: TStringField;
    FDQLancamentoicone: TWideStringField;
    FDQLancamentocategoria: TStringField;
    FDQTab_LancamentoID_LANCAMENTO: TIntegerField;
    FDQTab_LancamentoVALOR: TFloatField;
    FDQTab_LancamentoDATA: TDateTimeField;
    FDQTab_LancamentoDESCRICAO: TStringField;
    FDQTab_LancamentoID_CATEGORIA: TIntegerField;
    FDQTab_LancamentoTIPO_LANCAMENTO: TStringField;
    FDQTab_LancamentoQUITADA: TStringField;
    FDQuery1: TFDQuery;
    FDQUpdate: TFDQuery;
    FDQuery2: TFDQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    WideStringField1: TWideStringField;
    FDQTotalApagaAreceber: TFDQuery;
    FDQInsertCadLancamento: TFDQuery;
    FDQInsertCadLancamentoID_LANCAMENTO: TIntegerField;
    FDQInsertCadLancamentoVALOR: TFloatField;
    FDQInsertCadLancamentoDESCRICAO: TStringField;
    FDQInsertCadLancamentoID_CATEGORIA: TIntegerField;
    FDQInsertCadLancamentoTIPO_LANCAMENTO: TStringField;
    FDQInsertCadLancamentoQUITADA: TStringField;
    FDQUsuarioLOGIN: TStringField;
    FDQUsuarioSENHA: TStringField;
    FDQUsuarioNOME: TStringField;
    FDQUsuarioIDIONA: TStringField;
    FDQUsuarioMOEDA: TStringField;
    FDQDelete: TFDQuery;
    FDQUsuarioIND_LOGIN: TStringField;
    FDQSaldo: TFDQuery;
    FDQListaApagarAreceber: TFDQuery;
    FDQTotalApagaArecebervalor: TFloatField;
    FDQInsert: TFDQuery;
    FDQInsertCadLancamentoNROPARCELA: TIntegerField;
    FDQInsertCadLancamentoDATA: TDateTimeField;
    FDQtabLancamento: TFDQuery;
    FDQtabLancamentoID_LANCAMENTO: TIntegerField;
    FDQtabLancamentoVALOR: TFloatField;
    FDQtabLancamentoDATA: TDateTimeField;
    FDQtabLancamentoDESCRICAO: TStringField;
    FDQtabLancamentoID_CATEGORIA: TIntegerField;
    FDQtabLancamentoTIPO_LANCAMENTO: TStringField;
    FDQtabLancamentoQUITADA: TStringField;
    FDQtabLancamentoNROPARCELA: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm: TDm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TDm.DataModuleCreate(Sender: TObject);
begin
  with FDConn do
  begin
    {$IFDEF IOS}
    Params.Values['DriverID'] := 'SQLite';
    try
      Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'database.db');
      Connected := true;
    except on E:Exception do
      raise Exception.Create('Erro de conexão com o banco de dados: ' + E.Message);
    end;
    {$ENDIF}

    {$IFDEF ANDROID}
    Connected := false;
    Params.Clear;
    Params.Values['DriverID']     := 'SQLite';
    Params.Values['Database']     :=  TPath.Combine(TPath.GetDocumentsPath, 'database.db');
    Params.Values['OpenMode']     :=  'ReadWrite';
    params.Values['LockingMode']  :=  'Normal';
    Connected := true;
    {$ENDIF}

    {$IFDEF MSWINDOWS}
    try
      Params.Values['Database'] := 'D:\Programacão\Delphi\android\AppFinanceiro99\db\database.db';
      Connected := true;
    except on E:Exception do
      raise Exception.Create('Erro de conexão com o banco de dados: ' + E.Message);
    end;
   {$ENDIF}
    end;
end;

end.
