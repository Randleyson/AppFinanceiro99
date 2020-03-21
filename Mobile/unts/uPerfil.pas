unit uPerfil;

interface
  uses
    SysUtils,FMX.Forms;

  procedure IniciaConfiguracaoPerfil;
  function CapiturarDimessao:string;

implementation
uses
  uFrmPrincipal;

procedure IniciaConfiguracaoPerfil;
begin
//FOTO

//USUARIO
  frmPrincipal.btnPerfilEditUsuario.StyleLookup  := 'composetoolbutton';
  frmPrincipal.btnPerfilCancUsuario.Visible   := False;
  frmPrincipal.edtPerfilUsuario.Enabled     := False;
  frmPrincipal.edtPerfilUsuario.Text        := dm.UsuarioCadastrado;
//SENHA
  frmPrincipal.btnPerfilEditSenha.StyleLookup := 'composetoolbutton';
  frmPrincipal.btnPerfilCancSenha.Visible     := False;
  frmPrincipal.edtPerfilSenha.Enabled       := False;
  frmPrincipal.edtPerfilSenha.Text          := Dm.SenhaUsuario;
//IDIOMAS E MOEDA
  frmPrincipal.edtPerfilIdiomaMoeda.Enabled := False;
  frmPrincipal.edtPerfilIdiomaMoeda.Text    := 'BR- REAL';
//DIMESSAO
  frmPrincipal.edtPerfilDimessao.Enabled    := False;
  frmPrincipal.edtPerfilDimessao.Text       := CapiturarDimessao;
end;


function CapiturarDimessao:string;
var
  Altura, Largura : integer;
begin
  {$IFDEF ANDROID}
  Largura := Screen.Width;
  Altura  := Screen.Height;
  {$ENDIF}

  {$IFDEF MSEINDOWS}
  Largura := frmPrincipal.Width;
  Altura  := frmPrincipal.Height;
  {$ENDIF}

  Result :=  IntToStr(Altura) + ' X ' + IntToStr(Largura);
end;



end.
