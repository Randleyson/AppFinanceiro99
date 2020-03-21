unit uHome;

interface
uses
  System.SysUtils,system.Types, system.UITypes, system.classes,
  system.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics,
  FMX.Dialogs, FMX.TabControl, FMX.Objects, FMX.layouts, System.Actions,
   FMX.ActnList, FMX.Gestures, FMX.COntrols.Presentation, FMX.StdCtrls,
  FMX.ListView.Types,FMX.ListView.Adapters.Base, System.UIConsts,System.DateUtils,
  FireDAC.Comp.DataSet, MultiDetailAppearanceU, FMX.Styles.Objects, FMX.ListView.Appearances;


  procedure RefreshLblMeuSaldo;
  procedure RefreshValorLinhaDoTempo;
  procedure RefreshUltimosLancmento;
  procedure InicializaTabHome;
  procedure AddItemLstUltimoLanc(vDescricao, vCategoria, vValor, vTipo, vData: string);

implementation

{ THome }
uses
  uFrmPrincipal,uDatamodule,_uDmProcedures;

procedure RefreshUltimosLancmento;
begin
  frmPrincipal.lstUltimoLanc.Items.Clear;
  _uDmProcedures.DadoUltimoLancamento;
end;


procedure AddItemLstUltimoLanc(vDescricao, vCategoria, vValor, vTipo, vData: string);
var
  AddList:  TListViewItem;
  ItemText: TListItemText;
  ItemImg:  TListItemImage;
begin

  with frmPrincipal do
  begin
    AddList := lstUltimoLanc.Items.Add;
    with AddList do
    begin
      ItemText          := TListItemText(Objects.FindDrawable('Text1'));
      ItemText.Text     := vDescricao;

      ItemText          := TListItemText(Objects.FindDrawable('Text2'));
      ItemText.Text     := vData + ' - ' + vCategoria;

      ItemText          := TListItemText(Objects.FindDrawable('Text3'));
      if vTipo = 'D' then
        ItemText.TextColor  := $25500255
      else
        ItemText.TextColor  := $FF30FF20;
      ItemText.Text         := 'R$ ' + frmPrincipal.FormateReal(vValor);

      ItemImg           := TListItemImage(Objects.FindDrawable('Image4'));
      if vTipo = 'D' then
        ItemImg.Bitmap  := frmPrincipal.imgUltimoLancDespesa.Bitmap
      else
        ItemImg.Bitmap  := frmPrincipal.imgUltimoLancReceita.Bitmap;
    end;

  end;
end;

procedure InicializaTabHome;
begin
  frmPrincipal.MultiView.Enabled         := True;
  frmPrincipal.lblHomeNomeUsuario.Text   := dm.UsuarioCadastrado;
  frmPrincipal.lblDataAtualtabiHome.Text := frmPrincipal.NomeMes(MonthOf(now))+'/'+
                                             IntToStr(YearOf(now));
  RefreshLblMeuSaldo;
  RefreshValorLinhaDoTempo;
  RefreshUltimosLancmento;
end;

procedure RefreshLblMeuSaldo;
 var
    Saldo: Double;
begin
    Saldo := _uDmProcedures.SaldoDeLancamento('S','C')- _uDmProcedures.SaldoDeLancamento('S','D');

    frmPrincipal.lblSaldoAtual.Text := frmPrincipal.FormateReal( FloatToStr((Saldo)));

    if Saldo < 0 then
      frmPrincipal.lblSaldoAtual.FontColor := claRed
    else
      frmPrincipal.lblSaldoAtual.FontColor := claBlack;
  end;


procedure RefreshValorLinhaDoTempo;
var
    SaldoInicial,ContasAreceber,ContasApagar: Double;
  begin
     SaldoInicial   := _uDmProcedures.SaldoDeLancamento('S','C')- _uDmProcedures.SaldoDeLancamento('S','D');
     ContasAreceber := _uDmProcedures.SaldoDeLancamento('N','C');
     ContasApagar   := _uDmProcedures.SaldoDeLancamento('N','D');

    frmPrincipal.lblSaldoAtualLinhaTempo.text    := frmPrincipal.FormateReal(FloatToStr(SaldoInicial));
    frmPrincipal.lblAreceberLinhaTempo.Text      := frmPrincipal.FormateReal(FloatToStr(ContasAreceber));
    frmPrincipal.lblApagarLinhaTempo.text        := frmPrincipal.FormateReal(FloatToStr(ContasApagar));
    frmPrincipal.lblSaldoRestanteLinhaTempo.Text := frmPrincipal.FormateReal(FloatToStr((SaldoInicial+ContasAreceber)-
                                                     ContasApagar));
  end;
end.
