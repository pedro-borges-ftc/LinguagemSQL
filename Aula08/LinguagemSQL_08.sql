-- Criando a tabela Cago
CREATE TABLE CARGO
(
CodCargo char(2)      NOT NULL,
NomeCargo varchar(50) NULL,
ValorCargo money      NULL,
PRIMARY KEY(CodCargo)
);

-- Criando a tabela Funcionario
CREATE TABLE FUNCIONARIO
(
   Matricula int,
   NomeFuncionario varchar(50) NOT NULL,
   CodCargo char(2)            NULL,
   PRIMARY KEY(Matricula),
   FOREIGN KEY (CodCargo) REFERENCES CARGO (CodCargo)
);

-- Povoando a tabela CARGO
INSERT CARGO (CodCargo, NomeCargo, ValorCargo) 
VALUES ('C1','CAIXA',800.00);
INSERT CARGO (CodCargo, NomeCargo, ValorCargo) 
VALUES ('C2','VENDEDOR',1200.00);
INSERT CARGO (CodCargo, NomeCargo, ValorCargo) 
VALUES ('C3','GERENTE',2400.00);

-- Povoando a tabela FUNCIONARIO
INSERT FUNCIONARIO (Matricula, NomeFuncionario, CodCargo) 
VALUES (100,'JOÃO','C1');
INSERT FUNCIONARIO (Matricula, NomeFuncionario, CodCargo)
VALUES (110,'MARIA','C2');
INSERT FUNCIONARIO (Matricula, NomeFuncionario, CodCargo)
VALUES (120,'CARLOS','C1')
INSERT FUNCIONARIO (Matricula, NomeFuncionario, CodCargo)
VALUES (130,'TADEU', NULL);

-----------------------------------------
-- EXEMPLOS DE JOIN ABORDADOS NO SLIDE
-----------------------------------------

-- Seleção Simples ( Todos os Cargos e Todos os Funcionario ) - Veja Figura 2
SELECT * FROM CARGO AS C --> Apelidamos a tabelas Cargo de C neste artigo
SELECT * FROM FUNCIONARIO AS F --> Apelidamos funcionário de F neste artigo

-- INNER JOIN ( Junção Interna ) - Veja Figura 4
SELECT
	F.NomeFuncionario
	,C.NomeCargo
FROM
	CARGO AS C
	INNER JOIN FUNCIONARIO AS F ON (F.CodCargo = C.CodCargo)

-- LEFT OUTER JOIN ou simplesmente LEFT JOIN ( Junção Externa Esquerda ) - Veja Figura 5
SELECT 
	F.nomeFuncionario
	,C.nomeCargo
FROM 
	FUNCIONARIO AS F 
	LEFT OUTER JOIN CARGO AS C ON ( C.codCargo = F.codCargo )

-- RIGHT OUTER JOIN ou simplesmente RIGHT JOIN ( Junção Externa Direita) -  Veja Figura 6
SELECT	
	F.nomeFuncionario
	,C.nomeCargo
FROM
	FUNCIONARIO AS F
	RIGHT OUTER JOIN CARGO AS C ON ( F.codCargo = C.codCargo )

-- FULL OUTHER JOIN ou simplesmente FULL JOIN (Junção Externa Completa)
SELECT 
	F.nomeFuncionario
	,C.nomeCargo
FROM
	FUNCIONARIO AS F
	FULL OUTER JOIN  CARGO       AS C  ON ( C.codCargo = F.codCargo )