/*
Você deve criar uma Visão que retorne a descrição da finança, o vencimento da finança, o valor e o saldo do dia para todas as entradas em que o cliente seja ciclano.
Em seguida, escreva a consulta SQL necessária para chamar esta visão.
Após executar a sentença, escolha a alternativa correta para o resultado obtido:
A- O saldo positivo de maior valor é no dia 01/04/2024            Resposta correta
B- O saldo negativo de maior valor é no dia 15/03/2024
C- Em janeiro, o saldo final é negativo
D- Em fevereiro o saldo final é negativo
E- O saldo positivo de maior valor é no dia 01/05/2024
*/
CREATE VIEW vwQuestao03 AS
select 
    descricao as DescriçãoFinança,
    vencimento as DiaVencimento, 
    valor * tipolancamento as ValorR$, 
    (valor * tipolancamento + (
      		select sum(valor * tipolancamento) 
      		from financas 
      		where codigo = (select codigo from cliente where nome = 'ciclano' ) and vencimento < DiaVencimento ) 
       							) as SaldoResultante
FROM financas f join cliente c on (f.codigo = c.codigo)
where c.nome = 'ciclano'
order by DiaVencimento;

/*como descobrir a alternatia certa*/
SELECT *
FROM vwQuestao03
where SaldoResultante in (
  SELECT max(SaldoResultante)
FROM vwQuestao03
  );