---------
-- DCL --
---------

--a) Sentença para criar o grupo de usuários 
--“analistas_noite” no SGBD:
create group analistas_noite;
--b) Sentença para criar o usuário “maria2” 
--no grupo “analistas_noite” no SGBD e a 
--senha “123456”:
create user maria2
encrypted password '123456'
createdb createuser
in group analistas_noite;
--c) Sentença para permitir que o usuário 
--“maria2” possa fazer somente extração 
--de dados nas tabelas gravadora e cd.
grant select 
on gravadora, cd
to maria2;
--d) Sentença para retirar permissão de 
--remoção de dados das tabelas autor, 
--musica_autor, musica do usuário “maria2”.
revoke delete
on autor, musica_autor, musica
from maria2;

--testes:
delete from musica








