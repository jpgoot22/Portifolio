# 🧠 Projetos SQL

Este repositório reúne soluções SQL aplicadas a diferentes contextos e conjuntos de dados, demonstrando habilidades em consulta, manipulação e análise. Cada projeto explora um cenário específico com o uso estratégico do SQL.

🧑‍🎓 **Origem dos projetos:**  
Os desafios aqui apresentados foram extraídos do curso [CS50's Introduction to Databases with SQL](https://cs50.harvard.edu/sql/), oferecido por Harvard,que está em andamento. As soluções refletem o desenvolvimento e prática dos conceitos aprendidos durante o curso.

---

## 📦 Rastreamento de Pacotes (`packages.db`)

Simula a rotina de um funcionário dos correios em Boston, responsável por investigar pacotes perdidos. O objetivo é rastrear entregas, identificar o conteúdo e classificar o tipo de endereço.

**Esquema do Banco de Dados**:

- `drivers`: Entregadores (`id`, `name`)
- `packages`: Pacotes (`id`, `contents`, `from_address_id`, `to_address_id`)
- `addresses`: Endereços (`id`, `address`, `type`)
- `scans`: Registros de coleta/entrega (`id`, `driver_id`, `package_id`, `address_id`, `action`, `timestamp`)

**Atividades Principais**:

- 🔍 Rastrear pacotes com `JOIN` e `WHERE`
- 🏷️ Identificar conteúdo e tipo de endereço
- 🔄 Analisar sequência de entregas (“Pick”/“Drop”)
- 📄 Documentar as consultas em `log.sql` e respostas em `answers.txt`

---

## ⚾ Estatísticas de Jogadores da MLB (`players.db`)

Explora dados históricos de jogadores da Major League Baseball (1871–2023), respondendo a perguntas específicas com SQL.

**Esquema do Banco de Dados**:

- `players`: Inclui `id`, `first_name`, `last_name`, `bats`, `throws`, `weight`, `height`, `debut`, `final_game`, `birth_year`, `birth_city`, `birth_country`, etc.

**Atividades Principais**:

- 🔎 Selecionar e filtrar dados (ex: cidade natal, data de estreia)
- 📊 Agregar estatísticas com `AVG`, `COUNT`
- 🗂️ Ordenar e renomear colunas com `ORDER BY` e `AS`
- 🧠 Criar consultas personalizadas combinando múltiplas funções

---

## 🚀 Episódios de Cyberchase (`cyberchase.db`)

Responde a perguntas da PBS sobre episódios da série *Cyberchase*, com foco em tópicos educativos e datas de exibição.

**Esquema do Banco de Dados**:

- `episodes`: Inclui `id`, `season`, `episode_in_season`, `title`, `topic`, `air_date`, `production_code`

**Atividades Principais**:

- 🎞️ Listar episódios por temporada, data ou código
- 🔍 Filtrar por tópicos ausentes ou datas específicas
- 📈 Contar e ordenar episódios (`COUNT`, `ORDER BY`)
- 💡 Desenvolver consultas personalizadas com `AND`, `OR`

---

## 🖼️ Gravuras Japonesas (`views.db`)

Análise de obras de Katsushika Hokusai e Utagawa Hiroshige com foco em características visuais como brilho, contraste e entropia.

**Esquema do Banco de Dados**:

- `views`: Inclui `id`, `print_number`, `english_title`, `japanese_title`, `artist`, `average_color`, `brightness`, `contrast`, `entropy`

**Atividades Principais**:

- 🖋️ Exibir títulos em japonês e inglês
- 🔍 Filtrar por artista ou termos no título
- 📊 Calcular `MAX`, `MIN`, `AVG`, com `ROUND`
- 🗂️ Ordenar por brilho, contraste (`ORDER BY`)
- 🔢 Limitar resultados com `LIMIT`
- 🧠 Criar consultas avançadas com renomeação e múltiplas condições
