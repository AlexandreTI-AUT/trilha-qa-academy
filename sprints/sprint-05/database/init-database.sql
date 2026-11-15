-- ============================================================================
-- TRILHA QA ACADEMY - SPRINT 05: SQL E BANCO DE DADOS PARA QA
-- Script de inicialização do banco local (SQLite)
-- ============================================================================
-- 1. Limpeza preventiva
DROP TABLE IF EXISTS usuarios;

DROP TABLE IF EXISTS perfis;

-- 2. Criação da tabela auxiliar de perfis
CREATE TABLE perfis (
    id          INT  PRIMARY KEY,
    nome_perfil TEXT NOT NULL UNIQUE
);

-- 3. Carga inicial dos perfis base
INSERT  INTO perfis (
    id,
    nome_perfil
)
VALUES              (1, 'Administrador'),
                    (2, 'Cliente');

-- 4. Criação da tabela principal de usuários
CREATE TABLE usuarios (
    id            TEXT     PRIMARY KEY,
    nome          TEXT     NOT NULL,
    email         TEXT     NOT NULL UNIQUE,
    password      TEXT     NOT NULL,
    administrador TEXT     NOT NULL CHECK (administrador IN ('true', 'false')),
    perfil_id     INT     ,
    criado_em     DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (perfil_id) REFERENCES perfis (id)
);

-- 5. Carga inicial de massa de dados para testes
INSERT  INTO usuarios (
    id,
    nome,
    email,
    password,
    administrador,
    perfil_id
)
VALUES                ('0uxT84nW8D2wWZp1', 'Fulano da Silva', 'fulano@qa.com', 'teste123', 'true', 1),
                      ('1ayU95oX9E3xXAq2', 'Ciclano de Souza', 'ciclano@qa.com', 'teste456', 'false', 2),
                      ('2bzV06pY0F4yYBr3', 'Beltrano Oliveira', 'beltrano@qa.com', 'teste789', 'false', 2);