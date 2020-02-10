unit uLogin;

interface
uses
 System.SysUtils;

  procedure InicilizaLogin;
  procedure IniciarCadastroUsuario;




  function ValidaSenhaUsuario(Senha : string): Boolean;

implementation
{ TLogin }
uses
  uFrmPrincipal, uDatamodule,uDmProcedures;

procedure InicilizaLogin;
begin
  frmPrincipal.MultiView.Enabled := False;


  if uDmProcedures.UsuarioCadastrado = '' then
  begin
    frmPrincipal.EdtCadLoginNone.Text        := '';
    frmPrincipal.edtCadLoginSenha.Text       := '';
    frmPrincipal.edtCadLoginConfiSenha.Text  := '';

    frmPrincipal.EdtCadLoginNone.SetFocus;

    frmPrincipal.actLogin_CadUsuario.ExecuteTarget(nil);
  end
  else
  begin
    frmPrincipal.TabcLogin.ActiveTab   := frmPrincipal.tabLogin_Logar;
    frmPrincipal.lblUsuarioLogin.Text  := uDmProcedures.UsuarioCadastrado;
    frmPrincipal.EdtLoginSenha.Text    := '';
    frmPrincipal.EdtLoginSenha.SetFocus;

  end;



















end;


procedure IniciarCadastroUsuario;
begin

end;

function ValidaSenhaUsuario(Senha : string): Boolean;
begin
  if UpperCase(Senha) = uDmProcedures.SenhaUsuario then
    result := true
  else
    result := false;
end;

end.
