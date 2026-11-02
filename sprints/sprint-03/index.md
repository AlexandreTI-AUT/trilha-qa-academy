![Banner Trilha QA Academy](../../assets/images/banner-site.jpg)

# 🌐 Sprint 03: Fundamentos de Testes WEB, DevTools e Prática no SauceDemo

Bem-vindo à Sprint 03 da **Trilha QA Academy**! Esta é a etapa em que você deixa de enxergar a internet apenas como um usuário comum e passa a dominá-la com os **olhos técnicos de um Engenheiro de Qualidade**.

Nesta sprint, vamos desvendar como a web funciona "por baixo do capô", aprender a utilizar as ferramentas de inspeção de mercado e executar o nosso primeiro ciclo profissional de testes funcionais, testes de layout e gestão de defeitos utilizando o laboratório **SauceDemo** (`www.saucedemo.com`).

---

## 📖 Módulo 1: A Arquitetura Cliente-Servidor (Como a Web Funciona na Prática)

Para testar aplicações web com autonomia, o Engenheiro de Qualidade precisa compreender exatamente o caminho que os dados percorrem quando o usuário interage com a tela. Pense na arquitetura web moderna como a engrenagem de uma grande corporação dividida em dois grandes setores:

### 1. O Client (Cliente / O Front-end)

- **O que é:** É a interface gráfica que roda diretamente no dispositivo do usuário (o navegador Google Chrome, Firefox, Safari no computador ou celular).
- **Do que é feito:** HTML (a estrutura), CSS (o design e estilo) e JavaScript (a interatividade e comportamento da página).
- **Papel do QA:** Validar se os elementos visuais respondem corretamente, se as máscaras de campos funcionam e se a experiência do usuário está fluida.

### 2. O Server (Servidor / O Back-end e Banco de Dados)

- **O que é:** O computador de alta performance hospedado na nuvem (AWS, Azure, Google Cloud) onde o sistema realmente "vive e pensa".
- **O que ele faz:** Processa as regras de negócio complexas, valida acessos, executa cálculos financeiros e conecta-se ao banco de dados para salvar e recuperar informações.
- **Papel do QA:** Garantir que as informações trafegadas cheguem íntegras e corretas ao servidor.

### 3. O Ciclo de Requisição e Resposta (Request & Response)

Toda interação na web é baseada em um diálogo binário entre o cliente e o servidor:

- **Request (Requisição):** Quando você digita seu login no SauceDemo e clica em _Enter_, o navegador empacota os seus dados e envia um pacote de dados (_Request_) para o servidor.
- **Response (Resposta):** O servidor processa o pedido e devolve uma _Response_ contendo o conteúdo da página e, obrigatoriamente, um **Status Code (Código de Status)** numérico.
  - _Exemplos clássicos de mercado que todo QA deve saber de cor:_
    - `200 OK`: Sucesso! O servidor entendeu e atendeu ao pedido.
    - `400 Bad Request`: Erro do cliente (faltou algum dado obrigatório).
    - `401 Unauthorized`: Falha de autenticação (usuário ou senha incorretos).
    - `404 Not Found`: A página ou recurso solicitado não existe.
    - `500 Internal Server Error`: O servidor quebrou (bug grave no código do back-end).

> **💡 Dica de Ouro para Entrevistas:** Um QA júnior testa o que vê na tela. Um QA sênior analisa o que acontece entre o _Client_ e o _Server_ utilizando ferramentas de rede.

### 🎯 Atividade Prática do Módulo 1:

1. Abra o navegador e acesse o site do SauceDemo (`www.saucedemo.com`).
2. Digite um usuário qualquer e clique em login. No seu caderno, classifique se o comportamento gerou um _Request_ e qual foi o provável _Status Code_ de retorno do servidor.

---

