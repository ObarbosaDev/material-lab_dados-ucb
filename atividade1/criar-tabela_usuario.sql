DROP DATABASE IF EXISTS biblioteca_pessoal_ads2026;
CREATE DATABASE biblioteca_pessoal_ads2026;
USE biblioteca_pessoal_ads2026;

-- Tabela de Usuários com Senha e Status
CREATE TABLE usuario(
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(128) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL, -- Espaço para Hash de segurança
    ativo TINYINT(1) DEFAULT 1,  -- 1 para Ativo, 0 para Inativo
    data_cadastro DATE DEFAULT (CURRENT_DATE) NOT NULL
);