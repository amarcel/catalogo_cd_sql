----------------
--DML - JOIN: --
----------------

--Consulta 1: selecionar o nome e a url de 
--todas as gravadoras, assim como o nome dos 
--cds que fazem parte das gravadoras e os seus 
--respectivos preços:
select gravadora.nome_gravadora, gravadora.url
       , cd.nome_cd , cd.preco_venda
from gravadora
inner join cd on gravadora.id = cd.gravadora_id
--cds de mais de 20 reais:
where cd.preco_venda > 20

--OUTRA VERSÃO DO JOIN (com apelidos):
select g.nome_gravadora, g.url AS url_gravadora
       , c.nome_cd , c.preco_venda AS preco_cd
from gravadora AS g
join cd AS c on g.id = c.gravadora_id

--Consulta 2: selecionar o código, o nome e 
--o endereço de todas as gravadoras que possuem 
--pelo menos um cd gravado.
select distinct g.id, g.nome_gravadora
       , g.endereco_gravadora
from gravadora as g
right join cd as c on g.id = c.gravadora_id

--Consulta 3: selecionar o nome de todas as 
--gravadoras que NÃO possuem cd associado
select g.nome_gravadora
from gravadora as g 
where g.id NOT IN (
   --cds que possuem gravadora:
   select distinct g.id
   from gravadora as g
   right join cd as c on g.id = c.gravadora_id
)

------------------
--EXERCÍCIOS DML--
------------------

--A) Selecione todos os campos (colunas) da tabela 
--cd e os códigos das músicas que compõem o cd.
select c.* , ic.musica_id
from cd as c
join item_cd as ic on c.id = ic.cd_id

--B) Selecione o nome, o preço de venda e a 
--data de lançamento dos cds e o nome e a 
--duração das músicas que fazem parte dos 
--respectivos cds.
select c.nome_cd, c.preco_venda, c.data_lancamento
       , m.nome_musica, m.duracao
from cd as c
join item_cd as ic ON c.id = ic.cd_id
join musica  as m  ON ic.musica_id = m.id

--C) Selecione todos os campos da tabela autor 
--e os códigos das músicas que este autor compôs.
select a.*, ma.musica_id
from autor as a
join musica_autor as ma ON a.id = ma.autor_id

--D) Selecione o código e o nome dos autores 
--e as respectivas músicas que eles fizeram 
--(código, nome e duração da música).
select a.*, m.*
from autor as a
join musica_autor as ma ON a.id = ma.autor_id
join musica as m ON ma.musica_id = m.id

--E) Selecione as gravadoras (nome, endereço) 
--e as músicas que fazem parte delas (código, 
--nome e duração).
select g.nome_gravadora, g.endereco_gravadora
       , m.id, m.nome_musica, m.duracao
from gravadora as g
join cd as c on g.id = c.gravadora_id
join item_cd as ic ON c.id = ic.cd_id
join musica as m ON ic.musica_id = m.id

--F)Selecione os cds (código, nome e data de 
--lançamento) e os autores que fazem parte 
--deles (nome).
select c.id, c.nome_cd, c.data_lancamento ,
       a.nome_autor
from cd as c
join item_cd as ic on c.id = ic.cd_id
join musica as m   on ic.musica_id = m.id
join musica_autor as ma on m.id = ma.musica_id
join autor as a on ma.autor_id = a.id

--G)Selecione o nome, contato e url das gravadoras;
--o nome dos autores; o nome e a duração das 
--músicas; o nome, o preço e o código dos cds.
select g.nome_gravadora, g.contato, g.url
       , a.nome_autor, m.duracao, c.nome_cd
       , c.preco_venda, c.id
from gravadora as g
join cd as c on g.id = c.gravadora_id
join item_cd as ic on c.id = ic.cd_id
join musica as m on ic.musica_id = m.id
join musica_autor as ma on m.id = ma.musica_id
join autor as a on ma.autor_id = a.id


