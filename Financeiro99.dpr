program Financeiro99;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFrmPrincipal in 'unts\uFrmPrincipal.pas' {frmPrincipal},
  uDatamodule in 'unts\uDatamodule.pas' {Dm: TDataModule},
  _uAvancaTela in 'unts\_uAvancaTela.pas',
  uHome in 'unts\uHome.pas',
  uControleDeTela in 'unts\uControleDeTela.pas',
  uLogin in 'unts\uLogin.pas',
  _uDmProcedures in 'unts\_uDmProcedures.pas',
  uCadLancamento in 'unts\uCadLancamento.pas',
  uCategoria in 'unts\uCategoria.pas',
  uPerfil in 'unts\uPerfil.pas',
  uLancamentos in 'unts\uLancamentos.pas',
  uFrmInicia in 'unts\uFrmInicia.pas' {frmInicial};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TfrmInicial, frmInicial);
  Application.Run;
end.
