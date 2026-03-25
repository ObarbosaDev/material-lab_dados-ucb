-- Atualiza a tabela livro conforme o novo modelo de dados.

-- Remove colunas antigas que agora serao controladas por chaves estrangeiras.
ALTER TABLE livro
    DROP COLUMN autor,
    DROP COLUMN editora,
    DROP COLUMN categoria;

-- Adiciona colunas novas para auditoria e relacionamento.
ALTER TABLE livro
    ADD COLUMN data_cadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ADD COLUMN data_atualizacao TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    -- id_usuario liga o livro ao usuario dono do registro.
    ADD COLUMN id_usuario INT NOT NULL,
    -- id_autor aponta para a tabela autor.
    ADD COLUMN id_autor INT NOT NULL,
    -- id_editora aponta para a tabela editora.
    ADD COLUMN id_editora INT NOT NULL,
    -- id_categoria aponta para a tabela categoria.
    ADD COLUMN id_categoria INT NOT NULL;

-- Cria a relacao com usuario.
-- ON DELETE CASCADE faz com que, ao excluir um usuario,
-- todos os livros dele tambem sejam excluidos.
ALTER TABLE livro
    ADD CONSTRAINT fk_livro_usuario
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
    ON DELETE CASCADE;

-- Cria a relacao com autor.
-- ON DELETE RESTRICT impede excluir autor que esteja em uso.
ALTER TABLE livro
    ADD CONSTRAINT fk_livro_autor
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
    ON DELETE RESTRICT;

-- Cria a relacao com editora.
-- ON DELETE RESTRICT impede excluir editora com livros vinculados.
ALTER TABLE livro
    ADD CONSTRAINT fk_livro_editora
    FOREIGN KEY (id_editora) REFERENCES editora(id_editora)
    ON DELETE RESTRICT;

-- Cria a relacao com categoria.
-- ON DELETE RESTRICT impede excluir categoria usada por algum livro.
ALTER TABLE livro
    ADD CONSTRAINT fk_livro_categoria
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
    ON DELETE RESTRICT;
