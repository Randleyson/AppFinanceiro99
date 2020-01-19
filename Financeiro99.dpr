program Financeiro99;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFrmPrincipal in 'unts\uFrmPrincipal.pas' {frmPrincipal},
  uDatamodule in 'unts\uDatamodule.pas' {Dm: TDataModule},
  uAvancaTela in 'unts\uAvancaTela.pas',
  uHome in 'unts\uHome.pas',
  uControleDeTela in 'unts\uControleDeTela.pas',
  uLogin in 'unts\uLogin.pas',
  uDmProcedures in 'unts\uDmProcedures.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
