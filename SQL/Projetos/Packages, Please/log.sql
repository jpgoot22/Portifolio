
-- *** The Lost Letter ***
--1
--With the provided address, I found the ID in the addresses table: id=432.
SELECT "id"
FROM "addresses"
WHERE "address" = '900 Somerville Avenue';


--2 Using the address ID, I confirmed through the packages table whether the "Congratulatory letter" was sent and where, by checking the "contents" and "to_address_id" columns, and retrieved the package ID. (I used two queries) id=384, to_address_id=854
--2.1
SELECT "id", "contents","to_address_id"
FROM "packages"
WHERE "from_address_id" = 432;
--2.2
SELECT "address", "id","type"
FROM "addresses"
WHERE "id" = 854;


--3 With the package ID, I checked the scans table, and the "action" column showed both a pick and a drop. The "address_id" of the drop matches the intended delivery location.
SELECT "action", "id","address_id"
FROM "scans"
WHERE "package_id" = 384;

-- *** The Devious Delivery ***
--1 With the provided address, I found the ID in the addresses table: id=9873
SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street';

-- 2 Using the address ID, I confirmed through the packages table whether the present was sent and where, by checking the "id" and "to_address_id" columns. (I used two queries) package id=9523, to_address_id=4983
--2.1
SELECT "id", "contents","to_address_id"
FROM "packages"
WHERE "from_address_id" = 9873;
--2.2
SELECT "address", "id","type"
FROM "addresses"
WHERE "id" = 4983;

--3 With this formula, I was able to see that the product was picked up from the correct address, delivered to the wrong address, picked up again from the wrong address, and is now with another driver id 17.
--With the package ID, I checked the scans table, and the "action" column showed both a pick and a drop. The "address_id" of the drop matches the intended delivery location.
SELECT "action", "driver_id","address_id", "timestamp"
FROM "scans"
WHERE "package_id" = 9523;

-- 4 I used this code to find out the driver's name.
SELECT "id", "name"
FROM "drivers"
WHERE "id" = 17;
