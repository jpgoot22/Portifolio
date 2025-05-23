## 🧠 Problem to Solve

Se você não está familiarizado, **beisebol** é um esporte popular em que dois times de 9 jogadores se revezam entre rebater (acertar uma bola com um taco) e defender (capturar e lançar a bola). Pontos (“corridas”) são marcados quando um jogador do time que está rebatendo acerta a bola e consegue tocar todas as bases antes que o time adversário consiga eliminá-lo. O beisebol é particularmente popular nos Estados Unidos e no Canadá, onde a **MLB (Major League Baseball)** é a associação profissional da modalidade desde 1876.

Neste exercício, usando o banco de dados `players.db` e a tabela `players`, você deverá responder a perguntas sobre jogadores da MLB que atuaram entre **1871 e 2023**.

---

## 🧾 Estrutura da Tabela (Schema)

O banco de dados possui uma única tabela chamada `players`, com as seguintes colunas:

- `id`: identificador único de cada jogador.
- `first_name`: primeiro nome do jogador.
- `last_name`: sobrenome do jogador.
- `bats`: lado em que o jogador rebate (R = destro, L = canhoto).
- `throws`: mão com que o jogador arremessa (R = destro, L = canhoto).
- `weight`: peso do jogador em libras.
- `height`: altura do jogador em polegadas.
- `debut`: data de estreia na MLB (formato YYYY-MM-DD).
- `final_game`: data do último jogo na MLB (formato YYYY-MM-DD).
- `birth_year`: ano de nascimento.
- `birth_month`: mês de nascimento (número).
- `birth_day`: dia de nascimento.
- `birth_city`: cidade natal.
- `birth_state`: estado natal.
- `birth_country`: país natal.

---

## 📋 Especificações

Para cada uma das questões abaixo, escreva uma única consulta SQL que produza o resultado solicitado. A consulta deve retornar **apenas os dados necessários**, com nomes de colunas renomeados se for solicitado.

1. `1.sql`: Encontre a cidade, estado e país de nascimento de **Jackie Robinson**.
2. `2.sql`: Descubra com qual lado (direito ou esquerdo) **Babe Ruth** rebatia.
3. `3.sql`: Encontre os `id`s dos jogadores que **não possuem data de estreia (`debut`)** informada.
4. `4.sql`: Liste os primeiros e últimos nomes de jogadores **que não nasceram nos Estados Unidos**. Ordene alfabeticamente por nome e sobrenome.
5. `5.sql`: Liste os primeiros e últimos nomes de **rebatedores destros**. Ordene alfabeticamente por nome e sobrenome.
6. `6.sql`: Liste o nome, sobrenome e data de estreia de jogadores nascidos em **Pittsburgh, Pensilvânia (PA)**. Ordene primeiro pela data de estreia (do mais recente para o mais antigo), depois por nome e sobrenome.
7. `7.sql`: Conte o número de jogadores que **rebatem com uma mão e arremessam com a outra** (ex: rebatem com a direita e arremessam com a esquerda, ou vice-versa).
8. `8.sql`: Calcule a **altura média** e o **peso médio** dos jogadores que estrearam **a partir de 1º de janeiro de 2000**. Arredonde os valores para **duas casas decimais** e renomeie as colunas para “Average Height” e “Average Weight”.
9. `9.sql`: Encontre os jogadores que disputaram seu **último jogo em 2022**. Ordene os resultados por nome e sobrenome.
10. `10.sql`: Escreva uma consulta de sua escolha, que:
   - Utilize `AS` para renomear uma coluna
   - Tenha ao menos uma condição com `WHERE`
   - Utilize `ORDER BY` em pelo menos uma coluna

---

