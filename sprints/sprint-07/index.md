![Banner Trilha QA Academy](../../assets/images/banner-site.jpg)

# 🚀 Sprint 07 — JavaScript para QA: Introdução à Lógica de Programação

## 🎯 Objetivo da Sprint

Capacitar o profissional de QA nos fundamentos essenciais da lógica de programação com **JavaScript** e **Node.js** dentro do **VS Code**. O objetivo é garantir que o aluno domine variáveis, estruturas de decisão, laços de repetição, funções tradicionais e _Arrow Functions_, manipulação de arrays e objetos, além do funcionamento assíncrono do JavaScript (`async` / `await`) aplicados a cenários reais de testes — preparando a base técnica necessária antes de avançar para frameworks modernos de automação (como Playwright e Cypress).

---

### 📖 Módulo 1: Instalação do Node.js, Ambiente VS Code e Primeiros Passos

#### 1. O que é Node.js e como instalá-lo?

**Teoria:**

- **JavaScript:** Linguagem padrão da web e base dos principais frameworks modernos de automação de testes UI e API (Playwright, Cypress, WebdriverIO, K6).
- **Node.js:** Ambiente de execução (_runtime_) que permite rodar códigos JavaScript diretamente no terminal da sua máquina (fora do navegador), além de gerenciar bibliotecas e pacotes de teste via **NPM** (_Node Package Manager_).
- **Visual Studio Code (VS Code):** Editor de código onde escreveremos nossos scripts e executaremos os testes no terminal integrado.

**Passo a passo para instalar o Node.js:**

