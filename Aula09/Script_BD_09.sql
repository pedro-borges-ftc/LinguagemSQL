/*-------------------------------------------
-- CRIAÇÃO DE TABELAS PARA O EXERCÍCIO
-------------------------------------------*/

/* criando a tabela usuário */
CREATE table usuario(
id int PRIMARY KEY,
nome VARCHAR(45),
email VARCHAR(45),
senha VARCHAR(45)
);

/* criando a tabela projetos */
CREATE table projetos(
id int PRIMARY KEY,
titulo VARCHAR(45),
data DATE,
url VARCHAR(100)
);

/* criando a tabela comentario */
CREATE table comentario(
id int PRIMARY KEY,
comentario TEXT,
data DATE,
id_usuario INT,
id_projeto INT
);

ALTER TABLE comentario ADD CONSTRAINT fk_comentario_usuario 
FOREIGN KEY (id_usuario) REFERENCES usuario (id) ;

ALTER TABLE comentario ADD CONSTRAINT fk_comentario_projetos 
FOREIGN KEY (id_projeto) REFERENCES projetos (id) ;

/* criando a tabela likes_por_projeto */
CREATE table likes_por_projeto(
id_usuario INT,
id_projeto INT
);

ALTER TABLE likes_por_projeto ADD CONSTRAINT fk_likes_usuario 
FOREIGN KEY (id_usuario) REFERENCES usuario (id) ;

ALTER TABLE likes_por_projeto ADD CONSTRAINT fk_likes_projetos 
FOREIGN KEY (id_projeto) REFERENCES projetos (id) ;

/* criando a tabela likes_por_comentario */
CREATE table likes_por_comentario(
id_usuario INT,
id_comentario INT
);

ALTER TABLE likes_por_comentario ADD CONSTRAINT fk_likes_coment_usr 
FOREIGN KEY (id_usuario) REFERENCES usuario (id) ;

ALTER TABLE likes_por_comentario ADD CONSTRAINT fk_likes_comentario 
FOREIGN KEY (id_comentario) REFERENCES comentario (id) ;

/* povoando a tabela projetos */
INSERT INTO projetos (id,titulo,data) VALUES 
(1,'Aplicação C#','2018-04-01'),
(2,'Aplicação Ionic','2018-05-07'),
(3,'Aplicação Python','2018-08-05');

/* povoando a tabela projetos */
INSERT INTO usuario (id,nome,email,senha) VALUES 
(1,'Bruna Luiza','bruninha@gmail.com','abc123.'),
(2,'Thiago Braga','thiagobraga_1@hormail.com','pena093'),
(3,'Osvaldo Justino','osvaltino@yahoo.com.br','osvaldit1_s'),
(4,'Gabriel Fernando','gabriel_fnd@gmail.com','gabss34');


/* povoando a tabela comentario */
INSERT INTO comentario (id,comentario,id_projeto,id_usuario) VALUES 
(1,'A Microsoft acertou com essa linguagem!',1,1),
(2,'Parabéns pelo projeto! bem legal!',1,3),
(3,'Super interessante! fácil e rápido!',2,4),
(4,'Cara, que simples fazer um app assim!',2,1),
(5,'Linguagem muito diferente.',3,3),
(6,'Adorei aprender Python! Parabéns!',3,2),
(7,'Muito maneiro esse framework!',2,2);

/* povoando a tabela likes_por_projeto */
INSERT INTO likes_por_projeto (id_projeto,id_usuario) VALUES 
(1,1),
(1,3),
(2,1),
(2,2),
(2,3),
(2,4),
(3,2);

/* povoando a tabela likes_por_comentario */
INSERT INTO likes_por_comentario (id_comentario,id_usuario) VALUES 
(7,1),
(7,4),
(7,2);