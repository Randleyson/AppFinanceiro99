unit uAvancaTela;

interface
uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.TabControl, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation,
  FMX.Layouts,
  System.Actions, FMX.ActnList, FMX.ListBox, FMX.MultiView, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, db,
  MultiDetailAppearanceU, System.ImageList, FMX.ImgList, DateUtils,
  FMX.DateTimeCtrls, System.UIConsts, FMX.VirtualKeyboard, FMX.Platform,
  FGX.ActionSheet, System.IOUtils, System.StrUtils, FMX.ComboEdit,
  FMX.ComboTrackBar;


{---------inicio--------}

function AvancaTela(NomeTela : TTabItem): TTabItem;
function VoltaTela: TTabItem;
function ifelseConvert (Entrada:string; Pri:string;ResultPri:string; Seg:string; ResultSeg:string):string;

var
  vListDeTela : array[1..10] of TTabItem;

implementation

uses
  uFrmPrincipal;

function AvancaTela(NomeTela : TTabItem): TTabItem;
 var
  i : integer;

begin
  i := 1;
  while i <> 10 do
  begin
    if vListDeTela[i] = nil then
    begin
      if i = 1 then
        vListDeTela[i] := frmPrincipal.tabPrinc_Home
      else
        vListDeTela[i] := frmPrincipal.tabcPrinc.Tabs[NomeTela.Index];
      result           := NomeTela;
      exit
    end
    else
      i := i+1;
  end;
end;

function VoltaTela: TTabItem;
var
  i : integer;

begin
  i := 1;
  while i <> 10 do
  begin
    if vListDeTela[i] = nil then
    begin
      i := i -1;
      vListDeTela[i] := nil;
      i := i -1;
      if i = 0 then
        result := vListDeTela[1]
      else
      begin
        result := vListDeTela[i];
        exit
      end;
    end
    else
      i:= i+ 1;
  end;
end;

function ifelseConvert (Entrada:string; Pri:string;ResultPri:string; Seg:string; ResultSeg:string):string;
begin
  if Entrada = Pri then
    result := ResultPri
  else
    if Entrada = Seg then
      result := ResultSeg
    else
      result := '';
end;






























end.
