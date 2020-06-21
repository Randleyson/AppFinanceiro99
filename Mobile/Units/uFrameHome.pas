unit uFrameHome;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, uFrameMenu;

type
  TFrameHome = class(TFrame)
    Rectangle1: TRectangle;
    rectTop: TRectangle;
    Label1: TLabel;
    Layout1: TLayout;
    Image1: TImage;
    Layout2: TLayout;
    Label2: TLabel;
    Layout3: TLayout;
    Label3: TLabel;
    Layout4: TLayout;
    Layout5: TLayout;
    Label4: TLabel;
    btnVerSaldo: TSpeedButton;
    LayoutSaldo: TLayout;
    Label5: TLabel;
    Rectangle2: TRectangle;
    Line1: TLine;
    FrameMenu1: TFrameMenu;
    procedure btnVerSaldoClick(Sender: TObject);
  private
    { Private declarations }
    procedure VisualizarSaldo(pVisualizar : Boolean);
  public
    { Public declarations }
    procedure CreateHome;
    procedure Destroy;
  end;
var
  FrameHome : TFrameHome;

implementation

{$R *.fmx}

uses uFrmPrincipal, uframeLogin;

{ TFrameHome }

procedure TFrameHome.btnVerSaldoClick(Sender: TObject);
begin

  if btnVerSaldo.StyleLookup = 'arrowrighttoolbutton' then
  VisualizarSaldo(True)
  else
  VisualizarSaldo(False);

end;

procedure TFrameHome.CreateHome;
begin
  FrameHome := TFrameHome.Create(nil);

  with FrameHome do
  begin
    Parent := frmPrincipal;
    VisualizarSaldo(False);
    BringToFront;
  end;
end;

procedure TFrameHome.Destroy;
begin
  FreeAndNil(FrameHome)
end;
procedure TFrameHome.VisualizarSaldo(pVisualizar: Boolean);
begin
  if pVisualizar then
  begin
    btnVerSaldo.StyleLookup := 'arrowlefttoolbutton';
    LayoutSaldo.Width := 160;
    btnVerSaldo.Align := TAlignLayout(3);
  end
  else
  begin
    btnVerSaldo.StyleLookup := 'arrowrighttoolbutton';
    LayoutSaldo.Width := 1;
    btnVerSaldo.Align := TAlignLayout(2);
  end;
end;

end.
