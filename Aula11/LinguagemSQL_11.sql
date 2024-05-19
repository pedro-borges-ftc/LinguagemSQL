/* criando a tabela Produtos */
CREATE table Produtos(
Id bigint PRIMARY KEY NOT NULL AUTO_INCREMENT,
Nome VARCHAR(250) NOT NULL,
Fabricante VARCHAR(100) not NULL,
Tipo VARCHAR(50) not NULL,
Quantidade int not NULL,
VlrUnitario real not NULL
);

/*INSERTS*/
INSERT INTO Produtos (Nome,Fabricante,Quantidade,VlrUnitario,Tipo) VALUES 
('Playstation 3',  'Sony',  100,  1999,  'Console'), 
('Core 2 Duo 4GB Ram 500GB HD',  'Dell',  200,  1899,  'Notebook'), 
('Xbox 360 120GB',  'Microsoft',  350,  1299,  'Console'), 
('GT-I6220 Quad Band',  'Samsung',  300,  499,  'Celular'), 
('iPhone 4 32GB',  'Apple',  50,  1499,  'Smartphone'), 
('Playstation 2',  'Sony',  100,  399,  'Console'),
('Sofá Estofado',  'Coréia',  200,  499,  'Sofá'), 
('Armário de Serviço',  'Aracaju',  50,  129,  'Armário'), 
('Refrigerador 420L',  'CCE',  200,  1499,  'Refrigerador'), 
('Wii 120Gb',  'Nintendo',  250,  999,  'Console');

/*Criando View*/
CREATE VIEW vwProdutos AS
SELECT Id AS Codigo,
      Nome AS Produto,
      Fabricante,
      Quantidade,
      VlrUnitario AS ValorUnitario,
      Tipo
FROM Produtos

/*Select na View*/
SELECT * FROM vwProdutos

/*Alterando View*/
ALTER VIEW vwProdutos AS
SELECT Id AS Codigo,
      Nome AS Produto,
      Fabricante,
      Quantidade,
      VlrUnitario AS ValorUnitario,
      Tipo
FROM Produtos
WHERE VlrUnitario > 499.00

/*Excluindo View*/
DROP VIEW vwProdutos