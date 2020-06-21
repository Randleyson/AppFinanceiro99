unit uFrameTelaDeErro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.Objects,
  System.IOUtils, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView;

type
  TFrameTelaDeErro = class(TFrame)
    Rectangle1: TRectangle;
    MemoMsgErro: TMemo;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Layout1: TLayout;
    Layout2: TLayout;
    ListView1: TListView;
    LbFolder: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure carregadiretorio(diretorio: string);
  public
    { Public declarations }
    procedure CreateTelaDeErro(pMsgDoErro: string);
  end;
var
  FrameTelaDeErro:TFrameTelaDeErro;

implementation

{$R *.fmx}

uses uFrmPrincipal;

{ TFrameTelaDeErro }

procedure TFrameTelaDeErro.CreateTelaDeErro(pMsgDoErro: string);
begin
  if not Assigned(FrameTelaDeErro) then
     FrameTelaDeErro := TFrameTelaDeErro.Create(frmPrincipal);

  with FrameTelaDeErro do
  begin
    Parent            := frmPrincipal;
    MemoMsgErro.Text  := pMsgDoErro;
    carregadiretorio(TPath.Combine(TPath.GetDocumentsPath,''));
    BringToFront;
  end;
end;

procedure TFrameTelaDeErro.carregadiretorio(diretorio: string);
var
  listapastas, listaarquivos: TStringDynArray;
  pasta, arquivo: string;
  LItem: TListViewItem;
begin

    ListView1.Items.Clear;
    LbFolder.Text := diretorio;
    listapastas := TDirectory.GetDirectories(diretorio);
    listaarquivos := TDirectory.GetFiles(diretorio);
    ListView1.BeginUpdate;

    LItem := ListView1.Items.Add;
    LItem.Detail := 'voltar';
    LItem.Text := '..<<';

    for pasta in listapastas do
    begin
      //Carrega as Pastas
      LItem := ListView1.Items.Add;
      LItem.Detail := 'folder';
      LItem.Text := Copy(pasta, Length(ExtractFilePath(pasta))+1, Length(pasta));
    end;

    for arquivo in listaarquivos do
    begin
      //Carrega os Arquivos
      LItem := ListView1.Items.Add;
      LItem.Detail := 'file';
      LItem.Text := ExtractFileName(arquivo);
    end;
    ListView1.EndUpdate;
end;

procedure TFrameTelaDeErro.SpeedButton1Click(Sender: TObject);
begin
  if Assigned(FrameTelaDeErro) then
  begin
    FrameTelaDeErro.DisposeOf;
    FrameTelaDeErro := nil;
  end;
end;
end.
