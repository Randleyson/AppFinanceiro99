unit _uDmProcedures;

interface
uses
  System.SysUtils;

//procedure DeleteCategoria(idCategoria: Integer);
procedure updateUsuarioCadastrado(SN: string);
procedure DadoUltimoLancamento;
//procedure DadoCadLanc_categoria;


function NovoID(CampoChave, Tabela : string): integer;
function SaldoDeLancamento(Quitado, CredDeb: string): Double;


implementation
uses
  uDatamodule,uFrmPrincipal,uHome,uCadLancamento;

 {
procedure DadoCadLanc_categoria;
var
  ID, Descricao : string;
begin
  with dm.FDQcategoria do
  begin
  Close;
  Open();
  First;

  while not eof  do
  begin
    id        := FieldByName('id_categoria').AsString;
    Descricao := FieldByName('descricao').AsString;
    //uCadLancamento.AddItensLstCategoriaCadLanc(id,Descricao);
    Next;
  end;
  end;
end;
}
function NovoID(CampoChave, Tabela : string): integer;
begin 
  with dm.FDQGeral do
  begin 
    Close;
    SQL.Clear;
    SQL.Add('select max('+CampoChave+') ID from '+ Tabela);
    Open();
    result := FieldByName('id').AsInteger+ 1;
    Close;
  end; 
end;


procedure DadoUltimoLancamento;
var
  vDescricao, vCategoria, vValor, vTipo, vData: string;
begin
  with dm.FDQUltimosLanc do
  begin
    Close;
    Open();
    First;
    while not dm.FDQUltimosLanc.Eof do
    begin
      vDescricao := FieldByName('descricao').asstring;
      vCategoria := FieldByName('categoria').asstring;
      vValor     := FieldByName('valor').asstring;
      vTipo      := FieldByName('tipoLancamento').asstring;
      vData      := FieldByName('data').asstring;

      uHome.AddItemLstUltimoLanc(vDescricao, vCategoria, vValor, vTipo, vData);
      Next;
    end;
    Close;
  end;
end;
{
procedure DeleteCategoria(idCategoria: Integer);
begin
  dm.FDQcategoria.Close;
  dm.FDQcategoria.Open();
  dm.FDQcategoria.Locate('id_categoria', idCategoria);
  dm.FDQcategoria.Delete;
  dm.FDQcategoria.Close;
end;
}




function SaldoDeLancamento(Quitado, CredDeb: string): Double;
begin
  dm.FDQSaldoDeLancamento.Close;
  dm.FDQSaldoDeLancamento.ParamByName('quitada').Value  := UpperCase(Quitado);
  dm.FDQSaldoDeLancamento.ParamByName('tipo').Value     := UpperCase(CredDeb);
  dm.FDQSaldoDeLancamento.Open();

  result :=  dm.FDQSaldoDeLancamento.FieldByName('saldo').AsFloat;

  dm.FDQSaldoDeLancamento.Close;
end;

procedure updateUsuarioCadastrado(SN: string);
begin
  dm.FDQUsuario.Close;
  dm.FDQUsuario.Open();
  dm.FDQUsuario.Edit;
  dm.FDQUsuario.FieldByName('ind_login').Value := SN;
  dm.FDQUsuario.Post;
  dm.FDQUsuario.Close;
end;

end.
