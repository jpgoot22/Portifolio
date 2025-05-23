## 🧠 Problem to Solve

Entre 1830 e 1832, o artista japonês Katsushika Hokusai criou 36 gravuras em xilogravura retratando 36 diferentes vistas do Monte Fuji, um vulcão localizado na ilha de Honshū, no Japão. Entre as obras mais famosas da série estão *Brisa Suave, Manhã Clara* e *A Grande Onda de Kanagawa*. As gravuras se tornaram tão influentes que outro artista japonês da mesma época — Utagawa Hiroshige — criou sua própria série com 36 gravuras, cada uma mostrando uma nova visão do Fuji.

No banco de dados `views.db`, você encontrará detalhes sobre as 36 gravuras criadas, respectivamente, por Hokusai e Hiroshige. No total, são dados sobre 72 gravuras. Embora essas obras sejam geralmente apreciadas pela estética, a ciência da computação permite gerar insights numéricos adicionais sobre elas. Além do título e autor de cada gravura, há estatísticas comumente usadas em análise computacional de imagens: cor média, brilho, contraste e entropia.

Nos arquivos `.sql` associados, escreva consultas SQL para responder às perguntas com base nesse banco de dados de 72 gravuras e nas estatísticas de suas composições.

---

## 🧾 Estrutura da Tabela (Schema)

O banco de dados `views.db` possui uma única tabela chamada `views`, com as seguintes colunas:

- `id`: identificador único de cada gravura.
- `print_number`: número da gravura dentro da série de Hokusai ou Hiroshige.
- `english_title`: título em inglês da gravura.
- `japanese_title`: título em japonês da gravura.
- `artist`: sobrenome do artista.
- `average_color`: cor média da imagem (formato hexadecimal).
- `brightness`: valor que representa a claridade ou escuridão da imagem.
- `contrast`: medida da diferença entre áreas claras e escuras.
- `entropy`: medida da complexidade da imagem.

---

## 📋 Especificações

Para cada uma das questões a seguir, escreva uma única consulta SQL que produza o resultado especificado. Suas consultas devem funcionar independentemente do valor do `id`, e retornar apenas os dados necessários.

1. `1.sql`: Liste, lado a lado, o título japonês e o título inglês de cada gravura. O título japonês deve ser a primeira coluna.
2. `2.sql`: Liste as cores médias das gravuras de **Hokusai** que possuem a palavra “river” no título em inglês.
3. `3.sql`: Conte quantas gravuras de **Hokusai** possuem a palavra “Fuji” no título em inglês.
4. `4.sql`: Conte quantas gravuras de **Hiroshige** mencionam “Eastern Capital” no título em inglês.
5. `5.sql`: Encontre o maior valor de contraste nas gravuras de **Hokusai**. Nomeie a coluna como `"Maximum Contrast"`.
6. `6.sql`: Calcule a entropia média das gravuras de **Hiroshige**, arredondada para duas casas decimais. Nomeie a coluna como `"Hiroshige Average Entropy"`.
7. `7.sql`: Liste os títulos em inglês das 5 gravuras **mais claras** de **Hiroshige**, em ordem decrescente de brilho.
8. `8.sql`: Liste os títulos em inglês das 5 gravuras com **menor contraste** de **Hokusai**, da menor para a maior.
9. `9.sql`: Encontre o título em inglês e o artista da gravura com **maior brilho**.
10. `10.sql`: Crie uma consulta à sua escolha, que:
   - Use `AS` para renomear uma coluna.
   - Use `WHERE` para aplicar uma condição.
   - Use `ORDER BY` para ordenar o resultado.

---
