![Banner Trilha QA Academy](../../assets/images/banner-site.jpg)

# 🚀 Sprint 02: Teoria de Testes, Técnicas de Design & BDD

**Duração:** 1 Semana  
**Objetivo:** Aprender a pensar como um Engenheiro de Qualidade. Vamos abandonar o hábito de "clicar em tudo" sem rumo (testes exploratórios não estruturados) e aprender a desenhar testes inteligentes, criar documentação viva com BDD e entender a estrutura de um Bug profissional.

Nesta Sprint, construiremos a base analítica necessária para garantir a máxima cobertura de testes com o menor esforço possível.

---

## 📖 A Nossa Aplicação Base (Case: SauceDemo)

Durante toda esta Sprint e nos exercícios práticos, vamos utilizar o aplicativo **Swag Labs (SauceDemo)** (`www.saucedemo.com`) como o nosso laboratório real de testes para Web. Ele simula um e-commerce completo com login, catálogo, carrinho e checkout.

📹 **Assista à aula introdutória e conheça a plataforma:**
<br>
[![Apresentação da Sprint e SauceDemo](https://img.youtube.com/vi/EmeImIRDskE/maxresdefault.jpg)](https://youtu.be/EmeImIRDskE)

---

## 🛠️ 1. Técnicas de Design de Teste (Pensamento Analítico)

Como não temos tempo infinito para testar todas as combinações possíveis de um sistema, utilizamos técnicas de design para escolher os cenários que têm a maior probabilidade de encontrar falhas.

### 1.1 Particionamento de Equivalência
**A Teoria:** Essa técnica divide os dados de entrada em "grupos" (partições). A lógica é simples: se o sistema processar corretamente um valor de um grupo, assumimos que processará todos os outros valores daquele mesmo grupo da mesma forma. Assim, testamos apenas um representante de cada grupo.

* **Exemplo 1 (Campo de Idade):** Um sistema bancário só aceita clientes entre 18 e 65 anos.
  * *Partição Válida:* Idades de 18 a 65 (Testamos com o valor 30, por exemplo).
  * *Partição Inválida 1:* Menores de 18 (Testamos com o valor 15).
  * *Partição Inválida 2:* Maiores de 65 (Testamos com o valor 70).
* **Exemplo 2 (Campo de Senha):** Uma senha precisa ter no mínimo 8 caracteres.
  * *Partição Válida:* Textos com 8 ou mais caracteres (Ex: "SenhaForte123").
  * *Partição Inválida:* Textos com 7 ou menos caracteres (Ex: "Senha1").
* **Exemplo 3 (Zip Code do SauceDemo):** O campo aceita texto, mas não pode ficar em branco.
  * *Partição Válida:* Campo preenchido (Ex: "04300-000").
  * *Partição Inválida:* Campo completamente vazio.

> **Ação Prática 1:** 
> Acesse a tela de Login do SauceDemo. Identifique mentalmente quais são as partições válidas e inválidas para o campo "Username". Tente realizar o login utilizando um dado da partição inválida (ex: deixando o campo em branco) e anote qual foi a reação do sistema.

### 1.2 Análise de Valor Limite
**A Teoria:** Os defeitos adoram se esconder nas "bordas" das regras de negócio (limites). Esta técnica foca em testar exatamente o início e o fim de cada partição de equivalência.

* **Exemplo 1 (Frete Grátis):** O e-commerce dá frete grátis para compras *a partir* de R$ 100,00.
  * Limite Inferior (Inválido): R$ 99,99 (Deve cobrar frete).
  * Limite Exato (Válido): R$ 100,00 (Frete grátis).
  * Limite Superior (Válido): R$ 100,01 (Frete grátis).
* **Exemplo 2 (Limite de Caracteres):** Um campo de "Primeiro Nome" aceita no máximo 20 letras.
  * Testamos: 19 letras (Passa), 20 letras (Passa), 21 letras (Falha).

> **Ação Prática 2:** 
> Imagine que a loja SauceDemo tenha implementado uma regra de negócio que permite adicionar **no máximo 10 itens** ao carrinho de compras. Quais seriam os 3 valores limites exatos que você utilizaria no seu teste para garantir que a regra funciona? Escreva-os num bloco de notas.

### 1.3 Tabela de Decisão
**A Teoria:** Utilizada quando temos formulários ou regras de negócio complexas onde várias condições (Sim/Não) se cruzam para gerar diferentes resultados. Evita que a gente esqueça de combinações importantes.

* **Exemplo 1 (Aprovação de Compra):**
  * *Cartão Válido (Sim) + Saldo Disponível (Sim)* = Compra Aprovada.
  * *Cartão Válido (Sim) + Saldo Disponível (Não)* = Compra Negada (Sem Saldo).
  * *Cartão Válido (Não) + Saldo Disponível (Sim)* = Compra Negada (Cartão Bloqueado).
* **Exemplo 2 (Login no SauceDemo):**
  * *Usuário Válido + Senha Válida* = Entra na loja.
  * *Usuário Inválido + Senha Válida* = Erro de credenciais.
  * *Usuário Bloqueado (`locked_out_user`) + Senha Válida* = Erro de conta bloqueada.

> **Ação Prática 3:** 
> Desenhe uma pequena tabela no papel para o formulário de Checkout do SauceDemo. Coloque as colunas: "First Name", "Last Name", "Zip Code" e "Resultado". Preencha 4 linhas alternando qual desses campos você deixaria em branco para validar todas as mensagens de erro possíveis.

### 1.4 Transição de Estados
**A Teoria:** Modela sistemas onde a interface ou o comportamento mudam dependendo de ações que ocorreram no passado. Um elemento passa do Estado A para o Estado B através de uma ação.

* **Exemplo 1 (Pedido de E-commerce):**
  * Estado `No Carrinho` -> (Ação: Pagar) -> Estado `Aguardando Envio` -> (Ação: Despachar) -> Estado `Em Trânsito`.
* **Exemplo 2 (Botão do Carrinho):**
  * Estado `Vazio` -> (Ação: Add to Cart) -> Estado `Botão muda para Remove e Ícone ganha número 1`.

> **Ação Prática 4:** 
> Entre no SauceDemo e adicione o produto "Sauce Labs Backpack". Navegue até o carrinho e clique no botão "Remove". Observe atentamente a transição de estado da interface: o que aconteceu com o produto na lista e o que aconteceu com o selo vermelho no ícone do carrinho no topo da tela?

### 🎯 Técnicas de Design de Testes na Prática

Nesta aula, aplicamos as quatro principais técnicas formais de design de testes diretamente no SauceDemo, garantindo a máxima cobertura com o mínimo de cenários:
* **Particionamento de Equivalência**
* **Análise de Valor Limite**
* **Tabela de Decisão**
* **Transição de Estados**

📹 **Assista à aula técnica completa:**
<br>
[![Técnicas de Design de Testes na Prática](https://img.youtube.com/vi/6ZEJdP9f1eQ/maxresdefault.jpg)](https://youtu.be/6ZEJdP9f1eQ)

---

## 📝 2. Estruturando Casos de Teste Passo a Passo

Antes de automatizarmos, precisamos saber detalhar os testes. Um Caso de Teste (CT) tradicional é um roteiro que diz a qualquer pessoa (mesmo que não conheça o sistema) exatamente onde clicar e o que esperar.

**A Anatomia de um Bom Caso de Teste:**
* **ID e Título:** Identificação clara do que está sendo testado.
* **Pré-condições:** O que precisa estar pronto antes de começar (ex: Usuário logado).
* **Passos (Step-by-step):** Ações detalhadas e sequenciais.
* **Resultado Esperado:** A validação final. Como o sistema deve reagir?

**Exemplo Prático (SauceDemo):**
> **ID:** CT-001  
> **Título:** Validar bloqueio de checkout com campo "First Name" em branco.  
> **Pré-condições:** O usuário `standard_user` deve estar logado e possuir 1 produto no carrinho.  
> 
> **Passos de Execução:**  
> 1. Clicar no ícone do carrinho no canto superior direito.  
> 2. Na tela do carrinho, clicar no botão "Checkout".  
> 3. Deixar o campo "First Name" totalmente em branco.  
> 4. Preencher o campo "Last Name" com o texto "Silva".  
> 5. Preencher o campo "Zip/Postal Code" com o texto "01000-000".  
> 6. Clicar no botão "Continue".  
> 
> **Resultado Esperado:** O sistema não deve avançar de tela e deve exibir uma mensagem de erro em destaque na cor vermelha informando: *"Error: First Name is required"*.

### 📝 Escrevendo Casos de Teste Sem Ambiguidade

Já sabemos o que testar, mas como documentamos isso para que toda a equipa entenda? Nesta aula, declaramos guerra à ambiguidade e mostramos como escrever casos de teste cirúrgicos, explorando a anatomia perfeita de um teste (Pré-condições, Passos e Resultado Esperado) aplicados diretamente no SauceDemo.

📹 **Assista à aula sobre Casos de Teste:**
<br>
[![Escrevendo Casos de Teste Sem Ambiguidade](https://img.youtube.com/vi/bJ0X1S5nLw0/maxresdefault.jpg)](https://youtu.be/bJ0X1S5nLw0)

---

## 🌟 3. BDD e Gherkin (A Ponte entre Negócios e Tecnologia)

O **BDD (Behavior-Driven Development)** é uma prática incrível de qualidade. O seu objetivo principal não é a automação em si, mas sim a **comunicação**. Ele utiliza uma linguagem simples (Gherkin) para que o Dono do Produto (PO), os Desenvolvedores e os QAs tenham o mesmo entendimento sobre uma funcionalidade.

**A Sintaxe do Gherkin (Palavras-Chave):**
Pode ser escrito no padrão internacional (Inglês) ou em Português.
* 🇬🇧 **Feature** / 🇧🇷 **Funcionalidade:** O grande épico que estamos testando.
* 🇬🇧 **Scenario** / 🇧🇷 **Cenário:** O caminho específico (feliz ou triste).
* 🇬🇧 **Given** / 🇧🇷 **Dado:** O contexto ou pré-condição.
* 🇬🇧 **When** / 🇧🇷 **Quando:** A ação executada pelo usuário.
* 🇬🇧 **Then** / 🇧🇷 **Então:** O resultado esperado (validação).
* 🇬🇧 **And** / 🇧🇷 **E:** Adiciona passos extras.

**Exemplo 1 (Caminho Feliz - Escrito em Português):**
```gherkin
Funcionalidade: Checkout de Produtos
  Como um cliente da loja
  Desejo preencher os meus dados de entrega
  Para poder receber a minha compra

  Cenário: Realizar checkout preenchendo todos os dados obrigatórios
    Dado que estou na tela de informações do checkout
    E possuo itens no meu carrinho
    Quando preencho o campo "First Name" com "Alexandre"
    E preencho o campo "Last Name" com "Silva"
    E preencho o campo "Zip Code" com "04300-000"
    E clico no botão "Continue"
    Então o sistema deve me redirecionar para a tela de "Checkout: Overview"
```

**Exemplo 2 (Caminho de Erro - Escrito em Inglês):**
```gherkin
Feature: Login Security

  Scenario: Attempt to login with a locked out user
    Given I am on the Swag Labs login screen
    When I authenticate with username "locked_out_user" and password "secret_sauce"
    Then the system should block the access
    And display the error message "Epic sadface: Sorry, this user has been locked out."
```

> **Ação Prática 5:** 
> Tente converter o Caso de Teste Tradicional que vimos no tópico 2 (CT-001) para a sintaxe BDD (Gherkin). Percebe como fica muito mais natural de ler para alguém de negócios (Product Owner)?


Chegou o momento de elevar o nível e falar a linguagem dos negócios! Nesta aula, introduzimos o BDD (Behavior-Driven Development) e a sintaxe Gherkin. Com muita prática ("live coding"), configuramos o VS Code e escrevemos os nossos primeiros cenários, abordando o padrão de mercado em Inglês (`Given/When/Then`) e a adaptação para Português usando o Esquema do Cenário e Tabela de Dados.

*(Não se esqueça de descarregar o Guia de Instalação do VS Code em PDF disponibilizado na descrição do vídeo!)*

📹 **Assista à aula de BDD e Gherkin no VS Code:**
<br>
[![BDD e Gherkin no VS Code](https://img.youtube.com/vi/4Y3cjr_3K4w/maxresdefault.jpg)](https://youtu.be/4Y3cjr_3K4w)

📦 **Material de Apoio Exclusivo:**
👉 **[Baixar Guia de Instalação e Configuração do VS Code (PDF)](./guia_vscode_qa.pdf)**

---

## 🐞 4. O Ciclo de Vida de um Bug

Se a Qualidade atua de forma preventiva, o que acontece quando algo falha? Encontramos um **Bug (Defeito)**.
Um bug ocorre sempre que o *Resultado Atual* (o que o sistema fez) é diferente do *Resultado Esperado* (o que o sistema deveria ter feito).

Como Engenheiro de Qualidade, o seu trabalho não é apenas dizer "não funciona", mas sim **fornecer um relatório cirúrgico** para que o Desenvolvedor consiga corrigir o erro rapidamente.

**Anatomia de um Report de Bug Impecável:**
1. **Título Curto e Direto:** O quê, onde e sob quais circunstâncias ocorreu a falha.
2. **Ambiente:** Em qual navegador e sistema operacional ocorreu (ex: Chrome 118 no Windows 11).
3. **Passos para Reproduzir:** O passo a passo exato para o Desenvolvedor conseguir replicar o erro na máquina dele.
4. **Resultado Esperado:** O comportamento correto que dita a regra de negócio.
5. **Resultado Atual (O Bug):** O erro que efetivamente ocorreu.
6. **Evidências:** Um print (captura de tela) ou pequeno vídeo mostrando a falha.

*Nota: Nesta Sprint não vamos inventar bugs imaginários, mas é fundamental que você saiba a estrutura correta para quando encontrarmos um defeito real nas próximas etapas!*

Se a Qualidade atua de forma preventiva, o que acontece quando o sistema inevitavelmente falha? Encontramos um **Bug (Defeito)**! Nesta aula, percebemos o ciclo de vida de uma falha e como criar um *Bug Report* cirúrgico e profissional (usando as práticas do Jira, Azure DevOps e Linear) para que a equipa de desenvolvimento consiga corrigir o problema em tempo recorde.

📹 **Assista à aula sobre o Ciclo de Vida de um Bug:**
<br>
[![O Ciclo de Vida de um Bug](https://img.youtube.com/vi/0IIK70v9lqI/maxresdefault.jpg)](https://youtu.be/0IIK70v9lqI)
---
## 🎯 Desafio Prático da Sprint 02

Chegou a hora de documentar o SauceDemo como um profissional. O material gerado aqui será a base das nossas automações nas próximas semanas. Para escrever os seus testes com embasamento, utilize o Backlog abaixo.

> ### 📋 Backlog do Desafio (Estórias de Usuário)
> 
> **US-001: Autenticação de Usuários**
> *Como* cliente da Swag Labs, *Desejo* fazer login com meu usuário e senha, *Para* acessar o catálogo de produtos.
> * **Critérios de Aceite:**
>   - Sucesso ao usar credenciais válidas (`standard_user`).
>   - Bloqueio e mensagem de erro ao usar usuário bloqueado (`locked_out_user`).
>   - Bloqueio e mensagem de erro se usuário ou senha estiverem em branco.
>
> **US-002: Carrinho de Compras**
> *Como* cliente autenticado, *Desejo* adicionar e remover produtos do carrinho, *Para* gerenciar os itens que vou comprar.
> * **Critérios de Aceite:**
>   - Ao clicar em "Add to cart", o ícone do carrinho deve atualizar a quantidade.
>   - O botão do produto deve mudar para "Remove".
>   - O usuário pode remover o item tanto na tela de produtos quanto dentro do próprio carrinho.
> 
> **US-003: Finalização de Compra (Checkout)**
> *Como* cliente autenticado, *Desejo* preencher meus dados de entrega, *Para* finalizar a minha compra.
> * **Critérios de Aceite:**
>   - Os campos "First Name", "Last Name" e "Zip/Postal Code" são obrigatórios.
>   - O sistema deve exibir a tela "Checkout: Overview" com o resumo da compra antes de finalizar.
>   - Ao clicar em Finish, deve exibir a mensagem "Thank you for your order!".

# 🚀 Desafio Prático — Sprint 02: Escrita de Testes em BDD

🎥 **Apresentação do projeto:** 
[![Desafio Prático Sprint 02 — Escrita de Testes em BDD com Gherkin](https://img.youtube.com/vi/uEhYYrZo9Po/maxresdefault.jpg)](https://youtu.be/uEhYYrZo9Po)

### 🛠️ Tarefas do Desafio

**1. Exploração**

Acesse o site do [SauceDemo](https://www.saucedemo.com/) e explore as funcionalidades descritas no Backlog, identificando os principais fluxos e possíveis comportamentos do sistema.

**2. Setup**

No VS Code, crie uma pasta chamada `desafio-sprint-02`.

**3. Mapeamento BDD**

Crie arquivos `.feature` (por exemplo, `login.feature`, `carrinho.feature` e `checkout.feature`) e escreva **10 cenários de teste reais** utilizando Gherkin, com base nas Estórias de Usuário do Backlog.

- Aplique técnicas de design de testes, como partições de equivalência, dados em branco e cenários de erro.
- Crie cenários de sucesso e de falha.
- Utilize Português ou Inglês, mantendo a consistência da linguagem escolhida.

**4. Caso de Teste Tradicional**

Escolha um cenário mais complexo da sua lista e crie um arquivo chamado `caso_de_teste.md`.

Descreva o passo a passo detalhado, incluindo a anatomia do caso de teste, conforme ensinado no Tópico 2.

**5. Entrega**

Publique os arquivos no seu repositório pessoal do GitHub.

Em seguida, abra uma [Issue no repositório da Trilha QA Academy](https://github.com/alexandreti-aut/trilha-qa-academy/issues), selecione o template **🚀 Entrega de Desafio Prático** e cole o link do seu repositório com a solução.

**✅ Checklist final**

- [ ] Pasta `desafio-sprint-02` criada.
- [ ] 10 cenários BDD escritos em arquivos `.feature`.
- [ ] Um caso de teste tradicional documentado em `caso_de_teste.md`.
- [ ] Arquivos publicados no GitHub.
- [ ] Issue de entrega aberta com o link da solução.

Boa prática e bons testes! 🚀

**A qualidade nasce muito antes de escrever a primeira linha de código. Bom planejamento de testes!**