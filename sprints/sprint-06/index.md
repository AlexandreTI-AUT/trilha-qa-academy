![Banner Trilha QA Academy](../../assets/images/banner-site.jpg)

# 🚀 Sprint 06: Versionamento com Git e GitHub para QA

Nesta sprint, você aprenderá a gerenciar, rastrear e colaborar em projetos de automação de testes, documentações técnicas e planos de testes utilizando **Git** e **GitHub** de forma estruturada e profissional.

---

## 🎯 Objetivos da Sprint

- Compreender que **versionamento não se limita a código-fonte** (aplicando-o em planos de teste, cenários BDD/Gherkin, massas de dados JSON/CSV e evidências).
- Diferenciar claramente o **Git** (sistema local de controle de versão) do **GitHub** (plataforma na nuvem para hospedagem e colaboração).
- Instalar o **Git**, configurar **obrigatoriamente suas credenciais globais (`user.name` e `user.email`)** e criar/autenticar sua conta no **GitHub**.
- Compreender a função essencial dos arquivos **`README.md`** e **`.gitignore`** em qualquer projeto de QA.
- Seguir o fluxo real de trabalho: **criar repositório no GitHub ──► clonar localmente ──► inspecionar (`status`), preparar (`add`), gravar (`commit`) e sincronizar (`push` / `pull`)**.
- Trabalhar em equipe com **Branches**, **Pull Requests (PR)** e saber **identificar e resolver conflitos (`Merge Conflict`)**.
- Entregar um **Projeto Prático** criando seu próprio repositório estruturado com `README.md` profissional.

---

## 📚 Conteúdo Programático

### 📖 Módulo 1: Fundamentos de Versionamento, Git vs. GitHub, Instalação e Credenciais

#### 1. Teoria: Versionamento Além do Código e Diferença entre Git e GitHub

##### 🔹 Versionamento não é somente para código!

No dia a dia de Quality Assurance (QA), o controle de versão elimina arquivos perdidos com nomes como `plano_de_testes_final_v2_agora_vai.md` ou `massa_dados_antiga.json`. Um QA versiona:

- **Documentação de Testes:** Planos de teste, estratégias, relatórios e checklists em Markdown (`.md`).
- **Especificações BDD:** Arquivos `.feature` escritos em Gherkin.
- **Massas de Dados e Contratos:** Arquivos `.json`, `.csv`, `.sql` e coleções de API (Postman).
- **Scripts de Automação:** Projetos em Playwright, Cypress, K6 e pipelines de CI/CD.

##### 🔹 Qual a diferença entre Git e GitHub?

| Critério             | **Git**                                                                                            | **GitHub**                                                                                                           |
| :------------------- | :------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------- |
| **O que é?**         | Sistema de Controle de Versão Distribuído (DVCS) instalado na sua máquina.                         | Plataforma web na nuvem para hospedar repositórios Git e colaborar em equipe.                                        |
| **Onde roda?**       | Localmente (via Terminal / VS Code), sem depender de internet para salvar histórico.               | Na nuvem (via navegador), exigindo internet para sincronizar alterações.                                             |
| **Função Principal** | Registrar o histórico de alterações (`commits`), criar ramificações (`branches`) e desfazer erros. | Compartilhar projetos, revisar alterações (`Pull Requests`), gerenciar tarefas e rodar pipelines (`GitHub Actions`). |

---

#### 2. Guias de Instalação (PDFs) e Configuração Obrigatória de Credenciais

Antes de iniciar qualquer comando, baixe o guia do seu sistema operacional e o guia de configuração do GitHub:

- 📄 <a href="./Guia de Instalação do Git no Windows.pdf" download><strong>Guia de Instalação do Git no Windows (PDF)</strong></a>
- 📄 <a href="./Guia de Instalação do Git no macOS.pdf" download><strong>Guia de Instalação do Git no macOS (PDF)</strong></a>
- 📄 <a href="./Guia de Instalação do Git no Linux.pdf" download><strong>Guia de Instalação do Git no Linux (PDF)</strong></a>
- 📄 <a href="./Guia de Criação e Configuração do GitHub.pdf" download><strong>Guia de Criação e Configuração do GitHub (PDF)</strong></a>

##### ⚠️ Passo Obrigatório: Configurar Nome e E-mail (Credenciais Locais)

**Teoria:** Todo registro de alteração (`commit`) no Git carrega a assinatura de quem o criou. Se você não configurar seu nome e e-mail logo após instalar o Git, ele bloqueará seus commits. **Dica importante:** use exatamente o **mesmo e-mail cadastrado na sua conta do GitHub** para que suas contribuições apareçam vinculadas ao seu perfil.

