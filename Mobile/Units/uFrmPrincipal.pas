unit uFrmPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    StyleBook1: TStyleBook;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fMenssagemDoErro: string;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses uframeLogin, uDmConexao, uFrameTelaDeErro;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  DmConexao := TDmConexao.Create(self);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  if not DmConexao.FDC_database.Connected then
    FrameTelaDeErro.CreateTelaDeErro(fMenssagemDoErro)
  else
    FrameLogin.CreateLogin;
end;

end.
