unit uframeLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts, FMX.Effects,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrameLogin = class(TFrame)
    imgLogo: TImage;
    LayoutOpcao: TLayout;
    LayoutLogo: TLayout;
    LayoutBtnAcessar: TLayout;
    LayoutSenha: TLayout;
    LayoutLogin: TLayout;
    RectBtnAcessar: TRectangle;
    Label4: TLabel;
    edtLogin: TEdit;
    edtSenha: TEdit;
    Image1: TImage;
    Image2: TImage;
    Label5: TLabel;
    lblCriarConta: TLabel;
    Image3: TImage;
    Rectangle1: TRectangle;
    ShadowEffect1: TShadowEffect;
    Layout1: TLayout;
    Line1: TLine;
    BlurEffect1: TBlurEffect;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Button1: TButton;
    procedure lblCriarContaClick(Sender: TObject);
    procedure RectBtnAcessarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    fFDQuery: TFDQuery;
    function UsuarioExiste: Boolean;
    function SenhaOk: Boolean;
  public
    { Public declarations }
    procedure CreateLogin;
    procedure Destroy;
  end;

var
   FrameLogin : TFrameLogin;

implementation

{$R *.fmx}

uses uFrmPrincipal, uframeCadUsuario, uDmConexao, uFrameHome;


{ TFrame_login }

procedure TFrameLogin.Button1Click(Sender: TObject);
begin
    FrameHome.CreateHome;
    Destroy;
end;

procedure TFrameLogin.CreateLogin;
begin
  FrameLogin := TFrameLogin.Create(nil);

  with FrameLogin do
  begin
    Parent := frmPrincipal;

    fFDQuery            := TFDQuery.Create(self);
    fFDQuery.Active     := False;
    fFDQuery.Connection := DmConexao.FDC_database;

    edtLogin.Text := '';
    edtSenha.Text := '';


    if UsuarioExiste then
    lblCriarConta.Visible := False;

    BringToFront;
  end;
end;
procedure TFrameLogin.Destroy;
begin
  FreeAndNil(FrameLogin);
end;

procedure TFrameLogin.lblCriarContaClick(Sender: TObject);
begin
  FrameCadUsuario.CreateCadUsuario;
end;

procedure TFrameLogin.RectBtnAcessarClick(Sender: TObject);
begin
  if SenhaOk then
  begin
    FrameHome.CreateHome;
    Destroy;
  end
  else
  ShowMessage('Senha Invalida !');
end;

function TFrameLogin.SenhaOk: Boolean;
var
  Sql: String;
begin
  Sql := 'select count(*) count from Usuario'+
         ' where Upper(login) = :Login and Upper(senha) = :Senha';

  fFDQuery.Active := False;
  fFDQuery.SQL.Clear;
  fFDQuery.SQL.Add(Sql);
  fFDQuery.ParamByName('Login').Value := UpperCase(edtLogin.Text);
  fFDQuery.ParamByName('Senha').Value := UpperCase(edtSenha.Text);
  fFDQuery.Active := True;

  if fFDQuery.FieldByName('count').AsInteger > 0 then
  Result := True
  else
  Result := False;
  fFDQuery.Active := False;
end;

function TFrameLogin.UsuarioExiste: Boolean;
var
  Sql : String;
begin
  Sql := 'select count(*) count from Usuario';
  fFDQuery.Active := False;
  fFDQuery.SQL.Clear;
  fFDQuery.SQL.Add(Sql);
  fFDQuery.Active := True;

  if fFDQuery.FieldByName('count').AsInteger > 0 then
  Result := True
  else
  Result := False;
  fFDQuery.Active := False;
end;

end.
