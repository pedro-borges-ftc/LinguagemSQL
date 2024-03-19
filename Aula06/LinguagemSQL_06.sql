/*Criação da tabela produtos*/
CREATE table produtos(
Codigo bigint PRIMARY KEY NOT NULL AUTO_INCREMENT,
Descricao VARCHAR(100) NOT NULL,
PrecoVenda real NULL,
PrecoCusto real NULL,
Categoria int NULL
);

/*Inserção de registros em produtos*/
INSERT INTO produtos (Descricao,PrecoVenda,PrecoCusto,Categoria) 
VALUES 
('Caderno', 5.45, 1.00, 1),
('Caneta', 1.2, 0.5, 1),
('CD', 1.0, 0.1, 2),
('Mouse', 14.0, 5.0, 2); 

/*MAX*/
SELECT
	max(precovenda)
FROM
	produtos;

/*MIN*/
SELECT
	min(precovenda)
FROM
	produtos;

/*SUM*/
SELECT
	SUM(precovenda)
FROM
	produtos
WHERE
	categoria=1;

/*AVG*/
SELECT
	AVG(precovenda)
FROM
	produtos;

/*GROUP BY*/
SELECT
	categoria,
    MAX(precovenda)
FROM
	produtos
GROUP BY
	categoria;

/*HAVING*/
SELECT
	categoria,
    MAX(precovenda)
FROM
	produtos
GROUP BY
	categoria
HAVING
	MAX(precovenda) > 10;