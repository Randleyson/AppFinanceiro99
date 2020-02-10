{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN NON_PORTABLE_TYPECAST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
{$WARN IMMUTABLE_STRINGS OFF}
unit uDatamodule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,System.IOUtils,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView
  {$IFDEF MSWINDOWS}
  ,FireDAC.VCLUI.Wait
  {$ENDIF}
  ;

type
  TDm = class(TDataModule)
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDConn: TFDConnection;
    FDQcategoria_Categoria: TFDQuery;
    FDQcategoria_CategoriaID_CATEGORIA: TIntegerField;
    FDQcategoria_CategoriaDESCRICAO: TStringField;
    FDQUsuario: TFDQuery;
    FDQUpdate: TFDQuery;
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
    FDQSaldoDeLancamento: TFDQuery;
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
    FDQUltimosLanc: TFDQuery;
    FDQUltimosLancID_LANCAMENTO: TFDAutoIncField;
    FDQUltimosLancVALOR: TFloatField;
    FDQUltimosLancDATA: TDateTimeField;
    FDQUltimosLancDESCRICAO: TStringField;
    FDQUltimosLanctipoLancamento: TStringField;
    FDQUltimosLanccategoria: TStringField;
    FDQLancamento: TFDQuery;
    FDQLancamentoID_LANCAMENTO: TFDAutoIncField;
    FDQLancamentoVALOR: TFloatField;
    FDQLancamentoDATA: TDateTimeField;
    FDQLancamentoDESCRICAO: TStringField;
    FDQLancamentoID_CATEGORIA: TIntegerField;
    FDQLancamentoTIPO_LANCAMENTO: TStringField;
    FDQLancamentoQUITADA: TStringField;
    FDQLancamentoNROPARCELA: TIntegerField;
    FDQGeral: TFDQuery;
    FDQCategoria_CadLanc: TFDQuery;
    FDQLancamento_CadLanc: TFDQuery;
    FDQLancamento_CadLancID_LANCAMENTO: TIntegerField;
    FDQLancamento_CadLancVALOR: TFloatField;
    FDQLancamento_CadLancDATA: TDateTimeField;
    FDQLancamento_CadLancDESCRICAO: TStringField;
    FDQLancamento_CadLancID_CATEGORIA: TIntegerField;
    FDQLancamento_CadLancTIPO_LANCAMENTO: TStringField;
    FDQLancamento_CadLancQUITADA: TStringField;
    FDQLancamento_CadLancNROPARCELA: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  function NovoIdTabela(Tabela, CampoChave: string): integer;

  public
    { Public declarations }

  procedure ListarDadosCategoriaCadLanc;
  procedure GravarLancamentoDBCadLanc;
  procedure ListarDadosCategoria;
  procedure GravarCategoriaDBCadCategoria;
  procedure DeleterCategoriaDB;


  var

end;
implementation


{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}
uses
  uFrmPrincipal,uCadLancamento,uCategoria;

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
      raise Exception.Create('Erro de conex�o com o banco de dados: ' + E.Message);
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
      Params.Values['Database'] := 'D:\Programac�o\Delphi\android\AppFinanceiro99\db\database.db';
      Connected := true;


    except on E:Exception do
      raise Exception.Create('Erro de conex�o com o banco de dados: ' + E.Message);
    end;
   {$ENDIF}
    end;
end;

procedure TDm.ListarDadosCategoria;
var
  Tid,Tdescricao: string;
  AddList :  TListViewItem;
begin


  with FDQcategoria_Categoria do
  begin
    Close;
    Open();

    First;
    while not EOF do
    begin
      Tid         := FieldByName('id_categoria').AsString;
      Tdescricao  := FieldByName('descricao').AsString;
      AddList := frmPrincipal.lstCategoria.Items.Add;
      AddList.Detail := Tid;
      AddList.Text := Tdescricao;
      Next;
    end;

    Close;
  end;
end;

procedure TDm.ListarDadosCategoriaCadLanc;
var
  Tid: integer;
  Tdescricao : string;
begin
  with FDQCategoria_CadLanc do
  begin
    Close;
    Open();

    First;
    while not EOF do
    begin
      Tid         := FieldByName('id_categoria').AsInteger;
      Tdescricao  := FieldByName('descricao').AsString;
      frmPrincipal.lstCategoriaCadLanc.Items.AddObject(Tdescricao,TObjectField(Tid));
      Next;
    end;

    Close;
  end;
end;


function TDm.NovoIdTabela(Tabela, CampoChave: string): integer;
begin
  with dm.FDQGeral do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select ifnull(max('+CampoChave+'),1) ID from '+ Tabela);
    Open();
    result := FieldByName('id').AsInteger+ 1;
    Close;
  end;
end;

procedure TDm.DeleterCategoriaDB;
begin
  with FDQcategoria_Categoria do
  begin
    Close;
    Open();
    Locate('id_categoria',vCadCategriaId);
    Delete;
    close;
  end;
end;

procedure TDm.GravarCategoriaDBCadCategoria;
begin

with FDQcategoria_Categoria do
  begin
    Close;
    Open();
    if vCadCategriaInsertUpdate = dsInsert then
    begin
      Insert;
      FieldByName('ID_CATEGORIA').Value    := NovoIdTabela('tab_categoria','id_categoria');
    end
    else
    begin
      Locate('ID_CATEGORIA',vCadCategriaId);
      Edit;
      FieldByName('ID_CATEGORIA').Value := vCadCategriaId;
    end;

    FieldByName('DESCRICAO').Value      := vCadCategriaDesc;
    Post;
    Close
  end;
end;


procedure TDm.GravarLancamentoDBCadLanc;
begin
with FDQLancamento_CadLanc do
  begin
    Close;
    Open();
    if vCadLancInsertUpdate = dsInsert then
    begin
      Insert;
      FieldByName('ID_LANCAMENTO').Value    := NovoIdTabela('tab_lancamento','id_lancamento');
    end;
    FieldByName('DESCRICAO').Value        := vCadLancDescricao;
    FieldByName('VALOR').Value            := vCadLancValor;
    FieldByName('DATA').Value             := vCadLancData;
    FieldByName('ID_CATEGORIA').Value     := vCadLancIdCategoria;
    FieldByName('TIPO_LANCAMENTO').Value  := vCadLancTipoCreDeb;
    FieldByName('QUITADA').Value          := vCadLancQuitado;
    FieldByName('NROPARCELA').Value       := vCadLancNroParcela;
    Post;
    Close
  end;
end;
end.