1. Acesse o site oficial **[nodejs.org](https://nodejs.org/)**.
2. Baixe sempre a versão **LTS** (_Long Term Support_ — versão estável e recomendada para projetos corporativos).
3. Execute o instalador mantendo as opções padrão (ele instala o `node` e o `npm` juntos).
4. Feche e reabra o terminal (ou o VS Code) e valide a instalação com os comandos abaixo:

**Exemplo 1.1: Validando a instalação do Node.js (`Terminal`)**

```bash
# Conferir as versões instaladas no terminal do VS Code
node -v
npm -v
```

**Exemplo 1.2: Executando o primeiro script (`01-hello-qa.js`)**

```javascript
console.log("🚀 Node.js instalado e rodando no VS Code!");
console.log("Trilha QA Academy - Sprint 07: JavaScript para QA");
```

```bash
# Comando para executar o arquivo no terminal
node 01-hello-qa.js
```

#### 📝 Atividade Prática — Módulo 1

1. Instale o **Node.js (versão LTS)** na sua máquina e valide com `node -v` e `npm -v`.
2. Crie a pasta `sprint-07-js-qa`, abra no **VS Code** (`code .`) e crie o arquivo `atividade-01.js`.
3. Imprima no terminal com `console.log()` o seu nome completo, seu objetivo na área de QA e a versão do Node.js instalada.
4. Execute com `node atividade-01.js`.

📹 **Assista à aula prática e demonstração do Módulo 1:**
<br>
[![Módulo 01: JavaScript para QA — Instalação do Node.js, VS Code e Primeiros Passos](https://img.youtube.com/vi/9RFx9MBM5Ss/maxresdefault.jpg)](https://youtu.be/9RFx9MBM5Ss)

---

### 📖 Módulo 2: Variáveis, Tipos de Dados e Operadores Aplicados a Testes

#### 1. Declarando Variáveis (`const` e `let`)

**Teoria:**

- **`const`:** Usada para valores que **não mudam** durante a execução do teste (ex.: URL base da aplicação, e-mail de usuário fixo, timeout padrão). É a escolha padrão na automação.
- **`let`:** Usada para valores que **podem mudar** ao longo do fluxo (ex.: contador de tentativas, status atual de um pedido, saldo após compra).
- _(Evite `var` em códigos modernos, pois possui problemas de escopo)._

#### 2. Tipos Primitivos Essenciais para QA

- **`String`:** Textos entre aspas (`"Login realizado com sucesso"`, `'Admin'`). Usada para validar mensagens na tela e payloads.
- **`Number`:** Números inteiros ou decimais (`200`, `404`, `199.90`). Usado para Status Code HTTP, preços e quantidades.
- **`Boolean`:** Valores lógicos (`true` ou `false`). Base de toda asserção/validação em testes automatizados (ex.: botão está visível? `true`).

#### 3. Operadores de Comparação e Lógicos

- **Comparação Estrita (`===` e `!==`):** Compara **valor e tipo** (ex.: `200 === 200` é `true`; `200 === "200"` é `false`). Na automação, sempre priorize `===` para evitar falsos positivos.
- **Relacionais:** `>`, `<`, `>=`, `<=`.
- **Lógicos:** `&&` (E — todas as condições devem ser verdadeiras), `||` (OU — pelo menos uma condição verdadeira), `!` (NÃO — inverte o valor booleano).

**Exemplo 2.1: Simulando massa de dados e validações de login (`02-variaveis-operadores.js`)**

```javascript
const urlBase = "[https://www.saucedemo.com/](https://www.saucedemo.com/)";
const usuarioValido = "standard_user";
let tentativasLogin = 1;
let usuarioBloqueado = false;
const statusCodeRetornado = 200;

// Template String (crase) para montar logs dinâmicos
console.log(`Acessando ${urlBase} com o usuário ${usuarioValido}`);

// Validações lógicas
const statusOk = statusCodeRetornado === 200;
const podeLogar = statusOk && !usuarioBloqueado && tentativasLogin <= 3;

console.log("Status HTTP é 200?", statusOk);
console.log("Usuário apto para autenticar?", podeLogar);
```

#### 📝 Atividade Prática — Módulo 2

1. Crie o arquivo `atividade-02.js` no VS Code.
2. Declare variáveis para simular a validação de um carrinho de compras:
   - `const nomeProduto = "Teclado Mecânico";`
   - `const precoUnitario = 250.00;`
   - `let quantidade = 2;`
   - `const cupomDescontoAplicado = true;`
3. Calcule o `valorTotal` multiplicando `precoUnitario * quantidade`.
4. Crie uma expressão booleana `freteGratis` que seja `true` apenas se o `valorTotal >= 300` **E** `cupomDescontoAplicado === true`.
5. Exiba todas as informações e o resultado de `freteGratis` usando _Template Strings_ (`console.log(...)`).

📹 **Assista à aula prática e demonstração do Módulo 2:**
<br>
[![Módulo 02: JavaScript para QA — Variáveis, Tipos de Dados e Operadores Aplicados a Testes](https://img.youtube.com/vi/jTwW17PIS3c/maxresdefault.jpg)](https://youtu.be/jTwW17PIS3c)

---

### 📖 Módulo 3: Estruturas Condicionais (`if / else`) — Tomada de Decisão nos Testes

#### 1. Validando Comportamentos Esperados

**Teoria:**
Na automação de testes, frequentemente precisamos tomar decisões com base no estado da tela ou na resposta de uma API: _"Se o status code for 200, o teste passou; senão, registre uma falha"_. Para isso usamos `if`, `else if` e `else`.

**Exemplo 3.1: Validando retorno de API e regra de negócio (`03-condicionais.js`)**

```javascript
const statusCode = 401;
const mensagemTela = "Credenciais inválidas";

if (statusCode === 200) {
  console.log("✅ PASSOU: Usuário autenticado com sucesso!");
} else if (statusCode === 401) {
  console.log("⚠️ FALHA ESPERADA (401): Bloqueio de acesso validado.");
  if (mensagemTela === "Credenciais inválidas") {
    console.log("✅ PASSOU: Mensagem de erro exibida corretamente.");
  }
} else {
  console.log(`❌ FALHA INESPERADA: Status retornado foi ${statusCode}`);
}
```

#### 📝 Atividade Prática — Módulo 3

1. Crie o arquivo `atividade-03.js` no VS Code.
2. Crie uma variável `const tempoRespostaMs = 850;` (simulando o tempo de resposta de uma API em milissegundos).
3. Implemente uma estrutura `if / else if / else` seguindo os critérios de performance (SLA):
   - Se `tempoRespostaMs <= 500`: exibir `"✅ Performance Excelente (Dentro do SLA ideal)"`;
   - Se `tempoRespostaMs > 500 && tempoRespostaMs <= 1000`: exibir `"⚠️ Performance Aceitável (Alerta de lentidão)"`;
   - Caso contrário (`> 1000`): exibir `"❌ Falha de SLA: Tempo de resposta acima do limite!"`.
4. Altere o valor de `tempoRespostaMs` (ex.: `300`, `850`, `1500`) e rode o script para testar os três cenários.

📹 **Assista à aula prática e demonstração do Módulo 3:**
<br>
_(Espaço reservado para inserção do vídeo e thumbnail do Módulo 3)_

---

### 📖 Módulo 4: Estruturas de Repetição (`for` e `while`) — Executando Testes em Lote

#### 1. Iterando sobre Cenários e Tentativas

**Teoria:**

- **`for`:** Ideal quando sabemos exatamente quantas vezes queremos repetir uma ação (ex.: testar 5 perfis de usuários ou percorrer uma lista de elementos na tela).
- **`while`:** Ideal quando repetimos uma ação **enquanto** uma condição for verdadeira (ex.: aguardar um elemento carregar na página até atingir o limite de tentativas).

**Exemplo 4.1: Simulando tentativas de carregamento e lote de testes (`04-loops.js`)**

```javascript
// 1. Laço FOR: Executando 3 ciclos de teste de fumaça (Smoke Test)
for (let execucao = 1; execucao <= 3; execucao++) {
  console.log(`Executando bateria de teste #${execucao}...`);
}

// 2. Laço WHILE: Simulando espera (polling) pelo carregamento de um botão
let tentativa = 1;
let botaoVisivel = false;

while (tentativa <= 3 && !botaoVisivel) {
  console.log(`Verificando visibilidade do botão (Tentativa ${tentativa})...`);
  if (tentativa === 3) {
    botaoVisivel = true;
    console.log("✅ Botão encontrado na tela!");
  }
  tentativa++;
}
```

#### 📝 Atividade Prática — Módulo 4

1. Crie o arquivo `atividade-04.js` no VS Code.
2. Utilize um laço `for` que conte de `1` até `10` representando 10 IDs de pedidos gerados no sistema.
3. Dentro do laço, use uma estrutura condicional (`if / else`) para verificar se o ID é par ou ímpar (dica: use o operador de resto `id % 2 === 0`):
   - Se for par, exiba: `"Pedido #X enviado para fila de pagamento automático"`;
   - Se for ímpar, exiba: `"Pedido #X enviado para análise antifraude"`.

📹 **Assista à aula prática e demonstração do Módulo 4:**
<br>
_(Espaço reservado para inserção do vídeo e thumbnail do Módulo 4)_

---

### 📖 Módulo 5: Funções Tradicionais vs. Arrow Functions (`() => {}`)

#### 1. Reutilizando Lógica na Automação de Testes

**Teoria:**
Na automação de testes, não repetimos o mesmo código em dezenas de testes diferentes. Encapsulamos ações repetitivas (como realizar login, gerar massa de dados ou validar mensagens) dentro de **funções**. Em JavaScript moderno, existem duas formas principais de escrever funções:

- **Função Tradicional (`function`):** Declaração clássica, muito usada para criar métodos nomeados e helpers explícitos.
- **Arrow Function (`() => {}`):** Sintaxe moderna, curta e muito utilizada em callbacks (`.forEach()`, `.map()`, `.filter()`) e nos blocos de teste de frameworks como Playwright e Cypress (`test('...', () => { ... })`).

**Exemplo 5.1: Comparando Função Tradicional e Arrow Function na prática (`05-funcoes.js`)**

```javascript
// 1. Função Tradicional (function)
function validarStatusCode(esperado, atual) {
  if (esperado === atual) {
    return "✅ PASSOU: Status Code validado com sucesso!";
  }
  return `❌ FALHOU: Esperado ${esperado}, mas recebeu ${atual}`;
}

// 2. Arrow Function () => {} (Sintaxe moderna)
const calcularDesconto = (valor, percentual) => {
  const desconto = valor * (percentual / 100);
  return valor - desconto;
};

// 3. Arrow Function reduzida (retorno implícito em uma linha)
const formatarEmailQA = (usuario) => `${usuario.toLowerCase()}@trilhaqa.com.br`;

// Executando e exibindo os resultados
console.log(validarStatusCode(200, 200));
console.log(validarStatusCode(201, 400));
console.log("Valor com desconto: R$", calcularDesconto(250, 20));
console.log("E-mail gerado:", formatarEmailQA("Alexandre"));
```

#### 📝 Atividade Prática — Módulo 5

1. Crie o arquivo `atividade-05.js` no VS Code.
2. Crie uma **Função Tradicional** `verificarAcesso(usuarioAtivo, perfil)` que retorne `"Acesso liberado"` apenas se `usuarioAtivo === true` e `perfil === "QA"`; caso contrário, retorne `"Acesso bloqueado"`.
3. Crie uma **Arrow Function** `calcularTempoMedio(tempoTotalMs, qtdRequisicoes)` que retorne a divisão `tempoTotalMs / qtdRequisicoes`.
4. Chame ambas as funções com diferentes cenários e imprima os retornos no terminal.

📹 **Assista à aula prática e demonstração do Módulo 5:**
<br>
_(Espaço reservado para inserção do vídeo e thumbnail do Módulo 5)_

---

### 📖 Módulo 6: Arrays e Objetos — Manipulando Massas de Dados e Payloads JSON

#### 1. Arrays (Listas) e Objetos (Chave-Valor)

**Teoria:**

- **Arrays (`[]`):** Listas ordenadas de itens (ex.: lista de perfis de teste, lista de produtos no carrinho, lista de mensagens de erro). Possuem métodos poderosos como `.push()`, `.length`, `.includes()` e `.forEach()`.
- **Objetos (`{}`):** Estruturas de **chave e valor** que representam entidades reais e são idênticas ao formato **JSON** usado em testes de API REST.

**Exemplo 6.1: Manipulando massa de dados de usuários (Data-Driven Testing) (`06-arrays-objetos.js`)**

```javascript
// Lista (Array) de Objetos simulando uma massa de dados JSON para Data-Driven Testing
const massaUsuarios = [
  { usuario: "standard_user", perfil: "Padrão", ativo: true },
  { usuario: "locked_out_user", perfil: "Bloqueado", ativo: false },
  { usuario: "performance_glitch_user", perfil: "Lento", ativo: true },
];

console.log(`Total de cenários na massa de dados: ${massaUsuarios.length}`);

// Percorrendo cada objeto da lista com forEach e Arrow Function
massaUsuarios.forEach((item) => {
  const status = item.ativo ? "Pode autenticar" : "Deve exibir bloqueio";
  console.log(
    `Usuário: ${item.usuario} | Perfil: ${item.perfil} -> Comportamento: ${status}`,
  );
});
```

#### 📝 Atividade Prática — Módulo 6

1. Crie o arquivo `atividade-06.js` no VS Code.
2. Crie um array chamado `suiteDeTestes` contendo **4 objetos**, onde cada objeto representa um caso de teste com as propriedades:
   - `id` (ex.: `"CT-01"`)
   - `titulo` (ex.: `"Login com sucesso"`)
   - `status` (`"PASS"` ou `"FAIL"`)
3. Percorra o array usando `.forEach()` com uma _Arrow Function_, exiba o relatório de cada teste no terminal e conte quantos testes passaram (`PASS`) e quantos falharam (`FAIL`), imprimindo o resumo final da execução.

📹 **Assista à aula prática e demonstração do Módulo 6:**
<br>
_(Espaço reservado para inserção do vídeo e thumbnail do Módulo 6)_

---

### 📖 Módulo 7: JavaScript Assíncrono (`Promises`, `async` e `await`) — O Segredo da Automação

#### 1. Por que entender Assincronismo é obrigatório para QA?

**Teoria:**
Por natureza, o **JavaScript é uma linguagem assíncrona e não-bloqueante**. Quando você dispara uma requisição para uma API ou manda o navegador clicar em um botão e carregar uma página, o JavaScript **não trava** esperando a resposta: ele inicia a tarefa e continua lendo a próxima linha imediatamente.

Se na automação de testes você tentar validar o texto da tela antes da requisição terminar, o teste vai falhar por **sincronismo**. Para resolver isso de forma limpa e legível, usamos duas palavras-chave fundamentais (que você usará em quase todas as linhas no **Playwright**):

- **`async`:** Declara que uma função executa operações assíncronas.
- **`await`:** Diz ao JavaScript: _"Espere esta linha terminar e devolver a resposta (Promise) antes de avançar para a próxima instrução"_.

**Exemplo 7.1: Simulando uma chamada assíncrona de API com `async` / `await` (`07-assincrono.js`)**

```javascript
// Função que simula uma consulta demorada em uma API (leva 2 segundos)
const consultarUsuarioAPI = (idUsuario) => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve({ id: idUsuario, nome: "Ana Silva", status: 200 });
    }, 2000);
  });
};

