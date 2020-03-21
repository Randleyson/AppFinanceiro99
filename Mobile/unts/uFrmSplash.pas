unit uFrmSplash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,uFrmPrincipal,
  FMX.Objects;

type
  TFrmSplash = class(TForm)
    Image1: TImage;
    Time_Splash: TTimer;
    procedure Time_SplashTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSplash: TFrmSplash;
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TFrmSplash.FormShow(Sender: TObject);
begin
  Time_splash.Interval  := 3000;
  Time_splash.Enabled   := true;
end;

procedure TFrmSplash.Time_SplashTimer(Sender: TObject);
begin
  frmPrincipal := TfrmPrincipal.Create(nil);
  FrmSplash.Visible := false;
  frmPrincipal.Show;
  Time_splash.Enabled := false;
end;

end.
