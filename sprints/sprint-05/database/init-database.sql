-- ============================================================
-- TRILHA QA ACADEMY - SPRINT 05: BANCO DE DADOS E SQL PARA QA
-- Script de Inicialização da Base Local (init-database.sql)
-- ============================================================
-- 1. Limpeza preventiva (Idempotência)
DROP TABLE IF EXISTS usuarios;

-- 2. Criação da tabela de usuários
CREATE TABLE usuarios (
    id            TEXT     PRIMARY KEY NOT NULL,
    nome          TEXT     NOT NULL,
    email         TEXT     NOT NULL UNIQUE,
    password      TEXT     NOT NULL,
    administrador TEXT     NOT NULL CHECK (administrador IN ('true', 'false')),
    criado_em     DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 3. Carga Inicial de Dados (Massa Pró-existente para Testes)
INSERT  INTO usuarios (
    id,
    nome,
    email,
    password,
    administrador
)
VALUES                ('0uxT84nW8D2wWZp1', 'Fulano da Silva', 'fulano@qa.com', 'teste123', 'true'),
                      ('9b1deb4d-3b7d-41', 'Ciclano de Souza', 'ciclano@qa.com', 'senha456', 'false'),
                      ('a7b2c3d4-e5f6-78', 'Beltrano dos Santos', 'beltrano@qa.com', 'admin789', 'true');