// Função assíncrona usando async / await (Padrão Playwright)
const executarTesteAPI = async () => {
  console.log("1. Iniciando requisição GET /usuarios/10...");

  // O await pausa a execução desta função até a API responder
  const resposta = await consultarUsuarioAPI(10);

  console.log("2. Resposta recebida:", resposta);
  if (resposta.status === 200) {
    console.log(`3. ✅ PASSOU: Usuário ${resposta.nome} encontrado!`);
  }
};

executarTesteAPI();
```

#### 📝 Atividade Prática — Módulo 7

1. Crie o arquivo `atividade-07.js` no VS Code.
2. Crie uma **Arrow Function** `simularLoginAssincrono(email)` que retorne uma `Promise` levando `1500` milissegundos (`1.5s`) para resolver com `{ autenticado: true, token: "JWT-998877" }`.
3. Crie uma função `async` chamada `rodarCenarioLogin` que:
   - Imprima `"Enviando credenciais para o servidor..."`;
   - Use `await` para aguardar o retorno de `simularLoginAssincrono("qa@trilha.com")`;
   - Valide com `if` se `retorno.autenticado === true` e exiba o token gerado no terminal.
4. Execute no terminal com `node atividade-07.js` e observe o tempo de espera antes da validação final.

📹 **Assista à aula prática e demonstração do Módulo 7:**
<br>
_(Espaço reservado para inserção do vídeo e thumbnail do Módulo 7)_

---

### 🏆 Módulo 8: Projeto Prático — Simulador Assíncrono de Execução de Suíte de Testes (Test Runner QA)

#### Objetivo do Projeto

Consolidar todos os conceitos aprendidos na **Sprint 07** construindo um **Mini Test Runner em JavaScript/Node.js** que lê uma massa de dados de cenários de teste (Array de Objetos), executa cada cenário de forma assíncrona (`async` / `await`), valida os status codes esperados com funções reutilizáveis e gera um relatório final de execução no terminal — aplicando na prática o fluxo profissional de Git & GitHub aprendido na Sprint 06.

#### 📋 Requisitos Obrigatórios de Entrega

1. **Repositório no GitHub:** Criar um novo repositório público chamado **`sprint-07-js-test-runner`** inicializado com `README.md` e `.gitignore` (ignorando `node_modules/`, `.env` e `.DS_Store`).
2. **Fluxo Git Profissional:** Criar uma branch chamada **`feat/test-runner-js`** para desenvolver o projeto e, ao finalizar, abrir um **Pull Request** realizando o **Merge** para a `main`.
3. **Estrutura de Pastas do Projeto:**
   ```text
   sprint-07-js-test-runner/
   ├── .gitignore
   ├── README.md
   ├── src/
   │   ├── massaDados.js
   │   ├── validacoes.js
   │   └── index.js
   ```
4. **Regras de Implementação em JavaScript:**
   - **`src/massaDados.js`:** Exportar um array de objetos contendo no mínimo **5 cenários de teste** de API com `id`, `cenario`, `statusEsperado`, `statusObtido` e `tempoMs`.
   - **`src/validacoes.js`:** Implementar funções (incluindo _Arrow Functions_) para validar se `statusObtido === statusEsperado` e verificar se o `tempoMs <= 1000` (SLA de performance).
   - **`src/index.js`:** Criar uma função principal `async` que percorra todos os cenários da suíte usando `await` para simular o tempo de resposta de cada requisição, exiba o log detalhado (`✅ PASS` ou `❌ FAIL`) e imprima o **Resumo Final** (Total executado, Aprovados, Reprovados e Taxa de Sucesso %).
5. **Documentação no `README.md`:** Explicar o objetivo do projeto, a estrutura de arquivos e o comando de execução (`node src/index.js`).

**Exemplo 8.1: Estrutura base do executor assíncrono (`src/index.js`)**

```javascript
const simularRequisicao = (cenario) => {
  return new Promise((resolve) => {
    setTimeout(() => {
      const passou = cenario.statusObtido === cenario.statusEsperado;
      resolve({ ...cenario, passou });
    }, cenario.tempoMs);
  });
};

