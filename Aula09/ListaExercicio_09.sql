/*Ex1*/
select p.titulo as titulo,
( SELECT count(1) from comentario c where c.id_projeto = p.id) as qtd_comentario
FROM projetos p;

/*Ex2*/
select p.titulo as titulo,
( SELECT count(1) from comentario c where c.id_projeto = p.id) as qtd_comentario,
( SELECT count(1) from likes_por_projeto lp where lp.id_projeto = p.id) as likes_p_projeto
FROM projetos p;

/*Ex3*/
SELECT P.id, P.titulo, P.data
FROM projetos P
WHERE
    P.id IN (
        SELECT
            C.id_projeto
        FROM
            comentarios C
        WHERE
            P.id = C.id_projeto
        );

/*Ex4*/
SELECT P.titulo, P.data
FROM projetos P
WHERE
    P.id = (
        SELECT
            MAX(LP.id_projeto)
        FROM
        likes_por_projeto LP
        );

/*Ex5*/
SELECT
    F.titulo,
    F.Quantidade_Comentarios
FROM
    (SELECT
        P.id,
        P.titulo,
        (SELECT
            COUNT(C.id_projeto)
        FROM
            comentarios C
        WHERE
            C.id_projeto = P.id ) AS Quantidade_Comentarios
FROM
    projetos P
) as F
WHERE
    F.Quantidade_Comentarios > 2;