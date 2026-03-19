CREATE TABLE livro(
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    sinopse TEXT NOT NULL,
    autor VARCHAR(128) NOT NULL,
    editora VARCHAR(128) NOT NULL,
    categoria VARCHAR(128) NOT NULL,
    ano_publicacao YEAR NOT NULL,
    estoque INT NOT NULL DEFAULT 0 CHECK (estoque >= 0) -- Nova coluna
);