const executarSuite = async (listaCenarios) => {
  console.log("🚀 Iniciando execução da Suíte de Testes QA...\n");
  let aprovados = 0;
  let reprovados = 0;

  for (const item of listaCenarios) {
    const resultado = await simularRequisicao(item);
    if (resultado.passou) {
      aprovados++;
      console.log(
        `✅ [${resultado.id}]${resultado.cenario} - PASS (${resultado.tempoMs}ms)`,
      );
    } else {
      reprovados++;
      console.log(
        `❌ [${resultado.id}] ${resultado.cenario} - FAIL (Esperado:${resultado.statusEsperado} | Obtido: ${resultado.statusObtido})`,
      );
    }
  }
  console.log("\n📊 RESUMO DA EXECUÇÃO:");
  console.log(
    `Total: ${listaCenarios.length} | Aprovados: ${aprovados} \vert{} Reprovados:${reprovados}`,
  );
};
```

---

#### 🚀 Como Enviar seu Projeto para Aprovação

Após concluir o **Merge** do seu Pull Request na branch `main`, registre a entrega oficial do seu projeto:

1. Acesse a aba **Issues** do repositório oficial da Trilha QA Academy:  
   👉 **[Enviar Projeto na Aba Issues](https://github.com/AlexandreTI-AUT/trilha-qa-academy/issues)**
2. Clique no botão **`New issue`**.
3. Preencha o título seguindo o padrão:  
   `[Entrega Sprint 07] Test Runner JS - Seu Nome Completo`
4. Na descrição, informe o link do seu repositório público (`sprint-07-js-test-runner`) e o link do Pull Request mergeado, depois clique em **`Submit new issue`**.

📹 **Assista à aula prática e passo a passo do Projeto (Módulo 8):**
<br>
_(Espaço reservado para inserção do vídeo e thumbnail do Módulo 8)_
