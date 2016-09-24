--------------------------
-- FUNCOES DE AGREGAÇÃO --
--------------------------

﻿--a) Qual a média de preço de cds?
select avg( preco_venda ) as media_preco_cd 
from cd;
--b) Qual a duração total de músicas em horas?
select sum( duracao ) / 60 as duracao_horas
from musica;
--c) Qual o maior código de gravadora 
--cadastrado no BD?
select max( id ) from gravadora;
--d) Qual o menor código de autor 
--cadastrado no BD?
select min( id ) from autor;
--e) Quantos registros diferentes a seguinte 
--consulta retorna: extrair o nome de todos 
--os autores que possuem alguma música gravada?
select count( DISTINCT a.nome_autor ) as qtd_autores
from autor as a
join musica_autor as ma ON a.id = ma.autor_id;

