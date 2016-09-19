--------------------------
--COMANDOS DML - INSERT:--
--------------------------

--inserindo gravadoras:
insert into gravadora
( nome_gravadora, endereco_gravadora, contato, url )
values
( 'Sony', 'Av. Paulista, 100', '(11) 4009-0998' , 
  'www.sony.com' );

insert into gravadora 
( nome_gravadora, endereco_gravadora, contato, url )
values
( 'EMI', 'Av. Rebouças, 500', '(11) 4004-1122' ,
  'www.emi.com' );

--selecionar as gravadoras:
select * from gravadora

--inserindo cds:
insert into cd
( nome_cd, preco_venda, data_lancamento, gravadora_id,
  cd_indicado )
values
( 'Mais do Mesmo', 15, '1990-05-13', 3, null );

insert into cd
( nome_cd, preco_venda, data_lancamento, gravadora_id,
  cd_indicado )
values
( 'Ira! - Acústico MTV', 23, '2004-01-18', 2, null );

insert into cd 
( nome_cd, preco_venda, data_lancamento, 
  gravadora_id, cd_indicado )
values
( 'Abraçaço', 22.50, '2015-05-03', 3, null );

--inserindo músicas:
INSERT INTO musica
(nome_musica, duracao)
VALUES
('Será', 4.20) ,            --musica 1
('Girassol', 3.54) ,        --musica 2
('Núcleo Base', 5.14) ,     --musica 3
('Um Abraçaço', 3.25) ,     --musica 4
('O Império da Lei', 4.05); --musica 5

--inserindo na tabela item_cd:
insert into item_cd
(cd_id, musica_id, numero_faixa)
values
(1, 1, 1),
(2, 2, 1),
(2, 3, 2),
(4, 4, 1),
(4, 5, 2);

--inserindo na tabela autor:
insert into autor 
(nome_autor)
values
('Renato Russo'),
('Edgard Scandurra'),
('Caetano Veloso');

--inserindo na tabela musica_autor:
insert into musica_autor
(musica_id, autor_id)
values
(1, 1) ,
(2, 2) ,
(3, 2) ,
(4, 3) ,
(5, 3);

--inserindo na tabela cd_categoria
insert into cd_categoria
(menor_preco, maior_preco)
values
(5, 15),
(16, 30),
(31, 50);

----------------
--DML - SELECT--
----------------

--a) Selecione todos os nomes das gravadoras 
--do banco de dados:
select nome_gravadora from gravadora;

--b)Selecione os cds que têm preço de 
--venda maior que 20 reais.
select * 
from cd 
where preco_venda > 20;  --filtro

--c) Selecione os cds que foram 
--lançados antes de 01/01/2000
select * 
from cd 
where data_lancamento < '2000-01-01' 
                    --ou 01/01/2000
and preco > 20
--d) Selecione todos os 
--dados dos autores cadastrados.
select * from autor

------------------
-- DML - UPDATE --
------------------

--a) Atualizar o endereço da gravadora EMI 
--para Av. Interlagos, 800
--select * from gravadora
UPDATE gravadora
SET endereco_gravadora = 'Av. Interlagos, 800'
where nome_gravadora = 'EMI'

--b) Atualizar a data de 
--lançamento do cd de código 2 para 09/01/2015.
UPDATE cd
SET data_lancamento = '09/01/2015' --ou 2015-01-09
where id = 2
select * from cd

--c) Atualizar o nome da música de código 1 e 
--a duração da mesma para “Será Só Imaginação” 
--e 4.2, respectivamente.
UPDATE musica
SET nome_musica = 'Será só imaginação' , 
    duracao = 4.2
WHERE id = 1;

--d) Atualizar o preço de todos os 
--cds que custam mais de 10 reais, 
--concedendo 10% de desconto.
UPDATE cd 
SET preco_venda = 
	( preco_venda * 110.0 / 100.0 )
WHERE preco_venda > 10

------------------
-- DML - DELETE --
------------------

--a) Remover o autor de código 3.
--exemplo de consistência de dados
--primeiro teria que remover da tabela musica_autor
--todos os registros com autor_id = 3
--(restrição de chave estrangeira)
--e depois rodar o comando:
DELETE FROM autor WHERE id = 3;

--b) Remover todas as categorias de cd 
--que tem preço entre 10 e 20 reais.
DELETE FROM cd_categoria 
WHERE menor_preco >= 10
AND   maior_preco <= 20


