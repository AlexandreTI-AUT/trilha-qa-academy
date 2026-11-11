![Banner Trilha QA Academy](../../assets/images/banner-site.jpg)

# 🛢️ Sprint 05 — SQL e Banco de Dados para QA: Guia Prático de Validação

**Objetivo da Sprint:** Fornecer uma visão geral e prática sobre como o analista de testes utiliza o SQL no dia a dia para validar a persistência de dados. O foco principal é a execução de consultas (SELECT), inserções (INSERT) e atualizações (UPDATE), além de entender relacionamentos como INNER JOIN através de exemplos práticos no banco local.

> ℹ️ **Nota da Sprint:** Esta sprint **não terá projeto final**. Ela será composta por **atividades práticas orientadas** para fixação rápida dos comandos.

---

### 📚 Estrutura dos Módulos

- **Sprint 05: SQL e Banco de Dados para QA**
  - **Módulo 1:** Arquitetura de Persistência & Configuração do Banco Local (SQLite)
  - **Módulo 2:** Leitura e Validação de Dados com SELECT (WHERE, LIKE, ORDER BY)
  - **Módulo 3:** Manipulação de Dados para Testes com INSERT e UPDATE
  - **Módulo 4:** Relacionamentos e Consultas Multi-tabelas (INNER JOIN)

---

### 📖 Módulo 1: Arquitetura de Persistência & Configuração do Banco Local

#### 1. Teoria: Por que o QA precisa consultar o Banco de Dados?

Quando realizamos um teste via Interface (UI) ou API (Postman), a resposta do front-end ou o Status Code 201 Created indica que a aplicação processou a requisição. No entanto, para garantir que os dados não foram corrompidos ou perdidos, o QA consulta diretamente o banco de dados.

**Fluxo de Validação de Persistência:**

1. **Ação:** [ QA / Postman / UI ] ──(Dispara Ação)──► [ API / Backend ]
2. **Gravação:** [ API / Backend ] ──(Grava Registro)──► [ Banco de Dados ]
3. **Consulta:** [ QA / Postman / UI ] ──(Executa Query SQL)──► [ Banco de Dados ]
4. **Asserção:** [ Banco de Dados ] ──(Retorna Dados)──► [ QA / Validação de Contrato ]

---

#### 2. Configuração do Ambiente Local (SQLite)

Para que você não precise instalar um banco de dados pesado (como PostgreSQL ou MySQL), utilizaremos o **SQLite**. Ele funciona em um único arquivo local (`database.db`) de forma extremamente leve e nativa no macOS/Linux.

🎥 **Vídeo Explicativo:** Assista à vídeo-aula deste módulo para acompanhar o passo a passo de configuração do ambiente e a execução no terminal do VS Code.

##### 📂 Estrutura e Conteúdo dos Arquivos

Crie a estrutura de pastas na sua máquina e copie o código correspondente para cada arquivo indicado abaixo:

