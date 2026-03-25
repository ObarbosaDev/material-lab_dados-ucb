-- Atualiza a estrutura da tabela usuario para a nova versao do modelo.

-- Primeiro, altera data_cadastro para TIMESTAMP.
-- TIMESTAMP e util quando queremos guardar data e hora.
ALTER TABLE usuario
    MODIFY COLUMN data_cadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- Depois, adiciona a coluna data_atualizacao.
-- Ela pode ser atualizada sempre que o registro do usuario mudar.
ALTER TABLE usuario
    ADD COLUMN data_atualizacao TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;
