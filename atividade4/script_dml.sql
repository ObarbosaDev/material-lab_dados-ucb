-- Atividade 4 - INSERT, UPDATE, DELETE e SELECT
-- Script DML para o banco criado na atividade 3.

USE biblioteca_pessoal;

-- =========================================================
-- CARGA INICIAL
-- =========================================================

INSERT INTO usuario (nome, email) VALUES
('Matheus Barbosa', 'matheus.barbosa@email.com'),
('Ana Souza', 'ana.souza@email.com');

INSERT INTO autor (nome) VALUES
('J.K. Rowling'),
('Jostein Gaarder'),
('George Orwell'),
('Machado de Assis');

INSERT INTO editora (nome) VALUES
('Rocco'),
('Companhia das Letras'),
('Principis'),
('Penguin Companhia');

INSERT INTO categoria (nome) VALUES
('Fantasia'),
('Filosofia'),
('Ficcao'),
('Literatura Brasileira');

INSERT INTO livro (
    titulo,
    sinopse,
    ano_publicacao,
    id_usuario,
    id_autor,
    id_editora,
    id_categoria
) VALUES
(
    'Harry Potter e a Pedra Filosofal',
    'Um jovem descobre que e bruxo e inicia seus estudos em Hogwarts.',
    1997,
    (SELECT id_usuario FROM usuario WHERE email = 'matheus.barbosa@email.com'),
    (SELECT id_autor FROM autor WHERE nome = 'J.K. Rowling'),
    (SELECT id_editora FROM editora WHERE nome = 'Rocco'),
    (SELECT id_categoria FROM categoria WHERE nome = 'Fantasia')
),
(
    'Harry Potter e a Camara Secreta',
    'Harry retorna para seu segundo ano em Hogwarts e enfrenta um novo misterio.',
    1998,
    (SELECT id_usuario FROM usuario WHERE email = 'matheus.barbosa@email.com'),
    (SELECT id_autor FROM autor WHERE nome = 'J.K. Rowling'),
    (SELECT id_editora FROM editora WHERE nome = 'Rocco'),
    (SELECT id_categoria FROM categoria WHERE nome = 'Fantasia')
),
(
    'O Mundo de Sofia',
    'Uma jovem recebe cartas misteriosas que apresentam a historia da filosofia.',
    1991,
    (SELECT id_usuario FROM usuario WHERE email = 'ana.souza@email.com'),
    (SELECT id_autor FROM autor WHERE nome = 'Jostein Gaarder'),
    (SELECT id_editora FROM editora WHERE nome = 'Companhia das Letras'),
    (SELECT id_categoria FROM categoria WHERE nome = 'Filosofia')
),
(
    '1984',
    'Uma sociedade distopica e controlada por vigilancia e manipulacao da informacao.',
    1949,
    (SELECT id_usuario FROM usuario WHERE email = 'ana.souza@email.com'),
    (SELECT id_autor FROM autor WHERE nome = 'George Orwell'),
    (SELECT id_editora FROM editora WHERE nome = 'Principis'),
    (SELECT id_categoria FROM categoria WHERE nome = 'Ficcao')
),
(
    'Memorias Postumas de Bras Cubas',
    'Um narrador defunto relembra sua vida com ironia e critica social.',
    1881,
    (SELECT id_usuario FROM usuario WHERE email = 'matheus.barbosa@email.com'),
    (SELECT id_autor FROM autor WHERE nome = 'Machado de Assis'),
    (SELECT id_editora FROM editora WHERE nome = 'Penguin Companhia'),
    (SELECT id_categoria FROM categoria WHERE nome = 'Literatura Brasileira')
);

-- =========================================================
-- SELECT: todos os livros da autora J.K. Rowling
-- =========================================================

SELECT
    l.id_livro,
    l.titulo,
    l.sinopse,
    l.ano_publicacao,
    a.nome AS autor,
    e.nome AS editora,
    c.nome AS categoria
FROM livro l
INNER JOIN autor a ON a.id_autor = l.id_autor
INNER JOIN editora e ON e.id_editora = l.id_editora
INNER JOIN categoria c ON c.id_categoria = l.id_categoria
WHERE a.nome = 'J.K. Rowling';

-- =========================================================
-- SELECT: todos os livros da categoria Filosofia
-- =========================================================

SELECT
    l.id_livro,
    l.titulo,
    l.sinopse,
    l.ano_publicacao,
    a.nome AS autor,
    e.nome AS editora,
    c.nome AS categoria
FROM livro l
INNER JOIN autor a ON a.id_autor = l.id_autor
INNER JOIN editora e ON e.id_editora = l.id_editora
INNER JOIN categoria c ON c.id_categoria = l.id_categoria
WHERE c.nome = 'Filosofia';

-- =========================================================
-- UPDATE: altera o nome da categoria Filosofia para Censurado
-- =========================================================

UPDATE categoria
SET nome = 'Censurado'
WHERE nome = 'Filosofia';

-- =========================================================
-- DELETE: deleta todos os livros da categoria Censurado
-- =========================================================

DELETE l
FROM livro l
INNER JOIN categoria c ON c.id_categoria = l.id_categoria
WHERE c.nome = 'Censurado';
