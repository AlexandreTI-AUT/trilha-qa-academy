-- ============================================================
-- TRILHA QA ACADEMY - SPRINT 05: CONSULTAS DE VALIDAÇÃO
-- Arquivo: sprints/sprint-05/scripts/queries.sql
-- ============================================================
-- 1. Buscar usuário específico por e-mail (Validação de Persistência)
SELECT id,
       nome,
       email,
       administrador,
       criado_em
FROM   usuarios
WHERE  email = 'fulano@qa.com';

-- 2. Listar todos os usuários ordenados por data de criação
SELECT   *
FROM     usuarios
ORDER BY criado_em DESC;