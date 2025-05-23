-- *** The Lost Letter ***

-- 1
-- Com o endereço fornecido, encontrei o ID na tabela addresses: id=432.
SELECT "id"
FROM "addresses"
WHERE "address" = '900 Somerville Avenue';

-- 2
-- Usando o ID do endereço, confirmei pela tabela packages se a "carta de felicitações" foi enviada e para onde, verificando as colunas "contents" e "to_address_id", e obtive o ID do pacote. (Usei duas consultas) id=384, to_address_id=854.
-- 2.1
SELECT "id", "contents", "to_address_id"
FROM "packages"
WHERE "from_address_id" = 432;

-- 2.2
-- Verifiquei o endereço de destino usando o ID do destino (to_address_id) encontrado na etapa anterior.
SELECT "address", "id", "type"
FROM "addresses"
WHERE "id" = 854;

-- 3
-- Com o ID do pacote, consultei a tabela scans. A coluna "action" mostrou tanto um "Pick" (coleta) quanto um "Drop" (entrega). O "address_id" do Drop corresponde ao local de entrega pretendido.
SELECT "action", "id", "address_id"
FROM "scans"
WHERE "package_id" = 384;

-- *** The Devious Delivery ***

-- 1
-- Com o endereço fornecido, encontrei o ID na tabela addresses: id=9873.
SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street';

-- 2
-- Usando o ID do endereço, confirmei pela tabela packages se o presente foi enviado e para onde, verificando as colunas "id" e "to_address_id". (Usei duas consultas) pacote id=9523, to_address_id=4983.
-- 2.1
SELECT "id", "contents", "to_address_id"
FROM "packages"
WHERE "from_address_id" = 9873;

-- 2.2
-- Verifiquei o endereço de destino usando o ID do destino encontrado.
SELECT "address", "id", "type"
FROM "addresses"
WHERE "id" = 4983;

-- 3
-- Com essa consulta, vi que o pacote foi coletado no endereço correto, entregue no endereço errado, coletado novamente do endereço errado, e está agora com outro motorista (id=17).
SELECT "action", "driver_id", "address_id", "timestamp"
FROM "scans"
WHERE "package_id" = 9523;

-- 4
-- Usei essa consulta para descobrir o nome do motorista atual.
SELECT "id", "name"
FROM "drivers"
WHERE "id" = 17;

