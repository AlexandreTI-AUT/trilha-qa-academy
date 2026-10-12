# 🚀 Sprint 01: Fundamentos de Quality Assurance & Mindset

**Duração:** 2 Semanas  
**Objetivo:** Compreender o papel estratégico da qualidade na engenharia de software e desenvolver a mentalidade preventiva (o verdadeiro diferencial de um QA de alto nível).

---

## 🗓️ Semana 1: O Papel da Qualidade e a Cultura Preventiva

### 📚 1. Teoria: Desmistificando QA, QC e Software Testing
É muito comum no mercado de TI que as pessoas usem esses termos como sinônimos. No entanto, para se tornar um Engenheiro de Qualidade, você precisa entender a diferença fundamental entre eles. Pense na construção de um carro:

* **Software Testing (O Teste):** É a execução prática. É o ato de entrar no carro pronto, girar a chave, pisar no freio e ver se ele para. No software, é a ação de operar o sistema com a intenção explícita de encontrar falhas (bugs) comparando o comportamento atual com o esperado.
* **Quality Control - QC (Controle de Qualidade):** É o foco no **produto**. É o checklist final antes do carro sair da fábrica. O QC inspeciona o produto construído para garantir que ele atende aos requisitos estabelecidos. É uma abordagem *reativa* (o defeito já existe, o QC apenas o identifica antes de chegar ao cliente).
* **Quality Assurance - QA (Garantia da Qualidade):** É o foco no **processo**. É o planejamento da fábrica, a calibração das máquinas e o treinamento dos engenheiros. O QA atua de forma *preventiva*, garantindo que os métodos e etapas de construção do software estejam corretos desde o primeiro dia, minimizando a chance de o defeito sequer ser criado.

### 📚 2. Teoria: A Filosofia Shift-Left Testing (A Regra de Ouro)
Historicamente, o desenvolvimento de software seguia um modelo "Cascata" (Waterfall): o cliente pedia, o desenvolvedor passava meses programando e, só no final, o testador entrava em cena. O problema? Descobrir um erro na arquitetura do sistema no último dia custava fortunas.

O **Shift-Left Testing** mudou o jogo. A ideia é "deslocar para a esquerda" (para o início da linha do tempo do projeto) as validações de qualidade. 
Em vez de esperar o código ficar pronto, o QA moderno participa das reuniões de concepção das ideias. Nós questionamos regras de negócio conflitantes, exigimos clareza nos requisitos e criamos cenários de testes antes mesmo de uma única linha de código ser escrita. **A regra é clara: quanto mais cedo um bug é encontrado, mais barato é corrigi-lo.**

### ✍️ 3. Atividade de Reflexão
Antes de assistir ao vídeo, faça uma pesquisa rápida e documente suas ideias (recomendamos usar um **Google Docs**, **Notion** ou um arquivo **Markdown** no VS Code): 

Liste 3 exemplos práticos de problemas críticos ou falhas caras (em aplicativos ou sites que você usa no dia a dia) que poderiam ter sido evitados se a equipe de desenvolvimento aplicasse o *Shift-Left Testing* logo na fase de planejamento e refinamento. 

*Guarde essas anotações! Elas serão uma excelente base para o seu artigo do Projeto Prático no final da Sprint.*

### 🎥 4. Vídeo Explicativo: A Evolução do Testador para Engenheiro
Nesta aula, vou te mostrar na prática o que significa aplicar o Shift-Left no dia a dia das empresas e por que o mercado disputa profissionais preventivos, enquanto os "caçadores de bugs de final de esteira" estão perdendo espaço.

