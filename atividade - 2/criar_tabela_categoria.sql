-- Cria a tabela de categorias.
-- Assim a categoria deixa de ser texto solto e passa a ser controlada.
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    -- Campo obrigatorio.
    nome VARCHAR(255) NOT NULL,
    -- UNIQUE impede nomes repetidos.
    CONSTRAINT uk_categoria_nome UNIQUE (nome)
);

-- A regra para impedir exclusao de categoria usada em livros
-- sera atendida pela chave estrangeira na tabela livro.