📹 **Assista à aula técnica completa sobre o Módulo 1:**
<br>
[![Aula Prática: Arquitetura e Ciclo Request/Response](https://img.youtube.com/vi/HkhKLm6ySQs/maxresdefault.jpg)](https://youtu.be/HkhKLm6ySQs)

---

## 🛠️ Módulo 2: O Canivete Suíço do QA — Browser DevTools

Esqueça o mito de que as ferramentas de desenvolvedor servem apenas para programadores. O **Browser DevTools** é o instrumento de trabalho diário mais poderoso de um Analista de Qualidade Web. Para acioná-lo, basta pressionar a tecla `F12` no teclado (ou clicar com o botão direito em qualquer ponto da página e selecionar _Inspecionar_).

As três abas essenciais para a sua carreira profissional são:

### 1. Aba Elements (O DOM / Estrutura da Página)

- **O que faz:** Exibe a árvore exata de código HTML e CSS que está a renderizar a tela visualizada naquele exato segundo.
- **Aplicações no dia a dia:** Essencial para futuras automações de teste, pois é nela que você investiga os seletores únicos (como atributos `data-test`, `id` ou `class`) para mapear os elementos.

### 2. Aba Console (Monitoramento de Exceções)

- **O que faz:** O painel onde o navegador regista avisos operacionais e, criticamente, **erros e exceções de JavaScript** impressos em vermelho.
- **Aplicações no dia a dia:** Muitas vezes, um botão pode parecer apenas "morto" para o usuário, mas por trás dos panos há um erro crítico de script estourando no console. Auditar o console é um diferencial de qualidade enorme.

### 3. Aba Network / Rede (O Fluxo de Dados)

- **O que faz:** Monitora em tempo real absolutamente todas as requisições HTTP disparadas ou recebidas pelo seu navegador.
- **Aplicações no dia a dia:** Permite inspecionar se os parâmetros enviados em um formulário estão corretos, auditar o tempo de carregamento de páginas e confirmar os códigos de status exatos devolvidos pelo servidor.

### 🎯 Atividade Prática do Módulo 2:

1. Pressione `F12` no SauceDemo e navegue até a aba **Console**. Verifique se há algum aviso ou erro inicial ao carregar a página de login.
2. Vá até a aba **Network**, limpe os registros e realize o login. Clique na primeira requisição que aparecer e localize o _Status Code_ `200 OK`.

---

📹 **Assista à aula técnica completa sobre o Módulo 2:**
<br>
[![Aula Prática: Dominando o Browser DevTools](https://img.youtube.com/vi/qiq4Jfduq0Y/maxresdefault.jpg)](https://youtu.be/qiq4Jfduq0Y)

---

## 📱 Módulo 3: Testes de Layout (UI) e Responsividade

Um Engenheiro de Qualidade não testa apenas se o sistema funciona (Regra de Negócio), mas também se a interface foi construída com qualidade visual e se adapta a diferentes dispositivos.

### 1. Testes de Layout (UI - User Interface)

- **O que é:** Validar se a interface gráfica codificada pelos desenvolvedores (HTML/CSS) corresponde exatamente ao protótipo aprovado no time de design (Figma, Adobe XD).
- **O que o QA audita:**
  - **Fidelidade Visual:** Cores (hexadecimais exatos), fontes, negritos e alinhamentos.
  - **Estrutura:** Elementos sobrepostos, textos que vazam do contêiner, imagens distorcidas ou cortadas.
  - **Estado dos Elementos:** Como o botão se comporta quando você passa o mouse por cima (_Hover_), quando clica (_Active_) ou quando está desativado (_Disabled_).

### 2. Testes de Responsividade (Cross-Device)

As aplicações corporativas modernas são multiplataforma. O cliente acessa tanto do computador (_desktop_) quanto de um iPhone ou tablet.

- **O que o QA audita:** Se os menus se adaptam (ex: virando um menu "hambúrguer"), se o texto continua legível sem precisar dar zoom, e se os botões continuam grandes o suficiente para serem clicados com o dedo na tela de toque.
- **Como testar usando o DevTools:** Ative o modo de simulação de dispositivos móveis no DevTools (`Ctrl + Shift + M` no Windows / `Cmd + Shift + M` no Mac).

### 🎯 Atividade Prática do Módulo 3:

1. Acesse o SauceDemo e ative o modo de dispositivos móveis no DevTools.
2. Alterne a visualização para um celular compacto (ex: iPhone SE) e observe se o menu principal muda e se adapta.
3. Observe o layout da tela de produtos: as imagens estão proporcionais? Há algum texto sobreposto aos botões?

---

📹 **Assista à aula técnica completa sobre o Módulo 3:**
<br>
[![Aula Prática: Testes de Layout e Responsividade](https://img.youtube.com/vi/c-0Vc4lBf0I/maxresdefault.jpg)](https://youtu.be/c-0Vc4lBf0I)

---

## 📋 Módulo 4: Projeto Prático da Sprint (O Ciclo Funcional Completo E2E)

Neste projeto, você vai elevar o nível e simular um desafio de alta complexidade dentro de uma squad ágil de tecnologia. O foco agora é a validação funcional e visual **End-to-End (E2E)** do fluxo completo de compras do e-commerce **SauceDemo** (`www.saucedemo.com`).

Você deixará de validar apenas uma tela isolada e passará a garantir a jornada completa do cliente: do login, passando pela seleção de produtos e carrinho, até o preenchimento de dados e a conclusão final do pedido (Checkout), garantindo a qualidade técnica e de layout em diferentes dispositivos.

---

📹 **Assista à apresentação do Projeto Prático E2E:**
<br>
[![Apresentação do Projeto Prático: Fluxo Completo](https://img.youtube.com/vi/1YtkemzIhLY/maxresdefault.jpg)](https://youtu.be/1YtkemzIhLY)

---

### 📄 Passo 1: O Requisito de Negócio (User Story E2E)

O ponto de partida de qualquer ciclo de teste profissional é a especificação de negócio. Nossa estória agora é robusta e engloba o fluxo completo do consumidor.

- **Atividade:** Baixe e leia atentamente o documento oficial da nova estória de usuário integrada:
  👉 **[Baixar User Story: Jornada de Compra E2E (PDF)](./user-story-jornada-e2e.pdf)**

### ✍️ Passo 2: Mapeamento e Escrita de Testes em BDD (Gherkin)

Como o escopo aumentou drasticamente, a organização da sua suíte de testes é fundamental. Com base estritamente nos Critérios de Aceite:

1. Abra o seu **VS Code**.
2. Crie arquivos `.feature` modulares separados por contexto para organizar o projeto (ex: `login.feature`, `carrinho.feature`, `checkout.feature`).
3. Escreva os cenários de teste estruturados em sintaxe Gherkin (`Given`, `When`, `Then`):
   - **Cobertura Funcional:** Cubra o Caminho Feliz (_Happy Path_), regras de negócio (cálculo de impostos e total do pedido) e fluxos de exceção (tentar finalizar compra com dados em branco).
   - **Cobertura de Responsividade (UI):** Escreva cenários explícitos garantindo que elementos críticos (como o botão de finalizar compra) permanecem acessíveis e não quebram o layout em telas menores.

### 🧪 Passo 3: Execução do Teste Funcional e Responsivo no SauceDemo

1. Abra o navegador e acesse o ambiente do SauceDemo (`www.saucedemo.com`).
2. **Execução Multiplataforma:** Execute seus cenários BDD manualmente primeiro na visão **Desktop** e, em seguida, repita a validação ativando o **Device Mode (Mobile)** no DevTools para auditar a responsividade.
3. **Auditoria Técnica Simultânea:** Mantenha o **DevTools (F12)** aberto durante toda a jornada. Acompanhe a aba _Console_ para capturar exceções silenciosas de JavaScript e a aba _Network_ para validar os Status Codes no momento de finalizar a compra.

### 🐞 Passo 4: Gestão de Defeitos e Organização no VS Code (`bugs/`)

Sistemas complexos escondem bugs sistêmicos. Caso identifique qualquer comportamento que divirja dos Critérios de Aceite, erros matemáticos no carrinho ou falhas de quebra de layout mobile:

1. No **VS Code**, crie uma pasta chamada **`bugs/`** dentro do diretório do seu projeto.
2. Para cada defeito encontrado, crie um arquivo com nomenclatura profissional (ex: `bug-01-calculo-taxa-incorreto.md` ou `bug-02-botao-checkout-sobreposto-mobile.md`).
3. Documente o seu **Bug Report** seguindo o padrão rigoroso de mercado.

### 🚀 Passo 5: Entregando o seu Projeto (GitHub)

Assim como fizemos na Sprint 02, o seu projeto prático será validado e fará parte do seu portfólio no GitHub.

1. Suba a sua pasta da Sprint 03 (com os arquivos `.feature` e a pasta `bugs/`) para o seu repositório pessoal no GitHub.
2. Acesse o repositório oficial da Trilha QA Academy e abra uma nova **Issue** com a sua entrega:
   👉 **[Entregar Projeto no GitHub (Abrir Issue)](https://github.com/AlexandreTI-AUT/trilha-qa-academy/issues)**
3. Preencha o template informando a conclusão da Sprint 03 e o link do seu projeto para receber feedback!
