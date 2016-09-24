-----------------
--COMANDOS DDL:--
-----------------

--criando o banco de dados:
﻿CREATE DATABASE catalogo_cds_????????
	WITH OWNER = postgres
	ENCODING = 'UTF-8'
	CONNECTION LIMIT = -1;

--criando a tabela gravadora:
CREATE TABLE gravadora (
   --chave-primária:
   id SERIAL NOT NULL,
   nome_gravadora VARCHAR(200) NOT NULL,
   endereco_gravadora VARCHAR(400) NOT NULL,
   contato VARCHAR(250) NOT NULL,
   url VARCHAR(100),
   --restrição (constraint) para chave-primária:
   CONSTRAINT pk_gravadora PRIMARY KEY (id)
);

--criando a tabela cd:
CREATE TABLE cd (
   id SERIAL NOT NULL,
   nome_cd VARCHAR(200) NOT NULL,
   preco_venda DECIMAL(10,2) NOT NULL,
   data_lancamento DATE NOT NULL,
   gravadora_id INT NOT NULL,
   cd_indicado INT NULL,
   CONSTRAINT pk_cd PRIMARY KEY (id)
);

--adicionando chaves estrangeiras da tabela cd:
ALTER TABLE cd 
   ADD CONSTRAINT fk_gravadora 
      FOREIGN KEY (gravadora_id) REFERENCES gravadora(id),
   ADD CONSTRAINT fk_cd
      FOREIGN KEY (cd_indicado) REFERENCES cd(id);

--criar a tabela musica:
create table musica (
   --colunas:
   id SERIAL not null , 
   nome_musica varchar(45) , 
   duracao decimal(6,2) , 
   constraint pk_musica primary key (id)
);

--criar a tabela item_cd
create table item_cd (
   cd_id int not null , 
   musica_id int not null , 
   numero_faixa int not null , 
   constraint pk_item_cd 
	primary key (cd_id , musica_id)
);
--relacionamentos n:m da tab musica e cd:
alter table item_cd
   add constraint fk_cd foreign key (cd_id)
      references cd(id) , 
   add constraint fk_musica foreign key (musica_id)
      references musica(id);

--criar a tabela autor
create table autor (
   --colunas:
   id SERIAL not null ,
   nome_autor varchar(200) , 
   constraint pk_id primary key (id)
);

--criar a tabela musica_autor:
create table musica_autor (
   musica_id int not null , 
   autor_id  int not null ,
   --chave-primária composta:
   constraint pk_musica_autor primary key 
      (musica_id, autor_id) , 
   --chaves estrangeiras:
   constraint fk_musica foreign key (musica_id)
      references musica(id) , 
   constraint fk_autor foreign key (autor_id)
      references autor(id)
);

--criar a tabela cd_categoria:
create table cd_categoria (
   id SERIAL not null , 
   menor_preco decimal(10,2) not null , 
   maior_preco decimal(10,2) not null ,
   constraint pk_categoria primary key (id)
);


