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
  uDmProcedures in 'unts\uDmProcedures.pas',
  uCadLancamento in 'unts\uCadLancamento.pas',
  uCategoria in 'unts\uCategoria.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