- **sprints/sprint-05/**
  - **database/**
    - `init-database.sql`
  - **scripts/**
    - `queries.sql`

| 📄 Conteúdo do arquivo: `sprints/sprint-05/database/init-database.sql`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-- 1. Limpeza preventiva` <br> **DROP TABLE IF EXISTS** perfis; <br> **DROP TABLE IF EXISTS** usuarios; <br><br> `-- 2. Tabela de Perfis (para exemplos de INNER JOIN)` <br> **CREATE TABLE** perfis ( <br> &nbsp;&nbsp;&nbsp;&nbsp;id **INTEGER PRIMARY KEY AUTOINCREMENT**, <br> &nbsp;&nbsp;&nbsp;&nbsp;nome_perfil **TEXT NOT NULL** <br> ); <br><br> `-- 3. Tabela de Usuários` <br> **CREATE TABLE** usuarios ( <br> &nbsp;&nbsp;&nbsp;&nbsp;id **TEXT PRIMARY KEY NOT NULL**, <br> &nbsp;&nbsp;&nbsp;&nbsp;nome **TEXT NOT NULL**, <br> &nbsp;&nbsp;&nbsp;&nbsp;email **TEXT NOT NULL UNIQUE**, <br> &nbsp;&nbsp;&nbsp;&nbsp;password **TEXT NOT NULL**, <br> &nbsp;&nbsp;&nbsp;&nbsp;administrador **TEXT NOT NULL CHECK** (administrador **IN** ('true', 'false')), <br> &nbsp;&nbsp;&nbsp;&nbsp;perfil_id **INTEGER**, <br> &nbsp;&nbsp;&nbsp;&nbsp;criado_em **DATETIME DEFAULT CURRENT_TIMESTAMP**, <br> &nbsp;&nbsp;&nbsp;&nbsp;**FOREIGN KEY** (perfil_id) **REFERENCES** perfis(id) <br> ); <br><br> `-- 4. Carga Inicial de Dados` <br> **INSERT INTO** perfis (id, nome_perfil) **VALUES** (1, 'Administrador'), (2, 'Cliente'); <br><br> **INSERT INTO** usuarios (id, nome, email, password, administrador, perfil_id) <br> **VALUES** <br> &nbsp;&nbsp;&nbsp;&nbsp;('0uxT84nW8D2wWZp1', 'Fulano da Silva', 'fulano@qa.com', 'teste123', 'true', 1), <br> &nbsp;&nbsp;&nbsp;&nbsp;('9b1deb4d-3b7d-41', 'Ciclano de Souza', 'ciclano@qa.com', 'senha456', 'false', 2); |

<br>

| 📄 Conteúdo inicial do arquivo: `sprints/sprint-05/scripts/queries.sql`                                                                                                                                                                                                           |
| :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-- ============================================================` <br> `-- TRILHA QA ACADEMY - SPRINT 05: CONSULTAS SQL DE TESTE` <br> `-- Arquivo reservado para execução e treino de queries no VS Code` <br> `-- ============================================================` |

---

##### 🚀 Comando para Gerar o Banco no Terminal do VS Code (macOS/Linux):

| Comando para Executar no Terminal                                               |
| :------------------------------------------------------------------------------ |
| `cd sprints/sprint-05/database/` <br> `sqlite3 database.db < init-database.sql` |

---

### 📖 Módulo 2: Leitura e Validação de Dados com SELECT

#### 1. Teoria

O comando SELECT é a principal ferramenta do QA. Ele permite filtrar registros por condições específicas, verificar ordenação e validar se o contrato da API reflete o estado do banco.

---

#### 2. Exemplos Práticos

| Exemplo 2.1: Validar se o usuário cadastrado existe no banco                                                                                                                  |
| :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-- Busca o usuário pelo e-mail cadastrado no teste` <br> **SELECT** id, nome, email, administrador, criado_em <br> **FROM** usuarios <br> **WHERE** email = 'fulano@qa.com'; |

<br>

| Exemplo 2.2: Filtrar registros com dados dinâmicos (LIKE)                                                                            |
| :----------------------------------------------------------------------------------------------------------------------------------- |
| `-- Buscar todos os e-mails com domínio @qa.com` <br> **SELECT** \* <br> **FROM** usuarios <br> **WHERE** email **LIKE** '%@qa.com'; |

<br>

| Exemplo 2.3: Verificar o último registro inserido (ORDER BY + LIMIT)                                                                   |
| :------------------------------------------------------------------------------------------------------------------------------------- |
| `-- Retornar o cadastro mais recente` <br> **SELECT** \* <br> **FROM** usuarios <br> **ORDER BY** criado_em **DESC** <br> **LIMIT** 1; |

<br>

🎥 **Vídeo Explicativo:** Assista à vídeo-aula deste módulo para acompanhar a explicação detalhada de cada comando SELECT e a execução em tempo real no VS Code.

---

#### 📝 Atividade Prática 01 (Módulo 2)

1. Abra o arquivo `sprints/sprint-05/scripts/queries.sql` no VS Code.
2. Escreva uma consulta para retornar apenas o nome e o email de todos os usuários onde administrador = 'true'.
3. Valide o resultado na aba Query Results da extensão SQLite.

---

### 📖 Módulo 3: Manipulação de Dados para Testes (INSERT e UPDATE)

#### 1. Teoria

Além de ler, o QA frequentemente precisa preparar massa de dados prévia via INSERT ou simular alteração de estado no banco via UPDATE (por exemplo, alterar um usuário para 'bloqueado' ou 'administrador' antes de testar a tela).

---

#### 2. Exemplos Práticos

| Exemplo 3.1: Inserir massa de teste direto no banco (INSERT)                                                                                                                                                                                           |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-- Criar um usuário manualmente para ser usado em um teste de Login` <br> **INSERT INTO** usuarios (id, nome, email, password, administrador, perfil_id) <br> **VALUES** ('usr-teste-003', 'Beltrano QA', 'beltrano@qa.com', 'senha789', 'false', 2); |

<br>

| Exemplo 3.2: Atualizar permissão de usuário (UPDATE)                                                                                                                             |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-- Alterar o perfil do usuário para administrador (true)` <br> **UPDATE** usuarios <br> **SET** administrador = 'true', perfil_id = 1 <br> **WHERE** email = 'beltrano@qa.com'; |

<br>

🎥 **Vídeo Explicativo:** Assista à vídeo-aula deste módulo para ver na prática a manipulação e criação de massa de testes via comandos SQL.

---

#### 📝 Atividade Prática 02 (Módulo 3)

1. Insira um novo usuário com a identificação `usr-atividade-04` e e-mail `teste.aula@qa.com`.
2. Em seguida, execute um UPDATE para alterar a senha desse usuário para 'novaSenha123'.
3. Confirme a alteração fazendo um SELECT filtrando por esse e-mail.

---

### 📖 Módulo 4: Relacionamentos e Consultas Multi-tabelas (INNER JOIN)

#### 1. Teoria

Em sistemas reais, os dados ficam divididos em tabelas relacionadas através de Chaves Estrangeiras (Foreign Keys). O INNER JOIN junta informações de duas ou mais tabelas relacionando suas chaves.

**Mapeamento de Relacionamento (usuarios ──► perfis):**

- Tabela `usuarios` (Coluna `perfil_id = 1`) ──► Relaciona com Tabela `perfis` (Coluna `id = 1`: Administrador)
- Tabela `usuarios` (Coluna `perfil_id = 2`) ──► Relaciona com Tabela `perfis` (Coluna `id = 2`: Cliente)

---

#### 2. Exemplo Prático com INNER JOIN

| Exemplo 4.1: Consultar o usuário exibindo o nome do seu perfil em vez de apenas o ID                                                                                                                                                                          |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `-- Junção entre a tabela usuarios e perfis` <br> **SELECT** u.id, u.nome **AS** nome_usuario, u.email, p.nome_perfil **AS** perfil <br> **FROM** usuarios u <br> **INNER JOIN** perfis p **ON** u.perfil_id = p.id <br> **WHERE** u.email = 'fulano@qa.com'; |

##### Resultado Esperado:

| id               | nome_usuario    | email         | perfil        |
| :--------------- | :-------------- | :------------ | :------------ |
| 0uxT84nW8D2wWZp1 | Fulano da Silva | fulano@qa.com | Administrador |

<br>

🎥 **Vídeo Explicativo:** Assista à vídeo-aula deste módulo para entender visualmente o funcionamento das Chaves Estrangeiras e do comando INNER JOIN.

---

#### 📝 Atividade Prática 03 (Módulo 4)

1. Execute a query de INNER JOIN acima no arquivo `sprints/sprint-05/scripts/queries.sql`.
2. Adicione uma nova consulta que traga todos os usuários associados ao perfil 'Cliente'.

---

### 🎯 Resumo da Sprint 05

- Sem projeto final complexo: Foco total em entender e executar consultas no VS Code.
- Ferramental leve: SQLite Viewer + extensão SQLite no VS Code.
- Comandos aprendidos: SELECT, INSERT, UPDATE e INNER JOIN.
- Competência de QA gerada: Capacidade de auditagem e validação da camada de persistência de dados.
