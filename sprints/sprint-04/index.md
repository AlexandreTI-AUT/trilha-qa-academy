![Banner Trilha QA Academy](../../assets/images/banner-site.jpg)

# ⚙️ Sprint 04: Testes de API REST, Arquitetura Backend e Postman na Prática

Bem-vindo à **Sprint 04** da **Trilha QA Academy**!

Nesta sprint, você dará um dos passos mais importantes na sua jornada como Engenheiro de Qualidade. Você deixará de testar apenas a camada visual (_Front-end_) e passará a testar a **camada de serviços e regras de negócio (_Back-end_)**.

Dominar testes de API é um divisor de águas no mercado de tecnologia: permite identificar falhas de segurança, erros de lógica e problemas de integração muito antes da interface gráfica ser construída.

Para este treinamento, utilizaremos a API pública **ServeRest** (`https://serverest.dev/`) — a plataforma de testes de API mais popular do Brasil — e o **Postman**, a ferramenta padrão de mercado para execução, automação e documentação de APIs REST.

---

## 🧠 Módulo 1: Arquitetura Backend, Protocolo HTTP e APIs REST

### 1. O que é uma API e por que testá-la?

**API** (_Application Programming Interface_ ou Interface de Programação de Aplicações) é o conjunto de rotinas e padrões de programação que permite que dois sistemas totalmente distintos se comuniquem sem a necessidade de intervenção humana ou de uma interface visual (UI).

Na **Pirâmide de Testes de Software**:

- **Testes de UI (Topo):** Lentos, frágeis a mudanças de layout e caros de manter.
- **Testes de API / Serviços (Meio):** Rápidos, extremamente estáveis, baratos de manter e com altíssimo retorno sobre o investimento (ROI).

Ao testar APIs, o QA garante que as regras de negócio e a segurança do banco de dados estão blindadas, independentemente de o acesso vir de um navegador web, de um aplicativo iOS ou Android, ou de um sistema parceiro.

---

### 2. O Protocolo HTTP e a Arquitetura REST

Uma API **REST** (_Representational State Transfer_) é um estilo arquitetural que utiliza o protocolo HTTP para trafegar dados. Toda comunicação entre o cliente (Postman/Navegador) e o servidor ocorre através de pares de **Request (Requisição)** e **Response (Resposta)**.

#### A Anatomia de uma Requisição HTTP (Request):

1.  **URL Base / Host:** O endereço do servidor (ex: `https://serverest.dev`).
2.  **Endpoint / Path:** O recurso específico que você deseja acessar (ex: `/usuarios`, `/produtos`, `/login`).
3.  **Parâmetros (Params):**
    - **Query Params:** Filtros na URL após o símbolo `?` (ex: `{{baseUrl}}/usuarios?nome=Fulano`).
    - **Path Params:** Identificadores diretos no caminho da URL (ex: `{{baseUrl}}/usuarios/0uxHb7Pkg2055zH6`).
4.  **Headers (Cabeçalhos):** Metadados da requisição, como o tipo de conteúdo aceito (`Content-Type: application/json`) ou tokens de segurança (`Authorization: Bearer <token>`).
5.  **Body (Corpo / Payload):** Os dados brutos enviados para criação ou alteração (geralmente em formato JSON).

---

### 3. Os Métodos HTTP (Verbos)

O método HTTP indica ao servidor qual ação deve ser executada sobre o recurso consultado:

| Método        | Ação                | Descrição Técnica                                                                                | Exemplo em `/usuarios`                                  |
| :------------ | :------------------ | :----------------------------------------------------------------------------------------------- | :------------------------------------------------------ |
| **`GET`**     | Consultar           | Busca informações no servidor sem alterar o estado do banco. É um método _idempotente_ e seguro. | Listar todos os usuários ou buscar um usuário por ID.   |
| **`POST`**    | Criar               | Envia dados no corpo da requisição para criar um novo registro no banco.                         | Cadastrar um novo usuário no sistema.                   |
| **`PUT`**     | Atualizar (Total)   | Substitui **integralmente** todos os campos de um registro existente.                            | Atualizar nome, e-mail, senha e status de um usuário.   |
| **`PATCH`**   | Modificar (Parcial) | Altera **apenas os campos especificados** de um registro existente.                              | Alterar somente o e-mail do usuário sem mexer na senha. |
| **`DELETE`**  | Remover             | Deleta permanentemente um registro do banco de dados.                                            | Excluir o cadastro de um usuário pelo seu `_id`.        |
| **`OPTIONS`** | Inspecionar         | Retorna quais métodos HTTP são permitidos para aquele endpoint (usado para políticas CORS).      | Verificar permissões da API.                            |

