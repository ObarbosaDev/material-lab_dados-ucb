-- Cria a tabela de autores.
-- Essa tabela separa os autores do livro, evitando repetir texto em varios registros.
CREATE TABLE autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    -- O nome e obrigatorio.
    nome VARCHAR(255) NOT NULL,
    -- UNIQUE impede cadastrar o mesmo autor duas vezes.
    CONSTRAINT uk_autor_nome UNIQUE (nome)
);

-- Esta chave estrangeira sera criada na tabela livro.
-- Com ON DELETE RESTRICT, um autor com livros vinculados nao pode ser excluido.
