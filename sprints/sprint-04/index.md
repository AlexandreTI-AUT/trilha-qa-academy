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

📹 **Assista às aulas técnicas completas sobre o Módulo 3:**

**Parte 1: Requisições, Variáveis de Ambiente e CRUD Completo**
<br>
[![Aula Prática: Requisições, Variáveis e CRUD Completo](https://img.youtube.com/vi/ylnFU54wGVw/maxresdefault.jpg)](https://youtu.be/ylnFU54wGVw)

<br>

**Parte 2: Autenticação e Extração Dinâmica de Token JWT**
<br>
[![Aula Prática: Autenticação e Extração Dinâmica de Token JWT](https://img.youtube.com/vi/aKIvPsHOhsY/maxresdefault.jpg)](https://youtu.be/aKIvPsHOhsY)

---

### 🌐 4. Manipulação de cURL e Variáveis Dinâmicas no Postman

Nesta seção, abordamos duas funcionalidades indispensáveis para a produtividade de um Engenheiro de Qualidade: o intercâmbio de requisições via comandos **cURL** entre equipes e a geração de massa de dados dinâmicos com **Dynamic Variables** para garantir a independência de testes de regressão.

---

#### 4.1. Trabalhando com Comandos cURL

O **cURL** (_Client URL_) é uma ferramenta de linha de comando para transferência de dados suportada por praticamente todos os sistemas operacionais e linguagens de programação. No dia a dia de projetos de software, desenvolvedores e profissionais de QA utilizam a sintaxe cURL como padrão universal para compartilhar chamadas de API via Slack, Jira ou documentações.

##### 📥 Importando um Comando cURL para o Postman

Para converter um comando cURL recebido em uma requisição estruturada no Postman:

1. Copie o comando cURL completo.
2. No menu superior esquerdo do Postman, clique no botão **Import**.
3. Cole a linha de comando no campo de texto central.
4. O Postman interpretará automaticamente a URL, o método HTTP, os cabeçalhos (_Headers_) e o corpo da requisição (_Body_).
5. Clique em **Import** e salve a requisição dentro da sua **Collection**.

###### Exemplo de cURL para Importação (`POST /usuarios`):

```bash
curl -X POST [https://serverest.dev/usuarios](https://serverest.dev/usuarios) \
  -H 'Content-Type: application/json' \
  -d '{
    "nome": "Fulano de Tal",
    "email": "fulano.teste@qa.com",
    "password": "teste123password",
    "administrador": "true"
  }'
```

##### 📤 Exportando uma Requisição do Postman para cURL

Para compartilhar uma requisição configurada no Postman com um desenvolvedor (ex: para reprodução de um bug):

1. Abra a requisição desejada na sua coleção.
2. No painel lateral direito, clique no ícone **Code Snippet** (`</>`).
3. No dropdown de linguagens de programação, selecione **cURL**.
4. Clique no botão **Copy to clipboard**.
5. Cole o comando na documentação do bug ou no canal do time.

> 💡 **Dica de Ouro:** O cURL gerado pelo Postman inclui todos os cabeçalhos ativados e o payload exato configurado, permitindo que qualquer pessoa execute a mesma chamada direto pelo terminal do computador.

---

#### 4.2. Variáveis Dinâmicas (_Dynamic Variables_)

##### O Problema da Massa de Dados Estática

Ao executar requisições de cadastro (como `POST /usuarios`) utilizando dados fixos (_hardcoded_), a primeira execução retorna `Status 201 Created`. No entanto, a partir da segunda execução, a API rejeita a requisição retornando **`Status 400 Bad Request`** com a mensagem de erro:

```json
{
  "message": "Este email já está sendo usado"
}
```

Para garantir que as suítes de teste automatizadas sejam executadas de forma **independente, idempotente e sem falhas por duplicidade**, utilizamos as **Dynamic Variables** nativas do Postman.

##### Como Funcionam as Dynamic Variables (`{{$random...}}`)

O Postman integra internamente a biblioteca **Faker.js**, permitindo gerar valores aleatórios e válidos em tempo de execução através da sintaxe de chaves duplas iniciada por cifrão: **`{{$randomNameVariable}}`**.

###### Principais Variáveis Dinâmicas para Testes de API:

| Variável Dinâmica          | Descrição                                           | Exemplo de Retorno em Tempo de Execução  |
| :------------------------- | :-------------------------------------------------- | :--------------------------------------- |
| `{{$randomFullName}}`      | Gera um nome e sobrenome aleatórios                 | `"Ana Carolina Silva"`                   |
| `{{$randomEmail}}`         | Gera um e-mail com domínio aleatório e único        | `"claudia_macedo@yahoo.com"`             |
| `{{$randomPassword}}`      | Gera uma senha forte aleatória                      | `"a9B_k2L8qM"`                           |
| `{{$randomUUID}}`          | Gera um identificador único universal (UUID v4)     | `"f47ac10b-58cc-4372-a567-0e02b2c3d479"` |
| `{{$randomPhoneNumber}}`   | Gera um número de telefone no formato internacional | `"+55 11 98823-4412"`                    |
| `{{$randomStreetAddress}}` | Gera um endereço residencial fictício               | `"Avenida Paulista, 1500"`               |

##### Comparativo Prático: Payload Estático vs. Payload Dinâmico

###### ❌ Abordagem Estática (Falha no 2º disparo):

```json
{
  "nome": "Fulano da Silva",
  "email": "fulano.silva@qa.com",
  "password": "teste123password",
  "administrador": "true"
}
```

###### ✅ Abordagem Dinâmica (Execução ilimitada com sucesso):

```json
{
  "nome": "{{$randomFullName}}",
  "email": "{{$randomEmail}}",
  "password": "{{$randomPassword}}",
  "administrador": "true"
}
```

---

#### 4.3. Checklist Prático do Módulo

- [ ] Importar um comando cURL para o Postman usando o botão **Import**.
- [ ] Exportar uma requisição existente para o formato cURL utilizando a aba **Code Snippet (`</>`)**.
- [ ] Atualizar o corpo (_Body_) da requisição `POST /usuarios` substituindo os dados estáticos pelas variáveis `{{$randomFullName}}`, `{{$randomEmail}}` e `{{$randomPassword}}`.
- [ ] Disparar a requisição `POST /usuarios` 3 vezes consecutivas e validar que todas retornaram **`Status 201 Created`**.

---

📹 **Assista à aula técnica completa sobre o Módulo 4:**
<br>
[![Aula Prática: Comandos cURL e Variáveis Dinâmicas no Postman](https://img.youtube.com/vi/xkUi2KFu41c/maxresdefault.jpg)](https://youtu.be/xkUi2KFu41c)

---

### 🧪 5. Automação de Testes com JavaScript no Postman

Nesta seção, exploramos a aba **Tests** do Postman para transformar requisições manuais em **suítes de testes automatizados**. Através de scripts em JavaScript e da biblioteca de asserções **Chai.js** nativa do Postman, validamos contratos de API, códigos de status HTTP e mensagens de resposta de forma instantânea e determinística.

---

#### 5.1. Fundamentos da Aba Tests e da PM API

A aba **Tests** é executada automaticamente pelo Postman **logo após** o recebimento da resposta HTTP enviada pelo servidor. Nela, temos acesso ao objeto global `pm` (_Postman Sandbox API_), que fornece métodos para inspecionar a resposta e definir o resultado dos testes.

##### Estrutura Básica de uma Asserção (`pm.test`):

```javascript
pm.test("Descrição clara do que está sendo testado", function () {
  // Código de validação utilizando Chai.js
});
```

- **`pm.test()`**: Função responsável por registrar um teste no painel de resultados. Recebe dois parâmetros: o título do teste e uma função callback com as verificações.
- **`pm.response`**: Objeto que contém todas as informações da resposta retornada (Status Code, Body, Headers, Tempo de Resposta).
- **`pm.expect()`**: Sintaxe da biblioteca Chai.js no formato BDD (_Behavior-Driven Development_) para construir asserções legíveis e expressivas.

---

#### 5.2. Principais Tipos de Validações e Sintaxe Chai.js

##### 1. Validação de Status Code HTTP

Garante que a resposta retornou o código de status esperado para o cenário testado.

```javascript
// Exemplo: Validar Status Code 200 OK ou 201 Created
pm.test("Status code é 201 Created", function () {
  pm.response.to.have.status(201);
});
```

##### 2. Conversão e Inspeção do Corpo da Resposta (JSON Body)

Para validar chaves e valores dentro da resposta JSON, primeiro convertemos o corpo da resposta em um objeto JavaScript através de `pm.response.json()`.

```javascript
var jsonData = pm.response.json();
```

##### 3. Validação de Conteúdo da Mensagem (`to.eql`)

Verifica se o valor de uma propriedade específica no JSON é idêntico ao valor esperado pela regra de negócio.

```javascript
pm.test("Mensagem de retorno é 'Cadastro realizado com sucesso'", function () {
  var jsonData = pm.response.json();
  pm.expect(jsonData.message).to.eql("Cadastro realizado com sucesso");
});
```

##### 4. Validação de Tipos e Campos Não Vazio (`to.be.a` / `is.not.empty`)

Garante a integridade do contrato da API validando o tipo do dado e assegurando que um identificador gerado pelo banco de dados não retornou nulo ou vazio.

```javascript
pm.test("Retorna um ID de usuário válido", function () {
  var jsonData = pm.response.json();
  pm.expect(jsonData._id).to.be.a("string").that.is.not.empty;
});
```

---

#### 5.3. Construção Prática de Testes Automatizados

A seguir, apresentamos a implementação completa das suítes de testes automatizados para os cenários positivo (caminho feliz) e negativo (validação de regra de negócio) mapeados no projeto.

##### 1. Requisição: `POST - Criar Usuario Sucesso` (Status 201)

Insira as seguintes asserções na aba **Tests** da requisição de cadastro com massa dinâmica:

```javascript
// Teste 1: Valida o Status Code HTTP 201 Created
pm.test("Status code é 201 Created", function () {
  pm.response.to.have.status(201);
});

// Teste 2: Valida a mensagem de sucesso retornada no JSON
pm.test("Mensagem de retorno é 'Cadastro realizado com sucesso'", function () {
  var jsonData = pm.response.json();
  pm.expect(jsonData.message).to.eql("Cadastro realizado com sucesso");
});

// Teste 3: Valida se o ID foi gerado como String e não está vazio
pm.test("Retorna um ID de usuario valido", function () {
  var jsonData = pm.response.json();
  pm.expect(jsonData._id).to.be.a("string").that.is.not.empty;
});
```

##### 2. Requisição: `POST - Criar Usuario Email Duplicado` (Status 400)

Insira as seguintes asserções na aba **Tests** da requisição configurada com um e-mail já existente na base de dados:

```javascript
// Teste 1: Valida o Status Code HTTP 400 Bad Request
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

#### 5.4. Execução e Leitura da Aba Test Results

Ao clicar em **Send** após salvar os scripts na aba **Tests**:

1. Observe o painel inferior de resposta HTTP.
2. Clique na aba **Test Results** (localizada ao lado de _Body_ e _Headers_).
3. Cada asserção será exibida com a tag visual de resultado:
   - **PASS** (em verde): O teste passou e a API respondeu exatamente de acordo com a asserção.
   - **FAIL** (em vermelho): O teste falhou, exibindo o detalhamento do erro com a diferença entre o valor esperado (_expected_) e o recebido (_actual_).

---

#### 5.5. Checklist Prático do Módulo

- [ ] Acessar a aba **Tests** da requisição `POST - Criar Usuario Sucesso`.
- [ ] Implementar a validação de Status Code `201 Created`, mensagem de sucesso e verificação do campo `_id`.
- [ ] Acessar a aba **Tests** da requisição `POST - Criar Usuario Email Duplicado`.
- [ ] Implementar a validação de Status Code `400 Bad Request` e mensagem de erro de e-mail cadastrado.
- [ ] Executar ambas as requisições e validar que todas as asserções retornaram **PASS** no painel **Test Results**.

---

📹 **Assista à aula técnica completa sobre o Módulo 5:**
<br>
[![Aula Prática: Automação de Testes com JavaScript no Postman](https://img.youtube.com/vi/sJmGdid-2oQ/maxresdefault.jpg)](https://youtu.be/sJmGdid-2oQ)

---

## 📋 Módulo 6: Projeto Prático da Sprint 04 (Cadastro de Usuários com BDD e Postman)

Neste projeto prático, você aplicará todo o conhecimento adquirido. Você atuará como o QA responsável por mapear, testar e automatizar as validações do endpoint **`POST /usuarios`** da plataforma ServeRest.

---

📹 **Assista à apresentação do Projeto Prático da Sprint 04:**
<br>
[![Apresentação do Projeto Prático: Testes de API no Postman](https://img.youtube.com/vi/slg-AFJWiho/maxresdefault.jpg)](https://youtu.be/slg-AFJWiho)

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

### ⚙️ Regras de Negócio e Critérios de Aceite

O endpoint `POST /usuarios` é responsável pelo cadastramento de novos usuários na plataforma. Para garantir a integridade da aplicação e a qualidade do software, todos os testes devem validar rigorosamente o contrato de dados e as mensagens de erro retornadas pelo servidor.

---

#### 1. Tipagem e Formato dos Parâmetros

Todos os campos do payload de requisição devem ser enviados obrigatoriamente no formato **`string`**:

| Campo           | Tipo     | Obrigatoriedade | Descrição                                                             |
| :-------------- | :------- | :-------------- | :-------------------------------------------------------------------- |
| `nome`          | `string` | Obrigatório     | Nome completo do usuário. Não pode ser vazio.                         |
| `email`         | `string` | Obrigatório     | Endereço de e-mail do usuário. Deve ser único na base.                |
| `password`      | `string` | Obrigatório     | Senha de acesso do usuário. Não pode ser vazia.                       |
| `administrador` | `string` | Obrigatório     | Define o perfil de acesso. Aceita estritamente `"true"` ou `"false"`. |

---

#### 2. Mapeamento Completo dos Critérios de Aceite & Mensagens de Erro

##### CA-01: Cadastro com Sucesso (Caminho Feliz)

- **Condição:** Quando todos os campos forem preenchidos com valores válidos no formato `string`, o e-mail for inédito e o campo `administrador` for `"true"` ou `"false"`.
- **Status HTTP:** `201 Created`
- **Payload de Resposta:**
  ```json
  {
    "message": "Cadastro realizado com sucesso",
    "_id": "0uxT84nW8D2wWZp1"
  }
  ```

##### CA-02: Unicidade de E-mail (Regra de Negócio)

- **Condição:** Quando for enviada uma requisição com um e-mail que já existe na base de dados.
- **Status HTTP:** `400 Bad Request`
- **Mensagem de Erro:** `"Este email já está sendo usado"`
- **Payload de Resposta:**
  ```json
  {
    "message": "Este email já está sendo usado"
  }
  ```

##### CA-03: Validação do Campo Administrador

- **Condição:** Quando o campo `administrador` receber um valor diferente das strings `"true"` ou `"false"` (ex: tipo boolean `true`, `"sim"`, `"1"`, `"admin"`).
- **Status HTTP:** `400 Bad Request`
- **Mensagem de Erro:** `"administrador deve ser 'true' ou 'false'"`
- **Payload de Resposta:**
  ```json
  {
    "administrador": "administrador deve ser 'true' ou 'false'"
  }
  ```

##### CA-04: Campos Obrigatórios Ausentes ou Vazios

- **Condição:** Quando um ou mais campos não forem enviados no payload ou forem enviados como string vazia (`""`).
- **Status HTTP:** `400 Bad Request`
- **Mensagens de Erro por Campo:**
  - Campo `nome` ausente/vazio: `"nome não pode ficar em branco"`
  - Campo `email` ausente/vazio: `"email não pode ficar em branco"`
  - Campo `password` ausente/vazio: `"password não pode ficar em branco"`
  - Campo `administrador` ausente/vazio: `"administrador não pode ficar em branco"`

---

### ✍️ Passo 1: Mapeamento dos Cenários de Teste em BDD (Gherkin)

Abra o seu **VS Code**, crie a pasta do projeto `projeto-api-serverest/features/` e crie o arquivo `cadastrar_usuario.feature`.

Escreva a especificação BDD utilizando **palavras-chave em inglês** (_Given, When, Then, And_) para cobrir cenários positivos e negativos:

---

### 🧪 Passo 2: Construção e Automação de Testes no Postman

Após o mapeamento completo da funcionalidade em BDD, a etapa seguinte engloba a **execução e automação prática** no Postman.

Enquanto a especificação em BDD documenta a totalidade dos cenários da regra de negócio, a automação prática prioriza a validação dos pilares essenciais do contrato da API. Selecionamos requisições estratégicas que cobrem o **Caminho Feliz (201 Created)**, as **Regras Globais de Negócio (400 Bad Request)** e as **Validações de Campos Específicos (400 Bad Request)**, assegurando uma suíte de testes eficiente, legível e de alta manutenibilidade.

---

#### 1. Requisição: `POST - Criar Usuario Sucesso` (Status 201)

No painel da requisição, configure um payload dinâmico na aba **Body** (`raw` > `JSON`) com as variáveis `{{$randomFullName}}`, `{{$randomEmail}}` e `{{$randomPassword}}` para garantir testes independentes e idempotentes:

```json
{
  "nome": "{{$randomFullName}}",
  "email": "{{$randomEmail}}",
  "password": "{{$randomPassword}}",
  "administrador": "true"
}
```

Na aba **Tests**, insira o script de automação em JavaScript:

```javascript
// Teste 1: Valida o código de status HTTP 201 Created
pm.test("Status code é 201 Created", function () {
  pm.response.to.have.status(201);
});

// Teste 2: Valida a mensagem de sucesso retornada no corpo JSON
pm.test("Mensagem de retorno é 'Cadastro realizado com sucesso'", function () {
  var jsonData = pm.response.json();
  pm.expect(jsonData.message).to.eql("Cadastro realizado com sucesso");
});

// Teste 3: Valida a integridade do contrato (chave _id gerada e preenchida)
pm.test("Retorna um _id de usuário válido", function () {
  var jsonData = pm.response.json();
  pm.expect(jsonData._id).to.be.a("string").that.is.not.empty;
});
```

---

#### 2. Requisição: `POST - Criar Usuario Email Duplicado` (Status 400)

Na aba **Body** (`raw` > `JSON`), utilize um e-mail estático previamente cadastrado no banco de dados (ex: `fulano@qa.com`):

```json
{
  "nome": "Fulano de Tal",
  "email": "fulano@qa.com",
  "password": "teste123password",
  "administrador": "false"
}
```

Na aba **Tests**, insira o script de automação em JavaScript:

```javascript
// Teste 1: Valida o código de status HTTP 400 Bad Request
pm.test("Status code é 400 Bad Request", function () {
  pm.response.to.have.status(400);
});

// Teste 2: Valida a mensagem global de erro de e-mail cadastrado
pm.test("Mensagem de erro é 'Este email já está sendo usado'", function () {
  var jsonData = pm.response.json();
  pm.expect(jsonData.message).to.eql("Este email já está sendo usado");
});
```

---

#### 3. Requisição: `POST - Criar Usuario Administrador Inválido` (Status 400)

Na aba **Body** (`raw` > `JSON`), informe um valor fora do domínio aceito pelo campo `administrador` (ex: `"invalido"`):

```json
{
  "nome": "{{$randomFullName}}",
  "email": "{{$randomEmail}}",
  "password": "{{$randomPassword}}",
  "administrador": "invalido"
}
```

Na aba **Tests**, insira o script de automação em JavaScript:

```javascript
// Teste 1: Valida o código de status HTTP 400 Bad Request
pm.test("Status code é 400 Bad Request", function () {
  pm.response.to.have.status(400);
});

// Teste 2: Valida a mensagem de erro específica mapeada na chave do campo
pm.test(
  "Mensagem de erro é 'administrador deve ser 'true' ou 'false''",
  function () {
    var jsonData = pm.response.json();
    pm.expect(jsonData.administrador).to.eql(
      "administrador deve ser 'true' ou 'false'",
    );
  },
);
```

---

> 📌 **Estratégia de Cobertura de Automação:**  
> A estrutura acima consolida os principais padrões de asserção em JavaScript e Chai.js (`pm.test`, `pm.response` e `pm.expect`), cobrindo validações de códigos HTTP, tipo de dado do contrato e inspeção de mensagens de erro no formato objeto chave/valor de forma direta e sem redundâncias.

---

### ✅ Checklist de Entrega do Projeto Prático

- [ ] Criar a pasta **04 - Projeto Pratico - Usuarios** dentro da Collection do Postman.
- [ ] Configurar a requisição `POST - Criar Usuario Sucesso` com dados dinâmicos e 3 asserções verdes (**PASS**).
- [ ] Configurar a requisição `POST - Criar Usuario Email Duplicado` com e-mail estático e 2 asserções verdes (**PASS**).
- [ ] Configurar a requisição `POST - Criar Usuario Administrador Invalido` com valor fora do domínio e 2 asserções verdes (**PASS**).
- [ ] Salvar todas as requisições e validar a execução completa das asserções no painel **Test Results**.

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
