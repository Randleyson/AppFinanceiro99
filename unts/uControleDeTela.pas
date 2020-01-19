unit uControleDeTela;

interface
uses
  System.SysUtils,uDatamodule,FMX.TabControl;

  procedure RecebTabPrincipal(tabiItem: TTabItem);
  procedure VaiParaTela;
  procedure AvancaTela(tabiTela: TTabItem);
  procedure VoltaTela;

  var
  vTela : TTabItem;
  vTabPirncipal: TTabItem;
  vListDeTela : array[1..10] of TTabItem;

implementation
{ TControleDeTela }

uses
  uLogin, uHome, uFrmPrincipal;

procedure RecebTabPrincipal(tabiItem: TTabItem);
begin
  vTabPirncipal :=  tabiItem;
end;

procedure AvancaTela(tabiTela: TTabItem);
var
  i : integer;
  x: Integer;

  begin
  i := 1;

  vTela :=  tabiTela;


  while i <> 10 do
  begin
    if vListDeTela[i] = nil then
    begin
      if i = 1 then
        begin
          vListDeTela[i] := vTabPirncipal;
        end
      else
        begin
          vListDeTela[i] := tabiTela;
          VaiParaTela;
          exit
        end;
    end
    else
    i := i+1;
  end;


end;

procedure VaiParaTela;
begin
  case vTela.Index of
    0: //TAB LOGIN
    begin
      frmPrincipal.MultiView.Enabled := False;
      uLogin.UsuarioCadastro;
      frmPrincipal.actPrinc_Login.ExecuteTarget(nil);

    end;

    1: //TAB HOME
    begin
      frmPrincipal.MultiView.Enabled := True;
      uHome.InicializaTabHome;
      frmPrincipal.actPrinc_Home.ExecuteTarget(frmPrincipal);
    end;

    {2: //TAB LANCAMENTO
    begin
      vMes := MonthOf(now);
      vAno := YearOf(now);

      AtualLstLacanmentoTabiLancamento;

      actPrinc_Lancamento.ExecuteTarget(self);
    end;

    3: //Categorias
    begin
      AtualLstCategoriaTabiCategoria;
      actPrinc_Categoria.ExecuteTarget(self);

    end;

    4: //Cadastro de categoria
    begin

      if EdtCadCategoriaDesc.Text = '' then
        BtnCadCategoriaExclui.Visible := false
      else
        BtnCadCategoriaExclui.Visible := true;

      if vModuloCadCategoria = dsInsert then
      EdtCadCategoriaDesc.Text := '';

      EdtCadCategoriaDesc.SetFocus;
      actPrinc_CadCategoria.ExecuteTarget(self);
    end;

    5: //Perfil
    begin
      actPrinc_Perfil.ExecuteTarget(self);
    end;

    7: //Cadastro de Lancamento
    begin
      tabcCadLanc.ActiveTab    := tabCadLanc_Hone;

      AtualLstCadLancamento;
      AtualCboxCategoriaCadLancamento;
      AtualCboxQuitadoCadLancamento;

      actPrinc_CadLancamento.ExecuteTarget(self);
    end;}
  end;
end;
procedure VoltaTela;
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
      if i = 0 then
        vTela := vListDeTela[1]
      else
      begin
        vTela := vListDeTela[i];
      end;
    end
    else
      i:= i+ 1;
  end;

  VaiParaTela;
end;


end.
