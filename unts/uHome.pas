unit uHome;

interface
uses
  System.UIConsts,System.SysUtils,System.DateUtils,FireDAC.Comp.DataSet,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base,MultiDetailAppearanceU;

  procedure RefreshLblMeuSaldo;
  procedure RefreshLinhaDoTempo;
  procedure InicializaTabHome;

implementation

{ THome }
uses
  uFrmPrincipal,uDatamodule,uDmProcedures;

 procedure RefreshUltimosLanc;
var
  AddList: TListViewItem;
  TmultiDetail: TMultiDetailAppearanceNames;

begin
{
  with Dm.FDQtabLancamento do
  begin
    Close;
    SQL.strings[3] := '';
    SQL.strings[4] := '';
    SQL.strings[3] := 'where quitada = ''S''';
    SQL.strings[4] := ' order by data';
    Open();
    first;

    frmPrincipal.lstHomeUltimosLanc.Items.Clear;
    frmPrincipal.lstHomeUltimosLanc.BeginUpdate;

    while not eof do
    begin
    frmPrincipal.lstHomeUltimosLanc.Items.Clear;
    frmPrincipal.lstHomeUltimosLanc.BeginUpdate;

      AddList         := frmPrincipal.lstHomeUltimosLanc.Items.Add;
      AddList.Detail  := '1';
      AddList.Text    := 'SALARIO';
      AddList.Data[TmultiDetail.Detail2] := 'R$ 2100,20';
       frmPrincipal.lstHomeUltimosLanc.EndUpdate;


      //AddList.Data[TmultiDetail.Detail1] := 'salario';
      //AddList.Data[TmultiDetail.Detail2] := 'R$ 2100,20';
      Next;
    end;    }

    //frmPrincipal.lstHomeUltimosLanc.EndUpdate;

end;


procedure InicializaTabHome;
begin
  frmPrincipal.lblNomeDoUsuario.Text := uDmProcedures.UsuarioCadastrado;

  RefreshLblMeuSaldo;

  frmPrincipal.lblDataAtualtabiHome.Text := frmPrincipal.NomeMes(MonthOf(now))+'/'+
                                             IntToStr(YearOf(now));

  RefreshLinhaDoTempo;
  RefreshUltimosLanc;
end;

procedure RefreshLblMeuSaldo;
 var
    Saldo: Double;
begin
    Saldo := uDmProcedures.SaldoDeLancamento('S','C')- uDmProcedures.SaldoDeLancamento('S','D');

    frmPrincipal.lblSaldoAtual.Text := frmPrincipal.FormateReal( FloatToStr((Saldo)));

    if Saldo < 0 then
      frmPrincipal.lblSaldoAtual.FontColor := claRed
    else
      frmPrincipal.lblSaldoAtual.FontColor := claBlack;
  end;


procedure RefreshLinhaDoTempo;
var
    SaldoInicial,ContasAreceber,ContasApagar: Double;
  begin
     SaldoInicial   := uDmProcedures.SaldoDeLancamento('S','C')- uDmProcedures.SaldoDeLancamento('S','D');
     ContasAreceber := uDmProcedures.SaldoDeLancamento('N','C');
     ContasApagar   := uDmProcedures.SaldoDeLancamento('N','D');

    frmPrincipal.lblSaldoAtualLinhaTempo.text    := frmPrincipal.FormateReal(FloatToStr(SaldoInicial));
    frmPrincipal.lblAreceberLinhaTempo.Text      := frmPrincipal.FormateReal(FloatToStr(ContasAreceber));
    frmPrincipal.lblApagarLinhaTempo.text        := frmPrincipal.FormateReal(FloatToStr(ContasApagar));
    frmPrincipal.lblSaldoRestanteLinhaTempo.Text := frmPrincipal.FormateReal(FloatToStr((SaldoInicial+ContasAreceber)-
                                                     ContasApagar));
  end;
end.