---

### 4. Status Codes (Códigos de Resposta HTTP)

Toda _Response_ retornada pelo servidor acompanha um código numérico padronizado internacionalmente. Como QA, você deve conhecer e auditar cada uma dessas faixas:

#### 🟢 Faixa 2xx — Sucesso (Success)

- `200 OK`: Requisição processada com sucesso (comum em `GET`, `PUT`, `DELETE`).
- `201 Created`: Novo recurso criado com sucesso no banco de dados (padrão para `POST`).
- `204 No Content`: Requisição bem-sucedida, mas o servidor não precisa retornar corpo de resposta.

#### 🟡 Faixa 3xx — Redirecionamento (Redirection)

- `301 Moved Permanently`: O recurso mudou de endereço permanentemente.
- `304 Not Modified`: O conteúdo não mudou desde a última consulta (uso de cache).

#### 🔴 Faixa 4xx — Erro do Cliente (Client Error)

- `400 Bad Request`: Erro de validação (campos obrigatórios ausentes, formato inválido ou regra de negócio violada).
- `401 Unauthorized`: Autenticação necessária ou token de acesso ausente/inválido.
- `403 Forbidden`: O cliente está autenticado, mas não tem permissão para acessar aquele recurso (ex: usuário comum tentando ação de admin).
- `404 Not Found`: O endpoint ou o ID buscado não existe no servidor.
- `405 Method Not Allowed`: O método HTTP utilizado não é suportado pelo endpoint (ex: tentar dar `POST` em uma rota que só aceita `GET`).
- `422 Unprocessable Entity`: Erro de sintaxe nos dados enviados.

#### 💥 Faixa 5xx — Erro do Servidor (Server Error)

- `500 Internal Server Error`: Erro não tratado no código do Back-end (bug grave no servidor).
- `502 Bad Gateway`: Erro de comunicação entre servidores proxy/gateway.
- `503 Service Unavailable`: O servidor está temporariamente indisponível por sobrecarga ou manutenção.

---

### 🎯 Atividade Prática do Módulo 1:

1. Abra o seu navegador e acesse a documentação da ServeRest em `https://serverest.dev/`.
2. Identifique os endpoints listados para os recursos `/usuarios`, `/login`, `/produtos` e `/carrinhos`.
3. No seu caderno de estudos, liste 2 exemplos de requisições que deveriam retornar `201 Created` e 2 exemplos que deveriam retornar `400 Bad Request`.

---

