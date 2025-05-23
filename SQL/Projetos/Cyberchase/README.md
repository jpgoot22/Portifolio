## 🧠 Problem to Solve

Bem-vindo ao Ciberespaço! **Cyberchase** é uma série animada e educativa exibida pela PBS (Public Broadcasting Service) dos Estados Unidos desde 2002. Originalmente criada para “mostrar às crianças que a matemática está em todo lugar e que todos podem ser bons nisso”, o universo de Cyberchase gira em torno de Jackie, Matt e Inez, que se juntam a Digit — um "cybird" — para impedir que o vilão Hacker tome o controle do Ciberespaço e infecte a Mãe-Central (*Motherboard*). Ao longo da jornada, o grupo aprende matemática, ciências e habilidades de resolução de problemas para frustrar os planos do Hacker.

No banco de dados `cyberchase.db`, usando uma tabela chamada `episodes`, você deve buscar respostas para as perguntas da PBS sobre os episódios de Cyberchase até o momento.

---

## 🧾 Estrutura da Tabela (Schema)

O banco de dados `cyberchase.db` possui uma única tabela chamada `episodes`, com as seguintes colunas:

- `id`: identificador único de cada episódio.
- `season`: número da temporada em que o episódio foi exibido.
- `episode_in_season`: número do episódio dentro da temporada.
- `title`: título do episódio.
- `topic`: assunto que o episódio se propõe a ensinar.
- `air_date`: data de exibição (formato YYYY-MM-DD).
- `production_code`: código de produção único utilizado internamente pela PBS para se referir ao episódio.

---

## 📋 Especificações

Para cada uma das questões abaixo, escreva uma única consulta SQL que produza exatamente o resultado solicitado. Suas consultas devem funcionar corretamente mesmo que os valores de `id` mudem, e devem retornar **somente os dados necessários** para responder à pergunta.

1. `1.sql`: Liste os títulos de todos os episódios da temporada original de Cyberchase (Temporada 1).
2. `2.sql`: Liste o número da temporada e o título do primeiro episódio de cada temporada.
3. `3.sql`: Encontre o código de produção do episódio chamado “Hackerized!”.
4. `4.sql`: Liste os títulos dos episódios que **ainda não possuem um assunto definido**.
5. `5.sql`: Encontre o título do episódio especial de fim de ano exibido em **31 de dezembro de 2004**.
6. `6.sql`: Liste os títulos dos episódios da temporada 6 (2008) que foram lançados antecipadamente, em **2007**.
7. `7.sql`: Liste os títulos e assuntos de todos os episódios que ensinam **frações**.
8. `8.sql`: Conte o número de episódios lançados nos **últimos 6 anos**, de **2018 a 2023**, inclusive.
   > 💡 Dica: você pode usar `BETWEEN` com datas, como em:  
   > `BETWEEN '2000-01-01' AND '2000-12-31'`
9. `9.sql`: Conte o número de episódios lançados nos **primeiros 6 anos** de Cyberchase, de **2002 a 2007**, inclusive.
10. `10.sql`: Liste os `id`, `title` e `production_code` de todos os episódios. Ordene os resultados pelo código de produção, do mais antigo ao mais recente.
11. `11.sql`: Liste os títulos dos episódios da **Temporada 5**, em **ordem alfabética reversa**.
12. `12.sql`: Conte o número de títulos de episódios **únicos**.
13. `13.sql`: Crie uma consulta à sua escolha que:
   - Utilize pelo menos uma condição com `WHERE` usando `AND` ou `OR`.

---

