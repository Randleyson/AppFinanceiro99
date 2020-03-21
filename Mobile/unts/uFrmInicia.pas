unit uFrmInicia;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,ufrmPrincipal,
  FMX.Ani, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TfrmInicial = class(TForm)
    Image9: TImage;
    Timer1: TTimer;
    Label1: TLabel;
    Layout1: TLayout;
    Arc1: TArc;
    Layout2: TLayout;
    FloatAnimation1: TFloatAnimation;
    Rectangle1: TRectangle;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInicial: TfrmInicial;

implementation

{$R *.fmx}

procedure TfrmInicial.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TfrmInicial.Timer1Timer(Sender: TObject);
begin
  if frmPrincipal = nil then
  begin
    Timer1.Enabled := False;
    frmPrincipal := TfrmPrincipal.Create(nil);
    frmPrincipal.Show;
    Free;
  end;
end;


end.
