# 📊 Projeto de Otimização de Campanhas de Marketing – iFood

Este repositório apresenta a solução desenvolvida para o **desafio de Analista de Dados do iFood**, com o objetivo principal de **otimizar campanhas de marketing direto** através de uma análise aprofundada de dados de clientes e do desenvolvimento de um modelo preditivo. O foco é na maximização do retorno financeiro e no entendimento dos perfis de clientes da base da iFood.

---

### Conteúdo do Repositório:

* **`1.0_Entendimento_e_Preparacao_Dados.ipynb`**: O notebook principal com todo o processo de análise exploratória, pré-processamento de dados e desenvolvimento dos modelos de Machine Learning.
* **`Caso de Analista de Dados Ifood.txt`**: Documento com a explicação detalhada do desafio proposto pelo iFood.
* **`ifood_full.pdf`**: Apresentação completa do projeto, seus resultados e insights obtidos.

---

## 🎯 Objetivo do Projeto

Transformar uma campanha de marketing que resultou em prejuízo (-R$ 3046 MU - Unidades Monetárias) em uma iniciativa lucrativa. Para isso, o projeto busca identificar os clientes com maior propensão a responder positivamente a uma nova campanha, aumentando o retorno sobre o investimento (ROI) e segmentando a base de clientes para campanhas mais direcionadas e estratégicas.

## 🧠 Desafio

Uma campanha piloto foi realizada com 2.240 clientes, gerando prejuízo. O objetivo foi utilizar os dados desta amostra para:
* Explorar os dados e identificar características relevantes dos clientes;
* Criar e descrever uma segmentação de clientes com base em seus comportamentos;
* Construir um modelo preditivo de resposta à campanha;
* Simular cenários de otimização financeira da nova campanha para maximizar o lucro.

## 🗂️ Estrutura do Repositório

* `1.0_Entendimento_e_Preparacao_Dados.ipynb`: Notebook Jupyter contendo todo o processo de análise de dados, desde a exploração inicial, pré-processamento, segmentação de clientes e desenvolvimento do modelo preditivo.
* `ifood_full.pdf`: Apresentação em formato PDF com os principais *insights* de negócio, resultados da análise e as recomendações para *stakeholders* não técnicos.
* `Caso de Analista de Dados Ifood.txt`: Descrição original do desafio, objetivos e entregáveis do projeto.
* `README.md` (este arquivo): Visão geral do projeto, objetivos, metodologias e resultados.

## 🛠️ Ferramentas e Tecnologias

* **Python**
* **Bibliotecas:**
    * `pandas` para manipulação de dados
    * `numpy` para operações numéricas
    * `matplotlib` e `seaborn` para visualização de dados
    * `scikit-learn` para pré-processamento, modelagem e avaliação (e.g., `StandardScaler`, `OneHotEncoder`, `RandomForestClassifier`, `KMeans`, `train_test_split`, `classification_report`, `roc_curve`, `auc`, `permutation_importance`)
    * `imblearn` para balanceamento de classes (`SMOTE`)
    * `scipy` para *winsorization*
    * `yellowbrick` para visualização do método do cotovelo
    * `eli5` para análise de importância das *features*
* **IA Assistiva (Gemini)** para apoio em análises e estruturação do projeto e deste README.

## 🔍 Etapas Realizadas

O projeto seguiu as seguintes etapas principais:

### 1. Entendimento e Preparação dos Dados
* **Carregamento e Configuração:** Importação de bibliotecas essenciais e carregamento do dataset `ifood_marketing_data.csv`.
* **Tratamento de Dados:** Identificação e tratamento de valores ausentes e *outliers*.
* **Engenharia de Variáveis (Feature Engineering):** Criação de novas *features* para enriquecer o conjunto de dados, como `Total_Spending` (gastos totais em diferentes categorias), `Age` (idade do cliente), `Years_Customer` (tempo como cliente), e `HasChildren` (indica se possui filhos).
* **Padronização de Variáveis Categóricas:** Utilização de `OneHotEncoder` para variáveis como estado civil e educação.

### 2. Análise Exploratória (EDA)
* **Identificação de Padrões de Comportamento:** Análise da distribuição das variáveis e suas correlações.
* **Comparação entre respondentes e não respondentes:**
    * **Insights Chave:** Clientes que responderam às campanhas tendem a ter **maior renda, gastar mais** em produtos e ter **menor recência** (compraram mais recentemente). Foram identificados os principais *drivers* de compra e variáveis com maior potencial preditivo.
* **Visualizações:** Utilização de gráficos para entender a relação entre as características dos clientes e sua propensão a aceitar campanhas.

