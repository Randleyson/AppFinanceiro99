unit uFrameMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.ExtCtrls, FMX.Objects, System.ImageList, FMX.ImgList;


type
  TFrameMenu = class(TFrame)
    Layout1: TLayout;
    rectHome: TRectangle;
    rectAdd: TRectangle;
    rectRel: TRectangle;
    rectNotificacao: TRectangle;
    imgHome: TImage;
    imgAdd: TImage;
    imgNotificao: TImage;
    imgRel: TImage;
    Rectangle1: TRectangle;
    imgLstAdd: TImageList;
    imgLstRel: TImageList;
    imgLstNotif: TImageList;
    imgLstHome: TImageList;
    procedure rectHomeClick(Sender: TObject);
    procedure rectAddClick(Sender: TObject);
    procedure rectRelClick(Sender: TObject);
    procedure rectNotificacaoClick(Sender: TObject);
  private
    { Private declarations }
    procedure PrintBtnCorlor(pBtn : TRectangle; pImg: TImage; pLstImg: TImageList);
  public
    { Public declarations }
  end;
var
  FrameMenu : TFrameMenu;

implementation

uses
  Winapi.Windows;

{$R *.fmx}

procedure TFrameMenu.PrintBtnCorlor(pBtn : TRectangle; pImg: TImage; pLstImg: TImageList);
begin
  rectHome.Fill.Color         := $FFFEFEFE;
  rectAdd.Fill.Color          := $FFFEFEFE;
  rectRel.Fill.Color          := $FFFEFEFE;
  rectNotificacao.Fill.Color  := $FFFEFEFE;

  pBtn.Fill.Color             := $C85CBA60;

  imgHome.Bitmap        := imgLstHome.Bitmap(imgHome.DefaultSize,0);
  imgAdd.Bitmap         := imgLstAdd.Bitmap(imgAdd.DefaultSize,0);
  imgRel.Bitmap         := imgLstRel.Bitmap(imgRel.DefaultSize,0);
  imgNotificao.Bitmap   := imgLstNotif.Bitmap(imgNotificao.DefaultSize,0);

  pImg.Bitmap         := pLstImg.Bitmap(pImg.DefaultSize,1);

end;

procedure TFrameMenu.rectAddClick(Sender: TObject);
begin
  PrintBtnCorlor(rectAdd,imgAdd,imgLstAdd);
end;

procedure TFrameMenu.rectHomeClick(Sender: TObject);
begin
  PrintBtnCorlor(rectHome,imgHome,imgLstHome);
end;

procedure TFrameMenu.rectNotificacaoClick(Sender: TObject);
begin
  PrintBtnCorlor(rectNotificacao,imgNotificao,imgLstNotif);
end;

procedure TFrameMenu.rectRelClick(Sender: TObject);
begin
  PrintBtnCorlor(rectRel,imgRel,imgLstRel);
end;

end.
