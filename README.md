# Material Lab Dados UCB

Repositorio com as atividades da disciplina de Laboratorio de Banco de Dados.

Autor: Matheus Barbosa

O objetivo deste repositorio e organizar os scripts SQL desenvolvidos ao longo das atividades da materia, de forma simples e separada por pasta.

## Estrutura do repositorio

### Atividade 1
Pasta: `atividade - 1`

Arquivos:
- `criar_tabela_usuario.sql`
- `criar_tabela_livro.sql`

Descricao:
- contem os scripts iniciais de criacao das tabelas `usuario` e `livro`.

### Atividade 2
Pasta: `atividade - 2`

Arquivos:
- `criar_tabela_autor.sql`
- `criar_tabela_editora.sql`
- `criar_tabela_categoria.sql`
- `alterar_tabela_usuario.sql`
- `alterar_tabela_livro.sql`

Descricao:
- contem a evolucao do modelo de dados;
- adiciona as tabelas `autor`, `editora` e `categoria`;
- altera a tabela `usuario`;
- altera a tabela `livro` para trabalhar com chaves estrangeiras.

### Atividade 3
Pasta: `atividade - 3`

Arquivo:
- `script_bd_biblioteca_pessoal_v1.sql`

Descricao:
- contem um script completo para criar o banco de dados `biblioteca_pessoal`;
- cria todas as tabelas e relacionamentos do modelo final;
- aplica as restricoes pedidas no enunciado.

## Banco utilizado

Os scripts foram escritos pensando em MySQL, usando recursos como:
- `AUTO_INCREMENT`
- `TIMESTAMP`
- `FOREIGN KEY`
- `ON DELETE CASCADE`
- `ON DELETE RESTRICT`

## Observacao

Os arquivos foram organizados de forma simples, com comentarios basicos, pensando em facilitar o estudo e a leitura do codigo SQL.