### 3. Segmentação de Clientes
* **Objetivo:** Agrupar clientes com características e comportamentos similares para permitir um direcionamento de marketing mais eficiente e personalizado.
* **Features Utilizadas:** `Income`, `Total_Spending`, `Recency`, `Age`, `Children`, `Years_Customer`, `HasChildren`.
* **Normalização:** Utilização de `StandardScaler` para normalizar as *features* antes do *clustering*.
* **Modelo:** Aplicação do algoritmo de *clustering* **K-Means**.
* **Determinação do K:** O método do cotovelo indicou **K=4** como o número ideal de clusters.
* **Resultados dos Clusters:** Análise detalhada dos 4 clusters formados, descrevendo seus perfis demográficos, de consumo e de engajamento com campanhas (ex: Cluster de Alto Valor e Engajamento, Família Grande e Baixo Gasto, etc.).

### 4. Modelagem Preditiva
* **Objetivo:** Desenvolver um modelo que preveja a probabilidade de um cliente aceitar uma nova campanha, visando maximizar o lucro.
* **Pré-processamento:** Tratamento de *outliers* com `Winsorization` e balanceamento de classes utilizando `SMOTE` para lidar com o desequilíbrio na variável *target*.
* **Modelo:** Treinamento de um modelo **Random Forest Classifier**.
* **Avaliação do Modelo:**
    * **Métricas (Classe 1 - Respondedores):**
        * Precision: 0.44
        * Recall: 0.76
        * F1-Score: 0.56
    * **AUC da Curva ROC:** 0.82 (indicando boa capacidade de distinção entre as classes).
* **Importância das Features:** Análise das *features* que mais influenciaram as previsões do modelo, como `AcceptedCmp3`, `AcceptedCmp5` (impacto positivo) e `Marital_Status_Together`, `HasChildren` (impacto negativo).

### 5. Otimização Financeira
* **Contexto Financeiro:**
    * Custo por contato: R$ 3,00
    * Receita por aceitação: R$ 10,93
* **Simulação:** Realizada uma simulação para diferentes limiares de probabilidade do modelo, visando identificar o ponto de maior lucro.
* **Resultado da Otimização (Valores do Notebook):**
    * **Lucro máximo:** R$ 233,86
    * **Limiar ótimo:** 0.58 (valor que maximiza o lucro)
    * **Clientes contatados:** 97
    * **Esperados respondentes:** 48
    * **Taxa de sucesso esperada:** 49,48%
* **Comparação:**
    * **Campanha Piloto:** R$ -3.046,00 (prejuízo)
    * **Novo Resultado (Otimizado):** R$ 233,86 (lucro)
    * **Ganho Total (Melhora):** R$ 3.279,80 (em relação à campanha piloto)

## 📈 Resultados

* **Transformação de Campanha:** Conversão de uma campanha deficitária (R$ -3.046,00) em uma campanha lucrativa (R$ 233,86), com um **ganho total de R$ 3.279,80**.
* **Identificação de Clientes Chave:** Seleção dos **97 clientes** mais promissores, com **48 respondentes esperados** e uma **taxa de sucesso de 49,48%**, aumentando significativamente a eficiência dos contatos.
* **Segmentação Eficaz:** Criação de segmentações claras para permitir campanhas personalizadas e mais eficazes no futuro.
* **Modelo Preditivo Robusto:** Desenvolvimento de um modelo com boa performance (AUC = 0.82) para prever a resposta a campanhas.

## ✅ Conclusões

A análise orientada por dados mostrou-se essencial para melhorar o ROI das campanhas de marketing. A segmentação permitiu entender o comportamento dos clientes em profundidade, enquanto o modelo preditivo forneceu uma ferramenta poderosa para a tomada de decisões estratégicas. A estratégia proposta é escalável e oferece um caminho claro para otimizar campanhas futuras do iFood.

## 🔄 Próximos Passos e Melhorias Futuras

* Aplicar o modelo à base completa de clientes do iFood.
* Automatizar o processo de segmentação e seleção de clientes para novas campanhas.
* Implementar testes A/B para validar os resultados da campanha em um ambiente real.
* Desenvolver um painel interativo (dashboard) para monitoramento contínuo da performance da campanha.
* Explorar outros algoritmos de *machine learning* e técnicas de engenharia de *features* mais avançadas para otimização do modelo.

## 📩 Contato

Caso tenha interesse em discutir mais sobre este projeto, fique à vontade para me contatar!

* João Pedro/www.linkedin.com/in/joãopedro-sousa
* jpgoot22@gmail.com

