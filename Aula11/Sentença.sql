SELECT f.codigo, c.nome, f.id, f.descricao, f.cadastro, f.vencimento, f.valor, f.quitado, f.tipoLancamento
FROM financas f join cliente c on (f.codigo = c.codigo)