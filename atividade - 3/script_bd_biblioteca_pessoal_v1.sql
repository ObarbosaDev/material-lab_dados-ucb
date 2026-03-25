-- Cria o banco de dados do projeto.
-- IF NOT EXISTS evita erro caso o banco ja exista.
CREATE DATABASE IF NOT EXISTS biblioteca_pessoal;

-- Seleciona o banco que sera usado nos comandos abaixo.
USE biblioteca_pessoal;

-- =========================================================
-- TABELA USUARIO
-- Guarda os dados das pessoas que usam a biblioteca pessoal.
-- =========================================================
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    -- O email nao pode repetir entre usuarios.
    email VARCHAR(128) NOT NULL,
    -- TIMESTAMP guarda data e hora do cadastro.
    data_cadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Atualiza automaticamente a data e hora quando o registro mudar.
    data_atualizacao TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT uk_usuario_email UNIQUE (email)
) ENGINE=InnoDB;

-- =========================================================
-- TABELA AUTOR
-- Separa os autores em uma tabela propria.
-- =========================================================
CREATE TABLE autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    -- O nome e obrigatorio.
    nome VARCHAR(255) NOT NULL,
    -- Nao permite autor duplicado.
    CONSTRAINT uk_autor_nome UNIQUE (nome)
) ENGINE=InnoDB;

-- =========================================================
-- TABELA EDITORA
-- Guarda as editoras dos livros.
-- =========================================================
CREATE TABLE editora (
    id_editora INT AUTO_INCREMENT PRIMARY KEY,
    -- O nome e obrigatorio.
    nome VARCHAR(255) NOT NULL,
    -- Nao permite editora com nome repetido.
    CONSTRAINT uk_editora_nome UNIQUE (nome)
) ENGINE=InnoDB;

-- =========================================================
-- TABELA CATEGORIA
-- Guarda as categorias dos livros.
-- =========================================================
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    -- O nome e obrigatorio.
    nome VARCHAR(255) NOT NULL,
    -- Nao permite categoria duplicada.
    CONSTRAINT uk_categoria_nome UNIQUE (nome)
) ENGINE=InnoDB;

-- =========================================================
-- TABELA LIVRO
-- Centraliza os dados do livro e faz os relacionamentos.
-- =========================================================
CREATE TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    sinopse TEXT NOT NULL,
    ano_publicacao YEAR NOT NULL,
    data_cadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Atualiza automaticamente quando os dados do livro forem alterados.
    data_atualizacao TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    -- Chaves estrangeiras.
    id_usuario INT NOT NULL,
    id_autor INT NOT NULL,
    id_editora INT NOT NULL,
    id_categoria INT NOT NULL,

    -- Se o usuario for excluido, os livros dele tambem serao excluidos.
    CONSTRAINT fk_livro_usuario
        FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
        ON DELETE CASCADE,

    -- Impede excluir autor que esteja vinculado a algum livro.
    CONSTRAINT fk_livro_autor
        FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
        ON DELETE RESTRICT,

    -- Impede excluir editora que esteja vinculada a algum livro.
    CONSTRAINT fk_livro_editora
        FOREIGN KEY (id_editora) REFERENCES editora(id_editora)
        ON DELETE RESTRICT,

    -- Impede excluir categoria que esteja vinculada a algum livro.
    CONSTRAINT fk_livro_categoria
        FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
        ON DELETE RESTRICT
) ENGINE=InnoDB;