📹 **Assista à aula técnica completa sobre o Módulo 1:**
<br>
[![Aula Prática: Arquitetura Backend e APIs REST](https://img.youtube.com/vi/1sSBsViF0eU/maxresdefault.jpg)](https://youtu.be/1sSBsViF0eU)

---

## 🛠️ Módulo 2: Estrutura JSON, Instalação e Configuração do Postman

### 1. O que é o JSON?

**JSON** (_JavaScript Object Notation_) é o formato leve e universal utilizado para troca de dados entre aplicações web modernas. Ele é estruturado na forma de pares de **"Chave": Valor**.

```json
{
  "nome": "Alexandre Silva",
  "email": "alexandre@trilhaqa.com.br",
  "password": "teste123password",
  "administrador": "true",
  "habilidades": ["Postman", "REST", "BDD"],
  "endereco": {
    "cidade": "São Paulo",
    "uf": "SP"
  }
}
```

#### Regras de Sintaxe do JSON:

- As chaves obrigatoriamente usam **aspas duplas** (`"nome"`).
- **String (Texto):** Sempre entre aspas duplas `"Alexandre"`.
- **Number (Número):** Numérico direto sem aspas `46` ou `199.90`.
- **Boolean (Lógico):** `true` ou `false` (sem aspas).
- **Null (Vazio):** `null` para campos sem valor.
- **Array (Lista):** Elementos ordenados entre colchetes `[ "item1", "item2" ]`.
- **Object (Objeto):** Estruturas aninhadas entre chaves `{ ... }`.

---

### 2. Guia de Instalação e Configuração do Postman

O **Postman** é o cliente HTTP mais robusto do mercado para testar APIs.

> 📄 **Material de Apoio:** Baixe o documento com o passo a passo ilustrado para acompanhamento das telas:  
> 👉 **[Baixar Guia de Instalação do Postman (PDF)](./Guia%20de%20Instala%C3%A7%C3%A3o%20do%20Postman.pdf)**

1. Acesse o site oficial: [https://www.postman.com/downloads/](https://www.postman.com/downloads/).
2. Baixe e instale a versão correspondente ao seu sistema operacional (Windows, macOS ou Linux).
3. Consulte o **[Guia de Instalação do Postman (PDF)](./Guia%20de%20Instala%C3%A7%C3%A3o%20do%20Postman.pdf)** disponível na pasta da sprint para seguir a configuração passo a passo com prints do instalador.
4. Abra o Postman e faça login com a sua conta (ou crie uma conta gratuita para sincronizar suas coleções).
5. Crie uma nova **Workspace** compartilhada ou pessoal chamada `Trilha QA Academy`.

---

### 3. Organização Profissional no Postman (Collections & Folders)

Para evitar uma bagunça de requisições soltas, todo QA profissional organiza suas suítes em **Collections**:

- **Collection (Coleção):** É a pasta raiz do projeto de teste da API (ex: `ServeRest API`).
- **Folders (Pastas):** Subpastas organizadas por recurso da API (ex: `Usuarios`, `Autenticacao`, `Produtos`).
- **Requests (Requisições):** As requisições individuais nomeadas com o objetivo claro (ex: `POST - Cadastrar Usuario Com Sucesso`).

---

### 🎯 Atividade Prática do Módulo 2:

1. Instale o Postman no seu computador e crie a Workspace `Trilha QA Academy`.
2. Crie uma Collection chamada `ServeRest API` e adicione uma pasta chamada `Usuarios`.
3. Escreva manualmente um payload em formato JSON com seus dados hipotéticos e valide a sintaxe usando um validador online ou no próprio Postman.

---

📹 **Assista à aula técnica completa sobre o Módulo 2:**
<br>
[![Aula Prática: Instalação do Postman e Estrutura JSON](https://img.youtube.com/vi/9_74hrUWLHI/maxresdefault.jpg)](https://youtu.be/9_74hrUWLHI)

---

## 🔑 Módulo 3: Requisições Práticas, Variáveis e Autenticação (Token Bearer)

### 1. Primeira Requisição Prática: `GET /usuarios`

1. Na pasta `Usuarios` da sua Collection no Postman, adicione uma nova requisição.
2. Defina o método como **`GET`**.
3. Insira a URL: `https://serverest.dev/usuarios`.
4. Clique em **Send**.
5. Observe o retorno no painel inferior:
   - **Status Code:** `200 OK`.
   - **Time:** Tempo de resposta em milissegundos (ex: `120 ms`).
   - **Body:** A lista contendo a quantidade e a relação de usuários cadastrados na ServeRest.

---

### 2. Variáveis de Ambiente no Postman (Environments)

Trabalhar com URLs completas fixas (ex: `https://serverest.dev`) é uma péssima prática. Se o servidor mudar de endereço (ex: para ambiente de Homologação), você precisaria alterar dezenas de requisições manualmente.

#### Como criar e usar um Environment:

1. No menu lateral esquerdo do Postman, clique no ícone **Environments** > **+ (Create Environment)**.
2. Nomeie o ambiente como `ServeRest - Producao`.
3. Crie a variável:
   - **Variable:** `baseUrl`
   - **Initial Value:** `https://serverest.dev`
   - **Current Value:** `https://serverest.dev`
4. No canto superior direito do Postman, selecione o ambiente criado no menu _dropdown_.
5. Atualize as suas URLs para a sintaxe dinâmica: `{{baseUrl}}/usuarios`.

---

### 3. Autenticação e Extração Dinâmica de Token JWT (`POST /login`)

Muitas rotas de uma API (como cadastrar produtos ou deletar registros) exigem que o cliente esteja autenticado. Essa segurança é garantida enviando um **Bearer Token (JWT)** no cabeçalho das requisições.

#### Passo 1: Executar o Login (`POST /login`)

- **Método:** `POST`
- **URL:** `{{baseUrl}}/login`
- **Headers:** `Content-Type: application/json`
- **Body (raw JSON):**

```json
{
  "email": "fulano@qa.com",
  "password": "teste"
}
```

#### Passo 2: A Resposta com o Token

Ao submeter credenciais válidas, a API retorna o Status Code `200 OK` e o token no corpo da resposta:

```json
{
  "message": "Login realizado com sucesso",
  "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImZ1bGFub0BxYS5jb20iLCJpYXQiOjE3MD..."
}
```

#### Passo 3: Script para Salvar o Token Automaticamente

Para não precisar copiar e colar o token manualmente a cada login, o Postman permite executar scripts em JavaScript na aba **Tests** da requisição:

```javascript
// Captura o corpo da resposta em JSON
var jsonData = pm.response.json();

// Extrai o valor do header de autorizacao e salva na variavel do ambiente
pm.environment.set("token", jsonData.authorization);

console.log("Token armazenado com sucesso: " + pm.environment.get("token"));
```

#### Passo 4: Utilizando o Token Bearer em Rotas Protegidas

Nas requisições que exigem autenticação:

1. Acesse a aba **Authorization** da requisição.
2. No campo **Type**, selecione **Bearer Token**.
3. No campo **Token**, insira a variável `{{token}}`.

---

### 🎯 Atividade Prática do Módulo 3:

1. Crie o Environment `ServeRest - Producao` e configure a variável `baseUrl`.
2. Monte a requisição `POST /login` e execute o script na aba **Tests** para salvar o token automaticamente.
3. Inspecione as variáveis de ambiente e confirme se o token foi gravado com sucesso.

---

📹 **Assista à aula técnica completa sobre o Módulo 3:**
<br>
[![Aula Prática: Requisições, Variáveis e Autenticação JWT](https://img.youtube.com/vi/ID_DO_VIDEO_S04M03/maxresdefault.jpg)](https://youtu.be/ID_DO_VIDEO_S04M03)

---

## 📋 Módulo 4: Projeto Prático da Sprint 04 (Cadastro de Usuários com BDD e Postman)

Neste projeto prático, você aplicará todo o conhecimento adquirido. Você atuará como o QA responsável por mapear, testar e automatizar as validações do endpoint **`POST /usuarios`** da plataforma ServeRest.

---

### 📄 Especificação do Endpoint: `POST /usuarios`

- **URL:** `{{baseUrl}}/usuarios`
- **Método HTTP:** `POST`
- **Headers:** `Content-Type: application/json`
- **Payload de Exemplo (Request Body):**

```json
{
  "nome": "Fulano da Silva",
  "email": "fulano.silva@trilhaqa.com.br",
  "password": "teste",
  "administrador": "true"
}
```

#### Regras de Negócio e Critérios de Aceite:

1.  **Campos Obrigatórios:** Todos os campos (`nome`, `email`, `password`, `administrador`) são de preenchimento obrigatório.
2.  **Unicidade de E-mail:** Não é permitido cadastrar dois usuários com o mesmo endereço de e-mail na base de dados.
3.  **Valor do Administrador:** O campo `administrador` deve aceitar estritamente os valores `"true"` ou `"false"`.
4.  **Resposta de Sucesso:** Em caso de cadastro bem-sucedido, a API deve retornar o código `201 Created`, a mensagem `"Cadastro realizado com sucesso"` e a chave `"_id"` gerada.

---

### ✍️ Passo 1: Mapeamento dos Cenários de Teste em BDD (Gherkin)

Abra o seu **VS Code**, crie a pasta do projeto `projeto-api-serverest/features/` e crie o arquivo `cadastrar_usuario.feature`.

Escreva a especificação BDD utilizando **palavras-chave em inglês** (_Given, When, Then, And_) para cobrir cenários positivos e negativos:

```gherkin
Feature: Registration of Users (POST /usuarios)
  As an API client
  I want to register new users in the ServeRest platform
  So that they can access the system according to their permissions

  Scenario: Success - Register a new user with valid data (201 Created)
    Given that I have a valid user payload with a unique email
    When I send a POST request to "{{baseUrl}}/usuarios"
    Then the response status code should be 201
    And the response body should contain the message "Cadastro realizado com sucesso"
    And the response body should contain a valid "_id"

  Scenario: Error - Try to register a user with an already existing email (400 Bad Request)
    Given that I have a user payload with an email that is already registered in the database
    When I send a POST request to "{{baseUrl}}/usuarios"
    Then the response status code should be 400
    And the response body should contain the message "Este email já está sendo usado"

  Scenario: Error - Try to register a user without the required field "email" (400 Bad Request)
    Given that I have a user payload missing the "email" field
    When I send a POST request to "{{baseUrl}}/usuarios"
    Then the response status code should be 400
    And the response body should contain the message "email é obrigatório"

  Scenario: Error - Try to register a user without the required field "password" (400 Bad Request)
    Given that I have a user payload missing the "password" field
    When I send a POST request to "{{baseUrl}}/usuarios"
    Then the response status code should be 400
    And the response body should contain the message "password é obrigatório"
```

---

### 🧪 Passo 2: Construção e Automação de Testes no Postman

No Postman, crie as requisições correspondentes a cada cenário BDD mapeado. Na aba **Tests** de cada requisição, insira as asserções automatizadas em JavaScript:

#### 1. Para a Requisição: `POST - Criar Usuario Sucesso` (Status 201)

```javascript
// Teste 1: Valida o Status Code 201
pm.test("Status code é 201 Created", function () {
  pm.response.to.have.status(201);
});

// Teste 2: Valida a mensagem de sucesso no JSON
pm.test("Mensagem de retorno é 'Cadastro realizado com sucesso'", function () {
  var jsonData = pm.response.json();
  pm.expect(jsonData.message).to.eql("Cadastro realizado com sucesso");
});

// Teste 3: Valida se o ID foi gerado
pm.test("Retorna um ID de usuario valido", function () {
  var jsonData = pm.response.json();
  pm.expect(jsonData._id).to.be.a("string").that.is.not.empty;
});
```

#### 2. Para a Requisição: `POST - Criar Usuario Email Duplicado` (Status 400)

```javascript
// Teste 1: Valida o Status Code 400
pm.test("Status code é 400 Bad Request", function () {
  pm.response.to.have.status(400);
});

// Teste 2: Valida a mensagem de erro de e-mail duplicado
pm.test("Mensagem de erro é 'Este email já está sendo usado'", function () {
  var jsonData = pm.response.json();
  pm.expect(jsonData.message).to.eql("Este email já está sendo usado");
});
```

---

### 🐞 Passo 3: Gestão de Defeitos (`bugs/`)

Durante os seus testes na ServeRest, se você encontrar qualquer divergência entre a resposta retornada pela API e as Regras de Negócio descritas na documentação:

1. No seu VS Code, crie a pasta `bugs/`.
2. Crie o arquivo `bug-01-descricao-do-erro.md`.
3. Preencha o **Bug Report** profissional com os dados técnicos do contrato da API:
   - **Título:** Breve e objetivo indicando o endpoint e o erro.
   - **Endpoint & Método:** (ex: `POST /usuarios`).
   - **Payload Enviado (Request Body).**
   - **Resultado Esperado vs. Resultado Atual** (Status Code e JSON de resposta).
   - **Evidências:** Captura de tela (_print_) da requisição executada no Postman com o painel de resposta aberto.

---

### 📁 Passo 4: Estrutura de Pastas do Projeto no VS Code

A sua entrega deve estar organizada na seguinte estrutura de arquivos:

```text
projeto-api-serverest/
├── collections/
│   ├── ServeRest_API.postman_collection.json
│   └── ServeRest_Env.postman_environment.json
├── features/
│   └── cadastrar_usuario.feature
└── bugs/
    └── bug-01-exemplo.md
```

#### Como Exportar do Postman:

- **Collection:** Clique nos três pontos `...` ao lado da Collection `ServeRest API` > **Export** > Escolha a opção **Collection v2.1 (recommended)** > Salve na pasta `collections/`.
- **Environment:** Clique em **Environments** > Selecione `ServeRest - Producao` > Clique nos três pontos `...` > **Export** > Salve na pasta `collections/`.

---

### 🚀 Passo 5: Entregando o seu Projeto no GitHub

1. Suba a sua pasta **`projeto-api-serverest`** para o seu repositório pessoal no GitHub.
2. Acesse o repositório oficial da Trilha QA Academy e abra uma nova **Issue** informando a sua entrega da Sprint 04:
   👉 **[Entregar Projeto da Sprint 04 no GitHub (Abrir Issue)](https://github.com/AlexandreTI-AUT/trilha-qa-academy/issues)**
3. Preencha o template informando a conclusão da Sprint 04 e inclua o link direto do seu projeto para receber feedback e code review da comunidade!

---

📹 **Assista à apresentação do Projeto Prático da Sprint 04:**
<br>
[![Apresentação do Projeto Prático: Testes de API no Postman](https://img.youtube.com/vi/ID_DO_VIDEO_S04M04/maxresdefault.jpg)](https://youtu.be/ID_DO_VIDEO_S04M04)

---
