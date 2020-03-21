unit uLogin;

interface
uses
 System.SysUtils;

  procedure InicilizaLogin;
  function ValidaSenhaUsuario(Senha : string): Boolean;

implementation
{ TLogin }
uses
  uFrmPrincipal, uDatamodule,_uDmProcedures;

procedure InicilizaLogin;
begin
  frmPrincipal.MultiView.Enabled := False;

  if dm.ExitUsuarioCadastrado then
    begin
    frmPrincipal.lblUsuarioLogin.Text  := dm.UsuarioCadastrado;
    frmPrincipal.EdtLoginSenha.Text    := '';

    frmPrincipal.EdtLoginSenha.SetFocus;
    frmPrincipal.TabcLogin.ActiveTab   := frmPrincipal.tabLogin_Logar;
  end
  Else
  begin
    frmPrincipal.MsgInformativaToolb('Nao a usuario cadastrado');

    frmPrincipal.EdtCadLoginNone.Text        := '';
    frmPrincipal.edtCadLoginSenha.Text       := '';
    frmPrincipal.edtCadLoginConfiSenha.Text  := '';

    frmPrincipal.EdtCadLoginNone.SetFocus;
    frmPrincipal.TabcLogin.ActiveTab := frmPrincipal.tabLogin_CadUsuario;
  end
end;


function ValidaSenhaUsuario(Senha : string): Boolean;
begin
  if UpperCase(Senha) = Dm.SenhaUsuario then
    result := true
  else
    result := false;
end;

end.