| Exemplo 1.1: Configurar e validar nome e e-mail globais no Git                                                                                                                                                                                                                                                                                           |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `# 1. Definir seu nome completo (aparecerá no histórico de commits)`<br>`git config --global user.name "Seu Nome Completo"`<br><br>`# 2. Definir o mesmo e-mail cadastrado na sua conta do GitHub`<br>`git config --global user.email "seu.email@exemplo.com"`<br><br>`# 3. Conferir se as credenciais foram salvas corretamente`<br>`git config --list` |

📹 **Assista à aula teórica e configuração do Módulo 1:**
<br>

> _(Espaço reservado para o link e thumbnail da vídeo-aula do Módulo 1)_

---

### 📖 Módulo 2: Criando o Repositório (`README.md` e `.gitignore`) e Clonando (`git clone`)

#### 1. Entendendo os Arquivos Essenciais: `README.md` e `.gitignore`

##### 🔹 O que é o `README.md`?

**Teoria:** É o arquivo de apresentação (a "vitrine") do seu repositório. Assim que alguém abre seu projeto no GitHub — seja um colega de time ou um recrutador técnico — o conteúdo do `README.md` é renderizado automaticamente na página principal. Nele documentamos o objetivo do projeto, ferramentas utilizadas, pré-requisitos e como executar os testes.

##### 🔹 O que é o `.gitignore`?

**Teoria:** É um arquivo de configuração oculto que diz ao Git **quais pastas e arquivos devem ser ignorados** e nunca enviados para o GitHub. Em projetos de QA, usamos o `.gitignore` para bloquear:

- Dependências pesadas que podem ser reinstaladas (`node_modules/`).
- Arquivos sensíveis com senhas, tokens ou chaves de API (`.env`).
- Relatórios temporários gerados a cada execução (`playwright-report/`, `cypress/videos/`, `allure-results/`).
- Arquivos de sistema operacional (`.DS_Store` no macOS ou `Thumbs.db` no Windows).

| Exemplo 2.1: Estrutura padrão de um arquivo `.gitignore` para projetos de QA                                                                                                                                                                                                                             |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `# Dependências`<br>`node_modules/`<br><br>`# Variáveis de ambiente e segredos`<br>`.env`<br><br>`# Relatórios e evidências temporárias de execução`<br>`playwright-report/`<br>`test-results/`<br>`cypress/videos/`<br>`cypress/screenshots/`<br><br>`# Arquivos do sistema operacional`<br>`.DS_Store` |

---

#### 2. Passo 1 — Criar o Repositório Remoto no GitHub (`New Repository`)

**Passo a passo prático no navegador:**

