unit uLancamentos;

interface
  uses
  System.SysUtils,system.Types, system.UITypes, system.classes,
  system.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics,
  FMX.Dialogs, FMX.TabControl, FMX.Objects, FMX.layouts, System.Actions,
  FMX.ActnList, FMX.Gestures, FMX.COntrols.Presentation, FMX.StdCtrls,
  FMX.ListView.Types,FMX.ListView.Adapters.Base, System.UIConsts,System.DateUtils,
  FireDAC.Comp.DataSet, MultiDetailAppearanceU, FMX.Styles.Objects,
  FMX.ListView.Appearances,uDatamodule;

  var
  lreceita: Double;
  ldespesa: Double;
  lsaldo:   Double;
  lPrevReceita: Double;
  lPrevDespesa: Double;
  lPrevSaldo:   Double;

  lpago,lnaopago,lrecebido,lnaorecebido : string;
  lMes : integer;
  lAno : integer;

  procedure IniciaTabLancamento;
  procedure InicaMultiViewLancFltroData;
  procedure AddItemLstLancamento(lIdLanc,lDescricao,lCategoria,ldata,lvalor,lstatus: string);
  procedure RefresherLstLancamento_Lanc;
  procedure RefresherTotalizadores_Lanc;
  procedure DadosTotalizadores_Lanc(pReceita,pDespesa,pSaldo,pPrevReceita,
                                    pPrevDespesa,pPrevSaldo: Double);

  //procedure AvancaMes_Lanc;
  procedure RecuaFiltroMes_Lanc;
  procedure AvancarFiltroMes_Lanc;
  procedure HabilitarFiltro_Lanc;


implementation
uses
  uFrmPrincipal;

procedure HabilitarFiltro_Lanc;
begin
  with frmPrincipal do
  begin
    if chbLanc_apagar.IsChecked = True then
      lnaopago := 'NAOPAGO'
    else
      lnaopago := '';

    if chbLanc_pago.IsChecked = True then
      lpago := 'PAGO'
    else
      lpago := '';

    if chbLanc_Areceber.IsChecked = True then
      lnaorecebido := 'NAORECEBIDO'
    else
      lnaorecebido := '';

    if chbLanc_Recebido.IsChecked = True then
      lrecebido := 'RECEBIDO'
    else
      lrecebido := '';
  end;

  RefresherLstLancamento_Lanc;
  RefresherTotalizadores_Lanc;
end;

procedure AvancarFiltroMes_Lanc;
begin
  if lMes = 12 then
  begin
    lMes := 1;
    lAno := lAno+1;
  end
  else
    lMes := lMes+1;

  frmPrincipal.lblMesAno_Lanc.Text := frmPrincipal.NomeMes(lMes) + '/' + IntToStr(lAno);
  RefresherLstLancamento_Lanc;
  RefresherTotalizadores_Lanc;
end;


procedure RecuaFiltroMes_Lanc;
begin
  if lMes = 1 then
    begin
      lMes := 12;
      lAno := lAno-1;
    end
  else
    lMes := lMes-1;

 frmPrincipal.lblMesAno_Lanc.Text := frmPrincipal.NomeMes(lMes) + '/' + IntToStr(lAno);
 RefresherLstLancamento_Lanc;
 RefresherTotalizadores_Lanc;
end;

procedure DadosTotalizadores_Lanc(pReceita,pDespesa,pSaldo,pPrevReceita,
                                  pPrevDespesa,pPrevSaldo: Double);
begin
  lReceita      := pReceita;
  lDespesa      := pDespesa;
  lSaldo        := pSaldo;
  lPrevReceita  := pPrevReceita;
  lPrevDespesa  := pPrevDespesa;
  lPrevSaldo    := pPrevSaldo;
end;


procedure RefresherTotalizadores_Lanc;
begin
   dm.DadoTotalizadorLancDB(lMes,lAno,lpago,lnaopago,lrecebido,lnaorecebido);
   with frmPrincipal do
   begin
      lblLanc_TotalizadorReceita.Text :=  FloatToStr(lReceita);
      lblLanc_TotalizadorDespesa.Text := FloatToStr(ldespesa);
      lblLanc_TotalizadorSaldo.Text   := FloatToStr(lsaldo);
      lblLanc_TotalizadorPrevReceita.Text := FloatToStr(lPrevReceita);
      lblLanc_TotalizadorPrevDespesa.Text := FloatToStr(lPrevDespesa);
      lblLanc_TotalizadorPrevSaldo.Text   := FloatToStr(lPrevSaldo);
   end;
end;

procedure RefresherLstLancamento_Lanc;
begin

  frmPrincipal.lstLancamento_Lanc.Items.Clear;
  dm.DadosLstLancamento(lMes,lAno,lpago,lnaopago,lrecebido,lnaorecebido);

end;
procedure AddItemLstLancamento(lIdLanc,lDescricao,lCategoria,ldata,lvalor,lstatus: string);
var
    AddList:  TListViewItem;
    ItemText: TListItemText;
begin

  with frmPrincipal do
  begin
    AddList := lstLancamento_Lanc.Items.Add;
    with AddList do
    begin
      AddList.Detail := lIdLanc;

      ItemText          := TListItemText(Objects.FindDrawable('Text1'));
      ItemText.Text     := lDescricao;

      ItemText          := TListItemText(Objects.FindDrawable('Text2'));
      ItemText.Text     := lCategoria;

      ItemText          := TListItemText(Objects.FindDrawable('Text3'));
      ItemText.Text     := ldata;

      ItemText          := TListItemText(Objects.FindDrawable('Text4'));
      ItemText.Text     := lvalor;

      ItemText          := TListItemText(Objects.FindDrawable('Text5'));
      ItemText.Text     := lstatus;
    end;
  end;
end;

procedure IniciaTabLancamento;
begin

  lMes := monthOf(date);
  lAno := YearOf(Date);

  with  frmPrincipal do
  begin
    TabC_Lancamento.TabPosition       := TTabPosition.None;
    MultiViewLanc_FiltroData.Visible  := False;
    TabC_Lancamento.ActiveTab         := tabLanc_Lancamento;

    frmPrincipal.lblMesAno_Lanc.Text := NomeMes(lMes) + '/' + IntToStr(lAno);

    chbLanc_apagar.IsChecked := True;
    chbLanc_pago.IsChecked := True;
    chbLanc_Areceber.IsChecked := True;
    chbLanc_Recebido.IsChecked := True;

    HabilitarFiltro_Lanc;
    RefresherLstLancamento_Lanc;
    RefresherTotalizadores_Lanc;
  end;
end;

procedure InicaMultiViewLancFltroData;
begin




end;

end.
