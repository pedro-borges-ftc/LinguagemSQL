/*Escreva uma consulta SQL que retorne o nome do cliente, a descrição da finança, o vencimento da finança e o valor (seja ele positivo para crédito e negativo para débito) para todas as entradas em que o cliente seja você. Se baseie pelo seu nome completo (com letras maiúsculas) para encontrar esses registros e os ordene em ordem de vencimento cronológica e ascendente.*/
select 
    c.nome as NomeCliente,
    descricao as DescriçãoFinança,
    vencimento as DiaVencimento, 
    valor * tipolancamento as ValorR$
FROM financas f join cliente c on (f.codigo = c.codigo)
where c.nome = 'AEVERTON SANTOS DE OLIVEIRA'
order by DiaVencimento;

/*Escreva uma consulta SQL que retorne o nome do cliente, a quantidade de finanças e o saldo final no mes de fevereiro, para todas as entradas em que o cliente seja você.*/
select 
	/*c.nome as NomeCliente,*/
    'FULANO DE TALZ' AS NomeCliente,
    Count(1) as QuantidadeFinanças,
    sum(valor * tipolancamento) as SaldoEmFevereiroR$
FROM financas f join cliente c on (f.codigo = c.codigo)
where c.nome = 'AEVERTON SANTOS DE OLIVEIRA' and vencimento < '20240301'
group by NomeCliente;

/*Escreva uma consulta SQL que retorne o nome do cliente a descrição da finança, a quantidade de finanças e o somatório agrupado pela descrição da finança, para todas as entradas em que o cliente seja você. */
select 
	/*c.nome as NomeCliente,*/
    'FULANO DE TALZ' AS NomeCliente,
    descricao as DescriçãoFinança,
    Count(1) as QuantidadeFinanças,
    sum(valor * tipolancamento) as SomatórioR$
FROM financas f join cliente c on (f.codigo = c.codigo)
where c.nome = 'AEVERTON SANTOS DE OLIVEIRA'
group by NomeCliente,DescriçãoFinança;

/*Escreva uma consulta SQL que retorne a descrição da finança, o vencimento da finança,  o valor e o saldo do dia para todas as entradas em que o cliente seja você.*/
select 
    descricao as DescriçãoFinança,
    vencimento as DiaVencimento, 
    valor * tipolancamento as ValorR$, 
    (valor * tipolancamento + (
      		select sum(valor * tipolancamento) 
      		from financas 
      		where codigo = (select codigo from cliente where nome = 'AEVERTON SANTOS DE OLIVEIRA' ) and vencimento < DiaVencimento ) 
       							) as SaldoResultante
FROM financas f join cliente c on (f.codigo = c.codigo)
where c.nome = 'AEVERTON SANTOS DE OLIVEIRA'
order by DiaVencimento;