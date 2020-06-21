unit uDmConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite,System.IOUtils;

type
  TDmConexao = class(TDataModule)
    FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
    FDC_database: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmConexao: TDmConexao;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses uFrmPrincipal;

{$R *.dfm}

procedure TDmConexao.DataModuleCreate(Sender: TObject);
begin
  with FDC_database do
    begin
      try
        Connected                     := False;
        LoginPrompt                   := False;
        Params.Clear;
        Params.Values['DriverID']     := 'SQLite';
        Params.Values['OpenMode']     := 'ReadWrite';
        params.Values['LockingMode']  := 'Normal';

        {$IFDEF MSWINDOWS}
        Params.Values['Database']     := 'D:\AppFinanceiro99\trunk\Mobile\DataBase\db.db';
        {$ENDIF}
        {$IFDEF ANDROID}
        Params.Values['Database']     := TPath.Combine(TPath.GetDocumentsPath, 'db.db');
        {$ENDIF}

        Connected := true;
      except on E:Exception do
      begin
        Connected := False;
        frmPrincipal.fMenssagemDoErro := 'Sem conexão com o banco de dados :'+ E.Message;
      end;
    end;
  end;
end;
end.
