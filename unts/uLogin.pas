unit uLogin;

interface
uses
 System.SysUtils;

  procedure UsuarioCadastro;
  procedure IniciarCadastroUsuario;



  function ValidaSenhaUsuario(Senha : string): Boolean;

implementation
{ TLogin }
uses
  uFrmPrincipal, uDatamodule,uDmProcedures;


procedure IniciarCadastroUsuario;
begin
  frmPrincipal.EdtCadLoginNone.Text        := '';
  frmPrincipal.edtCadLoginSenha.Text       := '';
  frmPrincipal.edtCadLoginConfiSenha.Text  := '';

  frmPrincipal.EdtCadLoginNone.SetFocus;

  frmPrincipal.actLogin_CadUsuario.ExecuteTarget(nil);
end;

procedure UsuarioCadastro;
begin
  if uDmProcedures.UsuarioCadastrado = '' then
      IniciarCadastroUsuario
  else
  begin
    frmPrincipal.TabcLogin.ActiveTab   := frmPrincipal.tabLogin_Logar;
    frmPrincipal.lblUsuarioLogin.Text  := uDmProcedures.UsuarioCadastrado;
    frmPrincipal.EdtLoginSenha.Text    := '';
  end;
end;

function ValidaSenhaUsuario(Senha : string): Boolean;
begin
  if UpperCase(Senha) = uDmProcedures.SenhaUsuario then
    result := true
  else
    result := false;
end;

end.
