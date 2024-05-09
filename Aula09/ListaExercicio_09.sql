/*Ex1*/
select p.titulo as titulo,
( SELECT count(1) from comentario c where c.id_projeto = p.id) as qtd_comentario
FROM projetos p;

/*Ex2*/
select p.titulo as titulo,
( SELECT count(1) from comentario c where c.id_projeto = p.id) as qtd_comentario,
( SELECT count(1) from likes_por_projeto lp where lp.id_projeto = p.id) as likes_p_projeto
FROM projetos p;