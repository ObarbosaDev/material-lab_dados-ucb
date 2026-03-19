describe livro;
show tables;

alter TABLE livro
modify status_leitura boolean default (0);

/* Adiciona restrição de valor entre 0 e 1 */
alter table livro
add constraint check_status_livro
check (status_leitura IN (0, 1));


/* REMOVE UMA COLUNA DA TABELA */ 
alter table livro
drop column status_leitura;

/* 
	Adiciona uma coluna ID como chave estrangeira e cria
    restrição de referência e define o comportamento de
    exclusão/delete
*/

alter table livro
add column id_usuario INT,
add	constraint fk_livro_usuario
foreign key (id_usuario)
references usuario(id_usuario);