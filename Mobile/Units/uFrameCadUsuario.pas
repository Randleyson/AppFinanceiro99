unit uframeCadUsuario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts;

type
  TFrameCadUsuario = class(TFrame)
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    imgBtnVoltar: TImage;
    Label1: TLabel;
    Layout1: TLayout;
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtSenha: TEdit;
    rectBtnCadastrar: TRectangle;
    Label4: TLabel;
    Label5: TLabel;
    edtConfirmaSenha: TEdit;
    edtLogin: TEdit;
    Label6: TLabel;
    procedure imgBtnVoltarClick(Sender: TObject);
    procedure rectBtnCadastrarClick(Sender: TObject);

  private
    { Private declarations }
    procedure CadastarUsuario;
  public
    { Public declarations }
    procedure CreateCadUsuario;
  end;
var
   FrameCadUsuario : TFrameCadUsuario;
implementation

{$R *.fmx}

uses uFrmPrincipal, uframeLogin, uDmConexao;

{ TFrameCadUsuario }

procedure TFrameCadUsuario.CadastarUsuario;
var
  Sql: String;
begin
  Sql := 'delete from usuario';
  DmConexao.FDC_database.ExecSQL(Sql);

  Sql := 'Insert into Usuario values('''+edtNome.Text+''','''+edtLogin.Text+''','''+edtSenha.Text+''')';
  DmConexao.FDC_database.ExecSQL(Sql);

  ShowMessage('Usuario Cadastro com exito!');
  FrameLogin.CreateLogin;
end;

procedure TFrameCadUsuario.CreateCadUsuario;
begin
  if not Assigned(FrameCadUsuario) then
  FrameCadUsuario := TFrameCadUsuario.Create(frmPrincipal);

  with FrameCadUsuario do
  begin
    Parent := frmPrincipal;

    edtNome.Text          := '';
    edtLogin.Text         := '';
    edtSenha.Text         := '';
    edtConfirmaSenha.Text := '';

    BringToFront;
  end;

end;

procedure TFrameCadUsuario.imgBtnVoltarClick(Sender: TObject);
begin
  FrameLogin.CreateLogin;
end;

procedure TFrameCadUsuario.rectBtnCadastrarClick(Sender: TObject);
begin
  CadastarUsuario;
end;

end.
