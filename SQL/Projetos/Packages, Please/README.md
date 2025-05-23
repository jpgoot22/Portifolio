## 🧠 Problem to Solve

Você é um atendente dos Correios na cidade de Boston e, como tal, supervisiona a entrega de encomendas pela cidade. Na maior parte das vezes, todos os pacotes enviados são devidamente entregues. Mas, de vez em quando, surge um mistério: um pacote desaparecido! Para cada cliente que relata um pacote perdido, sua tarefa é descobrir:

1. O endereço (ou localização!) atual do pacote  
2. O tipo de endereço ou local (por exemplo: residencial, comercial etc.)  
3. O conteúdo do pacote  

Tudo o que você sabe é o que o cliente lhe informa. Para solucionar cada mistério, você usará apenas as informações do banco de dados `packages.db`, que contém dados sobre o trânsito de pacotes por toda a cidade. Seu trabalho é ajudar cada cliente a encontrar seu pacote perdido usando somente esse banco de dados.

---

## 🧾 Estrutura do Banco de Dados (Schema)

O `packages.db` representa as entidades envolvidas nas entregas de pacotes em Boston e suas relações (ver diagrama ER). Dentro dele, há as seguintes tabelas:

### `addresses`
- `id` – identificador do endereço  
- `address` – o endereço completo (ex.: “7660 Sharon Street”)  
- `type` – tipo de endereço (residencial, comercial etc.)

### `drivers`
- `id` – identificador do motorista  
- `name` – nome do motorista

### `packages`
- `id` – identificador do pacote  
- `contents` – o conteúdo do pacote  
- `from_address_id` – ID do endereço de origem  
- `to_address_id` – ID do endereço de destino (pode não ser onde acabou)

### `scans`
- `id` – identificador do registro de escaneamento  
- `driver_id` – ID do motorista que fez o scan  
- `package_id` – ID do pacote escaneado  
- `address_id` – ID do endereço onde o pacote foi escaneado  
- `action` – ação do scan (“Pick” para coleta, “Drop” para entrega)  
- `timestamp` – data e hora do escaneamento

---

## 📋 Especificações

- Em **`log.sql`**, mantenha um **registro (log)** de todas as consultas SQL que você executar.  
  - **Acima de cada query**, adicione um comentário SQL (`-- comentário`) explicando por que você a está executando e o que espera descobrir.  
  - Use também os comentários para anotar seu processo de pensamento ao resolver cada mistério.

- Em **`answers.txt`**, preencha as linhas já existentes com:
  1. Localização atual do pacote  
  2. Tipo de endereço/local  
  3. Conteúdo do pacote  

  Não altere o texto já presente nem adicione novas linhas.

---

### Casos a resolver

1. **The Lost Letter**  
   - Cliente: Anneke, de **900 Somerville Avenue**  
   - Pacote: uma carta de felicitações para Varsha, em **2 Finnegan Street**  
   - Em `log.sql`, abaixo de `-- *** The Lost Letter ***`, registre suas queries e comentários.  
   - No `answers.txt`, responda: onde está a carta, que tipo de local, e qual o conteúdo.

2. **The Devious Delivery**  
   - Cliente: estranho de Fiftyville, sem endereço de origem  
   - Pacote: caixa “para dar um pouco mais de… quack ao banho”  
   - Em `log.sql`, abaixo de `-- *** The Devious Delivery ***`, registre suas queries e comentários.  
   - No `answers.txt`, descreva a localização, tipo de local e conteúdo.

3. **The Forgotten Gift**  
   - Cliente: avô/avó, enviou um presente surpresa de **109 Tileston Street** para **728 Maple Place**  
   - Pacote: presente de aniversário, conteúdo “repleto de amor”  
   - Em `log.sql`, abaixo de `-- *** The Forgotten Gift ***`, registre suas queries e comentários.  
   - No `answers.txt`, informe local, tipo de endereço e conteúdo do presente.

