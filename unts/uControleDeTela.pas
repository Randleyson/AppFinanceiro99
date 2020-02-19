unit uControleDeTela;

interface
uses
  System.SysUtils,uDatamodule,FMX.TabControl,db;

  procedure ControlTelaAvanca(tabiTela: TTabItem);
  procedure AvancaTela(tabiTela: TTabItem);
  procedure ProcessaTela(tabiTela: TTabItem);
  procedure ControlTelaVoltaTela;

  var
  vTela : TTabItem;
  vTabPirncipal: TTabItem;
  vListDeTela : array[1..10] of TTabItem;

implementation
{ TControleDeTela }

uses
  uLogin,uHome,uFrmPrincipal,uCadLancamento,uLancamentos,uCategoria,uPerfil;

procedure ControlTelaAvanca(tabiTela: TTabItem);
var
  i : integer;

begin
    i := 1;
    while i <> 10 do
    begin
      if vListDeTela[i] = nil then
      begin
        if i = 1 then
          begin
            vListDeTela[i] := tabiTela;
            exit
          end
        else
          begin
            vListDeTela[i] := tabiTela;
            exit
          end;
      i := i+1;
      end
      else
        i := i+1;
    end;
end;


procedure  AvancaTela(tabiTela: TTabItem);
begin
  ControlTelaAvanca(tabiTela);
  ProcessaTela(tabiTela);
end;

procedure ProcessaTela(tabiTela: TTabItem);
begin
  case tabiTela.Index of
    0: //LOGIN
    begin
      uLogin.InicilizaLogin;
      frmPrincipal.actPrinc_Login.ExecuteTarget(nil);
    end;
    1: //HOME
    begin
      uHome.InicializaTabHome;
      frmPrincipal.actPrinc_Home.ExecuteTarget(nil);
    end;
    2:  //LANCAMENTOS
    begin
      uLancamentos.IniciaTabLancamento;
      frmPrincipal.actPrinc_Lancamento.ExecuteTarget(nil);
    end;
    3: // CATEGORIAS
    begin
      RefreshLstCategoria;
      frmPrincipal.actPrinc_Categoria.ExecuteTarget(nil);
    end;
    4: // CAD_CATEGORIA
    begin
      if vCadCategriaInsertUpdate = dsInsert then
        frmPrincipal.BtnCadCategoriaExclui.Visible := False
      else
        frmPrincipal.BtnCadCategoriaExclui.Visible := True;

      frmPrincipal.EdtCadCategoriaDesc.Text := vCadCategriaDesc;
      frmPrincipal.actPrinc_CadCategoria.ExecuteTarget(nil);
    end;
    5: //PERFIL
    begin
      IniciaConfiguracaoPerfil;
      frmPrincipal.actPrinc_Perfil.ExecuteTarget(nil);
    end;

    7: //CAD_LANCAMENTO
    begin
      if frmPrincipal.tabcCadLanc.ActiveTab = frmPrincipal.tabCadLanc_categoria then
        RefresherLstCategoriaCadLanc;

      frmPrincipal.actPrinc_CadLancamento.ExecuteTarget(nil);
    end;
  end;
end;


procedure ControlTelaVoltaTela;
var
  i : integer;
begin
  i := 1;
  while i <> 10 do
  begin
    if vListDeTela[i] = nil then
    begin
      i := i -1;
      vListDeTela[i] := nil;
      i := i -1;
      ProcessaTela(vListDeTela[i]);
      exit
    end;
  i:= i+ 1;
  end
end;


end.