[![Assistir Aula 1 - A Evolução do Testador](https://img.youtube.com/vi/vwlQ5uHqmIY/maxresdefault.jpg)](https://youtu.be/vwlQ5uHqmIY)

*(Clique na imagem acima para assistir à aula)*

---

## 🗓️ Semana 2: Ciclos de Vida e Agilidade no Mundo Real

### 📚 1. Teoria: Onde o QA habita? Entendendo o SDLC e o STLC
Para garantir a qualidade, você precisa primeiro entender como o software nasce e cresce:
* **SDLC (Software Development Life Cycle):** É o Ciclo de Vida do Desenvolvimento. Todo software passa por: Planejamento $\rightarrow$ Análise de Requisitos $\rightarrow$ Design (Arquitetura e Layout) $\rightarrow$ Implementação (Código) $\rightarrow$ Testes $\rightarrow$ Implantação (Deploy) e Manutenção.
* **STLC (Software Testing Life Cycle):** É o Ciclo de Vida de Testes, que roda *em paralelo* ao SDLC. Enquanto o desenvolvedor escreve o código, o QA já está fazendo a Análise dos Requisitos, o Planejamento da estratégia, a Modelagem dos Casos de Teste e a Configuração do ambiente, para que, quando o código estiver pronto, a Execução seja rápida e cirúrgica.

### 📚 2. Teoria: O Caos Organizado (Agilidade, Scrum e Kanban)
Hoje, a grande maioria das empresas de tecnologia utiliza **Metodologias Ágeis**. A ideia não é entregar o software inteiro de uma vez após um ano, mas sim entregar pequenos "pedaços" de valor a cada semana ou quinzena (chamadas de *Sprints*).
* No **Scrum**, temos papéis definidos e ritos (reuniões diárias, planejamento de sprint, revisão). 
* No **Kanban**, temos um fluxo contínuo e visual (o famoso quadro com colunas *To Do*, *Doing* e *Done*). O QA é o guardião que impede que um card avance para a coluna de "Concluído" sem ter qualidade comprovada.

### 📚 3. Teoria: A Base do Trabalho (User Stories, AC e DoD)
No mundo ágil, os requisitos não são livros de 500 páginas. Eles são escritos no formato de **User Stories** (Histórias de Usuário).
* **Exemplo de User Story:** *"Como usuário, quero recuperar minha senha por e-mail para voltar a acessar minha conta."*
* **Critérios de Aceite (Acceptance Criteria - AC):** São as regras inegociáveis dessa história. Exemplo: *"O e-mail deve chegar em até 2 minutos"*, *"O link deve expirar em 24h"*. É aqui que o QA atua desenhando os testes.
* **Definition of Done (DoD - Definição de Pronto):** É o contrato do time. O time concorda que nenhuma User Story está terminada até cumprir o DoD (que geralmente inclui: código revisado, testes automatizados passando e sem bugs críticos em aberto).

### 🧪 4. Entregável da Sprint (Projeto Prático)
Um Engenheiro de Qualidade precisa saber se comunicar tecnicamente e ter forte embasamento teórico para argumentar em reuniões. Seu primeiro desafio oficial será sintetizar a postura preventiva do QA.

**O Desafio:**
1. Escreva um artigo técnico e publique no seu perfil do **LinkedIn** OU crie um arquivo **Markdown no seu repositório do GitHub**.
2. O texto deve explicar com suas palavras e exemplos:
   * A diferença prática entre QA, QC e Software Testing.
   * O conceito de Shift-Left Testing e por que achar um bug no refinamento é mais barato do que em produção.
3. Adicione o link da sua publicação (ou do seu arquivo Markdown) na **aba Issues** deste projeto no GitHub para receber feedback técnico.

### 🎥 5. Vídeo Explicativo: O QA no SDLC e Metodologias Ágeis
Veja visualmente como um card viaja no Kanban e em qual momento exato deve atuar para validar os Critérios de Aceite e garantir a temida *Definition of Done*.

[![Assistir Aula 2 - O QA no SDLC e Metodologias Ágeis](https://img.youtube.com/vi/-1AQB04ZPY0/maxresdefault.jpg)](https://youtu.be/-1AQB04ZPY0)

*(Clique na imagem acima para assistir à aula)*