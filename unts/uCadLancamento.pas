unit uCadLancamento;

interface
uses
  System.SysUtils,system.Types, system.UITypes, system.classes,
  system.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics,
  FMX.Dialogs, FMX.TabControl, FMX.Objects, FMX.layouts, System.Actions,
  FMX.ActnList, FMX.Gestures, FMX.COntrols.Presentation, FMX.StdCtrls,
  FMX.ListView.Types,FMX.ListView.Adapters.Base, System.UIConsts,System.DateUtils,
  FireDAC.Comp.DataSet, MultiDetailAppearanceU, FMX.Styles.Objects, FMX.ListView.Appearances,
  db;

  procedure IniciaCadLancamento;
  procedure NovoLancamento;
  procedure ControleBotaoTabDataCadLanc(pData: string);
  procedure AvancarTabsCadLancamento(Tabi: TTabItem);
  procedure RefreshLstCategoriaCadLanc;
  procedure SalvarLancamento;

var
  vCadLancInsertUpdate: TDataSetState;
  vCadLancTipoCreDeb:          string;

  vCadLancDescricao:      string;
  vCadLancValor:          string;
  vCadLancData:           string;
  vCadLancDescCategoria:  string;
  vCadLancIdCategoria:    string;
  vCadLancQuitado:        string;
  vCadLancRepete:         string;
  vCadLancNroParcela:     string;

implementation
uses
  uFrmPrincipal,_uDmProcedures,uControleDeTela,uDatamodule;



procedure SalvarLancamento;
begin
  with frmPrincipal do
  begin
   vCadLancQuitado    := Convert(BoolToStr(swiCadLancPago.IsChecked),'-1','S','N');
   vCadLancRepete     := Convert(BoolToStr(SwiCadLancRepeti.IsChecked),'-1','S','N');
   vCadLancNroParcela := edtCadLancNroParcela.Text;
  end;


  dm.GravarLancamentoDBCadLanc;
end;


procedure NovoLancamento;
begin
    vCadLancDescricao     := '';
    vCadLancValor         := '';
    vCadLancData          := DateToStr(now());
    vCadLancDescCategoria := '';
    vCadLancIdCategoria   := '';
    vCadLancQuitado       := 'S';
    vCadLancRepete        := 'N';
    vCadLancNroParcela    := '1';
end;

procedure IniciaCadLancamento;
begin
  if vCadLancInsertUpdate = dsInsert then
  begin
    frmPrincipal.rectCabecalho.Visible := False;
    NovoLancamento;
    frmPrincipal.tabcCadLanc.ActiveTab := frmPrincipal.tabCadLanc_Novo;
  end;
end;

procedure ControleBotaoTabDataCadLanc(pData: string);
begin
  with frmPrincipal do
  begin
    if pData =  DateToStr(now()- 1) then
    begin
      rectCadLanc_Ontem.Fill.Color  := $FFD9D9D9;
      rectCadLanc_Hoje.Fill.Color   := $C8F3F3F3;
      rectCadLanc_Amanha.Fill.Color := $C8F3F3F3;
      rectCadLanc_person.Fill.Color := $C8F3F3F3;
    end;
    if pData = DateToStr(now()) then
    begin
      rectCadLanc_Ontem.Fill.Color  := $C8F3F3F3;
      rectCadLanc_Hoje.Fill.Color   := $FFD9D9D9;
      rectCadLanc_Amanha.Fill.Color := $C8F3F3F3;
      rectCadLanc_person.Fill.Color := $C8F3F3F3;

    end;
    if pData = DateToStr(now()+ 1) then
    begin
      rectCadLanc_Ontem.Fill.Color  := $C8F3F3F3;
      rectCadLanc_Hoje.Fill.Color   := $C8F3F3F3;
      rectCadLanc_Amanha.Fill.Color := $FFD9D9D9;
      rectCadLanc_person.Fill.Color := $C8F3F3F3;
    end;
    if  (pData <> DateToStr(now()- 1)) and
        (pData <> DateToStr(now()+ 1)) and
        (pData <> DateToStr(now()))    then
    begin
      rectCadLanc_Ontem.Fill.Color  := $C8F3F3F3;
      rectCadLanc_Hoje.Fill.Color   := $C8F3F3F3;
      rectCadLanc_Amanha.Fill.Color := $C8F3F3F3;
      rectCadLanc_person.Fill.Color := $FFD9D9D9;
    end;

  end;
end;

procedure RefreshLstCategoriaCadLanc;
begin
  with frmPrincipal do
  begin
    lstCategoriaCadLanc.Items.Clear;
    dm.ListarDadosCategoriaCadLanc;
  end;
end;

procedure AvancarTabsCadLancamento(Tabi: TTabItem);
begin
  case Tabi.Index of
    0:
    begin
      frmPrincipal.rectCabecalho.Visible := False;

      frmPrincipal.btnToolBarNovoCategoria.Visible := False;
      frmPrincipal.actCadLanc_Novo.ExecuteTarget(nil);
    end;

    1: //Prinaria
    begin

      if  vCadLancTipoCreDeb = 'C' then
        begin
          frmPrincipal.lblCabecalhoCadLanc.Text := 'RECEITA';
        end
      else
        begin
          frmPrincipal.lblCabecalhoCadLanc.Text := 'DESPESA';
        end;

      frmPrincipal.rectCabecalho.Visible := True;

      frmPrincipal.edtCadLancDescricao.Text := vCadLancDescricao;
      frmPrincipal.edtCadLancValor.Text     := vCadLancValor;
      frmPrincipal.edtCadLancData.Text      := vCadLancData;
      frmPrincipal.edtCadLancCategoria.Text := vCadLancDescCategoria;

      frmPrincipal.btnToolBarNovoCategoria.Visible := False;
      frmPrincipal.actCadLanc_Primaria.ExecuteTarget(nil);
    end;

    2:  //Secundaria
    begin
    //PAGO
      if vCadLancQuitado = 'S' then
        frmPrincipal.swiCadLancPago.IsChecked := True
      else
        frmPrincipal.swiCadLancPago.IsChecked := False;

    //REPEDIR
      if vCadLancRepete = 'S' then
        frmPrincipal.SwiCadLancRepeti.IsChecked := True
      else
        frmPrincipal.SwiCadLancRepeti.IsChecked := False;

    //NROPARCELA
      frmPrincipal.edtCadLancNroParcela.Text := vCadLancNroParcela;

      frmPrincipal.btnToolBarNovoCategoria.Visible := False;
      frmPrincipal.actCadLanc_Secundaria.ExecuteTarget(nil);
    end;
    3:  //Categoria
    begin
      frmPrincipal.btnToolBarNovoCategoria.Visible := True;

      RefreshLstCategoriaCadLanc;
      frmPrincipal.actCadLanc_Categoria.ExecuteTarget(nil);
    end;
  end;
end;

end.