1. Acesse [github.com](https://github.com) e faça login.
2. Clique no botão verde **`New`** (ou **`+`** no canto superior direito ──► **`New repository`**).
3. Em **Repository name**, digite: `trilha-qa-academy-git`.
4. Mantenha a visibilidade marcada como **Public**.
5. Marque a caixa **`Add a README file`** (isso cria a branch principal `main` automaticamente).
6. Em **Add .gitignore**, você pode selecionar `Node` ou criá-lo manualmente no VS Code.
7. Clique em **`Create repository`** e copie a URL HTTPS do repositório.

---

#### 3. Passo 2 — Clonar o Repositório para a Máquina (`git clone`)

**Teoria:** O comando `git clone` baixa uma cópia completa do repositório remoto do GitHub para uma pasta no seu computador, trazendo todos os arquivos (`README.md`, `.gitignore`), o histórico e já deixando o vínculo remoto (`origin`) configurado.

| Exemplo 2.2: Clonar o repositório recém-criado e inspecionar com `git status`                                                                                                                                                                                                                                                                                                            |
| :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `# 1. Entrar na pasta onde você guarda seus projetos`<br>`cd ~/Documents`<br><br>`# 2. Clonar o repositório criado no GitHub`<br>`git clone https://github.com/seu-usuario/trilha-qa-academy-git.git`<br><br>`# 3. Entrar na pasta clonada e abrir no VS Code`<br>`cd trilha-qa-academy-git`<br>`code .`<br><br>`# 4. Verificar o estado inicial do repositório clonado`<br>`git status` |

📹 **Assista à aula prática sobre o Módulo 2:**
<br>

> _(Espaço reservado para o link e thumbnail da vídeo-aula do Módulo 2)_

---

### 📖 Módulo 3: Ciclo Diário de Trabalho — `status`, `add`, `commit`, `push` e `pull`

Para trabalhar com segurança no dia a dia, o Git organiza suas alterações em **três etapas locais** antes de enviá-las para a nuvem:

1. **Working Directory (Diretório de Trabalho):** Onde você cria ou edita seus arquivos no VS Code.
2. **Staging Area (Área de Preparação):** Onde você seleciona quais arquivos alterados entrarão no próximo pacote de histórico.
3. **Local Repository (Repositório Local):** Onde o pacote fica salvo definitivamente no histórico da sua máquina.

---

#### 1. `git status` — Seu radar de segurança em todas as etapas

**Teoria:** O comando `git status` mostra em tempo real em qual branch você está e quais arquivos estão **não rastreados** (_Untracked_, em vermelho), **modificados** (_Modified_, em vermelho) ou **prontos para o commit** (_Staged_, em verde). Crie o hábito de rodar `git status` antes e depois de cada comando!

| Exemplo 3.1: Inspecionar o estado do repositório no terminal                 |
| :--------------------------------------------------------------------------- |
| `# Verifica o estado atual dos arquivos na pasta do projeto`<br>`git status` |

---

#### 2. `git add` — Preparar arquivos na Staging Area

**Teoria:** Seleciona os arquivos novos ou modificados que você quer incluir no próximo pacote de histórico. Arquivos listados no `.gitignore` não são adicionados.

| Exemplo 3.2: Adicionar arquivos e confirmar com `git status`                                                                                                                                                                                                                              |
| :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `# Adicionar um arquivo específico (ex: o arquivo .gitignore ou plano de testes)`<br>`git add .gitignore`<br><br>`# Ou adicionar todos os arquivos criados/modificados de uma vez`<br>`git add .`<br><br>`# Conferir se os arquivos ficaram verdes (prontos para commit)`<br>`git status` |

---

#### 3. `git commit` — Gravar o pacote de alterações no histórico local

**Teoria:** Cria um ponto de restauração definitivo no histórico local do Git com tudo o que estava preparado na Staging Area, assinado com o `user.name` e `user.email` que você configurou no Módulo 1.

| Exemplo 3.3: Registrar o commit e conferir que a árvore ficou limpa                                                                                                                                                              |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `# Gravar o histórico localmente com mensagem descritiva`<br>`git commit -m "docs: adiciona .gitignore e plano de testes de login"`<br><br>`# Conferir com git status ("nothing to commit, working tree clean")`<br>`git status` |

---

#### 4. `git push` e `git pull` — Sincronizar com o GitHub

**Teoria:**

- **`git push`:** Envia os commits salvos na sua máquina para o GitHub.
- **`git pull`:** Baixa as atualizações que outros integrantes do time enviaram para o GitHub, mantendo sua máquina atualizada antes de começar uma nova tarefa.

| Exemplo 3.4: Sincronizar alterações entre máquina local e GitHub                                                                                                                                                                                                                            |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `# 1. Sempre antes de iniciar uma tarefa, baixar novidades do GitHub`<br>`git pull origin main`<br><br>`# 2. Após realizar seus commits locais, enviar para o GitHub`<br>`git push origin main`<br><br>`# 3. Verificar se a branch local está sincronizada com origin/main`<br>`git status` |

📹 **Assista à aula prática sobre o Módulo 3:**
<br>

> _(Espaço reservado para o link e thumbnail da vídeo-aula do Módulo 3)_

---

### 📖 Módulo 4: Branches, Pull Requests (PR) e Resolução de Conflitos

#### 1. `git checkout -b` e `git branch` — Trabalhando em Branches Isoladas

**Teoria:** Em times ágeis, **nunca** alteramos arquivos diretamente na `main`. Criamos uma **Branch** paralela para cada tarefa, subimos para o GitHub e abrimos um **Pull Request (PR)** para revisão antes de mesclar (`Merge`).

| Exemplo 4.1: Criar branch, commitar alterações e enviar para abrir PR                                                                                                                                                                                                                                                                                                              |
| :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `# 1. Criar e entrar na nova branch de trabalho`<br>`git checkout -b feat/cenarios-login-bdd`<br><br>`# 2. Confirmar a branch ativa com git status`<br>`git status`<br><br>`# 3. Após criar/editar os arquivos, preparar, commitar e enviar`<br>`git add .`<br>`git commit -m "test: adiciona cenarios BDD de validacao de login"`<br>`git push -u origin feat/cenarios-login-bdd` |

---

#### 2. Como Identificar e Resolver Conflitos (`Merge Conflict`)

**Teoria:** Um **conflito** acontece quando duas pessoas (ou duas branches diferentes) alteram **exatamente a mesma linha do mesmo arquivo** e tentam unir essas alterações (`git pull` ou `Merge` de PR). O Git não adivinha qual versão deve prevalecer — ele pausa a operação e marca o arquivo para você decidir.

| Como o Git exibe um conflito dentro do arquivo (`login.feature`)                                                                                                                                                              |
| :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `<<<<<<< HEAD (Sua alteração local)`<br>`Cenário: Validar login com e-mail e senha obrigatórios`<br>`=======`<br>`Cenário: Validar autenticação com credenciais válidas`<br>`>>>>>>> origin/main (Alteração vinda do GitHub)` |

##### 🔹 Passo a passo para resolver o conflito no VS Code:

1. Rode **`git status`** para identificar exatamente quais arquivos estão marcados em vermelho como **`both modified`**.
2. Abra o arquivo no **VS Code**: ele exibirá botões visuais acima do conflito:
   - **`Accept Current Change`:** Mantém apenas a sua versão local (`HEAD`).
   - **`Accept Incoming Change`:** Mantém apenas a versão vinda do remoto (`origin/main`).
   - **`Accept Both Changes`:** Mantém as duas linhas.
3. Ou edite o texto manualmente, **apagando obrigatoriamente** os marcadores `<<<<<<<`, `=======` e `>>>>>>>`.
4. Salve o arquivo (`Cmd + S` / `Ctrl + S`) e finalize a resolução com `add`, `commit` e `push`:

| Exemplo 4.2: Finalizar a resolução de um conflito no terminal                                                                                                                                                                                                                                                                                          |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `# 1. Conferir o arquivo em conflito (both modified)`<br>`git status`<br><br>`# 2. Após resolver no VS Code e salvar, marcar como resolvido`<br>`git add login.feature`<br><br>`# 3. Registrar o commit de resolução do conflito e enviar`<br>`git commit -m "fix: resolve conflito no cenario de login"`<br>`git push origin feat/cenarios-login-bdd` |

📹 **Assista à aula prática sobre o Módulo 4:**
<br>

> _(Espaço reservado para o link e thumbnail da vídeo-aula do Módulo 4)_

---

### 🏆 Módulo 5: Projeto Prático — Criando seu Repositório de Portfólio QA com `README.md`

#### Objetivo do Projeto

Consolidar todo o aprendizado da Sprint 06 criando do zero um repositório público no GitHub que servirá como seu **portfólio profissional de Quality Assurance**, estruturado com boas práticas de documentação (`README.md`), proteção de arquivos (`.gitignore`) e fluxo de `branch` + `Pull Request`.

#### 📋 Requisitos Obrigatórios de Entrega

1. **Criação no GitHub:** Criar um novo repositório público chamado **`qa-portfolio-testes`** inicializado com `README.md`.
2. **Clonagem e Credenciais:** Clonar o repositório localmente (`git clone`) e validar com `git config --list` e `git status`.
3. **Configuração do `.gitignore`:** Criar um arquivo `.gitignore` na raiz ignorando `.env`, `node_modules/`, pastas de relatórios e `.DS_Store`.
4. **Estrutura de Pastas de QA:** Criar a seguinte organização no projeto:
   - `qa-portfolio-testes/`
     - `.gitignore`
     - `README.md`
     - `docs/plano-de-testes-login.md`
     - `features/autenticacao.feature`
5. **Documentação Profissional no `README.md`:** Editar o `README.md` contendo:
   - Título e descrição clara do objetivo do repositório.
   - Tecnologias e ferramentas utilizadas (Markdown, Gherkin/BDD, Git, GitHub).
   - Estrutura de pastas explicada.
   - Autor (seu nome e link do seu LinkedIn).
6. **Fluxo Profissional (Branch + PR):** Realizar as alterações em uma branch chamada **`docs/estrutura-inicial-portfolio`**, subir para o GitHub (`git push`) e abrir um **Pull Request** realizando o **Merge** para a `main`.

| Exemplo 5.1: Template pronto para o `README.md` do Projeto Prático                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `# 🧪 Portfólio de Quality Assurance (QA)`<br><br>`Repositório dedicado à documentação de planos de testes, cenários escritos em BDD (Gherkin) e boas práticas de engenharia de qualidade.`<br><br>`## 🛠️ Tecnologias e Ferramentas`<br>`* **Controle de Versão:** Git & GitHub`<br>`* **Especificação:** BDD / Gherkin`<br>`* **Documentação:** Markdown`<br><br>`## 📂 Estrutura do Projeto`<br>`* docs/ — Planos de testes e checklists funcionais.`<br>`* features/ — Cenários de comportamento em Gherkin.`<br><br>`## 👨‍💻 Autor`<br>`Desenvolvido por **[Seu Nome]** durante a **Trilha QA Academy**.` |
