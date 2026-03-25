-- Cria a tabela de editoras.
-- O objetivo e guardar a editora em uma tabela propria.
CREATE TABLE editora (
    id_editora INT AUTO_INCREMENT PRIMARY KEY,
    -- O nome nao pode ficar vazio.
    nome VARCHAR(255) NOT NULL,
    -- UNIQUE garante que nao exista editora duplicada.
    CONSTRAINT uk_editora_nome UNIQUE (nome)
);

-- A protecao contra exclusao de editora com livro vinculado
-- sera aplicada pela chave estrangeira criada na tabela livro.
