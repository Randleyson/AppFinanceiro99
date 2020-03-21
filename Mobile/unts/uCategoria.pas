unit uCategoria;

interface
  uses
    db,uDatamodule;

  var
  vCadCategriaInsertUpdate : TDataSetState;
  vCadCategriaDesc : string;
  vCadCategriaId   : string;

  procedure NovaCategoria;
  procedure SalvaCategoria;
  procedure RefreshLstCategoria;

implementation
uses
  uFrmPrincipal,uControleDeTela,uCadLancamento;

procedure RefreshLstCategoria;
begin
  with frmPrincipal do
  begin
    lstCategoria.Items.Clear;
    dm.ListarDadosCategoria;
  end;
end;


procedure NovaCategoria;
begin
  vCadCategriaInsertUpdate := dsInsert;
  vCadCategriaDesc         := '';
  frmPrincipal.EdtCadCategoriaDesc.SetFocus;
  AvancaTela(frmPrincipal.tabPrinc_CadCategoria);
end;

procedure SalvaCategoria;
begin
  dm.GravarCategoriaDBCadCategoria;
end;
end.
